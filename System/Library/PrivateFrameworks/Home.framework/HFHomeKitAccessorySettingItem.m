@interface HFHomeKitAccessorySettingItem
- (BOOL)isControllable;
- (BOOL)isDisabled;
- (BOOL)updateSetting:(id)a3;
- (HFHomeKitAccessorySettingItem)initWithDefaultSetting:(id)a3 sourceItem:(id)a4 localizedTitle:(id)a5 settingsController:(id)a6 homeIdentifier:(id)a7 accessoryIdentifier:(id)a8 settingDict:(id)a9 usageOptions:(id)a10;
- (HFHomeKitAccessorySettingItem)initWithSetting:(id)a3 sourceItem:(id)a4 localizedTitle:(id)a5 settingsController:(id)a6 homeIdentifier:(id)a7 accessoryIdentifier:(id)a8 settingDict:(id)a9 usageOptions:(id)a10;
- (HFHomeKitAccessorySettingItem)initWithSettingsController:(id)a3 localizedTitle:(id)a4 homeIdentifier:(id)a5 accessoryIdentifier:(id)a6 settingDict:(id)a7 usageOptions:(id)a8;
- (HFHomeKitAccessorySettingItem)initWithSourceItem:(id)a3 localizedTitle:(id)a4 settingsController:(id)a5 homeIdentifier:(id)a6 accessoryIdentifier:(id)a7 settingDict:(id)a8 usageOptions:(id)a9;
- (HFServiceLikeItem)sourceItem;
- (HMAccessorySettingsController)settingsController;
- (HMImmutableSetting)setting;
- (NSDictionary)settingDict;
- (NSDictionary)usageOptions;
- (NSString)localizedTitle;
- (NSString)settingKeyPath;
- (NSString)targetSettingKeyPath;
- (NSUUID)accessoryIdentifier;
- (NSUUID)homeIdentifier;
- (id)_formattedValueForSetting;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)cachedSettingValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)updateValue:(id)a3;
- (int64_t)userInterfaceType;
- (unint64_t)displayIndex;
- (void)_decorateOutcomeWithResultKeys:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setCachedSettingValue:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisplayIndex:(unint64_t)a3;
- (void)setHomeIdentifier:(id)a3;
- (void)setIsControllable:(BOOL)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setSetting:(id)a3;
- (void)setSettingDict:(id)a3;
- (void)setSettingKeyPath:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)setSourceItem:(id)a3;
- (void)setUsageOptions:(id)a3;
- (void)setUserInterfaceType:(int64_t)a3;
- (void)updateSettingValue:(id)a3;
@end

@implementation HFHomeKitAccessorySettingItem

- (HFHomeKitAccessorySettingItem)initWithSettingsController:(id)a3 localizedTitle:(id)a4 homeIdentifier:(id)a5 accessoryIdentifier:(id)a6 settingDict:(id)a7 usageOptions:(id)a8
{
  id v15 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v16 = a7;
  id v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HFHomeKitAccessorySettingItem;
  v18 = [(HFHomeKitAccessorySettingItem *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_settingsController, a3);
    objc_storeStrong((id *)&v19->_localizedTitle, a4);
    objc_storeStrong((id *)&v19->_homeIdentifier, a5);
    objc_storeStrong((id *)&v19->_accessoryIdentifier, a6);
    objc_storeStrong((id *)&v19->_settingDict, a7);
    v20 = [(NSDictionary *)v19->_settingDict allKeys];
    uint64_t v21 = [v20 firstObject];
    settingKeyPath = v19->_settingKeyPath;
    v19->_settingKeyPath = (NSString *)v21;

    objc_storeStrong((id *)&v19->_usageOptions, a8);
    v23 = [(NSDictionary *)v19->_settingDict objectForKeyedSubscript:v19->_settingKeyPath];
    v24 = [v23 objectForKeyedSubscript:HFUIInterfaceTypeKey];
    if (v24)
    {
      v25 = [v23 objectForKeyedSubscript:HFUIInterfaceTypeKey];
      v19->_userInterfaceType = [v25 integerValue];
    }
    else
    {
      v19->_userInterfaceType = -1;
    }
  }
  return v19;
}

- (HFHomeKitAccessorySettingItem)initWithSetting:(id)a3 sourceItem:(id)a4 localizedTitle:(id)a5 settingsController:(id)a6 homeIdentifier:(id)a7 accessoryIdentifier:(id)a8 settingDict:(id)a9 usageOptions:(id)a10
{
  id v23 = a3;
  id v17 = a4;
  v18 = [(HFHomeKitAccessorySettingItem *)self initWithSettingsController:a6 localizedTitle:a5 homeIdentifier:a7 accessoryIdentifier:a8 settingDict:a9 usageOptions:a10];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_setting, a3);
    objc_storeStrong((id *)&v19->_sourceItem, a4);
    uint64_t v20 = [(HMImmutableSetting *)v19->_setting value];
    id cachedSettingValue = v19->_cachedSettingValue;
    v19->_id cachedSettingValue = (id)v20;
  }
  return v19;
}

- (HFHomeKitAccessorySettingItem)initWithDefaultSetting:(id)a3 sourceItem:(id)a4 localizedTitle:(id)a5 settingsController:(id)a6 homeIdentifier:(id)a7 accessoryIdentifier:(id)a8 settingDict:(id)a9 usageOptions:(id)a10
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v10 = [(HFHomeKitAccessorySettingItem *)self initWithSetting:a3 sourceItem:a4 localizedTitle:a5 settingsController:a6 homeIdentifier:a7 accessoryIdentifier:a8 settingDict:a9 usageOptions:a10];
  if (v10)
  {
    v11 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_debug_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEBUG, "Initialized Default Accessory Setting Item = [%@]", buf, 0xCu);
    }

    v10->_disabled = 1;
  }
  return v10;
}

- (HFHomeKitAccessorySettingItem)initWithSourceItem:(id)a3 localizedTitle:(id)a4 settingsController:(id)a5 homeIdentifier:(id)a6 accessoryIdentifier:(id)a7 settingDict:(id)a8 usageOptions:(id)a9
{
  id v16 = a3;
  id v17 = [(HFHomeKitAccessorySettingItem *)self initWithSettingsController:a5 localizedTitle:a4 homeIdentifier:a6 accessoryIdentifier:a7 settingDict:a8 usageOptions:a9];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sourceItem, a3);
    v18->_disabled = 1;
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HFHomeKitAccessorySettingItem *)self homeIdentifier];
  v5 = [(HFHomeKitAccessorySettingItem *)self accessoryIdentifier];
  v6 = [(HFHomeKitAccessorySettingItem *)self setting];
  v7 = [v6 keyPath];
  v8 = [(HFHomeKitAccessorySettingItem *)self settingDict];
  v9 = [v3 stringWithFormat:@"homeIdentifier:[%@], accessoryIdentifier:[%@], keyPath:[%@], settingDict:[%@]", v4, v5, v7, v8];

  return v9;
}

- (NSString)targetSettingKeyPath
{
  v3 = [(HFHomeKitAccessorySettingItem *)self settingDict];
  v4 = [(HFHomeKitAccessorySettingItem *)self settingKeyPath];
  v5 = [v3 objectForKeyedSubscript:v4];
  v6 = [v5 objectForKeyedSubscript:HFHomeKitSettingTargetKeyPathKey];

  return (NSString *)v6;
}

- (void)setIsControllable:(BOOL)a3
{
  if (self->_isControllable != a3)
  {
    self->_isControllable = a3;
    [(HFHomeKitAccessorySettingItem *)self setDisabled:!a3];
    id v4 = [(HFItem *)self updateWithOptions:MEMORY[0x263EFFA78]];
  }
}

- (BOOL)updateSetting:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_setting = &self->_setting;
  v7 = [(HMImmutableSetting *)self->_setting value];
  v8 = [v5 value];
  if ([v7 isEqual:v8])
  {
    BOOL v9 = [(HFHomeKitAccessorySettingItem *)self isDisabled];

    if (!v9)
    {
      BOOL v10 = 0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v11 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(HMImmutableSetting *)*p_setting keyPath];
    v13 = [v5 value];
    int v18 = 138412546;
    v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Updating setting [%@] with new value [%@]", (uint8_t *)&v18, 0x16u);
  }
  [(HFHomeKitAccessorySettingItem *)self setDisabled:0];
  objc_storeStrong((id *)&self->_setting, a3);
  v14 = [(HMImmutableSetting *)*p_setting value];
  id cachedSettingValue = self->_cachedSettingValue;
  self->_id cachedSettingValue = v14;

  id v16 = [(HFItem *)self updateWithOptions:MEMORY[0x263EFFA78]];
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (void)updateSettingValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(HFHomeKitAccessorySettingItem *)self settingKeyPath];
    int v9 = 138412546;
    BOOL v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Updating setting value for keypath [%@] with new value [%@]", (uint8_t *)&v9, 0x16u);
  }
  [(HFHomeKitAccessorySettingItem *)self setDisabled:0];
  id cachedSettingValue = self->_cachedSettingValue;
  self->_id cachedSettingValue = v4;

  id v8 = [(HFItem *)self updateWithOptions:MEMORY[0x263EFFA78]];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(HFHomeKitAccessorySettingItem *)self settingsController];
  v6 = [(HFHomeKitAccessorySettingItem *)self localizedTitle];
  v7 = [(HFHomeKitAccessorySettingItem *)self homeIdentifier];
  id v8 = [(HFHomeKitAccessorySettingItem *)self accessoryIdentifier];
  int v9 = [(HFHomeKitAccessorySettingItem *)self settingDict];
  BOOL v10 = [(HFHomeKitAccessorySettingItem *)self usageOptions];
  __int16 v11 = (void *)[v4 initWithSettingsController:v5 localizedTitle:v6 homeIdentifier:v7 accessoryIdentifier:v8 settingDict:v9 usageOptions:v10];

  id v12 = [(HFHomeKitAccessorySettingItem *)self sourceItem];
  [v11 setSourceItem:v12];

  uint64_t v13 = [(HFHomeKitAccessorySettingItem *)self setting];
  [v11 setSetting:v13];

  v14 = [(HFHomeKitAccessorySettingItem *)self cachedSettingValue];
  [v11 setCachedSettingValue:v14];

  [v11 copyLatestResultsFromItem:self];
  return v11;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HFMutableItemUpdateOutcome);
  [(HFHomeKitAccessorySettingItem *)self _decorateOutcomeWithResultKeys:v5];
  if (v4)
  {
    v6 = [(HFMutableItemUpdateOutcome *)v5 results];
    v7 = (void *)[v6 mutableCopy];

    [v7 addEntriesFromDictionary:v4];
    [(HFMutableItemUpdateOutcome *)v5 setResults:v7];
  }
  id v8 = [MEMORY[0x263F58190] futureWithResult:v5];

  return v8;
}

- (id)updateValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFHomeKitAccessorySettingItem *)self setting];
  v6 = [v5 homeKitAccessorySettingValueForRawValue:v4];

  v7 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(HFHomeKitAccessorySettingItem *)self settingKeyPath];
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    int v18 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Now updating setting keypath [%@] with HMImmutableSettingValue = [%@]", (uint8_t *)&v15, 0x16u);
  }
  int v9 = [(HFHomeKitAccessorySettingItem *)self settingsController];
  BOOL v10 = [(HFHomeKitAccessorySettingItem *)self homeIdentifier];
  __int16 v11 = [(HFHomeKitAccessorySettingItem *)self accessoryIdentifier];
  id v12 = [(HFHomeKitAccessorySettingItem *)self settingKeyPath];
  uint64_t v13 = objc_msgSend(v9, "hf_updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:settingValue:", v10, v11, v12, v6);

  return v13;
}

- (void)_decorateOutcomeWithResultKeys:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFHomeKitAccessorySettingItem *)self settingKeyPath];
  v6 = [(HFHomeKitAccessorySettingItem *)self localizedTitle];
  [v4 setObject:v6 forKeyedSubscript:@"title"];

  v7 = [(HFHomeKitAccessorySettingItem *)self settingKeyPath];
  int v8 = [v7 isEqualToString:HFAllowHeySiriSettingKeyPath];

  if (v8)
  {
    int v9 = [(HFHomeKitAccessorySettingItem *)self sourceItem];
    BOOL v10 = [v9 home];
    if ([v10 siriPhraseOptions] == 3)
    {
      __int16 v11 = [(HFHomeKitAccessorySettingItem *)self sourceItem];
      id v12 = [v11 home];
      int v13 = objc_msgSend(v12, "hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage");

      if (v13) {
        v14 = @"HFJustSiriOrHeySiri_Home_Level_Setting_Title";
      }
      else {
        v14 = @"HFHeySiri_Home_Level_Setting_Title";
      }
    }
    else
    {

      v14 = @"HFHeySiri_Home_Level_Setting_Title";
    }
    int v15 = _HFLocalizedStringWithDefaultValue(v14, v14, 1);
    [v4 setObject:v15 forKeyedSubscript:@"title"];

    id v16 = [(HFHomeKitAccessorySettingItem *)self sourceItem];
    __int16 v17 = [v16 home];
    if (objc_msgSend(v17, "hf_atleastOneMediaAccessoryHasSiriEnabled")) {
      int v18 = @"HFSiriSetting_On";
    }
    else {
      int v18 = @"HFSiriSetting_Off";
    }
    uint64_t v19 = _HFLocalizedStringWithDefaultValue(v18, v18, 1);
    [v4 setObject:v19 forKeyedSubscript:@"description"];
  }
  [v4 setObject:v5 forKeyedSubscript:@"HFAccessorySettingKeyPathKey"];
  __int16 v20 = NSNumber;
  uint64_t v21 = [(HFHomeKitAccessorySettingItem *)self setting];
  uint64_t v22 = objc_msgSend(v20, "numberWithBool:", objc_msgSend(v21, "isReadOnly"));
  [v4 setObject:v22 forKeyedSubscript:@"HFAccessorySettingIsWritableKey"];

  id v23 = [(HFHomeKitAccessorySettingItem *)self setting];
  [v4 setObject:v23 forKeyedSubscript:@"HFAccessorySettingRepresentitiveObjectKey"];

  v24 = [(HFHomeKitAccessorySettingItem *)self settingDict];
  v25 = [v24 objectForKeyedSubscript:HFUIInterfaceTypeKey];
  [v25 integerValue];

  v26 = [(NSDictionary *)self->_settingDict objectForKeyedSubscript:self->_settingKeyPath];
  id v27 = [v26 objectForKeyedSubscript:HFDisplaySettingValueKey];
  int v28 = [v27 BOOLValue];

  if (v28)
  {
    uint64_t v29 = [(HFHomeKitAccessorySettingItem *)self _formattedValueForSetting];
    objc_super v30 = (void *)v29;
    if (v29) {
      v31 = (__CFString *)v29;
    }
    else {
      v31 = &stru_26C081158;
    }
    [v4 setObject:v31 forKeyedSubscript:@"description"];
  }
  v32 = objc_msgSend(NSNumber, "numberWithBool:", -[HFHomeKitAccessorySettingItem isDisabled](self, "isDisabled"));
  [v4 setObject:v32 forKeyedSubscript:@"isDisabled"];

  v33 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v43 = [(HFHomeKitAccessorySettingItem *)self setting];
    int v44 = 138412546;
    v45 = v43;
    __int16 v46 = 2112;
    id v47 = v4;
    _os_log_debug_impl(&dword_20B986000, v33, OS_LOG_TYPE_DEBUG, "Finished configuring setting [%@] with options = [%@]", (uint8_t *)&v44, 0x16u);
  }
  v34 = [(HFHomeKitAccessorySettingItem *)self settingDict];
  v35 = [v34 objectForKeyedSubscript:v5];

  uint64_t v36 = [v35 objectForKey:HFDisplayValuePreviewFromKeyPath];
  v37 = (void *)v36;
  if (v36) {
    v38 = (void *)v36;
  }
  else {
    v38 = v5;
  }
  v39 = [MEMORY[0x263EFFA08] setWithObject:v38];
  [v4 setObject:v39 forKeyedSubscript:@"HFResultSettingKeyPathsDependenciesKey"];

  v40 = (void *)MEMORY[0x263EFFA08];
  v41 = [(HFHomeKitAccessorySettingItem *)self accessoryIdentifier];
  v42 = [v40 setWithObject:v41];
  [v4 setObject:v42 forKeyedSubscript:@"HFResultSettingParentIdentifiersDependenciesKey"];
}

- (id)_formattedValueForSetting
{
  v3 = [(HFHomeKitAccessorySettingItem *)self settingDict];
  id v4 = [(HFHomeKitAccessorySettingItem *)self settingKeyPath];
  id v5 = [v3 objectForKeyedSubscript:v4];

  v6 = [v5 objectForKeyedSubscript:HFDisplayValuePreviewFormatterKey];
  if (v6)
  {
    v7 = +[HFAccessorySettingFormatterFactory defaultFactory];
    int v8 = [v7 formatterForKey:v6];
  }
  else
  {
    int v8 = 0;
  }
  int v9 = [v5 objectForKeyedSubscript:HFDisplayValuePreviewFromAccessoryKey];
  int v10 = [v9 BOOLValue];

  __int16 v11 = [(HFHomeKitAccessorySettingItem *)self settingValue];
  if (v10)
  {
    id v12 = [(HFHomeKitAccessorySettingItem *)self sourceItem];
    int v13 = [v12 accessories];
    v14 = [v13 anyObject];
    uint64_t v15 = [v14 mediaProfile];

    __int16 v11 = (void *)v15;
  }
  if (v8)
  {
    id v16 = [v8 stringForObjectValue:v11];
  }
  else
  {
    objc_opt_class();
    id v17 = v11;
    if (objc_opt_isKindOfClass()) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    id v19 = v18;

    if (v19 && (id v20 = v19, !strcmp((const char *)[v20 objCType], "B")))
    {
      uint64_t v21 = +[HFAccessorySettingFormatterFactory defaultFactory];
      uint64_t v22 = [v21 formatterForKey:@"AccessorySettingsDefaultFormatter"];
      id v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "BOOLValue"));
      id v16 = [v22 stringForObjectValue:v23];
    }
    else
    {
      id v16 = [NSString stringWithFormat:@"%@", v17];
    }
  }
  return v16;
}

- (NSUUID)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (unint64_t)displayIndex
{
  return self->_displayIndex;
}

- (void)setDisplayIndex:(unint64_t)a3
{
  self->_displayIndex = a3;
}

- (NSDictionary)settingDict
{
  return self->_settingDict;
}

- (void)setSettingDict:(id)a3
{
}

- (NSString)settingKeyPath
{
  return self->_settingKeyPath;
}

- (void)setSettingKeyPath:(id)a3
{
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
}

- (int64_t)userInterfaceType
{
  return self->_userInterfaceType;
}

- (void)setUserInterfaceType:(int64_t)a3
{
  self->_userInterfaceType = a3;
}

- (BOOL)isControllable
{
  return self->_isControllable;
}

- (HFServiceLikeItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
}

- (HMImmutableSetting)setting
{
  return self->_setting;
}

- (void)setSetting:(id)a3
{
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (id)cachedSettingValue
{
  return self->_cachedSettingValue;
}

- (void)setCachedSettingValue:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cachedSettingValue, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_settingKeyPath, 0);
  objc_storeStrong((id *)&self->_settingDict, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end