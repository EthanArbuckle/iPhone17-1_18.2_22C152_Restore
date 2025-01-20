@interface _DKCoreDataStorage
+ (id)anonymizeString:(void *)a3 withSalt:;
+ (uint64_t)forceCopyItemAtPath:(void *)a3 toPath:(uint64_t)a4 error:;
+ (unint64_t)anonymizeObjectStringsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 batchFetchLimit:(unint64_t)a7 totalFetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 salt:(id)a10;
+ (unint64_t)anonymizeStringAttributesOfManagedObject:(id)a3 withSalt:(id)a4;
+ (unint64_t)countObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 includeSubentities:(BOOL)a6 includePendingChanges:(BOOL)a7;
+ (unint64_t)deleteObjectsIfNeededToLimitTotal:(unint64_t)a3 context:(id)a4 entityName:(id)a5 predicate:(id)a6 sortDescriptors:(id)a7 fetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 includePendingChanges:(BOOL)a10;
+ (unint64_t)deleteObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 fetchLimit:(unint64_t)a7 includeSubentities:(BOOL)a8 includePendingChanges:(BOOL)a9;
+ (unint64_t)deleteObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 fetchOffset:(unint64_t)a7 fetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 includePendingChanges:(BOOL)a10;
+ (unint64_t)deleteOrphanedEntitiesInContext:(id)a3;
+ (unint64_t)updateObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 batchFetchLimit:(unint64_t)a7 totalFetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 updateBlock:(id)a10;
- (BOOL)_deleteDatabaseFiles:(uint64_t)a1;
- (BOOL)confirmDatabaseConnectionFor:(id)a3;
- (BOOL)deleteStorageFor:(id)a3;
- (BOOL)isManagedObjectContextFor:(id)a3 equalToManagedObjectContext:(id)a4;
- (BOOL)isManagedObjectModel:(id)a3 compatibleWithPersistentStoreAtURL:(id)a4 error:(id *)a5;
- (BOOL)localOnly;
- (BOOL)migratePersistentStoreAtURL:(id)a3 toManagedObjectModel:(id)a4 protectionClass:(id)a5 error:(id *)a6;
- (BOOL)readOnly;
- (BOOL)requiresManualMigration;
- (BOOL)sync;
- (NSCloudKitMirroringDelegate)mirroringDelegate;
- (NSString)containerIdentifier;
- (NSString)databaseName;
- (NSString)directory;
- (NSURL)modelURL;
- (_BYTE)_defaultOptionsForStoreWithProtectionClass:(unsigned char *)a1;
- (_BYTE)autoMigratePersistentStoreAtURL:(void *)a3 toManagedObjectModel:(void *)a4 protectionClass:(void *)a5 error:;
- (_DKCoreDataStorage)init;
- (_DKCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6 localOnly:(BOOL)a7;
- (_DKCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 sync:(BOOL)a6;
- (_DKCoreDataStorageDelegate)delegate;
- (id)_descriptionForStoreWithURL:(void *)a3 protectionClass:(int)a4 sync:;
- (id)clientNeedsHelpNotification;
- (id)copyStorageFor:(id)a3 toDirectory:(id)a4;
- (id)databaseManagerName;
- (id)databasePathFor:(id *)a1;
- (id)managedObjectContextFor:(id)a3;
- (id)managedObjectContextFor:(id)a3 identifier:(id)a4;
- (id)managedObjectContextForKey:(id *)a1;
- (id)managedObjectContextIdentifierWithPrefix:(id *)a1;
- (id)managedObjectModel;
- (id)managedObjectModelForVersion:(unint64_t)a3;
- (id)managedObjectModelURLForVersion:(unint64_t)a3;
- (id)persistentStoreCoordinatorFor:(id)a3;
- (id)privateManagedObjectContextFor:(id)a3;
- (int64_t)modelVersionForStoreAtURL:(id)a3 error:(id *)a4;
- (uint64_t)_addStoresToCoordinator:(void *)a3 protectionClass:(void *)a4 error:;
- (uint64_t)didAutoMigratePersistentStore:(void *)a3 toManagedObjectModel:(uint64_t)a4 havingVersion:(void *)a5 error:;
- (uint64_t)initWithDirectory:(void *)a3 databaseName:(void *)a4 modelURL:(char)a5 readOnly:(char)a6 localOnly:(char)a7 sync:;
- (uint64_t)isDataVaulted;
- (uint64_t)migratePersistentStoreAtURL:(void *)a3 toManagedObjectModel:(void *)a4 protectionClass:(unint64_t)a5 startVersion:(unint64_t)a6 endVersion:(void *)a7 error:;
- (uint64_t)willAutoMigrateStoreAtURL:(void *)a3 fromManagedObjectModel:(uint64_t)a4 havingVersion:(void *)a5 error:;
- (unint64_t)managedObjectModelVersionCompatibleWithPersistentStoreAtURL:(void *)a3 error:;
- (void)_registerForClientHelpNotifications;
- (void)_unregisterForClientHelpNotifications;
- (void)closeStorageForProtectionClass:(id)a3;
- (void)dealloc;
- (void)handleClientCallForHelp;
- (void)handleDataProtectionChangeFor:(char)a3 willBeAvailable:;
- (void)handleDatabaseErrors:(void *)a3 forProtectionClass:;
- (void)invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:(void *)a1;
- (void)managedObjectModel;
- (void)removeManagedObjectContextForKey:(uint64_t)a1;
- (void)removePersistentStoresInCoordinator:(uint64_t)a1;
- (void)setDelegate:(id)a3;
- (void)setManagedObjectContext:(void *)a3 forKey:;
- (void)setManagedObjectModel:(id)a3;
- (void)setRequiresManualMigration:(BOOL)a3;
@end

@implementation _DKCoreDataStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_mirroringDelegate, 0);
  objc_storeStrong((id *)&self->_fm, 0);
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinators, 0);
  objc_storeStrong((id *)&self->_managedObjectContexts, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
}

- (uint64_t)initWithDirectory:(void *)a3 databaseName:(void *)a4 modelURL:(char)a5 readOnly:(char)a6 localOnly:(char)a7 sync:
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  if (a1)
  {
    v43.receiver = (id)a1;
    v43.super_class = (Class)_DKCoreDataStorage;
    v17 = (id *)objc_msgSendSuper2(&v43, sel_init);
    a1 = (uint64_t)v17;
    if (v17)
    {
      objc_storeStrong(v17 + 9, a2);
      *(unsigned char *)(a1 + 67) = a5;
      *(unsigned char *)(a1 + 68) = a6;
      *(unsigned char *)(a1 + 69) = a7;
      objc_storeStrong((id *)(a1 + 88), a3);
      objc_storeStrong((id *)(a1 + 80), a4);
      uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      v19 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v18;

      uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
      v21 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v20;

      v22 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0;

      uint64_t v23 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:5];
      v24 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v23;

      uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
      v26 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v25;

      v27 = [NSString stringWithFormat:@"%@/%@", *(void *)(a1 + 72), *(void *)(a1 + 88)];
      v28 = [NSString stringWithFormat:@"%@%@.db", v27, @"A"];
      [*(id *)(a1 + 16) setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F28340]];

      v29 = [NSString stringWithFormat:@"%@%@.db", v27, @"C"];
      [*(id *)(a1 + 16) setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F28358]];

      v30 = [NSString stringWithFormat:@"%@%@.db", v27, @"D"];
      [*(id *)(a1 + 16) setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F28378]];

      v31 = objc_alloc_init(_DKDataProtectionStateMonitor);
      v32 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v31;

      objc_initWeak(&location, (id)a1);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __86___DKCoreDataStorage_initWithDirectory_databaseName_modelURL_readOnly_localOnly_sync___block_invoke;
      v40[3] = &unk_1E560D528;
      objc_copyWeak(&v41, &location);
      [*(id *)(a1 + 40) setChangeHandler:v40];
      *(unsigned char *)(a1 + 66) = 0;
      v33 = -[_DKCoreDataStorage databaseManagerName]((id *)a1);
      *(unsigned char *)(a1 + 64) = v33 != 0;

      if (*(unsigned char *)(a1 + 64))
      {
        v34 = [MEMORY[0x1E4F28F80] processInfo];
        v35 = [v34 processName];

        v36 = -[_DKCoreDataStorage databaseManagerName]((id *)a1);
        *(unsigned char *)(a1 + 65) = [v35 isEqualToString:v36];

        if (*(unsigned char *)(a1 + 64) && -[_DKCoreDataStorage isDataVaulted](a1))
        {
          v37 = +[_CDEntitlementsUtilities entitlementValueForKey:@"com.apple.rootless.storage.coreduet_knowledge_store"];
          if ((objc_opt_respondsToSelector() & 1) == 0 || ([v37 BOOLValue] & 1) == 0)
          {
            v39 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
              -[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:readOnly:localOnly:sync:]();
            }

            objc_destroyWeak(&v41);
            objc_destroyWeak(&location);

            v27 = (void *)a1;
            a1 = 0;
            goto LABEL_13;
          }
          if (*(unsigned char *)(a1 + 65)) {
            -[_DKCoreDataStorage _registerForClientHelpNotifications]((id *)a1);
          }
        }
      }
      else
      {
        *(unsigned char *)(a1 + 65) = 1;
      }
      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
LABEL_13:
    }
  }

  return a1;
}

- (uint64_t)isDataVaulted
{
  if (result)
  {
    v1 = [*(id *)(result + 72) stringByStandardizingPath];
    v2 = +[_CDPaths knowledgeDirectory];
    v3 = [v2 stringByStandardizingPath];
    uint64_t v4 = [v1 isEqualToString:v3];

    return v4;
  }
  return result;
}

- (id)databaseManagerName
{
  v1 = a1;
  v10[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = +[_CDPaths knowledgeDirectory];
    v3 = [v2 stringByStandardizingPath];
    v9[0] = v3;
    v10[0] = @"coreduetd";
    uint64_t v4 = +[_CDPaths peopleDirectory];
    v5 = [v4 stringByStandardizingPath];
    v9[1] = v5;
    v10[1] = @"coreduetd";
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

    v7 = [v1[9] stringByStandardizingPath];
    v1 = [v6 objectForKeyedSubscript:v7];
  }
  return v1;
}

- (_DKCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6 localOnly:(BOOL)a7
{
  return (_DKCoreDataStorage *)-[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:readOnly:localOnly:sync:]((uint64_t)self, a3, a4, a5, a6, a7, 0);
}

- (void)setRequiresManualMigration:(BOOL)a3
{
  self->_requiresManualMigration = a3;
}

- (void)setDelegate:(id)a3
{
}

- (id)managedObjectContextFor:(id)a3
{
  return [(_DKCoreDataStorage *)self managedObjectContextFor:a3 identifier:0];
}

- (id)privateManagedObjectContextFor:(id)a3
{
  id v4 = a3;
  if ([(_DKDataProtectionStateMonitor *)self->_dataProtectionMonitor isDataAvailableFor:v4])
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = [(_DKCoreDataStorage *)v5 persistentStoreCoordinatorFor:v4];
    if (v6)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
      [v7 setPersistentStoreCoordinator:v6];
      [v7 setMergePolicy:*MEMORY[0x1E4F1BE40]];
      [v7 setUndoManager:0];
    }
    else
    {
      v7 = 0;
    }

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)managedObjectContextFor:(id)a3 identifier:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(_DKDataProtectionStateMonitor *)self->_dataProtectionMonitor isDataAvailableFor:v6];
  v9 = self;
  objc_sync_enter(v9);
  if (v7)
  {
    v23[0] = v6;
    v23[1] = v7;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v11 = [v10 componentsJoinedByString:@":"];
  }
  else
  {
    id v11 = v6;
  }
  uint64_t v12 = -[_DKCoreDataStorage managedObjectContextForKey:]((id *)&v9->super.isa, v11);
  v13 = (void *)v12;
  if (!v8)
  {
    id v16 = 0;
    if (!v12)
    {
      int v14 = 0;
LABEL_12:
      int v15 = 1;
      goto LABEL_13;
    }
LABEL_11:

    int v14 = !v8;
    goto LABEL_12;
  }
  if (v12)
  {
    int v14 = 0;
    int v15 = 1;
    id v16 = (id)v12;
    goto LABEL_13;
  }
  v13 = [(_DKCoreDataStorage *)v9 persistentStoreCoordinatorFor:v6];
  if (v13)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
    [v17 setPersistentStoreCoordinator:v13];
    [v17 setMergePolicy:*MEMORY[0x1E4F1BE40]];
    [v17 setUndoManager:0];
    uint64_t v18 = [NSString stringWithFormat:@"com.apple.coreduet.knowledge %@", v11];
    [v17 setName:v18];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57___DKCoreDataStorage_managedObjectContextFor_identifier___block_invoke;
    v21[3] = &unk_1E560D578;
    id v16 = v17;
    id v22 = v16;
    [v16 performWithOptions:4 andBlock:v21];
    -[_DKCoreDataStorage setManagedObjectContext:forKey:]((uint64_t)v9, v16, v11);

    goto LABEL_11;
  }
  int v14 = 0;
  id v16 = 0;
  int v15 = 0;
LABEL_13:

  objc_sync_exit(v9);
  if (!v15)
  {
LABEL_16:
    id v19 = 0;
    goto LABEL_18;
  }
  if (v14)
  {
    -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](v9, v6);
    goto LABEL_16;
  }
  id v19 = v16;
LABEL_18:

  return v19;
}

- (id)managedObjectContextForKey:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = a1[3];
    objc_sync_enter(v4);
    a1 = [a1[3] objectForKey:v3];
    objc_sync_exit(v4);
  }
  return a1;
}

- (id)persistentStoreCoordinatorFor:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(_DKDataProtectionStateMonitor *)self->_dataProtectionMonitor isDataAvailableFor:v4];
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(NSMutableDictionary *)v6->_persistentStoreCoordinators objectForKeyedSubscript:v4];
  id v8 = v7;
  if (!v5)
  {
    if (!v7) {
      goto LABEL_53;
    }

    -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](v6, v4);
LABEL_11:
    id v8 = 0;
LABEL_52:
    objc_sync_exit(v6);

    v35 = 0;
    goto LABEL_54;
  }
  if (v7) {
    goto LABEL_53;
  }
  p_directory = (id *)&v6->_directory;
  if ([(NSFileManager *)v6->_fm fileExistsAtPath:v6->_directory])
  {
    if (!v6->_isManagedDatabase) {
      goto LABEL_34;
    }
    int v10 = -[_DKCoreDataStorage isDataVaulted]((uint64_t)v6);
    id v11 = *p_directory;
    if (v10)
    {
      [v11 UTF8String];
      if (rootless_check_datavault_flag() == 1)
      {
        if (v6->_isDatabaseManager)
        {
          [*p_directory UTF8String];
          rootless_convert_to_datavault();
          goto LABEL_34;
        }
        uint64_t v23 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.5();
        }
LABEL_32:

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v25 = (const __CFString *)-[_DKCoreDataStorage clientNeedsHelpNotification]((id *)&v6->super.isa);
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v25, 0, 0, 1u);
        id v18 = 0;
        goto LABEL_35;
      }
LABEL_34:
      id v18 = 0;
      goto LABEL_35;
    }
    [v11 UTF8String];
    if (rootless_check_datavault_flag()) {
      goto LABEL_34;
    }
    if (!v6->_isDatabaseManager)
    {
      uint64_t v23 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.6();
      }
      goto LABEL_32;
    }
    v38 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = *p_directory;
      *(_DWORD *)buf = 138412290;
      id v59 = v39;
      _os_log_impl(&dword_18ECEB000, v38, OS_LOG_TYPE_DEFAULT, "Removing datavault directory %@", buf, 0xCu);
    }

    fm = v6->_fm;
    directory = v6->_directory;
    id v56 = 0;
    [(NSFileManager *)fm removeItemAtPath:directory error:&v56];
    id v18 = v56;
    if (v18)
    {
      v42 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.8();
      }

      goto LABEL_35;
    }
    v44 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18ECEB000, v44, OS_LOG_TYPE_DEFAULT, "Succesfully removed datavault directory.", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v45 = *p_directory;
      *(_DWORD *)buf = 138412290;
      id v59 = v45;
      _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Creating directory at %@", buf, 0xCu);
    }
    v46 = v6->_fm;
    v47 = v6->_directory;
    id v55 = 0;
    BOOL v48 = [(NSFileManager *)v46 createDirectoryAtPath:v47 withIntermediateDirectories:1 attributes:0 error:&v55];
    id v18 = v55;
    if (!v48)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.7();
      }
      -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, 0);
LABEL_29:

      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v12 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_DKCoreDataStorage persistentStoreCoordinatorFor:]2();
    }

    if (!v6->_isDatabaseManager)
    {
      uint64_t v23 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.9();
      }
      goto LABEL_32;
    }
    if (v6->_isManagedDatabase && -[_DKCoreDataStorage isDataVaulted]((uint64_t)v6))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        id v13 = *p_directory;
        *(_DWORD *)buf = 138412290;
        id v59 = v13;
        _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Creating datavault at %@", buf, 0xCu);
      }
      [*p_directory UTF8String];
      int v14 = rootless_mkdir_datavault();
      if (!v14) {
        goto LABEL_34;
      }
      int v15 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = __error();
        [(_DKCoreDataStorage *)v17 persistentStoreCoordinatorFor:v14];
      }

      -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, 0);
      id v18 = 0;
      goto LABEL_29;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v19 = *p_directory;
      *(_DWORD *)buf = 138412290;
      id v59 = v19;
      _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Creating directory at %@", buf, 0xCu);
    }
    uint64_t v20 = v6->_fm;
    v21 = v6->_directory;
    id v57 = 0;
    BOOL v22 = [(NSFileManager *)v20 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v57];
    id v18 = v57;
    if (!v22)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_DKCoreDataStorage persistentStoreCoordinatorFor:]0();
      }
      -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, 0);
      goto LABEL_29;
    }
  }
LABEL_35:
  v26 = -[_DKCoreDataStorage _defaultOptionsForStoreWithProtectionClass:](v6, v4);
  v27 = (void *)[v26 mutableCopy];

  v28 = [(_DKCoreDataStorage *)v6 managedObjectModel];
  if (v28)
  {
    v29 = (void *)MEMORY[0x1E4F1CB10];
    v30 = [(NSMutableDictionary *)v6->_paths objectForKeyedSubscript:v4];
    v31 = [v29 fileURLWithPath:v30];

    if (![(_DKCoreDataStorage *)v6 requiresManualMigration] || v6->_readOnly)
    {
      id v32 = v18;
      goto LABEL_39;
    }
    id v54 = v18;
    BOOL v37 = [(_DKCoreDataStorage *)v6 isManagedObjectModel:v28 compatibleWithPersistentStoreAtURL:v31 error:&v54];
    id v32 = v54;

    if (v32)
    {
      if (+[_CDErrorUtilities isCoreDataFatalError:v32])
      {
        -[_DKCoreDataStorage handleDatabaseErrors:forProtectionClass:](v6, v32, v4);
        -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, 0);
        goto LABEL_39;
      }
    }
    else if (!v37)
    {
      if (!v6->_isDatabaseManager)
      {
        v49 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:]();
        }

        v50 = CFNotificationCenterGetDarwinNotifyCenter();
        CFStringRef v51 = (const __CFString *)-[_DKCoreDataStorage clientNeedsHelpNotification]((id *)&v6->super.isa);
        int v34 = 1;
        CFNotificationCenterPostNotification(v50, v51, 0, 0, 1u);
        id v18 = 0;
        goto LABEL_49;
      }
      id v53 = 0;
      BOOL v43 = [(_DKCoreDataStorage *)v6 migratePersistentStoreAtURL:v31 toManagedObjectModel:v28 protectionClass:v4 error:&v53];
      id v32 = v53;
      if (v43)
      {
        [v27 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BF48]];
        [v27 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BF58]];
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[_DKCoreDataStorage persistentStoreCoordinatorFor:].cold.4();
        }
        +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.coreData.failedToMigrateDB"];
        [(_DKCoreDataStorage *)v6 deleteStorageFor:v4];
        -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, 0);
      }
LABEL_39:
      id v8 = (id)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v28];

      id v52 = 0;
      char v33 = -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:]((uint64_t)v6, v8, v4, &v52);
      id v18 = v52;
      if (v33)
      {
        if (v8) {
          [(NSMutableDictionary *)v6->_persistentStoreCoordinators setObject:v8 forKeyedSubscript:v4];
        }
        int v34 = 0;
        goto LABEL_50;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_DKCoreDataStorage persistentStoreCoordinatorFor:]();
      }
      -[_DKCoreDataStorage handleDatabaseErrors:forProtectionClass:](v6, v18, v4);
      -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v6, v8);

      int v34 = 0;
LABEL_49:
      id v8 = 0;
LABEL_50:

      goto LABEL_51;
    }
    id v32 = 0;
    goto LABEL_39;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[_DKCoreDataStorage persistentStoreCoordinatorFor:]();
  }
  int v34 = 1;
  +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.coreData.failedToLoadMOM"];
  id v8 = 0;
LABEL_51:

  if (v34) {
    goto LABEL_52;
  }
LABEL_53:
  objc_sync_exit(v6);

  id v8 = v8;
  v35 = v8;
LABEL_54:

  return v35;
}

- (void)setManagedObjectContext:(void *)a3 forKey:
{
  id v7 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = *(id *)(a1 + 24);
    objc_sync_enter(v6);
    [*(id *)(a1 + 24) setObject:v7 forKey:v5];
    objc_sync_exit(v6);
  }
}

+ (unint64_t)deleteObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 fetchLimit:(unint64_t)a7 includeSubentities:(BOOL)a8 includePendingChanges:(BOOL)a9
{
  BYTE1(v10) = a9;
  LOBYTE(v10) = a8;
  return objc_msgSend(a1, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchOffset:fetchLimit:includeSubentities:includePendingChanges:", a3, a4, a5, a6, 0, a7, v10);
}

+ (unint64_t)deleteObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 fetchOffset:(unint64_t)a7 fetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 includePendingChanges:(BOOL)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (v15)
  {
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    uint64_t v32 = 0;
    char v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__19;
    v36 = __Block_byref_object_dispose__19;
    id v37 = 0;
    kdebug_trace();
    _cdknowledge_signpost_delete_begin(v16);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke;
    v21[3] = &unk_1E560FD58;
    id v22 = v16;
    id v23 = v15;
    unint64_t v28 = a8;
    unint64_t v29 = a7;
    BOOL v30 = a9;
    BOOL v31 = a10;
    id v24 = v17;
    id v25 = v18;
    v26 = &v32;
    v27 = &v38;
    [v23 performWithOptions:4 andBlock:v21];
    [(id)v33[5] code];
    kdebug_trace();
    _cdknowledge_signpost_delete_end(v39[3], [(id)v33[5] code]);
    unint64_t v19 = v39[3];

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    unint64_t v19 = 0;
  }

  return v19;
}

- (void)dealloc
{
  if (self->_isManagedDatabase && self->_isDatabaseManager) {
    -[_DKCoreDataStorage _unregisterForClientHelpNotifications]((id *)&self->super.isa);
  }
  v3.receiver = self;
  v3.super_class = (Class)_DKCoreDataStorage;
  [(_DKCoreDataStorage *)&v3 dealloc];
}

- (id)databasePathFor:(id *)a1
{
  if (a1)
  {
    a1 = [a1[2] objectForKeyedSubscript:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)forceCopyItemAtPath:(void *)a3 toPath:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v8 fileExistsAtPath:v7]) {
    [v8 removeItemAtPath:v7 error:0];
  }
  [v8 copyItemAtPath:v6 toPath:v7 error:a4];

  return 1;
}

- (_DKCoreDataStorage)init
{
  return 0;
}

- (_DKCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 sync:(BOOL)a6
{
  return (_DKCoreDataStorage *)-[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:readOnly:localOnly:sync:]((uint64_t)self, a3, a4, a5, 0, 0, a6);
}

- (void)handleDataProtectionChangeFor:(char)a3 willBeAvailable:
{
  id v5 = a2;
  if (a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      -[_DKCoreDataStorage handleDataProtectionChangeFor:willBeAvailable:]();
      if (a3) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if ((a3 & 1) == 0) {
LABEL_4:
    }
      -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](a1, v5);
  }
LABEL_5:
}

- (void)_registerForClientHelpNotifications
{
  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v3 = (const __CFString *)-[_DKCoreDataStorage clientNeedsHelpNotification](a1);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_clientNeedsHelpCallback, v3, 0, (CFNotificationSuspensionBehavior)0);
  }
}

- (void)_unregisterForClientHelpNotifications
{
  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v3 = (const __CFString *)-[_DKCoreDataStorage clientNeedsHelpNotification](a1);
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a1, v3, 0);
  }
}

- (id)clientNeedsHelpNotification
{
  if (a1)
  {
    v1 = -[_DKCoreDataStorage databaseManagerName](a1);
    uint64_t v2 = [NSString stringWithFormat:@"%@%@", @"com.apple.coreduet.client-needs-help.", v1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (void)handleClientCallForHelp
{
  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    if (obj[66])
    {
      objc_sync_exit(obj);
    }
    else
    {
      obj[66] = 1;
      objc_sync_exit(obj);

      -[_DKCoreDataStorage _unregisterForClientHelpNotifications]((id *)obj);
      v1 = (void *)*MEMORY[0x1E4F28358];
      uint64_t v2 = [obj managedObjectContextFor:*MEMORY[0x1E4F28358]];
      uint64_t v12 = 0;
      id v13 = &v12;
      uint64_t v14 = 0x3032000000;
      id v15 = __Block_byref_object_copy__19;
      id v16 = __Block_byref_object_dispose__19;
      id v17 = 0;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __45___DKCoreDataStorage_handleClientCallForHelp__block_invoke;
      v8[3] = &unk_1E560E960;
      id v3 = v2;
      id v9 = v3;
      uint64_t v10 = obj;
      id v11 = &v12;
      [v3 performWithOptions:0 andBlock:v8];
      id v4 = (void *)v13[5];
      if (v4) {
        -[_DKCoreDataStorage handleDatabaseErrors:forProtectionClass:](obj, v4, v1);
      }
      dispatch_time_t v5 = dispatch_time(0, 60000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45___DKCoreDataStorage_handleClientCallForHelp__block_invoke_2;
      block[3] = &unk_1E560D578;
      block[4] = obj;
      dispatch_after(v5, MEMORY[0x1E4F14428], block);

      _Block_object_dispose(&v12, 8);
    }
  }
}

- (void)handleDatabaseErrors:(void *)a3 forProtectionClass:
{
  id v5 = a2;
  id v6 = a3;
  if (a1 && v5)
  {
    if (+[_CDErrorUtilities isCoreDataFatalError:v5])
    {
      +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.deletedDB.couldNotOpen"];
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v7) {
        -[_DKCoreDataStorage handleDatabaseErrors:forProtectionClass:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
      [a1 deleteStorageFor:v6];
    }
    else if (+[_CDErrorUtilities isCoreDataTemporaryError:v5])
    {
      -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](a1, v6);
    }
  }
}

- (void)invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = a1;
    objc_sync_enter(v4);
    uint64_t v12 = v3;
    id v5 = [v4[4] objectForKeyedSubscript:v3];
    if (v5) {
      [v4[4] removeObjectForKey:v12];
    }
    -[_DKCoreDataStorage managedObjectContextIdentifierWithPrefix:](v4, v12);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = -[_DKCoreDataStorage managedObjectContextForKey:](v4, v10);
          if (v11)
          {
            -[_DKCoreDataStorage removeManagedObjectContextForKey:]((uint64_t)v4, v10);
            v13[0] = MEMORY[0x1E4F143A8];
            v13[1] = 3221225472;
            v13[2] = __85___DKCoreDataStorage_invalidateManagedObjectContextAndPersistentStoreCoordinatorFor___block_invoke;
            v13[3] = &unk_1E560D578;
            id v14 = v11;
            [v14 performWithOptions:4 andBlock:v13];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    -[_DKCoreDataStorage removePersistentStoresInCoordinator:]((uint64_t)v4, v5);
    objc_sync_exit(v4);

    id v3 = v12;
  }
}

- (id)managedObjectContextIdentifierWithPrefix:(id *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = a1[3];
    objc_sync_enter(v4);
    id v5 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = a1[3];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "hasPrefix:", v3, (void)v12)) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    a1 = (id *)[v5 copy];
    objc_sync_exit(v4);
  }
  return a1;
}

- (void)removeManagedObjectContextForKey:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 24);
    objc_sync_enter(v3);
    [*(id *)(a1 + 24) removeObjectForKey:v4];
    objc_sync_exit(v3);
  }
}

- (void)removePersistentStoresInCoordinator:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = [v3 persistentStores];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      uint64_t v9 = MEMORY[0x1E4F14500];
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
          id v16 = 0;
          int v12 = [v4 removePersistentStore:v11 error:&v16];
          id v13 = v16;
          long long v14 = v13;
          if (v12) {
            BOOL v15 = v13 == 0;
          }
          else {
            BOOL v15 = 0;
          }
          if (!v15 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            [(_DKCoreDataStorage *)buf removePersistentStoresInCoordinator:&v22];
          }

          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v7);
    }
  }
}

- (void)closeStorageForProtectionClass:(id)a3
{
}

- (id)managedObjectModel
{
  if (self->_modelURL)
  {
    if (gManagedObjectModelCacheInitialized != -1) {
      dispatch_once(&gManagedObjectModelCacheInitialized, &__block_literal_global_58);
    }
    id v3 = (id)gManagedObjectModelCache;
    objc_sync_enter(v3);
    if (!self->_managedObjectModel)
    {
      id v4 = [(id)gManagedObjectModelCache objectForKey:self->_modelURL];
      managedObjectModel = self->_managedObjectModel;
      self->_managedObjectModel = v4;

      if (!self->_managedObjectModel)
      {
        uint64_t v6 = (NSManagedObjectModel *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:self->_modelURL];
        uint64_t v7 = self->_managedObjectModel;
        self->_managedObjectModel = v6;

        [(id)gManagedObjectModelCache setObject:self->_managedObjectModel forKey:self->_modelURL];
      }
    }
    objc_sync_exit(v3);

    uint64_t v8 = self->_managedObjectModel;
  }
  else
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v9) {
      [(_DKCoreDataStorage *)v9 managedObjectModel];
    }
    uint64_t v8 = 0;
  }
  return v8;
}

- (void)setManagedObjectModel:(id)a3
{
}

- (BOOL)isManagedObjectModel:(id)a3 compatibleWithPersistentStoreAtURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F1BF70];
  id v13 = 0;
  BOOL v9 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v8 URL:a4 error:&v13];
  id v10 = v13;
  if (!v9)
  {
    char v11 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  char v11 = [v7 isConfiguration:0 compatibleWithStoreMetadata:v9];
  if (a5) {
LABEL_3:
  }
    *a5 = v10;
LABEL_4:

  return v11;
}

- (unint64_t)managedObjectModelVersionCompatibleWithPersistentStoreAtURL:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    unint64_t v6 = 1;
    while (1)
    {
      id v7 = (void *)MEMORY[0x192FB2F20]();
      uint64_t v8 = [a1 managedObjectModelForVersion:v6];
      if (!v8)
      {
        char v11 = 0;
LABEL_9:

LABEL_10:
        unint64_t v6 = 0;
        goto LABEL_11;
      }
      id v13 = 0;
      char v9 = [a1 isManagedObjectModel:v8 compatibleWithPersistentStoreAtURL:v5 error:&v13];
      id v10 = v13;
      char v11 = v10;
      if (v9) {
        break;
      }
      if (v10) {
        goto LABEL_9;
      }

      if (++v6 == 9)
      {
        char v11 = 0;
        goto LABEL_10;
      }
    }

    if (v6 >= 9) {
      goto LABEL_10;
    }
LABEL_11:
    if (a3) {
      *a3 = v11;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)managedObjectModelURLForVersion:(unint64_t)a3
{
  id v5 = [(_DKCoreDataStorage *)self delegate];

  if (v5)
  {
    unint64_t v6 = [(_DKCoreDataStorage *)self delegate];
    id v7 = [v6 coreDataStorage:self needsManagedObjectModelNameForVersion:a3];

    if (v7)
    {
      uint64_t v8 = [v7 stringByAppendingPathExtension:@"mom"];
      char v9 = [(NSURL *)self->_modelURL URLByAppendingPathComponent:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }
  return v9;
}

- (id)managedObjectModelForVersion:(unint64_t)a3
{
  id v3 = [(_DKCoreDataStorage *)self managedObjectModelURLForVersion:a3];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v3];
    if (v4) {
      goto LABEL_6;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[_DKCoreDataStorage managedObjectModelForVersion:]();
    }
  }
  id v4 = 0;
LABEL_6:

  return v4;
}

- (int64_t)modelVersionForStoreAtURL:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F1BF70];
  id v20 = 0;
  uint64_t v8 = [MEMORY[0x1E4F1C188] metadataForPersistentStoreOfType:v7 URL:v6 error:&v20];
  id v9 = v20;
  if (v8)
  {
    id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1BF80]];
    char v11 = [v10 firstObject];
    if ([v11 length])
    {
      unint64_t v12 = [v11 integerValue];

      if (v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v13 = [(_DKCoreDataStorage *)self delegate];

  if (!v13
    || (id v19 = v9,
        unint64_t v12 = -[_DKCoreDataStorage managedObjectModelVersionCompatibleWithPersistentStoreAtURL:error:](self, v6, &v19),
        id v14 = v19,
        v9,
        id v9 = v14,
        !v12))
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"Store version not found.";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v17 = [v15 errorWithDomain:@"com.apple.coreduet.DKCoreDataStorage" code:2 userInfo:v16];

    unint64_t v12 = 0;
    id v9 = (id)v17;
  }
LABEL_9:
  if (a4) {
    *a4 = v9;
  }

  return v12;
}

- (BOOL)migratePersistentStoreAtURL:(id)a3 toManagedObjectModel:(id)a4 protectionClass:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  BOOL v43 = __Block_byref_object_copy__19;
  v44 = __Block_byref_object_dispose__19;
  id v45 = 0;
  id v13 = self;
  objc_sync_enter(v13);
  id v14 = (id *)(v41 + 5);
  id obj = (id)v41[5];
  uint64_t v15 = [(_DKCoreDataStorage *)v13 modelVersionForStoreAtURL:v10 error:&obj];
  objc_storeStrong(v14, obj);
  if (v15)
  {
    uint64_t v16 = [v11 versionIdentifiers];
    uint64_t v17 = [v16 anyObject];
    unint64_t v18 = [v17 integerValue];

    if (v15 < v18)
    {
      id v19 = [(_DKCoreDataStorage *)v13 delegate];
      id v20 = v19;
      if (v19 && v15 > 0)
      {
        uint64_t v21 = [v11 versionIdentifiers];
        uint64_t v22 = [v21 count];

        if (v22)
        {
          uint64_t v23 = v15 + 1;
          uint64_t v24 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -15);
          id v25 = dispatch_queue_create("com.apple.coreduetd.Migration", v24);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __93___DKCoreDataStorage_migratePersistentStoreAtURL_toManagedObjectModel_protectionClass_error___block_invoke;
          block[3] = &unk_1E560FD08;
          block[4] = v13;
          id v32 = v10;
          id v33 = v11;
          uint64_t v37 = v23;
          unint64_t v38 = v18;
          id v34 = v12;
          v35 = &v40;
          v36 = &v46;
          dispatch_async_and_wait(v25, block);

          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    v26 = (id *)(v41 + 5);
    id v30 = (id)v41[5];
    v27 = -[_DKCoreDataStorage autoMigratePersistentStoreAtURL:toManagedObjectModel:protectionClass:error:](v13, v10, v11, v12, &v30);
    objc_storeStrong(v26, v30);

    if (v27) {
      *((unsigned char *)v47 + 24) = 1;
    }
  }
LABEL_10:
  objc_sync_exit(v13);

  if (a6) {
    *a6 = (id) v41[5];
  }
  char v28 = *((unsigned char *)v47 + 24);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v28;
}

- (uint64_t)migratePersistentStoreAtURL:(void *)a3 toManagedObjectModel:(void *)a4 protectionClass:(unint64_t)a5 startVersion:(unint64_t)a6 endVersion:(void *)a7 error:
{
  *(void *)&v53[5] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v44 = a4;
  uint64_t v42 = v13;
  if (!a1)
  {
    uint64_t v38 = 0;
    goto LABEL_32;
  }
  if (a5 > a6)
  {
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown or illegal model version identifier(s): start:%lu end:%lu", a5, a6);
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    CFStringRef v51 = v15;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    id v18 = [v16 errorWithDomain:@"com.apple.coreduet.DKCoreDataStorage" code:1 userInfo:v17];

    char v19 = 0;
    if (a7) {
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  uint64_t v40 = a7;
  id v41 = v14;
  char v20 = 0;
  id v18 = 0;
  uint64_t v21 = a5;
  uint64_t v22 = a5;
  unint64_t v43 = a6;
  while (1)
  {
    uint64_t v23 = [a1 delegate];
    int v24 = [v23 coreDataStorage:a1 shouldCallDelegateAfterAutoMigrationToManagedObjectModelHavingVersion:v21];

    if (a6 != v21 && !v24) {
      goto LABEL_21;
    }
    uint64_t v25 = [a1 managedObjectModelForVersion:v21];
    if (!v25) {
      break;
    }
    v26 = (void *)v25;
    v27 = v13;
    char v28 = [a1 delegate];
    uint64_t v29 = v22;
    int v30 = [v28 coreDataStorage:a1 shouldCallDelegateBeforeAutoMigrationFromManagedObjectModelHavingVersion:v22];

    if (v30)
    {
      BOOL v31 = [a1 managedObjectModelForVersion:v29];
      uint64_t v32 = v29;
      if (!v31 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_DKCoreDataStorage migratePersistentStoreAtURL:toManagedObjectModel:protectionClass:startVersion:endVersion:error:](v52, v29, v53);
      }
      id v48 = v18;
      id v13 = v27;
      -[_DKCoreDataStorage willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:](a1, v27, v31, v32, &v48);
      id v33 = v48;

      id v18 = v33;
      uint64_t v45 = v21;
    }
    else
    {
      uint64_t v45 = v29;
      id v13 = v27;
    }
    id v47 = v18;
    id v34 = -[_DKCoreDataStorage autoMigratePersistentStoreAtURL:toManagedObjectModel:protectionClass:error:](a1, v13, v26, v44, &v47);
    id v35 = v47;

    a6 = v43;
    if (!v34)
    {

      id v18 = v35;
      goto LABEL_29;
    }
    if (v24)
    {
      v36 = [v34 persistentStores];
      uint64_t v37 = [v36 firstObject];

      id v46 = v35;
      LODWORD(v36) = -[_DKCoreDataStorage didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:](a1, v37, v26, v21, &v46);
      id v18 = v46;

      if (!v36)
      {

        goto LABEL_29;
      }
      id v13 = v42;
    }
    else
    {
      id v18 = v35;
    }

    uint64_t v22 = v45;
LABEL_21:
    if (a6 == v21) {
      char v20 = 1;
    }
    if (++v21 > a6) {
      goto LABEL_29;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[_DKCoreDataStorage migratePersistentStoreAtURL:toManagedObjectModel:protectionClass:startVersion:endVersion:error:](v21);
  }
LABEL_29:
  char v19 = v20;
  a7 = v40;
  id v14 = v41;
  if (v40) {
LABEL_30:
  }
    *a7 = v18;
LABEL_31:
  unsigned __int8 v49 = v19;

  uint64_t v38 = v49;
LABEL_32:

  return v38;
}

- (_BYTE)autoMigratePersistentStoreAtURL:(void *)a3 toManagedObjectModel:(void *)a4 protectionClass:(void *)a5 error:
{
  v19[6] = *(id *)MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    id v12 = (void *)MEMORY[0x192FB2F20]();
    id v13 = -[_DKCoreDataStorage _defaultOptionsForStoreWithProtectionClass:](a1, v11);
    id v14 = (unsigned char *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v10];
    a1 = v14;
    if (v14)
    {
      uint64_t v15 = *MEMORY[0x1E4F1BF70];
      v19[0] = 0;
      uint64_t v16 = [v14 addPersistentStoreWithType:v15 configuration:0 URL:v9 options:v13 error:v19];
      id v17 = v19[0];
      if (!v16)
      {

        uint64_t v16 = 0;
        a1 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }

    if (a5) {
      *a5 = v17;
    }
  }
  return a1;
}

- (uint64_t)willAutoMigrateStoreAtURL:(void *)a3 fromManagedObjectModel:(uint64_t)a4 havingVersion:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    id v11 = a1;
    objc_sync_enter(v11);
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v12) {
      -[_DKCoreDataStorage willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    char v20 = (void *)MEMORY[0x192FB2F20]();
    uint64_t v21 = [v11 delegate];
    id v33 = 0;
    uint64_t v22 = [v21 coreDataStorage:v11 willAutoMigrateStoreAtURL:v9 fromManagedObjectModel:v10 havingVersion:a4 error:&v33];
    id v23 = v33;

    if (v22)
    {
      BOOL v24 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v24) {
        -[_DKCoreDataStorage willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:](v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[_DKCoreDataStorage willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:]();
    }
    objc_sync_exit(v11);

    if (a5) {
      *a5 = v23;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (uint64_t)didAutoMigratePersistentStore:(void *)a3 toManagedObjectModel:(uint64_t)a4 havingVersion:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    id v11 = a1;
    objc_sync_enter(v11);
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v12) {
      -[_DKCoreDataStorage didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    char v20 = (void *)MEMORY[0x192FB2F20]();
    uint64_t v21 = [v11 delegate];
    id v33 = 0;
    uint64_t v22 = [v21 coreDataStorage:v11 didAutoMigratePersistentStore:v9 toManagedObjectModel:v10 havingVersion:a4 error:&v33];
    id v23 = v33;

    if (v22)
    {
      BOOL v24 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v24) {
        -[_DKCoreDataStorage didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:](v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[_DKCoreDataStorage didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:]();
    }
    objc_sync_exit(v11);

    if (a5) {
      *a5 = v23;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (_BYTE)_defaultOptionsForStoreWithProtectionClass:(unsigned char *)a1
{
  uint64_t v2 = a1;
  void v13[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v12[0] = *MEMORY[0x1E4F1BE50];
    id v3 = NSNumber;
    BOOL v4 = a1[67] == 0;
    id v5 = a2;
    id v6 = [v3 numberWithInt:v4];
    v13[0] = v6;
    v12[1] = *MEMORY[0x1E4F1BDE8];
    uint64_t v7 = [NSNumber numberWithInt:v2[67] == 0];
    uint64_t v8 = *MEMORY[0x1E4F1BEC0];
    v13[1] = v7;
    v13[2] = v5;
    uint64_t v9 = *MEMORY[0x1E4F1BF20];
    v12[2] = v8;
    v12[3] = v9;
    id v10 = [NSNumber numberWithBool:v2[67]];
    v13[3] = v10;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  }
  return v2;
}

- (id)_descriptionForStoreWithURL:(void *)a3 protectionClass:(int)a4 sync:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a1)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C190] persistentStoreDescriptionWithURL:a2];
    uint64_t v9 = -[_DKCoreDataStorage _defaultOptionsForStoreWithProtectionClass:]((unsigned char *)a1, v7);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v15 = [v9 objectForKeyedSubscript:v14];
          [v8 setOption:v15 forKey:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }
    [v8 setType:*MEMORY[0x1E4F1BF70]];
    if (a4)
    {
      uint64_t v16 = objc_opt_new();
      [v16 setUseZoneWidePCS:1];
      id v17 = objc_alloc_init(MEMORY[0x1E4F1C058]);
      [v17 setUseDeviceToDeviceEncryption:1];
      uint64_t v18 = NSNumber;
      uint64_t v19 = +[_DKSyncPolicy policy];
      char v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "assetThresholdInBytes"));
      [v17 setCkAssetThresholdBytes:v20];

      uint64_t v21 = +[_DKCloudUtilities containerIdentifier];
      [v17 setContainerIdentifier:v21];

      [v17 setContainerOptions:v16];
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1C050]) initWithOptions:v17];
      id v23 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v22;

      [v8 setOption:*(void *)(a1 + 56) forMirroringKey:*MEMORY[0x1E4F1BED0]];
      [v8 setConfiguration:@"CloudKit"];
    }
    else
    {
      [v8 setConfiguration:@"Local"];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)_addStoresToCoordinator:(void *)a3 protectionClass:(void *)a4 error:
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v10 = [*(id *)(a1 + 16) objectForKeyedSubscript:v8];
    uint64_t v11 = [v9 fileURLWithPath:v10];

    if (*(unsigned char *)(a1 + 68))
    {
      uint64_t v12 = -[_DKCoreDataStorage _defaultOptionsForStoreWithProtectionClass:]((unsigned char *)a1, v8);
      uint64_t v13 = *MEMORY[0x1E4F1BF70];
      id v85 = 0;
      uint64_t v14 = [v7 addPersistentStoreWithType:v13 configuration:0 URL:v11 options:v12 error:&v85];
      id v15 = v85;

      if (v14) {
        BOOL v16 = v15 == 0;
      }
      else {
        BOOL v16 = 0;
      }
      a1 = v16;
      if (a4 && (a1 & 1) == 0) {
        *a4 = v15;
      }

      goto LABEL_41;
    }
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__19;
    v83 = __Block_byref_object_dispose__19;
    id v84 = 0;
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x2020000000;
    char v78 = 1;
    id v17 = dispatch_group_create();
    if (*(unsigned char *)(a1 + 69))
    {
      if (v11)
      {
        uint64_t v18 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:].cold.7();
        }

        dispatch_group_enter(v17);
        uint64_t v19 = -[_DKCoreDataStorage _descriptionForStoreWithURL:protectionClass:sync:](a1, (uint64_t)v11, v8, 1);
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke_75;
        v67[3] = &unk_1E560FD30;
        v69 = &v75;
        v70 = &v79;
        v68 = v17;
        [v7 addPersistentStoreWithDescription:v19 completionHandler:v67];
        char v20 = v68;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:].cold.6();
        }
        *((unsigned char *)v76 + 24) = 0;
        id v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v86 = *MEMORY[0x1E4F28568];
        v87[0] = @"Unsupported protection class.";
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:&v86 count:1];
        uint64_t v40 = [v39 errorWithDomain:@"com.apple.coreduet" code:0 userInfo:v19];
        char v20 = v80[5];
        v80[5] = v40;
      }

      if (dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL))
      {
        BOOL v41 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v41) {
          -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:](v41, v42, v43, v44, v45, v46, v47, v48);
        }
LABEL_30:
        a1 = 0;
LABEL_40:

        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(&v79, 8);

LABEL_41:
        goto LABEL_42;
      }
      BOOL v49 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v49) {
        -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:].cold.4(v49, v50, v51, v52, v53, v54, v55, v56);
      }
    }
    else
    {
      BOOL v21 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v21) {
        -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:](v21, v22, v23, v24, v25, v26, v27, v28);
      }
      dispatch_group_enter(v17);
      uint64_t v29 = -[_DKCoreDataStorage _descriptionForStoreWithURL:protectionClass:sync:](a1, (uint64_t)v11, v8, 0);
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __68___DKCoreDataStorage__addStoresToCoordinator_protectionClass_error___block_invoke;
      v71[3] = &unk_1E560FD30;
      v73 = &v75;
      v74 = &v79;
      uint64_t v30 = v17;
      v72 = v30;
      [v7 addPersistentStoreWithDescription:v29 completionHandler:v71];
      if (dispatch_group_wait(v30, 0xFFFFFFFFFFFFFFFFLL))
      {
        BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v31) {
          -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:](v31, v32, v33, v34, v35, v36, v37, v38);
        }

        goto LABEL_30;
      }
      BOOL v57 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v57) {
        -[_DKCoreDataStorage _addStoresToCoordinator:protectionClass:error:](v57, v58, v59, v60, v61, v62, v63, v64);
      }
    }
    if (a4)
    {
      v65 = (void *)v80[5];
      if (v65) {
        *a4 = v65;
      }
    }
    a1 = *((unsigned char *)v76 + 24) != 0;
    goto LABEL_40;
  }
LABEL_42:

  return a1;
}

- (BOOL)isManagedObjectContextFor:(id)a3 equalToManagedObjectContext:(id)a4
{
  id v6 = a4;
  -[_DKCoreDataStorage managedObjectContextForKey:]((id *)&self->super.isa, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  return v7 == v6;
}

- (BOOL)confirmDatabaseConnectionFor:(id)a3
{
  id v3 = [(_DKCoreDataStorage *)self managedObjectContextFor:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (unint64_t)countObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 includeSubentities:(BOOL)a6 includePendingChanges:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__19;
  uint64_t v34 = __Block_byref_object_dispose__19;
  id v35 = 0;
  kdebug_trace();
  _cdknowledge_signpost_count_begin(v12);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  BOOL v21 = __106___DKCoreDataStorage_countObjectsInContext_entityName_predicate_includeSubentities_includePendingChanges___block_invoke;
  uint64_t v22 = &unk_1E560FD80;
  id v14 = v12;
  id v23 = v14;
  id v15 = v11;
  id v24 = v15;
  BOOL v28 = a6;
  BOOL v29 = a7;
  id v16 = v13;
  id v25 = v16;
  uint64_t v26 = &v36;
  uint64_t v27 = &v30;
  [v15 performWithOptions:4 andBlock:&v19];
  objc_msgSend((id)v31[5], "code", v19, v20, v21, v22);
  kdebug_trace();
  _cdknowledge_signpost_count_end(v37[3], [(id)v31[5] code]);
  unint64_t v17 = v37[3];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v17;
}

+ (unint64_t)deleteObjectsIfNeededToLimitTotal:(unint64_t)a3 context:(id)a4 entityName:(id)a5 predicate:(id)a6 sortDescriptors:(id)a7 fetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 includePendingChanges:(BOOL)a10
{
  return +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchOffset:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchOffset:fetchLimit:includeSubentities:includePendingChanges:", a4, a5, a6, a7, a3, a8);
}

+ (unint64_t)deleteOrphanedEntitiesInContext:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v3 predicateWithFormat:@"ANY event == NULL"];
  LOBYTE(v11) = 1;
  unint64_t v6 = +[_DKCoreDataStorage deleteObjectsInContext:v4 entityName:@"StructuredMetadata" predicate:v5 sortDescriptors:0 fetchLimit:0 includeSubentities:0 includePendingChanges:v11];
  LOBYTE(v12) = 1;
  unint64_t v7 = +[_DKCoreDataStorage deleteObjectsInContext:v4 entityName:@"CustomMetadata" predicate:v5 sortDescriptors:0 fetchLimit:0 includeSubentities:0 includePendingChanges:v12]+ v6;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY product == NULL"];
  LOBYTE(v13) = 1;
  unint64_t v9 = +[_DKCoreDataStorage deleteObjectsInContext:v4 entityName:@"Source" predicate:v8 sortDescriptors:0 fetchLimit:0 includeSubentities:0 includePendingChanges:v13];

  return v7 + v9;
}

- (BOOL)_deleteDatabaseFiles:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(void **)(a1 + 48);
    id v4 = a2;
    [v3 removeItemAtPath:v4 error:0];
    id v5 = *(void **)(a1 + 48);
    unint64_t v6 = [NSString stringWithFormat:@"%@-wal", v4];
    [v5 removeItemAtPath:v6 error:0];

    unint64_t v7 = *(void **)(a1 + 48);
    id v8 = [NSString stringWithFormat:@"%@-shm", v4];

    [v7 removeItemAtPath:v8 error:0];
  }
  return a1 != 0;
}

- (BOOL)deleteStorageFor:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isDatabaseManager)
  {
    id v5 = self;
    objc_sync_enter(v5);
    unint64_t v6 = -[_DKCoreDataStorage databasePathFor:]((id *)&v5->super.isa, (uint64_t)v4);
    unint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    unint64_t v9 = [v7 path];
    char v10 = [v8 fileExistsAtPath:v9];

    if (v10)
    {
      uint64_t v11 = [(NSMutableDictionary *)v5->_persistentStoreCoordinators objectForKeyedSubscript:v4];
      if (!v11)
      {
        uint64_t v12 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[_DKCoreDataStorage deleteStorageFor:]();
        }

        id v13 = objc_alloc(MEMORY[0x1E4F1C188]);
        id v14 = [(_DKCoreDataStorage *)v5 managedObjectModel];
        uint64_t v11 = [v13 initWithManagedObjectModel:v14];
      }
      uint64_t v15 = *MEMORY[0x1E4F1BF70];
      id v23 = 0;
      char v16 = [v11 destroyPersistentStoreAtURL:v7 withType:v15 options:0 error:&v23];
      id v17 = v23;
      if (v16)
      {
        uint64_t v18 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v25 = v6;
          __int16 v26 = 2112;
          id v27 = v4;
          _os_log_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_DEFAULT, "Succesfully truncated data storage in %@ for protection class %@.", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v18 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v25 = v6;
          __int16 v26 = 2112;
          id v27 = v4;
          __int16 v28 = 2112;
          id v29 = v17;
          _os_log_fault_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_FAULT, "Failed to truncate data storage in %@ for protection class %@: %@", buf, 0x20u);
        }
      }

      -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](v5, v4);
      if (v17) {
        -[_DKCoreDataStorage _deleteDatabaseFiles:]((uint64_t)v5, v6);
      }
    }
    else
    {
      uint64_t v11 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_DEFAULT, "-deleteStorageFor: called on non-existent storage.", buf, 2u);
      }
    }

    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v19 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_DKCoreDataStorage deleteStorageFor:]();
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v21 = (const __CFString *)-[_DKCoreDataStorage clientNeedsHelpNotification]((id *)&self->super.isa);
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v21, 0, 0, 1u);
  }

  return 1;
}

- (id)copyStorageFor:(id)a3 toDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_DKCoreDataStorage *)self managedObjectContextFor:v6];
  if (v8)
  {
    unint64_t v9 = [[_DKCoreDataStorage alloc] initWithDirectory:v7 databaseName:self->_databaseName modelURL:self->_modelURL readOnly:0 localOnly:self->_localOnly];
    char v10 = [(_DKCoreDataStorage *)v9 managedObjectContextFor:v6];

    if (v10)
    {
      -[_DKCoreDataStorage invalidateManagedObjectContextAndPersistentStoreCoordinatorFor:](v9, v6);
      uint64_t v21 = 0;
      uint64_t v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __49___DKCoreDataStorage_copyStorageFor_toDirectory___block_invoke;
      v15[3] = &unk_1E560FDA8;
      id v16 = v8;
      id v17 = self;
      id v18 = v6;
      uint64_t v11 = v9;
      uint64_t v19 = v11;
      uint64_t v20 = &v21;
      [v16 performWithOptions:4 andBlock:v15];
      if (*((unsigned char *)v22 + 24)) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v12;

      _Block_object_dispose(&v21, 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_DKCoreDataStorage copyStorageFor:toDirectory:]();
      }
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (unint64_t)updateObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 batchFetchLimit:(unint64_t)a7 totalFetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 updateBlock:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke;
  v27[3] = &unk_1E560FDD0;
  id v20 = v15;
  id v28 = v20;
  id v21 = v16;
  id v29 = v21;
  unint64_t v34 = a8;
  unint64_t v35 = a7;
  BOOL v36 = a9;
  id v22 = v17;
  id v30 = v22;
  id v23 = v18;
  id v31 = v23;
  id v24 = v19;
  id v32 = v24;
  uint64_t v33 = &v37;
  [v20 performWithOptions:4 andBlock:v27];
  unint64_t v25 = v38[3];

  _Block_object_dispose(&v37, 8);
  return v25;
}

+ (id)anonymizeString:(void *)a3 withSalt:
{
  id v4 = a3;
  id v5 = a2;
  self;
  id v6 = [NSString stringWithFormat:@"%@-%@", v5, v4];

  id v7 = NSString;
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  unint64_t v9 = [v7 stringWithFormat:@"%@", v8];

  return v9;
}

+ (unint64_t)anonymizeStringAttributesOfManagedObject:(id)a3 withSalt:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v34 = a4;
  id v29 = [v5 entity];
  id v6 = [v29 attributesByName];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v36;
    id v30 = v5;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v13 = [v6 objectForKeyedSubscript:v12];
        id v14 = [v13 attributeValueClassName];
        int v15 = [v14 isEqualToString:@"NSString"];

        if (v15)
        {
          id v16 = [v5 valueForKey:v12];
          id v17 = v16;
          if (v16 && [v16 length])
          {
            id v18 = +[_DKCoreDataStorage anonymizeString:withSalt:]((uint64_t)a1, v17, v34);
            [v5 setValue:v18 forKey:v12];

            ++v9;
          }
        }
        else
        {
          id v19 = [v13 attributeValueClassName];
          int v20 = [v19 isEqualToString:@"NSURL"];

          if (!v20) {
            goto LABEL_17;
          }
          id v21 = [v5 valueForKey:v12];
          id v17 = v21;
          if (v21)
          {
            uint64_t v22 = [v21 absoluteString];
            if (v22)
            {
              id v23 = (void *)v22;
              unint64_t v32 = v9;
              id v24 = [v17 absoluteString];
              uint64_t v25 = [v24 length];

              if (v25)
              {
                id v31 = [v17 absoluteString];
                __int16 v26 = +[_DKCoreDataStorage anonymizeString:withSalt:]((uint64_t)a1, v31, v34);
                id v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v26];
                id v5 = v30;
                [v30 setValue:v27 forKey:v12];

                unint64_t v9 = v32 + 1;
              }
              else
              {
                id v5 = v30;
                unint64_t v9 = v32;
              }
            }
          }
        }

LABEL_17:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (!v8) {
        goto LABEL_21;
      }
    }
  }
  unint64_t v9 = 0;
LABEL_21:

  return v9;
}

+ (unint64_t)anonymizeObjectStringsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 batchFetchLimit:(unint64_t)a7 totalFetchLimit:(unint64_t)a8 includeSubentities:(BOOL)a9 salt:(id)a10
{
  id v16 = a10;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __147___DKCoreDataStorage_anonymizeObjectStringsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_salt___block_invoke;
  v26[3] = &unk_1E560FDF8;
  id v27 = v16;
  id v17 = v16;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  uint64_t v22 = (void *)MEMORY[0x192FB31A0](v26);
  LOBYTE(v25) = a9;
  unint64_t v23 = +[_DKCoreDataStorage updateObjectsInContext:v21 entityName:v20 predicate:v19 sortDescriptors:v18 batchFetchLimit:a7 totalFetchLimit:a8 includeSubentities:v25 updateBlock:v22];

  return v23;
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (BOOL)localOnly
{
  return self->_localOnly;
}

- (BOOL)sync
{
  return self->_sync;
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)databaseName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (_DKCoreDataStorageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_DKCoreDataStorageDelegate *)WeakRetained;
}

- (NSCloudKitMirroringDelegate)mirroringDelegate
{
  return (NSCloudKitMirroringDelegate *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)requiresManualMigration
{
  return self->_requiresManualMigration;
}

- (void)initWithDirectory:databaseName:modelURL:readOnly:localOnly:sync:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_FAULT, "Client is not entitled for direct CoreDuet database access.", v1, 2u);
}

- (void)handleDataProtectionChangeFor:willBeAvailable:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 1024;
  int v3 = v0;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Data protection availability changed for %@ to %d", v1, 0x12u);
}

- (void)handleDatabaseErrors:(uint64_t)a3 forProtectionClass:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removePersistentStoresInCoordinator:(void *)a3 .cold.1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error removing persistent store: %@", buf, 0xCu);
}

- (void)managedObjectModel
{
}

- (void)managedObjectModelForVersion:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Unable to load model: '%@'", v0, 0xCu);
}

- (void)migratePersistentStoreAtURL:(uint64_t)a1 toManagedObjectModel:protectionClass:startVersion:endVersion:error:.cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v2, "Failed to find model version %@, unable to migrate", v3, v4, v5, v6, v7);
}

- (void)migratePersistentStoreAtURL:(void *)a3 toManagedObjectModel:protectionClass:startVersion:endVersion:error:.cold.2(uint8_t *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to find model version %@, will attempt to recover...", a1, 0xCu);
}

- (void)autoMigratePersistentStoreAtURL:(void *)a1 toManagedObjectModel:(uint8_t *)buf protectionClass:error:.cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Caught exception during migration: %@", buf, 0xCu);
}

- (void)willAutoMigrateStoreAtURL:(uint64_t)a3 fromManagedObjectModel:(uint64_t)a4 havingVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Failed to set up database for migration: %@", v1, v2, v3, v4, v5);
}

- (void)willAutoMigrateStoreAtURL:(uint64_t)a3 fromManagedObjectModel:(uint64_t)a4 havingVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)didAutoMigratePersistentStore:(uint64_t)a3 toManagedObjectModel:(uint64_t)a4 havingVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Failed to migrate database: %@", v1, v2, v3, v4, v5);
}

- (void)didAutoMigratePersistentStore:(uint64_t)a3 toManagedObjectModel:(uint64_t)a4 havingVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addStoresToCoordinator:(uint64_t)a3 protectionClass:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addStoresToCoordinator:(uint64_t)a3 protectionClass:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addStoresToCoordinator:(uint64_t)a3 protectionClass:(uint64_t)a4 error:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addStoresToCoordinator:(uint64_t)a3 protectionClass:(uint64_t)a4 error:(uint64_t)a5 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addStoresToCoordinator:protectionClass:error:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Unsupported protection class: %@", v1, v2, v3, v4, v5);
}

- (void)_addStoresToCoordinator:protectionClass:error:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Starting sync store setup.", v2, v3, v4, v5, v6);
}

- (void)persistentStoreCoordinatorFor:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Failed to load Managed Object Model from %@", v1, v2, v3, v4, v5);
}

- (void)persistentStoreCoordinatorFor:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Failed to add persistent stores: %@", v1, v2, v3, v4, v5);
}

- (void)persistentStoreCoordinatorFor:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Non-priveleged client found un-migrated database.", v2, v3, v4, v5, v6);
}

- (void)persistentStoreCoordinatorFor:.cold.4()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failure migrating store %@: %@. Attempting to delete to recover.", v0, 0x16u);
}

- (void)persistentStoreCoordinatorFor:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Non-priveleged client encountered knowledge directory without data vault, calling out for help.", v2, v3, v4, v5, v6);
}

- (void)persistentStoreCoordinatorFor:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Non-priveleged client encountered knowledge directory with data vault where it shouldn't be, calling out for help.", v2, v3, v4, v5, v6);
}

- (void)persistentStoreCoordinatorFor:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Directory could not be created: %@", v1, v2, v3, v4, v5);
}

- (void)persistentStoreCoordinatorFor:.cold.8()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_5(&dword_18ECEB000, v0, v1, "Error trying to delete datavault at %@: %@");
}

- (void)persistentStoreCoordinatorFor:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Non-priveleged client unable to find knowledge directory, calling out for help.", v2, v3, v4, v5, v6);
}

- (void)persistentStoreCoordinatorFor:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Directory does not exist and could not be created: %@", v1, v2, v3, v4, v5);
}

- (void)persistentStoreCoordinatorFor:(int)a3 .cold.11(int *a1, uint8_t *buf, int a3)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v3;
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Datavault does not exist and could not be created. Status: %d; errno: %d",
    buf,
    0xEu);
}

- (void)persistentStoreCoordinatorFor:.cold.12()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Storage directory %@ does not appear to exist.", v2, v3, v4, v5, v6);
}

- (void)deleteStorageFor:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Non-priveleged client encountered fatal database error.", v2, v3, v4, v5, v6);
}

- (void)deleteStorageFor:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Creating shell PSC to truncate storage.", v2, v3, v4, v5, v6);
}

- (void)copyStorageFor:toDirectory:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create data storage in %@ for protection class %@\n", v0, 0x16u);
}

@end