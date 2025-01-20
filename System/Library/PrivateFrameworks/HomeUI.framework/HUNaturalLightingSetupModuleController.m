@interface HUNaturalLightingSetupModuleController
- (Class)cellClassForItem:(id)a3;
- (HUNaturalLightingSetupModuleController)initWithModule:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUNaturalLightingSetupModuleController

- (HUNaturalLightingSetupModuleController)initWithModule:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUNaturalLightingSetupModuleController;
  return [(HUItemModuleController *)&v4 initWithModule:a3];
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  [v5 toggleSelectedForItem:v4];

  return 0;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUNaturalLightingSetupModuleController;
  [(HUItemModuleController *)&v8 setupCell:v6 forItem:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    [v7 setHideValue:1];
    [v7 setHideIcon:1];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUNaturalLightingSetupModuleController;
  [(HUItemModuleController *)&v20 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    objc_opt_class();
    v11 = [v9 latestResults];
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68A60]];
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      v15 = [v14 serviceName];
      [v10 setTitleText:v15];
    }
    v16 = [v9 latestResults];
    v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
    int v18 = [v17 BOOLValue];

    if (v18) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = 0;
    }
    [v10 setAccessoryType:v19];
  }
}

@end