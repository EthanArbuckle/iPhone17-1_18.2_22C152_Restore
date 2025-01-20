@interface WDSourceOrderController
- (WDSourceOrderController)init;
- (WDSourceOrderController)initWithHealthStore:(id)a3;
- (void)_notifyObserversForDataType:(id)a3 withProviders:(id)a4;
- (void)addObserver:(id)a3;
- (void)getOrderedSourcesForDataType:(id)a3 withCompletion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setOrderedSources:(id)a3 dataType:(id)a4;
@end

@implementation WDSourceOrderController

- (WDSourceOrderController)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDSourceOrderController;
  v5 = [(WDSourceOrderController *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F0A7B8]) initWithHealthStore:v4];
    sourceStore = v5->_sourceStore;
    v5->_sourceStore = (HKSourceStore *)v6;

    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;
  }
  return v5;
}

- (WDSourceOrderController)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void)getOrderedSourcesForDataType:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    sourceStore = self->_sourceStore;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__WDSourceOrderController_getOrderedSourcesForDataType_withCompletion___block_invoke;
    v10[3] = &unk_26458EB68;
    id v12 = v7;
    id v11 = v6;
    [(HKSourceStore *)sourceStore fetchOrderedSourcesForObjectType:v11 completion:v10];
  }
}

uint64_t __71__WDSourceOrderController_getOrderedSourcesForDataType_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void)setOrderedSources:(id)a3 dataType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  sourceStore = self->_sourceStore;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke;
  v11[3] = &unk_26458EB90;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [(HKSourceStore *)sourceStore updateOrderedSources:v10 forObjectType:v9 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke_283;
    block[3] = &unk_26458DB80;
    block[4] = WeakRetained;
    id v10 = a1[4];
    id v11 = a1[5];
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke_283(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversForDataType:*(void *)(a1 + 40) withProviders:*(void *)(a1 + 48)];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversForDataType:(id)a3 withProviders:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) sourceOrderUpdatedWithOrder:v7 dataType:v6];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_sourceStore, 0);
}

void __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "Error saving source order: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end