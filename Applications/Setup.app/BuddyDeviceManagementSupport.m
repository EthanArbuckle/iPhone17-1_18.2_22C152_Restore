@interface BuddyDeviceManagementSupport
+ (id)sharedSupport;
- (BOOL)deviceManagementWantsToSkipControllerClass:(Class)a3;
- (BOOL)didAttemptToFetchSkipKeys;
- (BOOL)didFetchSkipKeysSuccessfully;
- (BOOL)shouldDisallowProximityAdvertisement;
- (BuddyDeviceManagementProvider)deviceManagementProvider;
- (BuddyDeviceManagementSupport)init;
- (NSArray)skipKeys;
- (OS_dispatch_queue)skipKeysQueue;
- (float)_delayBetweenLoadSkipKeysRetriesInSeconds;
- (void)_loadSkipKeys:(id)a3;
- (void)_loadSkipKeysWithCurrentTry:(int)a3 completion:(id)a4;
- (void)loadSkipKeys:(id)a3;
- (void)setDeviceManagementProvider:(id)a3;
- (void)setDidAttemptToFetchSkipKeys:(BOOL)a3;
- (void)setDidFetchSkipKeysSuccessfully:(BOOL)a3;
- (void)setSkipKeys:(id)a3;
- (void)setSkipKeysQueue:(id)a3;
@end

@implementation BuddyDeviceManagementSupport

+ (id)sharedSupport
{
  v5 = (dispatch_once_t *)&unk_100321F30;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B4B60);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321F28;

  return v2;
}

- (BuddyDeviceManagementSupport)init
{
  SEL v8 = a2;
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyDeviceManagementSupport;
  v2 = [(BuddyDeviceManagementSupport *)&v7 init];
  id location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Skip Keys Queue", 0);
    [location setSkipKeysQueue:v3];

    v4 = objc_alloc_init(BuddyDeviceManagementProvider);
    [location setDeviceManagementProvider:v4];
  }
  v5 = (BuddyDeviceManagementSupport *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (NSArray)skipKeys
{
  v19 = self;
  v18[1] = (id)a2;
  uint64_t v12 = 0;
  v13 = &v12;
  int v14 = 838860800;
  int v15 = 48;
  v16 = sub_1001E703C;
  v17 = sub_1001E7080;
  v18[0] = 0;
  v2 = [(BuddyDeviceManagementSupport *)self skipKeysQueue];
  block = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_1001E708C;
  v10 = &unk_1002B1D70;
  v11[1] = &v12;
  v11[0] = v19;
  dispatch_sync((dispatch_queue_t)v2, &block);

  if (!v13[5])
  {
    id v3 = objc_alloc((Class)NSString);
    objc_exception_throw([NSException exceptionWithName:@"exceptionWithName:reason:userInfo:" reason:@"Skip Keys Not Loaded" userInfo:[v3 initWithFormat:@"Skip keys were attempted to be access before they were loaded. didAttemptToFetchSkipKeys: %d. didFetchSkipKeysSuccessfully: %d" v19->_didAttemptToFetchSkipKeys, v19->_didFetchSkipKeysSuccessfully]]);
  }
  id v4 = (id)v13[5];
  objc_storeStrong(v11, 0);
  _Block_object_dispose(&v12, 8);
  objc_storeStrong(v18, 0);

  return (NSArray *)v4;
}

- (void)loadSkipKeys:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = oslog;
    os_log_type_t v4 = v6;
    sub_10004B24C(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Loading skip keys", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyDeviceManagementSupport *)v9 _loadSkipKeysWithCurrentTry:0 completion:location[0]];
  objc_storeStrong(location, 0);
}

- (void)_loadSkipKeysWithCurrentTry:(int)a3 completion:(id)a4
{
  v27 = self;
  SEL v26 = a2;
  int v25 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v17 = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  v20 = sub_1001E7390;
  v21 = &unk_1002B2070;
  id v22 = location;
  id v23 = objc_retainBlock(&v17);
  int v16 = 2;
  objc_initWeak(&from, v27);
  [(BuddyDeviceManagementSupport *)v27 setDidAttemptToFetchSkipKeys:1];
  os_log_type_t v4 = v27;
  v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_1001E73D8;
  v9 = &unk_1002B4BB0;
  int v14 = v25;
  v10 = v27;
  id v11 = v23;
  objc_copyWeak(&v13, &from);
  id v12 = location;
  [(BuddyDeviceManagementSupport *)v4 _loadSkipKeys:&v5];
  objc_storeStrong(&v12, 0);
  objc_destroyWeak(&v13);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
}

- (void)_loadSkipKeys:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyDeviceManagementSupport *)v12 deviceManagementProvider];
  os_log_type_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_1001E78D4;
  int v8 = &unk_1002B4BD8;
  v9 = v12;
  id v10 = location[0];
  [(BuddyDeviceManagementProvider *)v3 loadSkipKeys:&v4];

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldDisallowProximityAdvertisement
{
  id v22 = self;
  v21[1] = (id)a2;
  uint64_t v15 = 0;
  int v16 = &v15;
  int v17 = 838860800;
  int v18 = 48;
  int v19 = sub_1001E703C;
  v20 = sub_1001E7080;
  v21[0] = 0;
  v2 = [(BuddyDeviceManagementSupport *)self skipKeysQueue];
  block = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = sub_1001E7C70;
  id v13 = &unk_1002B1D70;
  v14[1] = &v15;
  v14[0] = v22;
  dispatch_sync((dispatch_queue_t)v2, &block);

  if (v16[5])
  {
    char v23 = [(id)v16[5] containsObject:kMCCCSkipSetupTapToSetup] & 1;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = oslog;
      os_log_type_t v4 = v7;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Temporary disallowance of proximity advertisement until skip keys are loaded", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v23 = 1;
  }
  objc_storeStrong(v14, 0);
  _Block_object_dispose(&v15, 8);
  objc_storeStrong(v21, 0);
  return v23 & 1;
}

- (BOOL)deviceManagementWantsToSkipControllerClass:(Class)a3
{
  int v11 = self;
  SEL v10 = a2;
  Class v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_10;
  }
  id location = [(objc_class *)v9 cloudConfigSkipKey];
  char v6 = 0;
  unsigned __int8 v3 = 0;
  if (location)
  {
    os_log_type_t v7 = [(BuddyDeviceManagementSupport *)v11 skipKeys];
    char v6 = 1;
    unsigned __int8 v3 = [(NSArray *)v7 containsObject:location];
  }
  if (v6) {

  }
  if (v3)
  {
    char v12 = 1;
    int v5 = 1;
  }
  else
  {
    int v5 = 0;
  }
  objc_storeStrong(&location, 0);
  if (!v5) {
LABEL_10:
  }
    char v12 = 0;
  return v12 & 1;
}

- (float)_delayBetweenLoadSkipKeysRetriesInSeconds
{
  return 1.0;
}

- (BuddyDeviceManagementProvider)deviceManagementProvider
{
  return (BuddyDeviceManagementProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceManagementProvider:(id)a3
{
}

- (void)setSkipKeys:(id)a3
{
}

- (OS_dispatch_queue)skipKeysQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSkipKeysQueue:(id)a3
{
}

- (BOOL)didAttemptToFetchSkipKeys
{
  return self->_didAttemptToFetchSkipKeys;
}

- (void)setDidAttemptToFetchSkipKeys:(BOOL)a3
{
  self->_didAttemptToFetchSkipKeys = a3;
}

- (BOOL)didFetchSkipKeysSuccessfully
{
  return self->_didFetchSkipKeysSuccessfully;
}

- (void)setDidFetchSkipKeysSuccessfully:(BOOL)a3
{
  self->_didFetchSkipKeysSuccessfully = a3;
}

- (void).cxx_destruct
{
}

@end