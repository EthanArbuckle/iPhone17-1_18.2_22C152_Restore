@interface NSCKRecordMetadata
+ (NSManagedObject)metadataForRecord:(void *)a3 inManagedObjectContext:(uint64_t)a4 fromStore:(void *)a5 error:;
+ (NSString)entityPath;
+ (id)batchUpdateMetadataMatchingEntityIdsAndPKs:(uint64_t)a3 withUpdates:(uint64_t)a4 inStore:(uint64_t)a5 withManagedObjectContext:(void *)a6 error:;
+ (id)createMapOfMetadataMatchingObjectIDs:(void *)a3 inStore:(void *)a4 inManagedObjectContext:(void *)a5 error:;
+ (id)encodeRecord:(id)a3 error:(id *)a4;
+ (id)insertMetadataForObject:(id)a3 setRecordName:(BOOL)a4 inZoneWithID:(id)a5 recordNamePrefix:(id)a6 error:(id *)a7;
+ (id)metadataForObjectIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(void *)a5 error:;
+ (id)metadataForRecordIDs:(void *)a3 fromStore:(void *)a4 inManagedObjectContext:(id *)a5 error:;
+ (id)recordFromEncodedData:(id)a3 error:(id *)a4;
+ (uint64_t)countRecordMetadataInStore:(uint64_t)a3 matchingPredicate:(uint64_t)a4 withManagedObjectContext:(id *)a5 error:;
+ (uint64_t)createMapOfMetadataMatchingRecords:(void *)a3 andRecordIDs:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(id *)a6 error:;
+ (uint64_t)createObjectIDForEntityID:(void *)a3 primaryKey:(void *)a4 inSQLCore:;
+ (uint64_t)createObjectIDFromMetadataDictionary:(void *)a3 inSQLCore:;
+ (uint64_t)metadataForObject:(void *)a3 inManagedObjectContext:(void *)a4 error:;
+ (uint64_t)purgeRecordMetadataWithRecordIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(id *)a5 error:;
+ (void)enumerateRecordMetadataDictionariesMatchingObjectIDs:(void *)a3 withProperties:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(uint64_t)a6 block:;
- (BOOL)mergeMoveReceiptsWithData:(id)a3 error:(id *)a4;
- (id)createEncodedMoveReceiptData:(id *)a3;
- (id)createRecordFromSystemFields;
- (uint64_t)createRecordID;
- (void)createObjectIDForLinkedRow;
@end

@implementation NSCKRecordMetadata

+ (id)insertMetadataForObject:(id)a3 setRecordName:(BOOL)a4 inZoneWithID:(id)a5 recordNamePrefix:(id)a6 error:(id *)a7
{
  BOOL v9 = a4;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v59 = 0;
  v60 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3052000000;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  v11 = (void *)[a3 managedObjectContext];
  v12 = objc_msgSend((id)objc_msgSend(a3, "objectID"), "persistentStore");
  uint64_t v13 = [v12 mirroringDelegate];
  if (v13)
  {
    v14 = *(void **)(v13 + 8);
  }
  else
  {
    uint64_t v15 = [NSString stringWithUTF8String:"Attempting to query cloudkit metadata without a mirroring delegate: %@"];
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v12);
    v22 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v65) = 138412290;
      *(void *)((char *)&v65 + 4) = v12;
      _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Attempting to query cloudkit metadata without a mirroring delegate: %@", (uint8_t *)&v65, 0xCu);
    }
    v14 = 0;
  }
  uint64_t v23 = [v14 databaseScope];
  v24 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordMetadata entityPath], v11);
  uint64_t v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "entity"), "attributesByName"), "objectForKey:", @"ckRecordID");
  if (v25)
  {
    v26 = (void *)[a3 managedObjectContext];
    *(void *)&long long v65 = MEMORY[0x1E4F143A8];
    *((void *)&v65 + 1) = 3221225472;
    v66 = __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke;
    v67 = &unk_1E544B9B0;
    id v68 = a3;
    v69 = &v54;
    [v26 performBlockAndWait:&v65];
  }
  if (!v55[5])
  {
    if ([a6 length])
    {
      uint64_t v27 = objc_msgSend((id)objc_msgSend(a3, "entity"), "name");
      v28 = (void *)[a6 stringByAppendingFormat:@"%@_%@", v27, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString")];
    }
    else
    {
      v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    }
    id v29 = v28;
    v55[5] = (uint64_t)v29;
    if (v25)
    {
      if (v9)
      {
        v30 = (void *)[a3 managedObjectContext];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke_2;
        v53[3] = &unk_1E544B4A8;
        v53[4] = a3;
        v53[5] = &v54;
        [v30 performBlockAndWait:v53];
      }
    }
  }
  [v11 assignObject:v24 toPersistentStore:v12];
  [(NSManagedObject *)v24 setCkRecordName:v55[5]];
  v31 = NSNumber;
  uint64_t v32 = _sqlEntityForEntityDescription([v12 model], objc_msgSend((id)objc_msgSend(a3, "objectID"), "entity"));
  if (v32) {
    uint64_t v33 = *(unsigned int *)(v32 + 184);
  }
  else {
    uint64_t v33 = 0;
  }
  -[NSManagedObject setEntityId:](v24, "setEntityId:", [v31 numberWithUnsignedInt:v33]);
  -[NSManagedObject setEntityPK:](v24, "setEntityPK:", objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend((id)objc_msgSend(a3, "objectID"), "_referenceData64")));
  [(NSManagedObject *)v24 setRecordZone:+[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, a5, v23, (uint64_t)v12, v11, (uint64_t)&v60)];
  if (![(NSManagedObject *)v24 recordZone])
  {
    v34 = (void *)MEMORY[0x18C127630]([v11 deleteObject:v24]);
    uint64_t v35 = __ckLoggingOverride;
    uint64_t v36 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to get a metadata zone while creating metadata for object: %@\n%@"];
    _NSCoreDataLog(v35 != 0, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"+[NSCKRecordMetadata insertMetadataForObject:usingMetadataContext:setRecordName:inZoneWithID:recordNamePrefix:error:]");
    v24 = 0;
  }

  v55[5] = 0;
  if (!v24)
  {
    if (v60)
    {
      if (a7) {
        *a7 = v60;
      }
    }
    else
    {
      uint64_t v44 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v44, v45, v46, v47, v48, v49, v50, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      v51 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v63 = 1024;
        int v64 = 587;
        _os_log_fault_impl(&dword_18AB82000, v51, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  _Block_object_dispose(&v54, 8);
  return v24;
}

void __116__NSCKRecordMetadata_batchUpdateMetadataMatchingEntityIdsAndPKs_withUpdates_inStore_withManagedObjectContext_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x18C127630]();
  [*(id *)(a1 + 32) setPredicate:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"entityId = %@ AND entityPK IN %@", a2, a3)];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "executeRequest:error:", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 64) + 8) + 40), "result");
  if (!v9)
  {
    *a4 = 1;
LABEL_13:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    id v19 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", v10]);
  [(NSFetchRequest *)v11 setPropertiesToFetch:&unk_1ED7E96D0];
  v25[0] = *(void *)(a1 + 48);
  -[NSFetchRequest setAffectedStores:](v11, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1]);
  [(NSFetchRequest *)v11 setReturnsObjectsAsFaults:0];
  v12 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v11 error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
  if (!v12)
  {
    *a4 = 1;
    goto LABEL_13;
  }
  uint64_t v13 = v12;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = -[NSCKRecordMetadata createObjectIDForLinkedRow](*(void **)(*((void *)&v20 + 1) + 8 * i));
        [*(id *)(a1 + 56) addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
LABEL_14:
}

+ (NSString)entityPath
{
  v2 = NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

- (uint64_t)createRecordID
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (![a1 recordZone]) {
    goto LABEL_8;
  }
  v2 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)[a1 recordZone]);
  if (!v2 || ![a1 ckRecordName])
  {

    goto LABEL_8;
  }
  uint64_t v3 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(a1, "ckRecordName"), v2);

  if (!v3)
  {
LABEL_8:
    uint64_t v4 = [NSString stringWithUTF8String:"createRecordID called before the record has the necessary properties: %@"];
    _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, (uint64_t)a1);
    v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = a1;
      _os_log_fault_impl(&dword_18AB82000, v11, OS_LOG_TYPE_FAULT, "CoreData: createRecordID called before the record has the necessary properties: %@", buf, 0xCu);
    }
    return 0;
  }
  return v3;
}

- (id)createRecordFromSystemFields
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSCKRecordMetadata *)self ckRecordSystemFields];
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:0];
    uint64_t v5 = (void *)[objc_alloc((Class)getCloudKitCKRecordClass[0]()) initWithCoder:v4];
    if (objc_msgSend((id)-[NSCKRecordMetadata ckRecordName](self, "ckRecordName"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v5, "recordID"), "recordName")))
    {
      if (objc_msgSend((id)objc_msgSend(v5, "recordType"), "hasPrefix:", @"CD_")) {
        goto LABEL_10;
      }
      uint64_t v16 = [NSString stringWithUTF8String:"NSCKRecordMetadata: System fields record type doesn't match new schema: %@\n%@\n%@"];
      uint64_t v17 = [(NSCKRecordMetadata *)self ckRecordName];
      [v5 recordID];
      _NSCoreDataLog(17, v16, v18, v19, v20, v21, v22, v23, v17);
      uint64_t v14 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_9:

        uint64_t v5 = 0;
LABEL_10:
        [v4 finishDecoding];

        return v5;
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = [(NSCKRecordMetadata *)self ckRecordName];
      __int16 v27 = 2112;
      uint64_t v28 = [v5 recordID];
      __int16 v29 = 2112;
      v30 = self;
      uint64_t v15 = "CoreData: NSCKRecordMetadata: System fields record type doesn't match new schema: %@\n%@\n%@";
    }
    else
    {
      uint64_t v6 = [NSString stringWithUTF8String:"NCKRecordMetadata: System fields record name doesn't match row: %@\n%@\n%@"];
      uint64_t v7 = [(NSCKRecordMetadata *)self ckRecordName];
      [v5 recordID];
      _NSCoreDataLog(17, v6, v8, v9, v10, v11, v12, v13, v7);
      uint64_t v14 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = [(NSCKRecordMetadata *)self ckRecordName];
      __int16 v27 = 2112;
      uint64_t v28 = [v5 recordID];
      __int16 v29 = 2112;
      v30 = self;
      uint64_t v15 = "CoreData: NCKRecordMetadata: System fields record name doesn't match row: %@\n%@\n%@";
    }
    _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, v15, buf, 0x20u);
    goto LABEL_9;
  }
  return 0;
}

- (void)createObjectIDForLinkedRow
{
  if (result)
  {
    v1 = result;
    v2 = (void *)[result entityId];
    uint64_t v3 = (void *)[v1 entityPK];
    uint64_t v4 = objc_msgSend((id)objc_msgSend(v1, "objectID"), "persistentStore");
    return (void *)+[NSCKRecordMetadata createObjectIDForEntityID:primaryKey:inSQLCore:]((uint64_t)NSCKRecordMetadata, v2, v3, v4);
  }
  return result;
}

+ (uint64_t)createObjectIDForEntityID:(void *)a3 primaryKey:(void *)a4 inSQLCore:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v7 = [a2 unsignedLongValue];
  uint64_t v8 = [a3 integerValue];
  if (!v7)
  {
    uint64_t v12 = [NSString stringWithUTF8String:"Cannot create objectID: called before the record has the necessary properties (entityID): %@"];
    _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)a4);
    uint64_t v19 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = a4;
      uint64_t v20 = "CoreData: Cannot create objectID: called before the record has the necessary properties (entityID): %@";
      uint64_t v21 = v19;
      uint32_t v22 = 12;
LABEL_14:
      _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, v20, buf, v22);
      return 0;
    }
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = _sqlCoreLookupSQLEntityForEntityID(a4, v7);
  if (!v10)
  {
    uint64_t v23 = [NSString stringWithUTF8String:"Cannot create objectID. Unable to find entity with id '%@' in store '%@'"];
    _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)a2);
    uint64_t v30 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = a2;
      __int16 v40 = 2112;
      uint64_t v41 = a4;
      uint64_t v20 = "CoreData: Cannot create objectID. Unable to find entity with id '%@' in store '%@'";
LABEL_13:
      uint64_t v21 = v30;
      uint32_t v22 = 22;
      goto LABEL_14;
    }
    return 0;
  }
  if (v9 < 1)
  {
    uint64_t v31 = [NSString stringWithUTF8String:"Cannot create objectID: called before the record has the necessary properties (primaryKey): %@ / %@"];
    _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)a2);
    uint64_t v30 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = a2;
      __int16 v40 = 2112;
      uint64_t v41 = a4;
      uint64_t v20 = "CoreData: Cannot create objectID: called before the record has the necessary properties (primaryKey): %@ / %@";
      goto LABEL_13;
    }
    return 0;
  }

  return [a4 newObjectIDForEntity:v10 pk:v9];
}

+ (uint64_t)createObjectIDFromMetadataDictionary:(void *)a3 inSQLCore:
{
  self;
  uint64_t v5 = (void *)[a2 objectForKey:@"entityId"];
  uint64_t v6 = (void *)[a2 objectForKey:@"entityPK"];

  return +[NSCKRecordMetadata createObjectIDForEntityID:primaryKey:inSQLCore:]((uint64_t)NSCKRecordMetadata, v5, v6, a3);
}

+ (uint64_t)metadataForObject:(void *)a3 inManagedObjectContext:(void *)a4 error:
{
  v27[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v22 = 0;
  v27[0] = [a2 objectID];
  id v7 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1], objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore"), a3, &v22);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [v7 lastObject];
    if ((unint64_t)[v8 count] >= 2)
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Found more than one instance of NSCKRecordMetadata for object: %s\n%s"];
      uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4);
      objc_msgSend((id)objc_msgSend(v8, "description"), "cStringUsingEncoding:", 4);
      _NSCoreDataLog(17, v10, v12, v13, v14, v15, v16, v17, v11);
      uint64_t v18 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        uint64_t v19 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4);
        uint64_t v20 = objc_msgSend((id)objc_msgSend(v8, "description"), "cStringUsingEncoding:", 4);
        *(_DWORD *)buf = 136315394;
        uint64_t v24 = v19;
        __int16 v25 = 2080;
        uint64_t v26 = v20;
        _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Found more than one instance of NSCKRecordMetadata for object: %s\n%s", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (a4 && v22) {
    *a4 = v22;
  }
  return v9;
}

+ (id)metadataForObjectIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(void *)a5 error:
{
  v41[1] = *MEMORY[0x1E4F143B8];
  self;
  id v35 = 0;
  id v30 = +[PFCloudKitMetadataModel createMapOfEntityIDToPrimaryKeySetForObjectIDs:a2];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
  v41[0] = a3;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = (void *)[v30 allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * v13);
      uint64_t v15 = (void *)MEMORY[0x18C127630]();
      uint64_t v16 = [v30 objectForKey:v14];
      -[NSFetchRequest setPredicate:](v9, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"entityId = %@ and entityPK in %@", v14, v16]);
      [(NSFetchRequest *)v9 setFetchBatchSize:500];
      uint64_t v17 = [a4 executeFetchRequest:v9 error:&v35];
      if (v17)
      {
        [v8 addObjectsFromArray:v17];
      }
      else
      {
        id v18 = v35;

        id v8 = 0;
      }
      if (!v17) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (!v8)
  {
    id v20 = v35;
    if (v20)
    {
      if (a5) {
        *a5 = v20;
      }
    }
    else
    {
      uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v38 = 1024;
        int v39 = 179;
        _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  id v35 = 0;
  return v8;
}

+ (id)createMapOfMetadataMatchingObjectIDs:(void *)a3 inStore:(void *)a4 inManagedObjectContext:(void *)a5 error:
{
  v96[1] = *MEMORY[0x1E4F143B8];
  self;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v88 = 0;
  id v8 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
  v72 = a3;
  v96[0] = a3;
  -[NSFetchRequest setAffectedStores:](v8, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:1]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v66 = v8;
  v67 = a4;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v10 = [a2 countByEnumeratingWithState:&v84 objects:v95 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v85;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v85 != v11) {
          objc_enumerationMutation(a2);
        }
        uint64_t v13 = *(void **)(*((void *)&v84 + 1) + 8 * v12);
        if ([v13 isTemporaryID])
        {
          uint64_t v14 = [NSString stringWithUTF8String:"Somehow got a temporary objectID for export: %s"];
          uint64_t v15 = objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4);
          _NSCoreDataLog(17, v14, v16, v17, v18, v19, v20, v21, v15);
          uint64_t v22 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v23 = objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4);
            *(_DWORD *)buf = 136315138;
            v90 = (const char *)v23;
            _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Somehow got a temporary objectID for export: %s", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v24 = _sqlEntityForEntityDescription([v72 model], objc_msgSend(v13, "entity"));
          if (v24) {
            uint64_t v25 = *(unsigned int *)(v24 + 184);
          }
          else {
            uint64_t v25 = 0;
          }
          uint64_t v26 = [NSNumber numberWithUnsignedInt:v25];
          uint64_t v27 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "_referenceData64"));
          id v28 = (id)[v75 objectForKey:v26];
          if (!v28)
          {
            id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v75 setObject:v28 forKey:v26];
          }
          [v28 addObject:v27];

          id v29 = (id)[v9 objectForKey:v26];
          if (!v29)
          {
            id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v9 setObject:v29 forKey:v26];
          }
          [v29 setObject:v13 forKey:v27];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v30 = [a2 countByEnumeratingWithState:&v84 objects:v95 count:16];
      uint64_t v10 = v30;
    }
    while (v30);
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v31 = (void *)[v75 allKeys];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v80 objects:v94 count:16];
  long long v34 = v66;
  long long v33 = v67;
  if (v32)
  {
    id v68 = v31;
    uint64_t v70 = *(void *)v81;
    unint64_t v35 = 0x1E4F28000uLL;
LABEL_22:
    uint64_t v73 = 0;
    uint64_t v69 = v32;
    while (1)
    {
      if (*(void *)v81 != v70) {
        objc_enumerationMutation(v68);
      }
      uint64_t v36 = *(void *)(*((void *)&v80 + 1) + 8 * v73);
      context = (void *)MEMORY[0x18C127630]();
      -[NSFetchRequest setPredicate:](v34, "setPredicate:", [*(id *)(v35 + 3936) predicateWithFormat:@"entityId = %@ and entityPK in %@", v36, objc_msgSend(v75, "objectForKey:", v36)]);
      [(NSFetchRequest *)v34 setFetchBatchSize:500];
      uint64_t v37 = (void *)[v33 executeFetchRequest:v34 error:&v88];
      __int16 v38 = v37;
      if (v37)
      {
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        uint64_t v39 = [v37 countByEnumeratingWithState:&v76 objects:v93 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v77 != v40) {
                objc_enumerationMutation(v38);
              }
              uint64_t v42 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              uint64_t v43 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", objc_msgSend(v42, "entityId")), "objectForKey:", objc_msgSend(v42, "entityPK"));
              if (v43)
              {
                [v7 setObject:v42 forKey:v43];
              }
              else
              {
                uint64_t v44 = [NSString stringWithUTF8String:"Exporter got record metadata back but doesn't have a corresponding objectID: %s"];
                uint64_t v45 = objc_msgSend((id)objc_msgSend(v42, "description"), "cStringUsingEncoding:", 4);
                _NSCoreDataLog(17, v44, v46, v47, v48, v49, v50, v51, v45);
                v52 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v53 = objc_msgSend((id)objc_msgSend(v42, "description"), "cStringUsingEncoding:", 4);
                  *(_DWORD *)buf = 136315138;
                  v90 = (const char *)v53;
                  _os_log_fault_impl(&dword_18AB82000, v52, OS_LOG_TYPE_FAULT, "CoreData: Exporter got record metadata back but doesn't have a corresponding objectID: %s", buf, 0xCu);
                }
              }
            }
            uint64_t v39 = [v38 countByEnumeratingWithState:&v76 objects:v93 count:16];
          }
          while (v39);
          long long v34 = v66;
          long long v33 = v67;
          unint64_t v35 = 0x1E4F28000;
          uint64_t v32 = v69;
        }
        else
        {
          uint64_t v32 = v69;
        }
      }
      else
      {
        id v54 = v88;

        id v7 = 0;
      }
      if (!v38) {
        break;
      }
      if (++v73 == v32)
      {
        uint64_t v32 = [v68 countByEnumeratingWithState:&v80 objects:v94 count:16];
        if (v32) {
          goto LABEL_22;
        }
        break;
      }
    }
  }
  if (!v7)
  {
    id v55 = v88;
    if (v55)
    {
      if (a5)
      {
        id v7 = 0;
        *a5 = v55;
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v56 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      __int16 v63 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v91 = 1024;
        int v92 = 249;
        _os_log_fault_impl(&dword_18AB82000, v63, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    id v7 = 0;
  }
LABEL_50:

  return v7;
}

+ (NSManagedObject)metadataForRecord:(void *)a3 inManagedObjectContext:(uint64_t)a4 fromStore:(void *)a5 error:
{
  v43[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = self;
  id v38 = 0;
  uint64_t v10 = (void *)MEMORY[0x18C127630](v9);
  uint64_t v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"ckRecordName = %@ and recordZone.ckRecordZoneName = %@ and recordZone.ckOwnerName = %@", objc_msgSend((id)objc_msgSend(a2, "recordID"), "recordName"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "recordID"), "zoneID"), "zoneName"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "recordID"), "zoneID"), "ownerName")]);
  v43[0] = a4;
  -[NSFetchRequest setAffectedStores:](v11, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1]);
  uint64_t v12 = (void *)[a3 executeFetchRequest:v11 error:&v38];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = (NSManagedObject *)(id)[v12 lastObject];
    if ((unint64_t)[v13 count] < 2
      || (uint64_t v15 = [NSString stringWithUTF8String:"Found more than one instance of NSCKRecordMetadata for record: %s\n%s"], v16 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4), objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4), _NSCoreDataLog(17, v15, v17, v18, v19, v20, v21, v22, v16), v23 = __pflogFaultLog, !os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
    {
      if (v14) {
        goto LABEL_7;
      }
      goto LABEL_5;
    }
    uint64_t v36 = objc_msgSend((id)objc_msgSend(a2, "description"), "cStringUsingEncoding:", 4);
    uint64_t v37 = objc_msgSend((id)objc_msgSend(v13, "description"), "cStringUsingEncoding:", 4);
    *(_DWORD *)buf = 136315394;
    uint64_t v40 = (const char *)v36;
    __int16 v41 = 2080;
    uint64_t v42 = v37;
    _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Found more than one instance of NSCKRecordMetadata for record: %s\n%s", buf, 0x16u);
    if (!v14)
    {
LABEL_5:
      uint64_t v14 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordMetadata entityPath], a3);
      -[NSManagedObject setCkRecordName:](v14, "setCkRecordName:", objc_msgSend((id)objc_msgSend(a2, "recordID"), "recordName"));
      [a3 assignObject:v14 toPersistentStore:a4];
      uint64_t v24 = v14;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_7:
  id v25 = v38;
  if (v38)
  {
    id v26 = v38;
    if (v26)
    {
      if (a5) {
        *a5 = v26;
      }
    }
    else
    {
      uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      long long v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v40 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v41 = 1024;
        LODWORD(v42) = 295;
        _os_log_fault_impl(&dword_18AB82000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v14;
}

+ (id)metadataForRecordIDs:(void *)a3 fromStore:(void *)a4 inManagedObjectContext:(id *)a5 error:
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v70 = (uint64_t)a3;
  uint64_t v6 = [a3 mirroringDelegate];
  if (!v6)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"Attempting to query cloudkit metadata without a mirroring delegate: %@"];
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)a3);
    uint64_t v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v81 = (const char *)v70;
      _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: Attempting to query cloudkit metadata without a mirroring delegate: %@", buf, 0xCu);
    }
  }
  id v79 = 0;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v17 = [a2 countByEnumeratingWithState:&v75 objects:v86 count:16];
  if (!v17)
  {
    char v66 = 1;
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)v76;
  char v66 = 1;
  do
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v76 != v18) {
        objc_enumerationMutation(a2);
      }
      uint64_t v20 = *(void **)(*((void *)&v75 + 1) + 8 * v19);
      uint64_t v21 = (void *)MEMORY[0x18C127630]();
      uint64_t v22 = (void *)[v20 zoneID];
      id v23 = (id)[v15 objectForKey:v22];
      if (!v23)
      {
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [v15 setObject:v23 forKey:v22];
      }
      objc_msgSend(v23, "addObject:", objc_msgSend(v20, "recordName"));

      if ([v16 objectForKey:v22]) {
        goto LABEL_16;
      }
      if (v6) {
        uint64_t v24 = *(void **)(v6 + 8);
      }
      else {
        uint64_t v24 = 0;
      }
      id v25 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v22, [v24 databaseScope], v70, a4, (uint64_t)&v79);
      if (v25)
      {
        id v79 = 0;
        objc_msgSend(v16, "setObject:forKey:", -[NSManagedObject objectID](v25, "objectID"), v22);
LABEL_16:
        int v26 = 1;
        goto LABEL_17;
      }
      id v27 = v79;
      char v66 = 0;
      int v26 = 0;
LABEL_17:
      if (!v26) {
        goto LABEL_25;
      }
      ++v19;
    }
    while (v17 != v19);
    uint64_t v28 = [a2 countByEnumeratingWithState:&v75 objects:v86 count:16];
    uint64_t v17 = v28;
  }
  while (v28);
LABEL_25:
  id v29 = v79;
  if (v66)
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obja = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a2, "count"));
    uint64_t v33 = (void *)[v15 allKeys];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v71 objects:v85 count:16];
    if (v34)
    {
      id v65 = v33;
      uint64_t v35 = *(void *)v72;
LABEL_29:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v72 != v35) {
          objc_enumerationMutation(v65);
        }
        uint64_t v37 = *(void *)(*((void *)&v71 + 1) + 8 * v36);
        id v38 = (void *)MEMORY[0x18C127630]();
        uint64_t v39 = [v16 objectForKey:v37];
        uint64_t v40 = [v15 objectForKey:v37];
        uint64_t v41 = v40;
        if (v39) {
          BOOL v42 = v40 == 0;
        }
        else {
          BOOL v42 = 1;
        }
        if (v42)
        {
          uint64_t v43 = [NSString stringWithUTF8String:"Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names"];
          _NSCoreDataLog(17, v43, v44, v45, v46, v47, v48, v49, v37);
          uint64_t v50 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v81 = (const char *)v37;
            _os_log_fault_impl(&dword_18AB82000, v50, OS_LOG_TYPE_FAULT, "CoreData: Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names", buf, 0xCu);
          }
        }
        uint64_t v51 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
        uint64_t v84 = v70;
        -[NSFetchRequest setAffectedStores:](v51, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1]);
        -[NSFetchRequest setPredicate:](v51, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"recordZone = %@ AND ckRecordName in %@", v39, v41]);
        uint64_t v52 = [a4 executeFetchRequest:v51 error:&v79];
        if (v52)
        {
          id v79 = 0;
          [obja addObjectsFromArray:v52];
        }
        else
        {
          id v53 = v79;
          char v66 = 0;
        }
        if (!v52) {
          break;
        }
        if (v34 == ++v36)
        {
          uint64_t v34 = [v65 countByEnumeratingWithState:&v71 objects:v85 count:16];
          if (v34) {
            goto LABEL_29;
          }
          break;
        }
      }
    }
    uint64_t v32 = obja;
    id v54 = v79;
    if (v66)
    {
      uint64_t v31 = (void *)[obja copy];
      char v30 = 1;
    }
    else
    {
      char v30 = 0;
      uint64_t v31 = 0;
    }
  }
  else
  {
    char v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
  }

  if ((v30 & 1) == 0)
  {
    if (v79)
    {
      if (a5) {
        *a5 = v79;
      }
    }
    else
    {
      uint64_t v55 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v55, v56, v57, v58, v59, v60, v61, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v62 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v81 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v82 = 1024;
        int v83 = 386;
        _os_log_fault_impl(&dword_18AB82000, v62, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v31;
}

+ (uint64_t)createMapOfMetadataMatchingRecords:(void *)a3 andRecordIDs:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(id *)a6 error:
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v8 = [a4 mirroringDelegate];
  if (v8)
  {
    uint64_t v9 = *(void **)(v8 + 8);
  }
  else
  {
    uint64_t v10 = [NSString stringWithUTF8String:"Attempting to query cloudkit metadata without a mirroring delegate: %@"];
    _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)a4);
    uint64_t v17 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v100 = (const char *)a4;
      _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: Attempting to query cloudkit metadata without a mirroring delegate: %@", buf, 0xCu);
    }
    uint64_t v9 = 0;
  }
  context = (void *)[v9 databaseScope];
  id v98 = 0;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v80 = (uint64_t)a4;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v21 = [a3 countByEnumeratingWithState:&v94 objects:v107 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v95 != v22) {
          objc_enumerationMutation(a3);
        }
        uint64_t v24 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        id v25 = (void *)[v24 zoneID];
        id v26 = (id)[v19 objectForKey:v25];
        if (!v26)
        {
          id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [v19 setObject:v26 forKey:v25];
        }
        objc_msgSend(v26, "addObject:", objc_msgSend(v24, "recordName"));

        if (![v20 objectForKey:v25])
        {
          id v27 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v25, (uint64_t)context, v80, a5, (uint64_t)&v98);
          if (!v27) {
            goto LABEL_59;
          }
          objc_msgSend(v20, "setObject:forKey:", -[NSManagedObject objectID](v27, "objectID"), v25);
        }
      }
      uint64_t v21 = [a3 countByEnumeratingWithState:&v94 objects:v107 count:16];
    }
    while (v21);
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v28 = [a2 countByEnumeratingWithState:&v90 objects:v106 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v91;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v91 != v29) {
          objc_enumerationMutation(a2);
        }
        uint64_t v31 = *(void **)(*((void *)&v90 + 1) + 8 * j);
        uint64_t v32 = objc_msgSend((id)objc_msgSend(v31, "recordID"), "zoneID");
        id v33 = (id)[v19 objectForKey:v32];
        if (!v33)
        {
          id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [v19 setObject:v33 forKey:v32];
        }
        objc_msgSend(v33, "addObject:", objc_msgSend((id)objc_msgSend(v31, "recordID"), "recordName"));

        if (![v20 objectForKey:v32])
        {
          uint64_t v34 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v32, (uint64_t)context, v80, a5, (uint64_t)&v98);
          if (!v34) {
            goto LABEL_59;
          }
          objc_msgSend(v20, "setObject:forKey:", -[NSManagedObject objectID](v34, "objectID"), v32);
        }
      }
      uint64_t v28 = [a2 countByEnumeratingWithState:&v90 objects:v106 count:16];
    }
    while (v28);
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v35 = (void *)[v19 allKeys];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v86 objects:v105 count:16];
  uint64_t v37 = v80;
  if (v36)
  {
    id obja = *(id *)v87;
    char v74 = 1;
    long long v72 = v35;
LABEL_32:
    uint64_t v38 = 0;
    uint64_t v75 = v36;
    while (1)
    {
      if (*(id *)v87 != obja) {
        objc_enumerationMutation(v35);
      }
      uint64_t v39 = *(void *)(*((void *)&v86 + 1) + 8 * v38);
      contexta = (void *)MEMORY[0x18C127630]();
      uint64_t v40 = [v20 objectForKey:v39];
      uint64_t v41 = [v19 objectForKey:v39];
      uint64_t v42 = v41;
      if (v40) {
        BOOL v43 = v41 == 0;
      }
      else {
        BOOL v43 = 1;
      }
      if (v43)
      {
        uint64_t v44 = [NSString stringWithUTF8String:"Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names"];
        _NSCoreDataLog(17, v44, v45, v46, v47, v48, v49, v50, v39);
        uint64_t v51 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v100 = (const char *)v39;
          _os_log_fault_impl(&dword_18AB82000, v51, OS_LOG_TYPE_FAULT, "CoreData: Invalid query for record metadata (by recordIDs): %@ returned no metadata or record names", buf, 0xCu);
        }
      }
      uint64_t v52 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
      uint64_t v104 = v37;
      -[NSFetchRequest setAffectedStores:](v52, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1]);
      -[NSFetchRequest setPredicate:](v52, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"recordZone = %@ AND ckRecordName in %@", v40, v42]);
      id v53 = (void *)[a5 executeFetchRequest:v52 error:&v98];
      id v54 = v53;
      if (v53)
      {
        id v98 = 0;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        uint64_t v55 = [v53 countByEnumeratingWithState:&v82 objects:v103 count:16];
        if (v55)
        {
          uint64_t v56 = *(void *)v83;
          do
          {
            for (uint64_t k = 0; k != v55; ++k)
            {
              if (*(void *)v83 != v56) {
                objc_enumerationMutation(v54);
              }
              uint64_t v58 = *(void **)(*((void *)&v82 + 1) + 8 * k);
              uint64_t v59 = (void *)-[NSCKRecordMetadata createRecordID](v58);
              [v18 setObject:v58 forKey:v59];
            }
            uint64_t v55 = [v54 countByEnumeratingWithState:&v82 objects:v103 count:16];
          }
          while (v55);
          uint64_t v37 = v80;
          uint64_t v35 = v72;
        }
      }
      else
      {
        id v60 = v98;
        char v74 = 0;
      }
      if (!v54) {
        break;
      }
      if (++v38 == v75)
      {
        uint64_t v36 = [v35 countByEnumeratingWithState:&v86 objects:v105 count:16];
        if (v36) {
          goto LABEL_32;
        }
        break;
      }
    }
  }
  else
  {
    char v74 = 1;
  }
  id v61 = v98;
  if ((v74 & 1) == 0)
  {
LABEL_59:
    if (v98)
    {
      if (a6)
      {
        uint64_t v62 = 0;
        *a6 = v98;
        goto LABEL_65;
      }
    }
    else
    {
      uint64_t v63 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v63, v64, v65, v66, v67, v68, v69, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v70 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v100 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v101 = 1024;
        int v102 = 500;
        _os_log_fault_impl(&dword_18AB82000, v70, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v62 = 0;
    goto LABEL_65;
  }
  uint64_t v62 = [v18 copy];
LABEL_65:

  return v62;
}

id __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) valueForKey:@"ckRecordID"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __117__NSCKRecordMetadata_insertMetadataForObject_usingMetadataContext_setRecordName_inZoneWithID_recordNamePrefix_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"ckRecordID"];
}

+ (uint64_t)purgeRecordMetadataWithRecordIDs:(uint64_t)a3 inStore:(void *)a4 withManagedObjectContext:(id *)a5 error:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  self;
  id v51 = 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v9 = [a2 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(a2);
        }
        uint64_t v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v13 = (id)objc_msgSend(v8, "objectForKey:", objc_msgSend(v12, "zoneID"));
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          objc_msgSend(v8, "setObject:forKey:", v13, objc_msgSend(v12, "zoneID"));
        }
        objc_msgSend(v13, "addObject:", objc_msgSend(v12, "recordName"));
      }
      uint64_t v9 = [a2 countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v9);
  }
  uint64_t v14 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
  uint64_t v58 = a3;
  -[NSFetchRequest setAffectedStores:](v14, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v15 = [v8 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v15)
  {
    char v37 = 1;
    uint64_t v38 = *(void *)v44;
LABEL_12:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v44 != v38) {
        objc_enumerationMutation(v8);
      }
      uint64_t v17 = *(void **)(*((void *)&v43 + 1) + 8 * v16);
      id v18 = (void *)MEMORY[0x18C127630]();
      uint64_t v19 = [v8 objectForKey:v17];
      -[NSFetchRequest setPredicate:](v14, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"((recordZone.ckRecordZoneName = %@) AND (recordZone.ckOwnerName = %@) AND (ckRecordName IN %@)) OR (needsCloudDelete = 1 AND needsUpload = 0)", objc_msgSend(v17, "zoneName"), objc_msgSend(v17, "ownerName"), v19]);
      id v20 = (void *)[a4 executeFetchRequest:v14 error:&v51];
      uint64_t v21 = v20;
      if (v20)
      {
        id v51 = 0;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v56 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v40;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v40 != v23) {
                objc_enumerationMutation(v21);
              }
              [a4 deleteObject:*(void *)(*((void *)&v39 + 1) + 8 * j)];
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v56 count:16];
          }
          while (v22);
        }
      }
      else
      {
        id v25 = v51;
        char v37 = 0;
      }
      if (!v21) {
        break;
      }
      if (++v16 == v15)
      {
        uint64_t v15 = [v8 countByEnumeratingWithState:&v43 objects:v57 count:16];
        if (v15) {
          goto LABEL_12;
        }
        break;
      }
    }
  }
  else
  {
    char v37 = 1;
  }
  id v26 = v51;

  if ((v37 & 1) == 0)
  {
    if (v51)
    {
      if (a5) {
        *a5 = v51;
      }
    }
    else
    {
      uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v53 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v54 = 1024;
        int v55 = 636;
        _os_log_fault_impl(&dword_18AB82000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v37 & 1;
}

+ (uint64_t)countRecordMetadataInStore:(uint64_t)a3 matchingPredicate:(uint64_t)a4 withManagedObjectContext:(id *)a5 error:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
  [(NSFetchRequest *)v9 setPredicate:a3];
  [(NSFetchRequest *)v9 setResultType:4];
  v12[0] = a2;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1]);
  if (a4)
  {
    uint64_t v10 = -[NSManagedObjectContext _countForFetchRequest_:error:](a4, v9, a5);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  return [NSNumber numberWithUnsignedInteger:v10];
}

+ (id)batchUpdateMetadataMatchingEntityIdsAndPKs:(uint64_t)a3 withUpdates:(uint64_t)a4 inStore:(uint64_t)a5 withManagedObjectContext:(void *)a6 error:
{
  v39[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3052000000;
  uint64_t v28 = __Block_byref_object_copy__3;
  uint64_t v29 = __Block_byref_object_dispose__3;
  uint64_t v30 = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v12 = [[NSBatchUpdateRequest alloc] initWithEntityName:+[NSCKRecordMetadata entityPath]];
  v39[0] = a4;
  -[NSPersistentStoreRequest setAffectedStores:](v12, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1]);
  [(NSBatchUpdateRequest *)v12 setPropertiesToUpdate:a3];
  [(NSBatchUpdateRequest *)v12 setResultType:1];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __116__NSCKRecordMetadata_batchUpdateMetadataMatchingEntityIdsAndPKs_withUpdates_inStore_withManagedObjectContext_error___block_invoke;
  v24[3] = &unk_1E544B960;
  v24[4] = v12;
  v24[5] = a5;
  v24[6] = a4;
  v24[7] = v11;
  v24[8] = &v25;
  v24[9] = &v31;
  [a2 enumerateKeysAndObjectsUsingBlock:v24];
  if (!*((unsigned char *)v32 + 24))
  {

    id v13 = (id)v26[5];
    if (v13)
    {
      if (a6)
      {
        id v11 = 0;
        *a6 = v13;
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v36 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v37 = 1024;
        int v38 = 793;
        _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    id v11 = 0;
  }
LABEL_8:

  v26[5] = 0;
  id v22 = v11;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  return v22;
}

+ (void)enumerateRecordMetadataDictionariesMatchingObjectIDs:(void *)a3 withProperties:(void *)a4 inStore:(void *)a5 withManagedObjectContext:(uint64_t)a6 block:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  self;
  self;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = a2;
  uint64_t v10 = [a2 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v62;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v62 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v61 + 1) + 8 * v13);
        uint64_t v15 = NSNumber;
        uint64_t v16 = _sqlEntityForEntityDescription([a4 model], objc_msgSend(v14, "entity"));
        if (v16) {
          uint64_t v17 = *(unsigned int *)(v16 + 184);
        }
        else {
          uint64_t v17 = 0;
        }
        uint64_t v18 = [v15 numberWithUnsignedInt:v17];
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "_referenceData64"));
        id v20 = (id)[v9 objectForKey:v18];
        if (!v20)
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [v9 setObject:v20 forKey:v18];
        }
        [v20 addObject:v19];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v21 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
      uint64_t v11 = v21;
    }
    while (v21);
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v23 = [a3 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (!v23) {
    goto LABEL_22;
  }
  uint64_t v24 = v23;
  int v25 = 0;
  uint64_t v26 = *(void *)v58;
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v58 != v26) {
        objc_enumerationMutation(a3);
      }
      uint64_t v28 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      [v22 addObject:v28];
      v25 |= [v28 isEqualToString:@"objectID"];
    }
    uint64_t v24 = [a3 countByEnumeratingWithState:&v57 objects:v67 count:16];
  }
  while (v24);
  if ((v25 & 1) == 0) {
LABEL_22:
  }
    [v22 addObject:@"objectID"];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obja = (id)[v9 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (obja)
  {
    id v41 = 0;
    uint64_t v43 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != obja; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v54 != v43) {
          objc_enumerationMutation(v9);
        }
        uint64_t v30 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
        uint64_t v31 = (void *)MEMORY[0x18C127630]();
        uint64_t v32 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
        [(NSFetchRequest *)v32 setResultType:2];
        [(NSFetchRequest *)v32 setFetchBatchSize:1000];
        [(NSFetchRequest *)v32 setPropertiesToFetch:v22];
        uint64_t v33 = [v9 objectForKey:v30];
        -[NSFetchRequest setPredicate:](v32, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"entityId = %@ AND entityPK IN %@", v30, v33]);
        id v52 = 0;
        char v34 = (void *)[a5 executeFetchRequest:v32 error:&v52];
        if (v34)
        {
          uint64_t v35 = v34;
          id v52 = 0;
          char v51 = 0;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v65 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v48;
LABEL_31:
            uint64_t v39 = 0;
            while (1)
            {
              if (*(void *)v48 != v38) {
                objc_enumerationMutation(v35);
              }
              (*(void (**)(uint64_t, void, void, char *))(a6 + 16))(a6, *(void *)(*((void *)&v47 + 1) + 8 * v39), 0, &v51);
              if (v51) {
                break;
              }
              if (v37 == ++v39)
              {
                uint64_t v37 = [v35 countByEnumeratingWithState:&v47 objects:v65 count:16];
                if (v37) {
                  goto LABEL_31;
                }
                break;
              }
            }
          }
        }
        else if (!v41)
        {
          id v41 = v52;
        }
      }
      id obja = (id)[v9 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (obja);
  }
  else
  {
    id v41 = 0;
  }
  id v40 = v41;
}

- (id)createEncodedMoveReceiptData:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  uint64_t v5 = (void *)MEMORY[0x18C127630](self, a2);
  uint64_t v6 = [[NSCKRecordMetadataReceiptArchive alloc] initWithReceiptsToEncode:[(NSCKRecordMetadata *)self moveReceipts]];
  id v7 = (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v19];
  if (v7)
  {
  }
  else
  {
    id v9 = v19;

    id v10 = v19;
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
    }
    else
    {
      uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v18 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v22 = 1024;
        int v23 = 903;
        _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v7;
}

- (BOOL)mergeMoveReceiptsWithData:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v43 = 0;
  id v7 = [(NSManagedObjectID *)[(NSManagedObject *)self objectID] persistentStore];
  id v8 = [(NSManagedObject *)self managedObjectContext];
  if (!v7)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to merge move receipts before assigning a record metadata to a store: %@"];
    _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)self);
    uint64_t v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v45 = self;
      _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to merge move receipts before assigning a record metadata to a store: %@", buf, 0xCu);
    }
  }
  uint64_t v17 = (void *)MEMORY[0x18C127630]();
  id v18 = (id)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v43];
  if (v18)
  {
    uint64_t v37 = v8;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v20 = (void *)[(NSCKRecordMetadata *)self moveReceipts];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          int v25 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * i) createRecordIDForMovedRecord];
          [v19 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v22);
    }
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __54__NSCKRecordMetadata_mergeMoveReceiptsWithData_error___block_invoke;
    v38[3] = &unk_1E544B988;
    id v8 = v37;
    v38[4] = v19;
    v38[5] = v37;
    v38[6] = self;
    v38[7] = v7;
    [v18 enumerateArchivedRecordIDsUsingBlock:v38];
  }
  else
  {
    id v27 = v43;
    id v28 = v43;
    if (v28)
    {
      if (a4) {
        *a4 = v28;
      }
    }
    else
    {
      uint64_t v29 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      uint64_t v36 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v45 = (NSCKRecordMetadata *)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v46 = 1024;
        int v47 = 957;
        _os_log_fault_impl(&dword_18AB82000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  id v43 = 0;
  return v18 != 0;
}

uint64_t __54__NSCKRecordMetadata_mergeMoveReceiptsWithData_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if ((result & 1) == 0)
  {
    id v7 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordZoneMoveReceipt entityPath], *(void *)(a1 + 40));
    [(NSManagedObject *)v7 setRecordMetadata:*(void *)(a1 + 48)];
    [(NSManagedObject *)v7 setMovedAt:a3];
    [(NSManagedObject *)v7 setNeedsCloudDelete:0];
    -[NSManagedObject setZoneName:](v7, "setZoneName:", objc_msgSend((id)objc_msgSend(a2, "zoneID"), "zoneName"));
    -[NSManagedObject setOwnerName:](v7, "setOwnerName:", objc_msgSend((id)objc_msgSend(a2, "zoneID"), "ownerName"));
    -[NSManagedObject setRecordName:](v7, "setRecordName:", [a2 recordName]);
    [*(id *)(a1 + 40) assignObject:v7 toPersistentStore:*(void *)(a1 + 56)];
    id v8 = *(void **)(a1 + 32);
    return [v8 addObject:a2];
  }
  return result;
}

+ (id)encodeRecord:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v21 = 0;
  uint64_t v6 = (void *)MEMORY[0x18C127630](a1, a2);
  id v7 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v21];
  if (!v7 || (id v8 = (id)[v7 compressedDataUsingAlgorithm:0 error:&v21]) == 0)
  {
    id v10 = v21;
    id v11 = v21;
    if (v11)
    {
      if (a4)
      {
        uint64_t v9 = 0;
        *a4 = v11;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      id v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v24 = 1024;
        int v25 = 987;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = v8;
LABEL_10:

  return v9;
}

+ (id)recordFromEncodedData:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v23 = 0;
  uint64_t v6 = (void *)MEMORY[0x18C127630](a1, a2);
  uint64_t v7 = [a3 decompressedDataUsingAlgorithm:0 error:&v23];
  if (!v7
    || (uint64_t v8 = v7,
        uint64_t v9 = (void *)MEMORY[0x1E4F28DC0],
        getCloudKitCKRecordClass[0](),
        (id v10 = (id)[v9 unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v23]) == 0))
  {
    id v12 = v23;
    id v13 = v23;
    if (v13)
    {
      if (a4)
      {
        id v11 = 0;
        *a4 = v13;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m");
      id v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v25 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordMetadata.m";
        __int16 v26 = 1024;
        int v27 = 1013;
        _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    id v11 = 0;
    goto LABEL_10;
  }
  id v11 = v10;
LABEL_10:

  return v11;
}

@end