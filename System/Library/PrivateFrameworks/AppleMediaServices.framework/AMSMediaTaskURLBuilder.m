@interface AMSMediaTaskURLBuilder
- (AMSBagProtocol)bag;
- (AMSMediaTaskTypeConfig)config;
- (AMSMediaTaskURLBuilder)initWithConfig:(id)a3 clientVersion:(id)a4 bag:(id)a5;
- (BOOL)charts;
- (NSArray)additionalPlatforms;
- (NSArray)bundleIdentifiers;
- (NSArray)includedResultKeys;
- (NSArray)itemIdentifiers;
- (NSDictionary)additionalQueryParams;
- (NSDictionary)filters;
- (NSString)clientVersion;
- (NSString)logKey;
- (NSString)searchTerm;
- (id)_devicePlatform;
- (id)_hostPromise;
- (id)_languagePromise;
- (id)_languagePromiseAppDistribution;
- (id)_languagePromiseForType;
- (id)_pathPromise;
- (id)_queryItemsWithLanguage:(id)a3;
- (id)_verifyConfiguration;
- (id)build;
- (void)_addBundleIdentifiers:(id)a3;
- (void)_addCharts:(id)a3;
- (void)_addItemIdentifiers:(id)a3;
- (void)_addSearchTerm:(id)a3;
- (void)setAdditionalPlatforms:(id)a3;
- (void)setAdditionalQueryParams:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setCharts:(BOOL)a3;
- (void)setFilters:(id)a3;
- (void)setIncludedResultKeys:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setSearchTerm:(id)a3;
@end

@implementation AMSMediaTaskURLBuilder

uint64_t __50__AMSMediaTaskURLBuilder__queryItemsWithLanguage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id __31__AMSMediaTaskURLBuilder_build__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectAtIndexedSubscript:0];
  v5 = [v3 objectAtIndexedSubscript:1];
  v6 = [v3 objectAtIndexedSubscript:2];

  uint64_t v7 = [*(id *)(a1 + 32) _queryItemsWithLanguage:v5];
  id v8 = objc_alloc_init(MEMORY[0x1E4F29088]);
  v9 = [v4 absoluteString];
  [v8 setHost:v9];

  [v8 setPath:v6];
  [v8 setQueryItems:v7];
  [v8 setScheme:@"https"];
  [*(id *)(a1 + 32) _addBundleIdentifiers:v8];
  [*(id *)(a1 + 32) _addCharts:v8];
  [*(id *)(a1 + 32) _addItemIdentifiers:v8];
  [*(id *)(a1 + 32) _addSearchTerm:v8];
  v10 = +[AMSPromise promiseWithResult:v8];

  return v10;
}

- (void)_addCharts:(id)a3
{
  id v10 = a3;
  if ([(AMSMediaTaskURLBuilder *)self charts])
  {
    id v4 = (void *)MEMORY[0x1E4F290C8];
    v5 = [(AMSMediaTaskURLBuilder *)self config];
    v6 = [v5 typeString];
    uint64_t v7 = [v4 queryItemWithName:@"types" value:v6];

    id v8 = [v10 queryItems];
    v9 = [v8 arrayByAddingObject:v7];
    [v10 setQueryItems:v9];
  }
}

- (void)_addBundleIdentifiers:(id)a3
{
  id v13 = a3;
  id v4 = [(AMSMediaTaskURLBuilder *)self bundleIdentifiers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(AMSMediaTaskURLBuilder *)self bundleIdentifiers];
    uint64_t v7 = [v6 sortedArrayUsingSelector:sel_compare_];

    id v8 = [v7 componentsJoinedByString:@","];
    v9 = [@"filter[{filter}]" stringByReplacingOccurrencesOfString:@"{filter}" withString:@"bundleId"];
    id v10 = [MEMORY[0x1E4F290C8] queryItemWithName:v9 value:v8];
    v11 = [v13 queryItems];
    v12 = [v11 arrayByAddingObject:v10];
    [v13 setQueryItems:v12];
  }
}

- (id)_hostPromise
{
  id v3 = [(AMSMediaTaskURLBuilder *)self config];
  id v4 = [v3 hostBagKey];

  uint64_t v5 = [(AMSMediaTaskURLBuilder *)self bag];
  v6 = [v5 URLForKey:v4];

  uint64_t v7 = [v6 valuePromise];

  return v7;
}

- (id)_languagePromiseForType
{
  id v3 = [(AMSMediaTaskURLBuilder *)self config];
  uint64_t v4 = [v3 type];

  if (v4 == 7) {
    [(AMSMediaTaskURLBuilder *)self _languagePromiseAppDistribution];
  }
  else {
  uint64_t v5 = [(AMSMediaTaskURLBuilder *)self _languagePromise];
  }
  return v5;
}

- (id)_verifyConfiguration
{
  id v3 = [(AMSMediaTaskURLBuilder *)self bundleIdentifiers];
  uint64_t v4 = [v3 count];

  BOOL v5 = [(AMSMediaTaskURLBuilder *)self charts];
  BOOL v6 = 1;
  if (v4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  if (v5) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = v4 != 0;
  }
  v9 = [(AMSMediaTaskURLBuilder *)self itemIdentifiers];
  uint64_t v10 = [v9 count];

  if (v10) {
    BOOL v11 = v8 + 1;
  }
  else {
    BOOL v11 = v8;
  }
  v12 = [(AMSMediaTaskURLBuilder *)self searchTerm];

  if (v12) {
    unint64_t v13 = v11 + 1;
  }
  else {
    unint64_t v13 = v11;
  }
  v14 = [(AMSMediaTaskURLBuilder *)self config];
  if ([v14 type] != 3)
  {
    v15 = [(AMSMediaTaskURLBuilder *)self config];
    BOOL v6 = [v15 type] == 4;
  }
  if (v6 && v13)
  {
    v16 = @"Bundle identifiers, charts, item identifiers and search term cannot be set on AMSMediaTaskTypeArcadeApp or AMSMediaTaskTypeAppRecommendation request";
LABEL_18:
    v17 = AMSError(404, @"Invalid media task configuration", v16, 0);
    goto LABEL_35;
  }
  if (v13) {
    char v18 = 1;
  }
  else {
    char v18 = v6;
  }
  if (v18)
  {
    if (v13 >= 2)
    {
      v16 = @"Bundle identifiers, charts, item identifiers, or search term cannot be set on the same request.";
      goto LABEL_18;
    }
  }
  else
  {
    v19 = [(AMSMediaTaskURLBuilder *)self filters];
    uint64_t v20 = [v19 count];

    if (!v20)
    {
      v16 = @"Bundle identifiers, charts, filters, item identifiers, or search term must be specified.";
      goto LABEL_18;
    }
  }
  v21 = [(AMSMediaTaskURLBuilder *)self bundleIdentifiers];
  if (![v21 count]) {
    goto LABEL_33;
  }
  v22 = [(AMSMediaTaskURLBuilder *)self config];
  if (![v22 type])
  {
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  v23 = [(AMSMediaTaskURLBuilder *)self config];
  if ([v23 type] == 7)
  {
LABEL_31:

    goto LABEL_32;
  }
  v24 = [(AMSMediaTaskURLBuilder *)self config];
  if ([v24 type] == 1)
  {

    goto LABEL_31;
  }
  v26 = [(AMSMediaTaskURLBuilder *)self config];
  uint64_t v27 = [v26 type];

  if (v27 != 2)
  {
    v16 = @"Bundle identifiers only availble for AMSMediaTaskTypeApp, AMSMediaTaskTypeAppBundle, and AMSMediaTaskTypeInApp.";
    goto LABEL_18;
  }
LABEL_34:
  v17 = 0;
LABEL_35:
  return v17;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

id __38__AMSMediaTaskURLBuilder__pathPromise__block_invoke(uint64_t a1, void *a2)
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) charts])
  {
    uint64_t v4 = @"charts";
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) searchTerm];

    if (v5)
    {
      uint64_t v4 = @"search";
    }
    else
    {
      BOOL v6 = [*(id *)(a1 + 32) config];
      uint64_t v4 = [v6 typeString];
    }
  }
  uint64_t v7 = [@"/v{clientVersion}/{realm}/{storefront}/" stringByAppendingString:v4];
  BOOL v8 = [*(id *)(a1 + 32) config];
  uint64_t v9 = [v8 type];

  if (v9 == 7)
  {
    uint64_t v10 = [@"/v{clientVersion}/{realm}/" stringByAppendingString:v4];

    uint64_t v7 = (void *)v10;
  }
  v36[0] = @"{clientVersion}";
  BOOL v11 = [*(id *)(a1 + 32) clientVersion];
  v36[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v37[0] = v12;
  v35[0] = @"{realm}";
  unint64_t v13 = [*(id *)(a1 + 32) config];
  v14 = [v13 realm];
  v35[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v37[1] = v15;
  v34[0] = @"{storefront}";
  v34[1] = v3;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v37[2] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      uint64_t v22 = 0;
      v23 = v7;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v29 + 1) + 8 * v22);
        v25 = objc_msgSend(v24, "objectAtIndexedSubscript:", 0, (void)v29);
        v26 = [v24 objectAtIndexedSubscript:1];
        uint64_t v7 = [v23 stringByReplacingOccurrencesOfString:v25 withString:v26];

        ++v22;
        v23 = v7;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v20);
  }

  uint64_t v27 = +[AMSPromise promiseWithResult:v7];

  return v27;
}

- (AMSMediaTaskTypeConfig)config
{
  return self->_config;
}

- (BOOL)charts
{
  return self->_charts;
}

- (void)setSearchTerm:(id)a3
{
}

- (void)setItemIdentifiers:(id)a3
{
}

- (void)setIncludedResultKeys:(id)a3
{
}

- (void)setFilters:(id)a3
{
}

- (void)setCharts:(BOOL)a3
{
  self->_charts = a3;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (void)setAdditionalQueryParams:(id)a3
{
}

- (void)setAdditionalPlatforms:(id)a3
{
}

- (AMSMediaTaskURLBuilder)initWithConfig:(id)a3 clientVersion:(id)a4 bag:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSMediaTaskURLBuilder;
  v12 = [(AMSMediaTaskURLBuilder *)&v17 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a3);
    objc_storeStrong((id *)&v13->_clientVersion, a4);
    objc_storeStrong((id *)&v13->_bag, a5);
    uint64_t v14 = AMSGenerateLogCorrelationKey();
    logKey = v13->_logKey;
    v13->_logKey = (NSString *)v14;
  }
  return v13;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (id)build
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSMediaTaskURLBuilder *)self _verifyConfiguration];
  if (v3)
  {
    uint64_t v4 = +[AMSPromise promiseWithError:v3];
  }
  else
  {
    BOOL v5 = [(AMSMediaTaskURLBuilder *)self _hostPromise];
    BOOL v6 = [(AMSMediaTaskURLBuilder *)self _languagePromiseForType];
    uint64_t v7 = [(AMSMediaTaskURLBuilder *)self _pathPromise];
    v12[0] = v5;
    v12[1] = v6;
    v12[2] = v7;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    id v9 = +[AMSPromise promiseWithAll:v8];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __31__AMSMediaTaskURLBuilder_build__block_invoke;
    v11[3] = &unk_1E559E528;
    v11[4] = self;
    uint64_t v4 = [v9 thenWithBlock:v11];
  }
  return v4;
}

- (id)_queryItemsWithLanguage:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v43 = v4;
  BOOL v6 = [MEMORY[0x1E4F290C8] queryItemWithName:@"l" value:v4];
  [v5 addObject:v6];

  uint64_t v7 = [(AMSMediaTaskURLBuilder *)self config];
  int v8 = [v7 includePlatform];

  if (v8)
  {
    id v9 = [(AMSMediaTaskURLBuilder *)self _devicePlatform];
    if (v9)
    {
      id v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"platform" value:v9];
      [v5 addObject:v10];
    }
    id v11 = [(AMSMediaTaskURLBuilder *)self additionalPlatforms];
    v12 = [v11 componentsJoinedByString:@","];

    if (v12)
    {
      unint64_t v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"additionalPlatforms" value:v12];
      [v5 addObject:v13];
    }
  }
  uint64_t v14 = [(AMSMediaTaskURLBuilder *)self includedResultKeys];

  if (v14)
  {
    if ([(AMSMediaTaskURLBuilder *)self charts]
      || ([(AMSMediaTaskURLBuilder *)self searchTerm],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v15))
    {
      v16 = [(AMSMediaTaskURLBuilder *)self config];
      objc_super v17 = [v16 typeString];
      id v18 = [@"include[{type}]" stringByReplacingOccurrencesOfString:@"{type}" withString:v17];
    }
    else
    {
      id v18 = @"include";
    }
    uint64_t v19 = [(AMSMediaTaskURLBuilder *)self includedResultKeys];
    uint64_t v20 = [v19 componentsJoinedByString:@","];

    uint64_t v21 = [MEMORY[0x1E4F290C8] queryItemWithName:v18 value:v20];
    [v5 addObject:v21];
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = [(AMSMediaTaskURLBuilder *)self filters];
  uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v27 = [@"filter[{filter}]" stringByReplacingOccurrencesOfString:@"{filter}" withString:v26];
        v28 = [(AMSMediaTaskURLBuilder *)self filters];
        long long v29 = [v28 objectForKeyedSubscript:v26];

        long long v30 = [MEMORY[0x1E4F290C8] queryItemWithName:v27 value:v29];
        [v5 addObject:v30];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v23);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v31 = [(AMSMediaTaskURLBuilder *)self additionalQueryParams];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        v37 = (void *)MEMORY[0x1E4F290C8];
        v38 = [(AMSMediaTaskURLBuilder *)self additionalQueryParams];
        v39 = [v38 objectForKeyedSubscript:v36];
        v40 = [v37 queryItemWithName:v36 value:v39];
        [v5 addObject:v40];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v33);
  }

  v41 = [v5 sortedArrayUsingComparator:&__block_literal_global_90_0];

  return v41;
}

- (NSArray)includedResultKeys
{
  return self->_includedResultKeys;
}

- (NSDictionary)filters
{
  return self->_filters;
}

- (NSDictionary)additionalQueryParams
{
  return self->_additionalQueryParams;
}

- (NSArray)additionalPlatforms
{
  return self->_additionalPlatforms;
}

- (id)_pathPromise
{
  id v3 = [(AMSMediaTaskURLBuilder *)self bag];
  id v4 = [v3 stringForKey:@"countryCode"];
  id v5 = [v4 valuePromise];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__AMSMediaTaskURLBuilder__pathPromise__block_invoke;
  v8[3] = &unk_1E559E640;
  v8[4] = self;
  BOOL v6 = [v5 thenWithBlock:v8];

  return v6;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)_addSearchTerm:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AMSMediaTaskURLBuilder *)self searchTerm];

  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v7 = [(AMSMediaTaskURLBuilder *)self searchTerm];
    int v8 = [v6 queryItemWithName:@"term" value:v7];

    id v9 = (void *)MEMORY[0x1E4F290C8];
    id v10 = [(AMSMediaTaskURLBuilder *)self config];
    id v11 = [v10 typeString];
    v12 = [v9 queryItemWithName:@"types" value:v11];

    unint64_t v13 = [v4 queryItems];
    v16[0] = v8;
    v16[1] = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v15 = [v13 arrayByAddingObjectsFromArray:v14];
    [v4 setQueryItems:v15];
  }
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)_addItemIdentifiers:(id)a3
{
  id v15 = a3;
  id v4 = [(AMSMediaTaskURLBuilder *)self itemIdentifiers];
  uint64_t v5 = [v4 count];

  BOOL v6 = [(AMSMediaTaskURLBuilder *)self itemIdentifiers];
  uint64_t v7 = v6;
  if (v5 == 1)
  {
    int v8 = [v6 firstObject];

    id v9 = [v15 path];
    id v10 = [v9 stringByAppendingPathComponent:v8];
    [v15 setPath:v10];
  }
  else
  {
    unint64_t v11 = [v6 count];

    if (v11 < 2) {
      goto LABEL_6;
    }
    v12 = [(AMSMediaTaskURLBuilder *)self itemIdentifiers];
    int v8 = [v12 sortedArrayUsingSelector:sel_compare_];

    id v9 = [v8 componentsJoinedByString:@","];
    id v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ids" value:v9];
    unint64_t v13 = [v15 queryItems];
    uint64_t v14 = [v13 arrayByAddingObject:v10];
    [v15 setQueryItems:v14];
  }
LABEL_6:
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (id)_languagePromise
{
  id v3 = +[AMSProcessInfo currentProcess];
  id v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.appstorecomponentsd"];

  if (v5)
  {
    BOOL v6 = objc_alloc_init(AMSMutablePromise);
    uint64_t v7 = [(AMSMediaTaskURLBuilder *)self bag];
    int v8 = [v7 stringForKey:@"language-tag"];
    id v9 = [v8 valuePromise];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke;
    v17[3] = &unk_1E55A3CA8;
    id v10 = v6;
    id v18 = v10;
    [v9 addSuccessBlock:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_2;
    v15[3] = &unk_1E559E7E8;
    v15[4] = self;
    unint64_t v11 = v10;
    v16 = v11;
    [v9 addErrorBlock:v15];
    v12 = v16;
    unint64_t v13 = v11;
  }
  else
  {
    id v9 = +[AMSDevice language];
    unint64_t v13 = +[AMSPromise promiseWithResult:v9];
  }

  return v13;
}

- (id)_devicePlatform
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[AMSDevice deviceIsAppleTV])
  {
    id v3 = AMSMediaTaskPlatformAppleTV;
LABEL_12:
    id v4 = *v3;
    goto LABEL_13;
  }
  if (+[AMSDevice deviceIsAppleWatch])
  {
    id v3 = AMSMediaTaskPlatformAppleWatch;
    goto LABEL_12;
  }
  if (+[AMSDevice deviceIsAudioAccessory])
  {
    id v3 = AMSMediaTaskPlatformHomePod;
    goto LABEL_12;
  }
  if (+[AMSDevice deviceIsiPad])
  {
    id v3 = AMSMediaTaskPlatformiPad;
    goto LABEL_12;
  }
  if (+[AMSDevice deviceIsiPhone]
    || +[AMSDevice deviceIsiPod])
  {
    id v3 = AMSMediaTaskPlatformiPhone;
    goto LABEL_12;
  }
  if (+[AMSDevice deviceIsMac])
  {
    id v3 = AMSMediaTaskPlatformMac;
    goto LABEL_12;
  }
  if (+[AMSDevice deviceIsRealityDevice])
  {
    id v3 = &AMSMediaTaskPlatformReality;
    goto LABEL_12;
  }
  BOOL v6 = +[AMSLogConfig sharedMediaConfig];
  if (!v6)
  {
    BOOL v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = objc_opt_class();
    id v9 = v8;
    id v10 = [(AMSMediaTaskURLBuilder *)self logKey];
    int v11 = 138543618;
    v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown device platform", (uint8_t *)&v11, 0x16u);
  }
  id v4 = 0;
LABEL_13:
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_includedResultKeys, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_additionalQueryParams, 0);
  objc_storeStrong((id *)&self->_additionalPlatforms, 0);
}

uint64_t __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

void __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bag];
  id v3 = [v2 stringForKey:@"language"];
  id v4 = [v3 valuePromise];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_3;
  v7[3] = &unk_1E55A3CA8;
  id v8 = *(id *)(a1 + 40);
  [v4 addSuccessBlock:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_4;
  v5[3] = &unk_1E559F028;
  id v6 = *(id *)(a1 + 40);
  [v4 addErrorBlock:v5];
}

uint64_t __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

void __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = +[AMSDevice language];
  [v1 finishWithResult:v2];
}

- (id)_languagePromiseAppDistribution
{
  id v2 = [(AMSMediaTaskURLBuilder *)self bag];
  id v3 = [v2 stringForKey:@"app-distribution-language-tag"];
  id v4 = [v3 valuePromise];
  char v5 = [v4 continueWithBlock:&__block_literal_global_78];

  return v5;
}

id __57__AMSMediaTaskURLBuilder__languagePromiseAppDistribution__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = +[AMSPromise promiseWithResult:a2];
  }
  else
  {
    id v3 = +[AMSDevice language];
    id v2 = +[AMSPromise promiseWithResult:v3];
  }
  return v2;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

@end