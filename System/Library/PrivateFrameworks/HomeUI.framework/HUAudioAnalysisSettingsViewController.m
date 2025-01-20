@interface HUAudioAnalysisSettingsViewController
- (HFServiceLikeItem)serviceItem;
- (HMHome)home;
- (HUAudioAnalysisSettingsItemModuleController)moduleController;
- (HUAudioAnalysisSettingsViewController)initWithAccessoryGroupItem:(id)a3;
- (HUAudioAnalysisSettingsViewController)initWithAccessorySettingItem:(id)a3;
- (HUAudioAnalysisSettingsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4;
- (HUAudioAnalysisSettingsViewController)initWithHome:(id)a3;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)setModuleController:(id)a3;
- (void)setServiceItem:(id)a3;
@end

@implementation HUAudioAnalysisSettingsViewController

- (HUAudioAnalysisSettingsViewController)initWithAccessoryGroupItem:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAudioAnalysisSettingsViewController.m", 30, @"%s is unavailable; use %@ instead",
    "-[HUAudioAnalysisSettingsViewController initWithAccessoryGroupItem:]",
    v6);

  return 0;
}

- (HUAudioAnalysisSettingsViewController)initWithAccessorySettingItem:(id)a3
{
  v4 = [a3 homeKitSettingsVendor];
  v5 = objc_msgSend(v4, "hf_home");
  v6 = [(HUAudioAnalysisSettingsViewController *)self initWithHome:v5];

  return v6;
}

- (HUAudioAnalysisSettingsViewController)initWithHome:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HUAudioAnalysisSettingsViewController.m", 40, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__HUAudioAnalysisSettingsViewController_initWithHome___block_invoke;
  v13[3] = &unk_1E6385000;
  id v7 = v5;
  id v14 = v7;
  [v6 setHomeCreator:v13];
  [v6 setItemModuleCreator:&__block_literal_global_185];
  v12.receiver = self;
  v12.super_class = (Class)HUAudioAnalysisSettingsViewController;
  v8 = [(HUItemTableViewController *)&v12 initWithItemManager:v6 tableViewStyle:1];
  if (v8)
  {
    v9 = _HULocalizedStringWithDefaultValue(@"HUListenSettings_Title", @"HUListenSettings_Title", 1);
    [(HUAudioAnalysisSettingsViewController *)v8 setTitle:v9];
  }
  return v8;
}

uint64_t __54__HUAudioAnalysisSettingsViewController_initWithHome___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

id __54__HUAudioAnalysisSettingsViewController_initWithHome___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 arrayWithCapacity:1];
  v8 = [[HUAudioAnalysisSettingsItemModule alloc] initWithItemUpdater:v5 home:v6];

  [v7 addObject:v8];

  return v7;
}

- (HUAudioAnalysisSettingsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v5 = objc_msgSend(a4, "home", a3);
  id v6 = [(HUAudioAnalysisSettingsViewController *)self initWithHome:v5];

  return v6;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v4);
  }
  id v5 = [(HUItemModuleController *)[HUAudioAnalysisSettingsItemModuleController alloc] initWithModule:v4];
  [(HUAudioAnalysisSettingsViewController *)self setModuleController:v5];

  id v6 = [(HUAudioAnalysisSettingsViewController *)self moduleController];

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeItem)serviceItem
{
  return self->_serviceItem;
}

- (void)setServiceItem:(id)a3
{
}

- (HUAudioAnalysisSettingsItemModuleController)moduleController
{
  return self->_moduleController;
}

- (void)setModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleController, 0);
  objc_storeStrong((id *)&self->_serviceItem, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end