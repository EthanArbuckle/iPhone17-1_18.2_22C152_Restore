@interface CXCallSourceManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CXCallSourceManager)init;
- (CXCallSourceManager)initWithDelegate:(id)a3 queue:(id)a4;
- (CXCallSourceManagerDelegate)delegate;
- (CXTransactionGroup)uncommittedTransactionGroup;
- (CXTransactionManager)transactionManager;
- (NSArray)callSources;
- (NSMutableDictionary)identifierToCallSource;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)callSourceWithIdentifier:(id)a3;
- (void)_performDelegateCallback:(id)a3;
- (void)addAction:(id)a3 toUncommittedTransactionForCallSource:(id)a4;
- (void)addCallSource:(id)a3;
- (void)callSource:(id)a3 actionCompleted:(id)a4;
- (void)callSource:(id)a3 registeredWithConfiguration:(id)a4;
- (void)callSource:(id)a3 reportedAudioFinishedForCallWithUUID:(id)a4;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedFrequencyData:(id)a5 forDirection:(int64_t)a6;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedMeterLevel:(float)a5 forDirection:(int64_t)a6;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 crossDeviceIdentifier:(id)a5 changedBytesOfDataUsed:(int64_t)a6;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 endedAtDate:(id)a5 privateReason:(int64_t)a6 failureContext:(id)a7;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 receivedDTMFUpdate:(id)a5;
- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 updated:(id)a5;
- (void)callSource:(id)a3 reportedNewIncomingCallWithUUID:(id)a4 update:(id)a5 completion:(id)a6;
- (void)callSource:(id)a3 reportedNewOutgoingCallWithUUID:(id)a4 update:(id)a5;
- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 connectedAtDate:(id)a5;
- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 sentInvitationAtDate:(id)a5;
- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 startedConnectingAtDate:(id)a5;
- (void)callSource:(id)a3 requestedTransaction:(id)a4 completion:(id)a5;
- (void)callSourceConnectionEnded:(id)a3;
- (void)callSourceConnectionStarted:(id)a3;
- (void)callSourceInvalidated:(id)a3;
- (void)commitUncommittedTransactions;
- (void)failOutstandingActionsForCallWithUUID:(id)a3;
- (void)performDelegateCallback:(id)a3;
- (void)removeCallSource:(id)a3;
- (void)setUncommittedTransactionGroup:(id)a3;
- (void)transactionManager:(id)a3 actionTimedOut:(id)a4 forCallSource:(id)a5;
- (void)transactionManager:(id)a3 transactionGroupCompleted:(id)a4;
@end

@implementation CXCallSourceManager

- (CXCallSourceManager)init
{
  return 0;
}

- (CXCallSourceManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CXCallSourceManager;
  v8 = [(CXCallSourceManager *)&v26 init];
  if (v8)
  {
    v9 = (const char *)[@"com.apple.callkit.callsourcehost" UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    objc_storeWeak((id *)&v8->_delegate, v6);
    if (v7)
    {
      v13 = (OS_dispatch_queue *)v7;
      delegateQueue = v8->_delegateQueue;
      v8->_delegateQueue = v13;
    }
    else
    {
      v15 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v16 = MEMORY[0x1E4F14428];
      delegateQueue = v8->_delegateQueue;
      v8->_delegateQueue = v15;
    }

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifierToCallSource = v8->_identifierToCallSource;
    v8->_identifierToCallSource = v17;

    v19 = [[CXTransactionManager alloc] initWithQueue:v8->_queue];
    transactionManager = v8->_transactionManager;
    v8->_transactionManager = v19;

    [(CXTransactionManager *)v8->_transactionManager setDelegate:v8];
    v21 = objc_alloc_init(CXTransactionGroup);
    uncommittedTransactionGroup = v8->_uncommittedTransactionGroup;
    v8->_uncommittedTransactionGroup = v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.callkit.callsourcehost"];
    xpcListener = v8->_xpcListener;
    v8->_xpcListener = (NSXPCListener *)v23;

    [(NSXPCListener *)v8->_xpcListener setDelegate:v8];
    [(NSXPCListener *)v8->_xpcListener resume];
    notify_post("com.apple.callkit.callsourcehost.started");
  }

  return v8;
}

- (NSArray)callSources
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  dispatch_queue_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v3 = [(CXCallSourceManager *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__CXCallSourceManager_callSources__block_invoke;
  v6[3] = &unk_1E5CADEA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __34__CXCallSourceManager_callSources__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) identifierToCallSource];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addCallSource:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Asked to add call source %@", buf, 0xCu);
  }

  [v4 setDelegate:self];
  id v6 = [(CXCallSourceManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__CXCallSourceManager_addCallSource___block_invoke;
  v8[3] = &unk_1E5CADC68;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __37__CXCallSourceManager_addCallSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) identifierToCallSource];
  id v4 = [*(id *)(a1 + 40) identifier];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = [*(id *)(a1 + 32) delegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__CXCallSourceManager_addCallSource___block_invoke_2;
  v8[3] = &unk_1E5CADC68;
  id v6 = *(void **)(a1 + 32);
  id v9 = v5;
  v10 = v6;
  id v7 = v5;
  [v6 _performDelegateCallback:v8];
}

uint64_t __37__CXCallSourceManager_addCallSource___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callSourcesChangedForCallSourceManager:*(void *)(a1 + 40)];
}

- (id)callSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v5 = [(CXCallSourceManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CXCallSourceManager_callSourceWithIdentifier___block_invoke;
  block[3] = &unk_1E5CADFC8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__CXCallSourceManager_callSourceWithIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) identifierToCallSource];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeCallSource:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Asked to remove call source %@", buf, 0xCu);
  }

  id v6 = [(CXCallSourceManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__CXCallSourceManager_removeCallSource___block_invoke;
  v8[3] = &unk_1E5CADC68;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __40__CXCallSourceManager_removeCallSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [*(id *)(a1 + 40) identifierToCallSource];
  id v4 = [v3 objectForKeyedSubscript:v2];
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) identifierToCallSource];
    [v6 setObject:0 forKeyedSubscript:v2];

    id v7 = [*(id *)(a1 + 40) delegate];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__CXCallSourceManager_removeCallSource___block_invoke_2;
    v10[3] = &unk_1E5CADC68;
    v8 = *(void **)(a1 + 40);
    id v11 = v7;
    id v12 = v8;
    id v9 = v7;
    [v8 _performDelegateCallback:v10];
  }
}

uint64_t __40__CXCallSourceManager_removeCallSource___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callSourcesChangedForCallSourceManager:*(void *)(a1 + 40)];
}

- (void)addAction:(id)a3 toUncommittedTransactionForCallSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CXCallSourceManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CXCallSourceManager_addAction_toUncommittedTransactionForCallSource___block_invoke;
  block[3] = &unk_1E5CADD08;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __71__CXCallSourceManager_addAction_toUncommittedTransactionForCallSource___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [a1[4] UUID];
    *(_DWORD *)buf = 138412290;
    id v17 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Asked to add action UUID=%@", buf, 0xCu);
  }
  id v4 = [a1[4] debugDescription];
  int v5 = [a1[5] debugDescription];
  id v6 = CXOversizedLogQueue();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __71__CXCallSourceManager_addAction_toUncommittedTransactionForCallSource___block_invoke_4;
  id v13 = &unk_1E5CADC68;
  id v14 = v4;
  id v15 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, &v10);

  id v9 = objc_msgSend(a1[6], "uncommittedTransactionGroup", v10, v11, v12, v13);
  [v9 addAction:a1[4] forCallSource:a1[5]];
}

void __71__CXCallSourceManager_addAction_toUncommittedTransactionForCallSource___block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CXOversizedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Asked to add action %@ to uncommitted transaction for call source %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)commitUncommittedTransactions
{
  uint64_t v3 = [(CXCallSourceManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CXCallSourceManager_commitUncommittedTransactions__block_invoke;
  block[3] = &unk_1E5CADD30;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __52__CXCallSourceManager_commitUncommittedTransactions__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uncommittedTransactionGroup];
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Asked to commit uncommitted transactions: %@", buf, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) transactionManager];
  int v5 = [*(id *)(a1 + 32) uncommittedTransactionGroup];
  [v4 addOutstandingTransactionGroup:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "uncommittedTransactionGroup", 0);
  __int16 v7 = [v6 callSources];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        id v13 = [*(id *)(a1 + 32) uncommittedTransactionGroup];
        id v14 = [v13 transactionForCallSource:v12];

        [v12 commitTransaction:v14];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v15 = objc_alloc_init(CXTransactionGroup);
  [*(id *)(a1 + 32) setUncommittedTransactionGroup:v15];
}

- (void)failOutstandingActionsForCallWithUUID:(id)a3
{
  id v4 = a3;
  int v5 = [(CXCallSourceManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CXCallSourceManager_failOutstandingActionsForCallWithUUID___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__CXCallSourceManager_failOutstandingActionsForCallWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transactionManager];
  [v2 failOutstandingActionsForCallWithUUID:*(void *)(a1 + 40)];
}

- (void)performDelegateCallback:(id)a3
{
  id v4 = a3;
  int v5 = [(CXCallSourceManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CXCallSourceManager_performDelegateCallback___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__CXCallSourceManager_performDelegateCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDelegateCallback:*(void *)(a1 + 40)];
}

- (void)_performDelegateCallback:(id)a3
{
  dispatch_block_t block = a3;
  id v4 = [(CXCallSourceManager *)self delegate];

  if (v4)
  {
    int v5 = [(CXCallSourceManager *)self delegateQueue];
    dispatch_async(v5, block);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "listener: %@ newConnection: %@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v9 = [[CXXPCCallSource alloc] initWithConnection:v7];
  if (v9)
  {
    [(CXCallSourceManager *)self addCallSource:v9];
  }
  else
  {
    uint64_t v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Not accepting connection %@ because a CXXPCCallSource couldn't be created", (uint8_t *)&v12, 0xCu);
    }
  }
  return v9 != 0;
}

- (void)callSourceConnectionStarted:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Call source connection started: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)callSourceConnectionEnded:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Call source connection ended: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)callSourceInvalidated:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Call source invalidated: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CXCallSourceManager *)self removeCallSource:v4];
}

- (void)callSource:(id)a3 registeredWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CXCallSourceManager_callSource_registeredWithConfiguration___block_invoke;
  v10[3] = &unk_1E5CADD08;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CXCallSourceManager *)self performDelegateCallback:v10];
}

void __62__CXCallSourceManager_callSource_registeredWithConfiguration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) registeredWithConfiguration:*(void *)(a1 + 48)];
}

- (void)callSource:(id)a3 reportedNewIncomingCallWithUUID:(id)a4 update:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__CXCallSourceManager_callSource_reportedNewIncomingCallWithUUID_update_completion___block_invoke;
  v18[3] = &unk_1E5CADFF0;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(CXCallSourceManager *)self performDelegateCallback:v18];
}

void __84__CXCallSourceManager_callSource_reportedNewIncomingCallWithUUID_update_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedNewIncomingCallWithUUID:*(void *)(a1 + 48) update:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 updated:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CXCallSourceManager_callSource_reportedCallWithUUID_updated___block_invoke;
  v14[3] = &unk_1E5CAE018;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CXCallSourceManager *)self performDelegateCallback:v14];
}

void __63__CXCallSourceManager_callSource_reportedCallWithUUID_updated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedCallWithUUID:*(void *)(a1 + 48) updated:*(void *)(a1 + 56)];
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 receivedDTMFUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CXCallSourceManager_callSource_reportedCallWithUUID_receivedDTMFUpdate___block_invoke;
  v14[3] = &unk_1E5CAE018;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CXCallSourceManager *)self performDelegateCallback:v14];
}

void __74__CXCallSourceManager_callSource_reportedCallWithUUID_receivedDTMFUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedCallWithUUID:*(void *)(a1 + 48) receivedDTMFUpdate:*(void *)(a1 + 56)];
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 endedAtDate:(id)a5 privateReason:(int64_t)a6 failureContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__CXCallSourceManager_callSource_reportedCallWithUUID_endedAtDate_privateReason_failureContext___block_invoke;
  v20[3] = &unk_1E5CAE040;
  v20[4] = self;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  id v24 = v15;
  int64_t v25 = a6;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  [(CXCallSourceManager *)self performDelegateCallback:v20];
}

void __96__CXCallSourceManager_callSource_reportedCallWithUUID_endedAtDate_privateReason_failureContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedCallWithUUID:*(void *)(a1 + 48) endedAtDate:*(void *)(a1 + 56) privateReason:*(void *)(a1 + 72) failureContext:*(void *)(a1 + 64)];
}

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 sentInvitationAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_sentInvitationAtDate___block_invoke;
  v14[3] = &unk_1E5CAE018;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CXCallSourceManager *)self performDelegateCallback:v14];
}

void __84__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_sentInvitationAtDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedOutgoingCallWithUUID:*(void *)(a1 + 48) sentInvitationAtDate:*(void *)(a1 + 56)];
}

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 startedConnectingAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_startedConnectingAtDate___block_invoke;
  v14[3] = &unk_1E5CAE018;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CXCallSourceManager *)self performDelegateCallback:v14];
}

void __87__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_startedConnectingAtDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedOutgoingCallWithUUID:*(void *)(a1 + 48) startedConnectingAtDate:*(void *)(a1 + 56)];
}

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 connectedAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_connectedAtDate___block_invoke;
  v14[3] = &unk_1E5CAE018;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CXCallSourceManager *)self performDelegateCallback:v14];
}

void __79__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_connectedAtDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedOutgoingCallWithUUID:*(void *)(a1 + 48) connectedAtDate:*(void *)(a1 + 56)];
}

- (void)callSource:(id)a3 reportedNewOutgoingCallWithUUID:(id)a4 update:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__CXCallSourceManager_callSource_reportedNewOutgoingCallWithUUID_update___block_invoke;
  v14[3] = &unk_1E5CAE018;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CXCallSourceManager *)self performDelegateCallback:v14];
}

void __73__CXCallSourceManager_callSource_reportedNewOutgoingCallWithUUID_update___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedNewOutgoingCallWithUUID:*(void *)(a1 + 48) update:*(void *)(a1 + 56)];
}

- (void)callSource:(id)a3 reportedAudioFinishedForCallWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CXCallSourceManager_callSource_reportedAudioFinishedForCallWithUUID___block_invoke;
  v10[3] = &unk_1E5CADD08;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CXCallSourceManager *)self performDelegateCallback:v10];
}

void __71__CXCallSourceManager_callSource_reportedAudioFinishedForCallWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedAudioFinishedForCallWithUUID:*(void *)(a1 + 48)];
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedFrequencyData:(id)a5 forDirection:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__CXCallSourceManager_callSource_reportedCallWithUUID_changedFrequencyData_forDirection___block_invoke;
  v16[3] = &unk_1E5CAE068;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  int64_t v20 = a6;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(CXCallSourceManager *)self performDelegateCallback:v16];
}

void __89__CXCallSourceManager_callSource_reportedCallWithUUID_changedFrequencyData_forDirection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedCallWithUUID:*(void *)(a1 + 48) changedFrequencyData:*(void *)(a1 + 56) forDirection:*(void *)(a1 + 64)];
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedMeterLevel:(float)a5 forDirection:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__CXCallSourceManager_callSource_reportedCallWithUUID_changedMeterLevel_forDirection___block_invoke;
  v14[3] = &unk_1E5CAE090;
  v14[4] = self;
  id v15 = v10;
  float v18 = a5;
  id v16 = v11;
  int64_t v17 = a6;
  id v12 = v11;
  id v13 = v10;
  [(CXCallSourceManager *)self performDelegateCallback:v14];
}

void __86__CXCallSourceManager_callSource_reportedCallWithUUID_changedMeterLevel_forDirection___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  LODWORD(v2) = *(_DWORD *)(a1 + 64);
  [v3 callSource:*(void *)(a1 + 40) reportedCallWithUUID:*(void *)(a1 + 48) changedMeterLevel:*(void *)(a1 + 56) forDirection:v2];
}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 crossDeviceIdentifier:(id)a5 changedBytesOfDataUsed:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100__CXCallSourceManager_callSource_reportedCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed___block_invoke;
  v16[3] = &unk_1E5CAE068;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  int64_t v20 = a6;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(CXCallSourceManager *)self performDelegateCallback:v16];
}

void __100__CXCallSourceManager_callSource_reportedCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) reportedCallWithUUID:*(void *)(a1 + 48) crossDeviceIdentifier:*(void *)(a1 + 56) changedBytesOfDataUsed:*(void *)(a1 + 64)];
}

- (void)callSource:(id)a3 requestedTransaction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__CXCallSourceManager_callSource_requestedTransaction_completion___block_invoke;
  v14[3] = &unk_1E5CADE60;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CXCallSourceManager *)self performDelegateCallback:v14];
}

void __66__CXCallSourceManager_callSource_requestedTransaction_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSource:*(void *)(a1 + 40) requestedTransaction:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)callSource:(id)a3 actionCompleted:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXCallSourceManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CXCallSourceManager_callSource_actionCompleted___block_invoke;
  block[3] = &unk_1E5CADD08;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__CXCallSourceManager_callSource_actionCompleted___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v13 = 0;
  char v5 = [v2 callSource:v3 shouldProcessAction:v4 error:&v13];
  id v6 = v13;

  if ((v5 & 1) != 0 || v6 && ([v6 code] == 5 || objc_msgSend(v6, "code") == 7))
  {
    id v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1A6E3A000, v7, OS_LOG_TYPE_DEFAULT, "Determined that callSource: %@, should process action: %@, error: %@", buf, 0x20u);
    }

    id v10 = [*(id *)(a1 + 32) transactionManager];
    [v10 updateWithCompletedAction:*(void *)(a1 + 48)];
  }
  else
  {
    id v10 = CXDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_ERROR, "Determined that callSource: %@, should not process action: %@, error: %@", buf, 0x20u);
    }
  }
}

- (void)transactionManager:(id)a3 actionTimedOut:(id)a4 forCallSource:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Action %@ timed out for call source %@", (uint8_t *)&v9, 0x16u);
  }

  [v7 handleActionTimeout:v6];
}

- (void)transactionManager:(id)a3 transactionGroupCompleted:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = CXDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1A6E3A000, v6, OS_LOG_TYPE_DEFAULT, "Notifying delegate of completed transaction group: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CXCallSourceManager_transactionManager_transactionGroupCompleted___block_invoke;
  v8[3] = &unk_1E5CADC68;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(CXCallSourceManager *)self performDelegateCallback:v8];
}

void __68__CXCallSourceManager_transactionManager_transactionGroupCompleted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callSourceManager:*(void *)(a1 + 32) completedTransactionGroup:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXCallSourceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXCallSourceManagerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSMutableDictionary)identifierToCallSource
{
  return self->_identifierToCallSource;
}

- (CXTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (CXTransactionGroup)uncommittedTransactionGroup
{
  return self->_uncommittedTransactionGroup;
}

- (void)setUncommittedTransactionGroup:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_uncommittedTransactionGroup, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_identifierToCallSource, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end