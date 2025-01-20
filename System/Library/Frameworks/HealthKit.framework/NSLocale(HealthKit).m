@interface NSLocale(HealthKit)
+ (id)hk_testableAutoupdatingCurrentLocale;
+ (id)hk_testableCurrentLocale;
+ (id)hk_testablePreferredLanguages;
+ (uint64_t)hk_isUSLocale;
+ (void)hk_setTestLocale:()HealthKit;
+ (void)hk_setTestPreferredLanguages:()HealthKit;
- (BOOL)hk_isIn24HourTime;
- (uint64_t)hk_isEquivalent:()HealthKit;
- (uint64_t)hk_isUSLocale;
@end

@implementation NSLocale(HealthKit)

+ (void)hk_setTestLocale:()HealthKit
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_LocaleLock);
  v4 = (void *)_TestLocale;
  _TestLocale = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_LocaleLock);
}

+ (id)hk_testableCurrentLocale
{
  os_unfair_lock_lock((os_unfair_lock_t)&_LocaleLock);
  id v2 = (id)_TestLocale;
  os_unfair_lock_unlock((os_unfair_lock_t)&_LocaleLock);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [a1 currentLocale];
  }
  v4 = v3;

  return v4;
}

+ (id)hk_testableAutoupdatingCurrentLocale
{
  os_unfair_lock_lock((os_unfair_lock_t)&_LocaleLock);
  id v2 = (id)_TestLocale;
  os_unfair_lock_unlock((os_unfair_lock_t)&_LocaleLock);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [a1 autoupdatingCurrentLocale];
  }
  v4 = v3;

  return v4;
}

+ (void)hk_setTestPreferredLanguages:()HealthKit
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_LocaleLock);
  uint64_t v4 = [v3 copy];

  v5 = (void *)_TestPreferredLanguages;
  _TestPreferredLanguages = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)&_LocaleLock);
}

+ (id)hk_testablePreferredLanguages
{
  os_unfair_lock_lock((os_unfair_lock_t)&_LocaleLock);
  id v2 = (id)_TestPreferredLanguages;
  os_unfair_lock_unlock((os_unfair_lock_t)&_LocaleLock);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [a1 preferredLanguages];
  }
  uint64_t v4 = v3;

  return v4;
}

+ (uint64_t)hk_isUSLocale
{
  v1 = objc_msgSend(a1, "hk_testableAutoupdatingCurrentLocale");
  uint64_t v2 = objc_msgSend(v1, "hk_isUSLocale");

  return v2;
}

- (uint64_t)hk_isUSLocale
{
  v1 = [a1 localeIdentifier];
  uint64_t v2 = [v1 containsString:@"US"];

  return v2;
}

- (uint64_t)hk_isEquivalent:()HealthKit
{
  id v4 = a3;
  if (a1 == v4)
  {
    uint64_t v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [a1 languageCode];
      uint64_t v7 = [v5 languageCode];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [v5 languageCode];
        if (!v9) {
          goto LABEL_14;
        }
        v10 = (void *)v9;
        v11 = [a1 languageCode];
        v12 = [v5 languageCode];
        int v13 = [v11 isEqualToString:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }
      v6 = [a1 countryCode];
      uint64_t v15 = [v5 countryCode];
      if (v6 == (void *)v15)
      {

LABEL_17:
        uint64_t v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      uint64_t v16 = [v5 countryCode];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = [a1 countryCode];
        v19 = [v5 countryCode];
        char v20 = [v18 isEqualToString:v19];

        if (v20) {
          goto LABEL_17;
        }
LABEL_15:
        uint64_t v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v14 = 0;
  }
LABEL_19:

  return v14;
}

- (BOOL)hk_isIn24HourTime
{
  v1 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"j" options:0 locale:a1];
  BOOL v2 = [v1 rangeOfString:@"H"] != 0x7FFFFFFFFFFFFFFFLL
    || [v1 rangeOfString:@"k"] != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

@end