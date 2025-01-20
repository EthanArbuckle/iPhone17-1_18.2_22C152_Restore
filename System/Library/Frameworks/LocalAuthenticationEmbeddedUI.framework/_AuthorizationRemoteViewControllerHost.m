@interface _AuthorizationRemoteViewControllerHost
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
+ (void)_requestViewController:(id)a3 connectionHandler:(id)a4;
+ (void)requestViewControllerWithConnectionHandler:(id)a3;
- (_AuthorizationRemoteViewControllerHostDelegate)delegate;
- (void)authenticatorServiceDidFinishWithError:(id)a3 reply:(id)a4;
- (void)authenticatorServiceDidObtainAuthenticationWithReply:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startWithConfiguration:(id)a3 reply:(id)a4;
- (void)stopWithReply:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _AuthorizationRemoteViewControllerHost

+ (void)requestViewControllerWithConnectionHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF910] date];
  v6 = LA_LOG_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F450000, v6, OS_LOG_TYPE_DEFAULT, "RemoteUI call started", buf, 2u);
  }

  v7 = __85___AuthorizationRemoteViewControllerHost_requestViewControllerWithConnectionHandler___block_invoke();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85___AuthorizationRemoteViewControllerHost_requestViewControllerWithConnectionHandler___block_invoke_2;
  v10[3] = &unk_26506ED70;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [a1 _requestViewController:v7 connectionHandler:v10];
}

+ (void)_requestViewController:(id)a3 connectionHandler:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  v7 = [v6 serviceViewControllerClassName];
  id v8 = [v6 serviceBundleIdentifier];

  id v9 = (id)[a1 requestViewController:v7 fromServiceWithBundleIdentifier:v8 connectionHandler:v10];
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken != -1) {
    dispatch_once(&exportedInterface_onceToken, &__block_literal_global_118);
  }
  v2 = (void *)exportedInterface_interface;

  return v2;
}

+ (id)serviceViewControllerInterface
{
  if (serviceViewControllerInterface_onceToken != -1) {
    dispatch_once(&serviceViewControllerInterface_onceToken, &__block_literal_global_125);
  }
  v2 = (void *)serviceViewControllerInterface_interface;

  return v2;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_AuthorizationRemoteViewControllerHost;
  id v4 = a3;
  [(_UIRemoteViewController *)&v6 viewServiceDidTerminateWithError:v4];
  v5 = [(_AuthorizationRemoteViewControllerHost *)self delegate];
  [v5 sheetDidFinishWithError:v4];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = LA_LOG_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v6 = self;
    _os_log_impl(&dword_23F450000, v3, OS_LOG_TYPE_DEFAULT, "%@ deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)_AuthorizationRemoteViewControllerHost;
  [(_UIRemoteViewController *)&v4 dealloc];
}

- (void)authenticatorServiceDidFinishWithError:(id)a3 reply:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  uint64_t v7 = [(_AuthorizationRemoteViewControllerHost *)self delegate];
  [v7 sheetDidFinishWithError:v6];

  v8[2]();
}

- (void)authenticatorServiceDidObtainAuthenticationWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(_AuthorizationRemoteViewControllerHost *)self delegate];
  [v5 didProvideAuthorizationRequirementWithReply:v4];
}

- (void)startWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71___AuthorizationRemoteViewControllerHost_startWithConfiguration_reply___block_invoke;
  v10[3] = &unk_26506EAE8;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v10];
  [v9 startWithConfiguration:v8 reply:v7];
}

- (void)stopWithReply:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56___AuthorizationRemoteViewControllerHost_stopWithReply___block_invoke;
  v7[3] = &unk_26506EAE8;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v7];
  [v6 stopWithReply:v5];
}

- (_AuthorizationRemoteViewControllerHostDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_AuthorizationRemoteViewControllerHostDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end