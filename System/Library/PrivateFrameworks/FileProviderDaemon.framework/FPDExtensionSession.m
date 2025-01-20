@interface FPDExtensionSession
- (BOOL)_setUpConnectionWithError:(id *)a3;
- (BOOL)_setUpEXConnectionWithError:(id *)a3;
- (BOOL)_setUpPKConnectionWithError:(id *)a3;
- (BOOL)hasFileProviderAttributionMDMAccess;
- (BOOL)terminateExtensionWithReason:(id)a3 error:(id *)a4;
- (FPDExtensionSession)initWithDomain:(id)a3 extension:(id)a4 queue:(id)a5;
- (NSString)description;
- (id)_alternateContentsDictionary;
- (id)_connectionWithError:(id *)a3;
- (id)existingFileProviderProxyWithTimeout:(double)a3 onlyAlreadyLifetimeExtended:(BOOL)a4 pid:(int)a5;
- (id)newAssertionWithAttributeName:(id)a3 reason:(id)a4;
- (id)newBackgroundAssertion;
- (id)newFileProviderProxyWithTimeout:(double)a3 pid:(int)a4;
- (id)newFileProviderProxyWithTimeoutValue:(double)a3 pid:(int)a4 createIfNeeded:(BOOL)a5;
- (id)newForegroundAssertion;
- (int)test_pid;
- (void)__invalidate;
- (void)_evaluateExtensionForegroundness;
- (void)_invalidate;
- (void)_invalidateExtensionIfPossible;
- (void)_networkingGracePeriodOver;
- (void)_notifyNetworkingProviderMonitorWithState:(BOOL)a3;
- (void)_unregisterLifetimeExtensionForObject:(id)a3;
- (void)assertionWasInvalidated:(id)a3;
- (void)asyncUnregisterLifetimeExtensionForObject:(id)a3;
- (void)cancelAsync;
- (void)dealloc;
- (void)dumpStateTo:(id)a3;
- (void)invalidate;
- (void)processMonitor:(id)a3 didBecomeForeground:(BOOL)a4;
- (void)registerLifetimeExtensionForObject:(id)a3;
- (void)start;
- (void)terminateWithReason:(id)a3;
- (void)unregisterLifetimeExtensionForObject:(id)a3;
@end

@implementation FPDExtensionSession

- (void)_evaluateExtensionForegroundness
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx evaluating extension foregroundness", v2, v3, v4, v5, v6);
}

- (void)_notifyNetworkingProviderMonitorWithState:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  uint64_t v5 = [(NSString *)self->_providerIdentifier stringByAppendingString:@".foreground"];
  uint8_t v6 = objc_msgSend(v5, "fp_libnotifyPerUserNotificationName");

  unsigned int notifyTokenForFramework = self->_notifyTokenForFramework;
  p_unsigned int notifyTokenForFramework = &self->_notifyTokenForFramework;
  uint64_t v8 = notifyTokenForFramework;
  if (notifyTokenForFramework != -1) {
    goto LABEL_2;
  }
  uint64_t v13 = [v6 UTF8String];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v14 = (unsigned int (*)(uint64_t, int *))getbrc_notify_register_checkSymbolLoc_ptr;
  v19 = getbrc_notify_register_checkSymbolLoc_ptr;
  if (!getbrc_notify_register_checkSymbolLoc_ptr)
  {
    v15 = (void *)CloudDocsLibrary();
    v17[3] = (uint64_t)dlsym(v15, "brc_notify_register_check");
    getbrc_notify_register_checkSymbolLoc_ptr = (_UNKNOWN *)v17[3];
    v14 = (unsigned int (*)(uint64_t, int *))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v14) {
    -[FPDExtensionSession _notifyNetworkingProviderMonitorWithState:]();
  }
  if (!v14(v13, p_notifyTokenForFramework))
  {
    uint64_t v8 = *p_notifyTokenForFramework;
LABEL_2:
    uint64_t v10 = [v6 UTF8String];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    v11 = (void (*)(uint64_t, BOOL, uint64_t))getbrc_notify_set_state_and_postSymbolLoc_ptr;
    v19 = getbrc_notify_set_state_and_postSymbolLoc_ptr;
    if (!getbrc_notify_set_state_and_postSymbolLoc_ptr)
    {
      v12 = (void *)CloudDocsLibrary();
      v17[3] = (uint64_t)dlsym(v12, "brc_notify_set_state_and_post");
      getbrc_notify_set_state_and_postSymbolLoc_ptr = (_UNKNOWN *)v17[3];
      v11 = (void (*)(uint64_t, BOOL, uint64_t))v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v11) {
      -[FPDExtensionSession _notifyNetworkingProviderMonitorWithState:]();
    }
    v11(v8, v3, v10);
  }
}

- (id)newAssertionWithAttributeName:(id)a3 reason:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int IsEnabled = FPFeatureFlagHelenaIsEnabled();
  v9 = fp_current_or_default_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (IsEnabled)
  {
    if (v10)
    {
      sessionProcess = self->_sessionProcess;
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v6;
      __int16 v28 = 2112;
      *(void *)v29 = sessionProcess;
      *(_WORD *)&v29[8] = 2112;
      *(void *)&v29[10] = v7;
      _os_log_debug_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] creating a new assertion %@ for %@ (%@)", location, 0x20u);
    }

    uint64_t v11 = [MEMORY[0x1E4F96478] targetWithProcessIdentifier:self->_sessionProcess];
  }
  else
  {
    if (v10)
    {
      int pid = self->_pid;
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v6;
      __int16 v28 = 1024;
      *(_DWORD *)v29 = pid;
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v7;
      _os_log_debug_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] creating a new assertion %@ for %u (%@)", location, 0x1Cu);
    }

    uint64_t v11 = [MEMORY[0x1E4F96478] targetWithPid:self->_pid];
  }
  v12 = (void *)v11;
  id v13 = objc_alloc(MEMORY[0x1E4F96318]);
  uint64_t v14 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.FileProvider" name:v6];
  uint64_t v26 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  uint64_t v16 = (void *)[v13 initWithExplanation:v7 target:v12 attributes:v15];

  *(void *)location = 0;
  objc_initWeak((id *)location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__FPDExtensionSession_newAssertionWithAttributeName_reason___block_invoke;
  v24[3] = &unk_1E6A76D18;
  objc_copyWeak(&v25, (id *)location);
  [v16 setInvalidationHandler:v24];
  id v23 = 0;
  LOBYTE(v14) = [v16 acquireWithError:&v23];
  id v17 = v23;
  if (v14)
  {
    id v18 = v16;
  }
  else
  {
    v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FPDExtensionSession newAssertionWithAttributeName:reason:]();
    }

    id v18 = 0;
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)location);

  return v18;
}

- (void)processMonitor:(id)a3 didBecomeForeground:(BOOL)a4
{
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__FPDExtensionSession_processMonitor_didBecomeForeground___block_invoke;
  v5[3] = &unk_1E6A74938;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(sessionQueue, v5);
}

- (id)newForegroundAssertion
{
  return [(FPDExtensionSession *)self newAssertionWithAttributeName:@"FileProviderForeground" reason:@"foreground assertion from fileproviderd"];
}

- (id)newBackgroundAssertion
{
  return [(FPDExtensionSession *)self newAssertionWithAttributeName:@"FileProviderBackground" reason:@"background assertion from fileproviderd"];
}

uint64_t __65__FPDExtensionSession_asyncUnregisterLifetimeExtensionForObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterLifetimeExtensionForObject:*(void *)(a1 + 40)];
}

uint64_t __60__FPDExtensionSession_unregisterLifetimeExtensionForObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterLifetimeExtensionForObject:*(void *)(a1 + 40)];
}

- (void)_unregisterLifetimeExtensionForObject:(id)a3
{
  id v4 = a3;
  id v7 = fpfs_adopt_log();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(NSMapTable *)v5->_lifetimeExtenders objectForKey:v4];
  [(NSMapTable *)v5->_lifetimeExtenders removeObjectForKey:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 suppress];
    }
    -[FPDProcessMonitor removePIDToObserve:](v5->_processMonitor, "removePIDToObserve:", [v4 requestEffectivePID]);
  }
  [(FPDExtensionSession *)v5 _invalidateExtensionIfPossible];

  __fp_pop_log();
}

id __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  fpfs_adopt_log();
  id location = 0;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_3;
  v24[3] = &unk_1E6A76C08;
  objc_copyWeak(v26, &location);
  v26[1] = a3;
  id v25 = *(id *)(a1 + 40);
  v9 = (void *)MEMORY[0x1D9471EC0](v24);
  BOOL v10 = [[_FPDExtensionRequestRecord alloc] initWithSelector:a3 proxy:v7 timeout:*(void *)(*(void *)(a1 + 32) + 16) queue:*(void *)(*(void *)(a1 + 32) + 96) log:v9 timeoutHandler:*(double *)(a1 + 56)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v13 = *(id *)(a1 + 32);
  objc_sync_enter(v13);
  [*(id *)(*(void *)(a1 + 32) + 56) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v8];
  objc_sync_exit(v13);

  LODWORD(v13) = *(_DWORD *)(a1 + 72);
  if (v13 != [v7 requestEffectivePid])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "addPIDToObserveSync:", objc_msgSend(v7, "requestEffectivePid"));
    if (*(int *)(a1 + 72) >= 1) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "removePIDToObserve:");
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "addPIDToObserve:", objc_msgSend(v7, "requestEffectivePid"));
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_251;
  v20[3] = &unk_1E6A76C58;
  uint64_t v14 = *(void *)(a1 + 48);
  v20[4] = *(void *)(a1 + 32);
  id v21 = v8;
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v22 = v14;
  uint64_t v23 = v15;
  id v16 = v8;
  id v17 = (void *)MEMORY[0x1D9471EC0](v20);
  id v18 = (void *)MEMORY[0x1D9471EC0]();

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  __fp_pop_log();

  return v18;
}

void __58__FPDExtensionSession_registerLifetimeExtensionForObject___block_invoke(uint64_t a1)
{
  fpfs_adopt_log();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 104) suppress];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([*(id *)(a1 + 40) timeout], v2 > 0.0))
  {
    id location = 0;
    objc_initWeak(&location, *(id *)(a1 + 40));
    id from = 0;
    objc_initWeak(&from, *(id *)(a1 + 32));
    id v3 = objc_alloc(MEMORY[0x1E4F25D10]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__FPDExtensionSession_registerLifetimeExtensionForObject___block_invoke_2;
    v7[3] = &unk_1E6A74518;
    objc_copyWeak(&v8, &location);
    objc_copyWeak(&v9, &from);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    [*(id *)(a1 + 40) timeout];
    uint64_t v5 = (__CFString *)objc_msgSend(v3, "initWithAction:callbackQueue:delay:", v7, v4);
    [(__CFString *)v5 arm];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v5 = @"lifetime extender without timeout";
  }
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v5 forKey:*(void *)(a1 + 40)];
  objc_sync_exit(v6);

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "addPIDToObserve:", objc_msgSend(*(id *)(a1 + 40), "requestEffectivePID"));
  __fp_pop_log();
}

- (void)_invalidateExtensionIfPossible
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] Terminating %@ because we only have inflight requests that timed out", v2, v3, v4, v5, v6);
}

void __53__FPDExtensionSession__invalidateExtensionIfPossible__block_invoke(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint8_t v6 = [v5 proxy];

  if (v6)
  {
    id v7 = [v5 proxy];
    uint64_t v8 = [v7 timeoutState];

    if (v8 == 2) {
      uint64_t v9 = a1[5];
    }
    else {
      uint64_t v9 = a1[6];
    }
    *(unsigned char *)(*(void *)(v9 + 8) + 24) = 1;
  }
  else
  {
    [*(id *)(a1[4] + 56) removeObjectForKey:v10];
  }
}

- (id)newFileProviderProxyWithTimeoutValue:(double)a3 pid:(int)a4 createIfNeeded:(BOOL)a5
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__18;
  uint64_t v15 = __Block_byref_object_dispose__18;
  id v16 = 0;
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke;
  block[3] = &unk_1E6A76CD0;
  BOOL v10 = a5;
  block[4] = self;
  block[5] = &v11;
  int v9 = a4;
  *(double *)&block[6] = a3;
  block[7] = a2;
  dispatch_sync(sessionQueue, block);
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)newFileProviderProxyWithTimeout:(double)a3 pid:(int)a4
{
  return [(FPDExtensionSession *)self newFileProviderProxyWithTimeoutValue:*(void *)&a4 pid:1 createIfNeeded:a3];
}

- (id)_alternateContentsDictionary
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fpdExtension);
  uint64_t v4 = [WeakRetained manager];
  id v5 = [v4 alternateContentsDictionaryForProviderIdentifier:self->_providerIdentifier];

  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v24;
    *(void *)&long long v9 = 138412546;
    long long v19 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v7, "objectForKeyedSubscript:", v13, v19);
        id v22 = 0;
        uint64_t v15 = [MEMORY[0x1E4F25D78] wrapperWithURL:v14 extensionClass:"com.apple.fileprovider.read-write" error:&v22];
        id v16 = v22;
        if (v15)
        {
          [v6 setObject:v15 forKeyedSubscript:v13];
        }
        else
        {
          id v17 = fp_current_or_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v21 = objc_msgSend(v14, "fp_shortDescription");
            v20 = objc_msgSend(v16, "fp_prettyDescription");
            *(_DWORD *)buf = v19;
            id v28 = v21;
            __int16 v29 = 2112;
            uint64_t v30 = v20;
            _os_log_error_impl(&dword_1D744C000, v17, OS_LOG_TYPE_ERROR, "[ERROR] couldn't get a URL wrapper for URL %@: %@ - this means iWork forgot to remove the alternate URL", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v10);
  }

  return v6;
}

- (BOOL)_setUpEXConnectionWithError:(id *)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v6 = [WeakRetained provider];
  id v7 = [v6 descriptor];
  uint64_t v8 = [v7 personaIdentifier];

  if (v8
    || ([MEMORY[0x1E4FB36F8] sharedManager],
        long long v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isSharedIPad],
        v9,
        (v10 & 1) != 0))
  {
    id v11 = objc_alloc(MEMORY[0x1E4F25858]);
    id v12 = objc_loadWeakRetained((id *)&self->_fpdExtension);
    uint64_t v13 = [v12 extensionRecord];
    uint64_t v14 = (void *)[v11 initWithApplicationExtensionRecord:v13];

    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F25860]) initWithIdentifier:self->_sessionUUID];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F25870]) initWithExtensionIdentity:v14 instanceIdentifier:v15];
    id v17 = [MEMORY[0x1E4FB36F8] sharedManager];
    char v18 = [v17 isSharedIPad];

    if ((v18 & 1) == 0)
    {
      long long v19 = [MEMORY[0x1E4F25878] personaWithPersonaUniqueString:v8];
      [v16 setLaunchPersona:v19];
    }
    v20 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.extensionkit" name:@"HandleMessage"];
    v40[0] = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v16 setAssertionAttributes:v21];

    id v22 = [MEMORY[0x1E4F25868] extensionProcessWithConfiguration:v16 error:a3];
    sessionProcess = self->_sessionProcess;
    self->_sessionProcess = v22;

    [(FPDExtensionSession *)self _evaluateExtensionForegroundness];
    long long v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = objc_loadWeakRetained((id *)&self->_fpdExtension);
      int v36 = 138412546;
      id v37 = v25;
      __int16 v38 = 2114;
      v39 = v15;
      _os_log_impl(&dword_1D744C000, v24, OS_LOG_TYPE_INFO, "[INFO] [helena] Creating new XPC connection for extension %@, instance %{public}@", (uint8_t *)&v36, 0x16u);
    }
    long long v26 = (NSXPCConnection *)[(_EXExtensionProcess *)self->_sessionProcess newXPCConnectionWithError:a3];
    connection = self->_connection;
    self->_connection = v26;

    id v28 = FPXVendorXPCInterface();
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v28];

    [(NSXPCConnection *)self->_connection resume];
    __int16 v29 = self->_connection;
    BOOL v30 = v29 != 0;
    if (a3 && !v29)
    {
      FPProxyNotFoundError();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v32 = fp_current_or_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[FPDExtensionSession _setUpEXConnectionWithError:]();
    }

    if (a3)
    {
      FPInvalidParameterError();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v33 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
    v34 = [v33 userPersonaUniqueString];

    if (!v34)
    {
      v35 = fp_current_or_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[FPDExtensionSession _setUpEXConnectionWithError:]();
      }

      exit(1);
    }
    BOOL v30 = 0;
  }

  return v30;
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke(uint64_t a1)
{
  fpfs_adopt_log();
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 132) && (*(void *)(v2 + 32) || *(unsigned char *)(a1 + 68)))
  {
    if (*(int *)(a1 + 64) >= 1)
    {
      objc_msgSend(*(id *)(v2 + 120), "addPIDToObserveSync:");
      uint64_t v2 = *(void *)(a1 + 32);
    }
    id v24 = 0;
    id v7 = [(id)v2 _connectionWithError:&v24];
    id v3 = v24;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__18;
    v22[4] = __Block_byref_object_dispose__18;
    id v23 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2;
    v16[3] = &unk_1E6A76C80;
    v16[4] = *(void *)(a1 + 32);
    id v8 = v7;
    id v17 = v8;
    char v18 = v22;
    uint64_t v19 = *(void *)(a1 + 48);
    int v21 = *(_DWORD *)(a1 + 64);
    uint64_t v20 = *(void *)(a1 + 56);
    long long v9 = (void *)MEMORY[0x1D9471EC0](v16);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_258;
    v15[3] = &unk_1E6A76CA8;
    v15[4] = *(void *)(a1 + 32);
    v15[5] = v22;
    char v10 = (void *)MEMORY[0x1D9471EC0](v15);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F25DA8]) initWithConnection:v8 protocol:&unk_1F2EF71F8 orError:v3 name:*(void *)(*(void *)(a1 + 32) + 88) requestPid:*(unsigned int *)(a1 + 64) requestWillBegin:v9 requestDidBegin:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_cold_1();
    }

    [*(id *)(*(void *)(a1 + 32) + 104) suppress];
    [*(id *)(a1 + 32) _evaluateExtensionForegroundness];

    _Block_object_dispose(v22, 8);
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F25DA8]) initWithConnection:0 protocol:&unk_1F2EF71F8 orError:v3 name:*(void *)(*(void *)(a1 + 32) + 88) requestPid:*(unsigned int *)(a1 + 64)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  __fp_pop_log();
}

uint64_t __58__FPDExtensionSession_processMonitor_didBecomeForeground___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 **)(a1 + 32);
  int v3 = v2[133];
  int v4 = *(unsigned __int8 *)(a1 + 40);
  uint64_t result = [v2 _evaluateExtensionForegroundness];
  if (v3 != v4)
  {
    id v6 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 40))
    {
      return [v6 _notifyNetworkingProviderMonitorWithState:1];
    }
    else
    {
      id v7 = (void *)v6[14];
      return [v7 arm];
    }
  }
  return result;
}

- (id)_connectionWithError:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  connection = self->_connection;
  if (connection)
  {
    id v6 = connection;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
    uint64_t v8 = [WeakRetained provider];
    long long v9 = (void *)v8;
    if (WeakRetained && v8)
    {
      v67[0] = 0;
      [(FPDExtensionSession *)self _setUpConnectionWithError:v67];
      id v10 = v67[0];
      uint64_t v11 = self->_connection;
      if (self->_connection)
      {
        if (FPFeatureFlagHelenaIsEnabled())
        {
          if (!self->_sessionProcess)
          {
            uint64_t v12 = [NSString stringWithFormat:@"[ASSERT] ‼️ connection -> session process"];
            uint64_t v13 = fp_current_or_default_log();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
              +[FPDVolume prettyNameForDomain:]();
            }

            __assert_rtn("-[FPDExtensionSession _connectionWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 610, (const char *)[v12 UTF8String]);
          }
        }
        else if (!self->_pid)
        {
          v48 = [NSString stringWithFormat:@"[ASSERT] ‼️ connection -> pid"];
          v49 = fp_current_or_default_log();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
            +[FPDVolume prettyNameForDomain:]();
          }

          __assert_rtn("-[FPDExtensionSession _connectionWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 612, (const char *)[v48 UTF8String]);
        }
        id v53 = v10;
        char IsEnabled = FPFeatureFlagHelenaIsEnabled();
        [(RBSAssertion *)self->_foregroundAssertion invalidate];
        foregroundAssertion = self->_foregroundAssertion;
        self->_foregroundAssertion = 0;

        [(RBSAssertion *)self->_backgroundAssertion invalidate];
        backgroundAssertion = self->_backgroundAssertion;
        self->_backgroundAssertion = 0;

        if ((IsEnabled & 1) == 0)
        {
          [(FPDExtensionSession *)self _evaluateExtensionForegroundness];
          [(NSExtension *)self->_extension _dropAssertion];
        }
        id v17 = [FPDXPCDomainServicer alloc];
        char v18 = [WeakRetained provider];
        uint64_t v19 = [v18 manager];
        uint64_t v20 = [v19 server];
        int v21 = [WeakRetained providerDomainID];
        id v22 = [(FPDXPCDomainServicer *)v17 initWithServer:v20 providerDomainID:v21 domain:WeakRetained connection:v11];

        id location = 0;
        objc_initWeak(&location, self);
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __44__FPDExtensionSession__connectionWithError___block_invoke;
        v62[3] = &unk_1E6A76BB8;
        objc_copyWeak(&v65, &location);
        v52 = v11;
        id v23 = v11;
        v63 = v23;
        id v24 = v22;
        v64 = v24;
        [(NSXPCConnection *)v23 setInterruptionHandler:v62];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __44__FPDExtensionSession__connectionWithError___block_invoke_2;
        v58[3] = &unk_1E6A76BB8;
        objc_copyWeak(&v61, &location);
        id v25 = v23;
        v59 = v25;
        v54 = v24;
        v60 = v54;
        [(NSXPCConnection *)v25 setInvalidationHandler:v58];
        id v26 = objc_alloc(MEMORY[0x1E4F25DB8]);
        v27 = [WeakRetained providerDomainID];
        id v28 = (void *)[v26 initWithProviderDomainIdentifier:v27];
        [(NSXPCConnection *)v25 fp_annotateWithXPCSanitizer:v28];

        __int16 v29 = [WeakRetained nsDomainOrNilForDefault];
        BOOL v30 = v29;
        if (v29)
        {
          id v55 = v29;
        }
        else
        {
          id v31 = objc_alloc(MEMORY[0x1E4F25DC0]);
          id v55 = (id)[v31 initWithIdentifier:*MEMORY[0x1E4F25C00] displayName:&stru_1F2EC3618 pathRelativeToDocumentStorage:&stru_1F2EC3618];
        }

        uint64_t v32 = [WeakRetained provider];
        v33 = [v32 descriptor];
        v34 = [v33 personaIdentifier];
        [v55 setPersonaIdentifier:v34];

        v35 = [(NSXPCConnection *)v25 remoteObjectProxy];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __44__FPDExtensionSession__connectionWithError___block_invoke_2_94;
        v56[3] = &unk_1E6A73580;
        id v36 = WeakRetained;
        id v57 = v36;
        id v37 = [v35 remoteObjectProxyWithErrorHandler:v56];

        __int16 v38 = [v9 providerDomainForDomain:v36];
        if ([v38 isUsingFPFS])
        {
          v39 = [v36 nsDomainOrNilForDefault];
          if (v39)
          {
            v40 = [v36 volume];
            int v41 = [v40 role];

            if (v41 != 3)
            {
              v42 = [v38 domain];
              v43 = [v42 backingStoreIdentity];

              if (!v43)
              {
                v50 = [NSString stringWithFormat:@"[ASSERT] ‼️ missing backing store identity for domain %@", v36];
                v51 = fp_current_or_default_log();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
                  +[FPDVolume prettyNameForDomain:]();
                }

                __assert_rtn("-[FPDExtensionSession _connectionWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 689, (const char *)[v50 UTF8String]);
              }
            }
          }
        }
        v44 = [(FPDExtensionSession *)self _alternateContentsDictionary];
        v45 = [v36 defaultBackend];
        v46 = [v45 domainVersion];
        [v37 beginRequestWithDomain:v55 alternateContentsDictionary:v44 domainServicer:v54 providerDomain:v38 domainVersion:v46 completionHandler:&__block_literal_global_27];

        id v6 = v25;
        objc_destroyWeak(&v61);

        objc_destroyWeak(&v65);
        objc_destroyWeak(&location);

        uint64_t v11 = v52;
        id v10 = v53;
      }
      else
      {
        id v6 = 0;
        if (a3) {
          *a3 = v10;
        }
      }
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"nil domain %@ or provider %@", WeakRetained, v8);
      id v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (void)registerLifetimeExtensionForObject:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__FPDExtensionSession_registerLifetimeExtensionForObject___block_invoke;
  v7[3] = &unk_1E6A736C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sessionQueue, v7);
}

- (void)asyncUnregisterLifetimeExtensionForObject:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__FPDExtensionSession_asyncUnregisterLifetimeExtensionForObject___block_invoke;
  v7[3] = &unk_1E6A736C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionQueue, v7);
}

- (BOOL)_setUpConnectionWithError:(id *)a3
{
  if (FPFeatureFlagHelenaIsEnabled())
  {
    return [(FPDExtensionSession *)self _setUpEXConnectionWithError:a3];
  }
  else
  {
    return [(FPDExtensionSession *)self _setUpPKConnectionWithError:a3];
  }
}

- (void)unregisterLifetimeExtensionForObject:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__FPDExtensionSession_unregisterLifetimeExtensionForObject___block_invoke;
  v7[3] = &unk_1E6A736C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sessionQueue, v7);
}

- (FPDExtensionSession)initWithDomain:(id)a3 extension:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v50.receiver = self;
  v50.super_class = (Class)FPDExtensionSession;
  uint64_t v11 = [(FPDExtensionSession *)&v50 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_domain, v8);
    uint64_t v13 = [v8 log];
    log = v12->_log;
    v12->_log = (OS_os_log *)v13;

    objc_storeWeak((id *)&v12->_fpdExtension, v9);
    if ((FPFeatureFlagHelenaIsEnabled() & 1) == 0)
    {
      uint64_t v15 = [v9 extension];
      if ([(NSExtension *)v12->_extension _wantsProcessPerRequest])
      {
        id v16 = [v15 _freshCopy];
      }
      else
      {
        id v16 = v15;
      }
      extension = v12->_extension;
      v12->_extension = v16;
    }
    uint64_t v18 = objc_opt_new();
    inflightProxies = v12->_inflightProxies;
    v12->_inflightProxies = (NSMutableDictionary *)v18;

    uint64_t v20 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    lifetimeExtenders = v12->_lifetimeExtenders;
    v12->_lifetimeExtenders = (NSMapTable *)v20;

    p_sessionQueue = &v12->_sessionQueue;
    objc_storeStrong((id *)&v12->_sessionQueue, a5);
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_fpdExtension);
    uint64_t v24 = [WeakRetained identifier];
    providerIdentifier = v12->_providerIdentifier;
    v12->_providerIdentifier = (NSString *)v24;

    uint64_t v26 = [MEMORY[0x1E4F29128] UUID];
    sessionUUID = v12->_sessionUUID;
    v12->_sessionUUID = (NSUUID *)v26;

    id v28 = [NSString stringWithFormat:@"extension session queue callback queue (%@)", v12->_providerIdentifier];
    __int16 v29 = (const char *)[v28 UTF8String];
    BOOL v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v31 = dispatch_queue_create(v29, v30);
    callbackQueue = v12->_callbackQueue;
    v12->_callbackQueue = (OS_dispatch_queue *)v31;

    v12->_unsigned int notifyTokenForFramework = -1;
    v33 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    observingBundleIDs = v12->_observingBundleIDs;
    v12->_observingBundleIDs = v33;

    v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
    [v35 doubleForKey:@"session-grace-period-delay"];
    double v37 = v36;
    id location = 0;
    objc_initWeak(&location, v12);
    id v38 = objc_alloc(MEMORY[0x1E4F25D10]);
    if (v37 == 0.0) {
      double v37 = 5.0;
    }
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __54__FPDExtensionSession_initWithDomain_extension_queue___block_invoke;
    v47[3] = &unk_1E6A74010;
    objc_copyWeak(&v48, &location);
    uint64_t v39 = [v38 initWithAction:v47 callbackQueue:*p_sessionQueue delay:v37];
    gracePeriodTimer = v12->_gracePeriodTimer;
    v12->_gracePeriodTimer = (FPGracePeriodTimer *)v39;

    id v41 = objc_alloc(MEMORY[0x1E4F25D10]);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __54__FPDExtensionSession_initWithDomain_extension_queue___block_invoke_16;
    v45[3] = &unk_1E6A74010;
    objc_copyWeak(&v46, &location);
    uint64_t v42 = [v41 initWithAction:v45 callbackQueue:*p_sessionQueue delay:30.0];
    networkingGracePeriodTimer = v12->_networkingGracePeriodTimer;
    v12->_networkingGracePeriodTimer = (FPGracePeriodTimer *)v42;

    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }
  return v12;
}

void __54__FPDExtensionSession_initWithDomain_extension_queue___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = fpfs_adopt_log();
    uint64_t v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[11];
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] %@: extension request grace timer ran out", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "__invalidate");
    __fp_pop_log();
  }
}

void __54__FPDExtensionSession_initWithDomain_extension_queue___block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _networkingGracePeriodOver];
}

- (void)dealloc
{
  int notifyTokenForFramework = self->_notifyTokenForFramework;
  if (notifyTokenForFramework != -1) {
    notify_cancel(notifyTokenForFramework);
  }
  if (self->_processMonitor)
  {
    id v4 = [NSString stringWithFormat:@"[ASSERT] ‼️ someone forgot to tear this down"];
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionSession dealloc]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 211, (const char *)[v4 UTF8String]);
  }
  v6.receiver = self;
  v6.super_class = (Class)FPDExtensionSession;
  [(FPDExtensionSession *)&v6 dealloc];
}

- (void)_invalidate
{
  [(FPGracePeriodTimer *)self->_gracePeriodTimer suppress];
  [(FPDExtensionSession *)self __invalidate];
}

- (void)__invalidate
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] Cancelling extension with request identifier %@", v2, v3, v4, v5, v6);
}

- (BOOL)terminateExtensionWithReason:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (FPFeatureFlagHelenaIsEnabled())
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int pid = self->_pid;
      *(_DWORD *)buf = 67109120;
      int v32 = pid;
      _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_INFO, "[INFO] Terminating session process for pid %u", buf, 8u);
    }

    if (!self->_sessionProcess)
    {
      BOOL v15 = 1;
LABEL_30:
      [(FPDExtensionSession *)self __invalidate];
      goto LABEL_31;
    }
    id v9 = objc_msgSend(MEMORY[0x1E4F96430], "predicateMatching:");
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F96488]) initWithExplanation:v6];
    [v10 setReportType:0];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F96490]) initWithPredicate:v9 context:v10];
    id v30 = 0;
    char v12 = [v11 execute:&v30];
    id v13 = v30;
    uint64_t v14 = v13;
    if (v12)
    {
      BOOL v15 = 1;
LABEL_29:
      [(_EXExtensionProcess *)self->_sessionProcess invalidate];

      goto LABEL_30;
    }
    uint64_t v26 = [v13 domain];
    if ([v26 isEqualToString:*MEMORY[0x1E4F964C8]])
    {
      uint64_t v27 = [v14 code];

      if (v27 == 3)
      {
        id v28 = fp_current_or_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D744C000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to terminate the session, process was not found", buf, 2u);
        }
        BOOL v15 = 1;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
    }
    if (a4) {
      *a4 = v14;
    }
    id v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[FPDExtensionSession terminateExtensionWithReason:error:]();
    }
    BOOL v15 = 0;
    goto LABEL_28;
  }
  id v16 = [MEMORY[0x1E4F91498] defaultManager];
  id v17 = self->_extension;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = [(NSExtension *)v17 _plugIn];
    uint64_t v19 = [v18 url];
    char v20 = [v16 terminatePlugInAtURL:v19 withError:a4];

    if ((v20 & 1) == 0)
    {
      int v21 = NSString;
      id v22 = [(NSExtension *)v17 identifier];
      id v23 = [v21 stringWithFormat:@"[ASSERT] ‼️ UNREACHABLE: failed to terminate extension %@: %@", v22, *a4];

      uint64_t v24 = fp_current_or_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDExtensionSession terminateExtensionWithReason:error:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 340, (const char *)[v23 UTF8String]);
    }
  }
  else
  {
    id v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[FPDExtensionSession terminateExtensionWithReason:error:](v17, v25);
    }

    [(NSExtension *)v17 _kill:9];
  }
  [(FPDExtensionSession *)self __invalidate];

  BOOL v15 = 1;
LABEL_31:

  return v15;
}

- (BOOL)_setUpPKConnectionWithError:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self->_extension;
  qos_class_t v6 = qos_class_self();
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v6;
    LOWORD(v54) = 2048;
    *(void *)((char *)&v54 + 2) = 0x4072C00000000000;
    _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_INFO, "[INFO] connection QoS is %u, setting bringup watchdog timeout to %g", buf, 0x12u);
  }

  int pid = self->_pid;
  id v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_callbackQueue);
  dispatch_set_qos_class_fallback();
  dispatch_time_t v10 = dispatch_time(0, 300000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke;
  block[3] = &unk_1E6A76B68;
  block[4] = self;
  v45 = v9;
  uint64_t v11 = v5;
  id v46 = v11;
  int v47 = pid;
  char v12 = v45;
  dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_source_set_event_handler(v12, v13);

  dispatch_resume(v12);
  if (v6 <= QOS_CLASS_UTILITY) {
    dispatch_qos_class_t v14 = QOS_CLASS_UTILITY;
  }
  else {
    dispatch_qos_class_t v14 = v6;
  }
  if (v6 <= 0x10)
  {
    BOOL v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      [(FPDExtensionSession *)v14 _setUpPKConnectionWithError:v15];
    }
  }
  *(void *)buf = 0;
  *(void *)&long long v54 = buf;
  *((void *)&v54 + 1) = 0x3032000000;
  id v55 = __Block_byref_object_copy__18;
  v56 = __Block_byref_object_dispose__18;
  id v57 = 0;
  *(void *)&long long v48 = 0;
  *((void *)&v48 + 1) = &v48;
  uint64_t v49 = 0x3032000000;
  objc_super v50 = __Block_byref_object_copy__18;
  v51 = __Block_byref_object_dispose__18;
  id v52 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v17 = [WeakRetained nsDomain];
  uint64_t v18 = [v17 personaIdentifier];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke_69;
  v39[3] = &unk_1E6A76B90;
  id v19 = v18;
  id v40 = v19;
  uint64_t v42 = buf;
  char v20 = v11;
  id v41 = v20;
  v43 = &v48;
  int v21 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v14, 0, v39);
  v21[2]();
  if (a3)
  {
    id v22 = *(void **)(*((void *)&v48 + 1) + 40);
    if (v22) {
      *a3 = v22;
    }
  }

  _Block_object_dispose(&v48, 8);
  dispatch_suspend(v12);
  id v23 = self;
  objc_sync_enter(v23);
  [0 invalidate];
  objc_sync_exit(v23);

  if (v23->_invalidated)
  {
    uint64_t v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [(NSExtension *)v20 identifier];
      LODWORD(v48) = 138412290;
      *(void *)((char *)&v48 + 4) = v25;
      _os_log_impl(&dword_1D744C000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] app extension for %@ has been invalidated during connection setup...", (uint8_t *)&v48, 0xCu);
    }
    goto LABEL_24;
  }
  if (a3 && !*(void *)(v54 + 40))
  {
    uint64_t v24 = [*a3 domain];
    if (![v24 isEqualToString:*MEMORY[0x1E4F914D0]])
    {
LABEL_24:

      goto LABEL_25;
    }
    BOOL v26 = [*a3 code] == 16;

    if (v26)
    {
      uint64_t v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [(NSExtension *)v20 identifier];
        LODWORD(v48) = 138543362;
        *(void *)((char *)&v48 + 4) = v28;
        _os_log_impl(&dword_1D744C000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] encountered an app extension version conflict error, terminating the existing extension and retrying (%{public}@)...", (uint8_t *)&v48, 0xCu);
      }
      if ([(FPDExtensionSession *)v23 terminateExtensionWithReason:@"app extension version conflict" error:a3])
      {
        exit(0);
      }
      v35 = NSString;
      double v36 = [(NSExtension *)v20 identifier];
      double v37 = [v35 stringWithFormat:@"[ASSERT] ‼️ UNREACHABLE: failed to terminate extension %@", v36];

      id v38 = fp_current_or_default_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDExtensionSession _setUpPKConnectionWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 552, (const char *)[v37 UTF8String]);
    }
  }
LABEL_25:
  __int16 v29 = *(void **)(v54 + 40);
  if (v29)
  {
    objc_storeStrong((id *)&v23->_requestIdentifier, v29);
    id v30 = [(NSExtension *)self->_extension _extensionContextForUUID:*(void *)(v54 + 40)];
    uint64_t v31 = [v30 _auxiliaryConnection];
    connection = v23->_connection;
    v23->_connection = (NSXPCConnection *)v31;

    self->_int pid = [(NSXPCConnection *)v23->_connection processIdentifier];
  }
  uint64_t v33 = v23->_connection;
  if (!v33 && a3)
  {
    FPProxyNotFoundError();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(buf, 8);

  return v33 != 0;
}

void __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  fpfs_adopt_log();
  objc_claimAutoreleasedReturnValue();
  dispatch_suspend(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = [*(id *)(a1 + 48) identifier];
    *(_DWORD *)buf = 138412290;
    id v16 = v3;
    _os_log_error_impl(&dword_1D744C000, v2, OS_LOG_TYPE_ERROR, "[ERROR] Extension bringup for %@ timed out.", buf, 0xCu);
  }
  if (!*(_DWORD *)(a1 + 56)) {
    goto LABEL_5;
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F963E8];
  uint64_t v5 = (void *)MEMORY[0x1E4F96430];
  qos_class_t v6 = objc_msgSend(MEMORY[0x1E4F96478], "targetWithPid:");
  uint64_t v7 = [v5 predicateMatchingTarget:v6];
  id v8 = [v4 handleForPredicate:v7 error:0];

  id v9 = [v8 currentState];

  if (v9)
  {
    if ([v9 taskState] == 3) {
      dispatch_time_t v10 = @"The extension is suspended.";
    }
    else {
      dispatch_time_t v10 = @"The extension is NOT suspended.";
    }
  }
  else
  {
LABEL_5:
    dispatch_time_t v10 = @"Cannot determine a pid for the extension.";
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 132)) {
    uint64_t v11 = @"This extension session had been invalidated.";
  }
  else {
    uint64_t v11 = @"The extension session was ostensibly valid.";
  }
  char v12 = v11;
  dispatch_block_t v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    dispatch_qos_class_t v14 = [*(id *)(a1 + 48) identifier];
    *(_DWORD *)buf = 138412802;
    id v16 = v14;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    char v20 = v10;
    _os_log_fault_impl(&dword_1D744C000, v13, OS_LOG_TYPE_FAULT, "[CRIT] Extension bringup for %@ timed out. %@ %@", buf, 0x20u);
  }
  exit(0);
}

void __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke_69(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v3 = [v2 currentPersona];

  id v19 = 0;
  uint64_t v4 = [v3 userPersonaUniqueString];
  uint64_t v5 = v4;
  if (v4 == (void *)a1[4]
    || (objc_msgSend(v4, "isEqualToString:") & 1) != 0
    || !voucher_process_can_use_arbitrary_personas())
  {
    dispatch_time_t v10 = 0;
  }
  else
  {
    id v18 = 0;
    qos_class_t v6 = (void *)[v3 copyCurrentPersonaContextWithError:&v18];
    id v7 = v18;
    id v8 = v19;
    id v19 = v6;

    if (v7)
    {
      id v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[FPDProviderDescriptor initWithExtensionRecord:].cold.8();
      }
    }
    dispatch_time_t v10 = [v3 generateAndRestorePersonaContextWithPersonaUniqueString:a1[4]];

    if (v10)
    {
      uint64_t v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke_69_cold_1();
      }
    }
  }
  char v12 = (void *)a1[5];
  uint64_t v13 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v13 + 40);
  uint64_t v14 = [v12 beginExtensionRequestWithOptions:1 inputItems:MEMORY[0x1E4F1CBF0] error:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);
  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  _FPRestorePersona();
}

void __44__FPDExtensionSession__connectionWithError___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __44__FPDExtensionSession__connectionWithError___block_invoke_cold_1();
    }

    uint64_t v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__FPDExtensionSession__connectionWithError___block_invoke_87;
    block[3] = &unk_1E6A73418;
    block[4] = WeakRetained;
    id v6 = a1[4];
    id v7 = a1[5];
    dispatch_async(v4, block);
  }
}

void *__44__FPDExtensionSession__connectionWithError___block_invoke_87(void *a1)
{
  uint64_t result = (void *)a1[4];
  if (result[4] == a1[5])
  {
    [result _invalidate];
    uint64_t v3 = (void *)a1[6];
    return (void *)[v3 invalidate];
  }
  return result;
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __44__FPDExtensionSession__connectionWithError___block_invoke_2_cold_1();
    }

    uint64_t v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__FPDExtensionSession__connectionWithError___block_invoke_88;
    block[3] = &unk_1E6A73418;
    block[4] = WeakRetained;
    id v6 = a1[4];
    id v7 = a1[5];
    dispatch_async(v4, block);
  }
}

void *__44__FPDExtensionSession__connectionWithError___block_invoke_88(void *a1)
{
  uint64_t result = (void *)a1[4];
  if (result[4] == a1[5])
  {
    [result _invalidate];
    uint64_t v3 = (void *)a1[6];
    return (void *)[v3 invalidate];
  }
  return result;
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_2_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__FPDExtensionSession__connectionWithError___block_invoke_2_94_cold_1(a1, v3, v4);
  }
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_99(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = objc_msgSend(v2, "fp_unwrappedInternalError");
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__FPDExtensionSession__connectionWithError___block_invoke_99_cold_2();
    }

    if (objc_msgSend(v4, "fp_isFileProviderInternalError:", 18))
    {
      id v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __44__FPDExtensionSession__connectionWithError___block_invoke_99_cold_1();
      }

      exit(1);
    }
  }
}

- (BOOL)hasFileProviderAttributionMDMAccess
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  uint64_t v5 = [WeakRetained nsDomain];
  if (![v5 isContentManaged]
    || ![v3 objectIsForcedForKey:@"AllowManagedFileProvidersToRequestAttribution"])
  {

    goto LABEL_6;
  }
  char v6 = [v3 BOOLForKey:@"AllowManagedFileProvidersToRequestAttribution"];

  if ((v6 & 1) == 0)
  {
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (id)existingFileProviderProxyWithTimeout:(double)a3 onlyAlreadyLifetimeExtended:(BOOL)a4 pid:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (!a4) {
    goto LABEL_4;
  }
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMapTable *)v8->_lifetimeExtenders keyEnumerator];
  dispatch_time_t v10 = [v9 nextObject];

  if (v10)
  {
    objc_sync_exit(v8);

LABEL_4:
    id v11 = [(FPDExtensionSession *)self newFileProviderProxyWithTimeoutValue:v5 pid:0 createIfNeeded:a3];
    goto LABEL_5;
  }
  uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  id v11 = (id)[objc_alloc(MEMORY[0x1E4F25DA8]) initWithConnection:0 protocol:&unk_1F2EF71F8 orError:v13 name:v8->_providerIdentifier requestPid:v5];

  objc_sync_exit(v8);
LABEL_5:
  return v11;
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_3(uint64_t a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_3_cold_1(a1, v2);
  }

  if ((FPFeatureFlagHelenaIsEnabled() & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) _xpcConnection];
    pid_t pid = xpc_connection_get_pid(v3);

    if (pid)
    {
      uint64_t v5 = NSString;
      char v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      BOOL v7 = [v5 stringWithFormat:@"The process did not respond to a request %@ in time.", v6];
      WriteStackshotReportWithPID();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateExtensionIfPossible];
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_251(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  id v8 = *(NSObject **)(v7 + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_252;
  v12[3] = &unk_1E6A76C30;
  id v9 = (void *)a1[5];
  uint64_t v16 = a1[6];
  v12[4] = v7;
  id v13 = v5;
  id v14 = v9;
  id v15 = v6;
  uint64_t v17 = a1[7];
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, v12);
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_252(uint64_t a1)
{
  uint64_t v7 = fpfs_adopt_log();
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) cancelTimeout];
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_252_cold_2();
  }

  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  uint64_t v4 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 48) != v4)
  {
    id v5 = [NSString stringWithFormat:@"[ASSERT] ‼️ begin and finished request IDs should match: %@ %@", *(void *)(a1 + 48), v4];
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDExtensionSession newFileProviderProxyWithTimeoutValue:pid:createIfNeeded:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 869, (const char *)[v5 UTF8String]);
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "removeObjectForKey:");
  objc_sync_exit(v3);

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "removePIDToObserve:", objc_msgSend(*(id *)(a1 + 40), "requestEffectivePid"));
  [*(id *)(a1 + 32) _invalidateExtensionIfPossible];
  __fp_pop_log();
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_258(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = fpfs_adopt_log();
  if (v10) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) monitorProgress:v10];
  }
  __fp_pop_log();
}

void __58__FPDExtensionSession_registerLifetimeExtensionForObject___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id *)(a1 + 40);
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);

    if (v4)
    {
      if (objc_opt_respondsToSelector()) {
        [WeakRetained setTimeoutState:2];
      }
      id v5 = objc_loadWeakRetained(v2);
      [v5 _unregisterLifetimeExtensionForObject:WeakRetained];
    }
  }
}

- (void)start
{
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__FPDExtensionSession_start__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_async(sessionQueue, block);
}

void __28__FPDExtensionSession_start__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  uint64_t v7 = fpfs_adopt_log();
  if (*(void *)(*(void *)v2 + 88))
  {
    v8[0] = *(void *)(*(void *)v2 + 88);
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = [[FPDProcessMonitor alloc] initWithExcludedBundleIDs:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v4;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "setDelegate:");
  __fp_pop_log();
}

- (void)terminateWithReason:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__FPDExtensionSession_terminateWithReason___block_invoke;
  v7[3] = &unk_1E6A736C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionQueue, v7);
}

void __43__FPDExtensionSession_terminateWithReason___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  fpfs_adopt_log();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 88);
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] %{public}@: terminating extension request for reason: %{public}@", buf, 0x16u);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = 0;
  char v7 = [v5 terminateExtensionWithReason:v6 error:&v11];
  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_msgSend(v8, "fp_prettyDescription");
      [(FPDExtensionSession *)v10 _invalidateExtensionIfPossible];
    }
  }
  __fp_pop_log();
}

- (void)cancelAsync
{
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__FPDExtensionSession_cancelAsync__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_async(sessionQueue, block);
}

void __34__FPDExtensionSession_cancelAsync__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = fpfs_adopt_log();
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 88);
    *(_DWORD *)buf = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] %{public}@: cancelling extension request", buf, 0xCu);
  }

  [*(id *)(a1 + 32) _invalidate];
  __fp_pop_log();
}

- (void)invalidate
{
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FPDExtensionSession_invalidate__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_async(sessionQueue, block);
}

void __33__FPDExtensionSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  uint64_t v7 = fpfs_adopt_log();
  *(unsigned char *)(*(void *)v2 + 132) = 1;
  uint64_t v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 88);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D744C000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] %{public}@: cancelling extension request", buf, 0xCu);
  }

  [*(id *)(a1 + 32) _invalidate];
  [*(id *)(*(void *)(a1 + 32) + 112) suppress];
  [*(id *)(a1 + 32) _notifyNetworkingProviderMonitorWithState:0];
  [*(id *)(*(void *)(a1 + 32) + 120) invalidate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = 0;

  __fp_pop_log();
}

- (NSString)description
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  __int16 v15 = NSString;
  uint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_domain);
  uint64_t v4 = [WeakRetained providerDomainID];
  uint64_t v5 = objc_msgSend(v4, "fp_obfuscatedProviderDomainID");
  uint64_t v6 = [(NSMutableDictionary *)v2->_inflightProxies allValues];
  uint64_t v7 = [v6 componentsJoinedByString:@","];
  id v8 = [(NSMapTable *)v2->_lifetimeExtenders keyEnumerator];
  uint64_t v9 = [v8 allObjects];
  uint64_t v10 = objc_msgSend(v9, "fp_map:", &__block_literal_global_276);
  id v11 = [v10 componentsJoinedByString:@","];
  id v12 = [v15 stringWithFormat:@"<%@(%@): %p requests{%@}, extenders{%@}>", v3, v5, v2, v7, v11];

  objc_sync_exit(v2);
  return (NSString *)v12;
}

uint64_t __34__FPDExtensionSession_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prettyDescription];
}

- (void)_networkingGracePeriodOver
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] Networking grace period timer fired with foreground process for %@", v2);
}

void __60__FPDExtensionSession_newAssertionWithAttributeName_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained assertionWasInvalidated:v3];
}

- (void)assertionWasInvalidated:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__FPDExtensionSession_assertionWasInvalidated___block_invoke;
  v7[3] = &unk_1E6A736C0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(sessionQueue, v7);
}

void __47__FPDExtensionSession_assertionWasInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) explanation];
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] Extension assertion '%{public}@' for %@ was invalidated", (uint8_t *)&v9, 0x16u);
  }
  char v5 = [*(id *)(a1 + 40) terminateExtensionWithReason:@"run assertion was invalidated" error:0];
  id v6 = fp_current_or_default_log();
  uint64_t v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __47__FPDExtensionSession_assertionWasInvalidated___block_invoke_cold_1();
    }

    exit(0);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = *(void **)(a1 + 40);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_INFO, "[INFO] Terminated extension %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)dumpStateTo:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__FPDExtensionSession_dumpStateTo___block_invoke;
  v7[3] = &unk_1E6A736C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sessionQueue, v7);
}

void __35__FPDExtensionSession_dumpStateTo___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 160))
  {
    id v3 = @"foreground";
    uint64_t v4 = 2;
  }
  else
  {
    if (!*(void *)(v2 + 168)) {
      goto LABEL_6;
    }
    id v3 = @"background";
    uint64_t v4 = 3;
  }
  [*(id *)(a1 + 40) startFgColor:v4];
  [*(id *)(a1 + 40) write:v3];
  [*(id *)(a1 + 40) reset];
LABEL_6:
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 40))
  {
    [*(id *)(a1 + 40) startFgColor:3];
    [*(id *)(a1 + 40) write:@" request running;"];
    [*(id *)(a1 + 40) reset];
    uint64_t v5 = *(void *)(a1 + 32);
  }
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [*(id *)(v5 + 120) prettyDescription];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 104) prettyDescription];
  [v6 write:@" %@; grace period timer %@\n", v7, v8];

  int v9 = [*(id *)(*(void *)(a1 + 32) + 64) keyEnumerator];
  uint64_t v10 = [v9 allObjects];

  if ([v10 count])
  {
    __int16 v11 = *(void **)(a1 + 40);
    if (*(void *)(*(void *)(a1 + 32) + 32))
    {
      [v11 startFgColor:3];
      int IsEnabled = FPFeatureFlagHelenaIsEnabled();
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(a1 + 40);
      if (IsEnabled)
      {
        uint64_t v29 = objc_msgSend(*(id *)(v13 + 152), "rbs_pid");
        __int16 v15 = @" alive (%d) via ExtensionKit";
      }
      else
      {
        uint64_t v29 = *(unsigned int *)(v13 + 136);
        __int16 v15 = @" alive (%d) via PlugInKit";
      }
      uint64_t v16 = v14;
    }
    else
    {
      [v11 startFgColor:1];
      uint64_t v16 = *(void **)(a1 + 40);
      __int16 v15 = @" without connection";
    }
    objc_msgSend(v16, "write:", v15, v29);
    [*(id *)(a1 + 40) reset];
    [*(id *)(a1 + 40) write:@" for:\n"];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(a1 + 40);
          id v23 = [*(id *)(*((void *)&v34 + 1) + 8 * v21) prettyDescription];
          [v22 write:@"     %@\n", v23];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v19);
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 56) count])
  {
    [*(id *)(a1 + 40) startFgColor:3];
    [*(id *)(a1 + 40) write:@" alive"];
    [*(id *)(a1 + 40) reset];
    [*(id *)(a1 + 40) write:@" due to XPC calls\n"];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v31;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(a1 + 40) write:@"     %@\n", *(void *)(*((void *)&v30 + 1) + 8 * v28++)];
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v26);
    }
  }
}

- (int)test_pid
{
  if (FPFeatureFlagHelenaIsEnabled())
  {
    sessionProcess = self->_sessionProcess;
    return [(_EXExtensionProcess *)sessionProcess rbs_pid];
  }
  else
  {
    uint64_t v5 = [(NSXPCConnection *)self->_connection _xpcConnection];
    pid_t pid = xpc_connection_get_pid(v5);

    return pid;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAssertion, 0);
  objc_storeStrong((id *)&self->_foregroundAssertion, 0);
  objc_storeStrong((id *)&self->_sessionProcess, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_networkingGracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_gracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_destroyWeak((id *)&self->_fpdExtension);
  objc_storeStrong((id *)&self->_lifetimeExtenders, 0);
  objc_storeStrong((id *)&self->_inflightProxies, 0);
  objc_storeStrong((id *)&self->_observingBundleIDs, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)terminateExtensionWithReason:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] Terminating session process failed (%@)", v2);
}

- (void)terminateExtensionWithReason:(void *)a1 error:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, a2, v4, "[ERROR] encountered an app extension version conflict error, killing the existing extension and retrying (%{public}@)...", v5);
}

- (void)_setUpEXConnectionWithError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1D744C000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Exiting fileproviderd because we have a nil personal persona", v1, 2u);
}

- (void)_setUpEXConnectionWithError:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] Attempting to create a connection without personaID", v2, v3, v4, v5, v6);
}

- (void)_setUpPKConnectionWithError:(os_log_t)log .cold.2(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Enforcing QoS %u over requested QoS %u to ensure timely bringup", (uint8_t *)v3, 0xEu);
}

void __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v1, (uint64_t)v1, "[ERROR] Can't adopt persona %@: %@", v2);
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] %@: connection was interrupted", v2, v3, v4, v5, v6);
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] %@: connection was invalidated", v2, v3, v4, v5, v6);
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_2_94_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
  uint8_t v6 = objc_msgSend(a2, "fp_prettyDescription");
  int v8 = 138412546;
  int v9 = v5;
  __int16 v10 = 2112;
  __int16 v11 = v6;
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, a3, v7, "[ERROR] Failed to send initial bringup message to domain %@: %@", (uint8_t *)&v8);
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_99_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] Exiting fileproviderd because personas seem to have changed since it started", v2, v3, v4, v5, v6);
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_99_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] An error occured while beginning request: %@", v2);
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] %@: request starting", v2, v3, v4, v5, v6);
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  int v7 = 138543618;
  id v8 = WeakRetained;
  __int16 v9 = 2114;
  __int16 v10 = v5;
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, a2, v6, "[ERROR] %{public}@ took too long to perform: %{public}@, killing it...", (uint8_t *)&v7);
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_252_cold_2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] %@: request finished", v2, v3, v4, v5, v6);
}

- (void)_notifyNetworkingProviderMonitorWithState:.cold.1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "int _brc_notify_register_check(const char *, int *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPDExtensionSession.m", 80, @"%s", dlerror());

  __break(1u);
}

- (void)_notifyNetworkingProviderMonitorWithState:.cold.2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void _brc_notify_set_state_and_post(int, uint64_t, const char *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPDExtensionSession.m", 79, @"%s", dlerror());

  __break(1u);
}

- (void)newAssertionWithAttributeName:reason:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_7_0(&dword_1D744C000, v1, (uint64_t)v1, "[ERROR] can't acquire %@ assertion: %@", v2);
}

void __47__FPDExtensionSession_assertionWasInvalidated___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] Failed to terminate extension. Exiting to prevent invalid state.", v2, v3, v4, v5, v6);
}

@end