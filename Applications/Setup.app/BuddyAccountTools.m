@interface BuddyAccountTools
+ (id)sharedBuddyAccountTools;
- (BuddyAccountTools)init;
- (id)accountOperationsQueue;
- (id)accounts;
- (id)activeiTunesAccount;
- (id)configurationInfoError:(id *)a3;
- (id)iCloudAnalyticsOptInError:(id *)a3;
- (id)primaryAccount;
- (void)_fetchUserInformation:(id)a3;
- (void)addAccountHeadersToRequest:(id)a3;
- (void)getConfigurationInfoWithCompletion:(id)a3;
- (void)primaryAccountIsChildAccount:(id)a3;
- (void)removeAccount:(id)a3 completion:(id)a4;
- (void)removeAccountsCreatedByProximityWithCompletion:(id)a3;
- (void)removeIDMSAccount:(id)a3;
- (void)removePrimaryAccountCompletion:(id)a3;
- (void)waitUntilSafeToSignInWithCompletion:(id)a3;
@end

@implementation BuddyAccountTools

+ (id)sharedBuddyAccountTools
{
  if (!qword_100321E78)
  {
    v2 = objc_alloc_init(BuddyAccountTools);
    v3 = (void *)qword_100321E78;
    qword_100321E78 = (uint64_t)v2;
  }
  v4 = (void *)qword_100321E78;

  return v4;
}

- (BuddyAccountTools)init
{
  SEL v11 = a2;
  id location = 0;
  v10.receiver = self;
  v10.super_class = (Class)BuddyAccountTools;
  id location = [(BuddyAccountTools *)&v10 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = objc_alloc_init((Class)NSMutableArray);
    v3 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v2;

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.purplebuddy.user_information", 0);
    v5 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.purplebuddy.configuration_info", 0);
    v7 = (void *)*((void *)location + 5);
    *((void *)location + 5) = v6;
  }
  v8 = (BuddyAccountTools *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (id)accountOperationsQueue
{
  if (!self->_accountOperationsQueue)
  {
    id v2 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.purplebuddy.account_operation", 0);
    accountOperationsQueue = self->_accountOperationsQueue;
    self->_accountOperationsQueue = v2;
  }
  dispatch_queue_t v4 = self->_accountOperationsQueue;

  return v4;
}

- (void)waitUntilSafeToSignInWithCompletion:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyAccountTools *)v5 accountOperationsQueue];
  dispatch_async(v3, location[0]);

  objc_storeStrong(location, 0);
}

- (void)removeAccount:(id)a3 completion:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Remove Account: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (location[0])
  {
    [(NSMutableArray *)v18->_accountsBeingRemoved addObject:location[0]];
    v5 = [(BuddyAccountTools *)v18 accountOperationsQueue];
    block = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    v9 = sub_1001B08C4;
    objc_super v10 = &unk_1002B1758;
    SEL v11 = v18;
    id v12 = location[0];
    id v13 = v16;
    dispatch_async(v5, &block);

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  else if (v16)
  {
    (*((void (**)(id, uint64_t, void))v16 + 2))(v16, 1, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)removeIDMSAccount:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyAccountTools *)v15 accounts];
  dispatch_queue_t v4 = +[NSPredicate predicateWithBlock:&stru_1002B4638];
  id v5 = [v3 filteredArrayUsingPredicate:v4];
  id v13 = [v5 firstObject];

  dispatch_queue_t v6 = v15;
  int v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  objc_super v10 = sub_1001B107C;
  SEL v11 = &unk_1002B0C80;
  id v12 = location[0];
  [(BuddyAccountTools *)v6 removeAccount:v13 completion:&v7];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)removePrimaryAccountCompletion:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v13;
  id v4 = +[ACAccountStore defaultStore];
  id v5 = [v4 aa_primaryAppleAccount];
  dispatch_queue_t v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_1001B1288;
  objc_super v10 = &unk_1002B0C80;
  id v11 = location[0];
  [(BuddyAccountTools *)v3 removeAccount:v5 completion:&v6];

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)removeAccountsCreatedByProximityWithCompletion:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v13);
  id v3 = v13;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_1001B14D8;
  int v8 = &unk_1002B4660;
  id v9 = location[0];
  objc_copyWeak(&v10, &from);
  [(BuddyAccountTools *)v3 removePrimaryAccountCompletion:&v4];
  objc_destroyWeak(&v10);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (id)primaryAccount
{
  v19 = self;
  location[1] = (id)a2;
  id v2 = +[ACAccountStore defaultStore];
  location[0] = [v2 aa_primaryAppleAccount];

  id v17 = 0;
  accountsBeingRemoved = v19->_accountsBeingRemoved;
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  os_log_type_t v14 = sub_1001B1740;
  v15 = &unk_1002B4688;
  id v16 = location[0];
  id v17 = [(NSMutableArray *)accountsBeingRemoved indexOfObjectPassingTest:&v11];
  if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v20 = location[0];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = oslog;
      os_log_type_t v5 = v9;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Primary account is being removed", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v20 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  int v6 = v20;

  return v6;
}

- (id)activeiTunesAccount
{
  id location[2] = self;
  location[1] = (id)a2;
  id v2 = [(BuddyAccountTools *)self accounts];
  id v3 = +[NSPredicate predicateWithBlock:&stru_1002B46A8];
  location[0] = [v2 filteredArrayUsingPredicate:v3];

  id v4 = [location[0] firstObject];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)accounts
{
  v21 = self;
  location[1] = (id)a2;
  if ([(NSMutableArray *)self->_accountsBeingRemoved count])
  {
    id v2 = +[ACAccountStore defaultStore];
    id v3 = [v2 accounts];
    location[0] = [v3 mutableCopy];

    [location[0] removeObjectsInArray:v21->_accountsBeingRemoved];
    id v22 = location[0];
    objc_storeStrong(location, 0);
  }
  else
  {
    uint64_t v13 = 0;
    os_log_type_t v14 = &v13;
    int v15 = 838860800;
    int v16 = 48;
    id v17 = sub_1001B1BB8;
    v18 = sub_1001B1BFC;
    id v19 = 0;
    id v4 = [(BuddyAccountTools *)v21 accountOperationsQueue];
    block = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = sub_1001B1C08;
    id v11 = &unk_1002B1248;
    int v12 = &v13;
    dispatch_sync(v4, &block);

    id v22 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
    objc_storeStrong(&v19, 0);
  }
  os_log_type_t v5 = v22;

  return v5;
}

- (void)addAccountHeadersToRequest:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  id v4 = sub_100147CA8();
  [v3 setValue:v4 forHTTPHeaderField:@"User-Agent"];

  id v5 = location[0];
  id v6 = +[AADeviceInfo clientInfoHeader];
  [v5 setValue:v6 forHTTPHeaderField:@"X-MMe-Client-Info"];

  id v7 = location[0];
  int v8 = +[NSLocale currentLocale];
  id v9 = [(NSLocale *)v8 objectForKey:NSLocaleCountryCode];
  id v10 = [v9 uppercaseString];
  [v7 setValue:v10 forHTTPHeaderField:@"X-MMe-Country"];

  id v15 = (id)_CFNetworkCopyPreferredLanguageCode();
  id v12 = v15;
  if (v12)
  {
    if ([v12 hasPrefix:@"es-"])
    {
      id v14 = (id)CFPreferencesCopyAppValue(@"AppleLocale", kCFPreferencesAnyApplication);
      id v11 = v14;
      if ([@"es_MX" isEqual:v11]) {
        objc_storeStrong(&v12, @"es-mx");
      }
      objc_storeStrong(&v11, 0);
    }
  }
  else
  {
    objc_storeStrong(&v12, @"en-us");
  }
  [location[0] setValue:v12 forHTTPHeaderField:@"Accept-Language"];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)primaryAccountIsChildAccount:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v11;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1001B1F5C;
  int v8 = &unk_1002B46D0;
  id v9 = location[0];
  [(BuddyAccountTools *)v3 _fetchUserInformation:&v4];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)configurationInfoError:(id *)a3
{
  v33 = self;
  SEL v32 = a2;
  v31 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  int v26 = 838860800;
  int v27 = 48;
  v28 = sub_1001B1BB8;
  v29 = sub_1001B1BFC;
  id v30 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  v21 = sub_1001B1BB8;
  id v22 = sub_1001B1BFC;
  id v23 = 0;
  id v3 = +[ACAccountStore defaultStore];
  id v16 = [v3 aa_primaryAppleAccount];

  id location = [v16 aa_altDSID];
  if (v16)
  {
    configurationInfoQueue = v33->_configurationInfoQueue;
    block = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = sub_1001B2440;
    id v12 = &unk_1002B4720;
    uint64_t v13 = v33;
    v14[0] = location;
    v14[1] = &v17;
    v14[2] = &v24;
    dispatch_sync(configurationInfoQueue, &block);
    objc_storeStrong(v14, 0);
    objc_storeStrong((id *)&v13, 0);
  }
  if (v18[5] && v31)
  {
    id v5 = (id) v18[5];
    id *v31 = v5;
  }
  id v6 = (id)v25[5];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);

  return v6;
}

- (void)getConfigurationInfoWithCompletion:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1001B2B08;
  int v8 = &unk_1002B0CD0;
  int v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)iCloudAnalyticsOptInError:(id *)a3
{
  int v20 = self;
  SEL v19 = a2;
  v18 = a3;
  id v17 = 0;
  id location = 0;
  id obj = 0;
  id v3 = [(BuddyAccountTools *)self configurationInfoError:&obj];
  objc_storeStrong(&location, obj);
  id v15 = v3;
  if (!location)
  {
    id v13 = [v15 objectForKeyedSubscript:@"com.apple.idms.config.privacy.icloud.data"];
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Express Setup: iCloudAnalyticsOptIn = %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v13)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      char v5 = 1;
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        char v5 = objc_opt_isKindOfClass();
      }
      if (v5)
      {
        int v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 integerValue]);
        id v7 = v17;
        id v17 = v6;
      }
      else
      {
        int v8 = +[NSError errorWithDomain:@"com.apple.purplebuddy.accounterror" code:1 userInfo:0];
        id v7 = location;
        id location = v8;
      }
    }
    objc_storeStrong(&v13, 0);
  }
  if (v18)
  {
    id v9 = location;
    id *v18 = v9;
  }
  id v10 = v17;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

- (void)_fetchUserInformation:(id)a3
{
  int v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v19 = 0;
  int v20 = &v19;
  int v21 = 838860800;
  int v22 = 48;
  id v23 = sub_1001B1BB8;
  uint64_t v24 = sub_1001B1BFC;
  id v25 = 0;
  userInformationQueue = v27->_userInformationQueue;
  block = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = sub_1001B3190;
  id v17 = &unk_1002B1D70;
  v18[1] = &v19;
  v18[0] = v27;
  dispatch_sync(userInformationQueue, &block);
  if (v20[5])
  {
    if (location[0]) {
      (*((void (**)(id, uint64_t, uint64_t, void))location[0] + 2))(location[0], 1, v20[5], 0);
    }
    int v12 = 1;
  }
  else
  {
    id v4 = +[ACAccountStore defaultStore];
    char v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    int v8 = sub_1001B31CC;
    id v9 = &unk_1002B4770;
    id v11 = location[0];
    id v10 = v27;
    [v4 aa_primaryAppleAccountWithCompletion:&v5];

    objc_storeStrong((id *)&v10, 0);
    objc_storeStrong(&v11, 0);
    int v12 = 0;
  }
  objc_storeStrong(v18, 0);
  _Block_object_dispose(&v19, 8);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end