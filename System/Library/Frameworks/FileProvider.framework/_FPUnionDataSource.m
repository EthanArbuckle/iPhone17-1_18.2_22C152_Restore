@interface _FPUnionDataSource
- (BOOL)hasMoreIncoming;
- (FPCollectionDataSourceDelegate)delegate;
- (_FPUnionDataSource)initWithCollections:(id)a3;
- (void)collection:(id)a3 didEncounterError:(id)a4;
- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6;
- (void)collection:(id)a3 didUpdateObservedItem:(id)a4;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation _FPUnionDataSource

- (void)setDelegate:(id)a3
{
}

- (void)start
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_isRunning)
  {
    v2->_isRunning = 1;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = v2->_collections;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          [v7 setDelegate:v2];
          v8 = [v7 workingQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __27___FPUnionDataSource_start__block_invoke;
          block[3] = &unk_1E5AF0FF0;
          block[4] = v7;
          dispatch_async(v8, block);
        }
        uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
  }
  objc_sync_exit(v2);
}

- (_FPUnionDataSource)initWithCollections:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FPUnionDataSource;
  uint64_t v5 = [(_FPUnionDataSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    collections = v5->_collections;
    v5->_collections = (NSArray *)v6;
  }
  return v5;
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = self;
  objc_sync_enter(v3);
  BOOL isRunning = v3->_isRunning;
  objc_sync_exit(v3);

  if (isRunning)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = v3->_collections;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "items", (void)v13);
          [v5 addObjectsFromArray:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    long long v12 = [(_FPUnionDataSource *)v3 delegate];
    [v12 dataSource:v3 replaceContentsWithItems:v5 hasMoreChanges:0];
  }
}

- (FPCollectionDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (FPCollectionDataSourceDelegate *)WeakRetained;
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  obj = self;
  objc_sync_enter(obj);
  if (obj->_isRunning)
  {
    obj->_BOOL isRunning = 0;
    objc_sync_exit(obj);

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v2 = obj->_collections;
    uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v8 = objc_msgSend(v7, "workingQueue", obj);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __32___FPUnionDataSource_invalidate__block_invoke;
          block[3] = &unk_1E5AF0FF0;
          block[4] = v7;
          dispatch_async(v8, block);
        }
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
  else
  {
    objc_sync_exit(obj);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);

  objc_storeStrong((id *)&self->_collections, 0);
}

- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  long long v12 = self;
  objc_sync_enter(v12);
  LODWORD(a4) = v12->_isRunning;
  objc_sync_exit(v12);

  if (a4)
  {
    v23 = v11;
    long long v13 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if ([v9 isRootItem:v19])
          {
            [v9 updateRootItem:v19];
          }
          else
          {
            v20 = [v9 itemFilteringPredicate];
            v21 = [v9 additionalItemFilteringPredicate];
            if ((!v20 || [v20 evaluateWithObject:v19])
              && (!v21 || [v21 evaluateWithObject:v19]))
            {
              [v13 addObject:v19];
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }

    id v11 = v23;
    if ([v23 count] || objc_msgSend(v13, "count"))
    {
      v22 = [(_FPUnionDataSource *)v12 delegate];
      [v22 dataSource:v12 receivedUpdatedItems:v13 deletedItems:v23 hasMoreChanges:0];
    }
    id v10 = v24;
  }
}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  BOOL isRunning = v6->_isRunning;
  objc_sync_exit(v6);

  if (isRunning)
  {
    if (objc_msgSend(v5, "fp_isFileProviderError:", -2001))
    {
      uint64_t v8 = fp_current_or_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_INFO, "[INFO] error in union collection, skipping: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      [(_FPUnionDataSource *)v6 invalidate];
      id v9 = [(_FPUnionDataSource *)v6 delegate];
      [v9 dataSource:v6 wasInvalidatedWithError:v5];
    }
  }
}

- (void)collection:(id)a3 didUpdateObservedItem:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  BOOL isRunning = v8->_isRunning;
  objc_sync_exit(v8);

  if (isRunning)
  {
    if ([v6 isRootItem:v7])
    {
      [v6 updateRootItem:v7];
    }
    else
    {
      int v10 = [v6 itemFilteringPredicate];
      id v11 = [v6 additionalItemFilteringPredicate];
      if ((!v10 || [v10 evaluateWithObject:v7])
        && (!v11 || [v11 evaluateWithObject:v7]))
      {
        uint64_t v12 = [(_FPUnionDataSource *)v8 delegate];
        v14[0] = v7;
        long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        [v12 dataSource:v8 receivedUpdatedItems:v13 deletedItems:MEMORY[0x1E4F1CBF0] hasMoreChanges:0];
      }
    }
  }
}

- (BOOL)hasMoreIncoming
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  LODWORD(v3) = v2->_isRunning;
  objc_sync_exit(v2);

  if (v3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v4 = v2->_collections;
    uint64_t v3 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "hasMoreUpdates", (void)v8))
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v3 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v3;
}

@end