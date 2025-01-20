@interface HUSafetyAndSecuritySettingsNotificationsViewController
- (HMHome)home;
- (HUSafetyAndSecuritySettingsNotificationsItemModuleController)moduleController;
- (HUSafetyAndSecuritySettingsNotificationsViewController)initWithHome:(id)a3;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)setModuleController:(id)a3;
@end

@implementation HUSafetyAndSecuritySettingsNotificationsViewController

- (HUSafetyAndSecuritySettingsNotificationsViewController)initWithHome:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HUSafetyAndSecuritySettingsNotificationsViewController.m", 24, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__HUSafetyAndSecuritySettingsNotificationsViewController_initWithHome___block_invoke;
  v13[3] = &unk_1E6385000;
  id v7 = v5;
  id v14 = v7;
  [v6 setHomeCreator:v13];
  [v6 setItemModuleCreator:&__block_literal_global_87];
  v12.receiver = self;
  v12.super_class = (Class)HUSafetyAndSecuritySettingsNotificationsViewController;
  v8 = [(HUItemTableViewController *)&v12 initWithItemManager:v6 tableViewStyle:1];
  if (v8)
  {
    v9 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecuritySettings_Notifications_Title", @"HUSafetyAndSecuritySettings_Notifications_Title", 1);
    [(HUSafetyAndSecuritySettingsNotificationsViewController *)v8 setTitle:v9];
  }
  return v8;
}

uint64_t __71__HUSafetyAndSecuritySettingsNotificationsViewController_initWithHome___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

id __71__HUSafetyAndSecuritySettingsNotificationsViewController_initWithHome___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 arrayWithCapacity:1];
  v8 = [[HUSafetyAndSecuritySettingsNotificationsItemModule alloc] initWithItemUpdater:v5 home:v6];

  [v7 addObject:v8];

  return v7;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v4);
  }
  id v5 = [(HUItemModuleController *)[HUSafetyAndSecuritySettingsNotificationsItemModuleController alloc] initWithModule:v4];
  [(HUSafetyAndSecuritySettingsNotificationsViewController *)self setModuleController:v5];

  id v6 = [(HUSafetyAndSecuritySettingsNotificationsViewController *)self moduleController];

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HUSafetyAndSecuritySettingsNotificationsItemModuleController)moduleController
{
  return self->_moduleController;
}

- (void)setModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleController, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end