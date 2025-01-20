@interface MCBookmarkManager
+ (id)sharedManager;
- (MCBookmarkManager)init;
- (NSArray)memberQueueCurrentUserBookmarks;
- (NSArray)userBookmarks;
- (NSDictionary)memberQueueStashedBookmarksByLabel;
- (OS_dispatch_queue)memberQueue;
- (int)notificationToken;
- (void)memberQueueRereadBookmarks;
- (void)memberQueueSetUserBookmarks:(id)a3;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueCurrentUserBookmarks:(id)a3;
- (void)setMemberQueueStashedBookmarksByLabel:(id)a3;
- (void)setNotificationToken:(int)a3;
- (void)setUserBookmarks:(id)a3;
@end

@implementation MCBookmarkManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __34__MCBookmarkManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(MCBookmarkManager);
  return MEMORY[0x1F41817F8]();
}

- (MCBookmarkManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)MCBookmarkManager;
  v2 = [(MCBookmarkManager *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("memberQueue", MEMORY[0x1E4F14430]);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    p_notificationToken = &v2->_notificationToken;
    v6 = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __25__MCBookmarkManager_init__block_invoke;
    handler[3] = &unk_1E5A65D28;
    v2 = v2;
    v11 = v2;
    LODWORD(p_notificationToken) = notify_register_dispatch("com.apple.managedconfiguration.bookmarkCacheFlush", p_notificationToken, v6, handler);

    if (p_notificationToken)
    {
      v7 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Could not register for notification.", v9, 2u);
      }

      v2 = 0;
    }
    else
    {
      [(MCBookmarkManager *)v2 memberQueueRereadBookmarks];
    }
  }
  return v2;
}

void __25__MCBookmarkManager_init__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__MCBookmarkManager_init__block_invoke_2;
  block[3] = &unk_1E5A65CB0;
  id v4 = *(id *)(a1 + 32);
  dispatch_barrier_async(v2, block);
}

uint64_t __25__MCBookmarkManager_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueRereadBookmarks];
}

- (void)memberQueueRereadBookmarks
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_DEBUG, "Rereading bookmarks", buf, 2u);
  }
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = MCSystemWebContentFilterCurrentUserBookmarksPath();
  int v6 = [v4 fileExistsAtPath:v5 isDirectory:0];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = MCSystemWebContentFilterCurrentUserBookmarksPath();
    v9 = [v7 arrayWithContentsOfFile:v8];

    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v11 = v9;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [[MCBookmark alloc] initWithSerializableDictionary:*(void *)(*((void *)&v49 + 1) + 8 * i)];
          [(NSArray *)v10 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v13);
    }

    memberQueueCurrentUserBookmarks = self->_memberQueueCurrentUserBookmarks;
    self->_memberQueueCurrentUserBookmarks = v10;
  }
  else
  {
    v11 = self->_memberQueueCurrentUserBookmarks;
    self->_memberQueueCurrentUserBookmarks = 0;
  }

  v18 = MCSystemWebContentFilterStashedUserBookmarksPath();
  int v19 = [v4 fileExistsAtPath:v18 isDirectory:0];

  v20 = (void *)MEMORY[0x1E4F1C9E8];
  if (v19)
  {
    v36 = v4;
    v37 = self;
    v21 = MCSystemWebContentFilterStashedUserBookmarksPath();
    v22 = [v20 dictionaryWithContentsOfFile:v21];

    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
    v39 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v23 = v22;
    uint64_t v40 = [(NSDictionary *)v23 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v40)
    {
      uint64_t v38 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v46 != v38) {
            objc_enumerationMutation(v23);
          }
          uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          v26 = [(NSDictionary *)v23 objectForKeyedSubscript:v25];
          v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v26, "count"));
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v28 = v26;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v54 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v42;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v42 != v31) {
                  objc_enumerationMutation(v28);
                }
                v33 = [[MCBookmark alloc] initWithSerializableDictionary:*(void *)(*((void *)&v41 + 1) + 8 * k)];
                [v27 addObject:v33];
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v54 count:16];
            }
            while (v30);
          }

          [(NSDictionary *)v39 setObject:v27 forKeyedSubscript:v25];
        }
        uint64_t v40 = [(NSDictionary *)v23 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v40);
    }

    memberQueueStashedBookmarksByLabel = v37->_memberQueueStashedBookmarksByLabel;
    v37->_memberQueueStashedBookmarksByLabel = v39;

    id v4 = v36;
  }
  else
  {
    v35 = [MEMORY[0x1E4F1C9E8] dictionary];
    v23 = self->_memberQueueStashedBookmarksByLabel;
    self->_memberQueueStashedBookmarksByLabel = v35;
  }
}

- (void)memberQueueSetUserBookmarks:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_memberQueueCurrentUserBookmarks, a3);
  memberQueueCurrentUserBookmarks = self->_memberQueueCurrentUserBookmarks;
  if (memberQueueCurrentUserBookmarks)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](memberQueueCurrentUserBookmarks, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = self->_memberQueueCurrentUserBookmarks;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "serializableDictionary", (void)v15);
          [v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    uint64_t v14 = MCSystemWebContentFilterCurrentUserBookmarksPath();
    [v7 writeToFile:v14 atomically:1];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v14 = MCSystemWebContentFilterCurrentUserBookmarksPath();
    [v7 removeItemAtPath:v14 error:0];
  }
}

- (void)setUserBookmarks:(id)a3
{
  id v4 = a3;
  id v5 = [(MCBookmarkManager *)self memberQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MCBookmarkManager_setUserBookmarks___block_invoke;
  v7[3] = &unk_1E5A65E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

uint64_t __38__MCBookmarkManager_setUserBookmarks___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)[*(id *)(a1 + 40) copy];
  [v1 memberQueueSetUserBookmarks:v2];

  return notify_post("com.apple.managedconfiguration.bookmarkCacheFlush");
}

- (NSArray)userBookmarks
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  dispatch_queue_t v3 = [(MCBookmarkManager *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__MCBookmarkManager_userBookmarks__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __34__MCBookmarkManager_userBookmarks__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) memberQueueCurrentUserBookmarks];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (NSArray)memberQueueCurrentUserBookmarks
{
  return self->_memberQueueCurrentUserBookmarks;
}

- (void)setMemberQueueCurrentUserBookmarks:(id)a3
{
}

- (NSDictionary)memberQueueStashedBookmarksByLabel
{
  return self->_memberQueueStashedBookmarksByLabel;
}

- (void)setMemberQueueStashedBookmarksByLabel:(id)a3
{
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(int)a3
{
  self->_notificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueStashedBookmarksByLabel, 0);
  objc_storeStrong((id *)&self->_memberQueueCurrentUserBookmarks, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end