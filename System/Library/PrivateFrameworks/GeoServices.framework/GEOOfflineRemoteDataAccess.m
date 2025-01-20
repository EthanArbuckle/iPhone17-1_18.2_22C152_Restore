@interface GEOOfflineRemoteDataAccess
- (BOOL)hasDataForKey:(id)a3 error:(id *)a4;
- (GEOOfflineRemoteDataAccess)init;
- (id)dataForKey:(id)a3 error:(id *)a4;
- (id)offlineTileMetadataWithState:(id)a3 error:(id *)a4;
- (void)_ensureConnection;
- (void)getAvailableKeysForLayer:(unsigned int)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)getDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)getOfflineVersionMetadataWithCallbackQueue:(id)a3 callback:(id)a4;
- (void)hasDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
@end

@implementation GEOOfflineRemoteDataAccess

- (void)getOfflineVersionMetadataWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GEOOfflineRemoteDataAccess *)self _ensureConnection];
  v8 = [[GEOOfflineVersionMetadataFetchRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__GEOOfflineRemoteDataAccess_getOfflineVersionMetadataWithCallbackQueue_callback___block_invoke;
  v11[3] = &unk_1E53EBD80;
  id v12 = v6;
  id v10 = v6;
  [(GEOXPCRequest *)v8 send:connection withReply:v7 handler:v11];
}

- (void)_ensureConnection
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__GEOOfflineRemoteDataAccess__ensureConnection__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_createdConnection, v2);
}

void __82__GEOOfflineRemoteDataAccess_getOfflineVersionMetadataWithCallbackQueue_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 metadata];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void __47__GEOOfflineRemoteDataAccess__ensureConnection__block_invoke(uint64_t a1)
{
  id global_queue = (id)geo_get_global_queue();
  uint64_t v2 = +[GEOXPCConnection createServerConnectionFor:22 debugIdentifier:@"OfflineData" queue:global_queue eventHandler:0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

- (GEOOfflineRemoteDataAccess)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOOfflineRemoteDataAccess;
  uint64_t v2 = [(GEOOfflineRemoteDataAccess *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_createdConnection.lock._os_unfair_lock_opaque = 0;
    v2->_createdConnection.didRun = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (void)getDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(GEOOfflineRemoteDataAccess *)self _ensureConnection];
  v11 = [[GEOOfflineDataFetchRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOOfflineDataFetchRequest *)v11 setKey:v10];

  connection = self->_connection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__GEOOfflineRemoteDataAccess_getDataForKey_callbackQueue_callback___block_invoke;
  v14[3] = &unk_1E53EBD08;
  id v15 = v8;
  id v13 = v8;
  [(GEOXPCRequest *)v11 send:connection withReply:v9 handler:v14];
}

void __67__GEOOfflineRemoteDataAccess_getDataForKey_callbackQueue_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_super v6 = v5;
  if (!v5)
  {
    id v7 = [v10 data];

    if (v7)
    {
      objc_super v6 = 0;
    }
    else
    {
      objc_super v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:0];
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [v10 data];
  (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v6);
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(GEOOfflineRemoteDataAccess *)self _ensureConnection];
  id v7 = [[GEOOfflineDataFetchRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOOfflineDataFetchRequest *)v7 setKey:v6];

  connection = self->_connection;
  id v15 = 0;
  id v9 = [(GEOXPCRequest *)v7 sendSync:connection error:&v15];
  id v10 = v15;
  if (!v10)
  {
    v11 = [v9 data];

    if (v11)
    {
      id v10 = 0;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:0];
    }
  }
  id v12 = [v9 data];

  if (a4 && !v12) {
    *a4 = v10;
  }
  id v13 = [v9 data];

  return v13;
}

- (void)hasDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(GEOOfflineRemoteDataAccess *)self _ensureConnection];
  v11 = [[GEOOfflineDataCheckExistenceRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOOfflineDataCheckExistenceRequest *)v11 setKey:v10];

  [(GEOOfflineDataCheckExistenceRequest *)v11 setSync:0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__GEOOfflineRemoteDataAccess_hasDataForKey_callbackQueue_callback___block_invoke;
  v14[3] = &unk_1E53EBD30;
  id v15 = v8;
  id v13 = v8;
  [(GEOXPCRequest *)v11 send:connection withReply:v9 handler:v14];
}

void __67__GEOOfflineRemoteDataAccess_hasDataForKey_callbackQueue_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 exists];
  id v5 = [v3 error];

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (BOOL)hasDataForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(GEOOfflineRemoteDataAccess *)self _ensureConnection];
  id v7 = [[GEOOfflineDataCheckExistenceRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOOfflineDataCheckExistenceRequest *)v7 setKey:v6];

  [(GEOOfflineDataCheckExistenceRequest *)v7 setSync:1];
  connection = self->_connection;
  id v14 = 0;
  id v9 = [(GEOXPCRequest *)v7 sendSync:connection error:&v14];
  id v10 = v14;
  char v11 = [v9 exists];
  if (a4 && (v11 & 1) == 0) {
    *a4 = v10;
  }
  char v12 = [v9 exists];

  return v12;
}

- (void)getAvailableKeysForLayer:(unsigned int)a3 callbackQueue:(id)a4 callback:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  [(GEOOfflineRemoteDataAccess *)self _ensureConnection];
  id v10 = [[GEOOfflineDataFetchAvailableKeysRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOOfflineDataFetchAvailableKeysRequest *)v10 setLayer:v6];
  connection = self->_connection;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__GEOOfflineRemoteDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke;
  v13[3] = &unk_1E53EBD58;
  id v14 = v8;
  id v12 = v8;
  [(GEOXPCRequest *)v10 send:connection withReply:v9 handler:v13];
}

void __78__GEOOfflineRemoteDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = [a2 keys];
    id v7 = (id)v3;
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = MEMORY[0x1E4F1CBF0];
    }
    (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v4, 0);
  }
  else
  {
    id v5 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v6 = *(void *)(a1 + 32);
    v5(v6);
  }
}

- (id)offlineTileMetadataWithState:(id)a3 error:(id *)a4
{
  [(GEOOfflineRemoteDataAccess *)self _ensureConnection];
  id v7 = [[GEOOfflineTileConfigurationFetchRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOOfflineTileConfigurationFetchRequest *)v7 setState:a3.var0];
  id v8 = [(GEOXPCRequest *)v7 sendSync:self->_connection error:a4];
  id v9 = [v8 configuration];

  return v9;
}

- (void).cxx_destruct
{
}

@end