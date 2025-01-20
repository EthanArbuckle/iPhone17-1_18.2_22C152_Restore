@interface ACHDatabaseAssertionServer
+ (id)taskIdentifier;
- (ACHDatabaseAssertionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (NSMutableDictionary)assertionByToken;
- (OS_dispatch_queue)queue;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_queue_cleanup;
- (void)dealloc;
- (void)remote_acquireDatabaseAssertionWithIdentifier:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)remote_invalidateAssertionWithToken:(id)a3 completion:(id)a4;
- (void)setAssertionByToken:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ACHDatabaseAssertionServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x263F234D0];
}

- (ACHDatabaseAssertionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)ACHDatabaseAssertionServer;
  v6 = [(HDStandardTaskServer *)&v12 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (v6)
  {
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assertionByToken = v6->_assertionByToken;
    v6->_assertionByToken = v9;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(NSMutableDictionary *)self->_assertionByToken allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [(NSMutableDictionary *)self->_assertionByToken objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        [v8 invalidate];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)ACHDatabaseAssertionServer;
  [(ACHDatabaseAssertionServer *)&v9 dealloc];
}

- (void)_queue_cleanup
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(ACHDatabaseAssertionServer *)self assertionByToken];
  uint64_t v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        long long v10 = [(ACHDatabaseAssertionServer *)self assertionByToken];
        long long v11 = [v10 objectForKeyedSubscript:v9];

        long long v12 = [v11 assertion];
        uint64_t v13 = [v12 state];

        if (v13 == 3)
        {
          v14 = [(ACHDatabaseAssertionServer *)self assertionByToken];
          [v14 setObject:0 forKeyedSubscript:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)remote_acquireDatabaseAssertionWithIdentifier:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t, uint64_t))a5;
  long long v10 = [(ACHDatabaseAssertionServer *)self queue];
  dispatch_assert_queue_not_V2(v10);

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__30;
  v28 = __Block_byref_object_dispose__30;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__30;
  v22 = __Block_byref_object_dispose__30;
  id v23 = 0;
  long long v11 = [(ACHDatabaseAssertionServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__ACHDatabaseAssertionServer_remote_acquireDatabaseAssertionWithIdentifier_duration_completion___block_invoke;
  block[3] = &unk_264518400;
  block[4] = self;
  id v12 = v8;
  double v17 = a4;
  id v14 = v12;
  long long v15 = &v18;
  long long v16 = &v24;
  dispatch_sync(v11, block);

  v9[2](v9, v25[5], v19[5]);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __96__ACHDatabaseAssertionServer_remote_acquireDatabaseAssertionWithIdentifier_duration_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_cleanup");
  v2 = [*(id *)(a1 + 32) profile];
  v3 = [v2 database];
  double v4 = *(double *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = +[ACHDatabaseAssertion assertionWithDatabase:v3 identifier:v5 timeout:&obj error:v4];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    long long v11 = [*(id *)(a1 + 32) assertionByToken];
    [v11 setObject:v7 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
}

- (void)remote_invalidateAssertionWithToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v8 = [(ACHDatabaseAssertionServer *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__30;
  v19 = __Block_byref_object_dispose__30;
  id v20 = 0;
  uint64_t v9 = [(ACHDatabaseAssertionServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__ACHDatabaseAssertionServer_remote_invalidateAssertionWithToken_completion___block_invoke;
  v11[3] = &unk_264516C08;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  uint64_t v13 = &v21;
  id v14 = &v15;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v22 + 24), v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __77__ACHDatabaseAssertionServer_remote_invalidateAssertionWithToken_completion___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_queue_cleanup");
  v2 = [*(id *)(a1 + 32) assertionByToken];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    [v3 invalidate];
    double v4 = [*(id *)(a1 + 32) assertionByToken];
    [v4 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];

    char v5 = 1;
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08320];
    v12[0] = @"Assertion not found";
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v8 = [v6 errorWithDomain:@"com.apple.ActivityAchievements.DatabaseAssertion" code:-3 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    char v5 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D12D540];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D133E58];
}

- (NSMutableDictionary)assertionByToken
{
  return self->_assertionByToken;
}

- (void)setAssertionByToken:(id)a3
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
  objc_storeStrong((id *)&self->_assertionByToken, 0);
}

@end