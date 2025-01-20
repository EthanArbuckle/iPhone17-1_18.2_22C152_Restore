@interface _HKBehavior(HKMedications)
- (uint64_t)hkmd_supportsMedicationsWidget;
- (uint64_t)hkmd_supportsTimeZone;
@end

@implementation _HKBehavior(HKMedications)

- (uint64_t)hkmd_supportsTimeZone
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a1 healthAppHiddenOrNotInstalled])
  {
    _HKInitializeLogging();
    v2 = HKLogMedication();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      v6 = a1;
      v3 = "[%{public}@]: Scheduling disabled. Health app is hidden or not installed.";
LABEL_7:
      _os_log_impl(&dword_1BCB4A000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v5, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([a1 isAppleWatch])
  {
    _HKInitializeLogging();
    v2 = HKLogMedication();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      v6 = a1;
      v3 = "[%{public}@]: Timezone changes are no-op on watch.";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  return 1;
}

- (uint64_t)hkmd_supportsMedicationsWidget
{
  uint64_t result = [a1 isDeviceSupported];
  if (result)
  {
    v3 = [a1 currentDeviceName];
    int v4 = [v3 isEqualToString:@"iPhone"];

    return [a1 isAppleWatch] | v4;
  }
  return result;
}

@end