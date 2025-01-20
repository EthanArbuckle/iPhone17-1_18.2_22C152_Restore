@interface PFUbiquitySwitchboard
+ (id)ubiquitousExternalReferenceLocationForUUID:(void *)a3 inStore:;
+ (void)initialize;
- (BOOL)cacheFilePresenterForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:;
- (PFUbiquitySwitchboard)init;
- (id)createSetOfCoordinatorsForPersistentStoreName:(uint64_t)a1 andLocalPeerID:(uint64_t)a2 atUbiquityRootLocation:(uint64_t)a3;
- (id)description;
- (id)retainedEntryForStoreName:(uint64_t)a3 andLocalPeerID:;
- (uint64_t)filePresenterForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:;
- (uint64_t)registerUbiquitizedPersistentStore:(uint64_t)a3 withURL:(uint64_t)a4 forLocalPeerID:(void *)a5 withLocalRootLocation:(uint64_t)a6 andUbiquityRootLocation:(uint64_t *)a7 error:;
- (uint64_t)unregisterCoordinator:(uint64_t)result;
- (void)_addFilePresenter:(uint64_t)a1;
- (void)_quietlyMoveEntryToPreviousEntries:(id *)a1;
- (void)_removeFilePresenter:(uint64_t)a1;
- (void)coordinatorWillRemoveStore:(id)a3;
- (void)dealloc;
- (void)removeEntryFromPreviousEntries:(uint64_t)a1;
- (void)removeFilePresenterCachedForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:;
- (void)unregisterPersistentStore:(uint64_t)a3 inCoordinator:;
@end

@implementation PFUbiquitySwitchboard

- (uint64_t)unregisterCoordinator:(uint64_t)result
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 32) lock];
    uint64_t v26 = v3;
    id v20 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = *(id *)(v3 + 8);
    uint64_t v4 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v4)
    {
      uint64_t v24 = *(void *)v40;
      do
      {
        uint64_t v5 = 0;
        uint64_t v25 = v4;
        do
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v39 + 1) + 8 * v5);
          id v7 = (id)objc_msgSend(*(id *)(v3 + 8), "objectForKey:", v6, v20);
          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v45 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v36;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v36 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                v13 = (id)[v7 objectForKey:v12];
                -[PFUbiquitySwitchboardEntry unregisterPersistentStoreCoordinator:]((uint64_t)v13, a2);
                if (!v13 || !v13[9])
                {
                  -[PFUbiquitySwitchboardEntry entryWillBeRemovedFromSwitchboard]((uint64_t)v13);
                  [v8 addObject:v12];
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v45 count:16];
            }
            while (v9);
          }
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v14 = [v8 countByEnumeratingWithState:&v31 objects:v44 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v32;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v32 != v15) {
                  objc_enumerationMutation(v8);
                }
                [v7 removeObjectForKey:*(void *)(*((void *)&v31 + 1) + 8 * j)];
              }
              uint64_t v14 = [v8 countByEnumeratingWithState:&v31 objects:v44 count:16];
            }
            while (v14);
          }
          uint64_t v3 = v26;
          if (![v7 count]) {
            [v22 addObject:v6];
          }

          ++v5;
        }
        while (v5 != v25);
        uint64_t v4 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v4);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v17 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16, v20);
    if (v17)
    {
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(v26 + 8) removeObjectForKey:*(void *)(*((void *)&v27 + 1) + 8 * k)];
        }
        uint64_t v17 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v17);
    }

    [v21 drain];
    return [*(id *)(v26 + 32) unlock];
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _sharedSwitchboard = objc_alloc_init(PFUbiquitySwitchboard);
  }
}

- (PFUbiquitySwitchboard)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquitySwitchboard;
  v2 = [(PFUbiquitySwitchboard *)&v4 init];
  if (v2)
  {
    v2->_storeNameToLocalPeerIDToEntry = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_rootLocationToLocalPeerIDToFilePresenters = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_rootLocationToLocalPeerIDToPreviousEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_registrationLocuint64_t k = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_storeNameToLocalPeerIDToEntry = 0;
  self->_rootLocationToLocalPeerIDToFilePresenters = 0;

  self->_rootLocationToLocalPeerIDToPreviousEntries = 0;
  self->_registrationLocuint64_t k = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySwitchboard;
  [(PFUbiquitySwitchboard *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySwitchboard;
  return (id)[NSString stringWithFormat:@"%@: \n\tstoreNameToEntry: %@\n\trootLocationToFilePresenter: %@\n", -[PFUbiquitySwitchboard description](&v3, sel_description), self->_storeNameToLocalPeerIDToEntry, self->_rootLocationToLocalPeerIDToFilePresenters];
}

- (id)retainedEntryForStoreName:(uint64_t)a3 andLocalPeerID:
{
  if (!a1) {
    return 0;
  }
  [*(id *)(a1 + 32) lock];
  id v6 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a2), "objectForKey:", a3);
  [*(id *)(a1 + 32) unlock];
  return v6;
}

- (uint64_t)filePresenterForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  [a1[4] lock];
  if (a2)
  {
    id v6 = (void *)a2;
    if (*(_DWORD *)(a2 + 24) != 1) {
      id v6 = *(void **)(a2 + 8);
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = (void *)[a1[2] objectForKey:v6];
  id v8 = v7;
  if (a3)
  {
    uint64_t v9 = (void *)[v7 objectForKey:a3];
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    if (![v7 countByEnumeratingWithState:v18 objects:v20 count:16]) {
      goto LABEL_11;
    }
    uint64_t v9 = (void *)[v8 objectForKey:**((void **)&v18[0] + 1)];
  }
  if (!v9 || (uint64_t v10 = [v9 lastObject]) == 0)
  {
LABEL_11:
    v11 = (void *)[a1[3] objectForKey:a2];
    uint64_t v12 = v11;
    if (a3)
    {
      v13 = (void *)[v11 objectForKey:a3];
    }
    else
    {
      memset(v17, 0, sizeof(v17));
      v13 = (void *)[v11 countByEnumeratingWithState:v17 objects:v19 count:16];
      if (v13) {
        v13 = (void *)[v12 objectForKey:**((void **)&v17[0] + 1)];
      }
    }
    uint64_t v14 = objc_msgSend((id)objc_msgSend(v13, "lastObject"), "nonretainedObjectValue");
    uint64_t v10 = v14;
    if (!v14) {
      goto LABEL_22;
    }
    if ([v6 isEqual:*(void *)(v14 + 32)])
    {
      uint64_t v15 = 48;
    }
    else
    {
      if (![v6 isEqual:*(void *)(v10 + 40)])
      {
        uint64_t v10 = 0;
        goto LABEL_22;
      }
      uint64_t v15 = 56;
    }
    uint64_t v10 = *(void *)(v10 + v15);
LABEL_22:
    if (a3 && !v10) {
      uint64_t v10 = -[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:](a1, a2, 0);
    }
  }
  [a1[4] unlock];
  return v10;
}

- (BOOL)cacheFilePresenterForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:
{
  if (a1)
  {
    [*(id *)(a1 + 32) lock];
    if (a2 && *(_DWORD *)(a2 + 24) != 1) {
      a2 = *(void *)(a2 + 8);
    }
    id v6 = [[PFUbiquityFilePresenter alloc] initWithUbiquityRootLocation:a2 localPeerID:a3 storeName:0 processingQueue:0];
    id v7 = (id)[*(id *)(a1 + 16) objectForKey:a2];
    id v8 = (id)[v7 objectForKey:a3];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [*(id *)(a1 + 16) setObject:v7 forKey:a2];
    }
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v7 setObject:v8 forKey:a3];
    }
    [MEMORY[0x1E4F28CA0] addFilePresenter:v6];
    [v8 addObject:v6];

    [*(id *)(a1 + 32) unlock];
  }
  return a1 != 0;
}

- (void)removeFilePresenterCachedForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:
{
  if (a1)
  {
    uint64_t v4 = a2;
    if (a2 && *(_DWORD *)(a2 + 24) != 1) {
      uint64_t v4 = *(void *)(a2 + 8);
    }
    [*(id *)(a1 + 32) lock];
    id v6 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v4), "objectForKey:", a3), "lastObject");
    if (v6) {
      -[PFUbiquitySwitchboard _removeFilePresenter:](a1, v6);
    }
    [*(id *)(a1 + 32) unlock];
  }
}

- (void)_removeFilePresenter:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 32) lock];
    uint64_t v4 = a2;
    [MEMORY[0x1E4F28CA0] removeFilePresenter:a2];
    if (a2) {
      uint64_t v5 = a2[1];
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = (id)[*(id *)(a1 + 16) objectForKey:v5];
    id v7 = v6;
    if (a2) {
      uint64_t v8 = a2[2];
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = (id)[v6 objectForKey:v8];
    [v9 removeObject:a2];
    if (![v9 count])
    {
      if (a2) {
        uint64_t v10 = a2[2];
      }
      else {
        uint64_t v10 = 0;
      }
      [v7 removeObjectForKey:v10];
    }
    if (![v7 count])
    {
      if (a2) {
        uint64_t v11 = a2[1];
      }
      else {
        uint64_t v11 = 0;
      }
      [*(id *)(a1 + 16) removeObjectForKey:v11];
    }
    [*(id *)(a1 + 32) unlock];
  }
}

- (void)_addFilePresenter:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 32) lock];
    [MEMORY[0x1E4F28CA0] addFilePresenter:a2];
    if (a2) {
      uint64_t v4 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = (id)[*(id *)(a1 + 16) objectForKey:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (a2) {
        uint64_t v6 = *(void *)(a2 + 8);
      }
      else {
        uint64_t v6 = 0;
      }
      [*(id *)(a1 + 16) setObject:v5 forKey:v6];
    }
    if (a2) {
      uint64_t v7 = *(void *)(a2 + 16);
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = (id)[v5 objectForKey:v7];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (a2) {
        uint64_t v9 = *(void *)(a2 + 16);
      }
      else {
        uint64_t v9 = 0;
      }
      [v5 setObject:v8 forKey:v9];
    }
    [v8 addObject:a2];
    [*(id *)(a1 + 32) unlock];
  }
}

- (uint64_t)registerUbiquitizedPersistentStore:(uint64_t)a3 withURL:(uint64_t)a4 forLocalPeerID:(void *)a5 withLocalRootLocation:(uint64_t)a6 andUbiquityRootLocation:(uint64_t *)a7 error:
{
  uint64_t v7 = a1;
  v42[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
    [*(id *)(v7 + 32) lock];
    id v14 = (id)[*(id *)(v7 + 8) objectForKey:v13];
    if (!v14)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [*(id *)(v7 + 8) setObject:v14 forKey:v13];
    }
    uint64_t v15 = [v14 objectForKey:a4];
    v16 = (PFUbiquitySwitchboardEntry *)v15;
    if (v15)
    {
      if ([a5 isEqual:*(void *)(v15 + 40)])
      {
        uint64_t v17 = 0;
        char v18 = 1;
      }
      else
      {
        v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v20 = *MEMORY[0x1E4F28568];
        v42[0] = @"All stores registered with the same NSPersistentStoreUbiquitousContentNameKey must use the same location on the file system.";
        v41[0] = v20;
        v41[1] = @"NSAffectedStoresErrorKey";
        uint64_t v21 = (uint64_t)a2;
        if (!a2) {
          uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
        }
        v40[0] = v21;
        metadata = v16->_metadata;
        if (!metadata || (uint64_t stores = (uint64_t)metadata->_stores) == 0) {
          uint64_t stores = [MEMORY[0x1E4F1CA98] null];
        }
        v40[1] = stores;
        v42[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
        uint64_t v25 = [v19 errorWithDomain:*MEMORY[0x1E4F281F8] code:134311 userInfo:v24];
        char v18 = 0;
        uint64_t v17 = v25;
      }
    }
    else
    {
      v16 = [[PFUbiquitySwitchboardEntry alloc] initWithLocalPeerID:a4 storeName:v13 withURL:a3 ubiquityRootLocation:a6 andLocalRootLocation:a5];
      [v14 setObject:v16 forKey:a4];
      uint64_t v17 = 0;

      char v18 = 1;
    }
    -[PFUbiquitySwitchboardEntry registerPersistentStore:withStoreName:]((uint64_t)v16, a2, v13);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v7, sel_coordinatorWillRemoveStore_, @"NSPersistentStoreCoordinatorWillRemoveStoreNotification", a2);
    [*(id *)(v7 + 32) unlock];
    if ((v18 & 1) == 0)
    {
      if (v17)
      {
        if (a7)
        {
          uint64_t v7 = 0;
          *a7 = v17;
          return v7;
        }
      }
      else
      {
        uint64_t v26 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboard.m");
        long long v33 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquitySwitchboard.m";
          __int16 v38 = 1024;
          int v39 = 374;
          _os_log_fault_impl(&dword_18AB82000, v33, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      return 0;
    }
    return 1;
  }
  return v7;
}

- (id)createSetOfCoordinatorsForPersistentStoreName:(uint64_t)a1 andLocalPeerID:(uint64_t)a2 atUbiquityRootLocation:(uint64_t)a3
{
  if (!a1) {
    return 0;
  }
  id v4 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](a1, a2, a3);
  id v5 = -[PFUbiquitySwitchboardEntry createSetOfPersistentStoreCoordinatorsRegisteredForStoreName:]((uint64_t)v4, a2);

  return v5;
}

- (void)unregisterPersistentStore:(uint64_t)a3 inCoordinator:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
    if (v5)
    {
      uint64_t v6 = v5;
      [a2 setReadOnly:1];
      [*(id *)(a1 + 32) lock];
      id v7 = (id)[*(id *)(a1 + 8) objectForKey:v6];
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v13 = [v7 objectForKey:v12];
            -[PFUbiquitySwitchboardEntry unregisterPersistentStore:inCoordinator:](v13, a2, a3);
            if (!v13 || !*(void *)(v13 + 72))
            {
              -[PFUbiquitySwitchboardEntry entryWillBeRemovedFromSwitchboard](v13);
              [v8 addObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v9);
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v14 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v19;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v8);
            }
            [v7 removeObjectForKey:*(void *)(*((void *)&v18 + 1) + 8 * j)];
            if (![v7 count]) {
              [*(id *)(a1 + 8) removeObjectForKey:v6];
            }
          }
          uint64_t v14 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v14);
      }
      [*(id *)(a1 + 32) unlock];

      if (v14) {
        objc_exception_rethrow();
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAsked to unregister non-ubiquitized store: %@", "-[PFUbiquitySwitchboard unregisterPersistentStore:inCoordinator:]", 455, a1, a2);
    }
  }
}

- (void)coordinatorWillRemoveStore:(id)a3
{
  id v4 = (void *)[a3 object];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"NSPersistentStoreCoordinatorWillRemoveStoreNotification", v4);
  uint64_t v5 = [v4 persistentStoreCoordinator];

  -[PFUbiquitySwitchboard unregisterPersistentStore:inCoordinator:]((uint64_t)self, v4, v5);
}

- (void)_quietlyMoveEntryToPreviousEntries:(id *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = a2;
    [a1[4] lock];
    id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    -[PFUbiquitySwitchboardEntry entryWillBeRemovedFromSwitchboard]((uint64_t)a2);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a2) {
      uint64_t v7 = a2[2];
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = (id)[a1[1] objectForKey:v7];
    uint64_t v9 = v8;
    if (a2) {
      uint64_t v10 = a2[1];
    }
    else {
      uint64_t v10 = 0;
    }
    [v8 removeObjectForKey:v10];
    if (![v9 count])
    {
      if (a2) {
        uint64_t v11 = a2[2];
      }
      else {
        uint64_t v11 = 0;
      }
      [v6 addObject:v11];
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v12 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v6);
          }
          [a1[1] removeObjectForKey:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        }
        uint64_t v12 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    [a1[4] lock];
    if (a2)
    {
      if (a2[4])
      {
        id v15 = (id)objc_msgSend(a1[3], "objectForKey:");
        if (!v15)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          objc_msgSend(a1[3], "setObject:forKey:");
        }
        id v16 = (id)[v15 objectForKey:a2[1]];
        if (!v16)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v15 setObject:v16 forKey:a2[1]];
        }
      }
      else
      {
        id v15 = 0;
        id v16 = 0;
      }
      uint64_t v17 = a2[5];
      long long v18 = v16;
    }
    else
    {
      long long v18 = 0;
      id v15 = 0;
      uint64_t v17 = 0;
    }
    id v19 = (id)[a1[3] objectForKey:v17];
    if (!v19)
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (a2) {
        uint64_t v20 = a2[5];
      }
      else {
        uint64_t v20 = 0;
      }
      [a1[3] setObject:v19 forKey:v20];
    }
    if (a2) {
      uint64_t v21 = a2[1];
    }
    else {
      uint64_t v21 = 0;
    }
    id v22 = (id)[v19 objectForKey:v21];
    id v23 = v22;
    if (!v22)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (a2) {
        uint64_t v24 = a2[1];
      }
      else {
        uint64_t v24 = 0;
      }
      id v22 = (id)[v19 setObject:v23 forKey:v24];
    }
    long long v25 = (void *)MEMORY[0x18C127630](v22);
    uint64_t v26 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:a2];
    [v18 addObject:v26];
    [v23 addObject:v26];
    [a1[4] unlock];

    [v5 drain];
    [a1[4] unlock];
  }
}

- (void)removeEntryFromPreviousEntries:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [*(id *)(a1 + 32) lock];
    if (a2 && a2[4])
    {
      id v4 = (id)objc_msgSend(*(id *)(a1 + 24), "objectForKey:");
      id v5 = (id)[v4 objectForKey:a2[1]];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v29 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if ((void *)[v9 nonretainedObjectValue] == a2)
            {
              id v10 = v9;
              if (v10) {
                [v5 removeObject:v10];
              }
              goto LABEL_15;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      id v10 = 0;
LABEL_15:
      if (v5 && ![v5 count]) {
        [v4 removeObjectForKey:a2[1]];
      }
      if (v4)
      {
        if ([v4 count])
        {
          uint64_t v11 = v5;
          uint64_t v12 = v4;
        }
        else
        {
          uint64_t v12 = v4;
          uint64_t v11 = v5;
          [*(id *)(a1 + 24) removeObjectForKey:a2[4]];
        }
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v11 = v5;
      }
    }
    else
    {
      id v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }

    if (a2) {
      uint64_t v13 = a2[5];
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = (id)[*(id *)(a1 + 24) objectForKey:v13];
    id v15 = v14;
    if (a2) {
      uint64_t v16 = a2[1];
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = (id)[v14 objectForKey:v16];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = (id)[v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v25;
      while (2)
      {
        for (uint64_t j = 0; j != v18; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
          if ((void *)[v21 nonretainedObjectValue] == a2)
          {
            id v18 = v21;
            if (v18) {
              [v17 removeObject:v18];
            }
            goto LABEL_39;
          }
        }
        id v18 = (id)[v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_39:
    if (v17 && ![v17 count])
    {
      if (a2) {
        uint64_t v22 = a2[1];
      }
      else {
        uint64_t v22 = 0;
      }
      [v15 removeObjectForKey:v22];
    }
    if (v15 && ![v15 count])
    {
      if (a2) {
        uint64_t v23 = a2[5];
      }
      else {
        uint64_t v23 = 0;
      }
      [*(id *)(a1 + 24) removeObjectForKey:v23];
    }
    [*(id *)(a1 + 32) unlock];
  }
}

+ (id)ubiquitousExternalReferenceLocationForUUID:(void *)a3 inStore:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self;
  self;
  uint64_t v5 = _sharedSwitchboard;
  if (_sharedSwitchboard
    && (uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey")) != 0)
  {
    uint64_t v7 = v6;
    [*(id *)(v5 + 32) lock];
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithDictionary:copyItems:", objc_msgSend(*(id *)(v5 + 8), "objectForKey:", v7), 0);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v22;
LABEL_5:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [v8 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v12)];
        uint64_t v14 = v13;
        if (!v10) {
          uint64_t v10 = v13;
        }
        if (v13 && (uint64_t v15 = *(void *)(v13 + 88)) != 0) {
          uint64_t v16 = *(void **)(v15 + 48);
        }
        else {
          uint64_t v16 = 0;
        }
        if ([v16 containsObject:a3]) {
          break;
        }
        if (v9 == ++v12)
        {
          uint64_t v17 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          uint64_t v9 = v17;
          if (!v17)
          {
            uint64_t v14 = v10;
            break;
          }
          goto LABEL_5;
        }
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    [*(id *)(v5 + 32) unlock];

    if (v14) {
      id v18 = *(void **)(v14 + 32);
    }
    else {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v19 = +[PFUbiquityLocation createUbiquityExternalDataReferenceFileLocationForUUID:andStore:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, a2, a3, v18);

  return v19;
}

@end