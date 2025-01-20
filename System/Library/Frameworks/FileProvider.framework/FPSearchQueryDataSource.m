@interface FPSearchQueryDataSource
- (BOOL)dataSourceShouldAlwaysReplaceContents:(id)a3;
- (BOOL)hasMoreIncoming;
- (FPSearchQueryDataSource)initWithQueryDescriptor:(id)a3 predicate:(id)a4;
- (FPSearchQueryDescriptor)queryDescriptor;
- (FPSpotlightDataSourceDelegate)delegate;
- (unint64_t)lastForcedUpdate;
- (void)dataSource:(id)a3 didChangeItemsOrigin:(unint64_t)a4;
- (void)dataSource:(id)a3 receivedUpdatedItems:(id)a4 deletedItems:(id)a5 hasMoreChanges:(BOOL)a6;
- (void)dataSource:(id)a3 replaceContentsWithItems:(id)a4 hasMoreChanges:(BOOL)a5;
- (void)dataSource:(id)a3 wasInvalidatedWithError:(id)a4;
- (void)enumerationMightHaveResumed;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation FPSearchQueryDataSource

- (FPSearchQueryDataSource)initWithQueryDescriptor:(id)a3 predicate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)FPSearchQueryDataSource;
  v10 = [(FPSearchQueryDataSource *)&v39 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queryDescriptor, a3);
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.FileProvider.ExtensionDataSource.queue (%p)", v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = FPDataSourceBaseQueue();
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2(v13, v14, v15);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;

    v18 = [v8 settings];
    v19 = [v18 searchQuery];

    v20 = [v19 providerDomainID];
    v21 = [v20 fp_toProviderID];
    char v22 = [v21 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"];

    v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[FPSearchQueryDataSource initWithQueryDescriptor:predicate:](v22, v23);
    }

    if (v22 & 1) != 0 || ([v8 avoidCoreSpotlightSearch])
    {
      if (([v19 shouldPerformServerSearch] & 1) != 0
        || ([v19 shouldPerformServerSearch] & 1) != 0)
      {
        if (!v20) {
          goto LABEL_9;
        }
      }
      else
      {
        v33 = [MEMORY[0x1E4F28B00] currentHandler];
        [v33 handleFailureInMethod:a2, v11, @"FPSearchQueryDataSource.m", 58, @"When search on USB, server-side search should be requested." object file lineNumber description];

        if (!v20)
        {
LABEL_9:
          v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:a2, v11, @"FPSearchQueryDataSource.m", 59, @"When search on USB, the provider domain ID should be set to the USB provider domain ID." object file lineNumber description];

          if ([v19 shouldPerformServerSearch]) {
            goto LABEL_20;
          }
          goto LABEL_18;
        }
      }
    }
    else
    {
      v25 = [v8 searchQueryString];

      if (!v25)
      {
        v26 = [v8 searchQueryString];

        if (!v26)
        {
          v34 = [MEMORY[0x1E4F28B00] currentHandler];
          [v34 handleFailureInMethod:a2 object:v11 file:@"FPSearchQueryDataSource.m" lineNumber:52 description:@"search query should always be expressible by spotlight query"];
        }
      }
      v27 = [[FPSpotlightDataSource alloc] initWithQueryDescriptor:v8 predicate:v9];
      spotlightDataSource = v11->_spotlightDataSource;
      v11->_spotlightDataSource = v27;
    }
    if ([v19 shouldPerformServerSearch])
    {
      if (v20)
      {
        v29 = v11->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke;
        block[3] = &unk_1E5AF17D0;
        v36 = v20;
        id v37 = v8;
        v38 = v11;
        v30 = v20;
        dispatch_async(v29, block);

        v31 = v36;
LABEL_22:

        goto LABEL_23;
      }
LABEL_20:
      v31 = fp_current_or_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[FPSearchQueryDataSource initWithQueryDescriptor:predicate:](v31);
      }
      goto LABEL_22;
    }
LABEL_18:
    v31 = fp_current_or_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[FPSearchQueryDataSource initWithQueryDescriptor:predicate:](v31);
    }
    goto LABEL_22;
  }
LABEL_23:

  return v11;
}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t section = __fp_create_section();
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_msgSend(a1[4], "fp_obfuscatedProviderDomainID");
    __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_cold_1(v3, buf, section, v2);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_25;
  v5[3] = &unk_1E5AF51D8;
  id v4 = a1[4];
  id v6 = a1[5];
  id v7 = a1[4];
  id v8 = a1[6];
  +[FPProviderDomain fetchProviderDomainWithID:v4 completionHandler:v5];

  __fp_leave_section_Debug((uint64_t)&section);
}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_25(uint64_t a1, void *a2)
{
  v3 = [a2 supportedSearchFilters];
  if (v3)
  {

LABEL_4:
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_25_cold_1(a1);
    }

    v5 = objc_alloc_init(FPExtensionEnumerationSettings);
    id v6 = [*(id *)(a1 + 32) settings];
    id v7 = [v6 sortDescriptors];
    [(FPEnumerationSettings *)v5 setSortDescriptors:v7];

    id v8 = [*(id *)(a1 + 32) settings];
    id v9 = [v8 searchQuery];
    [(FPEnumerationSettings *)v5 setSearchQuery:v9];

    if ([*(id *)(a1 + 32) isThirdPartySearchOnServer]) {
      [(FPExtensionEnumerationSettings *)v5 setWantsDirectExtensionEnumeration:0];
    }
    v10 = [*(id *)(a1 + 32) settings];
    uint64_t v11 = [v10 searchQuery];

    id v12 = [FPItemID alloc];
    uint64_t v13 = *(void *)(a1 + 40);
    v14 = [v11 searchContainerItemIdentifier];
    v15 = [(FPItemID *)v12 initWithProviderDomainID:v13 itemIdentifier:v14];

    [(FPExtensionEnumerationSettings *)v5 setEnumeratedItemID:v15];
    dispatch_queue_t v16 = *(void **)(a1 + 48);
    v17 = v16[1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_28;
    v19[3] = &unk_1E5AF0748;
    v20 = v16;
    v21 = v5;
    v18 = v5;
    dispatch_async(v17, v19);

    goto LABEL_9;
  }
  if ([*(id *)(a1 + 32) isThirdPartySearchOnServer]) {
    goto LABEL_4;
  }
  uint64_t v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_25_cold_2(a1);
  }
LABEL_9:
}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_28(uint64_t a1)
{
  v2 = [[FPExtensionDataSource alloc] initWithEnumerationSettings:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  v5 = [*(id *)(a1 + 32) delegate];

  if (v5) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 16) && !*(unsigned char *)(v6 + 17))
  {
    id v7 = *(void **)(v6 + 32);
    [v7 start];
  }
}

- (void)start
{
  [(FPSpotlightDataSource *)self->_spotlightDataSource start];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__FPSearchQueryDataSource_start__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__FPSearchQueryDataSource_start__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 32) start];
}

- (void)invalidate
{
  [(FPSpotlightDataSource *)self->_spotlightDataSource invalidate];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__FPSearchQueryDataSource_invalidate__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__FPSearchQueryDataSource_invalidate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
}

- (void)enumerationMightHaveResumed
{
  [(FPSpotlightDataSource *)self->_spotlightDataSource enumerationMightHaveResumed];
  serverSearchDataSource = self->_serverSearchDataSource;

  [(FPExtensionDataSource *)serverSearchDataSource enumerationMightHaveResumed];
}

- (BOOL)hasMoreIncoming
{
  if ([(FPSpotlightDataSource *)self->_spotlightDataSource hasMoreIncoming]) {
    return 1;
  }
  serverSearchDataSource = self->_serverSearchDataSource;

  return [(FPExtensionDataSource *)serverSearchDataSource hasMoreIncoming];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = [WeakRetained isEqual:v4];

  if ((v6 & 1) == 0)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__FPSearchQueryDataSource_setDelegate___block_invoke;
    v8[3] = &unk_1E5AF0748;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(queue, v8);
  }
}

uint64_t __39__FPSearchQueryDataSource_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v2, "setDelegate:");
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = v3;
  }
  else
  {
    [v2 setDelegate:0];
    uint64_t v4 = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  v5 = *(void **)(v3 + 32);

  return [v5 setDelegate:v4];
}

- (unint64_t)lastForcedUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t v3 = [WeakRetained lastForcedUpdate];

  return v3;
}

- (void)dataSource:(id)a3 replaceContentsWithItems:(id)a4 hasMoreChanges:(BOOL)a5
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained dataSource:self replaceContentsWithItems:v7 hasMoreChanges:0];
}

- (void)dataSource:(id)a3 receivedUpdatedItems:(id)a4 deletedItems:(id)a5 hasMoreChanges:(BOOL)a6
{
  p_delegate = &self->_delegate;
  id v9 = a5;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained dataSource:self receivedUpdatedItems:v10 deletedItems:v9 hasMoreChanges:0];
}

- (void)dataSource:(id)a3 wasInvalidatedWithError:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained dataSource:self wasInvalidatedWithError:v6];
}

- (BOOL)dataSourceShouldAlwaysReplaceContents:(id)a3
{
  return ![(FPSearchQueryDescriptor *)self->_queryDescriptor isThirdPartySearchOnServer];
}

- (void)dataSource:(id)a3 didChangeItemsOrigin:(unint64_t)a4
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained dataSource:v6 didChangeItemsOrigin:a4];
}

- (FPSpotlightDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPSpotlightDataSourceDelegate *)WeakRetained;
}

- (FPSearchQueryDescriptor)queryDescriptor
{
  return self->_queryDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverSearchDataSource, 0);
  objc_storeStrong((id *)&self->_spotlightDataSource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithQueryDescriptor:(os_log_t)log predicate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] server search ignored because no provider domain ID specified", v1, 2u);
}

- (void)initWithQueryDescriptor:(os_log_t)log predicate:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] server search not requested", v1, 2u);
}

- (void)initWithQueryDescriptor:(char)a1 predicate:(NSObject *)a2 .cold.3(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = @"NO";
  if (a1) {
    v2 = @"YES";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Creating search query data source (is search on USB: %@)", (uint8_t *)&v3, 0xCu);
}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_cold_1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx checking if '%@' supports server search", buf, 0x16u);
}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_25_cold_1(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 40), "fp_obfuscatedProviderDomainID");
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] '%@' supports server search", v4, v5, v6, v7, 2u);
}

void __61__FPSearchQueryDataSource_initWithQueryDescriptor_predicate___block_invoke_25_cold_2(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 40), "fp_obfuscatedProviderDomainID");
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] '%@' does not support server search", v4, v5, v6, v7, 2u);
}

@end