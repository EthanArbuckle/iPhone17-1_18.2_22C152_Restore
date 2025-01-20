@interface HSPCSafetyAndSecurityViewController
- (HSPCSafetyAndSecurityViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)_enableSafetyAndSecuritySettings;
- (id)commitConfiguration;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCSafetyAndSecurityViewController

- (HSPCSafetyAndSecurityViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc((Class)UIImageView);
  v10 = +[UIImage hf_safetyAndSecurityImage];
  id v11 = [v9 initWithImage:v10];

  [v11 setContentMode:2];
  v22.receiver = self;
  v22.super_class = (Class)HSPCSafetyAndSecurityViewController;
  v12 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v22, "initWithCenterContentView:size:", v11, 75.0, 75.0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    v14 = HULocalizedString();
    [(HSPCSafetyAndSecurityViewController *)v13 setTitle:v14];

    v15 = HULocalizedString();
    id v16 = [(HSPCSafetyAndSecurityViewController *)v13 addProminentButtonWithLocalizedTitle:v15 target:v13 futureSelector:"_enableSafetyAndSecuritySettings"];

    v17 = HULocalizedString();
    id v18 = [(HSPCSafetyAndSecurityViewController *)v13 addOptionalButtonWithLocalizedTitle:v17 target:v13 futureSelector:"commitConfiguration"];

    v19 = HULocalizedString();
    [(HSPCSafetyAndSecurityViewController *)v13 setSubtitle:v19];

    v20 = HULocalizedString();
    [(HSPCSafetyAndSecurityViewController *)v13 setBottomTrayTitle:v20];
  }
  return v13;
}

- (id)_enableSafetyAndSecuritySettings
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100057010;
  v29[3] = &unk_1000A96F8;
  v29[4] = self;
  v21 = +[NAFuture futureWithBlock:v29];
  [v3 na_safeAddObject:];
  v4 = [(HSPCSafetyAndSecurityViewController *)self config];
  v5 = [v4 home];
  v6 = [v5 hf_allUsersIncludingCurrentUser];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v12 = [(HSPCSafetyAndSecurityViewController *)self config];
        v13 = [v12 home];
        v14 = [v13 homeAccessControlForUser:v11];

        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000571F4;
        v23[3] = &unk_1000A96F8;
        id v24 = v14;
        id v15 = v14;
        id v16 = +[NAFuture futureWithBlock:v23];
        [v3 na_safeAddObject:v16];
      }
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  v17 = [(HSPCSafetyAndSecurityViewController *)self commitConfiguration];
  [v3 addObject:v17];

  id v18 = [v3 copy];
  v19 = +[NAFuture chainFutures:v18];

  return v19;
}

- (id)commitConfiguration
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will set local key for userHasDismissedAudioAnalysisOnboardingOnThisDevice...", buf, 2u);
  }

  id v5 = objc_alloc((Class)HFUserItem);
  v6 = [(HSPCSafetyAndSecurityViewController *)self config];
  id v7 = [v6 home];
  id v8 = [(HSPCSafetyAndSecurityViewController *)self config];
  uint64_t v9 = [v8 home];
  v10 = [v9 currentUser];
  id v11 = [v5 initWithHome:v7 user:v10 nameStyle:0];

  id v12 = [v11 setDismissedAudioAnalysisOnboardingOnThisDevice:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100057558;
  v18[3] = &unk_1000A96F8;
  v18[4] = self;
  v13 = +[NAFuture futureWithBlock:v18];
  [v3 addObject:v13];
  v14 = +[NAFuture futureWithResult:&off_1000B0B20];
  [v3 addObject:v14];

  id v15 = [v3 copy];
  id v16 = +[NAFuture chainFutures:v15];

  return v16;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end