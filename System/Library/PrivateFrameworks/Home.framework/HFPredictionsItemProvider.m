@interface HFPredictionsItemProvider
- (BOOL)freezePredictions;
- (BOOL)thawPredictionsForNextReload;
- (HFCharacteristicValueSource)valueSource;
- (HFPredictionsItemProvider)init;
- (HFPredictionsItemProvider)initWithHome:(id)a3 predictionsManager:(id)a4 itemLimit:(unint64_t)a5;
- (HFPredictionsManager)predictionsManager;
- (HMHome)home;
- (NSArray)lastPredictions;
- (NSArray)predictions;
- (NSMutableDictionary)objectPriorities;
- (NSMutableSet)allItems;
- (id)_backFillPredictions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fetchPredictions;
- (id)invalidationReasons;
- (id)itemConfidence:(id)a3;
- (id)itemPriority:(id)a3;
- (id)reloadItems;
- (id)transformedPredictions:(id)a3;
- (unint64_t)itemLimit;
- (void)setAllItems:(id)a3;
- (void)setFreezePredictions:(BOOL)a3;
- (void)setItemLimit:(unint64_t)a3;
- (void)setLastPredictions:(id)a3;
- (void)setObjectPriorities:(id)a3;
- (void)setPredictions:(id)a3;
- (void)setPredictionsManager:(id)a3;
- (void)setThawPredictionsForNextReload:(BOOL)a3;
- (void)setValueSource:(id)a3;
- (void)updateItemLimit:(unint64_t)a3;
@end

@implementation HFPredictionsItemProvider

- (HFPredictionsItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_predictionsManager_itemLimit_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFPredictionsItemProvider.m", 50, @"%s is unavailable; use %@ instead",
    "-[HFPredictionsItemProvider init]",
    v5);

  return 0;
}

- (HFPredictionsItemProvider)initWithHome:(id)a3 predictionsManager:(id)a4 itemLimit:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HFPredictionsItemProvider;
  v11 = [(HFItemProvider *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a3);
    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    allItems = v12->_allItems;
    v12->_allItems = (NSMutableSet *)v13;

    objc_storeStrong((id *)&v12->_predictionsManager, a4);
    v12->_itemLimit = a5;
    uint64_t v15 = objc_msgSend(v9, "hf_characteristicValueManager");
    valueSource = v12->_valueSource;
    v12->_valueSource = (HFCharacteristicValueSource *)v15;

    v12->_freezePredictions = 0;
    v12->_thawPredictionsForNextReload = 0;
    lastPredictions = v12->_lastPredictions;
    v12->_lastPredictions = 0;
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFPredictionsItemProvider *)self home];
  v6 = [(HFPredictionsItemProvider *)self predictionsManager];
  v7 = objc_msgSend(v4, "initWithHome:predictionsManager:itemLimit:", v5, v6, -[HFPredictionsItemProvider itemLimit](self, "itemLimit"));

  return v7;
}

- (void)setFreezePredictions:(BOOL)a3
{
  self->_freezePredictions = a3;
  if (!a3)
  {
    self->_lastPredictions = 0;
    MEMORY[0x270F9A758]();
  }
}

- (void)setThawPredictionsForNextReload:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  self->_thawPredictionsForNextReload = a3;
  if (a3)
  {
    id v4 = HFLogForCategory(0x34uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@ set to thaw predictions for next reload", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)fetchPredictions
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([(HFPredictionsItemProvider *)self freezePredictions]
    && ![(HFPredictionsItemProvider *)self thawPredictionsForNextReload]
    && ([(HFPredictionsItemProvider *)self lastPredictions],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    int v5 = HFLogForCategory(0x34uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(HFPredictionsItemProvider *)self home];
      uint64_t v7 = [(HFPredictionsItemProvider *)self lastPredictions];
      *(_DWORD *)buf = 138412802;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to fetch predictions for home %@, but is frozen. Returning %@", buf, 0x20u);
    }
    v8 = (void *)MEMORY[0x263F58190];
    id v9 = [(HFPredictionsItemProvider *)self lastPredictions];
    id v10 = [v8 futureWithResult:v9];
  }
  else
  {
    objc_initWeak(&location, self);
    if ([(HFPredictionsItemProvider *)self freezePredictions])
    {
      v11 = HFLogForCategory(0x34uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(HFPredictionsItemProvider *)self home];
        *(_DWORD *)buf = 138412546;
        v20 = self;
        __int16 v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%@ thawing predictions to be recomputed for home %@", buf, 0x16u);
      }
    }
    uint64_t v13 = [(HFPredictionsItemProvider *)self predictionsManager];
    v14 = [v13 fetchUserActionPredictions];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __45__HFPredictionsItemProvider_fetchPredictions__block_invoke;
    v16[3] = &unk_26408F468;
    objc_copyWeak(&v17, &location);
    id v10 = [v14 flatMap:v16];
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  return v10;
}

id __45__HFPredictionsItemProvider_fetchPredictions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained freezePredictions])
  {
    int v5 = HFLogForCategory(0x34uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = WeakRetained;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@ saving and returning predictions after thawing %@", (uint8_t *)&v9, 0x16u);
    }

    [WeakRetained setThawPredictionsForNextReload:0];
    v6 = (void *)[v3 copy];
    [WeakRetained setLastPredictions:v6];
  }
  uint64_t v7 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v7;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__HFPredictionsItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26408F3B0;
  objc_copyWeak(&v12, &location);
  id v3 = _Block_copy(aBlock);
  uint64_t v4 = [(HFPredictionsItemProvider *)self fetchPredictions];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__HFPredictionsItemProvider_reloadItems__block_invoke_2;
  v8[3] = &unk_264090AF0;
  objc_copyWeak(&v10, &location);
  id v5 = v3;
  id v9 = v5;
  v6 = [v4 flatMap:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

HFHomeItem *__40__HFPredictionsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [[HFHomeItem alloc] initWithHome:v7];
    goto LABEL_58;
  }
  id v9 = [WeakRetained valueSource];
  objc_opt_class();
  id v10 = v5;
  if (objc_opt_isKindOfClass()) {
    __int16 v11 = v10;
  }
  else {
    __int16 v11 = 0;
  }
  id v12 = v11;

  if (!v12)
  {
    objc_opt_class();
    id v13 = v10;
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      if (objc_msgSend(v15, "hf_isProgrammableSwitch"))
      {
        v16 = HFProgrammableSwitchAccessoryItem;
LABEL_34:
        v8 = (HFHomeItem *)[[v16 alloc] initWithAccessory:v15 valueSource:v9];
LABEL_56:

        goto LABEL_57;
      }
      if (objc_msgSend(v15, "hf_isRemoteControl"))
      {
        v16 = HFTargetControlAccessoryItem;
        goto LABEL_34;
      }
      if (!objc_msgSend(v15, "hf_isMediaAccessory")
        || ([v15 mediaProfile], __int16 v21 = objc_claimAutoreleasedReturnValue(),
                                               v21,
                                               !v21))
      {
        v16 = HFAccessoryItem;
        goto LABEL_34;
      }
      id v19 = [v15 mediaProfile];
      v20 = [[HFMediaAccessoryItem alloc] initWithValueSource:v9 mediaProfileContainer:v19];
    }
    else
    {
      objc_opt_class();
      id v17 = v13;
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v19 = v18;

      if (!v19)
      {
        objc_opt_class();
        id v22 = v17;
        if (objc_opt_isKindOfClass()) {
          __int16 v23 = v22;
        }
        else {
          __int16 v23 = 0;
        }
        id v24 = v23;

        if (v24)
        {
          v8 = [[HFServiceGroupItem alloc] initWithValueSource:v9 serviceGroup:v24];
        }
        else
        {
          objc_opt_class();
          id v25 = v22;
          if (objc_opt_isKindOfClass()) {
            v26 = v25;
          }
          else {
            v26 = 0;
          }
          id v27 = v26;

          if (v27)
          {
            v8 = [[HFMediaAccessoryItem alloc] initWithValueSource:v9 mediaProfileContainer:v27];
            id v24 = 0;
          }
          else
          {
            objc_opt_class();
            id v28 = v25;
            if (objc_opt_isKindOfClass()) {
              v29 = v28;
            }
            else {
              v29 = 0;
            }
            id v30 = v29;

            if (v30)
            {
              v8 = [[HFMediaAccessoryItem alloc] initWithValueSource:v9 mediaProfileContainer:v30];
              v31 = v30;
              id v24 = 0;
            }
            else
            {
              objc_opt_class();
              id v32 = v28;
              if (objc_opt_isKindOfClass()) {
                v33 = v32;
              }
              else {
                v33 = 0;
              }
              id v34 = v33;

              if (v34)
              {
                v8 = [[HFPlaceholderItem alloc] initWithHomeKitObject:v34];
              }
              else
              {
                NSLog(&cfstr_UnsupportedHom.isa, v32);
                v8 = 0;
              }
              v35 = v34;
              id v24 = 0;

              v31 = 0;
            }
          }
        }

        goto LABEL_55;
      }
      v20 = (HFMediaAccessoryItem *)objc_msgSend(objc_alloc(+[HFServiceItem itemClassForService:](HFServiceItem, "itemClassForService:", v19)), "initWithValueSource:service:", v9, v19);
    }
    v8 = (HFHomeItem *)v20;
LABEL_55:

    goto LABEL_56;
  }
  v8 = [[HFActionSetItem alloc] initWithActionSet:v12 actionSetItemStyle:1 valueSource:v9];
LABEL_57:

LABEL_58:
  return v8;
}

id __40__HFPredictionsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_msgSend(v3, "na_safeSubarrayWithRange:", 0, objc_msgSend(WeakRetained, "itemLimit"));
  v6 = [WeakRetained transformedPredictions:v5];

  id v7 = [WeakRetained _backFillPredictions:v6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__HFPredictionsItemProvider_reloadItems__block_invoke_3;
  v10[3] = &unk_264090AF0;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v11 = *(id *)(a1 + 32);
  v8 = [v7 flatMap:v10];

  objc_destroyWeak(&v12);
  return v8;
}

id __40__HFPredictionsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = [WeakRetained reloadItemsWithHomeKitObjects:v3 filter:0 itemMap:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__HFPredictionsItemProvider_reloadItems__block_invoke_4;
  v9[3] = &unk_26408D198;
  objc_copyWeak(&v10, v4);
  id v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  return v7;
}

id __40__HFPredictionsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained allItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained allItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)transformedPredictions:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_170);
}

id __52__HFPredictionsItemProvider_transformedPredictions___block_invoke(uint64_t a1, void *a2)
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

  if (v5
    && objc_msgSend(v5, "hf_isMediaAccessory")
    && ([v5 mediaProfile], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = [v5 mediaProfile];
  }
  else
  {
    id v7 = v3;
  }
  v8 = v7;

  return v8;
}

- (id)_backFillPredictions:(id)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(HFPredictionsItemProvider *)self setObjectPriorities:v5];

  v6 = [MEMORY[0x263EFF9B0] orderedSetWithArray:v4];
  id v7 = HFLogForCategory(0x34uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v81 = v4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Initial predictions: %@", buf, 0xCu);
  }

  v8 = [(HFPredictionsItemProvider *)self predictionsManager];
  id v9 = [v8 filterTypes];
  if ([v9 count])
  {
    id v10 = [(HFPredictionsItemProvider *)self predictionsManager];
    id v11 = [v10 filterTypes];
    int v12 = [v11 containsObject:&unk_26C0F7398];
  }
  else
  {
    int v12 = 1;
  }

  v65 = v4;
  if (_os_feature_enabled_impl())
  {
    id v13 = [(HFPredictionsItemProvider *)self predictionsManager];
    v14 = [v13 filterTypes];
    if ([v14 count])
    {
      id v15 = [(HFPredictionsItemProvider *)self predictionsManager];
      [v15 filterTypes];
      id v17 = v16 = v6;
      int v18 = [v17 containsObject:&unk_26C0F73B0];

      v6 = v16;
    }
    else
    {
      int v18 = 1;
    }
  }
  else
  {
    int v18 = 0;
  }
  id v19 = [MEMORY[0x263EFF9B0] orderedSet];
  v66 = v19;
  v67 = self;
  if (v12)
  {
    v20 = [(HFPredictionsItemProvider *)self home];
    __int16 v21 = objc_msgSend(v20, "hf_accessoryLikeObjects");
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_2;
    v77[3] = &unk_264098A98;
    id v78 = &__block_literal_global_41_3;
    objc_msgSend(v21, "na_map:", v77);
    __int16 v23 = v22 = v6;
    id v24 = [v23 allObjects];
    id v25 = [(HFPredictionsItemProvider *)v67 home];
    v26 = objc_msgSend(v25, "hf_reorderableServicesList");
    [v26 sortedHomeKitObjectComparator];
    v28 = int v27 = v18;
    v29 = [v24 sortedArrayUsingComparator:v28];

    self = v67;
    v6 = v22;

    id v19 = v66;
    [v66 addObjectsFromArray:v29];
    id v30 = [(HFPredictionsItemProvider *)v67 home];
    v31 = objc_msgSend(v30, "hf_orderedRooms");
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_3;
    v75[3] = &unk_264098AE8;
    id v76 = &__block_literal_global_41_3;
    id v32 = objc_msgSend(v31, "na_flatMap:", v75);

    [v66 addObjectsFromArray:v32];
    int v18 = v27;
  }
  v33 = [MEMORY[0x263EFF9B0] orderedSet];
  if (v18)
  {
    id v34 = [(HFPredictionsItemProvider *)self home];
    v35 = objc_msgSend(v34, "hf_orderedActionSets");
    v36 = objc_msgSend(v35, "na_filter:", &__block_literal_global_47_4);

    v37 = objc_msgSend(v36, "na_filter:", &__block_literal_global_49_2);
    [v33 addObjectsFromArray:v37];
    v38 = objc_msgSend(v36, "na_filter:", &__block_literal_global_51_2);
    [v33 addObjectsFromArray:v38];
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_8;
  aBlock[3] = &unk_264098B10;
  id v39 = v6;
  id v73 = v39;
  v74 = self;
  v40 = (void (**)(void *, void *))_Block_copy(aBlock);
  unint64_t v41 = [v39 count];
  if (v41 < [(HFPredictionsItemProvider *)self itemLimit])
  {
    do
    {
      if (![v19 count] && !objc_msgSend(v33, "count")) {
        break;
      }
      v40[2](v40, v19);
      v40[2](v40, v19);
      v40[2](v40, v33);
      unint64_t v42 = [v39 count];
    }
    while (v42 < [(HFPredictionsItemProvider *)self itemLimit]);
  }
  v64 = v33;
  +[HFAnalyticsCCPredictionEvent sendMetricsForPredictionEventAtStage:withCount:](HFAnalyticsCCPredictionEvent, "sendMetricsForPredictionEventAtStage:withCount:", 3, [v39 count]);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([v39 count] && -[HFPredictionsItemProvider itemLimit](self, "itemLimit"))
    {
      unint64_t v43 = 0;
      do
      {
        v44 = objc_alloc_init(HFPlaceholder);
        [v39 addObject:v44];

        ++v43;
      }
      while (v43 < [(HFPredictionsItemProvider *)self itemLimit]);
    }
    v45 = [(HFPredictionsItemProvider *)self home];
    [v39 insertObject:v45 atIndex:0];
  }
  v63 = v40;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v46 = v39;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v69;
    uint64_t v50 = 1;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v69 != v49) {
          objc_enumerationMutation(v46);
        }
        v52 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        v53 = [(HFPredictionsItemProvider *)self objectPriorities];
        v54 = [NSNumber numberWithInteger:v50 + i];
        v55 = [v52 uniqueIdentifier];
        v56 = [v55 UUIDString];
        [v53 setObject:v54 forKey:v56];

        self = v67;
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v68 objects:v79 count:16];
      v50 += i;
    }
    while (v48);
  }

  v57 = HFLogForCategory(0x34uLL);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v58 = [v46 array];
    *(_DWORD *)buf = 138412290;
    id v81 = v58;
    _os_log_impl(&dword_20B986000, v57, OS_LOG_TYPE_DEFAULT, "Backfilled predictions: %@", buf, 0xCu);
  }
  v59 = (void *)MEMORY[0x263F58190];
  v60 = [v46 array];
  v61 = [v59 futureWithResult:v60];

  return v61;
}

uint64_t __50__HFPredictionsItemProvider__backFillPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 homeKitObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [v2 homeKitObject];
  v6 = v5;
  if (isKindOfClass)
  {
    uint64_t v7 = objc_msgSend(v5, "hf_showsAsAccessoryInControlCentre");
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = 1;
      goto LABEL_7;
    }
    v6 = [v2 homeKitObject];
    uint64_t v7 = objc_msgSend(v6, "hf_showsAsServiceInControlCentre");
  }
  uint64_t v9 = v7;

LABEL_7:
  return v9;
}

id __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_effectiveIsFavorite")
    && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v4 = [v3 homeKitObject];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hf_accessoryLikeObjects");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_4;
  v11[3] = &unk_264098AC0;
  id v12 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(v4, "na_map:", v11);
  v6 = [v5 allObjects];
  uint64_t v7 = objc_msgSend(v3, "hf_reorderableServicesList");

  char v8 = [v7 sortedHomeKitObjectComparator];
  uint64_t v9 = [v6 sortedArrayUsingComparator:v8];

  return v9;
}

id __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_effectiveShowInHomeDashboard")
    && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v4 = [v3 homeKitObject];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

BOOL __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

uint64_t __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_effectiveShowInHomeDashboard");
}

uint64_t __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_effectiveShowInHomeDashboard") ^ 1;
}

void __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) count];
  if (v4 < [*(id *)(a1 + 40) itemLimit])
  {
    id v5 = [v3 firstObject];
    if (v5)
    {
      v6 = HFLogForCategory(0x34uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        char v8 = v5;
        _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Backfilling %@", (uint8_t *)&v7, 0xCu);
      }

      [*(id *)(a1 + 32) addObject:v5];
      [v3 removeObjectAtIndex:0];
    }
  }
}

- (id)invalidationReasons
{
  v7[3] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFPredictionsItemProvider;
  id v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"actionSet";
  v7[1] = @"home";
  v7[2] = @"user";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  unint64_t v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)itemPriority:(id)a3
{
  id v4 = a3;
  id v5 = [(HFPredictionsItemProvider *)self objectPriorities];
  objc_super v6 = [v4 homeKitObject];

  int v7 = [v6 uniqueIdentifier];
  char v8 = [v7 UUIDString];
  uint64_t v9 = [v5 objectForKey:v8];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [NSNumber numberWithInteger:0];
  }
  id v11 = v10;

  return v11;
}

- (id)itemConfidence:(id)a3
{
  id v4 = [a3 homeKitObject];
  if (v4)
  {
    id v5 = [(HFPredictionsItemProvider *)self predictionsManager];
    objc_super v6 = [v5 predictionConfidenceForObject:v4];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (void)updateItemLimit:(unint64_t)a3
{
  self->_itemLimit = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
}

- (BOOL)freezePredictions
{
  return self->_freezePredictions;
}

- (BOOL)thawPredictionsForNextReload
{
  return self->_thawPredictionsForNextReload;
}

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (void)setPredictions:(id)a3
{
}

- (NSArray)lastPredictions
{
  return self->_lastPredictions;
}

- (void)setLastPredictions:(id)a3
{
}

- (NSMutableDictionary)objectPriorities
{
  return self->_objectPriorities;
}

- (void)setObjectPriorities:(id)a3
{
}

- (HFPredictionsManager)predictionsManager
{
  return self->_predictionsManager;
}

- (void)setPredictionsManager:(id)a3
{
}

- (unint64_t)itemLimit
{
  return self->_itemLimit;
}

- (void)setItemLimit:(unint64_t)a3
{
  self->_itemLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionsManager, 0);
  objc_storeStrong((id *)&self->_objectPriorities, 0);
  objc_storeStrong((id *)&self->_lastPredictions, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end