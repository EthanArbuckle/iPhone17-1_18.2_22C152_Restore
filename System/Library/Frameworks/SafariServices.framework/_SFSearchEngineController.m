@interface _SFSearchEngineController
+ (_SFSearchEngineController)sharedInstance;
+ (_SFSearchEngineController)sharedInstanceIfAvailable;
+ (void)_initializeSharedInstance;
+ (void)loadSystemLanguageProperties;
- (BOOL)isChinaDevice;
- (BOOL)isSearchProviderEnabled:(unint64_t)a3;
- (NSArray)engines;
- (NSArray)enginesAvailableForUnifiedFieldSearching;
- (NSArray)searchEngineNames;
- (NSDictionary)carrierTemplateParameterValues;
- (NSDictionary)templateParameterValues;
- (NSString)countryCode;
- (NSString)description;
- (NSString)systemLanguage;
- (WBSSearchProvider)defaultSeachProviderForPrivateBrowsing;
- (WBSSearchProvider)defaultSearchProvider;
- (_SFSearchEngineController)init;
- (_SFSearchEngineInfo)defaultSearchEngine;
- (id)_existingEngineInfoFor:(id)a3;
- (id)_specialSearchEngines;
- (id)defaultSearchEngineForPrivateBrowsing:(BOOL)a3;
- (id)defaultSearchEngineIfPopulatedForPrivateBrowsing:(BOOL)a3;
- (id)defaultSearchEngineNameForPrivateBrowsing:(BOOL)a3;
- (id)engineInfoFor:(id)a3;
- (id)engineInfoForScriptName:(id)a3;
- (id)safeSearchRequestForSearchRequest:(id)a3;
- (id)userVisibleQueryFromSearchURL:(id)a3;
- (int64_t)deviceType;
- (void)_addAllWebSearchEngineInfosToArray:(id)a3 andAddUserVisibleWebSearchEngineInfosToArray:(id)a4;
- (void)_getEngines:(id *)a3 defaultSearchEngineIndex:(unint64_t *)a4 forPrivateBrowsing:(BOOL)a5;
- (void)_loadSystemPropertiesForSearchEngine:(id)a3;
- (void)_populateSearchEngines;
- (void)_postDefaultSearchEngineDidChange;
- (void)_setDefaultSearchEngine:(id)a3 forPrivateBrowsing:(BOOL)a4;
- (void)_setEngines:(id)a3 defaultSearchEngineIndex:(unint64_t)a4 forPrivateBrowsing:(BOOL)a5;
- (void)reloadSearchEngines;
- (void)setDefaultSearchEngine:(id)a3 forPrivateBrowsing:(BOOL)a4;
@end

@implementation _SFSearchEngineController

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSDictionary)templateParameterValues
{
  return self->_templateParameterValues;
}

- (NSDictionary)carrierTemplateParameterValues
{
  return self->_carrierTemplateParameterValues;
}

+ (void)loadSystemLanguageProperties
{
  useBaiduAsPresetDefaultSearchEngine = [(id)objc_opt_class() _deviceRegionCodeIsChina];
}

- (BOOL)isChinaDevice
{
  v2 = (void *)CPGetDeviceRegionCode();

  return [v2 isEqualToString:@"CH"];
}

- (void)_loadSystemPropertiesForSearchEngine:(id)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  v6 = [v4 currentLocale];
  v7 = [v6 countryCode];
  v8 = (NSString *)[v7 copy];
  countryCode = self->_countryCode;
  self->_countryCode = v8;

  v10 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v11 = [v10 firstObject];
  uint64_t v12 = [v11 lowercaseString];

  if (v12) {
    v13 = (__CFString *)v12;
  }
  else {
    v13 = @"en";
  }
  v14 = WBSSearchProviderBaiduTrackingCodeTemplateParameterValues();
  v15 = (void *)[v14 mutableCopy];

  v41[0] = v13;
  v40[0] = @"languageCode";
  v40[1] = @"primaryLanguageCode";
  v16 = [(__CFString *)v13 substringToIndex:2];
  v41[1] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  [v15 addEntriesFromDictionary:v17];

  v18 = (NSDictionary *)[v15 copy];
  templateParameterValues = self->_templateParameterValues;
  self->_templateParameterValues = v18;

  LODWORD(v16) = [v5 isEqualToString:*MEMORY[0x1E4F99610]];
  if (v16
    && ![(_SFSearchEngineController *)self isChinaDevice]
    && !self->_carrierTemplateParameterValues)
  {
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F23A68]) initWithSlot:1];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:0];
    id v37 = 0;
    v22 = (void *)[v21 copyMobileSubscriberCountryCode:v20 error:&v37];
    id v23 = v37;
    if ([v22 length])
    {
      v34 = v22;
      id v36 = v23;
      v24 = (void *)[v21 copyMobileSubscriberNetworkCode:v20 error:&v36];
      id v25 = v36;

      if ([v24 length])
      {
        v33 = v24;
        id v35 = v25;
        v32 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
        v26 = objc_msgSend(v21, "copyCarrierBundleValue:key:bundleType:error:", v20, @"CarrierName");
        id v23 = v35;

        if (v26)
        {
          v38[0] = @"carrierName";
          v38[1] = @"carrierCountryCode";
          v22 = v34;
          v39[0] = v26;
          v39[1] = v34;
          v38[2] = @"carrierNetworkCode";
          v39[2] = v33;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
          carrierTemplateParameterValues = self->_carrierTemplateParameterValues;
          self->_carrierTemplateParameterValues = v27;
        }
        else
        {
          v22 = v34;
          if (v23)
          {
            v31 = WBS_LOG_CHANNEL_PREFIXSearchEngine();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              -[_SFSearchEngineController _loadSystemPropertiesForSearchEngine:](v31, v23);
            }
          }
        }

        v24 = v33;
      }
      else
      {
        if (v25)
        {
          v30 = WBS_LOG_CHANNEL_PREFIXSearchEngine();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[_SFSearchEngineController _loadSystemPropertiesForSearchEngine:](v30, v25);
          }
          id v23 = v25;
        }
        else
        {
          id v23 = 0;
        }
        v22 = v34;
      }
    }
    else if (v23)
    {
      v29 = WBS_LOG_CHANNEL_PREFIXSearchEngine();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[_SFSearchEngineController _loadSystemPropertiesForSearchEngine:](v29, v23);
      }
    }
  }
}

- (void)_addAllWebSearchEngineInfosToArray:(id)a3 andAddUserVisibleWebSearchEngineInfosToArray:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = WBSSearchProviderDefinitions();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
        v14 = [_SFSearchEngineInfo alloc];
        v15 = -[WBSSearchProvider initWithDictionary:usingContext:](v14, "initWithDictionary:usingContext:", v13, self, (void)v19);
        if (v15) {
          [v6 addObject:v15];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  v16 = [(_SFSearchEngineController *)self _specialSearchEngines];
  v17 = [v6 arrayByAddingObjectsFromArray:v16];
  v18 = +[WBSSearchProvider userVisibleProvidersInAllProviders:v17 usingContext:self];
  [v7 addObjectsFromArray:v18];
}

- (id)_specialSearchEngines
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F995A0];
  v3 = [NSNumber numberWithInteger:1];
  uint64_t v4 = *MEMORY[0x1E4F995A8];
  v14[0] = v3;
  v14[1] = @"org.wikipedia";
  uint64_t v5 = *MEMORY[0x1E4F995B8];
  v13[1] = v4;
  v13[2] = v5;
  uint64_t v6 = *MEMORY[0x1E4F99598];
  v14[2] = @"Wikipedia";
  v14[3] = @"Wikipedia";
  uint64_t v7 = *MEMORY[0x1E4F995B0];
  v13[3] = v6;
  v13[4] = v7;
  v14[4] = @"https://{primaryLanguageCode}.wikipedia.org/?search={searchTerms}";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  uint64_t v9 = [(WBSSearchProvider *)[_SFSearchEngineInfo alloc] initWithDictionary:v8 usingContext:self];
  uint64_t v12 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];

  return v10;
}

- (BOOL)isSearchProviderEnabled:(unint64_t)a3
{
  return +[WBSFeatureAvailability isSearchProviderEnabled:a3];
}

- (WBSSearchProvider)defaultSearchProvider
{
  return (WBSSearchProvider *)[(_SFSearchEngineController *)self defaultSearchEngineForPrivateBrowsing:0];
}

- (NSString)systemLanguage
{
  return self->_systemLanguage;
}

- (WBSSearchProvider)defaultSeachProviderForPrivateBrowsing
{
  return (WBSSearchProvider *)[(_SFSearchEngineController *)self defaultSearchEngineForPrivateBrowsing:1];
}

- (id)defaultSearchEngineForPrivateBrowsing:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_lock(&defaultSearchEngineLock);
  uint64_t v5 = 32;
  if (v3) {
    uint64_t v5 = 48;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);
  os_unfair_lock_unlock(&defaultSearchEngineLock);
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v11 = 0;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    [(_SFSearchEngineController *)self _getEngines:&v11 defaultSearchEngineIndex:&v12 forPrivateBrowsing:v3];
    id v8 = v11;
    uint64_t v9 = v8;
    id v7 = 0;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (void)_getEngines:(id *)a3 defaultSearchEngineIndex:(unint64_t *)a4 forPrivateBrowsing:(BOOL)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__5;
  uint64_t v13 = __Block_byref_object_dispose__5;
  id v14 = 0;
  searchEnginesQueue = self->_searchEnginesQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85___SFSearchEngineController__getEngines_defaultSearchEngineIndex_forPrivateBrowsing___block_invoke;
  v7[3] = &unk_1E5C75BE8;
  v7[4] = self;
  v7[5] = &v9;
  v7[6] = a4;
  BOOL v8 = a5;
  dispatch_sync(searchEnginesQueue, v7);
  if (a3) {
    *a3 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);
}

+ (_SFSearchEngineController)sharedInstance
{
  v2 = (void *)searchEngineController;
  if (!searchEngineController)
  {
    [a1 _initializeSharedInstance];
    v2 = (void *)searchEngineController;
  }
  id v3 = v2;

  return (_SFSearchEngineController *)v3;
}

+ (void)_initializeSharedInstance
{
  id obj = a1;
  objc_sync_enter(obj);
  if (!searchEngineController)
  {
    id v2 = objc_alloc_init((Class)obj);
    id v3 = (void *)searchEngineController;
    searchEngineController = (uint64_t)v2;
  }
  objc_sync_exit(obj);
}

- (_SFSearchEngineController)init
{
  v7.receiver = self;
  v7.super_class = (Class)_SFSearchEngineController;
  id v2 = [(_SFSearchEngineController *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mobilesafari._SFSearchEngineController", 0);
    searchEnginesQueue = v2->_searchEnginesQueue;
    v2->_searchEnginesQueue = (OS_dispatch_queue *)v3;

    v2->_defaultSearchEngineIndex = 0x7FFFFFFFFFFFFFFFLL;
    v2->_privateSearchEngineIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(_SFSearchEngineController *)v2 _populateSearchEngines];
    uint64_t v5 = v2;
  }

  return v2;
}

- (void)_populateSearchEngines
{
  searchEnginesQueue = self->_searchEnginesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___SFSearchEngineController__populateSearchEngines__block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = self;
  dispatch_async(searchEnginesQueue, block);
}

- (void)_setEngines:(id)a3 defaultSearchEngineIndex:(unint64_t)a4 forPrivateBrowsing:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v8 = (NSArray *)a3;
  if (v5) {
    uint64_t v9 = 40;
  }
  else {
    uint64_t v9 = 16;
  }
  v18 = v8;
  if (*(Class *)((char *)&self->super.isa + v9) == (Class)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = -[NSArray objectAtIndexedSubscript:](self->_searchEngines, "objectAtIndexedSubscript:");
    BOOL v8 = v18;
  }
  if (self->_searchEngines != v8)
  {
    uint64_t v11 = (NSArray *)[(NSArray *)v18 copy];
    searchEngines = self->_searchEngines;
    self->_searchEngines = v11;
  }
  if (*(Class *)((char *)&self->super.isa + v9) != (Class)a4) {
    *(Class *)((char *)&self->super.isa + v9) = (Class)a4;
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = 0;
  }
  else
  {
    id v14 = [(NSArray *)self->_searchEngines objectAtIndexedSubscript:a4];
    os_unfair_lock_lock(&defaultSearchEngineLock);
    if (v5) {
      uint64_t v15 = 48;
    }
    else {
      uint64_t v15 = 32;
    }
    v16 = *(Class *)((char *)&self->super.isa + v15);
    *(Class *)((char *)&self->super.isa + v15) = v14;
    v17 = v14;

    id v13 = *(id *)((char *)&self->super.isa + v15);
    os_unfair_lock_unlock(&defaultSearchEngineLock);
    if (v13 && (WBSIsEqual() & 1) == 0) {
      [(_SFSearchEngineController *)self _postDefaultSearchEngineDidChange];
    }
  }
}

- (void)_postDefaultSearchEngineDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62___SFSearchEngineController__postDefaultSearchEngineDidChange__block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (id)defaultSearchEngineIfPopulatedForPrivateBrowsing:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_lock(&defaultSearchEngineLock);
  uint64_t v5 = 32;
  if (v3) {
    uint64_t v5 = 48;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);
  os_unfair_lock_unlock(&defaultSearchEngineLock);

  return v6;
}

+ (_SFSearchEngineController)sharedInstanceIfAvailable
{
  id v2 = (void *)searchEngineController;
  if (searchEngineController)
  {
    id v3 = (id)searchEngineController;
  }
  else
  {
    uint64_t v5 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54___SFSearchEngineController_sharedInstanceIfAvailable__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v5, block);
  }

  return (_SFSearchEngineController *)v2;
}

- (void)reloadSearchEngines
{
  os_unfair_lock_lock(&defaultSearchEngineLock);
  defaultSearchEngine = self->_defaultSearchEngine;
  self->_defaultSearchEngine = 0;

  privateSearchEngine = self->_privateSearchEngine;
  self->_privateSearchEngine = 0;

  os_unfair_lock_unlock(&defaultSearchEngineLock);
  +[_SFSearchEngineController loadSystemLanguageProperties];

  [(_SFSearchEngineController *)self _populateSearchEngines];
}

- (NSString)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = [(_SFSearchEngineController *)self engines];
  objc_msgSend(v3, "appendFormat:", @"SearchEngineController with %lu engines.", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 appendFormat:@"\n\t%@", *(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return (NSString *)v3;
}

- (void)setDefaultSearchEngine:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&defaultSearchEngineLock);
  uint64_t v7 = 32;
  if (v4) {
    uint64_t v7 = 48;
  }
  uint64_t v8 = *(Class *)((char *)&self->super.isa + v7);
  *(Class *)((char *)&self->super.isa + v7) = 0;

  os_unfair_lock_unlock(&defaultSearchEngineLock);
  searchEnginesQueue = self->_searchEnginesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___SFSearchEngineController_setDefaultSearchEngine_forPrivateBrowsing___block_invoke;
  block[3] = &unk_1E5C75B70;
  block[4] = self;
  id v12 = v6;
  BOOL v13 = v4;
  id v10 = v6;
  dispatch_async(searchEnginesQueue, block);
}

- (void)_setDefaultSearchEngine:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  id v6 = a3;
  searchEngines = self->_searchEngines;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___SFSearchEngineController__setDefaultSearchEngine_forPrivateBrowsing___block_invoke;
  v9[3] = &unk_1E5C75B98;
  BOOL v12 = a4;
  id v10 = v6;
  long long v11 = self;
  id v8 = v6;
  [(NSArray *)searchEngines enumerateObjectsUsingBlock:v9];
}

- (_SFSearchEngineInfo)defaultSearchEngine
{
  return (_SFSearchEngineInfo *)[(_SFSearchEngineController *)self defaultSearchEngineForPrivateBrowsing:0];
}

- (id)_existingEngineInfoFor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_searchEngines;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "shortName", (void)v13);
        uint64_t v11 = [v10 caseInsensitiveCompare:v4];

        if (!v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)engineInfoFor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__5;
    uint64_t v18 = __Block_byref_object_dispose__5;
    id v19 = 0;
    searchEnginesQueue = self->_searchEnginesQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43___SFSearchEngineController_engineInfoFor___block_invoke;
    block[3] = &unk_1E5C75BC0;
    long long v13 = &v14;
    block[4] = self;
    id v12 = v5;
    dispatch_sync(searchEnginesQueue, block);
    uint64_t v7 = (void *)v15[5];
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v8 = [(_SFSearchEngineController *)self defaultSearchEngineForPrivateBrowsing:0];
    }
    uint64_t v9 = v8;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    uint64_t v9 = [(_SFSearchEngineController *)self defaultSearchEngineForPrivateBrowsing:0];
  }

  return v9;
}

- (id)engineInfoForScriptName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(_SFSearchEngineController *)self engines];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v10 = [v9 scriptName];
          uint64_t v11 = [v10 caseInsensitiveCompare:v4];

          if (!v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)safeSearchRequestForSearchRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 URL];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(_SFSearchEngineController *)self engines];
  uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 urlIsValidSearch:v5])
        {
          uint64_t v11 = [v10 safeSearchURLForSearchURL:v5];
          if (v11 && ([v5 isEqual:v11] & 1) == 0)
          {
            uint64_t v7 = (void *)[v4 mutableCopy];
            [v7 setURL:v11];
            [v7 setAttribution:1];
          }
          else
          {
            uint64_t v7 = 0;
          }

          goto LABEL_15;
        }
      }
      uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v7;
}

- (id)userVisibleQueryFromSearchURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(_SFSearchEngineController *)self engines];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) userVisibleQueryFromSearchURL:v4];
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (NSArray)engines
{
  id v4 = 0;
  [(_SFSearchEngineController *)self _getEngines:&v4 defaultSearchEngineIndex:0 forPrivateBrowsing:0];
  id v2 = v4;

  return (NSArray *)v2;
}

- (NSArray)enginesAvailableForUnifiedFieldSearching
{
  id v2 = [(_SFSearchEngineController *)self engines];
  id v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_28);

  return (NSArray *)v3;
}

- (NSArray)searchEngineNames
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(_SFSearchEngineController *)self engines];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 shortName];
        char v11 = [v10 isEqualToString:@"Wikipedia"];

        if ((v11 & 1) == 0)
        {
          id v12 = [v9 shortName];
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  long long v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

- (id)defaultSearchEngineNameForPrivateBrowsing:(BOOL)a3
{
  id v3 = [(_SFSearchEngineController *)self defaultSearchEngineForPrivateBrowsing:a3];
  id v4 = [v3 shortName];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierTemplateParameterValues, 0);
  objc_storeStrong((id *)&self->_templateParameterValues, 0);
  objc_storeStrong((id *)&self->_systemLanguage, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_privateSearchEngine, 0);
  objc_storeStrong((id *)&self->_defaultSearchEngine, 0);
  objc_storeStrong((id *)&self->_searchEnginesQueue, 0);

  objc_storeStrong((id *)&self->_searchEngines, 0);
}

- (void)_loadSystemPropertiesForSearchEngine:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Unable to retrieve carrier country code with error: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)_loadSystemPropertiesForSearchEngine:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Unable to retrieve carrier network code with error: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)_loadSystemPropertiesForSearchEngine:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Unable to retrieve carrier name with error: %{public}@", v7, v8, v9, v10, 2u);
}

@end