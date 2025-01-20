@interface HUUserNotificationTopicServiceListModuleController
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (id)showNotificationSettingsForServiceLikeItem:(id)a3 animated:(BOOL)a4;
- (unint64_t)didSelectItem:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUUserNotificationTopicServiceListModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 sourceItem];
  objc_opt_class();
  objc_opt_isKindOfClass();

  v8 = objc_opt_class();

  return (Class)v8;
}

- (Class)collectionCellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v4 = a3;
  [v4 setHideIcon:1];
  [v4 setAccessoryView:0];
  [v4 setAccessoryType:1];
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUUserNotificationTopicServiceListModuleController;
  [(HUItemModuleController *)&v15 updateCell:v8 forItem:v9 animated:v5];
  v10 = [v9 latestResults];
  v11 = [v10 objectForKeyedSubscript:@"HUUserNotificationTopicSubtitleResultKey"];

  if (v11)
  {
    id v12 = v8;
    [v12 setDescriptionText:v11];
    v13 = [v9 latestResults];
    v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
    [v12 setValueText:v14];
  }
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUUserNotificationTopicServiceListModuleController;
  id v7 = a4;
  [(HUItemModuleController *)&v15 configureCell:v6 forItem:v7];
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  v11 = objc_msgSend(MEMORY[0x1E4F42B58], "valueCellConfiguration", v15.receiver, v15.super_class);
  id v12 = +[HUListContentConfigurationUtilities labelConfiguration:v11 forItem:v7];

  [v10 setContentConfiguration:v12];
  id v13 = objc_alloc_init(MEMORY[0x1E4F42830]);
  v16[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v10 setAccessories:v14];
}

- (BOOL)canSelectItem:(id)a3
{
  return 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 serviceLikeItemForItem:v4];

  if (v6) {
    id v7 = [(HUUserNotificationTopicServiceListModuleController *)self showNotificationSettingsForServiceLikeItem:v6 animated:1];
  }
  else {
    NSLog(&cfstr_MissingService.isa, v4);
  }

  return 0;
}

- (id)showNotificationSettingsForServiceLikeItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [HUStatusAndNotificationsViewController alloc];
  id v8 = [(HUItemModuleController *)self module];
  id v9 = [v8 home];
  id v10 = [(HUStatusAndNotificationsViewController *)v7 initWithServiceItem:v6 inHome:v9 displayingDetails:0];

  v11 = +[HUViewControllerPresentationRequest requestWithViewController:v10];
  [v11 setPreferredPresentationType:1];
  [v11 setAnimated:v4];
  id v12 = [(HUItemModuleController *)self host];
  id v13 = [v12 moduleController:self presentViewControllerForRequest:v11];

  return v13;
}

@end