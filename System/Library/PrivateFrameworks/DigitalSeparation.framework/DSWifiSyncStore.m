@interface DSWifiSyncStore
- (BOOL)fetchWifiSyncStatus;
- (DSRemotePairingStore)remotePairingStore;
- (DSRemotePairingWrapper)remotePairing;
- (DSWifiSyncStore)init;
- (OS_dispatch_queue)workQueue;
- (void)fetchPairedDevicesOnQueue:(id)a3 completion:(id)a4;
- (void)removeAllPairedDevicesOnQueue:(id)a3 completion:(id)a4;
- (void)removeComputersFromRemotePairing:(id)a3 withCompletion:(id)a4;
- (void)removePairedDevices:(id)a3 onQueue:(id)a4 withCompletion:(id)a5;
- (void)setRemotePairing:(id)a3;
- (void)setRemotePairingStore:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation DSWifiSyncStore

- (DSWifiSyncStore)init
{
  if (self)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F38C58]);
    [(DSWifiSyncStore *)self setRemotePairing:v3];

    id v4 = objc_alloc_init(MEMORY[0x263F38C50]);
    [(DSWifiSyncStore *)self setRemotePairingStore:v4];

    os_log_t v5 = os_log_create("com.apple.DigitalSeparation", "DSWifiSyncStore");
    v6 = (void *)DSLog_0;
    DSLog_0 = (uint64_t)v5;

    dispatch_queue_t v7 = dispatch_queue_create("WifiSyncQueue", 0);
    [(DSWifiSyncStore *)self setWorkQueue:v7];
  }
  return self;
}

- (BOOL)fetchWifiSyncStatus
{
  v2 = [(DSWifiSyncStore *)self remotePairingStore];
  char v3 = [v2 isWifiSyncEnabled];

  return v3;
}

- (void)fetchPairedDevicesOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DSWifiSyncStore *)self remotePairingStore];
  [v8 fetchPairedDevicesOnQueue:v7 completion:v6];
}

- (void)removeAllPairedDevicesOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DSWifiSyncStore *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke;
  block[3] = &unk_264C9E788;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v3 = lockdown_delete_pair_records();
  if (v3)
  {
    int v4 = v3;
    os_log_t v5 = DSLog_0;
    if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_ERROR)) {
      __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_cold_2(v4, v5);
    }
    id v6 = +[DSError errorWithCode:v4];
    [v2 addObject:v6];
  }
  id v7 = [*(id *)(a1 + 32) remotePairing];
  id v8 = [v7 removeAllPairedDevices];

  if (v8)
  {
    id v9 = DSLog_0;
    if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_ERROR)) {
      __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_cold_1((uint64_t)v8, v9);
    }
    [v2 addObject:v8];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_6;
  v12[3] = &unk_264C9E4B8;
  id v13 = v2;
  id v10 = *(NSObject **)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v11 = v2;
  dispatch_async(v10, v12);
}

void __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_6(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = +[DSError errorWithCode:9 underlyingErrors:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removePairedDevices:(id)a3 onQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DSWifiSyncStore *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke;
  v15[3] = &unk_264C9E860;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v9 remotePairingFrameworkIdentifier];

        if (v10) {
          [v2 addObject:v9];
        }
        id v11 = [v9 lockdownFrameworkIdentifier];

        if (v11) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_2;
  v15[3] = &unk_264C9E838;
  id v12 = *(void **)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v17 = v3;
  id v18 = v13;
  id v14 = v3;
  [v12 removeComputersFromRemotePairing:v2 withCompletion:v15];
}

void __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_3;
    block[3] = &unk_264C9E3F0;
    uint64_t v5 = &v21;
    id v21 = *(id *)(a1 + 48);
    id v20 = v3;
    dispatch_async(v4, block);
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) lockdownFrameworkKey];
          lockdown_unpair_host_by_id();
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }
      while (v8);
    }

    id v12 = *(NSObject **)(a1 + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_4;
    v13[3] = &unk_264C9E760;
    uint64_t v5 = &v14;
    id v14 = *(id *)(a1 + 48);
    dispatch_async(v12, v13);
  }
}

uint64_t __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeComputersFromRemotePairing:(id)a3 withCompletion:(id)a4
{
  remotePairing = self->_remotePairing;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(DSWifiSyncStore *)self workQueue];
  [(DSRemotePairingWrapper *)remotePairing removeSelectedDevices:v8 onQueue:v9 withCompletion:v7];
}

- (DSRemotePairingWrapper)remotePairing
{
  return self->_remotePairing;
}

- (void)setRemotePairing:(id)a3
{
}

- (DSRemotePairingStore)remotePairingStore
{
  return self->_remotePairingStore;
}

- (void)setRemotePairingStore:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_remotePairingStore, 0);
  objc_storeStrong((id *)&self->_remotePairing, 0);
}

void __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236090000, a2, OS_LOG_TYPE_ERROR, "Remote Pairing - Error removing at least one paired device: %@", (uint8_t *)&v2, 0xCu);
}

void __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_236090000, a2, OS_LOG_TYPE_ERROR, "liblockdown - Error removing at least one paired device: %d", (uint8_t *)v2, 8u);
}

@end