@interface FARestorableViewController
- (BOOL)canBeShownFromSuspendedState;
- (PSRootController)rootController;
- (PSSpecifier)specifier;
- (UIViewController)parentController;
- (id)readPreferenceValue:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setParentController:(id)a3;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)showController:(id)a3;
@end

@implementation FARestorableViewController

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (PSRootController)rootController
{
  return (PSRootController *)objc_getAssociatedObject(self, sel_rootController);
}

- (void)setRootController:(id)a3
{
}

- (UIViewController)parentController
{
  return (UIViewController *)objc_getAssociatedObject(self, sel_parentController);
}

- (void)setParentController:(id)a3
{
}

- (void)setSpecifier:(id)a3
{
}

- (PSSpecifier)specifier
{
  return (PSSpecifier *)objc_getAssociatedObject(self, sel_specifier);
}

- (void)showController:(id)a3
{
}

- (id)readPreferenceValue:(id)a3
{
  return 0;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

@end