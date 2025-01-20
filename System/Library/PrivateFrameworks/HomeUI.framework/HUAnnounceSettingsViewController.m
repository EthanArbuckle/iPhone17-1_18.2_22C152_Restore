@interface HUAnnounceSettingsViewController
- (HMHome)home;
- (HUAnnounceSettingsItemModuleController)moduleController;
- (HUAnnounceSettingsViewController)initWithAccessoryGroupItem:(id)a3;
- (HUAnnounceSettingsViewController)initWithAccessorySettingItem:(id)a3;
- (HUAnnounceSettingsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4;
- (HUAnnounceSettingsViewController)initWithHome:(id)a3;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)setModuleController:(id)a3;
@end

@implementation HUAnnounceSettingsViewController

- (HUAnnounceSettingsViewController)initWithAccessoryGroupItem:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAnnounceSettingsViewController.m", 25, @"%s is unavailable; use %@ instead",
    "-[HUAnnounceSettingsViewController initWithAccessoryGroupItem:]",
    v6);

  return 0;
}

- (HUAnnounceSettingsViewController)initWithAccessorySettingItem:(id)a3
{
  v4 = [a3 homeKitSettingsVendor];
  v5 = objc_msgSend(v4, "hf_home");
  v6 = [(HUAnnounceSettingsViewController *)self initWithHome:v5];

  return v6;
}

- (HUAnnounceSettingsViewController)initWithHome:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HUAnnounceSettingsViewController.m", 35, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__HUAnnounceSettingsViewController_initWithHome___block_invoke;
  v13[3] = &unk_1E6385000;
  id v7 = v5;
  id v14 = v7;
  [v6 setHomeCreator:v13];
  [v6 setItemModuleCreator:&__block_literal_global_254];
  v12.receiver = self;
  v12.super_class = (Class)HUAnnounceSettingsViewController;
  v8 = [(HUItemTableViewController *)&v12 initWithItemManager:v6 tableViewStyle:1];
  if (v8)
  {
    v9 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSettings_Title", @"HUAnnounceSettings_Title", 1);
    [(HUAnnounceSettingsViewController *)v8 setTitle:v9];
  }
  return v8;
}

uint64_t __49__HUAnnounceSettingsViewController_initWithHome___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

id __49__HUAnnounceSettingsViewController_initWithHome___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 arrayWithCapacity:1];
  v8 = [[HUAnnounceSettingsItemModule alloc] initWithItemUpdater:v5 home:v6 settingsContext:0];

  [v7 addObject:v8];

  return v7;
}

- (HUAnnounceSettingsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v5 = objc_msgSend(a4, "home", a3);
  id v6 = [(HUAnnounceSettingsViewController *)self initWithHome:v5];

  return v6;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v4);
  }
  id v5 = [(HUItemModuleController *)[HUAnnounceSettingsItemModuleController alloc] initWithModule:v4];
  [(HUAnnounceSettingsViewController *)self setModuleController:v5];

  id v6 = [(HUAnnounceSettingsViewController *)self moduleController];

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HUAnnounceSettingsItemModuleController)moduleController
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