@interface MCHacks
+ (id)sharedHacks;
- (BOOL)isGreenTea;
- (BOOL)isJapanSKU;
- (BOOL)isSetupBuddyDone;
- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:(id)a3;
- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToInstallUnsupportedPayload:(id)a3;
- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:(id)a3;
- (id)_deviceSpecificDefaultSettings;
- (id)_permittedGracePeriodNumbers;
- (id)_selectLargestNumberFromSortedArray:(id)a3 equalToOrLessThanNumber:(id)a4;
- (id)permittedAutoLockNumbers;
- (id)quantizedAutoLockInSeconds:(id)a3;
- (id)quantizedGracePeriodInSeconds:(id)a3;
- (void)_applyHeuristicsToEffectiveUserSettings:(id)a3;
- (void)_applyHeuristicsToGranfatheredRestrictionPayloadKeys:(id)a3;
- (void)_applyHeuristicsToRestrictions:(id)a3 forProfile:(id)a4 ignoresUnrestrictableApps:(BOOL)a5;
- (void)_applyImpliedSettingsToSettingsDictionary:(id)a3 currentSettings:(id)a4 restrictions:(id)a5;
- (void)_applyInternalDiagnosticEnforcementToSettings:(id)a3;
- (void)_applyMandatorySettingsToEffectiveUserSettings:(id)a3;
- (void)_sendChangeNotificationsBasedOnDefaultsAdditionByDomain:(id)a3;
- (void)_sendChangeNotificationsBasedOnDefaultsRemovalByDomain:(id)a3;
- (void)_setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:(id)a3;
@end

@implementation MCHacks

+ (id)sharedHacks
{
  if (sharedHacks_onceToken != -1) {
    dispatch_once(&sharedHacks_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)sharedHacks_hacks;
  return v2;
}

- (void)_applyMandatorySettingsToEffectiveUserSettings:(id)a3
{
  id v32 = a3;
  -[MCHacks _applyInternalDiagnosticEnforcementToSettings:](self, "_applyInternalDiagnosticEnforcementToSettings:");
  if ([MEMORY[0x1E4F5E7A8] isSharediPad])
  {
    v4 = [v32 objectForKeyedSubscript:@"union"];
    v5 = (void *)[v4 MCMutableDeepCopy];

    v6 = [v5 objectForKeyedSubscript:@"blockedAppBundleIDs"];
    v7 = [v6 objectForKeyedSubscript:@"values"];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA48] array];
    }
    v10 = v9;

    v11 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
    v12 = MCAlwaysRestrictedAppsInEDUMode();
    [v11 unionSet:v12];

    v13 = [v11 allObjects];
    v14 = (void *)[v13 copy];
    v15 = [v5 objectForKeyedSubscript:@"blockedAppBundleIDs"];
    [v15 setObject:v14 forKeyedSubscript:@"values"];

    v16 = (void *)[v13 copy];
    v17 = [v5 objectForKeyedSubscript:@"blacklistedAppBundleIDs"];
    [v17 setObject:v16 forKeyedSubscript:@"values"];

    [v32 setObject:v5 forKeyedSubscript:@"union"];
    v18 = [v32 objectForKeyedSubscript:@"restrictedBool"];
    v19 = (void *)[v18 MCMutableDeepCopy];
    v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      id v21 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v22 = v21;

    [v32 setObject:v22 forKeyedSubscript:@"restrictedBool"];
    MCFeatureSetBoolSetting(v22, @"allowProximitySetupToNewDevice", 0);
    MCFeatureSetBoolSetting(v22, @"allowEnablingRestrictions", 0);
    MCFeatureSetBoolSetting(v22, @"allowGameCenter", 0);
    MCFeatureSetBoolSetting(v22, @"allowAppsToBeHidden", 0);
    MCFeatureSetBoolSetting(v22, @"allowAppsToBeLocked", 0);
  }
  v23 = [MEMORY[0x1E4F73168] sharedConfiguration];
  v24 = [v23 details];

  v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F73198]];
  v26 = v25;
  if (v25 && ([v25 BOOLValue] & 1) == 0)
  {
    v27 = [v32 objectForKeyedSubscript:@"restrictedBool"];
    v28 = (void *)[v27 MCMutableDeepCopy];
    v29 = v28;
    if (v28)
    {
      id v30 = v28;
    }
    else
    {
      id v30 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v31 = v30;

    [v32 setObject:v31 forKeyedSubscript:@"restrictedBool"];
    MCFeatureSetBoolSetting(v31, @"allowHostPairing", 0);
  }
}

- (void)_applyInternalDiagnosticEnforcementToSettings:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_ui())
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MCInternalOverrideDiagnosticEnforcement", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat || !AppBooleanValue)
    {
      v5 = [v3 objectForKeyedSubscript:@"restrictedBool"];
      v6 = (void *)[v5 MCMutableDeepCopy];

      if (!v6)
      {
        v6 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      [v3 setObject:v6 forKeyedSubscript:@"restrictedBool"];
      MCFeatureSetBoolSetting(v6, @"allowDiagnosticSubmission", 1);
    }
  }
}

- (void)_applyImpliedSettingsToSettingsDictionary:(id)a3 currentSettings:(id)a4 restrictions:(id)a5
{
  id v27 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v27 objectForKey:@"restrictedBool"];
  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [v27 setObject:v9 forKey:@"restrictedBool"];
  }
  int v10 = +[MCRestrictionManager BOOLSettingForFeature:@"allowCamera" withNewUserSetting:v27 currentSettings:v7];
  if (v10 == 2)
  {
    v11 = @"allowVideoConferencing";
    v12 = v9;
    uint64_t v13 = 0;
  }
  else
  {
    int v14 = v10;
    v15 = (void *)MGCopyAnswer();
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      if (+[MCRestrictionManager BOOLSettingForFeature:@"allowVideoConferencing" withNewUserSetting:v27 currentSettings:v7] != 1)goto LABEL_12; {
      v12 = v9;
      }
      v11 = @"allowCamera";
    }
    else
    {
      if (v14 != 1) {
        goto LABEL_12;
      }
      v11 = @"allowVideoConferencing";
      v12 = v9;
    }
    uint64_t v13 = 1;
  }
  MCFeatureSetBoolSetting(v12, v11, v13);
LABEL_12:
  if (+[MCRestrictionManager BOOLSettingForFeature:@"allowiTunes" withNewUserSetting:v27 currentSettings:v7] == 2)
  {
    v17 = @"allowiTunesSocialPages";
    v18 = v9;
    uint64_t v19 = 0;
  }
  else
  {
    if (+[MCRestrictionManager BOOLSettingForFeature:@"allowiTunesSocialPages" withNewUserSetting:v27 currentSettings:v7] != 1)goto LABEL_17; {
    v18 = v9;
    }
    v17 = @"allowiTunes";
    uint64_t v19 = 1;
  }
  MCFeatureSetBoolSetting(v18, v17, v19);
LABEL_17:
  if (+[MCRestrictionManager BOOLSettingForFeature:@"allowGameCenter" withNewUserSetting:v27 currentSettings:v7] == 2)
  {
    v20 = @"allowMultiplayerGaming";
    id v21 = v9;
    uint64_t v22 = 0;
  }
  else
  {
    if (+[MCRestrictionManager BOOLSettingForFeature:@"allowMultiplayerGaming" withNewUserSetting:v27 currentSettings:v7] != 1)goto LABEL_22; {
    id v21 = v9;
    }
    v20 = @"allowGameCenter";
    uint64_t v22 = 1;
  }
  MCFeatureSetBoolSetting(v21, v20, v22);
LABEL_22:
  if (+[MCRestrictionManager BOOLSettingForFeature:@"allowDiagnosticSubmission" withNewUserSetting:v27 currentSettings:v7] == 2)
  {
    MCFeatureSetBoolSetting(v9, @"allowAppAnalytics", 0);
    MCFeatureSetBoolSetting(v9, @"allowHealthDataSubmission", 0);
    MCFeatureSetBoolSetting(v9, @"allowHealthDataSubmission2", 0);
    MCFeatureSetBoolSetting(v9, @"allowWheelchairDataSubmission", 0);
    MCFeatureSetBoolSetting(v9, @"allowHandWashingDataSubmission", 0);
    MCFeatureSetBoolSetting(v9, @"allowSafetyDataSubmission", 0);
  }
  int v23 = +[MCRestrictionManager BOOLSettingForFeature:@"allowNews" withNewUserSetting:v27 currentSettings:v7];
  if (v23 == 2)
  {
    uint64_t v24 = 0;
    goto LABEL_28;
  }
  if (v23 == 1)
  {
    uint64_t v24 = 1;
LABEL_28:
    MCFeatureSetBoolSetting(v9, @"allowNewsToday", v24);
  }
  v25 = +[MCRestrictionManager valueForFeature:@"ratingApps" withRestrictionsDictionary:v8];
  v26 = v25;
  if (!v25 || (int)[v25 intValue] >= 1000) {
    MCFeatureSetBoolSetting(v9, @"forceITunesStorePasswordEntry", 0);
  }
}

- (void)_applyHeuristicsToRestrictions:(id)a3 forProfile:(id)a4 ignoresUnrestrictableApps:(BOOL)a5
{
  id v42 = a3;
  id v8 = a4;
  id v9 = +[MCRestrictionManager unionValuesForFeature:@"blacklistedAppBundleIDs" withRestrictionsDictionary:v42];
  v41 = +[MCRestrictionManager unionValuesForFeature:@"blockedAppBundleIDs" withRestrictionsDictionary:v42];
  if ([v9 count] || objc_msgSend(v41, "count"))
  {
    int v10 = self;
    id v11 = v8;
    v12 = v9;
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    int v14 = [MEMORY[0x1E4F1CA80] setWithArray:v41];
    [v14 unionSet:v13];
    if (!a5)
    {
      v15 = MCUnrestrictableApps();
      [v14 minusSet:v15];
    }
    int v16 = [v14 allObjects];
    v17 = (void *)[v16 copy];
    [v42 MCSetUnionRestriction:@"blockedAppBundleIDs" values:v17];

    v18 = (void *)[v16 copy];
    [v42 MCSetUnionRestriction:@"blacklistedAppBundleIDs" values:v18];

    id v8 = v11;
    id v9 = v12;
    self = v10;
  }
  uint64_t v19 = +[MCRestrictionManager intersectedValuesForFeature:@"appLockBundleIDs" withRestrictionsDictionary:v42];
  if ([v19 count] && !a5)
  {
    v20 = [MEMORY[0x1E4F1CA80] setWithArray:v19];
    id v21 = MCUnrestrictableApps();
    [v20 unionSet:v21];

    uint64_t v22 = [v20 allObjects];
    [v42 MCSetIntersectionRestriction:@"appLockBundleIDs" values:v22];
  }
  int v23 = [v8 isEncrypted];
  id v24 = v42;
  if (v23)
  {
    v25 = [v42 objectForKeyedSubscript:@"restrictedBool"];
    v26 = [v25 objectForKeyedSubscript:@"forceEncryptedBackup"];
    id v27 = [v26 objectForKeyedSubscript:@"value"];

    id v24 = v42;
    if (!v27)
    {
      [v42 MCSetBoolRestriction:@"forceEncryptedBackup" value:1];
      id v24 = v42;
    }
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowCamera", v24) == 2)[v42 MCSetBoolRestriction:@"allowVideoConferencing" value:0]; {
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"forceEncryptedBackup", v42) == 1)[v42 MCSetBoolRestriction:@"cloudBackupPasswordRequired" value:1];
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowGameCenter", v42) == 2)[v42 MCSetBoolRestriction:@"allowMultiplayerGaming" value:0]; {
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowMultiplayerGaming", v42) == 2)[v42 MCSetValueRestriction:@"allowedGameCenterOtherPlayerTypes" value:&unk_1EF4D0AC0];
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowiTunes", v42) == 2)[v42 MCSetBoolRestriction:@"allowiTunesSocialPages" value:0]; {
  uint64_t v28 = +[MCPasscodeManager unlockScreenTypeForRestrictions:v42];
  }
  id v29 = v42;
  if (v28)
  {
    uint64_t v30 = v28;
    v31 = +[MCRestrictionManager valueForFeature:@"passcodeKeyboardComplexity" withRestrictionsDictionary:v42];
    if ([v31 unsignedIntValue] < v30)
    {
      id v32 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v30];
      [v42 MCSetValueRestriction:@"passcodeKeyboardComplexity" value:v32];
    }
    id v29 = v42;
  }
  v33 = +[MCRestrictionManager valueForFeature:@"maxGracePeriod" withRestrictionsDictionary:v29];
  if (v33)
  {
    v34 = [(MCHacks *)self quantizedGracePeriodInSeconds:v33];
    [v42 MCSetValueRestriction:@"maxGracePeriod" value:v34];
  }
  v35 = +[MCRestrictionManager valueForFeature:@"maxInactivity" withRestrictionsDictionary:v42];
  if (v35)
  {
    v36 = [(MCHacks *)self quantizedAutoLockInSeconds:v35];
    [v42 MCSetValueRestriction:@"maxInactivity" value:v36];
  }
  v37 = +[MCRestrictionManager valueForFeature:@"ratingApps" withRestrictionsDictionary:v42];
  v38 = v37;
  if (v37 && (int)[v37 intValue] <= 999) {
    [v42 MCSetBoolRestriction:@"forceITunesStorePasswordEntry" value:1];
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowCloudDocumentSync", v42) == 2)[v42 MCSetBoolRestriction:@"allowManagedAppsCloudSync" value:0]; {
  if (+[MCRestrictionManager restrictedBoolForFeature:@"allowDiagnosticSubmission" withRestrictionsDictionary:v42] == 2)
  }
  {
    [v42 MCSetBoolRestriction:@"allowAppAnalytics" value:0];
    [v42 MCSetBoolRestriction:@"allowHealthDataSubmission" value:0];
    [v42 MCSetBoolRestriction:@"allowHealthDataSubmission2" value:0];
    [v42 MCSetBoolRestriction:@"allowWheelchairDataSubmission" value:0];
    [v42 MCSetBoolRestriction:@"allowHandWashingDataSubmission" value:0];
    [v42 MCSetBoolRestriction:@"allowSafetyDataSubmission" value:0];
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowPasscodeModification", v42) == 2)[v42 MCSetBoolRestriction:@"allowFingerprintModification" value:0]; {
  if (+[MCRestrictionManager restrictedBoolForFeature:@"allowAppInstallation" withRestrictionsDictionary:v42] == 2)
  }
  {
    [v42 MCSetBoolRestriction:@"allowUIAppInstallation" value:0];
    [v42 MCSetBoolRestriction:@"allowMarketplaceAppInstallation" value:0];
    [v42 MCSetBoolRestriction:@"allowWebDistributionAppInstallation" value:0];
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:@"allowScreenShot" withRestrictionsDictionary:v42] == 2)
  {
    [v42 MCSetBoolRestriction:@"allowScreenRecording" value:0];
    [v42 MCSetBoolRestriction:@"allowRemoteScreenObservation" value:0];
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowRemoteScreenObservation", v42) == 2)[v42 MCSetBoolRestriction:@"allowClassroomScreenObservation" value:0]; {
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowNews", v42) == 2)[v42 MCSetBoolRestriction:@"allowNewsToday" value:0];
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowAutoCorrection", v42) == 2)[v42 MCSetBoolRestriction:@"allowSmartPunctuation" value:0]; {
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowAppRemoval", v42) == 2)[v42 MCSetBoolRestriction:@"allowSystemAppRemoval" value:0];
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"forceClassroomUnpromptedScreenObservation", v42) == 1|| +[MCRestrictionManager restrictedBoolForFeature:@"forceUnpromptedManagedClassroomScreenObservation" withRestrictionsDictionary:v42] == 1)
  {
    [v42 MCSetBoolRestriction:@"forceClassroomUnpromptedScreenObservation" value:1];
    [v42 MCSetBoolRestriction:@"forceUnpromptedManagedClassroomScreenObservation" value:1];
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowPasswordSharing", v42) == 2)[v42 MCSetBoolRestriction:@"allowWiFiPasswordSharing" value:0]; {
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"forceWiFiWhitelisting", v42) == 1|| +[MCRestrictionManager restrictedBoolForFeature:@"forceWiFiToAllowedNetworksOnly" withRestrictionsDictionary:v42] == 1)
  }
  {
    [v42 MCSetBoolRestriction:@"forceWiFiWhitelisting" value:1];
    [v42 MCSetBoolRestriction:@"forceWiFiToAllowedNetworksOnly" value:1];
  }
  if (_os_feature_enabled_impl())
  {
    if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowPasscodeModification", v42) == 2|| (+[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", @"pinHistory", v42), v39 = objc_claimAutoreleasedReturnValue(), int v40 = [v39 unsignedIntValue], v39, v40))
    {
      [v42 MCSetBoolRestriction:@"allowPasscodeRecovery" value:0];
    }
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowControlCenter", v42) == 2)[v42 MCSetBoolRestriction:@"allowControlCenterInApps" value:0]; {
  if (+[MCRestrictionManager restrictedBoolForFeature:@"allowSpotlight" withRestrictionsDictionary:v42] == 2)
  }
  {
    [v42 MCSetBoolRestriction:@"allowSpotlightNews" value:0];
    [v42 MCSetBoolRestriction:@"allowSpotlightInternetResults" value:0];
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", @"allowDefaultBrowserModification", v42) == 2)[v42 MCSetBoolRestriction:@"allowDefaultBrowserPrompting" value:0]; {
}
  }

- (void)_applyHeuristicsToEffectiveUserSettings:(id)a3
{
  id v29 = a3;
  v4 = +[MCRestrictionManager valueSettingForFeature:@"maxGracePeriod" withUserSettingDictionary:v29];
  if (v4)
  {
    self = [(MCHacks *)self quantizedGracePeriodInSeconds:v4];
    v5 = [v29 objectForKeyedSubscript:@"restrictedValue"];
    v6 = [v5 objectForKeyedSubscript:@"maxGracePeriod"];

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 setObject:self forKeyedSubscript:@"value"];
      }
    }
  }
  int v7 = +[MCRestrictionManager BOOLSettingForFeature:@"allowNews" withUserSettingDictionary:v29];
  if (v7 != 2)
  {
    self = +[MCRestrictionManager unionValuesForFeature:@"blockedAppBundleIDs" withRestrictionsDictionary:v29];
    if (![(MCHacks *)self containsObject:@"com.apple.news"]) {
      goto LABEL_14;
    }
  }
  int v8 = +[MCRestrictionManager BOOLSettingForFeature:@"allowSpotlightNews" withUserSettingDictionary:v29];
  if (v7 != 2) {

  }
  if (v8 == 2)
  {
    id v9 = [v29 objectForKeyedSubscript:@"restrictedBool"];
    self = (MCHacks *)[v9 MCMutableDeepCopy];

    if (!self)
    {
      self = [MEMORY[0x1E4F1CA60] dictionary];
    }
    MCFeatureSetBoolSetting(self, @"allowNewsToday", 0);
    [v29 setObject:self forKeyedSubscript:@"restrictedBool"];
LABEL_14:
  }
  if ([MEMORY[0x1E4F5E7A8] isSharediPad])
  {
    MCLKLogoutSupportClass();
    int v10 = objc_opt_new();
    int v11 = [v10 isCurrentUserAnonymous];

    if (v11)
    {
      v12 = [v29 objectForKeyedSubscript:@"restrictedBool"];
      uint64_t v13 = (void *)[v12 MCMutableDeepCopy];

      if (!v13)
      {
        uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      MCFeatureSetBoolSetting(v13, @"allowAccountModification", 0);
      int v14 = (void *)[v13 copy];
      [v29 setObject:v14 forKeyedSubscript:@"restrictedBool"];
    }
  }
  if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", @"forceWiFiWhitelisting", v29) == 1|| +[MCRestrictionManager BOOLSettingForFeature:@"forceWiFiToAllowedNetworksOnly" withUserSettingDictionary:v29] == 1)
  {
    v15 = [v29 objectForKeyedSubscript:@"restrictedBool"];
    int v16 = (void *)[v15 MCMutableDeepCopy];

    if (!v16)
    {
      int v16 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    MCFeatureSetBoolSetting(v16, @"forceWiFiWhitelisting", 1);
    MCFeatureSetBoolSetting(v16, @"forceWiFiToAllowedNetworksOnly", 1);
    [v29 setObject:v16 forKeyedSubscript:@"restrictedBool"];
  }
  if (+[MCRestrictionManager BOOLSettingForFeature:@"allowLockdownMode" withUserSettingDictionary:v29] == 1)
  {
    v17 = [v29 objectForKeyedSubscript:@"restrictedBool"];
    v18 = (void *)[v17 MCMutableDeepCopy];

    if (!v18)
    {
      v18 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    MCFeatureSetBoolSetting(v18, @"allowUSBRestrictedMode", 1);
    MCFeatureSetBoolSetting(v18, @"allowUIConfigurationProfileInstallation", 0);
    if (_os_feature_enabled_impl()) {
      MCFeatureSetBoolSetting(v18, @"allowPasscodeRecovery", 0);
    }
    [v29 setObject:v18 forKeyedSubscript:@"restrictedBool"];
  }
  int v19 = _os_feature_enabled_impl();
  id v20 = v29;
  if (v19)
  {
    int v21 = +[MCRestrictionManager BOOLSettingForFeature:@"allowPasscodeModification" withUserSettingDictionary:v29];
    id v20 = v29;
    if (v21 == 2)
    {
      int v22 = +[MCRestrictionManager BOOLSettingForFeature:@"allowPasscodeRecovery" withUserSettingDictionary:v29];
      id v20 = v29;
      if (v22 != 2)
      {
        int v23 = [v29 objectForKeyedSubscript:@"restrictedBool"];
        id v24 = (void *)[v23 MCMutableDeepCopy];

        if (!v24)
        {
          id v24 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        MCFeatureSetBoolSetting(v24, @"allowPasscodeRecovery", 0);
        [v29 setObject:v24 forKeyedSubscript:@"restrictedBool"];

        id v20 = v29;
      }
    }
  }
  if (+[MCRestrictionManager BOOLSettingForFeature:@"allowControlCenter" withUserSettingDictionary:v20] == 2)
  {
    v25 = [v29 objectForKeyedSubscript:@"restrictedBool"];
    v26 = (void *)[v25 MCMutableDeepCopy];

    if (!v26)
    {
      v26 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    MCFeatureSetBoolSetting(v26, @"allowControlCenterInApps", 0);
    [v29 setObject:v26 forKeyedSubscript:@"restrictedBool"];
  }
  if (+[MCRestrictionManager BOOLSettingForFeature:@"allowSpotlight" withUserSettingDictionary:v29] == 2)
  {
    id v27 = [v29 objectForKeyedSubscript:@"restrictedBool"];
    uint64_t v28 = (void *)[v27 MCMutableDeepCopy];

    if (!v28)
    {
      uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    MCFeatureSetBoolSetting(v28, @"allowSpotlightNews", 0);
    MCFeatureSetBoolSetting(v28, @"allowSpotlightInternetResults", 0);
    [v29 setObject:v28 forKeyedSubscript:@"restrictedBool"];
  }
}

- (id)quantizedGracePeriodInSeconds:(id)a3
{
  id v4 = a3;
  v5 = [(MCHacks *)self _permittedGracePeriodNumbers];
  v6 = [(MCHacks *)self _selectLargestNumberFromSortedArray:v5 equalToOrLessThanNumber:v4];

  return v6;
}

- (id)_selectLargestNumberFromSortedArray:(id)a3 equalToOrLessThanNumber:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 objectAtIndex:0];
  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "compare:", v6, (void)v16) != 1)
          {
            id v14 = v13;

            int v7 = v14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  return v7;
}

- (id)_permittedGracePeriodNumbers
{
  if (_permittedGracePeriodNumbers_once != -1) {
    dispatch_once(&_permittedGracePeriodNumbers_once, &__block_literal_global_3_2);
  }
  v2 = (void *)_permittedGracePeriodNumbers_numbers;
  return v2;
}

uint64_t __22__MCHacks_sharedHacks__block_invoke()
{
  v0 = NSClassFromString(&cfstr_Mcserversideha.isa);
  if (!v0) {
    v0 = (objc_class *)MCHacks;
  }
  sharedHacks_hacks = (uint64_t)objc_alloc_init(v0);
  return MEMORY[0x1F41817F8]();
}

void __39__MCHacks__permittedGracePeriodNumbers__block_invoke()
{
  v8[6] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
  v8[0] = v0;
  v1 = [MEMORY[0x1E4F28ED0] numberWithInt:60];
  v8[1] = v1;
  v2 = [MEMORY[0x1E4F28ED0] numberWithInt:300];
  v8[2] = v2;
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInt:900];
  v8[3] = v3;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:3600];
  v8[4] = v4;
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:14400];
  v8[5] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:6];
  int v7 = (void *)_permittedGracePeriodNumbers_numbers;
  _permittedGracePeriodNumbers_numbers = v6;
}

- (id)permittedAutoLockNumbers
{
  if (permittedAutoLockNumbers_once != -1) {
    dispatch_once(&permittedAutoLockNumbers_once, &__block_literal_global_7_0);
  }
  v2 = (void *)permittedAutoLockNumbers_numbers;
  return v2;
}

void __35__MCHacks_permittedAutoLockNumbers__block_invoke()
{
  v11[5] = *MEMORY[0x1E4F143B8];
  if (MCGestaltIsiPad())
  {
    v0 = [MEMORY[0x1E4F28ED0] numberWithInt:120];
    v11[0] = v0;
    v1 = [MEMORY[0x1E4F28ED0] numberWithInt:300];
    v11[1] = v1;
    v2 = [MEMORY[0x1E4F28ED0] numberWithInt:600];
    v11[2] = v2;
    id v3 = [MEMORY[0x1E4F28ED0] numberWithInt:900];
    v11[3] = v3;
    id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:0x7FFFFFFFLL];
    v11[4] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
    uint64_t v6 = (void *)permittedAutoLockNumbers_numbers;
    permittedAutoLockNumbers_numbers = v5;
  }
  else
  {
    v0 = [MEMORY[0x1E4F28ED0] numberWithInt:30];
    v10[0] = v0;
    v1 = [MEMORY[0x1E4F28ED0] numberWithInt:60];
    v10[1] = v1;
    v2 = [MEMORY[0x1E4F28ED0] numberWithInt:120];
    v10[2] = v2;
    id v3 = [MEMORY[0x1E4F28ED0] numberWithInt:180];
    v10[3] = v3;
    id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:240];
    v10[4] = v4;
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:300];
    v10[5] = v6;
    int v7 = [MEMORY[0x1E4F28ED0] numberWithInt:0x7FFFFFFFLL];
    v10[6] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:7];
    uint64_t v9 = (void *)permittedAutoLockNumbers_numbers;
    permittedAutoLockNumbers_numbers = v8;
  }
}

- (id)quantizedAutoLockInSeconds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCHacks *)self permittedAutoLockNumbers];
  uint64_t v6 = [(MCHacks *)self _selectLargestNumberFromSortedArray:v5 equalToOrLessThanNumber:v4];

  return v6;
}

- (void)_applyHeuristicsToGranfatheredRestrictionPayloadKeys:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MCHacks *)self isJapanSKU])
  {
    uint64_t v5 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = @"allowSafari";
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEFAULT, "Japan SKU device: Add %@ to grandfathered restrictions", buf, 0xCu);
    }
    uint64_t v6 = [v4 objectForKeyedSubscript:@"restrictedBool"];
    if (v6)
    {
      int v7 = (void *)v6;
      uint64_t v8 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
      [v8 addObject:@"allowSafari"];
      uint64_t v9 = [v8 allObjects];
    }
    else
    {
      uint64_t v10 = @"allowSafari";
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    }
    [v4 setObject:v9 forKeyedSubscript:@"restrictedBool"];
  }
}

- (void)_setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:(id)a3
{
  BOOL v3 = +[MCRestrictionManager BOOLSettingForFeature:@"forceEncryptedBackup" withUserSettingDictionary:a3] == 1;
  id v4 = MCLockdownOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MCHacks__setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __74__MCHacks__setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = lockdown_connect();
  if (result)
  {
    CFNumberRef v3 = CFNumberCreate(0, kCFNumberCharType, (const void *)(a1 + 32));
    if (v3)
    {
      CFNumberRef v4 = v3;
      int v5 = lockdown_set_value();
      if (v5)
      {
        int v6 = v5;
        int v7 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          v8[0] = 67109120;
          v8[1] = v6;
          _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Could not set encrypted backup required key in lockdown: %d", (uint8_t *)v8, 8u);
        }
      }
      CFRelease(v4);
    }
    return lockdown_disconnect();
  }
  return result;
}

- (id)_deviceSpecificDefaultSettings
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MCHacks__deviceSpecificDefaultSettings__block_invoke;
  block[3] = &unk_1E5A65CB0;
  void block[4] = self;
  if (_deviceSpecificDefaultSettings_once != -1) {
    dispatch_once(&_deviceSpecificDefaultSettings_once, block);
  }
  return (id)_deviceSpecificDefaultSettings_dict;
}

void __41__MCHacks__deviceSpecificDefaultSettings__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  CFNumberRef v3 = MCGetBaseResourcePath();
  CFNumberRef v4 = [v3 stringByAppendingPathComponent:@"defaultSettings.plist"];
  int v5 = [v2 dataWithContentsOfFile:v4];

  int v6 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v5 options:2 format:0 error:0];
  if (MCGestaltIsiPad())
  {
    int v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEFAULT, "Applying iPad defaults", buf, 2u);
    }
    uint64_t v8 = [v6 objectForKey:@"restrictedValue"];
    uint64_t v9 = [v8 objectForKey:@"maxInactivity"];

    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInt:120];
      [v9 setObject:v10 forKey:@"value"];

      uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithInt:120];
      [v9 setObject:v11 forKey:@"rangeMinimum"];
    }
LABEL_11:

    goto LABEL_12;
  }
  if (MCGestaltHasPearlIDCapability())
  {
    v12 = [v6 objectForKey:@"restrictedValue"];
    uint64_t v9 = [v12 objectForKey:@"maxInactivity"];

    if (v9)
    {
      uint64_t v13 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_DEFAULT, "Applying FaceID defaults", v31, 2u);
      }
      [v9 setObject:&unk_1EF4D0AD8 forKey:@"value"];
    }
    goto LABEL_11;
  }
  uint64_t v28 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_DEFAULT, "Applying iPhone defaults", v30, 2u);
  }
LABEL_12:
  if (MCGestaltHasBiometricCapability())
  {
    id v14 = [v6 objectForKey:@"restrictedValue"];
    v15 = [v14 objectForKey:@"minLength"];

    if (v15)
    {
      long long v16 = [v15 objectForKey:@"value"];
      unsigned int v17 = [v16 unsignedIntValue];

      if (v17 <= 5)
      {
        long long v18 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v29 = 0;
          _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_DEFAULT, "Applying TouchID defaults", v29, 2u);
        }
        [v15 setObject:&unk_1EF4D0AF0 forKey:@"value"];
      }
    }
  }
  [*(id *)(a1 + 32) _applyInternalDiagnosticEnforcementToSettings:v6];
  long long v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = MDMFilePath();
  char v21 = [v19 fileExistsAtPath:v20 isDirectory:0];

  if ((v21 & 1) == 0)
  {
    int v22 = [MEMORY[0x1E4F73168] sharedConfiguration];
    int v23 = [v22 isSupervised];

    if (v23)
    {
      id v24 = [v6 objectForKey:@"restrictedBool"];
      v25 = [v24 objectForKey:@"allowUSBRestrictedMode"];

      v26 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
      [v25 setObject:v26 forKey:@"value"];
    }
  }
  id v27 = (void *)_deviceSpecificDefaultSettings_dict;
  _deviceSpecificDefaultSettings_dict = (uint64_t)v6;
}

- (void)_sendChangeNotificationsBasedOnDefaultsAdditionByDomain:(id)a3
{
  CFNumberRef v3 = [a3 objectForKey:@"com.apple.powerlogd"];
  id v6 = [v3 objectForKey:@"FullMode"];

  if (v6)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];

    int v5 = v6;
    if (v6 == v4)
    {

      int v5 = 0;
    }
    id v7 = v5;
    MCPowerlogControlSwitchMode(v5);
  }
}

- (void)_sendChangeNotificationsBasedOnDefaultsRemovalByDomain:(id)a3
{
  CFNumberRef v3 = [a3 objectForKey:@"com.apple.powerlogd"];
  int v4 = [v3 containsObject:@"FullMode"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
    MCPowerlogControlSwitchMode(v5);
  }
}

- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToInstallUnsupportedPayload:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_INFO, "Evaluating whether the certificate signer is entitled to install unsupported payloads.", (uint8_t *)v9, 2u);
  }
  id v5 = objc_opt_new();
  int v6 = [v5 sanitizedProfileSignerCertificateChainIsAllowedToInstallUnsupportedPayload:v3];
  id v7 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_INFO, "Unsupported evaluation result: %d", (uint8_t *)v9, 8u);
  }

  return v6;
}

- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_INFO, "Evaluating whether the certificate signer is entitled to write defaults.", (uint8_t *)v9, 2u);
  }
  id v5 = objc_opt_new();
  int v6 = [v5 sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:v3];
  id v7 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_INFO, "Evaluation result: %d", (uint8_t *)v9, 8u);
  }

  return v6;
}

- (BOOL)sanitizedProfileSignerCertificateChainIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_INFO, "Evaluating whether the certificate signer is entitled to install supervised only restrictions on an unsupervised device.", (uint8_t *)v9, 2u);
  }
  id v5 = objc_opt_new();
  int v6 = [v5 sanitizedProfileSignerCertificateChainIsAllowedToInstallSupervisedRestrictionsOnUnsupervisedDevices:v3];
  id v7 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_INFO, "Evaluation result: %d", (uint8_t *)v9, 8u);
  }

  return v6;
}

- (BOOL)isGreenTea
{
  if (isGreenTea_once != -1) {
    dispatch_once(&isGreenTea_once, &__block_literal_global_49_0);
  }
  return isGreenTea_isGreenTea;
}

uint64_t __21__MCHacks_isGreenTea__block_invoke()
{
  mach_port_t v0 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v1 = IOServiceMatching("AppleBaseband");
  mach_port_name_t MatchingService = IOServiceGetMatchingService(v0, v1);
  unsigned int v3 = MatchingService - 1;
  if (MatchingService - 1 <= 0xFFFFFFFD) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], MatchingService);
  }
  uint64_t result = [(id)CPGetDeviceRegionCode() isEqualToString:@"CH"];
  if (v3 < 0xFFFFFFFE) {
    char v5 = result;
  }
  else {
    char v5 = 0;
  }
  isGreenTea_isGreenTea = v5;
  return result;
}

- (BOOL)isJapanSKU
{
  if (isJapanSKU_once != -1) {
    dispatch_once(&isJapanSKU_once, &__block_literal_global_55);
  }
  return isJapanSKU_isJapanSKU;
}

void __21__MCHacks_isJapanSKU__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  mach_port_t v0 = CPGetDeviceRegionCode();
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v1 = [&unk_1EF4D0C58 countByEnumeratingWithState:&v5 objects:v9 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v6;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v6 != v3) {
          objc_enumerationMutation(&unk_1EF4D0C58);
        }
        if ([v0 isEqualToString:*(void *)(*((void *)&v5 + 1) + 8 * i)])
        {
          isJapanSKU_isJapanSKU = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [&unk_1EF4D0C58 countByEnumeratingWithState:&v5 objects:v9 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)isSetupBuddyDone
{
  return MCBYSetupAssistantNeedsToRun() ^ 1;
}

@end