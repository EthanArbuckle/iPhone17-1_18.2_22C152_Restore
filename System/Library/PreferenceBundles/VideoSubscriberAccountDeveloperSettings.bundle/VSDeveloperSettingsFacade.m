@interface VSDeveloperSettingsFacade
+ (id)keyPathsForValuesAffectingSetTopBoxUseDeviceProfileHash;
+ (id)sharedFacade;
- (BOOL)hasRealSetTopBoxProfile;
- (NSArray)providers;
- (NSOperationQueue)privateQueue;
- (NSString)isSetTopBoxEnabledStatus;
- (NSString)setTopBoxProviderDisplayName;
- (NSString)setTopBoxSupportsOptOutStatus;
- (NSString)setTopBoxUseDeviceProfileStatus;
- (VSDeveloperSettings)settings;
- (VSDeveloperSettingsFacade)init;
- (VSRemoteNotifier)providersChangeRemoteNotifier;
- (VSRemoteNotifier)settingsChangeRemoteNotifier;
- (VSRemoteNotifier)stbChangeRemoteNotifier;
- (id)alertMessageForProxyDetection;
- (id)alertTitleForProxyDetection;
- (id)buildSystemTrustTestAlertMessageWithStatusMessage:(id)a3 andTrustInfo:(id)a4;
- (id)dismissTitleForProxyDetection;
- (unint64_t)setTopBoxUseDeviceProfileHash;
- (void)_updateLabels;
- (void)enqueueChange:(int64_t)a3 withIdentityProvider:(id)a4 completionHandler:(id)a5;
- (void)fetchDeveloperSettingsWithCompletionHandler:(id)a3;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)setHasRealSetTopBoxProfile:(BOOL)a3;
- (void)setIsSetTopBoxEnabledStatus:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setProviders:(id)a3;
- (void)setProvidersChangeRemoteNotifier:(id)a3;
- (void)setSetTopBoxProviderDisplayName:(id)a3;
- (void)setSetTopBoxSupportsOptOutStatus:(id)a3;
- (void)setSetTopBoxUseDeviceProfileStatus:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSettingsChangeRemoteNotifier:(id)a3;
- (void)setStbChangeRemoteNotifier:(id)a3;
- (void)updateDeveloperSettings:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation VSDeveloperSettingsFacade

+ (id)sharedFacade
{
  if (qword_11720 != -1) {
    dispatch_once(&qword_11720, &stru_C350);
  }
  v2 = (void *)qword_11718;

  return v2;
}

- (VSDeveloperSettingsFacade)init
{
  v38.receiver = self;
  v38.super_class = (Class)VSDeveloperSettingsFacade;
  v2 = [(VSDeveloperSettingsFacade *)&v38 init];
  v3 = v2;
  if (v2)
  {
    providers = v2->_providers;
    v2->_providers = (NSArray *)&__NSArray0__struct;

    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    privateQueue = v3->_privateQueue;
    v3->_privateQueue = v5;

    [(NSOperationQueue *)v3->_privateQueue setName:@"VSDeveloperSettingsFacade"];
    id v7 = objc_alloc_init((Class)VSDeveloperIdentityProviderFetchAllOperation);
    id v8 = objc_alloc_init((Class)VSDeveloperSettingsFetchOperation);
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    v33 = sub_1888;
    v34 = &unk_C428;
    id v35 = v7;
    v36 = v3;
    id v37 = v8;
    id v9 = v8;
    id v10 = v7;
    v11 = VSMainThreadOperationWithBlock();
    [v11 addDependency:v10];
    [v11 addDependency:v9];
    v12 = [(VSDeveloperSettingsFacade *)v36 privateQueue];
    [v12 addOperation:v10];

    v13 = [(VSDeveloperSettingsFacade *)v36 privateQueue];
    [v13 addOperation:v9];

    VSEnqueueCompletionOperation();
    v14 = +[VSDevice currentDevice];
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_1B60;
    v29 = &unk_C450;
    v15 = v36;
    v30 = v15;
    [v14 fetchDeviceManagedSetTopBoxProfileWithCompletion:&v26];

    id v16 = objc_alloc((Class)VSRemoteNotifier);
    id v17 = objc_msgSend(v16, "initWithNotificationName:", VSDeveloperServiceProvidersDidChangeNotification, v26, v27, v28, v29);
    id v18 = v15[9];
    v15[9] = v17;

    id v19 = objc_alloc((Class)VSRemoteNotifier);
    id v20 = [v19 initWithNotificationName:VSDeveloperServiceSettingsDidChangeNotification];
    id v21 = v15[10];
    v15[10] = v20;

    id v22 = objc_alloc((Class)VSRemoteNotifier);
    id v23 = [v22 initWithNotificationName:VSSetTopBoxStateChangedNotification];
    id v24 = v15[11];
    v15[11] = v23;

    [v15[9] setDelegate:v15];
    [v15[10] setDelegate:v15];
    [v15[11] setDelegate:v15];
  }
  return v3;
}

- (void)enqueueChange:(int64_t)a3 withIdentityProvider:(id)a4 completionHandler:(id)a5
{
  int64_t v33 = a3;
  id v7 = a4;
  v34 = self;
  id v35 = a5;
  id v8 = [(VSDeveloperSettingsFacade *)self providers];
  id v9 = [v7 uniqueID];
  v36 = [v9 forceUnwrapObject];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v41;
    id obj = v10;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v16 = objc_msgSend(v15, "providerID", v33);
        id v17 = [v16 forceUnwrapObject];
        id v18 = v7;
        id v19 = [v7 providerID];
        id v20 = [v19 forceUnwrapObject];
        unsigned int v21 = [v17 isEqualToString:v20];

        if (v21)
        {
          id v22 = [v15 uniqueID];
          id v23 = [v22 forceUnwrapObject];
          unsigned int v24 = [v23 isEqual:v36];

          if (!v24)
          {
            id v10 = obj;

            v31 = +[NSBundle vs_frameworkBundle];
            id v27 = [v31 localizedStringForKey:@"DEVELOPER_PROVIDER_IDENTIFIER_COLLISION_ERROR_DESCRIPTION" value:0 table:0];

            NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
            id v45 = v27;
            v30 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
            uint64_t v32 = +[NSError errorWithDomain:@"DeveloperFacadeErrorDomain" code:0 userInfo:v30];
            v26 = v35;
            (*((void (**)(id, void *))v35 + 2))(v35, v32);

            goto LABEL_12;
          }
        }
        id v7 = v18;
      }
      id v10 = obj;
      id v12 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v25 = objc_alloc_init((Class)VSDeveloperIdentityProviderChangeOperation);
  [v25 setChangeKind:v33];
  [v25 setIdentityProvider:v7];
  v26 = v35;
  id v38 = v25;
  id v39 = v35;
  id v27 = v25;
  v28 = VSMainThreadOperationWithBlock();
  [v28 addDependency:v27];
  [(VSDeveloperSettingsFacade *)v34 privateQueue];
  v29 = id v18 = v7;
  [v29 addOperation:v27];
  VSEnqueueCompletionOperation();

  v30 = v38;
LABEL_12:
}

- (void)fetchDeveloperSettingsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v9 = objc_alloc_init((Class)VSDeveloperSettingsFetchOperation);
  id v10 = v4;
  id v5 = v4;
  id v6 = v9;
  id v7 = VSMainThreadOperationWithBlock();
  objc_msgSend(v7, "addDependency:", v6, _NSConcreteStackBlock, 3221225472, sub_2180, &unk_C4F0);
  id v8 = [(VSDeveloperSettingsFacade *)self privateQueue];
  [v8 addOperation:v6];

  VSEnqueueCompletionOperation();
}

- (void)updateDeveloperSettings:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)VSDeveloperSettingsUpdateOperation) initWithSettings:v7];

  uint64_t v13 = v8;
  v14 = v6;
  id v9 = v6;
  id v10 = v8;
  id v11 = VSMainThreadOperationWithBlock();
  objc_msgSend(v11, "addDependency:", v10, _NSConcreteStackBlock, 3221225472, sub_2304, &unk_C4F0);
  id v12 = [(VSDeveloperSettingsFacade *)self privateQueue];
  [v12 addOperation:v10];

  VSEnqueueCompletionOperation();
}

- (id)buildSystemTrustTestAlertMessageWithStatusMessage:(id)a3 andTrustInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSBundle vs_frameworkBundle];
  id v8 = [v7 localizedStringForKey:@"TEST_SYSTEM_TRUST_NO_SSL_RESPONSE_MESSAGE" value:0 table:0];

  if (v6)
  {
    uint64_t v9 = [v6 description];

    id v8 = (void *)v9;
  }
  id v10 = +[NSString stringWithFormat:@"%@\n\n%@", v5, v8];

  return v10;
}

- (id)alertTitleForProxyDetection
{
  v2 = +[NSBundle vs_frameworkBundle];
  v3 = [v2 localizedStringForKey:@"TEST_SYSTEM_TRUST_RESULT_ALERT_ERROR_TITLE" value:0 table:0];

  return v3;
}

- (id)alertMessageForProxyDetection
{
  v2 = +[NSBundle vs_frameworkBundle];
  v3 = [v2 localizedStringForKey:@"TEST_SYSTEM_TRUST_PROXY_DETECTED_ALERT_MESSAGE" value:0 table:0];

  return v3;
}

- (id)dismissTitleForProxyDetection
{
  v2 = +[NSBundle vs_frameworkBundle];
  v3 = [v2 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0];

  return v3;
}

- (void)_updateLabels
{
  v3 = [(VSDeveloperSettingsFacade *)self settings];
  id v4 = +[NSBundle vs_frameworkBundle];
  id v5 = [v4 localizedStringForKey:@"GENERIC_STATUS_ENABLED_LABEL" value:0 table:0];

  id v6 = +[NSBundle vs_frameworkBundle];
  id v7 = [v6 localizedStringForKey:@"GENERIC_STATUS_DISABLED_LABEL" value:0 table:0];

  id v8 = v7;
  id v9 = v8;
  if ([v3 isInSetTopBoxMode])
  {
    id v9 = v5;
  }
  v26 = v9;
  id v10 = v8;
  id v11 = v10;
  if ([v3 setTopBoxSupportsOptOut])
  {
    id v11 = v5;
  }
  unsigned int v24 = v11;
  id v25 = v10;
  id v27 = v5;
  v28 = v3;
  id v12 = [v3 setTopBoxIdentityProviderID];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v13 = [(VSDeveloperSettingsFacade *)self providers];
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v19 = [v18 uniqueID];
        id v20 = [v19 forceUnwrapObject];
        unsigned int v21 = [v20 isEqualToString:v12];

        if (v21)
        {
          id v22 = [v18 displayName];
          id v23 = [v22 forceUnwrapObject];
          [(VSDeveloperSettingsFacade *)self setSetTopBoxProviderDisplayName:v23];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  [(VSDeveloperSettingsFacade *)self setIsSetTopBoxEnabledStatus:v26];
  [(VSDeveloperSettingsFacade *)self setSetTopBoxSupportsOptOutStatus:v24];
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Did receive developer mode store did change notification.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v9 = [(VSDeveloperSettingsFacade *)self settingsChangeRemoteNotifier];

  if (v9 == v6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_2ABC;
    v17[3] = &unk_C560;
    objc_copyWeak(&v18, buf);
    v17[4] = self;
    [(VSDeveloperSettingsFacade *)self fetchDeveloperSettingsWithCompletionHandler:v17];
    objc_destroyWeak(&v18);
  }
  else
  {
    id v10 = [(VSDeveloperSettingsFacade *)self providersChangeRemoteNotifier];

    if (v10 == v6)
    {
      v15[5] = _NSConcreteStackBlock;
      v15[6] = 3221225472;
      v15[7] = sub_2C34;
      v15[8] = &unk_C5D0;
      id v12 = objc_alloc_init((Class)VSDeveloperIdentityProviderFetchAllOperation);
      v15[9] = v12;
      objc_copyWeak(&v16, buf);
      uint64_t v13 = VSMainThreadOperationWithBlock();
      [v13 addDependency:v12];
      id v14 = [(VSDeveloperSettingsFacade *)self privateQueue];
      [v14 addOperation:v12];

      VSEnqueueCompletionOperation();
      objc_destroyWeak(&v16);

      goto LABEL_9;
    }
    id v11 = [(VSDeveloperSettingsFacade *)self stbChangeRemoteNotifier];

    if (v11 == v6)
    {
      id v12 = +[VSDevice currentDevice];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_2DFC;
      v15[3] = &unk_C450;
      v15[4] = self;
      [v12 fetchDeviceManagedSetTopBoxProfileWithCompletion:v15];
LABEL_9:
    }
  }
  objc_destroyWeak(buf);
}

+ (id)keyPathsForValuesAffectingSetTopBoxUseDeviceProfileHash
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  [v2 addObject:@"hasRealSetTopBoxProfile"];
  [v2 addObject:@"settings"];

  return v2;
}

- (VSDeveloperSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (BOOL)hasRealSetTopBoxProfile
{
  return self->_hasRealSetTopBoxProfile;
}

- (void)setHasRealSetTopBoxProfile:(BOOL)a3
{
  self->_hasRealSetTopBoxProfile = a3;
}

- (NSString)isSetTopBoxEnabledStatus
{
  return self->_isSetTopBoxEnabledStatus;
}

- (void)setIsSetTopBoxEnabledStatus:(id)a3
{
}

- (unint64_t)setTopBoxUseDeviceProfileHash
{
  return self->_setTopBoxUseDeviceProfileHash;
}

- (NSString)setTopBoxUseDeviceProfileStatus
{
  return self->_setTopBoxUseDeviceProfileStatus;
}

- (void)setSetTopBoxUseDeviceProfileStatus:(id)a3
{
}

- (NSString)setTopBoxSupportsOptOutStatus
{
  return self->_setTopBoxSupportsOptOutStatus;
}

- (void)setSetTopBoxSupportsOptOutStatus:(id)a3
{
}

- (NSString)setTopBoxProviderDisplayName
{
  return self->_setTopBoxProviderDisplayName;
}

- (void)setSetTopBoxProviderDisplayName:(id)a3
{
}

- (NSArray)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (VSRemoteNotifier)providersChangeRemoteNotifier
{
  return self->_providersChangeRemoteNotifier;
}

- (void)setProvidersChangeRemoteNotifier:(id)a3
{
}

- (VSRemoteNotifier)settingsChangeRemoteNotifier
{
  return self->_settingsChangeRemoteNotifier;
}

- (void)setSettingsChangeRemoteNotifier:(id)a3
{
}

- (VSRemoteNotifier)stbChangeRemoteNotifier
{
  return self->_stbChangeRemoteNotifier;
}

- (void)setStbChangeRemoteNotifier:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_stbChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_settingsChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_providersChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_setTopBoxProviderDisplayName, 0);
  objc_storeStrong((id *)&self->_setTopBoxSupportsOptOutStatus, 0);
  objc_storeStrong((id *)&self->_setTopBoxUseDeviceProfileStatus, 0);
  objc_storeStrong((id *)&self->_isSetTopBoxEnabledStatus, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end