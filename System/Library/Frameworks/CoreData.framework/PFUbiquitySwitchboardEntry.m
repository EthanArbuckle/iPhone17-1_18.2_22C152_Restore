@interface PFUbiquitySwitchboardEntry
- (BOOL)finishSetupForStore:(void *)a3 withSetupAssistant:(int)a4 synchronously:(uint64_t *)a5 error:(uint64_t)a6 finishBlock:;
- (PFUbiquitySwitchboardEntry)init;
- (PFUbiquitySwitchboardEntry)initWithLocalPeerID:(id)a3 storeName:(id)a4 withURL:(id)a5 ubiquityRootLocation:(id)a6 andLocalRootLocation:(id)a7;
- (id)createSetOfPersistentStoreCoordinatorsRegisteredForStoreName:(uint64_t)a1;
- (id)description;
- (uint64_t)createSetOfActiveStoreNames;
- (uint64_t)unregisterPersistentStoreCoordinator:(uint64_t)result;
- (void)afterDelay:(double)a3 executeBlockOnPrivateQueue:;
- (void)containerIdentifierChanged:(id)a3;
- (void)dealloc;
- (void)entryWillBeRemovedFromSwitchboard;
- (void)executeBlockOnPrivateQueue:(uint64_t)a1;
- (void)filePresenterNoticedBaselineFileChange:(id)a3;
- (void)filePresenterWasNotifiedTransactionLogs:(id)a3;
- (void)registerPersistentStore:(uint64_t)a3 withStoreName:;
- (void)setUbiquityRootLocation:(uint64_t)a1;
- (void)setupFinished;
- (void)unregisterPersistentStore:(uint64_t)a3 inCoordinator:;
@end

@implementation PFUbiquitySwitchboardEntry

- (PFUbiquitySwitchboardEntry)init
{
  return 0;
}

- (PFUbiquitySwitchboardEntry)initWithLocalPeerID:(id)a3 storeName:(id)a4 withURL:(id)a5 ubiquityRootLocation:(id)a6 andLocalRootLocation:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)PFUbiquitySwitchboardEntry;
  id v12 = [(PFUbiquitySwitchboardEntry *)&v15 init];
  if (v12)
  {
    *((void *)v12 + 1) = a3;
    *((void *)v12 + 2) = a4;
    *((void *)v12 + 3) = [a5 copy];
    id v13 = a7;
    *((void *)v12 + 4) = 0;
    *((void *)v12 + 5) = v13;
    *((void *)v12 + 8) = 0;
    *((void *)v12 + 9) = 0;
    *((void *)v12 + 10) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v12 + 11) = 0;
    *((void *)v12 + 14) = dispatch_queue_create("com.apple.coredata.ubiquity.entry.pq", 0);
    *((void *)v12 + 7) = [[PFUbiquityFilePresenter alloc] initWithUbiquityRootLocation:*((void *)v12 + 5) localPeerID:a3 storeName:*((void *)v12 + 2) processingQueue:*((void *)v12 + 14)];
    *((_WORD *)v12 + 48) = 0;
    *((void *)v12 + 13) = 0;
    self;
    -[PFUbiquitySwitchboard _addFilePresenter:](_sharedSwitchboard, *((void *)v12 + 7));
    -[PFUbiquitySwitchboardEntry setUbiquityRootLocation:]((uint64_t)v12, a6);
  }
  return (PFUbiquitySwitchboardEntry *)v12;
}

- (void)setUbiquityRootLocation:(uint64_t)a1
{
  if (a1 && *(void **)(a1 + 32) != a2)
  {
    if (*(void *)(a1 + 48))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", a1, @"PFUbiquityFilePresenterBaselineFileChangedNotification", *(void *)(a1 + 48));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", a1, @"PFUbiquityFilePresenterDiscoveredLogLocationsNotification", *(void *)(a1 + 48));
      self;
      -[PFUbiquitySwitchboard _removeFilePresenter:](_sharedSwitchboard, *(void **)(a1 + 48));

      *(void *)(a1 + 48) = 0;
    }
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4)
    {
      -[PFUbiquityContainerMonitor stopMonitor](v4);

      *(void *)(a1 + 64) = 0;
    }

    id v5 = a2;
    *(void *)(a1 + 32) = v5;
    if (v5)
    {
      *(void *)(a1 + 48) = [[PFUbiquityFilePresenter alloc] initWithUbiquityRootLocation:a2 localPeerID:*(void *)(a1 + 8) storeName:*(void *)(a1 + 16) processingQueue:*(void *)(a1 + 112)];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_filePresenterWasNotifiedTransactionLogs_, @"PFUbiquityFilePresenterDiscoveredLogLocationsNotification", *(void *)(a1 + 48));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_filePresenterNoticedBaselineFileChange_, @"PFUbiquityFilePresenterBaselineFileChangedNotification", *(void *)(a1 + 48));
      self;
      -[PFUbiquitySwitchboard _addFilePresenter:](_sharedSwitchboard, *(void *)(a1 + 48));
      *(void *)(a1 + 64) = [[PFUbiquityContainerMonitor alloc] initWithProcessingQueue:*(void *)(a1 + 112) localPeerID:*(void *)(a1 + 8) storeName:*(void *)(a1 + 16) andUbiquityRootLocation:*(void *)(a1 + 32)];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_containerIdentifierChanged_, @"PFUbiquityContainerMonitorDidChangeContainerIdentifierNotification", *(void *)(a1 + 64));
    }
    uint64_t v6 = *(void *)(a1 + 88);
    -[PFUbiquitySwitchboardEntryMetadata setUbiquityRootLocation:](v6, a2);
  }
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  self;
  -[PFUbiquitySwitchboard removeEntryFromPreviousEntries:](_sharedSwitchboard, self);
  if (self->_fp)
  {
    self;
    -[PFUbiquitySwitchboard _removeFilePresenter:](_sharedSwitchboard, &self->_fp->super.isa);
  }
  if (self->_localFP)
  {
    self;
    -[PFUbiquitySwitchboard _removeFilePresenter:](_sharedSwitchboard, &self->_localFP->super.isa);
  }
  dispatch_release((dispatch_object_t)self->_privateQueue);

  self->_fp = 0;
  self->_localFP = 0;

  self->_registeredCoordinators = 0;
  self->_localPeerID = 0;

  self->_storeName = 0;
  self->_storeURL = 0;

  self->_ubiquityRootLocation = 0;
  self->_localRootLocation = 0;
  objc_setProperty_nonatomic(self, v3, 0, 88);

  self->_monitor = 0;
  self->_finishingSetupAssistant = 0;
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquitySwitchboardEntry;
  [(PFUbiquitySwitchboardEntry *)&v4 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySwitchboardEntry;
  return (id)[NSString stringWithFormat:@"%@: \n\tlocalPeerID: %@\n\tubiquityRootURL: %@\n\tregisteredCoordinators: %@\n", -[PFUbiquitySwitchboardEntry description](&v3, sel_description), self->_localPeerID, self->_ubiquityRootLocation, self->_registeredCoordinators];
}

- (void)registerPersistentStore:(uint64_t)a3 withStoreName:
{
  if (a1)
  {
    uint64_t v6 = [a2 persistentStoreCoordinator];
    id v7 = (id)[*(id *)(a1 + 80) valueForKey:a3];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:");
    }
    [MEMORY[0x1E4F28CA0] addFilePresenter:a2];
    v8 = [[_PFWeakReference alloc] initWithObject:v6];
    if ([v7 containsObject:v8]) {
      goto LABEL_22;
    }
    [v7 addObject:v8];
    uint64_t v9 = *(void *)(a1 + 88);
    if (!v9
      && (v10 = -[PFUbiquitySwitchboardEntryMetadata initWithLocalPeerID:ubiquityRootLocation:localRootLocation:storeName:andPrivateQueue:]([PFUbiquitySwitchboardEntryMetadata alloc], "initWithLocalPeerID:ubiquityRootLocation:localRootLocation:storeName:andPrivateQueue:", *(void *)(a1 + 8), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 16), *(void *)(a1 + 112)), objc_setProperty_nonatomic((id)a1, v11, v10, 88), v10, (uint64_t v9 = *(void *)(a1 + 88)) == 0)|| (*(id *)(v9 + 40), *(void *)(v9 + 40) = +[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel")), objc_msgSend(*(id *)(v9 + 48), "addObject:", a2), *(unsigned char *)(v9 + 105)))
    {
LABEL_20:
      uint64_t v18 = *(void *)(a1 + 64);
      ++*(void *)(a1 + 72);
      if (!v18)
      {
        *(void *)(a1 + 64) = [[PFUbiquityContainerMonitor alloc] initWithProcessingQueue:*(void *)(a1 + 112) localPeerID:*(void *)(a1 + 8) storeName:*(void *)(a1 + 16) andUbiquityRootLocation:*(void *)(a1 + 32)];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_containerIdentifierChanged_, @"PFUbiquityContainerMonitorDidChangeContainerIdentifierNotification", *(void *)(a1 + 64));
      }
LABEL_22:

      return;
    }
    if (*(void *)(v9 + 72))
    {
LABEL_17:
      uint64_t v17 = *(void *)(v9 + 80);
      if (v17) {
        -[_PFUbiquityRecordsExporter beginWatchingForChangesFromStore:](v17, (uint64_t)a2);
      }
      else {
        *(void *)(v9 + 80) = -[_PFUbiquityRecordsExporter initWithLocalPeerID:forStoreName:ubiquityRootLocation:localRootLocation:andProcessingQueue:]([_PFUbiquityRecordsExporter alloc], *(void **)(v9 + 8), *(void **)(v9 + 16), *(void **)(v9 + 24), *(void **)(v9 + 32), *(NSObject **)(v9 + 112));
      }
      goto LABEL_20;
    }
    uint64_t v19 = 0;
    id v12 = +[_PFUbiquityRecordsImporter createPrivateCoordinatorAndStoreForStore:atURL:error:]((uint64_t)_PFUbiquityRecordsImporter, a2, 0, &v19);
    *(void *)(v9 + 56) = v12;
    id v13 = (id *)(v9 + 56);
    if (v12)
    {
      uint64_t v14 = [(NSArray *)[(NSPersistentStoreCoordinator *)v12 persistentStores] lastObject];
      *(void *)(v9 + 64) = v14;
      if (v14)
      {
LABEL_11:
        *(void *)(v9 + 72) = -[_PFUbiquityRecordsImporter initWithLocalPeerID:ubiquityRootLocation:storeName:andPrivateStore:]([_PFUbiquityRecordsImporter alloc], *(void *)(v9 + 8), *(void *)(v9 + 24), *(void **)(v9 + 16), *(void **)(v9 + 64));
LABEL_16:
        objc_super v15 = [[PFUbiquitySwitchboardCacheWrapper alloc] initWithStoreName:*(void *)(v9 + 16) privateStore:*(void *)(v9 + 64) forLocalPeerID:*(void *)(v9 + 8) andUbiquityRootLocation:*(void *)(v9 + 24)];
        objc_setProperty_nonatomic((id)v9, v16, v15, 88);

        goto LABEL_17;
      }
    }
    else if (*(void *)(v9 + 64))
    {
      goto LABEL_11;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error while trying to create the import coordinator: %@", "-[PFUbiquitySwitchboardEntryMetadata addPersistentStore:]", 856, v19);
    }

    *id v13 = 0;
    *(void *)(v9 + 64) = 0;
    goto LABEL_16;
  }
}

- (uint64_t)unregisterPersistentStoreCoordinator:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    objc_super v4 = objc_msgSend(a2, "persistentStores", 0);
    result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          -[PFUbiquitySwitchboardEntry unregisterPersistentStore:inCoordinator:](v3, *(void **)(*((void *)&v8 + 1) + 8 * v7++), (uint64_t)a2);
        }
        while (v5 != v7);
        result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)unregisterPersistentStore:(uint64_t)a3 inCoordinator:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
    if (v6)
    {
      id v7 = (id)[*(id *)(a1 + 80) objectForKey:v6];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v16;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v7);
            }
            long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if ([v11 hash] == a3)
            {
              id v8 = v11;
              if (v8)
              {
                [v7 removeObject:v8];
                [MEMORY[0x1E4F28CA0] removeFilePresenter:a2];
                uint64_t v12 = *(void *)(a1 + 88);
                if (v12)
                {
                  [MEMORY[0x1E4F28CA0] removeFilePresenter:a2];
                  [*(id *)(v12 + 48) removeObject:a2];
                  if (![*(id *)(v12 + 48) count]) {
                    -[PFUbiquitySwitchboardEntryMetadata tearDown]((uint64_t *)v12);
                  }
                }
                --*(void *)(a1 + 72);
                if (![v7 count])
                {
                  if (*(void *)(a1 + 32))
                  {
                    global_queue = dispatch_get_global_queue(0, 0);
                    block[0] = MEMORY[0x1E4F143A8];
                    block[1] = 3221225472;
                    block[2] = __70__PFUbiquitySwitchboardEntry_unregisterPersistentStore_inCoordinator___block_invoke;
                    block[3] = &unk_1E544B868;
                    block[4] = a1;
                    dispatch_async(global_queue, block);
                  }
                }
              }
              goto LABEL_20;
            }
          }
          id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v7 = 0;
      id v8 = 0;
    }
LABEL_20:
  }
}

uint64_t __70__PFUbiquitySwitchboardEntry_unregisterPersistentStore_inCoordinator___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  self;
  -[PFUbiquityMetadataFactory removeCachedCoordinatorsForLocalPeerID:storeName:andUbiquityRootLocation:]((id *)_sharedFactory, *(void *)(*(void *)(a1 + 32) + 8), *(void *)(*(void *)(a1 + 32) + 16), *(void *)(*(void *)(a1 + 32) + 32));

  return [v2 drain];
}

- (id)createSetOfPersistentStoreCoordinatorsRegisteredForStoreName:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v5 = (void *)[*(id *)(a1 + 80) objectForKey:a2];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        if (v10) {
          id Weak = objc_loadWeak((id *)(v10 + 8));
        }
        else {
          id Weak = 0;
        }
        id v12 = Weak;
        if (v12) {
          [v4 addObject:v12];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v13 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v7 = v13;
    }
    while (v13);
  }
  return v4;
}

- (uint64_t)createSetOfActiveStoreNames
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v3 = [*(id *)(v1 + 80) allKeys];
    return [v2 initWithArray:v3];
  }
  return result;
}

- (void)entryWillBeRemovedFromSwitchboard
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", a1);
    -[PFUbiquityContainerMonitor stopMonitor](*(void *)(a1 + 64));
    uint64_t v2 = *(void *)(a1 + 104);
    if (v2)
    {
      *(unsigned char *)(v2 + 313) = 1;
      -[PFUbiquitySwitchboardEntry setupFinished](a1);
    }
    uint64_t v3 = (uint64_t *)*(id *)(a1 + 88);
    objc_setProperty_nonatomic((id)a1, v4, 0, 88);
    -[PFUbiquitySwitchboardEntryMetadata tearDown](v3);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    if (v3) {
      uint64_t v5 = (void *)v3[6];
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(MEMORY[0x1E4F28CA0], "removeFilePresenter:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setupFinished
{
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 100);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 100));
    *(_WORD *)(a1 + 96) = 1;
    id v3 = *(id *)(a1 + 104);
    *(void *)(a1 + 104) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (void)filePresenterWasNotifiedTransactionLogs:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self;
  id v6 = (id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"PFLogLocationsKey");
  if (self) {
    metadata = self->_metadata;
  }
  else {
    metadata = 0;
  }
  uint64_t v8 = v6;
  uint64_t v9 = metadata;
  long long v10 = v9;
  if (v9)
  {
    importer = v9->_importer;
    if (importer) {
      importer = (_PFUbiquityRecordsImporter *)importer->_schedulingContext;
    }
  }
  else
  {
    importer = 0;
  }
  long long v12 = importer;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v13 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v44;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * v15);
        if (v16) {
          long long v17 = *(void **)(v16 + 40);
        }
        else {
          long long v17 = 0;
        }
        if ([v17 isEqualToString:self->_storeName]) {
          -[PFUbiquityRecordsImporterSchedulingContext addPendingLogLocation:]((uint64_t)v12, v16);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v18 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
      uint64_t v13 = v18;
    }
    while (v18);
  }
  uint64_t v42 = 0;
  if (v12) {
    privateQueue = v12->_privateQueue;
  }
  else {
    privateQueue = 0;
  }
  if (![(OS_dispatch_queue *)privateQueue count]) {
    goto LABEL_50;
  }
  monitor = self->_monitor;
  if (!monitor || monitor->_containerState != 1 || monitor->_monitorState != 1) {
    goto LABEL_50;
  }
  if (v10) {
    uint64_t v21 = (uint64_t)v10->_importer;
  }
  else {
    uint64_t v21 = 0;
  }
  if (!-[_PFUbiquityRecordsImporter schedulePendingLogs:error:](v21, 0, &v42))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      v36 = 0;
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nScheduling encountered an error: %@", "-[PFUbiquitySwitchboardEntry filePresenterWasNotifiedTransactionLogs:]", 359, self, v42);
      v29 = 0;
      goto LABEL_51;
    }
LABEL_50:
    v36 = 0;
    v29 = 0;
    goto LABEL_51;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:3])
  {
    v22 = self->_metadata;
    if (v22) {
      v22 = (PFUbiquitySwitchboardEntryMetadata *)v22->_importer;
    }
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nScheduled logs for importer: %@\n", "-[PFUbiquitySwitchboardEntry filePresenterWasNotifiedTransactionLogs:]", 342, self, v22);
  }
  if (v12) {
    v23 = *(void **)&v12->_isMonitoring;
  }
  else {
    v23 = 0;
  }
  if (![v23 count]) {
    goto LABEL_50;
  }
  id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  if (v12) {
    uint64_t v25 = *(void *)&v12->_isMonitoring;
  }
  else {
    uint64_t v25 = 0;
  }
  v26 = (void *)[v24 initWithSet:v25 copyItems:0];
  id v27 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (v12) {
    uint64_t ubiquityRootLocation = (uint64_t)v12->_ubiquityRootLocation;
  }
  else {
    uint64_t ubiquityRootLocation = 0;
  }
  v29 = (void *)[v27 initWithDictionary:ubiquityRootLocation copyItems:0];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v26;
  uint64_t v30 = [v26 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v30)
  {
    v31 = v29;
    uint64_t v32 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        v35 = (void *)[v31 objectForKey:v34];
        if ([v35 code] != 134320)
        {
          v29 = v31;
          if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to import transaction log: %@\n%@\n%@", "-[PFUbiquitySwitchboardEntry filePresenterWasNotifiedTransactionLogs:]", 353, v34, v35, [v35 userInfo]);
          }
          goto LABEL_54;
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v30) {
        continue;
      }
      break;
    }
    v29 = v31;
  }
LABEL_54:
  v36 = obj;
LABEL_51:
}

void __70__PFUbiquitySwitchboardEntry_filePresenterWasNotifiedTransactionLogs___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 88)) != 0) {
    SEL v4 = *(void **)(v3 + 64);
  }
  else {
    SEL v4 = 0;
  }
  id v12 = (id)objc_msgSend((id)objc_msgSend(v4, "metadata"), "mutableCopy");
  [v12 setObject:MEMORY[0x1E4F1CC38] forKey:@"PFUbiquitySetupCheckForFork"];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && (uint64_t v6 = *(void *)(v5 + 88)) != 0) {
    uint64_t v7 = *(void **)(v6 + 64);
  }
  else {
    uint64_t v7 = 0;
  }
  [v7 setMetadata:v12];
  uint64_t v8 = objc_alloc_init(NSSaveChangesRequest);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9 && (uint64_t v10 = *(void *)(v9 + 88)) != 0) {
    long long v11 = *(void **)(v10 + 64);
  }
  else {
    long long v11 = 0;
  }
  [v11 executeRequest:v8 withContext:0 error:0];
}

void __70__PFUbiquitySwitchboardEntry_filePresenterWasNotifiedTransactionLogs___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 88)) != 0) {
    SEL v4 = *(void **)(v3 + 64);
  }
  else {
    SEL v4 = 0;
  }
  id v12 = (id)objc_msgSend((id)objc_msgSend(v4, "metadata"), "mutableCopy");
  [v12 setObject:MEMORY[0x1E4F1CC38] forKey:@"PFUbiquitySetupDoFork"];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && (uint64_t v6 = *(void *)(v5 + 88)) != 0) {
    uint64_t v7 = *(void **)(v6 + 64);
  }
  else {
    uint64_t v7 = 0;
  }
  [v7 setMetadata:v12];
  uint64_t v8 = objc_alloc_init(NSSaveChangesRequest);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9 && (uint64_t v10 = *(void *)(v9 + 88)) != 0) {
    long long v11 = *(void **)(v10 + 64);
  }
  else {
    long long v11 = 0;
  }
  [v11 executeRequest:v8 withContext:0 error:0];
}

- (void)filePresenterNoticedBaselineFileChange:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"PFBaselineLocationKey");
  if (self) {
    metadata = self->_metadata;
  }
  else {
    metadata = 0;
  }
  uint64_t v9 = metadata;
  if (v4) {
    uint64_t v6 = *(void **)(v4 + 40);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v6 isEqualToString:self->_storeName];
  uint64_t v8 = v9;
  if (v7 && v9)
  {
    -[_PFUbiquityRecordsImporter scheduleBaselineRollResponseOperationForBaselineAtLocation:]((uint64_t)v9->_importer, v4);
    uint64_t v8 = v9;
  }

  MEMORY[0x1F41817F8](v7, v8);
}

- (void)containerIdentifierChanged:(id)a3
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  uint64_t v109 = 0;
  id v56 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v63 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:");
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3052000000;
  v106 = __Block_byref_object_copy__43;
  v107 = __Block_byref_object_dispose__43;
  id v108 = 0;
  id v108 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v5 = self;
  v62 = self;
  if (self) {
    metadata = self->_metadata;
  }
  else {
    metadata = 0;
  }
  v59 = metadata;
  -[PFUbiquitySwitchboardEntryMetadata setUseLocalStorage:]((uint64_t)v59, 1u);
  if (v59 && (cacheWrapper = v59->_cacheWrapper) != 0) {
    uint64_t transactionHistoryCache = (uint64_t)cacheWrapper->_transactionHistoryCache;
  }
  else {
    uint64_t transactionHistoryCache = 0;
  }
  if (!-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](transactionHistoryCache, 0)
    && +[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error purging transaction history cache after account change: %@", "-[PFUbiquitySwitchboardEntry containerIdentifierChanged:]", 465, v109);
  }
  if (v59 && (uint64_t v9 = v59->_cacheWrapper) != 0) {
    uint64_t transactionLogCache = (uint64_t)v9->_transactionLogCache;
  }
  else {
    uint64_t transactionLogCache = 0;
  }
  -[PFUbiquityTransactionLogCache removeLogsCachedForStoreNamed:withUbiquityRootLocation:](transactionLogCache, (uint64_t)self->_storeName, (uint64_t)self->_ubiquityRootLocation);
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  if (v59) {
    stores = v59->_stores;
  }
  else {
    stores = 0;
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = (id)[v11 initWithSet:stores copyItems:0];
  uint64_t v13 = [obj countByEnumeratingWithState:&v99 objects:v120 count:16];
  if (!v13) {
    goto LABEL_26;
  }
  uint64_t v65 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v100;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v100 != v15) {
        objc_enumerationMutation(obj);
      }
      long long v17 = *(void **)(*((void *)&v99 + 1) + 8 * i);
      uint64_t v18 = [v17 persistentStoreCoordinator];
      if (v18)
      {
        uint64_t v19 = objc_msgSend((id)objc_msgSend(v17, "metadata"), "objectForKey:", @"PFUbiquitySetupOriginalStoreURLAbsoluteStringKey");
        if (v19)
        {
          id v20 = v17;
          uint64_t v65 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v19];
          uint64_t v14 = v20;
        }
        [v68 addObject:v18];
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v99 objects:v120 count:16];
  }
  while (v13);
  uint64_t v21 = (NSURL *)v65;
  if (!v14)
  {
LABEL_26:
    if (v59) {
      v22 = v59->_stores;
    }
    else {
      v22 = 0;
    }
    id v23 = (id)[(NSMutableSet *)v22 anyObject];
    uint64_t v21 = v62->_storeURL;
    uint64_t v14 = v23;
  }
  uint64_t v24 = objc_msgSend((id)objc_msgSend(v14, "identifier"), "copy");
  id v58 = (id)[v14 persistentStoreCoordinator];
  v64 = (void *)v24;
  v66 = v21;
  id v25 = (id)[v14 options];
  if (!v58)
  {
    v57 = 0;
    id v58 = 0;
LABEL_68:
    id v61 = 0;
    goto LABEL_69;
  }
  v26 = v25;
  id v27 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", [v58 managedObjectModel]);
  self;
  -[PFUbiquitySwitchboard _quietlyMoveEntryToPreviousEntries:]((id *)_sharedSwitchboard, v62);
  v57 = v27;
  if ([v26 objectForKey:@"PFSetupLocalPeerIDOverride"])
  {
    v28 = (void *)[v26 mutableCopy];
    v29 = v28;
    monitor = v62->_monitor;
    if (monitor) {
      currentIdentityToken = monitor->_currentIdentityToken;
    }
    else {
      currentIdentityToken = 0;
    }
    [v28 setObject:currentIdentityToken forKey:@"NSUbiquityIdentityTokenOverrideKey"];
  }
  else
  {
    v29 = v26;
  }
  uint64_t v32 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v29];
  objc_msgSend(v32, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"PFUbiquitySetupSynchronousSideLoadKey");
  v33 = v62->_monitor;
  if (v33)
  {
    containerIdentifier = v33->_containerIdentifier;
    if (containerIdentifier)
    {
      uint64_t uuidString = (uint64_t)containerIdentifier->_uuidString;
      if (uuidString) {
        +[PFUbiquitySetupAssistant setContainerIdentifierUUID:forIdentityToken:forStoreName:]((uint64_t)PFUbiquitySetupAssistant, uuidString, v33->_currentIdentityToken, (uint64_t)v62->_storeName);
      }
    }
  }
  uint64_t v60 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v57, "addPersistentStoreWithType:configuration:URL:options:error:", [v14 type], objc_msgSend(v14, "configurationName"), v66, v32, &v109);
  if (!v60)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      id v61 = 0;
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error loading new temporary coordinator after account change with options { %@ } and URL %@ and error = %@", "-[PFUbiquitySwitchboardEntry containerIdentifierChanged:]", 526, v29, v66, v109);
      goto LABEL_69;
    }
    goto LABEL_68;
  }

  self;
  id v61 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)v62->_storeName, (uint64_t)v62->_localPeerID);
  if ([v68 count])
  {
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v94 = __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke;
    v95 = &unk_1E544B500;
    id v96 = obj;
    uint64_t v97 = v63;
    v98 = &v103;
    if (pthread_main_np()
      || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"kbd") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"keyboardservicesd"))
    {
      v94(v93);
    }
    else
    {
      dispatch_sync(MEMORY[0x1E4F14428], v93);
    }
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v36 = [v68 countByEnumeratingWithState:&v89 objects:v119 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v90;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v90 != v37) {
            objc_enumerationMutation(v68);
          }
          long long v39 = *(void **)(*((void *)&v89 + 1) + 8 * j);
          uint64_t v40 = [v39 persistentStoreForIdentifier:v64];
          uint64_t v41 = v40;
          if (v40)
          {
            uint64_t v83 = 0;
            v84 = &v83;
            uint64_t v85 = 0x3052000000;
            v86 = __Block_byref_object_copy__43;
            v87 = __Block_byref_object_dispose__43;
            uint64_t v88 = 0;
            v82[0] = MEMORY[0x1E4F143A8];
            v82[1] = 3221225472;
            v82[2] = __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_2;
            v82[3] = &unk_1E544F110;
            v82[4] = v40;
            v82[5] = v60;
            v82[6] = v109;
            v82[7] = v64;
            v82[8] = v61;
            v82[9] = v62;
            v82[10] = &v83;
            [v39 performBlockAndWait:v82];
            id v42 = (id)v84[5];
            if (v109 && v84[5]) {
              uint64_t v109 = v84[5];
            }
            if (v63)
            {
              v117[0] = @"added";
              uint64_t v116 = v41;
              v118[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
              v117[1] = @"removed";
              uint64_t v115 = v41;
              uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
              v117[2] = @"NSPersistentStoreUbiquitousTransitionTypeKey";
              long long v44 = v117;
              long long v45 = v118;
              uint64_t v46 = 3;
              v118[1] = v43;
              v118[2] = v63;
            }
            else
            {
              v113[0] = @"added";
              uint64_t v112 = v41;
              v114[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
              v113[1] = @"removed";
              uint64_t v111 = v41;
              v114[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
              long long v44 = v113;
              long long v45 = v114;
              uint64_t v46 = 2;
            }
            v47 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:v46];
            id v48 = v39;
            [v47 copy];
            [(id)v104[5] removeObject:v39];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v78 = __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_3;
            v79 = &unk_1E544B778;
            id v80 = v48;
            v81 = v47;
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"kbd") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"keyboardservicesd"))
            {
              v78((uint64_t)block);
            }
            else
            {
              dispatch_async(MEMORY[0x1E4F14428], block);
            }
            _Block_object_dispose(&v83, 8);
          }
        }
        uint64_t v36 = [v68 countByEnumeratingWithState:&v89 objects:v119 count:16];
      }
      while (v36);
    }

    v57 = 0;
    id obj = 0;
    id v68 = 0;
  }
LABEL_69:
  if (v104[5])
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v49 = (void *)v104[5];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v73 objects:v110 count:16];
    if (v50)
    {
      uint64_t v51 = *(void *)v74;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v74 != v51) {
            objc_enumerationMutation(v49);
          }
          id v53 = *(id *)(*((void *)&v73 + 1) + 8 * k);
          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v70 = __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_4;
          v71 = &unk_1E544B868;
          id v72 = v53;
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"kbd") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"keyboardservicesd"))
          {
            v70((uint64_t)v69);
          }
          else
          {
            dispatch_async(MEMORY[0x1E4F14428], v69);
          }
        }
        uint64_t v50 = [v49 countByEnumeratingWithState:&v73 objects:v110 count:16];
      }
      while (v50);
    }
    [(id)v104[5] removeAllObjects];
    v54 = v66;
    v55 = (void *)v104[5];
  }
  else
  {
    v55 = 0;
    v54 = v66;
  }

  v104[5] = 0;
  [v56 drain];

  _Block_object_dispose(&v103, 8);
}

uint64_t __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke(void *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)a1[4];
  uint64_t result = [obj countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v20;
    long long v17 = @"NSPersistentStoreUbiquitousTransitionTypeKey";
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v19 + 1) + 8 * v5);
        uint64_t v7 = objc_msgSend(v6, "persistentStoreCoordinator", v17);
        if (v7)
        {
          uint64_t v8 = v7;
          if (a1[5])
          {
            v28 = v6;
            v29[0] = @"added";
            v30[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
            v29[1] = @"removed";
            id v27 = v6;
            uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
            v29[2] = v17;
            uint64_t v10 = a1[5];
            v30[1] = v9;
            v30[2] = v10;
            id v11 = (void *)MEMORY[0x1E4F1C9E8];
            id v12 = v30;
            uint64_t v13 = v29;
            uint64_t v14 = 3;
          }
          else
          {
            uint64_t v24 = v6;
            v25[0] = @"added";
            uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
            v25[1] = @"removed";
            v26[0] = v15;
            id v23 = v6;
            v26[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
            id v11 = (void *)MEMORY[0x1E4F1C9E8];
            id v12 = v26;
            uint64_t v13 = v25;
            uint64_t v14 = 2;
          }
          uint64_t v16 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:v14];
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v8];
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"NSPersistentStoreCoordinatorStoresWillChangeNotification", v8, v16);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t result = [obj countByEnumeratingWithState:&v19 objects:v31 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

id __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) loadMetadata:*(void *)(*(void *)(a1 + 80) + 8) + 40] & 1) == 0
    && +[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error loading new store metadata after account change: %@", "-[PFUbiquitySwitchboardEntry containerIdentifierChanged:]_block_invoke_2", 571, *(void *)(a1 + 48));
  }
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "identifier"), "isEqual:", *(void *)(a1 + 56)) & 1) == 0) {
    -[NSPersistentStore _resetObjectIDFactoriesForStoreUUIDChange](*(void *)(a1 + 32));
  }
  -[PFUbiquitySwitchboardEntry registerPersistentStore:withStoreName:](*(void *)(a1 + 64), *(void **)(a1 + 32), *(void *)(*(void *)(a1 + 72) + 16));
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nRegistered store: %@ with entry: %@", "-[PFUbiquitySwitchboardEntry containerIdentifierChanged:]_block_invoke_2", 578, *(void *)(a1 + 72), *(void *)(a1 + 32), *(void *)(a1 + 64));
  }
  return *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
}

void __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_3(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"NSPersistentStoreCoordinatorStoresDidChangeNotification", *(void *)(a1 + 32), *(void *)(a1 + 40));

  uint64_t v2 = *(void **)(a1 + 40);
}

void __57__PFUbiquitySwitchboardEntry_containerIdentifierChanged___block_invoke_4(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"NSPersistentStoreCoordinatorStoresDidChangeNotification", *(void *)(a1 + 32), 0);
  uint64_t v2 = *(void **)(a1 + 32);
}

- (BOOL)finishSetupForStore:(void *)a3 withSetupAssistant:(int)a4 synchronously:(uint64_t *)a5 error:(uint64_t)a6 finishBlock:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (!a2
      || (uint64_t v10 = result, (Weak = objc_loadWeak((id *)(a2 + 8))) == 0)
      || (uint64_t v12 = (uint64_t)Weak, ![Weak persistentStoreCoordinator]))
    {
      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134326 userInfo:0];
      if (v15)
      {
        if (a5)
        {
          uint64_t v16 = v15;
          uint64_t result = 0;
          *a5 = v16;
          return result;
        }
        return 0;
      }
      uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboardEntry.m");
      uint64_t v24 = __pflogFaultLog;
      uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboardEntry.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 667;
LABEL_14:
      _os_log_fault_impl(&dword_18AB82000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      return 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v10 + 100));
    int v13 = *(unsigned __int8 *)(v10 + 98);
    if (!*(unsigned char *)(v10 + 98)) {
      *(unsigned char *)(v10 + 98) = 1;
    }
    if (*(unsigned char *)(v10 + 97))
    {
      char v14 = 1;
    }
    else
    {
      char v14 = 1;
      if (!*(unsigned char *)(v10 + 96))
      {
        *(unsigned char *)(v10 + 97) = 1;
        char v14 = 0;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 100));
    if (v13)
    {
      if (v14) {
        return 1;
      }
LABEL_19:
      id v25 = *(NSObject **)(v10 + 112);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      if (a4)
      {
        *(void *)&buf[16] = __70__PFUbiquitySwitchboardEntry_synchronouslyExecuteBlockOnPrivateQueue___block_invoke;
        id v42 = &unk_1E544DF48;
        uint64_t v43 = a6;
        dispatch_sync(v25, buf);
      }
      else
      {
        *(void *)&buf[16] = __57__PFUbiquitySwitchboardEntry_executeBlockOnPrivateQueue___block_invoke;
        id v42 = &unk_1E544DF48;
        uint64_t v43 = a6;
        dispatch_async(v25, buf);
      }
      return 1;
    }
    *(void *)(v10 + 104) = a3;
    -[PFUbiquitySwitchboardEntryMetadata setUseLocalStorage:](*(void *)(v10 + 88), 1u);
    uint64_t v26 = *(void *)(v10 + 88);
    if (v26 && (uint64_t v27 = *(void *)(v26 + 88)) != 0) {
      uint64_t v28 = *(void *)(v27 + 40);
    }
    else {
      uint64_t v28 = 0;
    }
    if (-[PFUbiquityPeerRangeCache cachePeerRanges:](v28))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Beginning to watch for changes from: %@", "-[PFUbiquitySwitchboardEntry finishSetupForStore:withSetupAssistant:synchronously:error:finishBlock:]", 690, v12);
      }
      if (a3) {
        uint64_t v30 = (void *)a3[9];
      }
      else {
        uint64_t v30 = 0;
      }
      uint64_t v31 = *(void *)(v10 + 88);
      if (v31
        && ((uint64_t v32 = *(void **)(v31 + 88)) == 0
         || (objc_setProperty_atomic(v32, v29, v30, 64), (uint64_t v31 = *(void *)(v10 + 88)) != 0)))
      {
        uint64_t v33 = *(void *)(v31 + 80);
      }
      else
      {
        uint64_t v33 = 0;
      }
      -[_PFUbiquityRecordsExporter beginWatchingForChangesFromStore:](v33, v12);
      if (v14) {
        return 1;
      }
      goto LABEL_19;
    }
    uint64_t v34 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboardEntry.m");
    uint64_t v24 = __pflogFaultLog;
    uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (result)
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboardEntry.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 707;
      goto LABEL_14;
    }
  }
  return result;
}

- (void)executeBlockOnPrivateQueue:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 112);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __57__PFUbiquitySwitchboardEntry_executeBlockOnPrivateQueue___block_invoke;
    block[3] = &unk_1E544DF48;
    block[4] = a2;
    dispatch_async(v2, block);
  }
}

uint64_t __57__PFUbiquitySwitchboardEntry_executeBlockOnPrivateQueue___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return [v2 drain];
}

- (void)afterDelay:(double)a3 executeBlockOnPrivateQueue:
{
  if (a1)
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000 * (uint64_t)a3);
    uint64_t v6 = *(NSObject **)(a1 + 112);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __68__PFUbiquitySwitchboardEntry_afterDelay_executeBlockOnPrivateQueue___block_invoke;
    block[3] = &unk_1E544DF48;
    block[4] = a2;
    dispatch_after(v5, v6, block);
  }
}

uint64_t __68__PFUbiquitySwitchboardEntry_afterDelay_executeBlockOnPrivateQueue___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return [v2 drain];
}

uint64_t __70__PFUbiquitySwitchboardEntry_synchronouslyExecuteBlockOnPrivateQueue___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return [v2 drain];
}

@end