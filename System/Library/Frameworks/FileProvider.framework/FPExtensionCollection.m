@interface FPExtensionCollection
+ (BOOL)_item:(id)a3 isCollectionRootForObservedItemID:(id)a4;
+ (BOOL)item:(id)a3 isValidForObservedItemID:(id)a4;
- (BOOL)isCollectionValidForItem:(id)a3;
- (BOOL)isRootItem:(id)a3;
- (BOOL)recoverFromError:(id)a3;
- (BOOL)shouldRetryError:(id)a3;
- (FPExtensionCollection)initWithSettings:(id)a3;
- (FPExtensionEnumerationSettings)settings;
- (id)createDataSourceWithSortDescriptors:(id)a3;
- (id)description;
- (id)enumeratedItemID;
- (id)scopedSearchQuery;
- (void)_failMonitoringWithError:(id)a3;
- (void)_startMonitoringDSCopyProgress;
- (void)_startMonitoringDomains;
- (void)_stopMonitoringDomains;
- (void)setSettings:(id)a3;
- (void)startObserving;
- (void)stopObserving;
- (void)updateRootItem:(id)a3;
@end

@implementation FPExtensionCollection

- (FPExtensionCollection)initWithSettings:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPExtensionCollection;
  v6 = [(FPItemCollection *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    uint64_t v8 = objc_opt_new();
    dsCopySubscriber = v7->_dsCopySubscriber;
    v7->_dsCopySubscriber = (FPExtensionCollectionDSCopySubscriber *)v8;
  }
  return v7;
}

- (BOOL)isRootItem:(id)a3
{
  id v4 = a3;
  id v5 = [(FPExtensionEnumerationSettings *)self->_settings enumeratedItemID];

  if (!v5)
  {
    v6 = [(FPExtensionEnumerationSettings *)self->_settings enumeratedURL];
    if (!v6)
    {
      char v8 = 0;
      goto LABEL_9;
    }
    v7 = [(FPExtensionEnumerationSettings *)self->_settings enumeratedURL];
    v9 = [v4 fileURL];
    char v8 = objc_msgSend(v7, "fp_relationshipToItemAtURL:", v9) == 1;
    goto LABEL_7;
  }
  v6 = [v4 itemID];
  v7 = [(FPExtensionEnumerationSettings *)self->_settings enumeratedItemID];
  if (([v6 isEqual:v7] & 1) == 0)
  {
    v9 = [v4 formerItemID];
    v10 = [(FPExtensionEnumerationSettings *)self->_settings enumeratedItemID];
    char v8 = [v9 isEqual:v10];

LABEL_7:
    goto LABEL_8;
  }
  char v8 = 1;
LABEL_8:

LABEL_9:
  return v8;
}

- (void)updateRootItem:(id)a3
{
  id v4 = a3;
  id v5 = [(FPExtensionEnumerationSettings *)self->_settings enumeratedURL];

  if (v5)
  {
    v6 = [(FPExtensionEnumerationSettings *)self->_settings enumeratedURL];
    v7 = [v4 fileURL];
    p_super = objc_msgSend(v6, "fp_relativePathOf:", v7);

    if (!p_super || [p_super length])
    {
      v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[FPExtensionCollection updateRootItem:]();
      }

      v10 = self;
      objc_sync_enter(v10);
      alternateID = v10->_alternateID;
      v10->_alternateID = 0;

      objc_sync_exit(v10);
      [(FPExtensionEnumerationSettings *)self->_settings setNullableEnumeratedItemID:0];
      v12 = [(FPItemCollection *)v10 dataSource];
      [v12 invalidate];

      v13 = [(FPItemCollection *)v10 dataSource];
      v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:-1002 userInfo:0];
      [(FPItemCollection *)v10 dataSource:v13 wasInvalidatedWithError:v14];

      goto LABEL_19;
    }
    v15 = [(FPExtensionEnumerationSettings *)self->_settings nullableEnumeratedItemID];

    if (!v15)
    {
      v16 = [v4 itemID];
      [(FPExtensionEnumerationSettings *)self->_settings setNullableEnumeratedItemID:v16];

      v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[FPExtensionCollection updateRootItem:]();
      }
    }
  }
  v18 = self;
  objc_sync_enter(v18);
  if (v18->_alternateID)
  {
    objc_sync_exit(v18);
    p_super = &v18->super.super;
  }
  else
  {
    v19 = [v4 itemID];
    v20 = [(FPExtensionEnumerationSettings *)self->_settings enumeratedItemID];
    int v21 = [v19 isEqual:v20];

    if (v21) {
      [v4 formerItemID];
    }
    else {
    uint64_t v22 = [v4 itemID];
    }
    v23 = v18->_alternateID;
    v18->_alternateID = (FPItemID *)v22;

    objc_sync_exit(v18);
    p_super = fp_current_or_default_log();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
      -[FPExtensionCollection updateRootItem:]();
    }
  }
LABEL_19:
}

- (BOOL)isCollectionValidForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(FPExtensionCollection *)self enumeratedItemID];
  BOOL v6 = +[FPExtensionCollection item:v4 isValidForObservedItemID:v5];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    char v8 = self;
    objc_sync_enter(v8);
    v9 = v8->_alternateID;
    objc_sync_exit(v8);

    if (v9)
    {
      BOOL v7 = +[FPExtensionCollection item:v4 isValidForObservedItemID:v9];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)item:(id)a3 isValidForObservedItemID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 identifier];
  char v9 = [v8 isEqualToString:@"NSFileProviderWorkingSetContainerItemIdentifier"];

  if (v9) {
    goto LABEL_5;
  }
  v10 = [v7 identifier];
  char v11 = [v10 hasPrefix:@"NSFileProviderSearchContainerItemIdentifier"];

  if ((v11 & 1) != 0
    || ([a1 _item:v6 isCollectionRootForObservedItemID:v7] & 1) != 0
    || ([v7 providerID],
        v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 hasPrefix:@"com.apple.Document"],
        v12,
        (v13 & 1) != 0))
  {
LABEL_5:
    char v14 = 1;
  }
  else
  {
    v16 = [v6 parentItemIdentifier];
    v17 = [v7 identifier];
    if ([v16 isEqualToString:v17])
    {
      v18 = [v6 providerDomainID];
      v19 = [v7 providerDomainID];
      if ([v18 isEqualToString:v19])
      {
        char v14 = 1;
      }
      else
      {
        v20 = objc_msgSend(v6, "fp_parentDomainIdentifier");
        int v21 = [v7 domainIdentifier];
        char v14 = [v20 isEqualToString:v21];
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

+ (BOOL)_item:(id)a3 isCollectionRootForObservedItemID:(id)a4
{
  id v5 = a4;
  id v6 = [a3 itemID];
  char v7 = [v6 isEqualToItemID:v5];

  return v7;
}

- (id)createDataSourceWithSortDescriptors:(id)a3
{
  [(FPEnumerationSettings *)self->_settings setSortDescriptors:a3];
  id v4 = [(FPExtensionEnumerationSettings *)self->_settings enumeratedURL];

  if (v4)
  {
    [(FPExtensionEnumerationSettings *)self->_settings setNullableEnumeratedItemID:0];
    id v5 = self;
    objc_sync_enter(v5);
    alternateID = v5->_alternateID;
    v5->_alternateID = 0;

    objc_sync_exit(v5);
  }
  char v7 = [FPExtensionDataSource alloc];
  char v8 = (void *)[(FPExtensionEnumerationSettings *)self->_settings copy];
  char v9 = [(FPExtensionDataSource *)v7 initWithEnumerationSettings:v8];

  return v9;
}

- (id)scopedSearchQuery
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_alternateID;
  objc_sync_exit(v2);

  id v4 = [NSFileProviderSearchQuery alloc];
  id v5 = [(FPExtensionCollection *)v2 enumeratedItemID];
  id v6 = [(NSFileProviderSearchQuery *)v4 initWithSearchScopedToItemID:v5 alternateItemID:v3];

  return v6;
}

- (id)enumeratedItemID
{
  return [(FPExtensionEnumerationSettings *)self->_settings enumeratedItemID];
}

- (void)_failMonitoringWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(FPItemCollection *)self workingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(FPExtensionCollection *)(uint64_t)self _failMonitoringWithError:v6];
  }

  char v7 = [(FPItemCollection *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v8 = objc_msgSend(v4, "fp_unwrappedInternalError");
    [v7 collection:self didEncounterError:v8];
  }
  [(FPExtensionCollection *)self _stopMonitoringDomains];
}

- (void)_startMonitoringDomains
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@: wait for domain authentication", v2, v3, v4, v5, v6);
}

void __48__FPExtensionCollection__startMonitoringDomains__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = [*(id *)(a1 + 32) workingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__FPExtensionCollection__startMonitoringDomains__block_invoke_2;
  block[3] = &unk_1E5AF17D0;
  block[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __48__FPExtensionCollection__startMonitoringDomains__block_invoke_2(void *a1)
{
  uint64_t v3 = a1 + 4;
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 248))
  {
    if (a1[5])
    {
      objc_msgSend((id)v2, "_failMonitoringWithError:");
    }
    else
    {
      uint64_t v4 = (void *)a1[6];
      id v5 = [*(id *)(v2 + 232) enumeratedItemID];
      id v6 = [v5 providerDomainID];
      char v7 = [v4 objectForKeyedSubscript:v6];

      if (v7 && ([v7 needsAuthentication] & 1) == 0 && objc_msgSend(v7, "isEnabled"))
      {
        id v8 = fp_current_or_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __48__FPExtensionCollection__startMonitoringDomains__block_invoke_2_cold_1(v3, (uint64_t)v7, v8);
        }

        [(id)*v3 startObserving];
      }
    }
  }
}

- (void)_stopMonitoringDomains
{
  uint64_t v3 = [(FPItemCollection *)self workingQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_providerDomainMonitoringContext)
  {
    +[FPProviderDomain endMonitoringProviderDomainChanges:](FPProviderDomain, "endMonitoringProviderDomainChanges:");
    id providerDomainMonitoringContext = self->_providerDomainMonitoringContext;
    self->_id providerDomainMonitoringContext = 0;
  }
}

- (void)_startMonitoringDSCopyProgress
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] _startMonitoringDSCopyProgress skipped as process not entitled to query fileproviderd", v1, 2u);
}

id __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "fp_isAccountedAsCopyProgress"))
  {
    uint64_t v4 = [v3 userInfo];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28890]];

    id v6 = +[FPItemManager defaultManager];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_3;
    v18[3] = &unk_1E5AF1B50;
    v18[4] = *(void *)(a1 + 32);
    char v7 = (id *)(a1 + 40);
    objc_copyWeak(&v21, v7);
    id v8 = v3;
    id v19 = v8;
    id v9 = v5;
    id v20 = v9;
    [v6 _fetchItemForURL:v9 synchronously:0 skipURLValidation:1 completionHandler:v18];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_33;
    v14[3] = &unk_1E5AF1B78;
    objc_copyWeak(&v17, v7);
    id v15 = v8;
    id v16 = v9;
    id v10 = v9;
    id v11 = (void *)MEMORY[0x1A6248B00](v14);
    id v12 = (void *)MEMORY[0x1A6248B00]();

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
  }
  else
  {
    id v12 = &__block_literal_global_7;
  }

  return v12;
}

void __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && [*(id *)(a1 + 32) isCollectionValidForItem:v5])
  {
    char v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_3_cold_1(a1, v5, v7);
    }

    id v8 = +[FPProgressManager defaultManager];
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [v5 itemID];
    [v8 registerCopyProgress:v9 forItemID:v10];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v12 = [v5 itemID];
    [WeakRetained forceRefreshOfItemWithItemID:v12];
  }
}

void __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_33(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = +[FPProgressManager defaultManager];
  id v5 = [v4 removeCopyProgress:*(void *)(a1 + 32)];

  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v8 = objc_loadWeakRetained(v2);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) path];
    int v11 = 138413058;
    id v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_debug_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: DSCopy: Detaching progress %@ from %@ at %@", (uint8_t *)&v11, 0x2Au);
  }
  if (v5) {
    BOOL v7 = WeakRetained == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    [WeakRetained forceRefreshOfItemWithItemID:v5];
  }
}

void __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_35(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[32] startMonitoringWithURL:v5 publishingHandler:*(void *)(a1 + 32)];
  }
}

- (void)stopObserving
{
  [(FPExtensionCollection *)self _stopMonitoringDomains];
  [(FPExtensionCollectionDSCopySubscriber *)self->_dsCopySubscriber stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)FPExtensionCollection;
  [(FPItemCollection *)&v3 stopObserving];
}

- (void)startObserving
{
  [(FPExtensionCollection *)self _stopMonitoringDomains];
  [(FPExtensionCollection *)self _startMonitoringDSCopyProgress];
  v3.receiver = self;
  v3.super_class = (Class)FPExtensionCollection;
  [(FPItemCollection *)&v3 startObserving];
}

- (BOOL)recoverFromError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FPExtensionCollection;
  return [(FPItemCollection *)&v4 recoverFromError:a3];
}

- (BOOL)shouldRetryError:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FPExtensionCollection;
  if ([(FPItemCollection *)&v8 shouldRetryError:v4])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = objc_msgSend(v4, "fp_unwrappedInternalError");
    if (objc_msgSend(v6, "fp_isFileProviderInternalError:", 12)) {
      char v5 = 1;
    }
    else {
      char v5 = objc_msgSend(v6, "fp_isFileProviderError:", -2001);
    }
  }
  return v5;
}

- (id)description
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = v2->_alternateID;
  objc_sync_exit(v2);

  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3) {
    [v4 stringWithFormat:@"<%@:%p [%@, %@]>", v5, v2, v2->_settings, v3];
  }
  else {
  id v6 = [v4 stringWithFormat:@"<%@:%p %@>", v5, v2, v2->_settings, v8];
  }

  return v6;
}

- (FPExtensionEnumerationSettings)settings
{
  return (FPExtensionEnumerationSettings *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsCopySubscriber, 0);
  objc_storeStrong(&self->_providerDomainMonitoringContext, 0);
  objc_storeStrong((id *)&self->_alternateID, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)updateRootItem:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@ learned alternate identifier", v2, v3, v4, v5, v6);
}

- (void)updateRootItem:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] Enumerated URL changed, resetting %@", v2, v3, v4, v5, v6);
}

- (void)updateRootItem:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@ learned enumerated item identifier", v2, v3, v4, v5, v6);
}

- (void)_failMonitoringWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: monitoring of domain failed with error %@", (uint8_t *)&v6, 0x16u);
}

void __48__FPExtensionCollection__startMonitoringDomains__block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: domain %@ is authenticated, restart observation", (uint8_t *)&v4, 0x16u);
}

void __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_3_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [a2 itemID];
  uint64_t v9 = [*(id *)(a1 + 48) path];
  int v10 = 138413058;
  id v11 = WeakRetained;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  __int16 v15 = v8;
  __int16 v16 = 2112;
  __int16 v17 = v9;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: DSCopy: Attaching progress %@ to %@ at %@", (uint8_t *)&v10, 0x2Au);
}

@end