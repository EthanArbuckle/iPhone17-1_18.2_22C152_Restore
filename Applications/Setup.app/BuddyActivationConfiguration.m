@interface BuddyActivationConfiguration
+ (id)currentConfiguration;
- (BOOL)_supportsCellularActivationForMethod:(unint64_t)a3;
- (BOOL)activationMethodChanged;
- (BOOL)hasActivated;
- (BOOL)initialActivationState;
- (BOOL)isActivated;
- (BOOL)supportsCellularActivation;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyActivationConfiguration)init;
- (BuddyActivationConfiguration)initWithBuddyPreferencesExcludedFromBackup:(id)a3;
- (CoreTelephonyClient)telephonyClient;
- (NSMutableSet)delegates;
- (OS_dispatch_queue)activationStateQueue;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)telephonyQueue;
- (unint64_t)cellularActivationMethod;
- (void)_activationStateChanged;
- (void)_registerForActivationStateNotification;
- (void)addDelegate:(id)a3;
- (void)connectionAvailability:(id)a3 availableConnections:(id)a4;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)internetConnectionAvailability:(BOOL)a3;
- (void)notifyDelegatesConfigurationChanged:(BOOL)a3;
- (void)notifyDelegatesConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4;
- (void)removeDelegate:(id)a3;
- (void)setActivationMethodChanged:(BOOL)a3;
- (void)setActivationStateQueue:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setCellularActivationMethod:(unint64_t)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setHasActivated:(BOOL)a3;
- (void)setInitialActivationState:(BOOL)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setTelephonyQueue:(id)a3;
@end

@implementation BuddyActivationConfiguration

+ (id)currentConfiguration
{
  v5 = (dispatch_once_t *)&unk_100321FA0;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B4D38);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321FA8;

  return v2;
}

- (BuddyActivationConfiguration)init
{
  id v3 = +[BYPreferencesController buddyPreferencesExcludedFromBackup];
  id location = [(BuddyActivationConfiguration *)self initWithBuddyPreferencesExcludedFromBackup:v3];
  objc_storeStrong(&location, location);

  v4 = (BuddyActivationConfiguration *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BuddyActivationConfiguration)initWithBuddyPreferencesExcludedFromBackup:(id)a3
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v24;
  id v24 = 0;
  v22.receiver = v3;
  v22.super_class = (Class)BuddyActivationConfiguration;
  v4 = [(BuddyActivationConfiguration *)&v22 init];
  id v24 = v4;
  objc_storeStrong(&v24, v4);
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableSet);
    [v24 setDelegates:v5];

    dispatch_queue_t v6 = dispatch_queue_create("Activation Configuration Delegates Queue", 0);
    [v24 setDelegateQueue:v6];

    dispatch_queue_t v7 = dispatch_queue_create("Telephony Queue", 0);
    [v24 setTelephonyQueue:v7];

    id v8 = objc_alloc((Class)CoreTelephonyClient);
    id v9 = [v24 telephonyQueue];
    id v10 = [v8 initWithQueue:v9];
    [v24 setTelephonyClient:v10];

    id v11 = v24;
    id v12 = [v24 telephonyClient];
    [v12 setDelegate:v11];

    [v24 setBuddyPreferencesExcludedFromBackup:location[0]];
    [v24 setCellularActivationMethod:0];
    [v24 setActivationMethodChanged:1];
    dispatch_queue_t v13 = dispatch_queue_create("Activation State Queue", 0);
    [v24 setActivationStateQueue:v13];

    v14 = [v24 activationStateQueue];
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_1001F66F4;
    v20 = &unk_1002B0D20;
    id v21 = v24;
    dispatch_async(v14, &v17);

    [v24 _registerForActivationStateNotification:v17, v18, v19, v20];
    objc_storeStrong(&v21, 0);
  }
  v15 = (BuddyActivationConfiguration *)v24;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v24, 0);
  return v15;
}

- (void)addDelegate:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyActivationConfiguration *)v12 delegateQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  dispatch_queue_t v7 = sub_1001F6848;
  id v8 = &unk_1002B12F0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)removeDelegate:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyActivationConfiguration *)v12 delegateQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  dispatch_queue_t v7 = sub_1001F69AC;
  id v8 = &unk_1002B12F0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)notifyDelegatesConfigurationChanged:(BOOL)a3
{
  dispatch_queue_t v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  id v3 = [(BuddyActivationConfiguration *)self delegateQueue];
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  dispatch_queue_t v7 = sub_1001F6ADC;
  id v8 = &unk_1002B1130;
  id v9 = v13;
  BOOL v10 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
}

- (void)notifyDelegatesConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4
{
  v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  BOOL v13 = a4;
  v4 = [(BuddyActivationConfiguration *)self delegateQueue];
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1001F6C14;
  id v9 = &unk_1002B2418;
  BOOL v10 = v16;
  BOOL v11 = v14;
  BOOL v12 = v13;
  dispatch_async((dispatch_queue_t)v4, &v5);

  objc_storeStrong((id *)&v10, 0);
}

- (BOOL)isActivated
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  oslog[1] = 0;
  v2 = (void *)MAEGetActivationStateWithError();
  objc_storeStrong(location, 0);
  id v10 = v2;
  if (location[0])
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      char v7 = 0;
      char v5 = 0;
      if (_BYIsInternalInstall())
      {
        id v3 = (NSString *)location[0];
      }
      else if (location[0])
      {
        id v8 = [location[0] domain];
        char v7 = 1;
        id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v8, [location[0] code]);
        int v6 = v3;
        char v5 = 1;
      }
      else
      {
        id v3 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v3);
      _os_log_error_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_ERROR, "Failed to get activation state: %{public}@", buf, 0xCu);
      if (v5) {

      }
      if (v7) {
    }
      }
    objc_storeStrong((id *)oslog, 0);
    char v12 = 0;
  }
  else
  {
    char v12 = ([v10 isEqualToString:kMAActivationStateUnactivated] ^ 1) & 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v12 & 1;
}

- (BOOL)hasActivated
{
  v16 = self;
  SEL v15 = a2;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  int v12 = 0x20000000;
  int v13 = 32;
  char v14 = 0;
  v2 = [(BuddyActivationConfiguration *)self activationStateQueue];
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = sub_1001F70A8;
  id v8 = &unk_1002B1D70;
  v9[1] = &v10;
  v9[0] = v16;
  dispatch_sync(v2, &v4);

  LOBYTE(v2) = *((unsigned char *)v11 + 24);
  objc_storeStrong(v9, 0);
  _Block_object_dispose(&v10, 8);
  return v2 & 1;
}

- (BOOL)supportsCellularActivation
{
  unint64_t v2 = [(BuddyActivationConfiguration *)self cellularActivationMethod];
  if (v2)
  {
    if (v2 - 1 < 2) {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (unint64_t)cellularActivationMethod
{
  v35 = self;
  location[1] = (os_log_t)a2;
  if ([(BuddyActivationConfiguration *)self activationMethodChanged])
  {
    location[0] = (os_log_t)(id)_BYLoggingFacility();
    char v33 = 2;
    if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEBUG))
    {
      unint64_t v2 = location[0];
      os_log_type_t v3 = v33;
      sub_10004B24C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v2, v3, "Updating cellular activation method...", buf, 2u);
    }
    objc_storeStrong((id *)location, 0);
    uint64_t v31 = 0;
    id v30 = 0;
    char v4 = [(BuddyActivationConfiguration *)v35 telephonyClient];
    id obj = 0;
    id v5 = [(CoreTelephonyClient *)v4 getConnectionAvailability:0 connectionType:9 error:&obj];
    objc_storeStrong(&v30, obj);
    id v29 = v5;

    if (v29)
    {
      if ([v29 available]) {
        uint64_t v31 = 2;
      }
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        char v24 = 0;
        char v22 = 0;
        if (_BYIsInternalInstall())
        {
          int v6 = (NSString *)v30;
        }
        else if (v30)
        {
          id v25 = [v30 domain];
          char v24 = 1;
          int v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v25, [v30 code]);
          id v23 = v6;
          char v22 = 1;
        }
        else
        {
          int v6 = 0;
        }
        sub_10004BB7C((uint64_t)v38, (uint64_t)v6);
        _os_log_impl((void *)&_mh_execute_header, oslog, v26, "Unable to get availability status to see if cellular activation is supported: %{public}@", v38, 0xCu);
        if (v22) {

        }
        if (v24) {
      }
        }
      objc_storeStrong((id *)&oslog, 0);
    }
    char v7 = [(BuddyActivationConfiguration *)v35 telephonyClient];
    id v20 = v30;
    id v8 = [(CoreTelephonyClient *)v7 usingBootstrapDataService:&v20];
    objc_storeStrong(&v30, v20);
    id v21 = v8;

    if (v21)
    {
      if ([v21 BOOLValue]) {
        uint64_t v31 = 1;
      }
    }
    else
    {
      os_log_t v19 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        char v16 = 0;
        char v14 = 0;
        if (_BYIsInternalInstall())
        {
          id v9 = (NSString *)v30;
        }
        else if (v30)
        {
          id v17 = [v30 domain];
          char v16 = 1;
          id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v17, [v30 code]);
          id v15 = v9;
          char v14 = 1;
        }
        else
        {
          id v9 = 0;
        }
        sub_10004BB7C((uint64_t)v37, (uint64_t)v9);
        _os_log_error_impl((void *)&_mh_execute_header, v19, v18, "Unable to get bootstrap status to see if cellular activation is supported: %{public}@", v37, 0xCu);
        if (v14) {

        }
        if (v16) {
      }
        }
      objc_storeStrong((id *)&v19, 0);
    }
    BOOL v13 = 0;
    BOOL v13 = v31 != v35->_cellularActivationMethod;
    v35->_cellularActivationMethod = v31;
    if (v13 || (byte_100321F98 & 1) == 0)
    {
      os_log_t v12 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v10 = [(BuddyActivationConfiguration *)v35 _supportsCellularActivationForMethod:v31];
        sub_10017900C((uint64_t)v36, v10 & 1, v31);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Supports Cellular Activation: %d (method is %ld)", v36, 0x12u);
      }
      objc_storeStrong((id *)&v12, 0);
      byte_100321F98 = 1;
    }
    [(BuddyActivationConfiguration *)v35 setActivationMethodChanged:0];
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  return v35->_cellularActivationMethod;
}

- (BOOL)_supportsCellularActivationForMethod:(unint64_t)a3
{
  if (a3)
  {
    if (a3 - 1 < 2) {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (void)_activationStateChanged
{
  id v9 = self;
  v8[1] = (id)a2;
  unint64_t v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_1001F77B0;
  char v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)_registerForActivationStateNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1001F7958, @"com.apple.mobile.lockdown.activation_state", 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  unsigned __int8 v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v8 = a4;
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  [(BuddyActivationConfiguration *)v10 setActivationMethodChanged:1];
  [(BuddyActivationConfiguration *)v10 notifyDelegatesConfigurationChanged:0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)connectionAvailability:(id)a3 availableConnections:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BuddyActivationConfiguration *)v7 setActivationMethodChanged:1];
  [(BuddyActivationConfiguration *)v7 notifyDelegatesConfigurationChanged:0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)internetConnectionAvailability:(BOOL)a3
{
}

- (void)setHasActivated:(BOOL)a3
{
  self->_hasActivated = a3;
}

- (void)setCellularActivationMethod:(unint64_t)a3
{
  self->_cellularActivationMethod = a3;
}

- (NSMutableSet)delegates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegates:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTelephonyClient:(id)a3
{
}

- (OS_dispatch_queue)telephonyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTelephonyQueue:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BOOL)activationMethodChanged
{
  return self->_activationMethodChanged;
}

- (void)setActivationMethodChanged:(BOOL)a3
{
  self->_activationMethodChanged = a3;
}

- (BOOL)initialActivationState
{
  return self->_initialActivationState;
}

- (void)setInitialActivationState:(BOOL)a3
{
  self->_initialActivationState = a3;
}

- (OS_dispatch_queue)activationStateQueue
{
  return self->_activationStateQueue;
}

- (void)setActivationStateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end