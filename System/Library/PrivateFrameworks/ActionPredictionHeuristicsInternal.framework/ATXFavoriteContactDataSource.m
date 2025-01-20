@interface ATXFavoriteContactDataSource
+ (id)_entryToDict:(id)a3 device:(id)a4;
- (ATXFavoriteContactDataSource)initWithDevice:(id)a3;
- (void)favoritesWithContacts:(id)a3 callback:(id)a4;
@end

@implementation ATXFavoriteContactDataSource

- (ATXFavoriteContactDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFavoriteContactDataSource;
  v6 = [(ATXFavoriteContactDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)favoritesWithContacts:(id)a3 callback:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727368))
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__14;
    v17 = __Block_byref_object_dispose__14;
    id v18 = 0;
    device = self->_device;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__ATXFavoriteContactDataSource_favoritesWithContacts_callback___block_invoke;
    v9[3] = &unk_1E68A55F8;
    id v10 = v6;
    v11 = self;
    v12 = &v13;
    [(ATXHeuristicDevice *)device accessFavoriteContacts:v9];
    v7[2](v7, v14[5], 0);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7[2](v7, MEMORY[0x1E4F1CBF0], 0);
  }
}

void __63__ATXFavoriteContactDataSource_favoritesWithContacts_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    v4 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [v3 entriesForContact:*(void *)(*((void *)&v26 + 1) + 8 * v9)];
          if ([v10 count]) {
            [v4 addObjectsFromArray:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = [v3 entries];
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = +[ATXFavoriteContactDataSource _entryToDict:device:](ATXFavoriteContactDataSource, "_entryToDict:device:", *(void *)(*((void *)&v22 + 1) + 8 * v16), *(void *)(*(void *)(a1 + 40) + 8), (void)v22);
        if (v17) {
          [v11 addObject:v17];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  id v18 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    __63__ATXFavoriteContactDataSource_favoritesWithContacts_callback___block_invoke_cold_1(v11, v18);
  }

  uint64_t v19 = [v11 copy];
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

+ (id)_entryToDict:(id)a3 device:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [v5 wrap:v6];
  [v7 setObject:v8 forKeyedSubscript:@"CNFavoritesEntry"];

  uint64_t v9 = [v6 name];
  [v7 setObject:v9 forKeyedSubscript:@"name"];

  id v10 = [v6 value];
  [v7 setObject:v10 forKeyedSubscript:@"handle"];

  v11 = [v6 actionType];
  [v7 setObject:v11 forKeyedSubscript:@"actionType"];

  id v12 = [v6 bundleIdentifier];
  [v7 setObject:v12 forKeyedSubscript:@"bundleIdentifier"];

  uint64_t v13 = [v6 contactProperty];

  uint64_t v14 = [v13 contact];

  if (v14)
  {
    uint64_t v15 = [v5 dictContactForCNContact:v14];
    [v7 setObject:v15 forKeyedSubscript:@"contact"];
  }

  return v7;
}

- (void).cxx_destruct
{
}

void __63__ATXFavoriteContactDataSource_favoritesWithContacts_callback___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_DEBUG, "Found %lu favorite(s) for query", (uint8_t *)&v3, 0xCu);
}

@end