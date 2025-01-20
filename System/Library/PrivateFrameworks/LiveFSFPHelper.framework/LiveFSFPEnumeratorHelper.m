@interface LiveFSFPEnumeratorHelper
+ (id)newWithEnumeratedItem:(id)a3 extension:(id)a4 error:(id *)a5;
+ (void)applyParentUpdateAcrossEnumerators:(id)a3;
- (BOOL)addParent;
- (BOOL)hasPersistentIDs;
- (BOOL)isDir;
- (BOOL)isVolumeWide;
- (LiveFSFPEnumeratorDataContainer)dc;
- (LiveFSFPEnumeratorHelper)initWithEnumeratedItem:(id)a3 container:(id)a4 extension:(id)a5;
- (LiveFSFPItemHelper)enumeratedItem;
- (id)ensureConnectedForUpdates;
- (id)getDirContents;
- (id)getItemsFromTree:(id)a3 inRange:(_NSRange)a4 error:(id *)a5;
- (id)initForExtension:(id)a3 item:(id)a4;
- (int)state;
- (void)addInterestedItem:(id)a3 newName:(id)a4 forSelf:(BOOL)a5;
- (void)applyDelete:(id)a3 newTombstone:(id)a4 toSelf:(BOOL)a5;
- (void)currentSyncAnchorWithCompletionHandler:(id)a3;
- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4;
- (void)enumerateFileItemsForObserver:(id)a3 startingAtPage:(id)a4;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
- (void)invalidate;
- (void)reallyEnumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
- (void)resetHistory;
- (void)setAddParent:(BOOL)a3;
- (void)setState:(int)a3;
- (void)signalEnumeratedItemChanged;
- (void)synchronizedEnumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4;
@end

@implementation LiveFSFPEnumeratorHelper

- (id)initForExtension:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)LiveFSFPEnumeratorHelper;
  v9 = [(LiveFSFPEnumeratorHelper *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->ext, a3);
    objc_storeStrong((id *)&v10->_enumeratedItem, a4);
    v10->_state = 0;
    *(_WORD *)&v10->historyReset = 0;
    uint64_t v11 = objc_opt_new();
    updatedItems = v10->updatedItems;
    v10->updatedItems = (NSMutableSet *)v11;

    uint64_t v13 = objc_opt_new();
    deletedItems = v10->deletedItems;
    v10->deletedItems = (NSMutableSet *)v13;

    v10->_addParent = [(LiveFSFPExtensionHelper *)v10->ext fetchRoot];
  }

  return v10;
}

- (LiveFSFPEnumeratorHelper)initWithEnumeratedItem:(id)a3 container:(id)a4 extension:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(LiveFSFPEnumeratorHelper *)self initForExtension:a5 item:v8];
  if (v10)
  {
    uint64_t v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v8 path];
      uint64_t v13 = [v8 itemIdentifier];
      int v16 = 134218754;
      v17 = v10;
      __int16 v18 = 2112;
      v19 = v12;
      __int16 v20 = 2048;
      id v21 = v8;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_22CE49000, v11, OS_LOG_TYPE_DEFAULT, "enumerator helper[%p]: Creating enumerator for %@[%p] id %@", (uint8_t *)&v16, 0x2Au);
    }
    objc_storeStrong((id *)&v10->_dc, a4);
    v10->_hasPersistentIDs = [(LiveFSFPEnumeratorDataContainer *)v10->_dc hasPersistentIDs];
    v10->_isDir = [(LiveFSFPEnumeratorDataContainer *)v10->_dc isDir];
    v10->_isVolumeWide = [(LiveFSFPEnumeratorDataContainer *)v10->_dc isVolumeWide];
    if ([(LiveFSFPExtensionHelper *)v10->ext fetchRoot]) {
      char v14 = 1;
    }
    else {
      char v14 = [v9 addParent];
    }
    v10->_addParent = v14;
    [(LiveFSFPEnumeratorDataContainer *)v10->_dc addEnumerator:v10];
  }

  return v10;
}

+ (id)newWithEnumeratedItem:(id)a3 extension:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__3;
  v43 = __Block_byref_object_dispose__3;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  v10 = [v9 enumeratorHelperQueue];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __66__LiveFSFPEnumeratorHelper_newWithEnumeratedItem_extension_error___block_invoke;
  __int16 v20 = &unk_264934978;
  id v11 = v9;
  id v21 = v11;
  v23 = &v39;
  id v12 = v8;
  id v22 = v12;
  uint64_t v24 = &v33;
  v25 = &v27;
  v26 = a5;
  dispatch_sync(v10, &v17);

  uint64_t v13 = (void *)v28[5];
  if (v13)
  {
    char v14 = 0;
    if (a5) {
      *a5 = v13;
    }
  }
  else
  {
    id v15 = objc_alloc((Class)a1);
    char v14 = objc_msgSend(v15, "initWithEnumeratedItem:container:extension:", v34[5], v40[5], v11, v17, v18, v19, v20, v21);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v14;
}

void __66__LiveFSFPEnumeratorHelper_newWithEnumeratedItem_extension_error___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(a1 + 32) getEnumeratorForContainer:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  objc_sync_exit(v2);
  v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [v6 enumeratedItem];
    MEMORY[0x270F9A758]();
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) itemForIdentifier:*(void *)(a1 + 40) error:*(void *)(a1 + 72)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v10 && ([v10 ensureFileHandleOrError:*(void *)(a1 + 72)] & 1) == 0)
    {
      id v11 = *(id *)(a1 + 32);
      objc_sync_enter(v11);
      id v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) container];

      if (v12)
      {
        uint64_t v13 = livefs_std_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          __66__LiveFSFPEnumeratorHelper_newWithEnumeratedItem_extension_error___block_invoke_cold_1((uint64_t *)(a1 + 40), v13);
        }

        uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) container];
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
        int v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;
      }
      else
      {
        uint64_t v17 = [[LiveFSFPEnumeratorDataContainer alloc] initWithEnumeratedItem:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileHandle:*(void *)(a1 + 40) extension:*(void *)(a1 + 32)];
        uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
        v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;
      }
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v20)
      {
        [*(id *)(a1 + 32) addDirContainer:v20 forContainerID:*(void *)(a1 + 40)];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAddedToExtension:1];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setEnumeratedItemID:*(void *)(a1 + 40)];
        id v21 = livefs_std_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = *(void *)(a1 + 40);
          uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          int v26 = 138412546;
          uint64_t v27 = v23;
          __int16 v28 = 2112;
          uint64_t v29 = v22;
          _os_log_impl(&dword_22CE49000, v21, OS_LOG_TYPE_INFO, "Added new dc %@ id %@", (uint8_t *)&v26, 0x16u);
        }
      }
      else
      {
        uint64_t v24 = getNSErrorFromLiveFSErrno();
        uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
        id v21 = *(NSObject **)(v25 + 40);
        *(void *)(v25 + 40) = v24;
      }

      objc_sync_exit(v11);
    }
  }
}

- (void)invalidate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    enumeratedItem = self->_enumeratedItem;
    if (enumeratedItem)
    {
      v5 = [(LiveFSFPItemHelper *)self->_enumeratedItem filename];
    }
    else
    {
      v5 = @"<no_enumerated_item>";
    }
    int v7 = 136315394;
    uint64_t v8 = "-[LiveFSFPEnumeratorHelper invalidate]";
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_22CE49000, v3, OS_LOG_TYPE_DEFAULT, "%s: marking state as DEAD, name '%@'", (uint8_t *)&v7, 0x16u);
    if (enumeratedItem) {
  }
    }
  v6 = self;
  objc_sync_enter(v6);
  v6->_state = 3;
  [(LiveFSFPEnumeratorDataContainer *)v6->_dc dropEnumerator:v6];
  objc_sync_exit(v6);
}

- (id)ensureConnectedForUpdates
{
  return [(LiveFSFPEnumeratorDataContainer *)self->_dc ensureConnectedForUpdates];
}

- (id)getDirContents
{
  BOOL sortedByDate = self->_sortedByDate;
  dc = self->_dc;
  if (sortedByDate) {
    [(LiveFSFPEnumeratorDataContainer *)dc contentsSortedByDate];
  }
  else {
  uint64_t v4 = [(LiveFSFPEnumeratorDataContainer *)dc contentsSortedByName];
  }
  return v4;
}

- (id)getItemsFromTree:(id)a3 inRange:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  __int16 v9 = self->ext;
  objc_sync_enter(v9);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__LiveFSFPEnumeratorHelper_getItemsFromTree_inRange_error___block_invoke;
  v12[3] = &unk_2649349A0;
  v12[4] = self;
  v10 = objc_msgSend(v8, "extractItemsInRange:withBlock:", location, length, v12);
  objc_sync_exit(v9);

  return v10;
}

id __59__LiveFSFPEnumeratorHelper_getItemsFromTree_inRange_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 40);
  v5 = [NSString stringWithUTF8String:a2 + *(unsigned __int16 *)(a2 + 10)];
  v6 = [*(id *)(*(void *)(a1 + 32) + 8) getItemForParent:*(void *)(*(void *)(a1 + 32) + 56) name:v5];
  if (!v6)
  {
    int v7 = objc_opt_class();
    if (*(unsigned __int16 *)(a2 + 10) >= 0xB8u) {
      uint64_t v8 = 184;
    }
    else {
      uint64_t v8 = *(unsigned __int16 *)(a2 + 10);
    }
    __int16 v9 = [MEMORY[0x263EFF8F8] dataWithBytes:a2 + 16 length:v8];
    v6 = (void *)[v7 newItemForFH:0 withReference:0 name:v5 parent:*(void *)(*(void *)(a1 + 32) + 56) type:v4 attrs:v9 extension:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  [v6 prefetchXattrBasedValues];

  return v6;
}

- (void)enumerateFileItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int state = self->_state;
  if (state)
  {
    if (state == 3)
    {
      __int16 v9 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:89];
      v10 = livefs_std_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSFPEnumeratorHelper enumerateFileItemsForObserver:startingAtPage:]();
      }
LABEL_13:

      [v6 finishEnumeratingWithError:v9];
      goto LABEL_14;
    }
  }
  else
  {
    self->_int state = 2;
  }
  if (!self->_enumeratedItem)
  {
    dc = self->_dc;
    if (dc)
    {
      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = [(LiveFSFPEnumeratorDataContainer *)dc containerID];
      __int16 v9 = [v13 fileProviderErrorForNonExistentItemWithIdentifier:v14];
    }
    else
    {
      __int16 v9 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:2];
    }
    v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSFPEnumeratorHelper enumerateFileItemsForObserver:startingAtPage:]();
    }
    goto LABEL_13;
  }
  v15[0] = self->_enumeratedItem;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v6 didEnumerateItems:v11];

  [v6 finishEnumeratingUpToPage:0];
LABEL_14:
}

- (void)reallyEnumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  v36[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v30 = 0;
  uint64_t v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPEnumeratorHelper reallyEnumerateItemsForObserver:startingAtPage:]();
  }

  if (!self->_state)
  {
    uint64_t v14 = [(LiveFSFPEnumeratorDataContainer *)self->_dc ensureConnectedForUpdates];
    if (v14)
    {
      [v6 finishEnumeratingWithError:v14];

      goto LABEL_48;
    }
  }
  if (!self->_isDir)
  {
    [(LiveFSFPEnumeratorHelper *)self enumerateFileItemsForObserver:v6 startingAtPage:v7];
    goto LABEL_48;
  }
  __int16 v9 = self;
  objc_sync_enter(v9);
  int state = self->_state;
  if (state)
  {
    if (state == 3)
    {
      id v11 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:89];
      id v12 = livefs_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSFPEnumeratorHelper enumerateFileItemsForObserver:startingAtPage:]();
      }

      [v6 finishEnumeratingWithError:v11];
LABEL_10:
      uint64_t v13 = 0;
LABEL_47:
      objc_sync_exit(v9);

      goto LABEL_48;
    }
  }
  else if ([v7 isEqual:*MEMORY[0x263F053B0]])
  {
    self->_int state = 1;
  }
  else if ([v7 isEqual:*MEMORY[0x263F053A8]])
  {
    self->_int state = 1;
    v9->_BOOL sortedByDate = 1;
  }
  else if (!self->_state)
  {
    __int16 v28 = livefs_std_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSFPEnumeratorHelper reallyEnumerateItemsForObserver:startingAtPage:]();
    }

    self->_int state = 3;
    id v11 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    [v6 finishEnumeratingWithError:v11];
    goto LABEL_10;
  }
  uint64_t v13 = [(LiveFSFPEnumeratorHelper *)v9 getDirContents];
  if (!v13)
  {
    id v15 = [(LiveFSFPEnumeratorDataContainer *)v9->_dc loadContents];
    uint64_t v13 = [(LiveFSFPEnumeratorHelper *)v9 getDirContents];
  }
  int v16 = livefs_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    id v32 = v9;
    __int16 v33 = 2112;
    unint64_t v34 = (unint64_t)v13;
    __int16 v35 = 2048;
    v36[0] = [v13 count];
    _os_log_debug_impl(&dword_22CE49000, v16, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: dirContent: %@, count: %lu", buf, 0x20u);
  }

  if (([v7 isEqual:*MEMORY[0x263F053B0]] & 1) != 0
    || [v7 isEqual:*MEMORY[0x263F053A8]])
  {
    LODWORD(v17) = 0;
    int v30 = 0;
  }
  else if ([v7 length] != 4 {
         || (unint64_t v17 = *(unsigned int *)[v7 bytes], v30 = v17, (v17 & 0x3F) != 0)
  }
         || [v13 count] <= v17)
  {
    id v11 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    [v6 finishEnumeratingWithError:v11];
    goto LABEL_47;
  }
  unint64_t v18 = [v13 count];
  unint64_t v19 = (v17 + 64);
  if (v18 <= v19) {
    uint64_t v20 = [v13 count] - v17;
  }
  else {
    uint64_t v20 = 64;
  }
  id v21 = livefs_std_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    id v32 = v9;
    __int16 v33 = 2048;
    unint64_t v34 = v17;
    __int16 v35 = 2048;
    v36[0] = v20;
    _os_log_debug_impl(&dword_22CE49000, v21, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: range: %lu -> %lu", buf, 0x20u);
  }

  id v29 = 0;
  uint64_t v22 = -[LiveFSFPEnumeratorHelper getItemsFromTree:inRange:error:](v9, "getItemsFromTree:inRange:error:", v13, v17, v20, &v29);
  id v11 = v29;
  if (!v22)
  {
    [v6 finishEnumeratingWithError:v11];
    goto LABEL_47;
  }
  if ([(LiveFSFPEnumeratorDataContainer *)v9->_dc addParent])
  {
    uint64_t v23 = [MEMORY[0x263EFF980] arrayWithArray:v22];
    [v23 addObject:v9->_enumeratedItem];
    id v24 = v23;

    [(LiveFSFPEnumeratorDataContainer *)v9->_dc setAddParent:0];
  }
  else
  {
    id v24 = v22;
  }
  [v6 didEnumerateItems:v24];
  if (v18 <= v19)
  {
    [v6 finishEnumeratingUpToPage:0];
    int v26 = 1;
  }
  else
  {
    int v30 = v19;
    uint64_t v25 = [MEMORY[0x263EFF8F8] dataWithBytes:&v30 length:4];
    [v6 finishEnumeratingUpToPage:v25];

    int v26 = 0;
  }
  objc_sync_exit(v9);

  uint64_t v27 = livefs_std_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218754;
    id v32 = v9;
    __int16 v33 = 2080;
    unint64_t v34 = (unint64_t)"-[LiveFSFPEnumeratorHelper reallyEnumerateItemsForObserver:startingAtPage:]";
    __int16 v35 = 1024;
    LODWORD(v36[0]) = v30;
    WORD2(v36[0]) = 1024;
    *(_DWORD *)((char *)v36 + 6) = v26;
    _os_log_impl(&dword_22CE49000, v27, OS_LOG_TYPE_INFO, "enumerator helper[%p]: %s ending, start: %d, lastPage: %d", buf, 0x22u);
  }

LABEL_48:
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v16 = "-[LiveFSFPEnumeratorHelper enumerateItemsForObserver:startingAtPage:]";
    __int16 v17 = 2048;
    unint64_t v18 = self;
    _os_log_impl(&dword_22CE49000, v8, OS_LOG_TYPE_INFO, "%s: starting on %p", buf, 0x16u);
  }

  dc = self->_dc;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__LiveFSFPEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke;
  v12[3] = &unk_264934220;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(LiveFSFPEnumeratorDataContainer *)dc dispatchOntoUpdateQueue:v12];
}

uint64_t __69__LiveFSFPEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reallyEnumerateItemsForObserver:*(void *)(a1 + 40) startingAtPage:*(void *)(a1 + 48)];
}

- (void)currentSyncAnchorWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPEnumeratorHelper currentSyncAnchorWithCompletionHandler:]((uint64_t)self, v5);
  }

  id v6 = self;
  objc_sync_enter(v6);
  if (v6->_state == 3)
  {
    v4[2](v4, 0);
  }
  else
  {
    id v7 = currentAnchor();
    ((void (**)(id, void *))v4)[2](v4, v7);
  }
  objc_sync_exit(v6);
}

- (void)synchronizedEnumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPEnumeratorHelper synchronizedEnumerateChangesForObserver:fromSyncAnchor:]((uint64_t)self, v8);
  }

  __int16 v9 = objc_opt_new();
  id v10 = self;
  objc_sync_enter(v10);
  if ((*((unsigned char *)v10 + 40) & 2) != 0)
  {
    if ([(NSMutableSet *)v10->deletedItems count])
    {
      id v12 = [(NSMutableSet *)v10->deletedItems allObjects];
    }
    else
    {
      id v12 = &unk_26E04CB60;
    }
    unint64_t v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = [v12 objectAtIndexedSubscript:0];
    id v11 = [v18 fileProviderErrorForNonExistentItemWithIdentifier:v19];

    [v6 finishEnumeratingWithError:v11];
    goto LABEL_18;
  }
  if (v10->historyReset)
  {
    v10->historyReset = 0;
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F05370] code:-1002 userInfo:0];
    [v6 finishEnumeratingWithError:v11];
    id v12 = 0;
LABEL_18:

LABEL_19:
    objc_sync_exit(v10);
    goto LABEL_20;
  }
  if (![(NSMutableSet *)v10->deletedItems count]
    && ![(NSMutableSet *)v10->updatedItems count]
    && (*((unsigned char *)v10 + 40) & 1) == 0
    && !v10->_addParent)
  {
    int v30 = livefs_std_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22CE49000, v30, OS_LOG_TYPE_DEFAULT, "exiting after seeing 0 changes", buf, 2u);
    }

    [v6 finishEnumeratingChangesUpToSyncAnchor:v7 moreComing:0];
    id v12 = 0;
    goto LABEL_19;
  }
  id v13 = livefs_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    deletedItems = v10->deletedItems;
    updatedItems = v10->updatedItems;
    int v16 = -(*((unsigned char *)v10 + 40) & 1);
    *(_DWORD *)buf = 138412802;
    v40 = (const char *)updatedItems;
    __int16 v41 = 2112;
    v42 = (char *)deletedItems;
    __int16 v43 = 1024;
    LODWORD(v44) = v16;
    _os_log_impl(&dword_22CE49000, v13, OS_LOG_TYPE_DEFAULT, "updateds: %@ deleteds %@ self upd %u", buf, 0x1Cu);
  }

  if ([(NSMutableSet *)v10->updatedItems count])
  {
    __int16 v17 = [(NSMutableSet *)v10->updatedItems allObjects];
  }
  else
  {
    __int16 v17 = (char *)MEMORY[0x263EFFA68];
  }
  if ([(NSMutableSet *)v10->deletedItems count])
  {
    uint64_t v20 = [(NSMutableSet *)v10->deletedItems allObjects];
  }
  else
  {
    uint64_t v20 = (char *)MEMORY[0x263EFFA68];
  }
  v31 = currentAnchor();
  [(NSMutableSet *)v10->updatedItems removeAllObjects];
  [(NSMutableSet *)v10->deletedItems removeAllObjects];
  if (*((unsigned char *)v10 + 40))
  {
    *((unsigned char *)v10 + 40) &= ~1u;
    [v9 addObject:v10->_enumeratedItem];
  }
  if (v10->_addParent) {
    [v9 addObject:v10->_enumeratedItem];
  }
  objc_sync_exit(v10);

  id v21 = livefs_std_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v40 = v17;
    __int16 v41 = 2112;
    v42 = v20;
    _os_log_impl(&dword_22CE49000, v21, OS_LOG_TYPE_DEFAULT, "About to walk %@ and %@", buf, 0x16u);
  }

  if (v10->_isDir)
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke;
    v37[3] = &unk_2649349C8;
    v37[4] = v10;
    id v38 = v9;
    [v17 enumerateObjectsUsingBlock:v37];
    if ([v20 count])
    {
      uint64_t v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count"));
      BOOL hasPersistentIDs = v10->_hasPersistentIDs;
      id v24 = v10->_enumeratedItem;
      uint64_t v25 = [(LiveFSFPItemHelper *)v10->_enumeratedItem itemIdentifier];
      char v26 = [v25 isEqualToString:*MEMORY[0x263F053F0]];

      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke_150;
      v32[3] = &unk_2649349F0;
      BOOL v35 = hasPersistentIDs;
      __int16 v33 = v24;
      char v36 = v26;
      id v27 = v22;
      id v34 = v27;
      __int16 v28 = v24;
      [v20 enumerateObjectsUsingBlock:v32];
      id v12 = v27;
    }
    else
    {
      id v12 = v20;
    }
  }
  else
  {
    id v12 = v20;
  }
  id v29 = livefs_std_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v40 = "-[LiveFSFPEnumeratorHelper synchronizedEnumerateChangesForObserver:fromSyncAnchor:]";
    __int16 v41 = 2112;
    v42 = v17;
    __int16 v43 = 2112;
    id v44 = v12;
    __int16 v45 = 2112;
    v46 = v9;
    _os_log_impl(&dword_22CE49000, v29, OS_LOG_TYPE_DEFAULT, "%s: exiting with updateIDs %@, tombstones %@, newItems %@", buf, 0x2Au);
  }

  [v6 didDeleteItemsWithIdentifiers:v12];
  [v6 didUpdateItems:v9];
  [v6 finishEnumeratingChangesUpToSyncAnchor:v31 moreComing:0];

  id v10 = (LiveFSFPEnumeratorHelper *)v17;
LABEL_20:
}

void __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1 + 32;
  v5 = [*(id *)(*(void *)(a1 + 32) + 8) itemAtPath:v3 parent:*(void *)(*(void *)(a1 + 32) + 56)];
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
  else
  {
    id v6 = livefs_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke_cold_1((uint64_t)v3, v4, v6);
    }
  }
}

void __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke_150(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x263F52288], "identifierForItem:name:parentID:", 0, v3, objc_msgSend(*(id *)(a1 + 32), "inodeNum"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 49))
  {
    id v4 = v3;
    goto LABEL_5;
  }
  id v6 = [*(id *)(a1 + 32) itemIdentifier];
  v5 = [v6 stringByAppendingPathComponent:v7];

LABEL_6:
  [*(id *)(a1 + 40) addObject:v5];
}

- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v16 = "-[LiveFSFPEnumeratorHelper enumerateChangesForObserver:fromSyncAnchor:]";
    __int16 v17 = 2048;
    unint64_t v18 = self;
    _os_log_impl(&dword_22CE49000, v8, OS_LOG_TYPE_DEFAULT, "%s: starting on %p", buf, 0x16u);
  }

  ext = self->ext;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__LiveFSFPEnumeratorHelper_enumerateChangesForObserver_fromSyncAnchor___block_invoke;
  v12[3] = &unk_264934220;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(LiveFSFPExtensionHelper *)ext dispatchOntoRenameQueue:v12];
}

uint64_t __71__LiveFSFPEnumeratorHelper_enumerateChangesForObserver_fromSyncAnchor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) synchronizedEnumerateChangesForObserver:*(void *)(a1 + 40) fromSyncAnchor:*(void *)(a1 + 48)];
}

- (void)addInterestedItem:(id)a3 newName:(id)a4 forSelf:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  __int16 v9 = self;
  objc_sync_enter(v9);
  if (v5)
  {
    *((unsigned char *)v9 + 40) |= 1u;
  }
  else
  {
    [(NSMutableSet *)v9->deletedItems removeObject:v10];
    [(NSMutableSet *)v9->updatedItems addObject:v8];
  }
  objc_sync_exit(v9);
}

- (void)applyDelete:(id)a3 newTombstone:(id)a4 toSelf:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  objc_sync_enter(v10);
  if (v5)
  {
    *((unsigned char *)v10 + 40) |= 2u;
    [(NSMutableSet *)v10->updatedItems removeAllObjects];
    p_deletedItems = (id *)&v10->deletedItems;
    [(NSMutableSet *)v10->deletedItems removeAllObjects];
LABEL_6:
    [*p_deletedItems addObject:v9];
    goto LABEL_10;
  }
  updatedItems = v10->updatedItems;
  if (updatedItems)
  {
    p_deletedItems = (id *)&v10->deletedItems;
    if (v10->deletedItems)
    {
      [(NSMutableSet *)updatedItems removeObject:v8];
      goto LABEL_6;
    }
  }
  id v13 = livefs_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[LiveFSFPEnumeratorHelper applyDelete:newTombstone:toSelf:]((uint64_t *)&v10->updatedItems);
  }

LABEL_10:
  objc_sync_exit(v10);
}

- (void)resetHistory
{
  obj = self;
  objc_sync_enter(obj);
  obj->historyReset = 1;
  objc_sync_exit(obj);
}

- (void)signalEnumeratedItemChanged
{
}

+ (void)applyParentUpdateAcrossEnumerators:(id)a3
{
  id v3 = a3;
  [v3 applyParentUpdateAcrossEnumerators];
  [v3 handleEnumeratedItemChanged];
}

- (BOOL)hasPersistentIDs
{
  return self->_hasPersistentIDs;
}

- (BOOL)addParent
{
  return self->_addParent;
}

- (void)setAddParent:(BOOL)a3
{
  self->_addParent = a3;
}

- (BOOL)isDir
{
  return self->_isDir;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_int state = a3;
}

- (BOOL)isVolumeWide
{
  return self->_isVolumeWide;
}

- (LiveFSFPItemHelper)enumeratedItem
{
  return self->_enumeratedItem;
}

- (LiveFSFPEnumeratorDataContainer)dc
{
  return (LiveFSFPEnumeratorDataContainer *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dc, 0);
  objc_storeStrong((id *)&self->_enumeratedItem, 0);
  objc_storeStrong((id *)&self->updatedItems, 0);
  objc_storeStrong((id *)&self->deletedItems, 0);
  objc_storeStrong((id *)&self->ext, 0);
}

void __66__LiveFSFPEnumeratorHelper_newWithEnumeratedItem_extension_error___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_22CE49000, a2, OS_LOG_TYPE_FAULT, "Found an item with a dc which isn't indexed for it. item %@", (uint8_t *)&v3, 0xCu);
}

- (void)enumerateFileItemsForObserver:startingAtPage:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_22CE49000, v1, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: returning %@", v2, 0x16u);
}

- (void)enumerateFileItemsForObserver:startingAtPage:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_22CE49000, v0, v1, "enumerator helper[%p]: returning ECANCELED", v2, v3, v4, v5, v6);
}

- (void)reallyEnumerateItemsForObserver:startingAtPage:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_22CE49000, v0, v1, "enumerator helper[%p]: no sorting order provided, returning EINVAL", v2, v3, v4, v5, v6);
}

- (void)reallyEnumerateItemsForObserver:startingAtPage:.cold.3()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2080;
  uint64_t v4 = "-[LiveFSFPEnumeratorHelper reallyEnumerateItemsForObserver:startingAtPage:]";
  __int16 v5 = 1024;
  int v6 = v0;
  _os_log_debug_impl(&dword_22CE49000, v1, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: %s starting, state %d", v2, 0x1Cu);
}

- (void)currentSyncAnchorWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 48);
  int v3 = 136315394;
  uint64_t v4 = "-[LiveFSFPEnumeratorHelper currentSyncAnchorWithCompletionHandler:]";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_debug_impl(&dword_22CE49000, a2, OS_LOG_TYPE_DEBUG, "%s: starting state %d", (uint8_t *)&v3, 0x12u);
}

- (void)synchronizedEnumerateChangesForObserver:(uint64_t)a1 fromSyncAnchor:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 48);
  int v3 = *(unsigned __int8 *)(a1 + 40) << 30 >> 31;
  int v4 = 136315650;
  __int16 v5 = "-[LiveFSFPEnumeratorHelper synchronizedEnumerateChangesForObserver:fromSyncAnchor:]";
  __int16 v6 = 1024;
  int v7 = v2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_debug_impl(&dword_22CE49000, a2, OS_LOG_TYPE_DEBUG, "%s: starting state %d deleted %u", (uint8_t *)&v4, 0x18u);
}

void __83__LiveFSFPEnumeratorHelper_synchronizedEnumerateChangesForObserver_fromSyncAnchor___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  __int16 v5 = [*(id *)(*(void *)a2 + 56) filename];
  int v7 = 138412546;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_3_1();
  uint64_t v9 = v6;
  _os_log_error_impl(&dword_22CE49000, a3, OS_LOG_TYPE_ERROR, "Error finding item %@ in enumerator %@", (uint8_t *)&v7, 0x16u);
}

- (void)applyDelete:(uint64_t *)a1 newTombstone:toSelf:.cold.1(uint64_t *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_3_1();
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_22CE49000, v3, OS_LOG_TYPE_ERROR, "bad updateds: %@ deleteds %@", (uint8_t *)&v4, 0x16u);
}

@end