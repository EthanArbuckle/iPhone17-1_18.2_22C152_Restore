@interface CommunicationsFilterBlockListCache
- (CMFNotificationObserver)blockListUpdateObserver;
- (CommunicationsFilterBlockListCache)init;
- (int64_t)cachedResponseForItem:(id)a3;
- (void)removeItemFromCache:(id)a3;
- (void)setResponse:(BOOL)a3 forItem:(id)a4;
- (void)syncListEmptyState;
@end

@implementation CommunicationsFilterBlockListCache

- (CommunicationsFilterBlockListCache)init
{
  v17.receiver = self;
  v17.super_class = (Class)CommunicationsFilterBlockListCache;
  v2 = [(CommunicationsFilterBlockListCache *)&v17 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = [CMFNotificationObserver alloc];
    v4 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(CMFSyncAgentBlockListUpdated, "UTF8String"));
    uint64_t v5 = MEMORY[0x263EF83A0];
    id v6 = MEMORY[0x263EF83A0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __42__CommunicationsFilterBlockListCache_init__block_invoke;
    v14[3] = &unk_264197850;
    objc_copyWeak(&v15, &location);
    uint64_t v7 = [(CMFNotificationObserver *)v3 initWithName:v4 queue:v5 callback:v14];
    blockListUpdateObserver = v2->_blockListUpdateObserver;
    v2->_blockListUpdateObserver = (CMFNotificationObserver *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
    recentItems = v2->_recentItems;
    v2->_recentItems = (NSMutableArray *)v9;

    v2->_listIsEmpty = 0;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __42__CommunicationsFilterBlockListCache_init__block_invoke_2;
    handler[3] = &unk_264197878;
    v13 = v2;
    notify_register_dispatch("_CMFBlockListIsEmptyToken", &v2->_notifyEmptyListToken, MEMORY[0x263EF83A0], handler);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setResponse:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = v7->_recentItems;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v8);
      }
      v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      if (objc_msgSend(v12, "matchesItem:", v6, (void)v16)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v12;

    if (!v13) {
      goto LABEL_12;
    }
    [(NSMutableArray *)v7->_recentItems removeObject:v13];
    [(NSMutableArray *)v7->_recentItems insertObject:v13 atIndex:0];
    [v13 setIsInList:v4];
  }
  else
  {
LABEL_9:

LABEL_12:
    if ((unint64_t)[(NSMutableArray *)v7->_recentItems count] >= 0xA) {
      [(NSMutableArray *)v7->_recentItems removeLastObject];
    }
    v14 = [[CommunicationFilterItemCache alloc] initWithFilterItem:v6 isInList:-1];
    [(NSMutableArray *)v7->_recentItems insertObject:v14 atIndex:0];

    id v13 = 0;
  }
  id v15 = CMFDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v21 = v4;
    _os_log_impl(&dword_2129DC000, v15, OS_LOG_TYPE_DEFAULT, "cache setResponse = %d", buf, 8u);
  }

  objc_sync_exit(v7);
}

- (int64_t)cachedResponseForItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_listIsEmpty)
  {
    id v6 = CMFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2129DC000, v6, OS_LOG_TYPE_DEFAULT, "Since _listIsEmpty return NO", buf, 2u);
    }
    int64_t v7 = 0;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = v5->_recentItems;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
LABEL_7:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_msgSend(v12, "matchesItem:", v4, (void)v14)) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v9) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      id v6 = v12;

      if (!v6) {
        goto LABEL_16;
      }
      int64_t v7 = [v6 isInList];
    }
    else
    {
LABEL_13:

      id v6 = 0;
LABEL_16:
      int64_t v7 = -1;
    }
  }

  objc_sync_exit(v5);
  return v7;
}

void __42__CommunicationsFilterBlockListCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _blockListChanged];
    id WeakRetained = v2;
  }
}

void __42__CommunicationsFilterBlockListCache_init__block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = CMFDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2129DC000, v3, OS_LOG_TYPE_DEFAULT, "Notify empty token changed.", v4, 2u);
  }

  [*(id *)(a1 + 32) syncListEmptyState];
  objc_sync_exit(v2);
}

- (void)removeItemFromCache:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5->_recentItems;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 matchesItem:v4])
        {
          id v11 = v10;

          if (v11) {
            [(NSMutableArray *)v5->_recentItems removeObject:v11];
          }
          goto LABEL_12;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = 0;
LABEL_12:
  v12 = CMFDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_2129DC000, v12, OS_LOG_TYPE_DEFAULT, (const char *)&unk_2129E0DC5, v13, 2u);
  }

  [(CommunicationsFilterBlockListCache *)v5 syncListEmptyState];
  objc_sync_exit(v5);
}

- (void)syncListEmptyState
{
  uint64_t state64 = self->_listIsEmpty;
  notify_get_state(self->_notifyEmptyListToken, &state64);
  uint64_t v3 = state64;
  self->_listIsEmpty = state64 != 0;
  id v4 = CMFDefaultLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      __int16 v9 = 0;
      id v6 = "Our list is empty.";
      uint64_t v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_2129DC000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    __int16 v8 = 0;
    id v6 = "Our list is not empty.";
    uint64_t v7 = (uint8_t *)&v8;
    goto LABEL_6;
  }
}

- (CMFNotificationObserver)blockListUpdateObserver
{
  return self->_blockListUpdateObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockListUpdateObserver, 0);
  objc_storeStrong((id *)&self->_recentItems, 0);
}

@end