@interface _HomeKitSettingToHFItem_CacheItem
+ (BOOL)_checkSettingGroupForSettingsThatNeedToBeDisplayed:(id)a3 usageOptions:(id)a4 settingGroup:(id)a5;
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBeDisplayed;
- (HFAccessorySettingsEntity)accessoryGroupEntity;
- (HFHomeKitSettingsVendor)homeKitSettingsVendor;
- (HFItem)outputItem;
- (HMAccessorySelectionSettingItem)optionItem;
- (HMSetting)singleSetting;
- (HMSettingGroup)settingGroup;
- (NSDictionary)usageOptions;
- (NSString)cacheKey;
- (NSString)description;
- (NSString)keyPath;
- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 accessoryGroupEntity:(id)a5;
- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 group:(id)a5;
- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5;
- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5 optionItem:(id)a6;
- (unint64_t)hash;
@end

@implementation _HomeKitSettingToHFItem_CacheItem

- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5 optionItem:(id)a6
{
  id v11 = a6;
  v12 = [(_HomeKitSettingToHFItem_CacheItem *)self initWithHomeKitSettingsVendor:a3 usageOptions:a4 setting:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_optionItem, a6);
  }

  return v13;
}

- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HomeKitSettingToHFItem_CacheItem;
  v12 = [(_HomeKitSettingToHFItem_CacheItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_singleSetting, a5);
    objc_storeStrong((id *)&v13->_homeKitSettingsVendor, a3);
    objc_storeStrong((id *)&v13->_usageOptions, a4);
  }

  return v13;
}

- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 group:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HomeKitSettingToHFItem_CacheItem;
  v12 = [(_HomeKitSettingToHFItem_CacheItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_settingGroup, a5);
    objc_storeStrong((id *)&v13->_homeKitSettingsVendor, a3);
    objc_storeStrong((id *)&v13->_usageOptions, a4);
  }

  return v13;
}

- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 accessoryGroupEntity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HomeKitSettingToHFItem_CacheItem;
  v12 = [(_HomeKitSettingToHFItem_CacheItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessoryGroupEntity, a5);
    objc_storeStrong((id *)&v13->_homeKitSettingsVendor, a3);
    objc_storeStrong((id *)&v13->_usageOptions, a4);
  }

  return v13;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(_HomeKitSettingToHFItem_CacheItem *)self keyPath];
  [v3 appendString:v4 withName:@"keyPath"];

  v5 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
  id v6 = (id)[v3 appendObject:v5 withName:@"homeKitSettingsVendor"];

  v7 = [(_HomeKitSettingToHFItem_CacheItem *)self optionItem];
  id v8 = (id)[v3 appendObject:v7 withName:@"optionItem" skipIfNil:1];

  id v9 = [(_HomeKitSettingToHFItem_CacheItem *)self settingGroup];
  id v10 = (id)[v3 appendObject:v9 withName:@"settingGroup" skipIfNil:1];

  id v11 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];
  id v12 = (id)[v3 appendObject:v11 withName:@"singleSetting" skipIfNil:1];

  v13 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];
  id v14 = (id)[v3 appendObject:v13 withName:@"accessoryGroupEntity" skipIfNil:1];

  objc_super v15 = [(_HomeKitSettingToHFItem_CacheItem *)self usageOptions];
  id v16 = (id)[v3 appendObject:v15 withName:@"usageOptions" skipIfNil:1];

  v17 = [v3 build];

  return (NSString *)v17;
}

- (NSString)cacheKey
{
  v4 = [(_HomeKitSettingToHFItem_CacheItem *)self settingGroup];

  if (v4)
  {
    v5 = [(_HomeKitSettingToHFItem_CacheItem *)self settingGroup];
LABEL_9:
    id v9 = v5;
    _HomeKitSettingToHFItem_CacheItemCacheKey(v5);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  id v6 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];

  if (v6)
  {
    v5 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];
    goto LABEL_9;
  }
  v7 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];

  if (v7)
  {
    v5 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];
    goto LABEL_9;
  }
  id v8 = [(_HomeKitSettingToHFItem_CacheItem *)self optionItem];

  if (v8)
  {
    v5 = [(_HomeKitSettingToHFItem_CacheItem *)self optionItem];
    goto LABEL_9;
  }
  id v9 = [MEMORY[0x263F08690] currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"HFAccessorySettingsItemProvider.m" lineNumber:193 description:@"CacheKey cannot be nil!"];
  id v10 = &stru_26C081158;
LABEL_10:

  return (NSString *)v10;
}

- (NSString)keyPath
{
  v3 = [(_HomeKitSettingToHFItem_CacheItem *)self optionItem];

  if (v3)
  {
    v4 = NSString;
    v5 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];
    id v6 = [v5 keyPath];
    v7 = [(_HomeKitSettingToHFItem_CacheItem *)self optionItem];
    id v8 = [v7 title];
    id v9 = [v4 stringWithFormat:@"%@.%@", v6, v8];
  }
  else
  {
    v5 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];
    id v10 = [v5 keyPath];
    if (v10)
    {
      id v6 = v10;
      id v9 = v6;
    }
    else
    {
      id v11 = [(_HomeKitSettingToHFItem_CacheItem *)self settingGroup];
      id v12 = [v11 keyPath];
      v13 = v12;
      if (v12)
      {
        id v9 = v12;
      }
      else
      {
        id v14 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];
        id v9 = [v14 keyPath];
      }
      id v6 = 0;
    }
  }

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_2_0 != -1) {
    dispatch_once(&_MergedGlobals_2_0, &__block_literal_global_55_3);
  }
  v2 = (void *)qword_26AB2EA08;
  return (NAIdentity *)v2;
}

- (BOOL)shouldBeDisplayed
{
  v3 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
  int v4 = [v3 isContainedWithinItemGroup];

  v5 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
  int v6 = [v5 isItemGroup];

  if ((v4 & 1) != 0 || v6)
  {
    id v8 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];
    id v9 = [v8 adapterIdentifier];

    if (!v9) {
      goto LABEL_20;
    }
    id v10 = +[HFHomeKitDispatcher sharedDispatcher];
    id v11 = [v10 homeManager];
    if ([v11 hasOptedToHH2])
    {
      id v12 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];
      v13 = [v12 adapterIdentifier];
      int v14 = [v13 isEqualToString:@"SiriLanguageAdapter"];

      if (v14)
      {
        objc_super v15 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
        if ([v15 conformsToProtocol:&unk_26C155B48]) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }
        id v17 = v16;

        v18 = objc_msgSend(v17, "hf_siriLanguageOptionsManager");

        if (v18)
        {
          id v19 = v18;

LABEL_17:
          v27 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];
          char v7 = [v19 shouldShowSettingsEntity:v27];
LABEL_18:

LABEL_40:
          return v7;
        }
        [0 conformsToProtocol:&unk_26C107C80];
LABEL_20:
        v28 = [(_HomeKitSettingToHFItem_CacheItem *)self settingGroup];
        if (v28)
        {
        }
        else
        {
          v29 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];

          if (v29) {
            int v30 = 0;
          }
          else {
            int v30 = v6;
          }
          if (v30 == 1)
          {
            id v19 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];
            char v31 = [v19 alwaysShowGroup];
            goto LABEL_35;
          }
        }
        objc_opt_class();
        v32 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];
        if (objc_opt_isKindOfClass()) {
          v33 = v32;
        }
        else {
          v33 = 0;
        }
        id v19 = v33;

        if (v19) {
          int v34 = v4;
        }
        else {
          int v34 = 0;
        }
        if (v34 != 1)
        {
          if (!v4
            || ([(_HomeKitSettingToHFItem_CacheItem *)self settingGroup],
                v35 = objc_claimAutoreleasedReturnValue(),
                v35,
                !v35))
          {
            char v7 = 1;
            goto LABEL_40;
          }
          v27 = [(_HomeKitSettingToHFItem_CacheItem *)self settingGroup];
          v36 = objc_opt_class();
          v37 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
          v38 = [(_HomeKitSettingToHFItem_CacheItem *)self usageOptions];
          char v7 = [v36 _checkSettingGroupForSettingsThatNeedToBeDisplayed:v37 usageOptions:v38 settingGroup:v27];

          goto LABEL_18;
        }
        char v31 = [v19 isReflected];
LABEL_35:
        char v7 = v31 ^ 1;
        goto LABEL_40;
      }
    }
    else
    {
    }
    v20 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
    v21 = objc_msgSend(v20, "hf_settingsAdapterManager");
    v22 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];
    v23 = [v22 adapterIdentifier];
    v24 = [v21 adapterForIdentifier:v23];

    id v19 = v24;
    if ([v19 conformsToProtocol:&unk_26C107C80]) {
      v25 = v19;
    }
    else {
      v25 = 0;
    }
    id v26 = v25;

    if (v26) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  return 1;
}

+ (BOOL)_checkSettingGroupForSettingsThatNeedToBeDisplayed:(id)a3 usageOptions:(id)a4 settingGroup:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 settings];
  id v12 = objc_msgSend(v11, "hf_codex");

  v13 = [v10 keyPath];
  int v14 = objc_msgSend(v12, "hf_nodeWithKeyPath:", v13);

  v54 = v8;
  +[HFAccessorySettingsItemProvider buildItemTuplesForHomeKitSettings:v8 usageOptions:v9 settingGroup:v10 underNode:v14 cache:0];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (!v15)
  {
    char v43 = 0;
    goto LABEL_46;
  }
  uint64_t v16 = v15;
  id v48 = a1;
  uint64_t v55 = *(void *)v57;
  v52 = v14;
  id v50 = v10;
  id v51 = v9;
  v49 = v12;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v57 != v55) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      objc_opt_class();
      id v19 = [v18 singleSetting];
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
      id v21 = v20;

      if (v21 && ![v21 isReflected])
      {
        char v43 = 1;
        id v10 = v50;
        id v9 = v51;
        id v12 = v49;
LABEL_45:
        int v14 = v52;

        goto LABEL_46;
      }
      v22 = [v18 accessoryGroupEntity];
      v23 = [v22 adapterIdentifier];

      if (v23)
      {
        v24 = +[HFHomeKitDispatcher sharedDispatcher];
        v25 = [v24 homeManager];
        if ([v25 hasOptedToHH2])
        {
          id v26 = [v18 accessoryGroupEntity];
          v27 = [v26 adapterIdentifier];
          int v28 = [v27 isEqualToString:@"SiriLanguageAdapter"];

          if (v28)
          {
            v29 = &unk_26C155B48;
            id v30 = v54;
            if ([v30 conformsToProtocol:v29]) {
              char v31 = v30;
            }
            else {
              char v31 = 0;
            }
            id v32 = v31;

            v33 = objc_msgSend(v32, "hf_siriLanguageOptionsManager");
            int v34 = v33;
            if (v33)
            {
              id v35 = v33;
              if (v32) {
                goto LABEL_19;
              }
            }
            else
            {
              [0 conformsToProtocol:&unk_26C107C80];
              if (v32)
              {
LABEL_19:
                if (+[HFMediaHelper isContainedWithinAGroup:v32])
                {
                  v44 = HFLogForCategory(0);
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    v46 = [v18 accessoryGroupEntity];
                    *(_DWORD *)buf = 138412546;
                    v61 = v46;
                    __int16 v62 = 2112;
                    id v63 = v32;
                    _os_log_impl(&dword_20B986000, v44, OS_LOG_TYPE_DEFAULT, "Hiding language setting entity %@ for %@", buf, 0x16u);
                  }
                  char v43 = 0;
LABEL_43:
                  id v9 = v51;
                  goto LABEL_44;
                }
                goto LABEL_28;
              }
            }
            id v30 = 0;
LABEL_28:
            id v39 = v34;
LABEL_29:

            if (v39)
            {
              v40 = [v18 accessoryGroupEntity];
              char v41 = [v39 shouldShowSettingsEntity:v40];

              if (v41)
              {
                char v43 = 1;
                int v34 = v39;
                goto LABEL_43;
              }
            }

            goto LABEL_32;
          }
        }
        else
        {
        }
        objc_msgSend(v54, "hf_settingsAdapterManager");
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        int v34 = [v18 accessoryGroupEntity];
        v36 = [v34 adapterIdentifier];
        v37 = [v30 adapterForIdentifier:v36];
        if ([v37 conformsToProtocol:&unk_26C107C80]) {
          v38 = v37;
        }
        else {
          v38 = 0;
        }
        id v39 = v38;

        goto LABEL_29;
      }
LABEL_32:
      v42 = [v18 settingGroup];

      if (v42)
      {
        int v34 = [v18 settingGroup];
        id v9 = v51;
        char v43 = [v48 _checkSettingGroupForSettingsThatNeedToBeDisplayed:v54 usageOptions:v51 settingGroup:v34];
LABEL_44:
        id v12 = v49;
        id v10 = v50;

        goto LABEL_45;
      }
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    char v43 = 0;
    id v10 = v50;
    id v9 = v51;
    id v12 = v49;
    int v14 = v52;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_46:

  return v43;
}

- (HFItem)outputItem
{
  outputItem = self->_outputItem;
  if (outputItem) {
    goto LABEL_18;
  }
  if (![(_HomeKitSettingToHFItem_CacheItem *)self shouldBeDisplayed])
  {
    int v14 = 0;
    goto LABEL_19;
  }
  uint64_t v4 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];
  if (v4)
  {
    v5 = (void *)v4;
    int v6 = [(_HomeKitSettingToHFItem_CacheItem *)self optionItem];

    if (v6)
    {
      char v7 = [HFAccessorySettingOptionItem alloc];
      id v8 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
      id v9 = [(_HomeKitSettingToHFItem_CacheItem *)self usageOptions];
      id v10 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];
      id v11 = [(_HomeKitSettingToHFItem_CacheItem *)self optionItem];
      id v12 = [(HFAccessorySettingOptionItem *)v7 initWithHomeKitSettingsVendor:v8 usageOptions:v9 setting:v10 optionItem:v11];
      v13 = self->_outputItem;
      self->_outputItem = v12;

LABEL_16:
      goto LABEL_17;
    }
  }
  uint64_t v15 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v17 = [HFAccessorySettingGroupItem alloc];
    id v8 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
    id v9 = [(_HomeKitSettingToHFItem_CacheItem *)self usageOptions];
    id v10 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];
    v18 = [(HFAccessorySettingGroupItem *)v17 initWithHomeKitSettingsVendor:v8 usageOptions:v9 selectionSetting:v10];
LABEL_15:
    id v11 = self->_outputItem;
    self->_outputItem = v18;
    goto LABEL_16;
  }
  id v19 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];

  if (v19)
  {
    v20 = [HFAccessorySettingItem alloc];
    id v8 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
    id v9 = [(_HomeKitSettingToHFItem_CacheItem *)self usageOptions];
    id v10 = [(_HomeKitSettingToHFItem_CacheItem *)self singleSetting];
    v18 = [(HFAccessorySettingItem *)v20 initWithHomeKitSettingsVendor:v8 usageOptions:v9 setting:v10];
    goto LABEL_15;
  }
  id v21 = [(_HomeKitSettingToHFItem_CacheItem *)self settingGroup];

  if (v21)
  {
    v22 = [HFAccessorySettingGroupItem alloc];
    id v8 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
    id v9 = [(_HomeKitSettingToHFItem_CacheItem *)self usageOptions];
    id v10 = [(_HomeKitSettingToHFItem_CacheItem *)self settingGroup];
    v18 = [(HFAccessorySettingGroupItem *)v22 initWithHomeKitSettingsVendor:v8 usageOptions:v9 group:v10];
    goto LABEL_15;
  }
  v23 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];

  if (v23)
  {
    v24 = [HFAccessorySettingGroupItem alloc];
    id v8 = [(_HomeKitSettingToHFItem_CacheItem *)self homeKitSettingsVendor];
    id v9 = [(_HomeKitSettingToHFItem_CacheItem *)self usageOptions];
    id v10 = [(_HomeKitSettingToHFItem_CacheItem *)self accessoryGroupEntity];
    v18 = [(HFAccessorySettingGroupItem *)v24 initWithHomeKitSettingsVendor:v8 usageOptions:v9 entity:v10];
    goto LABEL_15;
  }
LABEL_17:
  outputItem = self->_outputItem;
LABEL_18:
  int v14 = outputItem;
LABEL_19:
  return v14;
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (HMSetting)singleSetting
{
  return self->_singleSetting;
}

- (HMSettingGroup)settingGroup
{
  return self->_settingGroup;
}

- (HMAccessorySelectionSettingItem)optionItem
{
  return self->_optionItem;
}

- (HFAccessorySettingsEntity)accessoryGroupEntity
{
  return self->_accessoryGroupEntity;
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_accessoryGroupEntity, 0);
  objc_storeStrong((id *)&self->_optionItem, 0);
  objc_storeStrong((id *)&self->_settingGroup, 0);
  objc_storeStrong((id *)&self->_singleSetting, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
  objc_storeStrong((id *)&self->_outputItem, 0);
}

@end