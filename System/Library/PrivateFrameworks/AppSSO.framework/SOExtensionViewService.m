@interface SOExtensionViewService
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (SORemoteExtensionContext)extensionContext;
- (id)exportedInterface;
- (id)remoteViewControllerInterface;
- (void)_connectChildView;
- (void)connectToContextWithSessionID:(id)a3 completion:(id)a4;
- (void)loadView;
- (void)setExtensionContext:(id)a3;
@end

@implementation SOExtensionViewService

- (void)loadView
{
  v3 = SO_LOG_SOExtensionViewService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "Loading view for view service", v5, 2u);
  }

  v4 = objc_opt_new();
  [(SOExtensionViewService *)self setView:v4];
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9C3FD0];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9BF538];
}

- (id)remoteViewControllerInterface
{
  v2 = objc_opt_class();
  return (id)[v2 _remoteViewControllerInterface];
}

- (id)exportedInterface
{
  v2 = objc_opt_class();
  return (id)[v2 _exportedInterface];
}

- (void)connectToContextWithSessionID:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  v7 = (void *)MEMORY[0x263F08DA8];
  id v8 = a3;
  v9 = [v7 _sharedExtensionContextVendor];
  v10 = [v9 _extensionContextForUUID:v8];

  [(SOExtensionViewService *)self setExtensionContext:v10];
  v11 = [(SOExtensionViewService *)self extensionContext];
  [v11 setViewService:self];

  v12 = SO_LOG_SOExtensionViewService();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SOExtensionViewService connectToContextWithSessionID:completion:](self, v12);
  }

  [(SOExtensionViewService *)self _connectChildView];
  if (v6) {
    v6[2](v6);
  }
}

- (void)_connectChildView
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = objc_begin_catch(a1);
  v2 = SO_LOG_SOExtensionViewService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    OUTLINED_FUNCTION_0_4();
    id v4 = v1;
    _os_log_error_impl(&dword_2185C9000, v2, OS_LOG_TYPE_ERROR, "Couldn't load view for child view controller (%{public}@, %{public}@)", v3, 0x16u);
  }

  objc_end_catch();
}

- (SORemoteExtensionContext)extensionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionContext);
  return (SORemoteExtensionContext *)WeakRetained;
}

- (void)setExtensionContext:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)connectToContextWithSessionID:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 extensionContext];
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_2185C9000, a2, OS_LOG_TYPE_DEBUG, "Connecting view service (%{public}@) to context (%{public}@)", v5, 0x16u);
}

@end