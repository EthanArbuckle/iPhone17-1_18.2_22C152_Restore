@interface NSError(VoicemailExtras)
- (void)displayedErrorTitle:()VoicemailExtras message:;
@end

@implementation NSError(VoicemailExtras)

- (void)displayedErrorTitle:()VoicemailExtras message:
{
  if (!a3 || !a4) {
    return;
  }
  v7 = [a1 domain];
  *a3 = 0;
  *a4 = 0;
  id v43 = v7;
  if ([v7 isEqualToString:*MEMORY[0x263F84D48]])
  {
    switch([a1 code])
    {
      case 1000:
      case 1007:
        v8 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v8 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PARSE_FAIL";
        goto LABEL_45;
      case 1004:
        v20 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v20 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_INVALID_OLD";
        goto LABEL_45;
      case 1006:
        v21 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v21 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_NO_SERVICE";
        goto LABEL_45;
      case 1008:
      case 1016:
        v17 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v18 = v17;
        v19 = @"VOICEMAIL_ERROR_TITLE_ERROR";
        goto LABEL_25;
      case 1010:
        v22 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v22 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_FILE_WRITE_ERROR";
        goto LABEL_45;
      case 1011:
      case 1023:
        goto LABEL_14;
      case 1012:
        v23 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v23 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PLAYBACK_FAIL";
        goto LABEL_45;
      case 1013:
        v24 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v24 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_TRANSCODE_ERROR";
        goto LABEL_45;
      case 1014:
        v25 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v25 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_SERVICE_BUSY";
        goto LABEL_45;
      case 1015:
        v26 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v26 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_CONNECT_FAIL";
        goto LABEL_45;
      case 1017:
        v17 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v18 = v17;
        v19 = @"VOICEMAIL_ERROR_TITLE_UNAVAILABLE";
LABEL_25:
        *a3 = [v17 localizedStringForKey:v19 value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_TRY_AGAIN_LATER";
        goto LABEL_45;
      case 1018:
        v27 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v27 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_COULD_NOT_AUTHORIZE";
        goto LABEL_45;
      case 1019:
        v28 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v28 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_MAILBOX_NOT_AVAILABLE";
        goto LABEL_45;
      case 1020:
        v29 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v29 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_MAILBOX_LOCKED";
        goto LABEL_45;
      case 1021:
        *a3 = [a1 localizedDescription];
        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MAILBOX_USAGE";
        goto LABEL_45;
      case 1022:
        *a3 = [a1 localizedDescription];
        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MAILBOX_FULL";
        goto LABEL_45;
      case 1024:
        v30 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v30 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD_INVALID" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_INVALID";
        goto LABEL_45;
      case 1025:
        v31 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v31 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD_INVALID" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_SHORT";
        goto LABEL_45;
      case 1026:
        v32 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v32 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD_INVALID" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_LONG";
        goto LABEL_45;
      case 1027:
        v33 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v33 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_AGE";
        goto LABEL_45;
      case 1028:
        v34 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v34 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD_INVALID" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_TRIVIAL";
        goto LABEL_45;
      case 1029:
        v35 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v35 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_CHANGE_FAIL";
        goto LABEL_45;
      case 1030:
        v36 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v36 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_PASSWORD_INVALID" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_SAME";
        goto LABEL_45;
      case 1031:
        v37 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v37 localizedStringForKey:@"VOICEMAIL_ERROR_MSG_PASSWORD_CHANGE_FAIL" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_PASSWORD_CHANGE_FAIL";
        goto LABEL_45;
      case 1032:
        v38 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v38 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_INVALID_GREETING";
        goto LABEL_45;
      case 1033:
        v39 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v39 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_NO_CUSTOM_GRETING";
        goto LABEL_45;
      case 1034:
        v40 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v40 localizedStringForKey:@"GREETING_FETCH_FAILED" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"GREETING_FETCH_FAILED_DETAIL";
        goto LABEL_45;
      case 1035:
        v41 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v41 localizedStringForKey:@"GREETING_SAVE_FAILED" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"GREETING_SAVE_FAILED_DETAIL";
        goto LABEL_45;
      case 1036:
        v42 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        *a3 = [v42 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_26DC30078 table:@"Voicemail"];

        v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
        v10 = v9;
        v11 = @"VOICEMAIL_ERROR_MSG_GREETING_FAIL";
        goto LABEL_45;
      default:
        goto LABEL_46;
    }
  }
  if ([v43 isEqualToString:*MEMORY[0x263F84D50]])
  {
    unint64_t v12 = [a1 code];
    if (v12 <= 0x39 && ((1 << v12) & 0x2C0000000000000) != 0)
    {
      v13 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
      *a3 = [v13 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_26DC30078 table:@"Voicemail"];

      v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
      v10 = v9;
      v11 = @"VOICEMAIL_ERROR_MSG_PDP_NOT_SUBSCRIBED";
    }
    else
    {
      v16 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
      *a3 = [v16 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_26DC30078 table:@"Voicemail"];

      v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
      v10 = v9;
      v11 = @"VOICEMAIL_ERROR_MSG_PDP_FAILURE";
    }
    goto LABEL_45;
  }
  if ([a1 isSecurityError])
  {
    v14 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
    *a3 = [v14 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_26DC30078 table:@"Voicemail"];

    v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
    v10 = v9;
    v11 = @"VOICEMAIL_ERROR_MSG_SECURITY";
LABEL_45:
    *a4 = [v9 localizedStringForKey:v11 value:&stru_26DC30078 table:@"Voicemail"];

    goto LABEL_46;
  }
  if ([a1 isConnectivityError])
  {
LABEL_14:
    v15 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
    *a3 = [v15 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_UNAVAILABLE" value:&stru_26DC30078 table:@"Voicemail"];

    v9 = [MEMORY[0x263F086E0] bundleWithPath:@"/Applications/MobilePhone.app"];
    v10 = v9;
    v11 = @"VOICEMAIL_ERROR_MSG_CONNECTIVITY";
    goto LABEL_45;
  }
LABEL_46:
}

@end