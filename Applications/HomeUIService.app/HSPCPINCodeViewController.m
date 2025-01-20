@interface HSPCPINCodeViewController
- (HSPCPINCodeViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCPINCodeViewController

- (HSPCPINCodeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)HUIconView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v24.receiver = self;
  v24.super_class = (Class)HSPCPINCodeViewController;
  v10 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v24, "initWithCenterContentView:size:", v9, 120.0, 132.0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_config, a4);
    objc_storeStrong((id *)&v11->_coordinator, a3);
    v12 = sub_100060C64(@"HSProximityCardPINCodeTitle");
    [(HSPCPINCodeViewController *)v11 setTitle:v12];

    v13 = sub_100060C64(@"HSProximityCardPINCodeSubtitle");
    [(HSPCPINCodeViewController *)v11 setSubtitle:v13];

    v14 = [v8 home];
    unsigned int v15 = [v14 hf_currentUserIsRestrictedGuest];

    if (v15)
    {
      v16 = sub_100060C64(@"HSProximityCardPINCodeSubtitle_RestrictedGuest");
      [(HSPCPINCodeViewController *)v11 setSubtitle:v16];
    }
    id v17 = [(HSPCPINCodeViewController *)v11 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v11 futureSelector:"commitConfiguration"];
    v18 = [v8 home];
    v19 = +[HFWalletUtilities packageIconIdentifierForHome:v18 shouldUseKeyholeAsset:0];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001A0F0;
    v22[3] = &unk_1000A9720;
    id v23 = v9;
    id v20 = [v19 flatMap:v22];
  }
  return v11;
}

- (id)commitConfiguration
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v32 = self;
    __int16 v33 = 2112;
    v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%@) User tapped Continue button", buf, 0x16u);
  }
  id v6 = objc_alloc_init((Class)NAFuture);
  if (+[HFUtilities isUsingiCloud])
  {
    id v7 = +[HFHomeKitDispatcher sharedDispatcher];
    id v8 = [(HSPCPINCodeViewController *)self config];
    id v9 = [v8 home];
    v10 = [v7 pinCodeManagerForHome:v9];

    objc_initWeak((id *)buf, self);
    v11 = [v10 hasValidConstraints];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001A660;
    v22[3] = &unk_1000A9788;
    objc_copyWeak(&v24, (id *)buf);
    id v23 = v6;
    id v12 = [v11 flatMap:v22];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10001A650;
    v25[3] = &unk_1000A90B0;
    id v26 = v6;
    v13 = objc_retainBlock(v25);
    v14 = HFLocalizedString();
    unsigned int v15 = HFLocalizedString();
    v29[0] = HFErrorHandlerOptionRetryButtonTextKey;
    v29[1] = HFErrorHandlerOptionCancelButtonTextKey;
    v30[0] = v14;
    v30[1] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    v27[0] = HFErrorUserInfoOptionsKey;
    v27[1] = HFErrorUserInfoOperationTypeKey;
    v28[0] = v16;
    v28[1] = HFOperationAddPINCode;
    id v17 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    id v18 = objc_alloc((Class)NSError);
    id v19 = [v18 initWithDomain:HFErrorDomain code:79 userInfo:v17];
    id v20 = +[HFErrorHandler sharedHandler];
    [v20 handleError:v19 retryBlock:&stru_1000A9760 cancelBlock:v13];

    v10 = v26;
  }

  return v6;
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