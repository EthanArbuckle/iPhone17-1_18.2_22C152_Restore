@interface HUAccessorySceneListContentItemManager
+ (BOOL)_action:(id)a3 involvesServiceLikeItem:(id)a4;
+ (id)computeNumberOfItemsToDisplayForContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5;
+ (id)createItemProviderForContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5 persistAddedSuggestions:(BOOL)a6;
- (BOOL)persistAddedSuggestions;
- (HFServiceLikeItem)serviceLikeItem;
- (HUAccessorySceneListContentItemManager)initWithDelegate:(id)a3 contentSource:(unint64_t)a4 serviceLikeItem:(id)a5;
- (HUAccessorySceneListContentItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 shouldGroupByRoom:(BOOL)a5 shouldShowSectionHeaders:(BOOL)a6 itemProvidersCreator:(id)a7;
- (NSMutableDictionary)committedActionBuildersByActionSetID;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4;
- (id)actionSetBuilderForItem:(id)a3;
- (id)commitSelectionChangesWithSelectedItems:(id)a3;
- (id)suggestionItemProvider;
- (unint64_t)contentSource;
- (void)setPersistAddedSuggestions:(BOOL)a3;
@end

@implementation HUAccessorySceneListContentItemManager

- (HUAccessorySceneListContentItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 shouldGroupByRoom:(BOOL)a5 shouldShowSectionHeaders:(BOOL)a6 itemProvidersCreator:(id)a7
{
  v9 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6, a7);
  v10 = NSStringFromSelector(sel_initWithDelegate_contentSource_serviceLikeItem_);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAccessorySceneListContentItemManager.m", 23, @"%s is unavailable; use %@ instead",
    "-[HUAccessorySceneListContentItemManager initWithDelegate:sourceItem:shouldGroupByRoom:shouldShowSectionHeaders:item"
    "ProvidersCreator:]",
    v10);

  return 0;
}

- (HUAccessorySceneListContentItemManager)initWithDelegate:(id)a3 contentSource:(unint64_t)a4 serviceLikeItem:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HUAccessorySceneListContentItemManager;
  v10 = [(HUServiceGridItemManager *)&v15 initWithDelegate:a3 sourceItem:0 shouldGroupByRoom:0 shouldShowSectionHeaders:0 itemProvidersCreator:&__block_literal_global_231];
  v11 = v10;
  if (v10)
  {
    v10->_contentSource = a4;
    objc_storeStrong((id *)&v10->_serviceLikeItem, a5);
    uint64_t v12 = objc_opt_new();
    committedActionBuildersByActionSetID = v11->_committedActionBuildersByActionSetID;
    v11->_committedActionBuildersByActionSetID = (NSMutableDictionary *)v12;
  }
  return v11;
}

uint64_t __89__HUAccessorySceneListContentItemManager_initWithDelegate_contentSource_serviceLikeItem___block_invoke()
{
  return MEMORY[0x1E4F1CBF0];
}

+ (id)createItemProviderForContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5 persistAddedSuggestions:(BOOL)a6
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (a3 == 1)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F6A2E0]);
    v18[0] = v10;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v6 = (void *)[v12 initWithHome:v11 andServiceLikeItems:v13];

    objc_msgSend(v6, "setEngineOptions:", objc_msgSend(v6, "engineOptions") & 0xFFFFFFFFFFFFFFEFLL);
  }
  else if (!a3)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F68EC0]) initWithHome:v11 actionSetItemStyle:0];
    [v6 setServiceLikeItem:v10];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __122__HUAccessorySceneListContentItemManager_createItemProviderForContentSource_serviceLikeItem_home_persistAddedSuggestions___block_invoke;
    v15[3] = &unk_1E638FD40;
    id v17 = a1;
    id v16 = v10;
    [v6 setFilter:v15];
  }

  return v6;
}

uint64_t __122__HUAccessorySceneListContentItemManager_createItemProviderForContentSource_serviceLikeItem_home_persistAddedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 actions];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __122__HUAccessorySceneListContentItemManager_createItemProviderForContentSource_serviceLikeItem_home_persistAddedSuggestions___block_invoke_2;
  v12[3] = &unk_1E638FD18;
  long long v11 = *(_OWORD *)(a1 + 32);
  id v8 = (id)v11;
  long long v13 = v11;
  uint64_t v9 = objc_msgSend(v7, "na_any:", v12);

  return v9;
}

uint64_t __122__HUAccessorySceneListContentItemManager_createItemProviderForContentSource_serviceLikeItem_home_persistAddedSuggestions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _action:a2 involvesServiceLikeItem:*(void *)(a1 + 32)];
}

+ (id)computeNumberOfItemsToDisplayForContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__30;
  v19 = __Block_byref_object_dispose__30;
  id v20 = [a1 createItemProviderForContentSource:a3 serviceLikeItem:v8 home:v9 persistAddedSuggestions:0];
  id v10 = [(id)v16[5] reloadItems];
  long long v11 = [v10 flatMap:&__block_literal_global_22_1];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__HUAccessorySceneListContentItemManager_computeNumberOfItemsToDisplayForContentSource_serviceLikeItem_home___block_invoke_3;
  v14[3] = &unk_1E638FDC8;
  v14[4] = &v15;
  id v12 = [v11 flatMap:v14];

  _Block_object_dispose(&v15, 8);

  return v12;
}

id __109__HUAccessorySceneListContentItemManager_computeNumberOfItemsToDisplayForContentSource_serviceLikeItem_home___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [a2 allItems];
  id v4 = [v3 allObjects];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_26_1);
  id v6 = [v2 combineAllFutures:v5];

  return v6;
}

uint64_t __109__HUAccessorySceneListContentItemManager_computeNumberOfItemsToDisplayForContentSource_serviceLikeItem_home___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateWithOptions:MEMORY[0x1E4F1CC08]];
}

id __109__HUAccessorySceneListContentItemManager_computeNumberOfItemsToDisplayForContentSource_serviceLikeItem_home___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a2, "na_filter:", &__block_literal_global_29_2);
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 count];
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v13 = 134218242;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Computed number of items to display: %lu with item provider: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  id v9 = (void *)MEMORY[0x1E4F7A0D8];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  long long v11 = [v9 futureWithResult:v10];

  return v11;
}

uint64_t __109__HUAccessorySceneListContentItemManager_computeNumberOfItemsToDisplayForContentSource_serviceLikeItem_home___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  id v3 = v2;
  if (v2 == (id)MEMORY[0x1E4F1CC38])
  {
    uint64_t v4 = 0;
  }
  else if (v2)
  {
    uint64_t v4 = [v2 isEqual:MEMORY[0x1E4F1CC38]] ^ 1;
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

- (id)actionSetBuilderForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F68EB0]);
    id v9 = [v7 actionSet];
    id v10 = [(HFItemManager *)self home];
    long long v11 = (void *)[v8 initWithExistingObject:v9 inHome:v10];
  }
  else
  {
    id v12 = [v5 latestResults];
    uint64_t v13 = *MEMORY[0x1E4F688A8];
    uint64_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F688A8]];

    if (v14)
    {
      __int16 v15 = [v5 latestResults];
      long long v11 = [v15 objectForKeyedSubscript:v13];
    }
    else
    {
      NSLog(&cfstr_UnexpectedItem_2.isa, v5);
      long long v11 = 0;
    }
  }

  return v11;
}

- (void)setPersistAddedSuggestions:(BOOL)a3
{
  self->_persistAddedSuggestions = a3;
}

- (id)commitSelectionChangesWithSelectedItems:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v6 = [(HFItemManager *)self allDisplayedItems];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke;
  __int16 v15 = &unk_1E638FE18;
  uint64_t v16 = self;
  id v17 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_map:", &v12);
  id v9 = objc_msgSend(v8, "allObjects", v12, v13, v14, v15, v16);
  id v10 = [v5 combineAllFutures:v9];

  return v10;
}

id __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) actionSetBuilderForItem:v3];
  if (!v4)
  {
    long long v11 = 0;
    goto LABEL_10;
  }
  id v5 = [*(id *)(a1 + 32) committedActionBuildersByActionSetID];
  uint64_t v6 = [v4 actionSet];
  id v7 = [v6 uniqueIdentifier];
  id v8 = objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v7, &__block_literal_global_39_3);

  if ([*(id *)(a1 + 40) containsObject:v3])
  {
    id v9 = [v4 actions];
    id v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_43);
    [v8 addObjectsFromArray:v10];
  }
  else
  {
    if (![v8 count])
    {
      long long v11 = 0;
      goto LABEL_9;
    }
    uint64_t v12 = [v4 actions];
    uint64_t v13 = (void *)[v12 copy];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_4;
    v18 = &unk_1E638FDF0;
    id v19 = v8;
    id v20 = v4;
    objc_msgSend(v13, "na_each:", &v15);
  }
  long long v11 = objc_msgSend(v4, "commitItem", v15, v16, v17, v18);
LABEL_9:

LABEL_10:

  return v11;
}

uint64_t __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_2()
{
  return [MEMORY[0x1E4F1CA80] set];
}

BOOL __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 action];
  BOOL v3 = v2 == 0;

  return v3;
}

void __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_5;
  v6[3] = &unk_1E6387188;
  id v5 = v3;
  id v7 = v5;
  if (objc_msgSend(v4, "na_any:", v6)) {
    [*(id *)(a1 + 40) removeAction:v5];
  }
}

uint64_t __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 createNewAction];
  uint64_t v5 = [v3 hasSameTargetAsAction:v4];

  return v5;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(HUAccessorySceneListContentItemManager *)self contentSource];
  uint64_t v6 = [(HUAccessorySceneListContentItemManager *)self serviceLikeItem];
  id v7 = +[HUAccessorySceneListContentItemManager createItemProviderForContentSource:v5 serviceLikeItem:v6 home:v4 persistAddedSuggestions:[(HUAccessorySceneListContentItemManager *)self persistAddedSuggestions]];

  v10[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (void *)[v7 mutableCopy];

    [v8 setObject:&unk_1F19B4D60 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HUAccessorySceneListContentItemManager;
    id v8 = [(HFItemManager *)&v10 _transformedUpdateOutcomeForItem:v6 proposedOutcome:v7];
  }

  return v8;
}

- (id)suggestionItemProvider
{
  id v2 = [(HFItemManager *)self itemProviders];
  id v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_52_0);

  return v3;
}

uint64_t __64__HUAccessorySceneListContentItemManager_suggestionItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)_action:(id)a3 involvesServiceLikeItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(v5, "hf_affectedCharacteristic");
  if (!v7) {
    goto LABEL_4;
  }
  id v8 = (void *)v7;
  id v9 = [v6 services];
  objc_super v10 = objc_msgSend(v5, "hf_affectedCharacteristic");
  long long v11 = [v10 service];
  char v12 = [v9 containsObject:v11];

  if (v12)
  {
    char v13 = 1;
  }
  else
  {
LABEL_4:
    id v14 = v6;
    if ([v14 conformsToProtocol:&unk_1F1A3D858]) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    id v17 = objc_msgSend(v5, "hf_affectedAccessoryProfiles");
    if (v17)
    {
      v18 = [v16 profiles];
      id v19 = objc_msgSend(v5, "hf_affectedAccessoryProfiles");
      char v13 = [v18 intersectsSet:v19];
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

- (unint64_t)contentSource
{
  return self->_contentSource;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (BOOL)persistAddedSuggestions
{
  return self->_persistAddedSuggestions;
}

- (NSMutableDictionary)committedActionBuildersByActionSetID
{
  return self->_committedActionBuildersByActionSetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_committedActionBuildersByActionSetID, 0);

  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
}

@end