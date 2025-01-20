@interface CORoleService
+ (id)serviceWithDelegate:(id)a3;
- (BOOL)_applicableToCluster:(id)a3;
- (CORoleService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5;
- (NSDictionary)memberObservers;
- (NSDictionary)roleObservers;
- (NSDictionary)snapshotObservers;
- (NSDictionary)snapshotState;
- (id)_membersWithRole:(id)a3 inCluster:(id)a4;
- (id)_membersWithRole:(id)a3 inSnapshots:(id)a4;
- (id)_remoteInterfaceForClient:(id)a3 withErrorHandler:(id)a4;
- (id)_roleOfMember:(id)a3 inCluster:(id)a4;
- (id)_roleOfMember:(id)a3 inSnapshots:(id)a4;
- (id)_snapshotsForCluster:(id)a3;
- (void)_addMemberObserverForClient:(id)a3 ofRole:(id)a4 inCluster:(id)a5;
- (void)_addOnAdded:(id)a3;
- (void)_addOnRemoved:(id)a3;
- (void)_addRoleObserverForClient:(id)a3 ofMember:(id)a4 inCluster:(id)a5;
- (void)_addSnapshotObserverForClient:(id)a3 inCluster:(id)a4;
- (void)_clientLost:(id)a3;
- (void)_configureServiceInterfacesOnConnection:(id)a3;
- (void)_identifyAndNotifyMemberChangesFromSnapshot:(id)a3 inCluster:(id)a4;
- (void)_identifyAndNotifyRoleChangesFromSnapshot:(id)a3 inCluster:(id)a4;
- (void)_notifyMemberObserver:(id)a3 membersWithRole:(id)a4 inCluster:(id)a5 didChangeTo:(id)a6;
- (void)_notifyMemberObserversMembersWithRole:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5;
- (void)_notifyRoleObserver:(id)a3 roleOfMember:(id)a4 inCluster:(id)a5 didChangeTo:(id)a6;
- (void)_notifyRoleObserversRoleOfMember:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5;
- (void)_notifySnapshotObserver:(id)a3 snapshotOfCluster:(id)a4 didChangeTo:(id)a5;
- (void)_notifySnapshotObserversSnapshotOfCluster:(id)a3 didChangeTo:(id)a4;
- (void)_removeMemberObserverForClient:(id)a3 ofRole:(id)a4 inCluster:(id)a5;
- (void)_removeRoleObserverForClient:(id)a3 ofMember:(id)a4 inCluster:(id)a5;
- (void)_removeSnapshotObserverForClient:(id)a3 inCluster:(id)a4;
- (void)_updateSnapshots:(id)a3 inCluster:(id)a4;
- (void)addOn:(id)a3 stateChanged:(id)a4;
- (void)registerForMemberChangesWithRole:(id)a3 inCluster:(id)a4;
- (void)registerForRoleChangesOfMember:(id)a3 inCluster:(id)a4;
- (void)registerForSnapshotChangesInCluster:(id)a3;
- (void)setMemberObservers:(id)a3;
- (void)setRoleObservers:(id)a3;
- (void)setSnapshotObservers:(id)a3;
- (void)setSnapshotState:(id)a3;
- (void)unregisterForMemberChangesWithRole:(id)a3 inCluster:(id)a4;
- (void)unregisterForRoleChangesOfMember:(id)a3 inCluster:(id)a4;
- (void)unregisterForSnapshotChangesInCluster:(id)a3;
@end

@implementation CORoleService

+ (id)serviceWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[COServiceListenerProvider alloc] initWithServiceName:@"com.apple.coordination.role" entitlement:@"com.apple.private.coordination.role"];
  v5 = objc_alloc_init(CORoleAddOnProvider);
  v6 = [[CORoleService alloc] initWithListenerProvider:v4 addOnProvider:v5 delegate:v3];

  return v6;
}

- (CORoleService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CORoleService;
  v5 = [(COService *)&v15 initWithListenerProvider:a3 addOnProvider:a4 delegate:a5];
  if (v5)
  {
    uint64_t v6 = [NSDictionary dictionary];
    snapshotState = v5->_snapshotState;
    v5->_snapshotState = (NSDictionary *)v6;

    uint64_t v8 = [NSDictionary dictionary];
    roleObservers = v5->_roleObservers;
    v5->_roleObservers = (NSDictionary *)v8;

    uint64_t v10 = [NSDictionary dictionary];
    memberObservers = v5->_memberObservers;
    v5->_memberObservers = (NSDictionary *)v10;

    uint64_t v12 = [NSDictionary dictionary];
    snapshotObservers = v5->_snapshotObservers;
    v5->_snapshotObservers = (NSDictionary *)v12;

    [(COService *)v5 _serviceReady];
  }
  return v5;
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CORoleService;
  id v4 = a3;
  [(COService *)&v16 _configureServiceInterfacesOnConnection:v4];
  v5 = (void *)MEMORY[0x263F08D80];
  uint64_t v6 = &unk_26D3FD8A0;
  v7 = [v5 interfaceWithProtocol:v6];
  [v4 setExportedInterface:v7];
  [v4 setExportedObject:self];
  uint64_t v8 = &unk_26D4099C8;

  v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:v8];

  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0, v16.receiver, v16.super_class);
  [v9 setClasses:v12 forSelector:sel_membersWithRole_inCluster_didChangeTo_ argumentIndex:2 ofReply:0];
  v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  objc_super v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [v9 setClasses:v15 forSelector:sel_snapshotOfCluster_didChangeTo_ argumentIndex:1 ofReply:0];

  [v4 setRemoteObjectInterface:v9];
}

- (void)_clientLost:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CORoleService;
  id v4 = a3;
  [(COService *)&v5 _clientLost:v4];
  -[CORoleService _removeRoleObserverForClient:ofMember:inCluster:](self, "_removeRoleObserverForClient:ofMember:inCluster:", v4, 0, 0, v5.receiver, v5.super_class);
  [(CORoleService *)self _removeMemberObserverForClient:v4 ofRole:0 inCluster:0];
  [(CORoleService *)self _removeSnapshotObserverForClient:v4 inCluster:0];
}

- (void)_addOnAdded:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F33F40] pairCluster];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        uint64_t v12 = [MEMORY[0x263EFFA08] set];
        [(CORoleService *)self _updateSnapshots:v12 inCluster:v11];

        if ([v5 isEqual:v11]) {
          [v4 _enableForPairLegacySupport];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [v4 setDelegate:self];
}

- (void)_addOnRemoved:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setDelegate:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v5 = -[COService _clustersForAddOn:](self, "_clustersForAddOn:", v4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CORoleService *)self _updateSnapshots:0 inCluster:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)_applicableToCluster:(id)a3
{
  id v3 = [a3 configuration];
  BOOL v4 = ([v3 requiredServices] & 0xC) != 0;

  return v4;
}

- (void)registerForRoleChangesOfMember:(id)a3 inCluster:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(COService *)self currentClient];
  if (v7)
  {
    uint64_t v8 = [(CORoleService *)self _roleOfMember:v9 inCluster:v6];
    [(CORoleService *)self _notifyRoleObserver:v7 roleOfMember:v9 inCluster:v6 didChangeTo:v8];
    [(CORoleService *)self _addRoleObserverForClient:v7 ofMember:v9 inCluster:v6];
  }
}

- (void)unregisterForRoleChangesOfMember:(id)a3 inCluster:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(COService *)self currentClient];
  if (v7) {
    [(CORoleService *)self _removeRoleObserverForClient:v7 ofMember:v8 inCluster:v6];
  }
}

- (void)registerForMemberChangesWithRole:(id)a3 inCluster:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(COService *)self currentClient];
  if (v7)
  {
    id v8 = [(CORoleService *)self _membersWithRole:v9 inCluster:v6];
    [(CORoleService *)self _notifyMemberObserver:v7 membersWithRole:v9 inCluster:v6 didChangeTo:v8];
    [(CORoleService *)self _addMemberObserverForClient:v7 ofRole:v9 inCluster:v6];
  }
}

- (void)unregisterForMemberChangesWithRole:(id)a3 inCluster:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(COService *)self currentClient];
  if (v7) {
    [(CORoleService *)self _removeMemberObserverForClient:v7 ofRole:v8 inCluster:v6];
  }
}

- (void)registerForSnapshotChangesInCluster:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(COService *)self currentClient];
  if (v4)
  {
    objc_super v5 = [(CORoleService *)self _snapshotsForCluster:v6];
    [(CORoleService *)self _notifySnapshotObserver:v4 snapshotOfCluster:v6 didChangeTo:v5];
    [(CORoleService *)self _addSnapshotObserverForClient:v4 inCluster:v6];
  }
}

- (void)unregisterForSnapshotChangesInCluster:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(COService *)self currentClient];
  if (v4) {
    [(CORoleService *)self _removeSnapshotObserverForClient:v4 inCluster:v5];
  }
}

- (void)addOn:(id)a3 stateChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CORoleService_addOn_stateChanged___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __36__CORoleService_addOn_stateChanged___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [*(id *)(a1 + 32) _clustersForAddOn:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v8 = COCoreLogForCategory(4);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          uint64_t v10 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 134218498;
          uint64_t v16 = v9;
          __int16 v17 = 2112;
          uint64_t v18 = v7;
          __int16 v19 = 2112;
          uint64_t v20 = v10;
          _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p Snapshot changed in Cluster(%@), now %@", buf, 0x20u);
        }

        [*(id *)(a1 + 32) _updateSnapshots:*(void *)(a1 + 48) inCluster:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v21 count:16];
    }
    while (v4);
  }
}

- (void)_updateSnapshots:(id)a3 inCluster:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218498;
    long long v14 = self;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p will process snapshot update for Cluster(%@) to Snapshots(%@)", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v9 = [(CORoleService *)self _snapshotsForCluster:v7];
  uint64_t v10 = [(CORoleService *)self snapshotState];
  long long v11 = (void *)[v10 mutableCopy];

  if (v6)
  {
    [v11 setObject:v6 forKey:v7];
  }
  else
  {
    long long v12 = COCoreLogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      long long v14 = self;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%p removing snaphots for Cluster(%@)", (uint8_t *)&v13, 0x16u);
    }

    [v11 removeObjectForKey:v7];
    id v6 = [MEMORY[0x263EFFA08] set];
  }
  [(CORoleService *)self setSnapshotState:v11];
  [(CORoleService *)self _notifySnapshotObserversSnapshotOfCluster:v7 didChangeTo:v6];
  [(CORoleService *)self _identifyAndNotifyMemberChangesFromSnapshot:v9 inCluster:v7];
  [(CORoleService *)self _identifyAndNotifyRoleChangesFromSnapshot:v9 inCluster:v7];
}

- (void)_identifyAndNotifyRoleChangesFromSnapshot:(id)a3 inCluster:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CORoleService *)self roleObservers];
  uint64_t v9 = [v8 objectForKey:v7];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v16 = -[CORoleService _roleOfMember:inSnapshots:](self, "_roleOfMember:inSnapshots:", v15, v6, (void)v18);
        __int16 v17 = [(CORoleService *)self _roleOfMember:v15 inCluster:v7];
        if (([v17 isEqual:v16] & 1) == 0) {
          [(CORoleService *)self _notifyRoleObserversRoleOfMember:v15 inCluster:v7 didChangeTo:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)_identifyAndNotifyMemberChangesFromSnapshot:(id)a3 inCluster:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CORoleService *)self memberObservers];
  uint64_t v9 = [v8 objectForKey:v7];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v49;
    v33 = self;
    id v34 = v6;
    uint64_t v31 = *(void *)v49;
    id v32 = v7;
    do
    {
      uint64_t v13 = 0;
      uint64_t v35 = v11;
      do
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 8 * v13);
        uint64_t v15 = [(CORoleService *)self _membersWithRole:v14 inSnapshots:v6];
        id v16 = [(CORoleService *)self _membersWithRole:v14 inCluster:v7];
        uint64_t v17 = [v15 count];
        if (v17 != [v16 count]) {
          goto LABEL_25;
        }
        uint64_t v39 = v14;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v18 = v15;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v37 = v13;
          v38 = v15;
          uint64_t v21 = *(void *)v45;
          while (1)
          {
            uint64_t v22 = 0;
LABEL_10:
            if (*(void *)v45 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = v18;
            v24 = *(void **)(*((void *)&v44 + 1) + 8 * v22);
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v25 = v16;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v52 count:16];
            if (!v26) {
              break;
            }
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v41;
LABEL_14:
            uint64_t v29 = 0;
            while (1)
            {
              if (*(void *)v41 != v28) {
                objc_enumerationMutation(v25);
              }
              if ([v24 isSameDeviceAsMember:*(void *)(*((void *)&v40 + 1) + 8 * v29)]) {
                break;
              }
              if (v27 == ++v29)
              {
                uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v52 count:16];
                if (v27) {
                  goto LABEL_14;
                }
                goto LABEL_24;
              }
            }

            ++v22;
            id v18 = v23;
            if (v22 != v20) {
              goto LABEL_10;
            }
            uint64_t v20 = [v23 countByEnumeratingWithState:&v44 objects:v53 count:16];
            if (!v20)
            {

              self = v33;
              id v6 = v34;
              uint64_t v12 = v31;
              id v7 = v32;
              uint64_t v11 = v35;
              uint64_t v13 = v37;
              uint64_t v15 = v38;
              goto LABEL_26;
            }
          }
LABEL_24:

          self = v33;
          id v6 = v34;
          uint64_t v12 = v31;
          id v7 = v32;
          uint64_t v11 = v35;
          uint64_t v15 = v38;
          uint64_t v14 = v39;
          uint64_t v13 = v37;
LABEL_25:
          [(CORoleService *)self _notifyMemberObserversMembersWithRole:v14 inCluster:v7 didChangeTo:v16];
          goto LABEL_26;
        }

LABEL_26:
        ++v13;
      }
      while (v13 != v11);
      uint64_t v30 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      uint64_t v11 = v30;
    }
    while (v30);
  }
}

- (id)_roleOfMember:(id)a3 inCluster:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CORoleService *)self _snapshotsForCluster:v7];
  uint64_t v9 = [(CORoleService *)self _roleOfMember:v6 inSnapshots:v8];
  if ([v9 isUnknown]
    && +[CODeviceClass isAudioAccessory])
  {
    uint64_t v10 = [MEMORY[0x263F33F40] pairCluster];
    if ([v7 isEqual:v10])
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x263F33F68]) initWithRoleFlags:1];

      uint64_t v9 = (void *)v11;
    }
  }
  uint64_t v12 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218754;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    _os_log_debug_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEBUG, "%p Member(%@) in Cluster(%@) has Role(%@)", (uint8_t *)&v14, 0x2Au);
  }

  return v9;
}

- (id)_roleOfMember:(id)a3 inSnapshots:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
      uint64_t v13 = objc_msgSend(v12, "member", (void)v18);
      char v14 = [v13 isSameDeviceAsMember:v6];

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v30 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v15 = [v12 role];

    if (v15) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  uint64_t v15 = objc_msgSend(MEMORY[0x263F33F68], "roleForUnknown", (void)v18);
  __int16 v16 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v23 = self;
    __int16 v24 = 2112;
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_error_impl(&dword_2217C1000, v16, OS_LOG_TYPE_ERROR, "%p synthesized Role(%@) for Member(%@) missing from Snapshots(%@)", buf, 0x2Au);
  }

LABEL_14:
  return v15;
}

- (id)_membersWithRole:(id)a3 inCluster:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CORoleService *)self _snapshotsForCluster:v7];
  uint64_t v9 = [(CORoleService *)self _membersWithRole:v6 inSnapshots:v8];
  uint64_t v10 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218754;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_debug_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEBUG, "%p Role(%@) is associated with Members(%@) in Cluster(%@)", (uint8_t *)&v12, 0x2Au);
  }

  return v9;
}

- (id)_membersWithRole:(id)a3 inSnapshots:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        __int16 v14 = objc_msgSend(v13, "role", (void)v17);
        if ([v14 satisfiesRole:v5])
        {
          id v15 = [v13 member];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_snapshotsForCluster:(id)a3
{
  id v4 = a3;
  id v5 = [(CORoleService *)self snapshotState];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = [MEMORY[0x263EFFA08] set];
  }
  return v6;
}

- (void)_notifyRoleObserversRoleOfMember:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CORoleService *)self roleObservers];
  int v12 = [v11 objectForKey:v9];

  uint64_t v13 = [v12 objectForKey:v8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [(CORoleService *)self _notifyRoleObserver:*(void *)(*((void *)&v18 + 1) + 8 * v17++) roleOfMember:v8 inCluster:v9 didChangeTo:v10];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)_notifyMemberObserversMembersWithRole:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CORoleService *)self memberObservers];
  int v12 = [v11 objectForKey:v9];

  uint64_t v13 = [v12 objectForKey:v8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [(CORoleService *)self _notifyMemberObserver:*(void *)(*((void *)&v18 + 1) + 8 * v17++) membersWithRole:v8 inCluster:v9 didChangeTo:v10];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)_notifySnapshotObserversSnapshotOfCluster:(id)a3 didChangeTo:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CORoleService *)self snapshotObservers];
  id v9 = [v8 objectForKey:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[CORoleService _notifySnapshotObserver:snapshotOfCluster:didChangeTo:](self, "_notifySnapshotObserver:snapshotOfCluster:didChangeTo:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), v6, v7, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)_notifyRoleObserver:(id)a3 roleOfMember:(id)a4 inCluster:(id)a5 didChangeTo:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  long long v19 = __72__CORoleService__notifyRoleObserver_roleOfMember_inCluster_didChangeTo___block_invoke;
  uint64_t v20 = &unk_2645CC258;
  long long v21 = self;
  id v14 = v10;
  id v22 = v14;
  long long v15 = [(CORoleService *)self _remoteInterfaceForClient:v14 withErrorHandler:&v17];
  long long v16 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    __int16 v24 = self;
    __int16 v25 = 2112;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v12;
    _os_log_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEFAULT, "%p change notification to Client(%@) for Role(%@) of Member(%@) in Cluster(%@)", buf, 0x34u);
  }

  objc_msgSend(v15, "roleOfMember:inCluster:didChangeTo:", v11, v12, v13, v17, v18, v19, v20, v21);
}

void __72__CORoleService__notifyRoleObserver_roleOfMember_inCluster_didChangeTo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __72__CORoleService__notifyRoleObserver_roleOfMember_inCluster_didChangeTo___block_invoke_cold_1();
  }
}

- (void)_notifyMemberObserver:(id)a3 membersWithRole:(id)a4 inCluster:(id)a5 didChangeTo:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  long long v19 = __77__CORoleService__notifyMemberObserver_membersWithRole_inCluster_didChangeTo___block_invoke;
  uint64_t v20 = &unk_2645CC258;
  long long v21 = self;
  id v14 = v10;
  id v22 = v14;
  long long v15 = [(CORoleService *)self _remoteInterfaceForClient:v14 withErrorHandler:&v17];
  long long v16 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    __int16 v24 = self;
    __int16 v25 = 2112;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v12;
    _os_log_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEFAULT, "%p change notification to Client(%@) for Members(%@) with Role(%@) in Cluster(%@)", buf, 0x34u);
  }

  objc_msgSend(v15, "membersWithRole:inCluster:didChangeTo:", v11, v12, v13, v17, v18, v19, v20, v21);
}

void __77__CORoleService__notifyMemberObserver_membersWithRole_inCluster_didChangeTo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77__CORoleService__notifyMemberObserver_membersWithRole_inCluster_didChangeTo___block_invoke_cold_1();
  }
}

- (void)_notifySnapshotObserver:(id)a3 snapshotOfCluster:(id)a4 didChangeTo:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  long long v16 = __71__CORoleService__notifySnapshotObserver_snapshotOfCluster_didChangeTo___block_invoke;
  uint64_t v17 = &unk_2645CC258;
  uint64_t v18 = self;
  id v11 = v8;
  id v19 = v11;
  id v12 = [(CORoleService *)self _remoteInterfaceForClient:v11 withErrorHandler:&v14];
  id v13 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    long long v21 = self;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p change notification to Client(%@) for Snapshots(%@) in Cluster(%@)", buf, 0x2Au);
  }

  objc_msgSend(v12, "snapshotOfCluster:didChangeTo:", v9, v10, v14, v15, v16, v17, v18);
}

void __71__CORoleService__notifySnapshotObserver_snapshotOfCluster_didChangeTo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__CORoleService__notifySnapshotObserver_snapshotOfCluster_didChangeTo___block_invoke_cold_1();
  }
}

- (void)_addRoleObserverForClient:(id)a3 ofMember:(id)a4 inCluster:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(COService *)self _takeAssertionForCluster:v10];
  id v11 = [(CORoleService *)self roleObservers];
  id v12 = (void *)[v11 mutableCopy];

  id v13 = [v12 objectForKey:v10];
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v15 = (void *)[v13 mutableCopy];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
  }
  long long v16 = v15;
  id v17 = [v15 objectForKey:v9];
  if (!v17) {
    id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  [v17 addObject:v8];
  [v16 setObject:v17 forKey:v9];
  [v12 setObject:v16 forKey:v10];
  [(CORoleService *)self setRoleObservers:v12];
  uint64_t v18 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134218754;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_debug_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEBUG, "%p added client %@ role observer for %@ in %@", (uint8_t *)&v19, 0x2Au);
  }
}

- (void)_removeRoleObserverForClient:(id)a3 ofMember:(id)a4 inCluster:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v27 = a5;
  __int16 v29 = self;
  id v10 = [(CORoleService *)self roleObservers];
  id v22 = (void *)[v10 mutableCopy];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v10;
  uint64_t v24 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        if (!v27 || [v27 isEqual:*(void *)(*((void *)&v34 + 1) + 8 * i)])
        {
          uint64_t v26 = i;
          id v13 = [obj objectForKey:v12];
          uint64_t v28 = (void *)[v13 mutableCopy];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v46 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v31;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v31 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * v18);
                if (!v9
                  || [v9 isSameDeviceAsMember:*(void *)(*((void *)&v30 + 1) + 8 * v18)])
                {
                  uint64_t v20 = [v14 objectForKey:v19];
                  if ([v20 containsObject:v8])
                  {
                    __int16 v21 = COCoreLogForCategory(4);
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 134218754;
                      uint64_t v39 = v29;
                      __int16 v40 = 2112;
                      id v41 = v8;
                      __int16 v42 = 2112;
                      id v43 = v9;
                      __int16 v44 = 2112;
                      id v45 = v27;
                      _os_log_debug_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEBUG, "%p removed client %@ role observer for %@ in %@", buf, 0x2Au);
                    }

                    [v20 removeObject:v8];
                    [(COService *)v29 _releaseAssertionForCluster:v12];
                    if (![v20 count]) {
                      [v28 removeObjectForKey:v19];
                    }
                  }
                }
                ++v18;
              }
              while (v16 != v18);
              uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v46 count:16];
            }
            while (v16);
          }

          if ([v28 count]) {
            [v22 setObject:v28 forKey:v12];
          }
          else {
            [v22 removeObjectForKey:v12];
          }
          uint64_t i = v26;
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v24);
  }

  [(CORoleService *)v29 setRoleObservers:v22];
}

- (void)_addMemberObserverForClient:(id)a3 ofRole:(id)a4 inCluster:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(COService *)self _takeAssertionForCluster:v10];
  id v11 = [(CORoleService *)self memberObservers];
  uint64_t v12 = (void *)[v11 mutableCopy];

  id v13 = [v12 objectForKey:v10];
  id v14 = v13;
  if (v13)
  {
    uint64_t v15 = (void *)[v13 mutableCopy];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v16 = v15;
  id v17 = [v15 objectForKey:v9];
  if (!v17) {
    id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  [v17 addObject:v8];
  [v16 setObject:v17 forKey:v9];
  [v12 setObject:v16 forKey:v10];
  [(CORoleService *)self setMemberObservers:v12];
  uint64_t v18 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134218754;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_debug_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEBUG, "%p added client %@ member observer for %@ in %@", (uint8_t *)&v19, 0x2Au);
  }
}

- (void)_removeMemberObserverForClient:(id)a3 ofRole:(id)a4 inCluster:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v27 = a5;
  __int16 v29 = self;
  id v10 = [(CORoleService *)self memberObservers];
  id v22 = (void *)[v10 mutableCopy];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v10;
  uint64_t v24 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        if (!v27 || [v27 isEqual:*(void *)(*((void *)&v34 + 1) + 8 * i)])
        {
          uint64_t v26 = i;
          id v13 = [obj objectForKey:v12];
          uint64_t v28 = (void *)[v13 mutableCopy];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v46 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v31;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v31 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * v18);
                if (!v9 || [v9 isEqual:*(void *)(*((void *)&v30 + 1) + 8 * v18)])
                {
                  uint64_t v20 = [v14 objectForKey:v19];
                  if ([v20 containsObject:v8])
                  {
                    __int16 v21 = COCoreLogForCategory(4);
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 134218754;
                      uint64_t v39 = v29;
                      __int16 v40 = 2112;
                      id v41 = v8;
                      __int16 v42 = 2112;
                      id v43 = v9;
                      __int16 v44 = 2112;
                      id v45 = v27;
                      _os_log_debug_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEBUG, "%p removed client %@ member observer for %@ in %@", buf, 0x2Au);
                    }

                    [v20 removeObject:v8];
                    [(COService *)v29 _releaseAssertionForCluster:v12];
                    if (![v20 count]) {
                      [v28 removeObjectForKey:v19];
                    }
                  }
                }
                ++v18;
              }
              while (v16 != v18);
              uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v46 count:16];
            }
            while (v16);
          }

          if ([v28 count]) {
            [v22 setObject:v28 forKey:v12];
          }
          else {
            [v22 removeObjectForKey:v12];
          }
          uint64_t i = v26;
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v24);
  }

  [(CORoleService *)v29 setMemberObservers:v22];
}

- (void)_addSnapshotObserverForClient:(id)a3 inCluster:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(COService *)self _takeAssertionForCluster:v7];
  id v8 = [(CORoleService *)self snapshotObservers];
  id v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v10 = [(CORoleService *)self snapshotObservers];
    id v11 = (void *)[v10 mutableCopy];

    [v11 setObject:v9 forKey:v7];
    [(CORoleService *)self setSnapshotObservers:v11];
  }
  [v9 addObject:v6];
  uint64_t v12 = COCoreLogForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134218498;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEBUG, "%p added client %@ snapshot observer in %@", (uint8_t *)&v13, 0x20u);
  }
}

- (void)_removeSnapshotObserverForClient:(id)a3 inCluster:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CORoleService *)self snapshotObservers];
  uint64_t v19 = (void *)[v8 mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v21;
    *(void *)&long long v11 = 134218498;
    long long v18 = v11;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * v14);
        if (!v7 || [v7 isEqual:*(void *)(*((void *)&v20 + 1) + 8 * v14)])
        {
          id v16 = objc_msgSend(v9, "objectForKey:", v15, v18);
          if ([v16 containsObject:v6])
          {
            __int16 v17 = COCoreLogForCategory(4);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v18;
              __int16 v25 = self;
              __int16 v26 = 2112;
              id v27 = v6;
              __int16 v28 = 2112;
              id v29 = v7;
              _os_log_debug_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEBUG, "%p removed client %@ snapshot observer in %@", buf, 0x20u);
            }

            [v16 removeObject:v6];
            [(COService *)self _releaseAssertionForCluster:v15];
            if (![v16 count]) {
              [v19 removeObjectForKey:v15];
            }
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v12);
  }

  [(CORoleService *)self setSnapshotObservers:v19];
}

- (id)_remoteInterfaceForClient:(id)a3 withErrorHandler:(id)a4
{
  id v5 = a4;
  id v6 = [a3 connection];
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v5];

  return v7;
}

- (NSDictionary)snapshotState
{
  return self->_snapshotState;
}

- (void)setSnapshotState:(id)a3
{
}

- (NSDictionary)roleObservers
{
  return self->_roleObservers;
}

- (void)setRoleObservers:(id)a3
{
}

- (NSDictionary)memberObservers
{
  return self->_memberObservers;
}

- (void)setMemberObservers:(id)a3
{
}

- (NSDictionary)snapshotObservers
{
  return self->_snapshotObservers;
}

- (void)setSnapshotObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotObservers, 0);
  objc_storeStrong((id *)&self->_memberObservers, 0);
  objc_storeStrong((id *)&self->_roleObservers, 0);
  objc_storeStrong((id *)&self->_snapshotState, 0);
}

void __72__CORoleService__notifyRoleObserver_roleOfMember_inCluster_didChangeTo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_12_1(&dword_2217C1000, v0, v1, "%p -> %@ remote Role failed: %@");
}

void __77__CORoleService__notifyMemberObserver_membersWithRole_inCluster_didChangeTo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_12_1(&dword_2217C1000, v0, v1, "%p -> %@ remote Member failed: %@");
}

void __71__CORoleService__notifySnapshotObserver_snapshotOfCluster_didChangeTo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_12_1(&dword_2217C1000, v0, v1, "%p -> %@ remote snapshot failed: %@");
}

@end