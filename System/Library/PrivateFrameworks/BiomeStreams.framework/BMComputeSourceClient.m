@interface BMComputeSourceClient
+ (void)setUseSynchronousXPCMessageSending:(BOOL)a3;
- (BMComputeSourceClient)initWithStreamIdentifier:(id)a3 domain:(unint64_t)a4 useCase:(id)a5;
- (BMComputeSourceClient)initWithStreamIdentifier:(id)a3 listenerEndpoint:(id)a4 storage:(id)a5;
- (BMComputeSourceClient)initWithStreamIdentifier:(id)a3 machServiceName:(id)a4 listenerEndpoint:(id)a5 storage:(id)a6;
- (BMComputeXPCPublisherStorage)storage;
- (NSString)streamIdentifier;
- (NSXPCConnection)connection;
- (id)description;
- (void)dealloc;
- (void)eventsPrunedForAccount:(id)a3 remoteName:(id)a4 reason:(unint64_t)a5;
- (void)sendEvent:(id)a3 account:(id)a4 remoteName:(id)a5 timestamp:(double)a6 signpostID:(unint64_t)a7 sendFullEvent:(BOOL)a8;
@end

@implementation BMComputeSourceClient

- (void)sendEvent:(id)a3 account:(id)a4 remoteName:(id)a5 timestamp:(double)a6 signpostID:(unint64_t)a7 sendFullEvent:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = [(BMComputeSourceClient *)self streamIdentifier];
  if ([(NSString *)self->_streamIdentifier hasSuffix:@":subscriptions"]
    || ([(BMComputeSourceClient *)self storage],
        v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = [v18 checkActiveSubscriptionMarkerForStream:v17],
        v18,
        (v19 & 1) != 0))
  {
    id v36 = v15;
    unint64_t v20 = a7;
    v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BMComputeSourceClient sendEvent:account:remoteName:timestamp:signpostID:sendFullEvent:]((uint64_t)v17, self);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__BMComputeSourceClient_sendEvent_account_remoteName_timestamp_signpostID_sendFullEvent___block_invoke;
    aBlock[3] = &unk_1E55D7588;
    v22 = v17;
    v38 = v22;
    v23 = _Block_copy(aBlock);
    unsigned __int8 v24 = atomic_load(_useSynchronousXPCMessageSending);
    v25 = [(BMComputeSourceClient *)self connection];
    v26 = v25;
    if (v24) {
      [v25 synchronousRemoteObjectProxyWithErrorHandler:v23];
    }
    else {
    v27 = [v25 remoteObjectProxyWithErrorHandler:v23];
    }

    if (v8)
    {
      v28 = [v14 serialize];
      objc_opt_class();
      if (objc_opt_respondsToSelector()) {
        uint64_t v29 = [(id)objc_opt_class() latestDataVersion];
      }
      else {
        uint64_t v29 = [v14 dataVersion];
      }
      uint64_t v30 = v29;
    }
    else
    {
      v28 = 0;
      uint64_t v30 = 0;
    }
    v34 = [NSNumber numberWithDouble:a6];
    unint64_t v35 = v20;
    id v15 = v36;
    [v27 sendEventWithStreamIdentifier:v22 timestamp:v34 signpostID:v35 eventData:v28 eventDataVersion:v30 account:v36 remoteName:v16];

    v33 = v38;
  }
  else
  {
    v31 = __biome_log_for_category();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[BMComputeSourceClient sendEvent:account:remoteName:timestamp:signpostID:sendFullEvent:]((uint64_t)v17, self);
    }

    v32 = __biome_log_for_category();
    v33 = v32;
    if (a7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v17;
      _os_signpost_emit_with_name_impl(&dword_18E67D000, v33, OS_SIGNPOST_INTERVAL_END, a7, "SendEvent", "StreamIdentifier=%@", buf, 0xCu);
    }
  }
}

- (NSString)streamIdentifier
{
  return self->_streamIdentifier;
}

- (BMComputeXPCPublisherStorage)storage
{
  return self->_storage;
}

- (void)eventsPrunedForAccount:(id)a3 remoteName:(id)a4 reason:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(BMComputeSourceClient *)self streamIdentifier];
  v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[BMComputeSourceClient eventsPrunedForAccount:remoteName:reason:]();
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__BMComputeSourceClient_eventsPrunedForAccount_remoteName_reason___block_invoke;
  aBlock[3] = &unk_1E55D7588;
  id v19 = v10;
  id v12 = v10;
  v13 = _Block_copy(aBlock);
  unsigned __int8 v14 = atomic_load(_useSynchronousXPCMessageSending);
  id v15 = [(BMComputeSourceClient *)self connection];
  id v16 = v15;
  if (v14) {
    [v15 synchronousRemoteObjectProxyWithErrorHandler:v13];
  }
  else {
  v17 = [v15 remoteObjectProxyWithErrorHandler:v13];
  }

  [v17 eventsPrunedWithStreamIdentifier:v12 account:v9 remoteName:v8 reason:a5];
}

- (NSXPCConnection)connection
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (!connection)
  {
    v5 = [(BMComputeSourceClient *)self streamIdentifier];
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      machServiceName = self->_machServiceName;
      listenerEndpoint = self->_listenerEndpoint;
      *(_DWORD *)buf = 138412802;
      v23 = v5;
      __int16 v24 = 2112;
      v25 = listenerEndpoint;
      __int16 v26 = 2112;
      v27 = machServiceName;
      _os_log_impl(&dword_18E67D000, v6, OS_LOG_TYPE_INFO, "BMComputeSourceClient establishing new XPC connection from source with stream %@, listenerEndpoint: %@, machServiceName: %@", buf, 0x20u);
    }

    if (self->_listenerEndpoint)
    {
      id v9 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:self->_listenerEndpoint];
    }
    else
    {
      if (!self->_machServiceName)
      {
LABEL_9:
        -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDDF26A0]);
        objc_initWeak((id *)buf, self);
        v11 = self->_connection;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __35__BMComputeSourceClient_connection__block_invoke;
        v20[3] = &unk_1E55D6C48;
        id v12 = v5;
        id v21 = v12;
        [(NSXPCConnection *)v11 setInterruptionHandler:v20];
        v13 = self->_connection;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __35__BMComputeSourceClient_connection__block_invoke_52;
        v17[3] = &unk_1E55D8660;
        objc_copyWeak(&v19, (id *)buf);
        id v14 = v12;
        id v18 = v14;
        [(NSXPCConnection *)v13 setInvalidationHandler:v17];
        [(NSXPCConnection *)self->_connection resume];

        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);

        connection = self->_connection;
        goto LABEL_10;
      }
      id v9 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:self->_machServiceName options:0];
    }
    v10 = self->_connection;
    self->_connection = v9;

    goto LABEL_9;
  }
LABEL_10:
  id v15 = connection;
  os_unfair_lock_unlock(p_lock);

  return v15;
}

- (BMComputeSourceClient)initWithStreamIdentifier:(id)a3 domain:(unint64_t)a4 useCase:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[BMDaemon systemComputeSourceServiceName];
  v10 = [[BMComputeXPCPublisherStorage alloc] initWithUseCase:v7 domain:0 isClient:1];

  v11 = [(BMComputeSourceClient *)self initWithStreamIdentifier:v8 machServiceName:v9 listenerEndpoint:0 storage:v10];
  return v11;
}

- (BMComputeSourceClient)initWithStreamIdentifier:(id)a3 machServiceName:(id)a4 listenerEndpoint:(id)a5 storage:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMComputeSourceClient;
  id v14 = [(BMComputeSourceClient *)&v19 init];
  id v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = [v10 copy];
    streamIdentifier = v15->_streamIdentifier;
    v15->_streamIdentifier = (NSString *)v16;

    objc_storeStrong((id *)&v15->_listenerEndpoint, a5);
    objc_storeStrong((id *)&v15->_storage, a6);
    objc_storeStrong((id *)&v15->_machServiceName, a4);
  }

  return v15;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)BMComputeSourceClient;
  [(BMComputeSourceClient *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

+ (void)setUseSynchronousXPCMessageSending:(BOOL)a3
{
}

- (BMComputeSourceClient)initWithStreamIdentifier:(id)a3 listenerEndpoint:(id)a4 storage:(id)a5
{
  return [(BMComputeSourceClient *)self initWithStreamIdentifier:a3 machServiceName:0 listenerEndpoint:a4 storage:a5];
}

void __35__BMComputeSourceClient_connection__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_18E67D000, v2, OS_LOG_TYPE_DEFAULT, "BMComputeSourceClient for stream %@ connection interrupted", (uint8_t *)&v4, 0xCu);
  }
}

void __35__BMComputeSourceClient_connection__block_invoke_52(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = [WeakRetained[2] _xpcConnection];

    if (v4)
    {
      uint64_t v5 = [v3[2] _xpcConnection];
      uint64_t v6 = (void *)xpc_connection_copy_invalidation_reason();

      if (v6)
      {
        int v4 = [NSString stringWithUTF8String:v6];
      }
      else
      {
        int v4 = @"<unknown>";
      }
      free(v6);
    }
  }
  else
  {
    int v4 = 0;
  }
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_18E67D000, v7, OS_LOG_TYPE_INFO, "BMComputeSourceClient for stream %@ connection invalidated because %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v3 + 2);
    id v9 = v3[2];
    v3[2] = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 2);
  }
}

void __89__BMComputeSourceClient_sendEvent_account_remoteName_timestamp_signpostID_sendFullEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __89__BMComputeSourceClient_sendEvent_account_remoteName_timestamp_signpostID_sendFullEvent___block_invoke_cold_1(a1);
  }
}

void __66__BMComputeSourceClient_eventsPrunedForAccount_remoteName_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__BMComputeSourceClient_eventsPrunedForAccount_remoteName_reason___block_invoke_cold_1(a1);
  }
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(BMComputeSourceClient *)self streamIdentifier];
  uint64_t v6 = [(BMComputeSourceClient *)self connection];
  id v7 = [v3 stringWithFormat:@"<%@ %p> streamIdentifier: %@, connection: %@", v4, self, v5, v6];

  return v7;
}

- (void)sendEvent:(uint64_t)a1 account:(void *)a2 remoteName:timestamp:signpostID:sendFullEvent:.cold.1(uint64_t a1, void *a2)
{
  v2 = [a2 connection];
  id v3 = [v2 serviceName];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_6_0(&dword_18E67D000, v4, v5, "BMComputeSourceClient send event with identifier %@ to compute server: %@", v6, v7, v8, v9, v10);
}

- (void)sendEvent:(uint64_t)a1 account:(void *)a2 remoteName:timestamp:signpostID:sendFullEvent:.cold.2(uint64_t a1, void *a2)
{
  v2 = [a2 storage];
  [v2 domain];
  id v3 = BMStringForServiceDomain();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_6_0(&dword_18E67D000, v4, v5, "BMComputeSourceClient not notifying biomed because there are no downstream subscriptions for %@ found in storage domain: %@", v6, v7, v8, v9, v10);
}

void __89__BMComputeSourceClient_sendEvent_account_remoteName_timestamp_signpostID_sendFullEvent___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v1, v2, "BMComputeSourceClient for stream %@ XPC error in sendEvent: %@", (void)v3, DWORD2(v3));
}

- (void)eventsPrunedForAccount:remoteName:reason:.cold.1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3(&dword_18E67D000, v0, v1, "BMComputeSourceClient events pruned for stream %@ with reason %lu");
}

void __66__BMComputeSourceClient_eventsPrunedForAccount_remoteName_reason___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v1, v2, "BMComputeSourceClient for stream %@ XPC error in eventsPrunedForAccount:remoteName:reason:%@", (void)v3, DWORD2(v3));
}

@end