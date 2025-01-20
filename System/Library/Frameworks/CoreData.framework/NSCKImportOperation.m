@interface NSCKImportOperation
+ (BOOL)purgeFinishedImportOperationsInStore:(void *)a3 withManagedObjectContext:(uint64_t)a4 error:;
+ (uint64_t)entityPath;
+ (uint64_t)fetchUnfinishedImportOperationsInStore:(void *)a3 withManagedObjectContext:(uint64_t)a4 error:;
+ (void)fetchOperationWithIdentifier:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:;
@end

@implementation NSCKImportOperation

+ (uint64_t)fetchUnfinishedImportOperationsInStore:(void *)a3 withManagedObjectContext:(uint64_t)a4 error:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  self;
  v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKImportOperation entityPath]());
  v9[0] = a2;
  -[NSFetchRequest setAffectedStores:](v7, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1]);
  return [a3 executeFetchRequest:v7 error:a4];
}

+ (uint64_t)entityPath
{
  self;
  v0 = NSString;
  id v1 = +[PFCloudKitMetadataModel ancillaryModelNamespace];
  v2 = (objc_class *)objc_opt_class();
  return [v0 stringWithFormat:@"%@/%@", v1, NSStringFromClass(v2)];
}

+ (void)fetchOperationWithIdentifier:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  v24[1] = *MEMORY[0x1E4F143B8];
  self;
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKImportOperation entityPath]());
  v24[0] = a3;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1]);
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"operationUUID == %@", a2]);
  result = (void *)[a4 executeFetchRequest:v9 error:a5];
  if (result)
  {
    v11 = result;
    if ((unint64_t)[result count] < 2)
    {
      return (void *)[v11 lastObject];
    }
    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Duplicate operations for identifier: %@\n%@"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, a2);
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = a2;
        __int16 v22 = 2112;
        v23 = v11;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Duplicate operations for identifier: %@\n%@", buf, 0x16u);
      }
      return 0;
    }
  }
  return result;
}

+ (BOOL)purgeFinishedImportOperationsInStore:(void *)a3 withManagedObjectContext:(uint64_t)a4 error:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  self;
  v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKImportOperation entityPath]());
  v21[0] = a2;
  -[NSFetchRequest setAffectedStores:](v7, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1]);
  v8 = (void *)[a3 executeFetchRequest:v7 error:a4];
  v9 = v8;
  if (v8)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (!objc_msgSend((id)objc_msgSend(v14, "pendingRelationships"), "count")) {
            [a3 deleteObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  return v9 != 0;
}

@end