@interface HSPCWalletKeyViewController
+ (id)_getBundleIDForWalletAppIcon;
- (HSPCWalletKeyViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (UIImageView)cardImageView;
- (UIImageView)walletAppIconImageView;
- (id)commitConfiguration;
- (void)_setupWalletAppIconImageView;
- (void)setCardImageView:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setWalletAppIconImageView:(id)a3;
@end

@implementation HSPCWalletKeyViewController

- (HSPCWalletKeyViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v45 = a3;
  id v7 = a4;
  v8 = +[PRXImageView imageViewWithStyle:0];
  [v8 setContentMode:1];
  v66.receiver = self;
  v66.super_class = (Class)HSPCWalletKeyViewController;
  v9 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v66, "initWithCenterContentView:size:", v8, 185.0, 107.0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    objc_storeStrong((id *)&v10->_cardImageView, v8);
    v11 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    walletAppIconImageView = v10->_walletAppIconImageView;
    v10->_walletAppIconImageView = v11;

    v46 = [(id)objc_opt_class() _getBundleIDForWalletAppIcon];
    v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v68 = "-[HSPCWalletKeyViewController initWithCoordinator:config:]";
      __int16 v69 = 2112;
      v70 = v46;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(%s) wallet app icon's bundleID = %@", buf, 0x16u);
    }

    id v44 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v46];
    v14 = +[UIScreen mainScreen];
    [v14 scale];
    v16 = v15;

    id v47 = [objc_alloc((Class)ISImageDescriptor) initWithSize:64.0 scale:64.0];
    v17 = +[UITraitCollection currentTraitCollection];
    objc_msgSend(v47, "setAppearance:", objc_msgSend(v17, "userInterfaceStyle") != (id)1);

    objc_initWeak((id *)buf, v10);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10005CA94;
    v64[3] = &unk_1000AB560;
    objc_copyWeak(v65, (id *)buf);
    v65[1] = v16;
    [v44 getImageForImageDescriptor:v47 completion:v64];
    [v8 addSubview:v10->_walletAppIconImageView];
    v18 = sub_100060C64(@"HSProximityCardWalletKeyTitle");
    [(HSPCWalletKeyViewController *)v10 setTitle:v18];

    v19 = [v7 home];
    unsigned int v20 = [v19 hf_currentUserIsRestrictedGuest];

    v21 = [v7 home];
    if (v20)
    {
      v22 = [v21 hf_hasWalletKey];
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10005CBE8;
      v61[3] = &unk_1000A9788;
      objc_copyWeak(&v63, (id *)buf);
      id v62 = v7;
      id v23 = [v22 flatMap:v61];

      objc_destroyWeak(&v63);
    }
    else
    {
      v24 = [v21 name];
      v31 = sub_100060D80(@"HSProximityCardWalletKeySubitle", @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v24);
      [(HSPCWalletKeyViewController *)v10 setSubtitle:v31];
    }
    id v32 = [(HSPCWalletKeyViewController *)v10 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v10 futureSelector:"commitConfiguration"];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10005CDF0;
    v58[3] = &unk_1000AB0C8;
    objc_copyWeak(&v60, (id *)buf);
    id v33 = v8;
    id v59 = v33;
    v34 = objc_retainBlock(v58);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10005CF20;
    v53[3] = &unk_1000AB5D8;
    id v35 = v7;
    id v54 = v35;
    objc_copyWeak(&v57, (id *)buf);
    v36 = v34;
    id v56 = v36;
    id v55 = v33;
    v37 = objc_retainBlock(v53);
    v38 = [v35 home];
    v39 = [v38 hf_hasWalletKey];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10005D3E0;
    v48[3] = &unk_1000AB628;
    id v49 = v35;
    v50 = v10;
    v40 = v36;
    id v51 = v40;
    v41 = v37;
    id v52 = v41;
    id v42 = [v39 flatMap:v48];

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v60);
    objc_destroyWeak(v65);
    objc_destroyWeak((id *)buf);
  }
  return v10;
}

- (void)_setupWalletAppIconImageView
{
  v3 = [(HSPCWalletKeyViewController *)self cardImageView];
  v4 = [v3 image];

  if (v4)
  {
    v5 = [(HSPCWalletKeyViewController *)self cardImageView];
    [v5 frame];
    double v7 = v6 * 0.5 + 84.5 + -64.0 + 16.0;

    v8 = [(HSPCWalletKeyViewController *)self cardImageView];
    [v8 frame];
    double v10 = v9 * 0.5 + 53.5 + -64.0;

    id v12 = [(HSPCWalletKeyViewController *)self walletAppIconImageView];
    [v12 setFrame:v7, v10, 64.0, 64.0];
  }
  else
  {
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100068F74();
    }
  }
}

+ (id)_getBundleIDForWalletAppIcon
{
  if (+[HFUtilities isAnIPhone]) {
    v2 = @"com.apple.Passbook";
  }
  else {
    v2 = @"com.apple.PassbookStub";
  }

  return v2;
}

- (id)commitConfiguration
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[HSPCWalletKeyViewController commitConfiguration]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped Continue button for HSPCWalletKeyViewController", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v4 = [(HSPCWalletKeyViewController *)self config];
  v5 = [v4 home];
  double v6 = [v5 hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005DB2C;
  v15[3] = &unk_1000A8F70;
  objc_copyWeak(&v16, (id *)buf);
  double v7 = [v6 flatMap:v15];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005E0A0;
  v13[3] = &unk_1000A9330;
  objc_copyWeak(&v14, (id *)buf);
  v8 = [v7 recover:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005E148;
  v11[3] = &unk_1000A91F0;
  objc_copyWeak(&v12, (id *)buf);
  double v9 = [v8 addCompletionBlock:v11];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak((id *)buf);

  return v9;
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

- (UIImageView)cardImageView
{
  return self->_cardImageView;
}

- (void)setCardImageView:(id)a3
{
}

- (UIImageView)walletAppIconImageView
{
  return self->_walletAppIconImageView;
}

- (void)setWalletAppIconImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletAppIconImageView, 0);
  objc_storeStrong((id *)&self->_cardImageView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end