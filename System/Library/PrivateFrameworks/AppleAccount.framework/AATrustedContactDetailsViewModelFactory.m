@interface AATrustedContactDetailsViewModelFactory
- (id)viewModelForFlow:(unint64_t)a3 withContact:(id)a4;
- (void)prepareForCustodianForFlow:(id)a3 withContact:(id)a4;
- (void)prepareForMyBenefactorFlow:(id)a3 withContact:(id)a4;
- (void)prepareForMyBeneficiaryFlow:(id)a3 withContact:(id)a4;
- (void)prepareForMyCustodianFlow:(id)a3 withContact:(id)a4;
@end

@implementation AATrustedContactDetailsViewModelFactory

- (id)viewModelForFlow:(unint64_t)a3 withContact:(id)a4
{
  id v6 = a4;
  v7 = objc_opt_new();
  switch(a3)
  {
    case 0uLL:
      [(AATrustedContactDetailsViewModelFactory *)self prepareForMyCustodianFlow:v7 withContact:v6];
      break;
    case 1uLL:
      [(AATrustedContactDetailsViewModelFactory *)self prepareForCustodianForFlow:v7 withContact:v6];
      break;
    case 2uLL:
      [(AATrustedContactDetailsViewModelFactory *)self prepareForMyBeneficiaryFlow:v7 withContact:v6];
      break;
    case 3uLL:
      [(AATrustedContactDetailsViewModelFactory *)self prepareForMyBenefactorFlow:v7 withContact:v6];
      break;
    default:
      break;
  }
  [v7 setContact:v6];

  return v7;
}

- (void)prepareForMyCustodianFlow:(id)a3 withContact:(id)a4
{
  id v32 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v7 = [v6 localizedStringForKey:@"MY_RECOVERY_CONTACT_TITLE" value:0 table:@"Localizable"];
  [v32 setTitle:v7];

  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v9 = [v8 localizedStringForKey:@"MY_RECOVERY_CONTACT_DETAILS" value:0 table:@"Localizable"];
  [v32 setDetailsLabel:v9];

  uint64_t v10 = [v5 trustedContactStatus];
  v11 = NSString;
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v13 = v12;
  if (v10 == 1)
  {
    v14 = [v12 localizedStringForKey:@"MY_RECOVERY_CONTACT_DETAILS_SUBTITLE_PENDING" value:0 table:@"Localizable"];
    v15 = [v5 firstNameOrHandleForDisplay];
    v16 = objc_msgSend(v11, "stringWithFormat:", v14, v15);
    [v32 setDetailsSubtitle:v16];

    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v17 = [v13 localizedStringForKey:@"RESEND_INVITATION" value:0 table:@"Localizable"];
    [v32 setPrimaryActionText:v17];
  }
  else
  {
    v17 = [v12 localizedStringForKey:@"MY_RECOVERY_CONTACT_DETAILS_SUBTITLE_ACCEPTED" value:0 table:@"Localizable"];
    v18 = [v5 firstNameOrHandleForDisplay];
    v19 = objc_msgSend(v11, "stringWithFormat:", v17, v18);
    [v32 setDetailsSubtitle:v19];
  }
  v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v21 = [v20 localizedStringForKey:@"REMOVE_CONTACT" value:0 table:@"Localizable"];
  [v32 setDestructiveActionText:v21];

  v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v23 = [v22 localizedStringForKey:@"REMOVE_RECOVERY_CONTACT_ALERT_TITLE" value:0 table:@"Localizable"];
  [v32 setDestructiveActionSheetTitle:v23];

  v24 = NSString;
  v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v26 = [v25 localizedStringForKey:@"MY_RECOVERY_CONTACT_REMOVE_DETAILS" value:0 table:@"Localizable"];
  v27 = [v5 firstNameOrHandleForDisplay];
  v28 = [v5 firstNameOrHandleForDisplay];
  v29 = objc_msgSend(v24, "stringWithFormat:", v26, v27, v28);
  [v32 setDestructiveActionSheetDetails:v29];

  v30 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v31 = [v30 localizedStringForKey:@"CANCEL" value:0 table:@"Localizable"];
  [v32 setDestructiveActionSheetCancelText:v31];

  [v32 setDestructiveActionRequiresAuth:1];
}

- (void)prepareForCustodianForFlow:(id)a3 withContact:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v33 = a3;
  v7 = [v5 bundleWithIdentifier:@"com.apple.AppleAccount"];
  v8 = [v7 localizedStringForKey:@"RECOVERY_CONTACT_FOR_TITLE" value:0 table:@"Localizable"];
  [v33 setTitle:v8];

  v9 = NSString;
  uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v11 = [v10 localizedStringForKey:@"RECOVERY_CONTACT_FOR_DETAILS" value:0 table:@"Localizable"];
  v12 = [v6 firstNameOrHandleForDisplay];
  v13 = objc_msgSend(v9, "stringWithFormat:", v11, v12);
  [v33 setDetailsLabel:v13];

  v14 = NSString;
  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v16 = [v15 localizedStringForKey:@"RECOVERY_CONTACT_FOR_DETAILS_SUBTITLE" value:0 table:@"Localizable"];
  v17 = [v6 firstNameOrHandleForDisplay];
  v18 = objc_msgSend(v14, "stringWithFormat:", v16, v17);
  [v33 setDetailsSubtitle:v18];

  v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v20 = [v19 localizedStringForKey:@"RECOVERY_CONTACT_FOR_HELP" value:0 table:@"Localizable"];
  [v33 setPrimaryActionText:v20];

  v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v22 = [v21 localizedStringForKey:@"REMOVE" value:0 table:@"Localizable"];
  [v33 setDestructiveActionText:v22];

  v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v24 = [v23 localizedStringForKey:@"REMOVE_CUSTODIANSHIP_ALERT_TITLE" value:0 table:@"Localizable"];
  [v33 setDestructiveActionSheetTitle:v24];

  v25 = NSString;
  v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v27 = [v26 localizedStringForKey:@"RECOVERY_CONTACT_FOR_REMOVE_DETAILS" value:0 table:@"Localizable"];
  v28 = [v6 fullName];
  v29 = [v6 firstNameOrHandleForDisplay];

  v30 = objc_msgSend(v25, "stringWithFormat:", v27, v28, v29);
  [v33 setDestructiveActionSheetDetails:v30];

  v31 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v32 = [v31 localizedStringForKey:@"CANCEL" value:0 table:@"Localizable"];
  [v33 setDestructiveActionSheetCancelText:v32];

  [v33 setDestructiveActionRequiresAuth:1];
}

- (void)prepareForMyBeneficiaryFlow:(id)a3 withContact:(id)a4
{
  id v36 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v7 = [v6 localizedStringForKey:@"MY_BENEFICIARY_TITLE" value:0 table:@"Localizable"];
  [v36 setTitle:v7];

  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v9 = [v8 localizedStringForKey:@"MY_BENEFICIARY_DETAILS" value:0 table:@"Localizable"];
  [v36 setDetailsLabel:v9];

  uint64_t v10 = [v5 trustedContactStatus];
  v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v12 = v11;
  if (v10 == 1)
  {
    v13 = [v11 localizedStringForKey:@"MY_BENEFICIARY_RESEND_ACCESS_KEY" value:0 table:@"Localizable"];
    [v36 setPrimaryActionText:v13];

    v14 = NSString;
    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v16 = [v15 localizedStringForKey:@"MY_BENEFICIARY_DETAILS_SUBTITLE_PENDING" value:0 table:@"Localizable"];
    v17 = [v5 firstNameOrHandleForDisplay];
    v18 = objc_msgSend(v14, "stringWithFormat:", v16, v17);
    [v36 setDetailsSubtitle:v18];
  }
  else
  {
    v19 = [v11 localizedStringForKey:@"MY_BENEFICIARY_VIEW_ACCESS_KEY" value:0 table:@"Localizable"];
    [v36 setPrimaryActionText:v19];

    v20 = NSString;
    v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v22 = [v21 localizedStringForKey:@"MY_BENEFICIARY_DETAILS_SUBTITLE" value:0 table:@"Localizable"];
    v23 = [v5 firstNameOrHandleForDisplay];
    v24 = objc_msgSend(v20, "stringWithFormat:", v22, v23);
    [v36 setDetailsSubtitle:v24];

    [v36 setPrimaryActionRequiresAuth:1];
  }
  v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v26 = [v25 localizedStringForKey:@"MY_BENEFICIARY_REMOVE_TEXT" value:0 table:@"Localizable"];
  [v36 setDestructiveActionText:v26];

  v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v28 = [v27 localizedStringForKey:@"REMOVE_BENEFICIARY_ALERT_TITLE" value:0 table:@"Localizable"];
  [v36 setDestructiveActionSheetTitle:v28];

  v29 = NSString;
  v30 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v31 = [v30 localizedStringForKey:@"MY_BENEFICIARY_REMOVE_DETAILS" value:0 table:@"Localizable"];
  id v32 = [v5 firstNameOrHandleForDisplay];
  id v33 = objc_msgSend(v29, "stringWithFormat:", v31, v32);
  [v36 setDestructiveActionSheetDetails:v33];

  v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v35 = [v34 localizedStringForKey:@"CANCEL" value:0 table:@"Localizable"];
  [v36 setDestructiveActionSheetCancelText:v35];

  [v36 setDestructiveActionRequiresAuth:1];
}

- (void)prepareForMyBenefactorFlow:(id)a3 withContact:(id)a4
{
  id v36 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v7 = [v6 localizedStringForKey:@"MY_BENEFACTOR_TITLE" value:0 table:@"Localizable"];
  [v36 setTitle:v7];

  v8 = NSString;
  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  uint64_t v10 = [v9 localizedStringForKey:@"MY_BENEFACTOR_DETAILS" value:0 table:@"Localizable"];
  v11 = [v5 firstNameOrHandleForDisplay];
  v12 = objc_msgSend(v8, "stringWithFormat:", v10, v11);
  [v36 setDetailsLabel:v12];

  v13 = NSString;
  v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v15 = [v14 localizedStringForKey:@"MY_BENEFACTOR_DETAILS_SUBTITLE" value:0 table:@"Localizable"];
  v16 = [v5 firstNameOrHandleForDisplay];
  v17 = objc_msgSend(v13, "stringWithFormat:", v15, v16);
  [v36 setDetailsSubtitle:v17];

  v18 = [v5 inheritanceContactInfo];
  if ([v5 trustedContactStatus] == 2)
  {
    v19 = [v18 accessKey];

    if (v19)
    {
      v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v21 = [v20 localizedStringForKey:@"MY_BENEFACTOR_VIEW_ACCESS_KEY" value:0 table:@"Localizable"];
      [v36 setPrimaryActionText:v21];

      v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v23 = [v22 localizedStringForKey:@"MY_BENEFACTOR_REQUEST_ACCESS" value:0 table:@"Localizable"];
      [v36 setSecondaryActionText:v23];

      [v36 setPrimaryActionRequiresAuth:1];
    }
  }
  v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v25 = [v24 localizedStringForKey:@"REMOVE" value:0 table:@"Localizable"];
  [v36 setDestructiveActionText:v25];

  v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v27 = [v26 localizedStringForKey:@"REMOVE_BENEFACTOR_ALERT_TITLE" value:0 table:@"Localizable"];
  [v36 setDestructiveActionSheetTitle:v27];

  v28 = NSString;
  v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v30 = [v29 localizedStringForKey:@"MY_BENEFACTOR_REMOVE_DETAILS" value:0 table:@"Localizable"];
  v31 = [v5 fullName];
  id v32 = [v5 firstNameOrHandleForDisplay];
  id v33 = objc_msgSend(v28, "stringWithFormat:", v30, v31, v32);
  [v36 setDestructiveActionSheetDetails:v33];

  v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v35 = [v34 localizedStringForKey:@"CANCEL" value:0 table:@"Localizable"];
  [v36 setDestructiveActionSheetCancelText:v35];

  [v36 setDestructiveActionRequiresAuth:1];
}

@end