@interface MDMInstalledApplicationListCommand
+ (id)allItems;
+ (id)itemsThatMustAlwaysBeReturned;
- (BOOL)isUserEnrollment;
- (BOOL)shouldReturnManagedAppsOnly;
- (MDMAppItemsDataSource)dataSource;
- (NSDictionary)appItems;
- (NSDictionary)request;
- (NSDictionary)response;
- (NSSet)appsRequested;
- (NSSet)itemsRequested;
- (id)responseForRequest:(id)a3;
- (void)_processArguments;
- (void)_processIdentifiersArgument;
- (void)_processItemsArgument;
- (void)_processManagedAppsOnlyArgument;
- (void)_reset;
- (void)_validateRequestDictionaryIsPresentAndADictionary;
- (void)fetchAppProperties;
- (void)setAppItems:(id)a3;
- (void)setAppsRequested:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setIsUserEnrollment:(BOOL)a3;
- (void)setItemsRequested:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setShouldReturnManagedAppsOnly:(BOOL)a3;
@end

@implementation MDMInstalledApplicationListCommand

- (id)responseForRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(MDMInstalledApplicationListCommand *)self _reset];
  [(MDMInstalledApplicationListCommand *)self setRequest:v4];
  [(MDMInstalledApplicationListCommand *)self _processArguments];
  [(MDMInstalledApplicationListCommand *)self fetchAppProperties];
  v5 = objc_opt_new();
  v6 = [(MDMInstalledApplicationListCommand *)self appItems];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v10) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
  v11 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  v19 = @"InstalledApplicationList";
  v20 = v5;
  v12 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [v11 addEntriesFromDictionary:v12];

  v13 = (void *)[v11 copy];
  return v13;
}

- (void)_reset
{
  [(MDMInstalledApplicationListCommand *)self setRequest:0];
  [(MDMInstalledApplicationListCommand *)self setAppsRequested:0];
  [(MDMInstalledApplicationListCommand *)self setShouldReturnManagedAppsOnly:0];
  [(MDMInstalledApplicationListCommand *)self setItemsRequested:0];
}

- (void)_processArguments
{
  [(MDMInstalledApplicationListCommand *)self _processIdentifiersArgument];
  [(MDMInstalledApplicationListCommand *)self _processManagedAppsOnlyArgument];
  [(MDMInstalledApplicationListCommand *)self _processItemsArgument];
}

- (void)_processIdentifiersArgument
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(MDMInstalledApplicationListCommand *)self _validateRequestDictionaryIsPresentAndADictionary];
  v3 = [(MDMInstalledApplicationListCommand *)self request];
  id v4 = [v3 objectForKeyedSubscript:@"Identifiers"];

  if (v4)
  {
    v13 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"InvalidArgument" format:@"argument Identifiers is not an array"];
    }
    v5 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v14 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [MEMORY[0x263EFF940] raise:@"InvalidArgument" format:@"identifier is not a string"];
          }
          objc_msgSend(v5, "addObject:", v11, v13);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v12 = (void *)[v5 copy];
    [(MDMInstalledApplicationListCommand *)v13 setAppsRequested:v12];

    id v4 = v14;
  }
  else
  {
    [(MDMInstalledApplicationListCommand *)self setAppsRequested:0];
  }
}

- (void)_processManagedAppsOnlyArgument
{
  [(MDMInstalledApplicationListCommand *)self _validateRequestDictionaryIsPresentAndADictionary];
  v3 = [(MDMInstalledApplicationListCommand *)self request];
  id v6 = [v3 objectForKeyedSubscript:@"ManagedAppsOnly"];

  id v4 = v6;
  if (v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = v6;
    if ((isKindOfClass & 1) == 0)
    {
      [MEMORY[0x263EFF940] raise:@"InvalidArgument" format:@"argument ManagedAppsOnly is not a number (BOOLean)"];
      id v4 = v6;
    }
  }
  -[MDMInstalledApplicationListCommand setShouldReturnManagedAppsOnly:](self, "setShouldReturnManagedAppsOnly:", -[MDMInstalledApplicationListCommand isUserEnrollment](self, "isUserEnrollment") | [v4 BOOLValue]);
}

- (void)_processItemsArgument
{
  v2 = self;
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(MDMInstalledApplicationListCommand *)self _validateRequestDictionaryIsPresentAndADictionary];
  v3 = [(MDMInstalledApplicationListCommand *)v2 request];
  id v4 = [v3 objectForKeyedSubscript:@"Items"];

  v5 = objc_opt_new();
  id v6 = [(id)objc_opt_class() allItems];
  uint64_t v7 = v6;
  if (v4)
  {
    long long v18 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"InvalidArgument" format:@"argument Items is not an array"];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [MEMORY[0x263EFF940] raise:@"InvalidArgument" format:@"item is not a string"];
          }
          if (objc_msgSend(v7, "containsObject:", v13, v17))
          {
            [v5 addObject:v13];
          }
          else
          {
            v14 = *(NSObject **)DMCLogObjects();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v24 = v13;
              _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_ERROR, "InstalledApplicationList command requested invalid Item %{public}@. Ignored.", buf, 0xCu);
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v10);
    }

    id v4 = v17;
    v2 = v18;
  }
  else
  {
    long long v15 = [v6 allObjects];
    [v5 addObjectsFromArray:v15];
  }
  long long v16 = [(id)objc_opt_class() itemsThatMustAlwaysBeReturned];
  [v5 unionSet:v16];

  [(MDMInstalledApplicationListCommand *)v2 setItemsRequested:v5];
}

+ (id)itemsThatMustAlwaysBeReturned
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Identifier";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (void)_validateRequestDictionaryIsPresentAndADictionary
{
  v3 = [(MDMInstalledApplicationListCommand *)self request];

  if (!v3) {
    [MEMORY[0x263EFF940] raise:@"InvalidArgument" format:@"request does not exist"];
  }
  id v4 = [(MDMInstalledApplicationListCommand *)self request];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x263EFF940];
    [v6 raise:@"InvalidArgument" format:@"request is not a dictionary"];
  }
}

- (void)fetchAppProperties
{
  id v6 = [(MDMInstalledApplicationListCommand *)self dataSource];
  v3 = [(MDMInstalledApplicationListCommand *)self appsRequested];
  [v6 setAppsRequested:v3];

  objc_msgSend(v6, "setShouldReturnManagedAppsOnly:", -[MDMInstalledApplicationListCommand shouldReturnManagedAppsOnly](self, "shouldReturnManagedAppsOnly"));
  id v4 = [(MDMInstalledApplicationListCommand *)self itemsRequested];
  [v6 setItemsRequested:v4];

  [v6 fetchAppItems];
  v5 = [v6 appItems];
  [(MDMInstalledApplicationListCommand *)self setAppItems:v5];
}

+ (id)allItems
{
  v6[16] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Identifier";
  v6[1] = @"ExternalVersionIdentifier";
  void v6[2] = @"DistributorIdentifier";
  v6[3] = @"Version";
  v6[4] = @"ShortVersion";
  v6[5] = @"Name";
  v6[6] = @"BundleSize";
  v6[7] = @"DynamicSize";
  v6[8] = @"IsValidated";
  v6[9] = @"Installing";
  v6[10] = @"AppStoreVendable";
  v6[11] = @"DeviceBasedVPP";
  v6[12] = @"BetaApp";
  v6[13] = @"AdHocCodeSigned";
  v6[14] = @"HasUpdateAvailable";
  v6[15] = @"IsAppClip";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:16];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)isUserEnrollment
{
  return self->_isUserEnrollment;
}

- (void)setIsUserEnrollment:(BOOL)a3
{
  self->_isUserEnrollment = a3;
}

- (MDMAppItemsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSDictionary)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSSet)appsRequested
{
  return self->_appsRequested;
}

- (void)setAppsRequested:(id)a3
{
}

- (BOOL)shouldReturnManagedAppsOnly
{
  return self->_shouldReturnManagedAppsOnly;
}

- (void)setShouldReturnManagedAppsOnly:(BOOL)a3
{
  self->_shouldReturnManagedAppsOnly = a3;
}

- (NSSet)itemsRequested
{
  return self->_itemsRequested;
}

- (void)setItemsRequested:(id)a3
{
}

- (NSDictionary)appItems
{
  return self->_appItems;
}

- (void)setAppItems:(id)a3
{
}

- (NSDictionary)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_appItems, 0);
  objc_storeStrong((id *)&self->_itemsRequested, 0);
  objc_storeStrong((id *)&self->_appsRequested, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end