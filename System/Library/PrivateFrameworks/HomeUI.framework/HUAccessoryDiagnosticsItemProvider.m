@interface HUAccessoryDiagnosticsItemProvider
- (HUAccessoryDiagnosticsItemManager)itemManager;
- (HUAccessoryDiagnosticsItemProvider)initWithItemManager:(id)a3;
- (NSMutableSet)diagnosticItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setDiagnosticItems:(id)a3;
- (void)setItemManager:(id)a3;
@end

@implementation HUAccessoryDiagnosticsItemProvider

- (HUAccessoryDiagnosticsItemProvider)initWithItemManager:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUAccessoryDiagnosticsItemProvider;
  v5 = [(HFItemProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_itemManager, v4);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    diagnosticItems = v6->_diagnosticItems;
    v6->_diagnosticItems = v7;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(HUAccessoryDiagnosticsItemProvider);
  v5 = [(HUAccessoryDiagnosticsItemProvider *)self diagnosticItems];
  [(HUAccessoryDiagnosticsItemProvider *)v4 setDiagnosticItems:v5];

  return v4;
}

- (id)reloadItems
{
  v3 = [(HUAccessoryDiagnosticsItemProvider *)self itemManager];
  id v4 = [v3 availableLogs];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6387AC8;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v6 = [(HFItemProvider *)self reloadItemsWithObjects:v4 keyAdaptor:&__block_literal_global_50 itemAdaptor:&__block_literal_global_6 filter:0 itemMap:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke_4;
  v9[3] = &unk_1E6385B38;
  objc_copyWeak(&v10, &location);
  v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v7;
}

id __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F68DE8];
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = [*(id *)(a1 + 32) itemManager];
  v7 = [v6 sourceAccessory];
  v8 = (void *)[v5 initWithLogMetadata:v4 accessory:v7];

  return v8;
}

uint64_t __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 snapshotPath];
}

uint64_t __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 path];
}

id __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained diagnosticItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained diagnosticItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUAccessoryDiagnosticsItemProvider;
  v2 = [(HFItemProvider *)&v7 invalidationReasons];
  uint64_t v3 = *MEMORY[0x1E4F686E0];
  v8[0] = *MEMORY[0x1E4F686B0];
  v8[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v5 = [v2 setByAddingObjectsFromArray:v4];

  return v5;
}

- (NSMutableSet)diagnosticItems
{
  return self->_diagnosticItems;
}

- (void)setDiagnosticItems:(id)a3
{
}

- (HUAccessoryDiagnosticsItemManager)itemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemManager);

  return (HUAccessoryDiagnosticsItemManager *)WeakRetained;
}

- (void)setItemManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemManager);

  objc_storeStrong((id *)&self->_diagnosticItems, 0);
}

@end