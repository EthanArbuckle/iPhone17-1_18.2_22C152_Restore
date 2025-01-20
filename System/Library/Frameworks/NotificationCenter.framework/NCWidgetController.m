@interface NCWidgetController
+ (NCWidgetController)widgetController;
+ (id)widgetContentUnavailableViewWithButtonTitle:(id)a3 buttonAction:(id)a4;
+ (id)widgetContentUnavailableViewWithTitle:(id)a3;
- (NCWidgetController)_strongReference;
- (NSXPCConnection)_connection;
- (id)_connectionForRequest;
- (void)__didReceiveHasContentRequest;
- (void)_invalidateConnection;
- (void)_setConnection:(id)a3;
- (void)_setStrongReference:(id)a3;
- (void)dealloc;
- (void)requestRefreshAfterDate:(id)a3 forWidgetWithBundleIdentifier:(id)a4;
- (void)setHasContent:(BOOL)flag forWidgetWithBundleIdentifier:(NSString *)bundleID;
@end

@implementation NCWidgetController

+ (NCWidgetController)widgetController
{
  id v2 = objc_alloc_init((Class)a1);

  return (NCWidgetController *)v2;
}

- (void)setHasContent:(BOOL)flag forWidgetWithBundleIdentifier:(NSString *)bundleID
{
  BOOL v4 = flag;
  v6 = bundleID;
  objc_initWeak(&location, self);
  v7 = [(NCWidgetController *)self _connectionForRequest];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__NCWidgetController_setHasContent_forWidgetWithBundleIdentifier___block_invoke;
  v10[3] = &unk_2647616C8;
  v8 = v6;
  v11 = v8;
  objc_copyWeak(&v12, &location);
  v9 = [v7 remoteObjectProxyWithErrorHandler:v10];
  objc_msgSend(v9, "__setHasContent:forWidgetWithBundleIdentifier:", v4, v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __43__NCWidgetController__connectionForRequest__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__NCWidgetController__connectionForRequest__block_invoke_4;
  block[3] = &unk_264761508;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

- (void)__didReceiveHasContentRequest
{
  objc_initWeak(&location, self);
  id v2 = [MEMORY[0x263F08D68] currentConnection];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NCWidgetController___didReceiveHasContentRequest__block_invoke;
  block[3] = &unk_2647616F0;
  objc_copyWeak(&v6, &location);
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)_connectionForRequest
{
  id v3 = +[_NCWidgetControllerRequestLimiter sharedInstance];
  int v4 = [v3 isRequestPermitted];

  if (v4)
  {
    connection = self->_connection;
    if (!connection)
    {
      [(NCWidgetController *)self _setStrongReference:self];
      id v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.notificationcenter.widgetcontrollerconnection" options:0];
      v7 = self->_connection;
      self->_connection = v6;

      v8 = self->_connection;
      v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D93A850];
      [(NSXPCConnection *)v8 setExportedInterface:v9];

      v10 = self->_connection;
      v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D93E1E8];
      [(NSXPCConnection *)v10 setRemoteObjectInterface:v11];

      [(NSXPCConnection *)self->_connection setExportedObject:self];
      objc_initWeak(&location, self);
      id v12 = self->_connection;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __43__NCWidgetController__connectionForRequest__block_invoke;
      v18[3] = &unk_264761508;
      objc_copyWeak(&v19, &location);
      [(NSXPCConnection *)v12 setInterruptionHandler:v18];
      v13 = self->_connection;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __43__NCWidgetController__connectionForRequest__block_invoke_3;
      v16[3] = &unk_264761508;
      objc_copyWeak(&v17, &location);
      [(NSXPCConnection *)v13 setInvalidationHandler:v16];
      [(NSXPCConnection *)self->_connection resume];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      connection = self->_connection;
    }
    v14 = connection;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __43__NCWidgetController__connectionForRequest__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
  [WeakRetained _setStrongReference:0];
}

- (void)_setStrongReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_strongReference, 0);
}

void __51__NCWidgetController___didReceiveHasContentRequest__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = *(void **)(a1 + 32);
  id v5 = WeakRetained;
  int v4 = [WeakRetained _connection];
  LODWORD(v3) = [v3 isEqual:v4];

  if (v3) {
    [v5 _invalidateConnection];
  }
}

- (void)dealloc
{
  [(NCWidgetController *)self _invalidateConnection];
  v3.receiver = self;
  v3.super_class = (Class)NCWidgetController;
  [(NCWidgetController *)&v3 dealloc];
}

- (void)_invalidateConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
    int v4 = self->_connection;
    self->_connection = 0;
  }
}

- (NSXPCConnection)_connection
{
  return self->_connection;
}

+ (id)widgetContentUnavailableViewWithTitle:(id)a3
{
  id v3 = a3;
  int v4 = [_NCContentUnavailableView alloc];
  id v5 = -[_UIContentUnavailableView initWithFrame:title:style:includeBackdrop:](v4, "initWithFrame:title:style:includeBackdrop:", v3, 0, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  return v5;
}

+ (id)widgetContentUnavailableViewWithButtonTitle:(id)a3 buttonAction:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_NCContentUnavailableViewWithButton alloc] initWithTitle:v6 buttonAction:v5];

  return v7;
}

void __43__NCWidgetController__connectionForRequest__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__NCWidgetController__connectionForRequest__block_invoke_2;
  block[3] = &unk_264761508;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __43__NCWidgetController__connectionForRequest__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
  [WeakRetained _setStrongReference:0];
}

void __66__NCWidgetController_setHasContent_forWidgetWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__NCWidgetController_setHasContent_forWidgetWithBundleIdentifier___block_invoke_2;
    block[3] = &unk_2647616A0;
    id v5 = *(id *)(a1 + 32);
    id v6 = v3;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v7);
  }
}

void __66__NCWidgetController_setHasContent_forWidgetWithBundleIdentifier___block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_EncounteredErr.isa, *(void *)(a1 + 32), *(void *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _invalidateConnection];
}

- (void)requestRefreshAfterDate:(id)a3 forWidgetWithBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(NCWidgetController *)self _connectionForRequest];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__NCWidgetController_requestRefreshAfterDate_forWidgetWithBundleIdentifier___block_invoke;
  v11[3] = &unk_2647616C8;
  id v9 = v7;
  id v12 = v9;
  objc_copyWeak(&v13, &location);
  v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  objc_msgSend(v10, "__requestRefreshAfterDate:forWidgetWithBundleIdentifier:", v6, v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __76__NCWidgetController_requestRefreshAfterDate_forWidgetWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__NCWidgetController_requestRefreshAfterDate_forWidgetWithBundleIdentifier___block_invoke_2;
    block[3] = &unk_2647616A0;
    id v5 = *(id *)(a1 + 32);
    id v6 = v3;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v7);
  }
}

void __76__NCWidgetController_requestRefreshAfterDate_forWidgetWithBundleIdentifier___block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_EncounteredErr_0.isa, *(void *)(a1 + 32), *(void *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _invalidateConnection];
}

- (NCWidgetController)_strongReference
{
  return self->_strongReference;
}

- (void)_setConnection:(id)a3
{
}

@end