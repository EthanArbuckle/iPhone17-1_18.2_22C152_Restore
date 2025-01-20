@interface SBERemoteViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3;
- (void)externalDisplayHardwareRequirementsSatisfiedChanged:(BOOL)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidLoad;
@end

@implementation SBERemoteViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SBERemoteViewController;
  [(SBERemoteViewController *)&v5 viewDidLoad];
  v3 = [(SBERemoteViewController *)self view];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBERemoteViewController;
  [(SBERemoteViewController *)&v3 dealloc];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v18 = a3;
  v6 = (void (**)(void))a4;
  v7 = [(SBERemoteViewController *)self _remoteViewControllerProxyWithErrorHandler:0];
  [v7 setReachabilityDisabled:1];
  [v7 setAllowsAlertStacking:1];
  [v7 setAllowsControlCenter:0];
  v8 = [v18 xpcEndpoint];

  if (v8)
  {
    id v9 = objc_alloc_init((Class)NSXPCListenerEndpoint);
    v10 = [v18 xpcEndpoint];
    [v9 _setEndpoint:v10];

    v11 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v9];
    connection = self->_connection;
    self->_connection = v11;

    v13 = self->_connection;
    v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SBExternalDisplayHardwareRequirementsChangedProtocol];
    [(NSXPCConnection *)v13 setExportedInterface:v14];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    v15 = self->_connection;
    v16 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SBRemoteHandshakeProtocol];
    [(NSXPCConnection *)v15 setRemoteObjectInterface:v16];

    [(NSXPCConnection *)self->_connection resume];
    v17 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v17 wakeUpConnection];
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = [(SBERemoteViewController *)self _remoteViewControllerProxyWithErrorHandler:0];
  id v9 = [v6 userInfo];
  v10 = [v9 objectForKeyedSubscript:@"SBEducationRemoteViewControllerEducationTypeKey"];
  uint64_t v11 = (int)[v10 intValue];

  if (v11 == 1)
  {
    v12 = objc_alloc_init(SBEExternalDisplayContentViewController);
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_10000449C;
    v21 = &unk_10000C288;
    v13 = &v22;
    id v15 = v6;
    id v22 = v15;
    v14 = &v23;
    id v23 = v8;
    [(SBEExternalDisplayContentViewController *)v12 setCompletionHandler:&v18];
    v16 = [v15 userInfo:v18, v19, v20, v21];
    v17 = [v16 objectForKeyedSubscript:@"SBEducationRemoteViewControllerHasPointerAndKeyboardConnectedKey"];
    -[SBEExternalDisplayContentViewController externalDisplayHardwareRequirementsSatisfiedChanged:](v12, "externalDisplayHardwareRequirementsSatisfiedChanged:", [v17 BOOLValue]);

    objc_storeWeak((id *)&self->_hardwareRequirementsSublistener, v12);
  }
  else
  {
    if (v11) {
      goto LABEL_6;
    }
    v12 = objc_alloc_init(SBEChamoisContentViewController);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000043E4;
    v24[3] = &unk_10000C260;
    v13 = &v25;
    id v25 = v6;
    v14 = &v26;
    id v26 = v8;
    [(SBEExternalDisplayContentViewController *)v12 setCompletionHandler:v24];
  }
  [(SBERemoteViewController *)self presentViewController:v12 animated:1 completion:0];

LABEL_6:
  if (v7) {
    v7[2](v7);
  }
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)externalDisplayHardwareRequirementsSatisfiedChanged:(BOOL)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000461C;
  v5[3] = &unk_10000C2B0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hardwareRequirementsSublistener);
  BOOL v7 = a3;
  id v4 = WeakRetained;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)dismissAnimated:(BOOL)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000046D4;
  v5[3] = &unk_10000C2B0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hardwareRequirementsSublistener);
  BOOL v7 = a3;
  id v4 = WeakRetained;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_hardwareRequirementsSublistener);
}

@end