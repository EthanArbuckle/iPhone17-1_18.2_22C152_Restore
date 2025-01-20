@interface MSPSyncManager
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (MSPSyncManager)init;
- (id)_wrapPin:(id)a3 changeType:(int64_t)a4;
- (id)pins;
- (id)readPins;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)_addPin:(id)a3;
- (void)_applyAddItem:(id)a3;
- (void)_applyDeleteItem:(id)a3;
- (void)_applyUpdateItem:(id)a3;
- (void)_clearAllNanoPersistableData;
- (void)_notifyObservers;
- (void)_removePin:(id)a3;
- (void)_resumeSyncService;
- (void)_setHasChangesAvailable;
- (void)_updateFromDisk;
- (void)_updatePin:(id)a3;
- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)setDroppedPin:(id)a3;
- (void)setNeedsFullSync;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation MSPSyncManager

- (MSPSyncManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)MSPSyncManager;
  v2 = [(MSPSyncManager *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.companionsync.save", v3);
    saveQueue = v2->_saveQueue;
    v2->_saveQueue = (OS_dispatch_queue *)v4;

    [(MSPSyncManager *)v2 _updateFromDisk];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v6 = (void *)_MergedGlobals_47;
    uint64_t v24 = _MergedGlobals_47;
    if (!_MergedGlobals_47)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __getSYServiceClass_block_invoke;
      v19 = &unk_1E617CA58;
      v20 = &v21;
      __getSYServiceClass_block_invoke((uint64_t)&v16);
      v6 = (void *)v22[3];
    }
    v7 = v6;
    _Block_object_dispose(&v21, 8);
    uint64_t v8 = [[v7 alloc] initWithService:@"com.apple.private.alloy.maps.sync" priority:0 asMasterStore:1 options:0];
    service = v2->_service;
    v2->_service = (SYService *)v8;

    [(SYService *)v2->_service setDelegate:v2 queue:v2->_saveQueue];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v10 = (void *)qword_1EB7F4640;
    uint64_t v24 = qword_1EB7F4640;
    if (!qword_1EB7F4640)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __getNRPairedDeviceRegistryClass_block_invoke_0;
      v19 = &unk_1E617CA58;
      v20 = &v21;
      __getNRPairedDeviceRegistryClass_block_invoke_0((uint64_t)&v16);
      v10 = (void *)v22[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v21, 8);
    v12 = [v11 sharedInstance];
    v13 = [v12 getActivePairedDevice];

    if (v13) {
      [(MSPSyncManager *)v2 _resumeSyncService];
    }
  }
  return v2;
}

- (void)_resumeSyncService
{
  service = self->_service;
  uint64_t v3 = 0;
  [(SYService *)service resume:&v3];
}

- (void)setNeedsFullSync
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = NSStringFromSelector(a2);
    BOOL resetSyncRequested = self->_resetSyncRequested;
    int v7 = 138478083;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    BOOL v10 = resetSyncRequested;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@ (resetSyncRequested:%i)", (uint8_t *)&v7, 0x12u);
  }
  if (!self->_resetSyncRequested)
  {
    self->_BOOL resetSyncRequested = 1;
    [(SYService *)self->_service setNeedsResetSync];
  }
}

- (void)_setHasChangesAvailable
{
  if (!self->_resetSyncRequested)
  {
    uint64_t v3 = self->_pendingSyncItems;
    objc_sync_enter(v3);
    uint64_t v4 = [(NSMutableArray *)self->_pendingSyncItems count];
    objc_sync_exit(v3);

    if (v4)
    {
      service = self->_service;
      [(SYService *)service setHasChangesAvailable];
    }
  }
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    BOOL resetSyncRequested = self->_resetSyncRequested;
    *(_DWORD *)buf = 138478083;
    v26 = @"startSession";
    __int16 v27 = 1024;
    BOOL v28 = resetSyncRequested;
    _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@ (resetSyncRequested:%i)", buf, 0x12u);
  }

  if (self->_resetSyncRequested)
  {
    self->_BOOL resetSyncRequested = 0;
    uint64_t v11 = self->_pendingSyncItems;
    objc_sync_enter(v11);
    [(MSPSyncManager *)self _updateFromDisk];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = self->_pins;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v12);
          }
          pendingSyncItems = self->_pendingSyncItems;
          uint64_t v17 = -[MSPSyncManager _wrapPin:changeType:](self, "_wrapPin:changeType:", *(void *)(*((void *)&v20 + 1) + 8 * i), 1, (void)v20);
          [(NSMutableArray *)pendingSyncItems addObject:v17];
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    objc_sync_exit(v11);
    [(MSPSyncManager *)self preparingSync];
  }
  objc_msgSend(v8, "setDelegate:", self, (void)v20);
  v18 = objc_alloc_init(MSPSerializer);
  [v8 setSerializer:v18];

  [v8 setTargetQueue:self->_saveQueue];
  return 1;
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    id v12 = v7;
    __int16 v13 = 2113;
    id v14 = v8;
    _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:didSwitchFromPairingID:%{private}@ toPairingID:%{private}@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MSPSyncManager_service_didSwitchFromPairingID_toPairingID___block_invoke;
  block[3] = &unk_1E617C770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__MSPSyncManager_service_didSwitchFromPairingID_toPairingID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeSyncService];
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v35 = (uint64_t (**)(void))a4;
  uint64_t v31 = *MEMORY[0x1E4F63E40];
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v49 = @"enqueueChanges";
    _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@", buf, 0xCu);
  }

  obja = self->_pendingSyncItems;
  objc_sync_enter(obja);
  v37 = (void *)[(NSMutableArray *)self->_pendingSyncItems mutableCopy];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  pendingSyncItems = self->_pendingSyncItems;
  self->_pendingSyncItems = v8;

  objc_sync_exit(obja);
  uint64_t v10 = [v37 firstObject];
  if (v10)
  {
    uint64_t v11 = v10;
    while (1)
    {
      v36 = v11;
      if ((v35[2]() & 1) == 0) {
        break;
      }
      [v37 removeObjectAtIndex:0];
      uint64_t v12 = [v37 firstObject];

      uint64_t v11 = v12;
      if (!v12) {
        goto LABEL_7;
      }
    }
    obuint64_t j = self->_pendingSyncItems;
    objc_sync_enter(obj);
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableArray count](self->_pendingSyncItems, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v16 = self->_pendingSyncItems;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v16);
          }
          long long v20 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "syncId", v31);
          [v15 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v17);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v21 = v37;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v22)
    {
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          __int16 v27 = objc_msgSend(v26, "syncId", v31);
          char v28 = [v15 containsObject:v27];

          if ((v28 & 1) == 0) {
            [(NSMutableArray *)self->_pendingSyncItems insertObject:v26 atIndex:v23++];
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v22);
    }

    objc_sync_exit(obj);
    uint64_t v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v49 = @"continue";
      _os_log_impl(&dword_1B87E5000, v29, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@", buf, 0xCu);
    }

    unsigned int v13 = 1;
    id v14 = v36;
  }
  else
  {
LABEL_7:
    if (objc_msgSend(v34, "isResetSync", v31)) {
      [(MSPSyncManager *)self completedPreparingSync];
    }
    GEOFindOrCreateLog();
    v14 = unsigned int v13 = 2;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v49 = @"sendComplete";
      _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@", buf, 0xCu);
    }
  }

  return v13;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t, void))a5;
  __int16 v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v23 = @"applyChanges";
    _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v17 + 1) + 8 * v14);
        uint64_t v16 = objc_msgSend(v15, "changeType", (void)v17);
        switch(v16)
        {
          case 3:
            [(MSPSyncManager *)self _applyDeleteItem:v15];
            break;
          case 2:
            [(MSPSyncManager *)self _applyUpdateItem:v15];
            break;
          case 1:
            [(MSPSyncManager *)self _applyAddItem:v15];
            break;
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (v8)
  {
    v8[2](v8, 1, 0);
    [(MSPSyncManager *)self _notifyObservers];
  }
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138478339;
    id v10 = @"complete";
    __int16 v11 = 1024;
    int v12 = [v6 isResetSync];
    __int16 v13 = 2113;
    id v14 = v7;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@ (resetSync:%i error:%{private}@)", (uint8_t *)&v9, 0x1Cu);
  }

  if ([v6 isResetSync]) {
    [(MSPSyncManager *)self completedSync];
  }
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138477827;
    id v8 = @"resetDataStore";
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync Isync:%{private}@", (uint8_t *)&v7, 0xCu);
  }

  [(MSPSyncManager *)self _clearAllNanoPersistableData];
  return 1;
}

- (void)_clearAllNanoPersistableData
{
  [(NSMutableArray *)self->_pins removeAllObjects];
  [(NSMutableDictionary *)self->_pinsMap removeAllObjects];
  obuint64_t j = self->_pendingSyncItems;
  objc_sync_enter(obj);
  [(NSMutableArray *)self->_pendingSyncItems removeAllObjects];
  objc_sync_exit(obj);
}

- (void)_applyAddItem:(id)a3
{
  id v5 = a3;
  if ([v5 hasPin])
  {
    uint64_t v4 = [v5 pin];
    [(MSPSyncManager *)self _addPin:v4];
  }
}

- (void)_applyUpdateItem:(id)a3
{
  id v5 = a3;
  if ([v5 hasPin])
  {
    uint64_t v4 = [v5 pin];
    [(MSPSyncManager *)self _updatePin:v4];
  }
}

- (void)_applyDeleteItem:(id)a3
{
  id v5 = a3;
  if ([v5 hasPin])
  {
    uint64_t v4 = [v5 pin];
    [(MSPSyncManager *)self _removePin:v4];
  }
}

- (void)_notifyObservers
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_pins copyItems:1];
  saveQueue = self->_saveQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__MSPSyncManager__notifyObservers__block_invoke;
  v6[3] = &unk_1E617C510;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(saveQueue, v6);
}

uint64_t __34__MSPSyncManager__notifyObservers__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) writePins:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 notifyObservers];
}

- (void)_updateFromDisk
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  pendingSyncItems = self->_pendingSyncItems;
  self->_pendingSyncItems = v3;

  id v5 = [(MSPSyncManager *)self readPins];
  id v6 = (NSMutableArray *)[v5 mutableCopy];
  pins = self->_pins;
  self->_pins = v6;

  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  pinsMap = self->_pinsMap;
  self->_pinsMap = v8;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = self->_pins;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
        uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = self->_pinsMap;
        long long v17 = objc_msgSend(v15, "identifier", (void)v18);
        [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (id)_wrapPin:(id)a3 changeType:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MSPCompanionSyncedItem);
  id v7 = [v5 identifier];
  id v8 = +[MSPCompanionSyncedItem syncIdWithPrefix:@"pin:" identifier:v7];
  [(MSPCompanionSyncedItem *)v6 setSyncId:v8];

  [(MSPCompanionSyncedItem *)v6 setPin:v5];
  [(MSPCompanionSyncedItem *)v6 setSyChangeType:a4];

  return v6;
}

- (void)_addPin:(id)a3
{
  pins = self->_pins;
  id v5 = a3;
  [(NSMutableArray *)pins addObject:v5];
  pinsMap = self->_pinsMap;
  id v7 = [v5 identifier];
  [(NSMutableDictionary *)pinsMap setObject:v5 forKey:v7];
}

- (void)_updatePin:(id)a3
{
  pinsMap = self->_pinsMap;
  id v5 = a3;
  id v6 = [v5 identifier];
  id v9 = [(NSMutableDictionary *)pinsMap objectForKeyedSubscript:v6];

  [(NSMutableArray *)self->_pins removeObject:v9];
  [(NSMutableArray *)self->_pins addObject:v5];
  id v7 = self->_pinsMap;
  id v8 = [v5 identifier];
  [(NSMutableDictionary *)v7 setObject:v5 forKey:v8];
}

- (void)_removePin:(id)a3
{
  id v5 = [a3 identifier];
  uint64_t v4 = [(NSMutableDictionary *)self->_pinsMap objectForKeyedSubscript:v5];
  [(NSMutableArray *)self->_pins removeObject:v4];
  [(NSMutableDictionary *)self->_pinsMap removeObjectForKey:v5];
}

- (id)pins
{
  v2 = (void *)[(NSMutableArray *)self->_pins copy];

  return v2;
}

- (void)setDroppedPin:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_pendingSyncItems;
  objc_sync_enter(v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (void *)[(NSMutableArray *)self->_pins copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = v7;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        [(MSPSyncManager *)self _removePin:v12];
        pendingSyncItems = self->_pendingSyncItems;
        id v14 = [(MSPSyncManager *)self _wrapPin:v12 changeType:3];
        [(NSMutableArray *)pendingSyncItems addObject:v14];
      }
      uint64_t v10 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  if (v4)
  {
    [(MSPSyncManager *)self _addPin:v4];
    uint64_t v15 = self->_pendingSyncItems;
    uint64_t v16 = [(MSPSyncManager *)self _wrapPin:v4 changeType:1];
    [(NSMutableArray *)v15 addObject:v16];

    objc_sync_exit(v5);
LABEL_11:
    [(MSPSyncManager *)self writePins:self->_pins];
    [(MSPSyncManager *)self _setHasChangesAvailable];
    goto LABEL_12;
  }
  objc_sync_exit(v5);

  if (v8) {
    goto LABEL_11;
  }
LABEL_12:
}

- (id)readPins
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSyncItems, 0);
  objc_storeStrong((id *)&self->_pinsMap, 0);
  objc_storeStrong((id *)&self->_pins, 0);
  objc_storeStrong((id *)&self->_saveQueue, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end