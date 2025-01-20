@interface DADiscoveryExtension
- (DADiscovery)parent;
- (OS_dispatch_queue)dispatchQueue;
- (_EXExtensionIdentity)ekExtension;
- (id)description;
- (id)invalidationHandler;
- (void)_activate;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)reportEvent:(id)a3;
- (void)reportEventToExtension:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEkExtension:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setParent:(id)a3;
@end

@implementation DADiscoveryExtension

- (id)description
{
  v4 = [(_EXExtensionIdentity *)self->_ekExtension bundleIdentifier];
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__DADiscoveryExtension_activate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__DADiscoveryExtension_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    v11 = self;
    LogPrintF();
  }
  ekExtension = self->_ekExtension;
  id v17 = 0;
  v4 = -[_EXExtensionIdentity makeXPCConnectionWithError:](ekExtension, "makeXPCConnectionWithError:", &v17, v11);
  id v5 = v17;
  if (v4)
  {
    objc_storeStrong((id *)&self->_xpcConnection, v4);
    [v4 _setQueue:self->_dispatchQueue];
    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D128920];
    [v4 setExportedInterface:v6];

    [v4 setExportedObject:self];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __33__DADiscoveryExtension__activate__block_invoke;
    v16[3] = &unk_264520440;
    v16[4] = self;
    [v4 setInterruptionHandler:v16];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __33__DADiscoveryExtension__activate__block_invoke_2;
    v15[3] = &unk_264520440;
    v15[4] = self;
    [v4 setInvalidationHandler:v15];
    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D12A748];
    [v4 setRemoteObjectInterface:v7];

    [v4 resume];
    if (gLogCategory_DADiscovery <= 30)
    {
      if (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    v8 = (void *)sandbox_extension_issue_mach();
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __33__DADiscoveryExtension__activate__block_invoke_3;
    v14[3] = &unk_264520820;
    v14[4] = self;
    v9 = [v4 remoteObjectProxyWithErrorHandler:v14];
    [v9 consumeToken:v8];

    free(v8);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __33__DADiscoveryExtension__activate__block_invoke_4;
    v13[3] = &unk_264520820;
    v13[4] = self;
    v10 = [v4 remoteObjectProxyWithErrorHandler:v13];
    [v10 startDiscovery];
  }
  else if (gLogCategory_DADiscovery <= 90 {
         && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    v12 = CUPrintNSError();
    LogPrintF();
  }
}

uint64_t __33__DADiscoveryExtension__activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __33__DADiscoveryExtension__activate__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

uint64_t __33__DADiscoveryExtension__activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_DADiscovery <= 90)
  {
    id v6 = v2;
    if (gLogCategory_DADiscovery != -1 || (id v2 = (id)_LogCategory_Initialize(), v3 = v6, v2))
    {
      id v5 = CUPrintNSError();
      LogPrintF();

      id v3 = v6;
    }
  }

  return MEMORY[0x270F9A758](v2, v3);
}

uint64_t __33__DADiscoveryExtension__activate__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_DADiscovery <= 90)
  {
    id v6 = v2;
    if (gLogCategory_DADiscovery != -1 || (id v2 = (id)_LogCategory_Initialize(), v3 = v6, v2))
    {
      id v5 = CUPrintNSError();
      LogPrintF();

      id v3 = v6;
    }
  }

  return MEMORY[0x270F9A758](v2, v3);
}

- (void)_interrupted
{
  if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__DADiscoveryExtension_invalidate__block_invoke;
  block[3] = &unk_264520440;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__DADiscoveryExtension_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  parent = self->_parent;
  self->_parent = 0;

  [(NSXPCConnection *)self->_xpcConnection invalidate];

  [(DADiscoveryExtension *)self _invalidated];
}

- (void)_invalidated
{
  if (!self->_xpcConnection)
  {
    id v5 = _Block_copy(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v4 = v5;
    if (v5)
    {
      (*((void (**)(void *))v5 + 2))(v5);
      v4 = v5;
    }
  }
}

- (void)reportEvent:(id)a3
{
  id v9 = a3;
  v4 = [(NSXPCConnection *)self->_xpcConnection cuValueForEntitlementNoCache:@"com.apple.developer.accessory-setup-discovery-extension"];
  int v5 = [v4 isEqual:MEMORY[0x263EFFA88]];

  parent = self->_parent;
  if (v5)
  {
    if (parent)
    {
      if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
      {
        v7 = self;
        id v8 = v9;
        LogPrintF();
      }
      -[DADiscovery _reportASKEvent:](self->_parent, "_reportASKEvent:", v9, v7, v8);
    }
  }
  else if (parent)
  {
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[DADiscovery _reportEvent:](self->_parent, "_reportEvent:", v9, self, v9);
    }
    else
    {
      -[DADiscovery _reportEvent:](self->_parent, "_reportEvent:", v9, v7, v8);
    }
  }
}

- (void)reportEventToExtension:(id)a3
{
  xpcConnection = self->_xpcConnection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__DADiscoveryExtension_reportEventToExtension___block_invoke;
  v6[3] = &unk_264520820;
  v6[4] = self;
  id v4 = a3;
  int v5 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v6];
  [v5 didReceiveDeviceChangedEvent:v4];
}

uint64_t __47__DADiscoveryExtension_reportEventToExtension___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_DADiscovery <= 90)
  {
    id v6 = v2;
    if (gLogCategory_DADiscovery != -1 || (id v2 = (id)_LogCategory_Initialize(), v3 = v6, v2))
    {
      int v5 = CUPrintNSError();
      LogPrintF();

      id v3 = v6;
    }
  }

  return MEMORY[0x270F9A758](v2, v3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (_EXExtensionIdentity)ekExtension
{
  return self->_ekExtension;
}

- (void)setEkExtension:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (DADiscovery)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_ekExtension, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end