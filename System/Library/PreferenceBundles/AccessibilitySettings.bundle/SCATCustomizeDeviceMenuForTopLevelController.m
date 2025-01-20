@interface SCATCustomizeDeviceMenuForTopLevelController
- (id)nameForHideToggle;
- (id)nameForShowToggle;
- (id)originalItemsFromPreference;
- (void)updateItemsInPreferences:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCATCustomizeDeviceMenuForTopLevelController

- (id)nameForShowToggle
{
  return (id)AXParameterizedLocalizedString();
}

- (id)nameForHideToggle
{
  return (id)AXParameterizedLocalizedString();
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SCATCustomizeDeviceMenuForTopLevelController;
  [(AXReorderableCheckmarkListController *)&v4 viewDidLoad];
  [(AXReorderableCheckmarkListController *)self clearItemCache];
  v3 = [(SCATCustomizeDeviceMenuForTopLevelController *)self table];
  [v3 setEditing:0 animated:0];
}

- (id)originalItemsFromPreference
{
  v2 = +[AXSettings sharedInstance];
  v3 = [v2 switchControlDeviceTopLevelMenuItems];

  return v3;
}

- (void)updateItemsInPreferences:(id)a3
{
  id v4 = a3;
  [(SCATCustomizeMenuBaseController *)self updateElementsInTopLevelWithItems:v4];
  id v5 = +[AXSettings sharedInstance];
  [v5 setSwitchControlDeviceTopLevelMenuItems:v4];
}

@end