@interface AFUIServiceDelegate
- (AFUIServiceDelegate)init;
- (BOOL)_checkAndSendQueuedTextOperationsIfNecessary:(id)a3;
- (BOOL)_shouldAutomaticallyDisplayPanelForDocumentTraits:(id)a3;
- (BOOL)_shouldDisplayPanelForSession:(id)a3 documentTraits:(id)a4;
- (NSMutableArray)currentSessions;
- (NSUUID)authenticatingForSessionId;
- (NSUUID)contactsUIShowingForSessionId;
- (NSUUID)creditCardsUIShowingForSessionId;
- (NSUUID)passwordsUIShowingForSessionId;
- (RTIDocumentTraits)authenticatingForDocumentTraits;
- (id)_inputIdentifierForSession:(id)a3;
- (id)_sessionForUUID:(id)a3;
- (id)_setupPanelForSessionUUID:(id)a3 documentPid:(int)a4;
- (void)_displayPanelForSession:(id)a3 traits:(id)a4;
- (void)_performBlockOnInternalQueueForUUID:(id)a3 block:(id)a4;
- (void)_queueTextOperations:(id)a3 forSecureAppID:(id)a4 processID:(int)a5 completionHandler:(id)a6;
- (void)_scheduleExpirationOfQueuedOperations:(id)a3;
- (void)_sendAuthenticationStateOperation:(BOOL)a3 sessionUUID:(id)a4 completion:(id)a5;
- (void)_sendOrQueueTextOperations:(id)a3 session:(id)a4 withInputIdentifier:(id)a5;
- (void)_sendTextOperations:(id)a3 toSession:(id)a4 completionHandler:(id)a5;
- (void)_setIsMenuPresented:(BOOL)a3 forSessionUUID:(id)a4;
- (void)_tearDownPanelForSessionUUID:(id)a3;
- (void)_tearDownPanelsExceptForSessionUUID:(id)a3;
- (void)authenticationDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)authenticationWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)contactsUIDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)contactsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)creditCardsUIDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)creditCardsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)inputSystemService:(id)a3 inputSession:(id)a4 documentStateDidChange:(id)a5;
- (void)inputSystemService:(id)a3 inputSession:(id)a4 performInputOperation:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4 options:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4 options:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5;
- (void)passwordsUIDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)passwordsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)setAuthenticatingForDocumentTraits:(id)a3;
- (void)setAuthenticatingForSessionId:(id)a3;
- (void)setContactsUIShowingForSessionId:(id)a3;
- (void)setCreditCardsUIShowingForSessionId:(id)a3;
- (void)setCurrentSessions:(id)a3;
- (void)setIsMenuPresented:(BOOL)a3 forSessionUUID:(id)a4;
- (void)setPasswordsUIShowingForSessionId:(id)a3;
@end

@implementation AFUIServiceDelegate

- (AFUIServiceDelegate)init
{
  v10.receiver = self;
  v10.super_class = (Class)AFUIServiceDelegate;
  v2 = [(AFUIServiceDelegate *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    sessionPanels = v2->_sessionPanels;
    v2->_sessionPanels = (NSMutableDictionary *)v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    currentSessions = v2->_currentSessions;
    v2->_currentSessions = v7;
  }
  return v2;
}

- (id)_setupPanelForSessionUUID:(id)a3 documentPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(NSLock *)self->_lock lock];
  v7 = [(NSMutableDictionary *)self->_sessionPanels objectForKey:v6];
  if (!v7)
  {
    v7 = [[AFUIPanel alloc] initWithDocumentPid:v4 sessionUUID:v6];
    [(AFUIPanel *)v7 setDelegate:self];
    [(NSMutableDictionary *)self->_sessionPanels setObject:v7 forKey:v6];
  }
  [(NSLock *)self->_lock unlock];

  return v7;
}

- (void)_tearDownPanelForSessionUUID:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  v5 = [(NSMutableDictionary *)self->_sessionPanels objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__AFUIServiceDelegate__tearDownPanelForSessionUUID___block_invoke;
    block[3] = &unk_265249280;
    id v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
    [(NSMutableDictionary *)self->_sessionPanels removeObjectForKey:v4];
  }
  [(NSLock *)self->_lock unlock];
}

uint64_t __52__AFUIServiceDelegate__tearDownPanelForSessionUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hide];
}

- (void)_tearDownPanelsExceptForSessionUUID:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  [(NSLock *)self->_lock lock];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = self->_sessionPanels;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v11 isEqual:v4] & 1) == 0)
        {
          v12 = [(NSMutableDictionary *)self->_sessionPanels objectForKeyedSubscript:v11];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __59__AFUIServiceDelegate__tearDownPanelsExceptForSessionUUID___block_invoke;
          block[3] = &unk_265249280;
          id v24 = v12;
          id v13 = v12;
          dispatch_async(MEMORY[0x263EF83A0], block);
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[NSMutableDictionary removeObjectForKey:](self->_sessionPanels, "removeObjectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v16);
  }

  [(NSLock *)self->_lock unlock];
}

uint64_t __59__AFUIServiceDelegate__tearDownPanelsExceptForSessionUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hide];
}

- (void)_displayPanelForSession:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [v6 documentTraits];
  }
  BOOL v8 = [(AFUIServiceDelegate *)self _shouldDisplayPanelForSession:v6 documentTraits:v7];
  uint64_t v9 = [v6 uuid];
  if (v8)
  {
    objc_super v10 = -[AFUIServiceDelegate _setupPanelForSessionUUID:documentPid:](self, "_setupPanelForSessionUUID:documentPid:", v9, [v7 processId]);

    v11 = [(AFUIServiceDelegate *)self _inputIdentifierForSession:v6];
    v12 = [v6 internalQueue];
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke;
    v16[3] = &unk_265249650;
    v16[4] = self;
    id v17 = v11;
    id v18 = v10;
    id v19 = v7;
    id v20 = v6;
    id v13 = v10;
    id v14 = v11;
    objc_copyWeak(&v22, &location);
    id v21 = v12;
    id v15 = v12;
    dispatch_async(MEMORY[0x263EF83A0], v16);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    [(AFUIServiceDelegate *)self _tearDownPanelForSessionUUID:v9];
  }
}

void __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) allValues];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_9];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v5 = [*(id *)(a1 + 64) documentState];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_3;
  v6[3] = &unk_265249628;
  objc_copyWeak(&v11, (id *)(a1 + 80));
  id v7 = *(id *)(a1 + 72);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  [v3 displayForDocumentTraits:v4 documentState:v5 textOperationsHandler:v6];

  objc_destroyWeak(&v11);
}

uint64_t __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hide];
}

void __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v5 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_4;
    block[3] = &unk_265249600;
    void block[4] = WeakRetained;
    id v9 = v3;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v5, block);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_5;
  v6[3] = &unk_265249280;
  id v7 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendOrQueueTextOperations:*(void *)(a1 + 40) session:*(void *)(a1 + 48) withInputIdentifier:*(void *)(a1 + 56)];
}

uint64_t __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) hide];
}

- (BOOL)_shouldDisplayPanelForSession:(id)a3 documentTraits:(id)a4
{
  id v4 = a4;
  if (([v4 _isExplicitAutoFillInvocation] & 1) == 0)
  {
    id v6 = [v4 bundleId];
    if (v6)
    {
      if (isAutoFillPanelAlwaysBlockedForBundleID_onceToken != -1) {
        dispatch_once(&isAutoFillPanelAlwaysBlockedForBundleID_onceToken, &__block_literal_global_315);
      }
      if ([(id)isAutoFillPanelAlwaysBlockedForBundleID_blockedBundleIDs containsObject:v6])
      {
        char v5 = 0;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v7 = isAutoFillPanelAlwaysAllowedForBundleID_onceToken;
      id v8 = v6;
      if (v7 != -1) {
        dispatch_once(&isAutoFillPanelAlwaysAllowedForBundleID_onceToken, &__block_literal_global_324);
      }
      char v9 = [(id)isAutoFillPanelAlwaysAllowedForBundleID_allowedBundleIDs containsObject:v8];

      if (v9)
      {
        char v5 = 1;
        goto LABEL_13;
      }
    }
    id v10 = [MEMORY[0x263F82670] currentDevice];
    [v10 userInterfaceIdiom];

    char v5 = _os_feature_enabled_impl();
    goto LABEL_13;
  }
  char v5 = 1;
LABEL_14:

  return v5;
}

- (BOOL)_shouldAutomaticallyDisplayPanelForDocumentTraits:(id)a3
{
  id v3 = a3;
  if ([v3 autofillMode] && (objc_msgSend(v3, "_isExplicitAutoFillInvocation") & 1) == 0)
  {
    char v5 = [MEMORY[0x263F82670] currentDevice];
    [v5 userInterfaceIdiom];

    char v4 = _os_feature_enabled_impl();
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)_queueTextOperations:(id)a3 forSecureAppID:(id)a4 processID:(int)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v11 length])
  {
    id v13 = [MEMORY[0x263F08C38] UUID];
    id v14 = +[_AFUIQueuedOperations queuedOperationsWithSecureAppID:v11 processID:v7 textOperations:v10 completionHandler:v12];
    id v15 = AFUIServiceDelegateOSLogFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:]((uint64_t)v11, (uint64_t)v13);
    }

    [(NSLock *)self->_lock lock];
    queuedOperations = self->_queuedOperations;
    if (!queuedOperations)
    {
      id v17 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
      id v18 = self->_queuedOperations;
      self->_queuedOperations = v17;

      queuedOperations = self->_queuedOperations;
    }
    [(NSMutableDictionary *)queuedOperations setObject:v14 forKey:v13];
    [(NSLock *)self->_lock unlock];
    [(AFUIServiceDelegate *)self _scheduleExpirationOfQueuedOperations:v13];
  }
  else
  {
    id v13 = AFUIServiceDelegateOSLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:]();
    }
  }
}

- (void)_scheduleExpirationOfQueuedOperations:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, 20000000000);
  id v6 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__AFUIServiceDelegate__scheduleExpirationOfQueuedOperations___block_invoke;
  block[3] = &unk_265249678;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __61__AFUIServiceDelegate__scheduleExpirationOfQueuedOperations___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[4] lock];
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = (void *)(a1 + 32);
    id v6 = [v3[2] objectForKey:v5];

    if (v6)
    {
      id v7 = AFUIServiceDelegateOSLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __61__AFUIServiceDelegate__scheduleExpirationOfQueuedOperations___block_invoke_cold_1(v4);
      }

      [v3[2] removeObjectForKey:*v4];
    }
    [v3[4] unlock];
  }
}

- (void)_sendOrQueueTextOperations:(id)a3 session:(id)a4 withInputIdentifier:(id)a5
{
  id v16 = a4;
  lock = self->_lock;
  id v8 = a3;
  [(NSLock *)lock lock];
  id v9 = [(AFUIServiceDelegate *)self currentSessions];
  int v10 = [v9 containsObject:v16];

  [(NSLock *)self->_lock unlock];
  id v11 = [v16 documentTraits];
  id v12 = [v11 appId];
  id v13 = (void *)[v12 copy];

  id v14 = [v16 documentTraits];
  uint64_t v15 = [v14 processId];

  if (v10) {
    [(AFUIServiceDelegate *)self _sendTextOperations:v8 toSession:v16 completionHandler:0];
  }
  else {
    [(AFUIServiceDelegate *)self _queueTextOperations:v8 forSecureAppID:v13 processID:v15 completionHandler:0];
  }
}

- (id)_inputIdentifierForSession:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && ([v3 documentTraits], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [v4 documentTraits];
    int v7 = [v6 contextID];

    if (v7)
    {
      id v8 = NSNumber;
      id v9 = [v4 documentTraits];
      int v10 = [v9 processId];
      id v11 = [v4 documentTraits];
      uint64_t v12 = [v11 contextID] ^ v10;
      id v13 = [v4 documentTraits];
      id v14 = [v13 bundleId];
      uint64_t v15 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v14, "hash") ^ v12);
    }
    else
    {
      id v18 = AFUIServiceDelegateOSLogFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AFUIServiceDelegate _inputIdentifierForSession:](v4);
      }

      id v19 = NSNumber;
      id v20 = [v4 documentTraits];
      uint64_t v21 = (int)[v20 processId];
      id v22 = [v4 documentTraits];
      v23 = [v22 bundleId];
      uint64_t v15 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v23, "hash") ^ v21);
    }
  }
  else
  {
    id v16 = AFUIServiceDelegateOSLogFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AFUIServiceDelegate _inputIdentifierForSession:](v4);
    }

    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)_checkAndSendQueuedTextOperationsIfNecessary:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 documentTraits];
  id v6 = [v5 appId];

  int v7 = [v4 documentTraits];
  int v8 = [v7 processId];

  BOOL v9 = 0;
  if ([v6 length] && v8)
  {
    [(NSLock *)self->_lock lock];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__1;
    v32 = __Block_byref_object_dispose__1;
    id v33 = 0;
    queuedOperations = self->_queuedOperations;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __68__AFUIServiceDelegate__checkAndSendQueuedTextOperationsIfNecessary___block_invoke;
    v24[3] = &unk_2652496A0;
    id v11 = v6;
    int v27 = v8;
    id v25 = v11;
    long long v26 = &v28;
    [(NSMutableDictionary *)queuedOperations enumerateKeysAndObjectsUsingBlock:v24];
    if (v29[5])
    {
      uint64_t v12 = -[NSMutableDictionary objectForKey:](self->_queuedOperations, "objectForKey:");
      [(NSMutableDictionary *)self->_queuedOperations removeObjectForKey:v29[5]];
    }
    else
    {
      uint64_t v12 = 0;
    }
    [(NSLock *)self->_lock unlock];
    id v13 = AFUIServiceDelegateOSLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v18 = NSString;
      id v19 = [v12 textOperations];
      uint64_t v20 = [v4 uuid];
      uint64_t v21 = (void *)v20;
      id v22 = @"found";
      if (!v19) {
        id v22 = @"not found";
      }
      v23 = [v18 stringWithFormat:@"%s textOperations %@ for session uuid %@ (appId: %@)", "-[AFUIServiceDelegate _checkAndSendQueuedTextOperationsIfNecessary:]", v22, v20, v11];
      *(_DWORD *)buf = 138412290;
      v35 = v23;
      _os_log_debug_impl(&dword_248A91000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    id v14 = [v12 textOperations];

    BOOL v9 = v14 != 0;
    if (v14)
    {
      uint64_t v15 = [v12 textOperations];
      id v16 = [v12 completionHandler];
      [(AFUIServiceDelegate *)self _sendTextOperations:v15 toSession:v4 completionHandler:v16];
    }
    _Block_object_dispose(&v28, 8);
  }
  return v9;
}

void __68__AFUIServiceDelegate__checkAndSendQueuedTextOperationsIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v9 = a3;
  int v10 = [v9 secureAppID];
  if ([v10 isEqualToString:*(void *)(a1 + 32)])
  {
    int v11 = [v9 processID];
    int v12 = *(_DWORD *)(a1 + 48);

    if (v11 == v12)
    {
      id v13 = AFUIServiceDelegateOSLogFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __68__AFUIServiceDelegate__checkAndSendQueuedTextOperationsIfNecessary___block_invoke_cold_1();
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {
  }
}

- (void)_sendTextOperations:(id)a3 toSession:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(AFUIServiceDelegate *)self _inputIdentifierForSession:v9];
  int v12 = v11;
  if (self->_trackedInputIdentifier) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && objc_msgSend(v11, "isEqualToValue:"))
  {
    trackedInputIdentifier = self->_trackedInputIdentifier;
    self->_trackedInputIdentifier = 0;
  }
  uint64_t v15 = AFUIServiceDelegateOSLogFacility();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[AFUIServiceDelegate _sendTextOperations:toSession:completionHandler:](v9);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__AFUIServiceDelegate__sendTextOperations_toSession_completionHandler___block_invoke;
  block[3] = &unk_265249088;
  id v20 = v9;
  id v21 = v8;
  id v22 = v10;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __71__AFUIServiceDelegate__sendTextOperations_toSession_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) textToAssert];
  id v3 = [*(id *)(a1 + 32) textOperations];
  [v3 setTextToAssert:v2];

  id v4 = [*(id *)(a1 + 40) keyboardOutput];
  uint64_t v5 = [v4 insertionText];
  id v6 = [*(id *)(a1 + 32) textOperations];
  int v7 = [v6 keyboardOutput];
  [v7 setInsertionText:v5];

  id v8 = [*(id *)(a1 + 40) customInfoType];
  id v9 = [*(id *)(a1 + 32) textOperations];
  [v9 setCustomInfoType:v8];

  id v10 = [*(id *)(a1 + 40) customInfo];
  int v11 = [*(id *)(a1 + 32) textOperations];
  [v11 setCustomInfo:v10];

  int v12 = [*(id *)(a1 + 40) keyboardOutput];
  BOOL v13 = [v12 customInfo];
  id v14 = [*(id *)(a1 + 32) textOperations];
  uint64_t v15 = [v14 keyboardOutput];
  [v15 setCustomInfo:v13];

  uint64_t v16 = [*(id *)(a1 + 40) isExplicitAutoFillInvocation];
  id v17 = [*(id *)(a1 + 32) textOperations];
  [v17 setIsExplicitAutoFillInvocation:v16];

  id v18 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 48))
  {
    return objc_msgSend(v18, "flushOperationsWithResultHandler:");
  }
  else
  {
    return [v18 flushOperations];
  }
}

- (void)_sendAuthenticationStateOperation:(BOOL)a3 sessionUUID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  v29[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263F63758]);
  [v10 setCustomInfoType:@"UIKBRTICustomInfoTypeAutofill"];
  v28[0] = @"selector";
  int v11 = NSStringFromSelector(sel_handleEventFromRemoteSource_autoFillAuthentication_);
  v29[0] = v11;
  v28[1] = @"isAuthenticating";
  int v12 = [NSNumber numberWithBool:v6];
  v29[1] = v12;
  BOOL v13 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  [v10 setCustomInfo:v13];

  [(NSLock *)self->_lock lock];
  id v14 = [(AFUIServiceDelegate *)self _sessionForUUID:v8];
  [(NSLock *)self->_lock unlock];
  if (v14)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke;
    v24[3] = &unk_265249438;
    void v24[4] = self;
    id v25 = v10;
    id v26 = v14;
    id v27 = v9;
    id v15 = v9;
    [(AFUIServiceDelegate *)self _performBlockOnInternalQueueForUUID:v8 block:v24];

    uint64_t v16 = v25;
  }
  else
  {
    id v17 = [(AFUIServiceDelegate *)self authenticatingForDocumentTraits];
    id v18 = [v17 appId];
    id v19 = [(AFUIServiceDelegate *)self authenticatingForDocumentTraits];
    uint64_t v20 = [v19 processId];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke_3;
    v22[3] = &unk_2652496C8;
    id v23 = v9;
    id v21 = v9;
    [(AFUIServiceDelegate *)self _queueTextOperations:v10 forSecureAppID:v18 processID:v20 completionHandler:v22];

    uint64_t v16 = v23;
  }
}

void __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke_2;
  v4[3] = &unk_2652496C8;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _sendTextOperations:v2 toSession:v3 completionHandler:v4];
}

uint64_t __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)authenticationWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = AFUIServiceDelegateOSLogFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AFUIServiceDelegate authenticationWillBeginForSessionUUID:completion:](a2);
  }

  [(AFUIServiceDelegate *)self setAuthenticatingForSessionId:v8];
  [(NSLock *)self->_lock lock];
  id v10 = [(AFUIServiceDelegate *)self _sessionForUUID:v8];
  int v11 = [v10 documentTraits];
  [(AFUIServiceDelegate *)self setAuthenticatingForDocumentTraits:v11];

  [(NSLock *)self->_lock unlock];
  [(AFUIServiceDelegate *)self _sendAuthenticationStateOperation:1 sessionUUID:v8 completion:v7];
}

- (void)authenticationDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = AFUIServiceDelegateOSLogFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AFUIServiceDelegate authenticationDidEndForSessionUUID:completion:](a2);
  }

  [(AFUIServiceDelegate *)self _sendAuthenticationStateOperation:0 sessionUUID:v8 completion:v7];
  [(AFUIServiceDelegate *)self setAuthenticatingForSessionId:0];
  [(AFUIServiceDelegate *)self setAuthenticatingForDocumentTraits:0];
}

- (void)contactsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AFUIServiceDelegate *)self setContactsUIShowingForSessionId:v7];
  [(AFUIServiceDelegate *)self _performBlockOnInternalQueueForUUID:v7 block:v6];
}

- (void)contactsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AFUIServiceDelegate *)self setContactsUIShowingForSessionId:0];
  [(AFUIServiceDelegate *)self _performBlockOnInternalQueueForUUID:v7 block:v6];
}

- (void)passwordsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AFUIServiceDelegate *)self setPasswordsUIShowingForSessionId:v7];
  [(AFUIServiceDelegate *)self _performBlockOnInternalQueueForUUID:v7 block:v6];
}

- (void)passwordsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AFUIServiceDelegate *)self setPasswordsUIShowingForSessionId:0];
  [(AFUIServiceDelegate *)self _performBlockOnInternalQueueForUUID:v7 block:v6];
}

- (void)creditCardsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AFUIServiceDelegate *)self setCreditCardsUIShowingForSessionId:v7];
  [(AFUIServiceDelegate *)self _performBlockOnInternalQueueForUUID:v7 block:v6];
}

- (void)creditCardsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AFUIServiceDelegate *)self setCreditCardsUIShowingForSessionId:0];
  [(AFUIServiceDelegate *)self _performBlockOnInternalQueueForUUID:v7 block:v6];
}

- (void)_performBlockOnInternalQueueForUUID:(id)a3 block:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    dispatch_block_t block = v6;
    lock = self->_lock;
    id v8 = a3;
    [(NSLock *)lock lock];
    id v9 = [(AFUIServiceDelegate *)self _sessionForUUID:v8];

    id v10 = [v9 internalQueue];

    [(NSLock *)self->_lock unlock];
    if (v10) {
      dispatch_async(v10, block);
    }

    id v6 = block;
  }
}

- (void)_setIsMenuPresented:(BOOL)a3 forSessionUUID:(id)a4
{
  BOOL v4 = a3;
  v15[2] = *MEMORY[0x263EF8340];
  id v6 = (objc_class *)MEMORY[0x263F63758];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  [v8 setCustomInfoType:@"UIKBRTICustomInfoTypeAutofill"];
  v14[0] = @"selector";
  id v9 = NSStringFromSelector(sel_handleEventFromRemoteSource_autoFillIsMenuPresented_);
  v14[1] = @"isMenuPresented";
  v15[0] = v9;
  id v10 = [NSNumber numberWithBool:v4];
  v15[1] = v10;
  int v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v8 setCustomInfo:v11];

  [(NSLock *)self->_lock lock];
  int v12 = [(AFUIServiceDelegate *)self _sessionForUUID:v7];

  [(NSLock *)self->_lock unlock];
  BOOL v13 = [(AFUIServiceDelegate *)self _inputIdentifierForSession:v12];
  [(AFUIServiceDelegate *)self _sendOrQueueTextOperations:v8 session:v12 withInputIdentifier:v13];
}

- (void)setIsMenuPresented:(BOOL)a3 forSessionUUID:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__AFUIServiceDelegate_setIsMenuPresented_forSessionUUID___block_invoke;
  v8[3] = &unk_265249038;
  BOOL v10 = a3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(AFUIServiceDelegate *)self _performBlockOnInternalQueueForUUID:v7 block:v8];
}

uint64_t __57__AFUIServiceDelegate_setIsMenuPresented_forSessionUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setIsMenuPresented:*(unsigned __int8 *)(a1 + 48) forSessionUUID:*(void *)(a1 + 40)];
}

- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4 options:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a4;
  [(NSLock *)self->_lock lock];
  id v8 = [(AFUIServiceDelegate *)self currentSessions];
  [v8 addObject:v7];

  [(NSLock *)self->_lock unlock];
  id v9 = AFUIServiceDelegateOSLogFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v46 = NSString;
    v47 = [v7 documentTraits];
    BOOL v10 = [v47 bundleId];
    int v11 = [v7 uuid];
    [v7 documentTraits];
    int v12 = v48 = a2;
    BOOL v13 = [v12 appName];
    id v14 = [v7 documentTraits];
    uint64_t v15 = [v14 processId];
    uint64_t v16 = [v7 documentTraits];
    objc_msgSend(v46, "stringWithFormat:", @"%s Session info. Bundle ID: %@; uuid: %@; appName: %@; processId: %d; contextID: %u",
      "-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]",
      v10,
      v11,
      v13,
      v15,
    id v17 = [v16 contextID]);
    *(_DWORD *)buf = 138412290;
    v50 = v17;
    _os_log_impl(&dword_248A91000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    a2 = v48;
  }

  if (self->_trackedInputIdentifier)
  {
    uint64_t v18 = [(AFUIServiceDelegate *)self _inputIdentifierForSession:v7];
    if (v18)
    {
      id v19 = (void *)v18;
      trackedInputIdentifier = self->_trackedInputIdentifier;
      id v21 = [(AFUIServiceDelegate *)self _inputIdentifierForSession:v7];
      LODWORD(trackedInputIdentifier) = [(NSNumber *)trackedInputIdentifier isEqual:v21];

      if (trackedInputIdentifier)
      {
        id v22 = [v7 uuid];
        [(AFUIServiceDelegate *)self _tearDownPanelsExceptForSessionUUID:v22];

        id v23 = self->_trackedInputIdentifier;
        self->_trackedInputIdentifier = 0;
      }
    }
  }
  id v24 = [v7 documentTraits];
  id v25 = [v24 bundleId];
  if ([v25 isEqualToString:@"com.apple.CoreAuthUI"])
  {

    goto LABEL_10;
  }
  id v26 = [v7 documentTraits];
  id v27 = [v26 bundleId];
  int v28 = [v27 isEqualToString:@"com.apple.ContactsUI.ContactsViewService"];

  if (v28)
  {
LABEL_10:
    v29 = AFUIServiceDelegateOSLogFacility();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:](a2);
    }
    goto LABEL_12;
  }
  uint64_t v30 = [v7 uuid];
  uint64_t v31 = [(AFUIServiceDelegate *)self authenticatingForSessionId];
  int v32 = [v30 isEqual:v31];

  if (v32)
  {
    v29 = AFUIServiceDelegateOSLogFacility();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]();
    }
  }
  else
  {
    id v33 = [v7 uuid];
    v34 = [(AFUIServiceDelegate *)self contactsUIShowingForSessionId];
    int v35 = [v33 isEqual:v34];

    if (v35)
    {
      v29 = AFUIServiceDelegateOSLogFacility();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]();
      }
    }
    else
    {
      uint64_t v36 = [v7 uuid];
      v37 = [(AFUIServiceDelegate *)self passwordsUIShowingForSessionId];
      int v38 = [v36 isEqual:v37];

      if (v38)
      {
        v29 = AFUIServiceDelegateOSLogFacility();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.4();
        }
      }
      else
      {
        v39 = [v7 uuid];
        v40 = [(AFUIServiceDelegate *)self creditCardsUIShowingForSessionId];
        int v41 = [v39 isEqual:v40];

        v29 = AFUIServiceDelegateOSLogFacility();
        BOOL v42 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
        if (v41)
        {
          if (v42) {
            -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.5();
          }
        }
        else
        {
          if (v42) {
            -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.8();
          }

          if (-[AFUIServiceDelegate _checkAndSendQueuedTextOperationsIfNecessary:](self, "_checkAndSendQueuedTextOperationsIfNecessary:", v7)|| ([v7 documentTraits], v43 = objc_claimAutoreleasedReturnValue(), BOOL v44 = -[AFUIServiceDelegate _shouldAutomaticallyDisplayPanelForDocumentTraits:](self, "_shouldAutomaticallyDisplayPanelForDocumentTraits:", v43), v43, !v44))
          {
            v29 = AFUIServiceDelegateOSLogFacility();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.6(a2, v7);
            }
          }
          else
          {
            v45 = AFUIServiceDelegateOSLogFacility();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
              -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.7();
            }

            v29 = [v7 documentTraits];
            [(AFUIServiceDelegate *)self _displayPanelForSession:v7 traits:v29];
          }
        }
      }
    }
  }
LABEL_12:
}

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4 options:(id)a5
{
  id v7 = a4;
  [(NSLock *)self->_lock lock];
  id v8 = [(AFUIServiceDelegate *)self currentSessions];
  [v8 removeObject:v7];

  [(NSLock *)self->_lock unlock];
  id v9 = [v7 documentTraits];
  BOOL v10 = [v9 bundleId];
  if ([v10 isEqualToString:@"com.apple.CoreAuthUI"])
  {

    goto LABEL_4;
  }
  int v11 = [v7 documentTraits];
  int v12 = [v11 bundleId];
  int v13 = [v12 isEqualToString:@"com.apple.ContactsUI.ContactsViewService"];

  if (v13)
  {
LABEL_4:
    id v14 = AFUIServiceDelegateOSLogFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:](a2);
    }
    goto LABEL_6;
  }
  uint64_t v15 = [v7 uuid];
  uint64_t v16 = [(AFUIServiceDelegate *)self authenticatingForSessionId];
  int v17 = [v15 isEqual:v16];

  if (v17)
  {
    id v14 = AFUIServiceDelegateOSLogFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]();
    }
  }
  else
  {
    uint64_t v18 = [v7 uuid];
    id v19 = [(AFUIServiceDelegate *)self contactsUIShowingForSessionId];
    int v20 = [v18 isEqual:v19];

    if (v20)
    {
      id v14 = AFUIServiceDelegateOSLogFacility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]();
      }
    }
    else
    {
      id v21 = [v7 uuid];
      id v22 = [(AFUIServiceDelegate *)self passwordsUIShowingForSessionId];
      int v23 = [v21 isEqual:v22];

      if (v23)
      {
        id v14 = AFUIServiceDelegateOSLogFacility();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:].cold.4();
        }
      }
      else
      {
        id v24 = [v7 uuid];
        id v25 = [(AFUIServiceDelegate *)self creditCardsUIShowingForSessionId];
        int v26 = [v24 isEqual:v25];

        id v14 = AFUIServiceDelegateOSLogFacility();
        BOOL v27 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
        if (v26)
        {
          if (v27) {
            -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:].cold.5();
          }
        }
        else
        {
          if (v27) {
            -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:].cold.6();
          }

          id v14 = [v7 uuid];
          [(AFUIServiceDelegate *)self _tearDownPanelForSessionUUID:v14];
        }
      }
    }
  }
LABEL_6:
}

- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4
{
  id v5 = a4;
  [(NSLock *)self->_lock lock];
  id v6 = [(AFUIServiceDelegate *)self currentSessions];
  [v6 removeObject:v5];

  [(NSLock *)self->_lock unlock];
  id v7 = AFUIServiceDelegateOSLogFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AFUIServiceDelegate inputSystemService:inputSessionDidDie:]();
  }

  id v8 = [v5 uuid];
  [(AFUIServiceDelegate *)self _tearDownPanelForSessionUUID:v8];
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 documentStateDidChange:(id)a5
{
  id v7 = a5;
  sessionPanels = self->_sessionPanels;
  id v9 = [a4 uuid];
  BOOL v10 = [(NSMutableDictionary *)sessionPanels objectForKey:v9];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__AFUIServiceDelegate_inputSystemService_inputSession_documentStateDidChange___block_invoke;
  v13[3] = &unk_265249460;
  id v14 = v10;
  id v15 = v7;
  id v11 = v7;
  id v12 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

uint64_t __78__AFUIServiceDelegate_inputSystemService_inputSession_documentStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) documentStateChanged:*(void *)(a1 + 40)];
}

- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5
{
  id v6 = a4;
  sessionPanels = self->_sessionPanels;
  id v8 = [v6 uuid];
  id v9 = [(NSMutableDictionary *)sessionPanels objectForKey:v8];

  BOOL v10 = AFUIServiceDelegateOSLogFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AFUIServiceDelegate inputSystemService:inputSessionDidPause:withReason:]();
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__AFUIServiceDelegate_inputSystemService_inputSessionDidPause_withReason___block_invoke;
  block[3] = &unk_265249280;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74__AFUIServiceDelegate_inputSystemService_inputSessionDidPause_withReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) transientHide];
}

- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5
{
  id v6 = a4;
  sessionPanels = self->_sessionPanels;
  id v8 = [v6 uuid];
  id v9 = [(NSMutableDictionary *)sessionPanels objectForKey:v8];

  BOOL v10 = AFUIServiceDelegateOSLogFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AFUIServiceDelegate inputSystemService:inputSessionDidUnpause:withReason:]();
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__AFUIServiceDelegate_inputSystemService_inputSessionDidUnpause_withReason___block_invoke;
  block[3] = &unk_265249280;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __76__AFUIServiceDelegate_inputSystemService_inputSessionDidUnpause_withReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) transientUnhide];
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 performInputOperation:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [v8 documentTraits];
  id v11 = [v10 bundleId];

  if (([v11 isEqualToString:@"com.apple.CoreAuthUI"] & 1) != 0
    || [v11 isEqualToString:@"com.apple.ContactsUI.ContactsViewService"])
  {
    id v12 = AFUIServiceDelegateOSLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[AFUIServiceDelegate inputSystemService:inputSession:performInputOperation:](a2);
    }
    goto LABEL_5;
  }
  id v13 = AFUIServiceDelegateOSLogFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[AFUIServiceDelegate inputSystemService:inputSession:performInputOperation:]();
  }

  id v14 = [v9 customInfoType];
  int v15 = [v14 isEqualToString:@"UIUserInteractionRemoteInputOperations"];

  if (!v15) {
    goto LABEL_6;
  }
  if ((char *)[v9 actionSelector] == sel_dismissAutoFillPanel
    || (char *)[v9 actionSelector] == sel_dismissAutoFillMenu)
  {
    sessionPanels = self->_sessionPanels;
    uint64_t v18 = [v8 uuid];
    id v19 = [(NSMutableDictionary *)sessionPanels objectForKey:v18];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __77__AFUIServiceDelegate_inputSystemService_inputSession_performInputOperation___block_invoke;
    v22[3] = &unk_265249460;
    id v23 = v9;
    id v24 = v19;
    id v12 = v19;
    dispatch_async(MEMORY[0x263EF83A0], v22);

LABEL_5:
    goto LABEL_6;
  }
  if ([v9 actionSelector]
    && (char *)[v9 actionSelector] == sel_handleAutoFillContactPopoverCommand)
  {
    uint64_t v16 = 1;
LABEL_31:
    uint64_t v20 = 7;
    goto LABEL_34;
  }
  if ([v9 actionSelector]
    && (char *)[v9 actionSelector] == sel_handleAutoFillCreditCardPopoverCommand)
  {
    uint64_t v16 = 1;
LABEL_33:
    uint64_t v20 = 9;
    goto LABEL_34;
  }
  if ([v9 actionSelector]
    && (char *)[v9 actionSelector] == sel_handleAutoFillPasswordPopoverCommand)
  {
    uint64_t v16 = 1;
    goto LABEL_29;
  }
  if ([v9 actionSelector]
    && (char *)[v9 actionSelector] == sel_handleAutoFillContactDetected)
  {
    uint64_t v16 = 0;
    goto LABEL_31;
  }
  if ([v9 actionSelector]
    && (char *)[v9 actionSelector] == sel_handleAutoFillCreditCardDetected)
  {
    uint64_t v16 = 0;
    goto LABEL_33;
  }
  if ([v9 actionSelector]
    && (char *)[v9 actionSelector] == sel_handleAutoFillPasswordDetected)
  {
    uint64_t v16 = 0;
LABEL_29:
    uint64_t v20 = 1;
LABEL_34:
    id v21 = [v8 documentTraits];
    id v12 = [v21 copy];

    [v12 setAutofillMode:v20];
    [v12 setExplicitAutoFillMode:v16];
    [(AFUIServiceDelegate *)self _displayPanelForSession:v8 traits:v12];
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __77__AFUIServiceDelegate_inputSystemService_inputSession_performInputOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = (char *)[*(id *)(a1 + 32) actionSelector];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2 == sel_dismissAutoFillPanel)
  {
    return [v3 hide];
  }
  else
  {
    return [v3 dismissMenu];
  }
}

- (id)_sessionForUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(AFUIServiceDelegate *)self currentSessions];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        BOOL v10 = [v9 uuid];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSMutableArray)currentSessions
{
  return self->_currentSessions;
}

- (void)setCurrentSessions:(id)a3
{
}

- (NSUUID)authenticatingForSessionId
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAuthenticatingForSessionId:(id)a3
{
}

- (NSUUID)passwordsUIShowingForSessionId
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPasswordsUIShowingForSessionId:(id)a3
{
}

- (NSUUID)contactsUIShowingForSessionId
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContactsUIShowingForSessionId:(id)a3
{
}

- (NSUUID)creditCardsUIShowingForSessionId
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCreditCardsUIShowingForSessionId:(id)a3
{
}

- (RTIDocumentTraits)authenticatingForDocumentTraits
{
  return (RTIDocumentTraits *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAuthenticatingForDocumentTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatingForDocumentTraits, 0);
  objc_storeStrong((id *)&self->_creditCardsUIShowingForSessionId, 0);
  objc_storeStrong((id *)&self->_contactsUIShowingForSessionId, 0);
  objc_storeStrong((id *)&self->_passwordsUIShowingForSessionId, 0);
  objc_storeStrong((id *)&self->_authenticatingForSessionId, 0);
  objc_storeStrong((id *)&self->_currentSessions, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_trackedInputIdentifier, 0);
  objc_storeStrong((id *)&self->_queuedOperations, 0);

  objc_storeStrong((id *)&self->_sessionPanels, 0);
}

- (void)_queueTextOperations:forSecureAppID:processID:completionHandler:.cold.1()
{
  v0 = [NSString stringWithFormat:@"%s Cannot queue textOperations: secureAppID is empty"];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_248A91000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:]", v7, v8);
}

- (void)_queueTextOperations:(uint64_t)a1 forSecureAppID:(uint64_t)a2 processID:completionHandler:.cold.2(uint64_t a1, uint64_t a2)
{
  int v2 = [NSString stringWithFormat:@"%s Queueing textOperations for session with appId: %@ (payloadID: %@)"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v3, v4, "%@", v5, v6, v7, v8, (uint64_t)"-[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:]", a1, a2, v11, v12);
}

void __61__AFUIServiceDelegate__scheduleExpirationOfQueuedOperations___block_invoke_cold_1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = [NSString stringWithFormat:@"%s Queued operations are expiring unused for payloadID: %@", "-[AFUIServiceDelegate _scheduleExpirationOfQueuedOperations:]_block_invoke", *a1];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_248A91000, v2, v3, "%@", v4);
}

- (void)_inputIdentifierForSession:(void *)a1 .cold.1(void *a1)
{
  int v1 = NSString;
  uint64_t v2 = [a1 uuid];
  uint64_t v3 = [v1 stringWithFormat:@"%s Could not compute input identifier for session %@"];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_248A91000, v4, v5, "%@", v6, v7, v8, v9, (uint64_t)"-[AFUIServiceDelegate _inputIdentifierForSession:]", (uint64_t)v2, v10);
}

- (void)_inputIdentifierForSession:(void *)a1 .cold.2(void *a1)
{
  int v1 = NSString;
  uint64_t v2 = [a1 uuid];
  uint64_t v3 = [v1 stringWithFormat:@"%s ContextID is null for session %@, identifying the input with processId and bundle identifier"];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_248A91000, v4, v5, "%@", v6, v7, v8, v9, (uint64_t)"-[AFUIServiceDelegate _inputIdentifierForSession:]", (uint64_t)v2, v10);
}

void __68__AFUIServiceDelegate__checkAndSendQueuedTextOperationsIfNecessary___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  int v1 = NSString;
  uint64_t v3 = [v2 secureAppID];
  uint64_t v11 = v0;
  int v4 = [v1 stringWithFormat:@"%s Found queued textOperations for session with appId: %@ (payloadID: %@)"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate _checkAndSendQueuedTextOperationsIfNecessary:]_block_invoke", (uint64_t)v3, v11, v12, v13);
}

- (void)_sendTextOperations:(void *)a1 toSession:completionHandler:.cold.1(void *a1)
{
  id v2 = NSString;
  uint64_t v3 = [a1 uuid];
  int v4 = [a1 documentTraits];
  int v5 = [v4 appId];
  int v6 = [v2 stringWithFormat:@"%s sending textOperations for session %@ (appId: %@)"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_248A91000, v7, v8, "%@", v9, v10, v11, v12, (uint64_t)"-[AFUIServiceDelegate _sendTextOperations:toSession:completionHandler:]", (uint64_t)v3, (uint64_t)v5, v13, v14);
}

- (void)authenticationWillBeginForSessionUUID:(const char *)a1 completion:.cold.1(const char *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = NSString;
  id v2 = NSStringFromSelector(a1);
  uint64_t v3 = [v1 stringWithFormat:@"%s %@", "-[AFUIServiceDelegate authenticationWillBeginForSessionUUID:completion:]", v2];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_248A91000, v4, v5, "%@", v6);
}

- (void)authenticationDidEndForSessionUUID:(const char *)a1 completion:.cold.1(const char *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = NSString;
  id v2 = NSStringFromSelector(a1);
  uint64_t v3 = [v1 stringWithFormat:@"%s %@", "-[AFUIServiceDelegate authenticationDidEndForSessionUUID:completion:]", v2];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_248A91000, v4, v5, "%@", v6);
}

- (void)inputSystemService:(const char *)a1 inputSessionDidBegin:options:.cold.1(const char *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = NSString;
  id v2 = NSStringFromSelector(a1);
  uint64_t v3 = [v1 stringWithFormat:@"%s %@ is for a process that should be ignored", "-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]", v2];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_248A91000, v4, v5, "%@", v6);
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.2()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a session being targeted by AutoFill which is authenticating %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.3()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a session being targeted by AutoFill which is in the Contact Picker UI %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.4()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a session being targeted by AutoFill which is in the Password Picker UI %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.5()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a session being targeted by AutoFill which is in the Credit Card Picker UI %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:(const char *)a1 inputSessionDidBegin:(void *)a2 options:.cold.6(const char *a1, void *a2)
{
  SEL v3 = NSString;
  uint64_t v4 = NSStringFromSelector(a1);
  int v5 = [a2 uuid];
  int v6 = [a2 documentTraits];
  uint64_t v14 = [v6 autofillMode];
  int v7 = [v3 stringWithFormat:@"%s %@ not displaying the panel for session %@: autofillMode = %lu"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_248A91000, v8, v9, "%@", v10, v11, v12, v13, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]", (uint64_t)v4, (uint64_t)v5, v14, v15);
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.7()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ displaying the panel for session %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.8()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a new session %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:(const char *)a1 inputSessionDidEnd:options:.cold.1(const char *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = NSString;
  id v2 = NSStringFromSelector(a1);
  SEL v3 = [v1 stringWithFormat:@"%s %@ is for a process that should be ignored", "-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]", v2];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_248A91000, v4, v5, "%@", v6);
}

- (void)inputSystemService:inputSessionDidEnd:options:.cold.2()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a session being targeted by AutoFill which is authenticating %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidEnd:options:.cold.3()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a session being targeted by AutoFill which is in the Contact Picker UI %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidEnd:options:.cold.4()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a session being targeted by AutoFill which is in the Password Picker UI %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidEnd:options:.cold.5()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a session being targeted by AutoFill which is in the Credit Card Picker UI %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidEnd:options:.cold.6()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a finished session %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidDie:.cold.1()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ is for a finished session %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidDie:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidPause:withReason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ for session %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidPause:withReason:]", v11, v12, v13, v14);
}

- (void)inputSystemService:inputSessionDidUnpause:withReason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ for session %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSessionDidUnpause:withReason:]", v11, v12, v13, v14);
}

- (void)inputSystemService:(const char *)a1 inputSession:performInputOperation:.cold.1(const char *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = NSString;
  id v2 = NSStringFromSelector(a1);
  SEL v3 = [v1 stringWithFormat:@"%s %@ is for a process that should be ignored", "-[AFUIServiceDelegate inputSystemService:inputSession:performInputOperation:]", v2];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_248A91000, v4, v5, "%@", v6);
}

- (void)inputSystemService:inputSession:performInputOperation:.cold.2()
{
  OUTLINED_FUNCTION_3();
  id v2 = NSString;
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_5() uuid];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = [v2 stringWithFormat:@"%s %@ for session %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_248A91000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIServiceDelegate inputSystemService:inputSession:performInputOperation:]", v11, v12, v13, v14);
}

@end