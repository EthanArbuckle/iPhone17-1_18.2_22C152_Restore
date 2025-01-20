@interface HUAvailableRelatedTriggerItemModule
+ (BOOL)_itemClassSupportsEvents:(id)a3;
+ (BOOL)shouldShowRecommendation:(id)a3;
+ (id)defaultContext;
+ (id)sortComparator;
- (BOOL)_editingAvailableWithDisplayedItems:(id)a3;
- (BOOL)addAutomationItemShouldBeHidden;
- (BOOL)automationItemIsLoading;
- (BOOL)enableNaturalLighting;
- (BOOL)relatedItemsCanBeAutomated;
- (BOOL)shouldHideAutomationsModule;
- (HFItemSectionAccessoryButtonHeaderDelegate)editButtonHeaderDelegate;
- (HFStaticItem)addAutomationItem;
- (HFStaticItem)naturalLightingItem;
- (HFStaticItemProvider)staticItemProvider;
- (HMHome)home;
- (HUAvailableRelatedTriggerItemModule)initWithItems:(id)a3 itemUpdater:(id)a4 home:(id)a5 context:(id)a6;
- (HUAvailableRelatedTriggerItemModuleContextProviding)context;
- (HUAvailableRelatedTriggerItemProvider)availableTriggerItemProvider;
- (HUAvailableTriggerItemActivationRequest)activeRequest;
- (NSArray)actionBuilderFactories;
- (NSArray)eventOptionsItems;
- (NSArray)relatedItems;
- (NSArray)sensorCharacteristics;
- (NSMutableArray)previouslySortedItems;
- (NSMutableArray)waitingRequests;
- (NSString)sectionHeaderEditButtonTitleKey;
- (id)_accessoryCategoryUserFrieindlyDescription;
- (id)_activateItem:(id)a3 active:(BOOL)a4;
- (id)_buildItemProviders;
- (id)activateAllSelectedItems;
- (id)activateItem:(id)a3 active:(BOOL)a4;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (id)itemsToHideInSet:(id)a3;
- (id)progressivelySortItems:(id)a3;
- (id)serviceTypes;
- (id)serviceTypesSupportingAutomation;
- (void)_finishCommitWithItems:(id)a3 updatesDelayReason:(id)a4;
- (void)_performRequest:(id)a3;
- (void)_updateRelatedItems:(id)a3;
- (void)didActivateItem:(id)a3 active:(BOOL)a4 error:(id)a5;
- (void)setActionBuilderFactories:(id)a3;
- (void)setActiveRequest:(id)a3;
- (void)setAddAutomationItem:(id)a3;
- (void)setAutomationItemIsLoading:(BOOL)a3;
- (void)setAvailableTriggerItemProvider:(id)a3;
- (void)setEditButtonHeaderDelegate:(id)a3;
- (void)setEnableNaturalLighting:(BOOL)a3;
- (void)setEventOptionsItems:(id)a3;
- (void)setHome:(id)a3;
- (void)setNaturalLightingItem:(id)a3;
- (void)setPreviouslySortedItems:(id)a3;
- (void)setRelatedItems:(id)a3;
- (void)setSectionHeaderEditButtonTitleKey:(id)a3;
- (void)setSensorCharacteristics:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setWaitingRequests:(id)a3;
@end

@implementation HUAvailableRelatedTriggerItemModule

- (HUAvailableRelatedTriggerItemModule)initWithItems:(id)a3 itemUpdater:(id)a4 home:(id)a5 context:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HUAvailableRelatedTriggerItemModule;
  v13 = [(HFItemModule *)&v24 initWithItemUpdater:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a5);
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    waitingRequests = v14->_waitingRequests;
    v14->_waitingRequests = (NSMutableArray *)v15;

    objc_opt_class();
    id v17 = v12;
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v19 = v18;

    if (v19)
    {
      v20 = (HUAvailableRelatedTriggerItemModuleContext *)v17;
    }
    else
    {
      v20 = [[HUAvailableRelatedTriggerItemModuleContext alloc] initWithContext:v17];
    }
    [(HUAvailableRelatedTriggerItemModuleContext *)v20 setEngineOptions:[(HUAvailableRelatedTriggerItemModuleContext *)v20 engineOptions] & 0xFFFFFFFFFFFFFFF8];
    [(HUAvailableRelatedTriggerItemModuleContext *)v20 setEngineOptions:[(HUAvailableRelatedTriggerItemModuleContext *)v20 engineOptions] | 2];
    context = v14->_context;
    v14->_context = (HUAvailableRelatedTriggerItemModuleContextProviding *)v20;

    v14->_enableNaturalLighting = 1;
    [(HUAvailableRelatedTriggerItemModule *)v14 _updateRelatedItems:v10];
    v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v10;
      _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "HUAvailableRelatedTriggerItemModule configured with items: %@", buf, 0xCu);
    }
  }
  return v14;
}

+ (id)defaultContext
{
  v2 = objc_alloc_init(HUAvailableRelatedTriggerItemModuleContext);
  [(HUAvailableRelatedTriggerItemModuleContext *)v2 setEngineOptions:82];

  return v2;
}

- (id)activateItem:(id)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [[HUAvailableTriggerItemActivationRequest alloc] initWithItem:v6 active:v4];

  v8 = [(HUAvailableRelatedTriggerItemModule *)self activeRequest];

  if (v8)
  {
    v9 = [(HUAvailableRelatedTriggerItemModule *)self waitingRequests];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__HUAvailableRelatedTriggerItemModule_activateItem_active___block_invoke;
    v17[3] = &unk_1E63887A8;
    v7 = v7;
    v18 = v7;
    id v10 = objc_msgSend(v9, "na_filter:", v17);

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__HUAvailableRelatedTriggerItemModule_activateItem_active___block_invoke_2;
    v16[3] = &unk_1E63887D0;
    v16[4] = self;
    objc_msgSend(v10, "na_each:", v16);
    id v11 = [(HUAvailableRelatedTriggerItemModule *)self activeRequest];
    BOOL v12 = [(HUAvailableTriggerItemActivationRequest *)v7 isSameAsRequest:v11];

    if (v12)
    {
      [(HUAvailableRelatedTriggerItemModule *)self activeRequest];
      v13 = v7;
      v7 = (HUAvailableTriggerItemActivationRequest *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = [(HUAvailableRelatedTriggerItemModule *)self waitingRequests];
      [v13 addObject:v7];
    }
  }
  else
  {
    [(HUAvailableRelatedTriggerItemModule *)self _performRequest:v7];
  }
  v14 = [(HUAvailableTriggerItemActivationRequest *)v7 completionFuture];

  return v14;
}

uint64_t __59__HUAvailableRelatedTriggerItemModule_activateItem_active___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 item];
  BOOL v4 = [*(id *)(a1 + 32) item];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __59__HUAvailableRelatedTriggerItemModule_activateItem_active___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 completionFuture];
  [v4 cancel];

  id v5 = [*(id *)(a1 + 32) waitingRequests];
  [v5 removeObject:v3];
}

- (id)activateAllSelectedItems
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HUAvailableRelatedTriggerItemModule *)self availableTriggerItemProvider];
  [v3 disableUpdatesWithReason:@"CommittingAllActive"];

  BOOL v4 = [(HFItemModule *)self allItems];
  id v5 = [v4 allObjects];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_63);

  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_2;
  v55[3] = &unk_1E63887F8;
  v55[4] = self;
  v7 = objc_msgSend(v6, "na_map:", v55);
  v8 = [MEMORY[0x1E4F7A0D8] chainFutures:v7];
  v9 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  uint64_t v10 = [(HUAvailableRelatedTriggerItemModule *)self naturalLightingItem];
  unint64_t v11 = 0x1E4F1C000;
  if (v10)
  {
    BOOL v12 = (void *)v10;
    v48 = v7;
    v13 = [(HUAvailableRelatedTriggerItemModule *)self naturalLightingItem];
    v14 = [v13 latestResults];
    uint64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
    char v16 = [v15 BOOLValue];

    if (v16)
    {
      v7 = v48;
      unint64_t v11 = 0x1E4F1C000;
    }
    else
    {
      id v17 = [(HUAvailableRelatedTriggerItemModule *)self naturalLightingItem];
      v18 = [v17 latestResults];
      v47 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];

      BOOL v19 = [v47 integerValue] == 2;
      v20 = (void *)MEMORY[0x1E4F1CAD0];
      v21 = [(HUAvailableRelatedTriggerItemModule *)self home];
      v22 = objc_msgSend(v21, "hf_allLightProfilesSupportingNaturalLighting");
      v23 = [v20 setWithArray:v22];

      objc_super v24 = (void *)MEMORY[0x1E4F1CAD0];
      v25 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
      id v26 = [v24 setWithArray:v25];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_5;
      v53[3] = &unk_1E6388848;
      id v54 = v23;
      id v46 = v23;
      v45 = objc_msgSend(v26, "na_flatMap:", v53);

      uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
      v28 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
      v29 = [v27 setWithArray:v28];
      v30 = objc_msgSend(v29, "na_flatMap:", &__block_literal_global_30_0);

      v31 = [v45 allObjects];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_9;
      v51[3] = &__block_descriptor_33_e24__16__0__HMLightProfile_8l;
      BOOL v52 = v19;
      v32 = objc_msgSend(v31, "na_map:", v51);

      v33 = [v30 allObjects];
      v34 = objc_msgSend(v33, "na_map:", &__block_literal_global_38_1);

      v35 = (void *)MEMORY[0x1E4F7A0D8];
      v57[0] = v32;
      v57[1] = v34;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
      v37 = objc_msgSend(v36, "na_arrayByFlattening");
      uint64_t v38 = [v35 combineAllFutures:v37];

      unint64_t v11 = 0x1E4F1C000uLL;
      v9 = (void *)v38;
      v7 = v48;
    }
  }
  v39 = (void *)MEMORY[0x1E4F7A0D8];
  v56[0] = v8;
  v56[1] = v9;
  v40 = [*(id *)(v11 + 2424) arrayWithObjects:v56 count:2];
  v41 = [v39 combineAllFutures:v40];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_13;
  v49[3] = &unk_1E6384CE0;
  v49[4] = self;
  id v50 = v6;
  id v42 = v6;
  v43 = [v41 addCompletionBlock:v49];

  return v43;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    if ([v5 isActive]) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_3;
  v8[3] = &unk_1E6385D90;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 lazyFutureWithBlock:v8];

  return v6;
}

void __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) _activateItem:*(void *)(a1 + 40) active:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_4;
  v7[3] = &unk_1E63850B8;
  id v8 = v3;
  id v5 = v3;
  id v6 = (id)[v4 addCompletionBlock:v7];
}

uint64_t __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 services];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_6;
  v6[3] = &unk_1E6388820;
  id v7 = *(id *)(a1 + 32);
  BOOL v4 = objc_msgSend(v3, "na_flatMap:", v6);

  return v4;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 accessory];
  BOOL v4 = [v3 lightProfiles];
  id v5 = objc_msgSend(v4, "na_setByIntersectingWithSet:", *(void *)(a1 + 32));

  return v5;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = [a2 services];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_33);

  return v3;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_supportsNaturalLighting"))
  {
    id v3 = [v2 accessory];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_10;
  v8[3] = &unk_1E63888B0;
  id v9 = v3;
  char v10 = *(unsigned char *)(a1 + 32);
  id v5 = v3;
  id v6 = [v4 futureWithErrorOnlyHandlerAdapterBlock:v8];

  return v6;
}

uint64_t __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setNaturalLightingEnabled:*(unsigned __int8 *)(a1 + 40) shouldRetryOnFailure:1 completion:a2];
}

id __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_12;
  v7[3] = &unk_1E6385090;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 futureWithErrorOnlyHandlerAdapterBlock:v7];

  return v5;
}

uint64_t __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_12(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setHasOnboardedForNaturalLightingWithCompletion:a2];
}

uint64_t __63__HUAvailableRelatedTriggerItemModule_activateAllSelectedItems__block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishCommitWithItems:*(void *)(a1 + 40) updatesDelayReason:@"CommittingAllActive"];
}

- (void)_finishCommitWithItems:(id)a3 updatesDelayReason:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [(HUAvailableRelatedTriggerItemModule *)self availableTriggerItemProvider];
  [v7 endDisableUpdatesWithReason:v6];

  objc_msgSend(v8, "na_each:", &__block_literal_global_42_0);
}

uint64_t __81__HUAvailableRelatedTriggerItemModule__finishCommitWithItems_updatesDelayReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resetActiveToDefault];
}

- (id)itemsToHideInSet:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvailableRelatedTriggerItemModule *)self availableTriggerItemProvider];
  id v6 = [v5 itemsToHideInSet:v4];

  return v6;
}

- (void)setRelatedItems:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_relatedItems != v5)
  {
    id v9 = v5;
    objc_storeStrong((id *)&self->_relatedItems, a3);
    sensorCharacteristics = self->_sensorCharacteristics;
    self->_sensorCharacteristics = 0;

    actionBuilderFactories = self->_actionBuilderFactories;
    self->_actionBuilderFactories = 0;

    eventOptionsItems = self->_eventOptionsItems;
    self->_eventOptionsItems = 0;

    id v5 = v9;
  }
}

- (void)setAutomationItemIsLoading:(BOOL)a3
{
  if (self->_automationItemIsLoading != a3)
  {
    self->_automationItemIsLoading = a3;
    id v5 = (void *)MEMORY[0x1E4F69230];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = [(HUAvailableRelatedTriggerItemModule *)self addAutomationItem];
    id v8 = objc_msgSend(v6, "na_setWithSafeObject:", v7);
    id v11 = [v5 requestToUpdateItems:v8 senderSelector:a2];

    id v9 = [(HFItemModule *)self itemUpdater];
    id v10 = (id)[v9 performItemUpdateRequest:v11];
  }
}

- (NSArray)sensorCharacteristics
{
  sensorCharacteristics = self->_sensorCharacteristics;
  if (!sensorCharacteristics)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
    id v5 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke;
    v10[3] = &unk_1E6388940;
    id v11 = v4;
    id v6 = v4;
    objc_msgSend(v5, "na_flatMap:", v10);
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_sensorCharacteristics;
    self->_sensorCharacteristics = v7;

    sensorCharacteristics = self->_sensorCharacteristics;
  }

  return sensorCharacteristics;
}

id __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 services];
  id v4 = [v3 allObjects];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke_2;
  v7[3] = &unk_1E6388918;
  id v8 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(v4, "na_flatMap:", v7);

  return v5;
}

id __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke_3;
  v6[3] = &unk_1E6387020;
  id v7 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_filter:", v6);

  return v4;
}

uint64_t __60__HUAvailableRelatedTriggerItemModule_sensorCharacteristics__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (NSArray)eventOptionsItems
{
  eventOptionsItems = self->_eventOptionsItems;
  if (!eventOptionsItems)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
    id v5 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__HUAvailableRelatedTriggerItemModule_eventOptionsItems__block_invoke;
    v10[3] = &unk_1E6388968;
    void v10[4] = self;
    id v11 = v4;
    id v6 = v4;
    objc_msgSend(v5, "na_filter:", v10);
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_eventOptionsItems;
    self->_eventOptionsItems = v7;

    eventOptionsItems = self->_eventOptionsItems;
  }

  return eventOptionsItems;
}

uint64_t __56__HUAvailableRelatedTriggerItemModule_eventOptionsItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [(id)objc_opt_class() _itemClassSupportsEvents:v3];
  id v10 = 0;
  BOOL v5 = +[HUCharacteristicEventOptionProvider hasOptionsForServiceVendingItem:v3 outCharacteristicType:&v10];

  id v6 = v10;
  unsigned int v7 = v4 & ([*(id *)(a1 + 40) containsObject:v6] ^ 1);
  if (v5) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (NSArray)actionBuilderFactories
{
  actionBuilderFactories = self->_actionBuilderFactories;
  if (!actionBuilderFactories)
  {
    int v4 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
    objc_msgSend(v4, "na_map:", &__block_literal_global_52);
    BOOL v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_actionBuilderFactories;
    self->_actionBuilderFactories = v5;

    actionBuilderFactories = self->_actionBuilderFactories;
  }

  return actionBuilderFactories;
}

id __61__HUAvailableRelatedTriggerItemModule_actionBuilderFactories__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F1A3D9B0]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  if ([v4 containsActions]) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)serviceTypesSupportingAutomation
{
  id v2 = [(HUAvailableRelatedTriggerItemModule *)self serviceTypes];
  id v3 = objc_msgSend(MEMORY[0x1E4F2EA88], "hf_serviceTypesHiddenFromScenesOrAutomations");
  id v4 = objc_msgSend(v2, "na_setByRemovingObjectsFromSet:", v3);

  return v4;
}

- (id)serviceTypes
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
  id v4 = [v2 setWithArray:v3];
  BOOL v5 = objc_msgSend(v4, "na_flatMap:", &__block_literal_global_102);

  return v5;
}

id __51__HUAvailableRelatedTriggerItemModule_serviceTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 services];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_105_0);

  return v3;
}

uint64_t __51__HUAvailableRelatedTriggerItemModule_serviceTypes__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serviceType];
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    id v4 = [(HUAvailableRelatedTriggerItemModule *)self _buildItemProviders];
    BOOL v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }

  return itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"includedInAutomations"];
  id v6 = _HULocalizedStringWithDefaultValue(@"HUAccessorySceneListTriggersHeaderTitle", @"HUAccessorySceneListTriggersHeaderTitle", 1);
  [v5 setHeaderTitle:v6];

  if ([(HUAvailableRelatedTriggerItemModule *)self _editingAvailableWithDisplayedItems:v4])
  {
    uint64_t v7 = [(HUAvailableRelatedTriggerItemModule *)self editButtonHeaderDelegate];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = [(HUAvailableRelatedTriggerItemModule *)self sectionHeaderEditButtonTitleKey];

      if (v9)
      {
        id v10 = [(HUAvailableRelatedTriggerItemModule *)self editButtonHeaderDelegate];
        [v5 setHeaderAccessoryButtonDelegate:v10];

        id v11 = [(HUAvailableRelatedTriggerItemModule *)self sectionHeaderEditButtonTitleKey];
        BOOL v12 = _HULocalizedStringWithDefaultValue(v11, v11, 1);
        [v5 setHeaderAccessoryButtonTitle:v12];
      }
    }
  }
  v13 = [(HUAvailableRelatedTriggerItemModule *)self availableTriggerItemProvider];
  v14 = [v13 items];
  uint64_t v15 = objc_msgSend(v14, "na_setByIntersectingWithSet:", v4);
  char v16 = [v15 allObjects];

  id v17 = [(HUAvailableRelatedTriggerItemModule *)self previouslySortedItems];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    BOOL v19 = [(HUAvailableRelatedTriggerItemModule *)self progressivelySortItems:v16];
  }
  else
  {
    v20 = [(id)objc_opt_class() sortComparator];
    BOOL v19 = [v16 sortedArrayUsingComparator:v20];

    char v16 = (void *)[v19 mutableCopy];
    [(HUAvailableRelatedTriggerItemModule *)self setPreviouslySortedItems:v16];
  }

  v21 = (void *)MEMORY[0x1E4F1CBF0];
  if (v19) {
    v21 = v19;
  }
  id v22 = v21;

  v23 = [MEMORY[0x1E4F1CA48] array];
  objc_super v24 = [(HUAvailableRelatedTriggerItemModule *)self naturalLightingItem];
  objc_msgSend(v23, "na_safeAddObject:", v24);

  v25 = (void *)MEMORY[0x1E4F1C978];
  id v26 = [(HUAvailableRelatedTriggerItemModule *)self addAutomationItem];
  uint64_t v27 = objc_msgSend(v25, "na_arrayWithSafeObject:", v26);

  v41[0] = v23;
  v41[1] = v22;
  v41[2] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
  v29 = objc_msgSend(v28, "na_arrayByFlattening");
  [v5 setItems:v29];

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  v31 = [v5 items];
  v32 = [v30 setWithArray:v31];
  v33 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v32);

  v34 = [(HUAvailableRelatedTriggerItemModule *)self addAutomationItem];
  if ([v33 containsObject:v34])
  {
    uint64_t v35 = [v33 count];

    if (v35 == 1) {
      [v5 setHeaderTitle:0];
    }
  }
  else
  {
  }
  v36 = (void *)MEMORY[0x1E4F69220];
  v40 = v5;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  uint64_t v38 = [v36 filterSections:v37 toDisplayedItems:v4];

  return v38;
}

- (id)progressivelySortItems:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUAvailableRelatedTriggerItemModule *)self previouslySortedItems];
  id v6 = (void *)MEMORY[0x1E4F28F60];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__HUAvailableRelatedTriggerItemModule_progressivelySortItems___block_invoke;
  v17[3] = &unk_1E63889D0;
  id v18 = v4;
  id v7 = v4;
  uint64_t v8 = [v6 predicateWithBlock:v17];
  [v5 filterUsingPredicate:v8];

  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = [(HUAvailableRelatedTriggerItemModule *)self previouslySortedItems];
  BOOL v12 = [v10 setWithArray:v11];
  v13 = objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v12);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__HUAvailableRelatedTriggerItemModule_progressivelySortItems___block_invoke_2;
  v16[3] = &unk_1E63889F8;
  v16[4] = self;
  objc_msgSend(v13, "na_each:", v16);
  v14 = [(HUAvailableRelatedTriggerItemModule *)self previouslySortedItems];

  return v14;
}

uint64_t __62__HUAvailableRelatedTriggerItemModule_progressivelySortItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void __62__HUAvailableRelatedTriggerItemModule_progressivelySortItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [*(id *)(a1 + 32) previouslySortedItems];
  unint64_t v4 = 0;
  if ([v3 count])
  {
    while (1)
    {
      BOOL v5 = [(id)objc_opt_class() sortComparator];
      id v6 = [*(id *)(a1 + 32) previouslySortedItems];
      id v7 = [v6 objectAtIndexedSubscript:v4];
      uint64_t v8 = ((uint64_t (**)(void, void *, id))v5)[2](v5, v7, v13);

      if (v8 == 1) {
        break;
      }
      ++v4;
      id v3 = [*(id *)(a1 + 32) previouslySortedItems];
      if (v4 >= [v3 count]) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
  }
  id v9 = [*(id *)(a1 + 32) previouslySortedItems];
  unint64_t v10 = [v9 count];

  id v11 = [*(id *)(a1 + 32) previouslySortedItems];
  BOOL v12 = v11;
  if (v4 >= v10) {
    [v11 addObject:v13];
  }
  else {
    [v11 insertObject:v13 atIndex:v4];
  }
}

- (BOOL)relatedItemsCanBeAutomated
{
  id v3 = [(HUAvailableRelatedTriggerItemModule *)self actionBuilderFactories];
  uint64_t v4 = [v3 count];

  BOOL v5 = [(HUAvailableRelatedTriggerItemModule *)self sensorCharacteristics];
  uint64_t v6 = [v5 count];

  id v7 = [(HUAvailableRelatedTriggerItemModule *)self eventOptionsItems];
  uint64_t v8 = [v7 count];

  id v9 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
  unint64_t v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_118);

  id v11 = [(HUAvailableRelatedTriggerItemModule *)self serviceTypesSupportingAutomation];
  uint64_t v12 = [v11 count];

  uint64_t v13 = [v10 count];
  BOOL v14 = (v4 || v6 || v8) && (v12 | v13) != 0;

  return v14;
}

id __65__HUAvailableRelatedTriggerItemModule_relatedItemsCanBeAutomated__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)_editingAvailableWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvailableRelatedTriggerItemModule *)self home];
  int v6 = objc_msgSend(v5, "hf_userIsAllowedToEditTrigger");

  if (v6
    && ([(HUAvailableRelatedTriggerItemModule *)self context],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 itemsAreEditable],
        v7,
        v8))
  {
    id v9 = [(HUAvailableRelatedTriggerItemModule *)self availableTriggerItemProvider];
    unint64_t v10 = [v9 items];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__HUAvailableRelatedTriggerItemModule__editingAvailableWithDisplayedItems___block_invoke;
    v13[3] = &unk_1E6386108;
    id v14 = v4;
    char v11 = objc_msgSend(v10, "na_any:", v13);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

BOOL __75__HUAvailableRelatedTriggerItemModule__editingAvailableWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
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

  if (v6 && [*(id *)(a1 + 32) containsObject:v4])
  {
    id v7 = [v6 recommendationItem];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)shouldHideAutomationsModule
{
  id v2 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_122_0);

  if ([v3 count]) {
    int v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_125_0) ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

id __66__HUAvailableRelatedTriggerItemModule_shouldHideAutomationsModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;

  return v5;
}

uint64_t __66__HUAvailableRelatedTriggerItemModule_shouldHideAutomationsModule__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isHomePodAndIsInMediaSystem] ^ 1;
}

- (void)_performRequest:(id)a3
{
  id v5 = a3;
  id v6 = [(HUAvailableRelatedTriggerItemModule *)self availableTriggerItemProvider];
  [v6 disableUpdatesWithReason:@"PerformingRequests"];

  [(HUAvailableRelatedTriggerItemModule *)self setActiveRequest:v5];
  id v7 = [v5 item];
  BOOL v8 = -[HUAvailableRelatedTriggerItemModule _activateItem:active:](self, "_activateItem:active:", v7, [v5 active]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HUAvailableRelatedTriggerItemModule__performRequest___block_invoke;
  v11[3] = &unk_1E6388A40;
  id v12 = v5;
  uint64_t v13 = self;
  SEL v14 = a2;
  id v9 = v5;
  id v10 = (id)[v8 addCompletionBlock:v11];
}

void __55__HUAvailableRelatedTriggerItemModule__performRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  BOOL v8 = [v5 completionFuture];
  [v8 finishWithResult:v7 error:v6];

  id v9 = [*(id *)(a1 + 40) waitingRequests];
  id v17 = [v9 popFirstObject];

  id v10 = *(void **)(a1 + 40);
  if (v17)
  {
    [v10 _performRequest:v17];
  }
  else
  {
    [v10 setActiveRequest:0];
    char v11 = [*(id *)(a1 + 40) availableTriggerItemProvider];
    [v11 endDisableUpdatesWithReason:@"PerformingRequests"];

    id v12 = (void *)MEMORY[0x1E4F69230];
    uint64_t v13 = [*(id *)(a1 + 40) itemProviders];
    SEL v14 = [v12 requestToReloadItemProviders:v13 senderSelector:*(void *)(a1 + 48)];

    uint64_t v15 = [*(id *)(a1 + 40) itemUpdater];
    id v16 = (id)[v15 performItemUpdateRequest:v14];
  }
}

- (id)_activateItem:(id)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = (__CFString *)a3;
  BOOL v8 = objc_opt_new();
  id v9 = [(HUAvailableRelatedTriggerItemModule *)self home];
  id v10 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
  char v11 = [(__CFString *)v7 buildersForActivating:v4 inHome:v9 withContext:v8 serviceLikeItems:v10];

  uint64_t v12 = [v11 count];
  uint64_t v13 = HFLogForCategory();
  SEL v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = @"deactivating";
      if (v4) {
        uint64_t v15 = @"activating";
      }
      *(_DWORD *)buf = 138412546;
      v39 = v15;
      __int16 v40 = 2112;
      v41 = v7;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "Start %@ item: %@", buf, 0x16u);
    }

    [(__CFString *)v7 setActive:v4];
    id v16 = NSString;
    id v17 = [(__CFString *)v7 identifier];
    id v18 = [v16 stringWithFormat:@"%@:%@", @"Committing", v17];

    BOOL v19 = [(HUAvailableRelatedTriggerItemModule *)self availableTriggerItemProvider];
    [v19 disableUpdatesWithReason:v18];

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke;
    v35[3] = &unk_1E6388AD8;
    BOOL v37 = v4;
    v20 = v7;
    v36 = v20;
    v21 = objc_msgSend(v11, "na_map:", v35);
    id v22 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v21];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_9;
    v30[3] = &unk_1E6388B00;
    BOOL v34 = v4;
    v31 = v20;
    v32 = self;
    id v33 = v18;
    id v23 = v18;
    objc_super v24 = [v22 addCompletionBlock:v30];
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v7;
      _os_log_error_impl(&dword_1BE345000, v14, OS_LOG_TYPE_ERROR, "Attempted to activate item but there were no builders: %@", buf, 0xCu);
    }

    [(__CFString *)v7 resetActiveToDefault];
    v25 = (void *)MEMORY[0x1E4F69230];
    id v26 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    id v23 = [v25 requestToUpdateItems:v26 senderSelector:a2];

    uint64_t v27 = [(HFItemModule *)self itemUpdater];
    id v28 = (id)[v27 performItemUpdateRequest:v23];

    objc_super v24 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v24;
}

id __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
  if (!*(unsigned char *)(a1 + 40))
  {
    id v5 = (void *)MEMORY[0x1E4F7A0D8];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_2;
    v24[3] = &unk_1E6385108;
    id v6 = v3;
    id v25 = v6;
    id v7 = [v5 futureWithBlock:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_3;
    v22[3] = &unk_1E6388A88;
    id v8 = v6;
    id v23 = v8;
    id v9 = [v7 flatMap:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_5;
    v20[3] = &unk_1E6387340;
    id v21 = v8;
    uint64_t v10 = [v9 recover:v20];

    BOOL v4 = (void *)v10;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_7;
  v18[3] = &unk_1E6385648;
  id v19 = v3;
  id v11 = v3;
  uint64_t v12 = [v4 flatMap:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_8;
  v15[3] = &unk_1E6388AB0;
  id v16 = *(id *)(a1 + 32);
  char v17 = *(unsigned char *)(a1 + 40);
  uint64_t v13 = [v12 recover:v15];

  return v13;
}

void __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 validationError];
  id v5 = (id)v4;
  if (v4) {
    [v3 finishWithError:v4];
  }
  else {
    [v3 finishWithNoResult];
  }
}

id __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) triggerActionSets];
  int v3 = [v2 hasActions];

  objc_opt_class();
  id v4 = *(id *)(a1 + 32);
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 characteristicInterface];
    id v8 = [v7 characteristics];
    BOOL v9 = [v8 count] == 0;

    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v9 = 0;
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    goto LABEL_11;
  }
LABEL_10:
  id v11 = [*(id *)(a1 + 32) deleteTrigger];
  uint64_t v10 = [v11 flatMap:&__block_literal_global_140_0];

LABEL_11:

  return v10;
}

uint64_t __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_4()
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
}

id __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) deleteTrigger];
  id v2 = [v1 flatMap:&__block_literal_global_142];

  return v2;
}

uint64_t __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_6()
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
}

id __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_7(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue]) {
    [*(id *)(a1 + 32) commitItem];
  }
  else {
  int v3 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v3;
}

id __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_8(uint64_t a1, void *a2)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1E4F7A0D8];
  v18[0] = *MEMORY[0x1E4F68440];
  uint64_t v16 = *MEMORY[0x1E4F68420];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  char v17 = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  BOOL v9 = (void *)v8;
  v18[1] = *MEMORY[0x1E4F68430];
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v10 = (uint64_t *)MEMORY[0x1E4F68840];
  }
  else {
    uint64_t v10 = (uint64_t *)MEMORY[0x1E4F68838];
  }
  uint64_t v11 = *v10;
  v19[0] = v8;
  v19[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  uint64_t v13 = objc_msgSend(v5, "hf_errorWithAddedUserInfo:", v12);

  SEL v14 = [v3 futureWithError:v13];

  return v14;
}

void __60__HUAvailableRelatedTriggerItemModule__activateItem_active___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      uint64_t v8 = "Failed to commit changes for item with error: %@, item: %@";
LABEL_9:
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0x16u);
    }
  }
  else if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v10 = @"Activated";
    }
    else {
      uint64_t v10 = @"Deactivated";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    uint64_t v8 = "%@ item: %@";
    goto LABEL_9;
  }

  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [v11 _finishCommitWithItems:v12 updatesDelayReason:*(void *)(a1 + 48)];

  [*(id *)(a1 + 40) didActivateItem:*(void *)(a1 + 32) active:*(unsigned __int8 *)(a1 + 56) error:v4];
}

- (void)didActivateItem:(id)a3 active:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v21 = a5;
  uint64_t v8 = [a3 recommendationItem];
  uint64_t v9 = [v8 recommendation];

  if (v9)
  {
    uint64_t v10 = [(HUAvailableRelatedTriggerItemModule *)self serviceTypes];
    uint64_t v11 = [(HUAvailableRelatedTriggerItemModule *)self _accessoryCategoryUserFrieindlyDescription];
    uint64_t v12 = [v9 analyticsData];
    uint64_t v13 = (void *)[v12 mutableCopy];

    SEL v14 = [NSNumber numberWithBool:v21 == 0];
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F681F8]];

    uint64_t v15 = [NSNumber numberWithBool:v5];
    [v13 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68188]];

    if (v21) {
      [v13 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68190]];
    }
    if (v11) {
      [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68158]];
    }
    if ([v10 count] == 1)
    {
      __int16 v16 = [v10 anyObject];
      [v13 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F681E0]];
    }
    uint64_t v17 = [(HUAvailableRelatedTriggerItemModule *)self context];
    uint64_t v18 = [v17 analyticsPresentationContext];

    if (v18)
    {
      id v19 = [(HUAvailableRelatedTriggerItemModule *)self context];
      v20 = [v19 analyticsPresentationContext];
      [v13 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F681C8]];
    }
    [MEMORY[0x1E4F68EE0] sendEvent:14 withData:v13];
  }
}

- (id)_accessoryCategoryUserFrieindlyDescription
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  int v3 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
  id v4 = [v2 setWithArray:v3];
  BOOL v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_157);

  if ([v5 count] == 1)
  {
    BOOL v6 = [v5 anyObject];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __81__HUAvailableRelatedTriggerItemModule__accessoryCategoryUserFrieindlyDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F6A310] accessoryCategoryAnalyticsDescription:a2];
}

- (id)_buildItemProviders
{
  if ([(HUAvailableRelatedTriggerItemModule *)self shouldHideAutomationsModule])
  {
    int v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    BOOL v5 = [MEMORY[0x1E4F1CA48] array];
    BOOL v6 = [(HUAvailableRelatedTriggerItemModule *)self relatedItems];
    uint64_t v7 = [HUAvailableRelatedTriggerItemProvider alloc];
    uint64_t v8 = [(HUAvailableRelatedTriggerItemModule *)self home];
    uint64_t v9 = [(HUAvailableRelatedTriggerItemModule *)self context];
    uint64_t v10 = [(HUAvailableRelatedTriggerItemProvider *)v7 initWithHome:v8 relatedItems:v6 context:v9];
    [(HUAvailableRelatedTriggerItemModule *)self setAvailableTriggerItemProvider:v10];

    objc_initWeak(location, self);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke;
    v33[3] = &unk_1E6388B50;
    objc_copyWeak(&v34, location);
    uint64_t v11 = [(HUAvailableRelatedTriggerItemModule *)self availableTriggerItemProvider];
    [v11 setTriggerFilter:v33];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_3;
    v31[3] = &unk_1E6388B78;
    objc_copyWeak(&v32, location);
    uint64_t v12 = [(HUAvailableRelatedTriggerItemModule *)self availableTriggerItemProvider];
    [v12 setRecommendationsFilter:v31];

    uint64_t v13 = [(HUAvailableRelatedTriggerItemModule *)self availableTriggerItemProvider];
    [v4 addObject:v13];

    id v14 = objc_alloc(MEMORY[0x1E4F695C0]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_4;
    v29[3] = &unk_1E6384FD0;
    objc_copyWeak(&v30, location);
    uint64_t v15 = (void *)[v14 initWithResultsBlock:v29];
    [(HUAvailableRelatedTriggerItemModule *)self setAddAutomationItem:v15];

    __int16 v16 = [(HUAvailableRelatedTriggerItemModule *)self addAutomationItem];
    [v5 addObject:v16];

    uint64_t v17 = [(HUAvailableRelatedTriggerItemModule *)self context];
    int v18 = [v17 showNaturalLightingItem];

    if (v18)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F695C0]);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_5;
      v27[3] = &unk_1E6384FD0;
      objc_copyWeak(&v28, location);
      v20 = (void *)[v19 initWithResultsBlock:v27];
      [(HUAvailableRelatedTriggerItemModule *)self setNaturalLightingItem:v20];

      id v21 = [(HUAvailableRelatedTriggerItemModule *)self naturalLightingItem];
      [v5 addObject:v21];

      objc_destroyWeak(&v28);
    }
    id v22 = objc_alloc(MEMORY[0x1E4F695C8]);
    id v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    objc_super v24 = (void *)[v22 initWithItems:v23];
    [(HUAvailableRelatedTriggerItemModule *)self setStaticItemProvider:v24];

    id v25 = [(HUAvailableRelatedTriggerItemModule *)self staticItemProvider];
    [v4 addObject:v25];

    int v3 = (void *)[v4 copy];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(location);
  }

  return v3;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = [WeakRetained context];
  char v6 = [v5 hidesCustomTriggers];

  if ((v6 & 1) != 0 || !objc_msgSend(v3, "hf_shouldDisplayTrigger"))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [WeakRetained relatedItems];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_2;
    v10[3] = &unk_1E6388B28;
    id v11 = v3;
    uint64_t v8 = objc_msgSend(v7, "na_any:", v10);
  }
  return v8;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 homeKitObject];
  uint64_t v4 = objc_msgSend(v2, "hf_affectsHomeKitObject:", v3);

  return v4;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [(id)objc_opt_class() shouldShowRecommendation:v3];

  return v5;
}

id __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "addAutomationItemShouldBeHidden"));
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUSmartAutomationAddAutomation", @"HUSmartAutomationAddAutomation", 1);
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"plus"];
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  char v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "automationItemIsLoading"));
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68C48]];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "automationItemIsLoading"));
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v8;
}

id __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [WeakRetained relatedItems];
  uint64_t v5 = [v3 setWithArray:v4];
  char v6 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_174);

  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_179);

  uint64_t v9 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v10 = [MEMORY[0x1E4F7A0F0] immediateScheduler];
  id v11 = [v9 combineAllFutures:v8 scheduler:v10];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_10;
  v15[3] = &unk_1E6388C28;
  id v16 = v2;
  id v17 = WeakRetained;
  id v12 = v2;
  uint64_t v13 = [v11 flatMap:v15];

  return v13;
}

id __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    char v6 = [v5 accessory];
    [v6 lightProfiles];
  }
  else
  {
    char v6 = [v3 services];
    objc_msgSend(v6, "na_flatMap:", &__block_literal_global_177_0);
  uint64_t v7 = };

  return v7;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_lightProfiles");
}

id __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_9;
  v7[3] = &unk_1E6388BE0;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 futureWithCompletionHandlerAdapterBlock:v7];

  return v5;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fetchSettingsWithCompletion:a2];
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_10(uint64_t a1, void *a2)
{
  int v3 = objc_msgSend(a2, "na_any:", &__block_literal_global_184);
  id v4 = [NSNumber numberWithInt:v3 ^ 1u];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v5 = _HULocalizedStringWithDefaultValue(@"HUNaturalLightingAccessorySetupEnableItem_Title", @"HUNaturalLightingAccessorySetupEnableItem_Title", 1);
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  char v6 = NSNumber;
  [*(id *)(a1 + 40) enableNaturalLighting];
  uint64_t v7 = [v6 numberWithInteger:HFPrimaryStateFromBOOL()];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithImageIdentifier:@"HFImageIconIdentifierNaturalLightingRegular"];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = [*(id *)(a1 + 40) relatedItems];
  id v11 = [v9 setWithArray:v10];
  id v12 = objc_msgSend(v11, "na_flatMap:", &__block_literal_global_192);
  [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  id v14 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v15 = *(void *)(a1 + 32);

  return [v14 futureWithResult:v15];
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 supportedFeatures] & 1;
}

id __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = [a2 services];
  int v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_194);

  return v3;
}

uint64_t __58__HUAvailableRelatedTriggerItemModule__buildItemProviders__block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

- (BOOL)addAutomationItemShouldBeHidden
{
  int v3 = [(HUAvailableRelatedTriggerItemModule *)self home];
  if (objc_msgSend(v3, "hf_userCanCreateTrigger"))
  {
    id v4 = [(HUAvailableRelatedTriggerItemModule *)self context];
    if ([v4 hidesAddAutomationItem]) {
      LOBYTE(v5) = 1;
    }
    else {
      BOOL v5 = ![(HUAvailableRelatedTriggerItemModule *)self relatedItemsCanBeAutomated];
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)_updateRelatedItems:(id)a3
{
  BOOL v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a3;
  if (a3)
  {
    uint64_t v7 = [v5 setWithArray:v6];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v10 = (id)v7;
  id v8 = objc_msgSend(v6, "na_flatMap:", &__block_literal_global_199);

  [v10 addObjectsFromArray:v8];
  uint64_t v9 = [v10 allObjects];
  [(HUAvailableRelatedTriggerItemModule *)self setRelatedItems:v9];
}

id __59__HUAvailableRelatedTriggerItemModule__updateRelatedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 homeKitObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [v2 accessories];
    id v6 = [v5 allObjects];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__HUAvailableRelatedTriggerItemModule__updateRelatedItems___block_invoke_2;
    v9[3] = &unk_1E6388C98;
    id v10 = v2;
    uint64_t v7 = objc_msgSend(v6, "na_flatMap:", v9);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __59__HUAvailableRelatedTriggerItemModule__updateRelatedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_showAsIndividualServices"))
  {
    id v4 = 0;
  }
  else
  {
    BOOL v5 = [v3 services];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__HUAvailableRelatedTriggerItemModule__updateRelatedItems___block_invoke_3;
    v7[3] = &unk_1E6388C70;
    id v8 = *(id *)(a1 + 32);
    id v4 = objc_msgSend(v5, "na_map:", v7);
  }

  return v4;
}

id __59__HUAvailableRelatedTriggerItemModule__updateRelatedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) services];
  char v5 = [v4 containsObject:v3];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F69550];
    id v8 = [*(id *)(a1 + 32) valueSource];
    id v6 = [v7 serviceItemForService:v3 valueSource:v8];
  }

  return v6;
}

+ (BOOL)shouldShowRecommendation:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(v3, "hu_triggerBuilderIfAny");
  int v5 = [v4 requiresFMFDeviceToRun];

  id v6 = [v3 home];
  uint64_t v7 = [v3 home];
  id v8 = [v7 currentUser];
  uint64_t v9 = [v6 homeAccessControlForUser:v8];
  uint64_t v10 = [v9 presenceComputationStatus];

  id v11 = objc_msgSend(v3, "hu_triggerBuilderIfAny");
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  objc_opt_class();
  uint64_t v15 = [v14 locationInterface];
  id v16 = [v15 locationEventBuilder];
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  __int16 v40 = v18;
  if (v18)
  {
    id v19 = [v18 region];
    BOOL v41 = v19 != 0;
  }
  else
  {
    BOOL v41 = 1;
  }
  v20 = objc_msgSend(v3, "hu_asTriggerRecommendation");
  id v21 = [v20 triggerBuilders];
  int v22 = objc_msgSend(v21, "na_any:", &__block_literal_global_207);

  uint64_t v23 = v10;
  if ([MEMORY[0x1E4F69758] supportsBeingCurrentLocationDevice])
  {
    int v39 = v5;
    objc_super v24 = [MEMORY[0x1E4F69250] sharedDispatcher];
    int v25 = [v24 authorizationStatus];

    int v26 = HFLocationServicesAvailableForAuthorizationStatus();
    uint64_t v27 = (void *)MEMORY[0x1E4F2EA28];
    id v28 = [v3 home];
    LOBYTE(v27) = objc_msgSend(v27, "hf_presenceDisableReasonsForHome:", v28);

    unint64_t v29 = v27 & 2;
    if ((v27 & 2) != 0) {
      int v30 = 0;
    }
    else {
      int v30 = v26;
    }
    v31 = HFLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v43 = v30;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = v25;
      *(_WORD *)v44 = 1024;
      *(_DWORD *)&v44[2] = v26;
      *(_WORD *)v45 = 1024;
      *(_DWORD *)&v45[2] = v29 >> 1;
      _os_log_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEFAULT, " => locationAvailable=%{BOOL}d because locationServicesAuthStatus=%d, locationServicesEnabled=%{BOOL}d, homeKitLocationServicesDisabled=%{BOOL}d", buf, 0x1Au);
    }
    int v5 = v39;
  }
  else
  {
    v31 = HFLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEFAULT, "!supportsBeingCurrentLocationDevice", buf, 2u);
    }
    int v30 = 1;
  }

  int v32 = ((v23 != 3) | ~v5) & (v30 | ~v22) & v41;
  id v33 = HFLogForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v34 = v23 == 3;
    id v35 = v14;
    int v36 = !v34;
    BOOL v37 = [v3 uniqueIdentifier];
    *(_DWORD *)buf = 138413826;
    *(void *)v43 = v37;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)v44 = v32;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)v45 = v5;
    *(_WORD *)&v45[4] = 1024;
    int v46 = v36;
    id v14 = v35;
    __int16 v47 = 1024;
    int v48 = v22;
    __int16 v49 = 1024;
    int v50 = v30;
    __int16 v51 = 1024;
    BOOL v52 = v41;
    _os_log_impl(&dword_1BE345000, v33, OS_LOG_TYPE_DEFAULT, "Should show recommendation (%@) = %{BOOL}d\nrequiresFMF=%{BOOL}d, hasFMFDevice=%{BOOL}d, recommendationContainsLocationEvent=%{BOOL}d, locationAvailable=%{BOOL}d, allEventsAreValid=%{BOOL}d", buf, 0x30u);
  }
  return v32;
}

uint64_t __64__HUAvailableRelatedTriggerItemModule_shouldShowRecommendation___block_invoke(uint64_t a1, void *a2)
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

  id v6 = [v5 eventBuilders];
  uint64_t v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_210);

  return v7;
}

uint64_t __64__HUAvailableRelatedTriggerItemModule_shouldShowRecommendation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F1AD9210];
}

+ (id)sortComparator
{
  return &__block_literal_global_220;
}

uint64_t __53__HUAvailableRelatedTriggerItemModule_sortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  if (v8) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12) {
    goto LABEL_16;
  }
  uint64_t v13 = [v8 recommendationItem];
  if (!v13
    || (id v14 = (void *)v13,
        [v11 recommendationItem],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    int v25 = [v8 recommendationItem];
    int v26 = [v11 recommendationItem];
    char v27 = (v25 == 0) ^ (v26 != 0);

    if ((v27 & 1) == 0)
    {
      id v28 = [v8 recommendationItem];
      if (v28) {
        uint64_t v24 = -1;
      }
      else {
        uint64_t v24 = 1;
      }
      goto LABEL_17;
    }
LABEL_16:
    id v28 = [MEMORY[0x1E4F69220] defaultItemComparator];
    uint64_t v24 = ((uint64_t (**)(void, id, id))v28)[2](v28, v6, v9);
LABEL_17:

    goto LABEL_18;
  }
  id v16 = NSNumber;
  id v17 = [v8 recommendationItem];
  id v18 = [v17 recommendation];
  [v18 sortingPriority];
  id v19 = objc_msgSend(v16, "numberWithDouble:");

  v20 = NSNumber;
  id v21 = [v11 recommendationItem];
  int v22 = [v21 recommendation];
  [v22 sortingPriority];
  uint64_t v23 = objc_msgSend(v20, "numberWithDouble:");

  uint64_t v24 = [v19 compare:v23];
  if (!v24) {
    goto LABEL_16;
  }
LABEL_18:

  return v24;
}

+ (BOOL)_itemClassSupportsEvents:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (HFStaticItem)addAutomationItem
{
  return self->_addAutomationItem;
}

- (void)setAddAutomationItem:(id)a3
{
}

- (NSArray)relatedItems
{
  return self->_relatedItems;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFItemSectionAccessoryButtonHeaderDelegate)editButtonHeaderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editButtonHeaderDelegate);

  return (HFItemSectionAccessoryButtonHeaderDelegate *)WeakRetained;
}

- (void)setEditButtonHeaderDelegate:(id)a3
{
}

- (HUAvailableRelatedTriggerItemModuleContextProviding)context
{
  return self->_context;
}

- (void)setSensorCharacteristics:(id)a3
{
}

- (void)setActionBuilderFactories:(id)a3
{
}

- (void)setEventOptionsItems:(id)a3
{
}

- (HFStaticItem)naturalLightingItem
{
  return self->_naturalLightingItem;
}

- (void)setNaturalLightingItem:(id)a3
{
}

- (BOOL)enableNaturalLighting
{
  return self->_enableNaturalLighting;
}

- (void)setEnableNaturalLighting:(BOOL)a3
{
  self->_enableNaturalLighting = a3;
}

- (BOOL)automationItemIsLoading
{
  return self->_automationItemIsLoading;
}

- (NSString)sectionHeaderEditButtonTitleKey
{
  return self->_sectionHeaderEditButtonTitleKey;
}

- (void)setSectionHeaderEditButtonTitleKey:(id)a3
{
}

- (HUAvailableRelatedTriggerItemProvider)availableTriggerItemProvider
{
  return self->_availableTriggerItemProvider;
}

- (void)setAvailableTriggerItemProvider:(id)a3
{
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (NSMutableArray)previouslySortedItems
{
  return self->_previouslySortedItems;
}

- (void)setPreviouslySortedItems:(id)a3
{
}

- (HUAvailableTriggerItemActivationRequest)activeRequest
{
  return self->_activeRequest;
}

- (void)setActiveRequest:(id)a3
{
}

- (NSMutableArray)waitingRequests
{
  return self->_waitingRequests;
}

- (void)setWaitingRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingRequests, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_previouslySortedItems, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_availableTriggerItemProvider, 0);
  objc_storeStrong((id *)&self->_sectionHeaderEditButtonTitleKey, 0);
  objc_storeStrong((id *)&self->_naturalLightingItem, 0);
  objc_storeStrong((id *)&self->_eventOptionsItems, 0);
  objc_storeStrong((id *)&self->_actionBuilderFactories, 0);
  objc_storeStrong((id *)&self->_sensorCharacteristics, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_editButtonHeaderDelegate);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_relatedItems, 0);
  objc_storeStrong((id *)&self->_addAutomationItem, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end