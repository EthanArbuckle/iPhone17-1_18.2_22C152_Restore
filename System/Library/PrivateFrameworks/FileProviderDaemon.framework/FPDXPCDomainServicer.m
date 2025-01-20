@interface FPDXPCDomainServicer
- (FPDExtensionSession)sessionOrNil;
- (FPDXPCDomainServicer)initWithServer:(id)a3 providerDomainID:(id)a4 domain:(id)a5 connection:(id)a6;
- (FPProgressProtocol)downloadProxy;
- (FPProgressProtocol)uploadProxy;
- (NSString)providerDomainID;
- (id)__providerIfExists;
- (id)description;
- (id)domainOrNil:(unint64_t *)a3;
- (id)newFileProviderProxy;
- (id)providerOrNilWithReason:(unint64_t *)a3;
- (int)pid;
- (void)_registerLifetimeExtension;
- (void)_t_setFilePresenterObserver:(id)a3;
- (void)_unregisterLifetimeExtension;
- (void)currentMaterializedSetSyncAnchorWithCompletionHandler:(id)a3;
- (void)currentPendingSetSyncAnchorWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5;
- (void)didChangeItemID:(id)a3 completionHandler:(id)a4;
- (void)enumerateMaterializedSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5;
- (void)enumeratePendingSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5;
- (void)evictItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getDiagnosticAttributesForItems:(id)a3 completionHandler:(id)a4;
- (void)ingestFromCacheItemWithIdentifier:(id)a3 requestedFields:(unint64_t)a4 completionHandler:(id)a5;
- (void)invalidate;
- (void)listAvailableTestingOperationsWithCompletionHandler:(id)a3;
- (void)materializeItemWithIdentifier:(id)a3 requestedRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)reimportItemsBelowItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)resolveItemID:(id)a3 completionHandler:(id)a4;
- (void)runTestingOperations:(id)a3 completionHandler:(id)a4;
- (void)setDomainEjectable:(BOOL)a3 completionHandler:(id)a4;
- (void)setDownloadProxy:(id)a3;
- (void)setUploadProxy:(id)a3;
- (void)signalErrorResolved:(id)a3 completionHandler:(id)a4;
- (void)startAccessingServiceWithName:(id)a3 itemID:(id)a4 completionHandler:(id)a5;
- (void)startExtendingLifetime;
- (void)stateDirectoryWithCompletionHandler:(id)a3;
- (void)subscribeToDownloadProgressUpdates:(id)a3 completionHandler:(id)a4;
- (void)subscribeToUploadProgressUpdates:(id)a3 completionHandler:(id)a4;
- (void)temporaryDirectoryWithCompletionHandler:(id)a3;
- (void)waitForChangesOnItemsBelowItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)waitForStabilizationWithCompletionHandler:(id)a3;
@end

@implementation FPDXPCDomainServicer

- (FPDExtensionSession)sessionOrNil
{
  v2 = [(FPDXPCDomainServicer *)self domainOrNil:0];
  v3 = [v2 session];

  return (FPDExtensionSession *)v3;
}

- (id)domainOrNil:(unint64_t *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  id WeakRetained = objc_loadWeakRetained((id *)&v4->_domain);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&v4->_domain);
    objc_sync_exit(v4);
  }
  else
  {
    objc_sync_exit(v4);

    v7 = [(FPDXPCDomainServicer *)v4 providerOrNilWithReason:a3];
    if (v7)
    {
      v8 = [(NSString *)v4->_providerDomainID fp_toDomainIdentifier];
      v6 = [(FPDXPCDomainServicer *)v7 domainForIdentifier:v8 reason:a3];
    }
    else
    {
      v6 = 0;
    }
    v4 = v7;
  }

  return v6;
}

- (id)providerOrNilWithReason:(unint64_t *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(FPDXPCDomainServicer *)v4 __providerIfExists];
  v6 = v5;
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v4->_server);

    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)&v4->_server);
      v9 = [v8 extensionManager];
      v10 = [(NSString *)v4->_providerDomainID fp_toProviderID];
      uint64_t v11 = [v9 providerWithIdentifier:v10 reason:a3];
      provider = v4->__provider;
      v4->__provider = (FPDProvider *)v11;
    }
    if (v4->_isALifetimerExtender) {
      [(FPDXPCDomainServicer *)v4 _registerLifetimeExtension];
    }
    v6 = v4->__provider;
  }
  v13 = v6;

  objc_sync_exit(v4);
  return v13;
}

- (id)__providerIfExists
{
  v2 = self;
  objc_sync_enter(v2);
  provider = v2->__provider;
  if (provider && ![(FPDProvider *)provider invalidated]) {
    v4 = v2->__provider;
  }
  else {
    v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

void __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  v2 = [*(id *)(a1 + 32) domainOrNil:&v10];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    v4 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke_239;
    v6[3] = &unk_1E6A73710;
    v6[4] = *(void *)(a1 + 32);
    v5 = &v7;
    id v7 = *(id *)(a1 + 48);
    [v2 didChangeItemID:v3 request:v4 completionHandler:v6];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke_2;
    v8[3] = &unk_1E6A73710;
    v8[4] = *(void *)(a1 + 32);
    v5 = &v9;
    id v9 = *(id *)(a1 + 48);
    v4 = FPProviderNotFoundError();
    __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke_2((uint64_t)v8, v4);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSString *)self->_providerDomainID fp_obfuscatedProviderDomainID];
  [(FPDXPCDomainServicer *)self pid];
  v6 = FPExecutableNameForProcessIdentifier();
  id v7 = [v3 stringWithFormat:@"<%@:%p:%@> for %@[%d]", v4, self, v5, v6, -[FPDXPCDomainServicer pid](self, "pid")];

  return v7;
}

- (int)pid
{
  return [(FPDXPCDomainServicerLifetimeExtender *)self->_lifetimeExtender requestEffectivePID];
}

- (FPDXPCDomainServicer)initWithServer:(id)a3 providerDomainID:(id)a4 domain:(id)a5 connection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)FPDXPCDomainServicer;
  v14 = [(FPDXPCDomainServicer *)&v31 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_server, v10);
    objc_storeStrong((id *)&v15->_providerDomainID, a4);
    objc_storeWeak((id *)&v15->_domain, v12);
    v16 = [v12 log];
    v17 = v16;
    if (v16)
    {
      v18 = v16;
      log = v15->_log;
      v15->_log = v18;
    }
    else
    {
      objc_msgSend(v11, "fp_obfuscatedProviderDomainID");
      log = (OS_os_log *) objc_claimAutoreleasedReturnValue();
      [(OS_os_log *)log UTF8String];
      uint64_t v20 = fpfs_create_log_for_provider();
      v21 = v15->_log;
      v15->_log = (OS_os_log *)v20;
    }
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create("FPDXPCDomainServicer request queue", v22);
    requestQueue = v15->_requestQueue;
    v15->_requestQueue = (OS_dispatch_queue *)v23;

    objc_storeWeak((id *)&v15->_connection, v13);
    uint64_t v25 = objc_opt_new();
    lifetimeExtender = v15->_lifetimeExtender;
    v15->_lifetimeExtender = (FPDXPCDomainServicerLifetimeExtender *)v25;

    -[FPDXPCDomainServicerLifetimeExtender setRequestEffectivePID:](v15->_lifetimeExtender, "setRequestEffectivePID:", [v13 processIdentifier]);
    v27 = NSString;
    v28 = FPExecutableNameForProcessIdentifier();
    v29 = [v27 stringWithFormat:@"servicer for %@", v28];
    [(FPDXPCDomainServicerLifetimeExtender *)v15->_lifetimeExtender setPrettyDescription:v29];
  }
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadProxy, 0);
  objc_storeStrong((id *)&self->_uploadProxy, 0);
  objc_storeStrong((id *)&self->_providerDomainID, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_serviceTransaction, 0);
  objc_storeStrong((id *)&self->_lifetimeExtender, 0);
  objc_storeStrong(&self->_activePresenterObservation, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->__provider, 0);
  objc_destroyWeak((id *)&self->_server);
}

void __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke_239(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer didChangeItemID:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)startExtendingLifetime
{
  if (self->_isALifetimerExtender)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"FPDXPCDomainServicer.m" lineNumber:214 description:@"it's unsupported to call -_startAccessingProviderEndpointForProtocolName:itemURL:completionHandler: twice"];
  }
  [(FPDXPCDomainServicer *)self _registerLifetimeExtension];
  id v7 = [(FPDXPCDomainServicer *)self description];
  [v7 UTF8String];
  id v3 = (OS_os_transaction *)os_transaction_create();
  serviceTransaction = self->_serviceTransaction;
  self->_serviceTransaction = v3;
}

- (NSString)providerDomainID
{
  return self->_providerDomainID;
}

- (void)_registerLifetimeExtension
{
  id v3 = [(FPDXPCDomainServicer *)self sessionOrNil];
  [v3 registerLifetimeExtensionForObject:self->_lifetimeExtender];

  self->_isALifetimerExtender = 1;
}

- (void)dealloc
{
  [(FPDXPCDomainServicer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FPDXPCDomainServicer;
  [(FPDXPCDomainServicer *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] invalidating %@", (uint8_t *)&v2, 0xCu);
}

- (void)_unregisterLifetimeExtension
{
  if (self->_isALifetimerExtender)
  {
    self->_isALifetimerExtender = 0;
    uint64_t v3 = [(FPDXPCDomainServicer *)self sessionOrNil];
    if (v3)
    {
      id v4 = v3;
      [v3 asyncUnregisterLifetimeExtensionForObject:self->_lifetimeExtender];
      uint64_t v3 = v4;
    }
  }
}

- (void)didChangeItemID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke;
  block[3] = &unk_1E6A73760;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(requestQueue, block);
}

void __52__FPDXPCDomainServicer__t_setFilePresenterObserver___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  int v2 = [*(id *)(a1 + 32) providerOrNilWithReason:&v10];
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) finishObserving];
    uint64_t v3 = [v2 domainForIdentifier:*MEMORY[0x1E4F25C00] reason:0];
    id v4 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:v3 path:"filePresenters"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__FPDXPCDomainServicer__t_setFilePresenterObserver___block_invoke_3;
    v8[3] = &unk_1E6A73A08;
    id v9 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 addObserverBlock:v8];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = v5;
  }
  else
  {
    uint64_t v3 = FPProviderNotFoundError();
  }
}

void __52__FPDXPCDomainServicer__t_setFilePresenterObserver___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = a1;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v13 = v2;
  id v4 = [v2 allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "presentedItemURL", v12);
        if (v10)
        {
          [v3 addObject:v10];
        }
        else
        {
          uint64_t v11 = fp_current_or_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v9;
            _os_log_error_impl(&dword_1D744C000, v11, OS_LOG_TYPE_ERROR, "[ERROR] nil presentedItemURL for presenter: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  [*(id *)(v12 + 32) observePresentedFilesDidChange:v3];
}

- (void)_t_setFilePresenterObserver:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__FPDXPCDomainServicer__t_setFilePresenterObserver___block_invoke;
  v7[3] = &unk_1E6A736C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(requestQueue, v7);
}

- (id)newFileProviderProxy
{
  uint64_t v3 = [(FPDXPCDomainServicer *)self sessionOrNil];
  if (v3)
  {
    id v4 = objc_msgSend(v3, "newFileProviderProxyWithTimeout:pid:", -[FPDXPCDomainServicer pid](self, "pid"), 180.0);
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F25DA8]);
    id v6 = FPProviderNotFoundError();
    uint64_t v7 = [NSString stringWithFormat:@"%@ (not found)", self->_providerDomainID];
    id v4 = objc_msgSend(v5, "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1F2EF71F8, v6, v7, -[FPDXPCDomainServicer pid](self, "pid"));
  }
  return v4;
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(NSString *)self->_providerDomainID fp_toDomainIdentifier];
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__FPDXPCDomainServicer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke;
  block[3] = &unk_1E6A73738;
  block[4] = self;
  id v16 = v8;
  id v18 = v9;
  int64_t v19 = a4;
  id v17 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(requestQueue, block);
}

void __106__FPDXPCDomainServicer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) newFileProviderProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__FPDXPCDomainServicer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6A73710;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  [v2 deleteSearchableItemsWithSpotlightDomainIdentifiers:v3 domainIdentifier:v4 indexReason:v5 completionHandler:v6];
}

void __106__FPDXPCDomainServicer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer deleteSearchableItemsWithSpotlightDomainIdentifiers:indexReason:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __58__FPDXPCDomainServicer_didChangeItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer didChangeItemID:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)resolveItemID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke;
  block[3] = &unk_1E6A73760;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(requestQueue, block);
}

void __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v12];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 defaultBackend];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke_240;
    v8[3] = &unk_1E6A73788;
    void v8[4] = *(void *)(a1 + 32);
    id v7 = &v9;
    id v9 = *(id *)(a1 + 48);
    [v4 URLForItemID:v5 creatingPlaceholderIfMissing:0 ignoreAlternateContentsURL:1 forBookmarkResolution:0 request:v6 completionHandler:v8];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6A73710;
    v10[4] = *(void *)(a1 + 32);
    id v7 = &v11;
    id v11 = *(id *)(a1 + 48);
    uint64_t v4 = FPProviderNotFoundError();
    __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke_2((uint64_t)v10, v4);
  }
}

void __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer resolveItemID:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __56__FPDXPCDomainServicer_resolveItemID_completionHandler___block_invoke_240(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v16 = fpfs_adopt_log();
  __int16 v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = FPPopLogSectionForBlock();
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = [v8 url];
    *(_DWORD *)buf = 134219010;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    __int16 v21 = 2080;
    v22 = "-[FPDXPCDomainServicer resolveItemID:completionHandler:]_block_invoke";
    __int16 v23 = 2112;
    v24 = v15;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  __int16 v12 = [v8 url];
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v7);

  __fp_pop_log();
}

- (void)setDomainEjectable:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke;
  block[3] = &unk_1E6A737B0;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_sync(requestQueue, block);
}

void __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v2 = [*(id *)(a1 + 32) providerOrNilWithReason:&v13];
  if (v2)
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v4 = [*(id *)(a1 + 32) providerDomainID];
    uint64_t v5 = objc_msgSend(v4, "fp_toDomainIdentifier");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke_242;
    v9[3] = &unk_1E6A73710;
    id v6 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v7 = &v10;
    id v10 = v6;
    [v2 setEjectable:v3 forDomainIdentifier:v5 completionHandler:v9];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6A73710;
    id v8 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v7 = &v12;
    id v12 = v8;
    uint64_t v4 = FPProviderNotFoundError();
    __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke_2((uint64_t)v11, v4);
  }
}

void __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer setDomainEjectable:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __61__FPDXPCDomainServicer_setDomainEjectable_completionHandler___block_invoke_242(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained signalProviderChanges];

  id v8 = fpfs_adopt_log();
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = FPPopLogSectionForBlock();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    __int16 v14 = "-[FPDXPCDomainServicer setDomainEjectable:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_debug_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)ingestFromCacheItemWithIdentifier:(id)a3 requestedFields:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  requestQueue = self->_requestQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke;
  v13[3] = &unk_1E6A737D8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(requestQueue, v13);
}

void __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v24];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 defaultBackend];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F25D30]);
      uint64_t v7 = [v3 providerDomainID];
      id v8 = (void *)[v6 initWithProviderDomainID:v7 itemIdentifier:*(void *)(a1 + 40)];

      id v9 = [v3 defaultBackend];
      uint64_t v10 = *(void *)(a1 + 56);
      id v11 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_246;
      v19[3] = &unk_1E6A73710;
      v19[4] = *(void *)(a1 + 32);
      id v20 = *(id *)(a1 + 48);
      [v9 ingestFromCacheItemWithID:v8 requestedFields:v10 request:v11 completionHandler:v19];
    }
    else
    {
      fpfs_adopt_log();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = FPPopLogSectionForBlock();
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = FPNotSupportedError();
        *(_DWORD *)buf = 134218754;
        uint64_t v26 = v16;
        __int16 v27 = 2112;
        uint64_t v28 = v17;
        __int16 v29 = 2080;
        v30 = "-[FPDXPCDomainServicer ingestFromCacheItemWithIdentifier:requestedFields:completionHandler:]_block_invoke";
        __int16 v31 = 2112;
        v32 = v18;
        _os_log_debug_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      uint64_t v14 = *(void *)(a1 + 48);
      id v15 = FPNotSupportedError();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

      __fp_pop_log();
    }
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_2;
    v22[3] = &unk_1E6A73710;
    v22[4] = *(void *)(a1 + 32);
    id v23 = *(id *)(a1 + 48);
    id v12 = FPProviderNotFoundError();
    __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_2((uint64_t)v22, v12);
  }
}

void __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCDomainServicer ingestFromCacheItemWithIdentifier:requestedFields:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __92__FPDXPCDomainServicer_ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_246(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[FPDXPCDomainServicer ingestFromCacheItemWithIdentifier:requestedFields:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)reimportItemsBelowItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E6A73760;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(requestQueue, block);
}

void __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v12];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F25D30]);
    uint64_t v4 = [v2 providerDomainID];
    uint64_t v5 = (void *)[v3 initWithProviderDomainID:v4 itemIdentifier:*(void *)(a1 + 40)];

    id v6 = [v2 defaultBackend];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_247;
    v8[3] = &unk_1E6A73710;
    void v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    [v6 reimportItemsBelowItemWithID:v5 markItemDataless:0 completionHandler:v8];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6A73710;
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    id v7 = FPProviderNotFoundError();
    __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2((uint64_t)v10, v7);
  }
}

void __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer reimportItemsBelowItemWithIdentifier:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __79__FPDXPCDomainServicer_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_247(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer reimportItemsBelowItemWithIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)evictItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E6A73760;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(requestQueue, block);
}

void __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v13];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F25D30]);
    uint64_t v4 = [v2 providerDomainID];
    uint64_t v5 = (void *)[v3 initWithProviderDomainID:v4 itemIdentifier:*(void *)(a1 + 40)];

    id v6 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
    [v6 setProviderInitiated:1];
    id v7 = [v2 defaultBackend];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke_248;
    v9[3] = &unk_1E6A73710;
    v9[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    [v7 evictItemWithID:v5 evictionReason:4 request:v6 completionHandler:v9];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6A73710;
    v11[4] = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 48);
    id v8 = FPProviderNotFoundError();
    __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke_2((uint64_t)v11, v8);
  }
}

void __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer evictItemWithIdentifier:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __66__FPDXPCDomainServicer_evictItemWithIdentifier_completionHandler___block_invoke_248(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer evictItemWithIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)materializeItemWithIdentifier:(id)a3 requestedRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke;
  block[3] = &unk_1E6A73800;
  id v16 = v10;
  NSUInteger v17 = location;
  NSUInteger v18 = length;
  block[4] = self;
  id v15 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_sync(requestQueue, block);
}

void __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v20];
  if (v2)
  {
    if (*(void *)(a1 + 56) == 0x7FFFFFFFFFFFFFFFLL || (fpfs_supports_partial_materialization() & 1) != 0)
    {
      id v3 = objc_alloc(MEMORY[0x1E4F25D30]);
      uint64_t v4 = [v2 providerDomainID];
      uint64_t v5 = (void *)[v3 initWithProviderDomainID:v4 itemIdentifier:*(void *)(a1 + 40)];

      uint64_t v6 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
      [v6 setProviderInitiated:1];
      id v7 = [v2 defaultBackend];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke_249;
      v15[3] = &unk_1E6A73710;
      v15[4] = *(void *)(a1 + 32);
      id v16 = *(id *)(a1 + 48);
      objc_msgSend(v7, "materializeItemWithID:requestedRange:request:completionHandler:", v5, *(void *)(a1 + 56), *(void *)(a1 + 64), v6, v15);
    }
    else
    {
      fpfs_adopt_log();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = FPPopLogSectionForBlock();
        uint64_t v13 = *(void *)(a1 + 32);
        __int16 v14 = FPNotSupportedError();
        *(_DWORD *)buf = 134218754;
        uint64_t v22 = v12;
        __int16 v23 = 2112;
        uint64_t v24 = v13;
        __int16 v25 = 2080;
        uint64_t v26 = "-[FPDXPCDomainServicer materializeItemWithIdentifier:requestedRange:completionHandler:]_block_invoke";
        __int16 v27 = 2112;
        uint64_t v28 = v14;
        _os_log_debug_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = FPNotSupportedError();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

      __fp_pop_log();
    }
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke_2;
    v18[3] = &unk_1E6A73710;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    id v8 = FPProviderNotFoundError();
    __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke_2((uint64_t)v18, v8);
  }
}

void __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer materializeItemWithIdentifier:requestedRange:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __87__FPDXPCDomainServicer_materializeItemWithIdentifier_requestedRange_completionHandler___block_invoke_249(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer materializeItemWithIdentifier:requestedRange:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)enumerateMaterializedSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  requestQueue = self->_requestQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke;
  v13[3] = &unk_1E6A737D8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(requestQueue, v13);
}

void __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v12];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 defaultBackend];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_250;
    v8[3] = &unk_1E6A73828;
    uint64_t v5 = *(void *)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    uint64_t v6 = &v9;
    uint64_t v7 = *(void *)(a1 + 56);
    id v9 = *(id *)(a1 + 48);
    [v4 enumerateMaterializedSetFromSyncAnchor:v5 suggestedBatchSize:v7 completionHandler:v8];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6A73710;
    v10[4] = *(void *)(a1 + 32);
    uint64_t v6 = &v11;
    id v11 = *(id *)(a1 + 48);
    uint64_t v4 = FPProviderNotFoundError();
    __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2((uint64_t)v10, v4);
  }
}

void __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134220034;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer enumerateMaterializedSetFromSyncAnchor:suggestedBatchSize:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
    __int16 v16 = 2112;
    uint64_t v17 = MEMORY[0x1E4F1CBF0];
    __int16 v18 = 1024;
    int v19 = 0;
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    __int16 v22 = 2112;
    uint64_t v23 = 0;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %{BOOL}d, %@, %@, %@", buf, 0x58u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __100__FPDXPCDomainServicer_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_250(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6, void *a7)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v21 = fpfs_adopt_log();
  __int16 v18 = fp_current_or_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = FPPopLogSectionForBlock();
    uint64_t v20 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134220034;
    uint64_t v23 = v19;
    __int16 v24 = 2112;
    uint64_t v25 = v20;
    __int16 v26 = 2080;
    __int16 v27 = "-[FPDXPCDomainServicer enumerateMaterializedSetFromSyncAnchor:suggestedBatchSize:completionHandler:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 1024;
    int v33 = a4;
    __int16 v34 = 2112;
    id v35 = v15;
    __int16 v36 = 2112;
    id v37 = v16;
    __int16 v38 = 2112;
    id v39 = v17;
    _os_log_debug_impl(&dword_1D744C000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %{BOOL}d, %@, %@, %@", buf, 0x58u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)currentMaterializedSetSyncAnchorWithCompletionHandler:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A73878;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(requestQueue, v7);
}

void __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v12];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 defaultBackend];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_252;
    v8[3] = &unk_1E6A73850;
    uint64_t v5 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v6 = &v9;
    id v9 = v5;
    [v4 currentMaterializedSetSyncAnchorWithCompletionHandler:v8];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E6A73710;
    uint64_t v7 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v6 = &v11;
    id v11 = v7;
    id v4 = FPProviderNotFoundError();
    __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_2((uint64_t)v10, v4);
  }
}

void __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock();
    __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_252(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer currentMaterializedSetSyncAnchorWithCompletionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)enumeratePendingSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  requestQueue = self->_requestQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke;
  v13[3] = &unk_1E6A737D8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(requestQueue, v13);
}

void __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v12];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 defaultBackend];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_254;
    v8[3] = &unk_1E6A738A0;
    uint64_t v5 = *(void *)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    uint64_t v6 = &v9;
    uint64_t v7 = *(void *)(a1 + 56);
    id v9 = *(id *)(a1 + 48);
    [v4 enumeratePendingSetFromSyncAnchor:v5 suggestedBatchSize:v7 completionHandler:v8];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6A73710;
    v10[4] = *(void *)(a1 + 32);
    uint64_t v6 = &v11;
    id v11 = *(id *)(a1 + 48);
    id v4 = FPProviderNotFoundError();
    __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2((uint64_t)v10, v4);
  }
}

void __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134220546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer enumeratePendingSetFromSyncAnchor:suggestedBatchSize:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
    __int16 v16 = 2112;
    uint64_t v17 = MEMORY[0x1E4F1CBF0];
    __int16 v18 = 1024;
    int v19 = 0;
    __int16 v20 = 1024;
    int v21 = 0;
    __int16 v22 = 2048;
    uint64_t v23 = 0;
    __int16 v24 = 2112;
    uint64_t v25 = 0;
    __int16 v26 = 2112;
    uint64_t v27 = 0;
    __int16 v28 = 2112;
    id v29 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %{BOOL}d, %{BOOL}d, %lf, %@, %@, %@", buf, 0x68u);
  }

  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.0);
  __fp_pop_log();
}

void __95__FPDXPCDomainServicer_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler___block_invoke_254(uint64_t a1, void *a2, void *a3, int a4, int a5, void *a6, void *a7, void *a8, double a9)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v18 = a3;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  uint64_t v25 = fpfs_adopt_log();
  __int16 v22 = fp_current_or_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = FPPopLogSectionForBlock();
    uint64_t v24 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134220546;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    uint64_t v29 = v24;
    __int16 v30 = 2080;
    id v31 = "-[FPDXPCDomainServicer enumeratePendingSetFromSyncAnchor:suggestedBatchSize:completionHandler:]_block_invoke";
    __int16 v32 = 2112;
    id v33 = v17;
    __int16 v34 = 2112;
    id v35 = v18;
    __int16 v36 = 1024;
    int v37 = a4;
    __int16 v38 = 1024;
    int v39 = a5;
    __int16 v40 = 2048;
    double v41 = a9;
    __int16 v42 = 2112;
    id v43 = v19;
    __int16 v44 = 2112;
    id v45 = v20;
    __int16 v46 = 2112;
    id v47 = v21;
    _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %{BOOL}d, %{BOOL}d, %lf, %@, %@, %@", buf, 0x68u);
  }

  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(a9);
  __fp_pop_log();
}

- (void)currentPendingSetSyncAnchorWithCompletionHandler:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A73878;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(requestQueue, v7);
}

void __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v12];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 defaultBackend];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_256;
    v8[3] = &unk_1E6A738C8;
    uint64_t v5 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v6 = &v9;
    id v9 = v5;
    [v4 currentPendingSetSyncAnchorWithCompletionHandler:v8];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E6A73710;
    uint64_t v7 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v6 = &v11;
    id v11 = v7;
    id v4 = FPProviderNotFoundError();
    __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_2((uint64_t)v10, v4);
  }
}

void __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock();
    __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.0);
  __fp_pop_log();
}

void __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_256(uint64_t a1, int a2, void *a3, double a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v11 = fpfs_adopt_log();
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = FPPopLogSectionForBlock();
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2080;
    id v17 = "-[FPDXPCDomainServicer currentPendingSetSyncAnchorWithCompletionHandler:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = a2;
    __int16 v20 = 2048;
    double v21 = a4;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %lf, %@", buf, 0x3Au);
  }

  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(a4);
  __fp_pop_log();
}

- (void)waitForChangesOnItemsBelowItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E6A73760;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(requestQueue, block);
}

void __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v21];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 defaultBackend];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [v3 defaultBackend];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke_260;
      v16[3] = &unk_1E6A73710;
      v16[4] = *(void *)(a1 + 32);
      id v17 = *(id *)(a1 + 48);
      [v6 waitForChangesOnItemsBelowItemWithIdentifier:v7 request:v8 completionHandler:v16];
    }
    else
    {
      fpfs_adopt_log();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = FPPopLogSectionForBlock();
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = FPNotSupportedError();
        *(_DWORD *)buf = 134218754;
        uint64_t v23 = v13;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        __int16 v26 = 2080;
        uint64_t v27 = "-[FPDXPCDomainServicer waitForChangesOnItemsBelowItemWithIdentifier:completionHandler:]_block_invoke";
        __int16 v28 = 2112;
        uint64_t v29 = v15;
        _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
      }
      uint64_t v11 = *(void *)(a1 + 48);
      id v12 = FPNotSupportedError();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

      __fp_pop_log();
    }
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke_2;
    v19[3] = &unk_1E6A73710;
    v19[4] = *(void *)(a1 + 32);
    id v20 = *(id *)(a1 + 48);
    id v9 = FPProviderNotFoundError();
    __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke_2((uint64_t)v19, v9);
  }
}

void __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer waitForChangesOnItemsBelowItemWithIdentifier:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __87__FPDXPCDomainServicer_waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke_260(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer waitForChangesOnItemsBelowItemWithIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)waitForStabilizationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A73878;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(requestQueue, v7);
}

void __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v13];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 defaultBackend];
    uint64_t v5 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke_261;
    v9[3] = &unk_1E6A73710;
    id v6 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    uint64_t v7 = &v10;
    id v10 = v6;
    [v4 waitForStabilizationForRequest:v5 completionHandler:v9];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E6A73710;
    id v8 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    uint64_t v7 = &v12;
    id v12 = v8;
    id v4 = FPProviderNotFoundError();
    __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke_2((uint64_t)v11, v4);
  }
}

void __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer waitForStabilizationWithCompletionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __66__FPDXPCDomainServicer_waitForStabilizationWithCompletionHandler___block_invoke_261(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer waitForStabilizationWithCompletionHandler:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)signalErrorResolved:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke;
  block[3] = &unk_1E6A73760;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(requestQueue, block);
}

void __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke(id *a1)
{
  uint64_t v16 = 0;
  id v2 = [a1[4] domainOrNil:&v16];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_262;
    block[3] = &unk_1E6A738F0;
    id v10 = v3;
    id v5 = a1[5];
    id v6 = a1[4];
    id v11 = v5;
    id v12 = v6;
    id v13 = a1[6];
    dispatch_async(v4, block);

    id v7 = v10;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_2;
    v14[3] = &unk_1E6A73710;
    v14[4] = a1[4];
    id v15 = a1[6];
    id v8 = FPProviderNotFoundError();
    __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_2((uint64_t)v14, v8);

    id v7 = v15;
  }
}

void __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer signalErrorResolved:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_262(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) defaultBackend];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) defaultBackend];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_2_265;
    v14[3] = &unk_1E6A73710;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(a1 + 56);
    v14[4] = *(void *)(a1 + 48);
    id v15 = v6;
    [v4 signalErrorResolved:v5 completionHandler:v14];
  }
  else
  {
    id v13 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = FPPopLogSectionForBlock();
      uint64_t v11 = *(void *)(a1 + 48);
      __int16 v12 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2080;
      uint64_t v21 = "-[FPDXPCDomainServicer signalErrorResolved:completionHandler:]_block_invoke";
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = FPNotSupportedError();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    __fp_pop_log();
  }
}

void __62__FPDXPCDomainServicer_signalErrorResolved_completionHandler___block_invoke_2_265(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer signalErrorResolved:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)temporaryDirectoryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__FPDXPCDomainServicer_temporaryDirectoryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A73878;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(requestQueue, v7);
}

void __64__FPDXPCDomainServicer_temporaryDirectoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v23];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 volume];
    id v20 = 0;
    uint64_t v5 = [v4 temporaryDirectoryURL:v3 error:&v20];
    id v6 = v20;

    if (v5)
    {
      id v19 = v6;
      id v7 = [MEMORY[0x1E4F25D78] wrapperWithURL:v5 readonly:0 error:&v19];
      id v8 = v19;

      uint64_t v17 = fpfs_adopt_log();
      uint64_t v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = FPPopLogSectionForBlock();
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134219010;
        uint64_t v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        __int16 v28 = 2080;
        uint64_t v29 = "-[FPDXPCDomainServicer temporaryDirectoryWithCompletionHandler:]_block_invoke";
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_debug_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      __fp_pop_log();
    }
    else
    {
      __int16 v18 = fpfs_adopt_log();
      __int16 v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = FPPopLogSectionForBlock();
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134219010;
        uint64_t v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = v16;
        __int16 v28 = 2080;
        uint64_t v29 = "-[FPDXPCDomainServicer temporaryDirectoryWithCompletionHandler:]_block_invoke";
        __int16 v30 = 2112;
        id v31 = 0;
        __int16 v32 = 2112;
        id v33 = v6;
        _os_log_debug_impl(&dword_1D744C000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      __fp_pop_log();

      id v8 = v6;
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__FPDXPCDomainServicer_temporaryDirectoryWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E6A73710;
    __int16 v10 = *(void **)(a1 + 40);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v10;
    uint64_t v11 = FPProviderNotFoundError();
    __64__FPDXPCDomainServicer_temporaryDirectoryWithCompletionHandler___block_invoke_2((uint64_t)v21, v11);
  }
}

void __64__FPDXPCDomainServicer_temporaryDirectoryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer temporaryDirectoryWithCompletionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)stateDirectoryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__FPDXPCDomainServicer_stateDirectoryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A73878;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(requestQueue, v7);
}

void __60__FPDXPCDomainServicer_stateDirectoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v23];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 volume];
    id v20 = 0;
    uint64_t v5 = [v4 stateDirectoryURL:v3 error:&v20];
    id v6 = v20;

    if (v5)
    {
      id v19 = v6;
      id v7 = [MEMORY[0x1E4F25D78] wrapperWithURL:v5 readonly:0 error:&v19];
      id v8 = v19;

      id v17 = fpfs_adopt_log();
      uint64_t v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = FPPopLogSectionForBlock();
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134219010;
        uint64_t v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        __int16 v28 = 2080;
        uint64_t v29 = "-[FPDXPCDomainServicer stateDirectoryWithCompletionHandler:]_block_invoke";
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_debug_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      __fp_pop_log();
    }
    else
    {
      uint64_t v18 = fpfs_adopt_log();
      __int16 v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = FPPopLogSectionForBlock();
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134219010;
        uint64_t v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = v16;
        __int16 v28 = 2080;
        uint64_t v29 = "-[FPDXPCDomainServicer stateDirectoryWithCompletionHandler:]_block_invoke";
        __int16 v30 = 2112;
        id v31 = 0;
        __int16 v32 = 2112;
        id v33 = v6;
        _os_log_debug_impl(&dword_1D744C000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      __fp_pop_log();

      id v8 = v6;
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__FPDXPCDomainServicer_stateDirectoryWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E6A73710;
    __int16 v10 = *(void **)(a1 + 40);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v10;
    uint64_t v11 = FPProviderNotFoundError();
    __60__FPDXPCDomainServicer_stateDirectoryWithCompletionHandler___block_invoke_2((uint64_t)v21, v11);
  }
}

void __60__FPDXPCDomainServicer_stateDirectoryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer stateDirectoryWithCompletionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)listAvailableTestingOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A73878;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(requestQueue, v7);
}

void __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v34];
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    v45[0] = *MEMORY[0x1E4F25E50];
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    char v5 = objc_msgSend(WeakRetained, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v4, 0, 2);

    if (v5)
    {
      id v6 = [v2 nsDomain];
      BOOL v7 = ([v6 testingModes] & 2) == 0;

      if (v7)
      {
        fpfs_adopt_log();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = fp_current_or_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v23 = FPPopLogSectionForBlock();
          uint64_t v24 = *(void *)(a1 + 32);
          uint64_t v25 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v36 = v23;
          __int16 v37 = 2112;
          uint64_t v38 = v24;
          __int16 v39 = 2080;
          __int16 v40 = "-[FPDXPCDomainServicer listAvailableTestingOperationsWithCompletionHandler:]_block_invoke";
          __int16 v41 = 2112;
          uint64_t v42 = 0;
          __int16 v43 = 2112;
          __int16 v44 = v25;
          _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
      }
      else
      {
        __int16 v16 = [v2 defaultBackend];
        int v17 = objc_opt_respondsToSelector();

        if (v17)
        {
          uint64_t v18 = [v2 defaultBackend];
          id v19 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke_270;
          v29[3] = &unk_1E6A73918;
          v29[4] = *(void *)(a1 + 32);
          id v30 = *(id *)(a1 + 40);
          [v18 listAvailableTestingOperationsWithRequest:v19 completionHandler:v29];

          goto LABEL_11;
        }
        fpfs_adopt_log();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = fp_current_or_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = FPPopLogSectionForBlock();
          uint64_t v27 = *(void *)(a1 + 32);
          __int16 v28 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v36 = v26;
          __int16 v37 = 2112;
          uint64_t v38 = v27;
          __int16 v39 = 2080;
          __int16 v40 = "-[FPDXPCDomainServicer listAvailableTestingOperationsWithCompletionHandler:]_block_invoke";
          __int16 v41 = 2112;
          uint64_t v42 = 0;
          __int16 v43 = 2112;
          __int16 v44 = v28;
          _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
      }

      uint64_t v9 = *(void *)(a1 + 40);
      __int16 v10 = FPNotSupportedError();
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

      __fp_pop_log();
    }
    else
    {
      fpfs_adopt_log();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = FPPopLogSectionForBlock();
        uint64_t v21 = *(void *)(a1 + 32);
        id v22 = FPNotPermittedError();
        *(_DWORD *)buf = 134219010;
        uint64_t v36 = v20;
        __int16 v37 = 2112;
        uint64_t v38 = v21;
        __int16 v39 = 2080;
        __int16 v40 = "-[FPDXPCDomainServicer listAvailableTestingOperationsWithCompletionHandler:]_block_invoke";
        __int16 v41 = 2112;
        uint64_t v42 = 0;
        __int16 v43 = 2112;
        __int16 v44 = v22;
        _os_log_debug_impl(&dword_1D744C000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = FPNotPermittedError();
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);

      __fp_pop_log();
    }
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke_2;
    v32[3] = &unk_1E6A73710;
    uint64_t v11 = *(void **)(a1 + 40);
    v32[4] = *(void *)(a1 + 32);
    id v33 = v11;
    __int16 v12 = FPProviderNotFoundError();
    __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke_2((uint64_t)v32, v12);
  }
LABEL_11:
}

void __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer listAvailableTestingOperationsWithCompletionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __76__FPDXPCDomainServicer_listAvailableTestingOperationsWithCompletionHandler___block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  BOOL v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCDomainServicer listAvailableTestingOperationsWithCompletionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)runTestingOperations:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke;
  block[3] = &unk_1E6A73760;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(requestQueue, block);
}

void __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke(uint64_t a1)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v34];
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    v45[0] = *MEMORY[0x1E4F25E50];
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    char v5 = objc_msgSend(WeakRetained, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v4, 0, 2);

    if (v5)
    {
      id v6 = [v2 nsDomain];
      BOOL v7 = ([v6 testingModes] & 2) == 0;

      if (v7)
      {
        fpfs_adopt_log();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = fp_current_or_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v23 = FPPopLogSectionForBlock();
          uint64_t v24 = *(void *)(a1 + 32);
          uint64_t v25 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v36 = v23;
          __int16 v37 = 2112;
          uint64_t v38 = v24;
          __int16 v39 = 2080;
          __int16 v40 = "-[FPDXPCDomainServicer runTestingOperations:completionHandler:]_block_invoke";
          __int16 v41 = 2112;
          uint64_t v42 = 0;
          __int16 v43 = 2112;
          __int16 v44 = v25;
          _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
      }
      else
      {
        __int16 v15 = [v2 defaultBackend];
        int v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          __int16 v17 = [v2 defaultBackend];
          uint64_t v18 = *(void *)(a1 + 40);
          __int16 v19 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke_274;
          v29[3] = &unk_1E6A73940;
          v29[4] = *(void *)(a1 + 32);
          id v30 = *(id *)(a1 + 48);
          [v17 runTestingOperations:v18 request:v19 completionHandler:v29];

          goto LABEL_11;
        }
        fpfs_adopt_log();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = fp_current_or_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = FPPopLogSectionForBlock();
          uint64_t v27 = *(void *)(a1 + 32);
          __int16 v28 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v36 = v26;
          __int16 v37 = 2112;
          uint64_t v38 = v27;
          __int16 v39 = 2080;
          __int16 v40 = "-[FPDXPCDomainServicer runTestingOperations:completionHandler:]_block_invoke";
          __int16 v41 = 2112;
          uint64_t v42 = 0;
          __int16 v43 = 2112;
          __int16 v44 = v28;
          _os_log_debug_impl(&dword_1D744C000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
      }

      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = FPNotSupportedError();
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

      __fp_pop_log();
    }
    else
    {
      fpfs_adopt_log();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = FPPopLogSectionForBlock();
        uint64_t v21 = *(void *)(a1 + 32);
        id v22 = FPNotPermittedError();
        *(_DWORD *)buf = 134219010;
        uint64_t v36 = v20;
        __int16 v37 = 2112;
        uint64_t v38 = v21;
        __int16 v39 = 2080;
        __int16 v40 = "-[FPDXPCDomainServicer runTestingOperations:completionHandler:]_block_invoke";
        __int16 v41 = 2112;
        uint64_t v42 = 0;
        __int16 v43 = 2112;
        __int16 v44 = v22;
        _os_log_debug_impl(&dword_1D744C000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = FPNotPermittedError();
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);

      __fp_pop_log();
    }
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke_2;
    v32[3] = &unk_1E6A73710;
    v32[4] = *(void *)(a1 + 32);
    id v33 = *(id *)(a1 + 48);
    uint64_t v11 = FPProviderNotFoundError();
    __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke_2((uint64_t)v32, v11);
  }
LABEL_11:
}

void __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[FPDXPCDomainServicer runTestingOperations:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __63__FPDXPCDomainServicer_runTestingOperations_completionHandler___block_invoke_274(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  BOOL v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCDomainServicer runTestingOperations:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (void)subscribeToUploadProgressUpdates:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke;
  block[3] = &unk_1E6A73760;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(requestQueue, block);
}

void __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke(id *a1)
{
  uint64_t v16 = 0;
  id v2 = [a1[4] domainOrNil:&v16];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_276;
    block[3] = &unk_1E6A738F0;
    id v10 = v3;
    id v5 = a1[5];
    id v6 = a1[4];
    id v11 = v5;
    id v12 = v6;
    id v13 = a1[6];
    dispatch_async(v4, block);

    id v7 = v10;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_2;
    v14[3] = &unk_1E6A73710;
    v14[4] = a1[4];
    id v15 = a1[6];
    uint64_t v8 = FPProviderNotFoundError();
    __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_2((uint64_t)v14, v8);

    id v7 = v15;
  }
}

void __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer subscribeToUploadProgressUpdates:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_276(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) defaultBackend];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) defaultBackend];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_2_279;
    v14[3] = &unk_1E6A73968;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(a1 + 56);
    v14[4] = *(void *)(a1 + 48);
    id v16 = v6;
    id v15 = *(id *)(a1 + 40);
    [v4 subscribeToUploadProgressUpdates:v5 completionHandler:v14];
  }
  else
  {
    id v13 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = FPPopLogSectionForBlock();
      uint64_t v11 = *(void *)(a1 + 48);
      __int16 v12 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      id v22 = "-[FPDXPCDomainServicer subscribeToUploadProgressUpdates:completionHandler:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = FPNotSupportedError();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    __fp_pop_log();
  }
}

void __75__FPDXPCDomainServicer_subscribeToUploadProgressUpdates_completionHandler___block_invoke_2_279(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v7 = fpfs_adopt_log();
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = FPPopLogSectionForBlock();
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      id v13 = "-[FPDXPCDomainServicer subscribeToUploadProgressUpdates:completionHandler:]_block_invoke_2";
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    __fp_pop_log();
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
  }
}

- (void)subscribeToDownloadProgressUpdates:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke;
  block[3] = &unk_1E6A73760;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(requestQueue, block);
}

void __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke(id *a1)
{
  uint64_t v16 = 0;
  id v2 = [a1[4] domainOrNil:&v16];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_280;
    block[3] = &unk_1E6A738F0;
    id v10 = v3;
    id v5 = a1[5];
    id v6 = a1[4];
    id v11 = v5;
    id v12 = v6;
    id v13 = a1[6];
    dispatch_async(v4, block);

    id v7 = v10;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_2;
    v14[3] = &unk_1E6A73710;
    v14[4] = a1[4];
    id v15 = a1[6];
    uint64_t v8 = FPProviderNotFoundError();
    __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_2((uint64_t)v14, v8);

    id v7 = v15;
  }
}

void __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer subscribeToDownloadProgressUpdates:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_280(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) defaultBackend];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) defaultBackend];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_2_283;
    v14[3] = &unk_1E6A73968;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(a1 + 56);
    v14[4] = *(void *)(a1 + 48);
    id v16 = v6;
    id v15 = *(id *)(a1 + 40);
    [v4 subscribeToDownloadProgressUpdates:v5 completionHandler:v14];
  }
  else
  {
    id v13 = fpfs_adopt_log();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = FPPopLogSectionForBlock();
      uint64_t v11 = *(void *)(a1 + 48);
      __int16 v12 = FPNotSupportedError();
      *(_DWORD *)buf = 134218754;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      id v22 = "-[FPDXPCDomainServicer subscribeToDownloadProgressUpdates:completionHandler:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = FPNotSupportedError();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    __fp_pop_log();
  }
}

void __77__FPDXPCDomainServicer_subscribeToDownloadProgressUpdates_completionHandler___block_invoke_2_283(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v7 = fpfs_adopt_log();
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = FPPopLogSectionForBlock();
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      id v13 = "-[FPDXPCDomainServicer subscribeToDownloadProgressUpdates:completionHandler:]_block_invoke_2";
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    __fp_pop_log();
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  }
}

- (void)startAccessingServiceWithName:(id)a3 itemID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  requestQueue = self->_requestQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke;
  v15[3] = &unk_1E6A739E0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_sync(requestQueue, v15);
}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v15];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 defaultBackend];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", [*(id *)(a1 + 32) pid]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_284;
    v9[3] = &unk_1E6A739B8;
    v9[4] = *(void *)(a1 + 32);
    id v7 = &v12;
    id v12 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    id v11 = v3;
    [v4 fetchServicesForItemID:v5 allowRestrictedSources:1 request:v6 completionHandler:v9];

    id v8 = v10;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_2;
    v13[3] = &unk_1E6A73710;
    v13[4] = *(void *)(a1 + 32);
    id v7 = &v14;
    id v14 = *(id *)(a1 + 56);
    id v8 = FPProviderNotFoundError();
    __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_2((uint64_t)v13, v8);
  }
}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer startAccessingServiceWithName:itemID:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_284(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = v9;
  if (v7)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = [*(id *)(*((void *)&v35 + 1) + 8 * i) serviceName];
          int v16 = [v15 isEqualToString:*(void *)(a1 + 40)];

          if (v16)
          {
            __int16 v18 = objc_opt_new();
            objc_msgSend(v18, "setRequestEffectivePID:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestEffectivePID"));
            id v19 = NSString;
            uint64_t v20 = *(void *)(a1 + 40);
            [*(id *)(*(void *)(a1 + 32) + 56) requestEffectivePID];
            __int16 v21 = FPExecutableNameForProcessIdentifier();
            id v22 = [v19 stringWithFormat:@"service %@ for %@[%u]", v20, v21, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestEffectivePID")];
            [v18 setPrettyDescription:v22];

            id location = 0;
            __int16 v23 = [*(id *)(a1 + 48) session];
            objc_initWeak(&location, v23);

            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_292;
            v33[3] = &unk_1E6A73990;
            objc_copyWeak(&v34, &location);
            [v18 setStopBlock:v33];
            if (!v18) {
              __assert_rtn("-[FPDXPCDomainServicer startAccessingServiceWithName:itemID:completionHandler:]_block_invoke_2", "FPDXPCDomainServicer.m", 692, "extender");
            }
            uint64_t v24 = [*(id *)(a1 + 48) session];
            [v24 registerLifetimeExtensionForObject:v18];

            __int16 v32 = fpfs_adopt_log();
            uint64_t v25 = fp_current_or_default_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v28 = FPPopLogSectionForBlock();
              uint64_t v29 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 134219266;
              uint64_t v42 = v28;
              __int16 v43 = 2112;
              uint64_t v44 = v29;
              __int16 v45 = 2080;
              __int16 v46 = "-[FPDXPCDomainServicer startAccessingServiceWithName:itemID:completionHandler:]_block_invoke_2";
              __int16 v47 = 2112;
              id v48 = v7;
              __int16 v49 = 2112;
              v50 = v18;
              __int16 v51 = 2112;
              v52 = 0;
              _os_log_debug_impl(&dword_1D744C000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
            }

            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            __fp_pop_log();

            objc_destroyWeak(&v34);
            objc_destroyWeak(&location);

            goto LABEL_24;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    fpfs_adopt_log();
    id location = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_284_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
  else
  {
    if (!v9)
    {
      uint64_t v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_284_cold_1(v26);
      }

      __int16 v10 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"error");
    }
    fpfs_adopt_log();
    id location = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = FPPopLogSectionForBlock();
      uint64_t v31 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      uint64_t v42 = v30;
      __int16 v43 = 2112;
      uint64_t v44 = v31;
      __int16 v45 = 2080;
      __int16 v46 = "-[FPDXPCDomainServicer startAccessingServiceWithName:itemID:completionHandler:]_block_invoke";
      __int16 v47 = 2112;
      id v48 = 0;
      __int16 v49 = 2112;
      v50 = 0;
      __int16 v51 = 2112;
      v52 = v10;
      _os_log_debug_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __fp_pop_log();
  }
LABEL_24:
}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_292(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained unregisterLifetimeExtensionForObject:v3];
}

- (void)getDiagnosticAttributesForItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke;
  block[3] = &unk_1E6A73760;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(requestQueue, block);
}

void __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke(uint64_t a1)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  id v2 = [*(id *)(a1 + 32) domainOrNil:&v28];
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    v39[0] = *MEMORY[0x1E4F25E28];
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    char v5 = objc_msgSend(WeakRetained, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v4, 0, 2);

    if (v5)
    {
      id v6 = [v2 defaultBackend];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = [v2 defaultBackend];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke_299;
        v23[3] = &unk_1E6A73918;
        uint64_t v9 = *(void *)(a1 + 40);
        v23[4] = *(void *)(a1 + 32);
        id v24 = *(id *)(a1 + 48);
        [v8 getDiagnosticAttributesForItems:v9 completionHandler:v23];
      }
      else
      {
        fpfs_adopt_log();
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v14 = fp_current_or_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = FPPopLogSectionForBlock();
          uint64_t v21 = *(void *)(a1 + 32);
          id v22 = FPNotSupportedError();
          *(_DWORD *)buf = 134219010;
          uint64_t v30 = v20;
          __int16 v31 = 2112;
          uint64_t v32 = v21;
          __int16 v33 = 2080;
          id v34 = "-[FPDXPCDomainServicer getDiagnosticAttributesForItems:completionHandler:]_block_invoke";
          __int16 v35 = 2112;
          uint64_t v36 = 0;
          __int16 v37 = 2112;
          long long v38 = v22;
          _os_log_debug_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        uint64_t v15 = *(void *)(a1 + 48);
        int v16 = FPNotSupportedError();
        (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = FPPopLogSectionForBlock();
        uint64_t v18 = *(void *)(a1 + 32);
        id v19 = FPNotPermittedError();
        *(_DWORD *)buf = 134219010;
        uint64_t v30 = v17;
        __int16 v31 = 2112;
        uint64_t v32 = v18;
        __int16 v33 = 2080;
        id v34 = "-[FPDXPCDomainServicer getDiagnosticAttributesForItems:completionHandler:]_block_invoke";
        __int16 v35 = 2112;
        uint64_t v36 = 0;
        __int16 v37 = 2112;
        long long v38 = v19;
        _os_log_debug_impl(&dword_1D744C000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }
      uint64_t v12 = *(void *)(a1 + 48);
      id v13 = FPNotPermittedError();
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);

      __fp_pop_log();
    }
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke_2;
    v26[3] = &unk_1E6A73710;
    v26[4] = *(void *)(a1 + 32);
    id v27 = *(id *)(a1 + 48);
    id v10 = FPProviderNotFoundError();
    __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke_2((uint64_t)v26, v10);
  }
}

void __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v7 = fpfs_adopt_log();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = FPPopLogSectionForBlock();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = "-[FPDXPCDomainServicer getDiagnosticAttributesForItems:completionHandler:]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

void __74__FPDXPCDomainServicer_getDiagnosticAttributesForItems_completionHandler___block_invoke_299(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = fpfs_adopt_log();
  char v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = FPPopLogSectionForBlock();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[FPDXPCDomainServicer getDiagnosticAttributesForItems:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __fp_pop_log();
}

- (FPProgressProtocol)uploadProxy
{
  return self->_uploadProxy;
}

- (void)setUploadProxy:(id)a3
{
}

- (FPProgressProtocol)downloadProxy
{
  return self->_downloadProxy;
}

- (void)setDownloadProxy:(id)a3
{
}

void __78__FPDXPCDomainServicer_currentMaterializedSetSyncAnchorWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8523e-34, v0, v1, v2);
  *(void *)(v3 + 24) = "-[FPDXPCDomainServicer currentMaterializedSetSyncAnchorWithCompletionHandler:]_block_invoke_2";
  *(_WORD *)(v3 + 32) = v4;
  *(void *)(v3 + 34) = 0;
  _os_log_debug_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, 0x2Au);
}

void __73__FPDXPCDomainServicer_currentPendingSetSyncAnchorWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8526e-34, v0, v1, v2);
  *(void *)(v3 + 24) = "-[FPDXPCDomainServicer currentPendingSetSyncAnchorWithCompletionHandler:]_block_invoke_2";
  *(_WORD *)(v3 + 32) = 1024;
  *(_DWORD *)(v3 + 34) = 0;
  *(_WORD *)(v3 + 38) = 2048;
  *(void *)(v3 + 40) = 0;
  *(_WORD *)(v3 + 48) = v4;
  *(void *)(v3 + 50) = 0;
  _os_log_debug_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %lf, %@", v5, 0x3Au);
}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_284_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] there should be an error specified", v1, 2u);
}

void __79__FPDXPCDomainServicer_startAccessingServiceWithName_itemID_completionHandler___block_invoke_284_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(3.8526e-34, v0, v1, v2);
  *(void *)(v3 + 24) = "-[FPDXPCDomainServicer startAccessingServiceWithName:itemID:completionHandler:]_block_invoke";
  *(_WORD *)(v3 + 32) = v4;
  *(void *)(v3 + 34) = 0;
  *(_WORD *)(v3 + 42) = v4;
  *(void *)(v3 + 44) = 0;
  *(_WORD *)(v3 + 52) = v4;
  *(void *)(v3 + 54) = 0;
  _os_log_debug_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", v5, 0x3Eu);
}

@end