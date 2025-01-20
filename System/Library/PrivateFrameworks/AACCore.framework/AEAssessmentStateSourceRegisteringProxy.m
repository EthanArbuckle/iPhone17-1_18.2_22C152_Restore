@interface AEAssessmentStateSourceRegisteringProxy
+ (id)daemonProxyWithQueue:(id)a3;
+ (id)proxyWithEndpoint:(id)a3 queue:(id)a4;
+ (id)proxyWithOrigin:(void *)a3 queue:;
- (id)initWithXPCProxy:(void *)a3 queue:;
- (void)_registerPublisherWithLifetimeEndpoint:(void *)a3 completion:;
- (void)registerPublisherWithLifetimeEndpoint:(id)a3 completion:(id)a4;
@end

@implementation AEAssessmentStateSourceRegisteringProxy

- (id)initWithXPCProxy:(void *)a3 queue:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)AEAssessmentStateSourceRegisteringProxy;
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
  v9 = -[AEAssessmentStateSourceRegisteringProxy initWithXPCProxy:queue:]((id *)[AEAssessmentStateSourceRegisteringProxy alloc], v8, v4);

  return v9;
}

+ (id)daemonProxyWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = -[AEMachServiceXPCConnectionOrigin initWithMachServiceName:options:]([AEMachServiceXPCConnectionOrigin alloc], @"com.apple.assessmentagent", 4096);
  id v6 = +[AEAssessmentStateSourceRegisteringProxy proxyWithOrigin:queue:]((uint64_t)a1, v5, v4);

  return v6;
}

+ (id)proxyWithEndpoint:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[AEAnonymousXPCConnectionOrigin initWithEndpoint:]((id *)[AEAnonymousXPCConnectionOrigin alloc], v7);

  v9 = +[AEAssessmentStateSourceRegisteringProxy proxyWithOrigin:queue:]((uint64_t)a1, v8, v6);

  return v9;
}

- (void)registerPublisherWithLifetimeEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __92__AEAssessmentStateSourceRegisteringProxy_registerPublisherWithLifetimeEndpoint_completion___block_invoke;
  v8[3] = &unk_264EA3C08;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  -[AEAssessmentStateSourceRegisteringProxy _registerPublisherWithLifetimeEndpoint:completion:]((uint64_t)self, a3, v8);
}

void __92__AEAssessmentStateSourceRegisteringProxy_registerPublisherWithLifetimeEndpoint_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    v8 = *(NSObject **)(v7 + 16);
  }
  else {
    v8 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__AEAssessmentStateSourceRegisteringProxy_registerPublisherWithLifetimeEndpoint_completion___block_invoke_2;
  block[3] = &unk_264EA3870;
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __92__AEAssessmentStateSourceRegisteringProxy_registerPublisherWithLifetimeEndpoint_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_registerPublisherWithLifetimeEndpoint:(void *)a3 completion:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    uint64_t v7 = *(void **)(a1 + 8);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __93__AEAssessmentStateSourceRegisteringProxy__registerPublisherWithLifetimeEndpoint_completion___block_invoke;
    v11[3] = &unk_264EA3820;
    id v8 = v5;
    id v12 = v8;
    id v9 = a2;
    id v10 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v7, v11);
    [v10 registerPublisherWithLifetimeEndpoint:v9 completion:v8];
  }
}

uint64_t __93__AEAssessmentStateSourceRegisteringProxy__registerPublisherWithLifetimeEndpoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcProxy, 0);
}

@end