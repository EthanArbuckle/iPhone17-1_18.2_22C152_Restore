@interface EnvironmentService
- (EnvironmentService)initWithDependencies:(id)a3 workQueue:(id)a4;
- (LACEnvironmentServiceXPC)xpcController;
- (void)_postNotification;
- (void)_startBiometryMonitoring;
- (void)_startCompanionMonitoring;
- (void)_startMonitors;
- (void)_startUserPasswordMonitoring;
- (void)biometryAccessoriesDidChangeForHelper:(id)a3;
- (void)biometryEnrolledStateDidChangeForHelper:(id)a3;
- (void)biometryLockoutStateDidChangeForHelper:(id)a3;
- (void)onenessSessionMonitorDidUpdate:(id)a3;
- (void)passcodeSetDidChangeForHelper:(id)a3;
- (void)startServices;
@end

@implementation EnvironmentService

- (EnvironmentService)initWithDependencies:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EnvironmentService;
  v8 = [(EnvironmentService *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dependencies, v6);
    v10 = (LACEnvironmentServiceXPC *)[objc_alloc((Class)LACEnvironmentServiceXPCHost) initWithDependencies:v6 workQueue:v7];
    xpcController = v9->_xpcController;
    v9->_xpcController = v10;

    objc_storeStrong((id *)&v9->_workQueue, a4);
  }

  return v9;
}

- (void)startServices
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000C9A4;
  v4[3] = &unk_100038B28;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_startMonitors
{
  [(EnvironmentService *)self _startBiometryMonitoring];
  [(EnvironmentService *)self _startUserPasswordMonitoring];

  [(EnvironmentService *)self _startCompanionMonitoring];
}

- (void)_startBiometryMonitoring
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dependencies);
  v3 = [WeakRetained biometryHelper];
  [v3 addObserver:self];
}

- (void)_startUserPasswordMonitoring
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dependencies);
  v3 = [WeakRetained passcodeHelper];
  [v3 addObserver:self];
}

- (void)_startCompanionMonitoring
{
  p_dependencies = &self->_dependencies;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dependencies);
  id v5 = [WeakRetained onenessSessionMonitor];
  [v5 addObserver:self];

  id v7 = objc_loadWeakRetained((id *)p_dependencies);
  id v6 = [v7 onenessSessionMonitor];
  [v6 startMonitoring];
}

- (void)passcodeSetDidChangeForHelper:(id)a3
{
  v4 = LACLogEnvironment();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Environment has changed (user password)", v5, 2u);
  }

  [(EnvironmentService *)self _postNotification];
}

- (void)biometryEnrolledStateDidChangeForHelper:(id)a3
{
  v4 = LACLogEnvironment();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Environment has changed (biometric enrollment)", v5, 2u);
  }

  [(EnvironmentService *)self _postNotification];
}

- (void)biometryLockoutStateDidChangeForHelper:(id)a3
{
  v4 = LACLogEnvironment();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Environment has changed (biometric lockout state)", v5, 2u);
  }

  [(EnvironmentService *)self _postNotification];
}

- (void)biometryAccessoriesDidChangeForHelper:(id)a3
{
  v4 = LACLogEnvironment();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Environment has changed (biometric accessories)", v5, 2u);
  }

  [(EnvironmentService *)self _postNotification];
}

- (void)onenessSessionMonitorDidUpdate:(id)a3
{
  v4 = LACLogEnvironment();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Environment has changed (companion session state)", v5, 2u);
  }

  [(EnvironmentService *)self _postNotification];
}

- (void)_postNotification
{
  id v2 = +[LACDarwinNotificationCenter sharedInstance];
  [v2 postNotification:LACDarwinNotificationEnvironmentStateDidChange];
}

- (LACEnvironmentServiceXPC)xpcController
{
  return self->_xpcController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_xpcController, 0);

  objc_destroyWeak((id *)&self->_dependencies);
}

@end