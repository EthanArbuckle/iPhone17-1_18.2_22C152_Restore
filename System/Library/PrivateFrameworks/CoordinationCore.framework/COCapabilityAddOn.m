@interface COCapabilityAddOn
- (BOOL)_legacyShimOverridesAvailableCapabilities:(id)a3;
- (COCapabilityAddOn)init;
- (COCapabilityAddOn)initWithSupportedCapabilities:(id)a3;
- (COCapabilityAddOnDelegate)delegate;
- (COCapabilityLegacyShim)pairLegacyShim;
- (NSDictionary)gatheredCapabilities;
- (NSSet)availableCapabilities;
- (NSSet)supportedCapabilities;
- (id)availableCapabilitiesForNode:(id)a3;
- (void)_enableForPairLegacySupport;
- (void)_notifyDelegateCapabilitiesChanged;
- (void)_setAvailableCapabilities_Unsafe:(id)a3;
- (void)_withLock:(id)a3;
- (void)didAddToMeshController:(id)a3;
- (void)didChangeNodesForMeshController:(id)a3;
- (void)handleCapabilitiesReadRequest:(id)a3 callback:(id)a4;
- (void)handleCapabilitiesUpdateNotification:(id)a3;
- (void)legacyShim:(id)a3 availableCapabilitiesChanged:(id)a4;
- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)performCapabilitiesUpdate;
- (void)setAvailableCapabilities:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGatheredCapabilities:(id)a3;
- (void)setSupportedCapabilities:(id)a3;
- (void)willRemoveFromMeshController:(id)a3;
@end

@implementation COCapabilityAddOn

- (COCapabilityAddOn)initWithSupportedCapabilities:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)COCapabilityAddOn;
  v5 = [(COMeshAddOn *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    availableCapabilities = v6->_availableCapabilities;
    v6->_availableCapabilities = v7;

    if (v4) {
      id v9 = (id)[v4 copy];
    }
    else {
      id v9 = objc_alloc_init(MEMORY[0x263EFFA08]);
    }
    v10 = v9;
    objc_storeStrong((id *)&v6->_supportedCapabilities, v9);

    v11 = (NSDictionary *)objc_alloc_init(NSDictionary);
    gatheredCapabilities = v6->_gatheredCapabilities;
    v6->_gatheredCapabilities = v11;
  }
  return v6;
}

- (COCapabilityAddOn)init
{
  return [(COCapabilityAddOn *)self initWithSupportedCapabilities:0];
}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 != 3)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 0) {
      goto LABEL_8;
    }
    [(COCapabilityAddOn *)self setGatheredCapabilities:MEMORY[0x263EFFA78]];
    id v11 = [(COCapabilityAddOn *)self supportedCapabilities];
    [(COCapabilityAddOn *)self setAvailableCapabilities:v11];
LABEL_7:

    goto LABEL_8;
  }
  v8 = [v6 me];
  id v9 = [v7 leader];
  int v10 = [v8 isEqual:v9];

  if (!v10)
  {
    id v11 = objc_alloc_init(NSDictionary);
    [(COCapabilityAddOn *)self setGatheredCapabilities:v11];
    goto LABEL_7;
  }
  [(COCapabilityAddOn *)self performCapabilitiesUpdate];
LABEL_8:
  v12.receiver = self;
  v12.super_class = (Class)COCapabilityAddOn;
  [(COMeshAddOn *)&v12 meshController:v7 didTransitionToState:a4];
}

- (void)didAddToMeshController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)COCapabilityAddOn;
  [(COMeshAddOn *)&v12 didAddToMeshController:v4];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__COCapabilityAddOn_didAddToMeshController___block_invoke;
  v9[3] = &unk_2645CB778;
  objc_copyWeak(&v10, &location);
  [v4 registerHandler:v9 forRequestClass:objc_opt_class()];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__COCapabilityAddOn_didAddToMeshController___block_invoke_2;
  v7[3] = &unk_2645CB7A0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  [v4 registerHandler:v7 forCommandClass:objc_opt_class()];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__COCapabilityAddOn_didAddToMeshController___block_invoke_3;
  v5[3] = &unk_2645CB7C8;
  objc_copyWeak(&v6, &location);
  [v4 registerHandler:v5 forNotificationClass:objc_opt_class()];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __44__COCapabilityAddOn_didAddToMeshController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleCapabilitiesReadRequest:v8 callback:v5];
  }
}

void __44__COCapabilityAddOn_didAddToMeshController___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) handleCapabilitiesUpdateCommand:v4];
  }
}

void __44__COCapabilityAddOn_didAddToMeshController___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleCapabilitiesUpdateNotification:v5];
  }
}

- (void)willRemoveFromMeshController:(id)a3
{
  id v4 = a3;
  [v4 deregisterHandlerForNotificationClass:objc_opt_class()];
  [v4 deregisterHandlerForCommandClass:objc_opt_class()];
  [v4 deregisterHandlerForRequestClass:objc_opt_class()];
  v5.receiver = self;
  v5.super_class = (Class)COCapabilityAddOn;
  [(COMeshAddOn *)&v5 willRemoveFromMeshController:v4];
}

- (void)didChangeNodesForMeshController:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(COMeshAddOn *)self meshController];
  id v6 = [v5 me];
  v7 = [(COMeshAddOn *)self meshController];
  id v8 = [v7 leader];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = [(COCapabilityAddOn *)self gatheredCapabilities];
    id v11 = (void *)[v10 mutableCopy];

    v34 = self;
    objc_super v12 = [(COMeshAddOn *)self meshController];
    v13 = [v12 nodes];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    long long v42 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      char v17 = 0;
      uint64_t v18 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v14);
          }
          v20 = [*(id *)(*((void *)&v42 + 1) + 8 * i) remote];
          v21 = [v11 objectForKey:v20];
          BOOL v22 = v21 == 0;

          v17 |= v22;
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v16);

      if (v17)
      {
        v23 = COCoreLogForCategory(5);
        self = v34;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v48 = v34;
          _os_log_impl(&dword_2217C1000, v23, OS_LOG_TYPE_DEFAULT, "%p node added, need to perform update", buf, 0xCu);
        }

        [(COCapabilityAddOn *)v34 performCapabilitiesUpdate];
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
    }
    id v33 = v4;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = [v11 allKeys];
    uint64_t v24 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    self = v34;
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __53__COCapabilityAddOn_didChangeNodesForMeshController___block_invoke;
          v37[3] = &unk_2645CB7F0;
          v37[4] = v28;
          if ([v14 indexOfObjectPassingTest:v37] == 0x7FFFFFFFFFFFFFFFLL)
          {
            v29 = [(COMeshAddOn *)self meshController];
            v30 = [v29 me];
            char v31 = [v28 isEqual:v30];

            self = v34;
            if ((v31 & 1) == 0)
            {
              v32 = COCoreLogForCategory(5);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v48 = v34;
                _os_log_impl(&dword_2217C1000, v32, OS_LOG_TYPE_DEFAULT, "%p node removed, dropping gathered Capabilities", buf, 0xCu);
              }

              [v11 removeObjectForKey:v28];
            }
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v25);
    }

    [(COCapabilityAddOn *)self setGatheredCapabilities:v11];
    id v4 = v33;
    goto LABEL_27;
  }
LABEL_28:
  v36.receiver = self;
  v36.super_class = (Class)COCapabilityAddOn;
  [(COMeshAddOn *)&v36 didChangeNodesForMeshController:v4];
}

uint64_t __53__COCapabilityAddOn_didChangeNodesForMeshController___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 remote];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (NSSet)supportedCapabilities
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  int v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__COCapabilityAddOn_supportedCapabilities__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCapabilityAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

uint64_t __42__COCapabilityAddOn_supportedCapabilities__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  return MEMORY[0x270F9A758]();
}

- (void)setSupportedCapabilities:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(COCapabilityAddOn *)self pairLegacyShim];

  if (v5)
  {
    id v6 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = self;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p including Legacy Shim as supported Capability", buf, 0xCu);
    }

    uint64_t v7 = [v4 setByAddingObject:0x26D3D5688];

    id v4 = (id)v7;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke;
  v9[3] = &unk_2645CAE80;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  [(COCapabilityAddOn *)self _withLock:v9];
}

void __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToSet:*(void *)(*(void *)(a1 + 40) + 32)] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;

    uint64_t v5 = [*(id *)(a1 + 40) meshController];
    if (v5)
    {
      id v6 = objc_alloc_init(COCapabilityUpdateCommand);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke_2;
      v7[3] = &unk_2645CB818;
      id v8 = v5;
      [v8 sendCommand:v6 withCompletionHandler:v7];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_setAvailableCapabilities_Unsafe:", *(void *)(*(void *)(a1 + 40) + 32));
    }
  }
}

void __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke_2_cold_1(a1, (uint64_t)v4, v5);
    }
  }
}

- (NSSet)availableCapabilities
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  int v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__COCapabilityAddOn_availableCapabilities__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCapabilityAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

uint64_t __42__COCapabilityAddOn_availableCapabilities__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  return MEMORY[0x270F9A758]();
}

- (void)setAvailableCapabilities:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__COCapabilityAddOn_setAvailableCapabilities___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCapabilityAddOn *)self _withLock:v6];
}

uint64_t __46__COCapabilityAddOn_setAvailableCapabilities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAvailableCapabilities_Unsafe:", *(void *)(a1 + 40));
}

- (NSDictionary)gatheredCapabilities
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  int v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__COCapabilityAddOn_gatheredCapabilities__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCapabilityAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

uint64_t __41__COCapabilityAddOn_gatheredCapabilities__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  return MEMORY[0x270F9A758]();
}

- (void)setGatheredCapabilities:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__COCapabilityAddOn_setGatheredCapabilities___block_invoke;
  v6[3] = &unk_2645CAE80;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(COCapabilityAddOn *)self _withLock:v6];
}

void __45__COCapabilityAddOn_setGatheredCapabilities___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToDictionary:*(void *)(*(void *)(a1 + 40) + 48)] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;

    id v5 = (void *)[*(id *)(*(void *)(a1 + 40) + 32) mutableCopy];
    id v6 = *(void **)(*(void *)(a1 + 40) + 48);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __45__COCapabilityAddOn_setGatheredCapabilities___block_invoke_2;
    v14[3] = &unk_2645CB840;
    id v7 = v5;
    id v15 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v14];
    objc_msgSend(*(id *)(a1 + 40), "_setAvailableCapabilities_Unsafe:", v7);
    id v8 = [*(id *)(a1 + 40) meshController];
    int v9 = [v8 leader];
    id v10 = [v8 me];
    int v11 = [v9 isEqual:v10];

    if (v11)
    {
      objc_super v12 = [[COCapabilityUpdateNotification alloc] initWithCapabilities:v7];
      v13 = [*(id *)(a1 + 40) meshController];
      [v13 sendNotification:v12];
    }
  }
}

uint64_t __45__COCapabilityAddOn_setGatheredCapabilities___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "intersectSet:");
}

- (COCapabilityAddOnDelegate)delegate
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  int v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__COCapabilityAddOn_delegate__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCapabilityAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COCapabilityAddOnDelegate *)v2;
}

uint64_t __29__COCapabilityAddOn_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  return MEMORY[0x270F9A758]();
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__COCapabilityAddOn_setDelegate___block_invoke;
  v6[3] = &unk_2645CAE80;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(COCapabilityAddOn *)self _withLock:v6];
}

void __33__COCapabilityAddOn_setDelegate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
  LOBYTE(v2) = [v2 isEqual:WeakRetained];

  if ((v2 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = (id *)(*(void *)(a1 + 40) + 56);
    objc_storeWeak(v5, v4);
  }
}

- (id)availableCapabilitiesForNode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 remote];
  if (v5) {
    goto LABEL_2;
  }
  id v8 = [(COMeshAddOn *)self meshController];
  id v9 = [v8 listener];

  if (v9 == v4)
  {
    id v5 = [v4 source];
    if (v5)
    {
LABEL_2:
      id v6 = [(COCapabilityAddOn *)self gatheredCapabilities];
      id v7 = [v6 objectForKey:v5];

      goto LABEL_7;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (void)_notifyDelegateCapabilitiesChanged
{
  os_unfair_lock_assert_owner(&self->_lock);
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v3 = objc_loadWeakRetained(&to);
  if (v3)
  {
    id v4 = (void *)[(NSSet *)self->_availableCapabilities copy];
    id v5 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__COCapabilityAddOn__notifyDelegateCapabilitiesChanged__block_invoke;
    v7[3] = &unk_2645CAEF8;
    id v8 = v3;
    id v9 = self;
    id v10 = v4;
    id v6 = v4;
    dispatch_async(v5, v7);
  }
  objc_destroyWeak(&to);
}

uint64_t __55__COCapabilityAddOn__notifyDelegateCapabilitiesChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addOn:*(void *)(a1 + 40) availableCapabilitiesChanged:*(void *)(a1 + 48)];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_setAvailableCapabilities_Unsafe:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(COCapabilityAddOn *)self pairLegacyShim];

  if (v5)
  {
    if ([(COCapabilityAddOn *)self _legacyShimOverridesAvailableCapabilities:v4])
    {
      id v6 = [(COCapabilityAddOn *)self pairLegacyShim];
      v57 = [v6 availableCapabilities];

      id v7 = COCoreLogForCategory(5);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v70 = self;
        __int16 v71 = 2112;
        id v72 = v4;
        __int16 v73 = 2112;
        v74 = v57;
        _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p overriding available Capabilities(%@) with Legacy Shim Capabilities(%@)", buf, 0x20u);
      }
    }
    else
    {
      v57 = v4;
    }
    id v8 = [(COMeshAddOn *)self meshController];
    id v9 = +[COHomeKitAdapter sharedInstance];
    id v10 = [v9 currentAccessory];
    if (!v10)
    {
      int v11 = 0;
LABEL_41:

      id v4 = v57;
      goto LABEL_42;
    }
    int v11 = [v9 homeForAccessory:v10];
    if (!v11) {
      goto LABEL_41;
    }
    objc_super v12 = [v9 mediaSystemForAccessory:v10 inHome:v11];
    if (!v12) {
      goto LABEL_41;
    }
    v13 = v12;
    v58 = [v12 uniqueIdentifier];
    if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v14 = [(COMeshAddOn *)self meshController];
      id v15 = [v14 nodes];

      obuint64_t j = v15;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (!v16)
      {
LABEL_40:

        goto LABEL_41;
      }
      uint64_t v17 = v16;
      v51 = v13;
      v52 = v11;
      v53 = v10;
      v54 = v9;
      v55 = self;
      uint64_t v18 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v64 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          v21 = objc_msgSend(v8, "nodeManager", v51, v52, v53, v54);
          BOOL v22 = [v20 remote];
          v23 = [v21 nodeControllerForConstituent:v22];

          uint64_t v24 = [v23 rapportTransport];
          uint64_t v25 = [v24 client];
          uint64_t v26 = [v25 destinationDevice];

          v27 = [v26 mediaSystemIdentifier];
          v28 = v8;
          int v29 = [v58 isEqual:v27];

          if (v29)
          {
            v30 = [v28 nodes];
            char v31 = [v30 containsObject:v20];

            id v8 = v28;
            if ((v31 & 1) == 0)
            {
              v32 = COCoreLogForCategory(5);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                v70 = v55;
                __int16 v71 = 2112;
                id v72 = v57;
                _os_log_impl(&dword_2217C1000, v32, OS_LOG_TYPE_DEFAULT, "%p overriding available Capabilities(%@) due to legacy peer in pair", buf, 0x16u);
              }

              id v33 = objc_alloc_init(MEMORY[0x263EFFA08]);
              v57 = v33;
            }
          }
          else
          {
            id v8 = v28;
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
      }
      while (v17);
    }
    else
    {
      v51 = v13;
      v52 = v11;
      v53 = v10;
      v54 = v9;
      v55 = self;
      [v8 listener];
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      v34 = [obj nodes];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v60;
        do
        {
          long long v38 = v8;
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v60 != v37) {
              objc_enumerationMutation(v34);
            }
            long long v40 = *(void **)(*((void *)&v59 + 1) + 8 * j);
            long long v41 = [v40 client];
            long long v42 = [v41 destinationDevice];

            long long v43 = [v42 mediaSystemIdentifier];
            int v44 = [v58 isEqual:v43];

            if (v44)
            {
              long long v45 = [v38 nodes];
              char v46 = [v45 containsObject:v40];

              if ((v46 & 1) == 0)
              {
                v47 = COCoreLogForCategory(5);
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  v70 = v55;
                  __int16 v71 = 2112;
                  id v72 = v57;
                  _os_log_impl(&dword_2217C1000, v47, OS_LOG_TYPE_DEFAULT, "%p overriding available Capabilities(%@) due to legacy peer in pair", buf, 0x16u);
                }

                id v48 = objc_alloc_init(MEMORY[0x263EFFA08]);
                v57 = v48;
              }
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v59 objects:v67 count:16];
          id v8 = v38;
        }
        while (v36);
      }
    }
    self = v55;
    id v10 = v53;
    id v9 = v54;
    v13 = v51;
    int v11 = v52;
    goto LABEL_40;
  }
LABEL_42:
  if (([v4 isEqualToSet:self->_availableCapabilities] & 1) == 0)
  {
    v49 = (NSSet *)[v4 copy];
    availableCapabilities = self->_availableCapabilities;
    self->_availableCapabilities = v49;

    [(COCapabilityAddOn *)self _notifyDelegateCapabilitiesChanged];
  }
}

- (void)performCapabilitiesUpdate
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2217C1000, a2, OS_LOG_TYPE_DEBUG, "%p performing Capabilities update", (uint8_t *)&v2, 0xCu);
}

void __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COCoreLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke_cold_1((uint64_t)WeakRetained, v3, v5);
    }

    if ([v3 count])
    {
      id v6 = [WeakRetained supportedCapabilities];
      uint64_t v7 = [v6 copy];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      id v6 = [MEMORY[0x263EFF9A0] dictionary];
      id v10 = [WeakRetained meshController];
      id v9 = [v10 me];

      if (v9)
      {
        int v11 = [WeakRetained supportedCapabilities];
        [v6 setObject:v11 forKey:v9];
      }
      [WeakRetained setGatheredCapabilities:v6];
    }
  }
}

void __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke_30(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_26;
  }
  if (!v10)
  {
LABEL_5:
    uint64_t v14 = [v9 capabilities];
    objc_super v12 = v14;
    if (v14)
    {
      id v15 = v14;
      objc_super v12 = v15;
    }
    else
    {
      id v15 = objc_alloc_init(MEMORY[0x263EFFA08]);
    }
    id v16 = v15;
    goto LABEL_10;
  }
  objc_super v12 = [v10 domain];
  if ([v12 isEqualToString:*MEMORY[0x263F62C18]])
  {
    uint64_t v13 = [v10 code];

    if (v13 != -6714)
    {
      id v16 = 0;
      goto LABEL_11;
    }
    goto LABEL_5;
  }
  id v16 = 0;
LABEL_10:

LABEL_11:
  uint64_t v17 = objc_msgSend(WeakRetained, "gatheredCapabilities", a1);
  uint64_t v18 = (void *)[v17 mutableCopy];

  v19 = [v8 remote];
  id v32 = v8;
  char v31 = v16;
  if (v16) {
    [v18 setObject:v16 forKey:v19];
  }
  else {
    [v18 removeObjectForKey:v19];
  }

  v20 = [WeakRetained meshController];
  v21 = [v20 nodes];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  BOOL v22 = [v18 allKeys];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke_2;
        v33[3] = &unk_2645CB7F0;
        v33[4] = v27;
        if ([v21 indexOfObjectPassingTest:v33] == 0x7FFFFFFFFFFFFFFFLL) {
          [v18 removeObjectForKey:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v24);
  }

  v28 = [WeakRetained meshController];
  int v29 = [v28 me];

  if (v29) {
    [v18 setObject:*(void *)(*(void *)(*(void *)(v30 + 32) + 8) + 40) forKey:v29];
  }
  [WeakRetained setGatheredCapabilities:v18];

  id v8 = v32;
LABEL_26:
}

uint64_t __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 remote];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)handleCapabilitiesReadRequest:(id)a3 callback:(id)a4
{
  id v5 = (void (**)(id, COCapabilityReadResponse *, void))a4;
  id v6 = [(COCapabilityAddOn *)self supportedCapabilities];
  uint64_t v7 = [[COCapabilityReadResponse alloc] initWithCapabilities:v6];
  v5[2](v5, v7, 0);
}

- (void)handleCapabilitiesUpdateNotification:(id)a3
{
  id v4 = [a3 capabilities];
  [(COCapabilityAddOn *)self setAvailableCapabilities:v4];
}

- (void)_enableForPairLegacySupport
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__COCapabilityAddOn__enableForPairLegacySupport__block_invoke;
  v4[3] = &unk_2645CB288;
  v4[4] = self;
  [(COCapabilityAddOn *)self _withLock:v4];
  id v3 = [(COCapabilityAddOn *)self supportedCapabilities];
  [(COCapabilityAddOn *)self setSupportedCapabilities:v3];
}

uint64_t __48__COCapabilityAddOn__enableForPairLegacySupport__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = [[COCapabilityLegacyShim alloc] initWithDelegate:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

- (void)legacyShim:(id)a3 availableCapabilitiesChanged:(id)a4
{
  id v5 = [(COMeshAddOn *)self meshControllerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__COCapabilityAddOn_legacyShim_availableCapabilitiesChanged___block_invoke;
  block[3] = &unk_2645CB288;
  block[4] = self;
  dispatch_async(v5, block);
}

void __61__COCapabilityAddOn_legacyShim_availableCapabilitiesChanged___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [v2 availableCapabilities];
  LODWORD(v2) = [v2 _legacyShimOverridesAvailableCapabilities:v3];

  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 availableCapabilities];
    [v4 setAvailableCapabilities:v5];
  }
}

- (BOOL)_legacyShimOverridesAvailableCapabilities:(id)a3
{
  id v4 = a3;
  id v5 = [(COCapabilityAddOn *)self pairLegacyShim];
  if (v5)
  {
    id v6 = [(COMeshAddOn *)self meshController];
    if (v6) {
      int v7 = [v4 containsObject:0x26D3D5688] ^ 1;
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  id v8 = COCoreLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(COCapabilityAddOn *)(uint64_t)self _legacyShimOverridesAvailableCapabilities:v8];
  }

  return v7;
}

- (COCapabilityLegacyShim)pairLegacyShim
{
  return self->_pairLegacyShim;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairLegacyShim, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gatheredCapabilities, 0);
  objc_storeStrong((id *)&self->_availableCapabilities, 0);
  objc_storeStrong((id *)&self->_supportedCapabilities, 0);
}

void __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2217C1000, log, OS_LOG_TYPE_ERROR, "%p failed to force update capabilities (%@)", (uint8_t *)&v4, 0x16u);
}

void __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 134218240;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 count];
  _os_log_debug_impl(&dword_2217C1000, a3, OS_LOG_TYPE_DEBUG, "%p update request sent to %lu recipients", (uint8_t *)&v4, 0x16u);
}

- (void)_legacyShimOverridesAvailableCapabilities:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2) {
    int v3 = 89;
  }
  else {
    int v3 = 78;
  }
  int v4 = 134218240;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "%p allowing Legacy Shim override: %c", (uint8_t *)&v4, 0x12u);
}

@end