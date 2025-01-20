@interface HFAccessorySettingGroupItem
- (BOOL)_useManagedConfigurationForProfiles;
- (BOOL)_validateKeyPathDependencies;
- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4;
- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 entity:(id)a5;
- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 group:(id)a5;
- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 selectionSetting:(id)a5;
- (HFAccessorySettingsEntity)entity;
- (HFHomeKitSettingsVendor)homeKitSettingsVendor;
- (HMAccessorySelectionSetting)selectionSetting;
- (HMSettingGroup)settingGroup;
- (NSDictionary)usageOptions;
- (NSString)settingKeyPath;
- (id)_displayTitle;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_decorateHiddenOrDisabled:(id)a3;
- (void)setUsageOptions:(id)a3;
@end

@implementation HFAccessorySettingGroupItem

- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 settings];
  v9 = [v8 rootGroup];

  v10 = [(HFAccessorySettingGroupItem *)self initWithHomeKitSettingsVendor:v7 usageOptions:v6 group:v9];
  return v10;
}

- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 entity:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HFAccessorySettingGroupItem.m", 46, @"Invalid parameter not satisfying: %@", @"homeKitSettingsVendor" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HFAccessorySettingGroupItem;
  v13 = [(HFAccessorySettingGroupItem *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_entity, a5);
    objc_storeStrong((id *)&v14->_homeKitSettingsVendor, a3);
    objc_storeStrong((id *)&v14->_usageOptions, a4);
  }

  return v14;
}

- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 group:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HFAccessorySettingGroupItem.m", 59, @"Invalid parameter not satisfying: %@", @"homeKitSettingsVendor" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"HFAccessorySettingGroupItem.m", 60, @"Invalid parameter not satisfying: %@", @"group" object file lineNumber description];

LABEL_3:
  v13 = [v12 keyPath];
  v14 = [v9 settings];
  v15 = objc_msgSend(v14, "hf_codex");
  v16 = objc_msgSend(v15, "hf_nodeWithKeyPath:", v13);
  objc_super v17 = [v16 representedObject];

  v18 = [(HFAccessorySettingGroupItem *)self initWithHomeKitSettingsVendor:v9 usageOptions:v10 entity:v17];
  v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_settingGroup, a5);
  }

  return v19;
}

- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 selectionSetting:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HFAccessorySettingGroupItem.m", 73, @"Invalid parameter not satisfying: %@", @"homeKitSettingsVendor" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"HFAccessorySettingGroupItem.m", 74, @"Invalid parameter not satisfying: %@", @"selectionSetting" object file lineNumber description];

LABEL_3:
  v13 = [v12 keyPath];
  v14 = [v9 settings];
  v15 = objc_msgSend(v14, "hf_codex");
  v16 = objc_msgSend(v15, "hf_nodeWithKeyPath:", v13);
  objc_super v17 = [v16 representedObject];

  v18 = [(HFAccessorySettingGroupItem *)self initWithHomeKitSettingsVendor:v9 usageOptions:v10 entity:v17];
  v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_selectionSetting, a5);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(HFAccessorySettingGroupItem *)self selectionSetting];

  if (v5)
  {
    id v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    id v7 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
    v8 = [(HFAccessorySettingGroupItem *)self usageOptions];
    id v9 = [(HFAccessorySettingGroupItem *)self selectionSetting];
    uint64_t v10 = [v6 initWithHomeKitSettingsVendor:v7 usageOptions:v8 selectionSetting:v9];
  }
  else
  {
    id v11 = [(HFAccessorySettingGroupItem *)self settingGroup];

    id v12 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    id v7 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
    v8 = [(HFAccessorySettingGroupItem *)self usageOptions];
    if (v11)
    {
      id v9 = [(HFAccessorySettingGroupItem *)self settingGroup];
      uint64_t v10 = [v12 initWithHomeKitSettingsVendor:v7 usageOptions:v8 group:v9];
    }
    else
    {
      id v9 = [(HFAccessorySettingGroupItem *)self entity];
      uint64_t v10 = [v12 initWithHomeKitSettingsVendor:v7 usageOptions:v8 entity:v9];
    }
  }
  v13 = (void *)v10;

  [v13 copyLatestResultsFromItem:self];
  return v13;
}

- (NSString)settingKeyPath
{
  v3 = [(HFAccessorySettingGroupItem *)self selectionSetting];

  if (v3)
  {
    v4 = [(HFAccessorySettingGroupItem *)self selectionSetting];
  }
  else
  {
    v5 = [(HFAccessorySettingGroupItem *)self settingGroup];

    if (v5) {
      [(HFAccessorySettingGroupItem *)self settingGroup];
    }
    else {
    v4 = [(HFAccessorySettingGroupItem *)self entity];
    }
  }
  id v6 = v4;
  id v7 = [v4 keyPath];

  return (NSString *)v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = self;
  uint64_t v83 = *MEMORY[0x263EF8340];
  v5 = [(HFAccessorySettingGroupItem *)self entity];
  id v6 = [(HFAccessorySettingGroupItem *)v4 settingKeyPath];
  id v7 = objc_alloc_init(HFMutableItemUpdateOutcome);
  v8 = [NSString stringWithFormat:@"AccessoryDetails.%@", v6];
  [(HFMutableItemUpdateOutcome *)v7 setObject:v8 forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];

  [(HFMutableItemUpdateOutcome *)v7 setObject:&unk_26C0F66C0 forKeyedSubscript:@"state"];
  id v9 = [(HFAccessorySettingGroupItem *)v4 entity];
  uint64_t v10 = [v9 previewValueKeyPath];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(HFAccessorySettingGroupItem *)v4 settingKeyPath];
  }
  v13 = v12;

  v14 = [MEMORY[0x263EFFA08] setWithObject:v13];
  [(HFMutableItemUpdateOutcome *)v7 setObject:v14 forKeyedSubscript:@"HFResultSettingKeyPathsDependenciesKey"];

  v15 = [(HFAccessorySettingGroupItem *)v4 homeKitSettingsVendor];
  v16 = [v15 homekitObjectIdentifiers];
  [(HFMutableItemUpdateOutcome *)v7 setObject:v16 forKeyedSubscript:@"HFResultSettingParentIdentifiersDependenciesKey"];

  objc_super v17 = (void *)MEMORY[0x263EFFA08];
  v18 = [(HFAccessorySettingGroupItem *)v4 homeKitSettingsVendor];
  v19 = [v17 setWithObject:v18];
  [(HFMutableItemUpdateOutcome *)v7 setObject:v19 forKeyedSubscript:@"dependentHomeKitObjects"];

  [(HFMutableItemUpdateOutcome *)v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"remoteAccessDependency"];
  v20 = [(HFAccessorySettingGroupItem *)v4 homeKitSettingsVendor];
  [(HFMutableItemUpdateOutcome *)v7 setObject:v20 forKeyedSubscript:@"HFResultHomeKitSettingsVendorKey"];

  v21 = [v5 previewValueKeyPath];
  unint64_t v22 = 0x263F08000;
  if (v21)
  {
  }
  else if (([v5 previewAccessory] & 1) == 0)
  {
    goto LABEL_39;
  }
  char v23 = [v5 previewAccessory];
  v24 = [(HFAccessorySettingGroupItem *)v4 homeKitSettingsVendor];
  v25 = v24;
  aSelector = a2;
  v26 = v13;
  if (v23)
  {
    int v27 = 0;
  }
  else
  {
    v28 = objc_msgSend(v24, "hf_settingsValueManager");

    v29 = [(HFAccessorySettingGroupItem *)v4 homeKitSettingsVendor];
    v30 = [v29 settings];
    v31 = [v5 previewValueKeyPath];
    v32 = objc_msgSend(v30, "hf_accessorySettingAtKeyPath:", v31);

    v25 = [v28 valueForSetting:v32];
    int v27 = objc_msgSend(v32, "hf_isBooleanSetting");
  }
  v33 = +[HFHomeKitDispatcher sharedDispatcher];
  v34 = [v33 homeManager];
  int v35 = [v34 hasOptedToHH2];

  if (v35
    && (([v6 isEqualToString:@"root.siri.recognitionLanguage"] & 1) != 0
     || [v6 isEqualToString:@"root.siri.outputVoice"]))
  {
    v36 = [(HFAccessorySettingGroupItem *)v4 homeKitSettingsVendor];
    if ([v36 conformsToProtocol:&unk_26C155B48]) {
      v37 = v36;
    }
    else {
      v37 = 0;
    }
    id v38 = v37;

    v39 = objc_msgSend(v38, "hf_siriLanguageOptionsManager");

    if (v39)
    {
      v40 = HFLogForCategory(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412546;
        v80 = v41;
        __int16 v81 = 2112;
        v82 = v6;
        _os_log_impl(&dword_20B986000, v40, OS_LOG_TYPE_DEFAULT, "%@ language setting %@ is being formatted, fetching the option from the siri endpoint manager instead", buf, 0x16u);
      }
      uint64_t v42 = [v39 selectedLanguageOption];

      v25 = (void *)v42;
    }
  }
  v43 = [v5 previewValueFormatter];
  v44 = v43;
  v13 = v26;
  if (v43)
  {
    v45 = [v43 stringForObjectValue:v25];
  }
  else
  {
    if (v25) {
      int v47 = v27;
    }
    else {
      int v47 = 0;
    }
    if (v47 == 1)
    {
      objc_opt_class();
      SEL aSelectora = v26;
      id v48 = v25;
      if (objc_opt_isKindOfClass()) {
        v49 = v48;
      }
      else {
        v49 = 0;
      }
      id v50 = v49;

      v51 = +[HFAccessorySettingFormatterFactory defaultFactory];
      v52 = [v51 formatterForKey:@"AccessorySettingsDefaultFormatter"];
      v46 = [v52 stringForObjectValue:v50];

      v13 = (char *)aSelectora;
      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v46 = 0;
      goto LABEL_35;
    }
    v45 = v25;
  }
  v46 = v45;
LABEL_35:
  if (v46) {
    v53 = v46;
  }
  else {
    v53 = &stru_26C081158;
  }
  [(HFMutableItemUpdateOutcome *)v7 setObject:v53 forKeyedSubscript:@"description"];

  unint64_t v22 = 0x263F08000uLL;
LABEL_39:
  v54 = [(HFAccessorySettingGroupItem *)v4 _displayTitle];
  [(HFMutableItemUpdateOutcome *)v7 setObject:v54 forKeyedSubscript:@"title"];

  [(HFMutableItemUpdateOutcome *)v7 setObject:v6 forKeyedSubscript:@"HFAccessorySettingGroupKeyPathKey"];
  v55 = [(HFAccessorySettingGroupItem *)v4 settingGroup];

  if (v55)
  {
    v56 = [(HFAccessorySettingGroupItem *)v4 settingGroup];
    v57 = @"HFAccessorySettingGroupRepresentitiveObjectKey";
  }
  else
  {
    v58 = [(HFAccessorySettingGroupItem *)v4 selectionSetting];

    if (!v58) {
      goto LABEL_44;
    }
    v59 = [(HFAccessorySettingGroupItem *)v4 selectionSetting];
    [(HFMutableItemUpdateOutcome *)v7 setObject:v59 forKeyedSubscript:@"HFAccessorySettingGroupRepresentitiveObjectKey"];

    v56 = [(HFAccessorySettingGroupItem *)v4 selectionSetting];
    v57 = @"HFAccessorySettingValueKey";
  }
  [(HFMutableItemUpdateOutcome *)v7 setObject:v56 forKeyedSubscript:v57];

LABEL_44:
  v60 = *(void **)(v22 + 2584);
  v61 = [(HFAccessorySettingGroupItem *)v4 entity];
  v62 = objc_msgSend(v60, "numberWithInteger:", objc_msgSend(v61, "interfaceModality"));
  [(HFMutableItemUpdateOutcome *)v7 setObject:v62 forKeyedSubscript:@"HFAccessorySettingInterfaceModalityKey"];

  if (v5) {
    [(HFMutableItemUpdateOutcome *)v7 setObject:v5 forKeyedSubscript:@"HFAccessorySettingsEntityKey"];
  }
  if ([v5 interfaceModality] == 9)
  {
    v63 = [(HFAccessorySettingGroupItem *)v4 homeKitSettingsVendor];
    v64 = objc_msgSend(v63, "hf_settingsAdapterManager");
    v65 = [(HFAccessorySettingGroupItem *)v4 entity];
    [v65 adapterIdentifier];
    SEL aSelectorb = (SEL)v4;
    v66 = v5;
    v67 = v6;
    v69 = v68 = v13;
    v70 = [v64 adapterForIdentifier:v69];
    if ([v70 conformsToProtocol:&unk_26C139298]) {
      v71 = v70;
    }
    else {
      v71 = 0;
    }
    id v72 = v71;

    v13 = v68;
    id v6 = v67;
    v5 = v66;
    v4 = (HFAccessorySettingGroupItem *)aSelectorb;

    v73 = [v72 inProgressButtonPressFutureForEntity:v5];

    [(HFMutableItemUpdateOutcome *)v7 setObject:v73 forKeyedSubscript:@"HFResultActionFutureKey"];
  }
  [(HFAccessorySettingGroupItem *)v4 _decorateHiddenOrDisabled:v7];
  v74 = [MEMORY[0x263F58190] futureWithResult:v7];

  return v74;
}

- (id)_displayTitle
{
  v3 = [(HFAccessorySettingGroupItem *)self entity];
  v4 = [v3 overrideLocalizedTitleKey];

  if (v4)
  {
    v5 = [(HFAccessorySettingGroupItem *)self entity];
    id v6 = [v5 overrideLocalizedTitleKey];
    id v7 = _HFLocalizedStringWithDefaultValue(v6, v6, 1);
  }
  else
  {
    v8 = [(HFAccessorySettingGroupItem *)self settingGroup];

    if (v8)
    {
      v5 = [(HFAccessorySettingGroupItem *)self settingGroup];
      [v5 localizedTitle];
    }
    else
    {
      id v9 = NSString;
      uint64_t v10 = [(HFAccessorySettingGroupItem *)self settingKeyPath];
      v5 = [v9 stringWithFormat:@"HFAccessorySettingsGroupTitle-%@", v10];

      _HFLocalizedStringWithDefaultValue(v5, 0, 0);
    id v7 = };
  }

  if (v7)
  {
    id v11 = v7;
  }
  else
  {
    _HFLocalizedStringWithDefaultValue(@"HFAccessorySettingGroupItemUnknownTitle", @"HFAccessorySettingGroupItemUnknownTitle", 1);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v11;

  return v12;
}

- (BOOL)_validateKeyPathDependencies
{
  v3 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
  v4 = [v3 settings];

  v5 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
  id v6 = objc_msgSend(v5, "hf_settingsValueManager");

  id v7 = [(HFAccessorySettingGroupItem *)self entity];
  v8 = [v7 BOOLeanKeyPathDependencies];
  if ([v8 count])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__HFAccessorySettingGroupItem__validateKeyPathDependencies__block_invoke;
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

uint64_t __59__HFAccessorySettingGroupItem__validateKeyPathDependencies__block_invoke(uint64_t a1, uint64_t a2)
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
      uint64_t v10 = objc_msgSend(v8, "hf_nodeWithKeyPath:", v9);
      id v11 = [v10 representedObject];

      id v12 = [v11 userInfo];
      id v13 = [v12 objectForKey:@"BooleanDependencyFalseKey"];

      v14 = [v7 title];
      v15 = [v13 componentsSeparatedByString:@"."];
      v16 = [v15 lastObject];
      int v17 = [v14 isEqualToString:v16];

      uint64_t v18 = v17 ^ 1u;
    }
    else
    {
      objc_opt_class();
      id v7 = v4;
      if (objc_opt_isKindOfClass()) {
        v19 = v7;
      }
      else {
        v19 = 0;
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

- (void)_decorateHiddenOrDisabled:(id)a3
{
  id v4 = a3;
  v5 = [(HFAccessorySettingGroupItem *)self entity];
  id v6 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
  id v7 = objc_msgSend(v6, "hf_home");
  unsigned int v8 = objc_msgSend(v7, "hf_currentUserIsAdministrator");

  char v9 = [(HFAccessorySettingGroupItem *)self usageOptions];
  uint64_t v10 = objc_msgSend(v9, "objectForKeyedSubscript:");
  int v11 = [v10 BOOLValue];

  id v12 = [(HFAccessorySettingGroupItem *)self entity];
  id v13 = [v12 adapterIdentifier];

  if (!v13)
  {
    int v27 = 0;
    goto LABEL_21;
  }
  v14 = +[HFHomeKitDispatcher sharedDispatcher];
  v15 = [v14 homeManager];
  int v72 = v11;
  if (![v15 hasOptedToHH2]) {
    goto LABEL_12;
  }
  unsigned int v16 = v8;
  int v17 = v5;
  uint64_t v18 = [(HFAccessorySettingGroupItem *)self entity];
  v19 = [v18 adapterIdentifier];
  if (![v19 isEqualToString:@"SiriLanguageAdapter"])
  {

    v5 = v17;
    unsigned int v8 = v16;
LABEL_12:

LABEL_13:
    v28 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
    v29 = objc_msgSend(v28, "hf_settingsAdapterManager");
    v30 = [(HFAccessorySettingGroupItem *)self entity];
    v31 = [v30 adapterIdentifier];
    v32 = [v29 adapterForIdentifier:v31];

    id v26 = v32;
    if ([v26 conformsToProtocol:&unk_26C107C80]) {
      v33 = v26;
    }
    else {
      v33 = 0;
    }
    id v34 = v33;

    int v11 = v72;
    if (!v34)
    {
      id v26 = 0;
      int v27 = 0;
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  id v20 = [(HFAccessorySettingGroupItem *)self entity];
  v21 = [v20 keyPath];
  char v71 = [v21 isEqualToString:@"root.siri.personalRequests"];

  v5 = v17;
  unsigned int v8 = v16;
  if (v71) {
    goto LABEL_13;
  }
  unint64_t v22 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
  if ([v22 conformsToProtocol:&unk_26C155B48]) {
    char v23 = v22;
  }
  else {
    char v23 = 0;
  }
  id v24 = v23;

  v25 = objc_msgSend(v24, "hf_siriLanguageOptionsManager");

  if (!v25)
  {
    [0 conformsToProtocol:&unk_26C107C80];
    int v35 = 0;
    id v26 = 0;
    int v27 = 0;
    int v11 = v72;
    goto LABEL_18;
  }
  id v26 = v25;

  int v11 = v72;
LABEL_17:
  int v35 = [(HFAccessorySettingGroupItem *)self entity];
  int v27 = [v26 shouldShowSettingsEntity:v35] ^ 1;
LABEL_18:

LABEL_20:
LABEL_21:
  unsigned int v74 = v8;
  if ((v8 | v11) == 1)
  {
    if ([(HFAccessorySettingGroupItem *)self _validateKeyPathDependencies])
    {
      int v36 = 0;
    }
    else
    {
      int v38 = [v5 requiresDependenciesToShowSetting];
      v27 |= v38;
      int v36 = v38 ^ 1;
    }
    [v4 setObject:&unk_26C0F66C0 forKeyedSubscript:@"state"];
    v39 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
    v40 = [v39 settings];
    int v41 = [v40 isControllable];

    uint64_t v37 = v41 ^ 1 | v36;
    uint64_t v42 = [v5 userInfo];
    v43 = [v42 objectForKeyedSubscript:@"TargetViewControllerIdentifier"];
    if (v43)
    {
      v44 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
      v45 = [v44 settings];
      int v46 = [v45 isControllable] ^ 1;

      uint64_t v37 = v46 | v37;
    }
  }
  else
  {
    uint64_t v37 = 0;
    int v27 = 1;
  }
  int v47 = [v4 objectForKeyedSubscript:@"HFAccessorySettingGroupKeyPathKey"];
  if ([v47 isEqual:@"root.general.profiles"])
  {
    if (([(HFAccessorySettingGroupItem *)self _useManagedConfigurationForProfiles] | v27))
    {
LABEL_31:
      uint64_t v48 = 1;
      goto LABEL_38;
    }
  }
  else if (v27)
  {
    goto LABEL_31;
  }
  if (!+[HFUtilities supportsAnalytics]
    && (([v47 isEqual:@"root.general.analytics.logs"] & 1) != 0
     || [v47 isEqual:@"root.general.profiles"]))
  {
    uint64_t v48 = 0;
    uint64_t v37 = 1;
  }
  else
  {
    uint64_t v48 = 0;
  }
LABEL_38:
  if ([v47 isEqual:@"root.music.playbackInfluencesForYou"])
  {
    v49 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v73 = v5;
      objc_opt_class();
      v51 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
      if (objc_opt_isKindOfClass()) {
        v52 = v51;
      }
      else {
        v52 = 0;
      }
      id v53 = v52;

      v54 = [v53 accessory];

      v55 = [v54 softwareVersion];
      if (v55)
      {
        v56 = [v54 softwareVersion];
        long long v75 = *MEMORY[0x263F42388];
        uint64_t v76 = *(void *)(MEMORY[0x263F42388] + 16);
        v57 = [MEMORY[0x263F42630] versionFromOperatingSystemVersion:&v75];
        int v58 = [v56 isAtLeastVersion:v57];
      }
      else
      {
        int v58 = 1;
      }

      uint64_t v48 = v48 | v58;
      v5 = v73;
    }
    else
    {
      v59 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
      objc_opt_class();
      char v60 = objc_opt_isKindOfClass();

      if (v60)
      {
        objc_opt_class();
        v61 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
        if (objc_opt_isKindOfClass()) {
          v62 = v61;
        }
        else {
          v62 = 0;
        }
        id v63 = v62;

        v64 = [v63 mediaProfiles];

        LODWORD(v63) = objc_msgSend(v64, "na_any:", &__block_literal_global_66);
        uint64_t v48 = v48 | v63;
      }
    }
  }
  v65 = [NSNumber numberWithBool:v48];
  [v4 setObject:v65 forKeyedSubscript:@"hidden"];

  v66 = [NSNumber numberWithBool:v37];
  [v4 setObject:v66 forKeyedSubscript:@"isDisabled"];

  if ((v37 & 1) == 0)
  {
    v67 = [(HFAccessorySettingGroupItem *)self usageOptions];
    v68 = [v67 objectForKeyedSubscript:@"HMSettingDisplayOption_AllowNonAdminAccess"];
    int v69 = [v68 BOOLValue];

    if (v69) {
      [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"shouldDisableForNonAdminUsers"];
    }
  }
  v70 = [NSNumber numberWithBool:v74];
  [v4 setObject:v70 forKeyedSubscript:@"administrator"];

  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"remoteAccessDependency"];
}

uint64_t __57__HFAccessorySettingGroupItem__decorateHiddenOrDisabled___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 accessory];
  id v4 = [v3 softwareVersion];
  if (v4)
  {
    v5 = [v2 accessory];
    id v6 = [v5 softwareVersion];
    long long v10 = *MEMORY[0x263F42388];
    uint64_t v11 = *(void *)(MEMORY[0x263F42388] + 16);
    id v7 = [MEMORY[0x263F42630] versionFromOperatingSystemVersion:&v10];
    uint64_t v8 = [v6 isAtLeastVersion:v7];
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (BOOL)_useManagedConfigurationForProfiles
{
  v3 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    v5 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0)
    {
      id v13 = 0;
      goto LABEL_13;
    }
    objc_opt_class();
    long long v10 = [(HFAccessorySettingGroupItem *)self homeKitSettingsVendor];
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    v5 = [v12 mediaProfiles];

    id v7 = [v5 anyObject];
  }
  id v13 = v7;

LABEL_13:
  v14 = [v13 accessory];
  char v15 = [v14 supportsManagedConfigurationProfile];

  return v15;
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (HFAccessorySettingsEntity)entity
{
  return self->_entity;
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
}

- (HMSettingGroup)settingGroup
{
  return self->_settingGroup;
}

- (HMAccessorySelectionSetting)selectionSetting
{
  return self->_selectionSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSetting, 0);
  objc_storeStrong((id *)&self->_settingGroup, 0);
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
}

@end