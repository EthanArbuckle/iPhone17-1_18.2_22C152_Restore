@interface AKAdaptiveService
- (AKAdaptiveService)initWithInterface:(id)a3 strongObject:(id)a4;
- (AKAdaptiveService)initWithInterface:(id)a3 weakObject:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCInterface)remoteObjectInterface;
- (id)_initWithInterface:(id)a3 object:(id)a4;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)listenerEndpoint;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRemoteObjectInterface:(id)a3;
@end

@implementation AKAdaptiveService

- (id)_initWithInterface:(id)a3 object:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AKAdaptiveService;
  v9 = [(AKAdaptiveService *)&v14 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_exportedInterface, a3);
    objc_storeStrong(p_isa + 2, a4);
    uint64_t v11 = [MEMORY[0x1E4F29290] anonymousListener];
    id v12 = p_isa[3];
    p_isa[3] = (id)v11;

    [p_isa[3] setDelegate:p_isa];
  }

  return p_isa;
}

- (AKAdaptiveService)initWithInterface:(id)a3 strongObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_AKMessageForwarder alloc] initWithStrongReceiver:v6];

  v9 = (AKAdaptiveService *)[objc_alloc((Class)objc_opt_class()) _initWithInterface:v7 object:v8];
  return v9;
}

- (AKAdaptiveService)initWithInterface:(id)a3 weakObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_AKMessageForwarder alloc] initWithWeakReceiver:v6];

  v9 = (AKAdaptiveService *)[objc_alloc((Class)objc_opt_class()) _initWithInterface:v7 object:v8];
  return v9;
}

- (void)dealloc
{
  [(AKAdaptiveService *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AKAdaptiveService;
  [(AKAdaptiveService *)&v3 dealloc];
}

- (void)activate
{
}

- (void)resume
{
}

- (void)invalidate
{
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  listener = self->_listener;

  [(NSXPCListener *)listener invalidate];
}

- (id)listenerEndpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setExportedInterface:self->_exportedInterface];
  [v7 setExportedObject:self->_exportedObject];
  [v7 setRemoteObjectInterface:self->_remoteObjectInterface];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__AKAdaptiveService_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_1E575EA98;
  objc_copyWeak(&v15, &location);
  [v7 setInterruptionHandler:v14];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __56__AKAdaptiveService_listener_shouldAcceptNewConnection___block_invoke_2;
  id v12 = &unk_1E575EC18;
  v13[1] = v7;
  objc_copyWeak(v13, &location);
  [v7 setInvalidationHandler:&v9];
  objc_msgSend(v7, "setShouldHandleInvalidation:", 0, v9, v10, v11, v12);
  [v7 activate];
  objc_destroyWeak(v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

void __56__AKAdaptiveService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained interruptionHandler];

  if (v1)
  {
    v2 = [WeakRetained interruptionHandler];
    v2[2]();
  }
}

void __56__AKAdaptiveService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 40) shouldHandleInvalidation])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v2 = [WeakRetained invalidationHandler];

    if (v2)
    {
      objc_super v3 = [WeakRetained invalidationHandler];
      v3[2]();
    }
  }
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (void)setRemoteObjectInterface:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_exportedObject, 0);

  objc_storeStrong((id *)&self->_exportedInterface, 0);
}

@end