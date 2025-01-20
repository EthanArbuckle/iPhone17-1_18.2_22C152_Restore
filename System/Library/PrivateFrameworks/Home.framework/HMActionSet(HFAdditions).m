@interface HMActionSet(HFAdditions)
+ (id)hf_standardSystemIconIdentifierForActionSetType:()HFAdditions;
- (BOOL)hf_affectsServiceWithIdentifier:()HFAdditions;
- (BOOL)hf_isShortcutOwned;
- (HFImageIconDescriptor)hf_iconDescriptor;
- (__CFString)_hf_iconIdentifier;
- (float)hf_percentOfAccessoryRepresentableObjectsAssociatedWithGroup:()HFAdditions;
- (id)hf_affectedAccessoryRepresentableObjects;
- (id)hf_affectedCharacteristics;
- (id)hf_affectedMediaSessions;
- (id)hf_affectedProfiles;
- (id)hf_affectedServices;
- (id)hf_characteristicWriteActions;
- (id)hf_iconTintColor;
- (id)hf_mapOldIconIdentifierToNewSystemIconIdentifier:()HFAdditions;
- (id)hf_setIconIdentifier:()HFAdditions andTintColor:;
- (id)hf_shortcutAction;
- (id)hf_standardIconTintColorForIconIdentifier:()HFAdditions;
- (uint64_t)hf_isAnonymous;
- (uint64_t)hf_isBuilder;
- (uint64_t)hf_requiresDeviceUnlock;
@end

@implementation HMActionSet(HFAdditions)

- (uint64_t)hf_isAnonymous
{
  v2 = [a1 actionSetType];
  if ([v2 isEqualToString:*MEMORY[0x263F0B948]])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [a1 name];
    if ([v4 hasPrefix:@"HFAnonymous "])
    {
      uint64_t v3 = 1;
    }
    else
    {
      v5 = [a1 actionSetType];
      uint64_t v3 = [v5 isEqualToString:*MEMORY[0x263F0B928]];
    }
  }

  return v3;
}

- (HFImageIconDescriptor)hf_iconDescriptor
{
  v2 = objc_msgSend(a1, "_hf_iconIdentifier");
  if (v2)
  {
    uint64_t v3 = objc_msgSend(a1, "hf_iconTintColor");
    if (v3)
    {
      v4 = [MEMORY[0x263F1C6C8] configurationWithHierarchicalColor:v3];
      v5 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:v2 configuration:v4];
    }
    else
    {
      v5 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:v2];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)hf_iconTintColor
{
  v2 = [a1 applicationData];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"HFAppDataActionSetIconTintColor"];

  if (v3)
  {
    v4 = [[HFColorPaletteColor alloc] initWithDictionaryRepresentation:v3];
    [(HFColorPaletteColor *)v4 UIColor];
  }
  else
  {
    objc_msgSend(a1, "_hf_iconIdentifier");
    v4 = (HFColorPaletteColor *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_standardIconTintColorForIconIdentifier:", v4);
  v5 = };

  if (!v5)
  {
    v5 = [MEMORY[0x263F1C550] systemOrangeColor];
  }

  return v5;
}

- (__CFString)_hf_iconIdentifier
{
  v2 = [a1 applicationData];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"HFAppDataActionSetIconImageIdentifier_v2"];

  v4 = [a1 applicationData];
  v5 = [v4 objectForKeyedSubscript:@"HFApplicationDataActionSetIconImageIdentifierKey"];

  if (!v3) {
    uint64_t v3 = v5;
  }
  if (![(__CFString *)v3 hasPrefix:@"HFImageIconIdentifier"])
  {
    v6 = v3;
    if (v3) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  objc_msgSend(a1, "hf_mapOldIconIdentifierToNewSystemIconIdentifier:", v3);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ([(__CFString *)v6 hasPrefix:@"HFImageIconIdentifier"]) {
    NSLog(&cfstr_ExpectedIconId.isa, v6);
  }
  if (!v6)
  {
LABEL_9:
    v7 = objc_opt_class();
    v8 = [a1 actionSetType];
    objc_msgSend(v7, "hf_standardSystemIconIdentifierForActionSetType:", v8);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v6) {
      v6 = @"house.fill";
    }
  }
LABEL_11:

  return v6;
}

+ (id)hf_standardSystemIconIdentifierForActionSetType:()HFAdditions
{
  id v3 = a3;
  if (!v3) {
    id v3 = (id)*MEMORY[0x263F0B958];
  }
  if (_MergedGlobals_266 != -1) {
    dispatch_once(&_MergedGlobals_266, &__block_literal_global_40_1);
  }
  id v4 = (id)qword_26AB2F1D8;
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (id)hf_standardIconTintColorForIconIdentifier:()HFAdditions
{
  id v3 = a3;
  if (qword_26AB2F1F0 != -1) {
    dispatch_once(&qword_26AB2F1F0, &__block_literal_global_70_4);
  }
  id v4 = (id)qword_26AB2F1F8;
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (id)hf_affectedProfiles
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = objc_msgSend(a1, "actions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          id v9 = v8;
          if (objc_opt_isKindOfClass()) {
            v10 = v9;
          }
          else {
            v10 = 0;
          }
          id v11 = v10;

          v12 = [v11 mediaProfiles];
          [v2 unionSet:v12];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          objc_opt_class();
          id v13 = v8;
          if (objc_opt_isKindOfClass()) {
            v14 = v13;
          }
          else {
            v14 = 0;
          }
          id v11 = v14;

          v12 = [v11 lightProfile];
          objc_msgSend(v2, "na_safeAddObject:", v12);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)hf_affectedMediaSessions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = objc_msgSend(a1, "actions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          id v9 = v8;
          if (objc_opt_isKindOfClass()) {
            v10 = v9;
          }
          else {
            v10 = 0;
          }
          id v11 = v10;

          v12 = [v11 mediaProfiles];
          [v2 unionSet:v12];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  id v13 = objc_msgSend(v2, "na_map:", &__block_literal_global_15_5);

  return v13;
}

- (id)hf_affectedCharacteristics
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_msgSend(a1, "actions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          v10 = [v9 characteristic];
          if (v10)
          {
            id v11 = [v9 targetValue];

            if (v11) {
              [v2 addObject:v10];
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)hf_characteristicWriteActions
{
  v1 = [a1 actions];
  v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_119);

  return v2;
}

- (id)hf_affectedServices
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [a1 actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [v8 characteristic];
          v10 = [v9 service];
          objc_msgSend(v2, "na_safeAddObject:", v10);

          id v11 = [v8 characteristic];
          v12 = [v11 service];

          if (!v12)
          {
            long long v13 = HFLogForCategory(0);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v20 = v8;
              _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Error: Unexpected nil service for write action: %@", buf, 0xCu);
            }
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }

  return v2;
}

- (BOOL)hf_affectsServiceWithIdentifier:()HFAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_affectedServices");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__HMActionSet_HFAdditions__hf_affectsServiceWithIdentifier___block_invoke;
  v10[3] = &unk_264096590;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 objectsPassingTest:v10];

  BOOL v8 = [v7 count] != 0;
  return v8;
}

- (id)hf_affectedAccessoryRepresentableObjects
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(a1, "actions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [v8 characteristic];
          v10 = [v9 service];
          objc_msgSend(v2, "na_safeAddObject:", v10);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = [v8 mediaProfiles];
            [v2 unionSet:v9];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            id v9 = [v8 lightProfile];
            objc_msgSend(v2, "na_safeAddObject:", v9);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

- (uint64_t)hf_isBuilder
{
  return objc_opt_isKindOfClass() & 1;
}

- (uint64_t)hf_requiresDeviceUnlock
{
  v1 = [a1 actions];
  uint64_t v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_21_4);

  return v2;
}

- (float)hf_percentOfAccessoryRepresentableObjectsAssociatedWithGroup:()HFAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hf_affectedAccessoryRepresentableObjects");
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  long long v12 = __89__HMActionSet_HFAdditions__hf_percentOfAccessoryRepresentableObjectsAssociatedWithGroup___block_invoke;
  long long v13 = &unk_2640965D8;
  id v6 = v4;
  id v14 = v6;
  long long v15 = &v16;
  objc_msgSend(v5, "na_each:", &v10);
  if (objc_msgSend(v5, "count", v10, v11, v12, v13))
  {
    unint64_t v7 = v17[3];
    float v8 = (float)v7 / (float)(unint64_t)[v5 count];
  }
  else
  {
    float v8 = 0.0;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)hf_setIconIdentifier:()HFAdditions andTintColor:
{
  id v6 = a3;
  id v7 = a4;
  float v8 = objc_opt_class();
  id v9 = [a1 actionSetType];
  uint64_t v10 = objc_msgSend(v8, "hf_standardSystemIconIdentifierForActionSetType:", v9);

  uint64_t v11 = [a1 applicationData];
  long long v12 = [v11 objectForKeyedSubscript:@"HFAppDataActionSetIconImageIdentifier_v2"];

  if (v12 || ([v10 isEqualToString:v6] & 1) == 0)
  {
    long long v13 = [a1 applicationData];
    [v13 setObject:v6 forKeyedSubscript:@"HFAppDataActionSetIconImageIdentifier_v2"];
  }
  if (v7)
  {
    id v14 = [[HFColorPaletteColor alloc] initWithUIColor:v7];
    long long v15 = [(HFColorPaletteColor *)v14 dictionaryRepresentationWithPreferredPaletteType:0];
    uint64_t v16 = [a1 applicationData];
    [v16 setObject:v15 forKeyedSubscript:@"HFAppDataActionSetIconTintColor"];
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__HMActionSet_HFAdditions__hf_setIconIdentifier_andTintColor___block_invoke;
  v19[3] = &unk_26408CD50;
  v19[4] = a1;
  uint64_t v17 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v19];

  return v17;
}

- (id)hf_mapOldIconIdentifierToNewSystemIconIdentifier:()HFAdditions
{
  id v3 = a3;
  if (qword_26AB2F1E0 != -1) {
    dispatch_once(&qword_26AB2F1E0, &__block_literal_global_45_0);
  }
  id v4 = (id)qword_26AB2F1E8;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (id)hf_shortcutAction
{
  v1 = [a1 actions];
  uint64_t v2 = objc_msgSend(v1, "na_firstObjectPassingTest:", &__block_literal_global_72_3);

  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)hf_isShortcutOwned
{
  v1 = objc_msgSend(a1, "hf_shortcutAction");
  BOOL v2 = v1 != 0;

  return v2;
}

@end