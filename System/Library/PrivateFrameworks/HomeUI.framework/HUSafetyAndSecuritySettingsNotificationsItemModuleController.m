@interface HUSafetyAndSecuritySettingsNotificationsItemModuleController
- (Class)cellClassForItem:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
@end

@implementation HUSafetyAndSecuritySettingsNotificationsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUSafetyAndSecuritySettingsNotificationsItemModuleController;
  [(HUItemModuleController *)&v8 setupCell:v6 forItem:a4];
  id v7 = v6;
  [v7 setAccessoryView:0];
  [v7 setAccessoryType:1];
  [v7 setHideIcon:1];
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  id v8 = v4;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  objc_opt_class();
  v11 = [v10 sourceItem];

  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    v14 = [HUStatusAndNotificationsViewController alloc];
    v15 = [v7 home];
    v16 = [(HUStatusAndNotificationsViewController *)v14 initWithServiceItem:v13 inHome:v15 displayingDetails:0];

    v17 = +[HUViewControllerPresentationRequest requestWithViewController:v16];
    unint64_t v18 = 1;
    [v17 setAnimated:1];
    [v17 setPreferredPresentationType:1];
    v19 = [(HUItemModuleController *)self host];
    id v20 = (id)[v19 moduleController:self presentViewControllerForRequest:v17];
  }
  else
  {
    unint64_t v18 = 0;
  }

  return v18;
}

@end