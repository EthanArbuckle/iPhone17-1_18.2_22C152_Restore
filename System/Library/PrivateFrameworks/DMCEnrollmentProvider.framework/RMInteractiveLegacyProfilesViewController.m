@interface RMInteractiveLegacyProfilesViewController
- (RMConfigurationsDataProvider)rmDataProvider;
- (RMUIProfileViewModel)profileModel;
- (id)_isActivatedProfile:(id)a3;
- (id)_specifiersForProfile;
- (id)specifiers;
- (void)_activateProfile:(id)a3 specifier:(id)a4;
- (void)_presentAlertForErrorModel:(id)a3;
- (void)_processUserInfoDictionary;
- (void)setProfileModel:(id)a3;
- (void)setRmDataProvider:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RMInteractiveLegacyProfilesViewController

- (void)viewDidLoad
{
  [(RMInteractiveLegacyProfilesViewController *)self _processUserInfoDictionary];
  v5.receiver = self;
  v5.super_class = (Class)RMInteractiveLegacyProfilesViewController;
  [(RMInteractiveLegacyProfilesViewController *)&v5 viewDidLoad];
  v3 = [(RMInteractiveLegacyProfilesViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0];

  v4 = [(RMInteractiveLegacyProfilesViewController *)self navigationItem];
  [v4 setRightBarButtonItem:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RMInteractiveLegacyProfilesViewController;
  [(RMInteractiveLegacyProfilesViewController *)&v4 viewWillAppear:a3];
  if (([(RMInteractiveLegacyProfilesViewController *)self isMovingToParentViewController] & 1) == 0)[(RMInteractiveLegacyProfilesViewController *)self reloadSpecifiers]; {
}
  }

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = [(RMInteractiveLegacyProfilesViewController *)self _specifiersForProfile];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_processUserInfoDictionary
{
  id v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  uint64_t v3 = [v5 objectForKeyedSubscript:@"RMConfigurationViewModelKey"];
  [(RMInteractiveLegacyProfilesViewController *)self setProfileModel:v3];

  objc_super v4 = [v5 objectForKeyedSubscript:@"RMConfigurationDataProviderKey"];
  [(RMInteractiveLegacyProfilesViewController *)self setRmDataProvider:v4];
}

- (id)_specifiersForProfile
{
  v21[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  objc_super v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = [(RMInteractiveLegacyProfilesViewController *)self profileModel];
  v6 = [v5 title];
  v7 = [v4 preferenceSpecifierNamed:v6 target:self set:sel__activateProfile_specifier_ get:sel__isActivatedProfile_ detail:0 cell:6 edit:0];

  [v3 addObject:v7];
  v8 = [(RMInteractiveLegacyProfilesViewController *)self profileModel];
  v9 = [v8 toggleViewModel];
  LODWORD(v6) = [v9 toggleState];

  v10 = (void *)MEMORY[0x263F5FC40];
  if (v6)
  {
    v11 = [(RMInteractiveLegacyProfilesViewController *)self profileModel];
    v12 = [v11 interactiveDetailsText];
    v13 = [v10 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    v20 = @"RMConfigurationViewModelKey";
    v14 = [(RMInteractiveLegacyProfilesViewController *)self profileModel];
    v21[0] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    [v13 setUserInfo:v15];
  }
  else
  {
    v16 = objc_opt_new();
    v17 = [v16 UUIDString];
    v13 = [v10 groupSpecifierWithID:v17];

    v14 = [(RMInteractiveLegacyProfilesViewController *)self profileModel];
    v15 = [v14 footerViewModel];
    v18 = [v15 title];
    [v13 setObject:v18 forKeyedSubscript:*MEMORY[0x263F600F8]];
  }
  [v3 addObject:v13];

  return v3;
}

- (id)_isActivatedProfile:(id)a3
{
  uint64_t v3 = NSNumber;
  objc_super v4 = [(RMInteractiveLegacyProfilesViewController *)self profileModel];
  id v5 = [v4 toggleViewModel];
  v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "toggleState"));

  return v6;
}

- (void)_activateProfile:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  v9 = [(RMInteractiveLegacyProfilesViewController *)self navigationItem];
  [v8 startAnimatingInNavItem:v9 forIdentifier:@"com.apple.RemoteManagement.InteractiveLegacyProfilesViewController"];

  objc_initWeak(&location, self);
  v10 = [(RMInteractiveLegacyProfilesViewController *)self rmDataProvider];
  uint64_t v11 = [v6 BOOLValue];
  v12 = [(RMInteractiveLegacyProfilesViewController *)self profileModel];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__RMInteractiveLegacyProfilesViewController__activateProfile_specifier___block_invoke;
  v13[3] = &unk_2645E9B98;
  objc_copyWeak(&v14, &location);
  [v10 setConfigurationActivated:v11 forViewModel:v12 completionHandler:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __72__RMInteractiveLegacyProfilesViewController__activateProfile_specifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_super v4 = [MEMORY[0x263F5FBF8] sharedSpinnerManager];
  [v4 stopAnimatingForIdentifier:@"com.apple.RemoteManagement.InteractiveLegacyProfilesViewController"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6) {
      [WeakRetained _presentAlertForErrorModel:v6];
    }
    [WeakRetained reloadSpecifiers];
  }
}

- (void)_presentAlertForErrorModel:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x263F1C3F8];
  id v5 = a3;
  id v6 = [v5 title];
  id v7 = [v5 message];
  id v11 = [v4 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  v8 = (void *)MEMORY[0x263F1C3F0];
  v9 = [v5 okText];

  v10 = [v8 actionWithTitle:v9 style:0 handler:0];
  [v11 addAction:v10];

  [(RMInteractiveLegacyProfilesViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (RMUIProfileViewModel)profileModel
{
  return self->_profileModel;
}

- (void)setProfileModel:(id)a3
{
}

- (RMConfigurationsDataProvider)rmDataProvider
{
  return self->_rmDataProvider;
}

- (void)setRmDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmDataProvider, 0);
  objc_storeStrong((id *)&self->_profileModel, 0);
}

@end