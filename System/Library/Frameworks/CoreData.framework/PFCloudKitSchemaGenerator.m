@interface PFCloudKitSchemaGenerator
+ (__CFString)representativeValueFor:(uint64_t)a1;
+ (void)newRepresentativeRecordForStaticFieldsInEntity:(uint64_t)a3 inZoneWithID:;
- (BOOL)populateRelationshipsOnObject:(uint64_t)a3 inStore:(uint64_t)a4 withCache:(uint64_t)a5 error:;
- (BOOL)populateValuesOnObject:(uint64_t)a3 error:;
- (NSManagedObject)representativeObjectForEntity:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(void *)a5 cache:(int)a6 populate:(uint64_t)a7 error:;
- (PFCloudKitSchemaGenerator)initWithMirroringOptions:(id)a3 forStoreInMonitor:(id)a4;
- (_NSDataFileBackedFuture)representativeFuture;
- (uint64_t)createRepresentativeFileBackedFutureInContext:(uint64_t *)a1 error:(void *)a2;
- (uint64_t)newRepresentativeRecords:(uint64_t)a1;
- (void)dealloc;
@end

@implementation PFCloudKitSchemaGenerator

- (PFCloudKitSchemaGenerator)initWithMirroringOptions:(id)a3 forStoreInMonitor:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitSchemaGenerator;
  v6 = [(PFCloudKitSchemaGenerator *)&v8 init];
  if (v6)
  {
    v6->_mirroringOptions = (NSCloudKitMirroringDelegateOptions *)a3;
    v6->_storeMonitor = (PFCloudKitStoreMonitor *)a4;
  }
  return v6;
}

- (void)dealloc
{
  self->_representativeFuture = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitSchemaGenerator;
  [(PFCloudKitSchemaGenerator *)&v3 dealloc];
}

- (uint64_t)newRepresentativeRecords:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3052000000;
    v20 = __Block_byref_object_copy__54;
    v21 = __Block_byref_object_dispose__54;
    uint64_t v22 = 0;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = *(void *)(v2 + 16);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__PFCloudKitSchemaGenerator_newRepresentativeRecords___block_invoke;
    v16[3] = &unk_1E544F828;
    v16[6] = &v17;
    v16[7] = &v23;
    v16[4] = v2;
    v16[5] = v4;
    -[PFCloudKitStoreMonitor performBlock:](v5, (uint64_t)v16);
    if (*((unsigned char *)v24 + 24))
    {
      uint64_t v2 = [v4 copy];
LABEL_10:

      v18[5] = 0;
      _Block_object_dispose(&v17, 8);
      _Block_object_dispose(&v23, 8);
      return v2;
    }
    id v6 = (id)v18[5];
    if (v6)
    {
      if (a2)
      {
        uint64_t v2 = 0;
        *a2 = v6;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v7 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSchemaGenerator.m");
      v14 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSchemaGenerator.m";
        __int16 v29 = 1024;
        int v30 = 124;
        _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v2 = 0;
    goto LABEL_10;
  }
  return v2;
}

void __54__PFCloudKitSchemaGenerator_newRepresentativeRecords___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v2 && *(unsigned char *)(v2 + 21))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [v3 initWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:0];
  }
  else
  {
    id v4 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v2);
    id v5 = (id)[v4 configurationName];
    id v6 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(*(void *)(a1 + 32) + 16));
    [(NSManagedObjectContext *)v6 _setAllowAncillaryEntities:1];
    [(NSManagedObjectContext *)v6 setTransactionAuthor:@"NSCloudKitMirroringDelegate.schemaGenerator"];
    uint64_t v7 = [(NSPersistentStoreCoordinator *)[(NSManagedObjectContext *)v6 persistentStoreCoordinator] managedObjectModel];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PFCloudKitSchemaGenerator_newRepresentativeRecords___block_invoke_2;
    v8[3] = &unk_1E544F800;
    v8[4] = v5;
    v8[5] = v7;
    v8[6] = *(void *)(a1 + 32);
    v8[7] = v4;
    v8[8] = v6;
    uint64_t v10 = *(void *)(a1 + 56);
    long long v9 = *(_OWORD *)(a1 + 40);
    [(NSManagedObjectContext *)v6 performBlockAndWait:v8];
  }
}

void __54__PFCloudKitSchemaGenerator_newRepresentativeRecords___block_invoke_2(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [*(id *)(a1 + 32) length];
  id v6 = *(void **)(a1 + 40);
  if (v5) {
    uint64_t v7 = (void *)[v6 entitiesForConfiguration:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v7 = (void *)[v6 entities];
  }
  uint64_t v8 = v7;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!-[PFCloudKitSchemaGenerator representativeObjectForEntity:inStore:withManagedObjectContext:cache:populate:error:](*(void *)(a1 + 48), *(void **)(*((void *)&v42 + 1) + 8 * i), *(void *)(a1 + 56), *(void **)(a1 + 64), v4, 1, *(void *)(*(void *)(a1 + 80) + 8) + 40))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
          id v13 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          goto LABEL_14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    id v36 = v3;
    id v37 = v2;
    v14 = objc_alloc_init(PFCloudKitMetadataCache);
    v15 = [[PFCloudKitSerializer alloc] initWithMirroringOptions:*(void *)(*(void *)(a1 + 48) + 8) metadataCache:v14 recordNamePrefix:@"CD_FAKE_"];
    v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "insertedObjects"), "allObjects");
    if ([*(id *)(a1 + 64) obtainPermanentIDsForObjects:v16 error:*(void *)(*(void *)(a1 + 80) + 8) + 40])
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v39 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v38 + 1) + 8 * j);
            uint64_t v22 = (void *)MEMORY[0x18C127630]();
            if (v15
              && (id v23 = -[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]((uint64_t)v15, v21, 1, 1, (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))) != 0)
            {
              v24 = v23;
              [*(id *)(a1 + 72) addObjectsFromArray:v23];
            }
            else
            {
              id v25 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
              v24 = 0;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
        }
        while (v18);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      id v26 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      uint64_t v27 = [NSString stringWithUTF8String:"Failed to acquire permanent objectIDs during schema generation: %@"];
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
      v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = v35;
        _os_log_fault_impl(&dword_18AB82000, v34, OS_LOG_TYPE_FAULT, "CoreData: Failed to acquire permanent objectIDs during schema generation: %@", buf, 0xCu);
      }
    }

    id v3 = v36;
    id v2 = v37;
  }
}

- (NSManagedObject)representativeObjectForEntity:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(void *)a5 cache:(int)a6 populate:(uint64_t)a7 error:
{
  if (!a1) {
    return 0;
  }
  v14 = (NSManagedObject *)objc_msgSend(a5, "objectForKey:", objc_msgSend(a2, "name"));
  if (v14)
  {
    if (!a6) {
      return v14;
    }
  }
  else
  {
    v14 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", [a2 name], a4);
    [a4 assignObject:v14 toPersistentStore:a3];
    objc_msgSend(a5, "setObject:forKey:", v14, objc_msgSend(a2, "name"));
    if (!a6) {
      return v14;
    }
  }
  if (!-[PFCloudKitSchemaGenerator populateValuesOnObject:error:](a1, v14, a7)) {
    return 0;
  }
  if (!-[PFCloudKitSchemaGenerator populateRelationshipsOnObject:inStore:withCache:error:](a1, v14, a3, (uint64_t)a5, a7))return 0; {
  return v14;
  }
}

- (BOOL)populateValuesOnObject:(uint64_t)a3 error:
{
  if (!a1) {
    return 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  id v6 = objc_msgSend((id)objc_msgSend(a2, "entity"), "attributesByName");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PFCloudKitSchemaGenerator_populateValuesOnObject_error___block_invoke;
  v9[3] = &unk_1E544F850;
  v9[4] = a2;
  v9[5] = a1;
  v9[6] = &v10;
  v9[7] = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)populateRelationshipsOnObject:(uint64_t)a3 inStore:(uint64_t)a4 withCache:(uint64_t)a5 error:
{
  if (!a1) {
    return 0;
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = (void *)[a2 entity];
  uint64_t v11 = [a2 managedObjectContext];
  uint64_t v12 = (void *)[v10 relationshipsByName];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PFCloudKitSchemaGenerator_populateRelationshipsOnObject_inStore_withCache_error___block_invoke;
  v15[3] = &unk_1E544F878;
  v15[4] = a2;
  v15[5] = a1;
  v15[6] = a3;
  v15[7] = v11;
  v15[8] = a4;
  v15[9] = &v16;
  v15[10] = a5;
  [v12 enumerateKeysAndObjectsUsingBlock:v15];
  BOOL v13 = *((unsigned char *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);
  return v13;
}

uint64_t __58__PFCloudKitSchemaGenerator_populateValuesOnObject_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = +[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)PFCloudKitSerializer, a3);
  if ((result & 1) == 0)
  {
    uint64_t result = [a3 attributeType];
    if (result)
    {
      uint64_t result = [a3 attributeType];
      if (result != 1800)
      {
        uint64_t result = [a3 isTransient];
        if ((result & 1) == 0)
        {
          uint64_t result = [*(id *)(a1 + 32) valueForKey:a2];
          if (!result)
          {
            if ([a3 isFileBackedFuture])
            {
              uint64_t v9 = *(uint64_t **)(a1 + 40);
              [*(id *)(a1 + 32) managedObjectContext];
              uint64_t v10 = -[PFCloudKitSchemaGenerator createRepresentativeFileBackedFutureInContext:error:](v9, *(void **)(a1 + 56));
              uint64_t v11 = v10;
              if (v10)
              {
                v14 = v10;
                uint64_t v10 = (uint64_t *)[*(id *)(a1 + 32) setValue:v10 forKey:a2];
                uint64_t v11 = v14;
              }
              else
              {
                *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
                *a4 = 1;
              }
              return MEMORY[0x1F41817F8](v10, v11);
            }
            else
            {
              uint64_t v12 = *(void **)(a1 + 32);
              BOOL v13 = +[PFCloudKitSchemaGenerator representativeValueFor:]((uint64_t)PFCloudKitSchemaGenerator, a3);
              return [v12 setValue:v13 forKey:a2];
            }
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)createRepresentativeFileBackedFutureInContext:(uint64_t *)a1 error:(void *)a2
{
  id v2 = a1;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v23 = 0;
    id v3 = (void *)a1[3];
    if (v3)
    {
LABEL_3:
      id v2 = v3;
LABEL_16:

      return v2;
    }
    uint64_t v5 = a1[2];
    if (v5 && *(unsigned char *)(v5 + 21))
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v7 = (id)[v6 initWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:0];
      id v23 = v7;
    }
    else
    {
      uint64_t v8 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v5);
      uint64_t v9 = (void *)+[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]((uint64_t)PFCloudKitSerializer, v8);
      uint64_t v10 = (void *)[@"Some sample data generated by PFCloudKitSchemaGenerator for a representative file backed future" dataUsingEncoding:1];
      if ([v10 writeToURL:v9 options:0 error:&v23])
      {
        uint64_t v11 = [_NSDataFileBackedFuture alloc];
        v2[3] = (uint64_t)-[_NSDataFileBackedFuture initWithURL:UUID:size:](v11, v9, (void *)[MEMORY[0x1E4F29128] UUID], objc_msgSend(v10, "length"));

        id v3 = (void *)v2[3];
        goto LABEL_3;
      }
      id v12 = v23;

      id v7 = v23;
    }
    id v13 = v7;
    if (v13)
    {
      if (a2)
      {
        id v2 = 0;
        *a2 = v13;
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSchemaGenerator.m");
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v25 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSchemaGenerator.m";
        __int16 v26 = 1024;
        int v27 = 303;
        _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    id v2 = 0;
    goto LABEL_16;
  }
  return v2;
}

+ (__CFString)representativeValueFor:(uint64_t)a1
{
  self;
  uint64_t v3 = [a2 defaultValue];
  uint64_t v4 = [a2 attributeType];
  if (v3) {
    return (__CFString *)v3;
  }
  if (v4 <= 699)
  {
    if (v4 > 399)
    {
      if (v4 != 400 && v4 != 500 && v4 != 600) {
        goto LABEL_28;
      }
      return (__CFString *)&unk_1ED7E9BB0;
    }
    else
    {
      if (v4 != 100 && v4 != 200 && v4 != 300) {
        goto LABEL_28;
      }
      return (__CFString *)&unk_1ED7E2C08;
    }
  }
  if (v4 <= 999)
  {
    if (v4 == 700) {
      return @"An example core data string";
    }
    if (v4 == 800) {
      return (__CFString *)MEMORY[0x1E4F1CC38];
    }
    if (v4 != 900)
    {
LABEL_28:
      uint64_t v8 = [NSString stringWithUTF8String:"Unsupported attribute type"];
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, v26);
      uint64_t v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v26) = 0;
        uint64_t v16 = "CoreData: Unsupported attribute type";
        uint64_t v17 = (uint8_t *)&v26;
LABEL_42:
        _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, v16, v17, 2u);
        return 0;
      }
      return 0;
    }
    id v7 = (void *)MEMORY[0x1E4F1C9C8];
    return (__CFString *)[v7 date];
  }
  else
  {
    if (v4 <= 1199)
    {
      if (v4 != 1000)
      {
        if (v4 == 1100)
        {
          id v6 = (void *)MEMORY[0x1E4F29128];
          return (__CFString *)[v6 UUID];
        }
        goto LABEL_28;
      }
      if ([a2 isFileBackedFuture])
      {
        uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", "Invalid invocation of this method, it cannot generate a useful value for a file backed future.");
        _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, v26);
        uint64_t v15 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v16 = "CoreData: Invalid invocation of this method, it cannot generate a useful value for a file backed future.";
          uint64_t v17 = buf;
          goto LABEL_42;
        }
        return 0;
      }
      goto LABEL_33;
    }
    if (v4 != 1200)
    {
      if (v4 != 1800) {
        goto LABEL_28;
      }
LABEL_33:
      return (__CFString *)[@"Some example data" dataUsingEncoding:4];
    }
    id v25 = (void *)MEMORY[0x1E4F1CB10];
    return (__CFString *)[v25 URLWithString:@"http://www.apple.com"];
  }
}

uint64_t __83__PFCloudKitSchemaGenerator_populateRelationshipsOnObject_inStore_withCache_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  if (![a3 isToMany])
  {
    int v13 = objc_msgSend((id)objc_msgSend(a3, "inverseRelationship"), "isToMany");
    uint64_t result = [*(id *)(a1 + 32) valueForKey:a2];
    if (v13)
    {
      if (result) {
        return result;
      }
      uint64_t result = -[PFCloudKitSchemaGenerator representativeObjectForEntity:inStore:withManagedObjectContext:cache:populate:error:](*(void *)(a1 + 40), [a3 destinationEntity], *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), 0, *(void *)(a1 + 80));
      if (result)
      {
        uint64_t v11 = result;
        uint64_t v12 = *(void **)(a1 + 32);
        goto LABEL_10;
      }
    }
    else
    {
      if (result) {
        return result;
      }
      uint64_t result = -[PFCloudKitSchemaGenerator representativeObjectForEntity:inStore:withManagedObjectContext:cache:populate:error:](*(void *)(a1 + 40), [a3 destinationEntity], *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), 0, *(void *)(a1 + 80));
      if (!result) {
        return result;
      }
      uint64_t v14 = (void *)result;
      [*(id *)(a1 + 32) setValue:result forKey:a2];
      uint64_t result = -[PFCloudKitSchemaGenerator populateValuesOnObject:error:](*(void *)(a1 + 40), v14, *(void *)(a1 + 80));
      if (result)
      {
        uint64_t result = -[PFCloudKitSchemaGenerator populateRelationshipsOnObject:inStore:withCache:error:](*(void *)(a1 + 40), v14, *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 80));
        if (result) {
          return result;
        }
      }
    }
LABEL_17:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *a4 = 1;
    return result;
  }
  uint64_t v8 = (void *)[*(id *)(a1 + 32) valueForKey:a2];
  if (v8)
  {
    uint64_t result = [v8 count];
    if (result) {
      return result;
    }
  }
  uint64_t result = -[PFCloudKitSchemaGenerator representativeObjectForEntity:inStore:withManagedObjectContext:cache:populate:error:](*(void *)(a1 + 40), [a3 destinationEntity], *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), 0, *(void *)(a1 + 80));
  if (!result) {
    goto LABEL_17;
  }
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithObject:result];
  uint64_t v12 = v10;
LABEL_10:

  return [v12 setValue:v11 forKey:a2];
}

+ (void)newRepresentativeRecordForStaticFieldsInEntity:(uint64_t)a3 inZoneWithID:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self;
  id v5 = objc_alloc((Class)getCloudKitCKRecordClass[0]());
  id v6 = objc_msgSend(v5, "initWithRecordType:zoneID:", +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, (uint64_t)a2), a3);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = objc_msgSend((id)objc_msgSend(a2, "attributesByName", 0), "allValues");
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [v12 attributeType];
        if (v13
          && v13 != 2000
          && (+[PFCloudKitSerializer isVariableLengthAttributeType:]((uint64_t)PFCloudKitSerializer, [v12 attributeType]) & 1) == 0)
        {
          uint64_t v14 = +[PFCloudKitSchemaGenerator representativeValueFor:]((uint64_t)PFCloudKitSchemaGenerator, v12);
          if ([v12 attributeType] == 1100)
          {
            uint64_t v15 = [(__CFString *)v14 UUIDString];
            goto LABEL_13;
          }
          if ([v12 attributeType] == 1200)
          {
            uint64_t v15 = [(__CFString *)v14 absoluteString];
LABEL_13:
            uint64_t v14 = (__CFString *)v15;
          }
          objc_msgSend(v6, "setObject:forKey:", v14, +[PFCloudKitSerializer applyCDPrefixToName:]((uint64_t)PFCloudKitSerializer, objc_msgSend(v12, "name")));
          continue;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  return v6;
}

- (_NSDataFileBackedFuture)representativeFuture
{
  return self->_representativeFuture;
}

@end