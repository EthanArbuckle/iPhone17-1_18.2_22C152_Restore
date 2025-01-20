@interface FPProviderDomainChangesReceiver
+ (id)_sharedChangesReceiverInitIfNeeded:(BOOL)a3;
+ (id)sharedChangesReceiver;
+ (id)sharedChangesReceiverIfAvailable;
- (NSDictionary)cachedProviderDomainsByID;
- (id)_init;
- (id)addChangesHandler:(id)a3;
- (void)_t_discardCache;
- (void)callChangesHandlersWithProviderDomains:(id)a3 error:(id)a4;
- (void)providerDomainsHaveChanged:(id)a3 error:(id)a4;
- (void)removeChangesHandlerToken:(id)a3;
- (void)signalChange;
- (void)updateProviderDomainsWithAttemptCount:(unint64_t)a3;
@end

@implementation FPProviderDomainChangesReceiver

+ (id)_sharedChangesReceiverInitIfNeeded:(BOOL)a3
{
  if (a3 && _sharedChangesReceiverInitIfNeeded__onceToken != -1) {
    dispatch_once(&_sharedChangesReceiverInitIfNeeded__onceToken, &__block_literal_global);
  }
  v3 = (void *)_sharedChangesReceiverInitIfNeeded__sharedChangesReceiver;

  return v3;
}

- (NSDictionary)cachedProviderDomainsByID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSDictionary *)v2->_providerDomainsByID copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

+ (id)sharedChangesReceiverIfAvailable
{
  return (id)[a1 _sharedChangesReceiverInitIfNeeded:0];
}

void __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_1(v6, v8);
    }
    goto LABEL_10;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  v8 = fp_current_or_default_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (!v7)
  {
    if (v9) {
      __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_2(v5, v8);
    }
LABEL_10:

    [*(id *)(a1 + 32) providerDomainsHaveChanged:v6 error:v5];
    [*(id *)(*(void *)(a1 + 32) + 40) resume];
    goto LABEL_11;
  }
  if (v9) {
    __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_3((uint64_t)v5, (uint64_t *)(a1 + 40), v8);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 24);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_33;
  v13[3] = &unk_1E5AF06F0;
  uint64_t v12 = *(void *)(a1 + 40);
  v13[4] = v10;
  v13[5] = v12;
  dispatch_async(v11, v13);
LABEL_11:
}

- (void)providerDomainsHaveChanged:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [v10 copy];
  providerDomainsByID = v7->_providerDomainsByID;
  v7->_providerDomainsByID = (NSDictionary *)v8;

  objc_sync_exit(v7);
  [(FPProviderDomainChangesReceiver *)v7 callChangesHandlersWithProviderDomains:v10 error:v6];
}

- (void)callChangesHandlersWithProviderDomains:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  BOOL v9 = (void *)[(NSMutableSet *)v8->_changesHandlers copy];
  objc_sync_exit(v8);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "callHandlerWithProvidersByID:error:", v6, v7, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)removeChangesHandlerToken:(id)a3
{
  id v4 = a3;
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPProviderDomainChangesReceiver removeChangesHandlerToken:](v5);
  }

  id v6 = v4;
  objc_sync_enter(v6);
  [v6 setUnregistered:1];
  objc_sync_exit(v6);

  id v7 = self;
  objc_sync_enter(v7);
  [(NSMutableSet *)v7->_changesHandlers removeObject:v6];
  objc_sync_exit(v7);
}

+ (id)sharedChangesReceiver
{
  return (id)[a1 _sharedChangesReceiverInitIfNeeded:1];
}

- (id)addChangesHandler:(id)a3
{
  id v4 = a3;
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPProviderDomainChangesReceiver addChangesHandler:](v5);
  }

  id v6 = +[_FPProviderDomainChangesHandlerWrapper wrapperWithHandler:v4];
  id v7 = self;
  objc_sync_enter(v7);
  [(NSMutableSet *)v7->_changesHandlers addObject:v6];
  providerDomainsByID = v7->_providerDomainsByID;
  if (providerDomainsByID) {
    BOOL v9 = (void *)[(NSDictionary *)providerDomainsByID copy];
  }
  else {
    BOOL v9 = 0;
  }
  objc_sync_exit(v7);

  if (v9)
  {
    [v6 callHandlerWithProvidersByID:v9 error:0];
  }
  else if ([(FPPacer *)v7->_pacer isSuspended])
  {
    [(FPProviderDomainChangesReceiver *)v7 signalChange];
  }
  else
  {
    [(FPProviderDomainChangesReceiver *)v7 updateProviderDomainsWithAttemptCount:3];
  }

  return v6;
}

void __40__FPProviderDomainChangesReceiver__init__block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_INFO, "[INFO] received notification that provider info has changed; scheduling a fetch",
      v4,
      2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained signalChange];
}

- (void)signalChange
{
}

void __40__FPProviderDomainChangesReceiver__init__block_invoke_30(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_INFO, "[INFO] received notification that provider info has changed; querying for new info",
      v4,
      2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateProviderDomainsWithAttemptCount:3];
}

- (void)updateProviderDomainsWithAttemptCount:(unint64_t)a3
{
  [(FPPacer *)self->_pacer suspend];
  id v5 = +[FPDaemonConnection sharedConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke;
  v6[3] = &unk_1E5AF0718;
  v6[4] = self;
  v6[5] = a3;
  [v5 providerDomainsCompletionHandler:v6];
}

uint64_t __70__FPProviderDomainChangesReceiver__sharedChangesReceiverInitIfNeeded___block_invoke()
{
  _sharedChangesReceiverInitIfNeeded__sharedChangesReceiver = [[FPProviderDomainChangesReceiver alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v22.receiver = self;
  v22.super_class = (Class)FPProviderDomainChangesReceiver;
  id v2 = [(FPProviderDomainChangesReceiver *)&v22 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.FileProvider.provider-changes-receiver.notify", v5);
    id v7 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v6;

    uint64_t v8 = objc_msgSend(@"com.apple.fileprovider.providers-changed", "fp_libnotifyPerUserNotificationName");
    id location = 0;
    objc_initWeak(&location, v2);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __40__FPProviderDomainChangesReceiver__init__block_invoke;
    v19[3] = &unk_1E5AF06A0;
    objc_copyWeak(&v20, &location);
    BOOL v9 = (void *)MEMORY[0x1A6248B00](v19);
    id v10 = v8;
    notify_register_dispatch((const char *)[v10 UTF8String], (int *)v2 + 8, *((dispatch_queue_t *)v2 + 3), v9);
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_INFO, "[INFO] start monitoring provider info", buf, 2u);
    }

    uint64_t v12 = [[FPPacer alloc] initWithName:@"domain-changes" queue:*((void *)v2 + 3) minFireInterval:1.0];
    uint64_t v13 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v12;

    long long v14 = (void *)*((void *)v2 + 5);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __40__FPProviderDomainChangesReceiver__init__block_invoke_30;
    v16[3] = &unk_1E5AF06C8;
    objc_copyWeak(&v17, &location);
    [v14 setEventBlock:v16];
    [*((id *)v2 + 5) resume];
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_t_discardCache
{
  obj = self;
  objc_sync_enter(obj);
  providerDomainsByID = obj->_providerDomainsByID;
  obj->_providerDomainsByID = 0;

  objc_sync_exit(obj);
}

uint64_t __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_33(uint64_t a1)
{
  [*(id *)(a1 + 32) updateProviderDomainsWithAttemptCount:*(void *)(a1 + 40) - 1];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);

  return [v2 resume];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pacer, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_providerDomainsByID, 0);

  objc_storeStrong((id *)&self->_changesHandlers, 0);
}

- (void)addChangesHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] add provider info change handler", v1, 2u);
}

- (void)removeChangesHandlerToken:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] remove provide info change handler", v1, 2u);
}

void __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 count];
  id v5 = [a1 allValues];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  BOOL v9 = v5;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] received %lu updated providers: %@", (uint8_t *)&v6, 0x16u);
}

void __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "fp_prettyDescription");
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] can't get the list of providers: %@", (uint8_t *)&v4, 0xCu);
}

void __73__FPProviderDomainChangesReceiver_updateProviderDomainsWithAttemptCount___block_invoke_cold_3(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] received an error when listing providers, attempting again: %@ (count: %ld)", (uint8_t *)&v4, 0x16u);
}

@end