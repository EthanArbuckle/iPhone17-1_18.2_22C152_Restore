@interface FPExtensionDataSource
+ (int64_t)suggestedBatchSize;
+ (int64_t)suggestedPageSize;
+ (void)setSuggestedBatchSize:(int64_t)a3;
+ (void)setSuggestedPageSize:(int64_t)a3;
- (BOOL)hasMoreIncoming;
- (FPCollectionDataSourceDelegate)delegate;
- (FPExtensionDataSource)initWithEnumerationSettings:(id)a3;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)_initialPageFromSortDescriptors:(id)a3;
- (void)_gatherInitialItems;
- (void)_gatherMoreItemsAfterPage:(id)a3 section:(unint64_t)a4;
- (void)_invalidate;
- (void)_invalidateWithError:(id)a3;
- (void)_updateItems;
- (void)_updateItemsWithUpdatesCount:(unint64_t)a3 section:(unint64_t)a4;
- (void)didUpdateItem:(id)a3;
- (void)enumerationResultsDidChange;
- (void)invalidate;
- (void)invalidateWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation FPExtensionDataSource

+ (void)setSuggestedPageSize:(int64_t)a3
{
  _FPExtensionDataSourcePageSize = a3;
}

+ (int64_t)suggestedPageSize
{
  return _FPExtensionDataSourcePageSize;
}

+ (void)setSuggestedBatchSize:(int64_t)a3
{
  _FPExtensionDataSourceBatchSize = a3;
}

+ (int64_t)suggestedBatchSize
{
  return _FPExtensionDataSourceBatchSize;
}

- (FPExtensionDataSource)initWithEnumerationSettings:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPExtensionDataSource;
  v6 = [(FPExtensionDataSource *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_enumerationSettings, a3);
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.FileProvider.ExtensionDataSource.queue (%p)", v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    v9 = (const char *)[v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = FPDataSourceBaseQueue();
    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2(v9, v10, v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;
  }
  return v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FPExtensionEnumerationSettings *)self->_enumerationSettings enumeratedItemID];
  v6 = [v3 stringWithFormat:@"<%@:%p id:%@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)start
{
  if (self->_started)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"FPExtensionDataSource.m" lineNumber:95 description:@"can't start twice"];
  }
  if (self->_invalidated)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"FPExtensionDataSource.m" lineNumber:96 description:@"can't restart"];
  }
  v6 = self->_enumerationSettings;
  v7 = [(FPExtensionEnumerationSettings *)v6 enumeratedItemID];
  id v8 = [v7 providerDomainID];

  self->_hasMoreIncoming = 1;
  v9 = (NSMutableDictionary *)objc_opt_new();
  oobBuffer = self->_oobBuffer;
  self->_oobBuffer = v9;

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __30__FPExtensionDataSource_start__block_invoke;
  v17[3] = &unk_1E5AF4A10;
  v17[4] = self;
  v17[5] = a2;
  v11 = (void *)MEMORY[0x1A6248B00](v17);
  dispatch_queue_t v12 = +[FPDaemonConnection sharedConnection];
  enumerationSettings = self->_enumerationSettings;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __30__FPExtensionDataSource_start__block_invoke_5;
  v15[3] = &unk_1E5AF4A38;
  id v16 = v11;
  id v14 = v11;
  [v12 fetchAndStartEnumeratingWithSettings:enumerationSettings observer:self completionHandler:v15];
}

void __30__FPExtensionDataSource_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__FPExtensionDataSource_start__block_invoke_2;
  block[3] = &unk_1E5AF49E8;
  uint64_t v12 = *(void *)(a1 + 40);
  id v19 = v8;
  uint64_t v20 = v12;
  block[4] = v10;
  id v17 = v7;
  id v18 = v9;
  id v13 = v8;
  id v14 = v9;
  id v15 = v7;
  dispatch_sync(v11, block);
}

void __30__FPExtensionDataSource_start__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 25))
  {
    if (*(unsigned char *)(v1 + 24))
    {
      v3 = [MEMORY[0x1E4F28B00] currentHandler];
      [v3 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"FPExtensionDataSource.m" lineNumber:113 description:@"can't start twice"];

      uint64_t v1 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v1 + 25))
      {
        uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"FPExtensionDataSource.m" lineNumber:114 description:@"can't restart"];

        uint64_t v1 = *(void *)(a1 + 32);
      }
    }
    *(unsigned char *)(v1 + 24) = 1;
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v5);
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 56));
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __30__FPExtensionDataSource_start__block_invoke_3;
      v12[3] = &unk_1E5AF1240;
      v6 = *(void **)(a1 + 40);
      v12[4] = *(void *)(a1 + 32);
      id v7 = [v6 remoteObjectProxyWithErrorHandler:v12];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __30__FPExtensionDataSource_start__block_invoke_4;
      v11[3] = &unk_1E5AF0FF0;
      v11[4] = *(void *)(a1 + 32);
      [v7 keepAliveConnectionForRegisteredObserver:v11];

      [*(id *)(a1 + 32) _gatherInitialItems];
    }
    else
    {
      id v8 = *(void **)(a1 + 48);
      if (v8)
      {
        id v9 = v8;
      }
      else
      {
        id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
      }
      id v10 = v9;
      [*(id *)(a1 + 32) invalidateWithError:v9];
    }
  }
}

uint64_t __30__FPExtensionDataSource_start__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invalidateWithError:a2];
}

void __30__FPExtensionDataSource_start__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:-1002 userInfo:0];
  [v1 invalidateWithError:v2];
}

uint64_t __30__FPExtensionDataSource_start__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__FPExtensionDataSource_invalidateWithError___block_invoke;
  v7[3] = &unk_1E5AF0748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __45__FPExtensionDataSource_invalidateWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithError:*(void *)(a1 + 40)];
}

- (void)_invalidateWithError:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  self->_hasMoreIncoming = 0;
  self->_enumeratingExtensionResults = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dataSource:self wasInvalidatedWithError:v5];

  [(FPExtensionDataSource *)self _invalidate];
}

- (void)_invalidate
{
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__FPExtensionDataSource_invalidate__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__FPExtensionDataSource_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)enumerationResultsDidChange
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v1 + 24);
  int v4 = *(unsigned __int8 *)(v1 + 25);
  if (!v3)
  {
    if (!v4)
    {
      id v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_1();
      }
      goto LABEL_9;
    }
LABEL_7:
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_2();
    }
LABEL_9:

    return;
  }
  if (v4) {
    goto LABEL_7;
  }
  if (+[FPItemCollection isEnumerationSuspended])
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_3();
    }
LABEL_15:

    *(unsigned char *)(*(void *)v2 + 26) = 1;
    return;
  }
  int v7 = *(unsigned __int8 *)(*(void *)v2 + 27);
  id v5 = fp_current_or_default_log();
  BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v8) {
      __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_5();
    }
    goto LABEL_15;
  }
  if (v8) {
    __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_4();
  }

  id v9 = *(void **)v2;
  if (*(void *)(*(void *)v2 + 40)) {
    [v9 _updateItems];
  }
  else {
    [v9 _gatherInitialItems];
  }
}

- (void)didUpdateItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__FPExtensionDataSource_didUpdateItem___block_invoke;
    v7[3] = &unk_1E5AF0748;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

void __39__FPExtensionDataSource_didUpdateItem___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [WeakRetained dataSource:v3 receivedUpdatedItems:v4 deletedItems:MEMORY[0x1E4F1CBF0] hasMoreChanges:*(unsigned __int8 *)(*(void *)(a1 + 32) + 72)];
}

- (void)_updateItems
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 134218242;
  uint64_t v5 = a2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx fetching changes from token: %@", (uint8_t *)&v4, 0x16u);
}

- (id)_initialPageFromSortDescriptors:(id)a3
{
  id v3 = a3;
  if (![v3 count]) {
    goto LABEL_6;
  }
  int v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 key];
  __int16 v6 = NSStringFromSelector(sel_displayName);
  if (([v5 isEqualToString:v6] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v7 = [v3 objectAtIndexedSubscript:0];
  char v8 = [v7 ascending];

  if ((v8 & 1) == 0)
  {
LABEL_6:
    id v9 = (id *)&NSFileProviderInitialPageSortedByDate;
    goto LABEL_7;
  }
  id v9 = (id *)&NSFileProviderInitialPageSortedByName;
LABEL_7:
  id v10 = *v9;

  return v10;
}

- (void)_gatherInitialItems
{
}

- (BOOL)hasMoreIncoming
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __40__FPExtensionDataSource_hasMoreIncoming__block_invoke;
  v5[3] = &unk_1E5AF2168;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__FPExtensionDataSource_hasMoreIncoming__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 72);
  return result;
}

- (void)_updateItemsWithUpdatesCount:(unint64_t)a3 section:(unint64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_enumeratingExtensionResults)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"FPExtensionDataSource.m" lineNumber:295 description:@"update: already enumerating changes or items"];
  }
  if (+[FPItemCollection isEnumerationSuspended])
  {
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[FPExtensionDataSource _updateItemsWithUpdatesCount:section:]();
    }

    self->_shouldUpdate = 1;
  }
  else if (self->_changeToken)
  {
    *(_WORD *)&self->_shouldUpdate = 256;
    char v9 = self->_enumerator;
    id v10 = [(FPExtensionDataSource *)self delegate];
    uint64_t v11 = [v10 lastForcedUpdate];

    changeToken = self->_changeToken;
    uint64_t v13 = _FPExtensionDataSourceBatchSize;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke;
    v15[3] = &unk_1E5AF4A88;
    void v15[4] = self;
    id v16 = v9;
    unint64_t v17 = a4;
    uint64_t v18 = v11;
    id v14 = v9;
    [(FPXEnumerator *)v14 enumerateChangesFromToken:changeToken suggestedBatchSize:v13 reply:v15];
  }
  else
  {
    [(FPExtensionDataSource *)self _gatherInitialItems];
  }
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5, uint64_t a6, void *a7)
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = *(void *)(a1 + 32);
  unint64_t v17 = *(NSObject **)(v16 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2;
  block[3] = &unk_1E5AF4A60;
  block[4] = v16;
  id v23 = *(id *)(a1 + 40);
  id v24 = v12;
  char v29 = a4;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  long long v28 = *(_OWORD *)(a1 + 48);
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_async(v17, block);
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 16) == *(void *)(a1 + 40))
  {
    *(unsigned char *)(v1 + 27) = 0;
    uint64_t v69 = *(void *)(a1 + 80);
    char v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_4();
    }

    int v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v44 = [*(id *)(a1 + 48) count];
      uint64_t v45 = [*(id *)(a1 + 56) count];
      int v46 = *(unsigned __int8 *)(a1 + 96);
      uint64_t v47 = *(void *)(a1 + 64);
      uint64_t v48 = objc_msgSend(*(id *)(a1 + 72), "fp_prettyDescription");
      v49 = (void *)v48;
      v50 = " (more coming)";
      *(_DWORD *)buf = 134219010;
      *(void *)v74 = v44;
      *(_WORD *)&v74[8] = 2048;
      if (!v46) {
        v50 = "";
      }
      uint64_t v75 = v45;
      __int16 v76 = 2080;
      v77 = v50;
      __int16 v78 = 2112;
      uint64_t v79 = v47;
      __int16 v80 = 2112;
      uint64_t v81 = v48;
      _os_log_debug_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] updates: %lld, deletion: %lld%s, changeToken: %@, error: %@\n", buf, 0x34u);
    }
    uint64_t v5 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 72))
    {
      objc_msgSend(v5, "_invalidateWithError:");
LABEL_66:
      __fp_leave_section_Debug((uint64_t)&v69);
      return;
    }
    uint64_t v6 = [v5 delegate];
    uint64_t v55 = [v6 lastForcedUpdate];
    uint64_t v54 = *(void *)(a1 + 88);

    if (v55 != v54)
    {
      uint64_t v7 = fp_current_or_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_3();
      }
    }
    if (*(unsigned char *)(a1 + 96)) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v55 == v54;
    }
    char v9 = !v8;
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = v9;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 64));
    if (!*(void *)(a1 + 64) && !*(void *)(a1 + 72))
    {
      v51 = fp_current_or_default_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
        __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_1();
      }

      [*(id *)(a1 + 32) _gatherInitialItems];
      goto LABEL_66;
    }
    if (v55 == v54 && ![*(id *)(*(void *)(a1 + 32) + 64) count]) {
      goto LABEL_69;
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v66 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          id v15 = *(void **)(*(void *)(a1 + 32) + 64);
          uint64_t v16 = [v14 itemID];
          [v15 setObject:v14 forKeyedSubscript:v16];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v65 objects:v72 count:16];
      }
      while (v11);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v17 = *(id *)(a1 + 56);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v62 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v61 + 1) + 8 * j);
          v22 = [MEMORY[0x1E4F1CA98] null];
          [*(id *)(*(void *)(a1 + 32) + 64) setObject:v22 forKeyedSubscript:v21];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v61 objects:v71 count:16];
      }
      while (v18);
    }

    if (v55 == v54)
    {
LABEL_69:
      if ([*(id *)(*(void *)(a1 + 32) + 64) count])
      {
        id v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_2();
        }

        v56 = objc_opt_new();
        id v25 = objc_opt_new();
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v26 = *(id *)(*(void *)(a1 + 32) + 64);
        uint64_t v27 = [v26 countByEnumeratingWithState:&v57 objects:v70 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v58;
          do
          {
            for (uint64_t k = 0; k != v27; ++k)
            {
              if (*(void *)v58 != v28) {
                objc_enumerationMutation(v26);
              }
              uint64_t v30 = *(void *)(*((void *)&v57 + 1) + 8 * k);
              v31 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v30];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                v33 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v30];
                [v56 addObject:v33];
              }
              else
              {
                [v25 addObject:v30];
              }
            }
            uint64_t v27 = [v26 countByEnumeratingWithState:&v57 objects:v70 count:16];
          }
          while (v27);
        }

        uint64_t v34 = objc_opt_new();
        uint64_t v35 = *(void *)(a1 + 32);
        v36 = *(void **)(v35 + 64);
        *(void *)(v35 + 64) = v34;

        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
        [WeakRetained dataSource:*(void *)(a1 + 32) receivedUpdatedItems:v56 deletedItems:v25 hasMoreChanges:0];

        uint64_t v38 = [v56 count];
        uint64_t v39 = [v25 count];

        uint64_t v40 = v39 + v38;
      }
      else
      {
        id v41 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
        [v41 dataSource:*(void *)(a1 + 32) receivedUpdatedItems:*(void *)(a1 + 48) deletedItems:*(void *)(a1 + 56) hasMoreChanges:0];

        uint64_t v42 = [*(id *)(a1 + 48) count];
        uint64_t v40 = [*(id *)(a1 + 56) count] + v42;
      }
      if (!*(unsigned char *)(a1 + 96) && v55 == v54 && !*(unsigned char *)(*(void *)(a1 + 32) + 26)) {
        goto LABEL_66;
      }
      uint64_t v23 = v40 + 1;
      if ((unint64_t)(v40 + 1) >= 0x3E9)
      {
        [*(id *)(a1 + 32) _gatherInitialItems];
        goto LABEL_66;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    v43 = fp_current_or_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      int v52 = *(unsigned __int8 *)(a1 + 96);
      int v53 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 26);
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v74 = v52;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = v55 != v54;
      LOWORD(v75) = 1024;
      *(_DWORD *)((char *)&v75 + 2) = v53;
      _os_log_debug_impl(&dword_1A33AE000, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching more changes [moreChanges: %d, concurrentChanges: %d, shouldUpdate: %d]", buf, 0x14u);
    }

    [*(id *)(a1 + 32) _updateItemsWithUpdatesCount:v23 section:*(void *)(a1 + 80)];
    goto LABEL_66;
  }
}

- (void)_gatherMoreItemsAfterPage:(id)a3 section:(unint64_t)a4
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_started)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"FPExtensionDataSource.m" lineNumber:416 description:@"not started yet"];
  }
  if (self->_invalidated)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"FPExtensionDataSource.m" lineNumber:417 description:@"was invalidated"];
  }
  if (self->_enumeratingExtensionResults)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"FPExtensionDataSource.m" lineNumber:418 description:@"gather: already enumerating changes or items"];
  }
  self->_enumeratingExtensionResults = 1;
  uint64_t v11 = self->_enumerator;
  uint64_t v12 = _FPExtensionDataSourcePageSize;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke;
  v15[3] = &unk_1E5AF4AD8;
  void v15[4] = self;
  uint64_t v16 = v11;
  id v17 = v7;
  unint64_t v18 = a4;
  id v13 = v7;
  id v14 = v11;
  [(FPXEnumerator *)v14 enumerateItemsFromPage:v13 suggestedPageSize:v12 reply:v15];
}

void __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(NSObject **)(v14 + 88);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2;
  v22[3] = &unk_1E5AF4AB0;
  v22[4] = v14;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(void **)(a1 + 48);
  uint64_t v29 = *(void *)(a1 + 56);
  id v23 = v16;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v27 = v17;
  id v28 = v13;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  dispatch_async(v15, v22);
}

void __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16) == *(void *)(a1 + 40))
  {
    uint64_t v19 = *(void *)(a1 + 88);
    uint64_t v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_3();
    }

    char v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_2(a1, buf, [*(id *)(a1 + 48) count], v3);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 56));
    *(unsigned char *)(*(void *)(a1 + 32) + 27) = 0;
    int v4 = *(void **)(a1 + 72);
    if (v4 && ([v4 isEqual:&_NSFileProviderInitialPageSortedByName] & 1) == 0) {
      int v5 = [*(id *)(a1 + 72) isEqual:&_NSFileProviderInitialPageSortedByDate];
    }
    else {
      int v5 = 1;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v6 + 40);
    id v7 = (id *)(v6 + 40);
    if (!v8) {
      objc_storeStrong(v7, *(id *)(a1 + 64));
    }
    if (*(void *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateWithError:");
    }
    else
    {
      *(void *)(*(void *)(a1 + 32) + 48) += [*(id *)(a1 + 48) count];
      uint64_t v9 = *(void *)(a1 + 32);
      BOOL v10 = (*(void *)(v9 + 48) >> 4 < 0x271uLL || [*(id *)(v9 + 8) isUnbounded])
         && *(void *)(a1 + 56) != 0;
      id v11 = [*(id *)(a1 + 32) delegate];
      int v12 = [v11 dataSourceShouldAlwaysReplaceContents:*(void *)(a1 + 32)];

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
      uint64_t v14 = WeakRetained;
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 48);
      if (v5 | v12) {
        [WeakRetained dataSource:v15 replaceContentsWithItems:v16 hasMoreChanges:v10];
      }
      else {
        [WeakRetained dataSource:v15 receivedUpdatedItems:v16 deletedItems:MEMORY[0x1E4F1CBF0] hasMoreChanges:v10];
      }

      if (v10)
      {
        [*(id *)(a1 + 32) _gatherMoreItemsAfterPage:*(void *)(a1 + 56) section:*(void *)(a1 + 88)];
      }
      else
      {
        if (*(void *)(a1 + 56))
        {
          id v17 = fp_current_or_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_1();
          }
        }
        else
        {
          *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
        }
        id v18 = *(void **)(a1 + 32);
        if (v18[5]) {
          [v18 _updateItems];
        }
      }
    }
    __fp_leave_section_Debug((uint64_t)&v19);
  }
}

- (FPCollectionDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPCollectionDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_oobBuffer, 0);
  objc_storeStrong((id *)&self->_lifetimeExtender, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_nextPageToken, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);

  objc_storeStrong((id *)&self->_enumerationSettings, 0);
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@ notification ignored on not started enumerator", v2, v3, v4, v5, v6);
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@ notification ignored on invalidated enumerator", v2, v3, v4, v5, v6);
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@ notifications are suspended, not doing anything", v2, v3, v4, v5, v6);
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@ received notification that the enumeration changed, refreshing", v2, v3, v4, v5, v6);
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@ received notification that the enumeration changed, mark for future refresh", v2, v3, v4, v5, v6);
}

- (void)_updateItemsWithUpdatesCount:section:.cold.1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] skipping enumeration because it's suspended", v2, v3, v4, v5, v6);
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] change token is out of date, enumerating from scratch", v2, v3, v4, v5, v6);
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] pushing changes from OOB buffer", v2, v3, v4, v5, v6);
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] the collection has received OOB changes during the enumeration, buffering and forcing next enumeration", v2, v3, v4, v5, v6);
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] ┳%llx received changes", v2, v3, v4, v5, v6);
}

void __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] not gathering further because we have too many items", v2, v3, v4, v5, v6);
}

void __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_2(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  *(_DWORD *)buf = 134218498;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v4;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = v5;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] items: %lld, next page: %@, change token: %@\n", buf, 0x20u);
}

void __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_36(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] ┳%llx received pages", v2, v3, v4, v5, v6);
}

@end