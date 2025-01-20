@interface AFUIAutoCompleteMappingController
+ (id)sharedInstance;
- (id)heuristicStringsForTextContentTypes:(id)a3;
- (id)heuristicTextContentTypeForHints:(id)a3 textContentTypesToSkip:(id)a4;
- (void)_cachePlistMappings;
@end

@implementation AFUIAutoCompleteMappingController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__AFUIAutoCompleteMappingController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___instance;

  return v2;
}

uint64_t __51__AFUIAutoCompleteMappingController_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (void)_cachePlistMappings
{
  if (!self->_cache)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    cache = self->_cache;
    self->_cache = v3;

    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 pathForResource:@"ABAutoCompleteMappings" ofType:@"plist"];

    v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6 options:1 error:0];
    v9[5] = 0;
    [MEMORY[0x263EFFA08] setWithObject:@"Mappings"];
    _CFPropertyListCreateFiltered();
    v8 = [0 objectForKey:@"Mappings"];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__AFUIAutoCompleteMappingController__cachePlistMappings__block_invoke;
    v9[3] = &unk_2652497C0;
    v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

void __56__AFUIAutoCompleteMappingController__cachePlistMappings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 objectForKey:@"AutocompleteTokens"];
  v5 = [v3 objectForKey:@"FieldLabels"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setObject:forKey:", v5, *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)heuristicStringsForTextContentTypes:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)[v4 mutableCopy];
    if (self->_cache)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            long long v12 = [(NSMutableDictionary *)self->_cache objectForKey:v11];

            if (v12) {
              [v5 removeObject:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v8);
      }
    }
    if ([v5 count]) {
      [(AFUIAutoCompleteMappingController *)self _cachePlistMappings];
    }
    long long v13 = [MEMORY[0x263EFF9C0] set];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v4;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      uint64_t v18 = MEMORY[0x263EFFA68];
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", *(void *)(*((void *)&v24 + 1) + 8 * j), (void)v24);
          v21 = (void *)v20;
          if (v20) {
            uint64_t v22 = v20;
          }
          else {
            uint64_t v22 = v18;
          }
          [v13 addObjectsFromArray:v22];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (id)heuristicTextContentTypeForHints:(id)a3 textContentTypesToSkip:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    [(AFUIAutoCompleteMappingController *)self _cachePlistMappings];
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    id v20 = 0;
    cache = self->_cache;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __93__AFUIAutoCompleteMappingController_heuristicTextContentTypeForHints_textContentTypesToSkip___block_invoke;
    v11[3] = &unk_2652497E8;
    id v12 = v7;
    id v13 = v6;
    id v14 = &v15;
    [(NSMutableDictionary *)cache enumerateKeysAndObjectsUsingBlock:v11];
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __93__AFUIAutoCompleteMappingController_heuristicTextContentTypeForHints_textContentTypesToSkip___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0)
  {
    id v19 = v7;
    id v20 = v6;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v14 = *(id *)(a1 + 40);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v24;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v24 != v17) {
                  objc_enumerationMutation(v14);
                }
                if (!objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "compare:options:", v13, 129, v19, v20))
                {
                  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
                  *a4 = 1;
                  goto LABEL_17;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v10);
    }

    id v7 = v19;
    id v6 = v20;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistPath, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end