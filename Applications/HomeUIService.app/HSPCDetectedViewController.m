@interface HSPCDetectedViewController
+ (id)viewControllerForCoordinator:(id)a3 config:(id)a4;
- (BOOL)isFirstDetectedCard;
- (HSNetworkInterfaceManager)networkInterfaceManager;
- (HSPCDetectedViewController)initWithCenterContentView:(id)a3;
- (HSPCDetectedViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (NSString)prominentButtonLocalizedTitle;
- (id)commitConfiguration;
- (id)handleInstallationGuideURL;
- (id)iconDescriptor;
- (void)setNetworkInterfaceManager:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HSPCDetectedViewController

+ (id)viewControllerForCoordinator:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 activeTuple];
  v8 = [v7 accessoryCategoryOrPrimaryServiceType];
  unsigned int v9 = [v8 isEqualToString:HMAccessoryCategoryTypeWiFiRouter];

  if (v9)
  {
    v10 = [[HSPCRouterDetectedViewController alloc] initWithCoordinator:v5 config:v6];
  }
  else
  {
    v11 = [v6 setupDescription];
    v12 = [v11 setupAccessoryPayload];

    if ([v12 isPaired])
    {
      v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10006630C(v12, v13);
      }

      v14 = (objc_class *)HSPCDetectedPairedAccessoryViewController;
    }
    else
    {
      v14 = (objc_class *)objc_opt_class();
    }
    v10 = (HSPCRouterDetectedViewController *)[[v14 alloc] initWithCoordinator:v5 config:v6];
  }

  return v10;
}

- (HSPCDetectedViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v48.receiver = self;
  v48.super_class = (Class)HSPCDetectedViewController;
  v8 = [(HSPCCenterIconViewController *)&v48 initWithCoordinator:v6 config:v7];
  if (!v8) {
    goto LABEL_22;
  }
  unsigned int v9 = [v6 activeTuple];
  v10 = [v9 accessoryCategoryOrPrimaryServiceType];
  v11 = HFLocalizedCategoryOrPrimaryServiceTypeString();

  v12 = [v6 activeTuple];
  v13 = [v12 titleForAccessoryWithDefaultValue:v11];
  [(HSPCDetectedViewController *)v8 setTitle:v13];

  v14 = [v7 addedAccessory];
  v8->_firstDetectedCard = v14 == 0;

  v15 = [[HSNetworkInterfaceManager alloc] initWithAlertHostViewController:v8];
  networkInterfaceManager = v8->_networkInterfaceManager;
  v8->_networkInterfaceManager = v15;

  if (!v8->_firstDetectedCard) {
    goto LABEL_11;
  }
  if ([v6 isUsingCHIPCommunicationProtocol])
  {
    if ([v7 isSetupInitiatedByOtherMatterEcosystem])
    {
      v17 = [v6 matterDeviceSetupRequest];
      v18 = [v17 ecosystemName];
      v19 = HULocalizedStringWithFormat();
      -[HSPCDetectedViewController setBottomTrayTitle:](v8, "setBottomTrayTitle:", v19, v18);
    }
    else
    {
      v17 = HULocalizedString();
      [(HSPCDetectedViewController *)v8 setBottomTrayTitle:v17];
    }
  }
  if (!v8->_firstDetectedCard)
  {
LABEL_11:
    v24 = [v6 activeTuple];
    v27 = [v24 accessoryCategoryOrPrimaryServiceType];
    v28 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    [v6 topAccessoryTuple];
    id v29 = v7;
    v31 = v30 = v11;
    v32 = [v31 titleForAccessory];
    v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v32);
    [(HSPCDetectedViewController *)v8 setSubtitle:v33];

    v11 = v30;
    id v7 = v29;
    goto LABEL_12;
  }
  v20 = [(HSPCCenterIconViewController *)v8 config];
  unsigned int v21 = [v20 isSetupInitiatedByOtherMatterEcosystem];

  if (v21)
  {
    v22 = [(HSPCCenterIconViewController *)v8 coordinator];
    v23 = [v22 setupAccessoryDescription];
    v24 = [v23 hf_localizedLaunchingAppName];

    v25 = [(HSPCCenterIconViewController *)v8 coordinator];
    v26 = [v25 matterDeviceSetupRequest];
    v27 = [v26 ecosystemName];

    v28 = HULocalizedStringWithFormat();
    -[HSPCDetectedViewController setSubtitle:](v8, "setSubtitle:", v28, v24, v27);
LABEL_12:
  }
  v34 = [(HSPCDetectedViewController *)v8 prominentButtonLocalizedTitle];
  id v35 = [(HSPCDetectedViewController *)v8 addProminentButtonWithLocalizedTitle:v34 target:v8 futureSelector:"commitConfiguration"];

  if (v8->_firstDetectedCard)
  {
    v36 = [v7 setupDescription];
    v37 = [v36 hf_installationGuideURL];

    if (v37) {
      id v38 = [(HSPCDetectedViewController *)v8 addOptionalButtonWithTitleKey:@"HUProximityCardSetupAccessoryDetectedVCInstallationGuideTitle" target:v8 futureSelector:"handleInstallationGuideURL"];
    }
    if (v8->_firstDetectedCard)
    {
      v39 = [v7 setupDescription];
      v40 = [v39 setupAccessoryPayload];

      if (v40)
      {
        id v41 = objc_alloc((Class)HFSetupAccessoryResult);
        v42 = [v7 setupDescription];
        v43 = [v42 setupAccessoryPayload];
        id v44 = [v41 initWithPayload:v43 hasAddRequest:0];

        v45 = [v44 error];

        if (v45)
        {
          v46 = [v44 error];
          [v7 setPairingError:v46];
        }
      }
    }
  }

LABEL_22:
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = [(HSPCCenterIconViewController *)self coordinator];
  id v5 = [v4 setupAccessoryDescription];
  id v9 = [v5 setupAccessoryPayload];

  if ([v9 supportsBTLE])
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(HSPCCenterIconViewController *)self coordinator];
    BOOL v6 = [v7 accessoryCommunicationProtocol] == (id)2;
  }
  v8 = [(HSPCDetectedViewController *)self networkInterfaceManager];
  [v8 checkNetworkStatusAndShowAlertIfNeededForBluetooth:v6 Wifi:1];
}

- (HSPCDetectedViewController)initWithCenterContentView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCDetectedViewController;
  return [(HSPCFixedSizeCenterContentViewController *)&v4 initWithCenterContentView:a3];
}

- (id)handleInstallationGuideURL
{
  v3 = [(HSPCCenterIconViewController *)self config];
  objc_super v4 = [v3 setupDescription];
  id v5 = [v4 hf_installationGuideURL];
  [(HSPCDetectedViewController *)self openURL:v5];

  return +[NAFuture futureWithResult:&off_1000B0028];
}

- (id)iconDescriptor
{
  v3 = [(HSPCCenterIconViewController *)self coordinator];
  objc_super v4 = [v3 activeTuple];
  id v5 = [v4 accessoryCategoryOrPrimaryServiceType];
  BOOL v6 = +[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:v5];

  id v7 = [(HSPCCenterIconViewController *)self coordinator];
  v8 = [v7 activeTuple];
  id v9 = [v8 accessory];
  v10 = +[HFServiceIconFactory overrideIconDescriptorForMultiServiceAccessory:v9 iconDescriptor:v6];

  return v10;
}

- (NSString)prominentButtonLocalizedTitle
{
  v3 = HULocalizedString();
  objc_super v4 = [(HSPCCenterIconViewController *)self config];
  unsigned int v5 = [v4 isSetupInitiatedByOtherMatterEcosystem];

  if (v5)
  {
    BOOL v6 = [(HSPCCenterIconViewController *)self coordinator];
    id v7 = [v6 matterDeviceSetupRequest];
    v8 = [v7 ecosystemName];

    v13 = v8;
    uint64_t v9 = HULocalizedStringWithFormat();

    v3 = (void *)v9;
  }
  if ([(HSPCDetectedViewController *)self isFirstDetectedCard])
  {
    id v10 = v3;
  }
  else
  {
    HULocalizedString();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return (NSString *)v11;
}

- (id)commitConfiguration
{
  v3 = [(HSPCCenterIconViewController *)self coordinator];
  objc_super v4 = [v3 matterDeviceSetupRequest];
  unsigned int v5 = [v4 setupPayload];
  BOOL v6 = [v5 manualEntryCode];

  id v7 = [(HSPCCenterIconViewController *)self coordinator];
  v8 = [v7 matterDeviceSetupRequest];
  uint64_t v9 = [v8 setupPayload];
  id v10 = [v9 qrCodeString:0];

  if ([v6 length]) {
    BOOL v11 = [v10 length] == 0;
  }
  else {
    BOOL v11 = 0;
  }
  v12 = +[NAFuture futureWithNoResult];
  if (v11)
  {
    v13 = [(HSPCCenterIconViewController *)self coordinator];
    uint64_t v14 = [v13 didReceiveSetupCode:v6 fromViewController:self];

    v12 = (void *)v14;
  }
  v15 = [(HSPCCenterIconViewController *)self config];
  unsigned int v16 = [v15 isSetupInitiatedByOtherMatterEcosystem];

  if (v16)
  {
    v17 = [(HSPCCenterIconViewController *)self coordinator];
    v18 = [v17 matterDeviceSetupRequest];
    v19 = [v18 topology];

    v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = [v19 homes];
      *(_DWORD *)buf = 136315394;
      id v29 = "-[HSPCDetectedViewController commitConfiguration]";
      __int16 v30 = 2112;
      v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s topology homes %@", buf, 0x16u);
    }
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100016F50;
  v27[3] = &unk_1000A9628;
  v27[4] = self;
  v22 = [v12 flatMap:v27];
  v23 = [v22 flatMap:&stru_1000A9668];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100017094;
  v26[3] = &unk_1000A90D8;
  v26[4] = self;
  v24 = [v23 recover:v26];

  return v24;
}

- (BOOL)isFirstDetectedCard
{
  return self->_firstDetectedCard;
}

- (HSNetworkInterfaceManager)networkInterfaceManager
{
  return self->_networkInterfaceManager;
}

- (void)setNetworkInterfaceManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end