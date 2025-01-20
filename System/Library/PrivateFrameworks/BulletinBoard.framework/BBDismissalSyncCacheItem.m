@interface BBDismissalSyncCacheItem
- (BBDismissalSyncCacheItem)init;
- (NSMutableArray)dismissalDictionariesAndFeeds;
- (NSMutableDictionary)dismissalIDToFeeds;
- (id)description;
- (id)findBulletinMatch:(id)a3;
- (id)purgeExpired;
- (void)cacheDismissalDictionaries:(id)a3 dismissalIDs:(id)a4 forFeeds:(unint64_t)a5;
- (void)removeBulletinMatch:(id)a3;
@end

@implementation BBDismissalSyncCacheItem

- (BBDismissalSyncCacheItem)init
{
  v8.receiver = self;
  v8.super_class = (Class)BBDismissalSyncCacheItem;
  v2 = [(BBDismissalSyncCacheItem *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    dismissalDictionariesAndFeeds = v2->_dismissalDictionariesAndFeeds;
    v2->_dismissalDictionariesAndFeeds = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dismissalIDToFeeds = v2->_dismissalIDToFeeds;
    v2->_dismissalIDToFeeds = v5;
  }
  return v2;
}

- (void)cacheDismissalDictionaries:(id)a3 dismissalIDs:(id)a4 forFeeds:(unint64_t)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v27 = a4;
  obuint64_t j = v8;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v13 = self->_dismissalDictionariesAndFeeds;
        uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v35;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v35 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v34 + 1) + 8 * j);
              if ([v18 matchDismissalDictionary:v12])
              {
                [v18 addFeeds:a5];
                goto LABEL_16;
              }
            }
            uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        v13 = [[BBDismissalDictionaryAndFeeds alloc] initWithDismissalDictionary:v12 andFeeds:a5];
        [(NSMutableArray *)self->_dismissalDictionariesAndFeeds addObject:v13];
LABEL_16:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v10);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = v27;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * k);
        v25 = [(NSMutableDictionary *)self->_dismissalIDToFeeds objectForKeyedSubscript:v24];
        if (v25)
        {
          v26 = v25;
          [(BBDismissalItem *)v25 addFeeds:a5];
        }
        else
        {
          v26 = [[BBDismissalItem alloc] initWithFeeds:a5];
          [(NSMutableDictionary *)self->_dismissalIDToFeeds setObject:v26 forKeyedSubscript:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v21);
  }
}

- (id)findBulletinMatch:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 dismissalID];
  if (!v5
    || ([(NSMutableDictionary *)self->_dismissalIDToFeeds objectForKeyedSubscript:v5],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v7 = (void *)v6,
        id v8 = [[BBDismissalSyncBulletinMatch alloc] initWithDismissalID:v5 andItem:v6], v7, !v8))
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v10 = [v4 date];
    if (v10) {
      [v9 setObject:v10 forKeyedSubscript:@"d"];
    }
    v11 = [v4 syncHash];
    if (v11) {
      [v9 setObject:v11 forKeyedSubscript:@"h"];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_dismissalDictionariesAndFeeds;
    id v8 = (BBDismissalSyncBulletinMatch *)[(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (BBDismissalSyncBulletinMatch *)((char *)i + 1))
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v12);
          }
          uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v15, "matchDismissalDictionary:", v9, (void)v17))
          {
            id v8 = [[BBDismissalSyncBulletinMatch alloc] initWithDismissalDictionaryItem:v15];
            goto LABEL_18;
          }
        }
        id v8 = (BBDismissalSyncBulletinMatch *)[(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  return v8;
}

- (void)removeBulletinMatch:(id)a3
{
  id v6 = a3;
  id v4 = [v6 dismissalID];
  if (v4)
  {
    [(NSMutableDictionary *)self->_dismissalIDToFeeds removeObjectForKey:v4];
  }
  else
  {
    v5 = [v6 dismissalItem];
    if (v5) {
      [(NSMutableArray *)self->_dismissalDictionariesAndFeeds removeObject:v5];
    }
  }
}

- (id)purgeExpired
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  id v3 = objc_alloc_init(MEMORY[0x263F089C8]);
  dismissalDictionariesAndFeeds = self->_dismissalDictionariesAndFeeds;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__BBDismissalSyncCacheItem_purgeExpired__block_invoke;
  v17[3] = &unk_264295C38;
  id v5 = v3;
  id v18 = v5;
  long long v19 = &v20;
  [(NSMutableArray *)dismissalDictionariesAndFeeds enumerateObjectsUsingBlock:v17];
  [(NSMutableArray *)self->_dismissalDictionariesAndFeeds removeObjectsAtIndexes:v5];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  dismissalIDToFeeds = self->_dismissalIDToFeeds;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __40__BBDismissalSyncCacheItem_purgeExpired__block_invoke_2;
  uint64_t v14 = &unk_264295C60;
  id v8 = v6;
  id v15 = v8;
  uint64_t v16 = &v20;
  [(NSMutableDictionary *)dismissalIDToFeeds enumerateKeysAndObjectsUsingBlock:&v11];
  -[NSMutableDictionary removeObjectsForKeys:](self->_dismissalIDToFeeds, "removeObjectsForKeys:", v8, v11, v12, v13, v14);
  id v9 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v9;
}

void __40__BBDismissalSyncCacheItem_purgeExpired__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if ([v10 hasExpired])
  {
    [*(id *)(a1 + 32) addIndex:a3];
  }
  else
  {
    id v5 = [v10 expiration];
    uint64_t v6 = [v5 compare:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    if (v6 == -1)
    {
      uint64_t v7 = [v10 expiration];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

void __40__BBDismissalSyncCacheItem_purgeExpired__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v5 hasExpired])
  {
    [*(id *)(a1 + 32) addObject:v11];
  }
  else
  {
    uint64_t v6 = [v5 expiration];
    uint64_t v7 = [v6 compare:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    if (v7 == -1)
    {
      uint64_t v8 = [v5 expiration];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; dismissalDictionariesAndFeeds:%@; dismissalIDToFeeds:%@>",
               objc_opt_class(),
               self,
               self->_dismissalDictionariesAndFeeds,
               self->_dismissalIDToFeeds);
}

- (NSMutableArray)dismissalDictionariesAndFeeds
{
  return self->_dismissalDictionariesAndFeeds;
}

- (NSMutableDictionary)dismissalIDToFeeds
{
  return self->_dismissalIDToFeeds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalIDToFeeds, 0);
  objc_storeStrong((id *)&self->_dismissalDictionariesAndFeeds, 0);
}

@end