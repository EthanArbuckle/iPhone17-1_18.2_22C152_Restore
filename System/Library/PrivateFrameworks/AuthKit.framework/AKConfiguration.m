@interface AKConfiguration
+ (id)sharedConfiguration;
- (AKConfiguration)init;
- (BOOL)_validCloudPartition:(int64_t)a3;
- (NSData)strongDeviceIdentityMarker;
- (NSString)lastKnownLocale;
- (id)configurationValueForKey:(id)a3;
- (int64_t)contactKeyVerification;
- (int64_t)criticalAccountEditsAllowedOverride;
- (int64_t)deviceSafetyRestrictionReasonOverride;
- (int64_t)forceHasSOSActiveDevice;
- (int64_t)forceSOSNeeded;
- (int64_t)forceSilentBurnCDPRepairEnabled;
- (int64_t)forceSilentEscrowRecordRepairEnabled;
- (int64_t)forceSilentEscrowRecordRepairEnabledV2;
- (int64_t)overrideForKey:(id)a3;
- (int64_t)piggybackingIDMSPresenceOverride;
- (int64_t)piggybackingLocalPresenceOverride;
- (int64_t)requestedCloudPartition;
- (int64_t)shouldAddHSA2CreateHeader;
- (int64_t)shouldAllowDemoMode;
- (int64_t)shouldAllowExperimentalMode;
- (int64_t)shouldAllowPhoneNumberAccounts;
- (int64_t)shouldAllowTestApplication;
- (int64_t)shouldAlwaysShowWelcome;
- (int64_t)shouldAskToBuy;
- (int64_t)shouldAutocycleAppsInTiburon;
- (int64_t)shouldAutocycleAppsInWebTakeover;
- (int64_t)shouldBypassCustodianDeviceCheck;
- (int64_t)shouldDisablePiggybacking;
- (int64_t)shouldEnableAttestationLogging;
- (int64_t)shouldEnableBeneficiaryLiveOn;
- (int64_t)shouldEnablePiggybackingPresence;
- (int64_t)shouldEnableTelemetryOptIn;
- (int64_t)shouldEnableTestAccountMode;
- (int64_t)shouldFakeAuthSuccess;
- (int64_t)shouldForceBaaValidation;
- (int64_t)shouldHideInternalBuildHeader;
- (int64_t)shouldHideSeedBuildHeader;
- (int64_t)shouldRequestPiggybackingPresenceEnforcement;
- (int64_t)shouldSuppressHSA2Suggestions;
- (int64_t)shouldSuppressModalSheetsInMacBuddy;
- (int64_t)telemetryOptInGracePeriodOverride;
- (unint64_t)internalFeaturesMaskValue;
- (unint64_t)lastKnownIDMSEnvironment;
- (void)dealloc;
- (void)setConfigurationValue:(id)a3 forKey:(id)a4;
- (void)setContactKeyVerification:(int64_t)a3;
- (void)setCriticalAccountEditsAllowedOverride:(int64_t)a3;
- (void)setDeviceSafetyRestrictionReasonOverride:(int64_t)a3;
- (void)setForceHasSOSActiveDevice:(int64_t)a3;
- (void)setForceSOSNeeded:(int64_t)a3;
- (void)setForceSilentBurnCDPRepairEnabled:(int64_t)a3;
- (void)setForceSilentEscrowRecordRepairEnabled:(int64_t)a3;
- (void)setForceSilentEscrowRecordRepairEnabledV2:(int64_t)a3;
- (void)setLastKnownIDMSEnvironment:(unint64_t)a3;
- (void)setLastKnownLocale:(id)a3;
- (void)setOverride:(int64_t)a3 forKey:(id)a4;
- (void)setPiggybackingIDMSPresenceOverride:(int64_t)a3;
- (void)setPiggybackingLocalPresenceOverride:(int64_t)a3;
- (void)setRequestedCloudPartition:(int64_t)a3;
- (void)setShouldAddHSA2CreateHeader:(int64_t)a3;
- (void)setShouldAllowDemoMode:(int64_t)a3;
- (void)setShouldAllowExperimentalMode:(int64_t)a3;
- (void)setShouldAllowPhoneNumberAccounts:(int64_t)a3;
- (void)setShouldAllowTestApplication:(int64_t)a3;
- (void)setShouldAlwaysShowWelcome:(int64_t)a3;
- (void)setShouldAskToBuy:(int64_t)a3;
- (void)setShouldAutocycleAppsInTiburon:(int64_t)a3;
- (void)setShouldAutocycleAppsInWebTakeover:(int64_t)a3;
- (void)setShouldBypassCustodianDeviceCheck:(int64_t)a3;
- (void)setShouldDisablePiggybacking:(int64_t)a3;
- (void)setShouldEnableAttestationLogging:(int64_t)a3;
- (void)setShouldEnableBeneficiaryLiveOn:(int64_t)a3;
- (void)setShouldEnablePiggybackingPresence:(int64_t)a3;
- (void)setShouldEnableTelemetryOptIn:(int64_t)a3;
- (void)setShouldEnableTestAccountMode:(int64_t)a3;
- (void)setShouldFakeAuthSuccess:(int64_t)a3;
- (void)setShouldForceBaaValidation:(int64_t)a3;
- (void)setShouldHideInternalBuildHeader:(int64_t)a3;
- (void)setShouldHideSeedBuildHeader:(int64_t)a3;
- (void)setShouldSuppressHSA2Suggestions:(int64_t)a3;
- (void)setShouldSuppressModalSheetsInMacBuddy:(int64_t)a3;
- (void)setStrongDeviceIdentityMarker:(id)a3;
- (void)setTelemetryOptInGracePeriodOverride:(int64_t)a3;
@end

@implementation AKConfiguration

uint64_t __44__AKConfiguration_configurationValueForKey___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

uint64_t __44__AKConfiguration_configurationValueForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

uint64_t __38__AKConfiguration_sharedConfiguration__block_invoke()
{
  sharedConfiguration_sharedConfiguration = objc_alloc_init(AKConfiguration);

  return MEMORY[0x1F41817F8]();
}

- (AKConfiguration)init
{
  v10.receiver = self;
  v10.super_class = (Class)AKConfiguration;
  v2 = [(AKConfiguration *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.authkit.config", v3);
    settingsQueue = v2->_settingsQueue;
    v2->_settingsQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_settingsQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __23__AKConfiguration_init__block_invoke;
    handler[3] = &unk_1E57606E8;
    v9 = v2;
    notify_register_dispatch("AKConfigurationDidChangeNotification", &v2->_notificationToken, v6, handler);
  }
  return v2;
}

- (int64_t)shouldAllowTestApplication
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKAddTestApplicationHeader"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)configurationValueForKey:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    id v27 = 0;
    settingsQueue = self->_settingsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__AKConfiguration_configurationValueForKey___block_invoke;
    block[3] = &unk_1E575F7C8;
    v21 = &v22;
    block[4] = self;
    id v7 = v4;
    id v20 = v7;
    dispatch_sync(settingsQueue, block);
    v8 = (void *)v23[5];
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      id v9 = [v11 objectForKey:v7];

      if (v9)
      {
        v12 = self->_settingsQueue;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __44__AKConfiguration_configurationValueForKey___block_invoke_2;
        v16[3] = &unk_1E5760710;
        v16[4] = self;
        id v17 = v7;
        id v13 = v9;
        id v18 = v13;
        dispatch_barrier_async(v12, v16);
        id v14 = v13;
      }
    }

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    objc_super v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AKConfiguration configurationValueForKey:](v10);
    }

    id v9 = 0;
  }

  return v9;
}

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1) {
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedConfiguration_sharedConfiguration;

  return v2;
}

- (unint64_t)lastKnownIDMSEnvironment
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKLastIDMSEnvironment"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (int64_t)shouldEnableAttestationLogging
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKOverrideAttestationLoggingKey"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

uint64_t __23__AKConfiguration_init__block_invoke(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __23__AKConfiguration_init__block_invoke_cold_1(v2);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

- (void)dealloc
{
  int notificationToken = self->_notificationToken;
  if (notificationToken) {
    notify_cancel(notificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)AKConfiguration;
  [(AKConfiguration *)&v4 dealloc];
}

- (void)setConfigurationValue:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
    CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)*MEMORY[0x1E4F1D3B8]);
    CFPreferencesSynchronize(v4, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    notify_post("AKConfigurationDidChangeNotification");
  }
  else
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AKConfiguration configurationValueForKey:](v5);
    }
  }
}

- (int64_t)overrideForKey:(id)a3
{
  int64_t v3 = [(AKConfiguration *)self configurationValueForKey:a3];
  uint64_t v4 = [v3 integerValue];

  if (v4 >= 1) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = v4;
  }
  if (v5 < 0) {
    return -1;
  }
  else {
    return v5;
  }
}

- (void)setOverride:(int64_t)a3 forKey:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v8 forKey:v7];
}

- (int64_t)shouldFakeAuthSuccess
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKFakeAuthSuccess"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldFakeAuthSuccess:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKFakeAuthSuccess"];
}

- (int64_t)shouldDisablePiggybacking
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKDisablePiggy"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldDisablePiggybacking:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKDisablePiggy"];
}

- (int64_t)shouldSuppressHSA2Suggestions
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKSuppressHSA2Suggestions"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldSuppressHSA2Suggestions:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKSuppressHSA2Suggestions"];
}

- (int64_t)shouldAddHSA2CreateHeader
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKAddHS2CreateHeader"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldAddHSA2CreateHeader:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKAddHS2CreateHeader"];
}

- (int64_t)shouldAllowPhoneNumberAccounts
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKAllowPhoneNumberAccounts"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldAllowPhoneNumberAccounts:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKAllowPhoneNumberAccounts"];
}

- (int64_t)shouldAllowExperimentalMode
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKAddExperimentalModeHeader"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldAllowExperimentalMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKAddExperimentalModeHeader"];
}

- (int64_t)shouldHideInternalBuildHeader
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKHideInternalBuildHeader"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldHideInternalBuildHeader:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKHideInternalBuildHeader"];
}

- (int64_t)shouldHideSeedBuildHeader
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKHideSeedBuildHeader"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldHideSeedBuildHeader:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKHideSeedBuildHeader"];
}

- (int64_t)shouldAllowDemoMode
{
  int64_t v3 = +[AKDevice currentDevice];
  int v4 = [v3 isInternalBuild];

  if (!v4) {
    return -1;
  }
  int64_t v5 = [(AKConfiguration *)self configurationValueForKey:@"_AKAuthorizationDemoMode"];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (void)setShouldAllowDemoMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKAuthorizationDemoMode"];
}

- (void)setShouldAllowTestApplication:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKAddTestApplicationHeader"];
}

- (int64_t)shouldEnableTestAccountMode
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKAddTestAccountHeader"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldEnableTestAccountMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKAddTestAccountHeader"];
}

- (int64_t)shouldSuppressModalSheetsInMacBuddy
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKSuppressModalSheetsInMacBuddy"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldSuppressModalSheetsInMacBuddy:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKSuppressModalSheetsInMacBuddy"];
}

- (int64_t)shouldAutocycleAppsInTiburon
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKAutocycleAppsInTiburon"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldAutocycleAppsInTiburon:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKAutocycleAppsInTiburon"];
}

- (int64_t)shouldAlwaysShowWelcome
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKAlwaysShowWelcome"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldAlwaysShowWelcome:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKAlwaysShowWelcome"];
}

- (int64_t)shouldAutocycleAppsInWebTakeover
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKAutocycleAppsInWebTakeOver"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldAutocycleAppsInWebTakeover:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKAutocycleAppsInWebTakeOver"];
}

- (int64_t)shouldAskToBuy
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKAskToBuy"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldAskToBuy:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKAskToBuy"];
}

- (int64_t)shouldEnableTelemetryOptIn
{
  int64_t v3 = +[AKDevice currentDevice];
  int v4 = [v3 isInternalBuild];

  int64_t v5 = -1;
  if (v4)
  {
    int64_t v6 = [(AKConfiguration *)self configurationValueForKey:@"_AKTelemetryOptIn"];
    if ([v6 integerValue] != -1) {
      int64_t v5 = 1;
    }
  }
  return v5;
}

- (void)setShouldEnableTelemetryOptIn:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKTelemetryOptIn"];
}

- (void)setLastKnownIDMSEnvironment:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKLastIDMSEnvironment"];
}

- (int64_t)shouldRequestPiggybackingPresenceEnforcement
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKShouldRequestPiggybackingPresenceEnforcement"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)piggybackingIDMSPresenceOverride
{
  return [(AKConfiguration *)self overrideForKey:@"AKOverridePiggybackingIDMSPresence"];
}

- (void)setPiggybackingIDMSPresenceOverride:(int64_t)a3
{
}

- (int64_t)piggybackingLocalPresenceOverride
{
  return [(AKConfiguration *)self overrideForKey:@"AKOverridePiggybackingLocalPresence"];
}

- (void)setPiggybackingLocalPresenceOverride:(int64_t)a3
{
}

- (int64_t)forceSilentEscrowRecordRepairEnabled
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKForceSilentEscrowRecordRepairEnabled"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setForceSilentEscrowRecordRepairEnabled:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKForceSilentEscrowRecordRepairEnabled"];
}

- (int64_t)forceSilentEscrowRecordRepairEnabledV2
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKForceSilentEscrowRecordRepairEnabledV2"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setForceSilentEscrowRecordRepairEnabledV2:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKForceSilentEscrowRecordRepairEnabledV2"];
}

- (int64_t)forceSilentBurnCDPRepairEnabled
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKForceSilentBurnCDPRepairEnabled"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setForceSilentBurnCDPRepairEnabled:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKForceSilentBurnCDPRepairEnabled"];
}

- (unint64_t)internalFeaturesMaskValue
{
  unint64_t v3 = [(AKConfiguration *)self shouldBypassCustodianDeviceCheck] == 1;
  if ([(AKConfiguration *)self shouldEnableBeneficiaryLiveOn] == 1) {
    v3 |= 2uLL;
  }
  if ([(AKConfiguration *)self shouldRequestPiggybackingPresenceEnforcement] == 1)v3 |= 0x20uLL; {
  if ([(AKConfiguration *)self shouldForceBaaValidation] == 1)
  }
    v3 |= 0x40uLL;
  if ([(AKConfiguration *)self contactKeyVerification] == 1) {
    unint64_t v4 = v3 | 0x80;
  }
  else {
    unint64_t v4 = v3;
  }
  int64_t v5 = +[AKFeatureManager sharedManager];
  int v6 = [v5 isAABrandingEnabled];

  if (v6) {
    v4 |= 0x400uLL;
  }
  id v7 = +[AKFeatureManager sharedManager];
  int v8 = [v7 isSignInSecurityRedesignEnabled];

  if (v8) {
    return v4 | 0x800;
  }
  else {
    return v4;
  }
}

- (int64_t)shouldBypassCustodianDeviceCheck
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKByPassCustodianDeviceCheck"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldBypassCustodianDeviceCheck:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKByPassCustodianDeviceCheck"];
}

- (int64_t)shouldEnableBeneficiaryLiveOn
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKBeneficiaryLiveOnKey"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldEnableBeneficiaryLiveOn:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKBeneficiaryLiveOnKey"];
}

- (int64_t)shouldForceBaaValidation
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKShouldForceBaaValidation"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setShouldForceBaaValidation:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKShouldForceBaaValidation"];
}

- (int64_t)contactKeyVerification
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKContactKeyVerification"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setContactKeyVerification:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKContactKeyVerification"];
}

- (int64_t)requestedCloudPartition
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKCloudPartition"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)_validCloudPartition:(int64_t)a3
{
  return 1;
}

- (void)setRequestedCloudPartition:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKCloudPartition"];
}

- (NSString)lastKnownLocale
{
  return (NSString *)[(AKConfiguration *)self configurationValueForKey:@"AKLastLocale"];
}

- (void)setLastKnownLocale:(id)a3
{
}

- (int64_t)forceHasSOSActiveDevice
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKShouldForceHasSOSActiveDevice"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setForceHasSOSActiveDevice:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKShouldForceHasSOSActiveDevice"];
}

- (int64_t)forceSOSNeeded
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKShouldForceSOSNeeded"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setForceSOSNeeded:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKShouldForceSOSNeeded"];
}

- (int64_t)telemetryOptInGracePeriodOverride
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"_AKOverrideTelemetryOptInGracePeriod"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setTelemetryOptInGracePeriodOverride:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"_AKOverrideTelemetryOptInGracePeriod"];
}

- (void)setStrongDeviceIdentityMarker:(id)a3
{
}

- (NSData)strongDeviceIdentityMarker
{
  return (NSData *)[(AKConfiguration *)self configurationValueForKey:@"_AKBAACertMarkerKey"];
}

- (int64_t)criticalAccountEditsAllowedOverride
{
  return [(AKConfiguration *)self overrideForKey:@"AKOverrideCriticalAccountEdits"];
}

- (void)setCriticalAccountEditsAllowedOverride:(int64_t)a3
{
}

- (int64_t)deviceSafetyRestrictionReasonOverride
{
  v2 = [(AKConfiguration *)self configurationValueForKey:@"AKDeviceSafetyRestrictionReasonOverride"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setDeviceSafetyRestrictionReasonOverride:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKDeviceSafetyRestrictionReasonOverride"];
}

- (void)setShouldEnableAttestationLogging:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AKConfiguration *)self setConfigurationValue:v4 forKey:@"AKOverrideAttestationLoggingKey"];
}

- (int64_t)shouldEnablePiggybackingPresence
{
  return self->_shouldEnablePiggybackingPresence;
}

- (void)setShouldEnablePiggybackingPresence:(int64_t)a3
{
  self->_shouldEnablePiggybackingPresence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsQueue, 0);

  objc_storeStrong((id *)&self->_cachedSettings, 0);
}

void __23__AKConfiguration_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Cached AuthKit configurations have changed. Clearing cache...", v1, 2u);
}

- (void)configurationValueForKey:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Nil key!", v1, 2u);
}

@end