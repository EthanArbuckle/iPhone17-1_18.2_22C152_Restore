@interface PFUbiquityPeerRangeCache
+ (uint64_t)integerFromPrimaryKeyString:(uint64_t)a1;
+ (void)initialize;
- (BOOL)cacheSQLCorePeerRange:(uint64_t)a1 error:(void *)a2;
- (PFUbiquityPeerRangeCache)initWithPrivateStore:(id)a3 storeName:(id)a4 andLocalPeerID:(id)a5;
- (id)description;
- (uint64_t)cachePeerRanges:(uint64_t)a1;
- (uint64_t)createGlobalObjectIDForManagedObjectID:(uint64_t)result;
- (uint64_t)createMapOfManagedObjectIDsForGlobalIDs:(uint64_t)a3 count:(void *)a4 error:;
- (uint64_t)refreshPeerRangeCache:(uint64_t)result;
- (void)dealloc;
@end

@implementation PFUbiquityPeerRangeCache

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _rangeReservationLock = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28FD0]);
  }
}

- (PFUbiquityPeerRangeCache)initWithPrivateStore:(id)a3 storeName:(id)a4 andLocalPeerID:(id)a5
{
  v8 = [(PFUbiquityPeerRangeCache *)self init];
  if (v8)
  {
    v8->_cachedRanges = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_allEntityRanges = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_storeName = (NSString *)a4;
    v8->_localPeerID = (NSString *)a5;
    v8->_translatedGlobalIDs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_cachedStorePeerRanges = 0;
    v8->_privateStore = (NSPersistentStore *)a3;
  }
  return v8;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_privateStore = 0;
  self->_cachedRanges = 0;

  self->_allEntityRanges = 0;
  self->_translatedGlobalIDs = 0;

  self->_storeName = 0;
  self->_localPeerID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerRangeCache;
  [(PFUbiquityPeerRangeCache *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerRangeCache;
  return (id)[NSString stringWithFormat:@"%@\n\tlocalPeerID: %@\n\tstoreName: %@\n", -[PFUbiquityPeerRangeCache description](&v3, sel_description), self->_storeName, self->_localPeerID];
}

- (uint64_t)cachePeerRanges:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 56)) {
    return 1;
  }
  id v3 = (id)[*(id *)(a1 + 48) persistentStoreCoordinator];
  v4 = v3;
  if (v3)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3052000000;
    v19 = __Block_byref_object_copy__67;
    v20 = __Block_byref_object_dispose__67;
    uint64_t v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__PFUbiquityPeerRangeCache_cachePeerRanges___block_invoke;
    v15[3] = &unk_1E544B9B0;
    v15[4] = a1;
    v15[5] = &v16;
    [v3 performBlockAndWait:v15];
    id v5 = (id)v17[5];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = (void *)v17[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if (!-[PFUbiquityPeerRangeCache cacheSQLCorePeerRange:error:](a1, *(void **)(*((void *)&v11 + 1) + 8 * i)))
          {
            uint64_t v2 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v2 = 1;
LABEL_15:
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v2 = 1;
  }

  *(unsigned char *)(a1 + 56) = 1;
  return v2;
}

id __44__PFUbiquityPeerRangeCache_cachePeerRanges___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[NSSQLCore allPeerRanges](*(void **)(*(void *)(a1 + 32) + 48));
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v2;
}

- (BOOL)cacheSQLCorePeerRange:(uint64_t)a1 error:(void *)a2
{
  if (a1)
  {
    if (a2) {
      uint64_t v4 = a2[1];
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = (id)[*(id *)(a1 + 8) objectForKey:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (a2) {
        uint64_t v6 = a2[1];
      }
      else {
        uint64_t v6 = 0;
      }
      [*(id *)(a1 + 8) setObject:v5 forKey:v6];
    }
    if (a2) {
      uint64_t v7 = a2[2];
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = (id)[v5 objectForKey:v7];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (a2) {
        uint64_t v9 = a2[2];
      }
      else {
        uint64_t v9 = 0;
      }
      [v5 setObject:v8 forKey:v9];
    }
    if (a2) {
      uint64_t v10 = a2[5];
    }
    else {
      uint64_t v10 = 0;
    }
    [v8 setObject:a2 forKey:v10];
    if (a2) {
      uint64_t v11 = a2[2];
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = (id)[*(id *)(a1 + 16) objectForKey:v11];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (a2) {
        uint64_t v13 = a2[2];
      }
      else {
        uint64_t v13 = 0;
      }
      [*(id *)(a1 + 16) setObject:v12 forKey:v13];
    }
    [v12 addObject:a2];
  }
  return a1 != 0;
}

- (uint64_t)refreshPeerRangeCache:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    *(unsigned char *)(result + 56) = 0;

    *(void *)(v1 + 8) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(v1 + 16) = objc_alloc_init(MEMORY[0x1E4F1CA60]);

    *(void *)(v1 + 24) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    return -[PFUbiquityPeerRangeCache cachePeerRanges:](v1);
  }
  return result;
}

- (uint64_t)createGlobalObjectIDForManagedObjectID:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v2 = a2;
  uint64_t v3 = result;
  uint64_t v4 = [a2 entity];
  if (v4)
  {
    if ((*(unsigned char *)(v4 + 120) & 4) != 0)
    {
      id v5 = *(void **)(v4 + 72);
    }
    else
    {
      do
      {
        id v5 = (void *)v4;
        uint64_t v4 = [(id)v4 superentity];
      }
      while (v4);
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [v5 name];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v2, "entity"), "name");
  id v8 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v2, "_referenceData64"));
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    if (!v2) {
      uint64_t v2 = (void *)[MEMORY[0x1E4F1CA98] null];
    }
    objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, @"Couldn't parse numeric primary key out of the provided object ID.", objc_msgSend(v19, "dictionaryWithObject:forKey:", v2, @"objectID")));
  }
  uint64_t v10 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v9];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:copyItems:", objc_msgSend(*(id *)(v3 + 16), "objectForKey:", v6), 0);
  if (![v11 count]) {
    goto LABEL_14;
  }
  [v11 filterUsingPredicate:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"rangeStart <= %@ AND %@ <= rangeEnd", v10, v10)];
  if ([v11 count] != 1)
  {
    if ((unint64_t)[v11 count] >= 2
      && +[PFUbiquityLogging canLogMessageAtLevel:1])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nFound multiple ranges for entity: %@ and local primary key: %@", "-[PFUbiquityPeerRangeCache cachedRangeForLocalPrimaryKey:ofEntityNamed:]", 255, v3, v6, v10);
    }
LABEL_14:
    uint64_t v12 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = [v11 objectAtIndex:0];
LABEL_15:

  if (v12)
  {
    uint64_t v13 = [*(id *)(v12 + 40) unsignedIntegerValue];
    uint64_t v9 = v13 + v9 - [*(id *)(v12 + 24) unsignedIntegerValue];
    long long v14 = [PFUbiquityGlobalObjectID alloc];
    uint64_t v15 = *(void *)(v3 + 40);
    uint64_t v16 = *(void *)(v12 + 8);
  }
  else
  {
    long long v14 = [PFUbiquityGlobalObjectID alloc];
    uint64_t v16 = *(void *)(v3 + 32);
    uint64_t v15 = *(void *)(v3 + 40);
  }

  return (uint64_t)[(PFUbiquityGlobalObjectID *)v14 initWithStoreName:v15 entityName:v7 primaryKeyInteger:v9 andPeerID:v16];
}

- (uint64_t)createMapOfManagedObjectIDsForGlobalIDs:(uint64_t)a3 count:(void *)a4 error:
{
  if (!a1) {
    return 0;
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = __Block_byref_object_copy__67;
  v24 = __Block_byref_object_dispose__67;
  id v25 = 0;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__67;
  uint64_t v18 = __Block_byref_object_dispose__67;
  uint64_t v19 = 0;
  id v8 = (id)[*(id *)(a1 + 48) persistentStoreCoordinator];
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__PFUbiquityPeerRangeCache_createMapOfManagedObjectIDsForGlobalIDs_count_error___block_invoke;
    v13[3] = &unk_1E544D9F8;
    v13[4] = a1;
    v13[5] = a2;
    v13[6] = v8;
    v13[7] = &v20;
    v13[8] = &v14;
    v13[9] = a3;
    [v8 performBlockAndWait:v13];
    id v9 = (id)v15[5];
    if (a4)
    {
      uint64_t v10 = v15[5];
      if (v10) {
        *a4 = v10;
      }
    }
    uint64_t v11 = v21[5];
  }
  else
  {
    uint64_t v11 = 0;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

void __80__PFUbiquityPeerRangeCache_createMapOfManagedObjectIDsForGlobalIDs_count_error___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v45 = *(void *)(a1 + 72);
  [(id)_rangeReservationLock lock];
  uint64_t v1 = [[PFUbiquityPeerRangeReservationContext alloc] initWithPersistentStore:*(void *)(*(void *)(a1 + 32) + 48) andGlobalObjectIDs:*(void *)(a1 + 40)];
  uint64_t v51 = (uint64_t)v1;
  uint64_t v46 = [*(id *)(*(void *)(a1 + 32) + 48) identifier];
  v47 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "managedObjectModel"), "entitiesByName");
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v1) {
    globalObjectIDs = v1->_globalObjectIDs;
  }
  else {
    globalObjectIDs = 0;
  }
  uint64_t v4 = (void *)[v2 initWithArray:globalObjectIDs];
  [v4 sortUsingComparator:globalObjectIDComparator];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v5)
  {
    uint64_t v49 = *(void *)v54;
    do
    {
      uint64_t v50 = v5;
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v54 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v7];
        if (v8)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v8 forKey:v7];
        }
        else
        {
          if (v7) {
            uint64_t v9 = v7[2];
          }
          else {
            uint64_t v9 = 0;
          }
          uint64_t v10 = [v47 objectForKey:v9];
          uint64_t v11 = v10;
          if (v10)
          {
            if ((*(unsigned char *)(v10 + 120) & 4) != 0)
            {
              uint64_t v12 = *(void **)(v10 + 72);
            }
            else
            {
              do
              {
                uint64_t v12 = (void *)v10;
                uint64_t v10 = [(id)v10 superentity];
              }
              while (v10);
            }
          }
          else
          {
            uint64_t v12 = 0;
          }
          uint64_t v13 = [v12 name];
          if (v7) {
            uint64_t v14 = (void *)v7[3];
          }
          else {
            uint64_t v14 = 0;
          }
          uint64_t v15 = +[PFUbiquityPeerRangeCache integerFromPrimaryKeyString:]((uint64_t)PFUbiquityPeerRangeCache, v14);
          uint64_t v16 = (void *)[objc_alloc(NSNumber) initWithInteger:v15];
          self;
          v17 = (void *)[objc_alloc(NSNumber) initWithInteger:v15 & 0xFFFFFFFFFFFFFC00];
          if (v7) {
            uint64_t v18 = v7[4];
          }
          else {
            uint64_t v18 = 0;
          }
          uint64_t v19 = *(void *)(a1 + 32);
          if (v19)
          {
            uint64_t v20 = objc_msgSend((id)objc_msgSend(*(id *)(v19 + 8), "objectForKey:", v18), "objectForKey:", v13);
            self;
            uint64_t v21 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v15 & 0xFFFFFFFFFFFFFC00];
            uint64_t v22 = [v20 objectForKey:v21];

            if (v22
              || ((uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:copyItems:", objc_msgSend(v20, "allValues"), 0), v24 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", v15), objc_msgSend(v23, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"peerStart <= %@ AND peerEnd >= %@", v24, v24)), !objc_msgSend(v23, "count"))|| objc_msgSend(v23, "count") != 1? (v22 = 0): (v22 = objc_msgSend(v23, "objectAtIndex:", 0)), v23,
                  v24,
                  v22))
            {
              unsigned int v25 = [*(id *)(v22 + 40) unsignedIntValue];
              uint64_t v26 = v15 - v25 + [*(id *)(v22 + 24) unsignedIntValue];
            }
            else
            {
              uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
            }
          }
          else
          {
            uint64_t v26 = 0;
          }
          if (v7) {
            v27 = (void *)v7[4];
          }
          else {
            v27 = 0;
          }
          if ([v27 isEqualToString:*(void *)(*(void *)(a1 + 32) + 32)])
          {
            v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:copyItems:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", v13), 0);
            [v28 filterUsingPredicate:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"rangeStart <= %@ AND rangeEnd >= %@", v16, v16)];
            if ([v28 count])
            {
              if (v26 == 0x7FFFFFFFFFFFFFFFLL)
              {
                -[PFUbiquityPeerRangeReservationContext prepareForRangeReservationWithRangeStart:andGlobalID:andEntityName:](v51, v16, (uint64_t)v7, v13);
                v29 = 0;
                uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else
              {
                v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"p%ld", v26);
                if (v7) {
                  uint64_t v35 = v7[2];
                }
                else {
                  uint64_t v35 = 0;
                }
                v29 = (void *)-[PFUbiquityPeerRangeReservationContext createLocalIDStringForStoreUUID:entityName:andPrimaryKeyString:](v51, v46, v35, (uint64_t)v34);
              }
            }
            else
            {
              if (v7)
              {
                uint64_t v32 = v7[2];
                uint64_t v33 = v7[3];
              }
              else
              {
                uint64_t v32 = 0;
                uint64_t v33 = 0;
              }
              v29 = (void *)-[PFUbiquityPeerRangeReservationContext createLocalIDStringForStoreUUID:entityName:andPrimaryKeyString:](v51, v46, v32, v33);
              uint64_t v26 = v15;
            }
          }
          else if (v26 == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[PFUbiquityPeerRangeReservationContext prepareForRangeReservationWithRangeStart:andGlobalID:andEntityName:](v51, v17, (uint64_t)v7, v13);
            v29 = 0;
            uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"p%ld", v26);
            if (v7) {
              uint64_t v31 = v7[2];
            }
            else {
              uint64_t v31 = 0;
            }
            v29 = (void *)-[PFUbiquityPeerRangeReservationContext createLocalIDStringForStoreUUID:entityName:andPrimaryKeyString:](v51, v46, v31, (uint64_t)v30);
          }
          if (v29)
          {
            [*(id *)(*(void *)(a1 + 32) + 24) setObject:v29 forKey:v7];
            v37 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) _newObjectIDForEntity:v11 referenceData64:v26];
            if (v7) {
              objc_setProperty_nonatomic(v7, v36, v37, 48);
            }

            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v29 forKey:v7];
          }
        }
        uint64_t v1 = (PFUbiquityPeerRangeReservationContext *)v51;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v5);
  }
  if (v1 && v1->_numRangesToReserve >= 1)
  {
    uint64_t v38 = *(void *)(a1 + 32);
    if (v45 >= 5)
    {
      uint64_t v42 = [NSString stringWithFormat:@"%@\nUnable to resolve global object IDs: %@\n%@\n%@", v38, v1->_globalObjectIDs, *(void *)(v38 + 8), *(void *)(v38 + 16)];
      v43 = (void *)MEMORY[0x1E4F1CA00];
      v57 = @"PFUbiquitySetupCheckForFork";
      uint64_t v58 = MEMORY[0x1E4F1CC38];
      uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      objc_exception_throw((id)[v43 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v42 userInfo:v44]);
    }
    if (-[PFUbiquityPeerRangeReservationContext createNewPeerRangesWithCache:Error:]((uint64_t)v1, v38, (void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)))
    {
      v39 = (void *)-[PFUbiquityPeerRangeCache createMapOfManagedObjectIDsForGlobalIDs:count:error:](*(void *)(a1 + 32), *(void *)(a1 + 40), v45 + 1, *(void *)(*(void *)(a1 + 64) + 8) + 40);
      v40 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (v39)
      {
        [v40 addEntriesFromDictionary:v39];
      }
      else
      {

        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = 0;
      }
    }
    else
    {

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = 0;
    }
  }
  id v41 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  [(id)_rangeReservationLock unlock];
}

+ (uint64_t)integerFromPrimaryKeyString:(uint64_t)a1
{
  self;
  if ([a2 characterAtIndex:0] != 112) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v3 = (void *)[a2 substringFromIndex:1];

  return [v3 integerValue];
}

@end