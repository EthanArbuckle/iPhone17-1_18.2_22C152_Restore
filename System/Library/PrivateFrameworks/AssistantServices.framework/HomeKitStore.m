@interface HomeKitStore
+ (id)sharedInstance;
+ (void)refreshCache;
- (HomeKitStore)init;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation HomeKitStore

- (void).cxx_destruct
{
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000056FC;
  block[3] = &unk_1000146E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_10001AA60, block);
}

- (HomeKitStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)HomeKitStore;
  v2 = [(HomeKitStore *)&v8 init];
  if (v2)
  {
    v3 = +[HMMutableHomeManagerConfiguration defaultPrivateConfiguration];
    [v3 setOptions:34397];
    [v3 setCachePolicy:3];
    v4 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[HomeKitStore init]";
      __int16 v11 = 2112;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Started initialization of homemanager with configuration %@", buf, 0x16u);
    }
    mach_absolute_time();
    v2->fetchStartTime = AFMachAbsoluteTimeGetMilliseconds();
    v5 = (HMHomeManager *)[objc_alloc((Class)HMHomeManager) initWithConfiguration:v3];
    homeManager = v2->homeManager;
    v2->homeManager = v5;

    [(HMHomeManager *)v2->homeManager setDelegate:v2];
  }
  return v2;
}

+ (void)refreshCache
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned int v3 = [v2 isSyncDisabledForFullUoDDevices];

  if (v3) {
    id v4 = +[HomeKitStore sharedInstance];
  }
}

+ (id)sharedInstance
{
  if (qword_10001AA68 != -1) {
    dispatch_once(&qword_10001AA68, &stru_100014468);
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100005AAC;
  v10 = sub_100005ABC;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005AC4;
  v5[3] = &unk_100014490;
  v5[4] = &v6;
  v5[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_10001AA60, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

@end