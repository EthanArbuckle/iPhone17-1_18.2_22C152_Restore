@interface _DKSyncPeerStatusTracker
+ (_DKSyncPeerStatusTracker)peerStatusTrackerWithContext:(id)a3;
+ (_DKSyncPeerStatusTracker)sharedInstance;
+ (id)stringForTransports:(int64_t)a3;
+ (id)syncPeerTransportsStrings;
- (BOOL)isSingleDevice;
- (_DKKnowledgeStorage)storage;
- (_DKSyncPeerStatusTracker)initWithContext:(id)a3;
- (id)_observerBlocks;
- (id)addStatusChangeObserverWithBlock:(id)a3;
- (id)allPeers;
- (id)description;
- (id)existingPeerWithIDSDeviceIdentifier:(id)a3;
- (id)existingPeerWithSourceDeviceID:(id)a3;
- (id)lastSuccessfulActivityDateOnTransport:(int64_t)a3 forPeer:(id)a4;
- (id)peerWithCompanionLinkDevice:(id)a3;
- (id)peerWithIDSDeviceIdentifier:(id)a3;
- (id)peerWithZoneName:(id)a3 sourceDeviceID:(id)a4;
- (id)peersWithActiveTransports:(int64_t)a3;
- (id)peersWithAnyActiveTransports;
- (id)pseudoPeerForSyncTransportCloudUp;
- (int64_t)activeTransportsForPeer:(id)a3;
- (unint64_t)foreignPeersCount;
- (void)_loadPeers;
- (void)_modifyActiveTransportInPeer:(void *)a3 withNewTransportsBlock:;
- (void)_peerInfoForPeer:(void *)a1;
- (void)addActiveTransports:(int64_t)a3 toPeer:(id)a4;
- (void)debugLogPeers;
- (void)postCloudDeviceCountChangedNotification;
- (void)registerNewPeer:(id *)a1;
- (void)removeActiveTransports:(int64_t)a3 fromPeer:(id)a4;
- (void)removePeer:(id)a3;
- (void)removeStatusChangeObserver:(id)a3;
- (void)setLastSeenDate:(id)a3 onPeer:(id)a4;
- (void)setLastSuccessfulActivityDate:(id)a3 onTransport:(int64_t)a4 forPeer:(id)a5;
- (void)setSourceDeviceID:(id)a3 version:(id)a4 peer:(id)a5;
- (void)setStorage:(id)a3;
@end

@implementation _DKSyncPeerStatusTracker

+ (_DKSyncPeerStatusTracker)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___DKSyncPeerStatusTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_initialized_7 != -1) {
    dispatch_once(&sharedInstance_initialized_7, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_4;
  return (_DKSyncPeerStatusTracker *)v2;
}

+ (_DKSyncPeerStatusTracker)peerStatusTrackerWithContext:(id)a3
{
  v3 = +[_DKSyncContextObjectFactory objectFactoryForClass:a1 context:a3];
  v4 = [v3 instance];

  return (_DKSyncPeerStatusTracker *)v4;
}

+ (id)syncPeerTransportsStrings
{
  self;
  if (syncPeerTransportsStrings_initialized != -1) {
    dispatch_once(&syncPeerTransportsStrings_initialized, &__block_literal_global_84);
  }
  v0 = (void *)syncPeerTransportsStrings_strings;
  return v0;
}

- (_DKSyncPeerStatusTracker)initWithContext:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DKSyncPeerStatusTracker;
  v5 = [(_DKSyncContextObject *)&v14 initWithContext:v4];
  if (v5)
  {
    v6 = [v4 storage];
    objc_storeWeak((id *)&v5->_storage, v6);

    uint64_t v7 = objc_opt_new();
    peerInfos = v5->_peerInfos;
    v5->_peerInfos = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    observers = v5->_observers;
    v5->_observers = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    lastSuccessfulActivityDates = v5->_lastSuccessfulActivityDates;
    v5->_lastSuccessfulActivityDates = (NSMutableDictionary *)v11;

    -[_DKSyncPeerStatusTracker _loadPeers](v5);
  }

  return v5;
}

- (void)_loadPeers
{
  OUTLINED_FUNCTION_14_1(a1, a2);
  v5 = [(id)objc_opt_class() description];
  *(_DWORD *)id v4 = 138543362;
  void *v3 = v5;
  _os_log_fault_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_FAULT, "%{public}@: Loading peers before storage is available", v4, 0xCu);
}

- (void)setSourceDeviceID:(id)a3 version:(id)a4 peer:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  uint64_t v11 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v11);

  if (!v8)
  {
    v18 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_DKSyncPeerStatusTracker setSourceDeviceID:version:peer:]((uint64_t)self, v18);
    }
    goto LABEL_56;
  }
  v12 = [v10 sourceDeviceID];
  int v13 = [v8 isEqualToString:v12];

  objc_super v14 = [v10 version];
  v15 = v14;
  if (v9)
  {
    int v16 = [v9 isEqualToString:v14];

    if ((v13 & v16 & 1) == 0)
    {
      v17 = v10;
      if ((v16 & 1) == 0) {
        [v17 setVersion:v9];
      }
LABEL_13:
      v18 = v10;
      if (v13) {
        goto LABEL_39;
      }
      v21 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v68 = [(id)objc_opt_class() description];
        v51 = &stru_1EDDE58B8;
        if ([v10 me]) {
          v52 = @"pseudo ";
        }
        else {
          v52 = &stru_1EDDE58B8;
        }
        v53 = [v10 identifier];
        v54 = [v10 model];
        if (v54)
        {
          v55 = NSString;
          v65 = [v10 model];
          v51 = [v55 stringWithFormat:@" (%@)", v65];
        }
        *(_DWORD *)buf = 138544642;
        v71 = v68;
        __int16 v72 = 2114;
        v73 = v52;
        __int16 v74 = 2114;
        v75 = v53;
        __int16 v76 = 2114;
        v77 = v51;
        __int16 v78 = 2114;
        id v79 = v8;
        __int16 v80 = 2114;
        uint64_t v81 = (uint64_t)v9;
        _os_log_debug_impl(&dword_18ECEB000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: Setting %{public}@peer %{public}@%{public}@ source device id to %{public}@ version %{public}@", buf, 0x3Eu);
        if (v54)
        {
        }
      }

      v22 = [(_DKSyncPeerStatusTracker *)self existingPeerWithSourceDeviceID:v8];
      [v10 setSourceDeviceID:v8];
      v23 = [(_DKSyncPeerStatusTracker *)self storage];
      v24 = [v23 deviceUUID];
      v25 = [v24 UUIDString];

      if ([v25 isEqualToString:v8])
      {
        [v10 setMe:1];
        v26 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[_DKSyncPeerStatusTracker setSourceDeviceID:version:peer:](self, v10, v26);
        }
      }
      v18 = v10;
      if (!v22 || (v18 = v10, v22 == v10))
      {
LABEL_38:

LABEL_39:
        v41 = [(_DKSyncPeerStatusTracker *)self storage];
        id v69 = 0;
        [v41 saveSyncPeer:v18 error:&v69];
        id v42 = v69;

        if (v18 == v10)
        {
          if (!v42)
          {
LABEL_55:
            -[_DKSyncPeerStatusTracker postCloudDeviceCountChangedNotification]((uint64_t)self);

LABEL_56:
            goto LABEL_57;
          }
          v44 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v67 = [(id)objc_opt_class() description];
            int v49 = [v10 me];
            v46 = &stru_1EDDE58B8;
            v50 = @"pseudo ";
            if (!v49) {
              v50 = &stru_1EDDE58B8;
            }
            v64 = v50;
            v66 = [v10 identifier];
            v48 = [v10 model];
            if (v48)
            {
              v60 = NSString;
              v62 = [v10 model];
              v46 = [v60 stringWithFormat:@" (%@)", v62];
            }
            v57 = [v42 domain];
            uint64_t v61 = [v42 code];
            *(_DWORD *)buf = 138544898;
            v71 = v67;
            __int16 v72 = 2114;
            v73 = v64;
            __int16 v74 = 2114;
            v75 = v66;
            __int16 v76 = 2114;
            v77 = v46;
            __int16 v78 = 2114;
            id v79 = v57;
            __int16 v80 = 2048;
            uint64_t v81 = v61;
            __int16 v82 = 2112;
            id v83 = v42;
            v59 = "%{public}@: Failed to save %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)";
            goto LABEL_70;
          }
        }
        else
        {
          v43 = +[_CDLogging syncChannel];
          v44 = v43;
          if (!v42)
          {
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
              -[_DKSyncPeerStatusTracker setSourceDeviceID:version:peer:](self, v18, v44);
            }
            goto LABEL_54;
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v67 = [(id)objc_opt_class() description];
            int v45 = [v18 me];
            v46 = &stru_1EDDE58B8;
            v47 = @"pseudo ";
            if (!v45) {
              v47 = &stru_1EDDE58B8;
            }
            v63 = v47;
            v66 = [v18 identifier];
            v48 = [v18 model];
            if (v48)
            {
              v56 = NSString;
              v62 = [v18 model];
              v46 = [v56 stringWithFormat:@" (%@)", v62];
            }
            v57 = [v42 domain];
            uint64_t v58 = [v42 code];
            *(_DWORD *)buf = 138544898;
            v71 = v67;
            __int16 v72 = 2114;
            v73 = v63;
            __int16 v74 = 2114;
            v75 = v66;
            __int16 v76 = 2114;
            v77 = v46;
            __int16 v78 = 2114;
            id v79 = v57;
            __int16 v80 = 2048;
            uint64_t v81 = v58;
            __int16 v82 = 2112;
            id v83 = v42;
            v59 = "%{public}@: Failed to save de-duplicated %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)";
LABEL_70:
            _os_log_error_impl(&dword_18ECEB000, v44, OS_LOG_TYPE_ERROR, v59, buf, 0x48u);

            if (v48)
            {
            }
          }
        }
LABEL_54:

        goto LABEL_55;
      }
      v27 = [v22 idsDeviceIdentifier];
      if (!v27)
      {
        v28 = [v10 idsDeviceIdentifier];

        if (!v28) {
          goto LABEL_25;
        }
        v27 = [v10 idsDeviceIdentifier];
        [v22 setIdsDeviceIdentifier:v27];
      }

LABEL_25:
      v29 = [v22 sourceDeviceID];
      if (!v29)
      {
        v30 = [v10 sourceDeviceID];

        if (!v30) {
          goto LABEL_29;
        }
        v29 = [v10 sourceDeviceID];
        [v22 setSourceDeviceID:v29];
      }

LABEL_29:
      v31 = [v22 version];
      if (!v31)
      {
        v32 = [v10 version];

        if (!v32) {
          goto LABEL_33;
        }
        v31 = [v10 version];
        [v22 setVersion:v31];
      }

LABEL_33:
      v33 = [v22 zoneName];
      if (!v33)
      {
        v34 = [v10 zoneName];

        if (!v34)
        {
LABEL_37:
          [(_DKSyncPeerStatusTracker *)self addActiveTransports:[(_DKSyncPeerStatusTracker *)self activeTransportsForPeer:v10] toPeer:v22];
          v35 = [v22 idsDeviceIdentifier];
          [v10 setIdsDeviceIdentifier:v35];

          v36 = [v22 sourceDeviceID];
          [v10 setSourceDeviceID:v36];

          v37 = [v22 version];
          [v10 setVersion:v37];

          v38 = [v22 zoneName];
          [v10 setZoneName:v38];

          [(_DKSyncPeerStatusTracker *)self addActiveTransports:[(_DKSyncPeerStatusTracker *)self activeTransportsForPeer:v22] toPeer:v10];
          peerInfos = self->_peerInfos;
          v40 = [v10 uuid];
          [(NSMutableDictionary *)peerInfos setObject:0 forKeyedSubscript:v40];

          v18 = v22;
          goto LABEL_38;
        }
        v33 = [v10 zoneName];
        [v22 setZoneName:v33];
      }

      goto LABEL_37;
    }
  }
  else
  {

    if (v15) {
      char v19 = 0;
    }
    else {
      char v19 = v13;
    }
    if ((v19 & 1) == 0)
    {
      v20 = v10;
      goto LABEL_13;
    }
  }
LABEL_57:
}

- (void)postCloudDeviceCountChangedNotification
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 16) count];
    v3 = +[_CDObservationCenter sharedInstance];
    v6 = @"count";
    id v4 = [NSNumber numberWithUnsignedInteger:v2];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v3 postNotificationName:@"_DKCloudDeviceCountChangedNotification" userInfo:v5 sender:a1];
  }
}

- (void)registerNewPeer:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    [v3 setUuid:v4];
    v5 = objc_opt_new();
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v5, v4);
    -[_DKSyncWindow setStartDate:]((uint64_t)v5, v3);
    [a1[2] setObject:v5 forKeyedSubscript:v4];
    v6 = [v3 sourceDeviceID];

    if (v6)
    {
      uint64_t v7 = [a1 storage];
      id v8 = [v7 deviceUUID];
      id v9 = [v8 UUIDString];

      v10 = [v3 sourceDeviceID];
      LODWORD(v8) = [v9 isEqualToString:v10];

      if (v8)
      {
        uint64_t v11 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          [(_DKSyncPeerStatusTracker *)a1 registerNewPeer:v11];
        }

        [v3 setMe:1];
      }
      v12 = [a1 storage];
      uint64_t v13 = 0;
      [v12 saveSyncPeer:v3 error:&v13];
    }
    -[_DKSyncPeerStatusTracker postCloudDeviceCountChangedNotification]((uint64_t)a1);
  }
}

- (id)peerWithCompanionLinkDevice:(id)a3
{
  id v4 = [a3 idsDeviceIdentifier];
  v5 = [(_DKSyncPeerStatusTracker *)self peerWithIDSDeviceIdentifier:v4];

  return v5;
}

- (id)peerWithIDSDeviceIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = v5->_peerInfos;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [(NSMutableDictionary *)v5->_peerInfos objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * v8)];
        v10 = (void *)v9;
        if (v9) {
          uint64_t v11 = *(void **)(v9 + 16);
        }
        else {
          uint64_t v11 = 0;
        }
        v12 = v11;
        uint64_t v13 = [(_DKSyncPeer *)v12 idsDeviceIdentifier];
        char v14 = [v4 isEqualToString:v13];

        if (v14)
        {

          if (v12) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v15 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v6 = v15;
      if (v15) {
        continue;
      }
      break;
    }
  }

LABEL_15:
  v12 = [[_DKSyncPeer alloc] initWithIDSDeviceIdentifier:v4];
  -[_DKSyncPeerStatusTracker registerNewPeer:]((id *)&v5->super.super.isa, v12);
LABEL_16:
  objc_sync_exit(v5);

  return v12;
}

- (id)peerWithZoneName:(id)a3 sourceDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(_DKSyncPeerStatusTracker *)v8 existingPeerWithSourceDeviceID:v7];
  v10 = v9;
  if (v9)
  {
    if (v6)
    {
      uint64_t v11 = [v9 zoneName];

      if (!v11)
      {
        [v10 setZoneName:v6];
        if (v7)
        {
          v12 = [(_DKSyncPeerStatusTracker *)v8 storage];
          uint64_t v14 = 0;
          [v12 saveSyncPeer:v10 error:&v14];
        }
      }
    }
  }
  else
  {
    v10 = objc_opt_new();
    [v10 setZoneName:v6];
    [v10 setSourceDeviceID:v7];
    -[_DKSyncPeerStatusTracker registerNewPeer:]((id *)&v8->super.super.isa, v10);
  }
  objc_sync_exit(v8);

  return v10;
}

- (id)existingPeerWithSourceDeviceID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = v4->_peerInfos;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [(NSMutableDictionary *)v4->_peerInfos objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * v7)];
        uint64_t v9 = (void *)v8;
        if (v8) {
          v10 = *(void **)(v8 + 16);
        }
        else {
          v10 = 0;
        }
        id v11 = v10;
        v12 = [v11 sourceDeviceID];
        if (v12)
        {
          uint64_t v13 = [v11 sourceDeviceID];
          char v14 = [v20 isEqualToString:v13];

          if (v14)
          {

            if (v11) {
              goto LABEL_19;
            }
            goto LABEL_16;
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v15 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      uint64_t v5 = v15;
      if (v15) {
        continue;
      }
      break;
    }
  }

LABEL_16:
  int v16 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = [(id)objc_opt_class() description];
    [(_DKSyncPeerStatusTracker *)v17 existingPeerWithSourceDeviceID:(uint64_t)v25];
  }

  id v11 = 0;
LABEL_19:
  objc_sync_exit(v4);

  return v11;
}

- (id)existingPeerWithIDSDeviceIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = v4->_peerInfos;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [(NSMutableDictionary *)v4->_peerInfos objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * v7)];
        uint64_t v9 = (void *)v8;
        if (v8) {
          v10 = *(void **)(v8 + 16);
        }
        else {
          v10 = 0;
        }
        id v11 = v10;
        v12 = [v11 idsDeviceIdentifier];
        if (v12)
        {
          uint64_t v13 = [v11 idsDeviceIdentifier];
          char v14 = [v20 isEqualToString:v13];

          if (v14)
          {

            if (v11) {
              goto LABEL_19;
            }
            goto LABEL_16;
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v15 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      uint64_t v5 = v15;
      if (v15) {
        continue;
      }
      break;
    }
  }

LABEL_16:
  int v16 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = [(id)objc_opt_class() description];
    [(_DKSyncPeerStatusTracker *)v17 existingPeerWithIDSDeviceIdentifier:(uint64_t)v25];
  }

  id v11 = 0;
LABEL_19:
  objc_sync_exit(v4);

  return v11;
}

- (id)pseudoPeerForSyncTransportCloudUp
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_pseudoPeer = &self->_pseudoPeer;
  id v4 = self->_pseudoPeer;
  if (!v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = v5->_peerInfos;
    id v4 = (_DKSyncPeer *)[(NSMutableDictionary *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](v5->_peerInfos, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v8), (void)v17);
          v10 = (void *)v9;
          if (v9) {
            id v11 = *(void **)(v9 + 16);
          }
          else {
            id v11 = 0;
          }
          id v12 = v11;
          int v13 = [v12 me];

          if (v13)
          {
            if (v10) {
              uint64_t v15 = (void *)v10[2];
            }
            else {
              uint64_t v15 = 0;
            }
            id v4 = v15;

            goto LABEL_18;
          }

          uint64_t v8 = (_DKSyncPeer *)((char *)v8 + 1);
        }
        while (v4 != v8);
        uint64_t v14 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        id v4 = (_DKSyncPeer *)v14;
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    objc_storeStrong((id *)p_pseudoPeer, v4);
    objc_sync_exit(v5);
  }
  return v4;
}

- (void)removePeer:(id)a3
{
  id v4 = (_DKSyncPeer *)a3;
  uint64_t v8 = v4;
  if (self->_pseudoPeer == v4)
  {
    self->_pseudoPeer = 0;
  }
  uint64_t v5 = [(_DKSyncPeerStatusTracker *)self storage];
  [v5 removeSyncPeer:v8];

  peerInfos = self->_peerInfos;
  uint64_t v7 = [(_DKSyncPeer *)v8 uuid];
  [(NSMutableDictionary *)peerInfos setObject:0 forKeyedSubscript:v7];

  -[_DKSyncPeerStatusTracker postCloudDeviceCountChangedNotification]((uint64_t)self);
}

- (id)allPeers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = self;
  objc_sync_enter(v4);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = v4->_peerInfos;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](v4->_peerInfos, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * v8), (void)v16);
        v10 = (void *)v9;
        if (v9) {
          id v11 = *(void **)(v9 + 16);
        }
        else {
          id v11 = 0;
        }
        id v12 = v11;
        [v3 addObject:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v13 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v6 = v13;
    }
    while (v13);
  }

  objc_sync_exit(v4);
  uint64_t v14 = (void *)[v3 copy];

  return v14;
}

- (id)peersWithAnyActiveTransports
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = self;
  objc_sync_enter(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = v4->_peerInfos;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](v4->_peerInfos, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        v10 = (void *)v9;
        if (v9 && *(void *)(v9 + 24))
        {
          id v11 = *(id *)(v9 + 16);
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  id v12 = (void *)[v3 copy];

  return v12;
}

- (id)peersWithActiveTransports:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = self;
  objc_sync_enter(v6);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = v6->_peerInfos;
  uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](v6->_peerInfos, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        id v12 = (void *)v11;
        if (v11 && (*(void *)(v11 + 24) & a3) != 0)
        {
          id v13 = *(id *)(v11 + 16);
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
  long long v14 = (void *)[v5 copy];

  return v14;
}

- (unint64_t)foreignPeersCount
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v33 = [(_DKSyncPeerStatusTracker *)self pseudoPeerForSyncTransportCloudUp];
  id v3 = self;
  objc_sync_enter(v3);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = v3->_peerInfos;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    unint64_t v32 = 0;
    uint64_t v5 = *(void *)v35;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = [(NSMutableDictionary *)v3->_peerInfos objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * v6)];
        uint64_t v8 = (void *)v7;
        if (v7) {
          uint64_t v9 = *(void **)(v7 + 16);
        }
        else {
          uint64_t v9 = 0;
        }
        id v10 = v9;
        uint64_t v11 = v10;
        if (v10 != v33)
        {
          id v12 = [v10 sourceDeviceID];
          BOOL v13 = v12 == 0;

          if (!v13)
          {
            long long v14 = [v11 lastSeenDate];
            long long v15 = v14;
            if (v14)
            {
              [v14 timeIntervalSinceNow];
              BOOL v17 = v16 < -2678400.0;
            }
            else
            {
              firstForeignPeersCountDate = v3->_firstForeignPeersCountDate;
              if (!firstForeignPeersCountDate)
              {
                long long v19 = [(_DKSyncPeerStatusTracker *)v3 storage];
                long long v20 = (objc_class *)objc_opt_class();
                uint64_t v21 = NSStringFromClass(v20);
                uint64_t v22 = [v19 keyValueStoreForDomain:v21];

                uint64_t v23 = [v22 dateForKey:@"FirstForeignPeersCountDate"];
                long long v24 = v3->_firstForeignPeersCountDate;
                v3->_firstForeignPeersCountDate = (NSDate *)v23;

                if (!v3->_firstForeignPeersCountDate)
                {
                  uint64_t v25 = [MEMORY[0x1E4F1C9C8] date];
                  v26 = v3->_firstForeignPeersCountDate;
                  v3->_firstForeignPeersCountDate = (NSDate *)v25;

                  [v22 setDate:v3->_firstForeignPeersCountDate forKey:@"FirstForeignPeersCountDate"];
                }

                firstForeignPeersCountDate = v3->_firstForeignPeersCountDate;
              }
              [(NSDate *)firstForeignPeersCountDate timeIntervalSinceNow];
              BOOL v17 = v27 < -43200.0;
            }
            unsigned int v28 = !v17;

            v32 += v28;
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v29 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      uint64_t v4 = v29;
    }
    while (v29);
  }
  else
  {
    unint64_t v32 = 0;
  }

  objc_sync_exit(v3);
  return v32;
}

- (BOOL)isSingleDevice
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if ([(NSMutableDictionary *)v2->_peerInfos count])
  {
    if ([(NSMutableDictionary *)v2->_peerInfos count] == 1)
    {
      id v3 = [(NSMutableDictionary *)v2->_peerInfos allValues];
      uint64_t v4 = [v3 firstObject];

      if (v4) {
        uint64_t v5 = (void *)v4[2];
      }
      else {
        uint64_t v5 = 0;
      }
      id v6 = v5;
      char v7 = [v6 me];
    }
    else
    {
      char v7 = [(_DKSyncPeerStatusTracker *)v2 foreignPeersCount] == 0;
    }
  }
  else
  {
    char v7 = 1;
  }
  objc_sync_exit(v2);

  return v7;
}

- (void)_peerInfoForPeer:(void *)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = a1;
    objc_sync_enter(v4);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v20 = v4;
    id obj = v4[2];
    uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v22;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = [v20[2] objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * v7)];
          uint64_t v9 = (void *)v8;
          if (v8)
          {
            id v10 = *(id *)(v8 + 16);
            if (v10 == v3) {
              goto LABEL_18;
            }
            uint64_t v11 = v10;
            id v12 = (void *)v9[2];
          }
          else
          {
            if (!v3)
            {
LABEL_18:

              goto LABEL_19;
            }
            uint64_t v11 = 0;
            id v12 = 0;
          }
          id v13 = v12;
          long long v14 = [v13 identifier];
          long long v15 = [v3 identifier];
          char v16 = [v14 isEqualToString:v15];

          if (v16) {
            goto LABEL_19;
          }

          ++v7;
        }
        while (v5 != v7);
        uint64_t v17 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v5 = v17;
        uint64_t v9 = 0;
      }
      while (v17);
    }
    else
    {
      uint64_t v9 = 0;
    }
LABEL_19:

    objc_sync_exit(v20);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (int64_t)activeTransportsForPeer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = -[_DKSyncPeerStatusTracker _peerInfoForPeer:](v5, v4);
  if (v6) {
    int64_t v7 = v6[3];
  }
  else {
    int64_t v7 = 0;
  }

  objc_sync_exit(v5);
  return v7;
}

- (void)_modifyActiveTransportInPeer:(void *)a3 withNewTransportsBlock:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  if (a1)
  {
    int64_t v7 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v7);

    id v8 = a1;
    objc_sync_enter(v8);
    uint64_t v9 = -[_DKSyncPeerStatusTracker _peerInfoForPeer:](v8, v5);
    id v10 = (void *)v9;
    if (v9)
    {
      uint64_t v11 = *(void *)(v9 + 24);
      uint64_t v12 = v6[2](v6, v11);
      if (v11 == v12)
      {
        id v13 = 0;
      }
      else
      {
        long long v14 = +[_DKSyncPeerStatusTracker stringForTransports:v10[3]];
        v10[3] = v12;
        long long v15 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          long long v21 = [(id)objc_opt_class() description];
          long long v22 = -[_DKSyncPeerInfo transportsString](v10);
          *(_DWORD *)buf = 138544130;
          uint64_t v29 = v21;
          __int16 v30 = 2112;
          v31 = v14;
          __int16 v32 = 2112;
          id v33 = v22;
          __int16 v34 = 2112;
          id v35 = v5;
          _os_log_debug_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Changing transports from %@ to %@ for peer: %@", buf, 0x2Au);
        }
        id v13 = -[_DKSyncPeerStatusTracker _observerBlocks](v8);
      }
    }
    else
    {
      id v13 = 0;
    }

    objc_sync_exit(v8);
    if ([v13 count])
    {
      char v16 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[_DKSyncPeerStatusTracker _modifyActiveTransportInPeer:withNewTransportsBlock:]((uint64_t)v8, v13, v16);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v17 = v13;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v17);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v23 + 1) + 8 * i));
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v18);
      }
    }
  }
}

- (id)_observerBlocks
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = objc_opt_new();
    id v3 = a1;
    objc_sync_enter(v3);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v3[4];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (v8) {
            id v8 = (void *)v8[1];
          }
          uint64_t v9 = v8;
          id v10 = (void *)MEMORY[0x192FB31A0](v9);
          objc_msgSend(v2, "addObject:", v10, (void)v12);
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    objc_sync_exit(v3);
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (void)addActiveTransports:(int64_t)a3 toPeer:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55___DKSyncPeerStatusTracker_addActiveTransports_toPeer___block_invoke;
  v4[3] = &__block_descriptor_40_e8_q16__0q8l;
  v4[4] = a3;
  -[_DKSyncPeerStatusTracker _modifyActiveTransportInPeer:withNewTransportsBlock:](self, a4, v4);
}

- (void)removeActiveTransports:(int64_t)a3 fromPeer:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60___DKSyncPeerStatusTracker_removeActiveTransports_fromPeer___block_invoke;
  v4[3] = &__block_descriptor_40_e8_q16__0q8l;
  v4[4] = a3;
  -[_DKSyncPeerStatusTracker _modifyActiveTransportInPeer:withNewTransportsBlock:](self, a4, v4);
}

- (void)setLastSeenDate:(id)a3 onPeer:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v7 me] & 1) == 0)
  {
    id v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v33 = [(id)objc_opt_class() description];
      -[NSDate dk_localtimeString](v6);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v7 lastSeenDate];
      if (v17)
      {
        uint64_t v18 = NSNumber;
        [v6 timeIntervalSinceReferenceDate];
        double v20 = v19;
        __int16 v30 = [v7 lastSeenDate];
        [v30 timeIntervalSinceReferenceDate];
        v31 = [v18 numberWithInt:(int)(v20 - v21)];
      }
      else
      {
        v31 = @"N/A";
      }
      long long v22 = &stru_1EDDE58B8;
      if ([v7 me]) {
        long long v23 = @"pseudo ";
      }
      else {
        long long v23 = &stru_1EDDE58B8;
      }
      long long v24 = [v7 identifier];
      long long v25 = [v7 model];
      if (v25)
      {
        long long v26 = NSString;
        uint64_t v29 = [v7 model];
        uint64_t v27 = (uint64_t)v29;
        long long v22 = [v26 stringWithFormat:@" (%@)"];
      }
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v36 = v31;
      *(_WORD *)long long v37 = 2114;
      *(void *)&v37[2] = v23;
      *(_WORD *)&v37[10] = 2114;
      *(void *)&v37[12] = v24;
      *(_WORD *)&v37[20] = 2114;
      *(void *)&v37[22] = v22;
      _os_log_debug_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Updating last seen date to %{public}@ (delta %{public}@) on %{public}@peer %{public}@%{public}@", buf, 0x3Eu);
      if (v25)
      {
      }
      if (v17)
      {
      }
    }

    [v7 setLastSeenDate:v6];
    uint64_t v9 = [(_DKSyncPeerStatusTracker *)self storage];
    uint64_t v34 = 0;
    [v9 saveSyncPeer:v7 error:&v34];
    id v10 = (id)v34;

    if (v10)
    {
      uint64_t v11 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_DKSyncPeerStatusTracker setLastSeenDate:onPeer:]((int)self, (int)v7, (int)v11, v12, v13, v14, v15, v16, v27, v28, (uint8_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, v34, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16],
      }
          (uint64_t)v36,
          *(uint64_t *)v37,
          *(uint64_t *)&v37[8],
          *(uint64_t *)&v37[16],
          *(uint64_t *)&v37[24],
          v38,
          v39,
          v40,
          v41);
    }
  }
}

- (id)lastSuccessfulActivityDateOnTransport:(int64_t)a3 forPeer:(id)a4
{
  id v6 = NSString;
  id v7 = [a4 uuid];
  id v8 = [NSNumber numberWithInteger:a3];
  uint64_t v9 = [v6 stringWithFormat:@"%@ %@", v7, v8];

  id v10 = [(NSMutableDictionary *)self->_lastSuccessfulActivityDates objectForKeyedSubscript:v9];

  return v10;
}

- (void)setLastSuccessfulActivityDate:(id)a3 onTransport:(int64_t)a4 forPeer:(id)a5
{
  id v8 = NSString;
  id v9 = a3;
  id v10 = [a5 uuid];
  uint64_t v11 = [NSNumber numberWithInteger:a4];
  id v12 = [v8 stringWithFormat:@"%@ %@", v10, v11];

  [(NSMutableDictionary *)self->_lastSuccessfulActivityDates setObject:v9 forKeyedSubscript:v12];
}

- (id)addStatusChangeObserverWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = objc_opt_new();
  id v8 = v6;
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v7, v4, 8);
  }
  [(NSMutableArray *)v5->_observers addObject:v8];
  id v9 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [(id)objc_opt_class() description];
    -[_DKSyncPeerStatusTracker addStatusChangeObserverWithBlock:](v10, (uint64_t)v4);
  }

  objc_sync_exit(v5);
  return v8;
}

- (void)removeStatusChangeObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (_DKKnowledgeStorage)storage
{
  p_storage = &self->_storage;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);

  if (!WeakRetained)
  {
    id v4 = +[_DKSync2Coordinator storage]();
    objc_storeWeak((id *)p_storage, v4);
  }
  id v5 = objc_loadWeakRetained((id *)p_storage);
  return (_DKKnowledgeStorage *)v5;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %p: peerInfos=%@>", v5, self, self->_peerInfos];

  return v6;
}

+ (id)stringForTransports:(int64_t)a3
{
  id v4 = +[_DKSyncPeerStatusTracker syncPeerTransportsStrings]();
  id v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (void)debugLogPeers
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  v104 = self;
  objc_sync_enter(v104);
  id v3 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v68 = [(id)objc_opt_class() description];
    id v69 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](v104->_peerInfos, "count"));
    *(_DWORD *)buf = 138543618;
    id v121 = v68;
    __int16 v122 = 2112;
    v123 = v69;
    _os_log_debug_impl(&dword_18ECEB000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: Tracking %@ peers", buf, 0x16u);
  }
  id v4 = [(_DKSyncPeerStatusTracker *)v104 pseudoPeerForSyncTransportCloudUp];
  __int16 v78 = v4;
  if (v4)
  {
    id v5 = [v4 uuid];
    v77 = [(NSMutableDictionary *)v104->_peerInfos objectForKeyedSubscript:v5];
    id v6 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id obja = [(id)objc_opt_class() description];
      v70 = [NSNumber numberWithUnsignedInteger:1];
      if ([v78 me]) {
        v71 = @"pseudo ";
      }
      else {
        v71 = &stru_1EDDE58B8;
      }
      __int16 v72 = [v78 identifier];
      v73 = [v78 model];
      if (v73)
      {
        v75 = NSString;
        uint64_t v2 = [v78 model];
        __int16 v74 = [v75 stringWithFormat:@" (%@)", v2];
      }
      else
      {
        __int16 v74 = &stru_1EDDE58B8;
      }
      __int16 v76 = [v77 debugDescription];
      *(_DWORD *)buf = 138544642;
      id v121 = obja;
      __int16 v122 = 2112;
      v123 = v70;
      __int16 v124 = 2114;
      v125 = v71;
      __int16 v126 = 2114;
      v127 = v72;
      __int16 v128 = 2114;
      v129 = v74;
      __int16 v130 = 2112;
      v131 = v76;
      _os_log_debug_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: %@: %{public}@peer %{public}@%{public}@: %@", buf, 0x3Eu);
      if (v73)
      {
      }
      uint64_t v99 = 1;
    }
    else
    {
      uint64_t v99 = 0;
    }
  }
  else
  {
    v77 = 0;
    uint64_t v99 = 0;
  }
  id v7 = objc_opt_new();
  v97 = objc_opt_new();
  [(NSMutableDictionary *)v104->_peerInfos keysSortedByValueUsingComparator:&__block_literal_global_142];
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v113 objects:v119 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v114;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v114 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [(NSMutableDictionary *)v104->_peerInfos objectForKeyedSubscript:*(void *)(*((void *)&v113 + 1) + 8 * v10)];
        id v12 = (void *)v11;
        if (v11) {
          int v13 = *(void **)(v11 + 16);
        }
        else {
          int v13 = 0;
        }
        id v14 = v13;
        if (([v14 me] & 1) == 0)
        {
          int v15 = [v14 sourceDeviceID];

          if (v15)
          {
            int v16 = [v14 lastSeenDate];
            uint64_t v17 = v16;
            if (v16 && ([v16 timeIntervalSinceNow], v18 >= -2678400.0))
            {
              double v19 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                v94 = [(id)objc_opt_class() description];
                ++v99;
                v91 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
                if (v12) {
                  double v20 = (void *)v12[2];
                }
                else {
                  double v20 = 0;
                }
                v86 = v20;
                int v21 = [(__CFString *)v86 me];
                long long v22 = &stru_1EDDE58B8;
                if (v21) {
                  long long v22 = @"pseudo ";
                }
                v85 = v22;
                if (v12) {
                  long long v23 = (void *)v12[2];
                }
                else {
                  long long v23 = 0;
                }
                id v83 = v23;
                v88 = [v83 identifier];
                if (v12) {
                  long long v24 = (void *)v12[2];
                }
                else {
                  long long v24 = 0;
                }
                id v82 = v24;
                id v100 = [v82 model];
                v87 = &stru_1EDDE58B8;
                if (v100)
                {
                  if (v12) {
                    long long v25 = (void *)v12[2];
                  }
                  else {
                    long long v25 = 0;
                  }
                  long long v26 = NSString;
                  id v79 = v25;
                  uint64_t v81 = [v79 model];
                  __int16 v80 = [v26 stringWithFormat:@" (%@)", v81];
                  v87 = v80;
                }
                uint64_t v27 = [v12 debugDescription];
                *(_DWORD *)buf = 138544642;
                id v121 = v94;
                __int16 v122 = 2112;
                v123 = v91;
                __int16 v124 = 2114;
                v125 = v85;
                __int16 v126 = 2114;
                v127 = v88;
                __int16 v128 = 2114;
                v129 = v87;
                __int16 v130 = 2112;
                v131 = v27;
                _os_log_debug_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: %@: %{public}@peer %{public}@%{public}@: %@", buf, 0x3Eu);
                if (v100)
                {
                }
              }
            }
            else
            {
              [v7 addObject:v12];
            }
          }
          else
          {
            [v97 addObject:v12];
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v28 = [obj countByEnumeratingWithState:&v113 objects:v119 count:16];
      uint64_t v8 = v28;
    }
    while (v28);
  }

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v101 = v7;
  uint64_t v29 = [v101 countByEnumeratingWithState:&v109 objects:v118 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v110;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v110 != v30) {
          objc_enumerationMutation(v101);
        }
        id v32 = *(void **)(*((void *)&v109 + 1) + 8 * v31);
        id v33 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v95 = [(id)objc_opt_class() description];
          ++v99;
          v92 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          if (v32) {
            uint64_t v34 = (void *)v32[2];
          }
          else {
            uint64_t v34 = 0;
          }
          id v89 = v34;
          int v35 = [v89 me];
          uint64_t v36 = &stru_1EDDE58B8;
          if (v35) {
            uint64_t v36 = @"pseudo ";
          }
          v87 = v36;
          if (v32) {
            long long v37 = (void *)v32[2];
          }
          else {
            long long v37 = 0;
          }
          id v38 = v37;
          uint64_t v39 = [v38 identifier];
          if (v32) {
            uint64_t v40 = (void *)v32[2];
          }
          else {
            uint64_t v40 = 0;
          }
          id v41 = v40;
          id v42 = [v41 model];
          v43 = &stru_1EDDE58B8;
          if (v42)
          {
            if (v32) {
              v44 = (void *)v32[2];
            }
            else {
              v44 = 0;
            }
            int v45 = NSString;
            id v83 = v44;
            v86 = [v83 model];
            v85 = [v45 stringWithFormat:@" (%@)", v86];
            v43 = v85;
          }
          v46 = [v32 debugDescription];
          *(_DWORD *)buf = 138544642;
          id v121 = v95;
          __int16 v122 = 2112;
          v123 = v92;
          __int16 v124 = 2114;
          v125 = v87;
          __int16 v126 = 2114;
          v127 = v39;
          __int16 v128 = 2114;
          v129 = v43;
          __int16 v130 = 2112;
          v131 = v46;
          _os_log_debug_impl(&dword_18ECEB000, v33, OS_LOG_TYPE_DEBUG, "%{public}@: %@: obsolete %{public}@peer %{public}@%{public}@: %@", buf, 0x3Eu);
          if (v42)
          {
          }
        }

        ++v31;
      }
      while (v29 != v31);
      uint64_t v47 = [v101 countByEnumeratingWithState:&v109 objects:v118 count:16];
      uint64_t v29 = v47;
    }
    while (v47);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v48 = v97;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v105 objects:v117 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v106;
    id v84 = v48;
    do
    {
      uint64_t v51 = 0;
      do
      {
        if (*(void *)v106 != v50) {
          objc_enumerationMutation(v48);
        }
        v52 = *(void **)(*((void *)&v105 + 1) + 8 * v51);
        v53 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          v98 = [(id)objc_opt_class() description];
          ++v99;
          v96 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          if (v52) {
            v54 = (void *)v52[2];
          }
          else {
            v54 = 0;
          }
          id v93 = v54;
          int v55 = [v93 me];
          v56 = &stru_1EDDE58B8;
          if (v55) {
            v56 = @"pseudo ";
          }
          v90 = v56;
          if (v52) {
            v57 = (void *)v52[2];
          }
          else {
            v57 = 0;
          }
          id v58 = v57;
          v59 = [v58 identifier];
          if (v52) {
            v60 = (void *)v52[2];
          }
          else {
            v60 = 0;
          }
          id v61 = v60;
          v62 = [v61 model];
          v63 = &stru_1EDDE58B8;
          if (v62)
          {
            if (v52) {
              v64 = (void *)v52[2];
            }
            else {
              v64 = 0;
            }
            v65 = NSString;
            v85 = v64;
            v87 = [(__CFString *)v85 model];
            v86 = [v65 stringWithFormat:@" (%@)", v87];
            v63 = v86;
          }
          v66 = [v52 debugDescription];
          *(_DWORD *)buf = 138544642;
          id v121 = v98;
          __int16 v122 = 2112;
          v123 = v96;
          __int16 v124 = 2114;
          v125 = v90;
          __int16 v126 = 2114;
          v127 = v59;
          __int16 v128 = 2114;
          v129 = v63;
          __int16 v130 = 2112;
          v131 = v66;
          _os_log_debug_impl(&dword_18ECEB000, v53, OS_LOG_TYPE_DEBUG, "%{public}@: %@: incomplete %{public}@peer %{public}@%{public}@: %@", buf, 0x3Eu);
          id v48 = v84;
          if (v62)
          {
          }
        }

        ++v51;
      }
      while (v49 != v51);
      uint64_t v67 = [v48 countByEnumeratingWithState:&v105 objects:v117 count:16];
      uint64_t v49 = v67;
    }
    while (v67);
  }

  objc_sync_exit(v104);
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storage);
  objc_storeStrong((id *)&self->_firstForeignPeersCountDate, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulActivityDates, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pseudoPeer, 0);
  objc_storeStrong((id *)&self->_peerInfos, 0);
}

- (void)setSourceDeviceID:(uint64_t)a1 version:(NSObject *)a2 peer:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() description];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Invalid nil source device id", (uint8_t *)&v4, 0xCu);
}

- (void)existingPeerWithSourceDeviceID:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_15((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_debug_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: No existing peer for source device id %@", v4, 0x16u);
}

- (void)existingPeerWithIDSDeviceIdentifier:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_15((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_debug_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: No existing peer for device %@", v4, 0x16u);
}

- (void)_modifyActiveTransportInPeer:(NSObject *)a3 withNewTransportsBlock:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log_t v5 = [(id)objc_opt_class() description];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Calling %@ status change observers", (uint8_t *)&v7, 0x16u);
}

- (void)setLastSeenDate:(int)a3 onPeer:(int)a4 .cold.1(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_26();
  a27 = v32;
  a28 = v33;
  OUTLINED_FUNCTION_17_2();
  a18 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18_2();
  uint64_t v34 = &stru_1EDDE58B8;
  [(id)OUTLINED_FUNCTION_8_0() identifier];
  objc_claimAutoreleasedReturnValue();
  int v35 = [(id)OUTLINED_FUNCTION_16_4() model];
  if (v35)
  {
    uint64_t v36 = NSString;
    [v31 model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_15_3();
    uint64_t v34 = [v36 stringWithFormat:@" (%@)"];
  }
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_18ECEB000, v29, OS_LOG_TYPE_ERROR, "%{public}@: Unable to update last seen date on %{public}@peer %{public}@%{public}@", &buf, 0x2Au);
  if (v35)
  {
  }
  OUTLINED_FUNCTION_30();
}

- (void)addStatusChangeObserverWithBlock:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OUTLINED_FUNCTION_14_1(a1, a2);
  uint64_t v6 = (void *)MEMORY[0x192FB31A0](v5);
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(void *)(v3 + 14) = v6;
  _os_log_debug_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: Added status change observer: %@", (uint8_t *)v3, 0x16u);
}

@end