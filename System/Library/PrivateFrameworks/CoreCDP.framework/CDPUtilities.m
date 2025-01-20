@interface CDPUtilities
+ (BOOL)BOOLFromAKConfigurations:(id)a3;
+ (BOOL)canEnableMultiUserManatee;
+ (BOOL)deferSOSFromSignIn;
+ (BOOL)hasFullCDPSupport;
+ (BOOL)isAudioAccessory;
+ (BOOL)isBuddyFinished;
+ (BOOL)isCDPRepairWithProximityBasedPiggybackingEnabled;
+ (BOOL)isDemoDevice;
+ (BOOL)isGuitarfishEnabled;
+ (BOOL)isICSCHarmonizationEnabled;
+ (BOOL)isInternalBuild;
+ (BOOL)isKeyboardOOPEnabled;
+ (BOOL)isKeyboardOOPiPadEnabled;
+ (BOOL)isMultiUserManateeFeatureEnabled;
+ (BOOL)isSilentBurnInMiniBuddyEnabled;
+ (BOOL)isSilentEscrowRecordViabilityRepairEnabled;
+ (BOOL)isVirtualMachine;
+ (BOOL)readPreferencesFor:(id)a3;
+ (BOOL)shouldCentralizeRPDFlow;
+ (BOOL)shouldClearRKCacheAfterGeneration;
+ (BOOL)shouldUseNewMacOSRPDFlow;
+ (BOOL)shouldValidatePasscodeGenerations;
+ (BOOL)useCDPContextSecretInsteadOfSBDSecretFeatureEnabled;
+ (void)deferSOSFromSignIn;
+ (void)isICSCHarmonizationEnabled;
+ (void)isWalrusStatusMismatchDetectionEnabledWithCompletion:(id)a3;
+ (void)shouldCentralizeRPDFlow;
+ (void)shouldUseNewMacOSRPDFlow;
@end

@implementation CDPUtilities

+ (BOOL)hasFullCDPSupport
{
  return 1;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_11);
  }
  return _isInternalBuild;
}

uint64_t __31__CDPUtilities_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  _isInternalBuild = result;
  return result;
}

+ (BOOL)isDemoDevice
{
  return CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0) != 0;
}

+ (BOOL)isMultiUserManateeFeatureEnabled
{
  return 0;
}

+ (BOOL)useCDPContextSecretInsteadOfSBDSecretFeatureEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)canEnableMultiUserManatee
{
  BOOL v2 = +[CDPUtilities isMultiUserManateeFeatureEnabled];
  if (v2) {
    LOBYTE(v2) = !+[CDPUtilities isAudioAccessory];
  }
  return v2;
}

+ (BOOL)isSilentEscrowRecordViabilityRepairEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)deferSOSFromSignIn
{
  char v2 = _os_feature_enabled_impl();
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[CDPUtilities deferSOSFromSignIn]();
  }

  return v2;
}

+ (BOOL)isAudioAccessory
{
  return [MEMORY[0x263F202D8] deviceIsAudioAccessory];
}

+ (BOOL)shouldCentralizeRPDFlow
{
  if ([a1 readPreferencesFor:@"CentralizedRPDFlow"]) {
    return 1;
  }
  if ([a1 BOOLFromAKConfigurations:@"disableRPDCentralization"])
  {
    v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[CDPUtilities shouldCentralizeRPDFlow];
    }
    char v3 = 0;
  }
  else
  {
    char v3 = _os_feature_enabled_impl();
    v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[CDPUtilities shouldCentralizeRPDFlow]();
    }
  }

  return v3;
}

+ (BOOL)shouldUseNewMacOSRPDFlow
{
  char v2 = _os_feature_enabled_impl();
  char v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[CDPUtilities shouldUseNewMacOSRPDFlow]();
  }

  return v2;
}

+ (BOOL)isKeyboardOOPEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isKeyboardOOPiPadEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isICSCHarmonizationEnabled
{
  if ([a1 readPreferencesFor:@"SwiftUIRemoteSecretFlow"]) {
    return 1;
  }
  if ([a1 BOOLFromAKConfigurations:@"disableiCSCHarmonizationFlow"])
  {
    v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[CDPUtilities isICSCHarmonizationEnabled];
    }
    char v3 = 0;
  }
  else
  {
    char v3 = _os_feature_enabled_impl();
    v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[CDPUtilities isICSCHarmonizationEnabled]();
    }
  }

  return v3;
}

+ (BOOL)BOOLFromAKConfigurations:(id)a3
{
  char v3 = (void *)MEMORY[0x263F29270];
  id v4 = a3;
  uint64_t v5 = [v3 sharedBag];
  uint64_t v6 = [v5 configurationAtKey:v4];

  if (v6)
  {
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    BOOL v9 = [v8 intValue] == 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)isSilentBurnInMiniBuddyEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCDPRepairWithProximityBasedPiggybackingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)shouldValidatePasscodeGenerations
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isVirtualMachine
{
  if (isVirtualMachine_onceToken != -1) {
    dispatch_once(&isVirtualMachine_onceToken, &__block_literal_global_67);
  }
  return isVirtualMachine_result;
}

uint64_t __32__CDPUtilities_isVirtualMachine__block_invoke()
{
  int v2 = 0;
  size_t v1 = 4;
  uint64_t result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!result) {
    isVirtualMachine_uint64_t result = v2 != 0;
  }
  return result;
}

+ (BOOL)readPreferencesFor:(id)a3
{
  id v4 = (__CFString *)a3;
  if ([a1 isInternalBuild])
  {
    Boolean keyExistsAndHasValidFormat = 0;
    BOOL v5 = CFPreferencesGetAppBooleanValue(v4, @"com.apple.corecdp", &keyExistsAndHasValidFormat) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isGuitarfishEnabled
{
  if (isGuitarfishEnabled_once != -1) {
    dispatch_once(&isGuitarfishEnabled_once, &__block_literal_global_73);
  }
  return isGuitarfishEnabled_enabled;
}

void __35__CDPUtilities_isGuitarfishEnabled__block_invoke()
{
  isGuitarfishEnabled_enabled = SecureBackupIsGuitarfishEnabled();
  v0 = _CDPLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __35__CDPUtilities_isGuitarfishEnabled__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

+ (BOOL)shouldClearRKCacheAfterGeneration
{
  if (shouldClearRKCacheAfterGeneration_once != -1) {
    dispatch_once(&shouldClearRKCacheAfterGeneration_once, &__block_literal_global_75);
  }
  return shouldClearRKCacheAfterGeneration_shouldClear;
}

void __49__CDPUtilities_shouldClearRKCacheAfterGeneration__block_invoke()
{
  int v0 = +[CDPUtilities isInternalBuild];
  if (v0) {
    LOBYTE(v0) = _os_feature_enabled_impl();
  }
  shouldClearRKCacheAfterGeneration_shouldClear = v0;
  uint64_t v1 = _CDPLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __49__CDPUtilities_shouldClearRKCacheAfterGeneration__block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

+ (BOOL)isBuddyFinished
{
  if (isBuddyFinished__buddyFinished) {
    return 1;
  }
  BOOL result = _BYSetupAssistantNeedsToRun() ^ 1;
  isBuddyFinished__buddyFinished = result;
  return result;
}

+ (void)isWalrusStatusMismatchDetectionEnabledWithCompletion:(id)a3
{
  id v3 = a3;
  if (+[CDPUtilities isInternalBuild]
    && CFPreferencesGetAppBooleanValue(@"disableWalrusStatusMismatchDetectionEnabled", @"com.apple.corecdp", 0))
  {
    uint64_t v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[CDPUtilities isWalrusStatusMismatchDetectionEnabledWithCompletion:](v4, v5, v6, v7, v8, v9, v10, v11);
    }

    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
  else
  {
    v12 = [MEMORY[0x263F29270] sharedBag];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke;
    v13[3] = &unk_2643171D0;
    id v14 = v3;
    [v12 requestNewURLBagIfNecessaryWithCompletion:v13];
  }
}

void __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke_cold_2((uint64_t)v4, v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F29270] sharedBag];
    uint64_t v7 = [v6 configurationAtKey:@"isWalrusStatusMismatchDetectionEnabled"];

    if (v7)
    {
      objc_opt_class();
      id v8 = v7;
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      [v9 intValue];
    }
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)deferSOSFromSignIn
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_2182AE000, v0, v1, "DeferSOSFromSignIn = %{BOOL}d", v2, v3, v4, v5, v6);
}

+ (void)shouldCentralizeRPDFlow
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_2182AE000, v0, v1, "CentralizedRPDFlow = %{BOOL}d", v2, v3, v4, v5, v6);
}

+ (void)shouldUseNewMacOSRPDFlow
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_2182AE000, v0, v1, "UseNewMacOSRPDFlow = %{BOOL}d", v2, v3, v4, v5, v6);
}

+ (void)isICSCHarmonizationEnabled
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_2182AE000, v0, v1, "ICSCHarmonizationIOS = %{BOOL}d", v2, v3, v4, v5, v6);
}

void __35__CDPUtilities_isGuitarfishEnabled__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__CDPUtilities_shouldClearRKCacheAfterGeneration__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isWalrusStatusMismatchDetectionEnabledWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, a1, a3, "isWalrusStatusMismatchDetectionEnabled has overrider set, returning false", a5, a6, a7, a8, 0);
}

void __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_2182AE000, v0, v1, "Received isWalrusStatusMismatchDetectionEnabled = %d", v2, v3, v4, v5, v6);
}

void __69__CDPUtilities_isWalrusStatusMismatchDetectionEnabledWithCompletion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2182AE000, a2, OS_LOG_TYPE_DEBUG, "Error %@ getting isWalrusStatusMismatchDetectionEnabled from URLBag, returning false", (uint8_t *)&v2, 0xCu);
}

@end