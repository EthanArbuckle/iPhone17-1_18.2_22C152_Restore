@interface PFCloudKitStoreComparisonCache
- (BOOL)checkCloudKitMetadata;
- (BOOL)populate:(id *)a3;
- (NSManagedObjectContext)otherStoreMoc;
- (NSManagedObjectContext)storeMoc;
- (NSPersistentStore)otherStore;
- (NSPersistentStore)store;
- (PFCloudKitStoreComparisonCache)initWithStore:(id)a3 otherStore:(id)a4;
- (id)deriveIdentifierForNonCloudObjectID:(id)a3;
- (id)identifiersForStore:(id)a3;
- (id)identityRecordNameForStoreWithIdentifier:(id)a3;
- (id)metadataForObjectWithID:(id)a3;
- (id)metadataForRecordID:(id)a3 inStore:(id)a4;
- (id)mirroredRelationshipForObject:(id)a3 relatedToObject:(id)a4 byRelationship:(id)a5;
- (id)mtmKeysForRecordZone:(id)a3 inStore:(id)a4;
- (id)mtmKeysForStore:(id)a3;
- (id)objectIDForIdentifier:(id)a3 inStore:(id)a4;
- (id)objectIDForRecordID:(id)a3 inStore:(id)a4;
- (id)recordIDForObjectID:(id)a3;
- (id)recordIDsRelatedToRecordID:(id)a3 byRelationshipNamed:(id)a4 inStore:(id)a5;
- (id)recordIdsForStore:(id)a3;
- (id)sharedZoneIDsForStore:(id)a3;
- (int64_t)databaseScopeForStoreWithIdentifier:(id)a3;
- (void)_setCheckCloudKitMetadata:(BOOL)a3;
- (void)dealloc;
@end

@implementation PFCloudKitStoreComparisonCache

- (PFCloudKitStoreComparisonCache)initWithStore:(id)a3 otherStore:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PFCloudKitStoreComparisonCache;
  v6 = [(PFCloudKitStoreComparisonCache *)&v14 init];
  if (v6)
  {
    v6->_store = (NSPersistentStore *)a3;
    v6->_otherStore = (NSPersistentStore *)a4;
    v6->_storeMoc = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v6->_storeMoc, "setPersistentStoreCoordinator:", [a3 persistentStoreCoordinator]);
    [(NSManagedObjectContext *)v6->_storeMoc _setAllowAncillaryEntities:1];
    storeMoc = v6->_storeMoc;
    v16[0] = [a3 identifier];
    v8 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    if (storeMoc)
    {
      uint64_t v9 = [v8 copy];

      storeMoc->_persistentStoreIdentifiers = (NSArray *)v9;
    }
    v6->_otherStoreMoc = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v6->_otherStoreMoc, "setPersistentStoreCoordinator:", [a4 persistentStoreCoordinator]);
    [(NSManagedObjectContext *)v6->_otherStoreMoc _setAllowAncillaryEntities:1];
    otherStoreMoc = v6->_otherStoreMoc;
    uint64_t v15 = [a4 identifier];
    v11 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    if (otherStoreMoc)
    {
      uint64_t v12 = [v11 copy];

      otherStoreMoc->_persistentStoreIdentifiers = (NSArray *)v12;
    }
    v6->_storeUUIDToStoreCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v6;
}

- (void)dealloc
{
  self->_storeUUIDToStoreCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitStoreComparisonCache;
  [(PFCloudKitStoreComparisonCache *)&v3 dealloc];
}

- (BOOL)populate:(id *)a3
{
  v64[1] = *MEMORY[0x1E4F143B8];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 1;
  v5 = dispatch_group_create();
  v6 = objc_alloc_init(PFCloudKitStoreComparisonCacheStoreCache);
  v7 = v6;
  if (v6) {
    v6->_checkCloudKitMetadata = self->_checkCloudKitMetadata;
  }
  [(NSMutableDictionary *)self->_storeUUIDToStoreCache setObject:v6 forKey:[(NSPersistentStore *)self->_store identifier]];
  v8 = objc_alloc_init(PFCloudKitStoreComparisonCacheStoreCache);
  uint64_t v9 = v8;
  if (v8) {
    v8->_checkCloudKitMetadata = self->_checkCloudKitMetadata;
  }
  [(NSMutableDictionary *)self->_storeUUIDToStoreCache setObject:v8 forKey:[(NSPersistentStore *)self->_otherStore identifier]];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__14;
  v51 = __Block_byref_object_dispose__14;
  uint64_t v52 = 0;
  dispatch_group_enter(v5);
  storeMoc = self->_storeMoc;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __43__PFCloudKitStoreComparisonCache_populate___block_invoke;
  v46[3] = &unk_1E544C808;
  v46[4] = v7;
  v46[5] = self;
  v46[7] = &v47;
  v46[8] = &v53;
  v46[6] = v5;
  [(NSManagedObjectContext *)storeMoc performBlock:v46];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3052000000;
  v43 = __Block_byref_object_copy__14;
  v44 = __Block_byref_object_dispose__14;
  uint64_t v45 = 0;
  dispatch_group_enter(v5);
  otherStoreMoc = self->_otherStoreMoc;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __43__PFCloudKitStoreComparisonCache_populate___block_invoke_2;
  v39[3] = &unk_1E544C808;
  v39[4] = v9;
  v39[5] = self;
  v39[7] = &v40;
  v39[8] = &v53;
  v39[6] = v5;
  [(NSManagedObjectContext *)otherStoreMoc performBlock:v39];
  dispatch_time_t v12 = dispatch_time(0, 180000000000);
  if (dispatch_group_wait(v5, v12))
  {
    *((unsigned char *)v54 + 24) = 0;
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v63 = *MEMORY[0x1E4F28588];
    v64[0] = @"Failed to intialize caches in a reasonable amount of time.";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
    uint64_t v15 = (void *)[v13 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v14];
  }
  else
  {
    if (*((unsigned char *)v54 + 24)) {
      goto LABEL_22;
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v17 = v16;
    if (v48[5]) {
      objc_msgSend(v16, "addObject:");
    }
    if (v41[5]) {
      objc_msgSend(v17, "addObject:");
    }
    if (![v17 count])
    {
      uint64_t v18 = [NSString stringWithUTF8String:"Stores failed to initialize but did not return an error."];
      _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, v38);
      v25 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v25, OS_LOG_TYPE_FAULT, "CoreData: Stores failed to initialize but did not return an error.", buf, 2u);
      }
    }
    v26 = (void *)MEMORY[0x1E4F28C58];
    v61 = @"NSDetailedErrors";
    v62 = v17;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    uint64_t v15 = (void *)[v26 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v27];
  }
  if (!*((unsigned char *)v54 + 24))
  {
    if (v15)
    {
      if (a3) {
        *a3 = v15;
      }
    }
    else
    {
      uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparisonCache.m");
      v35 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparisonCache.m";
        __int16 v59 = 1024;
        int v60 = 163;
        _os_log_fault_impl(&dword_18AB82000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
LABEL_22:

  v48[5] = 0;
  v41[5] = 0;

  char v36 = *((unsigned char *)v54 + 24);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);
  return v36;
}

void __43__PFCloudKitStoreComparisonCache_populate___block_invoke(uint64_t *a1)
{
  if (!-[PFCloudKitStoreComparisonCacheStoreCache populateForStore:inContext:error:](a1[4], *(void **)(a1[5] + 24), *(void **)(a1[5] + 40), (void *)(*(void *)(a1[7] + 8) + 40)))
  {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
    id v2 = *(id *)(*(void *)(a1[7] + 8) + 40);
  }
  objc_super v3 = a1[6];

  dispatch_group_leave(v3);
}

void __43__PFCloudKitStoreComparisonCache_populate___block_invoke_2(uint64_t *a1)
{
  if (!-[PFCloudKitStoreComparisonCacheStoreCache populateForStore:inContext:error:](a1[4], *(void **)(a1[5] + 32), *(void **)(a1[5] + 48), (void *)(*(void *)(a1[7] + 8) + 40)))
  {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
    id v2 = *(id *)(*(void *)(a1[7] + 8) + 40);
  }
  objc_super v3 = a1[6];

  dispatch_group_leave(v3);
}

- (id)mirroredRelationshipForObject:(id)a3 relatedToObject:(id)a4 byRelationship:(id)a5
{
  uint64_t v7 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, objc_msgSend(-[PFCloudKitStoreComparisonCache recordIDForObjectID:](self, "recordIDForObjectID:", objc_msgSend(a3, "objectID")), "recordName"), objc_msgSend(-[PFCloudKitStoreComparisonCache recordIDForObjectID:](self, "recordIDForObjectID:", objc_msgSend(a4, "objectID")), "recordName"), (uint64_t)a5, objc_msgSend(a5, "inverseRelationship"));
  v8 = (void *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectID"), "persistentStore"), "identifier"));
  if (v8) {
    v8 = (void *)v8[3];
  }

  return (id)[v8 objectForKey:v7];
}

- (id)mtmKeysForStore:(id)a3
{
  uint64_t v3 = -[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", [a3 identifier]);
  if (v3) {
    v4 = *(void **)(v3 + 32);
  }
  else {
    v4 = 0;
  }
  if (v4) {
    return v4;
  }
  else {
    return (id)NSSet_EmptySet;
  }
}

- (id)recordIDsRelatedToRecordID:(id)a3 byRelationshipNamed:(id)a4 inStore:(id)a5
{
  uint64_t v7 = (void *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", [a5 identifier]);
  if (v7) {
    uint64_t v7 = (void *)v7[6];
  }
  id result = (id)objc_msgSend((id)objc_msgSend(v7, "objectForKey:", a3), "objectForKey:", a4);
  if (!result) {
    return (id)NSSet_EmptySet;
  }
  return result;
}

- (id)metadataForObjectWithID:(id)a3
{
  v4 = (void *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend((id)objc_msgSend(a3, "persistentStore"), "identifier"));
  if (v4) {
    v4 = (void *)v4[8];
  }

  return (id)[v4 objectForKey:a3];
}

- (id)recordIdsForStore:(id)a3
{
  uint64_t v3 = -[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", [a3 identifier]);
  if (v3) {
    v4 = *(void **)(v3 + 72);
  }
  else {
    v4 = 0;
  }
  if (v4) {
    return v4;
  }
  else {
    return (id)NSSet_EmptySet;
  }
}

- (id)objectIDForRecordID:(id)a3 inStore:(id)a4
{
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", [a4 identifier]);
  if (v5) {
    v5 = (void *)v5[10];
  }

  return (id)[v5 objectForKey:a3];
}

- (id)recordIDForObjectID:(id)a3
{
  v4 = (void *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", objc_msgSend((id)objc_msgSend(a3, "persistentStore"), "identifier"));
  if (v4) {
    v4 = (void *)v4[11];
  }

  return (id)[v4 objectForKey:a3];
}

- (id)identityRecordNameForStoreWithIdentifier:(id)a3
{
  id result = (id)[(NSMutableDictionary *)self->_storeUUIDToStoreCache objectForKey:a3];
  if (result) {
    return (id)*((void *)result + 16);
  }
  return result;
}

- (int64_t)databaseScopeForStoreWithIdentifier:(id)a3
{
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_storeUUIDToStoreCache objectForKey:a3];
  if (v3) {
    uint64_t v3 = (void *)v3[17];
  }

  return [v3 unsignedIntegerValue];
}

- (id)sharedZoneIDsForStore:(id)a3
{
  id result = (id)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", [a3 identifier]);
  if (result) {
    return (id)*((void *)result + 13);
  }
  return result;
}

- (id)mtmKeysForRecordZone:(id)a3 inStore:(id)a4
{
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", [a4 identifier]);
  if (v5) {
    v5 = (void *)v5[5];
  }
  id result = (id)[v5 objectForKey:a3];
  if (!result) {
    return (id)NSSet_EmptySet;
  }
  return result;
}

- (id)objectIDForIdentifier:(id)a3 inStore:(id)a4
{
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", [a4 identifier]);
  if (v5) {
    v5 = (void *)v5[2];
  }

  return (id)[v5 objectForKey:a3];
}

- (id)identifiersForStore:(id)a3
{
  uint64_t v3 = -[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", [a3 identifier]);
  if (v3) {
    v4 = *(void **)(v3 + 8);
  }
  else {
    v4 = 0;
  }
  if (v4) {
    return v4;
  }
  else {
    return (id)NSSet_EmptySet;
  }
}

- (id)metadataForRecordID:(id)a3 inStore:(id)a4
{
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_storeUUIDToStoreCache, "objectForKey:", [a4 identifier]);
  if (v5) {
    v5 = (void *)v5[7];
  }

  return (id)[v5 objectForKeyedSubscript:a3];
}

- (id)deriveIdentifierForNonCloudObjectID:(id)a3
{
  uint64_t v3 = (void *)[a3 URIRepresentation];
  return (id)[NSString stringWithFormat:@"%@/%@", objc_msgSend((id)objc_msgSend(v3, "URLByDeletingLastPathComponent"), "lastPathComponent"), objc_msgSend(v3, "lastPathComponent")];
}

- (void)_setCheckCloudKitMetadata:(BOOL)a3
{
  self->_checkCloudKitMetadata = a3;
}

- (NSPersistentStore)store
{
  return self->_store;
}

- (NSPersistentStore)otherStore
{
  return self->_otherStore;
}

- (NSManagedObjectContext)storeMoc
{
  return self->_storeMoc;
}

- (NSManagedObjectContext)otherStoreMoc
{
  return self->_otherStoreMoc;
}

- (BOOL)checkCloudKitMetadata
{
  return self->_checkCloudKitMetadata;
}

@end