@interface ManagedAppManager
- (BOOL)isManagedApp:(id)a3 auditToken:(id *)a4;
- (ManagedAppManager)init;
- (NSArray)managedApps;
- (void)dealloc;
- (void)listenForChanges;
- (void)setManagedApps:(id)a3;
- (void)updateManagedApps:(id)a3;
@end

@implementation ManagedAppManager

- (ManagedAppManager)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)ManagedAppManager;
  v6 = [(ManagedAppManager *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    objc_storeStrong((id *)&v6->managedApps, &__NSArray0__struct);
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)dealloc
{
  SEL v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)ManagedAppManager;
  [(ManagedAppManager *)&v3 dealloc];
}

- (BOOL)isManagedApp:(id)a3 auditToken:(id *)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14[1] = a4;
  v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  v12 = sub_100016090;
  v13 = &unk_100025070;
  v14[0] = v16;
  v18 = (dispatch_once_t *)&unk_100029040;
  id v17 = 0;
  objc_storeStrong(&v17, &v9);
  if (*v18 != -1) {
    dispatch_once(v18, v17);
  }
  objc_storeStrong(&v17, 0);
  v7 = v16;
  objc_sync_enter(v7);
  SEL v5 = [(ManagedAppManager *)v16 managedApps];
  unsigned __int8 v6 = [(NSArray *)v5 containsObject:location[0]];

  objc_sync_exit(v7);
  objc_storeStrong(v14, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)updateManagedApps:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = sub_10001120C();
  char v14 = 1;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
  {
    log = v15;
    os_log_type_t type = v14;
    sub_100003CE0(v13);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Updating Managed App list", v13, 2u);
  }
  objc_storeStrong(&v15, 0);
  id v12 = sub_10001120C();
  os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
  {
    v7 = [(ManagedAppManager *)v17 managedApps];
    sub_100007FF4((uint64_t)v19, (uint64_t)v7);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v12, v11, "Old Managed App list: %{private}@", v19, 0xCu);
  }
  objc_storeStrong(&v12, 0);
  obj = v17;
  objc_sync_enter(obj);
  id v5 = [sub_100016470() sharedConnection];
  id v4 = [v5 managedAppBundleIDs];
  -[ManagedAppManager setManagedApps:](v17, "setManagedApps:");

  objc_sync_exit(obj);
  id v10 = sub_10001120C();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
  {
    objc_super v3 = [(ManagedAppManager *)v17 managedApps];
    sub_100007FF4((uint64_t)v18, (uint64_t)v3);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEBUG, "New Managed App list: %{private}@", v18, 0xCu);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)listenForChanges
{
  v7 = self;
  v6[1] = (id)a2;
  v6[0] = sub_100016668();
  id v5 = +[NSNotificationCenter defaultCenter];
  v2 = v7;
  id v3 = v6[0];
  id v4 = [sub_100016470() sharedConnection];
  -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", v2, "updateManagedApps:", v3);

  objc_storeStrong(v6, 0);
}

- (NSArray)managedApps
{
  return self->managedApps;
}

- (void)setManagedApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end