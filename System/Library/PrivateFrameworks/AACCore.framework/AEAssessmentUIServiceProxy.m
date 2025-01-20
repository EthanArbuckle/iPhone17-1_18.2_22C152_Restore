@interface AEAssessmentUIServiceProxy
+ (id)proxyWithEndpoint:(id)a3 queue:(id)a4;
+ (id)proxyWithOrigin:(void *)a3 queue:;
+ (id)serviceProxyWithQueue:(id)a3;
- (id)initWithXPCProxy:(void *)a3 queue:;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_activateWithConfiguration:(void *)a3 completion:;
- (void)_animateInWithCompletion:(uint64_t)a1;
- (void)_animateOutWithCompletion:(uint64_t)a1;
- (void)_deactivateWithCompletion:(uint64_t)a1;
- (void)activateWithConfiguration:(id)a3 completion:(id)a4;
- (void)animateInWithCompletion:(id)a3;
- (void)animateOutWithCompletion:(id)a3;
- (void)deactivateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation AEAssessmentUIServiceProxy

- (id)initWithXPCProxy:(void *)a3 queue:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)AEAssessmentUIServiceProxy;
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

+ (id)proxyWithOrigin:(void *)a3 queue:
{
  id v4 = a3;
  id v5 = a2;
  self;
  id v6 = objc_opt_new();
  id v7 = [v6 makeInterface];

  v8 = -[AEXPCProxy initWithOrigin:interface:]((id *)[AEXPCProxy alloc], v5, v7);
  v9 = -[AEAssessmentUIServiceProxy initWithXPCProxy:queue:]((id *)[AEAssessmentUIServiceProxy alloc], v8, v4);

  return v9;
}

+ (id)serviceProxyWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = -[AEServiceXPCConnectionOrigin initWithServiceName:]([AEServiceXPCConnectionOrigin alloc], @"com.apple.assessmentmode.AssessmentUIService");
  id v6 = +[AEAssessmentUIServiceProxy proxyWithOrigin:queue:]((uint64_t)a1, v5, v4);

  return v6;
}

+ (id)proxyWithEndpoint:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[AEAnonymousXPCConnectionOrigin initWithEndpoint:]((id *)[AEAnonymousXPCConnectionOrigin alloc], v7);

  v9 = +[AEAssessmentUIServiceProxy proxyWithOrigin:queue:]((uint64_t)a1, v8, v6);

  return v9;
}

- (id)interruptionHandler
{
  if (self) {
    self = (AEAssessmentUIServiceProxy *)self->_xpcProxy;
  }
  return [(AEAssessmentUIServiceProxy *)self interruptionHandler];
}

- (id)invalidationHandler
{
  if (self) {
    self = (AEAssessmentUIServiceProxy *)self->_xpcProxy;
  }
  return [(AEAssessmentUIServiceProxy *)self invalidationHandler];
}

- (void)setInterruptionHandler:(id)a3
{
  if (self) {
    self = (AEAssessmentUIServiceProxy *)self->_xpcProxy;
  }
  [(AEAssessmentUIServiceProxy *)self setInterruptionHandler:a3];
}

- (void)setInvalidationHandler:(id)a3
{
  if (self) {
    self = (AEAssessmentUIServiceProxy *)self->_xpcProxy;
  }
  [(AEAssessmentUIServiceProxy *)self setInvalidationHandler:a3];
}

- (void)invalidate
{
  if (self) {
    self = (AEAssessmentUIServiceProxy *)self->_xpcProxy;
  }
  [(AEAssessmentUIServiceProxy *)self invalidate];
}

- (void)activateWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__AEAssessmentUIServiceProxy_activateWithConfiguration_completion___block_invoke;
  v8[3] = &unk_264EA37F8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  -[AEAssessmentUIServiceProxy _activateWithConfiguration:completion:]((uint64_t)self, a3, v8);
}

void __67__AEAssessmentUIServiceProxy_activateWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __67__AEAssessmentUIServiceProxy_activateWithConfiguration_completion___block_invoke_2;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __67__AEAssessmentUIServiceProxy_activateWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_activateWithConfiguration:(void *)a3 completion:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    id v7 = *(void **)(a1 + 8);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__AEAssessmentUIServiceProxy__activateWithConfiguration_completion___block_invoke;
    v11[3] = &unk_264EA3820;
    id v8 = v5;
    id v12 = v8;
    id v9 = a2;
    id v10 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v7, v11);
    [v10 activateWithConfiguration:v9 completion:v8];
  }
}

uint64_t __68__AEAssessmentUIServiceProxy__activateWithConfiguration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)animateInWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__AEAssessmentUIServiceProxy_animateInWithCompletion___block_invoke;
  v6[3] = &unk_264EA37F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[AEAssessmentUIServiceProxy _animateInWithCompletion:]((uint64_t)self, v6);
}

void __54__AEAssessmentUIServiceProxy_animateInWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __54__AEAssessmentUIServiceProxy_animateInWithCompletion___block_invoke_2;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __54__AEAssessmentUIServiceProxy_animateInWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_animateInWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__AEAssessmentUIServiceProxy__animateInWithCompletion___block_invoke;
    v8[3] = &unk_264EA3820;
    id v6 = v3;
    id v9 = v6;
    id v7 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    [v7 animateInWithCompletion:v6];
  }
}

uint64_t __55__AEAssessmentUIServiceProxy__animateInWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)animateOutWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__AEAssessmentUIServiceProxy_animateOutWithCompletion___block_invoke;
  v6[3] = &unk_264EA37F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[AEAssessmentUIServiceProxy _animateOutWithCompletion:]((uint64_t)self, v6);
}

void __55__AEAssessmentUIServiceProxy_animateOutWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __55__AEAssessmentUIServiceProxy_animateOutWithCompletion___block_invoke_2;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __55__AEAssessmentUIServiceProxy_animateOutWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_animateOutWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__AEAssessmentUIServiceProxy__animateOutWithCompletion___block_invoke;
    v8[3] = &unk_264EA3820;
    id v6 = v3;
    id v9 = v6;
    id v7 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    [v7 animateOutWithCompletion:v6];
  }
}

uint64_t __56__AEAssessmentUIServiceProxy__animateOutWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deactivateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__AEAssessmentUIServiceProxy_deactivateWithCompletion___block_invoke;
  v6[3] = &unk_264EA37F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[AEAssessmentUIServiceProxy _deactivateWithCompletion:]((uint64_t)self, v6);
}

void __55__AEAssessmentUIServiceProxy_deactivateWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __55__AEAssessmentUIServiceProxy_deactivateWithCompletion___block_invoke_2;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __55__AEAssessmentUIServiceProxy_deactivateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_deactivateWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__AEAssessmentUIServiceProxy__deactivateWithCompletion___block_invoke;
    v8[3] = &unk_264EA3820;
    id v6 = v3;
    id v9 = v6;
    id v7 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    [v7 deactivateWithCompletion:v6];
  }
}

uint64_t __56__AEAssessmentUIServiceProxy__deactivateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcProxy, 0);
}

@end