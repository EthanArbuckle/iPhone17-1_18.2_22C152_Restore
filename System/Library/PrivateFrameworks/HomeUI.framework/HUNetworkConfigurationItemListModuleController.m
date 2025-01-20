@interface HUNetworkConfigurationItemListModuleController
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUNetworkConfigurationItemListModuleController)initWithModule:(id)a3;
- (HUNetworkConfigurationItemListModuleController)initWithModule:(id)a3 style:(unint64_t)a4;
- (id)_viewControllerToPresentForNetworkConfigurationGroupItem:(id)a3;
- (id)presentNetworkConfigurationSettingsForItem:(id)a3 animated:(BOOL)a4;
- (unint64_t)didSelectItem:(id)a3;
- (unint64_t)style;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUNetworkConfigurationItemListModuleController

- (HUNetworkConfigurationItemListModuleController)initWithModule:(id)a3 style:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HUNetworkConfigurationItemListModuleController;
  result = [(HUItemModuleController *)&v6 initWithModule:a3];
  if (result) {
    result->_style = a4;
  }
  return result;
}

- (HUNetworkConfigurationItemListModuleController)initWithModule:(id)a3
{
  return [(HUNetworkConfigurationItemListModuleController *)self initWithModule:a3 style:0];
}

- (id)presentNetworkConfigurationSettingsForItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(HUItemModuleController *)self module];
  int v8 = [v7 isItemNetworkConfigurationGroupItem:v6];

  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    id v10 = (id)[v6 copy];
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
      v12 = v10;
      if (v11) {
        goto LABEL_9;
      }
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v9, objc_opt_class() file lineNumber description];
    }
    v12 = 0;
LABEL_9:

    v15 = [(HUNetworkConfigurationItemListModuleController *)self _viewControllerToPresentForNetworkConfigurationGroupItem:v12];
    v16 = +[HUViewControllerPresentationRequest requestWithViewController:v15];

    [v16 setPreferredPresentationType:1];
    [v16 setAnimated:v4];
    v17 = [(HUItemModuleController *)self host];
    v18 = [v17 moduleController:self presentViewControllerForRequest:v16];

    goto LABEL_11;
  }
  v18 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_11:

  return v18;
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  int v6 = [v5 isItemNetworkConfigurationGroupItem:v4];

  if (v6)
  {
    v7 = objc_opt_class();
  }
  else
  {
    v7 = 0;
  }

  return (Class)v7;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HUNetworkConfigurationItemListModuleController;
  id v7 = a4;
  [(HUItemModuleController *)&v17 setupCell:v6 forItem:v7];
  int v8 = [(HUItemModuleController *)self module];
  int v9 = [v8 isItemNetworkConfigurationGroupItem:v7];

  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v6;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
      v13 = v11;
      if (v12) {
        goto LABEL_9;
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v14 handleFailureInFunction:v15, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v10, objc_opt_class(), v17.receiver, v17.super_class file lineNumber description];
    }
    v13 = 0;
LABEL_9:

    [v13 setAccessoryType:1];
    v16 = +[HUIconCellContentMetrics compactMetrics];
    [v13 setContentMetrics:v16];

    [v13 setHideIcon:1];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HUNetworkConfigurationItemListModuleController;
  [(HUItemModuleController *)&v27 updateCell:v8 forItem:v9 animated:v5];
  uint64_t v10 = [(HUItemModuleController *)self module];
  LODWORD(self) = [v10 isItemNetworkConfigurationGroupItem:v9];

  if (!self) {
    goto LABEL_20;
  }
  uint64_t v11 = objc_opt_class();
  id v12 = v8;
  if (!v12) {
    goto LABEL_8;
  }
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  v14 = v12;
  if (!v13)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v15 handleFailureInFunction:v16, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];

LABEL_8:
    v14 = 0;
  }

  uint64_t v17 = objc_opt_class();
  id v18 = v9;
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    v20 = v18;
    if (v19) {
      goto LABEL_16;
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v21 handleFailureInFunction:v22, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v17, objc_opt_class() file lineNumber description];
  }
  v20 = 0;
LABEL_16:

  v23 = [v20 latestResults];
  v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68B90]];
  if ([v24 BOOLValue])
  {
    [v14 setDisabled:1];
  }
  else
  {
    v25 = [v20 latestResults];
    v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F68BA8]];
    objc_msgSend(v14, "setDisabled:", objc_msgSend(v26, "BOOLValue"));
  }
LABEL_20:
}

- (BOOL)canSelectItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUItemModuleController *)self module];
  char v6 = [v5 isItemNetworkConfigurationGroupItem:v4];

  return v6;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUItemModuleController *)self module];
  int v6 = [v5 isItemNetworkConfigurationGroupItem:v4];

  if (v6) {
    id v7 = [(HUNetworkConfigurationItemListModuleController *)self presentNetworkConfigurationSettingsForItem:v4 animated:1];
  }

  return 0;
}

- (id)_viewControllerToPresentForNetworkConfigurationGroupItem:(id)a3
{
  id v4 = a3;
  if ([(HUNetworkConfigurationItemListModuleController *)self style]) {
    NSLog(&cfstr_InvalidStyleLu.isa, [(HUNetworkConfigurationItemListModuleController *)self style]);
  }
  else {
    self = [[HUNetworkConfigurationSettingsViewController alloc] initWithNetworkConfigurationGroupItem:v4];
  }

  return self;
}

- (unint64_t)style
{
  return self->_style;
}

@end