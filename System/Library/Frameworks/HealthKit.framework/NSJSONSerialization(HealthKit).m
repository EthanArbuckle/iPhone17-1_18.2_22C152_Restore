@interface NSJSONSerialization(HealthKit)
+ (__CFString)hk_stringForDisplayFromFHIRData:()HealthKit;
+ (__CFString)hk_stringForDisplayFromFHIRJSONObject:()HealthKit;
+ (id)hk_JSONObjectSecureCodingClasses;
+ (uint64_t)hk_JSONObjectFromFHIRData:()HealthKit options:error:;
@end

@implementation NSJSONSerialization(HealthKit)

+ (uint64_t)hk_JSONObjectFromFHIRData:()HealthKit options:error:
{
  return objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:", a3, a4 | 0x1000);
}

+ (__CFString)hk_stringForDisplayFromFHIRData:()HealthKit
{
  id v9 = 0;
  v4 = objc_msgSend(a1, "hk_JSONObjectFromFHIRData:options:error:", a3, 0, &v9);
  id v5 = v9;
  if (v4)
  {
    objc_msgSend(a1, "hk_stringForDisplayFromFHIRJSONObject:", v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      +[NSJSONSerialization(HealthKit) hk_stringForDisplayFromFHIRData:]((uint64_t)v5, v7);
    }
    v6 = &stru_1EEC60288;
  }

  return v6;
}

+ (__CFString)hk_stringForDisplayFromFHIRJSONObject:()HealthKit
{
  id v9 = 0;
  v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:1 error:&v9];
  id v4 = v9;
  if (v3)
  {
    id v5 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    objc_msgSend(v5, "hk_stringByUnescapingJSONCharactersForDisplay");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      +[NSJSONSerialization(HealthKit) hk_stringForDisplayFromFHIRJSONObject:]((uint64_t)v4, v7);
    }
    v6 = &stru_1EEC60288;
  }

  return v6;
}

+ (id)hk_JSONObjectSecureCodingClasses
{
  if (hk_JSONObjectSecureCodingClasses_onceToken != -1) {
    dispatch_once(&hk_JSONObjectSecureCodingClasses_onceToken, &__block_literal_global_81);
  }
  v0 = (void *)hk_JSONObjectSecureCodingClasses_classes;

  return v0;
}

+ (void)hk_stringForDisplayFromFHIRData:()HealthKit .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Failed to create JSON object from FHIR data: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)hk_stringForDisplayFromFHIRJSONObject:()HealthKit .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Failed to create data for display string from FHIR object: %@", (uint8_t *)&v2, 0xCu);
}

@end