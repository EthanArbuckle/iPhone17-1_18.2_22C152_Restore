@interface HMAccessorySettingsAdapter
+ (BOOL)defaultSettingsContainsKeyPath:(id)a3;
+ (BOOL)isKeyPathForBooleanSettingType:(id)a3;
+ (BOOL)isKeyPathForConstrainedNumberSettingType:(id)a3;
+ (BOOL)isKeyPathForTapAssistanceSelectionSettingType:(id)a3;
+ (NSArray)languageKeyPaths;
+ (NSArray)tapAssistanceSelectionTitles;
+ (NSString)selectedLanguageSettingKeyPath;
+ (float)constraintSettingScaleFactor;
+ (id)availableLanguagesKeyPath;
+ (id)defaultSettings;
+ (id)defaultSettingsAllKeyPaths;
+ (id)defaultSettingsConstraintsForKeyPath:(id)a3;
+ (id)logCategory;
+ (id)scaleDownNumberSettingValue:(id)a3;
+ (id)scaleUpNumberSettingValue:(id)a3;
+ (id)tapAssistanceSelectionItemWithIndex:(int64_t)a3;
+ (int64_t)itemIndexWithTapAssistanceSelectionItem:(id)a3;
- (BOOL)BOOLeanSettingValueWithKeyPath:(id)a3;
- (BOOL)_addOrUpdateLanguageSetting:(id)a3 availableLanguagesSetting:(id)a4;
- (BOOL)_handleLanguageSettingUpdate:(id)a3;
- (BOOL)didReceiveFirstUpdateEvent;
- (BOOL)isValidSelectionItemNumberConstraintValue:(id)a3 min:(id)a4 max:(id)a5 step:(id)a6;
- (BOOL)settingReflected:(id)a3;
- (BOOL)settingsReflected;
- (BOOL)transformSelectionToInteger:(id)a3 integerValue:(int64_t *)a4;
- (BOOL)updateBooleanSettingWithKeyPath:(id)a3 value:(BOOL)a4;
- (BOOL)updateNumberSettingWithKeyPath:(id)a3 value:(id)a4;
- (BOOL)updateTapAssistanceSelectionSettingWithKeyPath:(id)a3 value:(id)a4;
- (HMAccessorySettingGroup)rootGroup;
- (HMAccessorySettings)accessorySettings;
- (HMAccessorySettingsAdapter)initWithHomeIdentifier:(id)a3 dataSource:(id)a4 controller:(id)a5 workQueue:(id)a6 settingsContainer:(id)a7 containerIdentifier:(id)a8 containerType:(int64_t)a9 settingsControl:(id)a10 context:(id)a11;
- (HMAccessorySettingsAdapterDelegate)delegate;
- (HMAccessorySettingsContainerInternal)settingsContainer;
- (HMAccessorySettingsController)accessorySettingsController;
- (HMAccessorySettingsDataSource)accessoryDataSource;
- (HMControllable)settingsControl;
- (HMLanguageSetting)selectedLanguageSetting;
- (HMLanguageValueListSetting)availableLanguageSetting;
- (NSArray)tapAssistanceSelections;
- (NSUUID)homeIdentifier;
- (NSUUID)settingsContainerIdentifier;
- (OS_dispatch_queue)workQueue;
- (_HMContext)accessoryContext;
- (id)_findSettingInGroupForKeyPath:(id)a3 group:(id)a4;
- (id)_transformAccessorySettingToLanguageSetting:(id)a3;
- (id)accessoryLanguageSetting;
- (id)accessoryNumberSettingWithKeyPath:(id)a3;
- (id)accessorySettingWithKeyPath:(id)a3;
- (id)appendKeyPath:(id)a3 withNextKey:(id)a4;
- (id)createKeyPathArrayWithKeyPath:(id)a3;
- (id)createTapAssistanceSelectionSettingFromNumberConstraint:(id)a3 properties:(unint64_t)a4 value:(id)a5 min:(id)a6 max:(id)a7 step:(id)a8;
- (id)createTapAssistanceSelections;
- (id)findOrAddAccessorySettingGroupWithKeyPath:(id)a3;
- (id)groupKeyArrayFromKeyPath:(id)a3;
- (id)languageSelectionItemFromValue:(id)a3;
- (id)legacyLanguageSettingFromSelectedSetting:(id)a3 selections:(id)a4 settingsReflected:(BOOL)a5;
- (id)logIdentifier;
- (id)numberSettingValueWithKeyPath:(id)a3;
- (id)settingKeyFromKeyPath:(id)a3;
- (id)tapAssistanceSelectionSetting:(id)a3;
- (id)tapAssistanceSelectionSettingValue:(id)a3;
- (id)transformIntegerToSelection:(int64_t)a3;
- (int64_t)containerType;
- (void)_configureForAccessoryWithCompletionHandler:(id)a3;
- (void)_configureForMediaSystemWithCompletionHandler:(id)a3;
- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5;
- (void)configureWithCompletionHandler:(id)a3;
- (void)createRootSettingGroup;
- (void)setAccessorySettings:(id)a3;
- (void)setAvailableLanguageSetting:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidReceiveFirstUpdateEvent:(BOOL)a3;
- (void)setRootGroup:(id)a3;
- (void)setSelectedLanguageSetting:(id)a3;
- (void)setSettingsReflected:(BOOL)a3;
- (void)setTapAssistanceSelections:(id)a3;
- (void)unconfigure;
- (void)updateSettingsReflected:(BOOL)a3;
- (void)updateWithKeyPath:(id)a3 value:(id)a4 completionHandler:(id)a5;
@end

@implementation HMAccessorySettingsAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_tapAssistanceSelections, 0);
  objc_storeStrong((id *)&self->_selectedLanguageSetting, 0);
  objc_storeStrong((id *)&self->_availableLanguageSetting, 0);
  objc_storeStrong((id *)&self->_accessoryContext, 0);
  objc_destroyWeak((id *)&self->_settingsControl);
  objc_destroyWeak((id *)&self->_settingsContainer);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_accessorySettingsController, 0);
  objc_storeStrong((id *)&self->_accessoryDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessorySettings, 0);

  objc_storeStrong((id *)&self->_rootGroup, 0);
}

- (void)setSettingsReflected:(BOOL)a3
{
  self->_settingsReflected = a3;
}

- (BOOL)settingsReflected
{
  return self->_settingsReflected;
}

- (void)setDidReceiveFirstUpdateEvent:(BOOL)a3
{
  self->_didReceiveFirstUpdateEvent = a3;
}

- (BOOL)didReceiveFirstUpdateEvent
{
  return self->_didReceiveFirstUpdateEvent;
}

- (int64_t)containerType
{
  return self->_containerType;
}

- (NSUUID)settingsContainerIdentifier
{
  return self->_settingsContainerIdentifier;
}

- (void)setTapAssistanceSelections:(id)a3
{
}

- (NSArray)tapAssistanceSelections
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSelectedLanguageSetting:(id)a3
{
}

- (HMLanguageSetting)selectedLanguageSetting
{
  return (HMLanguageSetting *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAvailableLanguageSetting:(id)a3
{
}

- (HMLanguageValueListSetting)availableLanguageSetting
{
  return (HMLanguageValueListSetting *)objc_getProperty(self, a2, 96, 1);
}

- (_HMContext)accessoryContext
{
  return (_HMContext *)objc_getProperty(self, a2, 88, 1);
}

- (HMControllable)settingsControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsControl);

  return (HMControllable *)WeakRetained;
}

- (HMAccessorySettingsContainerInternal)settingsContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsContainer);

  return (HMAccessorySettingsContainerInternal *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (HMAccessorySettingsController)accessorySettingsController
{
  return (HMAccessorySettingsController *)objc_getProperty(self, a2, 48, 1);
}

- (HMAccessorySettingsDataSource)accessoryDataSource
{
  return (HMAccessorySettingsDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMAccessorySettingsAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMAccessorySettingsAdapterDelegate *)WeakRetained;
}

- (void)setAccessorySettings:(id)a3
{
}

- (HMAccessorySettings)accessorySettings
{
  return (HMAccessorySettings *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRootGroup:(id)a3
{
}

- (HMAccessorySettingGroup)rootGroup
{
  return (HMAccessorySettingGroup *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(HMAccessorySettingsAdapter *)self containerType];
  if (v3 == 2)
  {
    v4 = [(HMAccessorySettingsAdapter *)self settingsContainer];
    v6 = [v4 containerUUID];
    v5 = [v6 UUIDString];

    goto LABEL_5;
  }
  if (v3 == 1)
  {
    v4 = [(HMAccessorySettingsAdapter *)self settingsContainerIdentifier];
    v5 = [v4 UUIDString];
LABEL_5:

    goto LABEL_9;
  }
  v7 = (void *)MEMORY[0x19F3A64A0]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unknown settings container type", (uint8_t *)&v12, 0xCu);
  }
  v5 = @"wrong-log-identifier";
LABEL_9:

  return v5;
}

- (BOOL)settingReflected:(id)a3
{
  int64_t v3 = [(HMAccessorySettingsAdapter *)self accessorySettingWithKeyPath:a3];
  v4 = v3;
  if (v3) {
    char v5 = [v3 isReflected];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)tapAssistanceSelectionSettingValue:(id)a3
{
  int64_t v3 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelectionSetting:a3];
  v4 = [v3 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)tapAssistanceSelectionSetting:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isKeyPathForTapAssistanceSelectionSettingType:v4])
  {
    char v5 = [(HMAccessorySettingsAdapter *)self accessorySettingWithKeyPath:v4];
    objc_opt_class();
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
    id v7 = 0;
  }

  return v7;
}

- (id)numberSettingValueWithKeyPath:(id)a3
{
  int64_t v3 = [(HMAccessorySettingsAdapter *)self accessorySettingWithKeyPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    id v6 = [v3 value];
  }
  else
  {
    id v6 = &unk_1EEF07F20;
  }

  return v6;
}

- (id)accessoryLanguageSetting
{
  int64_t v3 = [(id)objc_opt_class() selectedLanguageSettingKeyPath];
  id v4 = [(HMAccessorySettingsAdapter *)self accessorySettingWithKeyPath:v3];

  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)BOOLeanSettingValueWithKeyPath:(id)a3
{
  int64_t v3 = [(HMAccessorySettingsAdapter *)self accessorySettingWithKeyPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    id v6 = [v3 value];
    id v7 = [NSNumber numberWithInt:1];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)transformSelectionToInteger:(id)a3 integerValue:(int64_t *)a4
{
  id v6 = a3;
  id v7 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelections];

  if (v7)
  {
    char v8 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelections];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__HMAccessorySettingsAdapter_transformSelectionToInteger_integerValue___block_invoke;
    v11[3] = &unk_1E5940B70;
    id v12 = v6;
    *a4 = [v8 indexOfObjectPassingTest:v11];

    BOOL v9 = *a4 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __71__HMAccessorySettingsAdapter_transformSelectionToInteger_integerValue___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

- (id)transformIntegerToSelection:(int64_t)a3
{
  uint64_t v5 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelections];

  id v6 = 0;
  if ((a3 & 0x8000000000000000) == 0 && v5)
  {
    id v7 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelections];
    unint64_t v8 = [v7 count];

    if (v8 <= a3)
    {
      id v6 = 0;
    }
    else
    {
      BOOL v9 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelections];
      id v6 = [v9 objectAtIndexedSubscript:a3];
    }
  }

  return v6;
}

- (id)createTapAssistanceSelections
{
  v2 = [(id)objc_opt_class() tapAssistanceSelectionTitles];
  int64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_76_27797);

  return v3;
}

HMAccessorySelectionSettingItem *__59__HMAccessorySettingsAdapter_createTapAssistanceSelections__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [[HMAccessorySelectionSettingItem alloc] initWithTitle:v2];

  return v3;
}

- (id)languageSelectionItemFromValue:(id)a3
{
  id v3 = a3;
  id v4 = [v3 inputLanguageCode];
  uint64_t v5 = [v3 outputVoiceLanguageCode];
  id v6 = [v3 outputVoiceGenderCode];
  id v7 = [&stru_1EEE9DD88 stringByAppendingFormat:@"%@,%@,%@,%@", v4, v5, v6, @"d"];

  unint64_t v8 = [v3 voiceName];

  if (v8)
  {
    BOOL v9 = [v3 voiceName];
    uint64_t v10 = [v7 stringByAppendingFormat:@",%@", v9];

    id v7 = (void *)v10;
  }
  v11 = [[HMAccessorySelectionSettingItem alloc] initWithTitle:v7];

  return v11;
}

- (id)legacyLanguageSettingFromSelectedSetting:(id)a3 selections:(id)a4 settingsReflected:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() selectedLanguageSettingKeyPath];
  v11 = [(HMAccessorySettingsAdapter *)self settingKeyFromKeyPath:v10];

  id v12 = [v8 languageValues];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__HMAccessorySettingsAdapter_legacyLanguageSettingFromSelectedSetting_selections_settingsReflected___block_invoke;
  v18[3] = &unk_1E5940B28;
  v18[4] = self;
  v13 = objc_msgSend(v12, "na_map:", v18);

  uint64_t v14 = [v9 languageValue];

  v15 = [(HMAccessorySettingsAdapter *)self languageSelectionItemFromValue:v14];

  v16 = [[HMAccessorySelectionSetting alloc] initWithKey:v11 properties:3 value:v15 items:v13];
  [(HMAccessorySetting *)v16 updateReflected:v5];

  return v16;
}

uint64_t __100__HMAccessorySettingsAdapter_legacyLanguageSettingFromSelectedSetting_selections_settingsReflected___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) languageSelectionItemFromValue:a2];
}

- (BOOL)_addOrUpdateLanguageSetting:(id)a3 availableLanguagesSetting:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() selectedLanguageSettingKeyPath];
  if (v6 && v7)
  {
    id v9 = [(HMAccessorySettingsAdapter *)self rootGroup];
    uint64_t v10 = [(HMAccessorySettingsAdapter *)self _findSettingInGroupForKeyPath:v8 group:v9];

    v33 = [(HMAccessorySettingsAdapter *)self groupKeyArrayFromKeyPath:v8];
    v34 = -[HMAccessorySettingsAdapter findOrAddAccessorySettingGroupWithKeyPath:](self, "findOrAddAccessorySettingGroupWithKeyPath:");
    id v11 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    BOOL v14 = v13 == 0;
    id v15 = v11;
    if (!v13)
    {
      v16 = [(HMAccessorySettingsAdapter *)self legacyLanguageSettingFromSelectedSetting:v6 selections:v7 settingsReflected:[(HMAccessorySettingsAdapter *)self settingsReflected]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
      id v15 = v17;

      v18 = [v15 internal];
      v19 = [(HMAccessorySettingsAdapter *)self accessorySettings];
      v20 = [(HMAccessorySettingsAdapter *)self accessoryContext];
      [v18 configureWithAccessorySettings:v19 context:v20 shouldHandleUpdatedValue:0];

      [v34 addSetting:v15];
    }
    v21 = [(HMAccessorySettingsAdapter *)self legacyLanguageSettingFromSelectedSetting:v6 selections:v7 settingsReflected:[(HMAccessorySettingsAdapter *)self settingsReflected]];
    v22 = [v15 value];
    v23 = [v21 value];
    char v24 = [v22 isEqual:v23];

    if ((v24 & 1) == 0)
    {
      v25 = [v21 value];
      [v15 updateValue:v25];

      BOOL v14 = 1;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x19F3A64A0]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = HMFGetLogIdentifier();
      v30 = [(HMAccessorySettingsAdapter *)v27 selectedLanguageSetting];
      v31 = [(HMAccessorySettingsAdapter *)v27 availableLanguageSetting];
      *(_DWORD *)buf = 138543874;
      v36 = v29;
      __int16 v37 = 2112;
      v38 = v30;
      __int16 v39 = 2112;
      v40 = v31;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_INFO, "%{public}@Missing selected language = %@ or available language settings = %@", buf, 0x20u);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_findSettingInGroupForKeyPath:(id)a3 group:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 settings];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__HMAccessorySettingsAdapter__findSettingInGroupForKeyPath_group___block_invoke;
    v18[3] = &unk_1E5942AC8;
    id v10 = v6;
    id v19 = v10;
    id v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", v18);

    if (v11)
    {
      id v12 = v11;
    }
    else
    {
      id v13 = [v8 groups];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __66__HMAccessorySettingsAdapter__findSettingInGroupForKeyPath_group___block_invoke_2;
      v16[3] = &unk_1E5940B00;
      v16[4] = self;
      id v17 = v10;
      BOOL v14 = objc_msgSend(v13, "na_map:", v16);

      if ([v14 count])
      {
        id v12 = [v14 firstObject];
      }
      else
      {
        id v12 = 0;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __66__HMAccessorySettingsAdapter__findSettingInGroupForKeyPath_group___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 keyPath];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __66__HMAccessorySettingsAdapter__findSettingInGroupForKeyPath_group___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _findSettingInGroupForKeyPath:*(void *)(a1 + 40) group:a2];
}

- (BOOL)_handleLanguageSettingUpdate:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 keyPath];
  id v6 = [(id)objc_opt_class() selectedLanguageSettingKeyPath];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (!v10)
    {
      id v11 = (void *)MEMORY[0x19F3A64A0]();
      id v12 = self;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        BOOL v14 = HMFGetLogIdentifier();
        int v26 = 138543874;
        v27 = v14;
        __int16 v28 = 2112;
        uint64_t v29 = 0;
        __int16 v30 = 2112;
        id v31 = v8;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected setting type for setting = %@, cast from object:%@", (uint8_t *)&v26, 0x20u);
      }
    }
    [(HMAccessorySettingsAdapter *)self setSelectedLanguageSetting:v10];
LABEL_16:

    goto LABEL_17;
  }
  id v15 = [v4 keyPath];
  v16 = [(id)objc_opt_class() availableLanguagesKeyPath];
  int v17 = [v15 isEqual:v16];

  if (v17)
  {
    id v10 = v4;
    if (!v10)
    {
      v18 = (void *)MEMORY[0x19F3A64A0]();
      id v19 = self;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        int v26 = 138543618;
        v27 = v21;
        __int16 v28 = 2112;
        uint64_t v29 = 0;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unexpected setting type for setting = %@", (uint8_t *)&v26, 0x16u);
      }
    }
    [(HMAccessorySettingsAdapter *)self setAvailableLanguageSetting:v10];
    goto LABEL_16;
  }
LABEL_17:
  v22 = [(HMAccessorySettingsAdapter *)self selectedLanguageSetting];
  v23 = [(HMAccessorySettingsAdapter *)self availableLanguageSetting];
  BOOL v24 = [(HMAccessorySettingsAdapter *)self _addOrUpdateLanguageSetting:v22 availableLanguagesSetting:v23];

  return v24;
}

- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HMAccessorySettingsAdapter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__HMAccessorySettingsAdapter_accessorySettingsDataSource_didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke;
  block[3] = &unk_1E5945650;
  id v13 = v8;
  BOOL v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __119__HMAccessorySettingsAdapter_accessorySettingsDataSource_didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(*(id *)(a1 + 32), "hmf_isEmpty"))
  {
    id v6 = [*(id *)(a1 + 40) accessorySettings];
    id v7 = [v6 settingsContainerInternal];

    if (v7)
    {
      if ([*(id *)(a1 + 40) containerType] == 1)
      {
        id v8 = (void *)MEMORY[0x19F3A64A0]();
        id v9 = *(id *)(a1 + 40);
        id v10 = HMFGetOSLogHandle();
        v53 = v7;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = HMFGetLogIdentifier();
          id v12 = *(void **)(a1 + 48);
          uint64_t v13 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v65 = v11;
          __int16 v66 = 2112;
          v67 = v12;
          __int16 v68 = 2112;
          uint64_t v69 = v13;
          BOOL v14 = "%{public}@Adapter did receive setting update: accessory: %@ settings: %@";
LABEL_14:
          _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, v14, buf, 0x20u);

          goto LABEL_15;
        }
        goto LABEL_15;
      }
      uint64_t v17 = [*(id *)(a1 + 40) containerType];
      id v8 = (void *)MEMORY[0x19F3A64A0]();
      id v9 = *(id *)(a1 + 40);
      v18 = HMFGetOSLogHandle();
      id v10 = v18;
      if (v17 == 2)
      {
        v53 = v7;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v11 = HMFGetLogIdentifier();
          id v19 = *(void **)(a1 + 48);
          uint64_t v20 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v65 = v11;
          __int16 v66 = 2112;
          v67 = v19;
          __int16 v68 = 2112;
          uint64_t v69 = v20;
          BOOL v14 = "%{public}@Adapter did receive setting update: media system: %@ settings: %@";
          goto LABEL_14;
        }
LABEL_15:

        v56 = [MEMORY[0x1E4F1CA48] array];
        v55 = [*(id *)(a1 + 40) delegate];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id obj = *(id *)(a1 + 32);
        uint64_t v58 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
        if (v58)
        {
          uint64_t v21 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v60 != v21) {
                objc_enumerationMutation(obj);
              }
              v23 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              BOOL v24 = [v23 keyPath];
              if (([*(id *)(a1 + 40) didReceiveFirstUpdateEvent] & 1) == 0)
              {
                v25 = [*(id *)(a1 + 40) accessorySettings];

                if (v25)
                {
                  int v26 = (void *)MEMORY[0x19F3A64A0]();
                  id v27 = *(id *)(a1 + 40);
                  __int16 v28 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v29 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543362;
                    v65 = v29;
                    _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_INFO, "%{public}@Received first update event, notifying delegate we have a valid settings tree.", buf, 0xCu);
                  }
                  __int16 v30 = *(void **)(a1 + 40);
                  id v31 = [v30 accessorySettings];
                  [v55 adapter:v30 didUpdateSettings:v31];

                  [*(id *)(a1 + 40) setDidReceiveFirstUpdateEvent:1];
                }
              }
              id v32 = v23;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v33 = v32;
              }
              else {
                v33 = 0;
              }
              id v34 = v33;

              if (v34)
              {
                if (objc_msgSend(*(id *)(a1 + 40), "updateBooleanSettingWithKeyPath:value:", v24, objc_msgSend(v34, "BOOLValue")))objc_msgSend(v56, "addObject:", v24); {
              }
                }
              else
              {
                id v35 = v32;
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v36 = v35;
                }
                else {
                  v36 = 0;
                }
                id v37 = v36;

                if (v37)
                {
                  v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v37, "integerValue"));
                  __int16 v39 = [(id)objc_opt_class() scaleDownNumberSettingValue:v38];
                  if ([(id)objc_opt_class() isKeyPathForTapAssistanceSelectionSettingType:v24])
                  {
                    v40 = objc_msgSend(*(id *)(a1 + 40), "transformIntegerToSelection:", objc_msgSend(v39, "integerValue"));
                    if (v40
                      && [*(id *)(a1 + 40) updateTapAssistanceSelectionSettingWithKeyPath:v24 value:v40])
                    {
                      [v56 addObject:v24];
                    }
                  }
                  else if ([*(id *)(a1 + 40) updateNumberSettingWithKeyPath:v24 value:v39])
                  {
                    [v56 addObject:v24];
                  }
                }
                else
                {
                  uint64_t v41 = [(id)objc_opt_class() languageKeyPaths];
                  int v42 = [v41 containsObject:v24];

                  if (v42)
                  {
                    if ([*(id *)(a1 + 40) _handleLanguageSettingUpdate:v35]) {
                      [v56 addObject:v24];
                    }
                  }
                  else
                  {
                    v43 = (void *)MEMORY[0x19F3A64A0]();
                    id v44 = *(id *)(a1 + 40);
                    v45 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v46 = v54 = v43;
                      v47 = [v35 keyPath];
                      *(_DWORD *)buf = 138543618;
                      v65 = v46;
                      __int16 v66 = 2112;
                      v67 = v47;
                      _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_ERROR, "%{public}@The setting object for key path: %@ is not supported in the adapter.", buf, 0x16u);

                      v43 = v54;
                    }
                  }
                }
              }
            }
            uint64_t v58 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
          }
          while (v58);
        }

        id v7 = v53;
        if ([v56 count])
        {
          v48 = (void *)MEMORY[0x19F3A64A0]();
          id v49 = *(id *)(a1 + 40);
          v50 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            v51 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v65 = v51;
            __int16 v66 = 2112;
            v67 = v56;
            _os_log_impl(&dword_19D1A8000, v50, OS_LOG_TYPE_INFO, "%{public}@Adapter did update for settings %@", buf, 0x16u);
          }
          [v55 adapter:*(void *)(a1 + 40) didUpdateSettingKeyPaths:v56];
        }

        goto LABEL_60;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v65 = v52;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unknown settings container type this adapter", buf, 0xCu);
      }
    }
    else
    {
      id v8 = (void *)MEMORY[0x19F3A64A0]();
      id v9 = *(id *)(a1 + 40);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        v16 = [*(id *)(a1 + 40) accessorySettings];
        *(_DWORD *)buf = 138543618;
        v65 = v15;
        __int16 v66 = 2112;
        v67 = v16;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@settings container not found, not processing. settings: %@", buf, 0x16u);
      }
    }

LABEL_60:

    return;
  }
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 40);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v65 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Event delegate call from dataSource has empty settings array.", buf, 0xCu);
  }
}

- (BOOL)updateTapAssistanceSelectionSettingWithKeyPath:(id)a3 value:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelectionSetting:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 value];
    id v11 = (void *)MEMORY[0x19F3A64A0]([v9 updateValue:v7]);
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      BOOL v14 = HMFGetLogIdentifier();
      id v15 = [v9 keyPath];
      v16 = [v9 value];
      int v20 = 138544130;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      v23 = v15;
      __int16 v24 = 2112;
      v25 = v10;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully updated the tap assistance selection setting: %@, old value: %@, new value: %@", (uint8_t *)&v20, 0x2Au);
    }
    uint64_t v17 = [v9 value];
    int v18 = [v10 isEqual:v17] ^ 1;
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)updateNumberSettingWithKeyPath:(id)a3 value:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMAccessorySettingsAdapter *)self accessorySettingWithKeyPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [v10 value];
    id v12 = v7;
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]([v10 updateValue:v12]);
    BOOL v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      [v8 keyPath];
      uint64_t v17 = v21 = v13;
      [v10 value];
      int v18 = v22 = v7;
      *(_DWORD *)buf = 138544130;
      __int16 v24 = v16;
      __int16 v25 = 2112;
      __int16 v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      __int16 v30 = v18;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully updated the number setting: %@, old value: %@, new value: %@", buf, 0x2Au);

      id v7 = v22;
      uint64_t v13 = v21;
    }
    int v19 = [v11 isEqual:v12] ^ 1;
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (BOOL)updateBooleanSettingWithKeyPath:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMAccessorySettingsAdapter *)self accessorySettingWithKeyPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [v9 value];
    id v11 = &unk_1EEF07E90;
    if (v4) {
      id v11 = &unk_1EEF07E78;
    }
    id v12 = v11;
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]([v9 updateValue:v12]);
    BOOL v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      uint64_t v17 = [v7 keyPath];
      [v9 value];
      v18 = uint64_t v21 = v13;
      *(_DWORD *)buf = 138544130;
      v23 = v16;
      __int16 v24 = 2112;
      __int16 v25 = v17;
      __int16 v26 = 2112;
      __int16 v27 = v10;
      __int16 v28 = 2112;
      __int16 v29 = v18;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully updated the BOOLean setting: %@, old value: %@, new value: %@", buf, 0x2Au);

      uint64_t v13 = v21;
    }

    int v19 = [v10 isEqual:v12] ^ 1;
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (id)accessorySettingWithKeyPath:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMAccessorySettingsAdapter *)self groupKeyArrayFromKeyPath:v4];
  if (objc_msgSend(v5, "hmf_isEmpty"))
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [(HMAccessorySettingsAdapter *)self rootGroup];
    id v8 = [v7 keyPath];
    id v9 = [v5 objectAtIndexedSubscript:0];
    int v10 = [v9 isEqual:v8];

    if (v10)
    {
      id v24 = v4;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v5;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        char v15 = 1;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            if ((v15 & 1) == 0)
            {
              uint64_t v17 = [(HMAccessorySettingsAdapter *)self appendKeyPath:v8 withNextKey:*(void *)(*((void *)&v25 + 1) + 8 * i)];

              uint64_t v18 = [v7 accessorySettingGroupWithKeyPath:v17];

              if (!v18)
              {
                int v19 = (void *)MEMORY[0x19F3A64A0]();
                int v20 = self;
                uint64_t v21 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  id v22 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  uint64_t v30 = v22;
                  __int16 v31 = 2112;
                  id v32 = v17;
                  _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot find group with the key path: %@", buf, 0x16u);
                }

                id v7 = 0;
                id v6 = 0;
                id v4 = v24;
                goto LABEL_20;
              }
              id v8 = v17;
              id v7 = (void *)v18;
            }
            char v15 = 0;
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
          char v15 = 0;
          if (v13) {
            continue;
          }
          break;
        }
      }

      id v4 = v24;
      id v6 = [v7 accessorySettingWithKeyPath:v24];
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v17 = v8;
LABEL_20:
  }

  return v6;
}

- (id)accessoryNumberSettingWithKeyPath:(id)a3
{
  id v3 = [(HMAccessorySettingsAdapter *)self accessorySettingWithKeyPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)isValidSelectionItemNumberConstraintValue:(id)a3 min:(id)a4 max:(id)a5 step:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v15 = ![v10 integerValue]
     && [v11 integerValue] == 2
     && (uint64_t v13 = [v9 integerValue], v13 >= objc_msgSend(v10, "integerValue"))
     && (uint64_t v14 = [v9 integerValue], v14 <= objc_msgSend(v11, "integerValue"))
     && [v12 integerValue] == 1;

  return v15;
}

- (id)createTapAssistanceSelectionSettingFromNumberConstraint:(id)a3 properties:(unint64_t)a4 value:(id)a5 min:(id)a6 max:(id)a7 step:(id)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([(HMAccessorySettingsAdapter *)self isValidSelectionItemNumberConstraintValue:v15 min:v16 max:v17 step:v18])
  {
    uint64_t v19 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelections];
    if (v19)
    {
      int v20 = (void *)v19;
      uint64_t v21 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelections];
      uint64_t v22 = [v21 count];

      if (v22 == 3)
      {
        v23 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelections];
        id v24 = objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v15, "integerValue"));

        long long v25 = [HMAccessorySelectionSetting alloc];
        long long v26 = [(HMAccessorySettingsAdapter *)self tapAssistanceSelections];
        long long v27 = [(HMAccessorySelectionSetting *)v25 initWithKey:v14 properties:a4 value:v24 items:v26];

        goto LABEL_11;
      }
    }
    long long v28 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v29 = self;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      int v34 = 138543362;
      id v35 = v31;
      id v32 = "%{public}@Tab assistance selections array is nil or the number selection items is not 3";
      goto LABEL_9;
    }
  }
  else
  {
    long long v28 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v29 = self;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      int v34 = 138543362;
      id v35 = v31;
      id v32 = "%{public}@Invalid number constraints for tab assistance selection item";
LABEL_9:
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v34, 0xCu);
    }
  }

  long long v27 = 0;
LABEL_11:

  return v27;
}

- (void)createRootSettingGroup
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessorySettingsAdapter *)self rootGroup];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v65 = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Warning: Settings adapter root group has already been constructed.", buf, 0xCu);
    }
    return;
  }
  id v8 = [(HMAccessorySettingsAdapter *)self createTapAssistanceSelections];
  [(HMAccessorySettingsAdapter *)self setTapAssistanceSelections:v8];

  id v9 = [(id)objc_opt_class() defaultSettings];
  id v10 = [v9 allKeys];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v10;
  uint64_t v59 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (!v59) {
    goto LABEL_24;
  }
  uint64_t v58 = *(void *)v61;
  *(void *)&long long v11 = 138543618;
  long long v50 = v11;
  do
  {
    for (uint64_t i = 0; i != v59; ++i)
    {
      if (*(void *)v61 != v58) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v60 + 1) + 8 * i);
      id v14 = -[HMAccessorySettingsAdapter groupKeyArrayFromKeyPath:](self, "groupKeyArrayFromKeyPath:", v13, v50);
      uint64_t v15 = [(HMAccessorySettingsAdapter *)self findOrAddAccessorySettingGroupWithKeyPath:v14];
      id v16 = [(HMAccessorySettingsAdapter *)self settingKeyFromKeyPath:v13];
      id v17 = [(id)objc_opt_class() defaultSettings];
      id v18 = objc_msgSend(v17, "hmf_arrayForKey:", v13);

      if ([v18 count] == 6)
      {
        v57 = (void *)v15;
        uint64_t v19 = [v18 objectAtIndexedSubscript:0];
        int v20 = [v18 objectAtIndexedSubscript:1];
        uint64_t v21 = [v18 objectAtIndexedSubscript:2];
        uint64_t v22 = [v18 objectAtIndexedSubscript:3];
        v55 = (void *)v22;
        v56 = v16;
        if ([(id)objc_opt_class() isKeyPathForTapAssistanceSelectionSettingType:v13])
        {
          v23 = [(HMAccessorySettingsAdapter *)self createTapAssistanceSelectionSettingFromNumberConstraint:v16 properties:3 value:v22 min:v19 max:v20 step:v21];
          if (!v23)
          {
            context = (void *)MEMORY[0x19F3A64A0]();
            id v24 = self;
            long long v25 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v51 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v50;
              v65 = v51;
              __int16 v66 = 2112;
              v67 = v13;
              _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Error in creating setting for keypath %@", buf, 0x16u);
            }
            long long v26 = v57;
            goto LABEL_21;
          }
        }
        else
        {
          v23 = [[HMAccessoryNumberSetting alloc] initWithKey:v16 properties:3 value:v22 minimumValue:v19 maximumValue:v20 stepValue:v21];
        }
        id v32 = [(HMAccessorySetting *)v23 internal];
        [(HMAccessorySettingsAdapter *)self accessorySettings];
        contexta = v18;
        v33 = v14;
        int v34 = v21;
        v36 = id v35 = v20;
        [(HMAccessorySettingsAdapter *)self accessoryContext];
        v38 = id v37 = v19;
        [v32 configureWithAccessorySettings:v36 context:v38 shouldHandleUpdatedValue:0];

        uint64_t v19 = v37;
        int v20 = v35;
        uint64_t v21 = v34;
        id v14 = v33;
        id v18 = contexta;

        long long v26 = v57;
        [v57 addSetting:v23];

LABEL_21:
        id v16 = v56;
        goto LABEL_22;
      }
      long long v27 = (void *)MEMORY[0x19F3A64A0]();
      long long v28 = self;
      __int16 v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v31 = uint64_t v30 = v16;
        *(_DWORD *)buf = 138543362;
        v65 = v31;
        _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Value array size mismatch", buf, 0xCu);

        id v16 = v30;
      }

      long long v26 = (void *)v15;
LABEL_22:
    }
    uint64_t v59 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
  }
  while (v59);
LABEL_24:

  if ([(HMAccessorySettingsAdapter *)self containerType] == 1)
  {
    __int16 v39 = (void *)MEMORY[0x19F3A64A0]();
    v40 = self;
    uint64_t v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      int v42 = HMFGetLogIdentifier();
      v43 = [(HMAccessorySettingsAdapter *)v40 homeIdentifier];
      id v44 = [(HMAccessorySettingsAdapter *)v40 settingsContainerIdentifier];
      *(_DWORD *)buf = 138543874;
      v65 = v42;
      __int16 v66 = 2112;
      v67 = v43;
      __int16 v68 = 2112;
      uint64_t v69 = v44;
      v45 = "%{public}@Root group created for home: %@, accessory: %@";
      goto LABEL_30;
    }
  }
  else
  {
    int64_t v46 = [(HMAccessorySettingsAdapter *)self containerType];
    __int16 v39 = (void *)MEMORY[0x19F3A64A0]();
    v47 = self;
    v48 = HMFGetOSLogHandle();
    uint64_t v41 = v48;
    if (v46 == 2)
    {
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      int v42 = HMFGetLogIdentifier();
      v43 = [(HMAccessorySettingsAdapter *)v47 homeIdentifier];
      id v44 = [(HMAccessorySettingsAdapter *)v47 settingsContainerIdentifier];
      *(_DWORD *)buf = 138543874;
      v65 = v42;
      __int16 v66 = 2112;
      v67 = v43;
      __int16 v68 = 2112;
      uint64_t v69 = v44;
      v45 = "%{public}@Root group created for home: %@, media system: %@";
LABEL_30:
      _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_INFO, v45, buf, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      int v42 = HMFGetLogIdentifier();
      id v49 = [(HMAccessorySettingsAdapter *)v47 homeIdentifier];
      *(_DWORD *)buf = 138543618;
      v65 = v42;
      __int16 v66 = 2112;
      v67 = v49;
      _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@Error in root group creation for home: %@", buf, 0x16u);
    }
  }
LABEL_34:
}

- (id)findOrAddAccessorySettingGroupWithKeyPath:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessorySettingsAdapter *)self rootGroup];
  if (v5)
  {
  }
  else
  {
    id v6 = [(HMAccessorySettingsAdapter *)self accessorySettings];

    if (!v6)
    {
      id v7 = [HMAccessorySettingGroup alloc];
      id v8 = [v4 firstObject];
      id v9 = [(HMAccessorySettingGroup *)v7 initWithKeyPath:v8];
      [(HMAccessorySettingsAdapter *)self setRootGroup:v9];

      id v10 = [HMAccessorySettings alloc];
      long long v11 = [(HMAccessorySettingsAdapter *)self settingsContainer];
      id v12 = [(HMAccessorySettingsAdapter *)self settingsControl];
      uint64_t v13 = [(HMAccessorySettingsAdapter *)self rootGroup];
      id v14 = [(HMAccessorySettings *)v10 initWithSettingsContainer:v11 settingsControl:v12 rootGroup:v13];
      [(HMAccessorySettingsAdapter *)self setAccessorySettings:v14];

      uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
      id v16 = self;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v52 = v18;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Creating RootGroup and AccessorySettings for the adapter", buf, 0xCu);
      }
    }
  }
  uint64_t v19 = [(HMAccessorySettingsAdapter *)self rootGroup];
  if (v19)
  {
    int v20 = (void *)v19;
    uint64_t v21 = [(HMAccessorySettingsAdapter *)self accessorySettings];

    if (v21)
    {
      id v22 = [(HMAccessorySettingsAdapter *)self rootGroup];
      v23 = [v22 keyPath];
      if (objc_msgSend(v4, "hmf_isEmpty"))
      {
        id v24 = (void *)MEMORY[0x19F3A64A0]();
        long long v25 = self;
        long long v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          long long v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v52 = v27;
          _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Group key array cannot be empty.", buf, 0xCu);
        }
      }
      else
      {
        v33 = [v4 objectAtIndexedSubscript:0];
        int v34 = [v23 isEqual:v33];

        if (v34)
        {
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v45 = v4;
          id v35 = v4;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v46 objects:v50 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v47;
            char v39 = 1;
            do
            {
              for (uint64_t i = 0; i != v37; ++i)
              {
                if (*(void *)v47 != v38) {
                  objc_enumerationMutation(v35);
                }
                if ((v39 & 1) == 0)
                {
                  uint64_t v41 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                  uint64_t v42 = [(HMAccessorySettingsAdapter *)self appendKeyPath:v23 withNextKey:v41];

                  v43 = [v22 accessorySettingGroupWithKeyPath:v42];
                  if (!v43)
                  {
                    v43 = [[HMAccessorySettingGroup alloc] initWithKeyPath:v41];
                    [v22 addGroup:v43];
                  }

                  id v22 = v43;
                  v23 = (void *)v42;
                }
                char v39 = 0;
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v46 objects:v50 count:16];
              char v39 = 0;
            }
            while (v37);
          }

          id v22 = v22;
          id v32 = v22;
          id v4 = v45;
          goto LABEL_30;
        }
      }
      id v32 = 0;
LABEL_30:

      goto LABEL_31;
    }
  }
  long long v28 = (void *)MEMORY[0x19F3A64A0]();
  __int16 v29 = self;
  uint64_t v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    __int16 v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v52 = v31;
    _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Root group or accessory settings object is nil", buf, 0xCu);
  }
  id v32 = 0;
LABEL_31:

  return v32;
}

- (id)appendKeyPath:(id)a3 withNextKey:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@.%@", a3, a4];
}

- (id)settingKeyFromKeyPath:(id)a3
{
  id v3 = [(HMAccessorySettingsAdapter *)self createKeyPathArrayWithKeyPath:a3];
  if (objc_msgSend(v3, "hmf_isEmpty"))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 lastObject];
  }

  return v4;
}

- (id)groupKeyArrayFromKeyPath:(id)a3
{
  id v3 = [(HMAccessorySettingsAdapter *)self createKeyPathArrayWithKeyPath:a3];
  id v4 = (void *)[v3 mutableCopy];
  if (objc_msgSend(v4, "hmf_isEmpty"))
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    [v4 removeLastObject];
    id v5 = v4;
  }

  return v5;
}

- (id)createKeyPathArrayWithKeyPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"."];
  if ((unint64_t)[v5 count] > 1)
  {
    id v10 = v5;
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2048;
      uint64_t v17 = [v5 count];
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@The keypath %@ needs at least 2 keys, but only has %lu component.", (uint8_t *)&v12, 0x20u);
    }
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (void)updateSettingsReflected:(BOOL)a3
{
  id v5 = [(HMAccessorySettingsAdapter *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HMAccessorySettingsAdapter_updateSettingsReflected___block_invoke;
  v6[3] = &unk_1E59413F8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __54__HMAccessorySettingsAdapter_updateSettingsReflected___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() defaultSettings];
  v43 = v2;
  if (v2)
  {
    id v3 = v2;
    [v2 allKeys];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v48 objects:v58 count:16];
    long long v46 = v4;
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v49;
      *(void *)&long long v6 = 138543874;
      long long v42 = v6;
      uint64_t v45 = *(void *)v49;
      do
      {
        uint64_t v9 = 0;
        uint64_t v44 = v7;
        do
        {
          if (*(void *)v49 != v8) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(void **)(*((void *)&v48 + 1) + 8 * v9);
          long long v11 = objc_msgSend(v3, "objectForKey:", v10, v42);
          if (v11)
          {
            int v12 = [*(id *)(a1 + 32) accessorySettingWithKeyPath:v10];
            uint64_t v13 = [v11 objectAtIndexedSubscript:5];
            __int16 v14 = v13;
            if (v12) {
              BOOL v15 = v13 == 0;
            }
            else {
              BOOL v15 = 1;
            }
            if (!v15 && [v13 BOOLValue])
            {
              context = (void *)MEMORY[0x19F3A64A0]();
              id v16 = *(id *)(a1 + 32);
              HMFGetOSLogHandle();
              v18 = uint64_t v17 = a1;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                uint64_t v19 = HMFGetLogIdentifier();
                int v20 = HMFBooleanToString();
                *(_DWORD *)buf = v42;
                uint64_t v53 = v19;
                __int16 v54 = 2112;
                v55 = v10;
                __int16 v56 = 2112;
                v57 = v20;
                _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating setting %@ reflected to: %@", buf, 0x20u);

                id v3 = v43;
                uint64_t v7 = v44;
              }

              [v12 updateReflected:*(unsigned __int8 *)(v17 + 40)];
              a1 = v17;
              uint64_t v8 = v45;
              id v4 = v46;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v4 countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v7);
    }

    uint64_t v21 = *(void **)(a1 + 32);
    id v22 = [(id)objc_opt_class() selectedLanguageSettingKeyPath];
    v23 = [v21 accessorySettingWithKeyPath:v22];

    if (v23)
    {
      long long v25 = (void *)MEMORY[0x19F3A64A0]();
      id v26 = *(id *)(a1 + 32);
      long long v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        long long v28 = HMFGetLogIdentifier();
        __int16 v29 = [(id)objc_opt_class() selectedLanguageSettingKeyPath];
        uint64_t v30 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        uint64_t v53 = v28;
        __int16 v54 = 2112;
        v55 = v29;
        __int16 v56 = 2112;
        v57 = v30;
        _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating language setting %@ reflected to: %@", buf, 0x20u);
      }
      uint64_t v24 = [v23 updateReflected:*(unsigned __int8 *)(a1 + 40)];
    }
    __int16 v31 = (void *)MEMORY[0x19F3A64A0](v24);
    id v32 = *(id *)(a1 + 32);
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      int v34 = HMFGetLogIdentifier();
      id v35 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      uint64_t v53 = v34;
      __int16 v54 = 2112;
      v55 = v35;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_INFO, "%{public}@Setting adapter needReflectSettings to %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setSettingsReflected:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    uint64_t v36 = MEMORY[0x19F3A64A0]();
    uint64_t v37 = a1;
    uint64_t v38 = (void *)v36;
    id v39 = *(id *)(v37 + 32);
    v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v41;
      _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@Default settings do not exist", buf, 0xCu);
    }
  }
}

- (void)updateWithKeyPath:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  if (([(id)objc_opt_class() defaultSettingsContainsKeyPath:v8] & 1) == 0)
  {
    long long v11 = [(id)objc_opt_class() languageKeyPaths];
    char v12 = [v11 containsObject:v8];

    if ((v12 & 1) == 0)
    {
      uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v18 = self;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v36 = v20;
        __int16 v37 = 2112;
        id v38 = v8;
        __int16 v39 = 2112;
        id v40 = v9;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error in adapter updating keypath: %@ value: %@", buf, 0x20u);
      }
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      id v22 = @"Setting is not supported in the adapter";
      v23 = @"Only Boolean and Number Settings are supported";
      goto LABEL_21;
    }
  }
  if ([(HMAccessorySettingsAdapter *)self containerType] == 1)
  {
    uint64_t v13 = [(HMAccessorySettingsAdapter *)self settingsContainerIdentifier];
    if (!v13) {
      goto LABEL_18;
    }
  }
  else
  {
    if ([(HMAccessorySettingsAdapter *)self containerType] != 2) {
      goto LABEL_18;
    }
    __int16 v14 = [(HMAccessorySettingsAdapter *)self settingsContainer];
    objc_opt_class();
    BOOL v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
    id v16 = v15;

    if (v16)
    {
      uint64_t v13 = [v16 targetAccessoryIdentifierBySerial];
    }
    else
    {
      uint64_t v13 = 0;
    }

    if (!v13)
    {
LABEL_18:
      id v26 = (void *)MEMORY[0x19F3A64A0]();
      long long v27 = self;
      long long v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v36 = v29;
        __int16 v37 = 2112;
        id v38 = v8;
        __int16 v39 = 2112;
        id v40 = v9;
        _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error in updating keypath: %@ value: %@", buf, 0x20u);
      }
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      id v22 = @"Settings container is not supported in the adapter";
      v23 = @"Only accessory or media system is supported";
LABEL_21:
      id v25 = [v21 hmfErrorWithCode:3 reason:v22 suggestion:v23];
      v10[2](v10, v25);
      goto LABEL_22;
    }
  }
  uint64_t v24 = [(HMAccessorySettingsAdapter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HMAccessorySettingsAdapter_updateWithKeyPath_value_completionHandler___block_invoke;
  block[3] = &unk_1E5944900;
  void block[4] = self;
  id v31 = v8;
  id v32 = v9;
  id v33 = v13;
  int v34 = v10;
  id v25 = v13;
  dispatch_async(v24, block);

LABEL_22:
}

void __72__HMAccessorySettingsAdapter_updateWithKeyPath_value_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() languageKeyPaths];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _transformAccessorySettingToLanguageSetting:*(void *)(a1 + 48)];
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) accessorySettingsController];
      long long v6 = [*(id *)(a1 + 32) homeIdentifier];
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [v4 languageValue];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __72__HMAccessorySettingsAdapter_updateWithKeyPath_value_completionHandler___block_invoke_33;
      v44[3] = &unk_1E59449F0;
      v44[4] = *(void *)(a1 + 32);
      id v45 = v4;
      id v46 = *(id *)(a1 + 64);
      [v5 updateAccessorySettingWithHomeIdentifier:v6 accessoryIdentifier:v7 keyPath:v8 settingValue:v9 completionHandler:v44];

LABEL_30:
      return;
    }
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = *(id *)(a1 + 32);
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v48 = v24;
      __int16 v49 = 2112;
      uint64_t v50 = 0;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil setting transformation for setting = %@", buf, 0x16u);
    }
    uint64_t v25 = *(void *)(a1 + 64);
    id v26 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
LABEL_29:

    goto LABEL_30;
  }
  if (![(id)objc_opt_class() isKeyPathForBooleanSettingType:*(void *)(a1 + 40)])
  {
    if ([(id)objc_opt_class() isKeyPathForConstrainedNumberSettingType:*(void *)(a1 + 40)])
    {
      [*(id *)(a1 + 48) floatValue];
      objc_msgSend(NSNumber, "numberWithFloat:");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      char v12 = [(id)objc_opt_class() scaleUpNumberSettingValue:v4];
      long long v11 = -[HMSettingIntegerValue initWithIntegerValue:]([HMSettingIntegerValue alloc], "initWithIntegerValue:", [v12 integerValue]);
      [*(id *)(a1 + 32) updateNumberSettingWithKeyPath:*(void *)(a1 + 40) value:v4];
LABEL_8:

      goto LABEL_9;
    }
    if ([(id)objc_opt_class() isKeyPathForTapAssistanceSelectionSettingType:*(void *)(a1 + 40)])
    {
      uint64_t v43 = -1;
      id v27 = *(id *)(a1 + 48);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v28 = v27;
      }
      else {
        long long v28 = 0;
      }
      id v4 = v28;

      if (v4 && [*(id *)(a1 + 32) transformSelectionToInteger:v4 integerValue:&v43])
      {
        char v12 = [NSNumber numberWithInteger:v43];
        __int16 v29 = [(id)objc_opt_class() scaleUpNumberSettingValue:v12];
        long long v11 = -[HMSettingIntegerValue initWithIntegerValue:]([HMSettingIntegerValue alloc], "initWithIntegerValue:", [v29 integerValue]);
        [*(id *)(a1 + 32) updateTapAssistanceSelectionSettingWithKeyPath:*(void *)(a1 + 40) value:v4];

        goto LABEL_8;
      }
      uint64_t v36 = (void *)MEMORY[0x19F3A64A0]();
      id v37 = *(id *)(a1 + 32);
      id v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        __int16 v39 = HMFGetLogIdentifier();
        uint64_t v40 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        long long v48 = v39;
        __int16 v49 = 2112;
        uint64_t v50 = v40;
        _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, "%{public}@Wrong update value for tap assistance: %@", buf, 0x16u);
      }
      id v26 = [*(id *)(a1 + 32) accessoryContext];
      id v35 = [v26 delegateCaller];
      uint64_t v41 = *(void *)(a1 + 64);
      long long v42 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      [v35 callCompletion:v41 error:v42];
    }
    else
    {
      uint64_t v30 = (void *)MEMORY[0x19F3A64A0]();
      id v31 = *(id *)(a1 + 32);
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = HMFGetLogIdentifier();
        uint64_t v34 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        long long v48 = v33;
        __int16 v49 = 2112;
        uint64_t v50 = v34;
        _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Keypath is of an unknown type that is not supported: %@", buf, 0x16u);
      }
      id v4 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3 reason:@"Keypath is of unknown setting type" suggestion:@"Only Boolean and Number Setting are supported"];
      id v26 = [*(id *)(a1 + 32) accessoryContext];
      id v35 = [v26 delegateCaller];
      [v35 callCompletion:*(void *)(a1 + 64) error:v4];
    }

    goto LABEL_29;
  }
  uint64_t v10 = [*(id *)(a1 + 48) BOOLValue];
  long long v11 = [[HMSettingBooleanValue alloc] initWithBoolValue:v10];
  [*(id *)(a1 + 32) updateBooleanSettingWithKeyPath:*(void *)(a1 + 40) value:v10];
LABEL_9:
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "accessorySettingsController", v43);
  __int16 v14 = [*(id *)(a1 + 32) homeIdentifier];
  [v13 updateAccessorySettingWithHomeIdentifier:v14 accessoryIdentifier:*(void *)(a1 + 56) keyPath:*(void *)(a1 + 40) settingValue:v11 completionHandler:*(void *)(a1 + 64)];

  BOOL v15 = (void *)MEMORY[0x19F3A64A0]();
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    long long v48 = v18;
    __int16 v49 = 2112;
    uint64_t v50 = v19;
    __int16 v51 = 2112;
    uint64_t v52 = v20;
    _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Update setting keypath: %@ value: %@", buf, 0x20u);
  }
}

void __72__HMAccessorySettingsAdapter_updateWithKeyPath_value_completionHandler___block_invoke_33(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    [*(id *)(a1 + 32) setSelectedLanguageSetting:*(void *)(a1 + 40)];
    id v4 = [*(id *)(a1 + 32) delegate];
    uint64_t v5 = *(void *)(a1 + 32);
    long long v6 = [(id)objc_opt_class() selectedLanguageSettingKeyPath];
    v13[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v4 adapter:v5 didUpdateSettingKeyPaths:v7];

    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [v8 selectedLanguageSetting];
    uint64_t v10 = [*(id *)(a1 + 32) availableLanguageSetting];
    [v8 _addOrUpdateLanguageSetting:v9 availableLanguagesSetting:v10];
  }
  long long v11 = [*(id *)(a1 + 32) accessoryContext];
  char v12 = [v11 delegateCaller];
  [v12 callCompletion:*(void *)(a1 + 48) error:v3];
}

- (id)_transformAccessorySettingToLanguageSetting:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  long long v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 title];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      uint64_t v10 = [v9 componentsSeparatedByString:@","];
      if ((unint64_t)[v10 count] >= 3)
      {
        uint64_t v12 = [v10 objectAtIndex:0];
        uint64_t v13 = [v10 objectAtIndex:1];
        __int16 v14 = [v10 objectAtIndex:2];
        BOOL v15 = 0;
        if ((unint64_t)[v10 count] >= 5)
        {
          BOOL v15 = [v10 objectAtIndex:4];
        }
        id v16 = [[HMSettingLanguageValue alloc] initWithInputLanguageCode:v12 outputVoiceLanguageCode:v13 outputVoiceGenderCode:v14 voiceName:v15];
        uint64_t v21 = (void *)v12;
        uint64_t v17 = [HMLanguageSetting alloc];
        [(id)objc_opt_class() selectedLanguageSettingKeyPath];
        v18 = uint64_t v20 = (void *)v13;
        long long v11 = [(HMLanguageSetting *)v17 initWithKeyPath:v18 readOnly:0 languageValue:v16];
      }
      else
      {
        long long v11 = 0;
      }
    }
    else
    {
      long long v11 = 0;
    }
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (void)_configureForMediaSystemWithCompletionHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() defaultSettings];
  long long v6 = [v5 allKeys];

  uint64_t v7 = [(id)objc_opt_class() languageKeyPaths];
  uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];

  id v9 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v10 = self;
  long long v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    uint64_t v13 = [(HMAccessorySettingsAdapter *)v10 homeIdentifier];
    __int16 v14 = [(HMAccessorySettingsAdapter *)v10 settingsContainerIdentifier];
    *(_DWORD *)buf = 138544130;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    long long v28 = v14;
    __int16 v29 = 2112;
    uint64_t v30 = v8;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Adapter subscribes to media system settings, home identifier: %@, media system identifier: %@, key paths: %@", buf, 0x2Au);
  }
  BOOL v15 = [(HMAccessorySettingsAdapter *)v10 accessoryDataSource];
  id v16 = [(HMAccessorySettingsAdapter *)v10 homeIdentifier];
  uint64_t v17 = [(HMAccessorySettingsAdapter *)v10 settingsContainerIdentifier];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__HMAccessorySettingsAdapter__configureForMediaSystemWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E59449F0;
  v20[4] = v10;
  id v21 = v8;
  id v22 = v4;
  id v18 = v4;
  id v19 = v8;
  [v15 subscribeToMediaSystemSettingsWithHomeIdentifier:v16 mediaSystemIdentifier:v17 keyPaths:v19 options:0 completionHandler:v20];
}

void __76__HMAccessorySettingsAdapter__configureForMediaSystemWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  long long v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 40);
    int v16 = 138543874;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v3;
    uint64_t v10 = "%{public}@Failed to subscribe to media system settings with key paths: %@ :%@";
    long long v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v16 = 138543618;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    uint64_t v10 = "%{public}@Successfully subscribed to media system settings with key paths: %@";
    long long v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v11, v12, v10, (uint8_t *)&v16, v13);

LABEL_7:
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);
  }
}

- (void)_configureForAccessoryWithCompletionHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() defaultSettings];
  long long v6 = [v5 allKeys];

  uint64_t v7 = [(id)objc_opt_class() languageKeyPaths];
  uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];

  uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v10 = self;
  long long v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    os_log_type_t v12 = HMFGetLogIdentifier();
    uint32_t v13 = [(HMAccessorySettingsAdapter *)v10 homeIdentifier];
    uint64_t v14 = [(HMAccessorySettingsAdapter *)v10 settingsContainerIdentifier];
    *(_DWORD *)buf = 138544130;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    long long v28 = v14;
    __int16 v29 = 2112;
    uint64_t v30 = v8;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Adapter subscribes to accessory settings, home identifier: %@, accessory identifier: %@, key paths: %@\a", buf, 0x2Au);
  }
  uint64_t v15 = [(HMAccessorySettingsAdapter *)v10 accessoryDataSource];
  int v16 = [(HMAccessorySettingsAdapter *)v10 homeIdentifier];
  uint64_t v17 = [(HMAccessorySettingsAdapter *)v10 settingsContainerIdentifier];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__HMAccessorySettingsAdapter__configureForAccessoryWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E59449F0;
  v20[4] = v10;
  id v21 = v8;
  id v22 = v4;
  id v18 = v4;
  id v19 = v8;
  [v15 subscribeToAccessorySettingsWithHomeIdentifier:v16 accessoryIdentifier:v17 keyPaths:v19 options:0 completionHandler:v20];
}

void __74__HMAccessorySettingsAdapter__configureForAccessoryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  long long v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 40);
    int v16 = 138543874;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v3;
    uint64_t v10 = "%{public}@Failed to subscribe to the accessory settings with key paths: %@ :%@";
    long long v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v16 = 138543618;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    uint64_t v10 = "%{public}@Successfully subscribed to the accessory settings with key paths: %@";
    long long v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v11, v12, v10, (uint8_t *)&v16, v13);

LABEL_7:
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);
  }
}

- (void)unconfigure
{
  id v2 = [(HMAccessorySettingsAdapter *)self accessoryDataSource];
  [v2 resetSubscriptions];
}

- (void)configureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessorySettingsAdapter *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HMAccessorySettingsAdapter_configureWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E59454E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMAccessorySettingsAdapter_configureWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) createRootSettingGroup];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 accessoryDataSource];
  [v3 setDelegate:v2];

  uint64_t v4 = [*(id *)(a1 + 32) containerType];
  id v5 = *(void **)(a1 + 32);
  if (v4 == 1)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 _configureForAccessoryWithCompletionHandler:v6];
  }
  else if ([v5 containerType] == 2)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    [v7 _configureForMediaSystemWithCompletionHandler:v8];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = *(id *)(a1 + 32);
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v12 = HMFGetLogIdentifier();
      uint32_t v13 = [*(id *)(a1 + 32) settingsContainer];
      int v16 = 138543618;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unknown settings container: %@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3 reason:@"Unknown settings container" suggestion:@"Only accessory or media system can be container"];
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
    }
  }
}

- (HMAccessorySettingsAdapter)initWithHomeIdentifier:(id)a3 dataSource:(id)a4 controller:(id)a5 workQueue:(id)a6 settingsContainer:(id)a7 containerIdentifier:(id)a8 containerType:(int64_t)a9 settingsControl:(id)a10 context:(id)a11
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v18 = a7;
  id v27 = a8;
  id v19 = a10;
  id v20 = a11;
  v32.receiver = self;
  v32.super_class = (Class)HMAccessorySettingsAdapter;
  id v21 = [(HMAccessorySettingsAdapter *)&v32 init];
  uint64_t v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_homeIdentifier, a3);
    objc_storeStrong((id *)&v22->_accessoryDataSource, a4);
    objc_storeStrong((id *)&v22->_accessorySettingsController, a5);
    objc_storeStrong((id *)&v22->_workQueue, a6);
    objc_storeWeak((id *)&v22->_settingsContainer, v18);
    objc_storeWeak((id *)&v22->_settingsControl, v19);
    objc_storeStrong((id *)&v22->_accessoryContext, a11);
    accessorySettings = v22->_accessorySettings;
    v22->_accessorySettings = 0;

    rootGroup = v22->_rootGroup;
    v22->_rootGroup = 0;

    tapAssistanceSelections = v22->_tapAssistanceSelections;
    v22->_tapAssistanceSelections = 0;

    objc_storeStrong((id *)&v22->_settingsContainerIdentifier, a8);
    v22->_containerType = a9;
    *(_WORD *)&v22->_didReceiveFirstUpdateEvent = 0;
  }

  return v22;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t64 != -1) {
    dispatch_once(&logCategory__hmf_once_t64, &__block_literal_global_258);
  }
  id v2 = (void *)logCategory__hmf_once_v65;

  return v2;
}

uint64_t __41__HMAccessorySettingsAdapter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v65;
  logCategory__hmf_once_v65 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)scaleDownNumberSettingValue:(id)a3
{
  [a3 floatValue];
  float v5 = v4;
  uint64_t v6 = NSNumber;
  [a1 constraintSettingScaleFactor];
  *(float *)&double v7 = v5 / *(float *)&v7;

  return (id)[v6 numberWithFloat:v7];
}

+ (id)scaleUpNumberSettingValue:(id)a3
{
  [a3 floatValue];
  float v5 = v4;
  uint64_t v6 = NSNumber;
  [a1 constraintSettingScaleFactor];
  *(float *)&double v7 = v5 * *(float *)&v7;

  return (id)[v6 numberWithFloat:v7];
}

+ (float)constraintSettingScaleFactor
{
  return 100.0;
}

+ (id)defaultSettingsAllKeyPaths
{
  id v2 = [a1 defaultSettings];
  id v3 = [v2 allKeys];

  return v3;
}

+ (id)defaultSettingsConstraintsForKeyPath:(id)a3
{
  id v4 = a3;
  if ([a1 defaultSettingsContainsKeyPath:v4])
  {
    float v5 = [a1 defaultSettings];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];
    double v7 = (void *)[v6 copy];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

+ (BOOL)isKeyPathForTapAssistanceSelectionSettingType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    float v5 = [a1 defaultSettings];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (v6 && [v6 count] == 6)
    {
      double v7 = [v6 objectAtIndexedSubscript:4];
      char v8 = [v7 isEqual:&unk_1EEF07F08];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isKeyPathForConstrainedNumberSettingType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    float v5 = [a1 defaultSettings];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (v6 && [v6 count] == 6)
    {
      double v7 = [v6 objectAtIndexedSubscript:4];
      char v8 = [v7 isEqual:&unk_1EEF07EC0];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isKeyPathForBooleanSettingType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    float v5 = [a1 defaultSettings];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (v6 && [v6 count] == 6)
    {
      double v7 = [v6 objectAtIndexedSubscript:4];
      char v8 = [v7 isEqual:&unk_1EEF07EA8];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)defaultSettingsContainsKeyPath:(id)a3
{
  id v4 = a3;
  float v5 = [a1 defaultSettings];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

+ (id)defaultSettings
{
  return &unk_1EEF08A10;
}

+ (int64_t)itemIndexWithTapAssistanceSelectionItem:(id)a3
{
  id v4 = a3;
  float v5 = [a1 tapAssistanceSelectionTitles];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__HMAccessorySettingsAdapter_itemIndexWithTapAssistanceSelectionItem___block_invoke;
  v10[3] = &unk_1E5940B98;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v10];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = v7;
  }

  return v8;
}

uint64_t __70__HMAccessorySettingsAdapter_itemIndexWithTapAssistanceSelectionItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 title];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

+ (id)tapAssistanceSelectionItemWithIndex:(int64_t)a3
{
  if (a3 < 0
    || ([a1 tapAssistanceSelectionTitles],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 <= a3))
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v7 = [HMAccessorySelectionSettingItem alloc];
    int64_t v8 = [a1 tapAssistanceSelectionTitles];
    uint64_t v9 = [v8 objectAtIndexedSubscript:a3];
    id v10 = [(HMAccessorySelectionSettingItem *)v7 initWithTitle:v9];
  }

  return v10;
}

+ (NSArray)tapAssistanceSelectionTitles
{
  return (NSArray *)&unk_1EEF08CD8;
}

+ (NSArray)languageKeyPaths
{
  if (languageKeyPaths__hmf_once_t0 != -1) {
    dispatch_once(&languageKeyPaths__hmf_once_t0, &__block_literal_global_28028);
  }
  id v2 = (void *)languageKeyPaths__hmf_once_v1;

  return (NSArray *)v2;
}

uint64_t __46__HMAccessorySettingsAdapter_languageKeyPaths__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"root.siri.language", @"root.siri.availableLanguages", 0);
  uint64_t v1 = languageKeyPaths__hmf_once_v1;
  languageKeyPaths__hmf_once_uint64_t v1 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)availableLanguagesKeyPath
{
  return @"root.siri.availableLanguages";
}

+ (NSString)selectedLanguageSettingKeyPath
{
  return (NSString *)@"root.siri.language";
}

@end