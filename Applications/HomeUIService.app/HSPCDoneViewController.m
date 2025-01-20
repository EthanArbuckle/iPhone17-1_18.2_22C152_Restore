@interface HSPCDoneViewController
+ (id)viewControllerForCoordinator:(id)a3 config:(id)a4;
- (BOOL)shouldShowButtonLinkToHomeApp;
- (HSPCDoneViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (id)launchAdditionalSettings;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCDoneViewController

+ (id)viewControllerForCoordinator:(id)a3 config:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v5 isSetupInitiatedByOtherMatterEcosystem]) {
    v7 = (objc_class *)HSPCMatterAccessoryDoneViewController;
  }
  else {
    v7 = (objc_class *)objc_opt_class();
  }
  id v8 = [[v7 alloc] initWithCoordinator:v6 config:v5];

  return v8;
}

- (HSPCDoneViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc((Class)HUHomeAccessoryTileView);
  v10 = [v8 addedAccessoryItem];
  id v11 = [v9 initWithFrame:v10 item:1 iconOnlyTile:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

  v43.receiver = self;
  v43.super_class = (Class)HSPCDoneViewController;
  v12 = [(HSPCFixedSizeCenterContentViewController *)&v43 initWithCenterContentView:v11];
  v13 = v12;
  if (v12)
  {
    id v39 = v8;
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    v14 = [v7 activeTuple];
    id v15 = [v7 numberOfAccessoriesInSameCategory];
    v38 = v14;
    v16 = [v14 accessoryCategoryOrPrimaryServiceType];
    v17 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    v18 = [(HSPCDoneViewController *)v13 config];
    v19 = [v18 home];
    v20 = [v19 name];
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v15, v20);
    [(HSPCDoneViewController *)v13 setTitle:v21];

    v22 = [(HSPCDoneViewController *)v13 coordinator];
    v23 = [v22 topAccessoryTuple];
    v24 = [v23 accessory];

    v25 = [(HSPCDoneViewController *)v13 config];
    v26 = [v25 home];

    v27 = [v26 hf_walletKeyAccessories];
    if ([v27 containsObject:v24])
    {
      v28 = [v26 hf_hasWalletKey];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1000228AC;
      v40[3] = &unk_1000A9B78;
      v41 = v13;
      id v42 = v24;
      id v29 = [v28 addSuccessBlock:v40];

      v30 = v41;
    }
    else
    {
      v30 = HFLogForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v47 = v13;
        __int16 v48 = 2080;
        v49 = "-[HSPCDoneViewController initWithCoordinator:config:]";
        __int16 v50 = 2112;
        v51 = v27;
        __int16 v52 = 2112;
        v53 = v24;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding subtitle. walletKeyAccessories: %@, addedAccessory: %@", buf, 0x2Au);
      }
    }

    if ([v7 requiresDismissalConfirmation])
    {
      id v31 = [(HSPCDoneViewController *)v13 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v13 futureSelector:"commitConfiguration"];
    }
    else
    {
      if ([v7 launchReason] == (id)1)
      {
        v45[0] = &off_1000B0148;
        v44[0] = HFAnalyticsResumeSetupSelectedOptionKey;
        v44[1] = HFAnalyticsDataAccessoryCategoryTypeKey;
        v32 = [v24 category];
        v33 = [v32 categoryType];
        v45[1] = v33;
        v34 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];

        +[HFAnalytics sendEvent:29 withData:v34];
      }
      id v35 = [(HSPCDoneViewController *)v13 addProminentDismissButtonWithTitleKey:@"HUDoneTitle"];
      if ([(HSPCDoneViewController *)v13 shouldShowButtonLinkToHomeApp]) {
        id v36 = [(HSPCDoneViewController *)v13 addOptionalButtonWithTitleKey:@"HUProximityCardSetupAccessoryDoneVCAdditionalSettingsButton" target:v13 futureSelector:"launchAdditionalSettings"];
      }
    }

    id v8 = v39;
  }

  return v13;
}

- (id)commitConfiguration
{
  v2 = [(HSPCDoneViewController *)self coordinator];
  uint64_t v3 = [v2 requiresDismissalConfirmation] ^ 1;

  v4 = +[NSNumber numberWithUnsignedInteger:v3];
  id v5 = +[NAFuture futureWithResult:v4];

  return v5;
}

- (id)launchAdditionalSettings
{
  uint64_t v3 = [(HSPCDoneViewController *)self coordinator];
  v4 = [v3 topAccessoryTuple];
  id v5 = [v4 accessory];

  id v6 = [(HSPCDoneViewController *)self config];
  id v7 = [v6 home];

  id v8 = +[HFSetupPairingControllerUtilities urlComponentHomeSettingsForAccessory:v5 forHome:v7];
  id v9 = [(HSPCDoneViewController *)self commitConfiguration];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100022B94;
  v13[3] = &unk_1000A8D98;
  id v14 = v8;
  id v10 = v8;
  id v11 = [v9 addCompletionBlock:v13];

  return v9;
}

- (BOOL)shouldShowButtonLinkToHomeApp
{
  uint64_t v3 = +[HFHomeAppInstallController sharedInstance];
  id v4 = [v3 status];

  if (v4) {
    return 0;
  }
  id v6 = [(HSPCDoneViewController *)self coordinator];
  id v7 = [v6 launchReason];

  if (v7 == (id)1)
  {
    id v8 = [(HSPCDoneViewController *)self coordinator];
    id v9 = [v8 allAccessories];
    unsigned __int8 v5 = [v9 count] == (id)1;
  }
  else
  {
    id v8 = +[HSAccessoryPairingEventLogger sharedLogger];
    unsigned __int8 v5 = [v8 isHUISLaunchedByFirstParty];
  }

  return v5;
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