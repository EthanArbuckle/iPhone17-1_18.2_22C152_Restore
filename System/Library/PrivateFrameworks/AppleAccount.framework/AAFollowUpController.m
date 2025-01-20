@interface AAFollowUpController
- (BOOL)_shouldPostRenewFollowup:(id)a3;
- (BOOL)dismissFollowUpWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isRenewCredentialsCFUPosted;
- (BOOL)postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4 error:(id *)a5;
- (double)ageOfOldestCustodianCFU;
- (id)_addRecoveryContactAction;
- (id)_addRecoveryKeyActionForIdentifier:(id)a3;
- (id)_custodianReviewNotification:(id)a3;
- (id)_filterFollowUpItems:(id)a3 byIdentifier:(id)a4 byAccount:(id)a5;
- (id)_followUpController;
- (id)_followUpForRecoveryKeyHealingWithContext:(id)a3;
- (id)_followUpForRecoveryKeyMismatchWithContext:(id)a3;
- (id)_followUpForWalrusRecoveryKeyMismatchWithContext:(id)a3;
- (id)_followUpItemForBeneficiaryRemoved:(id)a3;
- (id)_followUpItemForCustodianEmbargo:(id)a3;
- (id)_followUpItemForCustodianInvitationReminder:(id)a3;
- (id)_followUpItemForCustodianRemoved:(id)a3;
- (id)_followUpItemForCustodianReview:(id)a3;
- (id)_followUpItemForCustodianWalrusNoLiveness:(id)a3;
- (id)_followUpItemForCustodianWalrusRemoved:(id)a3;
- (id)_followUpItemForRenewCredentials:(id)a3;
- (id)_followUpItemForStartUsing:(id)a3;
- (id)_followUpItemForVerifyTerms:(id)a3;
- (id)_followUpItemForWalrusUserRecoveryFactorsMissing:(id)a3;
- (id)_followupActionUserInfo:(id)a3;
- (id)_pendingFollowUpItemsWithIdentifier:(id)a3 forAccount:(id)a4;
- (id)_recoveryKeyMismatchOtherOptionsActionWithUserInfo:(id)a3;
- (id)_recoveryNotificationWithInfo:(id)a3 type:(id)a4;
- (id)_showAccountRecoveryPane;
- (id)_verifyRecoveryKeyAction;
- (id)_walrusUserRecoveryFactorsMissingNotification;
- (id)creationDateOfOldestFollowUpWithIdentifiers:(id)a3;
- (id)followUpItemForIdentifier:(id)a3;
- (id)followUpItemForIdentifier:(id)a3 userInfo:(id)a4;
- (id)pendingFollowUpItemUserInfosWithIdentifier:(id)a3;
- (void)_dismissFollowUpWithIdentifiers:(id)a3 completion:(id)a4;
- (void)_pendingFollowUpItemsWithIdentifier:(id)a3 forAccount:(id)a4 completion:(id)a5;
- (void)dismissFollowUpWithIdentifier:(id)a3 completion:(id)a4;
- (void)dismissFollowUpWithIdentifier:(id)a3 forAccount:(id)a4 completion:(id)a5;
- (void)dismissFollowUpsForAccount:(id)a3 identifiers:(id)a4 completion:(id)a5;
- (void)dismissFollowUpsStartingWithIdentifierPrefix:(id)a3 account:(id)a4 completion:(id)a5;
- (void)pendingFollowUpItemUserInfosWithIdentifier:(id)a3 completion:(id)a4;
- (void)pendingFollowUpWithIdentifier:(id)a3 completion:(id)a4;
- (void)pendingFollowUpsForAccount:(id)a3 completion:(id)a4;
- (void)postFollowUpWithIdentifier:(id)a3 forAccount:(id)a4 userInfo:(id)a5 completion:(id)a6;
- (void)postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4 completion:(id)a5;
@end

@implementation AAFollowUpController

- (id)_followUpController
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getFLFollowUpControllerClass_softClass;
  uint64_t v11 = getFLFollowUpControllerClass_softClass;
  if (!getFLFollowUpControllerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getFLFollowUpControllerClass_block_invoke;
    v7[3] = &unk_1E5A48F98;
    v7[4] = &v8;
    __getFLFollowUpControllerClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = [v3 alloc];
  v5 = (void *)[v4 initWithClientIdentifier:AAFollowUpClientIdentifier[0]];

  return v5;
}

- (id)_followUpItemForStartUsing:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v4 setIdentifier:AAFollowUpActionPrimary[0]];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"FOLLOWUP_START_USING_BUTTON_PRIMARY" value:&stru_1EF456870 table:@"Localizable"];
  [v4 setLabel:v6];

  id v7 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v7 setIdentifier:AAFollowUpActionDismiss[0]];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"FOLLOWUP_START_USING_BUTTON_DISMISS" value:&stru_1EF456870 table:@"Localizable"];
  [v7 setLabel:v9];

  id v10 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v18[0] = v4;
  v18[1] = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v10 setActions:v11];

  [v10 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  v12 = getFLGroupIdentifierAccount();
  [v10 setGroupIdentifier:v12];

  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"FOLLOWUP_START_USING_MESSAGE" value:&stru_1EF456870 table:@"Localizable"];
  [v10 setInformativeText:v14];

  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"FOLLOWUP_START_USING_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  [v10 setTitle:v16];

  [v10 setUniqueIdentifier:AAFollowUpIdentifierStartUsing[0]];
  [v10 setUserInfo:v3];

  return v10;
}

- (id)_followUpItemForVerifyTerms:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v4 setIdentifier:AAFollowUpActionPrimary[0]];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"FOLLOWUP_VERIFY_TERMS_BUTTON_PRIMARY" value:&stru_1EF456870 table:@"Localizable"];
  [v4 setLabel:v6];

  id v7 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v7 setIdentifier:AAFollowUpActionPrimary[0]];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"FOLLOWUP_VERIFY_TERMS_NOTIFICATION_BUTTON_PRIMARY" value:&stru_1EF456870 table:@"Localizable"];
  [v7 setLabel:v9];

  int v10 = BYSetupAssistantNeedsToRun();
  char v11 = v10;
  if (v10)
  {
    v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Surpressing VerifyTerms notification while Setup Assistant is running...", buf, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, @"com.apple.AppleAccount.FollowUp.SetupAssistantExited", (CFNotificationCallback)_AAFollowUpControllerHandleSetupAssistantExited, (CFStringRef)*MEMORY[0x1E4F9AA10], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v14 = [v3 objectForKeyedSubscript:AAFollowUpUserInfoTermsNotificationTitle[0]];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v16 = [v17 localizedStringForKey:@"FOLLOWUP_VERIFY_TERMS_NOTIFICATION_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  }
  v18 = [v3 objectForKeyedSubscript:AAFollowUpUserInfoTermsNotificationBody[0]];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    AADeviceLocStringForKey(@"FOLLOWUP_VERIFY_TERMS_NOTIFICATION_MESSAGE");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  v22 = [v3 objectForKeyedSubscript:AAFollowUpUserInfoTermsCFUTitle[0]];
  v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v24 = [v25 localizedStringForKey:@"FOLLOWUP_VERIFY_TERMS_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  }
  v26 = [v3 objectForKeyedSubscript:AAFollowUpUserInfoTermsCFUBody[0]];
  v27 = v26;
  if (v26)
  {
    id v28 = v26;
  }
  else
  {
    AADeviceLocStringForKey(@"FOLLOWUP_VERIFY_TERMS_MESSAGE");
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = v28;

  if (v11)
  {
    id v30 = 0;
  }
  else
  {
    id v30 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
    [v30 setActivateAction:v7];
    [v30 setFirstNotificationDelay:0.0];
    [v30 setFrequency:86400.0];
    [v30 setInformativeText:v21];
    [v30 setTitle:v16];
    v31 = (void *)MEMORY[0x1E4F1CAD0];
    getFLNotificationOptionForce();
    v45 = v29;
    id v32 = v3;
    id v33 = v24;
    id v34 = v7;
    id v35 = v4;
    v36 = v21;
    v38 = id v37 = v16;
    v39 = getFLNotificationOptionSpringboardAlert();
    v40 = objc_msgSend(v31, "setWithObjects:", v38, v39, 0);
    [v30 setOptions:v40];

    id v16 = v37;
    v21 = v36;
    id v4 = v35;
    id v7 = v34;
    id v24 = v33;
    id v3 = v32;
    v29 = v45;
  }
  id v41 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v47[0] = v4;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  [v41 setActions:v42];

  [v41 setDisplayStyle:1];
  [v41 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  v43 = getFLGroupIdentifierAccount();
  [v41 setGroupIdentifier:v43];

  [v41 setInformativeText:v29];
  [v41 setNotification:v30];
  [v41 setTitle:v24];
  [v41 setUniqueIdentifier:AAFollowUpIdentifierVerifyTerms[0]];
  [v41 setUserInfo:v3];

  return v41;
}

- (id)_followUpItemForRenewCredentials:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AAFollowUpController *)self _shouldPostRenewFollowup:v4])
  {
    id v5 = objc_alloc_init((Class)getFLFollowUpActionClass());
    [v5 setIdentifier:AAFollowUpActionPrimary[0]];
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"FOLLOWUP_RENEW_CREDENTIALS_PRIMARY" value:&stru_1EF456870 table:@"Localizable"];
    [v5 setLabel:v7];

    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"FOLLOWUP_RENEW_CREDENTIALS_MESSAGE" value:&stru_1EF456870 table:@"Localizable"];

    if ([MEMORY[0x1E4F47018] isInternalBuild])
    {
      int v10 = [v4 objectForKeyedSubscript:AAFollowUpUserInfoClientName[0]];
      if (v10)
      {
        char v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v12 = [v11 localizedStringForKey:@"FOLLOWUP_RENEW_CREDENTIALS_MESSAGE_BLAME" value:&stru_1EF456870 table:@"Localizable"];
        uint64_t v13 = objc_msgSend(v9, "stringByAppendingFormat:", v12, v10);

        v9 = (void *)v13;
      }
    }
    id v14 = objc_alloc_init((Class)getFLFollowUpItemClass());
    [v14 setDisplayStyle:0];
    v22[0] = v5;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v14 setActions:v15];

    [v14 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
    id v16 = getFLGroupIdentifierAccount();
    [v14 setGroupIdentifier:v16];

    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"FOLLOWUP_RENEW_CREDENTIALS_TITLE_REBRAND" value:&stru_1EF456870 table:@"Localizable"];
    [v14 setTitle:v18];

    [v14 setInformativeText:v9];
    [v14 setTypeIdentifier:AAFollowUpIdentifierRenewCredentials[0]];
    [v14 setUserInfo:v4];
    v19 = AAFollowUpIdentifierRenewCredentials[0];
    id v20 = [v4 objectForKeyedSubscript:AAFollowUpUserInfoAccountIdentifier[0]];
    if (v20) {
      [v14 setAccountIdentifier:v20];
    }
    [v14 setUniqueIdentifier:v19];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_followUpItemForCustodianReview:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AAFollowUpController *)self _showAccountRecoveryPane];
  id v6 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v15[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v6 setActions:v7];

  [v6 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REVIEW_MESSAGE" value:&stru_1EF456870 table:@"Localizable"];
  [v6 setInformativeText:v9];

  int v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v11 = [v10 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REVIEW_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  [v6 setTitle:v11];

  [v6 setUniqueIdentifier:AAFollowUpIdentifierCustodianReview[0]];
  [v6 setUserInfo:v4];

  [v6 setDisplayStyle:2];
  v12 = [(AAFollowUpController *)self _custodianReviewNotification:v5];
  [v6 setNotification:v12];

  uint64_t v13 = getFLGroupIdentifierAccount();
  [v6 setGroupIdentifier:v13];

  return v6;
}

- (id)_custodianReviewNotification:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  [v4 setActivateAction:v3];

  [v4 setFirstNotificationDelay:0.0];
  [v4 setFrequency:86400.0];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REVIEW_MESSAGE" value:&stru_1EF456870 table:@"Localizable"];
  [v4 setInformativeText:v6];

  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REVIEW_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  [v4 setTitle:v8];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  int v10 = getFLNotificationOptionForce();
  char v11 = getFLNotificationOptionLockscreen();
  v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, 0);
  [v4 setOptions:v12];

  return v4;
}

- (id)_showAccountRecoveryPane
{
  id v2 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v2 setIdentifier:AAFollowUpActionPrimary[0]];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REVIEW_BUTTON_PRIMARY" value:&stru_1EF456870 table:@"Localizable"];
  [v2 setLabel:v4];

  return v2;
}

- (id)_followUpItemForCustodianInvitationReminder:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v4 setIdentifier:AAFollowUpActionPrimary[0]];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_INVITATION_REMINDER_BUTTON_PRIMARY" value:&stru_1EF456870 table:@"Localizable"];
  [v4 setLabel:v6];

  v21 = [v3 objectForKeyedSubscript:AAFollowUpTrustedContactName[0]];
  v22 = [v3 objectForKeyedSubscript:AAFollowUpTrustedContactID[0]];
  id v7 = _AALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AAFollowUpController _followUpItemForCustodianInvitationReminder:](v4);
  }

  id v8 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v23[0] = v4;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v8 setActions:v9];

  [v8 setDisplayStyle:1];
  [v8 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  int v10 = getFLGroupIdentifierAccount();
  [v8 setGroupIdentifier:v10];

  char v11 = NSString;
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_INVITATION_REMINDER_MESSAGE" value:&stru_1EF456870 table:@"Localizable"];
  id v14 = objc_msgSend(v11, "stringWithFormat:", v13, v21);
  [v8 setInformativeText:v14];

  v15 = NSString;
  id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_INVITATION_REMINDER_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  v18 = objc_msgSend(v15, "stringWithFormat:", v17, v21);
  [v8 setTitle:v18];

  v19 = [NSString stringWithFormat:@"%@-%@", AAFollowUpIdentifierCustodianInvitationReminder[0], v22];
  [v8 setUniqueIdentifier:v19];

  [v8 setUserInfo:v3];

  return v8;
}

- (id)_followUpItemForCustodianWalrusRemoved:(id)a3
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v3 setIdentifier:AAFollowUpActionPrimary[0]];
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v5 = [v4 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_BUTTON_PRIMARY" value:0 table:@"Localizable-Walrus"];
  [v3 setLabel:v5];

  id v6 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v6 setIdentifier:AAFollowUpActionDismiss[0]];
  id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v8 = [v7 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_BUTTON_DISMISS" value:0 table:@"Localizable-Walrus"];
  v44 = v6;
  [v6 setLabel:v8];

  v9 = [v43 objectForKeyedSubscript:AAFollowUpTrustedContactName[0]];
  id v10 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  v45 = v3;
  [v10 setActivateAction:v3];
  [v10 setFirstNotificationDelay:0.0];
  [v10 setFrequency:86400.0];
  char v11 = NSString;
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  uint64_t v13 = [v12 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_NOTIFICATION_MESSAGE" value:0 table:@"Localizable-Walrus"];
  id v14 = objc_msgSend(v11, "stringWithFormat:", v13, v9);
  [v10 setInformativeText:v14];

  v15 = NSString;
  id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v17 = [v16 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_NOTIFICATION_TITLE_IOS" value:0 table:@"Localizable-Walrus"];
  v18 = objc_msgSend(v15, "stringWithFormat:", v17, v9);
  [v10 setTitle:v18];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  id v20 = getFLNotificationOptionForce();
  v21 = getFLNotificationOptionSpringboardAlert();
  v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, 0);
  [v10 setOptions:v22];

  id v23 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v23 setIdentifier:AAFollowUpActionPrimary[0]];
  v49 = @"type";
  v50[0] = @"addRecoveryContact";
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
  [v23 setUserInfo:v24];

  v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v26 = [v25 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_ADD_RECOVERY_CONTACT" value:0 table:@"Localizable-Walrus"];
  [v23 setLabel:v26];

  id v27 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v27 setIdentifier:AAFollowUpActionPrimary[0]];
  v47 = @"type";
  v48 = @"addRecoveryKey";
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  [v27 setUserInfo:v28];

  v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v30 = [v29 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_SETUP_RECOVERY_KEY" value:0 table:@"Localizable-Walrus"];
  [v27 setLabel:v30];

  id v31 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v46[0] = v23;
  v46[1] = v27;
  id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  [v31 setActions:v32];

  id v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v34 = [v33 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_NOTIFICATION_TITLE_IOS" value:0 table:@"Localizable-Walrus"];
  [v31 setTitle:v34];

  [v31 setDisplayStyle:1];
  [v31 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  id v35 = getFLGroupIdentifierAccount();
  [v31 setGroupIdentifier:v35];

  v36 = NSString;
  id v37 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v38 = [v37 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_MESSAGE" value:0 table:@"Localizable-Walrus"];
  v39 = objc_msgSend(v36, "stringWithFormat:", v38, v9);
  [v31 setInformativeText:v39];

  [v31 setNotification:v10];
  v40 = (void *)[v43 mutableCopy];

  if (!v40)
  {
    v40 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v31 setUniqueIdentifier:AAFollowUpIdentifierCustodianWalrusRemoved[0]];
  id v41 = (void *)[v40 copy];
  [v31 setUserInfo:v41];

  return v31;
}

- (id)_walrusUserRecoveryFactorsMissingNotification
{
  id v2 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v2 setIdentifier:AAFollowUpActionPrimary[0]];
  id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v4 = [v3 localizedStringForKey:@"FOLLOWUP_RECOVERY_FACTORS_MISSING_BUTTON_PRIMARY" value:0 table:@"Localizable-Walrus"];
  [v2 setLabel:v4];

  id v5 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v5 setIdentifier:AAFollowUpActionDismiss[0]];
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v7 = [v6 localizedStringForKey:@"FOLLOWUP_RECOVERY_FACTORS_MISSING_BUTTON_DISMISS" value:0 table:@"Localizable-Walrus"];
  [v5 setLabel:v7];

  id v8 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  [v8 setActivateAction:v2];
  [v8 setClearAction:v5];
  [v8 setFirstNotificationDelay:0.0];
  [v8 setFrequency:86400.0];
  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v10 = [v9 localizedStringForKey:@"FOLLOWUP_RECOVERY_FACTORS_MISSING_NOTIFICATION_MESSAGE" value:0 table:@"Localizable-Walrus"];
  [v8 setInformativeText:v10];

  char v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v12 = [v11 localizedStringForKey:@"FOLLOWUP_RECOVERY_FACTORS_MISSING_NOTIFICATION_TITLE_IOS" value:0 table:@"Localizable-Walrus"];
  [v8 setTitle:v12];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = getFLNotificationOptionForce();
  v15 = getFLNotificationOptionSpringboardAlert();
  id v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, 0);
  [v8 setOptions:v16];

  return v8;
}

- (id)_addRecoveryContactAction
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v2 setIdentifier:AAFollowUpActionPrimary[0]];
  id v7 = @"type";
  v8[0] = @"addRecoveryContact";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 setUserInfo:v3];

  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v5 = [v4 localizedStringForKey:@"FOLLOWUP_RECOVERY_FACTORS_MISSING_ADD_RECOVERY_CONTACT" value:0 table:@"Localizable-Walrus"];
  [v2 setLabel:v5];

  return v2;
}

- (id)_addRecoveryKeyActionForIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v3 setIdentifier:AAFollowUpActionPrimary[0]];
  id v8 = @"type";
  v9[0] = @"addRecoveryKey";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v3 setUserInfo:v4];

  id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v6 = [v5 localizedStringForKey:@"FOLLOWUP_RECOVERY_FACTORS_MISSING_SETUP_RECOVERY_KEY" value:0 table:@"Localizable-Walrus"];
  [v3 setLabel:v6];

  return v3;
}

- (id)_verifyRecoveryKeyAction
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v2 setIdentifier:AAFollowUpActionPrimary[0]];
  id v7 = @"type";
  v8[0] = @"verifyRecoveryKey";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 setUserInfo:v3];

  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"RECOVERY_KEY_REPAIR_PRIMARY_ACTION" value:&stru_1EF456870 table:@"Localizable"];
  [v2 setLabel:v5];

  return v2;
}

- (id)_recoveryKeyMismatchOtherOptionsActionWithUserInfo:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v3 setIdentifier:AAFollowUpActionPrimary[0]];
  id v8 = @"type";
  v9[0] = @"recoveryKeyMismatchOtherOption";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v3 setUserInfo:v4];

  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"RECOVERY_KEY_REPAIR_SECONDARY_ACTION" value:&stru_1EF456870 table:@"Localizable"];
  [v3 setLabel:v6];

  return v3;
}

- (id)_followUpItemForWalrusUserRecoveryFactorsMissing:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AAFollowUpController *)self _walrusUserRecoveryFactorsMissingNotification];
  id v6 = objc_alloc_init((Class)getFLFollowUpItemClass());
  id v7 = [(AAFollowUpController *)self _addRecoveryContactAction];
  v16[0] = v7;
  id v8 = [(AAFollowUpController *)self _addRecoveryKeyActionForIdentifier:AAFollowUpIdentifierWalrusUserRecoveryFactorsMissing[0]];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v6 setActions:v9];

  id v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  char v11 = [v10 localizedStringForKey:@"FOLLOWUP_RECOVERY_FACTORS_MISSING_NOTIFICATION_TITLE_IOS" value:0 table:@"Localizable-Walrus"];
  [v6 setTitle:v11];

  [v6 setDisplayStyle:0];
  [v6 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  v12 = getFLGroupIdentifierAccount();
  [v6 setGroupIdentifier:v12];

  uint64_t v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v14 = [v13 localizedStringForKey:@"FOLLOWUP_RECOVERY_FACTORS_MISSING_MESSAGE" value:0 table:@"Localizable-Walrus"];
  [v6 setInformativeText:v14];

  [v6 setNotification:v5];
  [v6 setUniqueIdentifier:AAFollowUpIdentifierWalrusUserRecoveryFactorsMissing[0]];
  [v6 setUserInfo:v4];

  return v6;
}

- (id)_followUpItemForCustodianRemoved:(id)a3
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v3 setIdentifier:AAFollowUpActionPrimary[0]];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = objc_msgSend(v4, "localizedStringForKey:value:table:", @"FOLLOWUP_CUSTODIAN_REMOVED_BUTTON_PRIMARY");
  id v37 = v3;
  [v3 setLabel:v5];

  uint64_t v6 = [v38 objectForKeyedSubscript:AAFollowUpTrustedContactName[0]];
  id v7 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  [v7 setActivateAction:v3];
  [v7 setFirstNotificationDelay:0.0];
  [v7 setFrequency:86400.0];
  id v8 = NSString;
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_NOTIFICATION_MESSAGE" value:&stru_1EF456870 table:@"Localizable"];
  v36 = (void *)v6;
  char v11 = objc_msgSend(v8, "stringWithFormat:", v10, v6);
  [v7 setInformativeText:v11];

  v12 = NSString;
  uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_NOTIFICATION_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  v15 = objc_msgSend(v12, "stringWithFormat:", v14, v6);
  [v7 setTitle:v15];

  id v16 = (void *)MEMORY[0x1E4F1CAD0];
  v17 = getFLNotificationOptionForce();
  v18 = getFLNotificationOptionSpringboardAlert();
  v19 = objc_msgSend(v16, "setWithObjects:", v17, v18, 0);
  [v7 setOptions:v19];

  id v20 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v20 setIdentifier:AAFollowUpActionPrimary[0]];
  v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_BUTTON_PRIMARY" value:&stru_1EF456870 table:@"Localizable"];
  [v20 setLabel:v22];

  id v23 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v23 setIdentifier:AAFollowUpActionDismiss[0]];
  id v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_BUTTON_DISMISS" value:&stru_1EF456870 table:@"Localizable"];
  [v23 setLabel:v25];

  id v26 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v39[0] = v20;
  v39[1] = v23;
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [v26 setActions:v27];

  [v26 setDisplayStyle:1];
  [v26 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  id v28 = getFLGroupIdentifierAccount();
  [v26 setGroupIdentifier:v28];

  v29 = NSString;
  id v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v31 = [v30 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_MESSAGE" value:&stru_1EF456870 table:@"Localizable"];
  id v32 = objc_msgSend(v29, "stringWithFormat:", v31, v36);
  [v26 setInformativeText:v32];

  [v26 setNotification:v7];
  id v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v34 = [v33 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_REMOVED_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  [v26 setTitle:v34];

  [v26 setUniqueIdentifier:AAFollowUpIdentifierCustodianRemoved[0]];
  [v26 setUserInfo:v38];

  return v26;
}

- (id)_followUpItemForCustodianWalrusNoLiveness:(id)a3
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v3 setIdentifier:AAFollowUpActionPrimary[0]];
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v5 = [v4 localizedStringForKey:@"FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_BUTTON_PRIMARY" value:0 table:@"Localizable-Walrus"];
  [v3 setLabel:v5];

  id v6 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v6 setIdentifier:AAFollowUpActionDismiss[0]];
  id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v8 = [v7 localizedStringForKey:@"FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_BUTTON_SECONDARY" value:0 table:@"Localizable-Walrus"];
  v42 = v6;
  [v6 setLabel:v8];

  v9 = [v41 objectForKeyedSubscript:AAFollowUpTrustedContactName[0]];
  id v10 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  id v43 = v3;
  [v10 setActivateAction:v3];
  [v10 setFirstNotificationDelay:0.0];
  [v10 setFrequency:86400.0];
  char v11 = NSString;
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  uint64_t v13 = [v12 localizedStringForKey:@"FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_BUTTON_NOTIFICATION_MESSAGE" value:0 table:@"Localizable-Walrus"];
  id v14 = objc_msgSend(v11, "stringWithFormat:", v13, v9);
  [v10 setInformativeText:v14];

  v15 = NSString;
  id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v17 = [v16 localizedStringForKey:@"FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_BUTTON_NOTIFICATION_TITLE" value:0 table:@"Localizable-Walrus"];
  v18 = objc_msgSend(v15, "stringWithFormat:", v17, v9);
  [v10 setTitle:v18];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  id v20 = getFLNotificationOptionForce();
  v21 = getFLNotificationOptionSpringboardAlert();
  v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, 0);
  [v10 setOptions:v22];

  id v23 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v23 setIdentifier:AAFollowUpActionPrimary[0]];
  id v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v25 = [v24 localizedStringForKey:@"FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_UPDATE_RECOVERY_CONTACT" value:0 table:@"Localizable-Walrus"];
  [v23 setLabel:v25];

  id v26 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v26 setIdentifier:AAFollowUpActionDismiss[0]];
  id v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v28 = [v27 localizedStringForKey:@"FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_NOT_NOW" value:0 table:@"Localizable-Walrus"];
  [v26 setLabel:v28];

  id v29 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v44[0] = v23;
  v44[1] = v26;
  id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  [v29 setActions:v30];

  [v29 setDisplayStyle:1];
  [v29 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  id v31 = getFLGroupIdentifierAccount();
  [v29 setGroupIdentifier:v31];

  id v32 = NSString;
  id v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v34 = [v33 localizedStringForKey:@"FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_MESSAGE" value:0 table:@"Localizable-Walrus"];
  id v35 = objc_msgSend(v32, "stringWithFormat:", v34, v9);
  [v29 setInformativeText:v35];

  [v29 setNotification:v10];
  v36 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v37 = [v36 localizedStringForKey:@"FOLLOWUP_LAST_CUSTODIAN_NO_LIVENESS_TITLE" value:0 table:@"Localizable-Walrus"];
  [v29 setTitle:v37];

  id v38 = (void *)[v41 mutableCopy];
  if (!v38)
  {
    id v38 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v29 setUniqueIdentifier:AAFollowUpIdentifierCustodianWalrusNoLiveness[0]];
  v39 = (void *)[v38 copy];
  [v29 setUserInfo:v39];

  return v29;
}

- (id)_followUpItemForBeneficiaryRemoved:(id)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v3 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v3 setIdentifier:AAFollowUpActionPrimary[0]];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = objc_msgSend(v4, "localizedStringForKey:value:table:", @"FOLLOWUP_BENEFICIARY_REMOVED_BUTTON_PRIMARY");
  [v3 setLabel:v5];

  id v34 = [v35 objectForKeyedSubscript:AAFollowUpTrustedContactName[0]];
  id v6 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  [v6 setActivateAction:v3];
  [v6 setFirstNotificationDelay:0.0];
  [v6 setFrequency:86400.0];
  id v7 = NSString;
  id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"FOLLOWUP_BENEFICIARY_REMOVED_NOTIFICATION_MESSAGE" value:&stru_1EF456870 table:@"Localizable"];
  id v10 = objc_msgSend(v7, "stringWithFormat:", v9, v34);
  [v6 setInformativeText:v10];

  char v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"FOLLOWUP_BENEFICIARY_REMOVED_NOTIFICATION_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  [v6 setTitle:v12];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = getFLNotificationOptionForce();
  v15 = getFLNotificationOptionSpringboardAlert();
  id v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, 0);
  [v6 setOptions:v16];

  id v17 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v17 setIdentifier:AAFollowUpActionPrimary[0]];
  v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"FOLLOWUP_BENEFICIARY_REMOVED_BUTTON_PRIMARY" value:&stru_1EF456870 table:@"Localizable"];
  [v17 setLabel:v19];

  id v20 = objc_alloc_init((Class)getFLFollowUpActionClass());
  [v20 setIdentifier:AAFollowUpActionDismiss[0]];
  v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"FOLLOWUP_BENEFICIARY_REMOVED_BUTTON_DISMISS" value:&stru_1EF456870 table:@"Localizable"];
  [v20 setLabel:v22];

  id v23 = objc_alloc_init((Class)getFLFollowUpItemClass());
  v36[0] = v17;
  v36[1] = v20;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  [v23 setActions:v24];

  [v23 setDisplayStyle:1];
  [v23 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  v25 = getFLGroupIdentifierAccount();
  [v23 setGroupIdentifier:v25];

  id v26 = NSString;
  id v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v28 = [v27 localizedStringForKey:@"FOLLOWUP_BENEFICIARY_REMOVED_MESSAGE" value:&stru_1EF456870 table:@"Localizable"];
  id v29 = objc_msgSend(v26, "stringWithFormat:", v28, v34);
  [v23 setInformativeText:v29];

  [v23 setNotification:v6];
  id v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v31 = [v30 localizedStringForKey:@"FOLLOWUP_BENEFICIARY_REMOVED_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  [v23 setTitle:v31];

  [v23 setUniqueIdentifier:AAFollowUpIdentifierBeneficiaryRemoved[0]];
  [v23 setUserInfo:v35];

  id v32 = _AALogSystem();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    -[AAFollowUpController _followUpItemForBeneficiaryRemoved:](v23);
  }

  return v23;
}

- (id)_followUpItemForCustodianEmbargo:(id)a3
{
  id v4 = a3;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AAFollowUpController _followUpItemForCustodianEmbargo:]();
  }

  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:AAFollowUpUserInfoNotificationInfo[0]];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = [v6 objectForKeyedSubscript:AAFollowUpUserInfoNotificationButtonTitle[0]];
    id v9 = objc_alloc_init((Class)getFLFollowUpActionClass());
    [v9 setIdentifier:AAFollowUpActionPrimary[0]];
    v19 = (void *)v8;
    [v9 setLabel:v8];
    [v7 addObject:v9];
    id v10 = [v4 objectForKeyedSubscript:AAFollowUpUserInfoNotificationAltButtonTitle[0]];
    if ((unint64_t)[v10 length] >= 2)
    {
      id v11 = objc_alloc_init((Class)getFLFollowUpActionClass());
      [v11 setLabel:v10];
      [v11 setIdentifier:AAFollowUpActionDismiss[0]];
      [v7 addObject:v11];
    }
    v12 = [v4 objectForKeyedSubscript:AAFollowUpUserInfoCFUType[0]];
    uint64_t v13 = [(AAFollowUpController *)self _recoveryNotificationWithInfo:v6 type:v12];
    [v13 setActivateAction:v9];
    id v14 = objc_alloc_init((Class)getFLFollowUpItemClass());
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v16 = [v15 localizedStringForKey:@"FOLLOWUP_CUSTODIAN_EMBARGO_TITLE_REBRAND" value:&stru_1EF456870 table:@"Localizable"];
    [v14 setTitle:v16];

    [v14 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
    id v17 = getFLGroupIdentifierAccount();
    [v14 setGroupIdentifier:v17];

    [v14 setNotification:v13];
    [v14 setActions:v7];
    [v14 setUniqueIdentifier:AAFollowUpIdentifierCustodianEmbargo[0]];
    [v14 setUserInfo:v4];
    [v14 setDisplayStyle:2];
  }
  else
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController _followUpItemForCustodianEmbargo:]();
    }
    id v14 = 0;
  }

  return v14;
}

- (id)_followUpForRecoveryKeyHealingWithContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:AAFollowUpUserInfoHasWalrusEnabled[0]];
    if ([v6 BOOLValue]) {
      [(AAFollowUpController *)self _followUpForWalrusRecoveryKeyMismatchWithContext:v5];
    }
    else {
    uint64_t v8 = [(AAFollowUpController *)self _followUpForRecoveryKeyMismatchWithContext:v5];
    }
  }
  else
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController _followUpForRecoveryKeyHealingWithContext:]();
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_followUpForRecoveryKeyMismatchWithContext:(id)a3
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22 = [v4 objectForKeyedSubscript:AAFollowUpUserInfoHasRecoveryContact[0]];
  id v5 = objc_alloc_init((Class)getFLFollowUpItemClass());
  [v5 setUniqueIdentifier:AAFollowUpIdentifierRecoveryKeyMismatch[0]];
  id v6 = [v4 objectForKeyedSubscript:AAFollowUpUserInfoAccountIdentifier[0]];
  if (v6) {
    [v5 setAccountIdentifier:v6];
  }
  [v5 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  [v5 setTypeIdentifier:AAFollowUpIdentifierRecoveryKeyMismatch[0]];
  [v5 setUserInfo:v4];
  id v7 = [v5 notification];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"RECOVERY_KEY_REPAIR_NOTIFICATION_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  [v7 setTitle:v9];

  id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"RECOVERY_KEY_REPAIR_FOLLOWUP_NOTIFICATION_INFORMATIVE" value:&stru_1EF456870 table:@"Localizable"];
  [v7 setInformativeText:v11];

  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"RECOVERY_KEY_REPAIR_TITLE" value:&stru_1EF456870 table:@"Localizable"];
  [v5 setTitle:v13];

  LODWORD(v12) = [v22 BOOLValue];
  id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v15 = v14;
  if (v12) {
    id v16 = @"RECOVERY_KEY_REPAIR_INFORMATIVE_HAS_RC";
  }
  else {
    id v16 = @"RECOVERY_KEY_REPAIR_INFORMATIVE_NO_RC";
  }
  id v17 = [v14 localizedStringForKey:v16 value:&stru_1EF456870 table:@"Localizable"];
  [v5 setInformativeText:v17];

  v18 = [(AAFollowUpController *)self _verifyRecoveryKeyAction];
  v19 = [(AAFollowUpController *)self _recoveryKeyMismatchOtherOptionsActionWithUserInfo:v4];
  v23[0] = v18;
  v23[1] = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v5 setActions:v20];

  return v5;
}

- (id)_followUpForWalrusRecoveryKeyMismatchWithContext:(id)a3
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)getFLFollowUpItemClass());
  [v5 setUniqueIdentifier:AAFollowUpIdentifierRecoveryKeyMismatch[0]];
  uint64_t v6 = [v4 objectForKeyedSubscript:AAFollowUpUserInfoAccountIdentifier[0]];
  if (v6) {
    [v5 setAccountIdentifier:v6];
  }
  v44 = (void *)v6;
  [v5 setExtensionIdentifier:AAFollowUpExtensionIdentifier[0]];
  [v5 setTypeIdentifier:AAFollowUpIdentifierRecoveryKeyMismatch[0]];
  [v5 setUserInfo:v4];
  [v5 setDisplayStyle:4];
  id v7 = [(AAFollowUpController *)self _verifyRecoveryKeyAction];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v9 = [v8 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_VERIFY_RK_ACTION" value:0 table:@"Localizable-Walrus"];
  id v43 = v7;
  [v7 setLabel:v9];

  id v10 = [(AAFollowUpController *)self _recoveryKeyMismatchOtherOptionsActionWithUserInfo:v4];
  v42 = [v4 objectForKeyedSubscript:AAFollowUpUserInfoHasRecoveryContact[0]];
  int v11 = [v42 BOOLValue];
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  uint64_t v13 = v12;
  if (v11)
  {
    id v14 = [v12 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_HAS_RC_TITLE" value:0 table:@"Localizable-Walrus"];
    [v5 setTitle:v14];

    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    id v16 = [v15 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_INFORMATIVE_HAS_RC" value:0 table:@"Localizable-Walrus"];
    [v5 setInformativeText:v16];

    id v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v18 = v17;
    v19 = @"RECOVERY_KEY_REPAIR_ADP_OTHER_OPTIONS_ACTION";
  }
  else
  {
    id v20 = [v12 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_NO_RC_TITLE" value:0 table:@"Localizable-Walrus"];
    [v5 setTitle:v20];

    v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v22 = [v21 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_INFORMATIVE_NO_RC" value:0 table:@"Localizable-Walrus"];
    [v5 setInformativeText:v22];

    id v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v18 = v17;
    v19 = @"RECOVERY_KEY_REPAIR_ADP_ADD_NEW_RECOVER_METHOD_ACTION";
  }
  id v23 = [v17 localizedStringForKey:v19 value:0 table:@"Localizable-Walrus"];
  [v10 setLabel:v23];

  v45[0] = v43;
  v45[1] = v10;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  [v5 setActions:v24];

  v25 = [v5 notification];
  id v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v27 = [v26 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_NOTIFICATION_TITLE" value:0 table:@"Localizable-Walrus"];
  [v25 setTitle:v27];

  id v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v29 = [v28 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_FOLLOWUP_NOTIFICATION_INFORMATIVE" value:0 table:@"Localizable-Walrus"];
  [v25 setInformativeText:v29];

  id v30 = [(AAFollowUpController *)self _verifyRecoveryKeyAction];
  id v31 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v32 = [v31 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_FOLLOWUP_NOTIFICATION_PRIMARY_ACTIVATE_LABEL" value:0 table:@"Localizable-Walrus"];
  [v30 setLabel:v32];

  [v25 setActivateAction:v30];
  id v33 = objc_alloc_init((Class)getFLFollowUpActionClass());
  id v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v35 = [v34 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_FOLLOWUP_NOTIFICATION_SECONDARY_ACTIVATE_LABEL" value:0 table:@"Localizable-Walrus"];
  [v33 setLabel:v35];

  [v25 setClearAction:v33];
  v36 = (void *)MEMORY[0x1E4F1CAD0];
  id v37 = getFLNotificationOptionForce();
  id v38 = getFLNotificationOptionSpringboardAlert();
  v39 = getFLNotificationOptionLockscreen();
  v40 = objc_msgSend(v36, "setWithObjects:", v37, v38, v39, 0);
  [v25 setOptions:v40];

  [v25 setFirstNotificationDelay:0.0];

  return v5;
}

- (id)_recoveryNotificationWithInfo:(id)a3 type:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:AAFollowUpUserInfoNotificationTitle[0]];
  if (![v7 length])
  {
    uint64_t v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController _recoveryNotificationWithInfo:type:]();
    }
    goto LABEL_10;
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:AAFollowUpUserInfoNotificationBody[0]];
  if (![v8 length])
  {
    uint64_t v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController _recoveryNotificationWithInfo:type:]();
    }

LABEL_10:
    id v9 = 0;
    goto LABEL_20;
  }
  id v9 = objc_alloc_init((Class)getFLFollowUpNotificationClass());
  [v9 setTitle:v7];
  [v9 setInformativeText:v8];
  id v10 = [v5 objectForKeyedSubscript:AAFollowUpUserInfoNotificationDelay[0]];
  int v11 = v10;
  if (v10) {
    [v10 doubleValue];
  }
  else {
    double v12 = 0.0;
  }
  [v9 setFirstNotificationDelay:v12];
  id v14 = [v5 objectForKeyedSubscript:AAFollowUpUserInfoNotificationFrequency[0]];
  v15 = v14;
  if (v14) {
    [v14 doubleValue];
  }
  else {
    double v16 = 86400.0;
  }
  [v9 setFrequency:v16];
  if (v6 && [v6 intValue] != 1)
  {
    if ([v6 intValue] != 2) {
      goto LABEL_19;
    }
    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    v18 = getFLNotificationOptionForce();
    uint64_t v19 = getFLNotificationOptionSpringboardAlert();
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    v18 = getFLNotificationOptionForce();
    uint64_t v19 = getFLNotificationOptionBannerAlert();
  }
  id v20 = (void *)v19;
  v21 = objc_msgSend(v17, "setWithObjects:", v18, v19, 0);
  [v9 setOptions:v21];

LABEL_19:
LABEL_20:

  return v9;
}

- (id)_followupActionUserInfo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
}

- (BOOL)_shouldPostRenewFollowup:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:AAFollowUpUserInfoAccountIdentifier[0]];

  if (!v3)
  {
    id v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController _shouldPostRenewFollowup:]();
    }
  }
  return v3 != 0;
}

- (void)postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 949, @"Invalid parameter not satisfying: %@", @"followUpIdentifier" object file lineNumber description];
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke;
  v25[3] = &unk_1E5A48DE8;
  id v12 = v11;
  id v26 = v12;
  uint64_t v13 = (void (**)(void, void, void))MEMORY[0x1A622F430](v25);
  id v14 = _AALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Attempting to post follow up item with identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v15 = [(AAFollowUpController *)self followUpItemForIdentifier:v9 userInfo:v10];
  if ([v9 isEqualToString:AAFollowUpIdentifierRenewCredentials[0]]
    && !+[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:v10])
  {
    uint64_t v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController postFollowUpWithIdentifier:userInfo:completion:]();
    }

    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.appleaccount" code:-14 userInfo:0];
    ((void (**)(void, void, void *))v13)[2](v13, 0, v20);
  }
  else if (v15)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__4;
    id v30 = __Block_byref_object_dispose__4;
    id v31 = [(AAFollowUpController *)self _followUpController];
    double v16 = *(void **)(*((void *)&buf + 1) + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke_279;
    v22[3] = &unk_1E5A48E10;
    p_long long buf = &buf;
    id v23 = v13;
    [v16 postFollowUpItem:v15 completion:v22];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController postFollowUpWithIdentifier:userInfo:completion:]();
    }

    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.appleaccount" code:-3 userInfo:0];
    ((void (**)(void, void, void *))v13)[2](v13, 0, v18);
  }
}

uint64_t __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke_279(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = _AALogSystem();
  id v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Successfully posted follow up item!", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke_279_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 993, @"Invalid parameter not satisfying: %@", @"followUpIdentifier" object file lineNumber description];
  }
  id v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v25 = v9;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to post follow up item with identifier: %{public}@", buf, 0xCu);
  }

  id v12 = [(AAFollowUpController *)self followUpItemForIdentifier:v9 userInfo:v10];
  if ([v9 isEqualToString:AAFollowUpIdentifierRenewCredentials[0]]
    && !+[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:v10])
  {
    v21 = _AALogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController postFollowUpWithIdentifier:userInfo:completion:]();
    }

    if (!a5) {
      goto LABEL_25;
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = -14;
    goto LABEL_21;
  }
  if (!v12)
  {
    v18 = _AALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController postFollowUpWithIdentifier:userInfo:completion:]();
    }

    if (!a5) {
      goto LABEL_25;
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = -3;
LABEL_21:
    [v19 errorWithDomain:@"com.apple.appleaccount" code:v20 userInfo:0];
    BOOL v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  uint64_t v13 = [(AAFollowUpController *)self _followUpController];
  int v14 = [v13 postFollowUpItem:v12 error:a5];

  v15 = _AALogSystem();
  double v16 = v15;
  if (a5 || !v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController postFollowUpWithIdentifier:userInfo:error:]();
    }

LABEL_25:
    BOOL v17 = 0;
    goto LABEL_26;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Successfully posted follow up item!", buf, 2u);
  }

  BOOL v17 = 1;
LABEL_26:

  return v17;
}

- (void)pendingFollowUpWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1034, @"Invalid parameter not satisfying: %@", @"followUpIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1035, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to fetch follow up item with identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  id v23 = __Block_byref_object_dispose__4;
  id v24 = [(AAFollowUpController *)self _followUpController];
  id v11 = *(void **)(*((void *)&buf + 1) + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke;
  void v16[3] = &unk_1E5A48E60;
  p_long long buf = &buf;
  id v12 = v9;
  id v18 = v12;
  id v13 = v7;
  id v17 = v13;
  [v11 pendingFollowUpItemsWithCompletion:v16];

  _Block_object_dispose(&buf, 8);
}

void __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  if (!v5 || v6)
  {
    id v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_283;
    v15[3] = &unk_1E5A48E38;
    id v16 = *(id *)(a1 + 32);
    uint64_t v9 = [v5 indexOfObjectPassingTest:v15];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = _AALogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = *(void **)(a1 + 32);
        *(_DWORD *)long long buf = 138543362;
        id v18 = v11;
        _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "No follow ups found with identifier: %{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v13 = [v5 objectAtIndexedSubscript:v9];
      int v14 = _AALogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138477827;
        id v18 = v13;
        _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Successfully fetched follow up: %{private}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_283(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)dismissFollowUpWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1071, @"Invalid parameter not satisfying: %@", @"followUpIdentifier" object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke;
  v19[3] = &unk_1E5A48DE8;
  id v9 = v8;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x1A622F430](v19);
  id v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to clear follow up item with identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__4;
  uint64_t v25 = __Block_byref_object_dispose__4;
  id v26 = [(AAFollowUpController *)self _followUpController];
  id v12 = *(void **)(*((void *)&buf + 1) + 40);
  id v21 = v7;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke_286;
  void v16[3] = &unk_1E5A48E10;
  p_long long buf = &buf;
  id v14 = v10;
  id v17 = v14;
  [v12 clearPendingFollowUpItemsWithUniqueIdentifiers:v13 completion:v16];

  _Block_object_dispose(&buf, 8);
}

uint64_t __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke_286(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  id v8 = _AALogSystem();
  id v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Successfully cleared follow up item!", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke_286_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)dismissFollowUpWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1101, @"Invalid parameter not satisfying: %@", @"followUpIdentifier" object file lineNumber description];
  }
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v19 = v7;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to clear follow up item with identifier: %{public}@", buf, 0xCu);
  }

  id v9 = [(AAFollowUpController *)self _followUpController];
  id v17 = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  int v11 = [v9 clearPendingFollowUpItemsWithUniqueIdentifiers:v10 error:a4];

  if (a4) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v11;
  }
  id v13 = _AALogSystem();
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Successfully cleared follow up item!", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[AAFollowUpController dismissFollowUpWithIdentifier:error:]();
  }

  return v12;
}

- (id)followUpItemForIdentifier:(id)a3
{
  return [(AAFollowUpController *)self followUpItemForIdentifier:a3 userInfo:0];
}

- (id)followUpItemForIdentifier:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:AAFollowUpIdentifierStartUsing[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForStartUsing:v7];
LABEL_25:
    id v9 = (void *)v8;
    goto LABEL_26;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierVerifyTerms[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForVerifyTerms:v7];
    goto LABEL_25;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierRenewCredentials[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForRenewCredentials:v7];
    goto LABEL_25;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierCustodianReview[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForCustodianReview:v7];
    goto LABEL_25;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierCustodianInvitationReminder[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForCustodianInvitationReminder:v7];
    goto LABEL_25;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierCustodianRemoved[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForCustodianRemoved:v7];
    goto LABEL_25;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierCustodianWalrusNoLiveness[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForCustodianWalrusNoLiveness:v7];
    goto LABEL_25;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierCustodianWalrusRemoved[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForCustodianWalrusRemoved:v7];
    goto LABEL_25;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierWalrusUserRecoveryFactorsMissing[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForWalrusUserRecoveryFactorsMissing:v7];
    goto LABEL_25;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierBeneficiaryRemoved[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForBeneficiaryRemoved:v7];
    goto LABEL_25;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierCustodianEmbargo[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpItemForCustodianEmbargo:v7];
    goto LABEL_25;
  }
  if ([v6 isEqualToString:AAFollowUpIdentifierRecoveryKeyMismatch[0]])
  {
    uint64_t v8 = [(AAFollowUpController *)self _followUpForRecoveryKeyHealingWithContext:v7];
    goto LABEL_25;
  }
  id v9 = 0;
LABEL_26:

  return v9;
}

- (void)postFollowUpWithIdentifier:(id)a3 forAccount:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1172, @"Invalid parameter not satisfying: %@", @"followUpIdentifier" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1173, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

LABEL_3:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __95__AAFollowUpController_Convenience__postFollowUpWithIdentifier_forAccount_userInfo_completion___block_invoke;
  v27[3] = &unk_1E5A48DE8;
  id v28 = v14;
  id v15 = v14;
  id v16 = (void *)MEMORY[0x1A622F430](v27);
  id v17 = objc_alloc(MEMORY[0x1E4F1CA60]);
  if (v13) {
    id v18 = v13;
  }
  else {
    id v18 = (id)MEMORY[0x1E4F1CC08];
  }
  id v19 = (void *)[v17 initWithDictionary:v18];
  uint64_t v20 = [v12 identifier];
  [v19 setObject:v20 forKeyedSubscript:AAFollowUpUserInfoAccountIdentifier[0]];

  id v21 = objc_msgSend(v12, "aa_altDSID");
  [v19 setObject:v21 forKeyedSubscript:AAFollowUpUserInfoAltDSID[0]];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __95__AAFollowUpController_Convenience__postFollowUpWithIdentifier_forAccount_userInfo_completion___block_invoke_2;
  v25[3] = &unk_1E5A48DE8;
  id v26 = v16;
  id v22 = v16;
  [(AAFollowUpController *)self postFollowUpWithIdentifier:v11 userInfo:v19 completion:v25];
}

uint64_t __95__AAFollowUpController_Convenience__postFollowUpWithIdentifier_forAccount_userInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __95__AAFollowUpController_Convenience__postFollowUpWithIdentifier_forAccount_userInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissFollowUpWithIdentifier:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1197, @"Invalid parameter not satisfying: %@", @"followUpIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1198, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

LABEL_3:
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke;
  v25[3] = &unk_1E5A48DE8;
  id v26 = v11;
  id v12 = v11;
  id v13 = (void *)MEMORY[0x1A622F430](v25);
  id v14 = _AALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Attempting to teardown follow up with identifier: %@, account: %@", buf, 0x16u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_333;
  v20[3] = &unk_1E5A48E88;
  id v21 = v9;
  id v22 = self;
  id v23 = v10;
  id v24 = v13;
  id v15 = v10;
  id v16 = v13;
  id v17 = v9;
  [(AAFollowUpController *)self pendingFollowUpWithIdentifier:v17 completion:v20];
}

uint64_t __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_333(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [a2 userInfo];
    uint64_t v4 = [v3 objectForKeyedSubscript:AAFollowUpUserInfoAccountIdentifier[0]];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 48) identifier];
      char v6 = [v4 isEqualToString:v5];

      id v7 = _AALogSystem();
      uint64_t v8 = v7;
      if ((v6 & 1) == 0)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_333_cold_2();
        }

        goto LABEL_16;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v14 = 138412290;
        uint64_t v15 = v9;
        id v10 = "Tearing down follow up with identifier %@";
        id v11 = v8;
        uint32_t v12 = 12;
LABEL_11:
        _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
      }
    }
    else
    {
      uint64_t v8 = _AALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        id v10 = "Found a followup without an account identifier, dismissing!";
        id v11 = v8;
        uint32_t v12 = 2;
        goto LABEL_11;
      }
    }

    [*(id *)(a1 + 40) dismissFollowUpWithIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
LABEL_16:

    return;
  }
  id v13 = _AALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_333_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)dismissFollowUpsForAccount:(id)a3 identifiers:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1235, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__AAFollowUpController_Convenience__dismissFollowUpsForAccount_identifiers_completion___block_invoke;
  v19[3] = &unk_1E5A48DE8;
  id v12 = v11;
  id v20 = v12;
  id v13 = (void *)MEMORY[0x1A622F430](v19);
  if ([v10 count])
  {
    [(AAFollowUpController *)self _dismissFollowUpWithIdentifiers:v10 completion:v13];
  }
  else
  {
    int v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Attempting to teardown all followups for account: %@", buf, 0xCu);
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__AAFollowUpController_Convenience__dismissFollowUpsForAccount_identifiers_completion___block_invoke_335;
    void v16[3] = &unk_1E5A48EB0;
    void v16[4] = self;
    id v18 = v13;
    id v17 = v9;
    [(AAFollowUpController *)self pendingFollowUpsForAccount:v17 completion:v16];
  }
}

uint64_t __87__AAFollowUpController_Convenience__dismissFollowUpsForAccount_identifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __87__AAFollowUpController_Convenience__dismissFollowUpsForAccount_identifiers_completion___block_invoke_335(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "uniqueIdentifier", (void)v13);
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    [*(id *)(a1 + 32) _dismissFollowUpWithIdentifiers:v4 completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "No follow ups to delete for account: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)dismissFollowUpsStartingWithIdentifierPrefix:(id)a3 account:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1270, @"Invalid parameter not satisfying: %@", @"followUpIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1271, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

LABEL_3:
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke;
  v25[3] = &unk_1E5A48DE8;
  id v26 = v11;
  id v12 = v11;
  long long v13 = (void *)MEMORY[0x1A622F430](v25);
  long long v14 = _AALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[AAFollowUpController(Convenience) dismissFollowUpsStartingWithIdentifierPrefix:account:completion:]();
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke_336;
  v20[3] = &unk_1E5A48ED8;
  id v21 = v9;
  id v22 = self;
  id v23 = v10;
  id v24 = v13;
  id v15 = v10;
  id v16 = v13;
  id v17 = v9;
  [(AAFollowUpController *)self pendingFollowUpsForAccount:v15 completion:v20];
}

uint64_t __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke_336(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "uniqueIdentifier", (void)v15);
        int v12 = [v11 hasPrefix:*(void *)(a1 + 32)];

        if (v12)
        {
          long long v13 = [v10 uniqueIdentifier];
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    [*(id *)(a1 + 40) _dismissFollowUpWithIdentifiers:v4 completion:*(void *)(a1 + 56)];
  }
  else
  {
    long long v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke_336_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)pendingFollowUpsForAccount:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1304, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1305, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to fetch follow up item for account : %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__4;
  id v23 = __Block_byref_object_dispose__4;
  id v24 = [(AAFollowUpController *)self _followUpController];
  id v11 = *(void **)(*((void *)&buf + 1) + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke;
  void v16[3] = &unk_1E5A48E60;
  p_long long buf = &buf;
  id v12 = v9;
  id v18 = v12;
  id v13 = v7;
  id v17 = v13;
  [v11 pendingFollowUpItemsWithCompletion:v16];

  _Block_object_dispose(&buf, 8);
}

void __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  if (!v5 || v6)
  {
    id v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke_337;
    v14[3] = &unk_1E5A48E38;
    id v15 = *(id *)(a1 + 32);
    id v9 = [v5 indexesOfObjectsPassingTest:v14];
    if ([v9 count])
    {
      id v10 = [v5 objectsAtIndexes:v9];
      id v11 = _AALogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138477827;
        id v17 = v10;
        _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Successfully fetched follow up: %{private}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v13 = _AALogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke_cold_2();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke_337(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:AAFollowUpUserInfoAccountIdentifier[0]];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    uint64_t v6 = [v4 isEqualToString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_dismissFollowUpWithIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1349, @"Invalid parameter not satisfying: %@", @"uniqueIdentifiers" object file lineNumber description];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__AAFollowUpController_Convenience___dismissFollowUpWithIdentifiers_completion___block_invoke;
  void v18[3] = &unk_1E5A48DE8;
  id v9 = v8;
  id v19 = v9;
  id v10 = (void *)MEMORY[0x1A622F430](v18);
  id v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to clear follow up item with identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__4;
  id v23 = __Block_byref_object_dispose__4;
  id v24 = [(AAFollowUpController *)self _followUpController];
  id v12 = *(void **)(*((void *)&buf + 1) + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __80__AAFollowUpController_Convenience___dismissFollowUpWithIdentifiers_completion___block_invoke_341;
  v15[3] = &unk_1E5A48E10;
  p_long long buf = &buf;
  id v13 = v10;
  id v16 = v13;
  [v12 clearPendingFollowUpItemsWithUniqueIdentifiers:v7 completion:v15];

  _Block_object_dispose(&buf, 8);
}

uint64_t __80__AAFollowUpController_Convenience___dismissFollowUpWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __80__AAFollowUpController_Convenience___dismissFollowUpWithIdentifiers_completion___block_invoke_341(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  id v8 = _AALogSystem();
  id v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Successfully cleared follow up item!", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke_286_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isRenewCredentialsCFUPosted
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to fetch pending RenewCredentials CFU", buf, 2u);
  }

  uint64_t v4 = [(AAFollowUpController *)self _followUpController];
  id v18 = 0;
  id v5 = [v4 pendingFollowUpItems:&v18];
  id v6 = v18;

  if (!v5 || v6)
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController(Convenience) isRenewCredentialsCFUPosted]();
    }
    LOBYTE(v8) = 0;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = ((char *)i + 1))
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = AAFollowUpIdentifierRenewCredentials[0];
          id v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "typeIdentifier", (void)v14);
          LODWORD(v11) = [(__CFString *)v11 isEqualToString:v12];

          if (v11)
          {
            id v8 = _AALogSystem();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Found Renew Credentials CFU posted", buf, 2u);
            }

            LOBYTE(v8) = 1;
            goto LABEL_20;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
LABEL_20:

  return (char)v8;
}

- (double)ageOfOldestCustodianCFU
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = objc_msgSend(v3, "initWithObjects:", AAFollowUpIdentifierCustodianRemoved[0], 0);
  v11[0] = AAFollowUpIdentifierCustodianWalrusNoLiveness[0];
  v11[1] = AAFollowUpIdentifierCustodianWalrusRemoved[0];
  v11[2] = AAFollowUpIdentifierWalrusUserRecoveryFactorsMissing[0];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  [v4 addObjectsFromArray:v5];

  id v6 = [(AAFollowUpController *)self creationDateOfOldestFollowUpWithIdentifiers:v4];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] now];
    [v7 timeIntervalSinceDate:v6];
    double v9 = v8;
  }
  else
  {
    double v9 = -1.0;
  }

  return v9;
}

- (id)creationDateOfOldestFollowUpWithIdentifiers:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AAFollowUpController(Convenience) creationDateOfOldestFollowUpWithIdentifiers:]();
  }

  id v6 = [(AAFollowUpController *)self _followUpController];
  id v36 = 0;
  id v7 = [v6 pendingFollowUpItems:&v36];
  id v8 = v36;
  double v9 = v8;
  if (!v7 || v8)
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController(Convenience) creationDateOfOldestFollowUpWithIdentifiers:]();
    }
    id v28 = 0;
  }
  else
  {
    uint64_t v31 = v6;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v30 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v18 = [v17 uniqueIdentifier];
          int v19 = [v4 containsObject:v18];

          if (v19)
          {
            [v10 addObject:v17];
            uint64_t v20 = [v17 notification];
            uint64_t v21 = [v20 creationDate];

            if (v21)
            {
              id v22 = [v17 notification];
              id v23 = [v22 creationDate];
              [v11 addObject:v23];
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v43 count:16];
      }
      while (v14);
    }

    uint64_t v24 = [v11 count];
    uint64_t v25 = _AALogSystem();
    id v26 = v25;
    if (v24)
    {
      id v6 = v31;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [v10 count];
        *(_DWORD *)long long buf = 134218499;
        uint64_t v38 = v27;
        __int16 v39 = 2113;
        v40 = v10;
        __int16 v41 = 2112;
        id v42 = v11;
        _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "Successfully found %lu CFUs: %{private}@ and dates: %@", buf, 0x20u);
      }

      id v26 = [v11 sortedArrayUsingSelector:sel_compare_];
      id v28 = [v26 firstObject];
    }
    else
    {
      id v6 = v31;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[AAFollowUpController(Convenience) creationDateOfOldestFollowUpWithIdentifiers:]();
      }
      id v28 = 0;
    }
    double v9 = 0;
    id v7 = v30;
  }

  return v28;
}

- (void)pendingFollowUpItemUserInfosWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1461, @"Invalid parameter not satisfying: %@", @"followUpIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1462, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v19 = v7;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to fetch user info of follow up item with identifier: %{public}@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __91__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5A48F20;
  id v16 = v7;
  id v17 = v9;
  id v11 = v9;
  id v12 = v7;
  [(AAFollowUpController *)self _pendingFollowUpItemsWithIdentifier:v12 forAccount:0 completion:v15];
}

void __91__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    id v7 = objc_msgSend(v5, "aaf_map:", &__block_literal_global_10);
    id v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138477827;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched user infos of pending follow ups: %{private}@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
    }
  }
  else
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __91__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier_completion___block_invoke_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
    }
  }
}

uint64_t __91__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier_completion___block_invoke_344(uint64_t a1, void *a2)
{
  return [a2 userInfo];
}

- (id)pendingFollowUpItemUserInfosWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1486, @"Invalid parameter not satisfying: %@", @"followUpIdentifier" object file lineNumber description];
  }
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v14 = v5;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to fetch user info of follow up item with identifier: %{public}@", buf, 0xCu);
  }

  id v7 = [(AAFollowUpController *)self _pendingFollowUpItemsWithIdentifier:v5 forAccount:0];
  id v8 = v7;
  if (v7 && [v7 count])
  {
    uint64_t v9 = objc_msgSend(v8, "aaf_map:", &__block_literal_global_347);
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138477827;
      id v14 = v9;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Successfully fetched user infos of pending follow ups: %{private}@", buf, 0xCu);
    }
  }
  else
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController(Convenience) pendingFollowUpItemUserInfosWithIdentifier:]();
    }
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __80__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userInfo];
}

- (id)_pendingFollowUpItemsWithIdentifier:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AAFollowUpController(Convenience) _pendingFollowUpItemsWithIdentifier:forAccount:]();
  }

  uint64_t v9 = [(AAFollowUpController *)self _followUpController];
  uint64_t v14 = 0;
  id v10 = [v9 pendingFollowUpItems:&v14];

  if (v10 && [v10 count])
  {
    uint64_t v11 = [(AAFollowUpController *)self _filterFollowUpItems:v10 byIdentifier:v6 byAccount:v7];
  }
  else
  {
    int v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController(Convenience) _pendingFollowUpItemsWithIdentifier:forAccount:]();
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (void)_pendingFollowUpItemsWithIdentifier:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"AAFollowUpController.m", 1534, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  int v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to fetch follow up items with identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__4;
  id v26 = __Block_byref_object_dispose__4;
  id v27 = [(AAFollowUpController *)self _followUpController];
  uint64_t v13 = *(void **)(*((void *)&buf + 1) + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95__AAFollowUpController_Convenience___pendingFollowUpItemsWithIdentifier_forAccount_completion___block_invoke;
  void v18[3] = &unk_1E5A48F48;
  p_long long buf = &buf;
  id v14 = v11;
  id v21 = v14;
  void v18[4] = self;
  id v15 = v9;
  id v19 = v15;
  id v16 = v10;
  id v20 = v16;
  [v13 pendingFollowUpItemsWithCompletion:v18];

  _Block_object_dispose(&buf, 8);
}

void __95__AAFollowUpController_Convenience___pendingFollowUpItemsWithIdentifier_forAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  if (v5 && !v6 && [v5 count])
  {
    id v9 = [*(id *)(a1 + 32) _filterFollowUpItems:v5 byIdentifier:*(void *)(a1 + 40) byAccount:*(void *)(a1 + 48)];
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138477827;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Successfully fetched follow ups: %{private}@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (id)_filterFollowUpItems:(id)a3 byIdentifier:(id)a4 byAccount:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7 || ![v7 count])
  {
    id v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AAFollowUpController(Convenience) _pendingFollowUpItemsWithIdentifier:forAccount:]();
    }
    id v10 = 0;
    goto LABEL_11;
  }
  if (!v8)
  {
    id v10 = 0;
    if (!v9) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__AAFollowUpController_Convenience___filterFollowUpItems_byIdentifier_byAccount___block_invoke;
  void v16[3] = &unk_1E5A48F70;
  id v17 = v8;
  id v10 = objc_msgSend(v7, "aaf_filter:", v16);

  if (v9)
  {
LABEL_10:
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__AAFollowUpController_Convenience___filterFollowUpItems_byIdentifier_byAccount___block_invoke_2;
    v14[3] = &unk_1E5A48F70;
    id v15 = v9;
    uint64_t v12 = objc_msgSend(v10, "aaf_filter:", v14);

    id v11 = v15;
    id v10 = (void *)v12;
LABEL_11:
  }
LABEL_12:

  return v10;
}

uint64_t __81__AAFollowUpController_Convenience___filterFollowUpItems_byIdentifier_byAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __81__AAFollowUpController_Convenience___filterFollowUpItems_byIdentifier_byAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:AAFollowUpUserInfoAccountIdentifier[0]];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    uint64_t v6 = [v4 isEqualToString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_followUpItemForCustodianInvitationReminder:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 userInfo];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A11D8000, v2, v3, "Primary action, userInfo: %@", v4, v5, v6, v7, v8);
}

- (void)_followUpItemForBeneficiaryRemoved:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A11D8000, v2, v3, "Beneficiary FollowUp Item - %@", v4, v5, v6, v7, v8);
}

- (void)_followUpItemForCustodianEmbargo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Asked to create custodian FollowUp without userInfo, Aborting ...", v2, v3, v4, v5, v6);
}

- (void)_followUpItemForCustodianEmbargo:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "Creating FollowUp for custodian embargo with userInfo dictionary: %@", v2, v3, v4, v5, v6);
}

- (void)_followUpForRecoveryKeyHealingWithContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Asked to create Recovery Key Mismatch FollowUp without userInfo, Aborting ...", v2, v3, v4, v5, v6);
}

- (void)_recoveryNotificationWithInfo:type:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Custodian Followup userInfo did not contain title for notification, Aborting ...", v2, v3, v4, v5, v6);
}

- (void)_recoveryNotificationWithInfo:type:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Custodian Followup userInfo did not contain message for notification, Aborting ...", v2, v3, v4, v5, v6);
}

- (void)_shouldPostRenewFollowup:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Follow up requested but Missing accountIdentifier in follow up user info!", v2, v3, v4, v5, v6);
}

- (void)postFollowUpWithIdentifier:userInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Unknown follow up identifier '%{public}@', bailing!", v2, v3, v4, v5, v6);
}

- (void)postFollowUpWithIdentifier:userInfo:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Couldn't find matching account for renewCredentials followup.", v2, v3, v4, v5, v6);
}

void __71__AAFollowUpController_postFollowUpWithIdentifier_userInfo_completion___block_invoke_279_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to post follow up item with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)postFollowUpWithIdentifier:userInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to post follow up item with error: %{public}@", v2, v3, v4, v5, v6);
}

void __65__AAFollowUpController_pendingFollowUpWithIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch pending follow up items, error: %{public}@", v2, v3, v4, v5, v6);
}

void __65__AAFollowUpController_dismissFollowUpWithIdentifier_completion___block_invoke_286_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to clear follow up item with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)dismissFollowUpWithIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to clear follow up item with error: %{public}@", v2, v3, v4, v5, v6);
}

void __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_333_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "No pending follow ups with identifier %@, nothing to do...", v2, v3, v4, v5, v6);
}

void __89__AAFollowUpController_Convenience__dismissFollowUpWithIdentifier_forAccount_completion___block_invoke_333_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "Pending follow up is for alternate account, ignoring...", v2, v3, v4, v5, v6);
}

void __101__AAFollowUpController_Convenience__dismissFollowUpsStartingWithIdentifierPrefix_account_completion___block_invoke_336_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "No follow ups to delete for account: %@", v2, v3, v4, v5, v6);
}

void __75__AAFollowUpController_Convenience__pendingFollowUpsForAccount_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "No follow ups found for account : %{public}@", v2, v3, v4, v5, v6);
}

void __91__AAFollowUpController_Convenience__pendingFollowUpItemUserInfosWithIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch pending follow ups with Identifieer: %{public}@", v2, v3, v4, v5, v6);
}

@end