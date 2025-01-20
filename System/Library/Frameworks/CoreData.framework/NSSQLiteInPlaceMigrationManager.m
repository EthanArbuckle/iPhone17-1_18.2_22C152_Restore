@interface NSSQLiteInPlaceMigrationManager
+ (BOOL)_canMigrateWithMappingModel:(id)a3;
- (BOOL)migrateStoreFromURL:(id)a3 type:(id)a4 options:(id)a5 withMappingModel:(id)a6 toDestinationURL:(id)a7 destinationType:(id)a8 destinationOptions:(id)a9 error:(id *)a10;
- (void)dealloc;
@end

@implementation NSSQLiteInPlaceMigrationManager

+ (BOOL)_canMigrateWithMappingModel:(id)a3
{
  return -[NSMappingModel _isInferredMappingModel]((uint64_t)a3);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NSSQLiteInPlaceMigrationManager;
  [(NSMigrationManager *)&v2 dealloc];
}

- (BOOL)migrateStoreFromURL:(id)a3 type:(id)a4 options:(id)a5 withMappingModel:(id)a6 toDestinationURL:(id)a7 destinationType:(id)a8 destinationOptions:(id)a9 error:(id *)a10
{
  v90[1] = *MEMORY[0x1E4F143B8];
  if (([a3 isEqual:a7] & 1) == 0)
  {
    if ([a7 isFileURL])
    {
      memset(&v80, 0, sizeof(v80));
      if (!stat((const char *)objc_msgSend((id)objc_msgSend(a7, "path"), "fileSystemRepresentation"), &v80)
        && v80.st_size >= 1)
      {
        if (a10)
        {
          v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v89 = *MEMORY[0x1E4F28328];
          v90[0] = [a7 path];
          uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
          unsigned __int8 v17 = 0;
          *a10 = (id)[v15 errorWithDomain:*MEMORY[0x1E4F281F8] code:516 userInfo:v16];
        }
        else
        {
          unsigned __int8 v17 = 0;
        }
        return v17 & 1;
      }
    }
  }
  id v74 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  v76 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[(NSMigrationManager *)self sourceModel]];
  -[NSPersistentStoreCoordinator _setIsMigrating:]((void (*)(void))v76, 1);
  int v18 = [a3 isEqual:a7];
  id v79 = 0;
  *(void *)&v80.st_dev = 0;
  id v19 = (id)[a9 mutableCopy];
  uint64_t v20 = MEMORY[0x1E4F1CC38];
  [v19 setObject:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentStoreForceDestroyOption"];
  id v73 = v19;
  [v19 setObject:v20 forKey:@"NSPersistentStoreUnlinkDestroyOption"];
  id v21 = a3;
  if ((v18 & 1) != 0
    || (id v21 = a7,
        [(NSPersistentStoreCoordinator *)v76 replacePersistentStoreAtURL:a7 destinationOptions:a9 withPersistentStoreFromURL:a3 sourceOptions:a5 storeType:a4 error:&v80]))
  {
    char v22 = v18 ^ 1;
    if (![@"SQLite" isEqualToString:a4]
      || ([@"SQLite" isEqualToString:a8] & 1) == 0)
    {

      v69 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v70 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", -[NSMigrationManager sourceModel](self, "sourceModel"), @"sourceModel", -[NSMigrationManager destinationModel](self, "destinationModel"), @"destinationModel", a6, @"mappingModel", 0);
      objc_exception_throw((id)[v69 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSSQLiteInPlaceMigrationManager requires that the source and destination stores to be NSSQLiteStoreType" userInfo:v70]);
    }
    if (-[NSMappingModel _isInferredMappingModel]((uint64_t)a6))
    {
      if ((+[NSMigrationManager _performSanityCheckForMapping:fromSourceModel:toDestinationModel:]((uint64_t)NSMigrationManager, a6, [(NSMigrationManager *)self sourceModel], [(NSMigrationManager *)self destinationModel]) & 1) == 0)
      {
        v71 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v72 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", -[NSMigrationManager sourceModel](self, "sourceModel"), @"sourceModel", -[NSMigrationManager destinationModel](self, "destinationModel"), @"destinationModel", a6, @"mappingModel", 0);
        objc_exception_throw((id)[v71 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Mismatch between mapping and source/destination models" userInfo:v72]);
      }
      if (+[NSMappingModel migrationDebugLevel] < 1)
      {
        double v24 = 0.0;
      }
      else
      {
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v24 = v23;
      }
      if (a9)
      {
        v45 = (void *)[a9 objectForKey:@"NSSQLitePragmasOption"];
        id v46 = (id)[a9 mutableCopy];
        if (v45)
        {
          id v47 = (id)[v45 mutableCopy];
          objc_msgSend(v47, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"journal_mode");
        }
        else
        {
          v85 = @"journal_mode";
          uint64_t v86 = [MEMORY[0x1E4F1CA98] null];
          id v47 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        }
        [v46 setObject:v47 forKey:@"NSSQLitePragmasOption"];
      }
      else
      {
        v83 = @"NSSQLitePragmasOption";
        v81 = @"journal_mode";
        uint64_t v82 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        id v46 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      }
      v51 = [(NSPersistentStoreCoordinator *)v76 addPersistentStoreWithType:@"SQLite" configuration:0 URL:v21 options:v46 error:&v79];

      if (v51)
      {
        v52 = [(NSMigrationManager *)self destinationModel];
        [(NSManagedObjectModel *)v52 _setIsEditable:0];
        v53 = [[NSSQLModel alloc] initWithManagedObjectModel:v52];
        if (v53)
        {
          v28 = v53;
          v27 = -[_NSSQLiteStoreMigrator initWithStore:destinationModel:mappingModel:]([_NSSQLiteStoreMigrator alloc], v51, v53, a6);
          objc_msgSend(v27, "setDestinationConfigurationForCloudKitValidation:", -[NSMigrationManager destinationConfigurationForCloudKitValidation](self, "destinationConfigurationForCloudKitValidation"));
          if (self)
          {
            int v55 = (*(unsigned char *)&self->super._migrationManagerFlags >> 3) & 1;
            if (!v27) {
              goto LABEL_48;
            }
          }
          else
          {
            LOBYTE(v55) = 0;
            if (!v27)
            {
LABEL_48:
              if (self)
              {
                stageLabel = self->super._stageLabel;
                if (!v27)
                {
LABEL_51:
                  BOOL v57 = -[_NSSQLiteStoreMigrator performMigration:]((uint64_t)v27, &v79);
                  char v58 = v57;
                  if (a10) {
                    char v59 = v57;
                  }
                  else {
                    char v59 = 1;
                  }
                  if ((v59 & 1) == 0)
                  {
                    uint64_t v60 = objc_msgSend((id)objc_msgSend(v79, "userInfo"), "objectForKey:", @"reason");
                    if (v60) {
                      v61 = (__CFString *)[@"Cannot migrate store in-place: " stringByAppendingString:v60];
                    }
                    else {
                      v61 = @"Cannot migrate store in-place";
                    }
                    v67 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v68 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v61, @"reason", v79, *MEMORY[0x1E4F28A50], a3, @"sourceURL", a3, @"destinationURL", 0);
                    *(void *)&v80.st_dev = [v67 errorWithDomain:*MEMORY[0x1E4F281F8] code:134110 userInfo:v68];
                  }
                  if (self) {
                    *(_DWORD *)&self->super._migrationManagerFlags |= 4u;
                  }
                  -[_NSSQLiteStoreMigrator _disconnect]((uint64_t)v27);
                  int v29 = 0;
                  unsigned __int8 v17 = 0;
                  char v22 = v58;
                  goto LABEL_21;
                }
              }
              else
              {
                stageLabel = 0;
                if (!v27) {
                  goto LABEL_51;
                }
              }
              objc_setProperty_nonatomic_copy(v27, v54, stageLabel, 232);
              goto LABEL_51;
            }
          }
          v27[218] = v55;
          goto LABEL_48;
        }
        if (a10)
        {
          v65 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v66 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Invalid destination data model", @"reason", 0);
          uint64_t v64 = [v65 errorWithDomain:*MEMORY[0x1E4F281F8] code:134110 userInfo:v66];
          goto LABEL_61;
        }
      }
      else if (a10)
      {
        v62 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v63 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to open the store", @"reason", v79, *MEMORY[0x1E4F28A50], 0);
        uint64_t v64 = [v62 errorWithDomain:*MEMORY[0x1E4F281F8] code:134110 userInfo:v63];
LABEL_61:
        v27 = 0;
        v28 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v80.st_dev = v64;
        goto LABEL_20;
      }
      v27 = 0;
      v28 = 0;
      unsigned __int8 v17 = 0;
      goto LABEL_20;
    }
    if (v18)
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      v87 = @"sourceStore";
      id v88 = a3;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
      char v22 = 0;
      v27 = 0;
      v28 = 0;
      unsigned __int8 v17 = 0;
      *(void *)&v80.st_dev = [v25 errorWithDomain:*MEMORY[0x1E4F281F8] code:134182 userInfo:v26];
    }
    else
    {
      v78.receiver = self;
      v78.super_class = (Class)NSSQLiteInPlaceMigrationManager;
      char v22 = 1;
      unsigned __int8 v17 = [(NSMigrationManager *)&v78 migrateStoreFromURL:v21 type:a4 options:a5 withMappingModel:a6 toDestinationURL:a7 destinationType:a8 destinationOptions:a9 error:&v80];
      v27 = 0;
      v28 = 0;
    }
  }
  else
  {
    char v22 = 0;
    v27 = 0;
    v28 = 0;
    unsigned __int8 v17 = 0;
  }
  double v24 = 0.0;
LABEL_20:
  int v29 = 1;
LABEL_21:
  id v30 = *(id *)&v80.st_dev;

  [(NSPersistentStoreCoordinator *)v76 _removeAllPersistentStores:0];
  if (v22)
  {
    if (+[NSMappingModel migrationDebugLevel] >= 1)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      _NSCoreDataLog(4, @"(migration) in-place migration completed successfully in %2.2f seconds", v32, v33, v34, v35, v36, v37, COERCE__INT64(v31 - v24));
    }
  }
  else if (+[NSMappingModel migrationDebugLevel] < 1)
  {
    if (([a3 isEqual:a7] & 1) == 0)
    {
      [(NSPersistentStoreCoordinator *)v76 _destroyPersistentStoreAtURL:a7 withType:@"SQLite" options:v73 error:0];
      v44 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      objc_msgSend(v44, "removeItemAtPath:error:", objc_msgSend(a7, "path"), 0);
      objc_msgSend(v44, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(a7, "path"), "stringByAppendingString:", @"-shm"), 0);
      objc_msgSend(v44, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(a7, "path"), "stringByAppendingString:", @"-journal"), 0);
      objc_msgSend(v44, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(a7, "path"), "stringByAppendingString:", @"-wal"), 0);
    }
  }
  else
  {
    if (v79) {
      [v79 description];
    }
    _NSCoreDataLog(4, @"(migration) leaving incompletely migrated store on disk after in-place migration error. (%@, %@)", v38, v39, v40, v41, v42, v43, (uint64_t)a7);
  }

  [v74 drain];
  id v48 = 0;
  id v49 = *(id *)&v80.st_dev;
  if (a10 && *(void *)&v80.st_dev) {
    *a10 = *(id *)&v80.st_dev;
  }
  if ((v29 | 2) == 2) {
    unsigned __int8 v17 = v22;
  }
  return v17 & 1;
}

@end