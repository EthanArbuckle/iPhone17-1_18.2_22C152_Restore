@interface HDQueryControlServer
- (BOOL)hasActiveQueries;
- (HDQueryControlServer)initWithParentServer:(id)a3 connectionQueue:(id)a4;
- (const)_lock_hasActiveQueries;
- (id)createQueryServerEndpointForIdentifier:(id)a3 queryUUID:(id)a4 configuration:(id)a5 forceReactivation:(BOOL)a6 error:(id *)a7;
- (void)_lock_queryDidFinish:(uint64_t)a1;
- (void)invalidate;
- (void)queryServer:(id)a3 requestsAuthorizationWithContext:(id)a4 completion:(id)a5;
- (void)queryServer:(id)a3 requestsAuthorizationWithContext:(id)a4 promptIfNeeded:(BOOL)a5 completion:(id)a6;
- (void)queryServer:(id)a3 shouldStartWithCompletion:(id)a4;
- (void)queryServerDidFinish:(id)a3;
- (void)taskServerDidFailToInitializeForUUID:(id)a3;
@end

@implementation HDQueryControlServer

- (void)queryServerDidFinish:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDQueryControlServer _lock_queryDidFinish:]((uint64_t)self, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HDQueryControlServer)initWithParentServer:(id)a3 connectionQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDQueryControlServer;
  v8 = [(HDQueryControlServer *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_server, v6);
    uint64_t v10 = [v6 client];
    client = v9->_client;
    v9->_client = (HDHealthStoreClient *)v10;

    uint64_t v12 = [v6 profile];
    profile = v9->_profile;
    v9->_profile = (HDProfile *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryServersByUUID = v9->_queryServersByUUID;
    v9->_queryServersByUUID = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryServerEndpointsByUUID = v9->_queryServerEndpointsByUUID;
    v9->_queryServerEndpointsByUUID = v16;

    objc_storeStrong((id *)&v9->_connectionQueue, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)invalidate
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_queryServersByUUID allValues];
  queryServersByUUID = self->_queryServersByUUID;
  self->_queryServersByUUID = 0;

  id v6 = [(NSMutableDictionary *)self->_queryServerEndpointsByUUID allValues];
  queryServerEndpointsByUUID = self->_queryServerEndpointsByUUID;
  self->_queryServerEndpointsByUUID = 0;

  os_unfair_lock_unlock(p_lock);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __34__HDQueryControlServer_invalidate__block_invoke;
        v23[3] = &unk_1E62F31C0;
        v23[4] = self;
        v23[5] = v13;
        [v13 deactivateServerWithCompletion:v23];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "invalidate", (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v16);
  }
}

void __34__HDQueryControlServer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
  {
    v3 = *(void **)(a1 + 40);
    v4 = v2;
    id v5 = [v3 queryUUID];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_debug_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEBUG, "Stopped query server %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)createQueryServerEndpointForIdentifier:(id)a3 queryUUID:(id)a4 configuration:(id)a5 forceReactivation:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    v23 = (void *)MEMORY[0x1E4F28C58];
    long long v24 = @"Nil query server identifier";
LABEL_13:
    objc_msgSend(v23, "hk_assignError:code:format:", a7, 3, v24);
    long long v25 = 0;
    goto LABEL_21;
  }
  if (!v13)
  {
    v23 = (void *)MEMORY[0x1E4F28C58];
    long long v24 = @"Nil query UUID";
    goto LABEL_13;
  }
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v16 = [WeakRetained daemon];
  uint64_t v17 = [v16 taskServerRegistry];

  if (self) {
    client = self->_client;
  }
  else {
    client = 0;
  }
  uint64_t v19 = [v17 createTaskServerEndpointForIdentifier:v12 taskUUID:v13 instanceUUID:v13 configuration:v14 client:client connectionQueue:self->_connectionQueue error:a7];
  if (v19)
  {
    long long v20 = (void *)v19;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (v8)
    {
      long long v22 = [(NSMutableDictionary *)self->_queryServersByUUID objectForKeyedSubscript:v13];
      if (v22) {
        -[HDQueryControlServer _lock_queryDidFinish:]((uint64_t)self, v22);
      }
    }
    else
    {
      long long v22 = 0;
    }
    long long v26 = [(NSMutableDictionary *)self->_queryServerEndpointsByUUID objectForKeyedSubscript:v13];

    if (v26)
    {
      long long v27 = (void *)MEMORY[0x1E4F28C58];
      v28 = [v13 UUIDString];
      objc_msgSend(v27, "hk_assignError:code:format:", a7, 100, @"Query '%@' already exists", v28);

      [v20 invalidate];
      long long v20 = 0;
    }
    else
    {
      [(NSMutableDictionary *)self->_queryServerEndpointsByUUID setObject:v20 forKeyedSubscript:v13];
      [v20 setDelegate:self];
      [v20 setTaskServerDelegate:self];
      [v20 resume];
    }
    os_unfair_lock_unlock(p_lock);
    [v22 deactivateServerWithCompletion:0];
    long long v25 = [v20 listenerEndpoint];
  }
  else
  {
    long long v25 = 0;
  }

LABEL_21:

  return v25;
}

- (void)_lock_queryDidFinish:(uint64_t)a1
{
  if (a1)
  {
    v3 = (const os_unfair_lock *)(a1 + 32);
    id v4 = a2;
    os_unfair_lock_assert_owner(v3);
    id v10 = [v4 queryUUID];
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      unsigned int v6 = -[HDQueryControlServer _lock_hasActiveQueries]((const os_unfair_lock *)a1);
      id v7 = [*(id *)(a1 + 16) objectForKeyedSubscript:v10];
      [*(id *)(a1 + 8) removeObjectForKey:v10];
      [*(id *)(a1 + 16) removeObjectForKey:v10];
      unsigned int v8 = -[HDQueryControlServer _lock_hasActiveQueries]((const os_unfair_lock *)a1);
      [v7 invalidate];
      if (v6 != v8)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        [WeakRetained _serverActivityChanged];
      }
    }
  }
}

- (BOOL)hasActiveQueries
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[HDQueryControlServer _lock_hasActiveQueries]((const os_unfair_lock *)v2);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (const)_lock_hasActiveQueries
{
  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 8);
    if ([*(id *)&v1[2]._os_unfair_lock_opaque count]) {
      return (const os_unfair_lock *)1;
    }
    else {
      return (const os_unfair_lock *)([*(id *)&v1[4]._os_unfair_lock_opaque count] != 0);
    }
  }
  return result;
}

- (void)taskServerDidFailToInitializeForUUID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_queryServerEndpointsByUUID objectForKeyedSubscript:v5];
  [(NSMutableDictionary *)self->_queryServerEndpointsByUUID setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  [v6 invalidate];
}

void __53__HDQueryControlServer__startQueryServer_completion___block_invoke(void *a1, int a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 32));
    id v5 = (void *)a1[5];
    id v6 = *(void **)(a1[4] + 8);
    id v7 = [v5 queryUUID];
    [v6 setObject:v5 forKeyedSubscript:v7];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)queryServer:(id)a3 requestsAuthorizationWithContext:(id)a4 completion:(id)a5
{
}

- (void)queryServer:(id)a3 requestsAuthorizationWithContext:(id)a4 promptIfNeeded:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [(HDProfile *)self->_profile sourceManager];
  client = self->_client;
  id v22 = 0;
  id v13 = client;
  id v14 = [v11 createOrUpdateSourceForClient:v13 error:&v22];
  id v15 = v22;

  if (v14)
  {
    uint64_t v16 = self->_client;
    uint64_t v17 = [(HDHealthStoreClient *)v16 authorizationOracle];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __95__HDQueryControlServer_queryServer_requestsAuthorizationWithContext_promptIfNeeded_completion___block_invoke;
    v21[3] = &unk_1E6303F28;
    v21[4] = self;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__HDQueryControlServer_queryServer_requestsAuthorizationWithContext_promptIfNeeded_completion___block_invoke_293;
    v19[3] = &unk_1E6303F50;
    id v18 = v10;

    id v20 = v18;
    [v17 enqueueObjectAuthorizationRequestWithContext:v9 sourceEntity:v14 promptIfNeeded:v7 authorizationNeededHandler:v21 completion:v19];
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v15);
  }
}

void __95__HDQueryControlServer_queryServer_requestsAuthorizationWithContext_promptIfNeeded_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  if (a3)
  {
    id v10 = *(void **)(a1 + 32);
    if (v10) {
      id v10 = (void *)v10[6];
    }
    uint64_t v11 = v10;
    id v12 = [v11 authorizationOracle];
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      id WeakRetained = objc_loadWeakRetained((id *)(v13 + 40));
    }
    else {
      id WeakRetained = 0;
    }
    id v15 = [WeakRetained objectAuthorizationPromptHandler];
    [v12 handleObjectAuthorizationRequestsWithPromptHandler:v15 completion:&__block_literal_global_145];
  }
  else if (v8)
  {
    _HKInitializeLogging();
    uint64_t v16 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Failed to determine object authorization status: %{public}@", (uint8_t *)&v17, 0xCu);
    }
  }
}

void __95__HDQueryControlServer_queryServer_requestsAuthorizationWithContext_promptIfNeeded_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Failed to handle object authorization request: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __95__HDQueryControlServer_queryServer_requestsAuthorizationWithContext_promptIfNeeded_completion___block_invoke_293(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryServer:(id)a3 shouldStartWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    id v9 = [WeakRetained daemon];
    id v10 = [v9 queryManager];

    if (v10)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __53__HDQueryControlServer__startQueryServer_completion___block_invoke;
      v12[3] = &unk_1E62F2A18;
      v12[4] = self;
      id v13 = v6;
      id v14 = v7;
      [v10 startQueryServer:v13 completion:v12];
    }
    else
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Query manager unavailable");
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_queryServerEndpointsByUUID, 0);

  objc_storeStrong((id *)&self->_queryServersByUUID, 0);
}

@end