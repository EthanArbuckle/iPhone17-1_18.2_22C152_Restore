@interface CDPDFollowUpFactory
+ (id)contextToIdentifierMap;
- (BOOL)_isBiometricAuthEnrolled;
- (BOOL)_isBiometricAuthEnrolledWithLAEnvironment:(id)a3;
- (BOOL)_isBiometricCapable;
- (BOOL)_isManateeAvailable;
- (BOOL)_isManateeAvailableForAltDSID:(id)a3;
- (BOOL)_isWalrusEnabled;
- (BOOL)_supportsFaceID;
- (LAEnvironment)currentUser;
- (id)_adpStateHealingFollowUpAction;
- (id)_baseFollowUpItemWithContext:(id)a3;
- (id)_baseFollowUpNotificationWithContext:(id)a3;
- (id)_confirmExistingSecretFollowUpAction;
- (id)_createPasscodeDismissNoteFollowUpAction;
- (id)_createPasscodeFollowUpAction;
- (id)_createPasscodeNoteFollowUpAction;
- (id)_deviceCapabilityProvider;
- (id)_followUpActionForRecoveryKeyRepair;
- (id)_followUpForADPStateHealingWithContext:(id)a3;
- (id)_followUpForConfirmExistingSecretWithContext:(id)a3;
- (id)_followUpForOfflineSecretChangeWithContext:(id)a3;
- (id)_followUpForRecoveryKeyRepairWithContext:(id)a3;
- (id)_followUpForRepairWithContext:(id)a3;
- (id)_followUpForSecureTermsWithContext:(id)a3;
- (id)_followUpForSettingUpBiometricsWithContext:(id)a3;
- (id)_followUpItemForEDPOnlyRepairWithContext:(id)a3;
- (id)_followUpItemForRecoveryKeyMismatchHealing:(id)a3;
- (id)_followUpItemForSOSCompatibilityMode:(id)a3;
- (id)_followUpItemForWalrusCreatePasscodeWithContext:(id)a3;
- (id)_localizedStringForKey:(id)a3;
- (id)_offlineSecretChangeFollowUpAction;
- (id)_secureTermsFollowUpAction;
- (id)followUpItemWithContext:(id)a3;
- (id)identifierForContext:(id)a3;
- (unint64_t)secretType;
- (void)_configureConfirmExistingSecretFollowUpItem:(id)a3;
- (void)_configureRepairFollowUpItem:(id)a3;
- (void)_configureWalrusRepairFollowUpItem:(id)a3;
- (void)_isManateeAvailable;
- (void)_isWalrusEnabled;
- (void)setCurrentUser:(id)a3;
@end

@implementation CDPDFollowUpFactory

+ (id)contextToIdentifierMap
{
  if (contextToIdentifierMap_onceToken != -1) {
    dispatch_once(&contextToIdentifierMap_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)contextToIdentifierMap_contextMap;
  return v2;
}

void __45__CDPDFollowUpFactory_contextToIdentifierMap__block_invoke()
{
  v10[13] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F25690];
  uint64_t v1 = *MEMORY[0x263F342E8];
  v9[0] = *MEMORY[0x263F34318];
  v9[1] = v1;
  v10[0] = v0;
  v10[1] = @"OfflineLocalSecretChange";
  uint64_t v2 = *MEMORY[0x263F34308];
  v9[2] = *MEMORY[0x263F342F8];
  v9[3] = v2;
  v10[2] = @"RegenerateCDPRecoveryKey";
  v10[3] = @"com.apple.purplebuddy.revisitSkippedSteps";
  uint64_t v3 = *MEMORY[0x263F342D8];
  v9[4] = *MEMORY[0x263F34300];
  v9[5] = v3;
  v10[4] = @"SecureTerms";
  v10[5] = @"ConfirmExistingSecret";
  uint64_t v4 = *MEMORY[0x263F34310];
  v9[6] = *MEMORY[0x263F34320];
  v9[7] = v4;
  v10[6] = @"OfflineLocalSecretChange";
  v10[7] = @"SOSCompatibilityMode";
  uint64_t v5 = *MEMORY[0x263F342C8];
  v9[8] = *MEMORY[0x263F342F0];
  v9[9] = v5;
  v10[8] = @"com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch";
  v10[9] = @"adpUpsell";
  uint64_t v6 = *MEMORY[0x263F342E0];
  v9[10] = *MEMORY[0x263F342C0];
  v9[11] = v6;
  v10[10] = @"com.apple.CDPFollowUpIdentifier.adpStateHealing";
  v10[11] = @"edpOnlyRepair";
  v9[12] = *MEMORY[0x263F342D0];
  v10[12] = v0;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:13];
  v8 = (void *)contextToIdentifierMap_contextMap;
  contextToIdentifierMap_contextMap = v7;
}

- (id)identifierForContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 followUpType];

  if (v4)
  {
    uint64_t v5 = [(id)objc_opt_class() contextToIdentifierMap];
    uint64_t v6 = [v3 followUpType];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)followUpItemWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 followUpType];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F34318]];

  if (v6)
  {
LABEL_2:
    uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpForRepairWithContext:v4];
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_9;
  }
  v9 = (void *)MEMORY[0x263F34328];
  v10 = [v4 altDSID];
  LODWORD(v9) = [v9 checkIfAltDSIDIsBeneficiary:v10];

  if (v9)
  {
    v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CDPDFollowUpFactory followUpItemWithContext:]();
    }
  }
  else
  {
    v13 = [v4 followUpType];
    int v14 = [v13 isEqualToString:*MEMORY[0x263F342E8]];

    if (v14)
    {
      uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpForOfflineSecretChangeWithContext:v4];
      goto LABEL_3;
    }
    v15 = [v4 followUpType];
    int v16 = [v15 isEqualToString:*MEMORY[0x263F342F8]];

    if (v16)
    {
      uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpForRecoveryKeyRepairWithContext:v4];
      goto LABEL_3;
    }
    v17 = [v4 followUpType];
    int v18 = [v17 isEqualToString:*MEMORY[0x263F34308]];

    if (v18)
    {
      uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpForSettingUpBiometricsWithContext:v4];
      goto LABEL_3;
    }
    v19 = [v4 followUpType];
    int v20 = [v19 isEqualToString:*MEMORY[0x263F34300]];

    if (v20)
    {
      uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpForSecureTermsWithContext:v4];
      goto LABEL_3;
    }
    v21 = [v4 followUpType];
    int v22 = [v21 isEqualToString:*MEMORY[0x263F342D8]];

    if (v22)
    {
      uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpForConfirmExistingSecretWithContext:v4];
      goto LABEL_3;
    }
    v23 = [v4 followUpType];
    int v24 = [v23 isEqualToString:*MEMORY[0x263F34320]];

    if (v24)
    {
      uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpItemForWalrusCreatePasscodeWithContext:v4];
      goto LABEL_3;
    }
    v25 = [v4 followUpType];
    int v26 = [v25 isEqualToString:*MEMORY[0x263F34310]];

    if (v26)
    {
      uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpItemForSOSCompatibilityMode:v4];
      goto LABEL_3;
    }
    v27 = [v4 followUpType];
    int v28 = [v27 isEqualToString:*MEMORY[0x263F342F0]];

    if (v28)
    {
      uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpItemForRecoveryKeyMismatchHealing:v4];
      goto LABEL_3;
    }
    v29 = [v4 followUpType];
    int v30 = [v29 isEqualToString:*MEMORY[0x263F342C0]];

    if (v30)
    {
      uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpForADPStateHealingWithContext:v4];
      goto LABEL_3;
    }
    v31 = [v4 followUpType];
    int v32 = [v31 isEqualToString:*MEMORY[0x263F342E0]];

    if (v32)
    {
      v33 = _CDPLogSystem();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[CDPDFollowUpFactory followUpItemWithContext:]();
      }

      uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpItemForEDPOnlyRepairWithContext:v4];
      goto LABEL_3;
    }
    v34 = [v4 followUpType];
    int v35 = [v34 isEqualToString:*MEMORY[0x263F342D0]];

    if (v35)
    {
      v36 = _CDPLogSystem();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[CDPDFollowUpFactory followUpItemWithContext:]();
      }

      goto LABEL_2;
    }
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (id)_followUpForOfflineSecretChangeWithContext:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = [(CDPDFollowUpFactory *)self _baseFollowUpItemWithContext:a3];
  int v32 = [(CDPDFollowUpFactory *)self _offlineSecretChangeFollowUpAction];
  v33[0] = v32;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  [v4 setActions:v5];

  int v6 = [v4 notification];
  uint64_t v7 = [(CDPDFollowUpFactory *)self _offlineSecretChangeFollowUpAction];
  [v6 setActivateAction:v7];

  [v6 setFirstNotificationDelay:0.0];
  v8 = [MEMORY[0x263F343B8] builderForKey:@"CONFIRM_NEW_SECRET_FOLLOWUP_ITEM_TITLE"];
  v9 = [MEMORY[0x263F343A8] sharedInstance];
  v10 = [v9 deviceClass];
  v11 = [v8 addDeviceClass:v10];
  v12 = objc_msgSend(v11, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
  v13 = [v12 localizedString];
  [v4 setTitle:v13];

  int v14 = [MEMORY[0x263F343B8] builderForKey:@"CONFIRM_NEW_SECRET_FOLLOWUP_ITEM_INFORMATIVE"];
  v15 = [MEMORY[0x263F343A8] sharedInstance];
  int v16 = [v15 deviceClass];
  v17 = [v14 addDeviceClass:v16];
  int v18 = [v17 localizedString];
  [v4 setInformativeText:v18];

  v19 = [MEMORY[0x263F343B8] builderForKey:@"CONFIRM_NEW_SECRET_FOLLOWUP_NOTIFICATION_TITLE"];
  int v20 = [MEMORY[0x263F343A8] sharedInstance];
  v21 = [v20 deviceClass];
  int v22 = [v19 addDeviceClass:v21];
  v23 = objc_msgSend(v22, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
  int v24 = [v23 localizedString];
  [v6 setTitle:v24];

  v25 = [MEMORY[0x263F343B8] builderForKey:@"CONFIRM_NEW_SECRET_FOLLOWUP_NOTIFICATION_INFORMATIVE"];
  int v26 = [MEMORY[0x263F343A8] sharedInstance];
  v27 = [v26 deviceClass];
  int v28 = [v25 addDeviceClass:v27];
  v29 = objc_msgSend(v28, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
  int v30 = [v29 localizedString];
  [v6 setInformativeText:v30];

  return v4;
}

- (id)_offlineSecretChangeFollowUpAction
{
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  id v3 = [MEMORY[0x263F343B8] builderForKey:@"CONFIRM_NEW_SECRET_FOLLOWUP_NOTIFICATION_ACTIVATE_LABEL"];
  id v4 = [v3 localizedString];
  [v2 setLabel:v4];

  [v2 setIdentifier:@"com.apple.cdp.offlinesecret.continue"];
  return v2;
}

- (id)_followUpForSecureTermsWithContext:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = [(CDPDFollowUpFactory *)self _baseFollowUpItemWithContext:a3];
  v23 = [(CDPDFollowUpFactory *)self _secureTermsFollowUpAction];
  v24[0] = v23;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  [v4 setActions:v5];

  int v6 = [v4 notification];
  uint64_t v7 = [(CDPDFollowUpFactory *)self _secureTermsFollowUpAction];
  [v6 setActivateAction:v7];

  [v6 setFirstNotificationDelay:0.0];
  v8 = [MEMORY[0x263F343B8] builderForKey:@"SECURE_TERMS_FOLLOWUP_ITEM_TITLE"];
  v9 = [v8 localizedString];
  [v4 setTitle:v9];

  v10 = [MEMORY[0x263F343B8] builderForKey:@"SECURE_TERMS_FOLLOWUP_ITEM_INFORMATIVE"];
  v11 = [MEMORY[0x263F343A8] sharedInstance];
  v12 = [v11 deviceClass];
  v13 = [v10 addDeviceClass:v12];
  int v14 = [v13 localizedString];
  [v4 setInformativeText:v14];

  v15 = [MEMORY[0x263F343B8] builderForKey:@"SECURE_TERMS_FOLLOWUP_ITEM_TITLE"];
  int v16 = [v15 localizedString];
  [v6 setTitle:v16];

  v17 = [MEMORY[0x263F343B8] builderForKey:@"SECURE_TERMS_FOLLOWUP_NOTIFICATION_INFORMATIVE"];
  int v18 = [MEMORY[0x263F343A8] sharedInstance];
  v19 = [v18 deviceClass];
  int v20 = [v17 addDeviceClass:v19];
  v21 = [v20 localizedString];
  [v6 setInformativeText:v21];

  return v4;
}

- (id)_secureTermsFollowUpAction
{
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  id v3 = [MEMORY[0x263F343B8] builderForKey:@"SECURE_TERMS_FOLLOWUP_NOTIFICATION_ACTIVATE_LABEL"];
  id v4 = [v3 localizedString];
  [v2 setLabel:v4];

  [v2 setIdentifier:@"com.apple.cdp.secureterms.continue"];
  return v2;
}

- (id)_followUpForConfirmExistingSecretWithContext:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = [(CDPDFollowUpFactory *)self _baseFollowUpItemWithContext:a3];
  uint64_t v5 = [(CDPDFollowUpFactory *)self _confirmExistingSecretFollowUpAction];
  v10[0] = v5;
  int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v4 setActions:v6];

  uint64_t v7 = [v4 notification];
  v8 = [(CDPDFollowUpFactory *)self _confirmExistingSecretFollowUpAction];
  [v7 setActivateAction:v8];

  [v7 setFirstNotificationDelay:0.0];
  [(CDPDFollowUpFactory *)self _configureConfirmExistingSecretFollowUpItem:v4];

  return v4;
}

- (id)_confirmExistingSecretFollowUpAction
{
  id v3 = objc_alloc_init(MEMORY[0x263F35378]);
  if ([(CDPDFollowUpFactory *)self _isWalrusEnabled]) {
    [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_VERIFY_PASSCODE" inTable:@"Localizable-Walrus"];
  }
  else {
  id v4 = [MEMORY[0x263F343B8] builderForKey:@"CONFIRM_EXISTING_SECRET_FOLLOWUP_NOTIFICATION_ACTIVATE_LABEL"];
  }
  uint64_t v5 = [v4 localizedString];
  [v3 setLabel:v5];

  [v3 setIdentifier:@"com.apple.cdp.confirmexistingsecret.continue"];
  return v3;
}

- (void)_configureConfirmExistingSecretFollowUpItem:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 notification];
  uint64_t v5 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_VERIFY_PASSCODE_TITLE" inTable:@"Localizable-Walrus"];
  int v6 = [v5 localizedString];
  [v3 setTitle:v6];

  uint64_t v7 = (void *)MEMORY[0x263F343B8];
  v8 = @"FOLLOWUP_VERIFY_PASSCODE_MESSAGE";
  if (([@"FOLLOWUP_VERIFY_PASSCODE_MESSAGE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v9 = 0;
  }
  else
  {
    v8 = [@"FOLLOWUP_VERIFY_PASSCODE_MESSAGE" stringByAppendingString:@"_REBRAND"];
    int v9 = 1;
  }
  v10 = [v7 builderForKey:v8 inTable:@"Localizable-Walrus"];
  v11 = [v10 localizedString];
  [v3 setInformativeText:v11];

  if (v9) {
  v12 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_VERIFY_PASSCODE_NOTIFICATION_TITLE" inTable:@"Localizable-Walrus"];
  }
  v13 = [v12 localizedString];
  [v4 setTitle:v13];

  int v14 = (void *)MEMORY[0x263F343B8];
  v15 = @"FOLLOWUP_VERIFY_PASSCODE_NOTIFICATION_MESSAGE";
  if (([@"FOLLOWUP_VERIFY_PASSCODE_NOTIFICATION_MESSAGE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v16 = 0;
  }
  else
  {
    v15 = [@"FOLLOWUP_VERIFY_PASSCODE_NOTIFICATION_MESSAGE" stringByAppendingString:@"_REBRAND"];
    int v16 = 1;
  }
  v17 = [v14 builderForKey:v15 inTable:@"Localizable-Walrus"];
  int v18 = [v17 localizedString];
  [v4 setInformativeText:v18];

  if (v16) {
  v19 = [v4 options];
  }
  uint64_t v20 = *MEMORY[0x263F35320];
  v23[0] = *MEMORY[0x263F35330];
  v23[1] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  int v22 = [v19 setByAddingObjectsFromArray:v21];
  [v4 setOptions:v22];
}

- (id)_followUpItemForWalrusCreatePasscodeWithContext:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = [(CDPDFollowUpFactory *)self _baseFollowUpItemWithContext:a3];
  uint64_t v5 = [(CDPDFollowUpFactory *)self _createPasscodeFollowUpAction];
  v23[0] = v5;
  int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v4 setActions:v6];

  uint64_t v7 = [v4 notification];
  v8 = [(CDPDFollowUpFactory *)self _createPasscodeNoteFollowUpAction];
  [v7 setActivateAction:v8];

  [v7 setFirstNotificationDelay:0.0];
  int v9 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_CREATE_PASSCODE_TITLE" inTable:@"Localizable-Walrus"];
  v10 = [v9 localizedString];
  [v4 setTitle:v10];

  v11 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_CREATE_PASSCODE_MESSAGE" inTable:@"Localizable-Walrus"];
  v12 = [v11 localizedString];
  [v4 setInformativeText:v12];

  v13 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_CREATE_PASSCODE_NOTIFICATION_TITLE" inTable:@"Localizable-Walrus"];
  int v14 = [v13 localizedString];
  [v7 setTitle:v14];

  v15 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_CREATE_PASSCODE_NOTIFICATION_MESSAGE" inTable:@"Localizable-Walrus"];
  int v16 = [v15 localizedString];
  [v7 setInformativeText:v16];

  v17 = [v7 options];
  uint64_t v18 = *MEMORY[0x263F35320];
  v22[0] = *MEMORY[0x263F35330];
  v22[1] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  uint64_t v20 = [v17 setByAddingObjectsFromArray:v19];
  [v7 setOptions:v20];

  return v4;
}

- (id)_followUpItemForSOSCompatibilityMode:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = [(CDPDFollowUpFactory *)self _baseFollowUpItemWithContext:a3];
  id v4 = objc_alloc_init(MEMORY[0x263F35378]);
  uint64_t v5 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_SOS_COMPATIBILITY_BUTTON_PRIMARY"];
  int v6 = [v5 localizedString];
  [v4 setLabel:v6];

  [v4 setIdentifier:@"com.apple.cdp.sos.compatibility.enabled.continue"];
  v21[0] = v4;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  [v3 setActions:v7];

  v8 = [v3 notification];
  [v8 setFirstNotificationDelay:0.0];
  int v9 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_SOS_COMPATIBILITY_TITLE"];
  v10 = [v9 localizedString];
  [v3 setTitle:v10];

  v11 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_SOS_COMPATIBILITY_MESSAGE"];
  v12 = [MEMORY[0x263F343A8] sharedInstance];
  v13 = [v12 deviceClass];
  int v14 = [v11 addDeviceClass:v13];
  v15 = [v14 localizedString];
  [v3 setInformativeText:v15];

  int v16 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_SOS_COMPATIBILITY_NOTIFICATION_TITLE"];
  v17 = [v16 localizedString];
  [v8 setTitle:v17];

  uint64_t v18 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_SOS_COMPATIBILITY_NOTIFICATION_MESSAGE"];
  v19 = [v18 localizedString];
  [v8 setInformativeText:v19];

  return v3;
}

- (id)_followUpItemForRecoveryKeyMismatchHealing:(id)a3
{
  id v4 = [a3 altDSID];
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263F34328] sharedInstance];
    id v4 = [v5 primaryAccountAltDSID];
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CDPDFollowUpFactory _isWalrusEnabled](self, "_isWalrusEnabled"));
  [v6 setObject:v7 forKeyedSubscript:@"hasWalrusEnabled"];

  v8 = objc_alloc_init(CDPDAccount);
  int v9 = objc_msgSend(NSNumber, "numberWithBool:", -[CDPDAccount recoveryContactCountForAltDSID:](v8, "recoveryContactCountForAltDSID:", v4) != 0);
  [v6 setObject:v9 forKeyedSubscript:@"hasRecoveryContact"];

  [v6 setObject:v4 forKeyedSubscript:*MEMORY[0x263F256B0]];
  v10 = [MEMORY[0x263F34328] appleAccountForAltDSID:v4];
  v11 = [v10 identifier];
  [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x263F256A8]];

  id v12 = objc_alloc_init(MEMORY[0x263F25868]);
  v13 = [v12 followUpItemForIdentifier:@"com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch" userInfo:v6];

  return v13;
}

- (id)_createPasscodeFollowUpAction
{
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  id v3 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_CREATE_PASSCODE" inTable:@"Localizable-Walrus"];
  id v4 = [v3 localizedString];
  [v2 setLabel:v4];

  [v2 setIdentifier:@"com.apple.cdp.offlinesecretcreate.continue"];
  return v2;
}

- (id)_createPasscodeNoteFollowUpAction
{
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  id v3 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_CREATE_PASSCODE_BUTTON_PRIMARY" inTable:@"Localizable-Walrus"];
  id v4 = [v3 localizedString];
  [v2 setLabel:v4];

  [v2 setIdentifier:@"com.apple.cdp.offlinesecretcreate.continue"];
  return v2;
}

- (id)_createPasscodeDismissNoteFollowUpAction
{
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  id v3 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_VERIFY_PASSCODE_BUTTON_DISMISS" inTable:@"Localizable-Walrus"];
  id v4 = [v3 localizedString];
  [v2 setLabel:v4];

  [v2 setIdentifier:@"com.apple.cdp.dismissfollowup"];
  return v2;
}

- (id)_followUpForRepairWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 altDSID];
  if (v5
    && (id v6 = (void *)v5,
        uint64_t v7 = (void *)MEMORY[0x263F34328],
        [v4 altDSID],
        v8 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = [v7 checkIfAltDSIDIsBeneficiary:v8],
        v8,
        v6,
        v7))
  {
    int v9 = [v4 altDSID];
    BOOL v10 = [(CDPDFollowUpFactory *)self _isManateeAvailableForAltDSID:v9];

    if (v10)
    {
      v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      goto LABEL_10;
    }
  }
  else
  {
    id v12 = [MEMORY[0x263F34328] sharedInstance];
    int v13 = [v12 primaryAccountIsBeneficiary];

    if (v13 && [(CDPDFollowUpFactory *)self _isManateeAvailable])
    {
      v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
LABEL_9:
      }
        -[CDPDFollowUpFactory _followUpForRepairWithContext:]();
LABEL_10:

      int v14 = 0;
      goto LABEL_22;
    }
  }
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v16 = [v4 altDSID];
  if (!v16)
  {
    v17 = [MEMORY[0x263F34328] sharedInstance];
    int v16 = [v17 primaryAccountAltDSID];
  }
  [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x263F256B0]];
  uint64_t v18 = [MEMORY[0x263F34328] appleAccountForAltDSID:v16];
  v19 = [v18 identifier];
  [v15 setObject:v19 forKeyedSubscript:*MEMORY[0x263F256A8]];

  id v20 = objc_alloc_init(MEMORY[0x263F25868]);
  int v14 = [v20 followUpItemForIdentifier:*MEMORY[0x263F25690] userInfo:v15];

  v21 = [(CDPDFollowUpFactory *)self _baseFollowUpNotificationWithContext:v4];
  [v14 setNotification:v21];

  int v22 = [v14 actions];
  v23 = [v22 firstObject];

  int v24 = [v23 identifier];
  v25 = (void *)*MEMORY[0x263F25660];

  if (v24 == v25)
  {
    [v4 repairType];
    int v26 = CDPLocalizedString();
    [v23 setLabel:v26];
  }
  v27 = [v14 notification];
  [v27 setActivateAction:v23];
  uint64_t v28 = [v4 repairType];
  if (v28 == 3)
  {
LABEL_19:
    [(CDPDFollowUpFactory *)self _configureWalrusRepairFollowUpItem:v14];
    goto LABEL_21;
  }
  if (v28 != 1)
  {
    if (![(CDPDFollowUpFactory *)self _isWalrusEnabled])
    {
      [(CDPDFollowUpFactory *)self _configureRepairFollowUpItem:v14];
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  v29 = [MEMORY[0x263F343B8] builderForKey:@"TRUST_FOLLOWUP_ITEM_TITLE"];
  [v29 localizedString];
  int v30 = v44 = v15;
  [v14 setTitle:v30];

  v31 = [MEMORY[0x263F343B8] builderForKey:@"TRUST_FOLLOWUP_NOTIFICATION_TITLE"];
  int v32 = [v31 localizedString];
  [v27 setTitle:v32];

  v33 = [MEMORY[0x263F343B8] builderForKey:@"TRUST_FOLLOWUP_ITEM_INFORMATIVE"];
  v34 = [MEMORY[0x263F343A8] sharedInstance];
  int v35 = [v34 deviceClass];
  v36 = [v33 addDeviceClass:v35];
  v37 = [v36 localizedString];
  [v14 setInformativeText:v37];

  v38 = [MEMORY[0x263F343B8] builderForKey:@"TRUST_FOLLOWUP_NOTIFICATION_INFORMATIVE"];
  v39 = [MEMORY[0x263F343A8] sharedInstance];
  v40 = [v39 deviceClass];
  v41 = [v38 addDeviceClass:v40];
  v42 = [v41 localizedString];
  [v27 setInformativeText:v42];

  id v15 = v44;
LABEL_21:

LABEL_22:
  return v14;
}

- (void)_configureRepairFollowUpItem:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 notification];
  uint64_t v5 = [MEMORY[0x263F343B8] builderForKey:@"SKIPPED_FOLLOWUP_ITEM_TITLE"];
  id v6 = [v5 localizedString];
  [v3 setTitle:v6];

  uint64_t v7 = [MEMORY[0x263F343B8] builderForKey:@"SKIPPED_FOLLOWUP_ITEM_INFORMATIVE"];
  v8 = [v7 localizedString];
  [v3 setInformativeText:v8];

  int v9 = [MEMORY[0x263F343B8] builderForKey:@"SKIPPED_FOLLOWUP_NOTIFICATION_TITLE"];
  BOOL v10 = [v9 localizedString];
  [v4 setTitle:v10];

  v11 = [MEMORY[0x263F343B8] builderForKey:@"SKIPPED_FOLLOWUP_NOTIFICATION_INFORMATIVE"];
  id v12 = [v11 localizedString];
  [v4 setInformativeText:v12];

  int v13 = [v4 options];
  uint64_t v14 = *MEMORY[0x263F35320];
  v17[0] = *MEMORY[0x263F35330];
  v17[1] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  int v16 = [v13 setByAddingObjectsFromArray:v15];
  [v4 setOptions:v16];
}

- (void)_configureWalrusRepairFollowUpItem:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 notification];
  uint64_t v5 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_JOIN_CDP_TITLE" inTable:@"Localizable-Walrus"];
  id v6 = [v5 localizedString];
  [v3 setTitle:v6];

  uint64_t v7 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_JOIN_CDP_MESSAGE" inTable:@"Localizable-Walrus"];
  v8 = [v7 localizedString];
  [v3 setInformativeText:v8];

  int v9 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_JOIN_CDP_NOTIFICATION_TITLE" inTable:@"Localizable-Walrus"];
  BOOL v10 = [v9 localizedString];
  [v4 setTitle:v10];

  v11 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_JOIN_CDP_NOTIFICATION_MESSAGE" inTable:@"Localizable-Walrus"];
  id v12 = [v11 localizedString];
  [v4 setInformativeText:v12];

  id v13 = objc_alloc_init(MEMORY[0x263F35378]);
  uint64_t v14 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_JOIN_CDP_BUTTON_PRIMARY" inTable:@"Localizable-Walrus"];
  id v15 = [v14 localizedString];
  [v13 setLabel:v15];

  [v4 setActivateAction:v13];
  id v16 = objc_alloc_init(MEMORY[0x263F35378]);
  v17 = [MEMORY[0x263F343B8] builderForKey:@"FOLLOWUP_JOIN_CDP_BUTTON_DISMISS" inTable:@"Localizable-Walrus"];
  uint64_t v18 = [v17 localizedString];
  [v16 setLabel:v18];

  [v4 setClearAction:v16];
  v25[0] = v13;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  [v3 setActions:v19];

  [v3 setDisplayStyle:1];
  id v20 = [v4 options];
  uint64_t v21 = *MEMORY[0x263F35320];
  v24[0] = *MEMORY[0x263F35330];
  v24[1] = v21;
  int v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v23 = [v20 setByAddingObjectsFromArray:v22];
  [v4 setOptions:v23];

  [v4 setFirstNotificationDelay:0.0];
}

- (id)_followUpItemForEDPOnlyRepairWithContext:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v3 = [(CDPDFollowUpFactory *)self _baseFollowUpItemWithContext:a3];
  id v4 = [MEMORY[0x263F343B8] builderForKey:@"EDPONLY_REPAIR_TITLE" inTable:@"Localizable-EDP"];
  uint64_t v5 = [v4 localizedString];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x263F343B8] builderForKey:@"EDPONLY_REPAIR_INFORMATIVE" inTable:@"Localizable-EDP"];
  uint64_t v7 = [v6 localizedString];
  [v3 setInformativeText:v7];

  v8 = [v3 notification];
  int v9 = [MEMORY[0x263F343B8] builderForKey:@"EDPONLY_REPAIR_NOTIFICATION_TITLE" inTable:@"Localizable-EDP"];
  BOOL v10 = [v9 localizedString];
  [v8 setTitle:v10];

  v11 = [MEMORY[0x263F343B8] builderForKey:@"EDPONLY_REPAIR_FOLLOWUP_NOTIFICATION_INFORMATIVE" inTable:@"Localizable-EDP"];
  id v12 = [v11 localizedString];
  [v8 setInformativeText:v12];

  id v13 = objc_alloc_init(MEMORY[0x263F35378]);
  uint64_t v14 = [MEMORY[0x263F343B8] builderForKey:@"EDPONLY_REPAIR_FOLLOWUP_NOTIFICATION_ACTIVATE_LABEL" inTable:@"Localizable-EDP"];
  id v15 = [v14 localizedString];
  [v13 setLabel:v15];

  [v8 setActivateAction:v13];
  id v16 = objc_alloc_init(MEMORY[0x263F35378]);
  v17 = [MEMORY[0x263F343B8] builderForKey:@"EDPONLY_REPAIR_FOLLOWUP_NOTIFICATION_CANCEL_LABEL" inTable:@"Localizable-EDP"];
  uint64_t v18 = [v17 localizedString];
  [v16 setLabel:v18];

  [v16 setIdentifier:@"com.apple.cdp.dismissfollowup"];
  [v8 setClearAction:v16];
  id v19 = objc_alloc_init(MEMORY[0x263F35378]);
  id v20 = [MEMORY[0x263F343B8] builderForKey:@"EDPONLY_REPAIR_FOLLOWUP_ACTIVATE_LABEL" inTable:@"Localizable-EDP"];
  uint64_t v21 = [v20 localizedString];
  [v19 setLabel:v21];

  [v19 setIdentifier:@"com.apple.cdp.edponlyrepair.continue"];
  v30[0] = v19;
  int v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  [v3 setActions:v22];

  v23 = [v8 options];
  uint64_t v24 = *MEMORY[0x263F35320];
  v29[0] = *MEMORY[0x263F35330];
  v29[1] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  int v26 = [v23 setByAddingObjectsFromArray:v25];
  [v8 setOptions:v26];

  [v8 setFirstNotificationDelay:0.0];
  v27 = _CDPLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[CDPDFollowUpFactory _followUpItemForEDPOnlyRepairWithContext:]();
  }

  return v3;
}

- (id)_followUpForRecoveryKeyRepairWithContext:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = [(CDPDFollowUpFactory *)self _baseFollowUpItemWithContext:a3];
  uint64_t v5 = CDPLocalizedString();
  [v4 setTitle:v5];

  id v6 = CDPLocalizedString();
  [v4 setInformativeText:v6];

  uint64_t v7 = [(CDPDFollowUpFactory *)self _followUpActionForRecoveryKeyRepair];
  v14[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [v4 setActions:v8];

  int v9 = [v4 notification];

  if (v9)
  {
    BOOL v10 = [v4 notification];
    v11 = CDPLocalizedString();
    [v10 setTitle:v11];

    id v12 = CDPLocalizedString();
    [v10 setInformativeText:v12];

    [v10 setActivateAction:v7];
  }

  return v4;
}

- (id)_followUpActionForRecoveryKeyRepair
{
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  id v3 = CDPLocalizedString();
  [v2 setLabel:v3];

  [v2 setIdentifier:@"com.apple.cdp.repair.recoverykey"];
  return v2;
}

- (id)_followUpForSettingUpBiometricsWithContext:(id)a3
{
  v76[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CDPDFollowUpFactory *)self _isBiometricCapable]
    && ![(CDPDFollowUpFactory *)self _isBiometricAuthEnrolled])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F35388]);
    uint64_t v5 = objc_alloc_init(MEMORY[0x263F35378]);
    uint64_t v7 = [v6 notification];
    [v6 setGroupIdentifier:*MEMORY[0x263F352C8]];
    v8 = [v4 followUpType];

    if (v8)
    {
      int v9 = [(id)objc_opt_class() contextToIdentifierMap];
      BOOL v10 = [v4 followUpType];
      v11 = [v9 objectForKeyedSubscript:v10];
      [v6 setUniqueIdentifier:v11];
    }
    if ([MEMORY[0x263F34400] canEnableMultiUserManatee])
    {
      id v12 = [v4 altDSID];

      if (v12)
      {
        uint64_t v75 = *MEMORY[0x263F34278];
        id v13 = [v4 altDSID];
        v76[0] = v13;
        uint64_t v14 = [NSDictionary dictionaryWithObjects:v76 forKeys:&v75 count:1];
        [v6 setUserInfo:v14];

        id v15 = (void *)MEMORY[0x263F34328];
        id v16 = [v4 altDSID];
        v17 = [v15 appleAccountForAltDSID:v16];
        uint64_t v18 = [v17 identifier];
        [v6 setAccountIdentifier:v18];
      }
    }
    v66 = (void *)v7;
    [v6 setTargetBundleIdentifier:*MEMORY[0x263F35290]];
    if ([(CDPDFollowUpFactory *)self _supportsFaceID])
    {
      id v19 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_FOLLOWUP_FACEID_TITLE"];
      id v20 = [v19 localizedString];
      [v6 setTitle:v20];

      uint64_t v21 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_FOLLOWUP_FACEID_INFOTEXT"];
      int v22 = objc_msgSend(v21, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
      v23 = [MEMORY[0x263F343A8] sharedInstance];
      uint64_t v24 = [v23 deviceClass];
      v25 = [v22 addDeviceClass:v24];
      int v26 = [v25 localizedString];
      [v6 setInformativeText:v26];

      v27 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_FOLLOWUP_FACEID_TITLE"];
      uint64_t v28 = [v27 localizedString];
      v29 = v66;
      [v66 setTitle:v28];

      int v30 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_FOLLOWUP_FACEID_INFOTEXT"];
      v31 = objc_msgSend(v30, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
      int v32 = [MEMORY[0x263F343A8] sharedInstance];
      v33 = [v32 deviceClass];
      v34 = [v31 addDeviceClass:v33];
      int v35 = [v34 localizedString];
      [v66 setInformativeText:v35];

      v36 = NSURL;
      v37 = [NSString stringWithFormat:@"prefs:root=SETUP_FINISH&flow=%@", @"faceID"];
      v38 = [v36 URLWithString:v37];
      [v5 setUrl:v38];

      v72 = @"faceID";
      v73 = @"flowSkipIdentifiers";
      v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
      v74 = v39;
      v40 = NSDictionary;
      v41 = &v74;
      v42 = &v73;
    }
    else
    {
      v43 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_FOLLOWUP_TOUCHID_TITLE"];
      id v44 = [v43 localizedString];
      [v6 setTitle:v44];

      v45 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_FOLLOWUP_TOUCHID_INFOTEXT"];
      v46 = objc_msgSend(v45, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
      v47 = [MEMORY[0x263F343A8] sharedInstance];
      v48 = [v47 deviceClass];
      v49 = [v46 addDeviceClass:v48];
      v50 = [v49 localizedString];
      [v6 setInformativeText:v50];

      v51 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_FOLLOWUP_TOUCHID_TITLE"];
      v52 = [v51 localizedString];
      v29 = v66;
      [v66 setTitle:v52];

      v53 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_FOLLOWUP_TOUCHID_INFOTEXT"];
      v54 = objc_msgSend(v53, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
      v55 = [MEMORY[0x263F343A8] sharedInstance];
      v56 = [v55 deviceClass];
      v57 = [v54 addDeviceClass:v56];
      v58 = [v57 localizedString];
      [v66 setInformativeText:v58];

      v59 = NSURL;
      v60 = [NSString stringWithFormat:@"prefs:root=SETUP_FINISH&flow=%@", @"touchID"];
      v61 = [v59 URLWithString:v60];
      [v5 setUrl:v61];

      v69 = @"touchID";
      v70 = @"flowSkipIdentifiers";
      v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
      v71 = v39;
      v40 = NSDictionary;
      v41 = &v71;
      v42 = &v70;
    }
    v62 = [v40 dictionaryWithObjects:v41 forKeys:v42 count:1];
    [v5 setUserInfo:v62];

    v63 = CDPLocalizedString();
    [v5 setLabel:v63];

    v68 = v5;
    v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v68 count:1];
    [v6 setActions:v64];

    [v29 setActivateAction:v5];
    [v29 setFirstNotificationDelay:60.0];
  }
  else
  {
    uint64_t v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Device is not biometric auth capable or is already enrolled.", buf, 2u);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)_followUpForADPStateHealingWithContext:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F35388]);
  [v5 setDisplayStyle:1];
  [v5 setGroupIdentifier:*MEMORY[0x263F352B8]];
  id v6 = [v4 followUpType];

  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() contextToIdentifierMap];
    v8 = [v4 followUpType];
    int v9 = [v7 objectForKeyedSubscript:v8];
    [v5 setUniqueIdentifier:v9];
  }
  if ([v4 shouldNotify])
  {
    BOOL v10 = [(CDPDFollowUpFactory *)self _baseFollowUpNotificationWithContext:v4];
    [v5 setNotification:v10];
  }
  [v5 setDisplayStyle:2];
  v11 = [MEMORY[0x263F343B8] builderForKey:@"ADP_STATE_HEALING_CFU_TITLE" inTable:@"Localizable-Walrus"];
  id v12 = [v11 localizedString];
  [v5 setTitle:v12];

  id v13 = [MEMORY[0x263F343B8] builderForKey:@"ADP_STATE_HEALING_CFU_TEXT" inTable:@"Localizable-Walrus"];
  uint64_t v14 = [v13 localizedString];
  [v5 setInformativeText:v14];

  id v15 = [(CDPDFollowUpFactory *)self _adpStateHealingFollowUpAction];
  v29[0] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  [v5 setActions:v16];

  v17 = [v5 notification];
  uint64_t v18 = [MEMORY[0x263F343B8] builderForKey:@"ADP_STATE_HEALING_CFU_TITLE" inTable:@"Localizable-Walrus"];
  id v19 = [v18 localizedString];
  [v17 setTitle:v19];

  id v20 = [MEMORY[0x263F343B8] builderForKey:@"ADP_STATE_HEALING_NOTIFICATION_TEXT" inTable:@"Localizable-Walrus"];
  uint64_t v21 = [v20 localizedString];
  [v17 setInformativeText:v21];

  int v22 = [v17 options];
  uint64_t v23 = *MEMORY[0x263F35320];
  v28[0] = *MEMORY[0x263F352F8];
  v28[1] = v23;
  uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  v25 = [v22 setByAddingObjectsFromArray:v24];
  [v17 setOptions:v25];

  int v26 = [(CDPDFollowUpFactory *)self _adpStateHealingFollowUpAction];
  [v17 setActivateAction:v26];

  [v17 setFirstNotificationDelay:0.0];
  return v5;
}

- (id)_adpStateHealingFollowUpAction
{
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  id v3 = [MEMORY[0x263F343B8] builderForKey:@"CONTINUE"];
  id v4 = [v3 localizedString];
  [v2 setLabel:v4];

  [v2 setIdentifier:@"com.apple.cdp.adpStateHealing.continue"];
  id v5 = [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/ICLOUD_ADP_SPECIFIER_NAME"];
  [v2 setUrl:v5];

  return v2;
}

- (id)_baseFollowUpItemWithContext:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F35388]);
  [v5 setDisplayStyle:1];
  [v5 setGroupIdentifier:*MEMORY[0x263F352B8]];
  id v6 = [v4 followUpType];

  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() contextToIdentifierMap];
    v8 = [v4 followUpType];
    int v9 = [v7 objectForKeyedSubscript:v8];
    [v5 setUniqueIdentifier:v9];
  }
  BOOL v10 = [v4 altDSID];

  if (v10)
  {
    uint64_t v20 = *MEMORY[0x263F34278];
    v11 = [v4 altDSID];
    v21[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    [v5 setUserInfo:v12];
  }
  if ([MEMORY[0x263F34400] canEnableMultiUserManatee])
  {
    id v13 = [v4 altDSID];

    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x263F34328];
      id v15 = [v4 altDSID];
      id v16 = [v14 appleAccountForAltDSID:v15];
      v17 = [v16 identifier];
      [v5 setAccountIdentifier:v17];
    }
  }
  [v5 setExtensionIdentifier:*MEMORY[0x263F34280]];
  if ([v4 shouldNotify])
  {
    uint64_t v18 = [(CDPDFollowUpFactory *)self _baseFollowUpNotificationWithContext:v4];
    [v5 setNotification:v18];
  }
  return v5;
}

- (id)_baseFollowUpNotificationWithContext:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F35390];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setFrequency:86400.0];
  [v5 setFirstNotificationDelay:86400.0];
  int v6 = [v4 force];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    v11[0] = *MEMORY[0x263F35310];
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    int v9 = [v7 setWithArray:v8];
    [v5 setOptions:v9];
  }
  return v5;
}

- (unint64_t)secretType
{
  return 1;
}

- (id)_localizedStringForKey:(id)a3
{
  id v3 = [MEMORY[0x263F343B8] builderForKey:a3];
  id v4 = [v3 addSecretType:1];
  id v5 = [v4 localizedString];

  return v5;
}

- (BOOL)_isBiometricAuthEnrolledWithLAEnvironment:(id)a3
{
  id v3 = [a3 state];
  id v4 = [v3 biometry];
  char v5 = [v4 isEnrolled];

  if ((v5 & 1) == 0)
  {
    int v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CDPDFollowUpFactory _isBiometricAuthEnrolledWithLAEnvironment:]();
    }
  }
  return v5;
}

- (BOOL)_isBiometricAuthEnrolled
{
  currentUser = self->_currentUser;
  if (!currentUser)
  {
    LAEnvironmentClass = (void *)LocalAuthenticationLibraryCore();
    if (LAEnvironmentClass) {
      LAEnvironmentClass = getLAEnvironmentClass();
    }
    char v5 = [LAEnvironmentClass currentUser];
    int v6 = self->_currentUser;
    self->_currentUser = v5;

    currentUser = self->_currentUser;
  }
  return [(CDPDFollowUpFactory *)self _isBiometricAuthEnrolledWithLAEnvironment:currentUser];
}

- (BOOL)_isManateeAvailableForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F34350] contextForAccountWithAltDSID:v3];
  char v5 = (void *)[objc_alloc(MEMORY[0x263F343F0]) initWithContext:v4];
  id v10 = 0;
  char v6 = [v5 isManateeAvailable:&v10];
  id v7 = v10;
  if (v7)
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPDFollowUpFactory _isManateeAvailableForAltDSID:]();
    }
  }
  return v6;
}

- (BOOL)_isManateeAvailable
{
  id v2 = objc_alloc(MEMORY[0x263F343F0]);
  id v3 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  id v4 = (void *)[v2 initWithContext:v3];

  id v9 = 0;
  char v5 = [v4 isManateeAvailable:&v9];
  id v6 = v9;
  if (v6)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPDFollowUpFactory _isManateeAvailable]();
    }
  }
  return v5;
}

- (BOOL)_isBiometricCapable
{
  id v2 = [(CDPDFollowUpFactory *)self _deviceCapabilityProvider];
  if ([v2 supportsPearl]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 supportsMesa];
  }

  return v3;
}

- (BOOL)_supportsFaceID
{
  id v2 = [(CDPDFollowUpFactory *)self _deviceCapabilityProvider];
  char v3 = [v2 supportsPearl];

  return v3;
}

- (id)_deviceCapabilityProvider
{
  id v2 = objc_alloc_init(CDPMobileGestaltWrapper);
  return v2;
}

- (BOOL)_isWalrusEnabled
{
  id v2 = [CDPInternalWalrusStateController alloc];
  char v3 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  id v4 = [(CDPInternalWalrusStateController *)v2 initWithContext:v3];

  id v10 = 0;
  uint64_t v5 = [(CDPInternalWalrusStateController *)v4 walrusStatusWithContext:0 error:&v10];
  id v6 = v10;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPDFollowUpFactory _isWalrusEnabled]();
  }

  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDFollowUpFactory _isWalrusEnabled]();
  }

  return v5 == 1;
}

- (LAEnvironment)currentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)followUpItemWithContext:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Beneficiary accounts can only post follow ups for repair.", v2, v3, v4, v5, v6);
}

- (void)followUpItemWithContext:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "Creating EDP followup", v1, 2u);
}

- (void)followUpItemWithContext:.cold.3()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "Creating CDP & EDP Repair followup", v1, 2u);
}

- (void)_followUpForRepairWithContext:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Beneficiary accounts with valid manatee states are not eligible to post repair followups.", v2, v3, v4, v5, v6);
}

- (void)_followUpItemForEDPOnlyRepairWithContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "EDP repair CFU is: %@", v1, 0xCu);
}

- (void)_isBiometricAuthEnrolledWithLAEnvironment:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Bio metric auth not enrolled...", v2, v3, v4, v5, v6);
}

- (void)_isManateeAvailableForAltDSID:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_218640000, v1, OS_LOG_TYPE_ERROR, "Follow up factory manatee check returned an error for altDSID %@: %{public}@", v2, 0x16u);
}

- (void)_isManateeAvailable
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "Follow up factory manatee check returned an error: %{public}@", v1, 0xCu);
}

- (void)_isWalrusEnabled
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "Internal Walrus error %@", v1, 0xCu);
}

@end