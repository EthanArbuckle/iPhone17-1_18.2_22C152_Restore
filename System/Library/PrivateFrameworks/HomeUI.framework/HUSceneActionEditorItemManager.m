@interface HUSceneActionEditorItemManager
+ (id)allActionGridEditorSectionIdentifiers;
+ (id)sectionIdentifierForActionGridEditorType:(unint64_t)a3;
+ (unint64_t)actionGridEditorTypeForSectionIdentifier:(id)a3;
- (HFActionSetBuilder)actionSetBuilder;
- (HFItem)showInHomeDashboardItem;
- (HFStaticItem)changeServicesItem;
- (HFStaticItem)deleteSceneItem;
- (HFStaticItem)mediaInstructionsItem;
- (HFStaticItem)mediaItem;
- (HFStaticItem)nameAndIconItem;
- (HFStaticItem)testSceneItem;
- (HUSceneActionEditorItemManager)initWithActionSetBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5;
- (NSMutableDictionary)actionGridItemsByEditorType;
- (NSSet)actionGridItems;
- (NSSet)instructionsItems;
- (NSSet)itemsToHideWhenEmpty;
- (NSSet)prioritizedAccessories;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionForActionGridEditorType:(unint64_t)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (unint64_t)mode;
- (void)_createItemsForActionGridEditorType:(unint64_t)a3 home:(id)a4;
- (void)setActionSetBuilder:(id)a3;
- (void)setChangeServicesItem:(id)a3;
- (void)setDeleteSceneItem:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setNameAndIconItem:(id)a3;
- (void)setPrioritizedAccessories:(id)a3;
- (void)setShowInHomeDashboardItem:(id)a3;
- (void)setTestSceneItem:(id)a3;
@end

@implementation HUSceneActionEditorItemManager

- (HUSceneActionEditorItemManager)initWithActionSetBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUSceneActionEditorItemManager;
  v10 = [(HFItemManager *)&v15 initWithDelegate:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_actionSetBuilder, a3);
    v11->_mode = a4;
    uint64_t v12 = objc_opt_new();
    actionGridItemsByEditorType = v11->_actionGridItemsByEditorType;
    v11->_actionGridItemsByEditorType = (NSMutableDictionary *)v12;
  }
  return v11;
}

+ (unint64_t)actionGridEditorTypeForSectionIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [&unk_1F19B5918 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(&unk_1F19B5918);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(a1, "sectionIdentifierForActionGridEditorType:", objc_msgSend(v10, "unsignedIntegerValue"));
        char v12 = [v5 isEqualToString:v11];

        if (v12)
        {
          unint64_t v14 = [v10 unsignedIntegerValue];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [&unk_1F19B5918 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, a1, @"HUSceneActionEditorItemManager.m", 67, @"Unexpected section ID %@ for %s!", v5, "+[HUSceneActionEditorItemManager actionGridEditorTypeForSectionIdentifier:]" object file lineNumber description];

  unint64_t v14 = 0;
LABEL_11:

  return v14;
}

+ (id)sectionIdentifierForActionGridEditorType:(unint64_t)a3
{
  v3 = @"AllAccessories";
  if (a3 == 2) {
    v3 = @"OtherAccessories";
  }
  if (a3 == 1) {
    return @"PrioritizedAccessories";
  }
  else {
    return v3;
  }
}

+ (id)allActionGridEditorSectionIdentifiers
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__HUSceneActionEditorItemManager_allActionGridEditorSectionIdentifiers__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __71__HUSceneActionEditorItemManager_allActionGridEditorSectionIdentifiers__block_invoke((uint64_t)v4);

  return v2;
}

id __71__HUSceneActionEditorItemManager_allActionGridEditorSectionIdentifiers__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HUSceneActionEditorItemManager_allActionGridEditorSectionIdentifiers__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_MergedGlobals_3_4 != -1) {
    dispatch_once(&_MergedGlobals_3_4, block);
  }
  v1 = (void *)qword_1EA12DFC0;

  return v1;
}

void __71__HUSceneActionEditorItemManager_allActionGridEditorSectionIdentifiers__block_invoke_2(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [*(id *)(a1 + 32) sectionIdentifierForActionGridEditorType:0];
  v4 = objc_msgSend(*(id *)(a1 + 32), "sectionIdentifierForActionGridEditorType:", 1, v3);
  v9[1] = v4;
  id v5 = [*(id *)(a1 + 32) sectionIdentifierForActionGridEditorType:2];
  v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  uint64_t v7 = [v2 setWithArray:v6];
  uint64_t v8 = (void *)qword_1EA12DFC0;
  qword_1EA12DFC0 = v7;
}

- (NSSet)actionGridItems
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUSceneActionEditorItemManager *)self actionGridItemsByEditorType];
  v4 = [v3 allValues];
  id v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (NSSet)itemsToHideWhenEmpty
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [(HUSceneActionEditorItemManager *)self actionGridItems];
  [v3 unionSet:v4];

  id v5 = [(HUSceneActionEditorItemManager *)self testSceneItem];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  uint64_t v6 = [(HUSceneActionEditorItemManager *)self showInHomeDashboardItem];
  objc_msgSend(v3, "na_safeAddObject:", v6);

  uint64_t v7 = [(HUSceneActionEditorItemManager *)self mediaItem];
  objc_msgSend(v3, "na_safeAddObject:", v7);

  return (NSSet *)v3;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v73[2] = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  v4 = [(HUSceneActionEditorItemManager *)self actionSetBuilder];
  if ([(HUSceneActionEditorItemManager *)self mode] == 1
    || [(HUSceneActionEditorItemManager *)self mode] == 2)
  {
    id v5 = [(HFItemManager *)self home];
    uint64_t v6 = [v5 actionSets];
    uint64_t v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_101);
    uint64_t v8 = [v7 count];

    uint64_t v9 = v8 < 8;
  }
  else
  {
    v10 = [(HUSceneActionEditorItemManager *)self actionSetBuilder];
    v11 = [v10 actionSet];
    if (objc_msgSend(v11, "hf_hasSetForContextType:", 0))
    {
      int v12 = 0;
    }
    else
    {
      v13 = [(HUSceneActionEditorItemManager *)self actionSetBuilder];
      unint64_t v14 = [v13 actionSet];
      int v12 = objc_msgSend(v14, "hf_hasSetShowInHomeDashboard") ^ 1;
    }
    objc_super v15 = [(HUSceneActionEditorItemManager *)self actionSetBuilder];
    uint64_t v9 = [v15 showInHomeDashboard] | v12;
  }
  long long v16 = [(HUSceneActionEditorItemManager *)self actionSetBuilder];
  [v16 setShowInHomeDashboard:v9];

  v59 = [MEMORY[0x1E4F1CA80] set];
  id v17 = objc_alloc(MEMORY[0x1E4F695C0]);
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_2;
  v65[3] = &unk_1E6385000;
  id v60 = v4;
  id v66 = v60;
  long long v18 = (void *)[v17 initWithResultsBlock:v65];
  [(HUSceneActionEditorItemManager *)self setNameAndIconItem:v18];

  [(HUSceneActionEditorItemManager *)self _createItemsForActionGridEditorType:0 home:v61];
  [(HUSceneActionEditorItemManager *)self _createItemsForActionGridEditorType:1 home:v61];
  [(HUSceneActionEditorItemManager *)self _createItemsForActionGridEditorType:2 home:v61];
  BOOL v19 = [(HUSceneActionEditorItemManager *)self mode]
     && [(HUSceneActionEditorItemManager *)self mode] != 1
     && [(HUSceneActionEditorItemManager *)self mode] != 2
     && [(HUSceneActionEditorItemManager *)self mode] != 3;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_49;
  v64[3] = &unk_1E6387F48;
  v64[4] = self;
  v20 = __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_49((uint64_t)v64);
  id v21 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v23 = *MEMORY[0x1E4F68B10];
  v72[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v22 = v72[0];
  v72[1] = v23;
  v73[0] = v20;
  v24 = [NSNumber numberWithInt:v19];
  v73[1] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
  v26 = (void *)[v21 initWithResults:v25];
  [(HUSceneActionEditorItemManager *)self setChangeServicesItem:v26];

  id v27 = objc_alloc(MEMORY[0x1E4F695C0]);
  v70[0] = v22;
  v28 = _HULocalizedStringWithDefaultValue(@"HUSceneActionEditorTestSceneButtonTitle", @"HUSceneActionEditorTestSceneButtonTitle", 1);
  v70[1] = v23;
  v71[0] = v28;
  v29 = [NSNumber numberWithInt:v19];
  v71[1] = v29;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
  v31 = (void *)[v27 initWithResults:v30];
  [(HUSceneActionEditorItemManager *)self setTestSceneItem:v31];

  v32 = [HUIncludedContextItem alloc];
  v33 = [(HUSceneActionEditorItemManager *)self actionSetBuilder];
  v34 = [v33 actionSet];
  v35 = [(HUIncludedContextItem *)v32 initWithHomeKitObject:v34 contextType:3 home:v61];

  v36 = [NSNumber numberWithInt:v19];
  [(HUIncludedContextItem *)v35 setOverrideHiddenState:v36];

  if ([(HUSceneActionEditorItemManager *)self mode] == 1
    || [(HUSceneActionEditorItemManager *)self mode] == 2)
  {
    v37 = [(HUSceneActionEditorItemManager *)self actionSetBuilder];
    if ([v37 showInHomeDashboard]) {
      v38 = &unk_1F19B4460;
    }
    else {
      v38 = &unk_1F19B4478;
    }
    [(HUIncludedContextItem *)v35 setOverridePrimaryState:v38];
  }
  [(HUSceneActionEditorItemManager *)self setShowInHomeDashboardItem:v35];
  BOOL v39 = [(HUSceneActionEditorItemManager *)self mode] != 0;
  id v40 = objc_alloc(MEMORY[0x1E4F695C0]);
  v68[0] = v22;
  v41 = _HULocalizedStringWithDefaultValue(@"HUSceneActionEditorDeleteSceneButtonTitle", @"HUSceneActionEditorDeleteSceneButtonTitle", 1);
  v68[1] = v23;
  v69[0] = v41;
  v42 = [NSNumber numberWithInt:v39];
  v69[1] = v42;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
  v44 = (void *)[v40 initWithResults:v43];
  [(HUSceneActionEditorItemManager *)self setDeleteSceneItem:v44];

  id v45 = objc_alloc(MEMORY[0x1E4F695C0]);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_71;
  v62[3] = &unk_1E6385000;
  id v63 = v60;
  id v46 = v60;
  v47 = (void *)[v45 initWithResultsBlock:v62];
  [(HUSceneActionEditorItemManager *)self setMediaItem:v47];

  v48 = [(HUSceneActionEditorItemManager *)self actionGridItemsByEditorType];
  v49 = [v48 allValues];
  [v59 addObjectsFromArray:v49];

  v50 = [(HUSceneActionEditorItemManager *)self nameAndIconItem];
  objc_msgSend(v59, "na_safeAddObject:", v50);

  v51 = [(HUSceneActionEditorItemManager *)self mediaItem];
  objc_msgSend(v59, "na_safeAddObject:", v51);

  v52 = [(HUSceneActionEditorItemManager *)self changeServicesItem];
  objc_msgSend(v59, "na_safeAddObject:", v52);

  v53 = [(HUSceneActionEditorItemManager *)self testSceneItem];
  objc_msgSend(v59, "na_safeAddObject:", v53);

  v54 = [(HUSceneActionEditorItemManager *)self showInHomeDashboardItem];
  objc_msgSend(v59, "na_safeAddObject:", v54);

  v55 = [(HUSceneActionEditorItemManager *)self deleteSceneItem];
  objc_msgSend(v59, "na_safeAddObject:", v55);

  v56 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v59];
  v67 = v56;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];

  return v57;
}

BOOL __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isAnonymous"))
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [v2 actions];
    BOOL v3 = [v4 count] != 0;
  }
  return v3;
}

id __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v3 = [*(id *)(a1 + 32) iconDescriptor];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6 && [v6 isSystemImage])
  {
    uint64_t v7 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438F0]];
    uint64_t v8 = [v6 imageSymbolConfiguration];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 configurationByApplyingConfiguration:v7];

      uint64_t v7 = (void *)v10;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F691D0]);
    int v12 = [v6 identifier];
    uint64_t v13 = [v11 initWithSystemImageNamed:v12 configuration:v7];

    id v4 = (id)v13;
  }
  if (v4)
  {
    [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
  }
  else
  {
    unint64_t v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v19 = 138412290;
      uint64_t v20 = v18;
      _os_log_error_impl(&dword_1BE345000, v14, OS_LOG_TYPE_ERROR, "Encountered a unexpected nil value for actionSetBuilder.iconDescriptor: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  objc_super v15 = [*(id *)(a1 + 32) iconTintColor];
  if (v15) {
    [v2 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68AB0]];
  }
  long long v16 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v16;
}

id __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_49(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) actionSetBuilder];
  id v2 = [v1 actions];
  uint64_t v3 = [v2 count];

  if (v3) {
    id v4 = @"HUSceneActionEditorChangeServicesButtonTitle";
  }
  else {
    id v4 = @"HUSceneActionEditorAddFirstServiceButtonTitle";
  }
  id v5 = _HULocalizedStringWithDefaultValue(v4, v4, 1);

  return v5;
}

id __61__HUSceneActionEditorItemManager__buildItemProvidersForHome___block_invoke_71(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = _HULocalizedStringWithDefaultValue(@"HUSceneActionEditorMediaButtonTitle", @"HUSceneActionEditorMediaButtonTitle", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v4 = [*(id *)(a1 + 32) mediaAction];
  id v5 = [v4 localizedDescription];
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  id v6 = NSNumber;
  uint64_t v7 = [*(id *)(a1 + 32) mediaAction];
  uint64_t v8 = [v6 numberWithInt:v7 == 0];
  [v2 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSceneActionEditorNameSectionIdentifier"];
  id v6 = [(HUSceneActionEditorItemManager *)self nameAndIconItem];
  v40[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  [v5 setItems:v7];

  [v4 addObject:v5];
  uint64_t v8 = [(HUSceneActionEditorItemManager *)self prioritizedAccessories];
  uint64_t v9 = [v8 count];

  uint64_t v10 = self;
  if (v9)
  {
    id v11 = [(HUSceneActionEditorItemManager *)self _buildSectionForActionGridEditorType:1];
    [v4 addObject:v11];

    int v12 = [(HUSceneActionEditorItemManager *)self actionSetBuilder];
    uint64_t v13 = [v12 actions];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v36[3] = &unk_1E6387188;
    v36[4] = self;
    int v14 = objc_msgSend(v13, "na_any:", v36);

    if (!v14) {
      goto LABEL_6;
    }
    uint64_t v10 = self;
    uint64_t v15 = 2;
  }
  else
  {
    uint64_t v15 = 0;
  }
  long long v16 = [(HUSceneActionEditorItemManager *)v10 _buildSectionForActionGridEditorType:v15];
  [v4 addObject:v16];

LABEL_6:
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSceneActionEditorMediaSectionIdentifier"];
  uint64_t v18 = _HULocalizedStringWithDefaultValue(@"HUSceneActionEditorMediaInstructionsTitle", @"HUSceneActionEditorMediaInstructionsTitle", 1);
  [v17 setHeaderTitle:v18];

  int v19 = [(HFItemManager *)self home];
  int v20 = objc_msgSend(v19, "hf_currentUserIsAdministrator");

  if (v20)
  {
    uint64_t v21 = _HULocalizedStringWithDefaultValue(@"HUSceneActionEditorMediaInstructionsDescription", @"HUSceneActionEditorMediaInstructionsDescription", 1);
    [v17 setHeaderSecondaryText:v21];
  }
  uint64_t v22 = [(HUSceneActionEditorItemManager *)self mediaItem];
  BOOL v39 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  [v17 setItems:v23];

  [v4 addObject:v17];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSceneActionEditorSettingsSectionIdentifier"];
  v25 = [(HUSceneActionEditorItemManager *)self testSceneItem];
  v38[0] = v25;
  v26 = [(HUSceneActionEditorItemManager *)self changeServicesItem];
  v38[1] = v26;
  id v27 = [(HUSceneActionEditorItemManager *)self showInHomeDashboardItem];
  v38[2] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  [v24 setItems:v28];

  v29 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsShowInHomeDashboardFooterTitle", @"HUServiceDetailsShowInHomeDashboardFooterTitle", 1);
  [v24 setFooterTitle:v29];

  [v4 addObject:v24];
  if (![(HUSceneActionEditorItemManager *)self mode]
    || [(HUSceneActionEditorItemManager *)self mode] == 3)
  {
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUSceneActionEditorDeleteSectionIdentifier"];
    v31 = [(HUSceneActionEditorItemManager *)self deleteSceneItem];
    v37 = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    [v30 setItems:v32];

    [v4 addObject:v30];
  }
  v33 = [MEMORY[0x1E4F69220] filterSections:v4 toDisplayedItems:v35];

  return v33;
}

uint64_t __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) prioritizedAccessories];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
    v16[3] = &unk_1E63871B0;
    id v17 = v6;
    int v8 = objc_msgSend(v7, "na_any:", v16);
    uint64_t v9 = v17;
  }
  else
  {
    objc_opt_class();
    id v7 = v4;
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    if (!v11)
    {
      id v7 = 0;
      uint64_t v12 = 1;
      goto LABEL_12;
    }
    uint64_t v9 = [*(id *)(a1 + 32) prioritizedAccessories];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
    v14[3] = &unk_1E63871B0;
    id v15 = v11;
    int v8 = objc_msgSend(v9, "na_any:", v14);
  }
  uint64_t v12 = v8 ^ 1u;

LABEL_12:
  return v12;
}

uint64_t __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_containedCharacteristics");
  id v4 = [*(id *)(a1 + 32) characteristic];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

uint64_t __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 mediaProfiles];
  uint64_t v5 = objc_msgSend(v4, "na_flatMap:", &__block_literal_global_83);

  id v6 = objc_msgSend(v3, "hf_containedProfiles");

  uint64_t v7 = [v6 intersectsSet:v5];
  return v7;
}

uint64_t __67__HUSceneActionEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 mediaProfiles];
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUSceneActionEditorItemManager;
  uint64_t v5 = [(HFItemManager *)&v13 _itemsToHideInSet:v4];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(HUSceneActionEditorItemManager *)self actionSetBuilder];
  int v8 = [v7 actions];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    uint64_t v10 = [(HUSceneActionEditorItemManager *)self itemsToHideWhenEmpty];
    id v11 = (void *)[v10 mutableCopy];

    [v11 intersectSet:v4];
    [v6 unionSet:v11];
  }

  return v6;
}

- (id)_buildSectionForActionGridEditorType:(unint64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F692E8]);
  id v6 = [(id)objc_opt_class() sectionIdentifierForActionGridEditorType:a3];
  uint64_t v7 = (void *)[v5 initWithIdentifier:v6];

  switch(a3)
  {
    case 2uLL:
      int v8 = @"HUSceneActionEditorAccessoriesInstructionsTitleOtherServices";
      goto LABEL_7;
    case 1uLL:
      int v8 = @"HUSceneActionEditorAccessoriesInstructionsTitleThisService";
      goto LABEL_7;
    case 0uLL:
      int v8 = @"HUSceneActionEditorAccessoriesInstructionsTitleAllServices";
LABEL_7:
      uint64_t v9 = _HULocalizedStringWithDefaultValue(v8, v8, 1);
      goto LABEL_9;
  }
  uint64_t v9 = 0;
LABEL_9:
  [v7 setHeaderTitle:v9];
  uint64_t v10 = [(HUSceneActionEditorItemManager *)self actionGridItemsByEditorType];
  id v11 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];
  v15[0] = v12;
  objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v7 setItems:v13];

  return v7;
}

- (void)_createItemsForActionGridEditorType:(unint64_t)a3 home:(id)a4
{
  id v6 = objc_alloc(MEMORY[0x1E4F695C0]);
  id v9 = (id)[v6 initWithResults:MEMORY[0x1E4F1CC08]];
  uint64_t v7 = [(HUSceneActionEditorItemManager *)self actionGridItemsByEditorType];
  int v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v9 forKeyedSubscript:v8];
}

- (HFActionSetBuilder)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (void)setActionSetBuilder:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSSet)prioritizedAccessories
{
  return self->_prioritizedAccessories;
}

- (void)setPrioritizedAccessories:(id)a3
{
}

- (HFStaticItem)nameAndIconItem
{
  return self->_nameAndIconItem;
}

- (void)setNameAndIconItem:(id)a3
{
}

- (NSSet)instructionsItems
{
  return self->_instructionsItems;
}

- (HFStaticItem)mediaInstructionsItem
{
  return self->_mediaInstructionsItem;
}

- (HFStaticItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (HFStaticItem)changeServicesItem
{
  return self->_changeServicesItem;
}

- (void)setChangeServicesItem:(id)a3
{
}

- (HFStaticItem)testSceneItem
{
  return self->_testSceneItem;
}

- (void)setTestSceneItem:(id)a3
{
}

- (HFItem)showInHomeDashboardItem
{
  return self->_showInHomeDashboardItem;
}

- (void)setShowInHomeDashboardItem:(id)a3
{
}

- (HFStaticItem)deleteSceneItem
{
  return self->_deleteSceneItem;
}

- (void)setDeleteSceneItem:(id)a3
{
}

- (NSMutableDictionary)actionGridItemsByEditorType
{
  return self->_actionGridItemsByEditorType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGridItemsByEditorType, 0);
  objc_storeStrong((id *)&self->_deleteSceneItem, 0);
  objc_storeStrong((id *)&self->_showInHomeDashboardItem, 0);
  objc_storeStrong((id *)&self->_testSceneItem, 0);
  objc_storeStrong((id *)&self->_changeServicesItem, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_mediaInstructionsItem, 0);
  objc_storeStrong((id *)&self->_instructionsItems, 0);
  objc_storeStrong((id *)&self->_nameAndIconItem, 0);
  objc_storeStrong((id *)&self->_prioritizedAccessories, 0);

  objc_storeStrong((id *)&self->_actionSetBuilder, 0);
}

@end