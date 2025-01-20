@interface AirPlayControllerServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (id)copyPropertyBlock;
- (id)performCommandBlock;
- (id)setPropertyBlock;
- (void)_connectionInvalidated:(id)a3;
- (void)dealloc;
- (void)getProperty:(id)a3 qualifier:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)performCommand:(id)a3 qualifier:(id)a4 params:(id)a5 completion:(id)a6;
- (void)postEvent:(id)a3 qualifier:(id)a4 params:(id)a5 completion:(id)a6;
- (void)setCopyPropertyBlock:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPerformCommandBlock:(id)a3;
- (void)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 completion:(id)a6;
- (void)setSetPropertyBlock:(id)a3;
- (void)startWithXPCName:(id)a3;
@end

@implementation AirPlayControllerServer

- (void)setSetPropertyBlock:(id)a3
{
}

- (id)setPropertyBlock
{
  return self->_setPropertyBlock;
}

- (void)setCopyPropertyBlock:(id)a3
{
}

- (id)copyPropertyBlock
{
  return self->_copyPropertyBlock;
}

- (void)setPerformCommandBlock:(id)a3
{
}

- (id)performCommandBlock
{
  return self->_performCommandBlock;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_queue;
}

- (void)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 completion:(id)a6
{
  if (gLogCategory_AirPlayControllerServer <= 30
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    id v16 = a4;
    id v17 = a5;
    id v15 = a3;
    LogPrintF();
  }
  if (objc_msgSend(a3, "isEqual:", @"test", v15, v16, v17))
  {
    if (gLogCategory_AirPlayControllerServer <= 50
      && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_11;
  }
  setPropertyBlock = (uint64_t (**)(id, id, id, id))self->_setPropertyBlock;
  if (setPropertyBlock)
  {
    uint64_t v12 = setPropertyBlock[2](setPropertyBlock, a3, a4, a5);
    if (!v12)
    {
LABEL_11:
      uint64_t v13 = 0;
      goto LABEL_12;
    }
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 4294960582;
  }
LABEL_12:
  v14 = (void (*)(id, uint64_t))*((void *)a6 + 2);

  v14(a6, v13);
}

- (void)getProperty:(id)a3 qualifier:(id)a4 completion:(id)a5
{
  if (gLogCategory_AirPlayControllerServer <= 30
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    id v12 = a3;
    id v13 = a4;
    LogPrintF();
  }
  int v14 = 0;
  if (objc_msgSend(a3, "isEqual:", @"test", v12, v13))
  {
    if (gLogCategory_AirPlayControllerServer <= 50
      && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = @"value";
    v11 = @"value";
  }
  else
  {
    copyPropertyBlock = (uint64_t (**)(id, id, id, int *))self->_copyPropertyBlock;
    if (!copyPropertyBlock)
    {
      v10 = 0;
      int v14 = -6714;
      goto LABEL_15;
    }
    v10 = (__CFString *)copyPropertyBlock[2](copyPropertyBlock, a3, a4, &v14);
    if (v14) {
      goto LABEL_15;
    }
  }
  int v14 = 0;
LABEL_15:
  (*((void (**)(id))a5 + 2))(a5);
}

- (void)postEvent:(id)a3 qualifier:(id)a4 params:(id)a5 completion:(id)a6
{
  if (gLogCategory_AirPlayControllerServer <= 30
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    id v12 = a4;
    id v13 = a5;
    id v11 = a3;
    LogPrintF();
  }
  if (objc_msgSend(a3, "isEqual:", @"test", v11, v12, v13)
    && gLogCategory_AirPlayControllerServer <= 50
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10 = (void (*)(id))*((void *)a6 + 2);

  v10(a6);
}

- (void)performCommand:(id)a3 qualifier:(id)a4 params:(id)a5 completion:(id)a6
{
  id v18 = 0;
  if (gLogCategory_AirPlayControllerServer <= 30
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    id v16 = a4;
    id v17 = a5;
    id v15 = a3;
    LogPrintF();
  }
  if (objc_msgSend(a3, "isEqual:", @"test", v15, v16, v17))
  {
    if (gLogCategory_AirPlayControllerServer <= 50
      && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v18 = &unk_26DEAD378;
    id v14 = &unk_26DEAD378;
LABEL_14:
    uint64_t v13 = 0;
    goto LABEL_15;
  }
  performCommandBlock = (uint64_t (**)(id, id, id, id, id *))self->_performCommandBlock;
  if (!performCommandBlock)
  {
    uint64_t v13 = 4294960582;
    goto LABEL_15;
  }
  uint64_t v12 = performCommandBlock[2](performCommandBlock, a3, a4, a5, &v18);
  if (!v12) {
    goto LABEL_14;
  }
  uint64_t v13 = v12;
LABEL_15:
  (*((void (**)(id, uint64_t, id))a6 + 2))(a6, v13, v18);
}

- (void)_connectionInvalidated:(id)a3
{
  if (gLogCategory_AirPlayControllerServer <= 10
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    [a3 processIdentifier];
    LogPrintF();
  }

  [a3 setInvalidationHandler:0];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v12[7] = *MEMORY[0x263EF8340];
  if (gLogCategory_AirPlayControllerServer <= 10
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = [a4 processIdentifier];
    LogPrintF();
  }
  v6 = objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26DEAEC90, v10);
  v7 = (void *)MEMORY[0x263EFFA08];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  v12[6] = objc_opt_class();
  uint64_t v8 = objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v12, 7));
  [v6 setClasses:v8 forSelector:sel_performCommand_qualifier_params_completion_ argumentIndex:1 ofReply:0];
  [v6 setClasses:v8 forSelector:sel_performCommand_qualifier_params_completion_ argumentIndex:2 ofReply:0];
  [v6 setClasses:v8 forSelector:sel_postEvent_qualifier_params_completion_ argumentIndex:1 ofReply:0];
  [v6 setClasses:v8 forSelector:sel_postEvent_qualifier_params_completion_ argumentIndex:2 ofReply:0];
  [v6 setClasses:v8 forSelector:sel_getProperty_qualifier_completion_ argumentIndex:1 ofReply:0];
  [v6 setClasses:v8 forSelector:sel_getProperty_qualifier_completion_ argumentIndex:1 ofReply:1];
  [v6 setClasses:v8 forSelector:sel_setProperty_qualifier_value_completion_ argumentIndex:1 ofReply:0];
  [v6 setClasses:v8 forSelector:sel_setProperty_qualifier_value_completion_ argumentIndex:2 ofReply:0];
  [a4 setExportedInterface:v6];
  [a4 setExportedObject:self];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__AirPlayControllerServer_listener_shouldAcceptNewConnection___block_invoke;
  v11[3] = &unk_2648960F0;
  v11[4] = self;
  v11[5] = a4;
  [a4 setInvalidationHandler:v11];
  if (self->_queue && (objc_opt_respondsToSelector() & 1) != 0) {
    [a4 _setQueue:self->_queue];
  }
  [a4 resume];
  return 1;
}

uint64_t __62__AirPlayControllerServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionInvalidated:*(void *)(a1 + 40)];
}

- (void)startWithXPCName:(id)a3
{
  self->_serviceName = (NSString *)[a3 copy];
  v5 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:a3];
  self->_xpcListener = v5;
  [(NSXPCListener *)v5 setDelegate:self];
  xpcListener = self->_xpcListener;

  [(NSXPCListener *)xpcListener resume];
}

- (void)invalidate
{
}

- (void)setDispatchQueue:(id)a3
{
  if (a3) {
    dispatch_retain((dispatch_object_t)a3);
  }
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void)dealloc
{
  self->_serviceName = 0;
  [(NSXPCListener *)self->_xpcListener invalidate];

  self->_xpcListener = 0;
  self->_performCommandBlock = 0;

  self->_copyPropertyBlock = 0;
  self->_setPropertyBlock = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AirPlayControllerServer;
  [(AirPlayControllerServer *)&v4 dealloc];
}

@end