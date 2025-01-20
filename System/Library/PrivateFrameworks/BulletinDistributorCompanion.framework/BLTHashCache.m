@interface BLTHashCache
- (BLTHashCache)init;
- (void)_updateCacheWithItems:(id)a3 forSectionID:(id)a4 matchID:(id)a5 result:(id)a6;
- (void)updateCacheWithItems:(id)a3 forSectionID:(id)a4 matchID:(id)a5 result:(id)a6;
@end

@implementation BLTHashCache

- (BLTHashCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLTHashCache;
  v2 = [(BLTHashCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    cacheBySectionID = v2->_cacheBySectionID;
    v2->_cacheBySectionID = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)updateCacheWithItems:(id)a3 forSectionID:(id)a4 matchID:(id)a5 result:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__BLTHashCache_updateCacheWithItems_forSectionID_matchID_result___block_invoke;
  v18[3] = &unk_264683FE0;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  BLTDispatchWorkQueue(v18);
}

uint64_t __65__BLTHashCache_updateCacheWithItems_forSectionID_matchID_result___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCacheWithItems:*(void *)(a1 + 40) forSectionID:*(void *)(a1 + 48) matchID:*(void *)(a1 + 56) result:*(void *)(a1 + 64)];
}

- (void)_updateCacheWithItems:(id)a3 forSectionID:(id)a4 matchID:(id)a5 result:(id)a6
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, uint64_t, uint64_t))a6;
  id v14 = [(NSMutableDictionary *)self->_cacheBySectionID objectForKeyedSubscript:v11];
  id v15 = [v14 objectForKeyedSubscript:v12];
  id v16 = [MEMORY[0x263EFF9C0] setWithArray:v10];
  id v17 = (void *)[v16 mutableCopy];
  [v16 minusSet:v15];
  [v17 minusSet:v16];
  v44 = (void *)[v15 mutableCopy];
  v46 = v17;
  [v44 minusSet:v17];
  v41 = v12;
  v42 = v11;
  v38 = self;
  if ([v16 count] || objc_msgSend(v44, "count"))
  {
    if (!v14)
    {
      id v14 = [MEMORY[0x263EFF9A0] dictionary];
      [(NSMutableDictionary *)self->_cacheBySectionID setObject:v14 forKeyedSubscript:v11];
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", v12, self);
    uint64_t v19 = v18 = v14;

    v45 = v18;
    if (v19)
    {
      id v15 = (void *)v19;
    }
    else
    {
      id v15 = [MEMORY[0x263EFF9C0] set];
      [v18 setObject:v15 forKeyedSubscript:v12];
    }
  }
  else
  {
    v45 = v14;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v20 = v16;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v56 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        if (v13) {
          v13[2](v13, v25, [v10 indexOfObject:*(void *)(*((void *)&v55 + 1) + 8 * i)], 1);
        }
        objc_msgSend(v15, "addObject:", v25, v38);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v22);
  }
  v40 = v20;

  if (v13)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v26 = v46;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v52 != v29) {
            objc_enumerationMutation(v26);
          }
          v13[2](v13, *(void *)(*((void *)&v51 + 1) + 8 * j), objc_msgSend(v10, "indexOfObject:", *(void *)(*((void *)&v51 + 1) + 8 * j), v38, v40), 0);
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v28);
    }
  }
  v43 = v10;
  uint64_t v31 = objc_msgSend(v10, "count", v38);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v32 = v44;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v48 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v47 + 1) + 8 * k);
        if (v13) {
          v13[2](v13, *(void *)(*((void *)&v47 + 1) + 8 * k), v31++, 2);
        }
        [v15 removeObject:v37];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v34);
  }

  if (![v15 count])
  {
    [v45 removeObjectForKey:v41];
    if (![v45 count]) {
      [*(id *)(v39 + 8) removeObjectForKey:v42];
    }
  }
}

- (void).cxx_destruct
{
}

@end