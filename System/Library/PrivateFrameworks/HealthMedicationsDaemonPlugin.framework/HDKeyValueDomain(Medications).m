@interface HDKeyValueDomain(Medications)
+ (id)hdmd_defaultDomainWithProfile:()Medications;
+ (id)hdmd_timeZoneDomainWithProfile:()Medications;
- (uint64_t)hdmd_numberValueAsBoolForKey:()Medications;
@end

@implementation HDKeyValueDomain(Medications)

+ (id)hdmd_defaultDomainWithProfile:()Medications
{
  v3 = (objc_class *)MEMORY[0x1E4F65B28];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithCategory:HDEntityCategoryForKeyValueCategory() domainName:*MEMORY[0x1E4F669C8] profile:v4];

  return v6;
}

+ (id)hdmd_timeZoneDomainWithProfile:()Medications
{
  v3 = (objc_class *)MEMORY[0x1E4F65B28];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithCategory:HDEntityCategoryForKeyValueCategory() domainName:*MEMORY[0x1E4F66A58] profile:v4];

  return v6;
}

- (uint64_t)hdmd_numberValueAsBoolForKey:()Medications
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v10 = 0;
  id v5 = [a1 numberForKey:v4 error:&v10];
  id v6 = v10;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = HKLogMedication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v12 = a1;
      __int16 v13 = 2114;
      id v14 = v4;
      __int16 v15 = 2114;
      id v16 = v6;
    }

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [v5 BOOLValue];
  }

  return v8;
}

@end