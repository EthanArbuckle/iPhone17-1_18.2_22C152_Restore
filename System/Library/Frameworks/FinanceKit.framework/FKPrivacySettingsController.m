@interface FKPrivacySettingsController
- (FKPrivacySettingsController)initWithBundleIdentifier:(id)a3;
- (unint64_t)authorizationType;
@end

@implementation FKPrivacySettingsController

- (unint64_t)authorizationType
{
  return [(BankConnectPrivacySettingsController *)self->_wrappedController authorizationType];
}

- (FKPrivacySettingsController)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(FKPrivacySettingsController *)self init];
  if (v5)
  {
    v6 = [[_TtC10FinanceKit36BankConnectPrivacySettingsController alloc] initWithBundleID:v4];
    wrappedController = v5->_wrappedController;
    v5->_wrappedController = v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end