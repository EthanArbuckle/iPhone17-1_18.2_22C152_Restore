@interface PFUbiquityPeerRangeReservationContext
- (PFUbiquityPeerRangeReservationContext)init;
- (PFUbiquityPeerRangeReservationContext)initWithPersistentStore:(id)a3 andGlobalObjectIDs:(id)a4;
- (uint64_t)createLocalIDStringForStoreUUID:(uint64_t)a3 entityName:(uint64_t)a4 andPrimaryKeyString:;
- (uint64_t)createNewPeerRangesWithCache:(void *)a3 Error:;
- (uint64_t)prepareForRangeReservationWithRangeStart:(uint64_t)a3 andGlobalID:(uint64_t)a4 andEntityName:;
- (void)dealloc;
@end

@implementation PFUbiquityPeerRangeReservationContext

- (PFUbiquityPeerRangeReservationContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityPeerRangeReservationContext;
  v2 = [(PFUbiquityPeerRangeReservationContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_moc = 0;
    v2->_store = 0;
    v2->_psc = 0;
    v2->_peerEntityNameRangeStartSet = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_globalIDToLocalURI = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_unresolvedGlobalObjectIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_globalObjectIDs = 0;
    v3->_numRangesToReserve = 0;
    v3->_storeNameToFetchedMetadata = v4;
  }
  return v3;
}

- (PFUbiquityPeerRangeReservationContext)initWithPersistentStore:(id)a3 andGlobalObjectIDs:(id)a4
{
  objc_super v6 = [(PFUbiquityPeerRangeReservationContext *)self init];
  if (v6)
  {
    v6->_store = (NSPersistentStore *)a3;
    v6->_psc = (NSPersistentStoreCoordinator *)(id)[a3 persistentStoreCoordinator];
    moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
    v6->_moc = moc;
    if (v6->_psc)
    {
      -[NSManagedObjectContext setPersistentStoreCoordinator:](moc, "setPersistentStoreCoordinator:");
      moc = v6->_moc;
    }
    [(NSManagedObjectContext *)moc setUndoManager:0];
    v6->_globalObjectIDs = (NSArray *)a4;
  }
  return v6;
}

- (void)dealloc
{
  self->_store = 0;
  self->_psc = 0;

  self->_moc = 0;
  self->_peerEntityNameRangeStartSet = 0;

  self->_globalIDToLocalURI = 0;
  self->_unresolvedGlobalObjectIDs = 0;

  self->_storeNameToFetchedMetadata = 0;
  self->_globalObjectIDs = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerRangeReservationContext;
  [(PFUbiquityPeerRangeReservationContext *)&v3 dealloc];
}

- (uint64_t)createNewPeerRangesWithCache:(void *)a3 Error:
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v90 = 0;
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    obuint64_t j = *(id *)(a1 + 8);
    uint64_t v4 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
    if (v4)
    {
      uint64_t v61 = *(void *)v87;
      do
      {
        uint64_t v5 = 0;
        uint64_t v63 = v4;
        do
        {
          if (*(void *)v87 != v61) {
            objc_enumerationMutation(obj);
          }
          objc_super v6 = (void *)[*(id *)(a1 + 8) objectForKey:*(void *)(*((void *)&v86 + 1) + 8 * v5)];
          uint64_t v66 = v5;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v82 objects:v98 count:16];
          if (v7)
          {
            uint64_t v8 = *(void *)v83;
            do
            {
              for (uint64_t i = 0; i != v7; ++i)
              {
                if (*(void *)v83 != v8) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v10 = *(void *)(*((void *)&v82 + 1) + 8 * i);
                v11 = (void *)[v6 objectForKey:v10];
                id v12 = (id)[v3 objectForKey:v10];
                if (!v12) {
                  id v12 = (id)[objc_alloc(NSNumber) initWithInt:0];
                }
                v13 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", objc_msgSend(v12, "integerValue") + (objc_msgSend(v11, "count") << 10));

                [v3 setObject:v13 forKey:v10];
              }
              uint64_t v7 = [v6 countByEnumeratingWithState:&v82 objects:v98 count:16];
            }
            while (v7);
          }
          uint64_t v5 = v66 + 1;
        }
        while (v66 + 1 != v63);
        uint64_t v4 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
      }
      while (v4);
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v52 = v14;
    uint64_t v16 = [v3 countByEnumeratingWithState:&v78 objects:v97 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v79;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v79 != v17) {
            objc_enumerationMutation(v3);
          }
          uint64_t v19 = *(void *)(*((void *)&v78 + 1) + 8 * j);
          objc_msgSend(v15, "addObject:", objc_msgSend(v3, "objectForKey:", v19));
          objc_msgSend(v14, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "managedObjectModel"), "entitiesByName"), "objectForKey:", v19));
        }
        uint64_t v16 = [v3 countByEnumeratingWithState:&v78 objects:v97 count:16];
      }
      while (v16);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    v94 = __Block_byref_object_copy__68;
    v95 = __Block_byref_object_dispose__68;
    uint64_t v96 = 0;
    v20 = *(void **)(a1 + 48);
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __76__PFUbiquityPeerRangeReservationContext_createNewPeerRangesWithCache_Error___block_invoke;
    v77[3] = &unk_1E544B818;
    v77[4] = a1;
    v77[5] = v14;
    v77[6] = v15;
    v77[7] = buf;
    [v20 performBlockAndWait:v77];
    uint64_t v21 = [*(id *)(*(void *)&buf[8] + 40) count];
    if (v21)
    {
      uint64_t v47 = v21;
      uint64_t v22 = 0;
      LOBYTE(v23) = 1;
      id v50 = v15;
      do
      {
        v64 = (void *)[v14 objectAtIndex:v22];
        v24 = (void *)[*(id *)(*(void *)&buf[8] + 40) objectAtIndex:v22];
        uint64_t v25 = objc_msgSend((id)objc_msgSend(v15, "objectAtIndex:", v22), "integerValue");
        uint64_t v57 = [v24 integerValue];
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v49 = *(id *)(a1 + 8);
        uint64_t v26 = [v49 countByEnumeratingWithState:&v73 objects:v92 count:16];
        if (v26)
        {
          uint64_t v53 = *(void *)v74;
          uint64_t v51 = v22;
          do
          {
            uint64_t v27 = 0;
            uint64_t v54 = v26;
            do
            {
              if (*(void *)v74 != v53) {
                objc_enumerationMutation(v49);
              }
              uint64_t v62 = *(void *)(*((void *)&v73 + 1) + 8 * v27);
              v28 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:"), "objectForKey:", objc_msgSend(v64, "name"));
              long long v71 = 0u;
              long long v72 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              uint64_t v67 = [v28 countByEnumeratingWithState:&v69 objects:v91 count:16];
              if (v67)
              {
                uint64_t v55 = v27;
                id obja = *(id *)v70;
                id v56 = v28;
                do
                {
                  uint64_t v29 = 0;
                  uint64_t v30 = -v25;
                  do
                  {
                    if (*(id *)v70 != obja) {
                      objc_enumerationMutation(v56);
                    }
                    v31 = *(void **)(*((void *)&v69 + 1) + 8 * v29);
                    v32 = (void *)[objc_alloc(NSNumber) initWithInteger:v57 + v30 + 1];
                    v33 = (void *)[objc_alloc(NSNumber) initWithLongLong:v57 + v30 + 1024];
                    v34 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", objc_msgSend(v31, "integerValue") + 1023);
                    v35 = -[PFUbiquitySQLCorePeerRange initWithOwningPeerID:entityName:rangeStart:rangeEnd:peerStart:peerEnd:]([PFUbiquitySQLCorePeerRange alloc], "initWithOwningPeerID:entityName:rangeStart:rangeEnd:peerStart:peerEnd:", v62, [v64 name], v32, v33, v31, v34);
                    BOOL v23 = -[PFUbiquityPeerRangeCache cacheSQLCorePeerRange:error:](a2, v35);
                    if (v23)
                    {
                      v36 = *(void **)(a1 + 48);
                      v68[0] = MEMORY[0x1E4F143A8];
                      v68[1] = 3221225472;
                      v68[2] = __76__PFUbiquityPeerRangeReservationContext_createNewPeerRangesWithCache_Error___block_invoke_2;
                      v68[3] = &unk_1E544B778;
                      v68[4] = a1;
                      v68[5] = v35;
                      [v36 performBlockAndWait:v68];
                      --*(void *)(a1 + 72);
                    }

                    ++v29;
                    v30 += 1024;
                  }
                  while (v67 != v29);
                  uint64_t v25 = -v30;
                  uint64_t v67 = [v56 countByEnumeratingWithState:&v69 objects:v91 count:16];
                }
                while (v67);
                uint64_t v25 = -v30;
                uint64_t v22 = v51;
                id v14 = v52;
                id v15 = v50;
                uint64_t v27 = v55;
              }
              ++v27;
            }
            while (v27 != v54);
            uint64_t v26 = [v49 countByEnumeratingWithState:&v73 objects:v92 count:16];
          }
          while (v26);
        }
        ++v22;
      }
      while (v22 != v47);
    }
    else
    {
      LOBYTE(v23) = 1;
    }

    *(void *)(*(void *)&buf[8] + 40) = 0;
    _Block_object_dispose(buf, 8);
    if (v23)
    {
      uint64_t v37 = 1;
LABEL_56:

      return v37;
    }
    if (v90)
    {
      if (a3)
      {
        uint64_t v37 = 0;
        *a3 = v90;
        goto LABEL_56;
      }
    }
    else
    {
      uint64_t v38 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityPeerRangeReservationContext.m");
      v45 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFU"
                             "biquityPeerRangeReservationContext.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 200;
        _os_log_fault_impl(&dword_18AB82000, v45, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v37 = 0;
    goto LABEL_56;
  }
  return 0;
}

id __76__PFUbiquityPeerRangeReservationContext_createNewPeerRangesWithCache_Error___block_invoke(uint64_t a1)
{
  id result = -[NSSQLCore _newReservedKeysForEntities:counts:](*(void **)(*(void *)(a1 + 32) + 40), *(void **)(a1 + 40), *(void **)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

void __76__PFUbiquityPeerRangeReservationContext_createNewPeerRangesWithCache_Error___block_invoke_2(uint64_t a1)
{
}

- (uint64_t)prepareForRangeReservationWithRangeStart:(uint64_t)a3 andGlobalID:(uint64_t)a4 andEntityName:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    objc_msgSend(*(id *)(result + 24), "addObject:");
    if (a3) {
      uint64_t v8 = *(void *)(a3 + 32);
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = (id)[*(id *)(v7 + 8) valueForKey:v8];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (a3) {
        uint64_t v10 = *(void *)(a3 + 32);
      }
      else {
        uint64_t v10 = 0;
      }
      [*(id *)(v7 + 8) setValue:v9 forKey:v10];
    }
    id v11 = (id)[v9 valueForKey:a4];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [v9 setValue:v11 forKey:a4];
    }
    uint64_t v12 = [a2 integerValue];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
LABEL_12:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v11);
        }
        id result = [*(id *)(*((void *)&v18 + 1) + 8 * v16) integerValue];
        if (v12 > result && v12 < result + 1023) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v14) {
            goto LABEL_12;
          }
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:
      id result = [v11 containsObject:a2];
      if ((result & 1) == 0)
      {
        id result = [v11 addObject:a2];
        ++*(void *)(v7 + 72);
      }
    }
  }
  return result;
}

- (uint64_t)createLocalIDStringForStoreUUID:(uint64_t)a3 entityName:(uint64_t)a4 andPrimaryKeyString:
{
  if (result) {
    return [[NSString alloc] initWithFormat:@"x-coredata://%@/%@/%@", a2, a3, a4];
  }
  return result;
}

@end