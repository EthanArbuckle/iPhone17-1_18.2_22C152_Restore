@interface BuddyDataMigrator
- (BOOL)_isSignificantLocationsEnabled;
- (BOOL)_needsAppleIDReauthenticationAfterMigration;
- (BOOL)_needsVoiceTriggerConfirmation;
- (BOOL)_performiOSMigration;
- (BOOL)_shouldOfferPeriocularEnrollment;
- (BOOL)_shouldOfferStolenDeviceProtection;
- (BOOL)_shouldUpsellIntelligence;
- (BOOL)_shouldUpsellVisualIntelligence;
- (BOOL)accountNeedsSecurityUpgrade;
- (BOOL)performMigration;
- (BOOL)primaryAccountNeedsEscrowRepair;
- (BOOL)primaryAccountNeedsRepair;
- (BOOL)primaryAccountRequiresTermsAcceptance;
- (BOOL)shouldUpsellSiri;
- (BYCapabilities)capabilities;
- (BYChronicle)chronicle;
- (BYPreferencesController)buddyPreferences;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyDataMigrator)init;
- (BuddyFeatureFlags)featureFlags;
- (unsigned)_storedBuddyMigratorVersion;
- (unsigned)_storedBuddyVersion;
- (void)_applyPreRestoreSettings;
- (void)_cleanupKeys;
- (void)_migrateChronicle;
- (void)_migrateKeys;
- (void)_migrateStolenDeviceProtectionPreferenceKeys;
- (void)_performHSA2Migration;
- (void)deferDataMigratorExit;
- (void)setBuddyPreferences:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setChronicle:(id)a3;
- (void)setFeatureFlags:(id)a3;
@end

@implementation BuddyDataMigrator

- (BuddyDataMigrator)init
{
  v12.receiver = self;
  v12.super_class = (Class)BuddyDataMigrator;
  v2 = [(BuddyDataMigrator *)&v12 init];
  if (v2)
  {
    v3 = (BYCapabilities *)objc_alloc_init((Class)BYCapabilities);
    capabilities = v2->_capabilities;
    v2->_capabilities = v3;

    uint64_t v5 = +[BYPreferencesController buddyPreferences];
    buddyPreferences = v2->_buddyPreferences;
    v2->_buddyPreferences = (BYPreferencesController *)v5;

    uint64_t v7 = +[BYPreferencesController buddyPreferencesExcludedFromBackup];
    buddyPreferencesExcludedFromBackup = v2->_buddyPreferencesExcludedFromBackup;
    v2->_buddyPreferencesExcludedFromBackup = (BYPreferencesController *)v7;

    v9 = (BuddyFeatureFlags *)objc_alloc_init((Class)BuddyFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v9;
  }
  return v2;
}

- (unsigned)_storedBuddyMigratorVersion
{
  v2 = (void *)CFPreferencesCopyAppValue(@"setupMigratorVersion", BYSetupAssistantBundleIdentifier);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v3 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (unsigned)_storedBuddyVersion
{
  v2 = (void *)CFPreferencesCopyAppValue(BYBuddyIOSVersionKey, BYSetupAssistantBundleIdentifier);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v3 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (BOOL)_performiOSMigration
{
  if ([(BuddyDataMigrator *)self didRestoreFromBackup])
  {
    CFStringRef v3 = (const __CFString *)BYBuddyFinishedInitialRunKey;
    CFStringRef v4 = (const __CFString *)BYSetupAssistantBundleIdentifier;
    if (!CFPreferencesGetAppBooleanValue(BYBuddyFinishedInitialRunKey, BYSetupAssistantBundleIdentifier, 0))
    {
      uint64_t v5 = _BYLoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Restored to a fresh preferences plist. Adding keys for post-cross-device restore.", (uint8_t *)&buf, 2u);
      }

      if (!self->_restoredIniTunes)
      {
        v6 = _BYLoggingFacility();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Setting SetupDone.", (uint8_t *)&buf, 2u);
        }

        CFPreferencesSetAppValue(BYBuddyDoneKey, kCFBooleanTrue, v4);
        uint64_t v7 = _BYLoggingFacility();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Setting BuddyVersion.", (uint8_t *)&buf, 2u);
        }

        v8 = +[NSNumber numberWithUnsignedInt:BYBuddyIOSCurrentVersion];
        CFPreferencesSetAppValue(BYBuddyIOSVersionKey, v8, v4);
      }
      v9 = _BYLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Setting RestoreChoice.", (uint8_t *)&buf, 2u);
      }

      CFPreferencesSetAppValue(@"RestoreChoice", kCFBooleanTrue, v4);
      CFPreferencesSetAppValue(v3, kCFBooleanTrue, v4);
    }
  }
  [(BuddyDataMigrator *)self _applyPreRestoreSettings];
  [(BuddyDataMigrator *)self _migrateKeys];
  if ([(BuddyDataMigrator *)self didRestoreFromBackup])
  {
    id v10 = objc_alloc_init((Class)ACAccountStore);
    v11 = objc_msgSend(v10, "aa_primaryAppleAccount");
    if (v11)
    {
      objc_super v12 = _BYLoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Detected restore, marking primary account as unauthenticated...", (uint8_t *)&buf, 2u);
      }

      [v10 setNotificationsEnabled:0];
      [v11 setAuthenticated:0];
      id v156 = 0;
      uint64_t v13 = (uint64_t)[v10 saveVerifiedAccount:v11 error:&v156];
      id v14 = v156;
      v15 = _BYLoggingFacility();
      v16 = v15;
      if (v13)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Saved account", (uint8_t *)&buf, 2u);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        if (_BYIsInternalInstall())
        {
          int v151 = 0;
          v152 = v14;
        }
        else if (v14)
        {
          uint64_t v13 = [v14 domain];
          v152 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v13, [v14 code]);
          int v151 = 1;
        }
        else
        {
          int v151 = 0;
          v152 = 0;
        }
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v152;
        _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Failed to save account: %{public}@", (uint8_t *)&buf, 0xCu);
        if (v151)
        {
        }
      }
    }
  }
  if (self->_runLocalRestoreMiniBuddies)
  {
    if (MGGetBoolAnswer())
    {
      v17 = _BYLoggingFacility();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing Touch ID mini-buddy", (uint8_t *)&buf, 2u);
      }

      CFPreferencesSetAppValue(BYBuddyRunMesaMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    }
    CFStringRef applicationID = (const __CFString *)BYSetupAssistantBundleIdentifier;
    if (self->_runLocalRestoreMiniBuddies) {
      goto LABEL_33;
    }
  }
  else
  {
    CFStringRef applicationID = (const __CFString *)BYSetupAssistantBundleIdentifier;
  }
  if (!self->_runUpgradeMiniBuddies) {
    goto LABEL_65;
  }
LABEL_33:
  v18 = [(BuddyDataMigrator *)self capabilities];
  unsigned int v19 = [v18 supportsApplePay];

  if (!v19) {
    goto LABEL_65;
  }
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PaymentMiniBuddy4Ran", applicationID, 0);
  v21 = _BYLoggingFacility();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v22 = @"YASE";
    if (!AppBooleanValue) {
      CFStringRef v22 = @"NERP";
    }
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v22;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Already ran payment mini-buddy = %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if (!AppBooleanValue) {
    goto LABEL_54;
  }
  unsigned int storedBuddyMigratorVersion = self->_storedBuddyMigratorVersion;
  if (storedBuddyMigratorVersion > 2)
  {
    int v25 = 0;
  }
  else
  {
    int v24 = CFPreferencesGetAppBooleanValue(@"Payment2Presented", applicationID, 0);
    int v25 = v24 == 0;
    if (!v24)
    {
      v26 = _BYLoggingFacility();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Running Apple Pay mini-buddy since this device is now eligible for Apple Pay and hasn't been offered it yet", (uint8_t *)&buf, 2u);
      }
    }
    unsigned int storedBuddyMigratorVersion = self->_storedBuddyMigratorVersion;
  }
  if (storedBuddyMigratorVersion > 5) {
    goto LABEL_53;
  }
  v27 = +[NSLocale currentLocale];
  v28 = [v27 countryCode];
  if (([v28 isEqualToString:@"US"] & 1) == 0)
  {
    BOOL v29 = self->_storedBuddyVersion < 11;

    if (v29) {
      goto LABEL_50;
    }
LABEL_53:
    if ((!self->_runLocalRestoreMiniBuddies & ~v25) != 0) {
      goto LABEL_65;
    }
    goto LABEL_54;
  }

LABEL_50:
  v30 = _BYLoggingFacility();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Running Apple Pay mini-buddy for SURF", (uint8_t *)&buf, 2u);
  }

LABEL_54:
  uint64_t v157 = 0;
  v158 = &v157;
  uint64_t v159 = 0x2050000000;
  v31 = (void *)qword_270D8;
  uint64_t v160 = qword_270D8;
  if (!qword_270D8)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v162 = sub_8970;
    v163 = &unk_20950;
    v164 = &v157;
    sub_8970((uint64_t)&buf);
    v31 = (void *)v158[3];
  }
  v32 = v31;
  _Block_object_dispose(&v157, 8);
  id v33 = [[v32 alloc] initWithSetupAssistant:1];
  uint64_t v157 = 0;
  v158 = &v157;
  uint64_t v159 = 0x2050000000;
  v34 = (void *)qword_270E8;
  uint64_t v160 = qword_270E8;
  if (!qword_270E8)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v162 = sub_8B38;
    v163 = &unk_20950;
    v164 = &v157;
    sub_8B38((uint64_t)&buf);
    v34 = (void *)v158[3];
  }
  v35 = v34;
  _Block_object_dispose(&v157, 8);
  id v36 = [[v35 alloc] initWithSetupAssistantContext:v33];
  unsigned int v37 = [v36 setupAssistantNeedsToRunReturningRequirements:0];
  v38 = _BYLoggingFacility();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v37;
    _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Payment mini-buddy needs to run: %d", (uint8_t *)&buf, 8u);
  }

  if (v37)
  {
    v39 = _BYLoggingFacility();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing Payment mini-buddy", (uint8_t *)&buf, 2u);
    }

    CFPreferencesSetAppValue(BYBuddyRunPaymentMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
  }

LABEL_65:
  CFPreferencesSetAppValue(@"PaymentMiniBuddy4Ran", kCFBooleanTrue, applicationID);
  [(BuddyDataMigrator *)self _performHSA2Migration];
  CFPreferencesSetAppValue(@"HSA2UpgradeMiniBuddy3Ran", kCFBooleanTrue, applicationID);
  if (self->_runLocalRestoreMiniBuddies || self->_runUpgradeMiniBuddies)
  {
    if (CFPreferencesGetAppBooleanValue(@"DiagnosticsAutoOptInSet", applicationID, 0) && !self->_isMultiUser)
    {
      v40 = _BYLoggingFacility();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing Diagnostics & Usage mini-buddy for re-opt-in", (uint8_t *)&buf, 2u);
      }

      CFPreferencesSetAppValue(BYBuddyRunDiagnosticsMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    }
    else
    {
      CFPreferencesSetAppValue(@"DiagnosticsAutoOptInSet", 0, applicationID);
    }
  }
  if (self->_runUpgradeMiniBuddies || self->_runLocalRestoreMiniBuddies)
  {
    v41 = [(BuddyDataMigrator *)self chronicle];
    v42 = [v41 entryForFeature:2];
    unsigned int v43 = [v42 createdOnCurrentMajorVersion];

    v44 = +[MCProfileConnection sharedConnection];
    unsigned int v45 = [v44 effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed];

    v46 = [(BuddyDataMigrator *)self capabilities];
    unsigned int v47 = [v46 isDeviceAnalyticsRestricted];

    v48 = +[MCProfileConnection sharedConnection];
    v49 = [v48 skipSetupKeys];
    unsigned int v50 = [v49 containsObject:kMCCCSkipSetupDiagnostics];

    v51 = [(BuddyDataMigrator *)self capabilities];
    LODWORD(v49) = [v51 eligibleForChlorine];

    if ((v49 ^ 1 | v47)) {
      goto LABEL_76;
    }
    if (v50) {
      goto LABEL_89;
    }
    v55 = +[MCProfileConnection sharedConnection];
    unsigned int v56 = [v55 effectiveBoolValueForSetting:MCFeatureAppAnalyticsAllowed];

    v57 = [(BuddyDataMigrator *)self capabilities];
    unsigned __int8 v58 = [v57 isAppAnalyticsRestricted];

    if (v58 & 1 | (v45 == 1) ^ (v56 != 1))
    {
LABEL_76:
      if (v45 == 1) {
        int v52 = 1;
      }
      else {
        int v52 = v43;
      }
      if ((v52 | v47 | v50))
      {
LABEL_89:
        if ((self->_runUpgradeMiniBuddies || self->_runLocalRestoreMiniBuddies)
          && BYAssistantScreenShouldRunForPHSUpgrade())
        {
          v60 = _BYLoggingFacility();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_0, v60, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Need to show Siri to offer PHS upgrade", (uint8_t *)&buf, 2u);
          }

          CFPreferencesSetAppValue(BYBuddyAssistantPresentedKey, kCFBooleanFalse, applicationID);
        }
        goto LABEL_95;
      }
      v53 = _BYLoggingFacility();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing Diagnostics & Usage mini-buddy (once per major OS)", (uint8_t *)&buf, 2u);
      }

      CFPreferencesSetAppValue(@"PBDiagnostics4Presented", 0, applicationID);
      v54 = (CFStringRef *)&BYBuddyRunStandardMiniBuddy;
    }
    else
    {
      v59 = _BYLoggingFacility();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v59, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing Diagnostics & Usage mini-buddy for chlorine", (uint8_t *)&buf, 2u);
      }

      v54 = (CFStringRef *)&BYBuddyRunCombinedDiagnosticsMismatchMiniBuddy;
    }
    CFPreferencesSetAppValue(*v54, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    goto LABEL_89;
  }
LABEL_95:
  v61 = +[MCProfileConnection sharedConnection];
  v62 = [v61 skipSetupKeys];
  unsigned int v63 = [v62 containsObject:kMCCCSkipSetupSiri];

  if (self->_runUpgradeMiniBuddies) {
    unsigned int v64 = v63;
  }
  else {
    unsigned int v64 = 0;
  }
  if (v64 == 1 && [(BuddyDataMigrator *)self _needsVoiceTriggerConfirmation])
  {
    v65 = _BYLoggingFacility();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v65, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Posting follow-up for voice trigger confirmation", (uint8_t *)&buf, 2u);
    }

    id v66 = objc_alloc_init((Class)BYFlowSkipController);
    [v66 didSkipFlow:BYFlowSkipIdentifierSiri];
  }
  BYAssistantFixUpVoiceTriggerStateIfNeeded();
  int v67 = CFPreferencesGetAppBooleanValue(@"RestoreChoice", applicationID, 0);
  int v68 = CFPreferencesGetAppBooleanValue(BYBuddyFinishedInitialRunKey, applicationID, 0);
  if (self->_runUpgradeMiniBuddies)
  {
    if (v67)
    {
      if (!v68)
      {
        v69 = [(BuddyDataMigrator *)self buddyPreferences];
        unsigned __int8 v70 = +[BuddyRestoreState hasStateFromPreferences:v69];

        if ((v70 & 1) == 0)
        {
          v71 = _BYLoggingFacility();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_0, v71, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Resetting RestoreChoice. Did we just update while in Buddy?", (uint8_t *)&buf, 2u);
          }

          CFPreferencesSetAppValue(@"RestoreChoice", 0, applicationID);
        }
      }
    }
  }
  if (self->_runLocalRestoreMiniBuddies || self->_runUpgradeMiniBuddies)
  {
    if (self->_storedBuddyMigratorVersion <= 3)
    {
      uint64_t v157 = 0;
      v158 = &v157;
      uint64_t v159 = 0x2050000000;
      v72 = (void *)qword_270F0;
      uint64_t v160 = qword_270F0;
      if (!qword_270F0)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v162 = sub_8B90;
        v163 = &unk_20950;
        v164 = &v157;
        sub_8B90((uint64_t)&buf);
        v72 = (void *)v158[3];
      }
      id v73 = v72;
      _Block_object_dispose(&v157, 8);
      if ([v73 buddyOfferMightNeedPresenting])
      {
        v74 = _BYLoggingFacility();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_0, v74, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for iCloud Quota", (uint8_t *)&buf, 2u);
        }

        CFPreferencesSetAppValue(@"AppleIDPB10Presented", 0, applicationID);
        CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
      }
    }
    if (self->_runLocalRestoreMiniBuddies
      && +[BuddyMandatoryUpdateUtilities isUpdateRequired])
    {
      v75 = _BYLoggingFacility();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v75, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for required software update", (uint8_t *)&buf, 2u);
      }

      CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    }
    if (self->_runUpgradeMiniBuddies || self->_runLocalRestoreMiniBuddies)
    {
      uint64_t v157 = 0;
      v158 = &v157;
      uint64_t v159 = 0x2050000000;
      v76 = (void *)qword_27100;
      uint64_t v160 = qword_27100;
      if (!qword_27100)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v162 = sub_8D48;
        v163 = &unk_20950;
        v164 = &v157;
        sub_8D48((uint64_t)&buf);
        v76 = (void *)v158[3];
      }
      id v77 = v76;
      _Block_object_dispose(&v157, 8);
      v78 = [v77 bundleWithIdentifier:BYPrivacyPrivacyPaneIdentifier];
      v79 = [v78 privacyFlow];

      v80 = (void *)CFPreferencesCopyAppValue(@"PrivacyContentVersion", applicationID);
      v81 = +[MCProfileConnection sharedConnection];
      v82 = [v81 skipSetupKeys];
      unsigned __int8 v83 = [v82 containsObject:kMCCCSkipSetupPrivacy];

      id v84 = [v79 contentVersion];
      if (v84 > [v80 unsignedIntegerValue])
      {
        v85 = _BYLoggingFacility();
        BOOL v86 = os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT);
        if (v83)
        {
          if (v86)
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_0, v85, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Not queueing mini-buddy to show the privacy pane due to skip key", (uint8_t *)&buf, 2u);
          }
        }
        else
        {
          if (v86)
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_0, v85, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy to show the privacy pane", (uint8_t *)&buf, 2u);
          }

          CFPreferencesSetAppValue(@"PrivacyPresented", 0, applicationID);
          CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
        }
      }

      if (self->_runUpgradeMiniBuddies)
      {
        if ([(BuddyDataMigrator *)self primaryAccountNeedsRepair])
        {
          v87 = _BYLoggingFacility();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_0, v87, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy to show flow to repair primary account", (uint8_t *)&buf, 2u);
          }

          CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
        }
        if (self->_runUpgradeMiniBuddies)
        {
          if ([(BuddyDataMigrator *)self accountNeedsSecurityUpgrade])
          {
            v88 = _BYLoggingFacility();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_0, v88, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy because an account is available for security upgrade.", (uint8_t *)&buf, 2u);
            }

            CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
          }
          if (self->_runUpgradeMiniBuddies)
          {
            if ([(BuddyDataMigrator *)self primaryAccountRequiresTermsAcceptance])
            {
              v89 = _BYLoggingFacility();
              if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_0, v89, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy because the primary account requires terms acceptance", (uint8_t *)&buf, 2u);
              }

              CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
            }
            if (self->_runUpgradeMiniBuddies
              && [(BuddyDataMigrator *)self primaryAccountNeedsEscrowRepair])
            {
              v90 = _BYLoggingFacility();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_0, v90, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy because the primary account needs escrow record repair", (uint8_t *)&buf, 2u);
              }

              CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
            }
          }
        }
      }
    }
  }
  BOOL runUpgradeMiniBuddies = self->_runUpgradeMiniBuddies;
  if (self->_runUpgradeMiniBuddies) {
    char v92 = v63;
  }
  else {
    char v92 = 1;
  }
  if ((v92 & 1) == 0)
  {
    if ([(BuddyDataMigrator *)self shouldUpsellSiri])
    {
      v93 = _BYLoggingFacility();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v93, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Siri upsell", (uint8_t *)&buf, 2u);
      }

      CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    }
    BOOL runUpgradeMiniBuddies = self->_runUpgradeMiniBuddies;
  }
  if (runUpgradeMiniBuddies && [(BuddyDataMigrator *)self _shouldUpsellIntelligence])
  {
    v94 = _BYLoggingFacility();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v94, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Intelligence features upsell", (uint8_t *)&buf, 2u);
    }

    CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
  }
  if (self->_runUpgradeMiniBuddies)
  {
    if ([(BuddyDataMigrator *)self _shouldUpsellVisualIntelligence])
    {
      v95 = _BYLoggingFacility();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v95, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Visual Intelligence features upsell", (uint8_t *)&buf, 2u);
      }

      CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    }
    if (self->_runUpgradeMiniBuddies) {
      goto LABEL_177;
    }
  }
  if ([(BuddyDataMigrator *)self didRestoreFromBackup])
  {
LABEL_177:
    if (self->_storedBuddyMigratorVersion <= 8)
    {
      BOOL v96 = CFPreferencesGetAppBooleanValue(@"ScreenTimePresented", applicationID, 0) != 0;
      int v97 = CFPreferencesGetAppBooleanValue(@"AutoUpdatePresented", applicationID, 0);
      v98 = +[MCProfileConnection sharedConnection];
      v99 = [v98 skipSetupKeys];
      unsigned int v100 = [v99 containsObject:kMCCCSkipScreenTime];

      v101 = +[MCProfileConnection sharedConnection];
      v102 = [v101 skipSetupKeys];
      unsigned __int8 v103 = [v102 containsObject:kMCCCSkipSoftwareUpdate];

      if ((v96 | v100))
      {
        if (v97) {
          char v104 = 1;
        }
        else {
          char v104 = v103;
        }
        if (v104) {
          goto LABEL_191;
        }
      }
      else
      {
        v105 = _BYLoggingFacility();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_0, v105, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Screen Time", (uint8_t *)&buf, 2u);
        }

        if ((v97 != 0) | v103 & 1) {
          goto LABEL_190;
        }
      }
      v106 = _BYLoggingFacility();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v106, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Auto Software Update", (uint8_t *)&buf, 2u);
      }

LABEL_190:
      CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    }
  }
LABEL_191:
  v107 = +[MCProfileConnection sharedConnection];
  v108 = [v107 skipSetupKeys];
  unsigned int v109 = [v108 containsObject:kMCCCSkipSetupAppearance];

  v110 = [(BuddyDataMigrator *)self buddyPreferences];
  unsigned int v111 = [v110 BOOLForKey:@"UserInterfaceStyleModePresented"];

  if (self->_runUpgradeMiniBuddies)
  {
    if ((v111 | v109)) {
      goto LABEL_198;
    }
  }
  else if (([(BuddyDataMigrator *)self didRestoreFromBackup] ^ 1 | v111 | v109))
  {
    goto LABEL_198;
  }
  v112 = _BYLoggingFacility();
  if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_0, v112, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Appearance", (uint8_t *)&buf, 2u);
  }

  CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
LABEL_198:
  if ([(BuddyDataMigrator *)self _needsAppleIDReauthenticationAfterMigration])
  {
    v113 = _BYLoggingFacility();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v113, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Apple ID reauthentication after migration w/ software update", (uint8_t *)&buf, 2u);
    }

    CFStringRef v114 = (const __CFString *)BYBuddyNotBackedUpIdentifier;
    CFPreferencesSetAppValue(@"ForcePrimaryAppleIDAuthentication", kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, v114);
  }
  if (self->_runUpgradeMiniBuddies)
  {
    if (v63) {
      goto LABEL_207;
    }
    goto LABEL_206;
  }
  if ((([(BuddyDataMigrator *)self didRestoreFromBackup] ^ 1 | v63) & 1) == 0)
  {
LABEL_206:
    v154[0] = _NSConcreteStackBlock;
    v154[1] = 3221225472;
    v154[2] = sub_6744;
    v154[3] = &unk_20888;
    v115 = dispatch_semaphore_create(0);
    v155 = v115;
    +[BYSiriUtilities requiresAcknowledgementForDataSharing:v154];
    dispatch_semaphore_wait(v115, 0xFFFFFFFFFFFFFFFFLL);
  }
LABEL_207:
  if ([(BuddyDataMigrator *)self didRestoreFromBackup])
  {
    v116 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
    unsigned int v117 = +[BuddySuspendTask hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:v116];

    if (v117)
    {
      v118 = _BYLoggingFacility();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v118, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for suspend task", (uint8_t *)&buf, 2u);
      }

      CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    }
  }
  if (self->_runUpgradeMiniBuddies
    && [(BuddyDataMigrator *)self _shouldOfferPeriocularEnrollment])
  {
    v119 = _BYLoggingFacility();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v119, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Face ID periocular enrollment", (uint8_t *)&buf, 2u);
    }

    CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
  }
  if (self->_runLocalRestoreMiniBuddies)
  {
    v120 = +[ACAccountStore defaultStore];
    v121 = objc_msgSend(v120, "aa_primaryAppleAccount");
    BOOL v122 = v121 == 0;

    if (!v122)
    {
      v123 = _BYLoggingFacility();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v123, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Apple ID re-authentication after local restore", (uint8_t *)&buf, 2u);
      }

      CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    }
  }
  if (self->_runUpgradeMiniBuddies)
  {
    id v124 = [objc_alloc((Class)SUManagerClient) initWithDelegate:0 clientType:0];
    if ([v124 isAutomaticDownloadEnabled]) {
      unsigned int v125 = [v124 isAutomaticUpdateV2Enabled] ^ 1;
    }
    else {
      unsigned int v125 = 1;
    }
    if (self->_storedBuddyMigratorVersion < 0xC) {
      unsigned int v126 = v125;
    }
    else {
      unsigned int v126 = 0;
    }
    v127 = +[MCProfileConnection sharedConnection];
    v128 = [v127 skipSetupKeys];
    unsigned int v129 = [v128 containsObject:kMCCCSkipSoftwareUpdate];

    if (((v126 ^ 1 | v129) & 1) == 0)
    {
      v130 = _BYLoggingFacility();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v130, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Auto Software Update re-prompt", (uint8_t *)&buf, 2u);
      }

      CFPreferencesSetAppValue(@"AutoUpdatePresented", 0, applicationID);
      CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    }
  }
  if ([(BuddyDataMigrator *)self didUpgrade] && BYIsRunningInStoreDemoMode())
  {
    v131 = _BYLoggingFacility();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v131, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Dequeueing mini-buddy for store demo device", (uint8_t *)&buf, 2u);
    }

    CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
  }
  if ([(BuddyDataMigrator *)self didRestoreFromBackup]
    && BYIsRunningInStoreDemoMode())
  {
    v132 = _BYLoggingFacility();
    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v132, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for post demo restore", (uint8_t *)&buf, 2u);
    }

    CFPreferencesSetAppValue(BYBuddyRunPostDemoRestoreMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
  }
  if (self->_runUpgradeMiniBuddies)
  {
    v133 = [(BuddyDataMigrator *)self featureFlags];
    if ([v133 isStolenDeviceProtectionEnabled])
    {
      unsigned int v134 = [(BuddyDataMigrator *)self _shouldOfferStolenDeviceProtection];

      if (v134)
      {
        v135 = _BYLoggingFacility();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_0, v135, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for Stolen Device Protection", (uint8_t *)&buf, 2u);
        }

        CFPreferencesSetAppValue(BYBuddyRunStolenDeviceProtectionMiniBuddy, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
      }
    }
    else
    {
    }
  }
  CFStringRef v136 = (const __CFString *)BYBuddyNotBackedUpIdentifier;
  int v137 = CFPreferencesGetAppBooleanValue(@"ShouldShowSIMSetupInRestoreMiniBuddy", BYBuddyNotBackedUpIdentifier, 0);
  unsigned int v138 = [(BuddyDataMigrator *)self didRestoreFromBackup];
  if (v137) {
    unsigned int v139 = v138;
  }
  else {
    unsigned int v139 = 0;
  }
  if (v139 == 1)
  {
    v140 = _BYLoggingFacility();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v140, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing mini-buddy for SIM transfer", (uint8_t *)&buf, 2u);
    }

    CFPreferencesSetAppValue(BYBuddyRunRestoreSIMSetupMiniBuddy, kCFBooleanTrue, v136);
  }
  CFPreferencesSetAppValue(@"ShouldShowSIMSetupInRestoreMiniBuddy", 0, v136);
  id v141 = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
  objc_msgSend(v141, "migrateWithStoredMigratorVersion:userDataDisposition:", self->_storedBuddyMigratorVersion, -[BuddyDataMigrator userDataDisposition](self, "userDataDisposition"));
  id v142 = objc_alloc_init((Class)BYAnalyticsManager);
  if (([(BuddyDataMigrator *)self userDataDisposition] & 0x40) != 0)
  {
    uint64_t v143 = 2;
  }
  else
  {
    if (([(BuddyDataMigrator *)self userDataDisposition] & 0x10) == 0) {
      goto LABEL_263;
    }
    uint64_t v143 = 1;
  }
  v144 = +[NSNumber numberWithUnsignedInteger:v143];
  [v142 addPowerLogEvent:1 withPayload:v144];

LABEL_263:
  v145 = +[BYSetupUserDisposition current];
  v146 = [v145 date];
  [v146 timeIntervalSince1970];
  double v148 = v147;

  if (v148 != 0.0)
  {
    v149 = +[NSNumber numberWithDouble:v148];
    [v142 addPowerLogEvent:0 withPayload:v149];
  }
  [v142 commit];

  return 1;
}

- (void)_performHSA2Migration
{
  if (self->_runLocalRestoreMiniBuddies || self->_runUpgradeMiniBuddies)
  {
    CFStringRef v3 = +[ACAccountStore defaultStore];
    CFStringRef v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

    if (!v4)
    {
LABEL_21:

      return;
    }
    if (CFPreferencesGetAppBooleanValue(@"HSA2UpgradeMiniBuddy3Ran", BYSetupAssistantBundleIdentifier, 0)
      || (objc_msgSend(v4, "aa_personID"),
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v6 = +[CDPAccount isICDPEnabledForDSID:v5], v5, (v6 & 1) != 0))
    {
      if (self->_storedBuddyMigratorVersion > 1
        || (objc_msgSend(v4, "aa_personID"),
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            unsigned int v8 = +[CDPAccount isICDPEnabledForDSID:v7], v7, !v8))
      {
        if (!self->_runUpgradeMiniBuddies) {
          goto LABEL_21;
        }
        if (self->_storedBuddyMigratorVersion > 7) {
          goto LABEL_21;
        }
        objc_super v12 = objc_msgSend(v4, "aa_personID");
        unsigned int v13 = +[CDPAccount isICDPEnabledForDSID:v12];

        if (!v13) {
          goto LABEL_21;
        }
        v9 = _BYLoggingFacility();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Queueing silent ICDP record upgrade", v15, 2u);
        }
        id v14 = (CFStringRef *)&BYBuddyRunSilentICDPUpgrade;
        goto LABEL_20;
      }
      v9 = _BYLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = 0;
        id v10 = "BuddyMigrator: Queueing HSA2 mini-buddy for record update";
        v11 = (uint8_t *)&v16;
LABEL_18:
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else
    {
      v9 = _BYLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        id v10 = "BuddyMigrator: Queueing HSA2 mini-buddy";
        v11 = buf;
        goto LABEL_18;
      }
    }
    id v14 = (CFStringRef *)&BYBuddyRunHSA2MiniBuddy;
LABEL_20:

    CFPreferencesSetAppValue(*v14, kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    goto LABEL_21;
  }
}

- (void)_applyPreRestoreSettings
{
  if (([(BuddyDataMigrator *)self userDataDisposition] & 4) != 0)
  {
    int v3 = [(BuddyDataMigrator *)self userDataDisposition] & 0x10;
    if (v3 | [(BuddyDataMigrator *)self userDataDisposition] & 0x40)
    {
      id v4 = objc_alloc_init((Class)BFFSettingsManager);
      [v4 applySafeHavenStash];
    }
  }
}

- (void)_migrateKeys
{
  int v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_15C30();
  }

  [(BuddyDataMigrator *)self _migrateStolenDeviceProtectionPreferenceKeys];
}

- (void)_cleanupKeys
{
  int v3 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
  [v3 removeObjectForKey:BYBuddySoftwareUpdateMigration onlyFromMemory:0];

  id v4 = [(BuddyDataMigrator *)self buddyPreferences];
  [v4 removeObjectForKey:@"DebugFlowItemClassNames" onlyFromMemory:0];

  CFPreferencesSetAppValue(@"AppleIDForceUpgrade", 0, @"com.apple.purplebuddy");
  CFPreferencesSetAppValue(@"AnimateLanugageChoice", 0, @"com.apple.purplebuddy");
  CFPreferencesSetAppValue(@"MagnifyPresented", 0, @"com.apple.purplebuddy");
  uint64_t v5 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
  unsigned __int8 v6 = +[BuddyMigrationState loadFromPreferences:v5];

  if (v6)
  {
    if (!self->_runUpgradeMiniBuddies)
    {
      uint64_t v7 = _BYLoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        unsigned int v8 = "Clearing migration state as we are not in a Post Upgrade state";
        v9 = buf;
        goto LABEL_8;
      }
LABEL_9:

      id v10 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
      +[BuddyMigrationState removeFromPreferences:v10];

      goto LABEL_10;
    }
    if ([v6 intent] == (char *)&dword_0 + 1)
    {
      uint64_t v7 = _BYLoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        unsigned int v8 = "Clearing migration state as the intent was set to source device";
        v9 = (uint8_t *)&v18;
LABEL_8:
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
LABEL_10:
  v11 = +[BYPreferencesController buddyPreferences];
  objc_super v12 = [v11 objectForKey:@"AppStorePresented"];

  if (v12)
  {
    unsigned int v13 = [(BuddyDataMigrator *)self didUpgrade];
    id v14 = +[BYPreferencesController buddyPreferences];
    [v14 removeObjectForKey:@"AppStorePresented" onlyFromMemory:0];

    if (v13)
    {
      v15 = +[BYPreferencesController buddyPreferencesExcludedFromBackup];
      [v15 setObject:v12 forKey:@"AppStorePresented" persistImmediately:1];
    }
  }
  __int16 v16 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
  +[BuddySetupAnalytics removeFromDiskWithPreferences:v16];

  CFPreferencesSetAppValue(@"DisplayZoomRestart", 0, @"com.apple.purplebuddy.notbackedup");
  v17 = [(BuddyDataMigrator *)self buddyPreferences];
  [v17 removeObjectForKey:@"IntelligencePresented" onlyFromMemory:0];
}

- (void)_migrateChronicle
{
  int v3 = [(BuddyDataMigrator *)self buddyPreferences];
  id v7 = [v3 objectForKey:@"LastPresentedApplePay"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [objc_alloc((Class)BYChronicleEntry) initWithProductVersion:v7];
    uint64_t v5 = [(BuddyDataMigrator *)self chronicle];
    [v5 addEntry:v4 forFeature:1];

    unsigned __int8 v6 = [(BuddyDataMigrator *)self buddyPreferences];
    [v6 removeObjectForKey:@"LastPresentedApplePay" onlyFromMemory:0];
  }
}

- (BOOL)performMigration
{
  int v3 = +[NSDate date];
  unsigned int v4 = [(BuddyDataMigrator *)self didRestoreFromBackup];
  uint64_t v5 = +[BYSetupStateManager sharedManager];
  self->_BOOL restoredIniTunes = [v5 restoreType] == (char *)&dword_0 + 1;

  unsigned int v6 = [(BuddyDataMigrator *)self didUpgrade];
  unsigned __int8 v7 = +[BYManagedAppleIDBootstrap isMultiUser];
  self->_BOOL isMultiUser = v7;
  self->_BOOL runUpgradeMiniBuddies = v6 & (v7 ^ 1);
  if (v4) {
    BOOL restoredIniTunes = self->_restoredIniTunes;
  }
  else {
    BOOL restoredIniTunes = 0;
  }
  self->_runLocalRestoreMiniBuddies = restoredIniTunes;
  self->_unsigned int storedBuddyMigratorVersion = [(BuddyDataMigrator *)self _storedBuddyMigratorVersion];
  self->_storedBuddyVersion = [(BuddyDataMigrator *)self _storedBuddyVersion];
  v9 = [(BuddyDataMigrator *)self buddyPreferences];
  uint64_t v10 = BYChronicleKey;
  v11 = [v9 objectForKey:BYChronicleKey];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v12 = [objc_alloc((Class)BYChronicle) initWithDictionary:v11];
    [(BuddyDataMigrator *)self setChronicle:v12];
  }
  else
  {
    if (!v11) {
      goto LABEL_10;
    }
    objc_super v12 = _BYLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_15CA4((uint64_t)v11, v12);
    }
  }

LABEL_10:
  unsigned int v13 = [(BuddyDataMigrator *)self chronicle];

  if (!v13)
  {
    id v14 = _BYLoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Creating new chronicle...", (uint8_t *)&v41, 2u);
    }

    id v15 = objc_alloc_init((Class)BYChronicle);
    [(BuddyDataMigrator *)self setChronicle:v15];
  }
  [(BuddyDataMigrator *)self _migrateChronicle];
  unsigned int v16 = [(BuddyDataMigrator *)self userDataDisposition];
  v17 = _BYLoggingFacility();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v18 = self->_restoredIniTunes;
    BOOL isMultiUser = self->_isMultiUser;
    int v41 = 67110144;
    *(_DWORD *)v42 = v4;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = (v16 >> 6) & 1;
    __int16 v43 = 1024;
    BOOL v44 = v18;
    __int16 v45 = 1024;
    unsigned int v46 = v6;
    __int16 v47 = 1024;
    BOOL v48 = isMultiUser;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: didRestore=%d, restoredFromDevice=%d, restoredIniTunes=%d, didUpgrade=%d, isMultiUser=%d", (uint8_t *)&v41, 0x20u);
  }

  v20 = _BYLoggingFacility();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)CFCopySystemVersionString();
    int v41 = 138543362;
    *(void *)v42 = v21;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Running %{public}@", (uint8_t *)&v41, 0xCu);
  }
  BOOL v22 = [(BuddyDataMigrator *)self _performiOSMigration];
  if (([(BuddyDataMigrator *)self didUpgrade] & 1) != 0
    || [(BuddyDataMigrator *)self didRestoreFromBackup])
  {
    id v23 = objc_alloc_init((Class)BYFlowSkipController);
    [v23 revisePendingFollowUpsForcingRepost:1];
  }
  [(BuddyDataMigrator *)self _cleanupKeys];
  CFStringRef v24 = (const __CFString *)BYSetupAssistantBundleIdentifier;
  CFPreferencesSetAppValue(@"setupMigratorVersion", &off_21D58, BYSetupAssistantBundleIdentifier);
  CFPreferencesAppSynchronize(v24);
  CFPreferencesAppSynchronize(BYBuddyNotBackedUpIdentifier);
  int v25 = [(BuddyDataMigrator *)self buddyPreferences];
  v26 = [(BuddyDataMigrator *)self chronicle];
  v27 = [v26 dictionaryRepresentation];
  [v25 setObject:v27 forKey:v10];

  v28 = [(BuddyDataMigrator *)self buddyPreferences];
  [v28 persist];

  BOOL v29 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
  if (+[BuddyMigrationState hasStateFromPreferences:v29])
  {
  }
  else
  {
    v30 = [(BuddyDataMigrator *)self buddyPreferences];
    unsigned int v31 = +[BuddyRestoreState hasStateFromPreferences:v30];

    if (!v31) {
      goto LABEL_29;
    }
  }
  if (BYSetupAssistantHasCompletedInitialRun())
  {
    v32 = _BYLoggingFacility();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      sub_15C64();
    }

    id v33 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
    +[BuddyMigrationState removeFromPreferences:v33];

    v34 = [(BuddyDataMigrator *)self buddyPreferences];
    +[BuddyRestoreState removeFromPreferences:v34];
  }
  else
  {
    [(BuddyDataMigrator *)self deferDataMigratorExit];
  }
LABEL_29:
  self->_done = 1;
  v35 = +[NSDate date];
  [v35 timeIntervalSinceDate:v3];
  uint64_t v37 = v36;

  v38 = _BYLoggingFacility();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 134217984;
    *(void *)v42 = v37;
    _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "BuddyMigrator took %fs", (uint8_t *)&v41, 0xCu);
  }

  v39 = _BYLoggingFacility();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v41) = 0;
    _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Finished.", (uint8_t *)&v41, 2u);
  }

  return v22;
}

- (BOOL)primaryAccountNeedsRepair
{
  v2 = +[AKAccountManager sharedInstance];
  int v3 = [v2 primaryAuthKitAccount];

  if (v3)
  {
    unsigned int v4 = +[AKAccountManager sharedInstance];
    uint64_t v5 = (char *)[v4 repairStateForAccount:v3];

    BOOL v6 = v5 != (unsigned char *)&dword_0 + 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)accountNeedsSecurityUpgrade
{
  v2 = +[AKAccountManager sharedInstance];
  int v3 = [v2 accountEligibleForUpdate];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)primaryAccountRequiresTermsAcceptance
{
  v2 = +[AKAccountManager sharedInstance];
  int v3 = [v2 store];
  BOOL v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  if (v4)
  {
    uint64_t v5 = objc_msgSend(v4, "aa_altDSID");
    id v11 = 0;
    BOOL v6 = +[SecureBackup getAcceptedTermsForAltDSID:v5 withError:&v11];
    id v7 = v11;

    if (v7)
    {
      unsigned int v8 = _BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_15D40(v4, v7, v8);
      }

      BOOL v9 = 0;
    }
    else
    {
      BOOL v9 = v6 == 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)primaryAccountNeedsEscrowRepair
{
  v2 = +[CDPAccount sharedInstance];
  unsigned __int8 v3 = [v2 primaryAccountNeedsEscrowRecordRepair];

  return v3;
}

- (BOOL)shouldUpsellSiri
{
  return _BYAssistantScreenShouldBeShownInSetupAssistant(self, a2);
}

- (BOOL)_needsVoiceTriggerConfirmation
{
  return _BYAssistantScreenShouldRunForVTConfirmation(self, a2);
}

- (BOOL)_shouldUpsellIntelligence
{
  unsigned __int8 v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Checking Intelligence upsell", buf, 2u);
  }

  BOOL v4 = +[MCProfileConnection sharedConnection];
  uint64_t v5 = [v4 skipSetupKeys];
  unsigned __int8 v6 = [v5 containsObject:kCCSkipKeyIntelligence];

  if (v6) {
    return 0;
  }
  *(void *)long long buf = 0;
  v27 = buf;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  BOOL v9 = [_TtC13BuddyMigrator19IntelligenceManager alloc];
  featureFlags = self->_featureFlags;
  id v11 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
  objc_super v12 = [(IntelligenceManager *)v9 initWithFeatureFlags:featureFlags preferences:v11];

  unsigned int v13 = [(BuddyDataMigrator *)self buddyPreferences];
  unsigned int v14 = [v13 BOOLForKey:@"IntelligencePresented"];

  id v15 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
  unsigned int v16 = [v15 BOOLForKey:@"IntelligencePresented"];

  if (((v16 | v14 ^ 1) & 1) == 0)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_7978;
    v23[3] = &unk_208B0;
    v23[4] = self;
    char v25 = v14;
    v17 = v8;
    CFStringRef v24 = v17;
    [(IntelligenceManager *)v12 isIntelligenceEnabledWithCompletionHandler:v23];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_7A40;
  v20[3] = &unk_208D8;
  BOOL v22 = buf;
  BOOL v18 = v8;
  v21 = v18;
  [(IntelligenceManager *)v12 shouldShowIntelligenceWithServerCheck:0 completionHandler:v20];
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v7 = v27[24] != 0;

  _Block_object_dispose(buf, 8);
  return v7;
}

- (BOOL)_shouldUpsellVisualIntelligence
{
  unsigned __int8 v3 = +[BYDevice currentDevice];
  unsigned __int8 v4 = [v3 hasCameraButton];
  uint64_t v5 = _BYLoggingFacility();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) == 0)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Visual Intelligence is not applicable", buf, 2u);
    }

    goto LABEL_9;
  }
  if (v6)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Checking Visual Intelligence upsell", buf, 2u);
  }

  BOOL v7 = +[MCProfileConnection sharedConnection];
  dispatch_semaphore_t v8 = [v7 skipSetupKeys];
  unsigned __int8 v9 = [v8 containsObject:kCCSkipKeyCameraButton];

  if (v9)
  {
LABEL_9:
    BOOL v16 = 0;
    goto LABEL_10;
  }
  *(void *)long long buf = 0;
  BOOL v22 = buf;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  id v11 = [_TtC13BuddyMigrator19IntelligenceManager alloc];
  featureFlags = self->_featureFlags;
  unsigned int v13 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
  unsigned int v14 = [(IntelligenceManager *)v11 initWithFeatureFlags:featureFlags preferences:v13];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_7C8C;
  v18[3] = &unk_208D8;
  v20 = buf;
  id v15 = v10;
  unsigned int v19 = v15;
  [(IntelligenceManager *)v14 isIntelligenceEnabledWithCompletionHandler:v18];
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v16 = v22[24] != 0;

  _Block_object_dispose(buf, 8);
LABEL_10:

  return v16;
}

- (BOOL)_needsAppleIDReauthenticationAfterMigration
{
  if (([(BuddyDataMigrator *)self userDataDisposition] & 0x40) == 0) {
    return 0;
  }
  unsigned __int8 v4 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
  unsigned __int8 v5 = [v4 BOOLForKey:BYBuddySoftwareUpdateMigration];

  BOOL v6 = +[ACAccountStore defaultStore];
  BOOL v7 = objc_msgSend(v6, "aa_primaryAppleAccount");

  if (v7) {
    BOOL v3 = v5;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)deferDataMigratorExit
{
  id v2 = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
  [v2 deferDataMigratorExit];
}

- (BOOL)_shouldOfferPeriocularEnrollment
{
  BOOL v3 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v4 = [v3 skipSetupKeys];
  unsigned __int8 v5 = [v4 containsObject:kMCCCSkipSetupBiometric];

  if (v5) {
    return 0;
  }
  BOOL v6 = [(BuddyDataMigrator *)self buddyPreferences];
  unsigned __int8 v7 = [v6 BOOLForKey:@"FaceIDPeriocularPresented"];

  if (v7) {
    return 0;
  }
  dispatch_semaphore_t v8 = +[MCProfileConnection sharedConnection];
  unsigned int v9 = [v8 isPasscodeSet];

  if (!v9) {
    return 0;
  }
  uint64_t v10 = [(BuddyDataMigrator *)self capabilities];
  unsigned __int8 v11 = [(id)v10 supportsPeriocularFaceID];

  objc_super v12 = [(BuddyDataMigrator *)self capabilities];
  LOBYTE(v10) = [v12 hasEligibleEnrolledIdentityForPeriocularFaceIDEnrollment];

  return v11 & v10;
}

- (BOOL)_isSignificantLocationsEnabled
{
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  BOOL v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Will call routine manager.", buf, 2u);
  }

  unsigned __int8 v4 = +[RTRoutineManager defaultManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_816C;
  v14[3] = &unk_20900;
  BOOL v16 = &v23;
  v17 = &v19;
  unsigned __int8 v5 = v2;
  id v15 = v5;
  [v4 fetchRoutineStateWithHandler:v14];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Did finish waiting for routine manager", buf, 2u);
  }

  if (*((unsigned char *)v20 + 24))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_8274;
    v11[3] = &unk_20928;
    unsigned int v13 = &v23;
    unsigned __int8 v7 = v5;
    objc_super v12 = v7;
    [v4 fetchRoutineStateWithHandler:v11];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_t v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "BuddyMigrator: Did finish waiting for routine manager", buf, 2u);
    }
  }
  char v9 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v9;
}

- (void)_migrateStolenDeviceProtectionPreferenceKeys
{
  if ([(BuddyDataMigrator *)self didRestoreFromBackup])
  {
    BOOL v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_15E50();
    }
    uint64_t v4 = 0;
LABEL_9:

    unsigned __int8 v7 = +[LARatchetManager sharedInstance];
    id v8 = [v7 isFeatureEnabled];

    char v9 = [BYStolenDeviceProtectionPreferenceMigrator alloc];
    uint64_t v10 = [(BuddyDataMigrator *)self buddyPreferences];
    unsigned __int8 v11 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
    BOOL v3 = [(BYStolenDeviceProtectionPreferenceMigrator *)v9 initWithMigrationContext:v4 sourcePreferences:v10 targetPreferences:v11];

    [v3 migratePreferenceWithSDPEnabledState:v8];
    goto LABEL_12;
  }
  unsigned int v5 = [(BuddyDataMigrator *)self didUpgrade];
  BOOL v3 = _BYLoggingFacility();
  BOOL v6 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v6) {
      sub_15E84();
    }
    uint64_t v4 = 1;
    goto LABEL_9;
  }
  if (v6) {
    sub_15EB8();
  }
LABEL_12:
}

- (BOOL)_shouldOfferStolenDeviceProtection
{
  BOOL v3 = [(BuddyDataMigrator *)self buddyPreferencesExcludedFromBackup];
  unsigned int v4 = [v3 BOOLForKey:@"StolenDeviceProtectionPresented"];

  if (v4)
  {
    unsigned int v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      BOOL v6 = "BuddyMigrator: StolenDeviceProtectionPresented is true";
LABEL_23:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  unsigned __int8 v7 = +[LARatchetManager sharedInstance];
  unsigned int v8 = [v7 isFeatureEnabled];

  if (!v8)
  {
    char v9 = +[LARatchetManager sharedInstance];
    int v10 = [v9 isFeatureAvailable];

    if ((v10 & 1) == 0)
    {
      unsigned int v5 = _BYLoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        BOOL v6 = "BuddyMigrator: ratchet manager feature not available";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if (!+[CLLocationManager locationServicesEnabled])
    {
      unsigned int v5 = _BYLoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        BOOL v6 = "BuddyMigrator: location services disabled";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    unsigned __int8 v11 = +[AKAccountManager sharedInstance];
    unsigned int v5 = [v11 primaryAuthKitAccount];

    if (v5)
    {
      objc_super v12 = +[AKAccountManager sharedInstance];
      unsigned int v13 = (int *)[v12 securityLevelForAccount:v5];

      if (v13 == &dword_4)
      {
        id v14 = objc_alloc_init((Class)CDPStateController);
        id v25 = 0;
        unsigned __int8 v15 = [v14 isManateeAvailable:&v25];
        BOOL v16 = v25;

        if (v16)
        {
          v17 = _BYLoggingFacility();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_15EEC(v16, v17);
          }
        }
        if (v15)
        {
          if ([(BuddyDataMigrator *)self _isSignificantLocationsEnabled])
          {
            id v18 = objc_alloc_init((Class)BYFindMyManager);
            unsigned __int8 v19 = [v18 isFindMyEnabled];

            if (v19)
            {
              BOOL v20 = 1;
LABEL_40:

              goto LABEL_25;
            }
            uint64_t v23 = _BYLoggingFacility();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_38;
            }
            *(_WORD *)long long buf = 0;
            char v24 = "BuddyMigrator: find my disabled";
            goto LABEL_37;
          }
          uint64_t v23 = _BYLoggingFacility();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            char v24 = "BuddyMigrator: significant locations disabled";
            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v23 = _BYLoggingFacility();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            char v24 = "BuddyMigrator: manatee not available";
LABEL_37:
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
          }
        }
LABEL_38:

        goto LABEL_39;
      }
      BOOL v16 = _BYLoggingFacility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        char v22 = "BuddyMigrator: primary authkit account not HSA2";
        goto LABEL_30;
      }
    }
    else
    {
      BOOL v16 = _BYLoggingFacility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        char v22 = "BuddyMigrator: no primary authkit account";
LABEL_30:
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
      }
    }
LABEL_39:
    BOOL v20 = 0;
    goto LABEL_40;
  }
  unsigned int v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    BOOL v6 = "BuddyMigrator: ratchet manager feature already enabled";
    goto LABEL_23;
  }
LABEL_24:
  BOOL v20 = 0;
LABEL_25:

  return v20;
}

- (BYChronicle)chronicle
{
  return (BYChronicle *)objc_getProperty(self, a2, 40, 1);
}

- (void)setChronicle:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);

  objc_storeStrong((id *)&self->_chronicle, 0);
}

@end