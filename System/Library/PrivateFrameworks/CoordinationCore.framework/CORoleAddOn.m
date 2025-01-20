@interface CORoleAddOn
- (BOOL)_isLegacyStereoPair;
- (BOOL)_isLegacyStereoPairPeer:(id)a3;
- (BOOL)havePendingChanges;
- (COClusterMemberRoleSnapshot)currentDeviceSnapshot;
- (CORoleAddOn)init;
- (CORoleAddOnDelegate)delegate;
- (CORoleDefaultsMonitor)defaultsMonitor;
- (NSSet)nodeCache;
- (OS_dispatch_queue)delegateQueue;
- (id)_memberForCurrentDevice;
- (id)_memberForNode:(id)a3;
- (id)_roleForCurrentDevice;
- (id)_roleForNode:(id)a3;
- (void)_enableForPairLegacySupport;
- (void)_notifyDelegate;
- (void)_updateCurrentDeviceState;
- (void)_updateState;
- (void)_withLock:(id)a3;
- (void)didChangeNodesForMeshController:(id)a3;
- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)meshController:(id)a3 willTransitionToState:(unint64_t)a4;
- (void)monitor:(id)a3 defaultChanged:(unint64_t)a4;
- (void)setCurrentDeviceSnapshot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNodeCache:(id)a3;
- (void)setPendingChanges:(BOOL)a3;
@end

@implementation CORoleAddOn

- (CORoleAddOn)init
{
  v15.receiver = self;
  v15.super_class = (Class)CORoleAddOn;
  v2 = [(COMeshAddOn *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    defaultsMonitor = v2->_defaultsMonitor;
    v2->_defaultsMonitor = 0;

    v5 = [(CORoleAddOn *)v3 _memberForCurrentDevice];
    v6 = [MEMORY[0x263F33F68] roleForUnknown];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F33F58]) initWithMember:v5 role:v6];
    currentDeviceSnapshot = v3->_currentDeviceSnapshot;
    v3->_currentDeviceSnapshot = (COClusterMemberRoleSnapshot *)v7;

    uint64_t v9 = [MEMORY[0x263EFFA08] set];
    nodeCache = v3->_nodeCache;
    v3->_nodeCache = (NSSet *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.coordination.CORoleAddOn.delegateQueue", v11);
    delegateQueue = v3->_delegateQueue;
    v3->_delegateQueue = (OS_dispatch_queue *)v12;

    v3->_pendingChanges = 1;
    [(CORoleAddOn *)v3 _notifyDelegate];
  }
  return v3;
}

- (void)_enableForPairLegacySupport
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [[CORoleDefaultsMonitor alloc] initWithDelegate:self];
  defaultsMonitor = self->_defaultsMonitor;
  self->_defaultsMonitor = v3;

  v5 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(CORoleAddOn *)self defaultsMonitor];
    int v7 = 134218240;
    v8 = self;
    __int16 v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p add-on using monitor %p for local role in pair", (uint8_t *)&v7, 0x16u);
  }
  [(CORoleDefaultsMonitor *)self->_defaultsMonitor activate];
}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CORoleAddOn;
  -[COMeshAddOn meshController:didTransitionToState:](&v6, sel_meshController_didTransitionToState_, a3);
  if (a4 == 3)
  {
    [(CORoleAddOn *)self _updateCurrentDeviceState];
    [(CORoleAddOn *)self _updateState];
    [(CORoleAddOn *)self _notifyDelegate];
  }
}

- (void)didChangeNodesForMeshController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CORoleAddOn;
  [(COMeshAddOn *)&v4 didChangeNodesForMeshController:a3];
  [(CORoleAddOn *)self _updateCurrentDeviceState];
  [(CORoleAddOn *)self _updateState];
  [(CORoleAddOn *)self _notifyDelegate];
}

- (void)meshController:(id)a3 willTransitionToState:(unint64_t)a4
{
  id v6 = a3;
  [(CORoleAddOn *)self _updateCurrentDeviceState];
  v7.receiver = self;
  v7.super_class = (Class)CORoleAddOn;
  [(COMeshAddOn *)&v7 meshController:v6 willTransitionToState:a4];
}

- (void)monitor:(id)a3 defaultChanged:(unint64_t)a4
{
  [(CORoleAddOn *)self _updateCurrentDeviceState];
  [(CORoleAddOn *)self _updateState];
  [(CORoleAddOn *)self _notifyDelegate];
}

- (void)_updateState
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __27__CORoleAddOn__updateState__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(CORoleAddOn *)self _withLock:v2];
}

void __27__CORoleAddOn__updateState__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [*(id *)(a1 + 32) meshController];
  objc_super v4 = [v3 nodes];
  v5 = [v2 setWithArray:v4];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v11 = [*(id *)(a1 + 32) _memberForNode:v10];
        dispatch_queue_t v12 = [*(id *)(a1 + 32) _roleForNode:v10];
        v13 = (void *)[objc_alloc(MEMORY[0x263F33F58]) initWithMember:v11 role:v12];
        v14 = [v10 memberSnapshot];
        char v15 = [v13 isEqual:v14];

        if ((v15 & 1) == 0)
        {
          [v10 setMemberSnapshot:v13];
          *(unsigned char *)(*(void *)(a1 + 32) + 28) = 1;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  v16 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) mutableCopy];
  [v16 minusSet:obj];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v26 + 1) + 8 * j) memberSnapshot];
        [v22 setStale:1];

        *(unsigned char *)(*(void *)(a1 + 32) + 28) = 1;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }

  uint64_t v23 = *(void *)(a1 + 32);
  v24 = *(void **)(v23 + 56);
  *(void *)(v23 + 56) = obj;
}

- (void)_updateCurrentDeviceState
{
  v3 = [(COMeshAddOn *)self meshController];
  objc_super v4 = [v3 nodeForMe];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__CORoleAddOn__updateCurrentDeviceState__block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CORoleAddOn *)self _withLock:v6];
}

void __40__CORoleAddOn__updateCurrentDeviceState__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _roleForCurrentDevice];
  v3 = [*(id *)(*(void *)(a1 + 32) + 48) role];
  if (([v3 isEqual:v2] & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_super v4 = *(void **)(a1 + 40);
  if (!v4)
  {
LABEL_9:

    goto LABEL_10;
  }
  id v5 = [v4 memberSnapshot];

  if (!v5)
  {
LABEL_6:
    uint64_t v6 = COCoreLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 134218242;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      char v15 = v2;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p add-on updated local device Role(%@)", (uint8_t *)&v12, 0x16u);
    }

    v3 = [*(id *)(*(void *)(a1 + 32) + 48) member];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F33F58]) initWithMember:v3 role:v2];
    [*(id *)(*(void *)(a1 + 32) + 48) setStale:1];
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v8;
    id v11 = v8;

    *(unsigned char *)(*(void *)(a1 + 32) + 28) = 1;
    [*(id *)(a1 + 40) setMemberSnapshot:v11];

    goto LABEL_9;
  }
LABEL_10:
}

- (id)_memberForCurrentDevice
{
  return (id)[MEMORY[0x263F33F50] memberForCurrentDevice];
}

- (id)_memberForNode:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshAddOn *)self meshController];
  uint64_t v6 = [v5 nodeForMe];

  if ([v4 isEqual:v6])
  {
    uint64_t v7 = [(CORoleAddOn *)self _memberForCurrentDevice];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v9 = [v4 HomeKitIdentifier];
    v10 = v9;
    if (v9)
    {
      id v11 = [v9 UUIDString];
      [v8 setObject:v11 forKey:@"accessory"];
    }
    int v12 = [v4 IDSIdentifier];
    if (v12) {
      [v8 setObject:v12 forKey:@"IDS"];
    }
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F33F50]) initWithType:3 deviceMetadata:v8];
  }
  return v7;
}

- (id)_roleForCurrentDevice
{
  v3 = [(CORoleAddOn *)self defaultsMonitor];
  id v4 = v3;
  if (v3 && (unint64_t v5 = [v3 result] - 1, v5 <= 2)) {
    uint64_t v6 = qword_22188FFC0[v5];
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v6 | 0x10;
  uint64_t v8 = [(COMeshAddOn *)self meshController];
  char v9 = [v8 clusterOptions];

  if (v9)
  {
    v10 = [(COMeshAddOn *)self meshController];
    id v11 = [v10 me];
    int v12 = [(COMeshAddOn *)self meshController];
    uint64_t v13 = [v12 leader];
    int v14 = [v11 isEqual:v13];

    if (v14) {
      uint64_t v7 = v6 | 0x18;
    }
  }
  char v15 = (void *)[objc_alloc(MEMORY[0x263F33F68]) initWithRoleFlags:v7];

  return v15;
}

- (id)_roleForNode:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(COMeshAddOn *)self meshController];
  uint64_t v6 = [v5 nodeForMe];

  if ([v4 isEqual:v6])
  {
    uint64_t v7 = [(CORoleAddOn *)self _roleForCurrentDevice];
  }
  else
  {
    if ([(CORoleAddOn *)self _isLegacyStereoPair]
      && [(CORoleAddOn *)self _isLegacyStereoPairPeer:v4])
    {
      uint64_t v8 = [(COClusterMemberRoleSnapshot *)self->_currentDeviceSnapshot role];
      if (([v8 flags] & 4) != 0) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 4;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v10 = v9 | 0x10;
    id v11 = [(COMeshAddOn *)self meshController];
    char v12 = [v11 clusterOptions];

    if (v12)
    {
      uint64_t v13 = [v4 remote];
      int v14 = [(COMeshAddOn *)self meshController];
      char v15 = [v14 leader];
      int v16 = [v13 isEqual:v15];

      if (v16) {
        uint64_t v10 = v9 | 0x18;
      }
    }
    uint64_t v7 = [objc_alloc(MEMORY[0x263F33F68]) initWithRoleFlags:v10];
  }
  id v17 = (void *)v7;

  return v17;
}

- (BOOL)_isLegacyStereoPair
{
  v2 = [(CORoleAddOn *)self defaultsMonitor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_isLegacyStereoPairPeer:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[COHomeKitAdapter sharedInstance];
  uint64_t v6 = [v5 currentAccessory];
  if (!v6)
  {
    uint64_t v7 = 0;
LABEL_7:
    char v18 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [v5 homeForAccessory:v6];
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v8 = [v5 mediaSystemForAccessory:v6 inHome:v7];
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = v8;
  uint64_t v10 = [v8 uniqueIdentifier];
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    id v11 = [(COMeshAddOn *)self meshController];
    char v12 = [v11 nodeManager];
    uint64_t v13 = [v4 remote];
    int v14 = [v12 nodeControllerForConstituent:v13];

    char v15 = [v14 rapportTransport];
    int v16 = [v15 client];
    id v17 = [v16 destinationDevice];
  }
  else
  {
    int v14 = [v4 client];
    id v17 = [v14 destinationDevice];
  }

  uint64_t v19 = [v17 mediaSystemIdentifier];
  char v18 = [v10 isEqual:v19];

LABEL_10:
  return v18;
}

- (CORoleAddOnDelegate)delegate
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__20;
  uint64_t v9 = __Block_byref_object_dispose__20;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __23__CORoleAddOn_delegate__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(CORoleAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CORoleAddOnDelegate *)v2;
}

uint64_t __23__CORoleAddOn_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
  return MEMORY[0x270F9A758](WeakRetained, v4);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __27__CORoleAddOn_setDelegate___block_invoke;
  uint64_t v9 = &unk_2645CAE80;
  id v10 = v4;
  id v11 = self;
  id v5 = v4;
  [(CORoleAddOn *)self _withLock:&v6];
  [(CORoleAddOn *)self _notifyDelegate];
}

void __27__CORoleAddOn_setDelegate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  LOBYTE(v2) = [v2 isEqual:WeakRetained];

  if ((v2 & 1) == 0)
  {
    objc_storeWeak((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 32));
    if (*(void *)(a1 + 32)) {
      *(unsigned char *)(*(void *)(a1 + 40) + 28) = 1;
    }
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_notifyDelegate
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __30__CORoleAddOn__notifyDelegate__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(CORoleAddOn *)self _withLock:v2];
}

void __30__CORoleAddOn__notifyDelegate__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 28))
  {
    objc_copyWeak(&to, (id *)(v1 + 32));
    id v3 = objc_loadWeakRetained(&to);
    if (v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [v4 addObject:*(void *)(*(void *)(a1 + 32) + 48)];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v5 = *(id *)(*(void *)(a1 + 32) + 56);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v19;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v19 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = [*(id *)(*((void *)&v18 + 1) + 8 * v8) memberSnapshot];
            if (v9) {
              [v4 addObject:v9];
            }

            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v6);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 28) = 0;
      id v10 = *(NSObject **)(*(void *)(a1 + 32) + 64);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __30__CORoleAddOn__notifyDelegate__block_invoke_2;
      block[3] = &unk_2645CAEF8;
      id v11 = v3;
      uint64_t v12 = *(void *)(a1 + 32);
      id v15 = v11;
      uint64_t v16 = v12;
      id v17 = v4;
      id v13 = v4;
      dispatch_async(v10, block);
    }
    objc_destroyWeak(&to);
  }
}

uint64_t __30__CORoleAddOn__notifyDelegate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addOn:*(void *)(a1 + 40) stateChanged:*(void *)(a1 + 48)];
}

- (CORoleDefaultsMonitor)defaultsMonitor
{
  return self->_defaultsMonitor;
}

- (COClusterMemberRoleSnapshot)currentDeviceSnapshot
{
  return self->_currentDeviceSnapshot;
}

- (void)setCurrentDeviceSnapshot:(id)a3
{
}

- (NSSet)nodeCache
{
  return self->_nodeCache;
}

- (void)setNodeCache:(id)a3
{
}

- (BOOL)havePendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(BOOL)a3
{
  self->_pendingChanges = a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_nodeCache, 0);
  objc_storeStrong((id *)&self->_currentDeviceSnapshot, 0);
  objc_storeStrong((id *)&self->_defaultsMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end