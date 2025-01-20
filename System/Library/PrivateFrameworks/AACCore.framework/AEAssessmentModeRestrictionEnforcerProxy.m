@interface AEAssessmentModeRestrictionEnforcerProxy
- (AEAssessmentModeRestrictionEnforcerProxy)initWithMachServiceName:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)proxy;
- (void)shouldBeginRestrictingForAssessmentModeWithCompletion:(id)a3;
- (void)shouldEndRestrictingForAssessmentModeWithCompletion:(id)a3;
@end

@implementation AEAssessmentModeRestrictionEnforcerProxy

- (void)dealloc
{
  [(AEAssessmentModeRestrictionEnforcerProxy *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AEAssessmentModeRestrictionEnforcerProxy;
  [(AEAssessmentModeRestrictionEnforcerProxy *)&v3 dealloc];
}

- (AEAssessmentModeRestrictionEnforcerProxy)initWithMachServiceName:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AEAssessmentModeRestrictionEnforcerProxy;
  v9 = [(AEAssessmentModeRestrictionEnforcerProxy *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_machServiceName, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (void)invalidate
{
  if (self->_proxy)
  {
    -[AEAssessmentModeRestrictionEnforcerProxy proxy]((void **)&self->super.isa);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v2 invalidate];
  }
}

- (void)proxy
{
  if (a1)
  {
    id v2 = a1;
    objc_super v3 = a1[3];
    if (!v3)
    {
      v4 = -[AEMachServiceXPCConnectionOrigin initWithMachServiceName:options:]([AEMachServiceXPCConnectionOrigin alloc], a1[1], 4096);
      v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F1455A8];
      v6 = -[AEXPCProxy initWithOrigin:interface:]((id *)[AEXPCProxy alloc], v4, v5);
      id v7 = v2[3];
      v2[3] = v6;

      objc_super v3 = v2[3];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)shouldBeginRestrictingForAssessmentModeWithCompletion:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke;
  v7[3] = &unk_264EA3B40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[AEAssessmentModeRestrictionEnforcerProxy proxy](*(void ***)(a1 + 32));
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  id v7 = __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_2;
  id v8 = &unk_264EA37F8;
  objc_super v3 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v3;
  id v4 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v2, &v5);

  objc_msgSend(v4, "shouldBeginRestrictingForAssessmentModeWithCompletion:", *(void *)(a1 + 40), v5, v6, v7, v8, v9);
}

void __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(NSObject **)(v4 + 16);
  }
  else {
    uint64_t v5 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_3;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)shouldEndRestrictingForAssessmentModeWithCompletion:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke;
  v7[3] = &unk_264EA3B40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = -[AEAssessmentModeRestrictionEnforcerProxy proxy](*(void ***)(a1 + 32));
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  id v7 = __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke_2;
  id v8 = &unk_264EA37F8;
  id v3 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v3;
  id v4 = -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v2, &v5);

  objc_msgSend(v4, "shouldEndRestrictingForAssessmentModeWithCompletion:", *(void *)(a1 + 40), v5, v6, v7, v8, v9);
}

void __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(NSObject **)(v4 + 16);
  }
  else {
    uint64_t v5 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke_3;
  v8[3] = &unk_264EA37D0;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end