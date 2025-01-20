@interface HFAbstractBaseActionSetBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)_updateActionBuildersForLightColorAction:(id)a3;
- (BOOL)isAffectedByEndEvents;
- (BOOL)requiresDeviceUnlock;
- (HFAbstractBaseActionSetBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFMediaPlaybackActionBuilder)mediaAction;
- (HFMutableSetDiff)actionBuilders;
- (NSArray)actions;
- (NSArray)matterActionBuilders;
- (NSArray)naturalLightingActions;
- (id)_removeSuccessfulChanges:(id)a3 fromSetDiff:(id)a4;
- (id)commitItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createActionSetBuilder;
- (id)deleteActionSet;
- (id)existingActionBuilder:(id)a3 inSet:(id)a4;
- (id)lazilyUpdateActions;
- (void)addAction:(id)a3;
- (void)removeAction:(id)a3;
- (void)removeAllActions;
- (void)setActionBuilders:(id)a3;
- (void)updateAction:(id)a3;
- (void)updateActionsInBuilder:(id)a3;
@end

@implementation HFAbstractBaseActionSetBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFAbstractBaseActionSetBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFAbstractBaseActionSetBuilder;
  v7 = [(HFItemBuilder *)&v16 initWithExistingObject:a3 inHome:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(HFAbstractBaseActionSetBuilder *)v7 actionSet];
    v10 = [v9 actions];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__HFAbstractBaseActionSetBuilder_initWithExistingObject_inHome___block_invoke;
    v14[3] = &unk_2640905B8;
    id v15 = v6;
    v11 = objc_msgSend(v10, "na_map:", v14);

    v12 = [[HFMutableSetDiff alloc] initWithFromSet:v11];
    [(HFAbstractBaseActionSetBuilder *)v8 setActionBuilders:v12];
  }
  return v8;
}

id __64__HFAbstractBaseActionSetBuilder_initWithExistingObject_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HFActionBuilder actionBuilderForAction:a2 inHome:*(void *)(a1 + 32)];
}

- (NSArray)actions
{
  v2 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
  v3 = [v2 toSet];
  v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (void)addAction:(id)a3
{
  id v4 = a3;
  v5 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
  id v6 = [v5 toSet];
  v7 = [(HFAbstractBaseActionSetBuilder *)self existingActionBuilder:v4 inSet:v6];

  [v7 updateWithActionBuilder:v4];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  objc_opt_class();
  id v18 = v4;
  if (objc_opt_isKindOfClass()) {
    v11 = v18;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  objc_opt_class();
  id v13 = v8;
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v10 && v12)
  {
    objc_super v16 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
    [v16 updateObject:v10];
LABEL_19:

    goto LABEL_20;
  }
  if (v13 && !v15)
  {
    v17 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
    [v17 deleteObject:v13];
  }
  if ([(HFAbstractBaseActionSetBuilder *)self _updateActionBuildersForLightColorAction:v18]&& !v15)
  {
    objc_super v16 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
    [v16 addObject:v18];
    goto LABEL_19;
  }
LABEL_20:
}

- (void)updateAction:(id)a3
{
  id v4 = a3;
  [(HFAbstractBaseActionSetBuilder *)self _updateActionBuildersForLightColorAction:v4];
  id v5 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
  [v5 updateObject:v4];
}

- (void)removeAction:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
  [v5 deleteObject:v4];
}

- (void)removeAllActions
{
  id v2 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
  [v2 deleteAllObjects];
}

- (BOOL)requiresDeviceUnlock
{
  id v2 = [(HFAbstractBaseActionSetBuilder *)self actions];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_181);

  return v3;
}

uint64_t __54__HFAbstractBaseActionSetBuilder_requiresDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 requiresDeviceUnlock];
}

- (BOOL)isAffectedByEndEvents
{
  id v2 = [(HFAbstractBaseActionSetBuilder *)self actions];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_7_8);

  return v3;
}

uint64_t __55__HFAbstractBaseActionSetBuilder_isAffectedByEndEvents__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAffectedByEndEvents];
}

- (HFMediaPlaybackActionBuilder)mediaAction
{
  id v2 = [(HFAbstractBaseActionSetBuilder *)self actions];
  char v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_9_9);

  return (HFMediaPlaybackActionBuilder *)v3;
}

uint64_t __45__HFAbstractBaseActionSetBuilder_mediaAction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)naturalLightingActions
{
  id v2 = [(HFAbstractBaseActionSetBuilder *)self actions];
  char v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_12_7);

  return (NSArray *)v3;
}

id __56__HFAbstractBaseActionSetBuilder_naturalLightingActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
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

- (NSArray)matterActionBuilders
{
  id v2 = [(HFAbstractBaseActionSetBuilder *)self actions];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_15_8);

  return (NSArray *)v3;
}

id __54__HFAbstractBaseActionSetBuilder_matterActionBuilders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
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

- (id)deleteActionSet
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractBaseActionSetBuilder.m", 162, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractBaseActionSetBuilder deleteActionSet]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)existingActionBuilder:(id)a3 inSet:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "canUpdateWithActionBuilder:", v5, (void)v12))
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_updateActionBuildersForLightColorAction:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
  id v6 = [v5 toSet];
  id v7 = (void *)[v6 copy];

  objc_opt_class();
  id v8 = v4;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = &off_26408A000;
  objc_opt_class();
  id v12 = v8;
  if (objc_opt_isKindOfClass()) {
    long long v13 = v12;
  }
  else {
    long long v13 = 0;
  }
  id v14 = v13;

  if (v10)
  {
    if ([v10 naturalLightEnabled])
    {
      id v51 = v12;
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __75__HFAbstractBaseActionSetBuilder__updateActionBuildersForLightColorAction___block_invoke;
      v64[3] = &unk_26408EA88;
      id v65 = v10;
      long long v15 = objc_msgSend(v7, "na_filter:", v64);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v61 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            v21 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
            [v21 deleteObject:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v60 objects:v69 count:16];
        }
        while (v17);
      }

      BOOL v22 = 1;
      id v12 = v51;
      goto LABEL_51;
    }
LABEL_20:
    BOOL v22 = 1;
    goto LABEL_51;
  }
  if (!v14) {
    goto LABEL_20;
  }
  uint64_t v23 = *MEMORY[0x263F0C1C0];
  v68[0] = *MEMORY[0x263F0C398];
  v68[1] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:2];
  v25 = [v14 characteristic];
  v26 = [v25 characteristicType];

  uint64_t v27 = *MEMORY[0x263F0BFF8];
  if ([v26 isEqualToString:*MEMORY[0x263F0BFF8]])
  {
    id v28 = v24;
  }
  else if ([v24 containsObject:v26])
  {
    uint64_t v67 = v27;
    id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
  }
  else
  {
    id v28 = 0;
  }
  v53 = v28;
  if ([v28 count])
  {
    v47 = v26;
    v48 = v24;
    v50 = v7;
    id v52 = v12;
    v49 = 0;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    obuint64_t j = v7;
    uint64_t v29 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v57;
      char v54 = 1;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v57 != v31) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          if (objc_msgSend(v33, "hasSameTargetAsActionBuilder:", v14, v47, v48, v49, v50))
          {
            id v34 = v14;
            objc_opt_class();
            id v35 = v33;
            if (objc_opt_isKindOfClass()) {
              v36 = v35;
            }
            else {
              v36 = 0;
            }
            id v37 = v36;

            v38 = v11;
            objc_opt_class();
            id v39 = v35;
            if (objc_opt_isKindOfClass()) {
              v40 = v39;
            }
            else {
              v40 = 0;
            }
            id v41 = v40;

            if ([v37 naturalLightEnabled])
            {
              char v54 = 0;
            }
            else if (v41)
            {
              v42 = [v41 characteristic];
              v43 = [v42 characteristicType];

              if ([v53 containsObject:v43])
              {
                v44 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
                [v44 deleteObject:v41];
              }
            }

            v11 = v38;
            id v14 = v34;
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
      }
      while (v30);
    }
    else
    {
      char v54 = 1;
    }

    id v10 = v49;
    id v7 = v50;
    id v12 = v52;
    v26 = v47;
    v24 = v48;
    char v45 = v54;
  }
  else
  {
    char v45 = 1;
  }

  BOOL v22 = v45 & 1;
LABEL_51:

  return v22;
}

uint64_t __75__HFAbstractBaseActionSetBuilder__updateActionBuildersForLightColorAction___block_invoke(uint64_t a1, void *a2)
{
  v13[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 hasSameTargetAsActionBuilder:*(void *)(a1 + 32)])
  {
    uint64_t v4 = *MEMORY[0x263F0BFF8];
    v13[0] = *MEMORY[0x263F0C398];
    v13[1] = v4;
    v13[2] = *MEMORY[0x263F0C1C0];
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
    objc_opt_class();
    id v6 = v3;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    v9 = [v8 characteristic];
    id v10 = [v9 characteristicType];

    uint64_t v11 = [v5 containsObject:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)commitItem
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAbstractBaseActionSetBuilder.m", 299, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAbstractBaseActionSetBuilder commitItem]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)createActionSetBuilder
{
  id v3 = [(HFItemBuilder *)self home];
  int v4 = [v3 areAutomationBuildersSupported];

  if (v4)
  {
    id v5 = [(HFItemBuilder *)self home];
    id v6 = (void *)[v5 newActionSetBuilder];

    [(HFAbstractBaseActionSetBuilder *)self updateActionsInBuilder:v6];
    id v7 = [MEMORY[0x263F58190] futureWithResult:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)updateActionsInBuilder:(id)a3
{
  id v4 = a3;
  id v8 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
  id v5 = [v8 toSet];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_25_12);
  id v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_28_5);
  [v4 setActions:v7];
}

uint64_t __57__HFAbstractBaseActionSetBuilder_updateActionsInBuilder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 createNewAction];
}

BOOL __57__HFAbstractBaseActionSetBuilder_updateActionsInBuilder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (id)lazilyUpdateActions
{
  objc_opt_class();
  id v3 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    [(HFAbstractBaseActionSetBuilder *)self updateActionsInBuilder:v5];
    id v6 = [MEMORY[0x263F58190] futureWithResult:v5];
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke;
    aBlock[3] = &unk_2640992E8;
    aBlock[4] = self;
    id v7 = _Block_copy(aBlock);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_35;
    v16[3] = &unk_2640992E8;
    v16[4] = self;
    id v8 = _Block_copy(v16);
    v9 = (void *)MEMORY[0x263F58190];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_39;
    v13[3] = &unk_264099310;
    void v13[4] = self;
    id v14 = v7;
    id v15 = v8;
    id v10 = v7;
    id v11 = v8;
    id v6 = [v9 lazyFutureWithBlock:v13];
  }
  return v6;
}

id __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2;
  v20[3] = &unk_26408E218;
  v20[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v21 = v5;
  id v6 = [v4 futureWithErrorOnlyHandlerAdapterBlock:v20];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_3;
  v17[3] = &unk_2640911C8;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 32);
  id v18 = v7;
  uint64_t v19 = v8;
  id v9 = (id)[v6 addSuccessBlock:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_32;
  v14[3] = &unk_26408C8C8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v7;
  uint64_t v16 = v10;
  id v11 = v7;
  id v12 = (id)[v6 addFailureBlock:v14];

  return v6;
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 actionSet];
  id v5 = [*(id *)(a1 + 40) action];
  [v6 addAction:v5 completionHandler:v4];
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) action];
    id v4 = [*(id *)(a1 + 40) actionSet];
    id v5 = objc_msgSend(v4, "hf_prettyDescription");
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Added action: %@ to action set:%@", (uint8_t *)&v6, 0x16u);
  }
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) action];
    int v6 = [*(id *)(a1 + 40) actionSet];
    id v7 = objc_msgSend(v6, "hf_prettyDescription");
    int v8 = 138412802;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to add action: %@ to action set: %@. Error: %@", (uint8_t *)&v8, 0x20u);
  }
}

id __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2_36;
  v20[3] = &unk_26408E218;
  v20[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v21 = v5;
  int v6 = [v4 futureWithErrorOnlyHandlerAdapterBlock:v20];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_3_37;
  v17[3] = &unk_2640911C8;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 32);
  id v18 = v7;
  uint64_t v19 = v8;
  id v9 = (id)[v6 addSuccessBlock:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_38;
  v14[3] = &unk_26408C8C8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v7;
  uint64_t v16 = v10;
  id v11 = v7;
  id v12 = (id)[v6 addFailureBlock:v14];

  return v6;
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2_36(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 actionSet];
  id v5 = [*(id *)(a1 + 40) action];
  [v6 removeAction:v5 completionHandler:v4];
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_3_37(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) action];
    id v4 = [*(id *)(a1 + 40) actionSet];
    id v5 = objc_msgSend(v4, "hf_prettyDescription");
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Removed action: %@ from action set:%@", (uint8_t *)&v6, 0x16u);
  }
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) action];
    int v6 = [*(id *)(a1 + 40) actionSet];
    id v7 = objc_msgSend(v6, "hf_prettyDescription");
    int v8 = 138412802;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to remove action: %@ from action set: %@. Error: %@", (uint8_t *)&v8, 0x20u);
  }
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_39(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v5 = [v4 actionBuilders];
  int v6 = [v4 commitItemBuilderSetDiff:v5 addBlock:a1[5] deleteBlock:a1[6]];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2_40;
  v9[3] = &unk_26408F238;
  v9[4] = a1[4];
  id v10 = v3;
  id v7 = v3;
  id v8 = (id)[v6 addCompletionBlock:v9];
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2_40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  if (!v5)
  {
    uint64_t v14 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [*(id *)(a1 + 32) actionBuilders];
      *(_DWORD *)buf = 138412290;
      id v21 = v15;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Update actionBuilders: %@", buf, 0xCu);
    }
    uint64_t v16 = [HFMutableSetDiff alloc];
    id v8 = [*(id *)(a1 + 32) actionBuilders];
    id v11 = [v8 toSet];
    __int16 v12 = [(HFMutableSetDiff *)v16 initWithFromSet:v11];
    [*(id *)(a1 + 32) setActionBuilders:v12];
    goto LABEL_9;
  }
  id v7 = [v5 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"HFItemBuilderErrorUserInfoSuccessfulChangesKey"];

  id v9 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v18 = [*(id *)(a1 + 32) actionBuilders];
    *(_DWORD *)buf = 138412802;
    id v21 = v18;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Failed to update actionBuilders: %@, successful changes: %@. Error: %@", buf, 0x20u);
  }
  if (v8)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v10 actionBuilders];
    __int16 v12 = [v10 _removeSuccessfulChanges:v8 fromSetDiff:v11];
    id v13 = (void *)[(HFMutableSetDiff *)v12 mutableCopy];
    [*(id *)(a1 + 32) setActionBuilders:v13];

LABEL_9:
  }

  uint64_t v17 = +[HFHomeKitDispatcher sharedDispatcher];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_42;
  v19[3] = &unk_26408CDA0;
  v19[4] = *(void *)(a1 + 32);
  [v17 dispatchHomeObserverMessage:v19 sender:0];

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_42(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) actionSet];
    [v5 home:v3 didUpdateActionsForActionSet:v4];
  }
}

- (id)_removeSuccessfulChanges:(id)a3 fromSetDiff:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [HFMutableSetDiff alloc];
  id v8 = [v6 toSet];
  id v9 = [(HFMutableSetDiff *)v7 initWithFromSet:v8];

  id v10 = [v5 additions];
  id v11 = [v6 additions];
  __int16 v12 = objc_msgSend(v10, "na_setByRemovingObjectsFromSet:", v11);
  [(HFMutableSetDiff *)v9 addObjects:v12];

  id v13 = [v5 updates];
  uint64_t v14 = [v6 updates];
  id v15 = objc_msgSend(v13, "na_setByRemovingObjectsFromSet:", v14);
  [(HFMutableSetDiff *)v9 updateObjects:v15];

  uint64_t v16 = [v5 deletions];

  uint64_t v17 = [v6 deletions];

  id v18 = objc_msgSend(v16, "na_setByRemovingObjectsFromSet:", v17);
  [(HFMutableSetDiff *)v9 deleteObjects:v18];

  uint64_t v19 = (void *)[(HFMutableSetDiff *)v9 copy];
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
  id v7 = [(HFItemBuilder *)self home];
  id v8 = (void *)[v5 initWithExistingObject:v6 inHome:v7];

  id v9 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
  id v10 = (void *)[v9 mutableCopyWithZone:a3];
  [v8 setActionBuilders:v10];

  return v8;
}

- (HFMutableSetDiff)actionBuilders
{
  return self->_actionBuilders;
}

- (void)setActionBuilders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBuilders, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end