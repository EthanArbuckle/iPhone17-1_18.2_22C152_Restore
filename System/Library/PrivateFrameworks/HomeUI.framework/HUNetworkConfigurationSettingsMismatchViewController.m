@interface HUNetworkConfigurationSettingsMismatchViewController
- (HUNetworkConfigurationSettingsMismatchViewController)initWithProfiles:(id)a3;
- (void)_donePressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUNetworkConfigurationSettingsMismatchViewController

- (HUNetworkConfigurationSettingsMismatchViewController)initWithProfiles:(id)a3
{
  id v4 = a3;
  v5 = _HULocalizedStringWithDefaultValue(@"HUNetworkConfigurationSettingsMismatchTitle", @"HUNetworkConfigurationSettingsMismatchTitle", 1);
  v6 = _HULocalizedStringWithDefaultValue(@"HUNetworkConfigurationSettingsMismatchDescription", @"HUNetworkConfigurationSettingsMismatchDescription", 1);
  v7 = [[HUNetworkConfigurationMismatchViewController alloc] initWithProfiles:v4];

  v10.receiver = self;
  v10.super_class = (Class)HUNetworkConfigurationSettingsMismatchViewController;
  v8 = [(HUItemTableOBWelcomeController *)&v10 initWithTitle:v5 detailText:v6 icon:0 contentLayout:2 itemTableViewController:v7];

  return v8;
}

- (void)viewDidLoad
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUNetworkConfigurationSettingsMismatchViewController;
  [(HUItemTableOBWelcomeController *)&v7 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__donePressed_];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setHidesBackButton:1];

  v8[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [(OBBaseWelcomeController *)self navigationItem];
  [v6 setRightBarButtonItems:v5];
}

- (void)_donePressed:(id)a3
{
}

@end