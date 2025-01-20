@interface HKMedicationDeviceConfiguration
+ (BOOL)_isSupportedLocale:(id)a3;
+ (BOOL)_isSupportedRegion:(id)a3;
+ (BOOL)supportsOntologyBackedMedications;
- (HKMedicationDeviceConfiguration)init;
@end

@implementation HKMedicationDeviceConfiguration

+ (BOOL)supportsOntologyBackedMedications
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableCurrentLocale");
  LOBYTE(a1) = [a1 _isSupportedLocale:v3];

  return (char)a1;
}

+ (BOOL)_isSupportedLocale:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 countryCode];
  if (v6)
  {
    char v7 = [a1 _isSupportedRegion:v6];
  }
  else
  {
    _HKInitializeLogging();
    v8 = HKLogHealthOntology();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      int v11 = 138543874;
      id v12 = a1;
      __int16 v13 = 2114;
      v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_error_impl(&dword_1BCB4A000, v8, OS_LOG_TYPE_ERROR, "%{public}@: passing a locale without country code (%{public}@) to %{public}@, will return NO", (uint8_t *)&v11, 0x20u);
    }
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)_isSupportedRegion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F29950];
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:&v7 count:1];
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4, v7, v8);

  return (char)v3;
}

- (HKMedicationDeviceConfiguration)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

@end