@interface HSPCPersonalRequestsViewController
- (HSPCPersonalRequestsViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)_bulletImageWithSystemName:(id)a3 color:(id)a4;
- (id)_enablePersonalRequests;
- (id)commitConfiguration;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCPersonalRequestsViewController

- (HSPCPersonalRequestsViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)UITableView);
  [v8 setSeparatorStyle:0];
  id v9 = [objc_alloc((Class)PRXScrollableContentView) initWithCardStyle:0 scrollView:v8];
  v62.receiver = self;
  v62.super_class = (Class)HSPCPersonalRequestsViewController;
  v10 = [(HSPCPersonalRequestsViewController *)&v62 initWithContentView:v9];
  v11 = v10;
  if (v10)
  {
    [(HSPCPersonalRequestsViewController *)v10 setConfig:v7];
    [(HSPCPersonalRequestsViewController *)v11 setCoordinator:v6];
    v12 = [(HSPCPersonalRequestsViewController *)v11 config];
    v13 = [v12 delegate];
    v14 = [(HSPCPersonalRequestsViewController *)v11 config];
    id v15 = [v13 stateMachineConfigurationGetLaunchReason:v14];

    v16 = [v7 home];
    if (objc_msgSend(v16, "hf_atleastOneMediaAccessorySupportingJustSiri"))
    {
      v17 = [v7 home];
      if ([v17 siriPhraseOptions] == (id)2)
      {
        BOOL v61 = 1;
      }
      else
      {
        v18 = [v7 home];
        BOOL v61 = [v18 siriPhraseOptions] == (id)3;
      }
    }
    else
    {
      BOOL v61 = 0;
    }

    v19 = HULocalizedString();
    [(HSPCPersonalRequestsViewController *)v11 setTitle:v19];

    v20 = HULocalizedString();
    id v21 = [(HSPCPersonalRequestsViewController *)v11 addProminentButtonWithLocalizedTitle:v20 target:v11 futureSelector:"_enablePersonalRequests"];

    v22 = HULocalizedString();
    id v23 = [(HSPCPersonalRequestsViewController *)v11 addOptionalButtonWithLocalizedTitle:v22 target:v11 futureSelector:"commitConfiguration"];

    id v59 = v8;
    if (v15 == (id)3
      && ([(HSPCPersonalRequestsViewController *)v11 config],
          v24 = objc_claimAutoreleasedReturnValue(),
          [v24 siriEnabledAccessories],
          v25 = objc_claimAutoreleasedReturnValue(),
          id v26 = [v25 count],
          v25,
          v24,
          (unint64_t)v26 >= 2))
    {
      uint64_t v27 = HULocalizedString();
    }
    else
    {
      v28 = [v7 addedAccessory];
      v57 = [v28 hf_userFriendlyLocalizedLowercaseDescription];
      uint64_t v27 = HULocalizedStringWithFormat();
    }
    -[HSPCPersonalRequestsViewController setSubtitle:](v11, "setSubtitle:", v27, v57);
    v29 = HULocalizedString();
    [(HSPCPersonalRequestsViewController *)v11 setBottomTrayTitle:v29];

    v30 = HUSiriLocalizedString();
    v31 = +[UIColor systemRedColor];
    v32 = [(HSPCPersonalRequestsViewController *)v11 _bulletImageWithSystemName:@"calendar" color:v31];
    v33 = +[UIColor systemRedColor];
    v34 = +[PRXFeature featureWithTitle:v30 detailText:&stru_1000ABBA8 icon:v32 tintColor:v33];
    id v35 = [(HSPCPersonalRequestsViewController *)v11 addFeature:v34];

    v36 = HUSiriLocalizedString();
    id v60 = v6;
    v58 = (void *)v27;
    if (v61)
    {
      uint64_t v37 = HUSiriLocalizedString();

      v36 = (void *)v37;
    }
    v38 = +[UIColor systemGreenColor];
    v39 = [(HSPCPersonalRequestsViewController *)v11 _bulletImageWithSystemName:@"message.fill" color:v38];
    v40 = +[UIColor systemGreenColor];
    v41 = +[PRXFeature featureWithTitle:v36 detailText:&stru_1000ABBA8 icon:v39 tintColor:v40];
    id v42 = [(HSPCPersonalRequestsViewController *)v11 addFeature:v41];

    v43 = HUSiriLocalizedString();
    v44 = +[UIColor systemYellowColor];
    v45 = [(HSPCPersonalRequestsViewController *)v11 _bulletImageWithSystemName:@"list.bullet" color:v44];
    v46 = +[UIColor systemYellowColor];
    v47 = +[PRXFeature featureWithTitle:v43 detailText:&stru_1000ABBA8 icon:v45 tintColor:v46];
    id v48 = [(HSPCPersonalRequestsViewController *)v11 addFeature:v47];

    v49 = HUSiriLocalizedString();
    if (v61)
    {
      uint64_t v50 = HUSiriLocalizedString();

      v49 = (void *)v50;
    }
    v51 = +[UIColor systemIndigoColor];
    v52 = [(HSPCPersonalRequestsViewController *)v11 _bulletImageWithSystemName:@"heart.text.square.fill" color:v51];
    v53 = +[UIColor systemIndigoColor];
    v54 = +[PRXFeature featureWithTitle:v49 detailText:&stru_1000ABBA8 icon:v52 tintColor:v53];
    id v55 = [(HSPCPersonalRequestsViewController *)v11 addFeature:v54];

    id v8 = v59;
    id v6 = v60;
  }

  return v11;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0388];
}

- (id)_bulletImageWithSystemName:(id)a3 color:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[UIColor systemWhiteColor];
  id v8 = +[UIImageSymbolConfiguration configurationWithPointSize:22.0];
  id v9 = +[UIImage hu_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:](UIImage, "hu_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:", v6, v5, v7, v8, 40.0, 40.0, 10.0);

  return v9;
}

- (id)_enablePersonalRequests
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enabling personal requests", buf, 2u);
  }

  v4 = [(HSPCPersonalRequestsViewController *)self config];
  id v5 = [v4 home];

  id v6 = [v5 currentUser];
  id v7 = [v6 assistantAccessControlForHome:v5];
  id v8 = [v7 mutableCopy];
  id v9 = [v8 accessories];
  v10 = +[NSMutableArray arrayWithArray:v9];

  v11 = [(HSPCPersonalRequestsViewController *)self config];
  v12 = [v11 delegate];
  v13 = [(HSPCPersonalRequestsViewController *)self config];
  id v14 = [v12 stateMachineConfigurationGetLaunchReason:v13];

  if (v14 == (id)3
    && ([(HSPCPersonalRequestsViewController *)self config],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v15 siriEnabledAccessories],
        v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    v17 = [(HSPCPersonalRequestsViewController *)self config];
    v18 = [v17 siriEnabledAccessories];
    [v10 na_safeAddObjectsFromArray:v18];
  }
  else
  {
    v17 = [(HSPCPersonalRequestsViewController *)self config];
    v18 = [v17 addedAccessory];
    [v10 na_safeAddObject:v18];
  }

  [v8 setAccessories:v10];
  v19 = HFLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Personal requests will be enabled for accessories: %@, ", buf, 0xCu);
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100037E4C;
  v28[3] = &unk_1000A9F60;
  id v29 = v6;
  id v30 = v8;
  id v31 = v5;
  id v20 = v5;
  id v21 = v8;
  id v22 = v6;
  id v23 = +[NAFuture futureWithBlock:v28];
  v32[0] = v23;
  v24 = [(HSPCPersonalRequestsViewController *)self commitConfiguration];
  v32[1] = v24;
  v25 = +[NSArray arrayWithObjects:v32 count:2];
  id v26 = +[NAFuture chainFutures:v25];

  return v26;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
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