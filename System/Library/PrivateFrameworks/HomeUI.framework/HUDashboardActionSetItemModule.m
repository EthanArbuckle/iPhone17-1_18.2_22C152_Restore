@interface HUDashboardActionSetItemModule
- (BOOL)showPredictedScenes;
- (BOOL)supportsReorderingForItem:(id)a3;
- (HFActionSetItemProvider)actionSetItemProvider;
- (HFCharacteristicValueSource)valueSource;
- (HFPredictedActionSetItemProvider)predictedActionSetItemProvider;
- (HUDashboardActionSetItemModule)initWithContext:(id)a3 itemUpdater:(id)a4;
- (HUDashboardContext)context;
- (NAFuture)initialPredictionUpdateFuture;
- (NSSet)predictedActionSetItems;
- (id)_itemComparator;
- (id)_itemsToHideInSet:(id)a3;
- (id)_reorderableHomeKitItemListKey;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)_updateFilters;
- (void)predictionsManagerDidUpdatePredictions:(id)a3;
- (void)setActionSetItemProvider:(id)a3;
- (void)setContext:(id)a3;
- (void)setInitialPredictionUpdateFuture:(id)a3;
- (void)setPredictedActionSetItemProvider:(id)a3;
- (void)setValueSource:(id)a3;
@end

@implementation HUDashboardActionSetItemModule

- (id)_reorderableHomeKitItemListKey
{
  return (id)*MEMORY[0x1E4F68A30];
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithIdentifier:@"scenesSection"];
  v7 = _HULocalizedStringWithDefaultValue(@"HUGridScenesSectionTitle", @"HUGridScenesSectionTitle", 1);
  [v6 setHeaderTitle:v7];

  v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [(HUDashboardActionSetItemModule *)self predictedActionSetItemProvider];
  v10 = [v9 orderedItems];

  objc_msgSend(v8, "na_safeAddObjectsFromArray:", v10);
  v11 = [(HUDashboardActionSetItemModule *)self actionSetItemProvider];
  v12 = [v11 items];
  v13 = [v12 allObjects];
  v14 = [(HUDashboardActionSetItemModule *)self _itemComparator];
  v15 = [v13 sortedArrayUsingComparator:v14];

  objc_msgSend(v8, "na_safeAddObjectsFromArray:", v15);
  [v6 setItems:v8];
  v16 = (void *)MEMORY[0x1E4F69220];
  v20[0] = v6;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v18 = [v16 filterSections:v17 toDisplayedItems:v5];

  return v18;
}

- (NSSet)predictedActionSetItems
{
  v2 = [(HUDashboardActionSetItemModule *)self predictedActionSetItemProvider];
  v3 = [v2 items];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  v6 = v5;

  return (NSSet *)v6;
}

- (HFPredictedActionSetItemProvider)predictedActionSetItemProvider
{
  return self->_predictedActionSetItemProvider;
}

- (id)_itemsToHideInSet:(id)a3
{
  if ([(HUDashboardActionSetItemModule *)self showPredictedScenes]
    && ([(HUDashboardActionSetItemModule *)self context],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 includePredictedScenes],
        v4,
        v5))
  {
    v6 = [(HUDashboardActionSetItemModule *)self predictedActionSetItems];
    v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_125);

    v8 = [(HUDashboardActionSetItemModule *)self actionSetItemProvider];
    v9 = [v8 items];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__HUDashboardActionSetItemModule__itemsToHideInSet___block_invoke_2;
    v13[3] = &unk_1E638BA30;
    id v14 = v7;
    id v10 = v7;
    v11 = objc_msgSend(v9, "na_filter:", v13);
  }
  else
  {
    v11 = [(HUDashboardActionSetItemModule *)self predictedActionSetItems];
  }

  return v11;
}

- (HFActionSetItemProvider)actionSetItemProvider
{
  return self->_actionSetItemProvider;
}

- (BOOL)showPredictedScenes
{
  v2 = [(HUDashboardActionSetItemModule *)self context];
  v3 = [v2 home];
  char v4 = objc_msgSend(v3, "hf_showPredictedScenesOnDashboard");

  return v4;
}

- (HUDashboardContext)context
{
  return self->_context;
}

- (id)_itemComparator
{
  v21.receiver = self;
  v21.super_class = (Class)HUDashboardActionSetItemModule;
  v3 = [(HFItemModule *)&v21 _itemComparator];
  char v4 = [(HUDashboardActionSetItemModule *)self context];
  int v5 = [v4 accessoryTypeGroup];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v7 = [(HUDashboardActionSetItemModule *)self actionSetItemProvider];
    v8 = [v7 items];
    v9 = [v8 allObjects];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__HUDashboardActionSetItemModule__itemComparator__block_invoke;
    v18[3] = &unk_1E638B9C0;
    id v19 = v5;
    id v10 = v6;
    id v20 = v10;
    objc_msgSend(v9, "na_each:", v18);

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__HUDashboardActionSetItemModule__itemComparator__block_invoke_2;
    v15[3] = &unk_1E638B9E8;
    id v16 = v10;
    v17 = self;
    id v11 = v10;
    v12 = _Block_copy(v15);

    v3 = v12;
  }
  v13 = _Block_copy(v3);

  return v13;
}

uint64_t __52__HUDashboardActionSetItemModule__itemsToHideInSet___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 actionSet];
  char v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

id __52__HUDashboardActionSetItemModule__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 actionSet];
  v3 = [v2 uniqueIdentifier];

  return v3;
}

- (void)predictionsManagerDidUpdatePredictions:(id)a3
{
  char v4 = [(HUDashboardActionSetItemModule *)self initialPredictionUpdateFuture];
  char v5 = [v4 isFinished];

  if ((v5 & 1) == 0)
  {
    id v6 = [(HUDashboardActionSetItemModule *)self initialPredictionUpdateFuture];
    [v6 finishWithNoResult];
  }
}

- (NAFuture)initialPredictionUpdateFuture
{
  return self->_initialPredictionUpdateFuture;
}

void __62__HUDashboardActionSetItemModule_initWithContext_itemUpdater___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) cancel];
  v2 = (void *)MEMORY[0x1E4F69230];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  char v4 = [WeakRetained predictedActionSetItemProvider];
  char v5 = [v3 setWithObject:v4];
  id v6 = [v2 requestToReloadItemProviders:v5 senderSelector:*(void *)(a1 + 48)];

  v7 = [WeakRetained itemUpdater];
  id v8 = (id)[v7 performItemUpdateRequest:v6];
}

uint64_t __48__HUDashboardActionSetItemModule__updateFilters__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v5 = [WeakRetained context];
  int v6 = [v5 shouldHideHomeKitObject:v3];

  return v6 ^ 1u;
}

- (id)buildItemProviders
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = objc_alloc(MEMORY[0x1E4F68EC0]);
  char v5 = [(HUDashboardActionSetItemModule *)self context];
  int v6 = [v5 home];
  v7 = (void *)[v4 initWithHome:v6 actionSetItemStyle:1];
  [(HUDashboardActionSetItemModule *)self setActionSetItemProvider:v7];

  id v8 = [(HUDashboardActionSetItemModule *)self context];
  v9 = [v8 room];
  id v10 = [(HUDashboardActionSetItemModule *)self actionSetItemProvider];
  [v10 setRoom:v9];

  id v11 = [(HUDashboardActionSetItemModule *)self context];
  LODWORD(v9) = [v11 includePredictedScenes];

  if (v9)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F693E0]);
    v13 = [(HUDashboardActionSetItemModule *)self context];
    id v14 = [v13 home];
    v15 = (void *)[v12 initWithHome:v14 predictionsManagerDelegate:self itemCount:2];
    [(HUDashboardActionSetItemModule *)self setPredictedActionSetItemProvider:v15];
  }
  [(HUDashboardActionSetItemModule *)self _updateFilters];
  id v16 = [(HUDashboardActionSetItemModule *)self valueSource];

  if (v16)
  {
    v17 = [(HUDashboardActionSetItemModule *)self valueSource];
    v18 = [(HUDashboardActionSetItemModule *)self actionSetItemProvider];
    [v18 setValueSource:v17];

    id v19 = [(HUDashboardActionSetItemModule *)self valueSource];
    id v20 = [(HUDashboardActionSetItemModule *)self predictedActionSetItemProvider];
    [v20 setValueSource:v19];
  }
  objc_super v21 = [(HUDashboardActionSetItemModule *)self actionSetItemProvider];
  objc_msgSend(v3, "na_safeAddObject:", v21);

  v22 = [(HUDashboardActionSetItemModule *)self predictedActionSetItemProvider];
  objc_msgSend(v3, "na_safeAddObject:", v22);

  return v3;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setPredictedActionSetItemProvider:(id)a3
{
}

- (void)setActionSetItemProvider:(id)a3
{
}

- (void)_updateFilters
{
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v5, &location);
  id v3 = [(HUDashboardActionSetItemModule *)self actionSetItemProvider];
  [v3 setFilter:&v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (HUDashboardActionSetItemModule)initWithContext:(id)a3 itemUpdater:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HUDashboardActionSetItemModule;
  id v10 = [(HFItemModule *)&v26 initWithItemUpdater:v9];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_context, a3);
    id v12 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    initialPredictionUpdateFuture = v11->_initialPredictionUpdateFuture;
    v11->_initialPredictionUpdateFuture = v12;

    objc_initWeak(&location, v11);
    id v14 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__HUDashboardActionSetItemModule_initWithContext_itemUpdater___block_invoke;
    v23[3] = &unk_1E63862A0;
    objc_copyWeak(&v24, &location);
    v15 = [v14 afterDelay:v23 performBlock:5.0];

    id v16 = v11->_initialPredictionUpdateFuture;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __62__HUDashboardActionSetItemModule_initWithContext_itemUpdater___block_invoke_2;
    v20[3] = &unk_1E638B998;
    objc_copyWeak(v22, &location);
    id v17 = v15;
    id v21 = v17;
    v22[1] = (id)a2;
    id v18 = (id)[(NAFuture *)v16 addSuccessBlock:v20];

    objc_destroyWeak(v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __62__HUDashboardActionSetItemModule_initWithContext_itemUpdater___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained initialPredictionUpdateFuture];
  char v2 = [v1 isFinished];

  if ((v2 & 1) == 0)
  {
    id v3 = [WeakRetained initialPredictionUpdateFuture];
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "na_timeoutError");
    [v3 finishWithError:v4];
  }
}

void __49__HUDashboardActionSetItemModule__itemComparator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 actionSet];
  objc_msgSend(v4, "hf_percentOfAccessoryRepresentableObjectsAssociatedWithGroup:", *(void *)(a1 + 32));
  int v6 = v5;

  v7 = *(void **)(a1 + 40);
  LODWORD(v8) = v6;
  id v9 = [NSNumber numberWithFloat:v8];
  [v7 setObject:v9 forKey:v3];
}

uint64_t __49__HUDashboardActionSetItemModule__itemComparator__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) objectForKey:v5];
  double v8 = [*(id *)(a1 + 32) objectForKey:v6];
  uint64_t v9 = [v8 compare:v7];
  if (!v9)
  {
    v12.receiver = *(id *)(a1 + 40);
    v12.super_class = (Class)HUDashboardActionSetItemModule;
    objc_msgSendSuper2(&v12, sel__itemComparator);
    id v10 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v9 = ((uint64_t (**)(void, id, id))v10)[2](v10, v5, v6);
  }
  return v9;
}

- (BOOL)supportsReorderingForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUDashboardActionSetItemModule *)self predictedActionSetItemProvider];
  id v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  if (v7) {
    return 0;
  }
  uint64_t v9 = [(HUDashboardActionSetItemModule *)self context];
  id v10 = [v9 accessoryTypeGroup];
  if (v10) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = [(HFItemModule *)self supportsReordering];
  }

  return v8;
}

- (void)setContext:(id)a3
{
}

- (void)setInitialPredictionUpdateFuture:(id)a3
{
}

- (void)setValueSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_initialPredictionUpdateFuture, 0);
  objc_storeStrong((id *)&self->_predictedActionSetItemProvider, 0);
  objc_storeStrong((id *)&self->_actionSetItemProvider, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end