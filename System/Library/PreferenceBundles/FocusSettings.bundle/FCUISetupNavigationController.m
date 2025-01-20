@interface FCUISetupNavigationController
+ (id)setupNavigationControllerForMode:(id)a3;
+ (id)setupNavigationControllerForUnknownModeWithPlaceholderModes:(id)a3 allReservedModes:(id)a4;
- (FCUISetupNavigationControllerDelegate)setupDelegate;
- (id)_listController;
- (void)createDefaultModeConfigurationForMode:(id)a3;
- (void)setSetupDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation FCUISetupNavigationController

+ (id)setupNavigationControllerForMode:(id)a3
{
  id v3 = a3;
  v4 = [FCUISetupNavigationController alloc];
  v5 = +[FCUIFocusCustomizationInvitationSwiftController welcomeControllerWithMode:v3];

  v6 = [(FCUISetupNavigationController *)v4 initWithRootViewController:v5];

  return v6;
}

+ (id)setupNavigationControllerForUnknownModeWithPlaceholderModes:(id)a3 allReservedModes:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [FCUISetupNavigationController alloc];
  v8 = +[FCUIFocusListWelcomeController welcomeControllerWithPlaceholderModes:v6 allReservedModes:v5];

  v9 = [(FCUISetupNavigationController *)v7 initWithRootViewController:v8];

  return v9;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)FCUISetupNavigationController;
  [(FCUISetupNavigationController *)&v3 viewDidLoad];
  [(FCUISetupNavigationController *)self setModalPresentationStyle:2];
}

- (void)createDefaultModeConfigurationForMode:(id)a3
{
  p_setupDelegate = &self->_setupDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_setupDelegate);
  [WeakRetained setupNavigationController:self createDefaultModeConfigurationForMode:v5];

  [(FCUISetupNavigationController *)self dismissViewControllerAnimated:1 completion:0];
}

- (id)_listController
{
  v2 = [(FCUISetupNavigationController *)self presentingViewController];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (FCUISetupNavigationControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (FCUISetupNavigationControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end