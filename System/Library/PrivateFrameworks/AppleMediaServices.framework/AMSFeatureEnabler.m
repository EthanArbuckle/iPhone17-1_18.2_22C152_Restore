@interface AMSFeatureEnabler
+ (NSHTTPCookie)cookie;
+ (id)_fetchEnabledFeatures;
+ (void)clear;
@end

@implementation AMSFeatureEnabler

uint64_t __42__AMSFeatureEnabler__fetchEnabledFeatures__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 BOOLValue];
  }
  else
  {
    v7 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543874;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v4;
      __int16 v15 = 2114;
      id v16 = v5;
      id v9 = v12;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: An ITFE key or value is of the wrong type. key = %{public}@ | value = %{public}@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

id __42__AMSFeatureEnabler__fetchEnabledFeatures__block_invoke_54(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

+ (id)_fetchEnabledFeatures
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!+[AMSProcessInfo hasAMSEntitlement])
  {
    v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      v3 = +[AMSLogConfig sharedConfig];
    }
    id v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEBUG, "Current process is attempting to read from shared preferences but does not have the com.apple.private.applemediaservices entitlement.", buf, 2u);
    }
  }
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
  id v5 = (id)CFPreferencesCopyAppValue(@"features", @"com.apple.storeservices.itfe");
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v6 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v6 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v16 = v9;
      id v10 = v9;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Unable to generate the ITFE cookie. The features aren't stored in a dictionary.", buf, 0xCu);
    }
    int v11 = 0;
  }
  else
  {
    uint64_t v6 = (void *)CFPreferencesCopyAppValue(@"additionalFeatures", @"com.apple.storeservices.itfe");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v5)
      {
        uint64_t v7 = objc_msgSend(v5, "ams_dictionaryByAddingEntriesFromDictionary:", v6);

        id v5 = (id)v7;
      }
      else
      {
        id v5 = v6;
      }
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__AMSFeatureEnabler__fetchEnabledFeatures__block_invoke;
    v14[3] = &__block_descriptor_40_e31_B24__0__NSString_8__NSNumber_16l;
    v14[4] = a1;
    id v12 = objc_msgSend(v5, "ams_filterUsingTest:", v14);

    int v11 = objc_msgSend(v12, "ams_arrayUsingTransform:", &__block_literal_global_54);
    id v5 = v12;
  }

  return v11;
}

+ (NSHTTPCookie)cookie
{
  v18[6] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    v3 = [a1 _fetchEnabledFeatures];
    if ([v3 count])
    {
      id v4 = [v3 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

      id v5 = objc_alloc(MEMORY[0x1E4F18D28]);
      uint64_t v6 = *MEMORY[0x1E4F18C10];
      v18[0] = @".apple.com";
      uint64_t v7 = *MEMORY[0x1E4F18C18];
      v17[0] = v6;
      v17[1] = v7;
      v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:31536000.0];
      uint64_t v9 = *MEMORY[0x1E4F18C28];
      v18[1] = v8;
      v18[2] = @"itfe";
      uint64_t v10 = *MEMORY[0x1E4F18C38];
      v17[2] = v9;
      v17[3] = v10;
      uint64_t v11 = *MEMORY[0x1E4F18C50];
      v18[3] = @"/";
      v18[4] = MEMORY[0x1E4F1CC38];
      uint64_t v12 = *MEMORY[0x1E4F18C58];
      v17[4] = v11;
      v17[5] = v12;
      __int16 v13 = [v4 componentsJoinedByString:@"+"];
      v18[5] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];
      __int16 v15 = (void *)[v5 initWithProperties:v14];

      v3 = v4;
    }
    else
    {
      __int16 v15 = 0;
    }
  }
  else
  {
    __int16 v15 = 0;
  }
  return (NSHTTPCookie *)v15;
}

+ (void)clear
{
  CFPreferencesSetAppValue(@"features", 0, @"com.apple.storeservices.itfe");
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
}

@end