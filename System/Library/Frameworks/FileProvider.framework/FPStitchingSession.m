@interface FPStitchingSession
- (BOOL)cleanStitchedItemForItemID:(id)a3;
- (BOOL)isActive;
- (FPStitchingSession)init;
- (NSArray)deletedIDs;
- (NSArray)placeholderItems;
- (NSArray)placeholderReplacementsIDs;
- (NSDictionary)stitchedFieldsAndItemsByItemIDs;
- (NSDictionary)stitchedItemsByParentID;
- (id)createArchivePlaceholderForItem:(id)a3 underParent:(id)a4 inProviderDomainID:(id)a5 withArchiveFormat:(unint64_t)a6;
- (id)createGenericArchivePlaceholderUnderParent:(id)a3 inProviderDomainID:(id)a4 withArchiveFormat:(unint64_t)a5;
- (id)createPlaceholderWithCopyOfExistingItem:(id)a3 lastUsageUpdatePolicy:(unint64_t)a4 underParent:(id)a5 inProviderDomainID:(id)a6;
- (id)createPlaceholderWithName:(id)a3 contentType:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7;
- (id)createPlaceholderWithName:(id)a3 isFolder:(BOOL)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7;
- (id)createPlaceholderWithName:(id)a3 typeIdentifier:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7;
- (id)itemWithPlaceholderID:(id)a3;
- (id)placeholdersCreationBlock;
- (void)associateItem:(id)a3 withPlaceholderID:(id)a4;
- (void)dealloc;
- (void)deleteItems:(id)a3;
- (void)finish;
- (void)finishWithItem:(id)a3 error:(id)a4;
- (void)finishWithItems:(id)a3 error:(id)a4;
- (void)flush;
- (void)replacePlaceholderWithID:(id)a3 withItem:(id)a4;
- (void)setPlaceholdersCreationBlock:(id)a3;
- (void)start;
- (void)transformItems:(id)a3 handler:(id)a4;
- (void)trashItems:(id)a3;
@end

@implementation FPStitchingSession

- (FPStitchingSession)init
{
  v17.receiver = self;
  v17.super_class = (Class)FPStitchingSession;
  v2 = [(FPStitchingSession *)&v17 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    originalItems = v2->_originalItems;
    v2->_originalItems = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    stitchedItems = v2->_stitchedItems;
    v2->_stitchedItems = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    stitchedPlaceholders = v2->_stitchedPlaceholders;
    v2->_stitchedPlaceholders = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    placeholderReplacements = v2->_placeholderReplacements;
    v2->_placeholderReplacements = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    deletedItems = v2->_deletedItems;
    v2->_deletedItems = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    stitchedFields = v2->_stitchedFields;
    v2->_stitchedFields = (NSMutableDictionary *)v13;

    v15 = +[FPStitchingManager sharedInstance];
    [v15 registerStitchingSession:v2];
  }
  return v2;
}

- (void)dealloc
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v0, v1, "[DEBUG] <%@:%p dealloc>", v2, v3, v4, v5, v6);
}

- (NSArray)placeholderItems
{
  uint64_t v3 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v3);
  uint64_t v4 = [(NSMutableDictionary *)self->_stitchedPlaceholders allValues];
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (NSArray)placeholderReplacementsIDs
{
  uint64_t v3 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v3);
  uint64_t v4 = [(NSMutableDictionary *)self->_placeholderReplacements allKeys];
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (BOOL)cleanStitchedItemForItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_stitchedItems objectForKeyedSubscript:v4];
  uint8_t v6 = v5;
  if (v5 && [v5 isTrashed])
  {
    [(NSMutableDictionary *)self->_stitchedItems removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_stitchedFields removeObjectForKey:v4];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSDictionary)stitchedFieldsAndItemsByItemIDs
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id obj = +[FPStitchingManager sharedInstance];
  objc_sync_enter(obj);
  uint64_t v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(NSMutableDictionary *)self->_stitchedFields allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = [(NSMutableDictionary *)self->_stitchedItems objectForKeyedSubscript:v8];
        uint64_t v10 = [(NSMutableDictionary *)self->_stitchedFields objectForKeyedSubscript:v8];
        uint64_t v11 = (void *)v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          v20[0] = @"FPStitchingSessionItemKey";
          v20[1] = @"FPStitchingSessionFields";
          v21[0] = v9;
          v21[1] = v10;
          uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
          [v3 setObject:v13 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }

  objc_sync_exit(obj);

  return (NSDictionary *)v3;
}

- (NSDictionary)stitchedItemsByParentID
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = (id)objc_opt_new();
  id obj = +[FPStitchingManager sharedInstance];
  objc_sync_enter(obj);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_stitchedFields allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_stitchedItems, "objectForKeyedSubscript:", v7, obj);
        uint64_t v9 = [(NSMutableDictionary *)self->_stitchedFields objectForKeyedSubscript:v7];
        uint64_t v10 = v9;
        if (v8) {
          BOOL v11 = v9 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11 && [v9 containsObject:@"parentItemIdentifier"])
        {
          BOOL v12 = [v8 parentItemID];
          uint64_t v13 = [v19 objectForKeyedSubscript:v12];
          v14 = v13;
          if (v13) {
            id v15 = v13;
          }
          else {
            id v15 = (id)objc_opt_new();
          }
          long long v16 = v15;

          [v16 addObject:v8];
          [v19 setObject:v16 forKeyedSubscript:v12];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  objc_sync_exit(obj);

  return (NSDictionary *)v19;
}

- (NSArray)deletedIDs
{
  uint64_t v3 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v3);
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableDictionary count](self->_deletedItems, "count"));
  deletedItems = self->_deletedItems;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__FPStitchingSession_deletedIDs__block_invoke;
  v8[3] = &unk_1E5AF4B88;
  id v6 = v4;
  id v9 = v6;
  [(NSMutableDictionary *)deletedItems enumerateKeysAndObjectsUsingBlock:v8];

  objc_sync_exit(v3);

  return (NSArray *)v6;
}

void __32__FPStitchingSession_deletedIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) addObject:v12];
  uint64_t v6 = [v5 formerItemID];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = [v5 formerItemID];
    char v9 = [v12 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      BOOL v11 = [v5 formerItemID];
      [v10 addObject:v11];
    }
  }
}

- (void)start
{
  id obj = +[FPStitchingManager sharedInstance];
  objc_sync_enter(obj);
  if (self->_started)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"FPStitchingSession.m" lineNumber:293 description:@"already started"];
  }
  self->_started = 1;
  objc_sync_exit(obj);
}

- (void)finish
{
  uint64_t v3 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v3);
  if (self->_started && !self->_finished)
  {
    [(NSMutableDictionary *)self->_originalItems removeAllObjects];
    id v5 = [(NSMutableDictionary *)self->_stitchedItems allKeys];
    [(NSMutableDictionary *)self->_stitchedItems removeAllObjects];
    [(NSMutableDictionary *)self->_stitchedPlaceholders removeAllObjects];
    [(NSMutableDictionary *)self->_placeholderReplacements removeAllObjects];
    [(NSMutableDictionary *)self->_deletedItems removeAllObjects];
    [(NSMutableDictionary *)self->_stitchedFields removeAllObjects];
    *(_WORD *)&self->_started = 256;
  }
  else
  {
    id v5 = 0;
  }
  objc_sync_exit(v3);

  uint64_t v4 = +[FPStitchingManager sharedInstance];
  [v4 removeBouncedItemsWithIDs:v5];
}

- (BOOL)isActive
{
  uint64_t v3 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v3);
  BOOL v4 = self->_started && !self->_finished;
  objc_sync_exit(v3);

  return v4;
}

- (void)flush
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v3);
  long long v16 = [(NSMutableDictionary *)self->_stitchedItems allValues];
  long long v17 = [(NSMutableDictionary *)self->_stitchedPlaceholders allValues];
  id v15 = [v16 arrayByAddingObjectsFromArray:v17];
  v14 = [(FPStitchingSession *)self deletedIDs];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v4 = [(NSMutableDictionary *)self->_stitchedItems allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        char v9 = [(NSMutableDictionary *)self->_originalItems objectForKeyedSubscript:v8];
        uint64_t v10 = [(NSMutableDictionary *)self->_stitchedItems objectForKeyedSubscript:v8];
        if (v10) {
          BOOL v11 = v9 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11)
        {
          id v12 = [v9 fieldDifferencesWithItem:v10];
          [(NSMutableDictionary *)self->_stitchedFields setObject:v12 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v13 = (void (**)(void, void))MEMORY[0x1A6248B00](self->_placeholdersCreationBlock);
  objc_sync_exit(v3);

  if (v13) {
    ((void (**)(void, void *))v13)[2](v13, v17);
  }
  +[FPItemCollection consumeUpdates:v15 deletes:v14];
}

- (void)transformItems:(id)a3 handler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v8)
  {
    uint64_t v27 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        BOOL v11 = (void *)[v10 copyAsPending];
        v7[2](v7, v11);
        id v12 = [v11 providerDomainID];
        uint64_t v13 = [v10 providerDomainID];
        char v14 = [v12 isEqualToString:v13];

        if ((v14 & 1) == 0)
        {
          id v15 = [v11 providerDomainID];
          long long v16 = [v10 providerDomainID];
          char v17 = [v15 isEqualToString:v16];

          if ((v17 & 1) == 0)
          {
            v24 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"FPStitchingSession.m", 368, @"stitch for item %@ changed provider identifier (new item is %@) in transform; this cannot work.",
              v10,
              v11);
          }
        }
        long long v18 = self;
        objc_sync_enter(v18);
        originalItems = self->_originalItems;
        long long v20 = [v10 itemID];
        [(NSMutableDictionary *)originalItems setObject:v10 forKeyedSubscript:v20];

        stitchedItems = self->_stitchedItems;
        long long v22 = [v11 itemID];
        [(NSMutableDictionary *)stitchedItems setObject:v11 forKeyedSubscript:v22];

        objc_sync_exit(v18);
        uint64_t v23 = fp_current_or_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v11;
          _os_log_debug_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] FPStitchingSession: stitched item %@", buf, 0xCu);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v8);
  }
}

- (void)deleteItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        originalItems = self->_originalItems;
        id v12 = objc_msgSend(v10, "itemID", (void)v15);
        [(NSMutableDictionary *)originalItems setObject:v10 forKeyedSubscript:v12];

        deletedItems = self->_deletedItems;
        char v14 = [v10 itemID];
        [(NSMutableDictionary *)deletedItems setObject:v10 forKeyedSubscript:v14];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)trashItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id obj = +[FPStitchingManager sharedInstance];
  objc_sync_enter(obj);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v18 = v4;
  uint64_t v5 = [v18 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v18);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        char v9 = objc_msgSend(v8, "providerDomainID", obj);
        uint64_t v10 = +[FPItem placeholderWithCopyOfExistingItem:v8 lastUsageUpdatePolicy:1 underParent:@"NSFileProviderTrashContainerItemIdentifier" inProviderDomainID:v9];

        originalItems = self->_originalItems;
        id v12 = [v8 itemID];
        [(NSMutableDictionary *)originalItems setObject:v8 forKeyedSubscript:v12];

        deletedItems = self->_deletedItems;
        char v14 = [v8 itemID];
        [(NSMutableDictionary *)deletedItems setObject:v8 forKeyedSubscript:v14];

        stitchedPlaceholders = self->_stitchedPlaceholders;
        long long v16 = [v10 itemID];
        [(NSMutableDictionary *)stitchedPlaceholders setObject:v10 forKeyedSubscript:v16];
      }
      uint64_t v5 = [v18 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  objc_sync_exit(obj);
}

- (void)finishWithItems:(id)a3 error:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v39 = a4;
  uint64_t v6 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v7);
        }
        BOOL v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v12 = [v11 itemID];
        [v6 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v8);
  }

  id obj = +[FPStitchingManager sharedInstance];
  objc_sync_enter(obj);
  if (v39)
  {
    uint64_t section = __fp_create_section();
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      char v14 = objc_msgSend(v39, "fp_prettyDescription");
      [(FPStitchingSession *)v14 finishWithItems:section error:v13];
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v15 = [(NSMutableDictionary *)self->_originalItems allValues];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(v15);
          }
          long long v19 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          long long v20 = [v19 itemID];
          long long v21 = [v6 objectForKeyedSubscript:v20];
          BOOL v22 = v21 == 0;

          if (v22)
          {
            uint64_t v23 = fp_current_or_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v19;
              _os_log_debug_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] reverting to %@", buf, 0xCu);
            }

            uint64_t v24 = [v19 itemID];
            [v6 setObject:v19 forKeyedSubscript:v24];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v16);
    }

    __fp_leave_section_Debug((uint64_t)&section);
  }
  v40 = objc_opt_new();
  if (!v39 && [v7 count])
  {
    uint64_t v25 = [v6 allKeys];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v26 = [(NSMutableDictionary *)self->_stitchedItems allValues];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v42 != v28) {
            objc_enumerationMutation(v26);
          }
          long long v30 = *(void **)(*((void *)&v41 + 1) + 8 * k);
          long long v31 = [v30 itemID];
          char v32 = [v25 containsObject:v31];

          if ((v32 & 1) == 0)
          {
            v33 = [v30 itemID];
            [v40 addObject:v33];
          }
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v27);
    }
  }
  v34 = [(NSMutableDictionary *)self->_stitchedPlaceholders allValues];
  uint64_t v35 = objc_msgSend(v34, "fp_itemIDs");

  [(FPStitchingSession *)self finish];
  objc_sync_exit(obj);

  v36 = [v6 allValues];
  +[FPItemCollection replacePlaceholders:v35 withActualItems:v36 deletedIDs:v40];
}

- (void)finishWithItem:(id)a3 error:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    id v9 = a3;
    id v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a3;
    a3 = [v7 arrayWithObjects:&v9 count:1];
  }
  -[FPStitchingSession finishWithItems:error:](self, "finishWithItems:error:", a3, v6, v9, v10);
}

- (void)associateItem:(id)a3 withPlaceholderID:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  [v6 setFormerIdentifier:v7];

  id v8 = +[FPStitchingManager sharedInstance];
  id v9 = [v6 itemID];
  LODWORD(self) = [v8 cleanStitchedForItemID:v9 ignoreSession:self];

  if (self)
  {
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[FPStitchingSession associateItem:withPlaceholderID:](v6, v10);
    }
  }
}

- (id)itemWithPlaceholderID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[FPStitchingManager sharedInstance];
    objc_sync_enter(v5);
    id v6 = [(NSMutableDictionary *)self->_stitchedPlaceholders objectForKeyedSubscript:v4];
    objc_sync_exit(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)replacePlaceholderWithID:(id)a3 withItem:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = +[FPStitchingManager sharedInstance];
    objc_sync_enter(v9);
    [(FPStitchingSession *)self associateItem:v8 withPlaceholderID:v6];
    uint64_t v10 = [v8 formerItemID];

    if (v10)
    {
      placeholderReplacements = self->_placeholderReplacements;
      id v12 = [v8 itemID];
      [(NSMutableDictionary *)placeholderReplacements setObject:v8 forKeyedSubscript:v12];

      uint64_t v13 = +[FPStitchingManager sharedInstance];
      v22[0] = v6;
      char v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [v13 removeBouncedItemsWithIDs:v14];

      stitchedPlaceholders = self->_stitchedPlaceholders;
      uint64_t v16 = [v8 formerItemID];
      [(NSMutableDictionary *)stitchedPlaceholders setObject:0 forKeyedSubscript:v16];
    }
    objc_sync_exit(v9);

    uint64_t v17 = [v8 formerItemID];
    long long v21 = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    long long v20 = v8;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    +[FPItemCollection replacePlaceholders:v18 withActualItems:v19 deletedIDs:MEMORY[0x1E4F1CBF0]];
  }
}

- (id)createPlaceholderWithCopyOfExistingItem:(id)a3 lastUsageUpdatePolicy:(unint64_t)a4 underParent:(id)a5 inProviderDomainID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[FPItem placeholderWithCopyOfExistingItem:v10 lastUsageUpdatePolicy:a4 underParent:v11 inProviderDomainID:v12];
  char v14 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v14);
  stitchedPlaceholders = self->_stitchedPlaceholders;
  uint64_t v16 = [v13 itemID];
  [(NSMutableDictionary *)stitchedPlaceholders setObject:v13 forKeyedSubscript:v16];

  objc_sync_exit(v14);
  uint64_t v17 = [v13 itemID];

  return v17;
}

- (id)createGenericArchivePlaceholderUnderParent:(id)a3 inProviderDomainID:(id)a4 withArchiveFormat:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[FPItem genericArchivePlaceholderUnderParent:v8 inProviderDomainID:v9 withArchiveFormat:a5];
  id v11 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v11);
  stitchedPlaceholders = self->_stitchedPlaceholders;
  uint64_t v13 = [v10 itemID];
  [(NSMutableDictionary *)stitchedPlaceholders setObject:v10 forKeyedSubscript:v13];

  objc_sync_exit(v11);
  char v14 = [v10 itemID];

  return v14;
}

- (id)createArchivePlaceholderForItem:(id)a3 underParent:(id)a4 inProviderDomainID:(id)a5 withArchiveFormat:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = +[FPItem archivePlaceholderForItem:v10 underParent:v11 inProviderDomainID:v12 withArchiveFormat:a6];
  char v14 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v14);
  stitchedPlaceholders = self->_stitchedPlaceholders;
  uint64_t v16 = [v13 itemID];
  [(NSMutableDictionary *)stitchedPlaceholders setObject:v13 forKeyedSubscript:v16];

  objc_sync_exit(v14);
  uint64_t v17 = [v13 itemID];

  return v17;
}

- (id)createPlaceholderWithName:(id)a3 isFolder:(BOOL)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  id v7 = (void *)MEMORY[0x1E4F443C8];
  if (!a4) {
    id v7 = (void *)MEMORY[0x1E4F44408];
  }
  return [(FPStitchingSession *)self createPlaceholderWithName:a3 contentType:*v7 contentAccessDate:a5 underParent:a6 inProviderDomainID:a7];
}

- (id)createPlaceholderWithName:(id)a3 typeIdentifier:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  id v12 = (void *)MEMORY[0x1E4F442D8];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  uint64_t v17 = objc_msgSend(v12, "fp_cachedTypeWithIdentifier:", a4);
  id v18 = [(FPStitchingSession *)self createPlaceholderWithName:v16 contentType:v17 contentAccessDate:v15 underParent:v14 inProviderDomainID:v13];

  return v18;
}

- (id)createPlaceholderWithName:(id)a3 contentType:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = +[FPItem placeholderWithName:v12 contentType:v13 contentAccessDate:v14 underParent:v15 inProviderDomainID:v16];
  id v18 = +[FPStitchingManager sharedInstance];
  objc_sync_enter(v18);
  stitchedPlaceholders = self->_stitchedPlaceholders;
  long long v20 = [v17 itemID];
  [(NSMutableDictionary *)stitchedPlaceholders setObject:v17 forKeyedSubscript:v20];

  objc_sync_exit(v18);
  long long v21 = [v17 itemID];

  return v21;
}

- (id)placeholdersCreationBlock
{
  return self->_placeholdersCreationBlock;
}

- (void)setPlaceholdersCreationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_placeholdersCreationBlock, 0);
  objc_storeStrong((id *)&self->_deletedItems, 0);
  objc_storeStrong((id *)&self->_placeholderReplacements, 0);
  objc_storeStrong((id *)&self->_stitchedPlaceholders, 0);
  objc_storeStrong((id *)&self->_stitchedItems, 0);
  objc_storeStrong((id *)&self->_originalItems, 0);

  objc_storeStrong((id *)&self->_stitchedFields, 0);
}

- (void)finishWithItems:(uint64_t)a3 error:(os_log_t)log .cold.1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx reverting items to their original state after failure: %@", buf, 0x16u);
}

- (void)associateItem:(void *)a1 withPlaceholderID:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 itemID];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Deleted item with same ID (%@) has been unstitched to allow creation", (uint8_t *)&v4, 0xCu);
}

@end