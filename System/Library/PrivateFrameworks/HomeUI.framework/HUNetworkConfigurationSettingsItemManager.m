@interface HUNetworkConfigurationSettingsItemManager
- (HFNetworkConfigurationGroupItem)sourceNetworkConfigurationGroupItem;
- (HUNetworkConfigurationSettingsItemManager)initWithDelegate:(id)a3;
- (HUNetworkConfigurationSettingsItemManager)initWithDelegate:(id)a3 networkConfigurationGroupItem:(id)a4;
- (HUNetworkConfigurationSettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUNetworkConfigurationSettingsModule)networkConfigurationSettingsModule;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)setNetworkConfigurationSettingsModule:(id)a3;
@end

@implementation HUNetworkConfigurationSettingsItemManager

- (HUNetworkConfigurationSettingsItemManager)initWithDelegate:(id)a3 networkConfigurationGroupItem:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUNetworkConfigurationSettingsItemManager;
  return [(HFItemManager *)&v5 initWithDelegate:a3 sourceItem:a4];
}

- (HUNetworkConfigurationSettingsItemManager)initWithDelegate:(id)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithDelegate_networkConfigurationGroupItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkConfigurationSettingsItemManager.m", 30, @"%s is unavailable; use %@ instead",
    "-[HUNetworkConfigurationSettingsItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUNetworkConfigurationSettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_networkConfigurationGroupItem_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkConfigurationSettingsItemManager.m", 35, @"%s is unavailable; use %@ instead",
    "-[HUNetworkConfigurationSettingsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (id)_buildItemModulesForHome:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = [HUNetworkConfigurationSettingsModule alloc];
  objc_super v5 = [(HUNetworkConfigurationSettingsItemManager *)self sourceNetworkConfigurationGroupItem];
  v6 = [v5 group];
  v7 = [(HUNetworkConfigurationSettingsModule *)v4 initWithItemUpdater:self group:v6];
  [(HUNetworkConfigurationSettingsItemManager *)self setNetworkConfigurationSettingsModule:v7];

  v8 = [(HUNetworkConfigurationSettingsItemManager *)self networkConfigurationSettingsModule];
  v11[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  v6 = [(HUNetworkConfigurationSettingsItemManager *)self networkConfigurationSettingsModule];
  v7 = [v6 buildSectionsWithDisplayedItems:v4];

  [v5 addObjectsFromArray:v7];
  v8 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v8;
}

- (HFNetworkConfigurationGroupItem)sourceNetworkConfigurationGroupItem
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(HFItemManager *)self sourceItem];
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v5 = v4;
    }
    else {
      objc_super v5 = 0;
    }
    v6 = v4;
    if (v5) {
      goto LABEL_8;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
  }
  v6 = 0;
LABEL_8:

  return (HFNetworkConfigurationGroupItem *)v6;
}

- (HUNetworkConfigurationSettingsModule)networkConfigurationSettingsModule
{
  return self->_networkConfigurationSettingsModule;
}

- (void)setNetworkConfigurationSettingsModule:(id)a3
{
}

- (void).cxx_destruct
{
}

@end