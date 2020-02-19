import 'package:flutter/cupertino.dart';
import 'package:flutter_toolbox/generated/i18n.dart';
import 'package:url_launcher/url_launcher.dart';

import '../flutter_toolbox.dart';

Future<void> launchGoogleMaps(double latitude, double longitude) async {
  String googleUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  } else {
    errorToast(S.current?.could_not_launch_google_maps ??
        'Could not launch google maps');
  }
}

Future<void> safeLaunch(String urlString) async {
  if (await canLaunch(urlString)) {
    await launch(urlString);
  } else {
    errorToast(S.current?.couldnt_open_this_url ?? "Couldn't open this url");
  }
}

Future<void> sendMail({
  @required String email,
  String subject = '',
  String body = '',
}) async {
  var url = 'mailto:$email?subject=$subject&body=$body';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    errorToast(
        S.current?.couldnt_open_the_mail_app ?? "Couldn't open the mail app");
  }
}