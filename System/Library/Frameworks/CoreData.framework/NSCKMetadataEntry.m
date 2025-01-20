@interface NSCKMetadataEntry
+ (NSManagedObject)_insertMetadataEntryWithKey:(uint64_t)a3 forStore:(void *)a4 intoManagedObjectContext:;
+ (NSManagedObject)insertMetadataEntryWithKey:(uint64_t)a3 BOOLValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:;
+ (NSManagedObject)insertMetadataEntryWithKey:(uint64_t)a3 stringValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:;
+ (NSString)entityPath;
+ (uint64_t)_updateOrInsertMetadataEntryWithKey:(uint64_t)a3 valueSettingBlock:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(void *)a6 error:;
+ (uint64_t)entryForKey:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:;
+ (uint64_t)updateOrInsertMetadataEntryWithKey:(char)a3 BOOLValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(void *)a6 error:;
+ (uint64_t)updateOrInsertMetadataEntryWithKey:(uint64_t)a3 integerValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(void *)a6 error:;
+ (uint64_t)updateOrInsertMetadataEntryWithKey:(uint64_t)a3 stringValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(void *)a6 error:;
+ (uint64_t)updateOrInsertMetadataEntryWithKey:(uint64_t)a3 transformedValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(void *)a6 error:;
+ (void)entriesForKeys:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:;
+ (void)entriesForKeys:(void *)a3 onlyFetchingProperties:(uint64_t)a4 fromStore:(void *)a5 inManagedObjectContext:(uint64_t)a6 error:;
- (BOOL)BOOLValue;
- (__CFString)describeValue;
- (void)setBoolValue:(BOOL)a3;
@end

@implementation NSCKMetadataEntry

- (BOOL)BOOLValue
{
  v2 = (void *)[(NSCKMetadataEntry *)self BOOLValueNum];

  return [v2 BOOLValue];
}

- (void)setBoolValue:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(NSCKMetadataEntry *)self setBoolValueNum:v4];
}

- (__CFString)describeValue
{
  if (result)
  {
    v1 = result;
    if ([(__CFString *)result stringValue])
    {
      return (__CFString *)[(__CFString *)v1 stringValue];
    }
    else if ([(__CFString *)v1 integerValue])
    {
      return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend((id)-[__CFString integerValue](v1, "integerValue"), "integerValue"));
    }
    else if ([(__CFString *)v1 BOOLValueNum])
    {
      if ([(__CFString *)v1 BOOLValue]) {
        return @"YES";
      }
      else {
        return @"NO";
      }
    }
    else
    {
      if ([(__CFString *)v1 transformedValue])
      {
        v2 = (__CFString *)[(__CFString *)v1 transformedValue];
      }
      else if ([(__CFString *)v1 dateValue])
      {
        v2 = (__CFString *)[(__CFString *)v1 dateValue];
      }
      else
      {
        v3 = (void *)MEMORY[0x18C127630]();
        BOOL v4 = __ckLoggingOverride != 0;
        uint64_t v5 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ doesn't know how to handle it's specified value. Please file a bug with this outpout and send to Core Data | New Bugs."];
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        _NSCoreDataLog(v4, v5, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSCKMetadataEntry describeValue]");
        v2 = v1;
      }
      return (__CFString *)[(__CFString *)v2 description];
    }
  }
  return result;
}

+ (uint64_t)entryForKey:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  self;
  v11[0] = a2;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  self;
  return objc_msgSend(+[NSCKMetadataEntry entriesForKeys:onlyFetchingProperties:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, v9, 0, a3, a4, a5), "objectForKey:", a2);
}

+ (void)entriesForKeys:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  self;

  return +[NSCKMetadataEntry entriesForKeys:onlyFetchingProperties:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, 0, a3, a4, a5);
}

+ (void)entriesForKeys:(void *)a3 onlyFetchingProperties:(uint64_t)a4 fromStore:(void *)a5 inManagedObjectContext:(uint64_t)a6 error:
{
  v24[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMetadataEntry entityPath]);
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"key IN (%@)", a2]);
  v24[0] = a4;
  -[NSFetchRequest setAffectedStores:](v11, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1]);
  if ([a3 count]) {
    [(NSFetchRequest *)v11 setPropertiesToFetch:a3];
  }
  else {
    [(NSFetchRequest *)v11 setReturnsObjectsAsFaults:0];
  }
  uint64_t v12 = (void *)[a5 executeFetchRequest:v11 error:a6];
  v13 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (v12)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(v13, "setObject:forKey:", *(void *)(*((void *)&v19 + 1) + 8 * v17), objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17), "key"));
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
  return v13;
}

+ (NSManagedObject)insertMetadataEntryWithKey:(uint64_t)a3 stringValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:
{
  self;
  uint64_t v9 = +[NSCKMetadataEntry _insertMetadataEntryWithKey:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, a2, a4, a5);
  [(NSManagedObject *)v9 setStringValue:a3];
  return v9;
}

+ (NSManagedObject)_insertMetadataEntryWithKey:(uint64_t)a3 forStore:(void *)a4 intoManagedObjectContext:
{
  self;
  uint64_t v7 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKMetadataEntry entityPath], a4);
  [(NSManagedObject *)v7 setKey:a2];
  [a4 assignObject:v7 toPersistentStore:a3];
  return v7;
}

+ (NSManagedObject)insertMetadataEntryWithKey:(uint64_t)a3 BOOLValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:
{
  self;
  uint64_t v9 = +[NSCKMetadataEntry _insertMetadataEntryWithKey:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, a2, a4, a5);
  [(NSManagedObject *)v9 setBoolValue:a3];
  return v9;
}

+ (uint64_t)updateOrInsertMetadataEntryWithKey:(char)a3 BOOLValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(void *)a6 error:
{
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_BOOLValue_forStore_intoManagedObjectContext_error___block_invoke;
  v12[3] = &__block_descriptor_33_e27_v16__0__NSCKMetadataEntry_8l;
  char v13 = a3;
  return +[NSCKMetadataEntry _updateOrInsertMetadataEntryWithKey:valueSettingBlock:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, (uint64_t)v12, a4, a5, a6);
}

uint64_t __106__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_BOOLValue_forStore_intoManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBoolValue:*(unsigned __int8 *)(a1 + 32)];
}

+ (uint64_t)_updateOrInsertMetadataEntryWithKey:(uint64_t)a3 valueSettingBlock:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(void *)a6 error:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v21 = 0;
  uint64_t v11 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, a4, a5, (uint64_t)&v21);
  if (!v11)
  {
    uint64_t v11 = (uint64_t)+[NSCKMetadataEntry _insertMetadataEntryWithKey:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, a2, a4, a5);
    if (!v11)
    {
      if (v21)
      {
        if (a6)
        {
          uint64_t v11 = 0;
          *a6 = v21;
          return v11;
        }
      }
      else
      {
        uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMetadataEntry.m");
        long long v20 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKMetadataEntry.m";
          __int16 v24 = 1024;
          int v25 = 237;
          _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      return 0;
    }
  }
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, v11);
  return v11;
}

+ (uint64_t)updateOrInsertMetadataEntryWithKey:(uint64_t)a3 stringValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(void *)a6 error:
{
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_stringValue_forStore_intoManagedObjectContext_error___block_invoke;
  v12[3] = &unk_1E544E378;
  void v12[4] = a3;
  return +[NSCKMetadataEntry _updateOrInsertMetadataEntryWithKey:valueSettingBlock:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, (uint64_t)v12, a4, a5, a6);
}

uint64_t __108__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_stringValue_forStore_intoManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStringValue:*(void *)(a1 + 32)];
}

+ (uint64_t)updateOrInsertMetadataEntryWithKey:(uint64_t)a3 transformedValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(void *)a6 error:
{
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __113__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_transformedValue_forStore_intoManagedObjectContext_error___block_invoke;
  v12[3] = &unk_1E544E378;
  void v12[4] = a3;
  return +[NSCKMetadataEntry _updateOrInsertMetadataEntryWithKey:valueSettingBlock:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, (uint64_t)v12, a4, a5, a6);
}

uint64_t __113__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_transformedValue_forStore_intoManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTransformedValue:*(void *)(a1 + 32)];
}

+ (uint64_t)updateOrInsertMetadataEntryWithKey:(uint64_t)a3 integerValue:(uint64_t)a4 forStore:(void *)a5 intoManagedObjectContext:(void *)a6 error:
{
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __109__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_integerValue_forStore_intoManagedObjectContext_error___block_invoke;
  v12[3] = &unk_1E544E378;
  void v12[4] = a3;
  return +[NSCKMetadataEntry _updateOrInsertMetadataEntryWithKey:valueSettingBlock:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, a2, (uint64_t)v12, a4, a5, a6);
}

uint64_t __109__NSCKMetadataEntry_updateOrInsertMetadataEntryWithKey_integerValue_forStore_intoManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIntegerValue:*(void *)(a1 + 32)];
}

+ (NSString)entityPath
{
  v2 = NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace];
  BOOL v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

@end