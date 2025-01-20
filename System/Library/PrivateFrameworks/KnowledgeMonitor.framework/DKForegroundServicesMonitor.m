@interface DKForegroundServicesMonitor
@end

@implementation DKForegroundServicesMonitor

void __37___DKForegroundServicesMonitor_start__block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F645E8];
  id v4 = a2;
  v5 = [v3 descriptor];
  [v4 setStateDescriptor:v5];

  v6 = (void *)MEMORY[0x263F645D8];
  v7 = [*(id *)(a1 + 32) servicesOfInterestForWatchCommunication];
  v8 = [v6 predicateMatchingBundleIdentifiers:v7];
  v11[0] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [v4 setPredicates:v9];

  v10 = [*(id *)(a1 + 32) processUpdateHandler];
  [v4 setUpdateHandler:v10];
}

void __52___DKForegroundServicesMonitor_processUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)os_transaction_create();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = [WeakRetained queue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52___DKForegroundServicesMonitor_processUpdateHandler__block_invoke_2;
    v14[3] = &unk_264714DD0;
    v14[4] = v12;
    id v15 = v7;
    id v16 = v9;
    id v17 = v8;
    dispatch_sync(v13, v14);
  }
}

uint64_t __52___DKForegroundServicesMonitor_processUpdateHandler__block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 144) == *(void *)(result + 40)) {
    return objc_msgSend(*(id *)(result + 32), "processMonitor:didUpdateState:forProcess:");
  }
  return result;
}

@end