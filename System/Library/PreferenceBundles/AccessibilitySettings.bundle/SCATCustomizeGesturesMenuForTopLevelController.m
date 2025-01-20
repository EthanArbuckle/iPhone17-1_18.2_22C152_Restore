@interface SCATCustomizeGesturesMenuForTopLevelController
- (id)itemsFromPreferences;
- (id)nameForHideToggle;
- (id)nameForShowToggle;
- (void)updateItemsInPreferences:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCATCustomizeGesturesMenuForTopLevelController

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
  v4.super_class = (Class)SCATCustomizeGesturesMenuForTopLevelController;
  [(AXReorderableCheckmarkListController *)&v4 viewDidLoad];
  [(AXReorderableCheckmarkListController *)self clearItemCache];
  v3 = [(SCATCustomizeGesturesMenuForTopLevelController *)self table];
  [v3 setEditing:0 animated:0];
}

- (id)itemsFromPreferences
{
  v2 = +[AXSettings sharedInstance];
  v3 = [v2 switchControlGesturesTopLevelMenuItems];

  return v3;
}

- (void)updateItemsInPreferences:(id)a3
{
  id v4 = a3;
  [(SCATCustomizeMenuBaseController *)self updateElementsInTopLevelWithItems:v4];
  id v5 = +[AXSettings sharedInstance];
  [v5 setSwitchControlGesturesTopLevelMenuItems:v4];
}

@end