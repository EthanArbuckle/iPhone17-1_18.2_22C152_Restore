@interface DASession
+ (BOOL)supportsSecureCoding;
- (DASession)initWithCoder:(id)a3;
- (DASession)initWithDelegate:(id)a3;
- (id)getDelegate;
- (id)getRemoteProxy:(id)a3;
- (void)didEnd:(id)a3;
- (void)didStart:(BOOL)a3;
- (void)dispatchOnCallbackQueue:(id)a3;
- (void)endSession;
- (void)setProxy:(id)a3;
@end

@implementation DASession

- (DASession)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DASession;
  v5 = [(DASession *)&v9 init];
  if (v5)
  {
    v6 = [[DASessionInternal alloc] initWithDelegate:v4];
    internal = v5->_internal;
    v5->_internal = v6;
  }
  return v5;
}

- (void)endSession
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_hasEnded)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__1;
    v11[4] = __Block_byref_object_dispose__1;
    id v12 = 0;
    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASession endSession]", 48, &stru_26C5B7750, v3, v4, v5, v6, v8);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __23__DASession_endSession__block_invoke;
    v10[3] = &unk_26422CBD0;
    v10[4] = v11;
    v7 = [(DASession *)v2 getRemoteProxy:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __23__DASession_endSession__block_invoke_2;
    v9[3] = &unk_26422D290;
    v9[4] = v2;
    v9[5] = v11;
    [v7 endSessionWithCompletion:v9];

    _Block_object_dispose(v11, 8);
  }
  objc_sync_exit(v2);
}

void __23__DASession_endSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DASession endSession]_block_invoke", 50, @"%@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __23__DASession_endSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASession endSession]_block_invoke_2", 53, @"Proxy end session", v4, v5, v6, v7, v8);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (!v9) {
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  }
}

- (void)setProxy:(id)a3
{
}

- (id)getRemoteProxy:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *))a3;
  id v9 = [(DASessionInternal *)self->_internal synchronousRemoteObjectProxyWithErrorHandler:v4];
  if (!v9)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DASession getRemoteProxy:]", 74, @"XPC proxy not available", v5, v6, v7, v8, v15);
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08320];
    v11 = [NSString stringWithUTF8String:DAErrorString(216)];
    v17[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v13 = [v10 errorWithDomain:@"DigitalAccessError" code:216 userInfo:v12];
    v4[2](v4, v13);
  }

  return v9;
}

- (id)getDelegate
{
  return [(DASessionInternal *)self->_internal delegate];
}

- (void)dispatchOnCallbackQueue:(id)a3
{
}

- (void)didStart:(BOOL)a3
{
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASession didStart:]", 98, @": %d", v3, v4, v5, v6, a3);
  objc_initWeak(&location, self);
  internal = self->_internal;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __22__DASession_didStart___block_invoke;
  v9[3] = &unk_26422D2B8;
  objc_copyWeak(&v10, &location);
  [(DASessionInternal *)internal dispatchBlockOnCallback:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __22__DASession_didStart___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    v2 = [WeakRetained[2] delegate];
    [v2 daSession:v3 didBecomeActive:0];

    WeakRetained = v3;
  }
}

- (void)didEnd:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASession didEnd:]", 112, @":%@", v5, v6, v7, v8, (uint64_t)v4);
  objc_initWeak(&location, self);
  internal = self->_internal;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __20__DASession_didEnd___block_invoke;
  v11[3] = &unk_26422D2E0;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [(DASessionInternal *)internal dispatchBlockOnCallback:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __20__DASession_didEnd___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = +[DAManager sharedManager];
    [v2 unregisterSession:WeakRetained];

    uint64_t v3 = [WeakRetained[2] delegate];
    [v3 daSession:WeakRetained didEnd:*(void *)(a1 + 32)];

    [WeakRetained[2] closeProxy];
    id v4 = WeakRetained[2];
    WeakRetained[2] = 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DASession)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DASession;
  return [(DASession *)&v4 init];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);

  objc_storeStrong((id *)&self->_clientConnection, 0);
}

@end