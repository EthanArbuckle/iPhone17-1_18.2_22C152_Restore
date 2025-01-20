@interface CPInstrumentClusterController
+ (id)_clusterProvidingInterface;
- (CPInstrumentClusterProviding)instrumentClusterProvider;
- (CPInstrumentClusterSetting)compassSetting;
- (CPInstrumentClusterSetting)speedLimitSetting;
- (NSArray)attributedInactiveDescriptionVariants;
- (NSArray)inactiveDescriptionVariants;
- (NSXPCConnection)connection;
- (UIWindow)instrumentClusterWindow;
- (id)_init;
- (id)delegate;
- (void)_connectToListenerEndpoint:(id)a3;
- (void)_invalidate;
- (void)_sceneConnect:(id)a3;
- (void)setAttributedInactiveDescriptionVariants:(NSArray *)attributedInactiveDescriptionVariants;
- (void)setCompassSetting:(unint64_t)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setInactiveDescriptionVariants:(NSArray *)inactiveDescriptionVariants;
- (void)setInstrumentClusterProvider:(id)a3;
- (void)setInstrumentClusterWindow:(id)a3;
- (void)setSpeedLimitSetting:(unint64_t)a3;
@end

@implementation CPInstrumentClusterController

+ (id)_clusterProvidingInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97EA80];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_hostSetAttributedInactiveVariants_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CPInstrumentClusterController;
  return [(CPInstrumentClusterController *)&v3 init];
}

- (void)setInstrumentClusterWindow:(id)a3
{
  uint64_t v5 = (UIWindow *)a3;
  p_instrumentClusterWindow = &self->_instrumentClusterWindow;
  if (self->_instrumentClusterWindow != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)p_instrumentClusterWindow, a3);
    instrumentClusterWindow = self->_instrumentClusterWindow;
    v8 = [(CPInstrumentClusterController *)self delegate];
    v9 = v8;
    if (instrumentClusterWindow) {
      [v8 instrumentClusterControllerDidConnectWindow:v10];
    }
    else {
      [v8 instrumentClusterControllerDidDisconnectWindow:v10];
    }

    uint64_t v5 = v10;
  }

  MEMORY[0x270F9A758](p_instrumentClusterWindow, v5);
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (self->_instrumentClusterWindow) {
      objc_msgSend(obj, "instrumentClusterControllerDidConnectWindow:");
    }
  }
}

- (void)setSpeedLimitSetting:(unint64_t)a3
{
  if (self->_speedLimitSetting != a3)
  {
    self->_speedLimitSetting = a3;
    id v5 = [(CPInstrumentClusterController *)self delegate];
    [v5 instrumentClusterController:self didChangeSpeedLimitSetting:a3];
  }
}

- (void)setCompassSetting:(unint64_t)a3
{
  if (self->_compassSetting != a3)
  {
    self->_compassSetting = a3;
    id v5 = [(CPInstrumentClusterController *)self delegate];
    [v5 instrumentClusterController:self didChangeCompassSetting:a3];
  }
}

- (void)setInactiveDescriptionVariants:(NSArray *)inactiveDescriptionVariants
{
  uint64_t v4 = (NSArray *)[(NSArray *)inactiveDescriptionVariants copy];
  id v5 = self->_inactiveDescriptionVariants;
  self->_inactiveDescriptionVariants = v4;

  id v6 = [(CPInstrumentClusterController *)self instrumentClusterProvider];
  [v6 hostSetInactiveVariants:self->_inactiveDescriptionVariants];
}

- (void)setAttributedInactiveDescriptionVariants:(NSArray *)attributedInactiveDescriptionVariants
{
  uint64_t v4 = (NSArray *)[(NSArray *)attributedInactiveDescriptionVariants copy];
  id v5 = self->_attributedInactiveDescriptionVariants;
  self->_attributedInactiveDescriptionVariants = v4;

  id v6 = [(CPInstrumentClusterController *)self instrumentClusterProvider];
  [v6 hostSetAttributedInactiveVariants:self->_attributedInactiveDescriptionVariants];
}

- (void)_invalidate
{
  objc_super v3 = [(CPInstrumentClusterController *)self connection];
  [v3 invalidate];

  [(CPInstrumentClusterController *)self setConnection:0];
  [(CPInstrumentClusterController *)self setInstrumentClusterProvider:0];
  uint64_t v4 = [(CPInstrumentClusterController *)self instrumentClusterWindow];

  if (v4)
  {
    id v6 = [(CPInstrumentClusterController *)self delegate];
    id v5 = [(CPInstrumentClusterController *)self instrumentClusterWindow];
    [v6 instrumentClusterControllerDidDisconnectWindow:v5];
  }
}

- (void)_sceneConnect:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 _FBSScene];
  if (CPCurrentProcessHasTemplateEntitlement()
    && ([v5 settings],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    v8 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 _sceneIdentifier];
      int v20 = 138543362;
      v21 = v9;
      _os_log_impl(&dword_2181A5000, v8, OS_LOG_TYPE_DEFAULT, "Connecting to listener endpoint for scene identifier: %{public}@", (uint8_t *)&v20, 0xCu);
    }
    v10 = objc_alloc_init(MEMORY[0x263F08D98]);
    v11 = [v5 settings];
    v12 = [v11 templateEndpoint];
    [v10 _setEndpoint:v12];

    [(CPInstrumentClusterController *)self _connectToListenerEndpoint:v10];
  }
  else
  {
    v10 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CPInstrumentClusterController _sceneConnect:](v10, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)_connectToListenerEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v4];
  id v6 = [(id)objc_opt_class() _clusterProvidingInterface];
  [v5 setRemoteObjectInterface:v6];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke;
  v11[3] = &unk_264309E98;
  objc_copyWeak(&v12, &location);
  [v5 setInterruptionHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_56;
  v9[3] = &unk_264309E98;
  objc_copyWeak(&v10, &location);
  [v5 setInvalidationHandler:v9];
  [v5 resume];
  [(CPInstrumentClusterController *)self setConnection:v5];
  v7 = [v5 remoteObjectProxy];
  [(CPInstrumentClusterController *)self setInstrumentClusterProvider:v7];

  v8 = [(CPInstrumentClusterController *)self instrumentClusterProvider];
  [v8 hostConnectToClient];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke(uint64_t a1)
{
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_56(uint64_t a1)
{
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_56_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (UIWindow)instrumentClusterWindow
{
  return self->_instrumentClusterWindow;
}

- (CPInstrumentClusterSetting)speedLimitSetting
{
  return self->_speedLimitSetting;
}

- (CPInstrumentClusterSetting)compassSetting
{
  return self->_compassSetting;
}

- (NSArray)inactiveDescriptionVariants
{
  return self->_inactiveDescriptionVariants;
}

- (NSArray)attributedInactiveDescriptionVariants
{
  return self->_attributedInactiveDescriptionVariants;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CPInstrumentClusterProviding)instrumentClusterProvider
{
  return self->_instrumentClusterProvider;
}

- (void)setInstrumentClusterProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentClusterProvider, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_attributedInactiveDescriptionVariants, 0);
  objc_storeStrong((id *)&self->_inactiveDescriptionVariants, 0);
  objc_storeStrong((id *)&self->_instrumentClusterWindow, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_sceneConnect:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__CPInstrumentClusterController__connectToListenerEndpoint___block_invoke_56_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end