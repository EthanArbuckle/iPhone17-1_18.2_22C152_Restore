@interface PerAppUISettingsViewController
- (NSString)appID;
- (id)specifiers;
- (void)setAppID:(id)a3;
- (void)setSpecifier:(id)a3;
@end

@implementation PerAppUISettingsViewController

- (id)specifiers
{
  if (!self->_helper)
  {
    v3 = (AXDisplayTextMotionSpecifiersHelper *)objc_opt_new();
    helper = self->_helper;
    self->_helper = v3;

    v5 = [(PerAppUISettingsViewController *)self appID];
    [(AXDisplayTextMotionSpecifiersHelper *)self->_helper setAppID:v5];

    [(AXDisplayTextMotionSpecifiersHelper *)self->_helper setSettingsController:self];
  }
  uint64_t v6 = OBJC_IVAR___PSListController__specifiers;
  v7 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v7)
  {
    id v8 = [objc_allocWithZone((Class)NSMutableArray) init];
    v9 = [(AXDisplayTextMotionSpecifiersHelper *)self->_helper displayTextSpecifiersIncludingSmartInvert:_AXSMossdeepEnabled() == 0 isPerApp:1];
    [v8 axSafelyAddObjectsFromArray:v9];

    if (![(NSString *)self->_appID isEqualToString:AX_LiveTranscriptionBundleName])
    {
      v10 = [(AXDisplayTextMotionSpecifiersHelper *)self->_helper motionSpecifiers];
      [v8 axSafelyAddObjectsFromArray:v10];
    }
    id v11 = [v8 copy];
    v12 = *(void **)&self->super.AXUISettingsListController_opaque[v6];
    *(void *)&self->super.AXUISettingsListController_opaque[v6] = v11;

    v7 = *(void **)&self->super.AXUISettingsListController_opaque[v6];
  }

  return v7;
}

- (void)setSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PerAppUISettingsViewController;
  id v4 = a3;
  [(PerAppUISettingsViewController *)&v7 setSpecifier:v4];
  objc_msgSend(v4, "propertyForKey:", @"BundleIdentifier", v7.receiver, v7.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  appID = self->_appID;
  self->_appID = v5;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appID, 0);

  objc_storeStrong((id *)&self->_helper, 0);
}

@end