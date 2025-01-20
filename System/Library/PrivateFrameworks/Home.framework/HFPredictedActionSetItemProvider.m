@interface HFPredictedActionSetItemProvider
- (HFCharacteristicValueSource)overrideValueSource;
- (HFCharacteristicValueSource)valueSource;
- (HFPredictedActionSetItemProvider)init;
- (HFPredictedActionSetItemProvider)initWithHome:(id)a3 predictionsManagerDelegate:(id)a4 itemCount:(unint64_t)a5;
- (HFPredictionsManager)predictionsManager;
- (HMHome)home;
- (NSArray)orderedItems;
- (NSArray)predictions;
- (NSMutableSet)allItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fetchUserActionPredictions;
- (id)invalidationReasons;
- (id)reloadItems;
- (unint64_t)itemCount;
- (void)setAllItems:(id)a3;
- (void)setItemCount:(unint64_t)a3;
- (void)setOverrideValueSource:(id)a3;
- (void)setPredictions:(id)a3;
- (void)setPredictionsManager:(id)a3;
@end

@implementation HFPredictedActionSetItemProvider

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFPredictedActionSetItemProvider;
  v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"actionSet";
  v7[1] = @"home";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

id __47__HFPredictedActionSetItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 allItems];
  objc_super v6 = [v4 addedItems];
  [v5 unionSet:v6];

  v7 = [*(id *)(a1 + 32) allItems];
  v8 = [v4 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v9;
}

HFActionSetItem *__47__HFPredictedActionSetItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    objc_super v6 = v5;
  }
  else {
    objc_super v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [HFActionSetItem alloc];
    v9 = [WeakRetained valueSource];
    v10 = [(HFActionSetItem *)v8 initWithActionSet:v7 actionSetItemStyle:2 valueSource:v9];
  }
  else
  {
    NSLog(&cfstr_UnsupportedHom.isa, v5);
    v10 = 0;
  }

  return v10;
}

- (HFCharacteristicValueSource)valueSource
{
  id v3 = [(HFPredictedActionSetItemProvider *)self overrideValueSource];

  if (v3)
  {
    id v4 = [(HFPredictedActionSetItemProvider *)self overrideValueSource];
  }
  else
  {
    id v5 = [(HFPredictedActionSetItemProvider *)self home];
    id v4 = objc_msgSend(v5, "hf_characteristicValueManager");
  }
  return (HFCharacteristicValueSource *)v4;
}

- (HMHome)home
{
  return self->_home;
}

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

uint64_t __48__HFPredictedActionSetItemProvider_orderedItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 actionSet];
  id v4 = [v3 uniqueIdentifier];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

id __48__HFPredictedActionSetItemProvider_orderedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) allItems];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__HFPredictedActionSetItemProvider_orderedItems__block_invoke_2;
  v8[3] = &unk_264090A78;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v8);

  return v6;
}

- (NSArray)orderedItems
{
  id v3 = [(HFPredictedActionSetItemProvider *)self predictions];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__HFPredictedActionSetItemProvider_orderedItems__block_invoke;
  v6[3] = &unk_264090AA0;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "na_map:", v6);

  return (NSArray *)v4;
}

- (NSArray)predictions
{
  return self->_predictions;
}

id __62__HFPredictedActionSetItemProvider_fetchUserActionPredictions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained itemCount];
    uint64_t v7 = v6 - [v3 count];
    if (v7 >= 1)
    {
      v8 = [v5 home];
      id v9 = objc_msgSend(v8, "hf_orderedActionSets");
      v10 = (void *)[v9 mutableCopy];

      [v10 removeObjectsInArray:v3];
      if ([v10 count])
      {
        unint64_t v11 = [v10 count];
        if (v7 >= v11) {
          unint64_t v12 = v11;
        }
        else {
          unint64_t v12 = v7;
        }
        v13 = objc_msgSend(v10, "subarrayWithRange:", 0, v12);
        uint64_t v14 = [v3 arrayByAddingObjectsFromArray:v13];

        id v3 = (id)v14;
      }
    }
    [v5 setPredictions:v3];
    uint64_t v15 = [MEMORY[0x263F58190] futureWithResult:v3];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  v16 = (void *)v15;

  return v16;
}

- (void)setPredictions:(id)a3
{
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (HFPredictedActionSetItemProvider)initWithHome:(id)a3 predictionsManagerDelegate:(id)a4 itemCount:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HFPredictedActionSetItemProvider;
  unint64_t v11 = [(HFItemProvider *)&v20 init];
  unint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a3);
    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    allItems = v12->_allItems;
    v12->_allItems = (NSMutableSet *)v13;

    v12->_itemCount = a5;
    uint64_t v15 = [HFPredictionsManager alloc];
    v16 = [v9 userActionPredictionController];
    uint64_t v17 = [(HFPredictionsManager *)v15 initWithHome:v9 predictionsController:v16 delegate:v10 predictionLimit:a5 filterTypes:&unk_26C0F80C8];
    predictionsManager = v12->_predictionsManager;
    v12->_predictionsManager = (HFPredictionsManager *)v17;
  }
  return v12;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HFPredictedActionSetItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26408F3B0;
  objc_copyWeak(&v12, &location);
  id v3 = _Block_copy(aBlock);
  id v4 = [(HFPredictedActionSetItemProvider *)self fetchUserActionPredictions];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__HFPredictedActionSetItemProvider_reloadItems__block_invoke_2;
  v8[3] = &unk_264090AF0;
  objc_copyWeak(&v10, &location);
  id v5 = v3;
  id v9 = v5;
  uint64_t v6 = [v4 flatMap:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (id)fetchUserActionPredictions
{
  id v3 = [(HFPredictedActionSetItemProvider *)self predictionsManager];
  id v4 = [v3 fetchUserActionPredictions];

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HFPredictedActionSetItemProvider_fetchUserActionPredictions__block_invoke;
  void v7[3] = &unk_26408F468;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (HFPredictionsManager)predictionsManager
{
  return self->_predictionsManager;
}

id __47__HFPredictedActionSetItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained reloadItemsWithHomeKitObjects:v4 filter:0 itemMap:*(void *)(a1 + 32)];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__HFPredictedActionSetItemProvider_reloadItems__block_invoke_3;
  v9[3] = &unk_264090AC8;
  v9[4] = WeakRetained;
  uint64_t v7 = [v6 flatMap:v9];

  return v7;
}

- (HFPredictedActionSetItemProvider)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_predictionsManager_itemLimit_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFPredictedActionSetItemProvider.m", 35, @"%s is unavailable; use %@ instead",
    "-[HFPredictedActionSetItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFPredictedActionSetItemProvider *)self home];
  uint64_t v6 = [(HFPredictedActionSetItemProvider *)self predictionsManager];
  uint64_t v7 = [v6 delegate];
  id v8 = objc_msgSend(v4, "initWithHome:predictionsManagerDelegate:itemCount:", v5, v7, -[HFPredictedActionSetItemProvider itemCount](self, "itemCount"));

  return v8;
}

- (void)setAllItems:(id)a3
{
}

- (void)setItemCount:(unint64_t)a3
{
  self->_itemCount = a3;
}

- (void)setPredictionsManager:(id)a3
{
}

- (void)setOverrideValueSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_predictionsManager, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end