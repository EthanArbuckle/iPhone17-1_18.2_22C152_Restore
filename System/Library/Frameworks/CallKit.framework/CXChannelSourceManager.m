@interface CXChannelSourceManager
- (CXChannelServiceServer)serviceServer;
- (CXChannelSourceManager)initWithDelegate:(id)a3 queue:(id)a4;
- (CXChannelSourceManagerDelegate)delegate;
- (CXTransactionGroup)uncommittedTransactionGroup;
- (CXTransactionManager)transactionManager;
- (NSArray)channelSources;
- (NSMutableDictionary)identifierToChannelSource;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)channelSourceForIdentifier:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (void)addAction:(id)a3 toUncommittedTransactionForChannelSource:(id)a4;
- (void)addChannelSource:(id)a3;
- (void)commitUncommittedTransactions;
- (void)failOutstandingActionsForChannelWithUUID:(id)a3;
- (void)performDelegateCallback:(id)a3;
- (void)removeChannelSource:(id)a3;
- (void)serviceServer:(id)a3 client:(id)a4 actionCompleted:(id)a5;
- (void)serviceServer:(id)a3 client:(id)a4 registeredWithConfiguration:(id)a5;
- (void)serviceServer:(id)a3 client:(id)a4 reportedAudioFinishedForChannelWithUUID:(id)a5;
- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 connectedAtDate:(id)a6;
- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 disconnectedAtDate:(id)a6 disconnectedReason:(int64_t)a7;
- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 startedConnectingAtDate:(id)a6;
- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 updated:(id)a6;
- (void)serviceServer:(id)a3 client:(id)a4 reportedIncomingTransmissionEndedForChannelWithUUID:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7;
- (void)serviceServer:(id)a3 client:(id)a4 reportedIncomingTransmissionStartedForChannelWithUUID:(id)a5 update:(id)a6 shouldReplaceOutgoingTransmission:(BOOL)a7 completionHandler:(id)a8;
- (void)serviceServer:(id)a3 client:(id)a4 requestedTransaction:(id)a5 completionHandler:(id)a6;
- (void)serviceServer:(id)a3 didAddClient:(id)a4;
- (void)serviceServer:(id)a3 didRemoveClient:(id)a4;
- (void)setUncommittedTransactionGroup:(id)a3;
- (void)transactionManager:(id)a3 actionTimedOut:(id)a4 forCallSource:(id)a5;
- (void)transactionManager:(id)a3 transactionGroupCompleted:(id)a4;
@end

@implementation CXChannelSourceManager

- (CXChannelSourceManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CXChannelSourceManager;
  v8 = [(CXChannelSourceManager *)&v28 init];
  v9 = v8;
  if (v8)
  {
    v8->_accessorLock._os_unfair_lock_opaque = 0;
    id v10 = [NSString stringWithFormat:@"com.apple.callkit.queue.%@.%p", objc_opt_class(), v8];
    v11 = (const char *)[v10 UTF8String];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v9->_delegate, v6);
    if (v7)
    {
      v15 = (OS_dispatch_queue *)v7;
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = v15;
    }
    else
    {
      v17 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v18 = MEMORY[0x1E4F14428];
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = v17;
    }

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifierToChannelSource = v9->_identifierToChannelSource;
    v9->_identifierToChannelSource = v19;

    v21 = [[CXTransactionManager alloc] initWithQueue:v9->_queue];
    transactionManager = v9->_transactionManager;
    v9->_transactionManager = v21;

    [(CXTransactionManager *)v9->_transactionManager setDelegate:v9];
    v23 = objc_alloc_init(CXTransactionGroup);
    uncommittedTransactionGroup = v9->_uncommittedTransactionGroup;
    v9->_uncommittedTransactionGroup = v23;

    v25 = objc_alloc_init(CXChannelServiceServer);
    serviceServer = v9->_serviceServer;
    v9->_serviceServer = v25;

    [(CXChannelServiceServer *)v9->_serviceServer setDelegate:v9];
    [(CXChannelServiceServer *)v9->_serviceServer activate];
  }
  return v9;
}

- (void)addChannelSource:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Asked to add channel source %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = [(CXChannelSourceManager *)self identifierToChannelSource];
  id v7 = [v4 identifier];
  [v6 setObject:v4 forKeyedSubscript:v7];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CXChannelSourceManager_addChannelSource___block_invoke;
  v8[3] = &unk_1E5CADD30;
  v8[4] = self;
  [(CXChannelSourceManager *)self performDelegateCallback:v8];
  os_unfair_lock_unlock(&self->_accessorLock);
}

void __43__CXChannelSourceManager_addChannelSource___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 channelSourcesChangedForChannelSourceManager:*(void *)(a1 + 32)];
}

- (id)channelSourceForIdentifier:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = [(CXChannelSourceManager *)self identifierToChannelSource];
  id v7 = [v6 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock(p_accessorLock);

  return v7;
}

- (NSArray)channelSources
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v4 = [(CXChannelSourceManager *)self identifierToChannelSource];
  v5 = [v4 allValues];

  os_unfair_lock_unlock(p_accessorLock);

  return (NSArray *)v5;
}

- (void)removeChannelSource:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Asked to remove channel source %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = [v4 identifier];
  id v7 = [(CXChannelSourceManager *)self identifierToChannelSource];
  v8 = [v7 objectForKeyedSubscript:v6];
  int v9 = [v8 isEqual:v4];

  if (v9)
  {
    id v10 = [(CXChannelSourceManager *)self identifierToChannelSource];
    [v10 setObject:0 forKeyedSubscript:v6];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__CXChannelSourceManager_removeChannelSource___block_invoke;
    v11[3] = &unk_1E5CADD30;
    v11[4] = self;
    [(CXChannelSourceManager *)self performDelegateCallback:v11];
  }

  os_unfair_lock_unlock(&self->_accessorLock);
}

void __46__CXChannelSourceManager_removeChannelSource___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 channelSourcesChangedForChannelSourceManager:*(void *)(a1 + 32)];
}

- (void)performDelegateCallback:(id)a3
{
  dispatch_block_t block = a3;
  id v4 = [(CXChannelSourceManager *)self delegate];

  if (v4)
  {
    v5 = [(CXChannelSourceManager *)self delegateQueue];
    dispatch_async(v5, block);
  }
}

- (void)addAction:(id)a3 toUncommittedTransactionForChannelSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CXChannelSourceManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__CXChannelSourceManager_addAction_toUncommittedTransactionForChannelSource___block_invoke;
  block[3] = &unk_1E5CADD08;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __77__CXChannelSourceManager_addAction_toUncommittedTransactionForChannelSource___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [a1[4] UUID];
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Asked to add action UUID=%@", buf, 0xCu);
  }
  id v4 = [a1[4] debugDescription];
  v5 = [a1[5] debugDescription];
  id v6 = CXOversizedLogQueue();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __77__CXChannelSourceManager_addAction_toUncommittedTransactionForChannelSource___block_invoke_6;
  id v13 = &unk_1E5CADC68;
  id v14 = v4;
  id v15 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, &v10);

  id v9 = objc_msgSend(a1[6], "uncommittedTransactionGroup", v10, v11, v12, v13);
  [v9 addAction:a1[4] forProviderSource:a1[5]];
}

void __77__CXChannelSourceManager_addAction_toUncommittedTransactionForChannelSource___block_invoke_6(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = CXOversizedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Asked to add action %@ to uncommitted transaction for channel source %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)failOutstandingActionsForChannelWithUUID:(id)a3
{
  id v4 = a3;
  int v5 = [(CXChannelSourceManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CXChannelSourceManager_failOutstandingActionsForChannelWithUUID___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__CXChannelSourceManager_failOutstandingActionsForChannelWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transactionManager];
  [v2 failOutstandingActionsForChannelWithUUID:*(void *)(a1 + 40)];
}

- (void)commitUncommittedTransactions
{
  uint64_t v3 = [(CXChannelSourceManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CXChannelSourceManager_commitUncommittedTransactions__block_invoke;
  block[3] = &unk_1E5CADD30;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __55__CXChannelSourceManager_commitUncommittedTransactions__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uncommittedTransactionGroup];
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Asked to commit uncommitted transactions: %@", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) transactionManager];
  int v5 = [*(id *)(a1 + 32) uncommittedTransactionGroup];
  [v4 addOutstandingTransactionGroup:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "uncommittedTransactionGroup", 0);
  __int16 v7 = [v6 providerSources];

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
        id v14 = [v13 transactionForProviderSource:v12];

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

- (void)serviceServer:(id)a3 client:(id)a4 actionCompleted:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 identifier];
    uint64_t v10 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v9];

    if (v10)
    {
      uint64_t v11 = [(CXChannelSourceManager *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__CXChannelSourceManager_serviceServer_client_actionCompleted___block_invoke;
      block[3] = &unk_1E5CADD08;
      void block[4] = self;
      id v13 = v10;
      id v14 = v8;
      dispatch_async(v11, block);
    }
  }
}

void __63__CXChannelSourceManager_serviceServer_client_actionCompleted___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v13 = 0;
  char v5 = [v2 channelSource:v3 shouldProcessAction:v4 error:&v13];
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
      _os_log_impl(&dword_1A6E3A000, v7, OS_LOG_TYPE_DEFAULT, "Determined that channelSource: %@, should process action: %@, error: %@", buf, 0x20u);
    }

    uint64_t v10 = [*(id *)(a1 + 32) transactionManager];
    [v10 updateWithCompletedAction:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v10 = CXDefaultLog();
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
      _os_log_error_impl(&dword_1A6E3A000, v10, OS_LOG_TYPE_ERROR, "Determined that channelSource: %@, should not process action: %@, error: %@", buf, 0x20u);
    }
  }
}

- (void)serviceServer:(id)a3 didAddClient:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = [[CXXPCChannelSource alloc] initWithClient:v6];
    [(CXChannelSourceManager *)self addChannelSource:v5];
  }
}

- (void)serviceServer:(id)a3 didRemoveClient:(id)a4
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = [v7 identifier];
    id v6 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v5];

    if (v6) {
      [(CXChannelSourceManager *)self removeChannelSource:v6];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)serviceServer:(id)a3 client:(id)a4 registeredWithConfiguration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 identifier];
    uint64_t v10 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v9];

    if (v10)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __75__CXChannelSourceManager_serviceServer_client_registeredWithConfiguration___block_invoke;
      v11[3] = &unk_1E5CADD08;
      v11[4] = self;
      id v12 = v10;
      id v13 = v8;
      [(CXChannelSourceManager *)self performDelegateCallback:v11];
    }
  }
}

void __75__CXChannelSourceManager_serviceServer_client_registeredWithConfiguration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 providerSource:*(void *)(a1 + 40) registeredWithConfiguration:*(void *)(a1 + 48)];
}

- (void)serviceServer:(id)a3 client:(id)a4 reportedAudioFinishedForChannelWithUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 identifier];
    uint64_t v10 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v9];

    if (v10)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __87__CXChannelSourceManager_serviceServer_client_reportedAudioFinishedForChannelWithUUID___block_invoke;
      v11[3] = &unk_1E5CADD08;
      v11[4] = self;
      id v12 = v10;
      id v13 = v8;
      [(CXChannelSourceManager *)self performDelegateCallback:v11];
    }
  }
}

void __87__CXChannelSourceManager_serviceServer_client_reportedAudioFinishedForChannelWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 providerSource:*(void *)(a1 + 40) reportedAudioFinishedForChannelWithUUID:*(void *)(a1 + 48)];
}

- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 startedConnectingAtDate:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v9 identifier];
    id v13 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v12];

    if (v13)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __95__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_startedConnectingAtDate___block_invoke;
      v14[3] = &unk_1E5CAE018;
      v14[4] = self;
      id v15 = v13;
      id v16 = v10;
      id v17 = v11;
      [(CXChannelSourceManager *)self performDelegateCallback:v14];
    }
  }
}

void __95__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_startedConnectingAtDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 providerSource:*(void *)(a1 + 40) reportedChannelWithUUID:*(void *)(a1 + 48) startedConnectingAtDate:*(void *)(a1 + 56)];
}

- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 connectedAtDate:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v9 identifier];
    id v13 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v12];

    if (v13)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __87__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_connectedAtDate___block_invoke;
      v14[3] = &unk_1E5CAE018;
      v14[4] = self;
      id v15 = v13;
      id v16 = v10;
      id v17 = v11;
      [(CXChannelSourceManager *)self performDelegateCallback:v14];
    }
  }
}

void __87__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_connectedAtDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 providerSource:*(void *)(a1 + 40) reportedChannelWithUUID:*(void *)(a1 + 48) connectedAtDate:*(void *)(a1 + 56)];
}

- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 disconnectedAtDate:(id)a6 disconnectedReason:(int64_t)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v11 identifier];
    id v15 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v14];

    if (v15)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __109__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_disconnectedAtDate_disconnectedReason___block_invoke;
      v16[3] = &unk_1E5CAE068;
      v16[4] = self;
      id v17 = v15;
      id v18 = v12;
      id v19 = v13;
      int64_t v20 = a7;
      [(CXChannelSourceManager *)self performDelegateCallback:v16];
    }
  }
}

void __109__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_disconnectedAtDate_disconnectedReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 providerSource:*(void *)(a1 + 40) reportedChannelWithUUID:*(void *)(a1 + 48) disconnectedAtDate:*(void *)(a1 + 56) disconnectedReason:*(void *)(a1 + 64)];
}

- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 updated:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v9 identifier];
    id v13 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v12];

    if (v13)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __79__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_updated___block_invoke;
      v14[3] = &unk_1E5CAE018;
      v14[4] = self;
      id v15 = v13;
      id v16 = v10;
      id v17 = v11;
      [(CXChannelSourceManager *)self performDelegateCallback:v14];
    }
  }
}

void __79__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_updated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 providerSource:*(void *)(a1 + 40) reportedChannelWithUUID:*(void *)(a1 + 48) updated:*(void *)(a1 + 56)];
}

- (void)serviceServer:(id)a3 client:(id)a4 reportedIncomingTransmissionEndedForChannelWithUUID:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v11 identifier];
    id v15 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v14];

    if (v15)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __124__CXChannelSourceManager_serviceServer_client_reportedIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke;
      v16[3] = &unk_1E5CAE3B8;
      v16[4] = self;
      id v17 = v15;
      id v18 = v12;
      int64_t v20 = a6;
      id v19 = v13;
      [(CXChannelSourceManager *)self performDelegateCallback:v16];
    }
  }
}

void __124__CXChannelSourceManager_serviceServer_client_reportedIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 providerSource:*(void *)(a1 + 40) reportedIncomingTransmissionEndedForChannelWithUUID:*(void *)(a1 + 48) reason:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
}

- (void)serviceServer:(id)a3 client:(id)a4 reportedIncomingTransmissionStartedForChannelWithUUID:(id)a5 update:(id)a6 shouldReplaceOutgoingTransmission:(BOOL)a7 completionHandler:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [v13 identifier];
    id v18 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v17];

    if (v18)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __160__CXChannelSourceManager_serviceServer_client_reportedIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke;
      v19[3] = &unk_1E5CAE3E0;
      v19[4] = self;
      id v20 = v18;
      id v21 = v14;
      id v22 = v15;
      BOOL v24 = a7;
      id v23 = v16;
      [(CXChannelSourceManager *)self performDelegateCallback:v19];
    }
  }
}

void __160__CXChannelSourceManager_serviceServer_client_reportedIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 providerSource:*(void *)(a1 + 40) reportedIncomingTransmissionStartedForChannelWithUUID:*(void *)(a1 + 48) update:*(void *)(a1 + 56) shouldReplaceOutgoingTransmission:*(unsigned __int8 *)(a1 + 72) completionHandler:*(void *)(a1 + 64)];
}

- (void)serviceServer:(id)a3 client:(id)a4 requestedTransaction:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v9 identifier];
    id v13 = [(CXChannelSourceManager *)self channelSourceForIdentifier:v12];

    if (v13)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __86__CXChannelSourceManager_serviceServer_client_requestedTransaction_completionHandler___block_invoke;
      v14[3] = &unk_1E5CADE60;
      v14[4] = self;
      id v15 = v13;
      id v16 = v10;
      id v17 = v11;
      [(CXChannelSourceManager *)self performDelegateCallback:v14];
    }
  }
}

void __86__CXChannelSourceManager_serviceServer_client_requestedTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 providerSource:*(void *)(a1 + 40) requestedTransaction:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)transactionManager:(id)a3 actionTimedOut:(id)a4 forCallSource:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  id v8 = CXDefaultLog();
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
  v8[2] = __71__CXChannelSourceManager_transactionManager_transactionGroupCompleted___block_invoke;
  v8[3] = &unk_1E5CADC68;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(CXChannelSourceManager *)self performDelegateCallback:v8];
}

void __71__CXChannelSourceManager_transactionManager_transactionGroupCompleted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 channelSourceManager:*(void *)(a1 + 32) completedTransactionGroup:*(void *)(a1 + 40)];
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXChannelSourceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXChannelSourceManagerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSMutableDictionary)identifierToChannelSource
{
  return self->_identifierToChannelSource;
}

- (CXChannelServiceServer)serviceServer
{
  return self->_serviceServer;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncommittedTransactionGroup, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_serviceServer, 0);
  objc_storeStrong((id *)&self->_identifierToChannelSource, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end