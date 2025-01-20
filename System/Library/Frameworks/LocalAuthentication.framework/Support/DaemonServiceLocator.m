@interface DaemonServiceLocator
+ (id)sharedInstance;
- (DaemonServiceLocator)init;
- (LACDTOService)dto;
- (LACDarwinNotificationCenter)darwinNotificationCenter;
- (LACEnvironmentService)environment;
- (LACOnenessService)oneness;
- (LACSharedModeService)sharedMode;
- (LACUserInterfaceController)uiController;
- (id)serviceWithIdentifier:(id)a3;
- (void)_startDTO;
- (void)_startEnvironment;
- (void)_startNotificationServices;
- (void)_startOneness;
- (void)registerService:(id)a3 identifier:(id)a4;
- (void)startServices;
@end

@implementation DaemonServiceLocator

+ (id)sharedInstance
{
  if (qword_100046E88 != -1) {
    dispatch_once(&qword_100046E88, &stru_1000391A8);
  }
  v2 = (void *)qword_100046E80;

  return v2;
}

- (LACOnenessService)oneness
{
  return self->_oneness;
}

- (LACUserInterfaceController)uiController
{
  return self->_uiController;
}

- (LACSharedModeService)sharedMode
{
  return self->_sharedMode;
}

- (LACDTOService)dto
{
  return self->_dto;
}

- (id)serviceWithIdentifier:(id)a3
{
  return [(LACServiceLocator *)self->_locator serviceWithIdentifier:a3];
}

- (DaemonServiceLocator)init
{
  v47.receiver = self;
  v47.super_class = (Class)DaemonServiceLocator;
  v2 = [(DaemonServiceLocator *)&v47 init];
  if (v2 && objc_opt_class())
  {
    v3 = (LACServiceLocator *)objc_alloc_init((Class)LACServiceLocator);
    locator = v2->_locator;
    v2->_locator = v3;

    v5 = (LACUserInterfaceController *)objc_alloc_init((Class)LACUserInterfaceController);
    uiController = v2->_uiController;
    v2->_uiController = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    notificationObservers = v2->_notificationObservers;
    v2->_notificationObservers = v7;

    v9 = v2->_notificationObservers;
    id v10 = objc_alloc_init((Class)LAACMBiometricAttemptNotifier);
    [(NSMutableArray *)v9 addObject:v10];

    uint64_t v11 = +[LACDarwinNotificationCenter sharedInstance];
    darwinNotificationCenter = v2->_darwinNotificationCenter;
    v2->_darwinNotificationCenter = (LACDarwinNotificationCenter *)v11;

    v13 = v2->_darwinNotificationCenter;
    v14 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___LACDarwinNotificationCenter);
    [(DaemonServiceLocator *)v2 registerService:v13 identifier:v14];

    v15 = [DTOService alloc];
    v16 = +[DaemonUtils queue];
    v17 = [(DTOService *)v15 initWithWorkQueue:v16 notificationCenter:v2->_darwinNotificationCenter ui:v2->_uiController];
    dto = v2->_dto;
    v2->_dto = (LACDTOService *)v17;

    v19 = v2->_dto;
    v20 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___LACDTOService);
    [(DaemonServiceLocator *)v2 registerService:v19 identifier:v20];

    id v21 = objc_alloc((Class)LACOnenessSessionMonitor);
    v22 = +[DaemonUtils queue];
    id v23 = [v21 initWithReplyQueue:v22];

    v24 = [OnenessService alloc];
    v25 = v2->_uiController;
    v26 = +[DaemonUtils queue];
    v27 = [(OnenessService *)v24 initWithUIController:v25 sessionMonitor:v23 workQueue:v26];
    oneness = v2->_oneness;
    v2->_oneness = (LACOnenessService *)v27;

    v29 = v2->_oneness;
    v30 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___LACOnenessService);
    [(DaemonServiceLocator *)v2 registerService:v29 identifier:v30];

    id v31 = objc_alloc((Class)LACSharedModeService);
    v32 = +[DaemonUtils queue];
    v33 = (LACSharedModeService *)[v31 initWithReplyQueue:v32];
    sharedMode = v2->_sharedMode;
    v2->_sharedMode = v33;

    v35 = v2->_sharedMode;
    v36 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___LACSharedModeService);
    [(DaemonServiceLocator *)v2 registerService:v35 identifier:v36];

    id v37 = objc_alloc_init((Class)LACEnvironmentDependencies);
    v38 = +[LACBiometryHelper sharedInstance];
    [v37 setBiometryHelper:v38];

    v39 = +[LACPasscodeHelper sharedInstance];
    [v37 setPasscodeHelper:v39];

    [v37 setOnenessSessionMonitor:v23];
    v40 = [EnvironmentService alloc];
    v41 = +[DaemonUtils queue];
    v42 = [(EnvironmentService *)v40 initWithDependencies:v37 workQueue:v41];
    environment = v2->_environment;
    v2->_environment = (LACEnvironmentService *)v42;

    v44 = v2->_environment;
    v45 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___LACEnvironmentService);
    [(DaemonServiceLocator *)v2 registerService:v44 identifier:v45];
  }
  return v2;
}

- (void)startServices
{
  [(DaemonServiceLocator *)self _startNotificationServices];
  [(DaemonServiceLocator *)self _startDTO];
  [(DaemonServiceLocator *)self _startEnvironment];

  [(DaemonServiceLocator *)self _startOneness];
}

- (void)_startNotificationServices
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_notificationObservers;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[LACDarwinNotificationCenter addObserver:](self->_darwinNotificationCenter, "addObserver:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(LACDarwinNotificationCenter *)self->_darwinNotificationCenter listenToLaunchNotifications];
}

- (void)_startDTO
{
}

- (void)_startEnvironment
{
}

- (void)_startOneness
{
}

- (void)registerService:(id)a3 identifier:(id)a4
{
}

- (LACDarwinNotificationCenter)darwinNotificationCenter
{
  return self->_darwinNotificationCenter;
}

- (LACEnvironmentService)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_sharedMode, 0);
  objc_storeStrong((id *)&self->_oneness, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_darwinNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_dto, 0);

  objc_storeStrong((id *)&self->_locator, 0);
}

@end