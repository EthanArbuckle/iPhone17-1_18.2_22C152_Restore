@interface RemoteAlertWrapper
- (NSXPCConnection)xpcConnection;
- (RemoteAlertWrapper)initWithServiceName:(id)a3 viewControllerClassName:(id)a4;
- (SBSRemoteAlertActivationContext)activationContext;
- (SBSRemoteAlertDefinition)definition;
- (SBSRemoteAlertHandle)handle;
- (SBSRemoteAlertHandleObserver)observer;
- (SBSRemoteAlertPresentationTarget)presentationTarget;
- (void)activateForTargetXPCConnection:(id)a3 sceneID:(id)a4 shouldDismissOnUILock:(BOOL)a5 userInfo:(id)a6;
- (void)setActivationContext:(id)a3;
- (void)setDefinition:(id)a3;
- (void)setHandle:(id)a3;
- (void)setObserver:(id)a3;
- (void)setPresentationTarget:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation RemoteAlertWrapper

- (RemoteAlertWrapper)initWithServiceName:(id)a3 viewControllerClassName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RemoteAlertWrapper;
  v8 = [(RemoteAlertWrapper *)&v11 init];
  if (v8)
  {
    id v9 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:v6 viewControllerClassName:v7];
    [(RemoteAlertWrapper *)v8 setDefinition:v9];
  }
  return v8;
}

- (void)activateForTargetXPCConnection:(id)a3 sceneID:(id)a4 shouldDismissOnUILock:(BOOL)a5 userInfo:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  [(RemoteAlertWrapper *)self setXpcConnection:a3];
  v12 = objc_opt_new();
  [v12 setUserInfo:v10];

  v13 = [(RemoteAlertWrapper *)self definition];
  id v14 = +[SBSRemoteAlertHandle newHandleWithDefinition:v13 configurationContext:v12];
  [(RemoteAlertWrapper *)self setHandle:v14];

  if (self->_handle && (id v15 = objc_loadWeakRetained((id *)&self->_observer), v15, v15))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138543362;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Registering handle observer", (uint8_t *)&v28, 0xCu);
    }
    handle = self->_handle;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    [(SBSRemoteAlertHandle *)handle registerObserver:WeakRetained];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138543362;
    v29 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not registering handle observer", (uint8_t *)&v28, 0xCu);
  }
  v18 = [(RemoteAlertWrapper *)self xpcConnection];
  v19 = +[BSProcessHandle processHandleForNSXPCConnection:v18];

  id v20 = [objc_alloc((Class)SBSRemoteAlertPresentationTarget) initWithTargetProcess:v19];
  [(RemoteAlertWrapper *)self setPresentationTarget:v20];

  v21 = [(RemoteAlertWrapper *)self presentationTarget];
  [v21 setScenePersistentIdentifier:v11];

  v22 = [(RemoteAlertWrapper *)self presentationTarget];
  [v22 setShouldDismissOnUILock:v6];

  v23 = objc_opt_new();
  [(RemoteAlertWrapper *)self setActivationContext:v23];

  v24 = [(RemoteAlertWrapper *)self activationContext];
  v25 = [(RemoteAlertWrapper *)self presentationTarget];
  [v24 setPresentationTarget:v25];

  v26 = [(RemoteAlertWrapper *)self handle];
  v27 = [(RemoteAlertWrapper *)self activationContext];
  [v26 activateWithContext:v27];
}

- (SBSRemoteAlertHandleObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (SBSRemoteAlertHandleObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (SBSRemoteAlertDefinition)definition
{
  return (SBSRemoteAlertDefinition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDefinition:(id)a3
{
}

- (SBSRemoteAlertHandle)handle
{
  return (SBSRemoteAlertHandle *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHandle:(id)a3
{
}

- (SBSRemoteAlertPresentationTarget)presentationTarget
{
  return (SBSRemoteAlertPresentationTarget *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPresentationTarget:(id)a3
{
}

- (SBSRemoteAlertActivationContext)activationContext
{
  return (SBSRemoteAlertActivationContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setActivationContext:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_activationContext, 0);
  objc_storeStrong((id *)&self->_presentationTarget, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_definition, 0);

  objc_destroyWeak((id *)&self->_observer);
}

@end