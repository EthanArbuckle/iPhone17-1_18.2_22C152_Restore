@interface AELifecycleEventHandlingProxy
+ (id)proxyWithEndpoint:(id)a3 queue:(id)a4;
- (id)initWithXPCProxy:(void *)a3 queue:;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_handleEventDidBeginWithCompletion:(uint64_t)a1;
- (void)_handleEventDidInvalidateWithError:(void *)a3 completion:;
- (void)_handleEventWantsBeginSingleAppModeWithCompletion:(uint64_t)a1;
- (void)_handleEventWantsEndSingleAppModeWithCompletion:(uint64_t)a1;
- (void)_handleEventWantsPresentBannerWithTitle:(void *)a3 duration:(void *)a4 completion:;
- (void)handleEventDidBeginWithCompletion:(id)a3;
- (void)handleEventDidInvalidateWithError:(id)a3 completion:(id)a4;
- (void)handleEventWantsBeginSingleAppModeWithCompletion:(id)a3;
- (void)handleEventWantsEndSingleAppModeWithCompletion:(id)a3;
- (void)handleEventWantsPresentBannerWithTitle:(id)a3 duration:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation AELifecycleEventHandlingProxy

- (id)initWithXPCProxy:(void *)a3 queue:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)AELifecycleEventHandlingProxy;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

+ (id)proxyWithEndpoint:(id)a3 queue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[AEAnonymousXPCConnectionOrigin initWithEndpoint:]((id *)[AEAnonymousXPCConnectionOrigin alloc], v6);

  v8 = objc_opt_new();
  v9 = [v8 makeInterface];

  objc_super v10 = -[AEXPCProxy initWithOrigin:interface:]((id *)[AEXPCProxy alloc], v7, v9);
  v11 = -[AELifecycleEventHandlingProxy initWithXPCProxy:queue:]((id *)[AELifecycleEventHandlingProxy alloc], v10, v5);

  return v11;
}

- (id)interruptionHandler
{
  if (self) {
    self = (AELifecycleEventHandlingProxy *)self->_xpcProxy;
  }
  return [(AELifecycleEventHandlingProxy *)self interruptionHandler];
}

- (id)invalidationHandler
{
  if (self) {
    self = (AELifecycleEventHandlingProxy *)self->_xpcProxy;
  }
  return [(AELifecycleEventHandlingProxy *)self invalidationHandler];
}

- (void)setInterruptionHandler:(id)a3
{
  if (self) {
    self = (AELifecycleEventHandlingProxy *)self->_xpcProxy;
  }
  [(AELifecycleEventHandlingProxy *)self setInterruptionHandler:a3];
}

- (void)setInvalidationHandler:(id)a3
{
  if (self) {
    self = (AELifecycleEventHandlingProxy *)self->_xpcProxy;
  }
  [(AELifecycleEventHandlingProxy *)self setInvalidationHandler:a3];
}

- (void)invalidate
{
  if (self) {
    self = (AELifecycleEventHandlingProxy *)self->_xpcProxy;
  }
  [(AELifecycleEventHandlingProxy *)self invalidate];
}

- (void)handleEventDidBeginWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__AELifecycleEventHandlingProxy_handleEventDidBeginWithCompletion___block_invoke;
  v6[3] = &unk_264EA37F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[AELifecycleEventHandlingProxy _handleEventDidBeginWithCompletion:]((uint64_t)self, v6);
}

void __67__AELifecycleEventHandlingProxy_handleEventDidBeginWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(NSObject **)(v4 + 16);
  }
  else {
    id v5 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__AELifecycleEventHandlingProxy_handleEventDidBeginWithCompletion___block_invoke_2;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __67__AELifecycleEventHandlingProxy_handleEventDidBeginWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_handleEventDidBeginWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __68__AELifecycleEventHandlingProxy__handleEventDidBeginWithCompletion___block_invoke;
    v8[3] = &unk_264EA3820;
    id v6 = v3;
    id v9 = v6;
    id v7 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    [v7 handleEventDidBeginWithCompletion:v6];
  }
}

- (void)handleEventDidInvalidateWithError:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__AELifecycleEventHandlingProxy_handleEventDidInvalidateWithError_completion___block_invoke;
  v8[3] = &unk_264EA37F8;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  -[AELifecycleEventHandlingProxy _handleEventDidInvalidateWithError:completion:]((uint64_t)self, a3, v8);
}

void __78__AELifecycleEventHandlingProxy_handleEventDidInvalidateWithError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(NSObject **)(v4 + 16);
  }
  else {
    id v5 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__AELifecycleEventHandlingProxy_handleEventDidInvalidateWithError_completion___block_invoke_2;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __78__AELifecycleEventHandlingProxy_handleEventDidInvalidateWithError_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_handleEventDidInvalidateWithError:(void *)a3 completion:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    id v7 = *(void **)(a1 + 8);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__AELifecycleEventHandlingProxy__handleEventDidInvalidateWithError_completion___block_invoke;
    v11[3] = &unk_264EA3820;
    id v8 = v5;
    id v12 = v8;
    id v9 = a2;
    id v10 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v7, v11);
    [v10 handleEventDidInvalidateWithError:v9 completion:v8];
  }
}

- (void)handleEventWantsBeginSingleAppModeWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__AELifecycleEventHandlingProxy_handleEventWantsBeginSingleAppModeWithCompletion___block_invoke;
  v6[3] = &unk_264EA37F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[AELifecycleEventHandlingProxy _handleEventWantsBeginSingleAppModeWithCompletion:]((uint64_t)self, v6);
}

void __82__AELifecycleEventHandlingProxy_handleEventWantsBeginSingleAppModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(NSObject **)(v4 + 16);
  }
  else {
    id v5 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__AELifecycleEventHandlingProxy_handleEventWantsBeginSingleAppModeWithCompletion___block_invoke_2;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __82__AELifecycleEventHandlingProxy_handleEventWantsBeginSingleAppModeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_handleEventWantsBeginSingleAppModeWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __83__AELifecycleEventHandlingProxy__handleEventWantsBeginSingleAppModeWithCompletion___block_invoke;
    v8[3] = &unk_264EA3820;
    id v6 = v3;
    id v9 = v6;
    id v7 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    [v7 handleEventWantsBeginSingleAppModeWithCompletion:v6];
  }
}

- (void)handleEventWantsEndSingleAppModeWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__AELifecycleEventHandlingProxy_handleEventWantsEndSingleAppModeWithCompletion___block_invoke;
  v6[3] = &unk_264EA37F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[AELifecycleEventHandlingProxy _handleEventWantsEndSingleAppModeWithCompletion:]((uint64_t)self, v6);
}

void __80__AELifecycleEventHandlingProxy_handleEventWantsEndSingleAppModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(NSObject **)(v4 + 16);
  }
  else {
    id v5 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__AELifecycleEventHandlingProxy_handleEventWantsEndSingleAppModeWithCompletion___block_invoke_2;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __80__AELifecycleEventHandlingProxy_handleEventWantsEndSingleAppModeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_handleEventWantsEndSingleAppModeWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __81__AELifecycleEventHandlingProxy__handleEventWantsEndSingleAppModeWithCompletion___block_invoke;
    v8[3] = &unk_264EA3820;
    id v6 = v3;
    id v9 = v6;
    id v7 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    [v7 handleEventWantsEndSingleAppModeWithCompletion:v6];
  }
}

- (void)handleEventWantsPresentBannerWithTitle:(id)a3 duration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__AELifecycleEventHandlingProxy_handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke;
  v10[3] = &unk_264EA37F8;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  -[AELifecycleEventHandlingProxy _handleEventWantsPresentBannerWithTitle:duration:completion:]((uint64_t)self, a3, a4, v10);
}

void __92__AELifecycleEventHandlingProxy_handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(NSObject **)(v4 + 16);
  }
  else {
    id v5 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __92__AELifecycleEventHandlingProxy_handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke_2;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __92__AELifecycleEventHandlingProxy_handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_handleEventWantsPresentBannerWithTitle:(void *)a3 duration:(void *)a4 completion:
{
  id v7 = a4;
  id v8 = v7;
  if (a1)
  {
    id v9 = *(void **)(a1 + 8);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __93__AELifecycleEventHandlingProxy__handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke;
    v14[3] = &unk_264EA3820;
    id v10 = v7;
    id v15 = v10;
    id v11 = a3;
    id v12 = a2;
    v13 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v9, v14);
    [v13 handleEventWantsPresentBannerWithTitle:v12 duration:v11 completion:v10];
  }
}

uint64_t __68__AELifecycleEventHandlingProxy__handleEventDidBeginWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__AELifecycleEventHandlingProxy__handleEventDidInvalidateWithError_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__AELifecycleEventHandlingProxy__handleEventWantsBeginSingleAppModeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__AELifecycleEventHandlingProxy__handleEventWantsEndSingleAppModeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__AELifecycleEventHandlingProxy__handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcProxy, 0);
}

@end