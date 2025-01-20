@interface AMSMarketingItemTaskURLBuilder
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
- (id)_additionalQueryItems;
- (id)_countryCodeFromBag:(id)a3;
- (id)_formattedURLPathWithBag:(id)a3;
- (id)_languageTagFromBag:(id)a3 fallback:(id)a4;
- (id)_realmOverridesFromBag:(id)a3;
- (id)_stringForKey:(id)a3 fromBag:(id)a4;
- (id)_urlPathFromBag:(id)a3;
- (id)urlWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5 hydrateRelatedContents:(BOOL)a6 offerHints:(id)a7 additionalParameters:(id)a8;
@end

@implementation AMSMarketingItemTaskURLBuilder

uint64_t __122__AMSMarketingItemTaskURLBuilder_urlWithServiceType_placement_bag_hydrateRelatedContents_offerHints_additionalParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)urlWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5 hydrateRelatedContents:(BOOL)a6 offerHints:(id)a7 additionalParameters:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v39 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = [v14 uppercaseString];
  v19 = [(AMSMarketingItemTaskURLBuilder *)self _realmOverridesFromBag:v15];
  v20 = [v19 valueForKey:v18];

  uint64_t v21 = [(AMSMarketingItemTaskURLBuilder *)self _formattedURLPathWithBag:v15];
  v22 = (void *)v21;
  if (v20 && v21)
  {
    id v38 = v16;
    id v36 = v17;
    v23 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v17];
    [v23 setObject:@"priceDiffsForDisplay" forKeyedSubscript:@"extend[marketing-items]"];
    v24 = +[AMSDevice language];
    v25 = [(AMSMarketingItemTaskURLBuilder *)self _languageTagFromBag:v15 fallback:v24];
    [v23 setObject:v25 forKeyedSubscript:@"l"];

    [v23 setObject:@"metrics" forKeyedSubscript:@"meta[marketing-items]"];
    [v23 setObject:v39 forKeyedSubscript:@"placement"];
    [v23 setObject:v14 forKeyedSubscript:@"serviceType"];
    if (v10) {
      [v23 setObject:@"contents" forKeyedSubscript:@"include"];
    }
    id v37 = v14;
    if (v38) {
      [v23 setObject:v38 forKeyedSubscript:@"offerHints"];
    }
    v26 = (void *)MEMORY[0x1E4F1CA48];
    v27 = (void *)MEMORY[0x1E4F290C8];
    v28 = (void *)[v23 copy];
    v29 = [v27 queryItemsFromDictionary:v28];
    v30 = [v26 arrayWithArray:v29];

    v31 = [(AMSMarketingItemTaskURLBuilder *)self _additionalQueryItems];
    [v30 addObjectsFromArray:v31];

    [v30 sortUsingComparator:&__block_literal_global_74];
    v32 = objc_opt_new();
    [v32 setHost:v20];
    [v32 setPath:v22];
    [v32 setQueryItems:v30];
    [v32 setScheme:@"https"];
    v33 = [v32 URL];
    v34 = +[AMSPromise promiseWithResult:v33];

    id v16 = v38;
    id v17 = v36;
    id v14 = v37;
  }
  else
  {
    v23 = AMSError(204, @"Could not build marketing item URL", @"Bag is missing URL components", 0);
    v34 = +[AMSPromise promiseWithError:v23];
  }

  return v34;
}

- (id)_realmOverridesFromBag:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [a3 dictionaryForKey:@"marketing-item-media-api-realm-mappings"];
  id v16 = 0;
  id v4 = [v3 valueWithError:&v16];
  id v5 = v16;

  if (v5)
  {
    v6 = +[AMSLogConfig sharedMarketingItemConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error retrieving realm mappings.", buf, 0x16u);
    }
    BOOL v10 = +[AMSLogConfig sharedMarketingItemConfig];
    if (!v10)
    {
      BOOL v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      v13 = AMSLogKey();
      id v14 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      v20 = v13;
      __int16 v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
    }
  }

  return v4;
}

- (id)_languageTagFromBag:(id)a3 fallback:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(AMSMarketingItemTaskURLBuilder *)self _stringForKey:@"language-tag" fromBag:a3];
  uint64_t v8 = v7;
  if (!v7)
  {
    v9 = +[AMSLogConfig sharedMarketingItemConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    BOOL v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogKey();
      int v15 = 138543874;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Retrieving language tag from bag failed, using fallback: %{public}@", (uint8_t *)&v15, 0x20u);
    }
    uint64_t v8 = v6;
  }
  id v13 = v8;

  return v13;
}

- (id)_additionalQueryItems
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = +[AMSMediaURLBuilderUtility devicePlatform];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"platform" value:v3];
    [v2 addObject:v4];
  }
  return v2;
}

- (id)_formattedURLPathWithBag:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMarketingItemTaskURLBuilder *)self _urlPathFromBag:v4];
  id v6 = [(AMSMarketingItemTaskURLBuilder *)self _countryCodeFromBag:v4];

  uint64_t v7 = 0;
  if (v5 && v6)
  {
    uint64_t v7 = [v5 stringByReplacingOccurrencesOfString:@"{cc}" withString:v6];
  }

  return v7;
}

- (id)_stringForKey:(id)a3 fromBag:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [a4 stringForKey:a3];
  id v13 = 0;
  id v5 = [v4 valueWithError:&v13];
  id v6 = v13;

  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedMarketingItemConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      BOOL v10 = AMSLogKey();
      uint64_t v11 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      __int16 v17 = v10;
      __int16 v18 = 2114;
      __int16 v19 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
    }
  }

  return v5;
}

- (id)_urlPathFromBag:(id)a3
{
  return [(AMSMarketingItemTaskURLBuilder *)self _stringForKey:@"marketing-item-media-api-path" fromBag:a3];
}

- (id)_countryCodeFromBag:(id)a3
{
  return [(AMSMarketingItemTaskURLBuilder *)self _stringForKey:@"countryCode" fromBag:a3];
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSMarketingItemTask";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

@end