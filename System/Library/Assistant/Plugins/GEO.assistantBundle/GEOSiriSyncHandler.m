@interface GEOSiriSyncHandler
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)syncDidEnd;
@end

@implementation GEOSiriSyncHandler

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a6;
  v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138478083;
    v14 = v8;
    __int16 v15 = 2113;
    id v16 = v9;
    _os_log_impl(&dword_223311000, v11, OS_LOG_TYPE_DEBUG, "beginSyncWithAnchor:%{private}@ validity:%{private}@", (uint8_t *)&v13, 0x16u);
  }

  if (([v9 isEqualToString:@"20180510"] & 1) == 0)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138478083;
      v14 = @"20180510";
      __int16 v15 = 2113;
      id v16 = v9;
      _os_log_impl(&dword_223311000, v12, OS_LOG_TYPE_DEBUG, "local validity:%{private}@ differs from validity:%{private}@; will reset with local value",
        (uint8_t *)&v13,
        0x16u);
    }

    [v10 resetWithValidity:@"20180510"];
  }
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138477827;
    id v17 = v5;
    _os_log_impl(&dword_223311000, v7, OS_LOG_TYPE_DEBUG, "getChangeAfterAnchor:%{private}@", (uint8_t *)&v16, 0xCu);
  }

  id v8 = objc_alloc_init(MEMORY[0x263F41C00]);
  id v9 = [v8 postAnchor];
  if (objc_opt_class() && ([v9 isEqualToString:v5] & 1) == 0)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138478083;
      id v17 = v9;
      __int16 v18 = 2113;
      id v19 = v5;
      _os_log_impl(&dword_223311000, v10, OS_LOG_TYPE_DEBUG, "postAnchor:%{private}@ differs from preAnchor:%{private}@; will provide new domainObject",
        (uint8_t *)&v16,
        0x16u);
    }

    id v11 = objc_alloc_init(MEMORY[0x263F64A80]);
    v12 = [v8 additionalEnabledMarkets];
    [v11 setAdditionalEnabledTransitMarkets:v12];

    int v13 = [v8 manifestEnvironment];
    [v11 setEnvironment:v13];

    v14 = [NSURL URLWithString:@"siri-sync://siri-maps-client-info"];
    [v11 setIdentifier:v14];

    __int16 v15 = [v8 clientMetadata];
    [v11 setClientMetadata:v15];

    [v6 setObject:v11];
  }
  [v6 setPostAnchor:v9];
}

- (void)syncDidEnd
{
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_223311000, v2, OS_LOG_TYPE_DEBUG, "syncDidEnd", v3, 2u);
  }
}

@end