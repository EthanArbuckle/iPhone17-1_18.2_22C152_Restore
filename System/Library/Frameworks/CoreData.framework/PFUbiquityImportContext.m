@interface PFUbiquityImportContext
- (PFUbiquityImportContext)init;
- (PFUbiquityImportContext)initWithStack:(id)a3 andStoreMetadata:(id)a4;
- (PFUbiquityImportContext)initWithStoreName:(id)a3 andUbiquityRootLocation:(id)a4 withLocalPeerID:(id)a5;
- (uint64_t)prefetchManagedObjectsInContext:(void *)a3 error:;
- (void)dealloc;
- (void)setActingPeer:(void *)result;
- (void)setExportingPeerID:(void *)result;
@end

@implementation PFUbiquityImportContext

- (PFUbiquityImportContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityImportContext;
  v2 = [(PFUbiquityImportContext *)&v5 init];
  v3 = (PFUbiquityImportContext *)v2;
  if (v2)
  {
    *((void *)v2 + 11) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *((void *)v2 + 9) = 0;
    *((void *)v2 + 10) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (PFUbiquityImportContext)initWithStoreName:(id)a3 andUbiquityRootLocation:(id)a4 withLocalPeerID:(id)a5
{
  v8 = [(PFUbiquityImportContext *)self init];
  if (v8)
  {
    self;
    v9 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, a5, a3, a4, 0);
    v8->_stack = (_PFUbiquityStack *)v9;
    if (v9) {
      id v10 = v9[1];
    }
    else {
      id v10 = 0;
    }
    v8->_storeMetadata = (PFUbiquityStoreMetadata *)(id)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, a3, v10);
  }
  return v8;
}

- (PFUbiquityImportContext)initWithStack:(id)a3 andStoreMetadata:(id)a4
{
  v6 = [(PFUbiquityImportContext *)self init];
  if (v6)
  {
    v6->_stack = (_PFUbiquityStack *)a3;
    v6->_storeMetadata = (PFUbiquityStoreMetadata *)a4;
  }
  return v6;
}

- (void)dealloc
{
  -[PFUbiquityImportContext setExportingPeerID:](self, 0);

  self->_stack = 0;
  self->_storeMetadata = 0;
  objc_setProperty_nonatomic(self, v3, 0, 32);
  objc_setProperty_nonatomic(self, v4, 0, 40);
  objc_setProperty_nonatomic(self, v5, 0, 56);
  objc_setProperty_nonatomic(self, v6, 0, 64);
  objc_setProperty_nonatomic(self, v7, 0, 72);
  objc_setProperty_nonatomic(self, v8, 0, 88);
  -[PFUbiquityImportContext setExportingPeerID:](self, 0);

  self->_globalIDToFetchedObject = 0;
  objc_setProperty_nonatomic(self, v9, 0, 96);
  v10.receiver = self;
  v10.super_class = (Class)PFUbiquityImportContext;
  [(PFUbiquityImportContext *)&v10 dealloc];
}

- (void)setExportingPeerID:(void *)result
{
  if (result)
  {
    SEL v3 = result;
    SEL v4 = (void *)result[6];
    if (v4 != a2)
    {

      v3[6] = a2;
      SEL v5 = (void *)v3[6];
      if (v5)
      {
        uint64_t v6 = v3[1];
        if (v6) {
          SEL v7 = *(void **)(v6 + 8);
        }
        else {
          SEL v7 = 0;
        }
        result = (id)+[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, v5, v7, 1);
      }
      else
      {
        result = 0;
      }
      v3[3] = result;
    }
  }
  return result;
}

- (void)setActingPeer:(void *)result
{
  if (result)
  {
    SEL v3 = result;
    SEL v4 = (void *)result[3];
    if (v4 != a2)
    {

      id v5 = a2;
      v3[3] = v5;
      result = (void *)[v5 peerKey];
      uint64_t v6 = (void *)v3[6];
      if (result != v6)
      {

        result = (id)[(id)v3[3] peerKey];
        v3[6] = result;
      }
    }
  }
  return result;
}

- (uint64_t)prefetchManagedObjectsInContext:(void *)a3 error:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v56 = 0;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v6 = *(void **)(a1 + 72);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v53 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        if (v11 && *(void *)(v11 + 48))
        {
          objc_msgSend(v5, "setObject:forKey:", *(void *)(*((void *)&v52 + 1) + 8 * i));
          uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", *(void *)(v11 + 16));
          if (v12)
          {
            if ((*(unsigned char *)(v12 + 120) & 4) != 0)
            {
              v13 = *(void **)(v12 + 72);
            }
            else
            {
              do
              {
                v13 = (void *)v12;
                uint64_t v12 = [(id)v12 superentity];
              }
              while (v12);
            }
            uint64_t v14 = [v13 name];
            id v15 = (id)[v43 objectForKey:v14];
            if (!v15)
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v43 setObject:v15 forKey:v14];
            }
            [v15 addObject:*(void *)(v11 + 48)];
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ didn't get entity description back for entity named: %@\nMOC: %@\nPSC: %@", "-[PFUbiquityImportContext prefetchManagedObjectsInContext:error:]", 143, a1, v11, a2, [a2 persistentStoreCoordinator]);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v8);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = (id)[v43 allKeys];
  uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v42 = *(void *)v49;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v49 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v48 + 1) + 8 * j);
        v20 = [[NSFetchRequest alloc] initWithEntityName:v19];
        v21 = (void *)[v43 objectForKey:v19];
        if ([v21 count]) {
          uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", v21];
        }
        else {
          uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
        }
        [(NSFetchRequest *)v20 setPredicate:v22];
        v23 = (void *)[a2 executeFetchRequest:v20 error:&v56];

        if (!v23)
        {
          uint64_t v30 = 0;
          goto LABEL_43;
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v61 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v45;
          do
          {
            for (uint64_t k = 0; k != v25; ++k)
            {
              if (*(void *)v45 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v44 + 1) + 8 * k);
              uint64_t v29 = objc_msgSend(v5, "objectForKey:", objc_msgSend(v28, "objectID"));
              if (v29) {
                [*(id *)(a1 + 80) setObject:v28 forKey:v29];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v61 count:16];
          }
          while (v25);
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  uint64_t v30 = 1;
LABEL_43:

  if ((v30 & 1) == 0)
  {
    if (v56)
    {
      if (a3) {
        *a3 = v56;
      }
    }
    else
    {
      uint64_t v31 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Import/PFUbiquityImportContext.m");
      v38 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Import/PFUbiquityImportContext.m";
        __int16 v59 = 1024;
        int v60 = 189;
        _os_log_fault_impl(&dword_18AB82000, v38, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v30;
}

@end