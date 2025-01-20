@interface DBIconModelStore
- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4;
- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4;
- (DBIconModelStore)initWithVehicleId:(id)a3;
- (NSString)vehicleId;
- (id)_iconListsByFlatteningPages:(id)a3;
- (id)loadCurrentIconState:(id *)a3;
@end

@implementation DBIconModelStore

- (DBIconModelStore)initWithVehicleId:(id)a3
{
  v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  v6 = [v4 defaultManager];
  v7 = [v6 URLsForDirectory:5 inDomains:1];
  v8 = [v7 firstObject];

  v9 = [v8 URLByAppendingPathComponent:@"SpringBoard" isDirectory:1];
  v10 = [NSString stringWithFormat:@"%@-CarDisplayIconState.plist", v5];
  v11 = [NSString stringWithFormat:@"%@-CarDisplayDesiredIconState.plist", v5];

  v12 = [v9 URLByAppendingPathComponent:v10];
  v13 = [v9 URLByAppendingPathComponent:v11];
  v16.receiver = self;
  v16.super_class = (Class)DBIconModelStore;
  v14 = [(SBIconModelPropertyListFileStore *)&v16 initWithIconStateURL:v12 desiredIconStateURL:v13];

  return v14;
}

- (id)loadCurrentIconState:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DBIconModelStore;
  uint64_t v4 = [(SBIconModelPropertyListFileStore *)&v11 loadCurrentIconState:a3];
  if (v4)
  {
    id v5 = (void *)v4;
    v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
    v7 = [v6 objectForKeyedSubscript:@"iconLists"];
    v8 = [(DBIconModelStore *)self _iconListsByFlatteningPages:v7];
    [v6 setObject:v8 forKeyedSubscript:@"iconLists"];

    v9 = [NSDictionary dictionaryWithDictionary:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  v8 = [v6 dictionaryWithDictionary:v7];
  v9 = [v7 objectForKeyedSubscript:@"iconLists"];

  v10 = [(DBIconModelStore *)self _iconListsByFlatteningPages:v9];
  [v8 setObject:v10 forKeyedSubscript:@"iconLists"];

  v12.receiver = self;
  v12.super_class = (Class)DBIconModelStore;
  LOBYTE(a4) = [(SBIconModelPropertyListFileStore *)&v12 saveCurrentIconState:v8 error:a4];

  return (char)a4;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  v8 = [v6 dictionaryWithDictionary:v7];
  v9 = [v7 objectForKeyedSubscript:@"iconLists"];

  v10 = [(DBIconModelStore *)self _iconListsByFlatteningPages:v9];
  [v8 setObject:v10 forKeyedSubscript:@"iconLists"];

  v12.receiver = self;
  v12.super_class = (Class)DBIconModelStore;
  LOBYTE(a4) = [(SBIconModelPropertyListFileStore *)&v12 saveDesiredIconState:v8 error:a4];

  return (char)a4;
}

- (id)_iconListsByFlatteningPages:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = v3;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF980] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v32 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v22;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v22 != v17) {
                  objc_enumerationMutation(v14);
                }
                [v7 addObject:*(void *)(*((void *)&v21 + 1) + 8 * j)];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v32 count:16];
            }
            while (v16);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v10);
    }

    v19 = DBLogForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_DEFAULT, "Flattened pages to %@", buf, 0xCu);
    }

    v29 = v7;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  }

  return v6;
}

- (NSString)vehicleId
{
  return self->_vehicleId;
}

- (void).cxx_destruct
{
}

@end