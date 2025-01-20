@interface DASessionInternal
- (BOOL)isFirstInQueue;
- (DASessionInternal)initWithDelegate:(id)a3;
- (id)delegate;
- (id)proxy;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)closeProxy;
- (void)dealloc;
- (void)dispatchBlockOnCallback:(id)a3;
- (void)resume;
- (void)setIsFirstInQueue:(BOOL)a3;
- (void)setProxy:(id)a3;
@end

@implementation DASessionInternal

- (DASessionInternal)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DASessionInternal;
  v5 = [(DASessionInternal *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_delegate, v4);
    ClassName = object_getClassName(v6);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(ClassName, v8);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v9;

    dispatch_suspend((dispatch_object_t)v6->_callbackQueue);
    v6->_isCallbackQueueSuspended = 1;
  }

  return v6;
}

- (void)dealloc
{
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASessionInternal dealloc]", 49, @"Internal released", v2, v3, v4, v5, (uint64_t)v9.receiver);
  [(DASessionInternal *)self resume];
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0;

  proxy = self->_proxy;
  self->_proxy = 0;

  v9.receiver = self;
  v9.super_class = (Class)DASessionInternal;
  [(DASessionInternal *)&v9 dealloc];
}

- (void)dispatchBlockOnCallback:(id)a3
{
  id v4 = a3;
  objc_super v9 = v4;
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__DASessionInternal_dispatchBlockOnCallback___block_invoke;
    block[3] = &unk_26422CCE8;
    id v13 = v4;
    dispatch_async(callbackQueue, block);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DASessionInternal dispatchBlockOnCallback:]", 62, @"Invalid callback queue", v5, v6, v7, v8, v11);
  }
}

uint64_t __45__DASessionInternal_dispatchBlockOnCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)closeProxy
{
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASessionInternal closeProxy]", 68, &stru_26C5B7750, v2, v3, v4, v5, v8);
  proxy = self->_proxy;
  self->_proxy = 0;
}

- (id)proxy
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_proxy;
  objc_sync_exit(v2);

  return v3;
}

- (void)setProxy:(id)a3
{
  uint64_t v6 = (NSXPCProxyCreating *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_proxy != v6) {
    objc_storeStrong((id *)&v5->_proxy, a3);
  }
  objc_sync_exit(v5);

  [(DASessionInternal *)v5 resume];
}

- (void)resume
{
  if (self->_isCallbackQueueSuspended)
  {
    dispatch_resume((dispatch_object_t)self->_callbackQueue);
    self->_isCallbackQueueSuspended = 0;
  }
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(DASessionInternal *)self proxy];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  if (!v6)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DASessionInternal synchronousRemoteObjectProxyWithErrorHandler:]", 105, @"Failed to get remote proxy", v7, v8, v9, v10, v16);
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    objc_super v12 = [NSString stringWithUTF8String:DAErrorString(216)];
    v18[0] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v14 = [v11 errorWithDomain:@"DigitalAccessError" code:216 userInfo:v13];
    v4[2](v4, v14);
  }

  return v6;
}

- (BOOL)isFirstInQueue
{
  return self->_isFirstInQueue;
}

- (void)setIsFirstInQueue:(BOOL)a3
{
  self->_isFirstInQueue = a3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_proxy, 0);
}

@end