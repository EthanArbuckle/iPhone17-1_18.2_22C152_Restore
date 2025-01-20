@interface HKHealthSyncDisplayController
- (HKCloudSyncControl)cloudSyncControl;
- (HKHealthPrivacyHostRemoteViewController)objectPickerDelegate;
- (HKHealthPrivacyServicePromptControllerDelegate)delegate;
- (HKHealthStore)healthStore;
- (HKHealthSyncDisplayController)init;
- (HKHealthSyncDisplayController)initWithHealthStore:(id)a3 source:(id)a4;
- (HKSource)source;
- (UIViewController)nextViewController;
- (id)_explanationTextForSource:(id)a3;
- (id)_headerTitleForSource:(id)a3;
- (void)_cancelButtonPressed:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_nextButtonPressed:(id)a3;
- (void)_setHeaderIcon;
- (void)_setUpFooterView;
- (void)_viewHealthRecordsCellTapped:(id)a3;
- (void)setCloudSyncControl:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNextViewController:(id)a3;
- (void)setObjectPickerDelegate:(id)a3;
- (void)setSource:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKHealthSyncDisplayController

- (HKHealthSyncDisplayController)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKHealthSyncDisplayController)initWithHealthStore:(id)a3 source:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(HKHealthSyncDisplayController *)self _headerTitleForSource:v8];
  v10 = [(HKHealthSyncDisplayController *)self _explanationTextForSource:v8];
  v16.receiver = self;
  v16.super_class = (Class)HKHealthSyncDisplayController;
  v11 = [(OBTableWelcomeController *)&v16 initWithTitle:v9 detailText:v10 icon:0 adoptTableViewScrollView:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_healthStore, a3);
    objc_storeStrong((id *)&v12->_source, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F2AD28]) initWithHealthStore:v12->_healthStore];
    cloudSyncControl = v12->_cloudSyncControl;
    v12->_cloudSyncControl = (HKCloudSyncControl *)v13;
  }
  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HKHealthSyncDisplayController;
  [(OBTableWelcomeController *)&v3 viewWillAppear:a3];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HKHealthSyncDisplayController;
  [(OBTableWelcomeController *)&v7 viewDidLoad];
  objc_super v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  uint64_t v4 = [(HKHealthSyncDisplayController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(HKHealthSyncDisplayController *)self navigationController];
  [v5 setModalInPresentation:1];

  v6 = [(HKHealthSyncDisplayController *)self headerView];
  [v6 setAllowFullWidthIcon:1];

  [(HKHealthSyncDisplayController *)self _setHeaderIcon];
  [(HKHealthSyncDisplayController *)self _setUpFooterView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HKHealthSyncDisplayController;
  [(OBBaseWelcomeController *)&v3 viewDidAppear:a3];
}

- (void)_setUpFooterView
{
  id v10 = [MEMORY[0x1E4F83A80] boldButton];
  objc_super v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v4 = [v3 localizedStringForKey:@"HEALTHKIT_AUTHORIZATION_SYNC_ENABLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v10 setTitle:v4 forState:0];

  [v10 addTarget:self action:sel__nextButtonPressed_ forControlEvents:64];
  v5 = [(HKHealthSyncDisplayController *)self buttonTray];
  [v5 addButton:v10];

  v6 = [MEMORY[0x1E4F83AB8] linkButton];
  [v6 addTarget:self action:sel__cancelButtonPressed_ forControlEvents:64];
  objc_super v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v8 = [v7 localizedStringForKey:@"HEALTHKIT_AUTHORIZATION_SYNC_DISABLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v6 setTitle:v8 forState:0];

  v9 = [(HKHealthSyncDisplayController *)self buttonTray];
  [v9 addButton:v6];
}

- (id)_explanationTextForSource:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:@"HEALTHKIT_AUTHORIZATION_SYNC_DETAIL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  objc_super v7 = NSString;
  id v8 = [v4 name];

  v9 = objc_msgSend(v7, "stringWithFormat:", v6, v8);

  return v9;
}

- (void)_setHeaderIcon
{
  v44[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:38.0];
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.icloud"];
  v42 = (void *)v3;
  uint64_t v5 = [v4 imageByApplyingSymbolConfiguration:v3];

  id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  objc_super v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v41 = (void *)v5;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v5];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v40 = v8;
  [v7 addSubview:v8];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setContentMode:1];
  v9 = [v7 layer];
  [v9 setCornerRadius:40.0];

  id v10 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  uint64_t v11 = [v10 userInterfaceStyle];

  if (v11 == 2) {
    [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  }
  else {
  v12 = [MEMORY[0x1E4FB1618] systemGray6Color];
  }
  [v7 setBackgroundColor:v12];

  uint64_t v13 = [(HKHealthSyncDisplayController *)self headerView];
  v14 = [v13 customIconContainerView];
  [v14 addSubview:v7];

  v33 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [v7 centerXAnchor];
  v39 = [(HKHealthSyncDisplayController *)self headerView];
  v37 = [v39 customIconContainerView];
  v36 = [v37 centerXAnchor];
  v35 = [v38 constraintEqualToAnchor:v36];
  v44[0] = v35;
  v32 = [v7 centerYAnchor];
  v34 = [(HKHealthSyncDisplayController *)self headerView];
  v15 = [v34 customIconContainerView];
  objc_super v16 = [v15 centerYAnchor];
  v17 = [v32 constraintEqualToAnchor:v16];
  v44[1] = v17;
  v18 = [v7 heightAnchor];
  v19 = [v18 constraintEqualToConstant:80.0];
  v44[2] = v19;
  v20 = [v7 widthAnchor];
  v21 = [v7 heightAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v44[3] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  [v33 activateConstraints:v23];

  v24 = (void *)MEMORY[0x1E4F28DC8];
  v25 = [v40 centerXAnchor];
  v26 = [v7 centerXAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v43[0] = v27;
  v28 = [v40 centerYAnchor];
  v29 = [v7 centerYAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  v43[1] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  [v24 activateConstraints:v31];
}

- (id)_headerTitleForSource:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  uint64_t v5 = [v3 bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:@"HEALTHKIT_AUTHORIZATION_SYNC_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  objc_super v7 = NSString;
  id v8 = [v4 name];

  v9 = objc_msgSend(v7, "stringWithFormat:", v6, v8);

  return v9;
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKClinicalAuthorizationYouShouldKnowViewController _finishWithError:](v5);
  }
  id v6 = [(HKHealthSyncDisplayController *)self delegate];

  if (v6)
  {
    objc_super v7 = [(HKHealthSyncDisplayController *)self delegate];
    [v7 promptControllerDidFinish:self error:v4];
  }
  else
  {
    objc_super v7 = [(HKHealthSyncDisplayController *)self objectPickerDelegate];
    [v7 didFinishWithError:v4];
  }
}

- (void)_nextButtonPressed:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Health"];
  uint64_t v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v5 openSensitiveURL:v4 withOptions:0];

  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v6, "hk_setHasCompletedThirdPartyAuthSyncWithBooleanValue:", 1);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HKHealthSyncDisplayController__nextButtonPressed___block_invoke;
  block[3] = &unk_1E6D50ED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__HKHealthSyncDisplayController__nextButtonPressed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:0];
}

- (void)_cancelButtonPressed:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", a3);
  objc_msgSend(v4, "hk_setHasCompletedThirdPartyAuthSyncWithBooleanValue:", 1);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HKHealthSyncDisplayController__cancelButtonPressed___block_invoke;
  block[3] = &unk_1E6D50ED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__HKHealthSyncDisplayController__cancelButtonPressed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:0];
}

- (void)_viewHealthRecordsCellTapped:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "_hk_urlForViewHealthRecords");
  [v4 openURL:v3 withOptions:0];
}

- (HKHealthPrivacyServicePromptControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHealthPrivacyServicePromptControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKHealthPrivacyHostRemoteViewController)objectPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectPickerDelegate);
  return (HKHealthPrivacyHostRemoteViewController *)WeakRetained;
}

- (void)setObjectPickerDelegate:(id)a3
{
}

- (UIViewController)nextViewController
{
  return self->_nextViewController;
}

- (void)setNextViewController:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (HKCloudSyncControl)cloudSyncControl
{
  return self->_cloudSyncControl;
}

- (void)setCloudSyncControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncControl, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_destroyWeak((id *)&self->_objectPickerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end