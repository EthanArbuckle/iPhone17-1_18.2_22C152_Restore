@interface ENStoreClient
- (ENStoreClient)init;
- (OS_dispatch_queue)queue;
- (void)handleError:(id)a3;
- (void)invokeAsyncBlock:(id)a3 completion:(id)a4;
- (void)invokeAsyncBoolBlock:(id)a3 completion:(id)a4;
- (void)invokeAsyncInt32Block:(id)a3 completion:(id)a4;
- (void)invokeAsyncObjectBlock:(id)a3 completion:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation ENStoreClient

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)handleError:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"EDAMErrorCode"];
  uint64_t v6 = [v5 intValue];

  if ((int)v6 >= 1 && (v6 & 0xFFFFFFFE) == 8)
  {
    v8 = +[ENSession sharedSession];
    v9 = [v8 logger];
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"ENStoreClient got authentication EDAM error %u", v6);
    [v9 evernoteLogErrorString:v10];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__ENStoreClient_handleError___block_invoke;
    block[3] = &unk_264E5EE70;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __29__ENStoreClient_handleError___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:ENStoreClientDidFailWithAuthenticationErrorNotification object:*(void *)(a1 + 32)];
}

- (void)invokeAsyncBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ENStoreClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__ENStoreClient_invokeAsyncBlock_completion___block_invoke;
  block[3] = &unk_264E5EDF0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __45__ENStoreClient_invokeAsyncBlock_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__ENStoreClient_invokeAsyncBlock_completion___block_invoke_2;
  block[3] = &unk_264E5EE40;
  id v3 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __45__ENStoreClient_invokeAsyncBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invokeAsyncObjectBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ENStoreClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ENStoreClient_invokeAsyncObjectBlock_completion___block_invoke;
  block[3] = &unk_264E5EDF0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __51__ENStoreClient_invokeAsyncObjectBlock_completion___block_invoke(uint64_t a1)
{
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__ENStoreClient_invokeAsyncObjectBlock_completion___block_invoke_2;
  v5[3] = &unk_264E5EE18;
  id v3 = *(id *)(a1 + 48);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __51__ENStoreClient_invokeAsyncObjectBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)invokeAsyncInt32Block:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ENStoreClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ENStoreClient_invokeAsyncInt32Block_completion___block_invoke;
  block[3] = &unk_264E5EDF0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__ENStoreClient_invokeAsyncInt32Block_completion___block_invoke(uint64_t a1)
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  int v6 = -1;
  int v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__ENStoreClient_invokeAsyncInt32Block_completion___block_invoke_2;
  v2[3] = &unk_264E5EDC8;
  id v3 = *(id *)(a1 + 48);
  id v4 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v2);

  _Block_object_dispose(v5, 8);
}

uint64_t __50__ENStoreClient_invokeAsyncInt32Block_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0);
}

- (void)invokeAsyncBoolBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ENStoreClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ENStoreClient_invokeAsyncBoolBlock_completion___block_invoke;
  block[3] = &unk_264E5EDF0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __49__ENStoreClient_invokeAsyncBoolBlock_completion___block_invoke(uint64_t a1)
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  char v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49__ENStoreClient_invokeAsyncBoolBlock_completion___block_invoke_2;
  v2[3] = &unk_264E5EDC8;
  id v3 = *(id *)(a1 + 48);
  id v4 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v2);

  _Block_object_dispose(v5, 8);
}

uint64_t __49__ENStoreClient_invokeAsyncBoolBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0);
}

- (ENStoreClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)ENStoreClient;
  id v2 = [(ENStoreClient *)&v10 init];
  if (v2)
  {
    id v3 = NSString;
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    char v6 = [v3 stringWithFormat:@"com.evernote.sdk.%@", v5];

    id v7 = v6;
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 cStringUsingEncoding:1], 0);
    [(ENStoreClient *)v2 setQueue:v8];
  }
  return v2;
}

@end