@interface NSStoreMigrationPolicy
+ (id)destinationURLForMigrationSourceURL:(id)a3 createDocumentReplacementDirectory:(BOOL)a4 error:(id *)a5;
+ (id)migrationStoreOptionsFromStoreOptions:(id)a3;
+ (int)migrationDebugLevel;
+ (void)setMigrationDebugLevel:(int)a3;
- (NSManagedObjectModel)_sourceModelForVersionHashes:(uint64_t)a3 withMetadata:(void *)a4 inBundles:(void *)a5 outPaths:;
- (id)createMigrationManagerForSourceModel:(id)a3 destinationModel:(id)a4 error:(id *)a5;
- (id)migrateStoreAtURL:(id)a3 withManager:(id)a4 metadata:(id)a5 options:(id)a6 error:(id *)a7;
- (id)sourceModelForStoreAtURL:(id)a3 metadata:(id)a4 error:(id *)a5;
- (uint64_t)_gatherDataAndPerformMigration:(uint64_t)a1;
- (uint64_t)setMigrationManager:(uint64_t)a1;
- (uint64_t)setSourceMetadata:(uint64_t)result;
- (void)dealloc;
- (void)resourceBundles;
- (void)setPersistentStoreCoordinator:(void *)a3 sourceURL:(void *)a4 configuration:(void *)a5 metadata:(void *)a6 options:;
@end

@implementation NSStoreMigrationPolicy

+ (id)migrationStoreOptionsFromStoreOptions:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)[a3 mutableCopy];
  objc_msgSend(v4, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"NSPersistentStoreUbiquitousContentURLKey", @"NSPersistentStoreUbiquitousContentNameKey", @"NSMigratePersistentStoresAutomaticallyOption", @"NSInferMappingModelAutomaticallyOption", 0));
  [v4 removeObjectForKey:@"NSCoreDataCoreSpotlightExporter"];
  if ([a3 objectForKey:@"NSPersistentStoreUbiquitousContentURLKey"]
    || [a3 objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"])
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), 0x1ED796880);
  }
  if (objc_msgSend((id)objc_msgSend(v4, "valueForKey:", @"NSPersistentHistoryTrackingKey"), "isNSDictionary"))
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v4, "valueForKey:", @"NSPersistentHistoryTrackingKey"));
    v8[0] = @"NSPersistentHistoryTrackingEntitiesToExclude";
    v8[1] = @"NSPersistentHistoryTrackingEntitiesToInclude";
    objc_msgSend(v5, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 2));
    [v4 setValue:v5 forKey:@"NSPersistentHistoryTrackingKey"];
  }
  [v4 removeObjectForKey:@"NSPersistentStoreRemoveStoreOnCleanup"];
  v7[0] = @"NSPersistentCloudKitContainerOptionsKey";
  v7[1] = @"NSPersistentStoreMirroringOptionsKey";
  objc_msgSend(v4, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 2));
  return v4;
}

- (void)dealloc
{
  self->_coordinator = 0;
  self->_sourceURL = 0;

  self->_sourceConfiguration = 0;
  self->_destinationConfiguration = 0;

  self->_sourceMetadata = 0;
  self->_sourceOptions = 0;

  self->_sourceModel = 0;
  self->_mappingModel = 0;

  self->_destinationURL = 0;
  self->_destinationType = 0;

  self->_destinationOptions = 0;
  self->_migrationManager = 0;

  self->_resourceBundles = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSStoreMigrationPolicy;
  [(NSStoreMigrationPolicy *)&v3 dealloc];
}

- (NSManagedObjectModel)_sourceModelForVersionHashes:(uint64_t)a3 withMetadata:(void *)a4 inBundles:(void *)a5 outPaths:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    context = (void *)MEMORY[0x18C127630]();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v40 = [a4 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v40)
    {
      id obj = a4;
      v8 = 0;
      uint64_t v39 = *(void *)v48;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v48 != v39) {
          objc_enumerationMutation(obj);
        }
        if (v8) {
          break;
        }
        v10 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v9), "pathsForResourcesOfType:inDirectory:", @"mom", 0), "arrayByAddingObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v9), "pathsForResourcesOfType:inDirectory:", @"momd", 0));
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v44;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v44 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              if (([a5 containsObject:v15] & 1) == 0)
              {
                [a5 addObject:v15];
                char v42 = 0;
                if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", v15, &v42))BOOL v16 = v42 == 0; {
                else
                }
                  BOOL v16 = 1;
                if (v16)
                {
                  v8 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:0]);
                }
                else
                {
                  v17 = [[NSManagedObjectModelBundle alloc] initWithPath:v15];
                  v8 = [(NSManagedObjectModelBundle *)v17 _modelForVersionHashes:a2];
                  v18 = v8;
                }
                if (+[NSMappingModel migrationDebugLevel] >= 2) {
                  _NSCoreDataLog(9, @"_sourceModelForVersionHashes: testing model at path '%@'", v19, v20, v21, v22, v23, v24, v15);
                }
                BOOL v25 = [(NSManagedObjectModel *)v8 isConfiguration:0 compatibleWithStoreMetadata:a3];
                int v26 = +[_PFPersistentHistoryModel _hasTombstonesInUserInfo:]((uint64_t)_PFPersistentHistoryModel, v8);
                if (v25)
                {
                  if (v8) {
                    int v27 = v26;
                  }
                  else {
                    int v27 = 0;
                  }
                  if (v27 == 1) {
                    *(_DWORD *)&v8->_managedObjectModelFlags |= 0x10u;
                  }
                  if (+[NSMappingModel migrationDebugLevel] > 1) {
LABEL_37:
                  }
                    _NSCoreDataLog(9, @"  \t Choosing model at path '%@'", v28, v29, v30, v31, v32, v33, v15);
LABEL_38:
                  v34 = v8;
                  goto LABEL_39;
                }
                if (v26)
                {
                  if (v8) {
                    -[NSManagedObjectModel _traverseTombstonesAndMark:]((uint64_t)v8, 1);
                  }
                  if ([(NSManagedObjectModel *)v8 isConfiguration:0 compatibleWithStoreMetadata:a3])
                  {
                    if (+[NSMappingModel migrationDebugLevel] >= 2) {
                      goto LABEL_37;
                    }
                    goto LABEL_38;
                  }
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
        v8 = 0;
LABEL_39:
        if (++v9 == v40)
        {
          uint64_t v35 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
          uint64_t v40 = v35;
          if (v35) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    v36 = v8;
    return v8;
  }
  return result;
}

- (id)sourceModelForStoreAtURL:(id)a3 metadata:(id)a4 error:(id *)a5
{
  v101[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend(a4, "objectForKey:");
  if (+[NSMappingModel migrationDebugLevel] >= 2) {
    _NSCoreDataLog(9, @"sourceModelForStoreAtURL: Testing models searched via resourceBundles", v10, v11, v12, v13, v14, v15, v92);
  }
  BOOL v16 = -[NSStoreMigrationPolicy resourceBundles](self);
  v17 = v16;
  if (v16) {
    id v18 = (id)[v16 mutableCopy];
  }
  else {
    id v18 = (id)[MEMORY[0x1E4F1CA48] array];
  }
  uint64_t v19 = v18;
  uint64_t v20 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]((NSManagedObjectModel *)self, v9, (uint64_t)a4, v17, v20);
  if (!v21)
  {
    if (+[NSMappingModel migrationDebugLevel] >= 2) {
      _NSCoreDataLog(9, @"sourceModelForStoreAtURL: Testing models searched via mainBundle", v23, v24, v25, v26, v27, v28, v92);
    }
    uint64_t v29 = [MEMORY[0x1E4F28B50] mainBundle];
    if (!v29
      || (uint64_t v30 = v29,
          [v19 addObject:v29],
          v101[0] = v30,
          (uint64_t v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]((NSManagedObjectModel *)self, v9, (uint64_t)a4, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:1], v20)) == 0))
    {
      if (self) {
        id v31 = [(NSDictionary *)self->_sourceMetadata valueForKey:@"NSStoreType"];
      }
      else {
        id v31 = 0;
      }
      if (![v31 isEqualToString:@"SQLite"]) {
        goto LABEL_22;
      }
      if (+[NSMappingModel migrationDebugLevel] >= 2) {
        _NSCoreDataLog(9, @"sourceModelForStoreAtURL: Testing model cached in database file", v32, v33, v34, v35, v36, v37, v92);
      }
      v38 = self ? self->_sourceOptions : 0;
      uint64_t v39 = +[NSSQLCore cachedModelForPersistentStoreWithURL:a3 options:v38 error:0];
      if (v39)
      {
        uint64_t v21 = v39;
        if (+[NSMappingModel migrationDebugLevel] >= 1)
        {
          uint64_t v40 = [a3 path];
          _NSCoreDataLog(9, @"  \t Choosing model from cache table in db at '%@'", v41, v42, v43, v44, v45, v46, v40);
        }
      }
      else
      {
LABEL_22:
        if (+[NSMappingModel migrationDebugLevel] >= 2) {
          _NSCoreDataLog(9, @"sourceModelForStoreAtURL: Testing models searched via allBundles", v47, v48, v49, v50, v51, v52, v92);
        }
        uint64_t v53 = (void *)[MEMORY[0x1E4F28B50] allBundles];
        [v19 addObjectsFromArray:v53];
        if (+[NSMappingModel migrationDebugLevel] >= 2) {
          _NSCoreDataLog(9, @"sourceModelForStoreAtURL: allBundles is %@", v54, v55, v56, v57, v58, v59, (uint64_t)v53);
        }
        uint64_t v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]((NSManagedObjectModel *)self, v9, (uint64_t)a4, v53, v20);
        if (!v21)
        {
          if (+[NSMappingModel migrationDebugLevel] >= 2) {
            _NSCoreDataLog(9, @"sourceModelForStoreAtURL: Testing models searched via allFrameworks", v60, v61, v62, v63, v64, v65, v92);
          }
          v66 = (void *)[MEMORY[0x1E4F28B50] allFrameworks];
          if (+[NSMappingModel migrationDebugLevel] >= 2) {
            _NSCoreDataLog(9, @"sourceModelForStoreAtURL: allFrameworks is %@", v67, v68, v69, v70, v71, v72, (uint64_t)v66);
          }
          [v19 addObjectsFromArray:v66];
          uint64_t v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]((NSManagedObjectModel *)self, v9, (uint64_t)a4, v66, v20);
          if (!v21)
          {
            if (+[NSMappingModel migrationDebugLevel] >= 2) {
              _NSCoreDataLog(9, @"Last ditch review of models with skewed hashing", v73, v74, v75, v76, v77, v78, v92);
            }
            long long v98 = 0u;
            long long v99 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            uint64_t v79 = [v20 countByEnumeratingWithState:&v96 objects:v100 count:16];
            if (v79)
            {
              uint64_t v80 = v79;
              id v93 = a3;
              v94 = a5;
              uint64_t v81 = *(void *)v97;
              unint64_t v82 = 0x1E4F28000uLL;
              while (2)
              {
                for (uint64_t i = 0; i != v80; ++i)
                {
                  if (*(void *)v97 != v81) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v84 = *(void *)(*((void *)&v96 + 1) + 8 * i);
                  char v95 = 0;
                  if (objc_msgSend((id)objc_msgSend(*(id *)(v82 + 3256), "defaultManager"), "fileExistsAtPath:isDirectory:", v84, &v95))BOOL v85 = v95 == 0; {
                  else
                  }
                    BOOL v85 = 1;
                  if (v85)
                  {
                    uint64_t v21 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:v84 isDirectory:0]);
                  }
                  else
                  {
                    uint64_t v86 = v81;
                    unint64_t v87 = v82;
                    v88 = [[NSManagedObjectModelBundle alloc] initWithPath:v84];
                    uint64_t v21 = [(NSManagedObjectModelBundle *)v88 _modelForVersionHashes:v9 inStyle:1];
                    v89 = v21;

                    unint64_t v82 = v87;
                    uint64_t v81 = v86;
                  }
                  if (-[NSManagedObjectModel _isConfiguration:inStyle:compatibleWithStoreMetadata:]((uint64_t)v21, 0, 1, a4))
                  {
                    v90 = v21;
                    self->_workingWithSkewedSource = 1;
                    v91 = (void *)[(NSDictionary *)self->_sourceMetadata mutableCopy];
                    objc_msgSend(v91, "setValue:forKey:", -[NSManagedObjectModel entityVersionHashesByName](v21, "entityVersionHashesByName"), @"NSStoreModelVersionHashes");
                    -[NSStoreMigrationPolicy setSourceMetadata:]((uint64_t)self, v91);

                    goto LABEL_50;
                  }
                }
                uint64_t v80 = [v20 countByEnumeratingWithState:&v96 objects:v100 count:16];
                if (v80) {
                  continue;
                }
                break;
              }
              uint64_t v21 = 0;
LABEL_50:
              a3 = v93;
              a5 = v94;
            }
            else
            {
              uint64_t v21 = 0;
            }
            if (a5 && !v21) {
              *a5 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134130, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Can't find model for source store", @"reason", a3, @"URL", a4, @"metadata", 0));
            }
          }
        }
      }
    }
  }
  return v21;
}

- (void)resourceBundles
{
  if (result)
  {
    v1 = result;
    result = (void *)result[13];
    if (!result)
    {
      uint64_t v2 = [(id)v1[4] objectForKey:@"NSPersistentStoreCoordinatorResourceBundlesForMigration"];
      uint64_t v3 = MEMORY[0x1E4F1CBF0];
      if (v2) {
        v4 = (void *)v2;
      }
      else {
        v4 = (void *)MEMORY[0x1E4F1CBF0];
      }
      uint64_t v5 = [(id)v1[4] objectForKey:@"_NSAutomaticMigrationResourceBundlesOption"];
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = v3;
      }
      result = (id)[v4 arrayByAddingObjectsFromArray:v6];
      v1[13] = result;
    }
  }
  return result;
}

- (uint64_t)setSourceMetadata:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = [*(id *)(result + 48) isEqual:a2];
    if ((result & 1) == 0)
    {

      result = a2;
      *(void *)(v3 + 48) = result;
    }
  }
  return result;
}

- (id)createMigrationManagerForSourceModel:(id)a3 destinationModel:(id)a4 error:(id *)a5
{
  v8 = (objc_class *)objc_opt_class();
  if (!BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88)) {
    goto LABEL_14;
  }
  uint64_t v9 = self ? self->_mappingModel : 0;
  if (!-[NSMappingModel _isInferredMappingModel]((uint64_t)v9)) {
    goto LABEL_14;
  }
  uint64_t v10 = +[NSPersistentStoreCoordinator registeredStoreTypes];
  if (self) {
    id v11 = [(NSDictionary *)self->_sourceMetadata valueForKey:@"NSStoreType"];
  }
  else {
    id v11 = 0;
  }
  id v12 = [(NSDictionary *)v10 objectForKey:v11];
  if ((id)objc_opt_class() != v12)
  {
    if (![v12 isNSValue]) {
      goto LABEL_14;
    }
    id v12 = (id)[v12 pointerValue];
  }
  if (v12)
  {
    [v12 migrationManagerClass];
    if (objc_opt_respondsToSelector())
    {
      if (objc_msgSend((id)objc_msgSend(v12, "migrationManagerClass"), "_canMigrateWithMappingModel:", v9))v8 = (objc_class *)objc_msgSend(v12, "migrationManagerClass"); {
    }
      }
  }
LABEL_14:
  uint64_t v13 = (void *)[[v8 alloc] initWithSourceModel:a3 destinationModel:a4];

  return v13;
}

- (id)migrateStoreAtURL:(id)a3 withManager:(id)a4 metadata:(id)a5 options:(id)a6 error:(id *)a7
{
  if (self)
  {
    id v11 = (unsigned __int8 *)self;
    uint64_t v12 = *((void *)self + 8);
    uint64_t v13 = *((void *)self + 9);
    uint64_t v14 = (void *)[(id)objc_opt_class() migrationStoreOptionsFromStoreOptions:*((void *)self + 4)];
    id v15 = v14;
    if (*((void *)v11 + 14))
    {
      id v15 = (id)[v14 mutableCopy];
      objc_msgSend(v15, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSIgnorePersistentStoreVersioningOption");
    }
    if (a4)
    {
      *((_DWORD *)a4 + 24) = *((_DWORD *)a4 + 24) & 0xFFFFFFF7 | (8 * v11[120]);
      BOOL v16 = (void *)*((void *)v11 + 16);
      v17 = (void *)*((void *)a4 + 9);
      if (v17 != v16)
      {

        *((void *)a4 + 9) = 0;
        *((void *)a4 + 9) = [v16 copy];
      }
      id v18 = (void *)*((void *)v11 + 17);
      uint64_t v19 = (void *)*((void *)a4 + 10);
      if (v19 != v18)
      {

        *((void *)a4 + 10) = 0;
        *((void *)a4 + 10) = [v18 copy];
      }
    }
    if (objc_msgSend(a4, "migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:", a3, objc_msgSend(*((id *)v11 + 6), "valueForKey:", @"NSStoreType"), v15, *((void *)v11 + 7), v12, v13, objc_msgSend((id)objc_opt_class(), "migrationStoreOptionsFromStoreOptions:", a6), a7))return (id)*((void *)v11 + 8); {
    else
    }
      return 0;
  }
  return self;
}

+ (int)migrationDebugLevel
{
  return +[NSMappingModel migrationDebugLevel];
}

+ (void)setMigrationDebugLevel:(int)a3
{
}

- (void)setPersistentStoreCoordinator:(void *)a3 sourceURL:(void *)a4 configuration:(void *)a5 metadata:(void *)a6 options:
{
  if (result)
  {
    id v11 = result;
    uint64_t v12 = (void *)result[1];
    if (v12 != a2)
    {

      result = a2;
      v11[1] = result;
    }
    uint64_t v13 = (void *)v11[2];
    if (v13 != a3)
    {

      result = a3;
      v11[2] = result;
    }
    uint64_t v14 = (void *)v11[3];
    if (v14 != a4)
    {

      result = a4;
      v11[3] = result;
    }
    id v15 = (void *)v11[6];
    if (v15 != a5)
    {

      result = a5;
      v11[6] = result;
    }
    BOOL v16 = (void *)v11[4];
    if (v16 != a6)
    {

      result = a6;
      v11[4] = result;
    }
  }
  return result;
}

- (uint64_t)setMigrationManager:(uint64_t)a1
{
  uint64_t result = [*(id *)(a1 + 96) isEqual:a2];
  if ((result & 1) == 0)
  {

    uint64_t result = a2;
    *(void *)(a1 + 96) = result;
  }
  return result;
}

+ (id)destinationURLForMigrationSourceURL:(id)a3 createDocumentReplacementDirectory:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v8 = (void *)[a3 path];
  uint64_t v9 = [v8 lastPathComponent];
  if (v6)
  {
    id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, a3, 1, a5);
    if (result)
    {
      return (id)[result URLByAppendingPathComponent:v9];
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(v8, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(@".", "stringByAppendingString:", v9), "stringByAppendingString:", @".migrationdestination_41b5a6b5c6e848c462a8480cd24caef3"));
    uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
    return (id)[v12 fileURLWithPath:v11 isDirectory:0];
  }
  return result;
}

- (uint64_t)_gatherDataAndPerformMigration:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v77 = 0;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v72 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Schema migration (policy)", &v77);
    v4 = (void *)[*(id *)(v2 + 8) managedObjectModel];
    int v5 = 0;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v73 objects:v78 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v74 != v7) {
            objc_enumerationMutation(v4);
          }
          v5 |= -[NSEntityDescription _hasAttributesWithExternalDataReferences](*(void *)(*((void *)&v73 + 1) + 8 * i));
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v73 objects:v78 count:16];
      }
      while (v6);
    }
    uint64_t v9 = (void *)[*(id *)(v2 + 16) path];
    uint64_t v10 = (void *)[v9 pathExtension];
    uint64_t v11 = v10;
    if (v10 && ![v10 isEqualToString:&stru_1ED787880]) {
      uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "stringByDeletingPathExtension"), "stringByAppendingString:", @"~"), "stringByAppendingPathExtension:", v11);
    }
    else {
      uint64_t v12 = [v9 stringByAppendingString:@"~"];
    }
    uint64_t v13 = v12;
    uint64_t v14 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if (v5)
    {
      id v15 = objc_msgSend((id)objc_msgSend(-[NSDictionary valueForKey:](+[NSPersistentStoreCoordinator registeredStoreTypes](NSPersistentStoreCoordinator, "registeredStoreTypes"), "valueForKey:", objc_msgSend(*(id *)(v2 + 48), "valueForKey:", @"NSStoreType")), "pointerValue"), "_figureOutWhereExternalReferencesEndedUpRelativeTo:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", v13));
      if (objc_msgSend(v14, "fileExistsAtPath:", objc_msgSend(v15, "path")))
      {
        if (([v14 removeItemAtURL:v15 error:0] & 1) == 0)
        {
          if (!a2) {
            goto LABEL_86;
          }
          uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unable to delete file (backup external data references URL)", @"reason", v15, @"URL", 0);
          uint64_t v27 = [v25 errorWithDomain:*MEMORY[0x1E4F281F8] code:134110 userInfo:v26];
          goto LABEL_28;
        }
      }
    }
    BOOL v16 = (void *)[(id)v2 sourceModelForStoreAtURL:*(void *)(v2 + 16) metadata:*(void *)(v2 + 48) error:a2];
    [v16 _setIsEditable:0];
    char v17 = [*(id *)(v2 + 40) isEqual:v16];
    id v18 = *(id *)(v2 + 40);
    if ((v17 & 1) == 0)
    {

      id v18 = v16;
      *(void *)(v2 + 40) = v18;
    }
    if (!v18) {
      goto LABEL_86;
    }
    uint64_t v19 = (void *)[*(id *)(v2 + 8) managedObjectModel];
    uint64_t v20 = -[NSStoreMigrationPolicy resourceBundles]((void *)v2);
    uint64_t v21 = (void *)[*(id *)(v2 + 32) objectForKey:@"NSInferMappingModelAutomaticallyOption"];
    uint64_t v22 = v21;
    if (v21
      && [v21 isNSString]
      && [@"force" isEqualToString:v22])
    {
      uint64_t v22 = (void *)[NSNumber numberWithBool:1];
      [v20 count];
      uint64_t v23 = 0;
      char v24 = 1;
    }
    else
    {
      uint64_t v23 = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]((uint64_t)NSMappingModel, v20, v18, v19);
      if (v23) {
        goto LABEL_49;
      }
      if ([v20 count])
      {
        char v24 = 0;
        uint64_t v23 = 0;
      }
      else
      {
        uint64_t v23 = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]((uint64_t)NSMappingModel, 0, v18, v19);
        char v24 = 0;
      }
    }
    if ([v22 BOOLValue]
      && (*(void *)buf = 0,
          (uint64_t v23 = +[NSMappingModel inferredMappingModelForSourceModel:v18 destinationModel:v19 error:buf]) == 0))
    {
      uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Can't find or automatically infer mapping model for migration", @"reason", v18, @"sourceModel", v19, @"destinationModel", *(void *)buf, *MEMORY[0x1E4F28A50], 0);
      uint64_t v28 = [v30 errorWithDomain:*MEMORY[0x1E4F281F8] code:134140 userInfo:v31];
    }
    else
    {
      uint64_t v28 = 0;
      if (v23) {
        goto LABEL_49;
      }
    }
    if ([v20 count]) {
      char v29 = v24;
    }
    else {
      char v29 = 1;
    }
    if (v29) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]((uint64_t)NSMappingModel, 0, v18, v19);
    }
    if (!((unint64_t)v23 | v28))
    {
      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Can't find mapping model for migration", @"reason", v18, @"sourceModel", v19, @"destinationModel", 0);
      uint64_t v28 = [v32 errorWithDomain:*MEMORY[0x1E4F281F8] code:134140 userInfo:v33];
      goto LABEL_43;
    }
    if (!v23)
    {
LABEL_43:
      if (v28)
      {
        if (a2)
        {
          uint64_t v23 = 0;
          *a2 = v28;
          goto LABEL_49;
        }
      }
      else
      {
        uint64_t v34 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSStoreMigrationPolicy.m");
        uint64_t v41 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSStoreMigrationPolicy.m";
          __int16 v80 = 1024;
          int v81 = 524;
          _os_log_fault_impl(&dword_18AB82000, v41, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      uint64_t v23 = 0;
    }
LABEL_49:
    char v42 = [*(id *)(v2 + 56) isEqual:v23];
    uint64_t v43 = *(NSMappingModel **)(v2 + 56);
    if ((v42 & 1) == 0)
    {

      uint64_t v43 = v23;
      *(void *)(v2 + 56) = v43;
    }
    if (!v43) {
      goto LABEL_86;
    }
    uint64_t v44 = *(void **)(v2 + 32);
    char v45 = [*(id *)(v2 + 88) isEqual:v44];
    id v46 = *(id *)(v2 + 88);
    if ((v45 & 1) == 0)
    {

      id v46 = v44;
      *(void *)(v2 + 88) = v46;
    }
    if (!v46) {
      goto LABEL_86;
    }
    uint64_t v47 = (void *)[*(id *)(v2 + 48) valueForKey:@"NSStoreType"];
    char v48 = [*(id *)(v2 + 72) isEqual:v47];
    id v49 = *(id *)(v2 + 72);
    if ((v48 & 1) == 0)
    {

      id v49 = v47;
      *(void *)(v2 + 72) = v49;
    }
    if (!v49) {
      goto LABEL_86;
    }
    uint64_t v50 = *(void **)(v2 + 24);
    if (([*(id *)(v2 + 80) isEqual:v50] & 1) == 0)
    {

      *(void *)(v2 + 80) = v50;
    }
    uint64_t v51 = objc_msgSend((id)v2, "createMigrationManagerForSourceModel:destinationModel:error:", *(void *)(v2 + 40), objc_msgSend(*(id *)(v2 + 8), "managedObjectModel"), a2);
    [v51 setDestinationConfigurationForCloudKitValidation:*(void *)(v2 + 136)];
    -[NSStoreMigrationPolicy setMigrationManager:](v2, v51);
    if (!*(void *)(v2 + 96)) {
      goto LABEL_86;
    }
    char v52 = [(id)objc_opt_class() _canMigrateWithMappingModel:*(void *)(v2 + 56)];
    if (v52)
    {
      uint64_t v53 = *(void **)(v2 + 16);
      if (!v53) {
        goto LABEL_86;
      }
LABEL_68:
      if (([*(id *)(v2 + 64) isEqual:v53] & 1) == 0)
      {

        *(void *)(v2 + 64) = v53;
      }
      if (v5) {
        objc_msgSend((id)objc_msgSend(-[NSDictionary valueForKey:](+[NSPersistentStoreCoordinator registeredStoreTypes](NSPersistentStoreCoordinator, "registeredStoreTypes"), "valueForKey:", *(void *)(v2 + 72)), "pointerValue"), "_figureOutWhereExternalReferencesEndedUpRelativeTo:", v53);
      }
      id v56 = (id)[*(id *)(v2 + 88) mutableCopy];
      [v56 setObject:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentStoreUnlinkDestroyOption"];
      [v56 setObject:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentStoreForceDestroyOption"];
      if ((v52 & 1) == 0
        && objc_msgSend((id)objc_msgSend(v53, "path"), "hasSuffix:", @".migrationdestination_41b5a6b5c6e848c462a8480cd24caef3"))
      {
        *(void *)buf = 0;
        if (([*(id *)(v2 + 8) _destroyPersistentStoreAtURL:v53 withType:*(void *)(v2 + 72) options:v56 error:buf] & 1) == 0)_NSCoreDataLog(1, @"(migration) Failed to remove orphaned, partially migrated store file %@: %@", v57, v58, v59, v60, v61, v62, (uint64_t)v53); {
        objc_msgSend(*(id *)(v2 + 8), "removePersistentStore:error:", objc_msgSend(*(id *)(v2 + 8), "persistentStoreForURL:", v53), 0);
        }
        objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend(v53, "path"), 0);
        objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", @"-shm"), 0);
        objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", @"-journal"), 0);
        objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", @"-wal"), 0);
      }
      if (![(id)v2 migrateStoreAtURL:*(void *)(v2 + 16) withManager:*(void *)(v2 + 96) metadata:*(void *)(v2 + 48) options:*(void *)(v2 + 88) error:a2])
      {
        if (([*(id *)(v2 + 16) isEqual:v53] & 1) == 0
          && objc_msgSend((id)objc_msgSend(v53, "path"), "hasSuffix:", @".migrationdestination_41b5a6b5c6e848c462a8480cd24caef3"))
        {
          if (+[NSMappingModel migrationDebugLevel] < 1)
          {
            [*(id *)(v2 + 8) _destroyPersistentStoreAtURL:v53 withType:*(void *)(v2 + 72) options:v56 error:0];
            objc_msgSend(*(id *)(v2 + 8), "removePersistentStore:error:", objc_msgSend(*(id *)(v2 + 8), "persistentStoreForURL:", v53), 0);
            objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend(v53, "path"), 0);
            objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", @"-shm"), 0);
            objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", @"-journal"), 0);
            objc_msgSend(v14, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(v53, "path"), "stringByAppendingString:", @"-wal"), 0);
          }
          else
          {
            _NSCoreDataLog(4, @"(migration) leaving incompletely migrated store on disk after automatic migration failure. (%@)", v65, v66, v67, v68, v69, v70, (uint64_t)v53);
          }
        }
        goto LABEL_86;
      }
      -[NSStoreMigrationPolicy setMigrationManager:](v2, 0);
      uint64_t v63 = [(id)objc_opt_class() migrationStoreOptionsFromStoreOptions:*(void *)(v2 + 88)];
      id v64 = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "migrationStoreOptionsFromStoreOptions:", *(void *)(v2 + 32)), "mutableCopy");
      objc_msgSend(v64, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSPersistentStoreUnlinkDestroyOption");
      [v64 setObject:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentStoreForceDestroyOption"];
      if ((v52 & 1) != 0
        || ([*(id *)(v2 + 8) _replacePersistentStoreAtURL:*(void *)(v2 + 16) destinationOptions:v63 withPersistentStoreFromURL:v53 sourceOptions:v64 storeType:*(void *)(v2 + 72) error:a2] & 1) != 0)
      {
        uint64_t v2 = [*(id *)(v2 + 8) addPersistentStoreWithType:*(void *)(v2 + 72) configuration:*(void *)(v2 + 80) URL:*(void *)(v2 + 16) options:*(void *)(v2 + 88) error:a2];
        goto LABEL_87;
      }
LABEL_86:
      uint64_t v2 = 0;
      goto LABEL_87;
    }
    uint64_t v53 = (void *)[(id)objc_opt_class() destinationURLForMigrationSourceURL:*(void *)(v2 + 16) createDocumentReplacementDirectory:0 error:a2];
    if (!v53) {
      goto LABEL_86;
    }
    if (![*(id *)(v2 + 16) isEqual:v53]) {
      goto LABEL_68;
    }
    if (!a2) {
      goto LABEL_86;
    }
    uint64_t v54 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Migration source and destination URLs must be different", @"reason", *(void *)(v2 + 16), @"sourceURL", v53, @"destinationURL", 0);
    uint64_t v27 = [v54 errorWithDomain:*MEMORY[0x1E4F281F8] code:134110 userInfo:v55];
LABEL_28:
    uint64_t v2 = 0;
    *a2 = v27;
LABEL_87:
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v77, v72);
  }
  return v2;
}

@end