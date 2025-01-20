@interface HFAccessorySettingOptionItem
- (HFAccessorySettingOptionItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5 optionItem:(id)a6;
- (HMAccessorySelectionSettingItem)optionItem;
- (NSDictionary)usageOptions;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)settingKeyPath;
- (id)toggleSelection;
- (void)_decorateOutcomeWithDependencies:(id)a3;
- (void)setOptionItem:(id)a3;
- (void)setUsageOptions:(id)a3;
@end

@implementation HFAccessorySettingOptionItem

- (HFAccessorySettingOptionItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5 optionItem:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HFAccessorySettingOptionItem.m", 30, @"Invalid parameter not satisfying: %@", @"optionItem" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)HFAccessorySettingOptionItem;
  v15 = [(HFAccessorySettingItem *)&v19 initWithHomeKitSettingsVendor:v11 usageOptions:v12 setting:v13];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_optionItem, a6);
    objc_storeStrong((id *)&v16->_usageOptions, a4);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  v6 = [(HFAccessorySettingOptionItem *)self usageOptions];
  v7 = [(HFAccessorySettingItem *)self setting];
  v8 = [(HFAccessorySettingOptionItem *)self optionItem];
  v9 = (void *)[v4 initWithHomeKitSettingsVendor:v5 usageOptions:v6 setting:v7 optionItem:v8];

  [v9 copyLatestResultsFromItem:self];
  return v9;
}

- (id)toggleSelection
{
  v3 = [(HFAccessorySettingOptionItem *)self optionItem];
  v4 = [(HFAccessorySettingItem *)self updateValue:v3];

  return v4;
}

- (id)settingKeyPath
{
  v3 = NSString;
  v4 = [(HFAccessorySettingItem *)self setting];
  v5 = [v4 keyPath];
  v6 = [(HFAccessorySettingOptionItem *)self optionItem];
  v7 = [v6 title];
  v8 = [v3 stringWithFormat:@"%@.%@", v5, v7];

  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  v6 = objc_msgSend(v5, "hf_settingsValueManager");

  v14.receiver = self;
  v14.super_class = (Class)HFAccessorySettingOptionItem;
  v7 = [(HFAccessorySettingItem *)&v14 _subclass_updateWithOptions:v4];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__HFAccessorySettingOptionItem__subclass_updateWithOptions___block_invoke;
  v11[3] = &unk_26408DC58;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v12 = v8;
  v9 = [v7 flatMap:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

id __60__HFAccessorySettingOptionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)[v4 mutableCopy];

  v7 = [WeakRetained setting];
  objc_opt_class();
  id v8 = [*(id *)(a1 + 32) valueForSetting:v7];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  id v11 = [v10 identifier];
  id v12 = [WeakRetained optionItem];
  id v13 = [v12 identifier];
  int v14 = [v11 isEqual:v13];

  if (v14) {
    uint64_t v15 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v15 = MEMORY[0x263EFFA80];
  }
  [v6 setObject:v15 forKeyedSubscript:@"selected"];
  [v6 setObject:&unk_26C0F5F40 forKeyedSubscript:@"HFAccessorySettingInterfaceModalityKey"];
  v16 = [WeakRetained optionItem];
  [v6 setObject:v16 forKeyedSubscript:@"AccessorySettingOptionItemValue"];

  v17 = [WeakRetained entity];
  v18 = [v17 overrideLocalizedTitleKey];

  if (v18)
  {
    objc_super v19 = [WeakRetained entity];
    v20 = [v19 overrideLocalizedTitleKey];
    v21 = _HFLocalizedStringWithDefaultValue(v20, v20, 1);
    [v6 setObject:v21 forKeyedSubscript:@"title"];
  }
  else
  {
    objc_super v19 = [WeakRetained settingKeyPath];
    v20 = _HFLocalizedStringWithDefaultValue(v19, 0, 0);
    [v6 setObject:v20 forKeyedSubscript:@"title"];
  }

  [WeakRetained _decorateOutcomeWithDependencies:v6];
  v22 = [MEMORY[0x263F58190] futureWithResult:v6];

  return v22;
}

- (void)_decorateOutcomeWithDependencies:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v6 = [(HFAccessorySettingItem *)self setting];
  v7 = [v6 keyPath];
  id v8 = [v4 setWithObject:v7];
  [v5 setObject:v8 forKeyedSubscript:@"HFResultSettingKeyPathsDependenciesKey"];

  v9 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  id v10 = [v9 homekitObjectIdentifiers];
  [v5 setObject:v10 forKeyedSubscript:@"HFResultSettingParentIdentifiersDependenciesKey"];

  id v11 = (void *)MEMORY[0x263EFFA08];
  id v13 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  id v12 = [v11 setWithObject:v13];
  [v5 setObject:v12 forKeyedSubscript:@"dependentHomeKitObjects"];
}

- (HMAccessorySelectionSettingItem)optionItem
{
  return self->_optionItem;
}

- (void)setOptionItem:(id)a3
{
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_optionItem, 0);
}

@end