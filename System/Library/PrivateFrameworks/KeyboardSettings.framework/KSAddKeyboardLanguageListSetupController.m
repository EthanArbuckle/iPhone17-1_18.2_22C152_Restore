@interface KSAddKeyboardLanguageListSetupController
- (void)setupController;
@end

@implementation KSAddKeyboardLanguageListSetupController

- (void)setupController
{
  id v3 = objc_alloc_init(MEMORY[0x263F5FC40]);
  v4 = objc_alloc_init(KSAddKeyboardLanguageListController);
  [(KSAddKeyboardLanguageListController *)v4 setRootController:self];
  [(KSAddKeyboardLanguageListController *)v4 setSpecifier:v3];
  [(KSAddKeyboardLanguageListController *)v4 setParentController:self];
  [(PSRootController *)self showController:v4];
}

@end