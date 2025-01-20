@interface CHSRemoteDeviceService
- (BOOL)reloadRemoteWidgetsWithError:(id *)a3;
- (BOOL)remoteWidgetsEnabled;
- (BOOL)toggleRemoteWidgetsEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)unpairDevice:(id)a3 error:(id *)a4;
- (CHSRemoteDeviceService)init;
- (CHSRemoteDeviceService)initWithConnection:(id)a3;
- (id)allPairedDevices;
- (id)browseNearbyDevicesWithHandler:(id)a3 error:(id *)a4;
- (void)nearbyDevicesDidChange:(id)a3;
- (void)pairDevice:(id)a3 completion:(id)a4;
@end

@implementation CHSRemoteDeviceService

- (CHSRemoteDeviceService)init
{
  v3 = +[CHSChronoServicesConnection sharedInstance];
  v4 = [(CHSRemoteDeviceService *)self initWithConnection:v3];

  return v4;
}

- (CHSRemoteDeviceService)initWithConnection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSRemoteDeviceService;
  v6 = [(CHSRemoteDeviceService *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_monitors = v7->_lock_monitors;
    v7->_lock_monitors = v8;

    objc_storeStrong((id *)&v7->_connection, a3);
    [(CHSChronoServicesConnection *)v7->_connection addClient:v7];
  }

  return v7;
}

- (id)browseNearbyDevicesWithHandler:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  connection = self->_connection;
  id v29 = 0;
  id v30 = 0;
  v8 = [(CHSChronoServicesConnection *)connection subscribeToRemoteDevices:&v30 outRemoteDevices:&v29];
  id v9 = v30;
  id v10 = v29;
  id v36 = v8;
  if (a4) {
    *a4 = v9;
  }
  if (v9)
  {
    objc_super v11 = CHSLogChronoServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v9;
      _os_log_impl(&dword_190C6F000, v11, OS_LOG_TYPE_DEFAULT, "Error acquiring monitor assertion %@", buf, 0xCu);
    }

    [(id)v32[5] invalidate];
    v12 = 0;
  }
  else
  {
    v13 = [MEMORY[0x1E4F29128] UUID];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke;
    v26[3] = &unk_1E56C9778;
    v26[4] = self;
    id v28 = v6;
    id v14 = v13;
    id v27 = v14;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke((uint64_t)v26);
    os_unfair_lock_unlock(&self->_lock);
    id v15 = objc_alloc(MEMORY[0x1E4F4F838]);
    v16 = [v14 UUIDString];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke_2;
    v22 = &unk_1E56C97A0;
    v25 = &v31;
    v23 = self;
    id v17 = v14;
    id v24 = v17;
    v12 = (void *)[v15 initWithIdentifier:v16 forReason:@"monitor devices" invalidationBlock:&v19];

    if (objc_msgSend(v10, "count", v19, v20, v21, v22, v23)) {
      [(CHSRemoteDeviceService *)self nearbyDevicesDidChange:v10];
    }
  }
  _Block_object_dispose(&v31, 8);

  return v12;
}

void __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  id v2 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v1, "setObject:forKey:");
}

void __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  id v2 = *(os_unfair_lock_s **)(a1 + 32);
  v3 = v2 + 2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke_3;
  v4[3] = &unk_1E56C81F0;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock(v3);
  __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke_3((uint64_t)v4);
  os_unfair_lock_unlock(v3);
}

uint64_t __63__CHSRemoteDeviceService_browseNearbyDevicesWithHandler_error___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)nearbyDevicesDidChange:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CHSRemoteDeviceService_nearbyDevicesDidChange___block_invoke;
  v7[3] = &unk_1E56C81F0;
  p_lock = &self->_lock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __49__CHSRemoteDeviceService_nearbyDevicesDidChange___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

void __49__CHSRemoteDeviceService_nearbyDevicesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        v6[2](v6, *(void *)(a1 + 40), 0);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (id)allPairedDevices
{
  return [(CHSChronoServicesConnection *)self->_connection allPairedDevices];
}

- (void)pairDevice:(id)a3 completion:(id)a4
{
}

- (BOOL)unpairDevice:(id)a3 error:(id *)a4
{
  return [(CHSChronoServicesConnection *)self->_connection unpairDevice:a3 error:a4];
}

- (BOOL)toggleRemoteWidgetsEnabled:(BOOL)a3 error:(id *)a4
{
  return [(CHSChronoServicesConnection *)self->_connection toggleRemoteWidgetsEnabled:a3 error:a4];
}

- (BOOL)reloadRemoteWidgetsWithError:(id *)a3
{
  return [(CHSChronoServicesConnection *)self->_connection reloadRemoteWidgetsWithError:a3];
}

- (BOOL)remoteWidgetsEnabled
{
  return [(CHSChronoServicesConnection *)self->_connection remoteWidgetsEnabled];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_monitors, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end