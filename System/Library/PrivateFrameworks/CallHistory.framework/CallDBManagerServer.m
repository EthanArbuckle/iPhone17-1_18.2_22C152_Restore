@interface CallDBManagerServer
+ (id)downgradeDatabaseAtLocation:(id)a3 toVersion:(int64_t)a4;
+ (id)getDestinationModel:(int64_t)a3;
+ (id)getDestinationModelForVersion:(int64_t)a3;
+ (id)getObjectIdsForAllRecords:(id)a3;
+ (id)getObjectIdsForDuplicateRecordsWithUniqueIds:(id)a3 andHavingObjectIds:(id)a4;
+ (id)getUniqueIdsForAllRecords:(id)a3;
+ (int64_t)getNextVersionToDowngradeTo:(int64_t)a3;
+ (int64_t)getNextVersionToDowngradeTo:(int64_t)a3 withSourceVersion:(int64_t)a4;
+ (int64_t)getNextVersionToMigrateToCurrentVersion:(int64_t)a3;
- (BOOL)bootUpDBAtLocation:(id)a3 isEncrypted:(BOOL)a4;
- (BOOL)bootUpDBAtLocationWithRecovery:(id)a3 isEncrypted:(BOOL)a4;
- (BOOL)createCallDBProperties;
- (BOOL)dbShouldBePrunedForVersion:(int64_t)a3;
- (BOOL)handleBootUpFailure:(id)a3;
- (BOOL)handleDatabaseMigration:(id)a3 isEncrypted:(BOOL)a4 isRetry:(BOOL)a5;
- (BOOL)removeDuplicatesFromDBAtLocation:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5;
- (CHFeatureFlags)featureFlags;
- (CallDBManagerServer)init;
- (CallDBManagerServer)initWithDeviceObserver:(id)a3;
- (id)createMOCForDBAtLocation:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5;
- (id)getUUIDsOfNMostRecentRecords:(unint64_t)a3 fromManagedObjectContext:(id)a4;
- (id)permDBLocation:(unsigned __int8 *)a3;
- (id)tempDBLocation:(unsigned __int8 *)a3;
- (id)uniqueIDsFromCallRecords:(id)a3 forFaceTimeCalls:(BOOL)a4;
- (id)uniqueIDsOfCallsToKeepFromManagedObjectContext:(id)a3 forFaceTimeCalls:(BOOL)a4;
- (void)createCallDBProperties;
- (void)createPermanent;
- (void)createTemporary;
- (void)deleteObjectsWithPredicate:(id)a3 fromManagedObjectContext:(id)a4;
- (void)modifyCallRecordForDBAtLocation:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5 modifyCallRecord:(id)a6;
- (void)moveCallsFromTempDatabase;
- (void)populateHandleType:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5;
- (void)populateRecentCallRemoteParticipantHandles:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5;
- (void)populateServiceProviderAndCallCategory:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5;
- (void)prepareDatabaseForNextStepInMigration:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5;
- (void)prepareForMigrationDBAtURL:(id)a3 withModelAtURL:(id)a4 andIsEncrypted:(BOOL)a5;
- (void)pruneDBFromManagedContext:(id)a3 version:(unint64_t)a4;
@end

@implementation CallDBManagerServer

+ (id)getDestinationModelForVersion:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [v3 stringWithFormat:@"%@.%@/%@ %@", @"CallHistory", @"momd", @"CallHistory", v4];

  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 URLForResource:v5 withExtension:@"mom"];

  v8 = +[CHLogServer sharedInstance];
  v9 = [v8 logHandleForDomain:"ch.calldbm"];

  v10 = v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v7 path];
    *(_DWORD *)buf = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Got destination model URL %{public}@", buf, 0xCu);
  }
  return v7;
}

+ (int64_t)getNextVersionToMigrateToCurrentVersion:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) >= 0x21) {
    v3 = &kCHUnknownDBVersion;
  }
  else {
    v3 = (int64_t *)((char *)&unk_1B8E8BF08 + 8 * a3 - 40);
  }
  return *v3;
}

+ (int64_t)getNextVersionToDowngradeTo:(int64_t)a3
{
  if ((unint64_t)(a3 - 8) > 0x1D) {
    return 5;
  }
  else {
    return qword_1B8E8C010[a3 - 8];
  }
}

+ (int64_t)getNextVersionToDowngradeTo:(int64_t)a3 withSourceVersion:(int64_t)a4
{
  if (a4 == a3) {
    return a4;
  }
  else {
    return +[CallDBManagerServer getNextVersionToDowngradeTo:a4];
  }
}

+ (id)getDestinationModel:(int64_t)a3
{
  int64_t v4 = +[CallDBManagerServer getNextVersionToMigrateToCurrentVersion:a3];
  return (id)[a1 getDestinationModelForVersion:v4];
}

+ (id)downgradeDatabaseAtLocation:(id)a3 toVersion:(int64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__CallDBManagerServer_downgradeDatabaseAtLocation_toVersion___block_invoke;
  v6[3] = &__block_descriptor_40_e15___NSURL_16__0q8l;
  v6[4] = a4;
  int64_t v4 = +[DBManager migrateDataStoreAtLocation:a3 withGetDestinationModel:v6 isEncrypted:0];
  return v4;
}

id __61__CallDBManagerServer_downgradeDatabaseAtLocation_toVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  int64_t v2 = +[CallDBManagerServer getNextVersionToDowngradeTo:*(void *)(a1 + 32) withSourceVersion:a2];
  return +[CallDBManagerServer getDestinationModelForVersion:v2];
}

- (CallDBManagerServer)init
{
  v3 = objc_alloc_init(CHDeviceObserver);
  int64_t v4 = [(CallDBManagerServer *)self initWithDeviceObserver:v3];

  return v4;
}

- (CallDBManagerServer)initWithDeviceObserver:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CallDBManagerServer;
  v3 = [(CallDBManager *)&v7 initWithDeviceObserver:a3];
  if (v3)
  {
    int64_t v4 = objc_alloc_init(CHFeatureFlags);
    featureFlags = v3->_featureFlags;
    v3->_featureFlags = v4;
  }
  return v3;
}

- (void)createPermanent
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(CallDBManagerServer *)self permDBLocation:0];
  uint64_t v4 = 37;
  v5 = +[CHLogServer sharedInstance];
  v6 = [v5 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    v13 = v3;
    __int16 v14 = 2048;
    uint64_t v15 = 37;
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "Creating permanent data store: %{public}@ for version: %ld", (uint8_t *)&v12, 0x16u);
  }

  if ([(CallDBManagerServer *)self bootUpDBAtLocationWithRecovery:v3 isEncrypted:1])
  {
    [(CallDBManager *)self handlePermanentCreated];
    if (![(CallDBManagerServer *)self createCallDBProperties])
    {
      objc_super v7 = +[CHLogServer sharedInstance];
      v8 = [v7 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create call db properties object for permanent store", (uint8_t *)&v12, 2u);
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  v9 = [CallDBMetaInfo alloc];
  v10 = [v3 URLByDeletingLastPathComponent];
  v11 = [(CallDBMetaInfo *)v9 initWithURL:v10];

  [(CallDBMetaInfo *)v11 writeDatabaseVersion:v4 isTemp:0];
}

- (void)createTemporary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(CallDBManagerServer *)self tempDBLocation:0];
  uint64_t v4 = +[CHLogServer sharedInstance];
  v5 = [v4 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = v3;
    _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "Creating temporary data store: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  if ([(CallDBManagerServer *)self bootUpDBAtLocationWithRecovery:v3 isEncrypted:0])
  {
    uint64_t v6 = 37;
    [(CallDBManager *)self handleTemporaryCreated];
    if (![(CallDBManagerServer *)self createCallDBProperties])
    {
      objc_super v7 = +[CHLogServer sharedInstance];
      v8 = [v7 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create call db properties object for temporary store", (uint8_t *)&v12, 2u);
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v9 = [CallDBMetaInfo alloc];
  v10 = [v3 URLByDeletingLastPathComponent];
  v11 = [(CallDBMetaInfo *)v9 initWithURL:v10];

  [(CallDBMetaInfo *)v11 writeDatabaseVersion:v6 isTemp:1];
}

- (id)tempDBLocation:(unsigned __int8 *)a3
{
  return +[CallDBManager getDBLocationIsSandboxed:0 isTemporary:1 error:a3];
}

- (id)permDBLocation:(unsigned __int8 *)a3
{
  return +[CallDBManager getDBLocationIsSandboxed:0 isTemporary:0 error:a3];
}

- (void)moveCallsFromTempDatabase
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"kMoveCallRecordsFromTemporaryStoreNotitification" object:self];
}

- (BOOL)bootUpDBAtLocationWithRecovery:(id)a3 isEncrypted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(CallDBManagerServer *)self bootUpDBAtLocation:v6 isEncrypted:v4])
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v8 = [(CallDBManagerServer *)self handleBootUpFailure:v6];
    v9 = +[CHLogServer sharedInstance];
    v10 = [v9 logHandleForDomain:"ch.calldbm"];

    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v11) {
        -[CallDBManagerServer bootUpDBAtLocationWithRecovery:isEncrypted:]();
      }

      BOOL v7 = [(CallDBManagerServer *)self bootUpDBAtLocation:v6 isEncrypted:v4];
    }
    else
    {
      if (v11) {
        -[CallDBManagerServer bootUpDBAtLocationWithRecovery:isEncrypted:]();
      }

      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)handleBootUpFailure:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 URLByAppendingPathExtension:@"backup"];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v4 path];
  int v7 = [v5 fileExistsAtPath:v6];

  BOOL v8 = (!v7
     || +[DBManager destroyDBAtLocation:withModelAtLocation:](DBManager, "destroyDBAtLocation:withModelAtLocation:", v4, 0))&& +[DBManager moveDBAtLocation:toLocation:withModelAtLocation:](DBManager, "moveDBAtLocation:toLocation:withModelAtLocation:", v3, v4, 0)&& +[DBManager destroyDBAtLocation:v3 withModelAtLocation:0];

  return v8;
}

+ (id)getObjectIdsForDuplicateRecordsWithUniqueIds:(id)a3 andHavingObjectIds:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  if (v7 == [v5 count])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      int v12 = 0;
      uint64_t v13 = *(void *)v22;
      uint64_t v14 = -1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v16, "length", (void)v21))
          {
            if ([v16 isEqualToString:v12])
            {
              v17 = [v6 objectAtIndex:v14 + i + 1];
              [v8 addObject:v17];
            }
            else
            {
              v18 = v16;
              v17 = v12;
              int v12 = v18;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        v14 += i;
      }
      while (v11);
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    v19 = +[CHLogServer sharedInstance];
    int v12 = [v19 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CallDBManagerServer getObjectIdsForDuplicateRecordsWithUniqueIds:andHavingObjectIds:]();
    }
    id v8 = 0;
  }

  return v8;
}

+ (id)getUniqueIdsForAllRecords:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CallRecord"];
  [v4 setResultType:2];
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"unique_id" ascending:1];
  uint64_t v7 = objc_msgSend(v5, "arrayWithObjects:", v6, 0);
  [v4 setSortDescriptors:v7];

  v20 = +[DBManager entityDescriptionHavingName:@"CallRecord" forContext:v3];
  id v8 = [v20 propertiesByName];
  id v9 = [v8 objectForKey:@"unique_id"];

  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v9, 0);
  [v4 setPropertiesToFetch:v10];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v12 = [v3 executeFetchRequest:v4 error:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectForKey:@"unique_id"];
        if (v17) {
          v18 = (__CFString *)v17;
        }
        else {
          v18 = &stru_1F129F488;
        }
        [v11 addObject:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)getObjectIdsForAllRecords:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = a3;
  id v5 = [v3 fetchRequestWithEntityName:@"CallRecord"];
  id v6 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"unique_id" ascending:1];
  id v8 = objc_msgSend(v6, "arrayWithObjects:", v7, 0);
  [v5 setSortDescriptors:v8];

  [v5 setResultType:1];
  id v9 = [v4 executeFetchRequest:v5 error:0];

  return v9;
}

- (id)createMOCForDBAtLocation:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = +[CallDBManagerServer getDestinationModelForVersion:a4];
  id v9 = +[DBManager instanceWithModelURL:v8];
  if ([v9 addDataStoreAtLocation:v7 isEncrypted:v5])
  {
    uint64_t v10 = [v9 createManagedObjectContext];
    id v11 = v10;
    if (v10)
    {
      id v11 = v10;
      int v12 = v11;
    }
    else
    {
      uint64_t v14 = +[CHLogServer sharedInstance];
      uint64_t v15 = [v14 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:]();
      }

      int v12 = 0;
    }
  }
  else
  {
    uint64_t v13 = +[CHLogServer sharedInstance];
    id v11 = [v13 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:]();
    }
    int v12 = 0;
  }

  return v12;
}

- (BOOL)removeDuplicatesFromDBAtLocation:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = +[CHLogServer sharedInstance];
  uint64_t v10 = [v9 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Removing the records with duplicate unique ids", buf, 2u);
  }

  id v11 = [(CallDBManagerServer *)self createMOCForDBAtLocation:v8 dbVersion:a4 isEncrypted:v5];

  if (v11)
  {
    int v12 = +[CallDBManagerServer getUniqueIdsForAllRecords:v11];
    uint64_t v13 = +[CallDBManagerServer getObjectIdsForAllRecords:v11];
    uint64_t v14 = +[CallDBManagerServer getObjectIdsForDuplicateRecordsWithUniqueIds:v12 andHavingObjectIds:v13];
    if ([v14 count])
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1C018]) initWithObjectIDs:v14];
      [v15 setResultType:2];
      id v25 = 0;
      uint64_t v16 = [v11 executeRequest:v15 error:&v25];
      id v17 = v25;
      BOOL v18 = v17 == 0;
      v19 = +[CHLogServer sharedInstance];
      v20 = [v19 logHandleForDomain:"ch.calldbm"];

      if (v17)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CallDBManagerServer removeDuplicatesFromDBAtLocation:dbVersion:isEncrypted:]();
        }
      }
      else
      {
        long long v22 = v20;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          long long v24 = [v16 result];
          *(_DWORD *)buf = 138543362;
          v27 = v24;
          _os_log_impl(&dword_1B8E4A000, v22, OS_LOG_TYPE_DEFAULT, "Number of records deleted: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      long long v21 = +[CHLogServer sharedInstance];
      uint64_t v15 = [v21 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E4A000, v15, OS_LOG_TYPE_DEFAULT, "There exist no duplicate records in the database", buf, 2u);
      }
      BOOL v18 = 1;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)modifyCallRecordForDBAtLocation:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5 modifyCallRecord:(id)a6
{
  BOOL v6 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void (**)(id, void))a6;
  id v11 = [(CallDBManagerServer *)self createMOCForDBAtLocation:a3 dbVersion:a4 isEncrypted:v6];
  if (v11)
  {
    int v12 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CallRecord"];
    id v30 = 0;
    uint64_t v13 = [v11 executeFetchRequest:v12 error:&v30];
    id v14 = v30;
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = +[CHLogServer sharedInstance];
      id v17 = [v16 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CallDBManagerServer modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:]();
      }
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v18 = v13;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v27;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v27 != v21) {
              objc_enumerationMutation(v18);
            }
            v10[2](v10, *(void *)(*((void *)&v26 + 1) + 8 * v22++));
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v20);
      }

      id v25 = 0;
      char v23 = [v11 save:&v25];
      id v15 = v25;
      if (v23) {
        goto LABEL_16;
      }
      long long v24 = +[CHLogServer sharedInstance];
      id v17 = [v24 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CallDBManagerServer modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:]();
      }
    }

LABEL_16:
  }
}

- (void)populateServiceProviderAndCallCategory:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = +[CHLogServer sharedInstance];
  uint64_t v10 = [v9 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Populating service provider and call category information", v11, 2u);
  }

  [(CallDBManagerServer *)self modifyCallRecordForDBAtLocation:v8 dbVersion:a4 isEncrypted:v5 modifyCallRecord:&__block_literal_global_10];
}

void __84__CallDBManagerServer_populateServiceProviderAndCallCategory_dbVersion_isEncrypted___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 calltype];
  uint64_t v4 = [v3 integerValue];

  BOOL v5 = +[CHRecentCall serviceProviderForCallType:v4];
  objc_msgSend(v2, "setService_provider:", v5);

  objc_msgSend(NSNumber, "numberWithInteger:", +[CHRecentCall categoryForCallType:](CHRecentCall, "categoryForCallType:", v4));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCall_category:", v6);
}

- (void)populateRecentCallRemoteParticipantHandles:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = +[CHLogServer sharedInstance];
  uint64_t v10 = [v9 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Populating remote participant handles", v11, 2u);
  }

  [(CallDBManagerServer *)self modifyCallRecordForDBAtLocation:v8 dbVersion:a4 isEncrypted:v5 modifyCallRecord:&__block_literal_global_39];
}

void __88__CallDBManagerServer_populateRecentCallRemoteParticipantHandles_dbVersion_isEncrypted___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v2 = [v14 address];
  id v3 = objc_msgSend(v14, "handle_type");
  uint64_t v4 = [v3 integerValue];

  if (v4 && v2)
  {
    if (v4 == 2)
    {
      BOOL v5 = [CHPhoneNumber alloc];
      id v6 = objc_msgSend(v14, "iso_country_code");
      id v7 = [(CHPhoneNumber *)v5 initWithDigits:v2 isoCountryCode:v6];

      id v8 = [(CHPhoneNumber *)v7 normalizedRepresentation];
    }
    else
    {
      id v8 = 0;
    }
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = [[CHHandle alloc] initWithType:v4 value:v2 normalizedValue:v8];
    id v11 = [v9 setWithObject:v10];

    int v12 = [v14 managedObjectContext];
    uint64_t v13 = +[CHManagedHandle managedHandlesForHandles:v11 inManagedObjectContext:v12];
    [v14 setRemoteParticipantHandles:v13];
  }
}

- (void)populateHandleType:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = +[CHLogServer sharedInstance];
  uint64_t v10 = [v9 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Populating handle type", v11, 2u);
  }

  [(CallDBManagerServer *)self modifyCallRecordForDBAtLocation:v8 dbVersion:a4 isEncrypted:v5 modifyCallRecord:&__block_literal_global_45];
}

void __64__CallDBManagerServer_populateHandleType_dbVersion_isEncrypted___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  id v3 = a2;
  id v5 = [v3 address];
  uint64_t v4 = objc_msgSend(v2, "numberWithInteger:", +[CHHandle handleTypeForValue:](CHHandle, "handleTypeForValue:", v5));
  objc_msgSend(v3, "setHandle_type:", v4);
}

- (void)prepareDatabaseForNextStepInMigration:(id)a3 dbVersion:(int64_t)a4 isEncrypted:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  switch(a4)
  {
    case 17:
      id v8 = (void *)MEMORY[0x1BA9CD070]();
      [(CallDBManagerServer *)self populateRecentCallRemoteParticipantHandles:v9 dbVersion:17 isEncrypted:v5];
      break;
    case 13:
      id v8 = (void *)MEMORY[0x1BA9CD070]();
      [(CallDBManagerServer *)self populateHandleType:v9 dbVersion:13 isEncrypted:v5];
      break;
    case 12:
      id v8 = (void *)MEMORY[0x1BA9CD070]();
      [(CallDBManagerServer *)self populateServiceProviderAndCallCategory:v9 dbVersion:12 isEncrypted:v5];
      break;
    default:
      goto LABEL_8;
  }
LABEL_8:
}

- (BOOL)handleDatabaseMigration:(id)a3 isEncrypted:(BOOL)a4 isRetry:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = +[CHLogServer sharedInstance];
  uint64_t v10 = [v9 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Performing necessary steps for migration", buf, 2u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __67__CallDBManagerServer_handleDatabaseMigration_isEncrypted_isRetry___block_invoke;
  v22[3] = &unk_1E61C7FB0;
  v22[4] = self;
  id v11 = v8;
  id v23 = v11;
  BOOL v24 = v6;
  int v12 = (void *)MEMORY[0x1BA9CD2A0](v22);
  uint64_t v13 = +[DBManager migrateDataStoreAtLocation:v11 withGetDestinationModel:v12 isEncrypted:v6];
  id v14 = +[CHLogServer sharedInstance];
  id v15 = [v14 logHandleForDomain:"ch.calldbm"];

  uint64_t v16 = v15;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = getDBMErrorCodeAsString([v13 errorCode]);
    *(_DWORD *)buf = 138543362;
    long long v26 = v17;
    _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "Migration result is: %{public}@", buf, 0xCu);
  }
  if ([v13 errorCode])
  {
    BOOL v18 = 0;
    if ([v13 errorCode] == 4 && !a5)
    {
      if (-[CallDBManagerServer removeDuplicatesFromDBAtLocation:dbVersion:isEncrypted:](self, "removeDuplicatesFromDBAtLocation:dbVersion:isEncrypted:", v11, [v13 dbVersion], v6))
      {
        BOOL v18 = [(CallDBManagerServer *)self handleDatabaseMigration:v11 isEncrypted:v6 isRetry:1];
      }
      else
      {
        uint64_t v19 = +[CHLogServer sharedInstance];
        uint64_t v20 = [v19 logHandleForDomain:"ch.calldbm"];

        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CallDBManagerServer handleDatabaseMigration:isEncrypted:isRetry:]();
        }

        BOOL v18 = 0;
      }
    }
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

id __67__CallDBManagerServer_handleDatabaseMigration_isEncrypted_isRetry___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) prepareDatabaseForNextStepInMigration:*(void *)(a1 + 40) dbVersion:a2 isEncrypted:*(unsigned __int8 *)(a1 + 48)];
  return +[CallDBManagerServer getDestinationModel:a2];
}

- (id)getUUIDsOfNMostRecentRecords:(unint64_t)a3 fromManagedObjectContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CallRecord"];
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
  id v9 = objc_msgSend(v7, "arrayWithObjects:", v8, 0);
  [v6 setSortDescriptors:v9];

  [v6 setFetchLimit:a3];
  id v23 = +[DBManager entityDescriptionHavingName:@"CallRecord" forContext:v5];
  uint64_t v10 = [v23 propertiesByName];
  id v11 = [v10 objectForKey:@"unique_id"];

  int v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v11, 0);
  [v6 setPropertiesToFetch:v12];

  [v6 setResultType:2];
  uint64_t v13 = [v5 executeFetchRequest:v6 error:0];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v24 + 1) + 8 * i) objectForKey:@"unique_id"];
        if (v20) {
          uint64_t v21 = (__CFString *)v20;
        }
        else {
          uint64_t v21 = &stru_1F129F488;
        }
        [v14 addObject:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  return v14;
}

- (void)prepareForMigrationDBAtURL:(id)a3 withModelAtURL:(id)a4 andIsEncrypted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[CHLogServer sharedInstance];
  id v11 = [v10 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v44 = v8;
    __int16 v45 = 2114;
    id v46 = v9;
    _os_log_impl(&dword_1B8E4A000, v11, OS_LOG_TYPE_DEFAULT, "Restricting number of records before performing migration: %{public}@ %{public}@", buf, 0x16u);
  }

  int v12 = +[DBManager instanceWithModelURL:v9];
  uint64_t v13 = v12;
  if (v12)
  {
    if ([v12 addDataStoreAtLocation:v8 isEncrypted:v5])
    {
      id v14 = [v13 createManagedObjectContext];
      if (!v14)
      {
        uint64_t v32 = +[CHLogServer sharedInstance];
        uint64_t v17 = [v32 logHandleForDomain:"ch.calldbm"];

        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:]();
        }
LABEL_26:

        goto LABEL_27;
      }
      id v15 = [(CallDBManagerServer *)self featureFlags];
      char v16 = [v15 increaseCallHistoryEnabled];

      if ((v16 & 1) == 0)
      {
        v36 = v13;
        id v37 = v9;
        id v38 = v8;
        uint64_t v17 = [(CallDBManagerServer *)self getUUIDsOfNMostRecentRecords:1000 fromManagedObjectContext:v14];
        v39 = 0;
        uint64_t v18 = 0;
        while (1)
        {
          uint64_t v19 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CallRecord"];
          uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"unique_id", v17];
          [v19 setPredicate:v20];

          [v19 setFetchLimit:1000];
          uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v19];
          [v21 setResultType:2];
          uint64_t v42 = 0;
          uint64_t v22 = [v14 executeRequest:v21 error:&v42];
          id v23 = v22;
          uint64_t v24 = v42;
          if (v42)
          {
            long long v25 = v17;
            long long v26 = +[CHLogServer sharedInstance];
            long long v27 = [v26 logHandleForDomain:"ch.calldbm"];

            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              -[CallDBManagerServer prepareForMigrationDBAtURL:withModelAtURL:andIsEncrypted:](&v40, v41, v27);
            }

            uint64_t v17 = v25;
          }
          else
          {
            long long v28 = [v22 result];
            uint64_t v18 = [v28 unsignedIntegerValue];

            v39 += v18;
          }

          if (v24) {
            break;
          }
          BOOL v29 = v18 == 1000;
          uint64_t v18 = 1000;
          if (!v29)
          {
            v33 = +[CHLogServer sharedInstance];
            v34 = [v33 logHandleForDomain:"ch.calldbm"];

            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              id v44 = v39;
              _os_log_impl(&dword_1B8E4A000, v34, OS_LOG_TYPE_DEFAULT, "Total number of records deleted are: %lu", buf, 0xCu);
            }

            break;
          }
        }
        id v9 = v37;
        id v8 = v38;
        uint64_t v13 = v36;
        goto LABEL_26;
      }
    }
    else
    {
      v31 = +[CHLogServer sharedInstance];
      id v14 = [v31 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:]();
      }
    }
  }
  else
  {
    id v30 = +[CHLogServer sharedInstance];
    id v14 = [v30 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CallDBManagerServer prepareForMigrationDBAtURL:withModelAtURL:andIsEncrypted:]();
    }
  }
LABEL_27:
}

- (BOOL)createCallDBProperties
{
  id v2 = [(CallDBManager *)self dbManager];
  id v3 = [v2 createManagedObjectContext];

  if (v3)
  {
    uint64_t v4 = +[DBManager entityDescriptionHavingName:@"CallDBProperties" forContext:v3];
    if (!v4)
    {
      uint64_t v13 = +[CHLogServer sharedInstance];
      BOOL v5 = [v13 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[CallDBManagerServer createCallDBProperties]();
      }
      BOOL v11 = 0;
      goto LABEL_29;
    }
    BOOL v5 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    [v5 setEntity:v4];
    id v23 = 0;
    BOOL v6 = [v3 executeFetchRequest:v5 error:&v23];
    id v7 = v23;
    if (v7)
    {
      id v8 = v7;
      id v9 = +[CHLogServer sharedInstance];
      uint64_t v10 = [v9 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CallDBManagerServer createCallDBProperties].cold.5();
      }

      BOOL v11 = 0;
      goto LABEL_28;
    }
    if (v6 && [v6 count])
    {
      id v14 = +[CHLogServer sharedInstance];
      id v8 = [v14 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Call DB properties object already exist, not creating again", buf, 2u);
      }
      BOOL v11 = 1;
      goto LABEL_28;
    }
    id v15 = [[CallDBProperties alloc] initWithEntity:v4 insertIntoManagedObjectContext:v3];
    if (v15)
    {
      id v21 = 0;
      char v16 = [v3 save:&v21];
      id v8 = v21;
      if (v16)
      {
        BOOL v11 = 1;
LABEL_27:

LABEL_28:
LABEL_29:

        goto LABEL_30;
      }
      uint64_t v19 = +[CHLogServer sharedInstance];
      uint64_t v18 = [v19 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CallDBManagerServer createCallDBProperties].cold.4();
      }
    }
    else
    {
      uint64_t v17 = +[CHLogServer sharedInstance];
      uint64_t v18 = [v17 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CallDBManagerServer createCallDBProperties]();
      }
      id v8 = 0;
    }

    BOOL v11 = 0;
    goto LABEL_27;
  }
  int v12 = +[CHLogServer sharedInstance];
  uint64_t v4 = [v12 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:]();
  }
  BOOL v11 = 0;
LABEL_30:

  return v11;
}

- (BOOL)bootUpDBAtLocation:(id)a3 isEncrypted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = +[DBManager versionForDBAtLocation:v6];
  id v8 = +[CallDBManager modelURL];
  int64_t v9 = +[DBManager isDataStoreAtURLInitialized:v6 withModelAtURL:v8];
  if (v9 == 3)
  {
    uint64_t v13 = +[CHLogServer sharedInstance];
    id v14 = [v13 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CallDBManagerServer bootUpDBAtLocation:isEncrypted:].cold.4();
    }
    goto LABEL_24;
  }
  int64_t v10 = v9;
  if (v9 == 2)
  {
    id v15 = +[CallDBManagerServer getDestinationModelForVersion:v7];
    [(CallDBManagerServer *)self prepareForMigrationDBAtURL:v6 withModelAtURL:v15 andIsEncrypted:v4];
    BOOL v16 = [(CallDBManagerServer *)self handleDatabaseMigration:v6 isEncrypted:v4 isRetry:0];

    BOOL v17 = 0;
    if (!v16) {
      goto LABEL_27;
    }
    goto LABEL_13;
  }
  if (!v9)
  {
    BOOL v11 = +[CHLogServer sharedInstance];
    int v12 = [v11 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v12, OS_LOG_TYPE_DEFAULT, "No data store intialization required", buf, 2u);
    }

    goto LABEL_13;
  }
  uint64_t v18 = [(CallDBManager *)self dbManager];
  char v19 = [v18 addDataStoreAtLocation:v6 isEncrypted:v4];

  if ((v19 & 1) == 0)
  {
    long long v28 = +[CHLogServer sharedInstance];
    id v14 = [v28 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:]();
    }
LABEL_24:

LABEL_25:
    BOOL v17 = 0;
LABEL_26:

    goto LABEL_27;
  }

  if (v10) {
    goto LABEL_21;
  }
LABEL_13:
  uint64_t v20 = [(CallDBManager *)self dbManager];
  char v21 = [v20 addDataStoreAtLocation:v6 isEncrypted:v4];

  if ((v21 & 1) == 0)
  {
    long long v27 = +[CHLogServer sharedInstance];
    id v8 = [v27 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:]();
    }
    goto LABEL_25;
  }
  uint64_t v22 = [(CallDBManagerServer *)self featureFlags];
  int v23 = [v22 increaseCallHistoryEnabled];

  if (v23)
  {
    uint64_t v24 = +[CHLogServer sharedInstance];
    long long v25 = [v24 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_1B8E4A000, v25, OS_LOG_TYPE_DEFAULT, "Received success from migration. Checking if we need to prune", v32, 2u);
    }

    long long v26 = [(CallDBManager *)self dbManager];
    id v8 = [v26 createManagedObjectContext];

    if (v8)
    {
      [(CallDBManagerServer *)self pruneDBFromManagedContext:v8 version:v7];
    }
    else
    {
      id v30 = +[CHLogServer sharedInstance];
      v31 = [v30 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CallDBManagerServer createMOCForDBAtLocation:dbVersion:isEncrypted:]();
      }
    }
    BOOL v17 = 1;
    goto LABEL_26;
  }
LABEL_21:
  BOOL v17 = 1;
LABEL_27:

  return v17;
}

- (void)pruneDBFromManagedContext:(id)a3 version:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(CallDBManagerServer *)self dbShouldBePrunedForVersion:a4])
  {
    int64_t v7 = +[CHLogServer sharedInstance];
    id v8 = [v7 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134217984;
      unint64_t v25 = a4;
      _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "DB needs to be pruned for version: %lu", (uint8_t *)&v24, 0xCu);
    }

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int64_t v10 = [(CallDBManagerServer *)self uniqueIDsOfCallsToKeepFromManagedObjectContext:v6 forFaceTimeCalls:1];
    [v9 addObjectsFromArray:v10];
    BOOL v11 = +[CHLogServer sharedInstance];
    int v12 = [v11 logHandleForDomain:"ch.calldbm"];

    uint64_t v13 = v12;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v10 count];
      int v24 = 134217984;
      unint64_t v25 = v14;
      _os_log_impl(&dword_1B8E4A000, v13, OS_LOG_TYPE_DEFAULT, "Calls visible in FT App to user: %lu", (uint8_t *)&v24, 0xCu);
    }

    id v15 = [(CallDBManagerServer *)self uniqueIDsOfCallsToKeepFromManagedObjectContext:v6 forFaceTimeCalls:0];
    [v9 addObjectsFromArray:v15];
    BOOL v16 = +[CHLogServer sharedInstance];
    BOOL v17 = [v16 logHandleForDomain:"ch.calldbm"];

    uint64_t v18 = v17;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v15 count];
      int v24 = 134217984;
      unint64_t v25 = v19;
      _os_log_impl(&dword_1B8E4A000, v18, OS_LOG_TYPE_DEFAULT, "Calls visible in Phone App to user: %lu", (uint8_t *)&v24, 0xCu);
    }

    uint64_t v20 = (void *)MEMORY[0x1E4F28BA0];
    char v21 = +[CHRecentCall predicateForCallsWithAnyUniqueIDs:v9];
    uint64_t v22 = [v20 notPredicateWithSubpredicate:v21];

    [(CallDBManagerServer *)self deleteObjectsWithPredicate:v22 fromManagedObjectContext:v6];
    int v23 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v23 setBool:1 forKey:@"CHDBLimitIncreasedPruned"];
  }
}

- (id)uniqueIDsOfCallsToKeepFromManagedObjectContext:(id)a3 forFaceTimeCalls:(BOOL)a4
{
  BOOL v4 = a4;
  v17[3] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  id v8 = [v6 fetchRequestWithEntityName:@"CallRecord"];
  [v8 setReturnsObjectsAsFaults:0];
  if (v4)
  {
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"service_provider == %@", @"com.apple.FaceTime"];
    [v8 setPredicate:v9];
  }
  v17[0] = @"remoteParticipantHandles";
  v17[1] = @"emergencyMediaItems";
  v17[2] = @"initiatorHandle";
  int64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  [v8 setRelationshipKeyPathsForPrefetching:v10];

  BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
  BOOL v16 = v11;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v8 setSortDescriptors:v12];

  [v8 setFetchLimit:200];
  uint64_t v13 = [v7 executeFetchRequest:v8 error:0];

  uint64_t v14 = [(CallDBManagerServer *)self uniqueIDsFromCallRecords:v13 forFaceTimeCalls:v4];

  return v14;
}

- (id)uniqueIDsFromCallRecords:(id)a3 forFaceTimeCalls:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = kCHCoalescingStrategyCollapseIfEqual;
  if (!v4) {
    id v6 = kCHCoalescingStrategyRecents;
  }
  long long v28 = *v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:100];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v30;
    id obj = v8;
    while (2)
    {
      uint64_t v14 = 0;
      id v15 = v11;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        BOOL v16 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
        BOOL v17 = (void *)MEMORY[0x1BA9CD070]();
        uint64_t v18 = [v16 chRecentCall];
        uint64_t v19 = v18;
        if (v15)
        {
          id v20 = [v15 coalescedCallWithCall:v18 usingStrategy:v28];
        }
        else
        {
          id v20 = v18;
        }
        char v21 = v20;
        if (v20)
        {
          uint64_t v22 = v20;
        }
        else
        {
          ++v12;
          uint64_t v22 = v19;
          if (v12 == 100)
          {
            id v24 = v7;

            id v8 = obj;

            goto LABEL_20;
          }
        }
        id v11 = v22;

        int v23 = [v19 uniqueId];
        [v7 addObject:v23];

        ++v14;
        id v15 = v11;
      }
      while (v10 != v14);
      id v8 = obj;
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }

  id v25 = v7;
  id v15 = v11;
LABEL_20:

  return v7;
}

- (void)deleteObjectsWithPredicate:(id)a3 fromManagedObjectContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 fetchRequestWithEntityName:@"CallRecord"];
  [v8 setPredicate:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v8];
  [v9 setResultType:2];
  uint64_t v16 = 0;
  uint64_t v10 = [v6 executeRequest:v9 error:&v16];

  if (v16)
  {
    id v11 = +[CHLogServer sharedInstance];
    uint64_t v12 = [v11 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CallDBManagerServer deleteObjectsWithPredicate:fromManagedObjectContext:]();
    }
  }
  else
  {
    uint64_t v13 = [v10 result];
    uint64_t v14 = [v13 unsignedIntegerValue];

    id v15 = +[CHLogServer sharedInstance];
    uint64_t v12 = [v15 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v14;
      _os_log_impl(&dword_1B8E4A000, v12, OS_LOG_TYPE_DEFAULT, "Deleted %ld calls from the data store.", buf, 0xCu);
    }
  }
}

- (BOOL)dbShouldBePrunedForVersion:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 < 27)
  {
    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = [v5 BOOLForKey:@"CHDBLimitIncreasedPruned"] ^ 1;
    id v7 = +[CHLogServer sharedInstance];
    id v8 = [v7 logHandleForDomain:"ch.calldbm"];

    uint64_t v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [NSNumber numberWithBool:v6];
      int v12 = 138543362;
      int64_t v13 = (int64_t)v10;
      _os_log_impl(&dword_1B8E4A000, v9, OS_LOG_TYPE_DEFAULT, "DB version was eligible for pruning. shouldBePruned: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    BOOL v4 = +[CHLogServer sharedInstance];
    id v5 = [v4 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      int64_t v13 = a3;
      _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "DB does not need to be pruned as version: %lu is greater than kCHDBVersionTwentySeven", (uint8_t *)&v12, 0xCu);
    }
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
}

- (void)bootUpDBAtLocationWithRecovery:isEncrypted:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Booting up the database after taking the backup of the bootless one", v2, v3, v4, v5, v6);
}

- (void)bootUpDBAtLocationWithRecovery:isEncrypted:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Call history database is not recoverable", v2, v3, v4, v5, v6);
}

+ (void)getObjectIdsForDuplicateRecordsWithUniqueIds:andHavingObjectIds:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1B8E4A000, v1, OS_LOG_TYPE_ERROR, "Objects ids(%lu) and unique ids(%lu) count mismatch", v2, 0x16u);
}

- (void)createMOCForDBAtLocation:dbVersion:isEncrypted:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to create the managed context", v2, v3, v4, v5, v6);
}

- (void)createMOCForDBAtLocation:dbVersion:isEncrypted:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to add data store at location: %{public}@", v2, v3, v4, v5, v6);
}

- (void)removeDuplicatesFromDBAtLocation:dbVersion:isEncrypted:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to execute the delete request", v2, v3, v4, v5, v6);
}

- (void)modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to perform save on the managed context", v2, v3, v4, v5, v6);
}

- (void)modifyCallRecordForDBAtLocation:dbVersion:isEncrypted:modifyCallRecord:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to execute fetch request", v2, v3, v4, v5, v6);
}

- (void)handleDatabaseMigration:isEncrypted:isRetry:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to remove duplicates from the database at location: %{public}@", v2, v3, v4, v5, v6);
}

- (void)prepareForMigrationDBAtURL:withModelAtURL:andIsEncrypted:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to create the DBManager", v2, v3, v4, v5, v6);
}

- (void)prepareForMigrationDBAtURL:(uint8_t *)buf withModelAtURL:(unsigned char *)a2 andIsEncrypted:(os_log_t)log .cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_ERROR, "Failed to execute the delete request", buf, 2u);
}

- (void)createCallDBProperties
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to get the records with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)bootUpDBAtLocation:isEncrypted:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Error occured", v2, v3, v4, v5, v6);
}

- (void)deleteObjectsWithPredicate:fromManagedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to execute the delete request", v2, v3, v4, v5, v6);
}

@end