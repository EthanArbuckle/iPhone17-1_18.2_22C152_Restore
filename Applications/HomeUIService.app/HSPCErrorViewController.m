@interface HSPCErrorViewController
+ (id)_findAccessoryInHomeForCoordinator:(id)a3 config:(id)a4;
+ (id)viewControllerForCoordinator:(id)a3 config:(id)a4;
- (BOOL)_isErrorInPublicHomeDomain:(id)a3;
- (BOOL)accessoryAlreadyAdded;
- (HSPCErrorViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)commitConfiguration;
- (id)dismissFuture;
- (id)iconDescriptor;
- (id)launchAdditionalSettings;
- (id)retry;
- (void)configureCard;
- (void)setAccessoryAlreadyAdded:(BOOL)a3;
@end

@implementation HSPCErrorViewController

+ (id)viewControllerForCoordinator:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 pairingError];
    int v14 = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Presenting error card with error %@", (uint8_t *)&v14, 0xCu);
  }
  v9 = [v6 pairingError];
  unsigned int v10 = [v9 hf_isThreadNetworkRequiredError];

  if (v10) {
    v11 = (objc_class *)HSPCThreadNetworkRequiredViewController;
  }
  else {
    v11 = (objc_class *)objc_opt_class();
  }
  id v12 = [[v11 alloc] initWithCoordinator:v5 config:v6];

  return v12;
}

- (BOOL)_isErrorInPublicHomeDomain:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:HFErrorDomain]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v3 hf_isPublicHMError];
  }

  return v5;
}

- (HSPCErrorViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 pairingError];
  if (!objc_msgSend(v8, "hf_isAlreadyPairedError"))
  {
    v15.receiver = self;
    v15.super_class = (Class)HSPCErrorViewController;
    v13 = [(HSPCCenterIconViewController *)&v15 initWithCoordinator:v6 config:v7];
    if (!v13) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v9 = +[HSPCErrorViewController _findAccessoryInHomeForCoordinator:v6 config:v7];
  if (v9)
  {
    unsigned int v10 = [v7 category];
    v11 = [v10 categoryType];

    id v12 = [objc_alloc((Class)HUHomeAccessoryTileView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v17.receiver = self;
    v17.super_class = (Class)HSPCErrorViewController;
    v13 = [(HSPCCenterIconViewController *)&v17 initWithCoordinator:v6 config:v7 iconView:v12];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HSPCErrorViewController;
    v13 = [(HSPCCenterIconViewController *)&v16 initWithCoordinator:v6 config:v7];
  }

  if (v13)
  {
LABEL_8:
    v13->_accessoryAlreadyAdded = 0;
    [(HSPCErrorViewController *)v13 configureCard];
  }
LABEL_9:

  return v13;
}

+ (id)_findAccessoryInHomeForCoordinator:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 home];
  v8 = [v7 accessories];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001C274;
  v17[3] = &unk_1000A9818;
  id v9 = v5;
  id v18 = v9;
  unsigned int v10 = [v8 na_firstObjectPassingTest:v17];

  if (!v10)
  {
    v11 = [v6 pairingError];
    id v12 = [v11 code];

    if (v12 == (id)13)
    {
      v13 = [v7 accessories];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10001C2E8;
      v15[3] = &unk_1000A9818;
      id v16 = v9;
      unsigned int v10 = [v13 na_firstObjectPassingTest:v15];
    }
    else
    {
      unsigned int v10 = 0;
    }
  }

  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B00B8];
}

- (void)configureCard
{
  id v3 = [(HSPCCenterIconViewController *)self config];
  v4 = [v3 pairingError];

  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:];

  if ([(HSPCErrorViewController *)self _isErrorInPublicHomeDomain:v6])
  {
    id v7 = v6;

    v4 = v7;
  }
  if (!v4)
  {
    NSLog(@"HSPCErrorViewController introduced into flow without an error object.  In production this will recover with a generic error");
    v4 = +[NSError hf_errorWithCode:69];
  }
  v8 = [v4 userInfo];
  uint64_t v9 = HFErrorUserInfoOptionsKey;
  unsigned int v10 = [v8 objectForKeyedSubscript:HFErrorUserInfoOptionsKey];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    v13 = [(HSPCCenterIconViewController *)self config];
    int v14 = [v13 pairingError];
    objc_super v15 = [v14 userInfo];
    id v12 = [v15 objectForKeyedSubscript:v9];
  }
  id v16 = HFLocalizedString();
  if (objc_msgSend(v4, "hf_isHMErrorWithCode:", 52))
  {
    uint64_t v17 = HFLocalizedString();

    id v16 = (void *)v17;
  }
  id v18 = [v12 objectForKeyedSubscript:HFErrorUserInfoOptionTitleKey];
  if (v18)
  {
    [(HSPCErrorViewController *)self setTitle:v18];
  }
  else
  {
    v19 = [(HSPCCenterIconViewController *)self coordinator];
    if ([v19 launchReason]) {
      HULocalizedString();
    }
    else {
    v20 = HFLocalizedString();
    }
    [(HSPCErrorViewController *)self setTitle:v20];
  }
  uint64_t v21 = [v12 objectForKeyedSubscript:HFErrorUserInfoOptionDescriptionKey];
  v22 = (void *)v21;
  if (v21) {
    v23 = (void *)v21;
  }
  else {
    v23 = v16;
  }
  [(HSPCErrorViewController *)self setSubtitle:v23];

  if (objc_msgSend(v4, "hf_isAlreadyPairedError"))
  {
    v24 = [(HSPCCenterIconViewController *)self coordinator];
    v25 = [(HSPCCenterIconViewController *)self config];
    v26 = +[HSPCErrorViewController _findAccessoryInHomeForCoordinator:v24 config:v25];

    if (v26)
    {
      [(HSPCErrorViewController *)self setAccessoryAlreadyAdded:1];
      v27 = [v26 name];
      v28 = HFLocalizedStringWithFormat();
      -[HSPCErrorViewController setSubtitle:](self, "setSubtitle:", v28, v27);

      v29 = [(HSPCErrorViewController *)self subtitle];
      unsigned __int8 v30 = [v26 isReachable];
      if (v30)
      {
        v31 = &stru_1000ABBA8;
      }
      else
      {
        HFLocalizedString();
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v33 = [v29 stringByAppendingString:v31];
      [(HSPCErrorViewController *)self setSubtitle:v33];

      if ((v30 & 1) == 0) {
    }
      }
    else
    {
      v32 = HFLocalizedString();
      [(HSPCErrorViewController *)self setTitle:v32];

      v29 = HFLocalizedString();
      [(HSPCErrorViewController *)self setSubtitle:v29];
    }
  }
  if (objc_msgSend(v4, "hf_isHMErrorWithCodePrivate:", 2015))
  {
    id v34 = [(HSPCErrorViewController *)self addProminentButtonWithTitleKey:@"HUProximityCardSetupAccessoryErrorRetryButton" target:self futureSelector:"retry"];
    CFStringRef v35 = @"HUProximityCardSetupAccessoryErrorSetupLaterLink";
    v36 = &selRef_dismissFuture;
  }
  else
  {
    id v37 = [(HSPCErrorViewController *)self addProminentDismissButtonWithTitleKey:@"HUOkTitle"];
    if (![(HSPCErrorViewController *)self accessoryAlreadyAdded]) {
      goto LABEL_33;
    }
    CFStringRef v35 = @"HUProximityCardSetupAccessoryErrorVCAdditionalSettingsButton";
    v36 = &selRef_launchAdditionalSettings;
  }
  id v38 = [(HSPCErrorViewController *)self addOptionalButtonWithTitleKey:v35 target:self futureSelector:*v36];
LABEL_33:
  v39 = HFLogForCategory();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    [(HSPCErrorViewController *)self title];
    v40 = v50 = v4;
    v41 = [(HSPCErrorViewController *)self subtitle];
    v49 = [(HSPCCenterIconViewController *)self config];
    v42 = [v49 pairingError];
    v43 = [(HSPCCenterIconViewController *)self config];
    [v43 pairingError];
    v44 = v51 = v6;
    [v44 userInfo];
    v46 = id v45 = v12;
    [v46 objectForKeyedSubscript:NSUnderlyingErrorKey];
    v48 = v47 = v16;
    *(_DWORD *)buf = 138413314;
    v53 = v40;
    __int16 v54 = 2112;
    v55 = v41;
    __int16 v56 = 2112;
    v57 = v42;
    __int16 v58 = 2112;
    v59 = v48;
    __int16 v60 = 2112;
    v61 = v47;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Presenting error screen w/ title %@, subtitle %@, pairing error %@, underlyingError %@, errorLocalizedDescription %@", buf, 0x34u);

    id v16 = v47;
    id v12 = v45;

    id v6 = v51;
    v4 = v50;
  }
}

- (id)retry
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v13 = 138412546;
    int v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v13, 0x16u);
  }
  id v6 = [(HSPCCenterIconViewController *)self coordinator];
  [v6 resetForRetry];

  id v7 = [(HSPCCenterIconViewController *)self coordinator];
  v8 = [(HSPCCenterIconViewController *)self coordinator];
  uint64_t v9 = [v8 setupCode];
  id v10 = [v7 didReceiveSetupCode:v9 fromViewController:self];

  v11 = +[NAFuture futureWithResult:&off_1000B00D0];

  return v11;
}

- (id)dismissFuture
{
  return +[NAFuture futureWithResult:&off_1000B00B8];
}

- (id)iconDescriptor
{
  if ([(HSPCErrorViewController *)self accessoryAlreadyAdded])
  {
    id v2 = 0;
  }
  else
  {
    id v3 = +[UIColor hf_keyColor];
    v4 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v3];

    id v2 = [objc_alloc((Class)HFImageIconDescriptor) initWithSystemImageNamed:@"exclamationmark.triangle.fill" configuration:v4];
  }

  return v2;
}

- (id)launchAdditionalSettings
{
  id v3 = [(HSPCCenterIconViewController *)self config];
  v4 = [v3 home];

  id v5 = [(HSPCCenterIconViewController *)self coordinator];
  id v6 = [(HSPCCenterIconViewController *)self config];
  id v7 = +[HSPCErrorViewController _findAccessoryInHomeForCoordinator:v5 config:v6];

  v8 = +[HFSetupPairingControllerUtilities urlComponentHomeSettingsForAccessory:v7 forHome:v4];
  uint64_t v9 = [(HSPCErrorViewController *)self commitConfiguration];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001CC9C;
  v13[3] = &unk_1000A8D98;
  id v14 = v8;
  id v10 = v8;
  id v11 = [v9 addCompletionBlock:v13];

  return v9;
}

- (BOOL)accessoryAlreadyAdded
{
  return self->_accessoryAlreadyAdded;
}

- (void)setAccessoryAlreadyAdded:(BOOL)a3
{
  self->_accessoryAlreadyAdded = a3;
}

@end