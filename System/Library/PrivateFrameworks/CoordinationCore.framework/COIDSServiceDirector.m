@interface COIDSServiceDirector
- (COIDSMessageFactory)messageFactory;
- (COIDSServiceDirector)initWithIDSService:(id)a3 meshName:(id)a4;
- (COIDSServiceDirectorOnDemandDiscoveryDelegate)discoveryDelegate;
- (IDSService)service;
- (NSMapTable)activeTransports;
- (NSString)description;
- (NSString)meshName;
- (OS_dispatch_queue)queue;
- (id)tokenFromURI:(id)a3;
- (id)transportWithDiscoveryRecord:(id)a3 withExecutionContext:(id)a4;
- (void)_withLock:(id)a3;
- (void)sendMessage:(id)a3 toDestination:(id)a4 completionHandler:(id)a5;
- (void)sendResponse:(id)a3 responseIdentifier:(id)a4 toDestination:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setActiveTransports:(id)a3;
- (void)setDiscoveryDelegate:(id)a3;
- (void)setMeshName:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation COIDSServiceDirector

- (COIDSServiceDirector)initWithIDSService:(id)a3 meshName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)COIDSServiceDirector;
  v9 = [(COIDSServiceDirector *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_service, a3);
    objc_storeStrong((id *)&v10->_meshName, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.coordination.idsdirector", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    activeTransports = v10->_activeTransports;
    v10->_activeTransports = (NSMapTable *)v14;

    v16 = objc_alloc_init(COIDSMessageFactory);
    messageFactory = v10->_messageFactory;
    v10->_messageFactory = v16;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p, mesh = %@>", v5, self, self->_meshName];

  return (NSString *)v6;
}

- (void)start
{
  id v4 = [(COIDSServiceDirector *)self service];
  v3 = [(COIDSServiceDirector *)self queue];
  [v4 addDelegate:self queue:v3];
}

- (id)transportWithDiscoveryRecord:(id)a3 withExecutionContext:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[COIDSTransport alloc] initWithDiscoveryRecord:v6 executionContext:v7];

  v9 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v6 IDSIdentifier];
    int v18 = 138543874;
    objc_super v19 = self;
    __int16 v20 = 2048;
    v21 = v8;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ created new transport %p for remote IDS identifier %{public}@", (uint8_t *)&v18, 0x20u);
  }
  v11 = [v6 deviceTokenURI];
  dispatch_queue_t v12 = [(COIDSServiceDirector *)self service];
  int v13 = [v12 conformsToProtocol:&unk_26D409578];

  if (v13)
  {
    uint64_t v14 = [(COIDSServiceDirector *)self service];
    v15 = [v14 tokenFromID:v11];
  }
  else
  {
    v15 = [(COIDSServiceDirector *)self tokenFromURI:v11];
  }
  v16 = [(COIDSServiceDirector *)self activeTransports];
  [v16 setObject:v8 forKey:v15];

  return v8;
}

- (void)sendMessage:(id)a3 toDestination:(id)a4 completionHandler:(id)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v19 = *MEMORY[0x263F49EE8];
  v20[0] = &unk_26D3EB848;
  id v8 = NSDictionary;
  v9 = (void (**)(id, id, id))a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_queue_t v12 = [v8 dictionaryWithObjects:v20 forKeys:&v19 count:1];
  int v13 = [(COIDSServiceDirector *)self service];
  uint64_t v14 = [MEMORY[0x263EFFA08] setWithObject:v10];

  id v17 = 0;
  id v18 = 0;
  [v13 sendMessage:v11 toDestinations:v14 priority:300 options:v12 identifier:&v18 error:&v17];

  id v15 = v18;
  id v16 = v17;

  v9[2](v9, v15, v16);
}

- (void)sendResponse:(id)a3 responseIdentifier:(id)a4 toDestination:(id)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v18 = *MEMORY[0x263F49F40];
  v19[0] = a4;
  id v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_queue_t v12 = [v8 dictionaryWithObjects:v19 forKeys:&v18 count:1];
  int v13 = [(COIDSServiceDirector *)self service];
  uint64_t v14 = [MEMORY[0x263EFFA08] setWithObject:v9];

  uint64_t v16 = 0;
  id v17 = 0;
  [v13 sendMessage:v11 toDestinations:v14 priority:300 options:v12 identifier:&v17 error:&v16];

  id v15 = v17;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a7;
  dispatch_queue_t v12 = COCoreLogForCategory(17);
  int v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Did send message %{public}@ successfully", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138543874;
    id v15 = self;
    __int16 v16 = 2114;
    id v17 = v10;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_error_impl(&dword_2217C1000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send message %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__COIDSServiceDirector_service_account_incomingMessage_fromID_context___block_invoke;
  v16[3] = &unk_2645CB458;
  v16[4] = self;
  id v17 = v11;
  id v18 = v12;
  id v19 = v10;
  id v13 = v10;
  id v14 = v12;
  id v15 = v11;
  [(COIDSServiceDirector *)self _withLock:v16];
}

void __71__COIDSServiceDirector_service_account_incomingMessage_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) service];
  int v3 = [v2 conformsToProtocol:&unk_26D409578];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = [v4 service];
    id v6 = [v5 tokenFromID:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v4 tokenFromURI:*(void *)(a1 + 40)];
  }
  id v7 = [*(id *)(a1 + 32) activeTransports];
  BOOL v8 = [v7 objectForKey:v6];

  id v9 = [*(id *)(a1 + 48) outgoingResponseIdentifier];
  id v10 = [*(id *)(a1 + 48) incomingResponseIdentifier];
  id v11 = [*(id *)(a1 + 32) messageFactory];
  uint64_t v12 = *(void *)(a1 + 56);
  id v34 = 0;
  id v13 = [v11 decodeDictionary:v12 error:&v34];
  id v14 = v34;

  if (v13)
  {
    if (v8)
    {
      [v8 handleMessage:v13 requestIdentifier:v9 responseIdentifier:v10 from:*(void *)(a1 + 40)];
      goto LABEL_27;
    }
    if ([v13 type])
    {
      uint64_t v20 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v36 = v21;
        __int16 v37 = 2112;
        v38 = v9;
        __int16 v39 = 2112;
        v40 = v10;
        _os_log_error_impl(&dword_2217C1000, v20, OS_LOG_TYPE_ERROR, "%{public}@ dropping response '%@' for '%@' from unknown node", buf, 0x20u);
      }
LABEL_26:

      goto LABEL_27;
    }
    __int16 v22 = [*(id *)(a1 + 32) service];
    int v23 = [v22 conformsToProtocol:&unk_26D409578];

    if (v23)
    {
      uint64_t v24 = [*(id *)(a1 + 32) service];
      uint64_t v25 = [v24 localIDSIdentifierForDestination:*(void *)(a1 + 40)];
    }
    else
    {
      v26 = [v13 metadata];
      uint64_t v24 = v26;
      if (!v26)
      {
        uint64_t v20 = 0;
LABEL_18:

        v27 = [*(id *)(a1 + 32) discoveryDelegate];
        if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v28 = [[COOnDemandIDSNodeCreationRequest alloc] initWithMessage:v13 idsIdentifier:v20 uriToken:*(void *)(a1 + 40) requestIdentifier:v9 responseIdentifier:v10];
          log = COCoreLogForCategory(17);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v36 = v29;
            __int16 v37 = 2112;
            v38 = v9;
            _os_log_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ received message '%@' from unknown node. Attempting to create node on demand.", buf, 0x16u);
          }

          [v27 onDemandDiscoveryForRequest:v28];
        }
        else
        {
          COCoreLogForCategory(17);
          v28 = (COOnDemandIDSNodeCreationRequest *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v28->super.super, OS_LOG_TYPE_ERROR))
          {
            v32 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            v36 = v32;
            __int16 v37 = 2112;
            v38 = v9;
            __int16 v39 = 2114;
            v40 = v20;
            _os_log_error_impl(&dword_2217C1000, &v28->super.super, OS_LOG_TYPE_ERROR, "%{public}@ dropping message '%@' from unknown node. IDS identifier = %{public}@", buf, 0x20u);
          }
        }

        goto LABEL_26;
      }
      uint64_t v25 = [v26 objectForKey:0x26D3D6C68];
    }
    uint64_t v20 = v25;
    goto LABEL_18;
  }
  id v15 = COCoreLogForCategory(17);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v30 = [*(id *)(a1 + 32) description];
    v31 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v36 = v30;
    __int16 v37 = 2114;
    v38 = v31;
    __int16 v39 = 2114;
    v40 = v14;
    _os_log_error_impl(&dword_2217C1000, v15, OS_LOG_TYPE_ERROR, "%{public}@ received invalid message from %{public}@: %{public}@", buf, 0x20u);
  }
  __int16 v16 = [*(id *)(a1 + 32) messageFactory];
  id v17 = [v16 encodeError:v14];

  id v18 = *(void **)(a1 + 32);
  id v19 = [v17 dictionaryRepresentation];
  [v18 sendResponse:v19 responseIdentifier:v9 toDestination:*(void *)(a1 + 40)];

LABEL_27:
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)tokenFromURI:(id)a3
{
  id v6 = 0;
  id v3 = (id)[a3 _stripPotentialTokenURIWithToken:&v6];
  id v4 = v6;
  return v4;
}

- (IDSService)service
{
  return self->_service;
}

- (COIDSMessageFactory)messageFactory
{
  return self->_messageFactory;
}

- (COIDSServiceDirectorOnDemandDiscoveryDelegate)discoveryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_discoveryDelegate);
  return (COIDSServiceDirectorOnDemandDiscoveryDelegate *)WeakRetained;
}

- (void)setDiscoveryDelegate:(id)a3
{
}

- (NSMapTable)activeTransports
{
  return self->_activeTransports;
}

- (void)setActiveTransports:(id)a3
{
}

- (NSString)meshName
{
  return self->_meshName;
}

- (void)setMeshName:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_meshName, 0);
  objc_storeStrong((id *)&self->_activeTransports, 0);
  objc_destroyWeak((id *)&self->_discoveryDelegate);
  objc_storeStrong((id *)&self->_messageFactory, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end