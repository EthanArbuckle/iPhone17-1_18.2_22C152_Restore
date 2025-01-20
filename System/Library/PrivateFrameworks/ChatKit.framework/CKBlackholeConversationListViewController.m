@interface CKBlackholeConversationListViewController
- (BOOL)canBeShownFromSuspendedState;
- (id)parentController;
- (id)readPreferenceValue:(id)a3;
- (id)rootController;
- (id)specifier;
- (void)handleURL:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setParentController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
@end

@implementation CKBlackholeConversationListViewController

- (void)setParentController:(id)a3
{
}

- (id)parentController
{
  return self->_parentController;
}

- (void)setRootController:(id)a3
{
}

- (id)rootController
{
  return self->_rootController;
}

- (void)setSpecifier:(id)a3
{
  v5 = (PSSpecifier *)a3;
  if (self->_specifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_specifier, a3);
    v5 = v6;
  }
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
}

- (id)readPreferenceValue:(id)a3
{
  return (id)[MEMORY[0x1E4F92E60] readPreferenceValue:a3];
}

- (void)showController:(id)a3
{
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
}

- (void)handleURL:(id)a3
{
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_rootController, 0);

  objc_storeStrong((id *)&self->_parentController, 0);
}

@end