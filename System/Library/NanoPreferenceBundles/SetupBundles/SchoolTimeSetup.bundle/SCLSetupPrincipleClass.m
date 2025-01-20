@interface SCLSetupPrincipleClass
- (BOOL)holdBeforeDisplaying;
- (BOOL)wantsSetupFlowForFamilyMember:(id)a3;
- (NSOperationQueue)operationQueue;
- (SCLSchoolMode)schoolMode;
- (SCLSetupListViewController)listViewController;
- (SCLSetupPrincipleClass)init;
- (SCLWelcomeOptinViewController)welcomeViewController;
- (id)deviceDidPairToken;
- (id)familyMember;
- (id)pairingDidFailToken;
- (id)viewController;
- (void)_commitViewModel:(id)a3 toDevice:(id)a4 retryIfNeeded:(BOOL)a5;
- (void)_unregisterPairingTokens;
- (void)commitViewModel:(id)a3;
- (void)dealloc;
- (void)didEstablishHold;
- (void)setDeviceDidPairToken:(id)a3;
- (void)setListViewController:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPairingDidFailToken:(id)a3;
- (void)setSchoolMode:(id)a3;
- (void)setWelcomeViewController:(id)a3;
- (void)showSettingsConfiguration;
- (void)skipSettingsConfiguration;
@end

@implementation SCLSetupPrincipleClass

- (SCLSetupPrincipleClass)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCLSetupPrincipleClass;
  v2 = [(SCLSetupPrincipleClass *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SCLWelcomeOptinViewController);
    welcomeViewController = v2->_welcomeViewController;
    v2->_welcomeViewController = v3;

    [(SCLWelcomeOptinViewController *)v2->_welcomeViewController setMiniFlowDelegate:v2];
    [(SCLWelcomeOptinViewController *)v2->_welcomeViewController setFlowController:v2];
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SCLSetupPrincipleClass;
  [(SCLSetupPrincipleClass *)&v2 dealloc];
}

- (id)viewController
{
  return self->_welcomeViewController;
}

- (void)showSettingsConfiguration
{
  if (!self->_listViewController)
  {
    v3 = objc_alloc_init(SCLSetupListViewController);
    listViewController = self->_listViewController;
    self->_listViewController = v3;

    [(SCLSetupListViewController *)self->_listViewController setFlowController:self];
  }
  id v5 = [(SCLSetupPrincipleClass *)self navigationController];
  [v5 pushViewController:self->_listViewController animated:1];
}

- (void)skipSettingsConfiguration
{
  v3 = scl_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Skip settings configuration", v5, 2u);
  }

  v4 = [(SCLSetupPrincipleClass *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)commitViewModel:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isEnabled];
  objc_super v6 = scl_setup_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Commit view model: %@", buf, 0xCu);
    }

    v8 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = self->_operationQueue;
    self->_operationQueue = v8;

    [(NSOperationQueue *)self->_operationQueue setQualityOfService:25];
    v10 = +[NSNotificationCenter defaultCenter];
    uint64_t v11 = NRPairedDeviceRegistryDeviceDidPairNotification;
    v12 = self->_operationQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_3C2C;
    v19[3] = &unk_82B8;
    v19[4] = self;
    id v20 = v4;
    v13 = [v10 addObserverForName:v11 object:0 queue:v12 usingBlock:v19];

    [(SCLSetupPrincipleClass *)self setDeviceDidPairToken:v13];
    v14 = +[NSNotificationCenter defaultCenter];
    v15 = self->_operationQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_3DA0;
    v18[3] = &unk_82E0;
    v18[4] = self;
    v16 = [v14 addObserverForName:NRPairedDeviceRegistryDeviceDidFailToPairNotification object:0 queue:v15 usingBlock:v18];

    [(SCLSetupPrincipleClass *)self setPairingDidFailToken:v16];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Commit view model called with a disabled view model - skipping", buf, 2u);
    }
  }
  v17 = [(SCLSetupPrincipleClass *)self delegate];
  [v17 buddyControllerDone:self];
}

- (void)_unregisterPairingTokens
{
  v3 = +[NSNotificationCenter defaultCenter];
  id v4 = [(SCLSetupPrincipleClass *)self deviceDidPairToken];
  [v3 removeObserver:v4];

  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  objc_super v6 = [(SCLSetupPrincipleClass *)self pairingDidFailToken];
  [v5 removeObserver:v6];

  [(SCLSetupPrincipleClass *)self setDeviceDidPairToken:0];

  [(SCLSetupPrincipleClass *)self setPairingDidFailToken:0];
}

- (void)_commitViewModel:(id)a3 toDevice:(id)a4 retryIfNeeded:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[SCLScheduleSettings scheduleSettingsWithViewModel:v8];
  id v11 = objc_alloc_init((Class)SCLSchoolModeConfiguration);
  [v11 setIdentifier:@"SchoolTime.Setup"];
  v12 = [v9 pairingID];
  [v11 setPairingID:v12];

  id v13 = [objc_alloc((Class)SCLSchoolMode) initWithConfiguration:v11];
  [v13 resume];
  [(SCLSetupPrincipleClass *)self setSchoolMode:v13];
  SCLLogViewModelCommit();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_4078;
  v17[3] = &unk_8330;
  id v18 = v10;
  id v19 = v9;
  BOOL v22 = a5;
  id v20 = self;
  id v21 = v8;
  id v14 = v8;
  id v15 = v9;
  id v16 = v10;
  [v13 applyScheduleSettings:v16 completion:v17];
}

- (BOOL)holdBeforeDisplaying
{
  objc_super v2 = scl_pairing_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "SCLSetupPrincipleClass holdBeforeDisplaying", v4, 2u);
  }

  return 1;
}

- (void)didEstablishHold
{
  v3 = scl_pairing_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "didEstablishHold", (uint8_t *)&v9, 2u);
  }

  id v4 = [(SCLSetupPrincipleClass *)self familyMember];
  unsigned int v5 = [(SCLSetupPrincipleClass *)self wantsSetupFlowForFamilyMember:v4];
  objc_super v6 = scl_pairing_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ releasing hold", (uint8_t *)&v9, 0xCu);
    }

    id v8 = [(SCLSetupPrincipleClass *)self delegate];
    [v8 buddyControllerReleaseHold:self];
  }
  else
  {
    if (v7)
    {
      int v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ releasing hold and skipping", (uint8_t *)&v9, 0xCu);
    }

    id v8 = [(SCLSetupPrincipleClass *)self delegate];
    [v8 buddyControllerReleaseHoldAndSkip:self];
  }
}

- (id)familyMember
{
  objc_super v2 = [(SCLSetupPrincipleClass *)self delegate];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 setupFlowUserInfo];
    unsigned int v5 = v4;
    if (v4)
    {
      objc_super v6 = [v4 objectForKey:BPSPairingFlowFamilyMember];
      if (v6) {
        goto LABEL_13;
      }
      BOOL v7 = scl_pairing_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_57C8((uint64_t)v5, v7);
      }
    }
    else
    {
      BOOL v7 = scl_pairing_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_5790(v7, v15, v16, v17, v18, v19, v20, v21);
      }
      objc_super v6 = 0;
    }
  }
  else
  {
    unsigned int v5 = scl_pairing_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_5758(v5, v8, v9, v10, v11, v12, v13, v14);
    }
    objc_super v6 = 0;
  }
LABEL_13:

  return v6;
}

- (BOOL)wantsSetupFlowForFamilyMember:(id)a3
{
  return (unint64_t)[a3 age] < 0x12;
}

- (SCLWelcomeOptinViewController)welcomeViewController
{
  return self->_welcomeViewController;
}

- (void)setWelcomeViewController:(id)a3
{
}

- (SCLSetupListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setListViewController:(id)a3
{
}

- (id)deviceDidPairToken
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceDidPairToken:(id)a3
{
}

- (id)pairingDidFailToken
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setPairingDidFailToken:(id)a3
{
}

- (SCLSchoolMode)schoolMode
{
  return (SCLSchoolMode *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSchoolMode:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_schoolMode, 0);
  objc_storeStrong(&self->_pairingDidFailToken, 0);
  objc_storeStrong(&self->_deviceDidPairToken, 0);
  objc_storeStrong((id *)&self->_listViewController, 0);

  objc_storeStrong((id *)&self->_welcomeViewController, 0);
}

@end