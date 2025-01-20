@interface AFUIServiceSession
- (AFUIPanel)panel;
- (AFUIServiceSession)initWithSessionQueue:(id)a3 connection:(id)a4 remoteProcess:(id)a5;
- (BSProcessHandle)remoteProcess;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)sessionQueue;
- (id)_applicationIdentifierFromConnection:(id)a3;
- (id)_documentTraitsByAddingClientPropertiesFromConnection:(id)a3 toDocumentTraits:(id)a4;
- (void)dealloc;
- (void)displayForDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5;
- (void)documentStateChanged:(id)a3;
- (void)hide;
- (void)setPanel:(id)a3;
@end

@implementation AFUIServiceSession

- (AFUIServiceSession)initWithSessionQueue:(id)a3 connection:(id)a4 remoteProcess:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)AFUIServiceSession;
  v12 = [(AFUIServiceSession *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionQueue, a3);
    objc_storeStrong((id *)&v13->_connection, a4);
    objc_storeStrong((id *)&v13->_remoteProcess, a5);
    v14 = objc_alloc_init(AFUIPanel);
    panel = v13->_panel;
    v13->_panel = v14;

    [(AFUIPanel *)v13->_panel setDelegate:v13];
    [v10 setExportedObject:v13];
    v16 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FCCE8A0];
    [v10 setExportedInterface:v16];

    objc_initWeak(&location, v13);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__AFUIServiceSession_initWithSessionQueue_connection_remoteProcess___block_invoke;
    v20[3] = &unk_265249410;
    objc_copyWeak(&v21, &location);
    [v10 setInterruptionHandler:v20];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__AFUIServiceSession_initWithSessionQueue_connection_remoteProcess___block_invoke_2;
    v18[3] = &unk_265249410;
    objc_copyWeak(&v19, &location);
    [v10 setInvalidationHandler:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __68__AFUIServiceSession_initWithSessionQueue_connection_remoteProcess___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained hide];
    id WeakRetained = v2;
  }
}

void __68__AFUIServiceSession_initWithSessionQueue_connection_remoteProcess___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained hide];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  v3 = [(AFUIServiceSession *)self panel];
  [v3 hide];

  [(NSXPCConnection *)self->_connection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)AFUIServiceSession;
  [(AFUIServiceSession *)&v4 dealloc];
}

- (void)displayForDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x263F08D68];
  id v11 = a3;
  v12 = [v10 currentConnection];
  v13 = [(AFUIServiceSession *)self _documentTraitsByAddingClientPropertiesFromConnection:v12 toDocumentTraits:v11];

  v14 = [(AFUIServiceSession *)self sessionQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__AFUIServiceSession_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke;
  v18[3] = &unk_265249438;
  void v18[4] = self;
  id v19 = v13;
  id v20 = v8;
  id v21 = v9;
  id v15 = v9;
  id v16 = v8;
  id v17 = v13;
  dispatch_async(v14, v18);
}

void __83__AFUIServiceSession_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __83__AFUIServiceSession_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke_2;
  v3[3] = &unk_265249438;
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __83__AFUIServiceSession_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) panel];
  [v2 displayForDocumentTraits:*(void *)(a1 + 40) documentState:*(void *)(a1 + 48) textOperationsHandler:*(void *)(a1 + 56)];
}

- (void)documentStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUIServiceSession *)self sessionQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__AFUIServiceSession_documentStateChanged___block_invoke;
  v7[3] = &unk_265249460;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__AFUIServiceSession_documentStateChanged___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __43__AFUIServiceSession_documentStateChanged___block_invoke_2;
  v2[3] = &unk_265249460;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __43__AFUIServiceSession_documentStateChanged___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) panel];
  [v2 documentStateChanged:*(void *)(a1 + 40)];
}

- (void)hide
{
  id v3 = [(AFUIServiceSession *)self sessionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__AFUIServiceSession_hide__block_invoke;
  block[3] = &unk_265249280;
  block[4] = self;
  dispatch_async(v3, block);
}

void __26__AFUIServiceSession_hide__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__AFUIServiceSession_hide__block_invoke_2;
  block[3] = &unk_265249280;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __26__AFUIServiceSession_hide__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) panel];
  [v1 hide];
}

- (id)_documentTraitsByAddingClientPropertiesFromConnection:(id)a3 toDocumentTraits:(id)a4
{
  id v6 = a4;
  v7 = [(AFUIServiceSession *)self _applicationIdentifierFromConnection:a3];
  if ([v7 length])
  {
    id v8 = [MEMORY[0x263F01878] bundleRecordWithApplicationIdentifier:v7 error:0];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 infoDictionary];
      uint64_t v11 = *MEMORY[0x263EFFA90];
      v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFFA90], 0);
      v13 = [v10 objectsForKeys:v12];

      id v14 = (id)[v6 copy];
      id v15 = [v9 applicationIdentifier];
      [v14 setAppId:v15];

      id v16 = [v9 bundleIdentifier];
      [v14 setBundleId:v16];

      id v17 = [v9 localizedName];
      [v14 setLocalizedAppName:v17];

      v18 = [v13 objectForKey:v11 ofClass:objc_opt_class()];
      [v14 setAppName:v18];
    }
    else
    {
      id v14 = v6;
    }
  }
  else
  {
    id v14 = v6;
  }

  return v14;
}

- (id)_applicationIdentifierFromConnection:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  id v6 = SecTaskCreateWithAuditToken(v5, &v10);
  v7 = v6;
  if (v6)
  {
    id v8 = (void *)SecTaskCopyValueForEntitlement(v6, @"application-identifier", 0);
    CFRelease(v7);
    objc_opt_class();
    v7 = 0;
    if (objc_opt_isKindOfClass()) {
      v7 = v8;
    }
  }

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BSProcessHandle)remoteProcess
{
  return self->_remoteProcess;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (AFUIPanel)panel
{
  return self->_panel;
}

- (void)setPanel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panel, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_remoteProcess, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end