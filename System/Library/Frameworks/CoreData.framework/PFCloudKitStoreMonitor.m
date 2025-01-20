@interface PFCloudKitStoreMonitor
- (NSManagedObjectContext)newBackgroundContextForMonitoredCoordinator;
- (id)initForStore:(id)a3;
- (uint64_t)retainedMonitoredStore;
- (void)coordinatorWillRemoveStore:(id)a3;
- (void)dealloc;
- (void)performBlock:(uint64_t)a1;
@end

@implementation PFCloudKitStoreMonitor

- (id)initForStore:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PFCloudKitStoreMonitor;
  v4 = [(PFCloudKitStoreMonitor *)&v17 init];
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_storeIsAlive = 0;
    v4->_monitorGroup = (OS_dispatch_group *)dispatch_group_create();
    v5->_aliveLock._os_unfair_lock_opaque = 0;
    *(void *)&v5->_retryCount = 0xA00000000;
    v5->_storeIdentifier = (NSString *)(id)[a3 identifier];
    v6 = (void *)MEMORY[0x18C127630]();
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    storeIdentifier = v5->_storeIdentifier;
    id v8 = (id)[a3 URL];
    id v9 = (id)[a3 persistentStoreCoordinator];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__PFCloudKitStoreMonitor_initForStore___block_invoke;
    v12[3] = &unk_1E544C8D0;
    v12[4] = v5;
    v12[5] = v9;
    v12[6] = storeIdentifier;
    v12[7] = &v13;
    [v9 performBlockAndWait:v12];
    int v10 = *((unsigned __int8 *)v14 + 24);
    v5->_storeIsAlive = v10;
    if (v10)
    {
      objc_storeWeak((id *)&v5->_monitoredCoordinator, v9);
      objc_storeWeak((id *)&v5->_monitoredStore, a3);
    }

    _Block_object_dispose(&v13, 8);
  }
  return v5;
}

uint64_t __39__PFCloudKitStoreMonitor_initForStore___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", *(void *)(a1 + 32), sel_coordinatorWillRemoveStore_, @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification", 0);
  uint64_t result = [*(id *)(a1 + 40) persistentStoreForIdentifier:*(void *)(a1 + 48)];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

- (void)dealloc
{
  self->_storeIdentifier = 0;
  dispatch_release((dispatch_object_t)self->_monitorGroup);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification", 0);
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitStoreMonitor;
  [(PFCloudKitStoreMonitor *)&v3 dealloc];
}

- (void)coordinatorWillRemoveStore:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = (id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"removed");
  if (-[NSString isEqualToString:](self->_storeIdentifier, "isEqualToString:", [v4 identifier])
    && objc_loadWeak((id *)&self->_monitoredStore) == v4)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)&self->_storeIsAlive = 256;
    os_unfair_lock_unlock(&self->_aliveLock);
    int retryCount = self->_retryCount;
    while (1)
    {
      self->_int retryCount = retryCount + 1;
      monitorGroup = self->_monitorGroup;
      dispatch_time_t v7 = dispatch_time(0, 1000000000 * self->_timeoutSeconds);
      intptr_t v8 = dispatch_group_wait(monitorGroup, v7);
      id v9 = (void *)MEMORY[0x18C127630]();
      if (!v8) {
        break;
      }
      BOOL v10 = __ckLoggingOverride != 0;
      uint64_t v11 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Exporter / importer didn't tear down after 5 seconds, retrying (%d)."];
      _NSCoreDataLog(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[PFCloudKitStoreMonitor pfcloudstoremonitor_is_holding_your_store_open_waiting_for_cloudkit_activity_to_finish]");
      int retryCount = self->_retryCount;
      if (retryCount >= 10) {
        goto LABEL_12;
      }
    }
    if ((unint64_t)__ckLoggingOverride >= 0x10) {
      uint64_t v18 = 16;
    }
    else {
      uint64_t v18 = __ckLoggingOverride;
    }
    uint64_t v19 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Exporter / importer finished after %d tries. Allowing store to deallocate."];
    _NSCoreDataLog(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[PFCloudKitStoreMonitor pfcloudstoremonitor_is_holding_your_store_open_waiting_for_cloudkit_activity_to_finish]");
    if (self->_retryCount < 10) {
      goto LABEL_14;
    }
LABEL_12:
    uint64_t v26 = [NSString stringWithUTF8String:"PFCloudKitStoreMonitor failed to tear down gracefully, this means requests are probably about to fail: %@ - %@"];
    _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)self);
    v33 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      storeIdentifier = self->_storeIdentifier;
      *(_DWORD *)buf = 138412546;
      v36 = self;
      __int16 v37 = 2112;
      v38 = storeIdentifier;
      _os_log_fault_impl(&dword_18AB82000, v33, OS_LOG_TYPE_FAULT, "CoreData: PFCloudKitStoreMonitor failed to tear down gracefully, this means requests are probably about to fail: %@ - %@", buf, 0x16u);
    }
LABEL_14:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification", 0);
    objc_storeWeak((id *)&self->_monitoredCoordinator, 0);
    objc_storeWeak((id *)&self->_monitoredStore, 0);
  }
}

- (void)performBlock:(uint64_t)a1
{
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if (a2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 8));
      (*(void (**)(uint64_t))(a2 + 16))(a2);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 8));
    }
    else
    {
      id WeakRetained = 0;
    }
  }
}

- (uint64_t)retainedMonitoredStore
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = 0;
  intptr_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  BOOL v10 = __Block_byref_object_copy__58;
  uint64_t v11 = __Block_byref_object_dispose__58;
  uint64_t v12 = 0;
  if (*(unsigned char *)(a1 + 20) && !*(unsigned char *)(a1 + 21))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __48__PFCloudKitStoreMonitor_retainedMonitoredStore__block_invoke;
      v6[3] = &unk_1E544C3F0;
      v6[5] = a1;
      v6[6] = &v7;
      v6[4] = WeakRetained;
      [WeakRetained performBlockAndWait:v6];
    }

    uint64_t v2 = v8[5];
    if (!v2)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(a1 + 20) = 256;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      uint64_t v2 = v8[5];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v2;
}

id __48__PFCloudKitStoreMonitor_retainedMonitoredStore__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) persistentStoreForIdentifier:*(void *)(*(void *)(a1 + 40) + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (NSManagedObjectContext)newBackgroundContextForMonitoredCoordinator
{
  v36[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [(NSManagedObjectContext *)v2 setPersistentStoreCoordinator:WeakRetained];
    [(NSManagedObjectContext *)v2 _setAllowAncillaryEntities:1];
    if (v2) {
      *(_DWORD *)&v2->_flags &= ~0x10000000u;
    }
    [(NSManagedObjectContext *)v2 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    if (*(void *)(a1 + 48))
    {
      v36[0] = *(void *)(a1 + 48);
      id v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      if (v2)
      {
        uint64_t v5 = [v4 copy];

        v2->_persistentStoreIdentifiers = (NSArray *)v5;
      }
      if ([WeakRetained persistentStoreForIdentifier:*(void *)(a1 + 48)]) {
        goto LABEL_15;
      }
      uint64_t v6 = [NSString stringWithUTF8String:"Called after the store is dead. This method needs to be called inside a performBlock on the store monitor: %@"];
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, a1);
      uint64_t v13 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = a1;
      uint64_t v14 = "CoreData: Called after the store is dead. This method needs to be called inside a performBlock on the store monitor: %@";
      goto LABEL_13;
    }
    uint64_t v24 = [NSString stringWithUTF8String:"Attempt to create context without a store identifier."];
    _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, v33);
    uint64_t v31 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v14 = "CoreData: Attempt to create context without a store identifier.";
      uint64_t v22 = v31;
      uint32_t v23 = 2;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v15 = [NSString stringWithUTF8String:"Called after the store is dead. This method needs to be called inside a performBlock on the store monitor: %@"];
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, a1);
    uint64_t v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = a1;
      uint64_t v14 = "CoreData: Called after the store is dead. This method needs to be called inside a performBlock on the store monitor: %@";
LABEL_13:
      uint64_t v22 = v13;
      uint32_t v23 = 12;
LABEL_18:
      _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, v14, buf, v23);
    }
  }
LABEL_15:

  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_monitoredStore);

  objc_destroyWeak((id *)&self->_monitoredCoordinator);
}

@end