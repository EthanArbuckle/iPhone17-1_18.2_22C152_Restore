@interface CXChannelServiceServer
- (BSServiceConnection)connection;
- (BSServiceConnectionListener)listener;
- (CXChannelServiceDefinition)definition;
- (CXChannelServiceServer)init;
- (CXChannelServiceServerDelegate)delegate;
- (CXTransactionGroup)uncommittedTransactionGroup;
- (CXTransactionManager)transactionManager;
- (NSArray)clients;
- (NSMutableDictionary)identifierToClient;
- (OS_dispatch_queue)queue;
- (id)clientForIdentifier:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (void)activate;
- (void)addAction:(id)a3 toUncommittedTransactionForServiceClient:(id)a4;
- (void)addClient:(id)a3;
- (void)commitUncommittedTransactions;
- (void)dealloc;
- (void)failOutstandingActionsForChannelWithUUID:(id)a3;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeClient:(id)a3;
- (void)serviceClient:(id)a3 actionCompleted:(id)a4;
- (void)serviceClient:(id)a3 registeredWithConfiguration:(id)a4;
- (void)serviceClient:(id)a3 reportedAudioFinishedForChannelWithUUID:(id)a4;
- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 connectedAtDate:(id)a5;
- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 disconnectedAtDate:(id)a5 disconnectedReason:(int64_t)a6;
- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 startedConnectingAtDate:(id)a5;
- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 updated:(id)a5;
- (void)serviceClient:(id)a3 reportedIncomingTransmissionEndedForChannelWithUUID:(id)a4 reason:(int64_t)a5 completionHandler:(id)a6;
- (void)serviceClient:(id)a3 reportedIncomingTransmissionStartedForChannelWithUUID:(id)a4 update:(id)a5 shouldReplaceOutgoingTransmission:(BOOL)a6 completionHandler:(id)a7;
- (void)serviceClient:(id)a3 requestedTransaction:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setUncommittedTransactionGroup:(id)a3;
@end

@implementation CXChannelServiceServer

- (CXChannelServiceServer)init
{
  v25.receiver = self;
  v25.super_class = (Class)CXChannelServiceServer;
  v2 = [(CXChannelServiceServer *)&v25 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifierToClient = v3->_identifierToClient;
    v3->_identifierToClient = v4;

    id v6 = [NSString stringWithFormat:@"com.apple.callkit.queue.%@.%p", objc_opt_class(), v3];
    v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    v11 = [[CXTransactionManager alloc] initWithQueue:v3->_queue];
    transactionManager = v3->_transactionManager;
    v3->_transactionManager = v11;

    v13 = objc_alloc_init(CXTransactionGroup);
    uncommittedTransactionGroup = v3->_uncommittedTransactionGroup;
    v3->_uncommittedTransactionGroup = v13;

    v15 = objc_alloc_init(CXChannelServiceDefinition);
    objc_storeStrong((id *)&v3->_definition, v15);
    v16 = (void *)MEMORY[0x1E4F50BC8];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __30__CXChannelServiceServer_init__block_invoke;
    v22[3] = &unk_1E5CADC90;
    v23 = v15;
    v17 = v3;
    v24 = v17;
    v18 = v15;
    uint64_t v19 = [v16 listenerWithConfigurator:v22];
    listener = v17->_listener;
    v17->_listener = (BSServiceConnectionListener *)v19;
  }
  return v3;
}

void __30__CXChannelServiceServer_init__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v7 = a2;
  v4 = [v3 domain];
  v5 = [v4 name];
  [v7 setDomain:v5];

  id v6 = [*(id *)(a1 + 32) name];
  [v7 setService:v6];

  [v7 setDelegate:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CXChannelServiceServer;
  [(CXChannelServiceServer *)&v3 dealloc];
}

- (void)activate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CXChannelServiceServer *)self listener];
  [v3 activate];

  v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(CXChannelServiceServer *)self listener];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Activated listener %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)invalidate
{
  id v2 = [(CXChannelServiceServer *)self listener];
  [v2 invalidate];
}

- (void)addClient:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  [v7 setDelegate:self];
  v4 = [(CXChannelServiceServer *)self identifierToClient];
  v5 = [v7 identifier];
  [v4 setObject:v7 forKeyedSubscript:v5];

  int v6 = [(CXChannelServiceServer *)self delegate];
  [v6 serviceServer:self didAddClient:v7];

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (id)clientForIdentifier:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int v6 = [(CXChannelServiceServer *)self identifierToClient];
  id v7 = [v6 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock(p_accessorLock);

  return v7;
}

- (NSArray)clients
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v4 = [(CXChannelServiceServer *)self identifierToClient];
  v5 = [v4 allValues];

  os_unfair_lock_unlock(p_accessorLock);

  return (NSArray *)v5;
}

- (void)removeClient:(id)a3
{
  id v10 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  id v4 = [v10 identifier];
  v5 = [(CXChannelServiceServer *)self identifierToClient];
  int v6 = [v5 objectForKeyedSubscript:v4];
  int v7 = [v6 isEqual:v10];

  if (v7)
  {
    uint64_t v8 = [(CXChannelServiceServer *)self identifierToClient];
    [v8 setObject:0 forKeyedSubscript:v4];

    dispatch_queue_t v9 = [(CXChannelServiceServer *)self delegate];
    [v9 serviceServer:self didRemoveClient:v10];
  }
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [[CXChannelServiceClient alloc] initWithConnection:v6];
  uint64_t v8 = [(CXChannelServiceServer *)self definition];
  dispatch_queue_t v9 = (void *)MEMORY[0x1E4F50B98];
  id v10 = [v8 name];
  v11 = [v9 interfaceWithIdentifier:v10];

  v12 = (void *)MEMORY[0x1E4F4F7B8];
  v13 = [v8 clientXPCInterface];
  v14 = [v12 protocolForProtocol:v13];
  [v11 setClient:v14];

  v15 = (void *)MEMORY[0x1E4F4F7B8];
  v16 = [v8 serverXPCInterface];
  v17 = [v15 protocolForProtocol:v16];
  [v11 setServer:v17];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke;
  v21[3] = &unk_1E5CADCE0;
  id v22 = v11;
  v18 = v7;
  v23 = v18;
  v24 = self;
  id v19 = v11;
  [v6 configureConnection:v21];
  v20 = CXDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_1A6E3A000, v20, OS_LOG_TYPE_DEFAULT, "Activating connection %@", buf, 0xCu);
  }

  [v6 activate];
  if (v18) {
    [(CXChannelServiceServer *)self addClient:v18];
  }
}

void __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setInterface:v3];
  [v4 setInterfaceTarget:*(void *)(a1 + 40)];
  v5 = [MEMORY[0x1E4F50BE0] utility];
  [v4 setServiceQuality:v5];

  id v6 = [*(id *)(a1 + 48) queue];
  [v4 setTargetQueue:v6];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v13[3] = &unk_1E5CADCB8;
  int8x16_t v9 = *(int8x16_t *)(a1 + 40);
  id v7 = (id)v9.i64[0];
  int8x16_t v14 = vextq_s8(v9, v9, 8uLL);
  [v4 setInterruptionHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke_14;
  v11[3] = &unk_1E5CADCB8;
  int8x16_t v10 = *(int8x16_t *)(a1 + 40);
  id v8 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  [v4 setInvalidationHandler:v11];
}

void __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Interrupted connection %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) removeClient:*(void *)(a1 + 40)];
}

void __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated connection %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) removeClient:*(void *)(a1 + 40)];
}

- (void)serviceClient:(id)a3 actionCompleted:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXChannelServiceServer *)self delegate];
  [v8 serviceServer:self client:v7 actionCompleted:v6];
}

- (void)serviceClient:(id)a3 registeredWithConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXChannelServiceServer *)self delegate];
  [v8 serviceServer:self client:v7 registeredWithConfiguration:v6];
}

- (void)serviceClient:(id)a3 reportedAudioFinishedForChannelWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXChannelServiceServer *)self delegate];
  [v8 serviceServer:self client:v7 reportedAudioFinishedForChannelWithUUID:v6];
}

- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 connectedAtDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CXChannelServiceServer *)self delegate];
  [v11 serviceServer:self client:v10 reportedChannelWithUUID:v9 connectedAtDate:v8];
}

- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 disconnectedAtDate:(id)a5 disconnectedReason:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CXChannelServiceServer *)self delegate];
  [v13 serviceServer:self client:v12 reportedChannelWithUUID:v11 disconnectedAtDate:v10 disconnectedReason:a6];
}

- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 startedConnectingAtDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CXChannelServiceServer *)self delegate];
  [v11 serviceServer:self client:v10 reportedChannelWithUUID:v9 startedConnectingAtDate:v8];
}

- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 updated:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CXChannelServiceServer *)self delegate];
  [v11 serviceServer:self client:v10 reportedChannelWithUUID:v9 updated:v8];
}

- (void)serviceClient:(id)a3 reportedIncomingTransmissionEndedForChannelWithUUID:(id)a4 reason:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CXChannelServiceServer *)self delegate];
  [v13 serviceServer:self client:v12 reportedIncomingTransmissionEndedForChannelWithUUID:v11 reason:a5 completionHandler:v10];
}

- (void)serviceClient:(id)a3 reportedIncomingTransmissionStartedForChannelWithUUID:(id)a4 update:(id)a5 shouldReplaceOutgoingTransmission:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(CXChannelServiceServer *)self delegate];
  [v16 serviceServer:self client:v15 reportedIncomingTransmissionStartedForChannelWithUUID:v14 update:v13 shouldReplaceOutgoingTransmission:v7 completionHandler:v12];
}

- (void)serviceClient:(id)a3 requestedTransaction:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CXChannelServiceServer *)self delegate];
  [v11 serviceServer:self client:v10 requestedTransaction:v9 completionHandler:v8];
}

- (void)addAction:(id)a3 toUncommittedTransactionForServiceClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXChannelServiceServer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__CXChannelServiceServer_addAction_toUncommittedTransactionForServiceClient___block_invoke;
  block[3] = &unk_1E5CADD08;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __77__CXChannelServiceServer_addAction_toUncommittedTransactionForServiceClient___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Asked to add action %@ to uncommitted transaction for service client %@", (uint8_t *)&v6, 0x16u);
  }

  int v5 = [*(id *)(a1 + 48) uncommittedTransactionGroup];
  [v5 addAction:*(void *)(a1 + 32) forServiceClient:*(void *)(a1 + 40)];
}

- (void)failOutstandingActionsForChannelWithUUID:(id)a3
{
  id v4 = a3;
  int v5 = [(CXChannelServiceServer *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CXChannelServiceServer_failOutstandingActionsForChannelWithUUID___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__CXChannelServiceServer_failOutstandingActionsForChannelWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transactionManager];
  [v2 failOutstandingActionsForChannelWithUUID:*(void *)(a1 + 40)];
}

- (void)commitUncommittedTransactions
{
  uint64_t v3 = [(CXChannelServiceServer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CXChannelServiceServer_commitUncommittedTransactions__block_invoke;
  block[3] = &unk_1E5CADD30;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __55__CXChannelServiceServer_commitUncommittedTransactions__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uncommittedTransactionGroup];
    *(_DWORD *)buf = 138412290;
    id v22 = v3;
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
  uint64_t v7 = [v6 serviceClients];

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
        id v14 = [v13 transactionForServiceClient:v12];

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

- (CXChannelServiceServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXChannelServiceServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (CXChannelServiceDefinition)definition
{
  return self->_definition;
}

- (NSMutableDictionary)identifierToClient
{
  return self->_identifierToClient;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
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
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_identifierToClient, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end