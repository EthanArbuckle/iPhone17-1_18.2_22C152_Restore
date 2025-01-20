@interface HFTriggerActionSetsBuilder
- (BOOL)areActionsAffectedByEndEvents;
- (BOOL)hasActions;
- (BOOL)isShortcutOwned;
- (HFMutableSetDiff)actionSetBuilders;
- (HFSetDiff)namedActionSetsDiff;
- (HFTriggerActionSetsBuilder)initWithActionSets:(id)a3 inHome:(id)a4;
- (HFTriggerActionSetsBuilder)initWithActionSets:(id)a3 inHome:(id)a4 filterEmptyActionSets:(BOOL)a5;
- (HFTriggerAnonymousActionSetBuilder)anonymousActionSetBuilder;
- (HMHome)home;
- (HMShortcutAction)shortcutAction;
- (NSArray)allActionBuilders;
- (NSArray)allActionSets;
- (NSArray)anonymousActionBuilder;
- (NSArray)namedActionSets;
- (WFHomeWorkflow)homeWorkflow;
- (id)_generateSummaryInformation;
- (id)_generateSummaryInformationForShortcutOwnedTrigger;
- (id)_generateSummaryInformationForStandardTrigger;
- (id)_removeDuplicateActionSets:(id)a3;
- (id)_removeEmptyActionSets:(id)a3;
- (id)_uniqueServiceGroupForServices:(id)a3;
- (id)compareToObject:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createActionSetsForShortcuts;
- (id)mediaAccessoriesForPlaybackAction:(id)a3;
- (unint64_t)hash;
- (void)_generateMatterRepresentables:(id)a3;
- (void)_generateStandaloneServices:(id)a3 andMediaAccessories:(id)a4;
- (void)_removeAllNamedActionsSets;
- (void)addActionSetBuilder:(id)a3;
- (void)addActionSetIfNotPresent:(id)a3;
- (void)addAnonymousActionBuilder:(id)a3;
- (void)convertToHomeWorkflowActionSet:(id)a3;
- (void)convertToHomeWorkflowActionSetIfNeeded;
- (void)defaultActionsForShortcut;
- (void)removeActionSetBuilder:(id)a3;
- (void)removeActionSetIfPresent:(id)a3;
- (void)removeAllActionsAndActionSets;
- (void)removeAnonymousActionBuilder:(id)a3;
- (void)resetActionSetBuilders;
- (void)resetAllActionSets;
- (void)setActionSetBuilders:(id)a3;
- (void)setAnonymousActionSetBuilder:(id)a3;
- (void)setFromTriggerActionSetsBuilder:(id)a3;
- (void)setHomeWorkflow:(id)a3;
- (void)setShortcutAction:(id)a3;
- (void)updateActionSetBuilder:(id)a3;
- (void)updateActionSetsInTriggerBuilder:(id)a3;
- (void)updateAnonymousActionBuilder:(id)a3;
- (void)updateFromTriggerActionSetsBuilder:(id)a3;
@end

@implementation HFTriggerActionSetsBuilder

- (id)_generateSummaryInformation
{
  if ([(HFTriggerActionSetsBuilder *)self isShortcutOwned]) {
    [(HFTriggerActionSetsBuilder *)self _generateSummaryInformationForShortcutOwnedTrigger];
  }
  else {
  v3 = [(HFTriggerActionSetsBuilder *)self _generateSummaryInformationForStandardTrigger];
  }
  return v3;
}

- (id)_generateSummaryInformationForShortcutOwnedTrigger
{
  v3 = [(HFTriggerActionSetsBuilder *)self homeWorkflow];
  if (v3)
  {
    v4 = [HFTriggerActionsSetsUISummary alloc];
    v5 = [v3 summaryString];
    v6 = [v3 summaryIconDescriptors];
    v7 = [(HFTriggerActionsSetsUISummary *)v4 initWithSummaryText:v5 summaryIconDescriptors:v6];
  }
  else
  {
    v7 = [(HFTriggerActionSetsBuilder *)self _generateSummaryInformationForStandardTrigger];
  }

  return v7;
}

- (id)_generateSummaryInformationForStandardTrigger
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(HFTriggerActionsSetsUISummary);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v4 = [(HFTriggerActionSetsBuilder *)self namedActionSets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v63 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        v10 = [v9 name];
        [(HFTriggerActionsSetsUISummary *)v3 addSceneNamed:v10];

        v11 = [v9 actionSet];
        v12 = objc_msgSend(v11, "hf_iconDescriptor");

        if (v12) {
          [(HFTriggerActionsSetsUISummary *)v3 addIconDescriptor:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v6);
  }

  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [(HFTriggerActionSetsBuilder *)self _generateStandaloneServices:v13 andMediaAccessories:v14];
  v15 = [(HFTriggerActionSetsBuilder *)self _uniqueServiceGroupForServices:v13];
  v16 = v15;
  if (v15)
  {
    v17 = [v15 name];
    [(HFTriggerActionsSetsUISummary *)v3 setUniqueServiceGroupName:v17];
  }
  v49 = v16;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v18 = v13;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v59 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        v24 = [v23 name];
        [(HFTriggerActionsSetsUISummary *)v3 addServiceNamed:v24];

        v25 = objc_msgSend(v23, "hf_iconDescriptor");
        [(HFTriggerActionsSetsUISummary *)v3 addIconDescriptor:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v20);
  }
  v48 = v18;

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v26 = v14;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v55 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v54 + 1) + 8 * k);
        v32 = objc_msgSend(v31, "hf_serviceNameComponents", v48, v49);
        v33 = [v32 composedString];
        [(HFTriggerActionsSetsUISummary *)v3 addMediaAccessoryNamed:v33];

        v34 = +[HFMediaHelper mediaIconDescriptorForMediaContainer:v31];
        [(HFTriggerActionsSetsUISummary *)v3 addIconDescriptor:v34];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v28);
  }

  id v35 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [(HFTriggerActionSetsBuilder *)self _generateMatterRepresentables:v35];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v36 = v35;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v51;
    do
    {
      for (uint64_t m = 0; m != v38; ++m)
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v50 + 1) + 8 * m);
        v42 = objc_msgSend(v41, "hf_serviceNameComponents", v48);
        v43 = [v42 serviceName];
        [(HFTriggerActionsSetsUISummary *)v3 addMatterRepresentableNamed:v43];

        v44 = [HFImageIconDescriptor alloc];
        v45 = objc_msgSend(v41, "hf_iconIdentifier");
        v46 = [(HFImageIconDescriptor *)v44 initWithImageIdentifier:v45];

        [(HFTriggerActionsSetsUISummary *)v3 addIconDescriptor:v46];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v50 objects:v66 count:16];
    }
    while (v38);
  }

  return v3;
}

- (void)_generateStandaloneServices:(id)a3 andMediaAccessories:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  v8 = [v7 actions];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v14 = [v13 getOrCreateAction];
        if (v14)
        {
          objc_opt_class();
          id v15 = v14;
          if (objc_opt_isKindOfClass()) {
            v16 = v15;
          }
          else {
            v16 = 0;
          }
          id v17 = v16;

          if (v17)
          {
            id v18 = [v17 characteristic];
            uint64_t v19 = [v18 service];

            if (!v19)
            {
              uint64_t v20 = [v17 characteristic];
              NSLog(&cfstr_UnexpectedlyGo.isa, v17, v20);
            }
            objc_msgSend(v6, "na_safeAddObject:", v19);
          }
          else
          {
            objc_opt_class();
            uint64_t v19 = [v13 action];
            if (objc_opt_isKindOfClass()) {
              uint64_t v21 = v19;
            }
            else {
              uint64_t v21 = 0;
            }
            id v22 = v21;

            if (v22)
            {
              v23 = [(HFTriggerActionSetsBuilder *)self mediaAccessoriesForPlaybackAction:v22];
              [v24 unionSet:v23];
            }
            else
            {
              uint64_t v19 = 0;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }
}

- (void)_generateMatterRepresentables:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  id v6 = [v5 actions];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) getOrCreateAction];
        if (v11)
        {
          objc_opt_class();
          id v12 = v11;
          if (objc_opt_isKindOfClass()) {
            id v13 = v12;
          }
          else {
            id v13 = 0;
          }
          id v14 = v13;

          if (v14)
          {
            id v15 = [v14 representedAccessory];
            if (v15)
            {
              v16 = [[HFMatterAccessoryRepresentable alloc] initWithAccessory:v15];
              objc_msgSend(v4, "na_safeAddObject:", v16);
            }
            else
            {
              NSLog(&cfstr_UnexpectedlyGo_0.isa, v14);
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (id)_uniqueServiceGroupForServices:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  id v6 = [v5 home];
  uint64_t v7 = [v6 serviceGroups];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "hf_isSupported"))
        {
          id v14 = objc_alloc(MEMORY[0x263EFFA08]);
          id v15 = [v13 services];
          v16 = (void *)[v14 initWithArray:v15];

          if ([v16 intersectsSet:v4])
          {
            if (v10 || ![v16 isEqualToSet:v4])
            {

              long long v17 = 0;
              goto LABEL_18;
            }
            id v10 = v13;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }

  id v10 = v10;
  long long v17 = v10;
LABEL_18:

  return v17;
}

- (id)mediaAccessoriesForPlaybackAction:(id)a3
{
  id v4 = [a3 mediaProfiles];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke;
  v7[3] = &unk_264091EE0;
  v7[4] = self;
  uint64_t v5 = objc_msgSend(v4, "na_map:", v7);

  return v5;
}

id __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) anonymousActionSetBuilder];
  uint64_t v5 = [v4 home];
  id v6 = [v5 mediaSystems];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke_2;
  v12[3] = &unk_2640913C0;
  id v13 = v3;
  id v7 = v3;
  uint64_t v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v12);

  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v7;
  }
  id v10 = v9;

  return v10;
}

uint64_t __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke_3;
  v6[3] = &unk_26408D968;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __68__HFTriggerActionSetsBuilder_UI__mediaAccessoriesForPlaybackAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaProfile];
  uint64_t v4 = objc_msgSend(v3, "hf_mediaRouteIdentifier");
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "hf_mediaRouteIdentifier");
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

- (void)updateActionSetsInTriggerBuilder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFTriggerActionSetsBuilder *)self namedActionSetsDiff];
  uint64_t v6 = [v5 toSet];
  id v7 = [v6 allObjects];
  objc_msgSend(v7, "na_map:", &__block_literal_global_78);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setActionSets:v10];
  uint64_t v8 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  uint64_t v9 = [v4 triggerOwnedActionSet];

  [v8 updateActionsInBuilder:v9];
}

uint64_t __83__HFTriggerActionSetsBuilder_AutomationBuilders__updateActionSetsInTriggerBuilder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 actionSet];
}

- (HFTriggerActionSetsBuilder)initWithActionSets:(id)a3 inHome:(id)a4
{
  return [(HFTriggerActionSetsBuilder *)self initWithActionSets:a3 inHome:a4 filterEmptyActionSets:0];
}

- (HFTriggerActionSetsBuilder)initWithActionSets:(id)a3 inHome:(id)a4 filterEmptyActionSets:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)HFTriggerActionSetsBuilder;
  id v10 = [(HFTriggerActionSetsBuilder *)&v38 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_home, a4);
    id v12 = [(HFTriggerActionSetsBuilder *)v11 _removeDuplicateActionSets:v8];
    if (v5)
    {
      uint64_t v13 = [(HFTriggerActionSetsBuilder *)v11 _removeEmptyActionSets:v12];

      id v12 = (void *)v13;
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
LABEL_6:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v18), "hf_shortcutAction");
        [(HFTriggerActionSetsBuilder *)v11 setShortcutAction:v19];

        long long v20 = [(HFTriggerActionSetsBuilder *)v11 shortcutAction];

        if (v20) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v16) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __78__HFTriggerActionSetsBuilder_initWithActionSets_inHome_filterEmptyActionSets___block_invoke;
    v32[3] = &unk_264094378;
    id v21 = v9;
    id v33 = v21;
    long long v22 = objc_msgSend(v14, "na_map:", v32);
    v23 = (void *)[v22 mutableCopy];

    uint64_t v24 = objc_msgSend(v14, "na_firstObjectPassingTest:", &__block_literal_global_85);
    long long v25 = [HFMutableSetDiff alloc];
    long long v26 = [MEMORY[0x263EFFA08] setWithArray:v23];
    long long v27 = [(HFMutableSetDiff *)v25 initWithFromSet:v26];
    [(HFTriggerActionSetsBuilder *)v11 setActionSetBuilders:v27];

    long long v28 = [HFTriggerAnonymousActionSetBuilder alloc];
    if (v24) {
      uint64_t v29 = [(HFTriggerAnonymousActionSetBuilder *)v28 initWithExistingObject:v24 inHome:v21];
    }
    else {
      uint64_t v29 = [(HFItemBuilder *)v28 initWithHome:v21];
    }
    uint64_t v30 = (void *)v29;
    [(HFTriggerActionSetsBuilder *)v11 setAnonymousActionSetBuilder:v29];
  }
  return v11;
}

HFActionSetBuilder *__78__HFTriggerActionSetsBuilder_initWithActionSets_inHome_filterEmptyActionSets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isAnonymous")) {
    id v4 = 0;
  }
  else {
    id v4 = [[HFActionSetBuilder alloc] initWithExistingObject:v3 inHome:*(void *)(a1 + 32)];
  }

  return v4;
}

uint64_t __78__HFTriggerActionSetsBuilder_initWithActionSets_inHome_filterEmptyActionSets___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAnonymous");
}

- (id)_removeDuplicateActionSets:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) uniqueIdentifier];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        uint64_t v18 = objc_msgSend(v17, "uniqueIdentifier", (void)v22);
        int v19 = [v4 containsObject:v18];

        if (v19)
        {
          long long v20 = [v17 uniqueIdentifier];
          [v4 removeObject:v20];

          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)_removeEmptyActionSets:(id)a3
{
  return (id)objc_msgSend(a3, "na_filter:", &__block_literal_global_8_2);
}

BOOL __53__HFTriggerActionSetsBuilder__removeEmptyActionSets___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)setFromTriggerActionSetsBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [HFMutableSetDiff alloc];
  uint64_t v6 = [v4 namedActionSetsDiff];
  uint64_t v7 = [v6 toSet];
  uint64_t v8 = [(HFMutableSetDiff *)v5 initWithFromSet:v7];
  [(HFTriggerActionSetsBuilder *)self setActionSetBuilders:v8];

  id v9 = [HFTriggerAnonymousActionSetBuilder alloc];
  id v10 = [(HFTriggerActionSetsBuilder *)self home];
  uint64_t v11 = [(HFItemBuilder *)v9 initWithHome:v10];
  [(HFTriggerActionSetsBuilder *)self setAnonymousActionSetBuilder:v11];

  id v14 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  id v12 = [v4 anonymousActionSetBuilder];

  uint64_t v13 = [v12 actionBuilders];
  [v14 updateActionBuildersDiff:v13];
}

- (void)updateFromTriggerActionSetsBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 actionSetBuilders];
  uint64_t v6 = (void *)[v5 mutableCopy];
  [(HFTriggerActionSetsBuilder *)self setActionSetBuilders:v6];

  uint64_t v7 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  uint64_t v8 = [v4 anonymousActionSetBuilder];
  id v9 = [v8 actionBuilders];
  [v7 updateActionBuildersDiff:v9];

  id v10 = [v4 shortcutAction];

  [(HFTriggerActionSetsBuilder *)self setShortcutAction:v10];
}

- (HFSetDiff)namedActionSetsDiff
{
  v2 = [(HFTriggerActionSetsBuilder *)self actionSetBuilders];
  BOOL v3 = (void *)[v2 copy];

  return (HFSetDiff *)v3;
}

- (BOOL)isShortcutOwned
{
  BOOL v3 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  if ([v3 actionSetType] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(HFTriggerActionSetsBuilder *)self shortcutAction];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (WFHomeWorkflow)homeWorkflow
{
  v2 = [(HFTriggerActionSetsBuilder *)self shortcutAction];
  BOOL v3 = [v2 shortcut];

  return (WFHomeWorkflow *)v3;
}

- (void)setHomeWorkflow:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F0E780]) initWithShortcut:v5];
    [(HFTriggerActionSetsBuilder *)self setShortcutAction:v4];
  }
  else
  {
    [(HFTriggerActionSetsBuilder *)self setShortcutAction:0];
  }
}

- (BOOL)hasActions
{
  BOOL v3 = [(HFTriggerActionSetsBuilder *)self namedActionSets];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
    uint64_t v6 = [v5 actions];
    if ([v6 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v7 = [(HFTriggerActionSetsBuilder *)self shortcutAction];
      BOOL v4 = v7 != 0;
    }
  }

  return v4;
}

- (NSArray)namedActionSets
{
  v2 = [(HFTriggerActionSetsBuilder *)self actionSetBuilders];
  BOOL v3 = [v2 toSet];
  BOOL v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (NSArray)anonymousActionBuilder
{
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFTriggerActionSetsBuilder *)self shortcutAction];

  if (v3)
  {
    BOOL v4 = [(HFTriggerActionSetsBuilder *)self shortcutAction];
    id v5 = [(HFTriggerActionSetsBuilder *)self home];
    uint64_t v6 = +[HFActionBuilder actionBuilderForAction:v4 inHome:v5];

    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v6 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
    uint64_t v7 = [v6 actions];
  }
  uint64_t v8 = (void *)v7;

  return (NSArray *)v8;
}

- (void)addActionSetBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerActionSetsBuilder *)self actionSetBuilders];
  [v5 addObject:v4];
}

- (void)updateActionSetBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerActionSetsBuilder *)self actionSetBuilders];
  [v5 updateObject:v4];
}

- (void)removeActionSetBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerActionSetsBuilder *)self actionSetBuilders];
  [v5 deleteObject:v4];
}

- (void)addAnonymousActionBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  [v5 addAction:v4];
}

- (void)updateAnonymousActionBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  [v5 updateAction:v4];
}

- (void)removeAnonymousActionBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  [v5 removeAction:v4];
}

- (void)removeAllActionsAndActionSets
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFTriggerActionSetsBuilder *)self namedActionSets];
  id v4 = (void *)[v3 copy];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HFTriggerActionSetsBuilder removeActionSetBuilder:](self, "removeActionSetBuilder:", *(void *)(*((void *)&v11 + 1) + 8 * v9++), (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  id v10 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  [v10 removeAllActions];
}

- (BOOL)areActionsAffectedByEndEvents
{
  BOOL v3 = [(HFTriggerActionSetsBuilder *)self namedActionSets];
  id v4 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  id v5 = [v3 arrayByAddingObject:v4];

  LOBYTE(v4) = objc_msgSend(v5, "na_any:", &__block_literal_global_14_3);
  return (char)v4;
}

uint64_t __59__HFTriggerActionSetsBuilder_areActionsAffectedByEndEvents__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAffectedByEndEvents];
}

- (void)resetAllActionSets
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFFA08] set];
  id v4 = [(HFTriggerActionSetsBuilder *)self actionSetBuilders];
  id v5 = [v4 toSet];
  uint64_t v6 = +[HFSetDiff diffFromSet:v3 toSet:v5];
  uint64_t v7 = (void *)[v6 mutableCopy];
  [(HFTriggerActionSetsBuilder *)self setActionSetBuilders:v7];

  uint64_t v8 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  uint64_t v9 = [HFTriggerAnonymousActionSetBuilder alloc];
  id v10 = [(HFTriggerActionSetsBuilder *)self home];
  long long v11 = [(HFItemBuilder *)v9 initWithHome:v10];
  [(HFTriggerActionSetsBuilder *)self setAnonymousActionSetBuilder:v11];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v12 = objc_msgSend(v8, "actions", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
        uint64_t v18 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
        int v19 = (void *)[v17 copyForCreatingNewAction];
        [v18 addAction:v19];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
}

- (void)resetActionSetBuilders
{
  BOOL v3 = [HFMutableSetDiff alloc];
  id v6 = [(HFTriggerActionSetsBuilder *)self actionSetBuilders];
  id v4 = [v6 toSet];
  id v5 = [(HFMutableSetDiff *)v3 initWithFromSet:v4];
  [(HFTriggerActionSetsBuilder *)self setActionSetBuilders:v5];
}

- (void)addActionSetIfNotPresent:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerActionSetsBuilder *)self namedActionSets];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__HFTriggerActionSetsBuilder_addActionSetIfNotPresent___block_invoke;
  v11[3] = &unk_2640943A0;
  id v6 = v4;
  id v12 = v6;
  char v7 = objc_msgSend(v5, "na_any:", v11);

  if (v6 && (v7 & 1) == 0)
  {
    uint64_t v8 = [HFActionSetBuilder alloc];
    uint64_t v9 = [(HFTriggerActionSetsBuilder *)self home];
    id v10 = [(HFActionSetBuilder *)v8 initWithExistingObject:v6 inHome:v9];

    [(HFTriggerActionSetsBuilder *)self addActionSetBuilder:v10];
  }
}

uint64_t __55__HFTriggerActionSetsBuilder_addActionSetIfNotPresent___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 actionSet];
  id v4 = [v3 uniqueIdentifier];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (void)removeActionSetIfPresent:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerActionSetsBuilder *)self namedActionSets];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __55__HFTriggerActionSetsBuilder_removeActionSetIfPresent___block_invoke;
  long long v11 = &unk_2640943A0;
  id v6 = v4;
  id v12 = v6;
  char v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", &v8);

  if (v7) {
    [(HFTriggerActionSetsBuilder *)self removeActionSetBuilder:v7];
  }
  else {
    NSLog(&cfstr_CouldNotFindEx.isa, v6, v8, v9, v10, v11);
  }
}

uint64_t __55__HFTriggerActionSetsBuilder_removeActionSetIfPresent___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 actionSet];
  id v4 = [v3 uniqueIdentifier];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

- (id)createActionSetsForShortcuts
{
  BOOL v3 = [(HFTriggerActionSetsBuilder *)self namedActionSets];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_20_4);
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  LODWORD(v4) = [v6 hasActions];

  if (v4)
  {
    char v7 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
    uint64_t v8 = [v7 shortcutsComponentActionSet];
    objc_msgSend(v5, "na_safeAddObject:", v8);
  }
  return v5;
}

uint64_t __58__HFTriggerActionSetsBuilder_createActionSetsForShortcuts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 actionSet];
}

- (NSArray)allActionSets
{
  BOOL v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(HFTriggerActionSetsBuilder *)self namedActionSets];
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_22_4);
  uint64_t v6 = [v3 arrayWithArray:v5];

  char v7 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  LODWORD(v5) = [v7 hasActions];

  if (v5)
  {
    uint64_t v8 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
    uint64_t v9 = [v8 actionSet];

    if (v9)
    {
      id v10 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
      long long v11 = (void *)[v10 copy];

      [v11 setActionSet:0];
      uint64_t v8 = v11;
    }
    id v12 = [v8 getOrCreateActionSet];
    [v6 addObject:v12];
  }
  return (NSArray *)v6;
}

uint64_t __43__HFTriggerActionSetsBuilder_allActionSets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 actionSet];
}

- (NSArray)allActionBuilders
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  id v4 = [(HFTriggerActionSetsBuilder *)self anonymousActionBuilder];
  id v5 = (void *)[v3 initWithArray:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(HFTriggerActionSetsBuilder *)self namedActionSets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) actions];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (void)convertToHomeWorkflowActionSet:(id)a3
{
  [(HFTriggerActionSetsBuilder *)self setHomeWorkflow:a3];
  [(HFTriggerActionSetsBuilder *)self convertToHomeWorkflowActionSetIfNeeded];
}

- (void)convertToHomeWorkflowActionSetIfNeeded
{
  id v3 = [(HFTriggerActionSetsBuilder *)self shortcutAction];

  if (v3)
  {
    id v4 = [(HFTriggerActionSetsBuilder *)self shortcutAction];
    id v5 = [(HFTriggerActionSetsBuilder *)self home];
    id v7 = +[HFActionBuilder actionBuilderForAction:v4 inHome:v5];

    uint64_t v6 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
    [v6 addAction:v7 actionSetType:1];

    [(HFTriggerActionSetsBuilder *)self _removeAllNamedActionsSets];
  }
}

- (void)_removeAllNamedActionsSets
{
  id v2 = [(HFTriggerActionSetsBuilder *)self actionSetBuilders];
  [v2 deleteAllObjects];
}

- (void)defaultActionsForShortcut
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  id v3 = [v2 actionBuilders];
  id v4 = [v3 toSet];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        id v10 = v9;
        if (objc_opt_isKindOfClass()) {
          long long v11 = v10;
        }
        else {
          long long v11 = 0;
        }
        id v12 = v11;

        if (v12) {
          [v12 defaultActionIfMediaActionInvalid];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(HFTriggerActionSetsBuilder *)self actionSetBuilders];
  uint64_t v6 = [v5 fromSet];
  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_26_0);

  uint64_t v9 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v10 = [(HFTriggerActionSetsBuilder *)self home];
  long long v11 = (void *)[v9 initWithActionSets:v8 inHome:v10];

  id v12 = [(HFTriggerActionSetsBuilder *)self actionSetBuilders];
  long long v13 = (void *)[v12 mutableCopyWithZone:a3];
  [v11 setActionSetBuilders:v13];

  long long v14 = [(HFTriggerActionSetsBuilder *)self anonymousActionSetBuilder];
  long long v15 = (void *)[v14 copyWithZone:a3];
  [v11 setAnonymousActionSetBuilder:v15];

  long long v16 = [(HFTriggerActionSetsBuilder *)self shortcutAction];
  [v11 setShortcutAction:v16];

  return v11;
}

uint64_t __43__HFTriggerActionSetsBuilder_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return [a2 actionSet];
}

- (HFTriggerAnonymousActionSetBuilder)anonymousActionSetBuilder
{
  return self->_anonymousActionSetBuilder;
}

- (void)setAnonymousActionSetBuilder:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (HFMutableSetDiff)actionSetBuilders
{
  return self->_actionSetBuilders;
}

- (void)setActionSetBuilders:(id)a3
{
}

- (HMShortcutAction)shortcutAction
{
  return self->_shortcutAction;
}

- (void)setShortcutAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutAction, 0);
  objc_storeStrong((id *)&self->_actionSetBuilders, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_anonymousActionSetBuilder, 0);
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[HFComparisonResult alloc] initWithObjectA:self objectB:v4];
  if (![(HFComparisonResult *)v5 containsCriticalDifference])
  {
    uint64_t v6 = [(HFTriggerActionSetsBuilder *)self namedActionSets];
    uint64_t v7 = [v4 namedActionSets];
    uint64_t v8 = +[HFContainedObjectListDifference containedObjectDifferenceWithKey:@"actionSets" objectsA:v6 objectsB:v7];
    [(HFComparisonResult *)v5 add:v8];

    uint64_t v9 = [(HFTriggerActionSetsBuilder *)self anonymousActionBuilder];
    id v10 = [v4 anonymousActionBuilder];
    long long v11 = +[HFContainedObjectListDifference containedObjectDifferenceWithKey:@"actions" objectsA:v9 objectsB:v10];
    [(HFComparisonResult *)v5 add:v11];
  }
  return v5;
}

- (unint64_t)hash
{
  return 0;
}

@end