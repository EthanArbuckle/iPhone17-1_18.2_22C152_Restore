@interface CUMobileDeviceDiscovery
+ (void)getDevicesWithQueue:(id)a3 completion:(id)a4;
- (CUMobileDeviceDiscovery)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (unsigned)changeFlags;
- (unsigned)discoveryFlags;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CUMobileDeviceDiscovery

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_selfRef, 0);
  objc_storeStrong((id *)&self->_mdRunLoopThread, 0);
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDiscoveryFlags:(unsigned int)a3
{
  self->_discoveryFlags = a3;
}

- (unsigned)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled
    && gLogCategory_CUMobileDeviceDiscovery <= 50
    && (gLogCategory_CUMobileDeviceDiscovery != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x32u)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, (uint64_t)"-[CUMobileDeviceDiscovery _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v12);
  }
  if (!self->_mdRunLoopThread)
  {
    if (gLogCategory_CUMobileDeviceDiscovery <= 30
      && (gLogCategory_CUMobileDeviceDiscovery != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, (uint64_t)"-[CUMobileDeviceDiscovery _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v3, v4, v5, v6, v12);
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v8 = self->_invalidationHandler;
    }
    else
    {
      id v8 = 0;
    }
    self->_invalidationHandler = 0;

    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0;

    id deviceChangedHandler = self->_deviceChangedHandler;
    self->_id deviceChangedHandler = 0;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CUMobileDeviceDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__CUMobileDeviceDiscovery_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 9))
  {
    uint64_t v8 = result;
    if (gLogCategory_CUMobileDeviceDiscovery <= 30
      && (gLogCategory_CUMobileDeviceDiscovery != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, (uint64_t)"-[CUMobileDeviceDiscovery invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v11);
    }
    *(unsigned char *)(*(void *)(v8 + 32) + 9) = 1;
    v9 = *(void **)(v8 + 32);
    if (v9[2])
    {
      v10 = (void *)v9[2];
      return [v10 invalidate];
    }
    else
    {
      return [v9 _invalidated];
    }
  }
  return result;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUMobileDeviceDiscovery <= 30
    && (gLogCategory_CUMobileDeviceDiscovery != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, (uint64_t)"-[CUMobileDeviceDiscovery activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v14);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v9 = objc_alloc_init(CURunLoopThread);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v9;

  [*(id *)(*(void *)(a1 + 32) + 16) setDispatchQueue:*(void *)(*(void *)(a1 + 32) + 40)];
  uint64_t v12 = [(id)objc_opt_class() description];
  [*(id *)(*(void *)(a1 + 32) + 16) setLabel:v12];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke_2;
  v19[3] = &unk_1E55BFC18;
  uint64_t v20 = *(void *)(a1 + 32);
  [*(id *)(v20 + 16) setInvalidationHandler:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke_3;
  v17[3] = &unk_1E55BFC18;
  uint64_t v18 = *(void *)(a1 + 32);
  [*(id *)(v18 + 16) setThreadInitializeHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke_4;
  v15[3] = &unk_1E55BFC18;
  uint64_t v16 = *(void *)(a1 + 32);
  [*(id *)(v16 + 16) setThreadFinalizeHandler:v15];
  return [*(id *)(*(void *)(a1 + 32) + 16) activate];
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mdThreadInitialize];
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mdThreadFinalize];
}

- (CUMobileDeviceDiscovery)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUMobileDeviceDiscovery;
  uint64_t v2 = [(CUMobileDeviceDiscovery *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    *(void *)&v2->_changeFlags = 0x200000003;
  }
  return v2;
}

+ (void)getDevicesWithQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_queue_create("CUMobileDeviceGetDevices", 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke;
  v10[3] = &unk_1E55BF148;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke_2;
  v6[3] = &unk_1E55BF148;
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

@end