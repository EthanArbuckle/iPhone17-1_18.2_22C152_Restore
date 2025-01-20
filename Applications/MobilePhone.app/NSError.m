@interface NSError
- (void)displayedErrorTitle:(id *)a3 message:(id *)a4;
@end

@implementation NSError

- (void)displayedErrorTitle:(id *)a3 message:(id *)a4
{
  if (!a3 || !a4) {
    return;
  }
  v7 = [(NSError *)self domain];
  *a3 = 0;
  *a4 = 0;
  id v43 = v7;
  if ([v7 isEqualToString:kVVErrorDomain])
  {
    switch([(NSError *)self code])
    {
      case 0x3E8:
      case 0x3EFLL:
        v8 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v8 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PARSE_FAIL";
        goto LABEL_45;
      case 0x3ECLL:
        v20 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v20 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_INVALID_OLD";
        goto LABEL_45;
      case 0x3EELL:
        v21 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v21 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_NO_SERVICE";
        goto LABEL_45;
      case 0x3F0:
      case 0x3F8:
        v17 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v18 = v17;
        CFStringRef v19 = @"VOICEMAIL_ERROR_TITLE_ERROR";
        goto LABEL_25;
      case 0x3F2:
        v22 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v22 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_FILE_WRITE_ERROR";
        goto LABEL_45;
      case 0x3F3:
      case 0x3FFLL:
        goto LABEL_14;
      case 0x3F4:
        v23 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v23 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PLAYBACK_FAIL";
        goto LABEL_45;
      case 0x3F5:
        v24 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v24 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_TRANSCODE_ERROR";
        goto LABEL_45;
      case 0x3F6:
        v25 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v25 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_SERVICE_BUSY";
        goto LABEL_45;
      case 0x3F7:
        v26 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v26 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_CONNECT_FAIL";
        goto LABEL_45;
      case 0x3F9:
        v17 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v18 = v17;
        CFStringRef v19 = @"VOICEMAIL_ERROR_TITLE_UNAVAILABLE";
LABEL_25:
        *a3 = [v17 localizedStringForKey:v19 value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_TRY_AGAIN_LATER";
        goto LABEL_45;
      case 0x3FALL:
        v27 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v27 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_COULD_NOT_AUTHORIZE";
        goto LABEL_45;
      case 0x3FBLL:
        v28 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v28 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_MAILBOX_NOT_AVAILABLE";
        goto LABEL_45;
      case 0x3FCLL:
        v29 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v29 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_MAILBOX_LOCKED";
        goto LABEL_45;
      case 0x3FDLL:
        *a3 = [(NSError *)self localizedDescription];
        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MAILBOX_USAGE";
        goto LABEL_45;
      case 0x3FELL:
        *a3 = [(NSError *)self localizedDescription];
        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MAILBOX_FULL";
        goto LABEL_45;
      case 0x400:
        v30 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v30 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD_INVALID" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_INVALID";
        goto LABEL_45;
      case 0x401:
        v31 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v31 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD_INVALID" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_SHORT";
        goto LABEL_45;
      case 0x402:
        v32 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v32 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD_INVALID" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_LONG";
        goto LABEL_45;
      case 0x403:
        v33 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v33 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_AGE";
        goto LABEL_45;
      case 0x404:
        v34 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v34 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD_INVALID" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_TRIVIAL";
        goto LABEL_45;
      case 0x405:
        v35 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v35 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_CHANGE_FAIL";
        goto LABEL_45;
      case 0x406:
        v36 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v36 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD_INVALID" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_SAME";
        goto LABEL_45;
      case 0x407:
        v37 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v37 localizedStringForKey:@"VOICEMAIL_ERROR_MSG_PASSWORD_CHANGE_FAIL" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_CHANGE_FAIL";
        goto LABEL_45;
      case 0x408:
        v38 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v38 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_INVALID_GREETING";
        goto LABEL_45;
      case 0x409:
        v39 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v39 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_NO_CUSTOM_GRETING";
        goto LABEL_45;
      case 0x40ALL:
        v40 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v40 localizedStringForKey:@"GREETING_FETCH_FAILED" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"GREETING_FETCH_FAILED_DETAIL";
        goto LABEL_45;
      case 0x40BLL:
        v41 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v41 localizedStringForKey:@"GREETING_SAVE_FAILED" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"GREETING_SAVE_FAILED_DETAIL";
        goto LABEL_45;
      case 0x40CLL:
        v42 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v42 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_100285990 table:@"Voicemail"];

        v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_GREETING_FAIL";
        goto LABEL_45;
      default:
        goto LABEL_46;
    }
  }
  if ([v43 isEqualToString:kVVPDPActivationErrorDomain])
  {
    unint64_t v12 = [(NSError *)self code];
    if (v12 <= 0x39 && ((1 << v12) & 0x2C0000000000000) != 0)
    {
      v13 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
      *a3 = [v13 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_100285990 table:@"Voicemail"];

      v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
      v10 = v9;
      CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PDP_NOT_SUBSCRIBED";
    }
    else
    {
      v16 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
      *a3 = [v16 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_100285990 table:@"Voicemail"];

      v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
      v10 = v9;
      CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_PDP_FAILURE";
    }
    goto LABEL_45;
  }
  if ([(NSError *)self isSecurityError])
  {
    v14 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    *a3 = [v14 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_100285990 table:@"Voicemail"];

    v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    v10 = v9;
    CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_SECURITY";
LABEL_45:
    *a4 = [v9 localizedStringForKey:v11 value:&stru_100285990 table:@"Voicemail"];

    goto LABEL_46;
  }
  if ([(NSError *)self isConnectivityError])
  {
LABEL_14:
    v15 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    *a3 = [v15 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_100285990 table:@"Voicemail"];

    v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    v10 = v9;
    CFStringRef v11 = @"VOICEMAIL_ERROR_MSG_CONNECTIVITY";
    goto LABEL_45;
  }
LABEL_46:
}

@end