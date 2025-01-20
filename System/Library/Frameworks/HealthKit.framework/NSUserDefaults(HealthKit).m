@interface NSUserDefaults(HealthKit)
+ (void)hk_deleteDomainsNamed:()HealthKit;
- (id)hk_dateForKey:()HealthKit;
- (uint64_t)hk_BOOLForKey:()HealthKit defaultValue:;
- (uint64_t)hk_hasCompletedThirdPartyAuthSyncWithBooleanValue;
- (uint64_t)hk_keyExists:()HealthKit;
- (void)hk_removeObjectsForKeysWithPrefix:()HealthKit;
- (void)hk_setHasCompletedThirdPartyAuthSyncWithBooleanValue:()HealthKit;
@end

@implementation NSUserDefaults(HealthKit)

- (uint64_t)hk_keyExists:()HealthKit
{
  id v4 = a3;
  v5 = [a1 dictionaryRepresentation];
  v6 = [v5 allKeys];
  uint64_t v7 = [v6 containsObject:v4];

  return v7;
}

- (void)hk_removeObjectsForKeysWithPrefix:()HealthKit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 dictionaryRepresentation];
  v6 = (void *)[v5 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "hasPrefix:", v4, (void)v13)) {
          [a1 removeObjectForKey:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (uint64_t)hk_BOOLForKey:()HealthKit defaultValue:
{
  v5 = objc_msgSend(a1, "objectForKey:");
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)hk_dateForKey:()HealthKit
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = HKSafeObject(v5, v6, v4, 0);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (void)hk_deleteDomainsNamed:()HealthKit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v8];
        [v9 removePersistentDomainForName:v8];
        _HKInitializeLogging();
        uint64_t v10 = HKLogDefault;
        if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v16 = v8;
          _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "Deleted user defaults domain: %{public}@", buf, 0xCu);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)hk_setHasCompletedThirdPartyAuthSyncWithBooleanValue:()HealthKit
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:a3 forKey:@"CompletedThirdPartyAuthSync"];
}

- (uint64_t)hk_hasCompletedThirdPartyAuthSyncWithBooleanValue
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"CompletedThirdPartyAuthSync"];

  return v1;
}

@end