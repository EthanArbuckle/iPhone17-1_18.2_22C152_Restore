@interface UGCThirdPartyPhotoSharingPreferencesManager
+ (id)sharedManager;
- (BOOL)hasDeviceReadServerSettings;
- (UGCThirdPartyPhotoSharingPreferencesManager)init;
- (void)_setDefaultsKeyForPreferences:(id)a3;
- (void)_updateThirdPartyPhotoSharingPreferences:(BOOL)a3 versionID:(id)a4 eraseServerSavedSetting:(BOOL)a5 completion:(id)a6;
- (void)debugEraseServerSavedThirdPartyPhotoSharingPreference;
- (void)fetchThirdPartyPhotoSharingPreferencesWithCompletion:(id)a3;
- (void)updateThirdPartyPhotoSharingPreferences:(BOOL)a3 versionID:(id)a4 completion:(id)a5;
@end

@implementation UGCThirdPartyPhotoSharingPreferencesManager

+ (id)sharedManager
{
  if (qword_8E348 != -1) {
    dispatch_once(&qword_8E348, &stru_72DC0);
  }
  v2 = (void *)qword_8E340;

  return v2;
}

- (UGCThirdPartyPhotoSharingPreferencesManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)UGCThirdPartyPhotoSharingPreferencesManager;
  v2 = [(UGCThirdPartyPhotoSharingPreferencesManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Maps.UGCThirdPartyPhotoSharingPreferencesManagerQueue", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (BOOL)hasDeviceReadServerSettings
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"UGCThirdPartyPhotoSharingDeviceHasReadServerSetting"];

  return v3;
}

- (void)fetchThirdPartyPhotoSharingPreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_387B4;
  v7[3] = &unk_72E38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)updateThirdPartyPhotoSharingPreferences:(BOOL)a3 versionID:(id)a4 completion:(id)a5
{
}

- (void)debugEraseServerSavedThirdPartyPhotoSharingPreference
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_38D40;
  v3[3] = &unk_72A28;
  objc_copyWeak(&v4, &location);
  [(UGCThirdPartyPhotoSharingPreferencesManager *)self fetchThirdPartyPhotoSharingPreferencesWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_updateThirdPartyPhotoSharingPreferences:(BOOL)a3 versionID:(id)a4 eraseServerSavedSetting:(BOOL)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_38EA4;
  v15[3] = &unk_72EC8;
  BOOL v19 = a5;
  BOOL v20 = a3;
  id v16 = v10;
  v17 = self;
  id v18 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(workQueue, v15);
}

- (void)_setDefaultsKeyForPreferences:(id)a3
{
  id v3 = a3;
  id v4 = sub_38A24();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "Updating defaults with newest preferences", v7, 2u);
  }

  id v5 = [v3 hasOptIn];
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setBool:v5 forKey:@"UGCThirdPartyPhotoSharingDeviceHasReadServerSetting"];
}

- (void).cxx_destruct
{
}

@end