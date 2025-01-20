@interface BuddyAppleIDConfigurationManager
+ (id)sharedManager;
- (BOOL)isServiceEnabled;
- (BuddyAppleIDConfigurationManager)init;
- (id)URLConfiguration;
- (void)getURLConfigurationWithHandler:(id)a3;
@end

@implementation BuddyAppleIDConfigurationManager

+ (id)sharedManager
{
  v5 = (dispatch_once_t *)&unk_100321C60;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B2CD8);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321C58;

  return v2;
}

- (BuddyAppleIDConfigurationManager)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyAppleIDConfigurationManager;
  id location = [(BuddyAppleIDConfigurationManager *)&v6 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.purplebuddy.urlconfigurationqueue", 0);
    v3 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v2;

    *((unsigned char *)location + 24) = 1;
  }
  v4 = (BuddyAppleIDConfigurationManager *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (void)getURLConfigurationWithHandler:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(21, 0);
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_1000EE340;
  v8 = &unk_1002B0CD0;
  v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)URLConfiguration
{
  v17[2] = self;
  v17[1] = (id)a2;
  uint64_t v11 = 0;
  v12 = &v11;
  int v13 = 838860800;
  int v14 = 48;
  v15 = sub_1000EE5D4;
  v16 = sub_1000EE618;
  v17[0] = 0;
  urlConfigurationQueue = self->_urlConfigurationQueue;
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_1000EE624;
  v9 = &unk_1002B29C8;
  v10[0] = self;
  v10[1] = &v11;
  dispatch_sync(urlConfigurationQueue, &v5);
  id v3 = (id)v12[5];
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(v17, 0);

  return v3;
}

- (BOOL)isServiceEnabled
{
  return self->_serviceEnabled;
}

- (void).cxx_destruct
{
}

@end