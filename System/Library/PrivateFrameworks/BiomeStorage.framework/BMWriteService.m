@interface BMWriteService
- (BMWriteService)initWithUseCase:(id)a3;
- (BOOL)writeData:(id)a3 version:(unsigned int)a4 timestamp:(double)a5 toStream:(id)a6 asUser:(unsigned int)a7 error:(id *)a8;
- (NSXPCConnection)connection;
- (id)newConnection;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)requestBiomeEndpointForAppScopedService:(unint64_t)a3 user:(unsigned int)a4 reply:(id)a5;
- (void)setConnection:(id)a3;
@end

@implementation BMWriteService

- (BMWriteService)initWithUseCase:(id)a3
{
  id v5 = a3;
  v6 = [(BMWriteService *)self init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_useCase, a3);
  }

  return v7;
}

- (id)newConnection
{
  v3 = objc_msgSend(MEMORY[0x1E4F29268], "bm_connectionWithServiceName:queue:", @"com.apple.BiomeWriteService", 0);
  v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F041A7B0];
  [v3 setRemoteObjectInterface:v4];

  id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F041A290];
  [v3 setExportedInterface:v5];
  v6 = [MEMORY[0x1E4F4FBB0] weakProxyToObject:self];
  [v3 setExportedObject:v6];

  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __31__BMWriteService_newConnection__block_invoke;
  v11 = &unk_1E5E78A48;
  objc_copyWeak(&v12, &location);
  [v3 setInvalidationHandler:&v8];
  objc_msgSend(v3, "activate", v8, v9, v10, v11);
  objc_msgSend(v3, "setBm_exportedUseCase:", self->_useCase);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v3;
}

void __31__BMWriteService_newConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

- (void)connectionInvalidated
{
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(BMWriteService *)self connection];

  if (!v6)
  {
    id v7 = [(BMWriteService *)self newConnection];
    [(BMWriteService *)self setConnection:v7];
  }
  uint64_t v8 = [(BMWriteService *)self connection];

  if (v8)
  {
    uint64_t v9 = [(BMWriteService *)self connection];
    id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v4];

    if (v10)
    {
      id v10 = v10;
      v11 = v10;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19 = @"Unable to create proxy";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      v16 = [v14 errorWithDomain:*MEMORY[0x1E4F4FAD8] code:7 userInfo:v15];
      v4[2](v4, v16);

      v11 = 0;
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"Unable to create connection";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v13 = [v12 errorWithDomain:*MEMORY[0x1E4F4FAD8] code:7 userInfo:v10];
    v4[2](v4, v13);

    v11 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (BOOL)writeData:(id)a3 version:(unsigned int)a4 timestamp:(double)a5 toStream:(id)a6 asUser:(unsigned int)a7 error:(id *)a8
{
  uint64_t v20 = a8;
  uint64_t v8 = *(void *)&a7;
  uint64_t v11 = *(void *)&a4;
  id v21 = a3;
  id v13 = a6;
  uint64_t v30 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  do
  {
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __68__BMWriteService_writeData_version_timestamp_toStream_asUser_error___block_invoke;
    v23[3] = &unk_1E5E78A70;
    v23[4] = &v24;
    v15 = -[BMWriteService synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v23, v20);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__BMWriteService_writeData_version_timestamp_toStream_asUser_error___block_invoke_2;
    v22[3] = &unk_1E5E78A70;
    v22[4] = &v24;
    [v15 writeData:v21 version:v11 timestamp:v13 toStream:v8 asUser:v22 reply:a5];
  }
  while ((BMShouldRetry() & 1) != 0);
  v16 = v25;
  if (v20)
  {
    v17 = (void *)v25[5];
    if (v17)
    {
      *uint64_t v20 = v17;
      v16 = v25;
    }
  }
  BOOL v18 = v16[5] == 0;
  _Block_object_dispose(&v24, 8);

  return v18;
}

void __68__BMWriteService_writeData_version_timestamp_toStream_asUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __68__BMWriteService_writeData_version_timestamp_toStream_asUser_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)requestBiomeEndpointForAppScopedService:(unint64_t)a3 user:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v50[1] = *MEMORY[0x1E4F143B8];
  v28 = (void (**)(id, void, void *))a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F4FB80];
  uint64_t v9 = [MEMORY[0x1E4F29268] currentConnection];
  id v29 = [v8 processWithXPCConnection:v9];

  uint64_t v10 = [v29 processType];
  uint64_t v11 = (void *)MEMORY[0x1E4F4FAD8];
  if (v10 != 4)
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    v50[0] = @"Not authorized";
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
    v27 = [v25 errorWithDomain:*v11 code:5 userInfo:v26];
    v28[2](v28, 0, v27);

    goto LABEL_12;
  }
  uint64_t v44 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__2;
  v42 = __Block_byref_object_dispose__2;
  id v43 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  id v37 = 0;
  uint64_t v12 = *MEMORY[0x1E4F4FAD8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v14 = [MEMORY[0x1E4F4FB30] connectionToAccessServerInDomain:a3 user:v5 useCase:self->_useCase];
    v15 = [v14 connection];
    v16 = v15;
    if (v15)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __69__BMWriteService_requestBiomeEndpointForAppScopedService_user_reply___block_invoke;
      v31[3] = &unk_1E5E78A70;
      v31[4] = &v32;
      v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v31];
      BOOL v18 = v17;
      if (v17)
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __69__BMWriteService_requestBiomeEndpointForAppScopedService_user_reply___block_invoke_2;
        v30[3] = &unk_1E5E78A98;
        v30[4] = &v38;
        v30[5] = &v32;
        [v17 requestBiomeEndpointForAppScopedService:a3 user:v5 reply:v30];
        goto LABEL_9;
      }
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = v13;
      v46 = @"Failed to create remote object proxy";
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      uint64_t v23 = [v22 errorWithDomain:v12 code:7 userInfo:v21];
      uint64_t v24 = (void *)v33[5];
      v33[5] = v23;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = v13;
      v48 = @"Failed to create connection";
      BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      uint64_t v20 = [v19 errorWithDomain:v12 code:7 userInfo:v18];
      id v21 = (void *)v33[5];
      v33[5] = v20;
    }

LABEL_9:
  }
  while ((BMShouldRetry() & 1) != 0);
  v28[2](v28, v39[5], (void *)v33[5]);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
LABEL_12:
}

void __69__BMWriteService_requestBiomeEndpointForAppScopedService_user_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __69__BMWriteService_requestBiomeEndpointForAppScopedService_user_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)dealloc
{
  v3 = [(BMWriteService *)self connection];
  [v3 setInvalidationHandler:0];

  v4 = [(BMWriteService *)self connection];
  [v4 invalidate];

  [(BMWriteService *)self setConnection:0];
  v5.receiver = self;
  v5.super_class = (Class)BMWriteService;
  [(BMWriteService *)&v5 dealloc];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
}

@end