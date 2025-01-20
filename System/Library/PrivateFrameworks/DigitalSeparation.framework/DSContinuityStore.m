@interface DSContinuityStore
- (DSContinuityPairingWrapper)continuityPairing;
- (DSContinuityStore)init;
- (RPLReplicatorControlClient)replicatorProxy;
- (void)fetchPairedDevicesWithCompletion:(id)a3;
- (void)setContinuityPairing:(id)a3;
- (void)setReplicatorProxy:(id)a3;
- (void)unpairAllDevicesWithCompletion:(id)a3;
- (void)unpairDevicesWithIDs:(id)a3 completion:(id)a4;
@end

@implementation DSContinuityStore

- (DSContinuityStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)DSContinuityStore;
  v2 = [(DSContinuityStore *)&v8 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.DigitalSeparation", "DSContinuityStore");
    v4 = (void *)DSLog_3;
    DSLog_3 = (uint64_t)v3;

    id v5 = objc_alloc_init(MEMORY[0x263F641D8]);
    [(DSContinuityStore *)v2 setReplicatorProxy:v5];

    id v6 = objc_alloc_init(MEMORY[0x263F38C48]);
    [(DSContinuityStore *)v2 setContinuityPairing:v6];
  }
  return v2;
}

- (void)fetchPairedDevicesWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [(DSContinuityStore *)self replicatorProxy];
  v7 = [v6 devices];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v13 = [v12 deviceID];
        [v5 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  v14 = [(DSContinuityStore *)self continuityPairing];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__DSContinuityStore_fetchPairedDevicesWithCompletion___block_invoke;
  v17[3] = &unk_264C9EBA8;
  id v18 = v5;
  v19 = self;
  id v20 = v4;
  id v15 = v4;
  id v16 = v5;
  [v14 fetchContinuityEligibleDevicesWithCompletion:v17];
}

void __54__DSContinuityStore_fetchPairedDevicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v22 = a3;
  id obj = v5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v24 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v10 = *(void **)(a1 + 32);
        v11 = [v9 deviceID];
        v12 = [v10 objectForKey:v11];
        v13 = [v12 initialDiscoveryDate];

        [v9 setInitialDiscoveryDate:v13];
        v14 = [*(id *)(a1 + 40) replicatorProxy];
        id v15 = [v9 relationshipID];
        id v16 = [v14 pushTokenForRelationshipID:v15];

        uint64_t v17 = [v16 length];
        id v18 = [MEMORY[0x263F089D8] stringWithCapacity:2 * v17];
        id v19 = v16;
        uint64_t v20 = [v19 bytes];
        if ([v19 length])
        {
          unint64_t v21 = 0;
          do
            objc_msgSend(v18, "appendFormat:", @"%02X", *(unsigned __int8 *)(v20 + v21++));
          while (v21 < [v19 length]);
        }
        [v9 setPushToken:v18];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)unpairAllDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__DSContinuityStore_unpairAllDevicesWithCompletion___block_invoke;
  v6[3] = &unk_264C9EBD0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(DSContinuityStore *)self fetchPairedDevicesWithCompletion:v6];
}

void __52__DSContinuityStore_unpairAllDevicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = DSLog_3;
    if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR)) {
      __52__DSContinuityStore_unpairAllDevicesWithCompletion___block_invoke_cold_1((uint64_t)v6, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = [v5 valueForKey:@"deviceID"];
    uint64_t v9 = DSLog_3;
    if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_236090000, v9, OS_LOG_TYPE_INFO, "Unpairing all devices %@ by identifiers %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 32) unpairDevicesWithIDs:v8 completion:*(void *)(a1 + 40)];
  }
}

- (void)unpairDevicesWithIDs:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v17 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
        dispatch_group_enter(v8);
        uint64_t v14 = [(DSContinuityStore *)self continuityPairing];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke;
        v22[3] = &unk_264C9EBF8;
        v22[4] = v13;
        id v23 = v7;
        uint64_t v24 = v8;
        [v14 unpairHostWithDeviceID:v13 completion:v22];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke_12;
  block[3] = &unk_264C9E4B8;
  id v20 = v7;
  id v21 = v17;
  id v15 = v17;
  id v16 = v7;
  dispatch_group_notify(v8, MEMORY[0x263EF83A0], block);
}

void __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DSLog_3;
    if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR)) {
      __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
    [*(id *)(a1 + 40) addObject:v3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke_12(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = +[DSError errorWithCode:10 underlyingErrors:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (RPLReplicatorControlClient)replicatorProxy
{
  return self->_replicatorProxy;
}

- (void)setReplicatorProxy:(id)a3
{
}

- (DSContinuityPairingWrapper)continuityPairing
{
  return self->_continuityPairing;
}

- (void)setContinuityPairing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuityPairing, 0);
  objc_storeStrong((id *)&self->_replicatorProxy, 0);
}

void __52__DSContinuityStore_unpairAllDevicesWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236090000, a2, OS_LOG_TYPE_ERROR, "Fetch failed with error %{public}@, bailing unpair call...", (uint8_t *)&v2, 0xCu);
}

void __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_236090000, log, OS_LOG_TYPE_ERROR, "Failed to unpair device with ID %@ because %{public}@", (uint8_t *)&v4, 0x16u);
}

@end