@interface HKBehavior
@end

@implementation HKBehavior

_HKFeatureFlags *__23___HKBehavior_features__block_invoke()
{
  v0 = objc_alloc_init(_HKFeatureFlags);

  return v0;
}

uint64_t __38___HKBehavior_shouldReceiveECGSamples__block_invoke(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (!v1[218]) {
    return 1;
  }
  v2 = [v1 currentDeviceRegionInfo];
  if ([v2 isEqualToString:@"LM/A"]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = MGGetBoolAnswer();
  }

  return v3;
}

BOOL __40___HKBehavior_supportsSharedSummarySync__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  return !*(unsigned char *)(v1 + 218) && *(unsigned char *)(v1 + 219) == 0;
}

BOOL __36___HKBehavior_supportsMedicalIDSync__block_invoke(uint64_t a1)
{
  return *(unsigned char *)(*(void *)(a1 + 32) + 219) == 0;
}

BOOL __42___HKBehavior_canPerformOwnershipTakeover__block_invoke(uint64_t a1)
{
  return *(unsigned char *)(*(void *)(a1 + 32) + 218) == 0;
}

uint64_t __32___HKBehavior_supportsCloudSync__block_invoke()
{
  return 1;
}

uint64_t __40___HKBehavior_supportsCloudSyncSharding__block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) isAppleWatch]) {
    return 1;
  }
  uint64_t result = [*(id *)(a1 + 32) tinkerModeEnabled];
  if (result) {
    return 1;
  }
  return result;
}

uint64_t __44___HKBehavior_supportsCloudSyncStagingShard__block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) isAppleWatch]) {
    return 1;
  }
  uint64_t result = [*(id *)(a1 + 32) tinkerModeEnabled];
  if (result) {
    return 1;
  }
  return result;
}

uint64_t __44___HKBehavior_supportsPeriodicFullCloudSync__block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) isAppleWatch]) {
    return 1;
  }
  uint64_t result = [*(id *)(a1 + 32) tinkerModeEnabled];
  if (result) {
    return 1;
  }
  return result;
}

BOOL __44___HKBehavior_supportsPeriodicLiteCloudSync__block_invoke(uint64_t a1)
{
  return ![*(id *)(a1 + 32) isAppleWatch]
      || ([*(id *)(a1 + 32) tinkerModeEnabled] & 1) == 0;
}

BOOL __43___HKBehavior_supportsCoordinatedCloudSync__block_invoke(uint64_t a1)
{
  return !*(unsigned char *)(*(void *)(a1 + 32) + 219)
      && +[_HKBehavior hasPairedWatch];
}

void __33___HKBehavior__isDeviceSupported__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v0 = HKLogInfrastructure();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 138543618;
    id v3 = (id)objc_opt_class();
    __int16 v4 = 2114;
    v5 = @"healthkit";
    id v1 = v3;
    _os_log_impl(&dword_19C023000, v0, OS_LOG_TYPE_DEFAULT, "%{public}@: Overriding %{public}@", (uint8_t *)&v2, 0x16u);
  }
}

void __33___HKBehavior__isDeviceSupported__block_invoke_236()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v0 = HKLogInfrastructure();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG);

  if (v1)
  {
    int v2 = HKLogInfrastructure();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = objc_opt_class();
      __33___HKBehavior__isDeviceSupported__block_invoke_236_cold_1(v3, (uint64_t)v4, v2);
    }
  }
}

void __38___HKBehavior__isAppleInternalInstall__block_invoke(uint64_t a1)
{
  _HKInitializeLogging();
  int v2 = HKLogInfrastructure();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3)
  {
    __int16 v4 = HKLogInfrastructure();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __38___HKBehavior__isAppleInternalInstall__block_invoke_cold_1(a1, v4);
    }
  }
}

void __33___HKBehavior__isDeviceSupported__block_invoke_236_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v5 = a1;
  _os_log_debug_impl(&dword_19C023000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Device is not supported", (uint8_t *)a2, 0xCu);
}

void __38___HKBehavior__isAppleInternalInstall__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 32)) {
    int v2 = "n ";
  }
  else {
    int v2 = " NON-";
  }
  int v3 = 136446210;
  __int16 v4 = v2;
  _os_log_debug_impl(&dword_19C023000, a2, OS_LOG_TYPE_DEBUG, "Device is a%{public}sAppleInternal install", (uint8_t *)&v3, 0xCu);
}

@end