@interface DSCompletedController
+ (void)initialize;
- (BOOL)UTAlertsEnabled;
- (BOOL)walletSharing;
- (CLFindMyAccessoryManager)accessoryManager;
- (DSCompletedController)init;
- (DSNavigationDelegate)delegate;
- (FAFamilyMember)familyMember;
- (NSLayoutConstraint)heightConstraint;
- (OS_dispatch_group)fetchingGroup;
- (UIActivityIndicatorView)spinner;
- (void)addFamilyBullet;
- (void)addHomeBullet;
- (void)addUTAlerts;
- (void)addWalletBullet;
- (void)fetchAdditionalSharingWithCompletion:(id)a3;
- (void)fetchCompleted;
- (void)findMyAccessoryManager:(id)a3 didFetchStatusOfUTEnablementRequirementsWithStatus:(id)a4 withError:(id)a5;
- (void)learnMorePressed;
- (void)setAccessoryManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyMember:(id)a3;
- (void)setFetchingGroup:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setUTAlertsEnabled:(BOOL)a3;
- (void)setWalletSharing:(BOOL)a3;
- (void)startContentSpinner;
- (void)stopContentSpinner;
- (void)viewDidLoad;
@end

@implementation DSCompletedController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.DigitalSeparation", "DSCompletedController");
    uint64_t v3 = DSLogAdditionalSharing;
    DSLogAdditionalSharing = (uint64_t)v2;
    MEMORY[0x270F9A758](v2, v3);
  }
}

- (DSCompletedController)init
{
  uint64_t v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] systemBlueColor];
  v5 = [v3 configurationWithHierarchicalColor:v4];

  v6 = DSUILocStringForKey(@"DEVICE_ACCOUNT_SECURITY_COMPLETE");
  v7 = DSUILocStringForKey(@"DEVICE_ACCOUNT_SECURITY_COMPLETE_DETAIL");
  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark.circle" withConfiguration:v5];
  v11.receiver = self;
  v11.super_class = (Class)DSCompletedController;
  v9 = [(DSCompletedController *)&v11 initWithTitle:v6 detailText:v7 icon:v8];

  return v9;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)DSCompletedController;
  [(DSOBWelcomeController *)&v12 viewDidLoad];
  id v3 = +[DSUIUtilities setUpLearnMoreButtonForController:self selector:sel_learnMorePressed];
  v4 = DSUILocStringForKey(@"DONE");
  v5 = [(DSCompletedController *)self delegate];
  id v6 = +[DSUIUtilities setUpBoldButtonForController:self title:v4 target:v5 selector:sel_pushNextPane];

  v7 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v7;

  id v9 = objc_alloc(MEMORY[0x263F00A38]);
  v10 = (void *)[v9 initWithDelegate:self delegateQueue:MEMORY[0x263EF83A0]];
  [(DSCompletedController *)self setAccessoryManager:v10];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __36__DSCompletedController_viewDidLoad__block_invoke;
  v11[3] = &unk_264C6E7D0;
  v11[4] = self;
  [(DSCompletedController *)self fetchAdditionalSharingWithCompletion:v11];
}

void __36__DSCompletedController_viewDidLoad__block_invoke(uint64_t a1)
{
  os_log_t v2 = *(void **)(a1 + 32);
  id v3 = DSUILocStringForKey(@"UNINSTALL_APPS");
  v4 = +[DSUIUtilities valueForUnfinalizedString:v3];
  v5 = DSUILocStringForKey(@"UNINSTALL_APPS_DETAIL");
  id v6 = +[DSUIUtilities valueForUnfinalizedString:v5];
  v7 = [MEMORY[0x263F827E8] systemImageNamed:@"network"];
  [v2 addBulletedListItemWithTitle:v4 description:v6 image:v7];

  v8 = *(void **)(a1 + 32);
  id v9 = DSUILocStringForKey(@"UPDATE_PASSWORDS");
  v10 = DSUILocStringForKey(@"UPDATE_PASSWORDS_DETAIL");
  objc_super v11 = [MEMORY[0x263F827E8] systemImageNamed:@"key.fill"];
  [v8 addBulletedListItemWithTitle:v9 description:v10 image:v11];

  objc_super v12 = *(void **)(a1 + 32);
  v13 = DSUILocStringForKey(@"SOCIAL_MEDIA");
  v14 = DSUILocStringForKey(@"SOCIAL_MEDIA_DETAIL");
  v15 = [MEMORY[0x263F827E8] systemImageNamed:@"text.bubble.fill"];
  [v12 addBulletedListItemWithTitle:v13 description:v14 image:v15];

  v16 = *(void **)(a1 + 32);
  v17 = DSUILocStringForKey(@"CHECK_OTHER_DEVICES");
  v18 = DSUILocStringForKey(@"CHECK_OTHER_DEVICES_DETAIL");
  v19 = [MEMORY[0x263F827E8] systemImageNamed:@"person.3.fill"];
  [v16 addBulletedListItemWithTitle:v17 description:v18 image:v19];

  [*(id *)(a1 + 32) addUTAlerts];
  [*(id *)(a1 + 32) addHomeBullet];
  [*(id *)(a1 + 32) addWalletBullet];
  v20 = *(void **)(a1 + 32);
  v21 = DSUILocStringForKey(@"CELLULAR_SERVICE");
  v22 = DSUILocStringForKey(@"CELLULAR_SERVICE_DETAIL");
  v23 = [MEMORY[0x263F827E8] systemImageNamed:@"antenna.radiowaves.left.and.right"];
  [v20 addBulletedListItemWithTitle:v21 description:v22 image:v23];

  [*(id *)(a1 + 32) addFamilyBullet];
  if ([MEMORY[0x263F3A368] hasRestriction])
  {
    v24 = *(void **)(a1 + 32);
    DSUILocStringForKey(@"RESTRICTIONS_ADDITIONAL_ACTIONS_TITLE");
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    v25 = DSUILocStringForKey(@"RESTRICTIONS_ADDITIONAL_ACTIONS_DETAIL");
    v26 = (void *)MEMORY[0x263F827E8];
    v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v28 = [v26 imageNamed:@"custom.nosign" inBundle:v27];
    [v24 addBulletedListItemWithTitle:v29 description:v25 image:v28];
  }
}

- (void)fetchAdditionalSharingWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  [(DSCompletedController *)self setFetchingGroup:v5];

  id v6 = [(DSCompletedController *)self fetchingGroup];
  objc_initWeak(&location, self);
  id v7 = objc_alloc_init(MEMORY[0x263F3BF48]);
  dispatch_group_enter(v6);
  [(DSCompletedController *)self startContentSpinner];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke;
  v22[3] = &unk_264C6F108;
  objc_copyWeak(&v24, &location);
  v8 = v6;
  v23 = v8;
  [v7 startRequestWithCompletionHandler:v22];
  dispatch_group_enter(v8);
  id v9 = (void *)MEMORY[0x263F5C058];
  v10 = [MEMORY[0x263F5C128] sharedService];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_403;
  v19[3] = &unk_264C6F130;
  objc_copyWeak(&v21, &location);
  objc_super v11 = v8;
  v20 = v11;
  [v9 shouldShowWalletInDigitalSeparation:v10 withDeviceSpecificCompletion:v19];

  dispatch_group_enter(v11);
  objc_super v12 = DSLogAdditionalSharing;
  if (os_log_type_enabled((os_log_t)DSLogAdditionalSharing, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v12, OS_LOG_TYPE_INFO, "Fetching UT Enablement status", buf, 2u);
  }
  v13 = [(DSCompletedController *)self accessoryManager];
  [v13 fetchStatusOfUTEnablementRequirements];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_405;
  v15[3] = &unk_264C6F158;
  objc_copyWeak(&v17, &location);
  id v16 = v4;
  id v14 = v4;
  dispatch_group_notify(v11, MEMORY[0x263EF83A0], v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DSLogAdditionalSharing, OS_LOG_TYPE_ERROR)) {
      __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_cold_1();
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = objc_msgSend(v5, "members", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v12 isMe])
          {
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
            [WeakRetained setFamilyMember:v12];

            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_403(uint64_t a1, int a2, unsigned int a3, void *a4)
{
  id v7 = a4;
  if (v7 && os_log_type_enabled((os_log_t)DSLogAdditionalSharing, OS_LOG_TYPE_ERROR)) {
    __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_403_cold_1();
  }
  uint64_t v8 = a2 | a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setWalletSharing:v8];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_405(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained fetchCompleted];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)fetchCompleted
{
  [(DSCompletedController *)self setFetchingGroup:0];
  [(DSCompletedController *)self stopContentSpinner];
}

- (void)addFamilyBullet
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Failed to find name for %{private}@", v2, v3, v4, v5, v6);
}

- (void)addWalletBullet
{
  if ([(DSCompletedController *)self walletSharing])
  {
    DSUILocStringForKey(@"ADDITIONAL_WALLET_TITLE");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = DSUILocStringForKey(@"ADDITIONAL_WALLET_DETAIL");
    uint64_t v4 = [MEMORY[0x263F827E8] systemImageNamed:@"wallet.pass.fill"];
    [(DSCompletedController *)self addBulletedListItemWithTitle:v5 description:v3 image:v4];
  }
}

- (void)addHomeBullet
{
  DSUILocStringForKey(@"ADDITIONAL_HOME_TITLE");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = DSUILocStringForKey(@"ADDITIONAL_HOME_DETAIL");
  uint64_t v4 = [MEMORY[0x263F827E8] systemImageNamed:@"house.fill"];
  [(DSCompletedController *)self addBulletedListItemWithTitle:v5 description:v3 image:v4];
}

- (void)addUTAlerts
{
  if (![(DSCompletedController *)self UTAlertsEnabled])
  {
    DSUILocStringForKey(@"UNWANTED_TRACKING");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = DSUILocStringForKey(@"UNWANTED_TRACKING_DETAIL");
    uint64_t v4 = [MEMORY[0x263F827E8] systemImageNamed:@"location.fill"];
    [(DSCompletedController *)self addBulletedListItemWithTitle:v5 description:v3 image:v4];
  }
}

- (void)startContentSpinner
{
  uint64_t v3 = [(DSCompletedController *)self contentView];
  uint64_t v4 = [(DSCompletedController *)self spinner];
  [v3 addSubview:v4];

  id v5 = [(DSCompletedController *)self spinner];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint8_t v6 = [(DSCompletedController *)self contentView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = [(DSCompletedController *)self contentView];
  uint64_t v8 = [v7 heightAnchor];
  uint64_t v9 = [v8 constraintEqualToConstant:100.0];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v9;

  objc_super v11 = [(DSCompletedController *)self heightConstraint];
  [v11 setActive:1];

  objc_super v12 = [(DSCompletedController *)self spinner];
  v13 = [v12 centerXAnchor];
  long long v14 = [(DSCompletedController *)self contentView];
  long long v15 = [v14 centerXAnchor];
  long long v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  id v17 = [(DSCompletedController *)self spinner];
  [v17 startAnimating];
}

- (void)stopContentSpinner
{
  uint64_t v3 = [(DSCompletedController *)self spinner];
  [v3 stopAnimating];

  uint64_t v4 = [(DSCompletedController *)self spinner];
  [v4 removeFromSuperview];

  id v5 = [(DSCompletedController *)self heightConstraint];
  [v5 setActive:0];
}

- (void)learnMorePressed
{
  AnalyticsSendEventLazy();
  id v5 = [(DSCompletedController *)self delegate];
  uint64_t v3 = DSUIFeatureTable();
  uint64_t v4 = DSUILocStringForKeyInTable(@"NAVIGATION_LEARN_MORE_URL", v3);
  [v5 learnMorePressedForController:self withURL:v4];
}

void *__41__DSCompletedController_learnMorePressed__block_invoke()
{
  return &unk_26E91F9E8;
}

- (void)findMyAccessoryManager:(id)a3 didFetchStatusOfUTEnablementRequirementsWithStatus:(id)a4 withError:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10 && os_log_type_enabled((os_log_t)DSLogAdditionalSharing, OS_LOG_TYPE_ERROR)) {
    -[DSCompletedController findMyAccessoryManager:didFetchStatusOfUTEnablementRequirementsWithStatus:withError:]();
  }
  objc_super v11 = DSLogAdditionalSharing;
  if (os_log_type_enabled((os_log_t)DSLogAdditionalSharing, OS_LOG_TYPE_INFO))
  {
    int v14 = 138543362;
    id v15 = v9;
    _os_log_impl(&dword_235BFC000, v11, OS_LOG_TYPE_INFO, "Got UT EnablementStatus %{public}@", (uint8_t *)&v14, 0xCu);
  }
  objc_super v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F00AE8]];
  -[DSCompletedController setUTAlertsEnabled:](self, "setUTAlertsEnabled:", [v12 unsignedIntegerValue] == 1);

  v13 = [(DSCompletedController *)self fetchingGroup];
  dispatch_group_leave(v13);
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FAFamilyMember)familyMember
{
  return (FAFamilyMember *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setFamilyMember:(id)a3
{
}

- (BOOL)walletSharing
{
  return self->_walletSharing;
}

- (void)setWalletSharing:(BOOL)a3
{
  self->_walletSharing = a3;
}

- (BOOL)UTAlertsEnabled
{
  return self->_UTAlertsEnabled;
}

- (void)setUTAlertsEnabled:(BOOL)a3
{
  self->_UTAlertsEnabled = a3;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (OS_dispatch_group)fetchingGroup
{
  return self->_fetchingGroup;
}

- (void)setFetchingGroup:(id)a3
{
}

- (CLFindMyAccessoryManager)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_storeStrong((id *)&self->_fetchingGroup, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Failed to fetch FamilyCircle because %{public}@", v2, v3, v4, v5, v6);
}

void __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_403_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Failed to fetch wallet sharing because %{public}@", v2, v3, v4, v5, v6);
}

- (void)findMyAccessoryManager:didFetchStatusOfUTEnablementRequirementsWithStatus:withError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Failed to fetch status of UT enablement because %{public}@", v2, v3, v4, v5, v6);
}

@end