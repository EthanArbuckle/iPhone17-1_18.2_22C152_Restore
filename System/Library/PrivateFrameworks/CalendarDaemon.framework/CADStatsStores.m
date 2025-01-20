@interface CADStatsStores
+ (id)eventName;
- (BOOL)wantsStores;
- (id)eventDictionaries;
- (void)prepareWithContext:(id)a3;
- (void)processStores:(id)a3;
@end

@implementation CADStatsStores

+ (id)eventName
{
  return @"cadstats.Store";
}

- (BOOL)wantsStores
{
  return 1;
}

- (void)prepareWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  id v7 = a3;
  v5 = (NSMutableArray *)objc_opt_new();
  storeInfos = self->_storeInfos;
  self->_storeInfos = v5;
}

- (void)processStores:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_opt_new();
        [(NSMutableArray *)self->_storeInfos addObject:v9];
        *(void *)(v9 + 8) = CalStoreGetType();
        *(unsigned char *)(v9 + 32) = CalStoreIsDelegate();
        *(unsigned char *)(v9 + 33) = CalStoreIsEnabled();
        uint64_t v10 = CalStoreCopyUUID();
        if (v10)
        {
          v11 = (const void *)v10;
          v12 = [(CADStatCollectionContext *)self->_context accountStore];
          v13 = [v12 accountWithIdentifier:v11];

          v14 = [v13 displayAccount];
          v15 = [v14 accountType];
          uint64_t v16 = [v15 identifier];
          v17 = *(void **)(v9 + 24);
          *(void *)(v9 + 24) = v16;

          if (*(void *)(v9 + 24)) {
            *(void *)(v9 + 16) = PCSettingsGetStyle();
          }
          CFRelease(v11);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

- (id)eventDictionaries
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_storeInfos, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_storeInfos;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = objc_opt_new();
        [v9 setObject:&unk_1F151D9E0 forKeyedSubscript:@"instance"];
        uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(v8 + 8)];
        [v9 setObject:v10 forKeyedSubscript:@"storeType"];

        uint64_t v11 = *(void *)(v8 + 24);
        if (v11)
        {
          [v9 setObject:v11 forKeyedSubscript:@"accountType"];
          v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(v8 + 16)];
          [v9 setObject:v12 forKeyedSubscript:@"syncStyle"];
        }
        v13 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v8 + 32)];
        [v9 setObject:v13 forKeyedSubscript:@"isDelegate"];

        v14 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v8 + 33)];
        [v9 setObject:v14 forKeyedSubscript:@"isEnabled"];

        [v3 addObject:v9];
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeInfos, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end