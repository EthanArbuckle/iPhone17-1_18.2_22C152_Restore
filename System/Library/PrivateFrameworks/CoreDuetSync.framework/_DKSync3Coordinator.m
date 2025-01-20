@interface _DKSync3Coordinator
- (BOOL)remoteContextStorage:(id)a3 hasKnowledgeOfKeyPath:(id)a4;
- (BOOL)subscribeToContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5;
- (BOOL)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:(unint64_t)a3 error:(id *)a4;
- (BOOL)unsubscribeFromContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5;
- (_DKSync3Coordinator)initWithContext:(id)a3;
- (_DKSyncRemoteContextStorage)transportMDCSRapport;
- (id)archivedObjectsForKeyPaths:(id)a3;
- (id)keyPathsByDeviceIDFromRemoteKeyPaths:(id)a3;
- (id)multiDeviceContextStoreDevices;
- (id)peersForContextStoreDeviceIDs:(id)a3;
- (id)registrationIdentifierForPeer:(id)a3 remoteRegistrationIdentifier:(id)a4;
- (id)remoteContextStorage:(id)a3 archivedObjectsForKeyPaths:(id)a4;
- (void)_fetchPropertiesOfRemoteKeyPaths:(id)a3 handler:(id)a4;
- (void)_requestActivateDevicesWithHandler:(id)a3;
- (void)_syncDisabledToggle;
- (void)_syncEnabledToggle;
- (void)dealloc;
- (void)fetchPropertiesOfRemoteKeyPaths:(id)a3 handler:(id)a4;
- (void)handleContextChangedNotification:(id)a3;
- (void)handleStatusChangeForPeer:(id)a3 previousTransports:(int64_t)a4;
- (void)remoteContextStorage:(id)a3 registrationIdentifier:(id)a4 setArchivedObjects:(id)a5 peer:(id)a6;
- (void)remoteContextStorage:(id)a3 subscribeToChangesWithPeer:(id)a4 registrationIdentifier:(id)a5 predicate:(id)a6;
- (void)remoteContextStorage:(id)a3 unsubscribeFromChangesWithPeer:(id)a4 registrationIdentifier:(id)a5 predicate:(id)a6;
- (void)requestActivateDevicesWithHandler:(id)a3;
- (void)sendContextValuesToPeer:(id)a3 registrationIdentifier:(id)a4 keyPaths:(id)a5;
- (void)setArchivedObjects:(id)a3 peer:(id)a4;
- (void)setTransportMDCSRapport:(id)a3;
- (void)setupStorage;
- (void)start;
- (void)subscribeToContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 handler:(id)a5;
- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:(unint64_t)a3 handler:(id)a4;
- (void)unsubscribeFromContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 handler:(id)a5;
@end

@implementation _DKSync3Coordinator

- (_DKSync3Coordinator)initWithContext:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_DKSync3Coordinator;
  v3 = [(_DKSync2Coordinator *)&v12 initWithContext:a3];
  v4 = v3;
  if (v3)
  {
    v3->_watchingDeviceTypes = 0xFFFFLL;
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = *MEMORY[0x263F35238];
    v7 = [MEMORY[0x263F35140] operationQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39___DKSync3Coordinator_initWithContext___block_invoke;
    v10[3] = &unk_2647DBB70;
    v11 = v4;
    id v8 = (id)[v5 addObserverForName:v6 object:0 queue:v7 usingBlock:v10];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F35238] object:0];

  v4.receiver = self;
  v4.super_class = (Class)_DKSync3Coordinator;
  [(_DKSync2Coordinator *)&v4 dealloc];
}

- (void)_syncEnabledToggle
{
  v3 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v3);

  v5.receiver = self;
  v5.super_class = (Class)_DKSync3Coordinator;
  [(_DKSync2Coordinator *)&v5 _syncEnabledToggle];
  objc_super v4 = [MEMORY[0x263F351B8] userContext];
  if (objc_opt_respondsToSelector()) {
    [v4 setRemoteUserContextProxy:self];
  }
}

- (void)_syncDisabledToggle
{
  v3 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)_DKSync3Coordinator;
  [(_DKSync2Coordinator *)&v4 _syncDisabledToggle];
}

- (void)setupStorage
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v3);

  v10.receiver = self;
  v10.super_class = (Class)_DKSync3Coordinator;
  [(_DKSync2Coordinator *)&v10 setupStorage];
  objc_super v4 = [(_DKSync2Coordinator *)self policyForSyncTransportType:1];
  if ([v4 syncDisabled])
  {

    goto LABEL_4;
  }
  char v5 = [MEMORY[0x263F35120] rapportSyncDisabled];

  if (v5)
  {
LABEL_4:
    uint64_t v6 = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(id)objc_opt_class() description];
      *(_DWORD *)buf = 138543362;
      objc_super v12 = v7;
      _os_log_impl(&dword_226CA5000, v6, OS_LOG_TYPE_INFO, "%{public}@: Rapport context store transport disabled by policy", buf, 0xCu);
    }
    goto LABEL_8;
  }
  uint64_t v6 = [MEMORY[0x263F351B8] userContext];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [MEMORY[0x263F35138] sharedInstance];
    transportMDCSRapport = self->_transportMDCSRapport;
    self->_transportMDCSRapport = v8;

    [(_DKSyncRemoteContextStorage *)self->_transportMDCSRapport setDelegate:self];
  }
LABEL_8:
}

- (void)start
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_226CA5000, v1, v2, "%{public}@: Will start transport Rapport for Mutli-Device Context Store", v3, v4, v5, v6, v7);
}

- (id)multiDeviceContextStoreDevices
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v24 = [MEMORY[0x263F35130] sharedInstance];
  uint64_t v2 = [v24 peersWithActiveTransports:1];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
        objc_super v10 = [v9 version];
        [v10 doubleValue];
        double v12 = v11;

        if (v12 > 1.0)
        {
          id v13 = objc_alloc(MEMORY[0x263F35210]);
          v14 = [v9 sourceDeviceID];
          v15 = [v9 model];
          v16 = objc_msgSend(v13, "initWithName:deviceID:model:companion:", &stru_26DACFC30, v14, v15, objc_msgSend(v9, "isCompanion"));

          if (v16)
          {
            [v3 addObject:v16];
          }
          else
          {
            v17 = [MEMORY[0x263F34FB8] syncChannel];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v29 = [(id)objc_opt_class() description];
              int v18 = [v9 me];
              v19 = @"pseudo ";
              if (!v18) {
                v19 = &stru_26DACFC30;
              }
              v28 = v19;
              v30 = [v9 identifier];
              v20 = [v9 model];
              v21 = &stru_26DACFC30;
              if (v20)
              {
                v26 = NSString;
                v27 = [v9 model];
                v25 = [v26 stringWithFormat:@" (%@)", v27];
                v21 = v25;
              }
              *(_DWORD *)buf = 138544130;
              v36 = v29;
              __int16 v37 = 2114;
              v38 = v28;
              __int16 v39 = 2114;
              v40 = v30;
              __int16 v41 = 2114;
              v42 = v21;
              _os_log_debug_impl(&dword_226CA5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Unable to convert %{public}@peer %{public}@%{public}@ to device, skipping", buf, 0x2Au);
              if (v20)
              {
              }
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v22 = [v4 countByEnumeratingWithState:&v31 objects:v43 count:16];
      uint64_t v6 = v22;
    }
    while (v22);
  }

  return v3;
}

- (void)handleStatusChangeForPeer:(id)a3 previousTransports:(int64_t)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v7);

  v21.receiver = self;
  v21.super_class = (Class)_DKSync3Coordinator;
  [(_DKSync2Coordinator *)&v21 handleStatusChangeForPeer:v6 previousTransports:a4];
  if (!self->_watchingDeviceTypes)
  {
    double v11 = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:](self, v6, v11);
    }
    goto LABEL_18;
  }
  uint64_t v8 = [MEMORY[0x263F35130] sharedInstance];
  char v9 = [v8 activeTransportsForPeer:v6];

  BOOL v10 = (v9 & 1) == 0;
  if (((a4 ^ v10) & 1) == 0)
  {
    double v11 = [MEMORY[0x263F351B8] userContext];
    if ((a4 & 1) != 0 || (v9 & 1) == 0)
    {
      if ((a4 & v10) == 0)
      {
LABEL_18:

        goto LABEL_19;
      }
      v16 = [MEMORY[0x263F34FB8] syncChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:](self, v6, v16);
      }

      id v17 = objc_alloc(MEMORY[0x263F35210]);
      int v18 = [v6 sourceDeviceID];
      v19 = [v6 model];
      double v12 = objc_msgSend(v17, "initWithName:deviceID:model:companion:", &stru_26DACFC30, v18, v19, objc_msgSend(v6, "isCompanion"));

      v22[0] = v12;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      v20 = [(_DKSync2Coordinator *)self deviceUUID];
      [v11 deactivateDevices:v14 remoteUserContextProxySourceDeviceUUID:v20];
    }
    else
    {
      double v12 = [(_DKSync3Coordinator *)self multiDeviceContextStoreDevices];
      uint64_t v13 = [v12 count];
      v14 = [MEMORY[0x263F34FB8] syncChannel];
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v15) {
          -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:].cold.4();
        }

        v14 = [(_DKSync2Coordinator *)self deviceUUID];
        [v11 activateDevices:v12 remoteUserContextProxySourceDeviceUUID:v14];
      }
      else if (v15)
      {
        -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:]();
      }
    }

    goto LABEL_18;
  }
LABEL_19:
}

- (void)handleContextChangedNotification:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync3Coordinator handleContextChangedNotification:]();
  }

  long long v34 = v3;
  uint64_t v5 = [v3 userInfo];
  v53 = [v5 objectForKeyedSubscript:*MEMORY[0x263F35248]];
  long long v33 = v5;
  v51 = [v5 objectForKeyedSubscript:*MEMORY[0x263F35240]];
  v52 = [(__CFString *)v51 objectForKeyedSubscript:*MEMORY[0x263F35250]];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v6 = [MEMORY[0x263F35130] sharedInstance];
  uint64_t v7 = [v6 peersWithActiveTransports:1];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v70 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v56;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v56 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = [*(id *)(*((void *)&v55 + 1) + 8 * v11) sourceDeviceID];
        if (v12)
        {
          uint64_t v13 = [MEMORY[0x263F35130] sharedInstance];
          v14 = [v13 existingPeerWithSourceDeviceID:v12];
          if (v14)
          {
            char v15 = [v13 activeTransportsForPeer:v14];
            v16 = [MEMORY[0x263F34FB8] syncChannel];
            BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
            if (v15)
            {
              if (v17)
              {
                v50 = [(id)objc_opt_class() description];
                int v28 = [v14 me];
                v29 = @"pseudo ";
                if (!v28) {
                  v29 = &stru_26DACFC30;
                }
                v46 = v29;
                v48 = [v14 identifier];
                v30 = [v14 model];
                long long v31 = &stru_26DACFC30;
                if (v30)
                {
                  v38 = NSString;
                  v40 = [v14 model];
                  __int16 v37 = [v38 stringWithFormat:@" (%@)", v40];
                  long long v31 = v37;
                }
                *(_DWORD *)buf = 138544386;
                v61 = v50;
                __int16 v62 = 2114;
                v63 = v46;
                __int16 v64 = 2114;
                v65 = v48;
                __int16 v66 = 2114;
                v67 = v31;
                __int16 v68 = 2112;
                v69 = v51;
                _os_log_debug_impl(&dword_226CA5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Forwarding context changed notification to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
                if (v30)
                {
                }
              }

              v26 = (void *)MEMORY[0x263EFFA08];
              v59 = v52;
              v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
              v27 = [v26 setWithArray:v16];
              [(_DKSync3Coordinator *)self sendContextValuesToPeer:v14 registrationIdentifier:v53 keyPaths:v27];
            }
            else if (v17)
            {
              v49 = [(id)objc_opt_class() description];
              int v18 = [v14 me];
              v19 = @"pseudo ";
              if (!v18) {
                v19 = &stru_26DACFC30;
              }
              uint64_t v44 = v19;
              v47 = [v14 identifier];
              v20 = [v14 model];
              objc_super v21 = &stru_26DACFC30;
              if (v20)
              {
                v36 = NSString;
                uint64_t v39 = [v14 model];
                v35 = [v36 stringWithFormat:@" (%@)", v39];
                objc_super v21 = v35;
              }
              *(_DWORD *)buf = 138544386;
              v61 = v49;
              __int16 v62 = 2114;
              v63 = v44;
              __int16 v64 = 2114;
              v65 = v47;
              __int16 v66 = 2114;
              v67 = v21;
              __int16 v68 = 2112;
              v69 = v51;
              _os_log_debug_impl(&dword_226CA5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Not forwarding context changed notification to unavailable %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
              if (v20)
              {

                uint64_t v22 = (void *)v39;
                goto LABEL_27;
              }
              goto LABEL_28;
            }
          }
          else
          {
            v16 = [MEMORY[0x263F34FB8] syncChannel];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              v49 = [(id)objc_opt_class() description];
              int v23 = [0 me];
              v24 = @"pseudo ";
              if (!v23) {
                v24 = &stru_26DACFC30;
              }
              v45 = v24;
              v47 = [0 identifier];
              v20 = [0 model];
              v25 = &stru_26DACFC30;
              if (v20)
              {
                v42 = NSString;
                uint64_t v43 = [0 model];
                __int16 v41 = [v42 stringWithFormat:@" (%@)", v43];
                v25 = v41;
              }
              *(_DWORD *)buf = 138544386;
              v61 = v49;
              __int16 v62 = 2114;
              v63 = v45;
              __int16 v64 = 2114;
              v65 = v47;
              __int16 v66 = 2114;
              v67 = v25;
              __int16 v68 = 2112;
              v69 = v51;
              _os_log_debug_impl(&dword_226CA5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Not forwarding context changed notification to unknown %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
              if (v20)
              {

                uint64_t v22 = (void *)v43;
LABEL_27:
              }
LABEL_28:
            }
          }

          goto LABEL_32;
        }
        uint64_t v13 = [MEMORY[0x263F34FB8] syncChannel];
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_33;
        }
        v14 = [(id)objc_opt_class() description];
        *(_DWORD *)buf = 138543618;
        v61 = v14;
        __int16 v62 = 2112;
        v63 = v51;
        _os_log_debug_impl(&dword_226CA5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: No need to forward context changed notification: %@", buf, 0x16u);
LABEL_32:

LABEL_33:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v32 = [v7 countByEnumeratingWithState:&v55 objects:v70 count:16];
      uint64_t v9 = v32;
    }
    while (v32);
  }
}

- (_DKSyncRemoteContextStorage)transportMDCSRapport
{
  return self->_transportMDCSRapport;
}

- (void)setTransportMDCSRapport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportMDCSRapport, 0);
  objc_storeStrong((id *)&self->_watchingDevicesTransaction, 0);
}

- (BOOL)remoteContextStorage:(id)a3 hasKnowledgeOfKeyPath:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = [MEMORY[0x263F351F0] keyPathWithKey:v4];
    uint64_t v7 = [MEMORY[0x263F351B8] userContext];
    int v8 = [v7 hasKnowledgeOfContextualKeyPath:v6];
    uint64_t v9 = [MEMORY[0x263F34FB8] syncChannel];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:]();
      }
    }
    else if (v10)
    {
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:]();
    }
  }
  else
  {
    id v6 = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:]();
    }
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)remoteContextStorage:(id)a3 archivedObjectsForKeyPaths:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v6);

  if (v5)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(MEMORY[0x263F351F0], "keyPathWithKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    v14 = [(_DKSync3Coordinator *)self archivedObjectsForKeyPaths:v7];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:]();
    }
    v14 = 0;
  }

  return v14;
}

- (void)remoteContextStorage:(id)a3 registrationIdentifier:(id)a4 setArchivedObjects:(id)a5 peer:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v11);

  if (a4 && v9 && v10)
  {
    [(_DKSync3Coordinator *)self setArchivedObjects:v9 peer:v10];
  }
  else
  {
    double v12 = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:]();
    }
  }
}

- (void)remoteContextStorage:(id)a3 subscribeToChangesWithPeer:(id)a4 registrationIdentifier:(id)a5 predicate:(id)a6
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v11 = a4;
  id v12 = a5;
  id v42 = a6;
  uint64_t v13 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v13);

  v14 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v27 = [(id)objc_opt_class() description];
    if ([v11 me]) {
      int v28 = @"pseudo ";
    }
    else {
      int v28 = &stru_26DACFC30;
    }
    v29 = [v11 identifier];
    v30 = [v11 model];
    if (v30)
    {
      v35 = NSString;
      id v6 = [v11 model];
      long long v31 = [v35 stringWithFormat:@" (%@)", v6];
    }
    else
    {
      long long v31 = &stru_26DACFC30;
    }
    *(_DWORD *)buf = 138544642;
    v50 = v27;
    __int16 v51 = 2114;
    v52 = v28;
    __int16 v53 = 2114;
    v54 = v29;
    __int16 v55 = 2114;
    long long v56 = v31;
    __int16 v57 = 2114;
    id v58 = v42;
    __int16 v59 = 2114;
    id v60 = v12;
    _os_log_debug_impl(&dword_226CA5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Remote context storage has requested that %{public}@peer %{public}@%{public}@ be informed of changes to predicate %{public}@ using identifier %{public}@", buf, 0x3Eu);
    if (v30)
    {
    }
  }

  char v15 = [(_DKSync3Coordinator *)self registrationIdentifierForPeer:v11 remoteRegistrationIdentifier:v12];
  uint64_t v16 = [objc_alloc(MEMORY[0x263F35218]) initWithPlistDictionary:v42];
  long long v17 = (void *)v16;
  if (v11 && v15 && v16)
  {
    objc_initWeak(&location, self);
    long long v18 = [v17 keyPaths];
    long long v19 = (void *)MEMORY[0x263F351E8];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __141___DKSync3Coordinator__DKSyncRemoteContextStorageDelegate__remoteContextStorage_subscribeToChangesWithPeer_registrationIdentifier_predicate___block_invoke;
    v43[3] = &unk_2647DBBC0;
    objc_copyWeak(&v47, &location);
    v43[4] = self;
    id v20 = v12;
    id v44 = v20;
    id v21 = v11;
    id v45 = v21;
    id v22 = v18;
    id v46 = v22;
    int v23 = [v19 registrationWithIdentifier:v15 contextualPredicate:v17 dismissalPolicy:0 deviceSet:0 clientIdentifier:@"com.apple.coreduetd" mustWake:1 callback:v43];
    v24 = [MEMORY[0x263F351B8] userContext];
    [v24 registerCallback:v23];

    v25 = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v39 = [(id)objc_opt_class() description];
      int v32 = [v21 me];
      long long v33 = &stru_26DACFC30;
      if (v32) {
        long long v33 = @"pseudo ";
      }
      __int16 v37 = v33;
      v38 = [v21 identifier];
      v40 = [v21 model];
      if (v40)
      {
        v36 = NSString;
        self = [v21 model];
        long long v34 = [v36 stringWithFormat:@" (%@)", self];
      }
      else
      {
        long long v34 = &stru_26DACFC30;
      }
      *(_DWORD *)buf = 138544642;
      v50 = v39;
      __int16 v51 = 2114;
      v52 = v37;
      __int16 v53 = 2114;
      v54 = v38;
      __int16 v55 = 2114;
      long long v56 = v34;
      __int16 v57 = 2114;
      id v58 = v17;
      __int16 v59 = 2114;
      id v60 = v20;
      _os_log_debug_impl(&dword_226CA5000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully handled remote context storage requested that %{public}@peer %{public}@%{public}@ be informed of changes to predicate %{public}@ using identifier %{public}@", buf, 0x3Eu);
      if (v40)
      {
      }
    }

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
  else
  {
    v26 = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:subscribeToChangesWithPeer:registrationIdentifier:predicate:]();
    }
  }
}

- (void)remoteContextStorage:(id)a3 unsubscribeFromChangesWithPeer:(id)a4 registrationIdentifier:(id)a5 predicate:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F35218]) initWithPlistDictionary:v11];
  v14 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v36 = [(id)objc_opt_class() description];
    int v25 = [v9 me];
    v26 = &stru_26DACFC30;
    v27 = @"pseudo ";
    if (!v25) {
      v27 = &stru_26DACFC30;
    }
    long long v34 = v27;
    int v28 = [v9 identifier];
    v29 = [v9 model];
    if (v29)
    {
      v30 = NSString;
      int v32 = [v9 model];
      v26 = [v30 stringWithFormat:@" (%@)", v32];
    }
    *(_DWORD *)buf = 138544642;
    v38 = v36;
    __int16 v39 = 2114;
    v40 = v34;
    __int16 v41 = 2114;
    id v42 = v28;
    __int16 v43 = 2114;
    id v44 = v26;
    __int16 v45 = 2114;
    id v46 = v11;
    __int16 v47 = 2114;
    id v48 = v10;
    _os_log_debug_impl(&dword_226CA5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Remote context storage has requested that %{public}@peer %{public}@%{public}@ no longer be informed of changes to predicate %{public}@ using identifier %{public}@", buf, 0x3Eu);
    if (v29)
    {
    }
  }

  uint64_t v15 = [(_DKSync3Coordinator *)self registrationIdentifierForPeer:v9 remoteRegistrationIdentifier:v10];
  uint64_t v16 = (void *)v15;
  if (v9 && v15 && v13)
  {
    long long v17 = [MEMORY[0x263F351E8] registrationWithIdentifier:v15 contextualPredicate:v13 dismissalPolicy:0 deviceSet:0 clientIdentifier:@"com.apple.coreduetd" mustWake:1 callback:&__block_literal_global];
    if (v17)
    {
      long long v18 = [MEMORY[0x263F351B8] userContext];
      [v18 deregisterCallback:v17];

      long long v19 = [MEMORY[0x263F34FB8] syncChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v35 = [(id)objc_opt_class() description];
        int v20 = [v9 me];
        id v21 = &stru_26DACFC30;
        id v22 = @"pseudo ";
        if (!v20) {
          id v22 = &stru_26DACFC30;
        }
        long long v33 = v22;
        int v23 = [v9 identifier];
        v24 = [v9 model];
        if (v24)
        {
          long long v31 = NSString;
          int v32 = [v9 model];
          id v21 = [v31 stringWithFormat:@" (%@)", v32];
        }
        *(_DWORD *)buf = 138544642;
        v38 = v35;
        __int16 v39 = 2114;
        v40 = v33;
        __int16 v41 = 2114;
        id v42 = v23;
        __int16 v43 = 2114;
        id v44 = v21;
        __int16 v45 = 2114;
        id v46 = v13;
        __int16 v47 = 2114;
        id v48 = v10;
        _os_log_debug_impl(&dword_226CA5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully handled remote context storage requested that %{public}@peer %{public}@%{public}@ no longer be informed of changes to predicate %{public}@ using identifier %{public}@", buf, 0x3Eu);
        if (v24)
        {
        }
      }
    }
    else
    {
      long long v19 = [MEMORY[0x263F34FB8] syncChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:unsubscribeFromChangesWithPeer:registrationIdentifier:predicate:]();
      }
    }
  }
  else
  {
    long long v17 = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate) remoteContextStorage:hasKnowledgeOfKeyPath:]();
    }
  }
}

- (void)subscribeToContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F35140];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __128___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_handler___block_invoke;
  v15[3] = &unk_2647DBC08;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performSyncBlock:v15];
}

- (void)unsubscribeFromContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F35140];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __132___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_handler___block_invoke;
  v15[3] = &unk_2647DBC08;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performSyncBlock:v15];
}

- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x263F35140];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __116___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToDeviceStatusChangeNotificationsForDeviceTypes_handler___block_invoke;
  v9[3] = &unk_2647DBC30;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 performSyncBlock:v9];
}

- (BOOL)subscribeToContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) subscribeToContextValueChangeNotificationsWithRegistration:deviceIDs:error:]();
  }

  if ([v7 isMultiDeviceRegistration])
  {
    id v22 = v8;
    unint64_t v11 = [(_DKSync3Coordinator *)self peersForContextStoreDeviceIDs:v8];
    int v25 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v24 = [v7 predicate];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * v15);
          transportMDCSRapport = self->_transportMDCSRapport;
          id v18 = [v7 identifier];
          long long v19 = [v24 plistDictionary];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __126___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke;
          v26[3] = &unk_2647DBC58;
          v26[4] = self;
          v26[5] = v16;
          id v27 = v7;
          id v28 = v25;
          [(_DKSyncRemoteContextStorage *)transportMDCSRapport subscribeToContextValueChangeNotificationsFromPeer:v16 registrationIdentifier:v18 predicate:v19 highPriority:1 completion:v26];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v13);
    }

    id v8 = v22;
    if (![obj count])
    {
      int v20 = [MEMORY[0x263F34FB8] syncChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync3Coordinator(_CDRemoteUserContextServer) subscribeToContextValueChangeNotificationsWithRegistration:deviceIDs:error:]();
      }
    }
  }
  else
  {
    obj = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[_DKSync3Coordinator(_CDRemoteUserContextServer) subscribeToContextValueChangeNotificationsWithRegistration:deviceIDs:error:]();
    }
  }

  return 1;
}

- (BOOL)unsubscribeFromContextValueChangeNotificationsWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) unsubscribeFromContextValueChangeNotificationsWithRegistration:deviceIDs:error:]();
  }

  if ([v7 isMultiDeviceRegistration])
  {
    id v22 = v8;
    unint64_t v11 = [(_DKSync3Coordinator *)self peersForContextStoreDeviceIDs:v8];
    v24 = [v7 predicate];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * v15);
          transportMDCSRapport = self->_transportMDCSRapport;
          id v18 = [v7 identifier];
          long long v19 = [v24 plistDictionary];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __130___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke;
          v25[3] = &unk_2647DBC80;
          v25[4] = self;
          v25[5] = v16;
          id v26 = v7;
          [(_DKSyncRemoteContextStorage *)transportMDCSRapport unsubscribeFromContextValueChangeNotificationsFromPeer:v16 registrationIdentifier:v18 predicate:v19 highPriority:1 completion:v25];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    if (![obj count])
    {
      int v20 = [MEMORY[0x263F34FB8] syncChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync3Coordinator(_CDRemoteUserContextServer) unsubscribeFromContextValueChangeNotificationsWithRegistration:deviceIDs:error:]();
      }
    }
    id v8 = v22;
  }
  else
  {
    obj = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[_DKSync3Coordinator(_CDRemoteUserContextServer) unsubscribeFromContextValueChangeNotificationsWithRegistration:deviceIDs:error:]();
    }
  }

  return 1;
}

- (BOOL)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:(unint64_t)a3 error:(id *)a4
{
  id v6 = objc_msgSend(MEMORY[0x263F35140], "underlyingQueue", a3, a4);
  dispatch_assert_queue_V2(v6);

  id v7 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) subscribeToDeviceStatusChangeNotificationsForDeviceTypes:error:]();
  }

  unint64_t watchingDeviceTypes = self->_watchingDeviceTypes;
  if (a3)
  {
    if (!watchingDeviceTypes)
    {
      id v9 = (OS_os_transaction *)os_transaction_create();
      watchingDevicesTransaction = self->_watchingDevicesTransaction;
      self->_watchingDevicesTransaction = v9;
LABEL_8:
    }
  }
  else if (watchingDeviceTypes)
  {
    watchingDevicesTransaction = self->_watchingDevicesTransaction;
    self->_watchingDevicesTransaction = 0;
    goto LABEL_8;
  }
  self->_unint64_t watchingDeviceTypes = a3;
  return 1;
}

- (void)fetchPropertiesOfRemoteKeyPaths:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F35140];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __91___DKSync3Coordinator__CDRemoteUserContextServer__fetchPropertiesOfRemoteKeyPaths_handler___block_invoke;
  v11[3] = &unk_2647DBCD0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performSyncBlock:v11];
}

- (void)_fetchPropertiesOfRemoteKeyPaths:(id)a3 handler:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) _fetchPropertiesOfRemoteKeyPaths:handler:]((uint64_t)self, v5, v8);
  }

  id v9 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  if (![v5 count])
  {
    id v13 = [v9 firstObject];
    v6[2](v6, v13);
    goto LABEL_29;
  }
  __int16 v43 = v9;
  id v44 = v6;
  id v33 = v5;
  id v10 = [(_DKSync3Coordinator *)self keyPathsByDeviceIDFromRemoteKeyPaths:v5];
  unint64_t v11 = [v10 allKeys];
  id v12 = (void *)[v11 mutableCopy];

  id v46 = [MEMORY[0x263F35130] sharedInstance];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v70 count:16];
  if (!v14) {
    goto LABEL_27;
  }
  uint64_t v15 = v14;
  uint64_t v45 = *(void *)v55;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v55 != v45) {
        objc_enumerationMutation(v13);
      }
      id v17 = *(void **)(*((void *)&v54 + 1) + 8 * v16);
      id v18 = [v46 existingPeerWithSourceDeviceID:v17];
      if (v18)
      {
        long long v19 = [v13 objectForKeyedSubscript:v17];
        int v20 = [v19 allObjects];
        id v21 = [MEMORY[0x263F34FB8] syncChannel];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          __int16 v41 = [(id)objc_opt_class() description];
          v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
          int v26 = [v18 me];
          long long v27 = &stru_26DACFC30;
          long long v28 = @"pseudo ";
          if (!v26) {
            long long v28 = &stru_26DACFC30;
          }
          v36 = v28;
          __int16 v39 = [v18 identifier];
          v38 = [v18 model];
          if (v38)
          {
            long long v29 = NSString;
            v35 = [v18 model];
            uint64_t v34 = [v29 stringWithFormat:@" (%@)", v35];
            long long v27 = v34;
          }
          uint64_t v30 = _CDPrettyPrintCollection();
          *(_DWORD *)buf = 138544642;
          __int16 v59 = v41;
          __int16 v60 = 2112;
          uint64_t v61 = v40;
          __int16 v62 = 2114;
          v63 = v36;
          __int16 v64 = 2114;
          v65 = v39;
          __int16 v66 = 2114;
          v67 = v27;
          __int16 v68 = 2114;
          __int16 v37 = (void *)v30;
          uint64_t v69 = v30;
          _os_log_debug_impl(&dword_226CA5000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching properties of %@ key paths from %{public}@peer %{public}@%{public}@: %{public}@", buf, 0x3Eu);
          if (v38)
          {
          }
        }

        transportMDCSRapport = self->_transportMDCSRapport;
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = &__92___DKSync3Coordinator__CDRemoteUserContextServer___fetchPropertiesOfRemoteKeyPaths_handler___block_invoke;
        v47[3] = &unk_2647DBCF8;
        v47[4] = self;
        id v48 = v20;
        id v23 = v18;
        id v49 = v23;
        id v50 = v43;
        id v51 = v12;
        v52 = v17;
        __int16 v53 = v44;
        id v24 = v20;
        [(_DKSyncRemoteContextStorage *)transportMDCSRapport fetchContextValuesFromPeer:v23 forKeyPaths:v24 highPriority:1 completion:v47];

        goto LABEL_12;
      }
      int v25 = [MEMORY[0x263F34FB8] syncChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        long long v31 = [(id)objc_opt_class() description];
        *(_DWORD *)buf = 138543618;
        __int16 v59 = v31;
        __int16 v60 = 2114;
        uint64_t v61 = v17;
        _os_log_error_impl(&dword_226CA5000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch properties of key paths due to unknown peer: %{public}@", buf, 0x16u);
      }
      [v12 removeObject:v17];
      if (![v12 count])
      {
        long long v19 = [v43 firstObject];
        v44[2](v44, v19);
LABEL_12:
      }
      ++v16;
    }
    while (v15 != v16);
    uint64_t v32 = [v13 countByEnumeratingWithState:&v54 objects:v70 count:16];
    uint64_t v15 = v32;
  }
  while (v32);
LABEL_27:

  id v5 = v33;
  id v9 = v43;
  id v6 = v44;
LABEL_29:
}

- (void)requestActivateDevicesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F35140];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85___DKSync3Coordinator__CDRemoteUserContextServer__requestActivateDevicesWithHandler___block_invoke;
  v7[3] = &unk_2647DBD20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsyncBlock:v7];
}

- (void)_requestActivateDevicesWithHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) _requestActivateDevicesWithHandler:]();
  }

  id v7 = [(_DKSync3Coordinator *)self multiDeviceContextStoreDevices];
  uint64_t v8 = [v7 count];
  id v9 = [MEMORY[0x263F34FB8] syncChannel];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:].cold.4();
    }

    id v9 = [MEMORY[0x263F351B8] userContext];
    unint64_t v11 = [(_DKSync2Coordinator *)self deviceUUID];
    [v9 activateDevices:v7 remoteUserContextProxySourceDeviceUUID:v11];
  }
  else if (v10)
  {
    -[_DKSync3Coordinator handleStatusChangeForPeer:previousTransports:]();
  }

  if (v4) {
    v4[2](v4, 0);
  }
}

- (id)keyPathsByDeviceIDFromRemoteKeyPaths:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "deviceID", (void)v15);
        if (v11)
        {
          id v12 = [v4 objectForKeyedSubscript:v11];
          if (!v12)
          {
            id v12 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
            [v4 setObject:v12 forKeyedSubscript:v11];
          }
          id v13 = [v10 key];
          [v12 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)archivedObjectsForKeyPaths:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync3Coordinator(_CDRemoteUserContextServer) archivedObjectsForKeyPaths:]((uint64_t)self, v3);
  }

  objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [MEMORY[0x263F351B8] userContext];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v42 count:16];
  if (v6)
  {
    uint64_t v25 = *(void *)v29;
    *(void *)&long long v7 = 138412290;
    long long v21 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        BOOL v10 = objc_msgSend(v5, "objectForContextualKeyPath:", v9, v21);
        unint64_t v11 = [v5 lastModifiedDateForContextualKeyPath:v9];
        id v12 = [v9 key];
        if (v10)
        {
          id v27 = 0;
          id v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v27];
          id v14 = v27;
          if (v14)
          {
            long long v15 = [MEMORY[0x263F34FB8] syncChannel];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              id v23 = [(id)objc_opt_class() description];
              long long v18 = [v14 domain];
              uint64_t v19 = [v14 code];
              *(_DWORD *)buf = 138544386;
              id v33 = v23;
              __int16 v34 = 2112;
              v35 = v12;
              __int16 v36 = 2114;
              __int16 v37 = v18;
              __int16 v38 = 2048;
              uint64_t v39 = v19;
              __int16 v40 = 2112;
              id v41 = v14;
              _os_log_error_impl(&dword_226CA5000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to archive context object for %@: %{public}@:%lld (%@)", buf, 0x34u);
            }
          }
        }
        else
        {
          id v13 = 0;
        }
        long long v16 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
        long long v17 = v16;
        if (v13) {
          [v16 setObject:v13 forKeyedSubscript:@"object"];
        }
        if (v11) {
          [v17 setObject:v11 forKeyedSubscript:@"modified"];
        }
        [v26 setObject:v17 forKeyedSubscript:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v42 count:16];
    }
    while (v6);
  }

  return v26;
}

- (void)setArchivedObjects:(id)a3 peer:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v37 = a4;
  long long v7 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    long long v28 = [(id)objc_opt_class() description];
    long long v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    if ([v37 me]) {
      long long v30 = @"pseudo ";
    }
    else {
      long long v30 = &stru_26DACFC30;
    }
    long long v31 = [v37 identifier];
    uint64_t v32 = [v37 model];
    if (v32)
    {
      __int16 v34 = NSString;
      id v4 = [v37 model];
      id v33 = [v34 stringWithFormat:@" (%@)", v4];
    }
    else
    {
      id v33 = &stru_26DACFC30;
    }
    *(_DWORD *)buf = 138544386;
    id v48 = v28;
    __int16 v49 = 2112;
    uint64_t v50 = (uint64_t)v29;
    __int16 v51 = 2114;
    v52 = v30;
    __int16 v53 = 2114;
    uint64_t v54 = (uint64_t)v31;
    __int16 v55 = 2114;
    long long v56 = v33;
    _os_log_debug_impl(&dword_226CA5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Setting %@ archived objects from %{public}@peer %{public}@%{public}@", buf, 0x34u);
    if (v32)
    {
    }
  }

  v35 = [MEMORY[0x263F351D8] supportedContextValueClasses];
  __int16 v36 = [MEMORY[0x263F351B8] userContext];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v6;
  uint64_t v39 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v39)
  {
    id v9 = 0;
    goto LABEL_25;
  }
  id v9 = 0;
  uint64_t v38 = *(void *)v43;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v43 != v38) {
        objc_enumerationMutation(obj);
      }
      unint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * v10);
      id v12 = [obj objectForKeyedSubscript:v11];
      id v13 = [v12 objectForKeyedSubscript:@"object"];
      id v14 = [v12 objectForKeyedSubscript:@"modified"];
      if (!v13)
      {
        long long v15 = 0;
LABEL_13:
        long long v18 = [MEMORY[0x263F351F0] keyPathWithKey:v11];
        uint64_t v19 = (void *)MEMORY[0x263F351F0];
        uint64_t v20 = [v37 sourceDeviceID];
        long long v21 = [v19 remoteKeyPathForKeyPath:v18 forDeviceID:v20];

        [v36 setObject:v15 lastModifiedDate:v14 forContextualKeyPath:v21];
        goto LABEL_14;
      }
      id v41 = v9;
      long long v15 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v35 fromData:v13 error:&v41];
      long long v16 = v41;

      if (v16)
      {
        long long v17 = [MEMORY[0x263F34FB8] syncChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v22 = [(id)objc_opt_class() description];
          id v23 = [(__CFString *)v16 domain];
          uint64_t v24 = [(__CFString *)v16 code];
          *(_DWORD *)buf = 138544386;
          id v48 = v22;
          __int16 v49 = 2112;
          uint64_t v50 = (uint64_t)v11;
          __int16 v51 = 2114;
          v52 = v23;
          __int16 v53 = 2048;
          uint64_t v54 = v24;
          __int16 v55 = 2112;
          long long v56 = v16;
          _os_log_error_impl(&dword_226CA5000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive context object for %@: %{public}@:%lld (%@)", buf, 0x34u);
        }
        id v9 = v16;
        goto LABEL_13;
      }
      if ([(__CFString *)v15 conformsToProtocol:&unk_26DAD4868]
        && ([(__CFString *)v15 conformsToProtocol:&unk_26DAD4910] & 1) != 0)
      {
        id v9 = 0;
        goto LABEL_13;
      }
      long long v18 = [MEMORY[0x263F34FB8] syncChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = [(id)objc_opt_class() description];
        uint64_t v26 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        id v48 = v25;
        __int16 v49 = 2114;
        uint64_t v50 = v26;
        __int16 v51 = 2112;
        v52 = v15;
        _os_log_error_impl(&dword_226CA5000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Rejecting invalid object of class %{public}@ for not implementing protocols: %@", buf, 0x20u);
      }
      id v9 = 0;
LABEL_14:

      ++v10;
    }
    while (v39 != v10);
    uint64_t v27 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    uint64_t v39 = v27;
  }
  while (v27);
LABEL_25:
}

- (void)sendContextValuesToPeer:(id)a3 registrationIdentifier:(id)a4 keyPaths:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [MEMORY[0x263F35140] underlyingQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [MEMORY[0x263F34FB8] syncChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v37 = [(id)objc_opt_class() description];
    int v16 = [v8 me];
    long long v17 = &stru_26DACFC30;
    long long v18 = @"pseudo ";
    if (!v16) {
      long long v18 = &stru_26DACFC30;
    }
    id v33 = v18;
    v35 = [v8 identifier];
    uint64_t v19 = [v8 model];
    if (v19)
    {
      uint64_t v20 = NSString;
      long long v31 = [v8 model];
      long long v17 = [v20 stringWithFormat:@" (%@)", v31];
    }
    long long v21 = [v10 valueForKey:@"key"];
    _CDPrettyPrintCollection();
    id v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    long long v43 = v37;
    __int16 v44 = 2114;
    long long v45 = v33;
    __int16 v46 = 2114;
    __int16 v47 = v35;
    __int16 v48 = 2114;
    __int16 v49 = v17;
    __int16 v50 = 2114;
    __int16 v51 = v22;
    _os_log_debug_impl(&dword_226CA5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: Sending context values to %{public}@peer %{public}@%{public}@ for key paths: %{public}@", buf, 0x34u);

    if (v19)
    {
    }
  }

  if (v8 && v9 && [v10 count])
  {
    id v13 = [(_DKSync3Coordinator *)self archivedObjectsForKeyPaths:v10];
    id v14 = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v38 = [(id)objc_opt_class() description];
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v13, "count"));
      __int16 v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v23 = [v8 me];
      uint64_t v24 = &stru_26DACFC30;
      uint64_t v25 = @"pseudo ";
      if (!v23) {
        uint64_t v25 = &stru_26DACFC30;
      }
      uint64_t v32 = v25;
      __int16 v34 = [v8 identifier];
      uint64_t v26 = [v8 model];
      if (v26)
      {
        uint64_t v27 = NSString;
        long long v30 = [v8 model];
        uint64_t v24 = [v27 stringWithFormat:@" (%@)", v30];
      }
      long long v28 = [v10 valueForKey:@"key"];
      long long v29 = _CDPrettyPrintCollection();
      *(_DWORD *)buf = 138544642;
      long long v43 = v38;
      __int16 v44 = 2112;
      long long v45 = v36;
      __int16 v46 = 2114;
      __int16 v47 = v32;
      __int16 v48 = 2114;
      __int16 v49 = v34;
      __int16 v50 = 2114;
      __int16 v51 = v24;
      __int16 v52 = 2114;
      __int16 v53 = v29;
      _os_log_debug_impl(&dword_226CA5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ context values to send to %{public}@peer %{public}@%{public}@ for key paths: %{public}@", buf, 0x3Eu);

      if (v26)
      {
      }
    }

    transportMDCSRapport = self->_transportMDCSRapport;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke;
    v39[3] = &unk_2647DBC80;
    v39[4] = self;
    id v40 = v8;
    id v41 = v10;
    [(_DKSyncRemoteContextStorage *)transportMDCSRapport sendContextValuesToPeer:v40 registrationIdentifier:v9 archivedObjects:v13 highPriority:1 completion:v39];
  }
  else
  {
    id v13 = [MEMORY[0x263F34FB8] syncChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DKSync3Coordinator(_CDRemoteUserContextServer) sendContextValuesToPeer:registrationIdentifier:keyPaths:]();
    }
  }
}

- (id)registrationIdentifierForPeer:(id)a3 remoteRegistrationIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = [v5 sourceDeviceID];

  id v8 = 0;
  if (v6 && v7)
  {
    id v9 = NSString;
    id v10 = [v5 sourceDeviceID];
    id v8 = [v9 stringWithFormat:@"%@ for device %@", v6, v10];
  }
  return v8;
}

- (id)peersForContextStoreDeviceIDs:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = [MEMORY[0x263F35130] sharedInstance];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v20;
    unint64_t v11 = 0x263F34000uLL;
    *(void *)&long long v8 = 138543618;
    long long v18 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v14 = objc_msgSend(v5, "existingPeerWithSourceDeviceID:", v13, v18);
        if (v14)
        {
          [v4 addObject:v14];
        }
        else
        {
          long long v15 = [*(id *)(v11 + 4024) syncChannel];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v16 = [(id)objc_opt_class() description];
            *(_DWORD *)buf = v18;
            uint64_t v24 = v16;
            __int16 v25 = 2112;
            uint64_t v26 = v13;
            _os_log_error_impl(&dword_226CA5000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unknown peer context store device id: %@", buf, 0x16u);

            unint64_t v11 = 0x263F34000;
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }

  return v4;
}

- (void)handleStatusChangeForPeer:previousTransports:.cold.3()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_226CA5000, v1, v2, "%{public}@: No devices to activate via client context", v3, v4, v5, v6, v7);
}

- (void)handleStatusChangeForPeer:previousTransports:.cold.4()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [(id)objc_opt_class() description];
  uint64_t v2 = [v0 valueForKeyPath:@"deviceID"];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226CA5000, v4, v5, "%{public}@: Will activate devices via client context: %{public}@", v6, v7, v8, v9, v10);
}

- (void)handleContextChangedNotification:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_226CA5000, v1, v2, "%{public}@: Received context changed notification: %@", v3, v4, v5, v6, v7);
}

@end