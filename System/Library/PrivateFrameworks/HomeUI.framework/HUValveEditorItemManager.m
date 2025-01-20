@interface HUValveEditorItemManager
+ (id)preferredSectionSortArray;
+ (id)sortComparatorForValveEditorSections;
- (HFControlPanelItemProvider)controlPanelItemProvider;
- (HFItem)nameItem;
- (HFServiceBuilder)serviceBuilder;
- (HFStaticItem)identifyItem;
- (HFStaticItemProvider)staticItemProvider;
- (HFValveServiceItem)sourceValveItem;
- (HUControlPanelController)controlPanelController;
- (HUNameItemModule)nameModule;
- (HUValveEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 editorMode:(unint64_t)a5;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_characteristicTypesForControlPanelItem:(id)a3;
- (id)_characteristicsAffectedByControlItem:(id)a3;
- (unint64_t)editorMode;
- (void)controlPanelController:(id)a3 didEndPossibleWritesForControlItem:(id)a4;
- (void)controlPanelController:(id)a3 willBeginPossibleWritesForControlItem:(id)a4;
- (void)setControlPanelController:(id)a3;
- (void)setControlPanelItemProvider:(id)a3;
- (void)setIdentifyItem:(id)a3;
- (void)setNameItem:(id)a3;
- (void)setNameModule:(id)a3;
- (void)setServiceBuilder:(id)a3;
- (void)setSourceValveItem:(id)a3;
- (void)setStaticItemProvider:(id)a3;
@end

@implementation HUValveEditorItemManager

+ (id)preferredSectionSortArray
{
  if (_MergedGlobals_4_9 != -1) {
    dispatch_once(&_MergedGlobals_4_9, &__block_literal_global_10_1);
  }
  v2 = (void *)qword_1EA12E1A8;

  return v2;
}

void __53__HUValveEditorItemManager_preferredSectionSortArray__block_invoke_2()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F2CF10];
  v2[1] = @"HUNameItemModuleSectionIdentifier";
  v2[2] = *MEMORY[0x1E4F2CFA8];
  v2[3] = @"HUValveEditorSectionIdentifierIdentify";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)qword_1EA12E1A8;
  qword_1EA12E1A8 = v0;
}

+ (id)sortComparatorForValveEditorSections
{
  return &__block_literal_global_13_4;
}

uint64_t __64__HUValveEditorItemManager_sortComparatorForValveEditorSections__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"HUValveEditorSectionSortOrderKey"];

  v8 = [v5 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"HUValveEditorSectionSortOrderKey"];

  uint64_t v10 = [v7 compare:v9];
  if (!v10)
  {
    v11 = [v4 identifier];
    v12 = [v5 identifier];
    uint64_t v10 = [v11 compare:v12];
  }
  return v10;
}

- (HUValveEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 editorMode:(unint64_t)a5
{
  id v8 = a3;
  v9 = (void *)[a4 copy];
  v21.receiver = self;
  v21.super_class = (Class)HUValveEditorItemManager;
  uint64_t v10 = [(HFItemManager *)&v21 initWithDelegate:v8 sourceItem:v9];

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    id v12 = [(HFItemManager *)v10 sourceItem];
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      v14 = (HFValveServiceItem *)v12;
      if (v13) {
        goto LABEL_9;
      }
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v15 handleFailureInFunction:v16, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];
    }
    v14 = 0;
LABEL_9:

    sourceValveItem = v10->_sourceValveItem;
    v10->_sourceValveItem = v14;

    v18 = [[HUControlPanelController alloc] initWithDelegate:v10];
    controlPanelController = v10->_controlPanelController;
    v10->_controlPanelController = v18;

    v10->_editorMode = a5;
  }
  return v10;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F69520]);
  v6 = [(HFValveServiceItem *)self->_sourceValveItem homeKitObject];
  v7 = [(HFItemManager *)self home];
  id v8 = (void *)[v5 initWithExistingObject:v6 inHome:v7];
  [(HUValveEditorItemManager *)self setServiceBuilder:v8];

  v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [(HUValveEditorItemManager *)self controlPanelItemProvider];

  if (!v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F690A8]);
    id v12 = [(HUValveEditorItemManager *)self sourceValveItem];
    v13 = [(HUValveEditorItemManager *)self sourceValveItem];
    v14 = [v13 valueSource];
    v15 = (void *)[v11 initWithItem:v12 valueSource:v14];
    [(HUValveEditorItemManager *)self setControlPanelItemProvider:v15];

    if ([(HUValveEditorItemManager *)self editorMode] == 1)
    {
      objc_initWeak(&location, self);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __55__HUValveEditorItemManager__buildItemProvidersForHome___block_invoke;
      v51[3] = &unk_1E638C518;
      objc_copyWeak(&v52, &location);
      v16 = [(HUValveEditorItemManager *)self controlPanelItemProvider];
      [v16 setFilter:v51];

      objc_destroyWeak(&v52);
      objc_destroyWeak(&location);
    }
    v17 = [(HUValveEditorItemManager *)self controlPanelItemProvider];
    [v9 addObject:v17];
  }
  v18 = [(HUValveEditorItemManager *)self staticItemProvider];
  BOOL v19 = v18 == 0;

  if (v19)
  {
    v20 = [(HUValveEditorItemManager *)self sourceValveItem];
    objc_super v21 = [v20 service];
    v22 = [v21 accessory];
    v23 = objc_msgSend(v22, "hf_owningBridgeAccessory");
    BOOL v24 = v23 == 0;

    v25 = [(HUValveEditorItemManager *)self sourceValveItem];
    v26 = [v25 latestResults];
    v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
    BOOL v28 = [v27 integerValue] == 0;

    id v29 = objc_alloc(MEMORY[0x1E4F695C0]);
    v54[0] = *MEMORY[0x1E4F68AB8];
    v30 = _HULocalizedStringWithDefaultValue(@"HUValveEditorIdentifyButtonTitle", @"HUValveEditorIdentifyButtonTitle", 1);
    v54[1] = *MEMORY[0x1E4F68B10];
    v55[0] = v30;
    v31 = [NSNumber numberWithInt:v24 | v28];
    v55[1] = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
    v33 = (void *)[v29 initWithResults:v32];
    [(HUValveEditorItemManager *)self setIdentifyItem:v33];

    id v34 = objc_alloc(MEMORY[0x1E4F695C8]);
    v35 = (void *)MEMORY[0x1E4F1CAD0];
    v36 = [(HUValveEditorItemManager *)self nameItem];
    v37 = [(HUValveEditorItemManager *)self identifyItem];
    v38 = objc_msgSend(v35, "setWithObjects:", v36, v37, 0);
    v39 = (void *)[v34 initWithItems:v38];
    [(HUValveEditorItemManager *)self setStaticItemProvider:v39];

    v40 = [(HUValveEditorItemManager *)self staticItemProvider];
    [v9 addObject:v40];
  }
  v41 = [(HUValveEditorItemManager *)self nameModule];
  BOOL v42 = v41 == 0;

  if (v42)
  {
    v43 = [HUNameItemModule alloc];
    v44 = [(HUValveEditorItemManager *)self sourceValveItem];
    v45 = [(HUValveEditorItemManager *)self serviceBuilder];
    v46 = [(HUNameItemModule *)v43 initWithItemUpdater:self sourceServiceLikeItem:v44 itemBuilder:v45];
    [(HUValveEditorItemManager *)self setNameModule:v46];

    v47 = [(HUValveEditorItemManager *)self nameModule];
    v48 = [v47 itemProviders];
    v49 = [v48 allObjects];
    [v9 addObjectsFromArray:v49];
  }

  return v9;
}

uint64_t __55__HUValveEditorItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _characteristicTypesForControlPanelItem:v3];

  uint64_t v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_21_0) ^ 1;
  return v6;
}

uint64_t __55__HUValveEditorItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*MEMORY[0x1E4F2CFA8]];
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(HUValveEditorItemManager *)self controlPanelItemProvider];
  v7 = [v6 items];
  int v8 = [v7 intersectsSet:v4];

  v62 = v4;
  if (v8)
  {
    v9 = [(HUValveEditorItemManager *)self controlPanelItemProvider];
    uint64_t v10 = [v9 items];
    id v11 = objc_msgSend(v10, "na_setByIntersectingWithSet:", v4);
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __61__HUValveEditorItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v75[3] = &unk_1E63881D0;
    v75[4] = self;
    id v12 = objc_msgSend(v11, "na_filter:", v75);

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    obuint64_t j = v12;
    uint64_t v65 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
    if (v65)
    {
      uint64_t v64 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v65; ++i)
        {
          v14 = v5;
          if (*(void *)v72 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          v16 = [(HUValveEditorItemManager *)self _characteristicTypesForControlPanelItem:v15];
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __61__HUValveEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
          v70[3] = &unk_1E6386608;
          v70[4] = self;
          v17 = objc_msgSend(v16, "na_firstObjectPassingTest:", v70);
          v18 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v17];
          uint64_t v84 = v15;
          BOOL v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
          [v18 setItems:v19];

          v20 = [(HUValveEditorItemManager *)self controlPanelController];
          objc_super v21 = [(HFItemManager *)self sourceItem];
          v22 = [v20 sectionTitleForItem:v15 forSourceItem:v21];
          [v18 setHeaderTitle:v22];

          v23 = [(HUValveEditorItemManager *)self controlPanelController];
          BOOL v24 = [(HFItemManager *)self sourceItem];
          v25 = [v23 sectionFooterForItem:v15 forSourceItem:v24];
          [v18 setFooterTitle:v25];

          v26 = [(id)objc_opt_class() preferredSectionSortArray];
          uint64_t v27 = [v26 indexOfObject:v17];

          if (v27 == 0x7FFFFFFFFFFFFFFFLL)
          {
            BOOL v28 = [(id)objc_opt_class() preferredSectionSortArray];
            uint64_t v27 = [v28 count];
          }
          v82 = @"HUValveEditorSectionSortOrderKey";
          id v29 = [NSNumber numberWithUnsignedInteger:v27];
          v83 = v29;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          [v18 setUserInfo:v30];

          id v5 = v14;
          [v14 addObject:v18];
        }
        uint64_t v65 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
      }
      while (v65);
    }

    id v4 = v62;
  }
  v31 = [(HUValveEditorItemManager *)self nameModule];
  v32 = [v31 buildSectionsWithDisplayedItems:v4];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v33 = v32;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v66 objects:v81 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v67 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        v39 = [v38 identifier];
        int v40 = [v39 isEqualToString:@"HUNameItemModuleSectionIdentifier"];

        if (v40)
        {
          v41 = (void *)[v38 mutableCopy];
          BOOL v42 = [(id)objc_opt_class() preferredSectionSortArray];
          uint64_t v43 = [v42 indexOfObject:@"HUNameItemModuleSectionIdentifier"];

          v79 = @"HUValveEditorSectionSortOrderKey";
          v44 = [NSNumber numberWithUnsignedInteger:v43];
          v80 = v44;
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          [v41 setUserInfo:v45];

          [v5 addObject:v41];
        }
        else
        {
          [v5 addObject:v38];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v66 objects:v81 count:16];
    }
    while (v35);
  }

  v46 = [(HUValveEditorItemManager *)self identifyItem];
  int v47 = [v62 containsObject:v46];

  if (v47)
  {
    v48 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUValveEditorSectionIdentifierIdentify"];
    v49 = [(HUValveEditorItemManager *)self identifyItem];
    v78 = v49;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    [v48 setItems:v50];

    v51 = [(id)objc_opt_class() preferredSectionSortArray];
    uint64_t v52 = [v51 indexOfObject:@"HUValveEditorSectionIdentifierIdentify"];

    v53 = [(HUValveEditorItemManager *)self sourceValveItem];
    v54 = [v53 service];
    v55 = [v54 serviceSubtype];

    if ([v55 isEqualToString:*MEMORY[0x1E4F2DD90]])
    {
      v56 = @"HUValveEditorIdentifyButtonFooterTitleIrrigation";
    }
    else if ([v55 isEqualToString:*MEMORY[0x1E4F2DD98]])
    {
      v56 = @"HUValveEditorIdentifyButtonFooterTitleShowerHead";
    }
    else if ([v55 isEqualToString:*MEMORY[0x1E4F2DDA8]])
    {
      v56 = @"HUValveEditorIdentifyButtonFooterTitleFaucet";
    }
    else
    {
      if (![v55 isEqualToString:*MEMORY[0x1E4F2DD88]])
      {
        v57 = 0;
        goto LABEL_32;
      }
      v56 = @"HUValveEditorIdentifyButtonFooterTitleGeneric";
    }
    v57 = _HULocalizedStringWithDefaultValue(v56, v56, 1);
LABEL_32:
    [v48 setFooterTitle:v57];
    v76 = @"HUValveEditorSectionSortOrderKey";
    v58 = [NSNumber numberWithUnsignedInteger:v52];
    v77 = v58;
    v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    [v48 setUserInfo:v59];

    [v5 addObject:v48];
  }
  v60 = [(id)objc_opt_class() sortComparatorForValveEditorSections];
  [v5 sortUsingComparator:v60];

  return v5;
}

uint64_t __61__HUValveEditorItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 controlPanelController];
  uint64_t v5 = [v4 shouldDisplayItem:v3];

  return v5;
}

uint64_t __61__HUValveEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() preferredSectionSortArray];
  uint64_t v4 = [v3 containsObject:v2];

  return v4;
}

- (id)_characteristicTypesForControlPanelItem:(id)a3
{
  id v3 = [a3 controlItems];
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HUValveEditorItemManager__characteristicTypesForControlPanelItem___block_invoke;
  v7[3] = &unk_1E638D080;
  id v5 = v4;
  id v8 = v5;
  objc_msgSend(v3, "na_each:", v7);

  return v5;
}

void __68__HUValveEditorItemManager__characteristicTypesForControlPanelItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 characteristicOptions];
  id v3 = [v4 characteristicTypesForUsage:0];
  [v2 unionSet:v3];
}

- (id)_characteristicsAffectedByControlItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v3, "characteristicOptions", 0);
  uint64_t v6 = [v5 characteristicTypesForUsage:0];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v3 valueSource];
        v13 = [v12 allCharacteristicsForCharacteristicType:v11];
        [v4 unionSet:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)controlPanelController:(id)a3 willBeginPossibleWritesForControlItem:(id)a4
{
  id v5 = [(HUValveEditorItemManager *)self _characteristicsAffectedByControlItem:a4];
  [(HFItemManager *)self beginSuppressingUpdatesForCharacteristics:v5 withReason:@"valveEditorControlItemInteraction"];
}

- (void)controlPanelController:(id)a3 didEndPossibleWritesForControlItem:(id)a4
{
}

- (HUNameItemModule)nameModule
{
  return self->_nameModule;
}

- (void)setNameModule:(id)a3
{
}

- (HFStaticItem)identifyItem
{
  return self->_identifyItem;
}

- (void)setIdentifyItem:(id)a3
{
}

- (HUControlPanelController)controlPanelController
{
  return self->_controlPanelController;
}

- (void)setControlPanelController:(id)a3
{
}

- (HFServiceBuilder)serviceBuilder
{
  return self->_serviceBuilder;
}

- (void)setServiceBuilder:(id)a3
{
}

- (unint64_t)editorMode
{
  return self->_editorMode;
}

- (HFValveServiceItem)sourceValveItem
{
  return self->_sourceValveItem;
}

- (void)setSourceValveItem:(id)a3
{
}

- (HFItem)nameItem
{
  return self->_nameItem;
}

- (void)setNameItem:(id)a3
{
}

- (HFControlPanelItemProvider)controlPanelItemProvider
{
  return self->_controlPanelItemProvider;
}

- (void)setControlPanelItemProvider:(id)a3
{
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_controlPanelItemProvider, 0);
  objc_storeStrong((id *)&self->_nameItem, 0);
  objc_storeStrong((id *)&self->_sourceValveItem, 0);
  objc_storeStrong((id *)&self->_serviceBuilder, 0);
  objc_storeStrong((id *)&self->_controlPanelController, 0);
  objc_storeStrong((id *)&self->_identifyItem, 0);

  objc_storeStrong((id *)&self->_nameModule, 0);
}

@end