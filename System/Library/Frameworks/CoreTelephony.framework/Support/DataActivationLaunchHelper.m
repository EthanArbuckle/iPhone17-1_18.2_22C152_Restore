@interface DataActivationLaunchHelper
- (BOOL)isAlertHandleExistAndValid;
- (DataActivationLaunchHelper)initWithLogger:(const void *)a3;
- (void)invalidateRemoteAlertHandle;
- (void)launchWithServiceName:(id)a3 viewControllerClassName:(id)a4 options:(id)a5;
- (void)reactivateDataActivationIfPresent;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
@end

@implementation DataActivationLaunchHelper

- (DataActivationLaunchHelper)initWithLogger:(const void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DataActivationLaunchHelper;
  result = [(DataActivationLaunchHelper *)&v5 init];
  if (result) {
    result->fLogger = a3;
  }
  return result;
}

- (void)launchWithServiceName:(id)a3 viewControllerClassName:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->fAlertHandle)
  {
    v11 = sub_100200FB4((id *)self->fLogger);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I invalidate previous handle", (uint8_t *)&v18, 2u);
    }

    [(DataActivationLaunchHelper *)self invalidateRemoteAlertHandle];
  }
  id v12 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:v8 viewControllerClassName:v9];
  id v13 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  [v13 setUserInfo:v10];
  v14 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v12 configurationContext:v13];
  fAlertHandle = self->fAlertHandle;
  self->fAlertHandle = v14;

  [(SBSRemoteAlertHandle *)self->fAlertHandle addObserver:self];
  id v16 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  [v16 setReason:@"Cellular Plan Provisioning"];
  [(SBSRemoteAlertHandle *)self->fAlertHandle activateWithContext:v16];
  v17 = sub_100200FB4((id *)self->fLogger);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %{public}@: launched...", (uint8_t *)&v18, 0xCu);
  }
}

- (BOOL)isAlertHandleExistAndValid
{
  v3 = sub_100200FB4((id *)self->fLogger);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    fAlertHandle = self->fAlertHandle;
    if (fAlertHandle) {
      unsigned int v5 = [(SBSRemoteAlertHandle *)fAlertHandle isValid];
    }
    else {
      unsigned int v5 = -1;
    }
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I alert handle is valid: %d", (uint8_t *)v8, 8u);
  }

  v6 = self->fAlertHandle;
  if (v6) {
    LOBYTE(v6) = [(SBSRemoteAlertHandle *)v6 isValid];
  }
  return (char)v6;
}

- (void)reactivateDataActivationIfPresent
{
  id v3 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  [v3 setReason:@"CellularPlanProvisioning"];
  [(SBSRemoteAlertHandle *)self->fAlertHandle activateWithContext:v3];
  v4 = sub_100200FB4((id *)self->fLogger);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I DataActivation: relaunch...", v5, 2u);
  }
}

- (void)invalidateRemoteAlertHandle
{
  [(SBSRemoteAlertHandle *)self->fAlertHandle invalidate];
  fAlertHandle = self->fAlertHandle;
  self->fAlertHandle = 0;
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  v6 = (SBSRemoteAlertHandle *)a3;
  id v7 = a4;
  id v8 = sub_100200FB4((id *)self->fLogger);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 description];
    int v12 = 136315138;
    id v13 = [v9 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I RemoteAlertHandle: invalidated with error %s", (uint8_t *)&v12, 0xCu);
  }
  if (self->fAlertHandle == v6)
  {
    id v10 = sub_100200FB4((id *)self->fLogger);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I RemoteAlertHandle: releasing my handle", (uint8_t *)&v12, 2u);
    }

    fAlertHandle = self->fAlertHandle;
    self->fAlertHandle = 0;
  }
}

- (void).cxx_destruct
{
}

@end