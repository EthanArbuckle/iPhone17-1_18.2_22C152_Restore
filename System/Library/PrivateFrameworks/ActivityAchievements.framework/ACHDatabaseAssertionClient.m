@interface ACHDatabaseAssertionClient
- (ACHDatabaseAssertionClient)initWithHealthStore:(id)a3;
- (BOOL)invalidateAssertionWithToken:(id)a3 error:(id *)a4;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSUUID)identifier;
- (id)acquireDatabaseAssertionWithIdentifier:(id)a3 duration:(double)a4 error:(id *)a5;
- (id)acquireDatabaseAssertionWithIdentifier:(id)a3 error:(id *)a4;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)setIdentifier:(id)a3;
- (void)setProxyProvider:(id)a3;
@end

@implementation ACHDatabaseAssertionClient

- (ACHDatabaseAssertionClient)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHDatabaseAssertionClient;
  v5 = [(ACHDatabaseAssertionClient *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08C38] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F0A818]) initWithHealthStore:v4 taskIdentifier:@"ActivityAchievementsDatabaseAssertionTaskServer" exportedObject:v5 taskUUID:v5->_identifier];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v8;
  }
  return v5;
}

- (id)acquireDatabaseAssertionWithIdentifier:(id)a3 error:(id *)a4
{
  return [(ACHDatabaseAssertionClient *)self acquireDatabaseAssertionWithIdentifier:a3 duration:a4 error:60.0];
}

- (id)acquireDatabaseAssertionWithIdentifier:(id)a3 duration:(double)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  v9 = [(ACHDatabaseAssertionClient *)self proxyProvider];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke;
  v16[3] = &unk_2645126A8;
  id v10 = v8;
  double v20 = a4;
  id v17 = v10;
  v18 = &v27;
  v19 = &v21;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke_3;
  v15[3] = &unk_264512470;
  v15[4] = &v21;
  [v9 getSynchronousProxyWithHandler:v16 errorHandler:v15];

  id v11 = (id)v22[5];
  v12 = v11;
  if (v11)
  {
    if (a5) {
      *a5 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v13 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v13;
}

uint64_t __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(a1 + 56);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke_2;
  v5[3] = &unk_264512680;
  long long v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_acquireDatabaseAssertionWithIdentifier:duration:completion:", v2, v5, v3);
}

void __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)invalidateAssertionWithToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  uint64_t v7 = [(ACHDatabaseAssertionClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  v16 = &v24;
  id v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  id v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v11 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke_2;
  v4[3] = &unk_264512498;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_invalidateAssertionWithToken:completion:", v2, v4);
}

void __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1066F0];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D106750];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end