@interface ASServiceDaemon
- (ASServiceDaemon)initWithLaunchContext:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_loadExecutionService;
- (void)_setUpEventHandlersForNotifyd;
- (void)_setupAccessibility;
- (void)dealloc;
- (void)resume;
@end

@implementation ASServiceDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionService, 0);
  objc_storeStrong((id *)&self->_servicesMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_setupAccessibility
{
  id v2 = [off_10001A560() sharedSystemShellSwitcher];
  [v2 signalSiriAvailability];
}

- (id)_loadExecutionService
{
  executionService = self->_executionService;
  if (!executionService)
  {
    v4 = (SKRExecutionListenerManager *)objc_alloc_init((Class)SKRExecutionListenerManager);
    v5 = self->_executionService;
    self->_executionService = v4;

    executionService = self->_executionService;
  }
  v6 = executionService;
  return v6;
}

- (void)_setUpEventHandlersForNotifyd
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = kAssistantServiceEntitlement;
  char HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    v8 = AFProviderServiceDelegateXPCInterface();
    [v5 setRemoteObjectInterface:v8];

    v9 = AFProviderServiceXPCInterface();
    [v5 setExportedInterface:v9];

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v12 = dispatch_queue_create(0, v11);
    [v5 _setQueue:v12];

    v13 = [[ASServiceClient alloc] initWithConnection:v5 servicesMonitor:self->_servicesMonitor];
    [v5 setExportedObject:v13];
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_100006118;
    v21 = &unk_1000146C0;
    v22 = v13;
    v23 = self;
    v14 = v13;
    [v5 setInvalidationHandler:&v18];
    ++self->_connectionCount;
    objc_msgSend(v5, "resume", v18, v19, v20, v21);
  }
  else
  {
    v15 = (void *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      v17 = v15;
      *(_DWORD *)buf = 136315650;
      v25 = "-[ASServiceDaemon listener:shouldAcceptNewConnection:]";
      __int16 v26 = 2048;
      uint64_t v27 = (int)[v5 processIdentifier];
      __int16 v28 = 2112;
      uint64_t v29 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Rejecting connection from pid %ld because it does not have entitlement %@", buf, 0x20u);
    }
  }

  return HasEntitlement;
}

- (void)resume
{
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ASServiceDaemon;
  [(ASServiceDaemon *)&v3 dealloc];
}

- (ASServiceDaemon)initWithLaunchContext:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)ASServiceDaemon;
  objc_super v3 = [(ASServiceDaemon *)&v16 init];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.assistant.service.listener", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = +[AFInstanceContext currentContext];
    uint64_t v9 = [v8 createXPCListenerWithMachServiceName:kAssistantServiceServiceName];
    listener = v3->_listener;
    v3->_listener = (NSXPCListener *)v9;

    [(NSXPCListener *)v3->_listener _setQueue:v3->_queue];
    [(NSXPCListener *)v3->_listener setDelegate:v3];
    v11 = objc_alloc_init(ASServicesMonitor);
    servicesMonitor = v3->_servicesMonitor;
    v3->_servicesMonitor = v11;

    [(ASServiceDaemon *)v3 _setUpEventHandlersForNotifyd];
    uint64_t v13 = [(ASServiceDaemon *)v3 _loadExecutionService];
    executionService = v3->_executionService;
    v3->_executionService = (SKRExecutionListenerManager *)v13;

    [(ASServiceDaemon *)v3 _setupAccessibility];
  }
  return v3;
}

@end