@interface HUAccessorySettingsDetailsViewController
- (HFAccessorySettingGroupItem)groupItem;
- (HFAccessorySettingItem)fileUploadItem;
- (HUAccessorySettingsDetailsViewController)initWithAccessoryGroupItem:(id)a3;
- (HUAccessorySettingsDetailsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUAccessorySettingsItemModuleController)accessorySettingsItemModuleController;
- (id)accessorySettingsItemManager;
- (id)itemModuleControllers;
- (id)moduleController:(id)a3 requestPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)moduleController:(id)a3 presentGroup:(id)a4;
- (void)setAccessorySettingsItemModuleController:(id)a3;
- (void)setFileUploadItem:(id)a3;
- (void)setGroupItem:(id)a3;
@end

@implementation HUAccessorySettingsDetailsViewController

- (HUAccessorySettingsDetailsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAccessorySettingsDetailsViewController.m", 27, @"%s is unavailable; use %@ instead",
    "-[HUAccessorySettingsDetailsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUAccessorySettingsDetailsViewController)initWithAccessoryGroupItem:(id)a3
{
  id v4 = a3;
  v5 = [[HUAccessorySettingsItemManager alloc] initWithDelegate:self accessoryGroupItem:v4];
  v10.receiver = self;
  v10.super_class = (Class)HUAccessorySettingsDetailsViewController;
  v6 = [(HUItemTableViewController *)&v10 initWithItemManager:v5 tableViewStyle:1];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    groupItem = v6->_groupItem;
    v6->_groupItem = (HFAccessorySettingGroupItem *)v7;
  }
  return v6;
}

- (id)accessorySettingsItemManager
{
  objc_opt_class();
  v3 = [(HUItemTableViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)itemModuleControllers
{
  v3 = objc_opt_new();
  id v4 = [(HUAccessorySettingsDetailsViewController *)self accessorySettingsItemModuleController];

  if (!v4)
  {
    id v5 = [HUAccessorySettingsItemModuleController alloc];
    v6 = [(HUAccessorySettingsDetailsViewController *)self accessorySettingsItemManager];
    uint64_t v7 = [v6 accessorySettingsSectionItemModule];
    v8 = [(HUAccessorySettingsItemModuleController *)v5 initWithModule:v7 delegate:self];
    [(HUAccessorySettingsDetailsViewController *)self setAccessorySettingsItemModuleController:v8];
  }
  v9 = [(HUAccessorySettingsDetailsViewController *)self accessorySettingsItemModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v9);

  return v3;
}

- (void)moduleController:(id)a3 presentGroup:(id)a4
{
  id v15 = a4;
  id v5 = [v15 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68A08];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  if (!v7)
  {

    goto LABEL_5;
  }
  v8 = (void *)v7;
  v9 = [v15 latestResults];
  objc_super v10 = [v9 objectForKeyedSubscript:v6];
  char v11 = [v10 BOOLValue];

  if ((v11 & 1) == 0)
  {
LABEL_5:
    v12 = +[HUAccessorySettingsDetailsViewControllerFactory viewControllerForGroup:v15];
    v13 = [(HUAccessorySettingsDetailsViewController *)self navigationController];
    id v14 = (id)objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v12, 1);
  }
}

- (id)moduleController:(id)a3 requestPresentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = objc_opt_new();
  v9 = [v7 popoverPresentationController];
  objc_super v10 = [(HUAccessorySettingsDetailsViewController *)self view];
  [v9 setSourceView:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__HUAccessorySettingsDetailsViewController_moduleController_requestPresentViewController_animated___block_invoke;
  v13[3] = &unk_1E6386018;
  id v11 = v8;
  id v14 = v11;
  [(HUAccessorySettingsDetailsViewController *)self presentViewController:v7 animated:v5 completion:v13];

  return v11;
}

uint64_t __99__HUAccessorySettingsDetailsViewController_moduleController_requestPresentViewController_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (HFAccessorySettingGroupItem)groupItem
{
  return self->_groupItem;
}

- (void)setGroupItem:(id)a3
{
}

- (HUAccessorySettingsItemModuleController)accessorySettingsItemModuleController
{
  return self->_accessorySettingsItemModuleController;
}

- (void)setAccessorySettingsItemModuleController:(id)a3
{
}

- (HFAccessorySettingItem)fileUploadItem
{
  return self->_fileUploadItem;
}

- (void)setFileUploadItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileUploadItem, 0);
  objc_storeStrong((id *)&self->_accessorySettingsItemModuleController, 0);

  objc_storeStrong((id *)&self->_groupItem, 0);
}

@end