@interface HealthActivityCacheProfileExtension
- (HDActivityCacheManagerInterface)activityCacheInterface;
- (HDProfile)profile;
- (HealthActivityCacheProfileExtension)initWithProfile:(id)a3;
- (id)_activityCacheManager;
- (void)dealloc;
- (void)setProfile:(id)a3;
@end

@implementation HealthActivityCacheProfileExtension

- (HealthActivityCacheProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HealthActivityCacheProfileExtension;
  v5 = [(HealthActivityCacheProfileExtension *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = [(HealthActivityCacheProfileExtension *)v6 _activityCacheManager];
    activityCacheInterface = v6->_activityCacheInterface;
    v6->_activityCacheInterface = (HDActivityCacheManagerInterface *)v7;

    objc_initWeak(&location, v6);
    v9 = (const char *)HKStandalonePhoneFitnessModeDidUpdateNotification;
    id v10 = &_dispatch_main_q;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_21A78;
    v12[3] = &unk_34D18;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch(v9, &v6->_standalonePhoneFitnessModeChangeToken, (dispatch_queue_t)&_dispatch_main_q, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  int standalonePhoneFitnessModeChangeToken = self->_standalonePhoneFitnessModeChangeToken;
  if (standalonePhoneFitnessModeChangeToken != -1) {
    notify_cancel(standalonePhoneFitnessModeChangeToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)HealthActivityCacheProfileExtension;
  [(HealthActivityCacheProfileExtension *)&v4 dealloc];
}

- (id)_activityCacheManager
{
  v3 = +[_HKBehavior sharedBehavior];
  unsigned int v4 = [v3 isAppleWatch];

  v5 = +[_HKBehavior sharedBehavior];
  v6 = (char *)[v5 fitnessMode];

  if (v6 == (unsigned char *)&def_E6CC + 2) {
    int v7 = 1;
  }
  else {
    int v7 = v4;
  }
  _HKInitializeLogging();
  v8 = HKLogActivityCache;
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if (v4) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    if (v6 == (unsigned char *)&def_E6CC + 2) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    int v16 = 138412802;
    CFStringRef v17 = v10;
    __int16 v18 = 2112;
    CFStringRef v19 = v11;
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    __int16 v20 = 2112;
    CFStringRef v21 = v9;
    _os_log_impl(&def_E6CC, v8, OS_LOG_TYPE_DEFAULT, "isAppleWatch: %@, isStadalonePhone: %@, shouldCreateActivityCacheManager: %@", (uint8_t *)&v16, 0x20u);
  }
  if (v7)
  {
    v12 = [HDActivityCacheManager alloc];
    id v13 = [(HealthActivityCacheProfileExtension *)self profile];
    v14 = [(HDActivityCacheManager *)v12 initWithProfile:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (HDActivityCacheManagerInterface)activityCacheInterface
{
  return self->_activityCacheInterface;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_activityCacheInterface, 0);
}

@end