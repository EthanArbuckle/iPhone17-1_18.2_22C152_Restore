@interface NSCKRecordZoneMoveReceipt
+ (NSString)entityPath;
+ (id)countMoveReceiptsInStore:(id)a3 matchingPredicate:(id)a4 withManagedObjectContext:(id)a5 error:(id *)a6;
+ (id)moveReceiptsMatchingRecordIDs:(id)a3 inManagedObjectContext:(id)a4 persistentStore:(id)a5 error:(id *)a6;
+ (uint64_t)_fetchReceiptsMatchingSubPredicates:(void *)a3 inManagedObjectContext:(uint64_t)a4 persistentStore:(uint64_t)a5 error:;
- (id)createRecordIDForMovedRecord;
@end

@implementation NSCKRecordZoneMoveReceipt

+ (NSString)entityPath
{
  v2 = NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

- (id)createRecordIDForMovedRecord
{
  id v3 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", -[NSCKRecordZoneMoveReceipt zoneName](self, "zoneName"), -[NSCKRecordZoneMoveReceipt ownerName](self, "ownerName"));
  v4 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", -[NSCKRecordZoneMoveReceipt recordName](self, "recordName"), v3);

  return v4;
}

+ (id)moveReceiptsMatchingRecordIDs:(id)a3 inManagedObjectContext:(id)a4 persistentStore:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__19;
  v27 = __Block_byref_object_dispose__19;
  uint64_t v28 = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([a3 count])
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __104__NSCKRecordZoneMoveReceipt_moveReceiptsMatchingRecordIDs_inManagedObjectContext_persistentStore_error___block_invoke;
    v22[3] = &unk_1E544D128;
    v22[4] = a3;
    v22[5] = a4;
    v22[6] = a5;
    v22[7] = v10;
    v22[8] = &v23;
    v22[9] = &v29;
    [a4 performBlockAndWait:v22];
  }
  id v11 = v10;
  if (!*((unsigned char *)v30 + 24))
  {
    id v12 = (id)v24[5];
    if (v12)
    {
      if (a6)
      {
        id v10 = 0;
        *a6 = v12;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordZoneMoveReceipt.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKRecordZoneMoveReceipt.m";
        __int16 v35 = 1024;
        int v36 = 88;
        _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    id v10 = 0;
  }
LABEL_10:

  v24[5] = 0;
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v10;
}

void __104__NSCKRecordZoneMoveReceipt_moveReceiptsMatchingRecordIDs_inManagedObjectContext_persistentStore_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x18C127630]();
        [v2 addObject:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"recordName = %@ AND zoneName = %@ AND ownerName = %@", objc_msgSend(v7, "recordName"), objc_msgSend((id)objc_msgSend(v7, "zoneID"), "zoneName"), objc_msgSend((id)objc_msgSend(v7, "zoneID"), "ownerName"))];
        if ((unint64_t)[v2 count] >= 0x64)
        {
          uint64_t v9 = +[NSCKRecordZoneMoveReceipt _fetchReceiptsMatchingSubPredicates:inManagedObjectContext:persistentStore:error:]((uint64_t)NSCKRecordZoneMoveReceipt, (uint64_t)v2, *(void **)(a1 + 40), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 64) + 8) + 40);
          if (!v9)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
            id v10 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
            goto LABEL_13;
          }
          [*(id *)(a1 + 56) addObjectsFromArray:v9];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) && [v2 count])
  {
    uint64_t v11 = +[NSCKRecordZoneMoveReceipt _fetchReceiptsMatchingSubPredicates:inManagedObjectContext:persistentStore:error:]((uint64_t)NSCKRecordZoneMoveReceipt, (uint64_t)v2, *(void **)(a1 + 40), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v11)
    {
      [*(id *)(a1 + 56) addObjectsFromArray:v11];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      id v12 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
  }
}

+ (uint64_t)_fetchReceiptsMatchingSubPredicates:(void *)a3 inManagedObjectContext:(uint64_t)a4 persistentStore:(uint64_t)a5 error:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath]);
  v11[0] = a4;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1]);
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:a2]);
  return [a3 executeFetchRequest:v9 error:a5];
}

+ (id)countMoveReceiptsInStore:(id)a3 matchingPredicate:(id)a4 withManagedObjectContext:(id)a5 error:(id *)a6
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v10 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath]);
  v13[0] = a3;
  -[NSFetchRequest setAffectedStores:](v10, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1]);
  [(NSFetchRequest *)v10 setPredicate:a4];
  [(NSFetchRequest *)v10 setResultType:4];
  if (a5)
  {
    uint64_t v11 = -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)a5, v10, a6);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return (id)[NSNumber numberWithUnsignedInteger:v11];
}

@end