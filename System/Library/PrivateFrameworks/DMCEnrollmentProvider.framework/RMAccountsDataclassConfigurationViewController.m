@interface RMAccountsDataclassConfigurationViewController
- (Class)accountInfoControllerClass;
- (id)messageForAccountDeletionWarning;
- (id)specifiers;
- (id)titleForDeleteButton;
- (void)_reloadSpecifiersAndDeleteAccountButton;
- (void)viewDidLoad;
@end

@implementation RMAccountsDataclassConfigurationViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RMAccountsDataclassConfigurationViewController;
  [(ACUIDataclassConfigurationViewController *)&v3 viewDidLoad];
  if ([(ACUIDataclassConfigurationViewController *)self shouldShowDeleteAccountButton]) {
    [(ACUIDataclassConfigurationViewController *)self appendDeleteAccountButton];
  }
}

- (void)_reloadSpecifiersAndDeleteAccountButton
{
  [(RMAccountsDataclassConfigurationViewController *)self reloadSpecifiers];
  if ([(ACUIDataclassConfigurationViewController *)self shouldShowDeleteAccountButton])
  {
    [(ACUIDataclassConfigurationViewController *)self appendDeleteAccountButton];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(ACUIDataclassConfigurationViewController *)self specifierForAccountSummaryCell];
    v6 = (void *)MEMORY[0x263F5FC40];
    v7 = DMCLocalizedString();
    v8 = [v6 groupSpecifierWithName:v7];

    v9 = [(RMAccountsDataclassConfigurationViewController *)self specifier];
    v10 = [v9 propertyForKey:*MEMORY[0x263F23108]];

    v11 = [MEMORY[0x263EFF980] arrayWithCapacity:8];
    [v11 addObject:v5];
    if ([v10 count])
    {
      [v11 addObject:v8];
      [v11 addObjectsFromArray:v10];
    }
    v12 = (objc_class *)[v11 copy];
    v13 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v12;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)titleForDeleteButton
{
  return (id)DMCLocalizedString();
}

- (id)messageForAccountDeletionWarning
{
  return (id)DMCLocalizedStringByDevice();
}

- (Class)accountInfoControllerClass
{
  return (Class)objc_opt_class();
}

@end