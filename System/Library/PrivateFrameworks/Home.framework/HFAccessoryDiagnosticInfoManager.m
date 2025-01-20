@interface HFAccessoryDiagnosticInfoManager
- (BOOL)hasDiagnosticInfoForAccessory:(id)a3;
- (BOOL)isCDPStatusGoodForAccessory:(id)a3;
- (HFAccessoryDiagnosticInfoManager)init;
- (HFAccessoryDiagnosticInfoManager)initWithDispatcher:(id)a3;
- (HFHomeKitDispatcher)dispatcher;
- (NSHashTable)observers;
- (NSMapTable)accessoryUniqueIDToDiagnosticInfoMapTable;
- (id)_diagnosticInfoForAccessory:(id)a3;
- (id)fetchDiagnosticInfoForAccessory:(id)a3;
- (id)softwareVersionForAccessory:(id)a3;
- (id)wifiNetworkInfoForAccessory:(id)a3;
- (void)_notifyObserversOfReceivedDiagnosticInfo:(id)a3 forAccessory:(id)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation HFAccessoryDiagnosticInfoManager

- (HFAccessoryDiagnosticInfoManager)initWithDispatcher:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFAccessoryDiagnosticInfoManager;
  v5 = [(HFAccessoryDiagnosticInfoManager *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    accessoryUniqueIDToDiagnosticInfoMapTable = v5->_accessoryUniqueIDToDiagnosticInfoMapTable;
    v5->_accessoryUniqueIDToDiagnosticInfoMapTable = (NSMapTable *)v6;

    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

    objc_storeWeak((id *)&v5->_dispatcher, v4);
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessoryDiagnosticInfoManager *)self observers];
  [v5 addObject:v4];
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (HFAccessoryDiagnosticInfoManager)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithDispatcher_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryDiagnosticInfoManager.m", 31, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryDiagnosticInfoManager init]",
    v5);

  return 0;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessoryDiagnosticInfoManager *)self observers];
  [v5 removeObject:v4];
}

- (id)fetchDiagnosticInfoForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [(HFAccessoryDiagnosticInfoManager *)self dispatcher];
  v7 = [v6 homeManager];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__HFAccessoryDiagnosticInfoManager_fetchDiagnosticInfoForAccessory___block_invoke;
  v13[3] = &unk_264091D50;
  id v14 = v4;
  v15 = self;
  id v8 = v5;
  id v16 = v8;
  id v9 = v4;
  [v7 fetchAppleMediaAccesoryDiagnosticInfo:v9 options:3 completion:v13];

  v10 = v16;
  id v11 = v8;

  return v11;
}

void __68__HFAccessoryDiagnosticInfoManager_fetchDiagnosticInfoForAccessory___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = HFLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = [a1[4] debugDescription];
      int v14 = 138412546;
      v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "There was an error fetching diagnostic info for accessory: %@, with error: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  if (v5)
  {
    id v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v5 debugDescription];
      v10 = [a1[4] debugDescription];
      int v14 = 138412546;
      v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Fetched diagnostic info: %@ for accessory: %@", (uint8_t *)&v14, 0x16u);
    }
    id v11 = [a1[5] accessoryUniqueIDToDiagnosticInfoMapTable];
    v12 = [a1[4] uniqueIdentifier];
    [v11 setObject:v5 forKey:v12];

    [a1[5] _notifyObserversOfReceivedDiagnosticInfo:v5 forAccessory:a1[4]];
  }
  [a1[6] finishWithResult:v5 error:v6];
}

- (BOOL)hasDiagnosticInfoForAccessory:(id)a3
{
  v3 = [(HFAccessoryDiagnosticInfoManager *)self _diagnosticInfoForAccessory:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isCDPStatusGoodForAccessory:(id)a3
{
  id v4 = a3;
  if ([(HFAccessoryDiagnosticInfoManager *)self hasDiagnosticInfoForAccessory:v4])
  {
    id v5 = [(HFAccessoryDiagnosticInfoManager *)self _diagnosticInfoForAccessory:v4];
    char v6 = [v5 cdpStatusGood];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (id)wifiNetworkInfoForAccessory:(id)a3
{
  v3 = [(HFAccessoryDiagnosticInfoManager *)self _diagnosticInfoForAccessory:a3];
  id v4 = [v3 wifiInfo];

  return v4;
}

- (id)softwareVersionForAccessory:(id)a3
{
  v3 = [(HFAccessoryDiagnosticInfoManager *)self _diagnosticInfoForAccessory:a3];
  id v4 = [v3 softwareVersion];

  return v4;
}

- (void)_notifyObserversOfReceivedDiagnosticInfo:(id)a3 forAccessory:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HFAccessoryDiagnosticInfoManager *)self observers];
  id v9 = (void *)[v8 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v15, "didUpdateDiagnosticInfo:forAccessory:", v6, v7, (void)v16);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (id)_diagnosticInfoForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessoryDiagnosticInfoManager *)self accessoryUniqueIDToDiagnosticInfoMapTable];
  id v6 = [v4 uniqueIdentifier];

  id v7 = [v5 objectForKey:v6];

  return v7;
}

- (HFHomeKitDispatcher)dispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatcher);
  return (HFHomeKitDispatcher *)WeakRetained;
}

- (void)setDispatcher:(id)a3
{
}

- (NSMapTable)accessoryUniqueIDToDiagnosticInfoMapTable
{
  return self->_accessoryUniqueIDToDiagnosticInfoMapTable;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIDToDiagnosticInfoMapTable, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
}

@end