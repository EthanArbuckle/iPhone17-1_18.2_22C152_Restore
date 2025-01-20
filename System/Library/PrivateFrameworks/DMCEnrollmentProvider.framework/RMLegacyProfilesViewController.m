@interface RMLegacyProfilesViewController
- (RMLegacyProfilesViewController)init;
- (id)_processUserInfoDictionary;
- (void)viewDidLoad;
@end

@implementation RMLegacyProfilesViewController

- (RMLegacyProfilesViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6.receiver = self;
  v6.super_class = (Class)RMLegacyProfilesViewController;
  v4 = [(RMLegacyProfilesViewController *)&v6 initWithNibName:0 bundle:v3];

  return v4;
}

- (void)viewDidLoad
{
  v3 = [(RMLegacyProfilesViewController *)self _processUserInfoDictionary];
  v20.receiver = self;
  v20.super_class = (Class)RMLegacyProfilesViewController;
  [(RMLegacyProfilesViewController *)&v20 viewDidLoad];
  v4 = [MEMORY[0x263F53C50] sharedConnection];
  v5 = [v3 profileIdentifier];
  objc_super v6 = [v4 installedProfileWithIdentifier:v5];

  v7 = [[DMCProfileViewController alloc] initWithProfile:v6 viewMode:0];
  [(RMLegacyProfilesViewController *)self addChildViewController:v7];
  v8 = [(RMLegacyProfilesViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(DMCProfileViewController *)v7 view];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = [(RMLegacyProfilesViewController *)self view];
  v19 = [(DMCProfileViewController *)v7 view];
  [v18 addSubview:v19];

  [(DMCProfileViewController *)v7 didMoveToParentViewController:self];
}

- (id)_processUserInfoDictionary
{
  v2 = [*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"RMConfigurationViewModelKey"];

  return v3;
}

@end