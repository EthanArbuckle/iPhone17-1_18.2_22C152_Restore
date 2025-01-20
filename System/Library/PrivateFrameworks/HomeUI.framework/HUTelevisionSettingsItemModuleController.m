@interface HUTelevisionSettingsItemModuleController
- (Class)cellClassForItem:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
@end

@implementation HUTelevisionSettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 showPowerModeSelectionItem];

  if (v6 == v4)
  {
    v7 = objc_opt_class();
  }
  else
  {
    NSLog(&cfstr_UnknownItem.isa, v4);
    v7 = 0;
  }

  return (Class)v7;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 showPowerModeSelectionItem];

  if (v6 == v4)
  {
    v7 = [(HUItemModuleController *)self module];
    id v8 = (id)[v7 showPowerModeSelection];
  }
  return 0;
}

@end