@interface HFAccessorySettingItem
- (BOOL)_validateKeyPathDependencies;
- (HFAccessorySettingItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5;
- (HFAccessorySettingsEntity)entity;
- (HFHomeKitSettingsVendor)homeKitSettingsVendor;
- (HMSetting)setting;
- (NSDictionary)usageOptions;
- (NSString)settingKeyPath;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)updateValue:(id)a3;
- (id)value;
- (void)_decorateHiddenOrDisabled:(id)a3;
- (void)_decorateOutcomeWithAccessorySettingResultKeys:(id)a3;
- (void)_decorateOutcomeWithDependencies:(id)a3;
- (void)_decorateOutcomeWithResultKeys:(id)a3;
- (void)setEntity:(id)a3;
- (void)setHomeKitSettingsVendor:(id)a3;
- (void)setSetting:(id)a3;
- (void)setUsageOptions:(id)a3;
@end

@implementation HFAccessorySettingItem

- (HFAccessorySettingItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HFAccessorySettingItem.m", 64, @"Invalid parameter not satisfying: %@", @"homeKitSettingsVendor" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HFAccessorySettingItem.m", 65, @"Invalid parameter not satisfying: %@", @"setting" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)HFAccessorySettingItem;
  v14 = [(HFAccessorySettingItem *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_homeKitSettingsVendor, a3);
    objc_storeStrong((id *)&v15->_setting, a5);
    objc_storeStrong((id *)&v15->_usageOptions, a4);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  v6 = [(HFAccessorySettingItem *)self usageOptions];
  v7 = [(HFAccessorySettingItem *)self setting];
  v8 = (void *)[v4 initWithHomeKitSettingsVendor:v5 usageOptions:v6 setting:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (HFAccessorySettingsEntity)entity
{
  entity = self->_entity;
  if (!entity)
  {
    v4 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
    v5 = [v4 settings];
    v6 = objc_msgSend(v5, "hf_codex");
    v7 = [(HFAccessorySettingItem *)self settingKeyPath];
    v8 = objc_msgSend(v6, "hf_nodeWithKeyPath:", v7);
    v9 = [v8 representedObject];
    id v10 = self->_entity;
    self->_entity = v9;

    entity = self->_entity;
  }
  id v11 = entity;
  return v11;
}

- (NSString)settingKeyPath
{
  v2 = [(HFAccessorySettingItem *)self setting];
  v3 = [v2 keyPath];

  return (NSString *)v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HFMutableItemUpdateOutcome);
  [(HFAccessorySettingItem *)self _decorateOutcomeWithResultKeys:v5];
  [(HFAccessorySettingItem *)self _decorateOutcomeWithDependencies:v5];
  [(HFAccessorySettingItem *)self _decorateOutcomeWithAccessorySettingResultKeys:v5];
  [(HFAccessorySettingItem *)self _decorateHiddenOrDisabled:v5];
  if (v4)
  {
    v6 = [(HFMutableItemUpdateOutcome *)v5 results];
    v7 = (void *)[v6 mutableCopy];

    [v7 addEntriesFromDictionary:v4];
    [(HFMutableItemUpdateOutcome *)v5 setResults:v7];
  }
  v8 = [MEMORY[0x263F58190] futureWithResult:v5];

  return v8;
}

- (id)updateValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  v6 = objc_msgSend(v5, "hf_settingsValueManager");

  if (!v6) {
    NSLog(&cfstr_ValueManagerWa.isa);
  }
  v7 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(HFAccessorySettingItem *)self setting];
    int v13 = 138412802;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Updating setting item '%@/%@' to value: %@", (uint8_t *)&v13, 0x20u);
  }
  if (v6)
  {
    v9 = [(HFAccessorySettingItem *)self setting];
    [v6 changeValueForSetting:v9 toValue:v4];
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F58190];
    v9 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 7);
    [v10 futureWithError:v9];
  id v11 = };

  return v11;
}

- (id)value
{
  v3 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  id v4 = objc_msgSend(v3, "hf_settingsValueManager");

  v5 = [(HFAccessorySettingItem *)self setting];
  v6 = [v4 valueForSetting:v5];

  return v6;
}

- (BOOL)_validateKeyPathDependencies
{
  v3 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  id v4 = [v3 settings];

  v5 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  v6 = objc_msgSend(v5, "hf_settingsValueManager");

  v7 = [(HFAccessorySettingItem *)self entity];
  v8 = [v7 BOOLeanKeyPathDependencies];
  if ([v8 count])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__HFAccessorySettingItem__validateKeyPathDependencies__block_invoke;
    v11[3] = &unk_26408DE58;
    id v12 = v4;
    id v13 = v6;
    char v9 = objc_msgSend(v8, "na_all:", v11);
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

uint64_t __54__HFAccessorySettingItem__validateKeyPathDependencies__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 32), "hf_accessorySettingAtKeyPath:", a2);
  if (v3)
  {
    objc_opt_class();
    id v4 = v3;
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      id v7 = [*(id *)(a1 + 40) valueForSetting:v6];
      v8 = objc_msgSend(*(id *)(a1 + 32), "hf_codex");
      char v9 = [v6 keyPath];
      id v10 = objc_msgSend(v8, "hf_nodeWithKeyPath:", v9);
      id v11 = [v10 representedObject];

      id v12 = [v11 userInfo];
      id v13 = [v12 objectForKey:@"BooleanDependencyFalseKey"];

      v14 = [v7 title];
      __int16 v15 = [v13 componentsSeparatedByString:@"."];
      v16 = [v15 lastObject];
      int v17 = [v14 isEqualToString:v16];

      uint64_t v18 = v17 ^ 1u;
    }
    else
    {
      objc_opt_class();
      id v7 = v4;
      if (objc_opt_isKindOfClass()) {
        uint64_t v19 = v7;
      }
      else {
        uint64_t v19 = 0;
      }
      id v20 = v19;

      if (!v20)
      {
        id v7 = 0;
        uint64_t v18 = 1;
        goto LABEL_14;
      }
      id v11 = [*(id *)(a1 + 40) valueForSetting:v20];
      uint64_t v18 = [v11 BOOLValue];
    }

LABEL_14:
    goto LABEL_15;
  }
  uint64_t v18 = 1;
LABEL_15:

  return v18;
}

- (void)_decorateOutcomeWithDependencies:(id)a3
{
  id v4 = a3;
  v5 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  [v4 setObject:v5 forKeyedSubscript:@"HFResultHomeKitSettingsVendorKey"];

  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = [(HFAccessorySettingItem *)self setting];
  v8 = [v7 keyPath];
  id v16 = [v6 setWithObject:v8];

  char v9 = [(HFAccessorySettingItem *)self entity];
  id v10 = [v9 BOOLeanKeyPathDependencies];
  objc_msgSend(v16, "na_safeAddObjectsFromArray:", v10);

  [v4 setObject:v16 forKeyedSubscript:@"HFResultSettingKeyPathsDependenciesKey"];
  id v11 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  id v12 = [v11 homekitObjectIdentifiers];
  [v4 setObject:v12 forKeyedSubscript:@"HFResultSettingParentIdentifiersDependenciesKey"];

  id v13 = (void *)MEMORY[0x263EFFA08];
  v14 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  __int16 v15 = [v13 setWithObject:v14];
  [v4 setObject:v15 forKeyedSubscript:@"dependentHomeKitObjects"];
}

- (void)_decorateOutcomeWithAccessorySettingResultKeys:(id)a3
{
  v74[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  id v6 = objc_msgSend(v5, "hf_settingsValueManager");

  id v7 = [(HFAccessorySettingItem *)self entity];
  v8 = [(HFAccessorySettingItem *)self setting];
  char v9 = [v6 valueForSetting:v8];
  if (v9)
  {
    [v4 setObject:v9 forKeyedSubscript:@"HFAccessorySettingValueKey"];
  }
  else
  {
    id v10 = [MEMORY[0x263EFF9D0] null];
    [v4 setObject:v10 forKeyedSubscript:@"HFAccessorySettingValueKey"];
  }
  id v11 = [(HFAccessorySettingItem *)self setting];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v13 = [(HFAccessorySettingItem *)self setting];
    uint64_t v14 = [v13 stepValue];
    __int16 v15 = (void *)v14;
    if (v14) {
      id v16 = (void *)v14;
    }
    else {
      id v16 = &unk_26C0F7F18;
    }
    [v4 setObject:v16 forKeyedSubscript:@"HFAccessorySettingNumberValueStepKey"];

    uint64_t v17 = [v13 maximumValue];
    uint64_t v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = (void *)v17;
    }
    else {
      uint64_t v19 = &unk_26C0F7F28;
    }
    [v4 setObject:v19 forKeyedSubscript:@"HFAccessorySettingNumberValueMaxKey"];

    uint64_t v20 = [v13 minimumValue];
    v21 = (void *)v20;
    if (v20) {
      v22 = (void *)v20;
    }
    else {
      v22 = &unk_26C0F7F38;
    }
    [v4 setObject:v22 forKeyedSubscript:@"HFAccessorySettingNumberValueMinKey"];
  }
  v72 = v7;
  v73 = v6;
  if (!v7)
  {
    uint64_t v24 = MEMORY[0x263EFFA78];
LABEL_20:
    v25 = [(HFAccessorySettingItem *)self setting];
    uint64_t v23 = HFAccessorySettingsDefaultInterfaceModalityForHMAccessorySetting(v25);

    goto LABEL_21;
  }
  [v4 setObject:v7 forKeyedSubscript:@"HFAccessorySettingsEntityKey"];
  uint64_t v23 = [v7 interfaceModality];
  uint64_t v24 = [v7 userInfo];
  if (v23 == 1 || v23 == -1) {
    goto LABEL_20;
  }
LABEL_21:
  v26 = [(HFAccessorySettingItem *)self settingKeyPath];
  if (![v26 isEqualToString:@"root.siri.allowHeySiri"])
  {

    v28 = [NSNumber numberWithInteger:v23];
    v43 = @"HFAccessorySettingInterfaceModalityKey";
LABEL_32:
    [v4 setObject:v28 forKeyedSubscript:v43];
    goto LABEL_33;
  }
  v27 = [(HFAccessorySettingItem *)self settingKeyPath];
  [v27 isEqualToString:@"root.siri.allowHeySiri"];

  v28 = [(HFAccessorySettingItem *)self settingKeyPath];
  if ([v28 isEqualToString:@"root.siri.allowHeySiri"])
  {
    v29 = [v4 objectForKeyedSubscript:@"HFAccessorySettingInterfaceModalityKey"];

    if (v29) {
      goto LABEL_34;
    }
    v30 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
    if ([v30 conformsToProtocol:&unk_26C155B48]) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    id v32 = v31;

    v33 = [v32 accessories];

    v34 = [v33 anyObject];
    v35 = [v34 mediaProfile];
    v36 = objc_msgSend(v35, "hf_mediaAccessoryCommonSettingsManager");
    v37 = [v36 settingValueForKeyPath:HFAllowHeySiriSettingKeyPath];
    int v38 = [v37 BOOLValue];

    v39 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
    v40 = objc_msgSend(v39, "hf_settingsValueManager");
    v41 = [v40 valueForSettingAtKeyPath:@"root.siri.allowHeySiri"];
    LODWORD(v35) = [v41 BOOLValue];

    if (v38 | v35) {
      v42 = @"HFSiriSetting_On";
    }
    else {
      v42 = @"HFSiriSetting_Off";
    }
    v28 = _HFLocalizedStringWithDefaultValue(v42, v42, 1);
    v43 = @"description";
    goto LABEL_32;
  }
LABEL_33:

LABEL_34:
  v71 = (void *)v24;
  [v4 setObject:v24 forKeyedSubscript:@"HFAccessorySettingUserInfoKey"];
  v44 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  objc_opt_class();
  char v45 = objc_opt_isKindOfClass();

  if (v45)
  {
    objc_opt_class();
    v46 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
    if (objc_opt_isKindOfClass()) {
      v47 = v46;
    }
    else {
      v47 = 0;
    }
    id v48 = v47;

    v49 = [v48 accessory];
    v50 = [v49 mediaProfile];
    BOOL v51 = +[HFMediaHelper isHomePodOriginal:v50];

    v52 = [v48 accessory];

    v53 = [v52 mediaProfile];
    BOOL v54 = +[HFMediaHelper isHomePodMini:v53];

    v55 = @"homepodmini.fill";
    v56 = @"homepod.fill";
  }
  else
  {
    v57 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
    objc_opt_class();
    char v58 = objc_opt_isKindOfClass();

    v55 = @"homepodmini.fill";
    v56 = @"homepod.fill";
    if (v58)
    {
      objc_opt_class();
      v59 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
      if (objc_opt_isKindOfClass()) {
        v60 = v59;
      }
      else {
        v60 = 0;
      }
      id v61 = v60;

      BOOL v51 = +[HFMediaHelper isHomePodOriginalMediaSystem:v61];
      BOOL v54 = +[HFMediaHelper isHomePodMiniMediaSystem:v61];

      if (v54) {
        v55 = @"homepodmini.2.fill";
      }
      if (v51) {
        v56 = @"homepod.2.fill";
      }
    }
    else
    {
      BOOL v51 = 0;
      BOOL v54 = 0;
    }
  }
  v62 = (void *)MEMORY[0x263F1C6C8];
  v63 = [MEMORY[0x263F1C550] systemGrayColor];
  v74[0] = v63;
  v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:1];
  v65 = [v62 _configurationWithHierarchicalColors:v64];

  v66 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D2F8]];
  v67 = [v66 configurationByApplyingConfiguration:v65];
  if (v51)
  {
    v68 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:v56 configuration:v67];
    v70 = v72;
    v69 = v73;
    if (!v68) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  v70 = v72;
  v69 = v73;
  if (v54)
  {
    v68 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:v55];
    if (v68)
    {
LABEL_54:
      [v4 setObject:v68 forKeyedSubscript:@"icon"];
    }
  }
LABEL_55:
}

- (void)_decorateOutcomeWithResultKeys:(id)a3
{
  id v65 = a3;
  id v4 = [(HFAccessorySettingItem *)self settingKeyPath];
  v5 = [NSString stringWithFormat:@"AccessoryDetails.%@", v4];
  [v65 setObject:v5 forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];

  id v6 = [(HFAccessorySettingItem *)self entity];
  id v7 = [v6 overrideLocalizedTitleKey];

  if (v7)
  {
    v8 = [(HFAccessorySettingItem *)self entity];
    char v9 = [v8 overrideLocalizedTitleKey];
    id v10 = _HFLocalizedStringWithDefaultValue(v9, v9, 1);
    [v65 setObject:v10 forKeyedSubscript:@"title"];

LABEL_5:
    goto LABEL_6;
  }
  id v11 = [(HFAccessorySettingItem *)self setting];
  id v12 = [v11 localizedTitle];

  if (v12)
  {
    v8 = [(HFAccessorySettingItem *)self setting];
    char v9 = [v8 localizedTitle];
    [v65 setObject:v9 forKeyedSubscript:@"title"];
    goto LABEL_5;
  }
  NSLog(&cfstr_AccessorySetti.isa);
LABEL_6:
  [v65 setObject:v4 forKeyedSubscript:@"HFAccessorySettingKeyPathKey"];
  id v13 = NSNumber;
  uint64_t v14 = [(HFAccessorySettingItem *)self setting];
  __int16 v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isWritable"));
  [v65 setObject:v15 forKeyedSubscript:@"HFAccessorySettingIsWritableKey"];

  id v16 = [(HFAccessorySettingItem *)self setting];
  [v65 setObject:v16 forKeyedSubscript:@"HFAccessorySettingRepresentitiveObjectKey"];

  uint64_t v17 = [(HFAccessorySettingItem *)self entity];
  uint64_t v18 = [v17 interfaceModality];

  if (v18 == 9)
  {
    uint64_t v19 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
    uint64_t v20 = objc_msgSend(v19, "hf_settingsAdapterManager");
    v21 = [(HFAccessorySettingItem *)self entity];
    v22 = [v21 adapterIdentifier];
    uint64_t v23 = [v20 adapterForIdentifier:v22];
    if ([v23 conformsToProtocol:&unk_26C139298]) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    id v25 = v24;

    v26 = [(HFAccessorySettingItem *)self entity];
    v27 = [v25 inProgressButtonPressFutureForEntity:v26];

    [v65 setObject:v27 forKeyedSubscript:@"HFResultActionFutureKey"];
  }
  v28 = [(HFAccessorySettingItem *)self settingKeyPath];
  int v29 = [v28 isEqualToString:@"root.siri.allowHeySiri"];

  v30 = [(HFAccessorySettingItem *)self settingKeyPath];
  int v31 = [v30 isEqualToString:@"root.siri.allowHeySiri"];

  if (!v31 || v29)
  {
    if (v29)
    {
      id v32 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
      v33 = objc_msgSend(v32, "hf_home");
      if ([v33 siriPhraseOptions] == 3)
      {
        v34 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
        v35 = objc_msgSend(v34, "hf_home");
        int v36 = objc_msgSend(v35, "hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage");

        if (v36) {
          v37 = @"HFJustSiriOrHeySiri_Home_Level_Setting_Title";
        }
        else {
          v37 = @"HFHeySiri_Home_Level_Setting_Title";
        }
      }
      else
      {

        v37 = @"HFHeySiri_Home_Level_Setting_Title";
      }
      int v38 = _HFLocalizedStringWithDefaultValue(v37, v37, 1);
      [v65 setObject:v38 forKeyedSubscript:@"title"];
    }
    v39 = [(HFAccessorySettingItem *)self entity];
    v40 = [v39 previewValueKeyPath];
    if (v40)
    {

      goto LABEL_24;
    }
    v41 = [(HFAccessorySettingItem *)self entity];
    int v42 = [v41 previewAccessory];

    if (v42)
    {
LABEL_24:
      v43 = [(HFAccessorySettingItem *)self entity];
      char v44 = [v43 previewAccessory];

      char v45 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
      v46 = v45;
      if (v44)
      {
        int v47 = 0;
      }
      else
      {
        id v48 = objc_msgSend(v45, "hf_settingsValueManager");

        v49 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
        v50 = [v49 settings];
        BOOL v51 = [(HFAccessorySettingItem *)self entity];
        v52 = [v51 previewValueKeyPath];
        v53 = objc_msgSend(v50, "hf_accessorySettingAtKeyPath:", v52);

        v46 = [v48 valueForSetting:v53];
        int v47 = objc_msgSend(v53, "hf_isBooleanSetting");
      }
      BOOL v54 = [(HFAccessorySettingItem *)self entity];
      v55 = [v54 previewValueFormatter];

      if (v55)
      {
        v56 = [v55 stringForObjectValue:v46];
      }
      else
      {
        if (v46) {
          int v59 = v47;
        }
        else {
          int v59 = 0;
        }
        if (v59 == 1)
        {
          objc_opt_class();
          id v60 = v46;
          if (objc_opt_isKindOfClass()) {
            id v61 = v60;
          }
          else {
            id v61 = 0;
          }
          id v62 = v61;

          v63 = +[HFAccessorySettingFormatterFactory defaultFactory];
          v64 = [v63 formatterForKey:@"AccessorySettingsDefaultFormatter"];
          v57 = [v64 stringForObjectValue:v62];

          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v57 = 0;
          goto LABEL_30;
        }
        v56 = v46;
      }
      v57 = v56;
LABEL_30:
      if (v57) {
        char v58 = v57;
      }
      else {
        char v58 = &stru_26C081158;
      }
      [v65 setObject:v58 forKeyedSubscript:@"description"];
    }
  }
}

- (void)_decorateHiddenOrDisabled:(id)a3
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFAccessorySettingItem *)self entity];
  id v6 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  id v7 = objc_msgSend(v6, "hf_home");
  unsigned int v8 = objc_msgSend(v7, "hf_currentUserIsAdministrator");

  char v9 = [(HFAccessorySettingItem *)self setting];
  int v10 = [v9 isWritable];

  id v11 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  id v12 = [v11 settings];
  int v13 = [v12 isControllable];

  uint64_t v14 = [(HFAccessorySettingItem *)self usageOptions];
  __int16 v15 = [v14 objectForKeyedSubscript:@"HMSettingDisplayOption_AllowNonAdminAccess"];
  int v16 = [v15 BOOLValue];

  uint64_t v91 = objc_opt_new();
  uint64_t v17 = objc_opt_new();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HFAccessorySettingItem__decorateHiddenOrDisabled___block_invoke;
  aBlock[3] = &unk_26408DE80;
  aBlock[4] = self;
  id v18 = v5;
  id v94 = v18;
  v92 = (void (**)(void *, void *, __CFString *))_Block_copy(aBlock);
  uint64_t v19 = off_26408B000;
  unsigned int v88 = v8;
  v90 = (void *)v17;
  if ((v8 & 1) == 0 && !v16)
  {
    uint64_t v20 = 0;
    v21 = @"Current User is not administrator.";
    v22 = (void *)v91;
LABEL_35:
    v92[2](v92, v22, v21);
    unsigned int v89 = 1;
    goto LABEL_38;
  }
  if ([(HFAccessorySettingItem *)self _validateKeyPathDependencies])
  {
    uint64_t v20 = 0;
    unsigned int v89 = 0;
  }
  else
  {
    unsigned int v23 = [v18 requiresDependenciesToShowSetting];
    uint64_t v24 = NSString;
    id v25 = [v18 BOOLeanKeyPathDependencies];
    v26 = [v24 stringWithFormat:@"KeyPath dependencies possess one or more failed cases: %@", v25];
    ((void (*)(void))v92[2])();

    unsigned int v89 = v23;
    uint64_t v20 = v23 ^ 1;
  }
  if ((v10 & v13 & 1) == 0)
  {
    if ((v10 & 1) == 0)
    {
      v27 = NSString;
      v28 = [(HFAccessorySettingItem *)self setting];
      int v29 = [v28 keyPath];
      v30 = [(HFAccessorySettingItem *)self setting];
      int v31 = [(HFAccessorySettingItem *)self setting];
      int v32 = [v31 isWritable];
      v33 = @"Read Only";
      if (v32) {
        v33 = @"Read/Write";
      }
      v34 = [v27 stringWithFormat:@"Setting '%@' is readonly: %@/%@", v29, v30, v33];
      v92[2](v92, v90, v34);
    }
    if ((v13 & 1) == 0)
    {
      v35 = NSString;
      int v36 = [(HFAccessorySettingItem *)self setting];
      v37 = [v36 keyPath];
      int v38 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
      v39 = [v38 settings];
      v40 = [v35 stringWithFormat:@"Setting '%@' is not controllable: %@/%@", v37, v39, @"NOT CONTROLLABLE"];
      v92[2](v92, v90, v40);
    }
    uint64_t v20 = 1;
  }
  v41 = [(HFAccessorySettingItem *)self setting];
  uint64_t v42 = [v41 keyPath];
  int v87 = [(id)v42 isEqualToString:@"root.announce.enabled"];

  v43 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
  objc_opt_class();
  LOBYTE(v42) = objc_opt_isKindOfClass();

  if (v42)
  {
    objc_opt_class();
    char v44 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
    if (objc_opt_isKindOfClass()) {
      char v45 = v44;
    }
    else {
      char v45 = 0;
    }
    id v46 = v45;

    int v47 = [v46 accessory];
    char v48 = objc_msgSend(v47, "hf_isHomePod");

    v49 = [v46 accessory];

    int v50 = [v49 supportsAudioAnalysis];
    if ((v48 & 1) == 0) {
      goto LABEL_28;
    }
  }
  else
  {
    BOOL v51 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      int v50 = 0;
LABEL_28:
      unsigned int v59 = 0;
      LOBYTE(v58) = 0;
      goto LABEL_29;
    }
    objc_opt_class();
    v53 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
    if (objc_opt_isKindOfClass()) {
      BOOL v54 = v53;
    }
    else {
      BOOL v54 = 0;
    }
    id v55 = v54;

    v56 = [v55 accessories];

    v57 = [v56 anyObject];
    int v50 = [v57 supportsAudioAnalysis];

    if (!v55) {
      goto LABEL_28;
    }
  }
  int v58 = !+[HFUtilities isAMac];
  unsigned int v59 = 1;
LABEL_29:
  if (v87 && (v58 & 1) == 0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Announce settings should be hidden since containsHomePod = %{BOOL}d isAMac = %{BOOL}d", v59, +[HFUtilities isAMac](HFUtilities, "isAMac"));
    id v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v92[2](v92, (void *)v91, v60);

    unsigned int v89 = 1;
  }
  id v61 = [(HFAccessorySettingItem *)self setting];
  id v62 = [v61 keyPath];
  int v63 = [v62 isEqualToString:@"root.audioAnalysis.enabled"];

  if (v63)
  {
    v22 = (void *)v91;
    if ((v59 & v50 & 1) == 0)
    {
      v21 = @"Audio Analysis settings should be hidden";
      uint64_t v19 = off_26408B000;
      goto LABEL_35;
    }
  }
  else
  {
    v22 = (void *)v91;
  }
  uint64_t v19 = off_26408B000;
LABEL_38:
  if (([(__objc2_class *)v19[333] supportsAnalytics] & 1) == 0)
  {
    v64 = [v4 objectForKeyedSubscript:@"HFAccessorySettingKeyPathKey"];
    int v65 = [v64 isEqual:@"root.general.analytics.shareSpeakerAnalytics"];

    uint64_t v20 = v20 | v65;
  }
  [v4 setObject:&unk_26C0F5F58 forKeyedSubscript:@"state"];
  if ([v18 interfaceModality] == 5)
  {
    uint64_t v66 = [(HFAccessorySettingItem *)self setting];
    if (v66)
    {
      v67 = (void *)v66;
      v68 = [(HFAccessorySettingItem *)self setting];
      objc_opt_class();
      char v69 = objc_opt_isKindOfClass();

      if (v69)
      {
        v70 = [(HFAccessorySettingItem *)self homeKitSettingsVendor];
        v71 = objc_msgSend(v70, "hf_settingsValueManager");

        v72 = NSNumber;
        v73 = [(HFAccessorySettingItem *)self setting];
        v74 = [v71 valueForSetting:v73];
        if ([v74 BOOLValue]) {
          uint64_t v75 = 2;
        }
        else {
          uint64_t v75 = 1;
        }
        v76 = [v72 numberWithInteger:v75];
        [v4 setObject:v76 forKeyedSubscript:@"state"];

        v22 = (void *)v91;
      }
    }
  }
  v77 = [NSNumber numberWithBool:v89];
  [v4 setObject:v77 forKeyedSubscript:@"hidden"];

  v78 = [NSNumber numberWithBool:v20];
  [v4 setObject:v78 forKeyedSubscript:@"isDisabled"];

  if ((v20 & 1) == 0)
  {
    v79 = [(HFAccessorySettingItem *)self usageOptions];
    v80 = [v79 objectForKeyedSubscript:@"HMSettingDisplayOption_AllowNonAdminAccess"];
    int v81 = [v80 BOOLValue];

    if (v81) {
      [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"shouldDisableForNonAdminUsers"];
    }
  }
  if ([v90 count])
  {
    v82 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      v83 = [v18 keyPath];
      *(_DWORD *)buf = 138412546;
      v96 = v83;
      __int16 v97 = 2112;
      v98 = v90;
      _os_log_impl(&dword_20B986000, v82, OS_LOG_TYPE_DEFAULT, "Setting Item @ keypath '%@' is disabled for reasons: %@", buf, 0x16u);
    }
  }
  if ([v22 count])
  {
    v84 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = [v18 keyPath];
      *(_DWORD *)buf = 138412546;
      v96 = v85;
      __int16 v97 = 2112;
      v98 = v22;
      _os_log_impl(&dword_20B986000, v84, OS_LOG_TYPE_DEFAULT, "Setting Item @ keypath '%@' is hidden for reasons: %@", buf, 0x16u);
    }
  }
  v86 = [NSNumber numberWithBool:v88];
  [v4 setObject:v86 forKeyedSubscript:@"administrator"];

  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"remoteAccessDependency"];
}

void __52__HFAccessorySettingItem__decorateHiddenOrDisabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) setting];
  if (v6)
  {
  }
  else if ([*(id *)(a1 + 40) alwaysShowGroup])
  {
    goto LABEL_5;
  }
  objc_msgSend(v7, "na_safeAddObject:", v5);
LABEL_5:
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (void)setHomeKitSettingsVendor:(id)a3
{
}

- (HMSetting)setting
{
  return self->_setting;
}

- (void)setSetting:(id)a3
{
}

- (void)setEntity:(id)a3
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
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
}

@end