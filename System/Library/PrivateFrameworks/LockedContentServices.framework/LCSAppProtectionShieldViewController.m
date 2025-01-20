@interface LCSAppProtectionShieldViewController
- (APBaseExtensionShieldView)shieldView;
- (BOOL)_canShowWhileLocked;
- (LCSAppProtectionShieldViewController)initWithAssistant:(id)a3;
- (LCSExtensionAppProtectionAssistant)assistant;
- (void)setAssistant:(id)a3;
- (void)setShieldView:(id)a3;
- (void)shieldViewUnlockButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation LCSAppProtectionShieldViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (LCSAppProtectionShieldViewController)initWithAssistant:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCSAppProtectionShieldViewController;
  v6 = [(LCSAppProtectionShieldViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assistant, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)LCSAppProtectionShieldViewController;
  [(LCSAppProtectionShieldViewController *)&v11 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F25230]);
  v4 = [(LCSExtensionAppProtectionAssistant *)self->_assistant extension];
  id v5 = [v4 localizedDisplayName];
  v6 = [(LCSExtensionAppProtectionAssistant *)self->_assistant applicationIconImage];
  v7 = (void *)[v3 initWithLocalizedApplicationName:v5 iconImage:v6];

  v8 = [(LCSAppProtectionShieldViewController *)self view];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");

  [v7 setAutoresizingMask:18];
  [v7 setDelegate:self];
  objc_super v9 = [(LCSAppProtectionShieldViewController *)self view];
  [v9 addSubview:v7];

  shieldView = self->_shieldView;
  self->_shieldView = (APBaseExtensionShieldView *)v7;
}

- (void)shieldViewUnlockButtonPressed:(id)a3
{
}

- (LCSExtensionAppProtectionAssistant)assistant
{
  return self->_assistant;
}

- (void)setAssistant:(id)a3
{
}

- (APBaseExtensionShieldView)shieldView
{
  return self->_shieldView;
}

- (void)setShieldView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldView, 0);
  objc_storeStrong((id *)&self->_assistant, 0);
}

@end