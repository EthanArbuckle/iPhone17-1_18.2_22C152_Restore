@interface CCDonateRequestManager
- (BOOL)_isActiveRequestId:(unsigned int)a3;
- (CCDifferentialUpdaterFactory)updaterFactory;
- (CCDonateRequestManager)init;
- (CCDonateRequestManager)initWithWriteAccess:(id)a3;
- (CCDonateRequestManager)initWithWriteAccess:(id)a3 changeNotifier:(id)a4 donationTimeout:(double)a5;
- (id)_dequeue;
- (id)requestAccess:(id *)a3 forResource:(id)a4 withMode:(unint64_t)a5 error:(id *)a6;
- (void)_beginTransaction;
- (void)_endTransaction;
- (void)_enqueue:(id)a3;
- (void)_handleNextRequest;
- (void)completeRequest:(id)a3;
- (void)resume;
- (void)submitRequest:(id)a3;
- (void)suspend;
@end

@implementation CCDonateRequestManager

- (void)submitRequest:(id)a3
{
  id v4 = a3;
  registryQueue = self->_registryQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__CCDonateRequestManager_submitRequest___block_invoke;
  v7[3] = &unk_265278238;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(registryQueue, v7);
}

- (id)requestAccess:(id *)a3 forResource:(id)a4 withMode:(unint64_t)a5 error:(id *)a6
{
  return (id)[(CCDataResourceWriteAccess *)self->_writeAccess requestAccess:a3 forResource:a4 withMode:a5 error:a6];
}

uint64_t __44__CCDonateRequestManager__handleNextRequest__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_249B69000, v2, OS_LOG_TYPE_DEFAULT, "Handling donate request %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) handle];
}

- (void)completeRequest:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    registryQueue = self->_registryQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __42__CCDonateRequestManager_completeRequest___block_invoke;
    v7[3] = &unk_265278238;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(registryQueue, v7);
  }
}

- (CCDifferentialUpdaterFactory)updaterFactory
{
  return self->_updaterFactory;
}

void __42__CCDonateRequestManager_completeRequest___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (uint64_t *)(a1 + 40);
  int v3 = objc_msgSend(*(id *)(a1 + 32), "_isActiveRequestId:", objc_msgSend(*(id *)(a1 + 40), "requestId"));
  id v4 = __biome_log_for_category();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *v2;
      int v15 = 138412290;
      uint64_t v16 = v6;
      _os_log_impl(&dword_249B69000, v5, OS_LOG_TYPE_DEFAULT, "Donate request %@ handling complete", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = 0;

    [*(id *)(a1 + 32) _handleNextRequest];
    [*(id *)(a1 + 32) _endTransaction];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __42__CCDonateRequestManager_completeRequest___block_invoke_cold_1((uint64_t)v2, v5, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)_handleNextRequest
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_249B69000, log, OS_LOG_TYPE_DEBUG, "All enqueued donate requests have been handled.", v1, 2u);
}

- (id)_dequeue
{
  firstNode = self->_firstNode;
  if (firstNode)
  {
    if (firstNode == self->_lastNode)
    {
      self->_firstNode = 0;

      lastNode = self->_lastNode;
      self->_lastNode = 0;
    }
    else
    {
      id v4 = [(CCDonateRequestQueueNode *)firstNode next];
      lastNode = self->_firstNode;
      self->_firstNode = v4;
    }

    uint64_t v6 = [(CCDonateRequestQueueNode *)firstNode request];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (BOOL)_isActiveRequestId:(unsigned int)a3
{
  activeRequest = self->_activeRequest;
  if (activeRequest) {
    LOBYTE(activeRequest) = [(CCDonateRequest *)activeRequest requestId] == a3;
  }
  return (char)activeRequest;
}

- (void)_endTransaction
{
}

uint64_t __40__CCDonateRequestManager_submitRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _beginTransaction];
  [*(id *)(a1 + 32) _enqueue:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _handleNextRequest];
}

- (void)_enqueue:(id)a3
{
  id v4 = a3;
  obj = (CCDonateRequestQueueNode *)objc_opt_new();
  [(CCDonateRequestQueueNode *)obj setRequest:v4];

  if (self->_firstNode)
  {
    lastNode = self->_lastNode;
    p_lastNode = &self->_lastNode;
    [(CCDonateRequestQueueNode *)lastNode setNext:obj];
    firstNode = obj;
  }
  else
  {
    objc_storeStrong((id *)&self->_firstNode, obj);
    firstNode = self->_firstNode;
    p_lastNode = &self->_lastNode;
  }
  id v8 = firstNode;
  uint64_t v9 = *p_lastNode;
  *p_lastNode = v8;
}

- (void)_beginTransaction
{
}

uint64_t __44__CCDonateRequestManager__handleNextRequest__block_invoke_23(uint64_t a1)
{
  v1 = (int *)(a1 + 32);
  uint64_t result = [*(id *)(a1 + 32) _isActiveRequestId:*(unsigned int *)(a1 + 40)];
  if (result)
  {
    int v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__CCDonateRequestManager__handleNextRequest__block_invoke_23_cold_1(v1 + 2, (uint64_t)v1, v3);
    }

    return [*(id *)(*(void *)v1 + 64) timeout];
  }
  return result;
}

- (CCDonateRequestManager)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCDonateRequestManager)initWithWriteAccess:(id)a3
{
  id v4 = (void *)MEMORY[0x263F31780];
  id v5 = a3;
  uint64_t v6 = [v4 sharedInstance];
  uint64_t v7 = [(CCDonateRequestManager *)self initWithWriteAccess:v5 changeNotifier:v6 donationTimeout:300.0];

  return v7;
}

- (CCDonateRequestManager)initWithWriteAccess:(id)a3 changeNotifier:(id)a4 donationTimeout:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CCDonateRequestManager;
  uint64_t v11 = [(CCDonateRequestManager *)&v23 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_writeAccess, a3);
    objc_storeStrong((id *)&v12->_changeNotifier, a4);
    v12->_donationTimeout = a5;
    uint64_t v13 = [[CCDifferentialUpdaterFactory alloc] initWithWriteAccess:v12->_writeAccess changeNotifier:v12->_changeNotifier timeout:v12->_donationTimeout * 0.8];
    updaterFactory = v12->_updaterFactory;
    v12->_updaterFactory = v13;

    v12->_eventIdCounter = 0;
    transaction = v12->_transaction;
    v12->_transaction = 0;

    v12->_transactionCounter = 0;
    v12->_suspended = 0;
    uint64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("registryQueue", v16);
    registryQueue = v12->_registryQueue;
    v12->_registryQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("executionQueue", v19);
    executionQueue = v12->_executionQueue;
    v12->_executionQueue = (OS_dispatch_queue *)v20;
  }
  return v12;
}

- (void)suspend
{
  registryQueue = self->_registryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CCDonateRequestManager_suspend__block_invoke;
  block[3] = &unk_265277CC0;
  block[4] = self;
  dispatch_async(registryQueue, block);
}

uint64_t __33__CCDonateRequestManager_suspend__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 88) = 1;
  return result;
}

- (void)resume
{
  registryQueue = self->_registryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__CCDonateRequestManager_resume__block_invoke;
  block[3] = &unk_265277CC0;
  block[4] = self;
  dispatch_async(registryQueue, block);
}

uint64_t __32__CCDonateRequestManager_resume__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  return [*(id *)(a1 + 32) _handleNextRequest];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updaterFactory, 0);
  objc_storeStrong((id *)&self->_writeAccess, 0);
  objc_storeStrong((id *)&self->_changeNotifier, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_lastNode, 0);
  objc_storeStrong((id *)&self->_firstNode, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_registryQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

void __42__CCDonateRequestManager_completeRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__CCDonateRequestManager__handleNextRequest__block_invoke_23_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  uint64_t v4 = *(void *)(*(void *)a2 + 24);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 2048;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_249B69000, log, OS_LOG_TYPE_ERROR, "Expiring Donate requestId: %u after %lf seconds", (uint8_t *)v5, 0x12u);
}

@end