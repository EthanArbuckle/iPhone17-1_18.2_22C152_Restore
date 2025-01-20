@interface FPStitchingManager
+ (id)parentIdNameKeyForItem:(id)a3;
+ (id)sharedInstance;
- (BOOL)cleanStitchedForItemID:(id)a3 ignoreSession:(id)a4;
- (FPStitchingManager)init;
- (NSArray)allPlaceholderReplacementsIDs;
- (NSDictionary)allPlaceholderItemsByParentIdentifierAndName;
- (NSDictionary)stitchedFieldsAndItemsByItemIDs;
- (NSMutableArray)allDeletedIDs;
- (id)stitchedItemsForParentID:(id)a3;
- (void)addBouncedItem:(id)a3;
- (void)registerStitchingSession:(id)a3;
- (void)removeBouncedItemsWithIDs:(id)a3;
@end

@implementation FPStitchingManager

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_42);
  }
  v2 = (void *)sharedInstance_instance_0;

  return v2;
}

- (NSDictionary)allPlaceholderItemsByParentIdentifierAndName
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v4->_stitchingSessions;
  uint64_t v20 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v6 = [v5 placeholderItems];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v23 != v8) {
                objc_enumerationMutation(v6);
              }
              v10 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              bouncedItems = v4->_bouncedItems;
              v12 = [v10 itemID];
              v13 = [(NSMapTable *)bouncedItems objectForKey:v12];

              if (v13) {
                v14 = v13;
              }
              else {
                v14 = v10;
              }
              id v15 = v14;
              v16 = +[FPStitchingManager parentIdNameKeyForItem:v15];
              [v3 setObject:v15 forKey:v16];
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v7);
        }
      }
      uint64_t v20 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }

  objc_sync_exit(v4);

  return (NSDictionary *)v3;
}

- (id)stitchedItemsForParentID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new();
    v6 = self;
    objc_sync_enter(v6);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = v6->_stitchingSessions;
    uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v11, "isActive", (void)v15))
          {
            v12 = [v11 stitchedItemsByParentID];
            v13 = [v12 objectForKeyedSubscript:v4];

            if (v13) {
              [v5 addObjectsFromArray:v13];
            }
          }
        }
        uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSDictionary)stitchedFieldsAndItemsByItemIDs
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = self;
  objc_sync_enter(v4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v18 = v4;
  obuint64_t j = v4->_stitchingSessions;
  uint64_t v21 = [(NSHashTable *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v5 isActive])
        {
          v6 = [v5 stitchedFieldsAndItemsByItemIDs];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v7 = [v6 allKeys];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v24 != v9) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * j);
                v12 = [v3 objectForKeyedSubscript:v11];
                v13 = v12;
                if (v12) {
                  id v14 = v12;
                }
                else {
                  id v14 = (id)objc_opt_new();
                }
                long long v15 = v14;

                long long v16 = [v6 objectForKeyedSubscript:v11];
                [v15 addObject:v16];

                [v3 setObject:v15 forKeyedSubscript:v11];
              }
              uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v8);
          }
        }
      }
      uint64_t v21 = [(NSHashTable *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }

  objc_sync_exit(v18);

  return (NSDictionary *)v3;
}

- (NSArray)allPlaceholderReplacementsIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = self;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = v4->_stitchingSessions;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "placeholderReplacementsIDs", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);

  return (NSArray *)v3;
}

- (NSMutableArray)allDeletedIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = self;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = v4->_stitchingSessions;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "deletedIDs", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);

  return (NSMutableArray *)v3;
}

uint64_t __36__FPStitchingManager_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (FPStitchingManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)FPStitchingManager;
  v2 = [(FPStitchingManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    stitchingSessions = v2->_stitchingSessions;
    v2->_stitchingSessions = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    bouncedItems = v2->_bouncedItems;
    v2->_bouncedItems = (NSMapTable *)v5;
  }
  return v2;
}

- (void)registerStitchingSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPStitchingManager registerStitchingSession:]();
  }

  uint64_t v6 = self;
  objc_sync_enter(v6);
  [(NSHashTable *)v6->_stitchingSessions addObject:v4];
  objc_sync_exit(v6);
}

- (void)addBouncedItem:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  bouncedItems = v4->_bouncedItems;
  uint64_t v6 = [v7 itemID];
  [(NSMapTable *)bouncedItems setObject:v7 forKey:v6];

  objc_sync_exit(v4);
}

- (void)removeBouncedItemsWithIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[NSMapTable removeObjectForKey:](v5->_bouncedItems, "removeObjectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

+ (id)parentIdNameKeyForItem:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v4 parentItemIdentifier];
  id v6 = [v4 filename];

  uint64_t v7 = [v6 uppercaseString];
  uint64_t v8 = [v3 stringWithFormat:@"%@/%@", v5, v7];

  return v8;
}

- (BOOL)cleanStitchedForItemID:(id)a3 ignoreSession:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = v8->_stitchingSessions;
  int v10 = 0;
  uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v16 + 1) + 8 * v13);
        if (v14 != v7) {
          v10 |= objc_msgSend(v14, "cleanStitchedItemForItemID:", v6, (void)v16);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v8);
  return v10 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bouncedItems, 0);

  objc_storeStrong((id *)&self->_stitchingSessions, 0);
}

- (void)registerStitchingSession:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v0, v1, "[DEBUG] registering <%@:%p>", v2, v3, v4, v5, v6);
}

@end