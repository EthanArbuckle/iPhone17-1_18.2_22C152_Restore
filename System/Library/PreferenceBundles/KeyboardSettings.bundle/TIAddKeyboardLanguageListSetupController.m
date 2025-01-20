@interface TIAddKeyboardLanguageListSetupController
- (void)setupController;
@end

@implementation TIAddKeyboardLanguageListSetupController

- (void)setupController
{
  id v3 = objc_alloc_init(MEMORY[0x263F5FC40]);
  v4 = objc_alloc_init(TIAddKeyboardLanguageListController);
  [(TIAddKeyboardLanguageListController *)v4 setRootController:self];
  [(TIAddKeyboardLanguageListController *)v4 setSpecifier:v3];
  [(TIAddKeyboardLanguageListController *)v4 setParentController:self];

  [(PSRootController *)self showController:v4];
}

@end