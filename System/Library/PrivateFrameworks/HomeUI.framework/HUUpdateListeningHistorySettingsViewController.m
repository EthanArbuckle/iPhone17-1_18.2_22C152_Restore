@interface HUUpdateListeningHistorySettingsViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HUUpdateListeningHistorySettingsItemModuleController)moduleController;
- (HUUpdateListeningHistorySettingsViewController)initWithUserItem:(id)a3;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)setModuleController:(id)a3;
@end

@implementation HUUpdateListeningHistorySettingsViewController

- (HUUpdateListeningHistorySettingsViewController)initWithUserItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__HUUpdateListeningHistorySettingsViewController_initWithUserItem___block_invoke;
  v14[3] = &unk_1E6385000;
  id v6 = v4;
  id v15 = v6;
  [v5 setHomeCreator:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__HUUpdateListeningHistorySettingsViewController_initWithUserItem___block_invoke_2;
  v12[3] = &unk_1E638E0A8;
  id v7 = v6;
  id v13 = v7;
  [v5 setItemModuleCreator:v12];
  v11.receiver = self;
  v11.super_class = (Class)HUUpdateListeningHistorySettingsViewController;
  v8 = [(HUItemTableViewController *)&v11 initWithItemManager:v5 tableViewStyle:1];
  if (v8)
  {
    v9 = _HULocalizedStringWithDefaultValue(@"HUUpdateListeningHistorySettingTitle", @"HUUpdateListeningHistorySettingTitle", 1);
    [(HUUpdateListeningHistorySettingsViewController *)v8 setTitle:v9];
  }
  return v8;
}

id __67__HUUpdateListeningHistorySettingsViewController_initWithUserItem___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F7A0D8];
  v2 = [*(id *)(a1 + 32) home];
  v3 = [v1 futureWithResult:v2];

  return v3;
}

id __67__HUUpdateListeningHistorySettingsViewController_initWithUserItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 arrayWithCapacity:1];
  v9 = [HUUpdateListeningHistorySettingsItemModule alloc];
  v10 = [*(id *)(a1 + 32) user];
  objc_super v11 = [(HUUpdateListeningHistorySettingsItemModule *)v9 initWithItemUpdater:v6 home:v7 user:v10];

  [v8 addObject:v11];

  return v8;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v4);
  }
  v5 = [(HUItemModuleController *)[HUUpdateListeningHistorySettingsItemModuleController alloc] initWithModule:v4];
  [(HUUpdateListeningHistorySettingsViewController *)self setModuleController:v5];

  id v6 = [(HUUpdateListeningHistorySettingsViewController *)self moduleController];

  return v6;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v21, 0x16u);
  }

  v9 = [v7 absoluteString];
  v10 = [MEMORY[0x1E4F696F8] musicPrivacyURL];
  objc_super v11 = [v10 absoluteString];
  int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = [(HUUpdateListeningHistorySettingsViewController *)self navigationController];
    v14 = (void *)v13;
    if (v13) {
      id v15 = (HUUpdateListeningHistorySettingsViewController *)v13;
    }
    else {
      id v15 = self;
    }
    v16 = v15;

    v17 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x1E4F83B10]];
    v18 = [v17 splashController];
    [v18 setDisplayDeviceType:6];

    [v17 setPresentingViewController:v16];
    [v17 present];
  }
  else
  {
    v17 = [MEMORY[0x1E4F69378] sharedInstance];
    id v19 = (id)[v17 openURL:v7];
  }

  return 0;
}

- (HUUpdateListeningHistorySettingsItemModuleController)moduleController
{
  return self->_moduleController;
}

- (void)setModuleController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end