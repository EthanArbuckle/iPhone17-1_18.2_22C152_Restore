@interface HUAccessorySettingsItemManager
- (HFAccessorySettingGroupItem)groupItem;
- (HUAccessorySettingsItemManager)initWithDelegate:(id)a3 accessoryGroupItem:(id)a4;
- (HUAccessorySettingsItemModule)accessorySettingsSectionItemModule;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)setAccessorySettingsSectionItemModule:(id)a3;
- (void)setGroupItem:(id)a3;
@end

@implementation HUAccessorySettingsItemManager

- (HUAccessorySettingsItemManager)initWithDelegate:(id)a3 accessoryGroupItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[v6 copy];
  v17.receiver = self;
  v17.super_class = (Class)HUAccessorySettingsItemManager;
  v9 = [(HFItemManager *)&v17 initWithDelegate:v7 sourceItem:v8];

  if (v9)
  {
    uint64_t v10 = [v6 copy];
    groupItem = v9->_groupItem;
    v9->_groupItem = (HFAccessorySettingGroupItem *)v10;

    v12 = [HUAccessorySettingsItemModule alloc];
    v13 = [(HUAccessorySettingsItemManager *)v9 groupItem];
    uint64_t v14 = [(HUAccessorySettingsItemModule *)v12 initWithItemUpdater:v9 settingGroupItem:v13 usageOptions:0];
    accessorySettingsSectionItemModule = v9->_accessorySettingsSectionItemModule;
    v9->_accessorySettingsSectionItemModule = (HUAccessorySettingsItemModule *)v14;
  }
  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v3 = [(HUAccessorySettingsItemManager *)self accessorySettingsSectionItemModule];
  v4 = [v3 itemProviders];
  v5 = [v4 allObjects];

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(HUAccessorySettingsItemManager *)self accessorySettingsSectionItemModule];
    id v6 = [v5 buildSectionsWithDisplayedItems:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)_itemsToHideInSet:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUAccessorySettingsItemManager;
  v3 = [(HFItemManager *)&v6 _itemsToHideInSet:a3];
  id v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUAccessorySettingsItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  v3 = [(HUAccessorySettingsItemManager *)self accessorySettingsSectionItemModule];
  [v3 registerForExternalUpdates];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUAccessorySettingsItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  v3 = [(HUAccessorySettingsItemManager *)self accessorySettingsSectionItemModule];
  [v3 unregisterForExternalUpdates];
}

- (HFAccessorySettingGroupItem)groupItem
{
  return self->_groupItem;
}

- (void)setGroupItem:(id)a3
{
}

- (HUAccessorySettingsItemModule)accessorySettingsSectionItemModule
{
  return self->_accessorySettingsSectionItemModule;
}

- (void)setAccessorySettingsSectionItemModule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySettingsSectionItemModule, 0);

  objc_storeStrong((id *)&self->_groupItem, 0);
}

@end