@interface PFCloudKitMetadataModelMigrator
- (BOOL)checkAndPerformMigrationIfNecessary:(uint64_t *)a1;
- (BOOL)checkForCorruptedRecordMetadataInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:;
- (BOOL)cleanUpAfterClientMigrationWithStore:(void *)a3 andContext:(void *)a4 error:;
- (BOOL)computeAncillaryEntityPrimaryKeyTableEntriesForStore:(void *)a3 error:;
- (PFCloudKitMetadataModelMigrator)initWithStore:(id)a3 metadataContext:(id)a4 databaseScope:(int64_t)a5 metricsClient:(id)a6;
- (uint64_t)addMigrationStatementForAddingAttribute:(unsigned char *)a1 toContext:(uint64_t)a2 inStore:(void *)a3;
- (uint64_t)checkForOrphanedMirroredRelationshipsInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:;
- (void)addMigrationStatementToContext:(uint64_t)a1 forRenamingAttributeNamed:(uint64_t)a2 withOldColumnName:(uint64_t)a3 toAttributeName:(uint64_t)a4 onOldSQLEntity:(uint64_t)a5 andCurrentSQLEntity:(id *)a6;
- (void)dealloc;
@end

@implementation PFCloudKitMetadataModelMigrator

- (PFCloudKitMetadataModelMigrator)initWithStore:(id)a3 metadataContext:(id)a4 databaseScope:(int64_t)a5 metricsClient:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)PFCloudKitMetadataModelMigrator;
  v10 = [(PFCloudKitMetadataModelMigrator *)&v13 init];
  if (v10)
  {
    v10->_store = (NSSQLCore *)a3;
    v11 = (NSManagedObjectContext *)a4;
    v10->_metadataContext = v11;
    [(NSManagedObjectContext *)v11 setTransactionAuthor:@"NSCloudKitMirroringDelegate.migration"];
    v10->_context = objc_alloc_init(PFCloudKitMetadataMigrationContext);
    v10->_databaseScope = a5;
    v10->_metricsClient = (PFCloudKitMetricsClient *)a6;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitMetadataModelMigrator;
  [(PFCloudKitMetadataModelMigrator *)&v3 dealloc];
}

uint64_t __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) entityNamed:a2];
  if (a3)
  {
    int v8 = *(_DWORD *)(a3 + 184);
    if (result)
    {
LABEL_3:
      int v9 = *(_DWORD *)(result + 184);
      goto LABEL_4;
    }
  }
  else
  {
    int v8 = 0;
    if (result) {
      goto LABEL_3;
    }
  }
  int v9 = 0;
LABEL_4:
  if (v8 != v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)computeAncillaryEntityPrimaryKeyTableEntriesForStore:(void *)a3 error:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__PFCloudKitMetadataModelMigrator_computeAncillaryEntityPrimaryKeyTableEntriesForStore_error___block_invoke;
  v17[3] = &unk_1E544D898;
  v17[4] = a2;
  v17[5] = &v18;
  v5 = [[NSSQLBlockRequestContext alloc] initWithBlock:v17 context:0 sqlCore:a2];
  -[NSSQLCore dispatchRequest:withRetries:](a2, v5, 0);

  if (!*((unsigned char *)v19 + 24))
  {
    id v8 = 0;
    if (v8)
    {
      if (a3) {
        *a3 = v8;
      }
    }
    else
    {
      uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        __int16 v24 = 1024;
        int v25 = 1267;
        _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  BOOL v6 = *((unsigned char *)v19 + 24) != 0;
  _Block_object_dispose(&v18, 8);
  return v6;
}

void __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke_2(void *a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v27[0] = 0;
  v29[0] = @"PFCloudKitMetadataFrameworkVersionKey";
  v2 = objc_msgSend(+[NSCKMetadataEntry entriesForKeys:onlyFetchingProperties:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 1), &unk_1ED7E9A00, *(void *)(a1[4] + 8), *(void **)(a1[4] + 16), (uint64_t)v27), "objectForKey:", @"PFCloudKitMetadataFrameworkVersionKey");
  objc_super v3 = (void *)v27[0];
  if (v27[0])
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *(void *)(*(void *)(a1[6] + 8) + 40) = v3;
  }
  else if (v2)
  {
    v5 = (void *)[v2 integerValue];
    BOOL v6 = *(void **)(a1[4] + 24);
    if (v6)
    {
      objc_setProperty_nonatomic(v6, v4, v5, 80);
      uint64_t v7 = *(void *)(a1[4] + 24);
      if (v7) {
        BOOL v6 = *(void **)(v7 + 80);
      }
      else {
        BOOL v6 = 0;
      }
    }
    uint64_t v8 = objc_msgSend(v6, "integerValue", v5);
    uint64_t v9 = *(void *)(a1[4] + 24);
    if (v9 && (*(unsigned char *)(v9 + 33) = v8 < 940, (uint64_t v10 = *(void *)(a1[4] + 24)) != 0)) {
      uint64_t v11 = *(void **)(v10 + 80);
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [v11 integerValue];
    uint64_t v13 = *(void *)(a1[4] + 24);
    if (v13 && (*(unsigned char *)(v13 + 37) = v12 < 1028, (uint64_t v14 = *(void *)(a1[4] + 24)) != 0)) {
      uint64_t v15 = *(void **)(v14 + 80);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = [v15 integerValue];
    uint64_t v17 = *(void *)(a1[4] + 24);
    if (v17 && (*(unsigned char *)(v17 + 39) = v16 < 1244, (uint64_t v18 = *(void *)(a1[4] + 24)) != 0)) {
      v19 = *(void **)(v18 + 80);
    }
    else {
      v19 = 0;
    }
    uint64_t v20 = [v19 integerValue];
    uint64_t v21 = *(void *)(a1[4] + 24);
    if (v21) {
      *(unsigned char *)(v21 + 40) = v20 < 1336;
    }
  }
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    v28 = @"PFCloudKitMetadataModelVersionHashesKey";
    v22 = objc_msgSend(+[NSCKMetadataEntry entriesForKeys:onlyFetchingProperties:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v28, 1), &unk_1ED7E9A18, *(void *)(a1[4] + 8), *(void **)(a1[4] + 16), (uint64_t)v27), "objectForKey:", @"PFCloudKitMetadataModelVersionHashesKey");
    v23 = (void *)v27[0];
    if (v27[0])
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
      *(void *)(*(void *)(a1[6] + 8) + 40) = v23;
    }
    else
    {
      int v25 = (void *)[v22 transformedValue];
      uint64_t v26 = *(void **)(a1[4] + 24);
      if (v26) {
        objc_setProperty_nonatomic(v26, v24, v25, 88);
      }
    }
  }
}

- (void)addMigrationStatementToContext:(uint64_t)a1 forRenamingAttributeNamed:(uint64_t)a2 withOldColumnName:(uint64_t)a3 toAttributeName:(uint64_t)a4 onOldSQLEntity:(uint64_t)a5 andCurrentSQLEntity:(id *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a6 && (uint64_t v12 = [a6[5] objectForKey:a4]) != 0)
  {
    uint64_t v13 = (void *)v12;
    if (a5)
    {
      uint64_t v14 = (void *)[*(id *)(a5 + 40) objectForKey:a2];
      if (v14) {
        a3 = [v14 columnName];
      }
    }
    uint64_t v15 = [NSSQLiteStatement alloc];
    uint64_t v16 = -[NSSQLiteStatement initWithEntity:sqlString:](v15, "initWithEntity:sqlString:", a6, [NSString stringWithFormat:@"ALTER TABLE %@ RENAME COLUMN %@ TO %@", objc_msgSend(a6, "tableName"), a3, objc_msgSend(v13, "columnName")]);
    uint64_t v17 = v16;
    if (a1)
    {
      uint64_t v26 = v16;
      uint64_t v16 = [*(id *)(a1 + 8) addObject:v16];
      uint64_t v17 = v26;
      *(unsigned char *)(a1 + 32) = 1;
    }
    MEMORY[0x1F41817F8](v16, v17);
  }
  else
  {
    uint64_t v18 = [NSString stringWithUTF8String:"Unable to find attribute to migrate to '%@' from '%@' on entity: %@"];
    _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, a4);
    int v25 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = a4;
      __int16 v29 = 2112;
      uint64_t v30 = a2;
      __int16 v31 = 2112;
      v32 = a6;
      _os_log_fault_impl(&dword_18AB82000, v25, OS_LOG_TYPE_FAULT, "CoreData: Unable to find attribute to migrate to '%@' from '%@' on entity: %@", buf, 0x20u);
    }
  }
}

- (uint64_t)addMigrationStatementForAddingAttribute:(unsigned char *)a1 toContext:(uint64_t)a2 inStore:(void *)a3
{
  BOOL v6 = (void *)[a1 entity];
  uint64_t v7 = [NSSQLiteStatement alloc];
  uint64_t v8 = -[NSSQLiteStatement initWithEntity:sqlString:](v7, "initWithEntity:sqlString:", v6, [NSString stringWithFormat:@"ALTER TABLE %@ ADD COLUMN %@ %@", objc_msgSend(v6, "tableName"), objc_msgSend(a1, "columnName"), -[NSSQLiteAdapter typeStringForColumn:]((__CFString *)objc_msgSend(a3, "adapter"), a1)]);
  uint64_t v9 = v8;
  if (a2)
  {
    uint64_t v11 = v8;
    uint64_t v8 = [*(id *)(a2 + 8) addObject:v8];
    uint64_t v9 = v11;
    *(unsigned char *)(a2 + 32) = 1;
  }

  return MEMORY[0x1F41817F8](v8, v9);
}

void __79__PFCloudKitMetadataModelMigrator_calculateMigrationStepsWithConnection_error___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
  objc_super v3 = (void *)[v2 initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:getCloudKitCKCurrentUserDefaultName[0]()];
  v4 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath]);
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"ckRecordZoneName = %@ AND ckOwnerName = %@", objc_msgSend(v3, "zoneName"), objc_msgSend(v3, "ownerName")]);
  [(NSFetchRequest *)v4 setResultType:4];
  [(NSFetchRequest *)v4 setPropertiesToFetch:&unk_1ED7E9A48];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v5)
  {
    unint64_t v6 = -[NSManagedObjectContext _countForFetchRequest_:error:](v5, v4, (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      id v7 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    else if (v6 >= 2)
    {
      uint64_t v8 = [NSSQLiteStatement alloc];
      uint64_t v9 = -[NSSQLiteStatement initWithEntity:sqlString:](v8, "initWithEntity:sqlString:", 0, [NSString stringWithFormat:@"DELETE FROM %@", objc_msgSend(*(id *)(a1 + 40), "tableName")]);
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
      if (v10)
      {
        [*(id *)(v10 + 8) addObject:v9];
        *(unsigned char *)(v10 + 32) = 1;
      }
    }
  }
}

void __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke(uint64_t a1)
{
  uint64_t v203 = *MEMORY[0x1E4F143B8];
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(*(void *)(a1 + 32) + 8)))
  {
    v196[0] = 0;
    if (([*(id *)(*(void *)(a1 + 32) + 16) setQueryGenerationFromToken:0 error:v196] & 1) == 0)
    {
      v1 = (void *)MEMORY[0x18C127630]();
      uint64_t v2 = __ckLoggingOverride;
      uint64_t v3 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on moc: %@"];
      _NSCoreDataLog(v2 != 0, v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[PFCloudKitMetadataModelMigrator commitMigrationMetadataAndCleanup:]_block_invoke");
    }
  }
  id v172 = 0;
  if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataModelMigratorMigrationBeganCommitKey", 1, *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), &v172)|| ([*(id *)(*(void *)(a1 + 32) + 16) save:&v172] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return;
  }
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(*(void *)(a1 + 32) + 8)))
  {
    v196[0] = 0;
    if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), v196) & 1) == 0)
    {
      uint64_t v10 = (void *)MEMORY[0x18C127630]();
      uint64_t v11 = __ckLoggingOverride;
      uint64_t v12 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on moc: %@"];
      _NSCoreDataLog(v11 != 0, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[PFCloudKitMetadataModelMigrator commitMigrationMetadataAndCleanup:]_block_invoke");
    }
  }
  uint64_t v19 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataFrameworkVersionKey", *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), (uint64_t)&v172);
  id v20 = v172;
  if (v172
    || (uint64_t v21 = (void *)v19,
        v22 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataModelVersionHashesKey", *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), (uint64_t)&v172), (id v20 = v172) != 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v23 = v20;
    goto LABEL_14;
  }
  uint64_t v39 = [v22 transformedValue];
  if (!v39
    || ((uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 24)) == 0 ? (v41 = 0) : (v41 = *(void **)(v40 + 48)),
        (objc_msgSend((id)objc_msgSend(v41, "entityVersionHashesByName"), "isEqual:", v39) & 1) == 0))
  {
    if (!-[PFCloudKitMetadataModelMigrator computeAncillaryEntityPrimaryKeyTableEntriesForStore:error:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 8), &v172))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;
    }
  }
  uint64_t v42 = *(void *)(a1 + 40);
  if (*(unsigned char *)(*(void *)(v42 + 8) + 24))
  {
    uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 24);
    v44 = v43 ? *(void **)(v43 + 48) : 0;
    uint64_t v45 = +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataModelVersionHashesKey", [v44 entityVersionHashesByName], *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), &v172);
    uint64_t v42 = *(void *)(a1 + 40);
    if (!v45)
    {
      *(unsigned char *)(*(void *)(v42 + 8) + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;
      uint64_t v42 = *(void *)(a1 + 40);
    }
  }
  if (!*(unsigned char *)(*(void *)(v42 + 8) + 24)) {
    return;
  }
  if (v21)
  {
    unint64_t v46 = objc_msgSend((id)objc_msgSend(v21, "integerValue"), "unsignedIntegerValue");
    BOOL v47 = (unint64_t)objc_msgSend((id)objc_msgSend(v21, "integerValue"), "unsignedIntegerValue") < 0x3B1;
    BOOL v148 = (unint64_t)objc_msgSend((id)objc_msgSend(v21, "integerValue"), "unsignedIntegerValue") < 0x3B3;
    if (v46 > 0x399) {
      goto LABEL_55;
    }
  }
  else
  {
    BOOL v148 = 0;
    BOOL v47 = 1;
  }
  v48 = [[NSCloudKitMirroringDelegatePreJazzkonMetadata alloc] initWithStore:*(void *)(*(void *)(a1 + 32) + 8)];
  if (!-[NSCloudKitMirroringDelegatePreJazzkonMetadata load:]((uint64_t)v48, &v172))
  {
LABEL_52:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v51 = v172;
    goto LABEL_53;
  }
  v49 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(void *)(*(void *)(a1 + 32) + 32), *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), (uint64_t)&v172);
  id v50 = v172;
  if (!v172)
  {
    v83 = v49;
    -[NSManagedObject setCurrentChangeToken:](v49, "setCurrentChangeToken:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata changeTokenForDatabaseScope:]((uint64_t)v48, *(void *)(*(void *)(a1 + 32) + 32)));
    -[NSManagedObject setHasSubscription:](v83, "setHasSubscription:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata hasInitializedDatabaseSubscription]((BOOL)v48));
    if (*(void *)(*(void *)(a1 + 32) + 32) == 2)
    {
      id v84 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:2];
      v85 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v84, *(void *)(*(void *)(a1 + 32) + 32), *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), (uint64_t)&v172);
      id v86 = v172;
      if (v172)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v86;
      }
      else
      {
        v143 = v85;
        -[NSManagedObject setHasSubscription:](v85, "setHasSubscription:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata hasInitializedZoneSubscription]((BOOL)v48));
        -[NSManagedObject setCurrentChangeToken:](v143, "setCurrentChangeToken:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata changeTokenForZoneWithID:inDatabaseWithScope:]((uint64_t)v48, v84, *(void *)(*(void *)(a1 + 32) + 32)));
        [(NSManagedObject *)v143 setHasRecordZone:0];
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (-[NSCloudKitMirroringDelegatePreJazzkonMetadata lastHistoryToken]((uint64_t)v48))
      {
        uint64_t v144 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata lastHistoryToken]((uint64_t)v48);
        if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateLastHistoryTokenKey", v144, *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), &v172))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;
        }
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (-[NSCloudKitMirroringDelegatePreJazzkonMetadata ckIdentityRecordName](v48))
      {
        id v145 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata ckIdentityRecordName](v48);
        if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:stringValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey", (uint64_t)v145, *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), &v172))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;
        }
      }
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      goto LABEL_54;
    }
    if (!-[NSCloudKitMirroringDelegatePreJazzkonMetadata hasCheckedCKIdentity]((BOOL)v48)) {
      goto LABEL_54;
    }
    char v146 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata hasCheckedCKIdentity]((BOOL)v48);
    if (+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey", v146, *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), &v172))
    {
      goto LABEL_54;
    }
    goto LABEL_52;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  id v51 = v50;
LABEL_53:
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v51;
LABEL_54:

LABEL_55:
  int v52 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && v47)
  {
    uint64_t v53 = MEMORY[0x18C127630]();
    id v152 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v54 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath]);
    [(NSFetchRequest *)v54 setRelationshipKeyPathsForPrefetching:&unk_1ED7E9AF0];
    [(NSFetchRequest *)v54 setReturnsObjectsAsFaults:0];
    uint64_t v189 = *(void *)(*(void *)(a1 + 32) + 8);
    -[NSFetchRequest setAffectedStores:](v54, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v189 count:1]);
    v55 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) executeFetchRequest:v54 error:&v172];
    context = (void *)v53;
    if (v55
      && (v56 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(void *)(*(void *)(a1 + 32) + 32), *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), (uint64_t)&v172)) != 0)
    {
      v149 = v56;
      long long v170 = 0u;
      long long v171 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      uint64_t v57 = [v55 countByEnumeratingWithState:&v168 objects:v188 count:16];
      if (v57)
      {
        uint64_t v58 = *(void *)v169;
        do
        {
          uint64_t v59 = 0;
          uint64_t v150 = v57;
          do
          {
            if (*(void *)v169 != v58) {
              objc_enumerationMutation(v55);
            }
            v60 = *(void **)(*((void *)&v168 + 1) + 8 * v59);
            if (objc_msgSend((id)objc_msgSend(v60, "ckOwnerName"), "length")
              && objc_msgSend((id)objc_msgSend(v60, "ckRecordZoneName"), "length"))
            {
              v61 = -[NSCKRecordZoneMetadata createRecordZoneID](v60);
              uint64_t v62 = [v152 objectForKey:v61];
              if (v62)
              {
                v63 = objc_msgSend((id)objc_msgSend(v60, "mirroredRelationships"), "copy");
                long long v166 = 0u;
                long long v167 = 0u;
                long long v164 = 0u;
                long long v165 = 0u;
                uint64_t v64 = [v63 countByEnumeratingWithState:&v164 objects:v187 count:16];
                if (v64)
                {
                  uint64_t v65 = *(void *)v165;
                  do
                  {
                    for (uint64_t i = 0; i != v64; ++i)
                    {
                      if (*(void *)v165 != v65) {
                        objc_enumerationMutation(v63);
                      }
                      [*(id *)(*((void *)&v164 + 1) + 8 * i) setRecordZone:v62];
                    }
                    uint64_t v64 = [v63 countByEnumeratingWithState:&v164 objects:v187 count:16];
                  }
                  while (v64);
                }

                v67 = objc_msgSend((id)objc_msgSend(v60, "records"), "copy");
                long long v162 = 0u;
                long long v163 = 0u;
                long long v160 = 0u;
                long long v161 = 0u;
                uint64_t v68 = [v67 countByEnumeratingWithState:&v160 objects:v186 count:16];
                if (v68)
                {
                  uint64_t v69 = *(void *)v161;
                  do
                  {
                    for (uint64_t j = 0; j != v68; ++j)
                    {
                      if (*(void *)v161 != v69) {
                        objc_enumerationMutation(v67);
                      }
                      [*(id *)(*((void *)&v160 + 1) + 8 * j) setRecordZone:v62];
                    }
                    uint64_t v68 = [v67 countByEnumeratingWithState:&v160 objects:v186 count:16];
                  }
                  while (v68);
                }

                uint64_t v57 = v150;
                [*(id *)(*(void *)(a1 + 32) + 16) deleteObject:v60];
              }
              else
              {
                [v60 setDatabase:v149];
                [v152 setObject:v60 forKey:v61];
              }
            }
            else
            {
              [*(id *)(*(void *)(a1 + 32) + 16) deleteObject:v60];
            }
            ++v59;
          }
          while (v59 != v57);
          uint64_t v57 = [v55 countByEnumeratingWithState:&v168 objects:v188 count:16];
        }
        while (v57);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;
    }

    int v52 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  if (v52
    && [*(id *)(*(void *)(a1 + 32) + 16) hasChanges]
    && ([*(id *)(*(void *)(a1 + 32) + 16) save:&v172] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;
  }
  uint64_t v87 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(*(void *)(v87 + 8) + 24)) {
    goto LABEL_168;
  }
  uint64_t v88 = *(void *)(a1 + 32);
  uint64_t v89 = *(void *)(v88 + 24);
  if (v89)
  {
    if (*(unsigned char *)(v89 + 35))
    {
      id v90 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:*(void *)(v88 + 32)];
      v91 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v90, *(void *)(*(void *)(a1 + 32) + 32), *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), (uint64_t)&v172);
      if ([(NSManagedObject *)v91 isInserted]) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) save:&v172];
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        v92 = [[NSFetchRequest alloc] initWithEntityName:+[NSCKMirroredRelationship entityPath]];
        uint64_t v185 = *(void *)(*(void *)(a1 + 32) + 8);
        -[NSFetchRequest setAffectedStores:](v92, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v185 count:1]);
        [(NSFetchRequest *)v92 setFetchBatchSize:500];
        uint64_t v93 = *(void *)(a1 + 32);
        v94 = *(void **)(v93 + 16);
        v158[0] = MEMORY[0x1E4F143A8];
        v158[1] = 3221225472;
        v158[2] = __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke_2;
        v158[3] = &unk_1E544F588;
        v158[4] = v91;
        v158[5] = v93;
        int8x16_t v159 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
        +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v92, v94, (uint64_t)v158);
      }
      uint64_t v87 = *(void *)(a1 + 40);
      if (!*(unsigned char *)(*(void *)(v87 + 8) + 24)) {
        goto LABEL_168;
      }
    }
  }
  uint64_t v95 = *(void *)(*(void *)(a1 + 32) + 24);
  if (!v95 || !*(unsigned char *)(v95 + 38)) {
    goto LABEL_138;
  }
  v96 = (void *)MEMORY[0x18C127630]();
  v97 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath]);
  -[NSFetchRequest setPredicate:](v97, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"entityId = 0"]);
  uint64_t v98 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v98)
  {
    uint64_t v99 = -[NSManagedObjectContext _countForFetchRequest_:error:](v98, v97, (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    if (v99)
    {
      if (v99 == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        id v100 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        goto LABEL_133;
      }
      v101 = (void *)MEMORY[0x18C127630]();
      unint64_t v102 = __ckLoggingOverride;
      uint64_t v103 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Found %lu corrupt analyzed history rows, purging."];
      if (v102 >= 3) {
        uint64_t v110 = 3;
      }
      else {
        uint64_t v110 = v102;
      }
      _NSCoreDataLog(v110, v103, v104, v105, v106, v107, v108, v109, (uint64_t)"-[PFCloudKitMetadataModelMigrator commitMigrationMetadataAndCleanup:]_block_invoke");
      v111 = [[NSBatchDeleteRequest alloc] initWithFetchRequest:+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath])];
      [(NSBatchDeleteRequest *)v111 setResultType:0];
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "executeRequest:error:", v111, *(void *)(*(void *)(a1 + 48) + 8) + 40), "result"), "BOOLValue"))
      {
        uint64_t v112 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateLastHistoryTokenKey", *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), *(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v112)
        {
          [*(id *)(*(void *)(a1 + 32) + 16) deleteObject:v112];
LABEL_132:

          goto LABEL_133;
        }
        if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
          goto LABEL_132;
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      id v113 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      goto LABEL_132;
    }
  }
LABEL_133:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && [*(id *)(*(void *)(a1 + 32) + 16) hasChanges]
    && ([*(id *)(*(void *)(a1 + 32) + 16) save:*(void *)(*(void *)(a1 + 48) + 8) + 40] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v114 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  [*(id *)(*(void *)(a1 + 32) + 16) reset];
  uint64_t v87 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(*(void *)(v87 + 8) + 24)) {
    goto LABEL_168;
  }
LABEL_138:
  uint64_t v115 = *(void *)(a1 + 32);
  uint64_t v116 = *(void *)(v115 + 24);
  if (v116)
  {
    if (*(unsigned char *)(v116 + 40))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -[PFCloudKitMetadataModelMigrator checkForOrphanedMirroredRelationshipsInStore:inManagedObjectContext:error:](v115, *(void **)(v115 + 8), *(void **)(v115 + 16), &v172);
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;
        uint64_t v87 = *(void *)(a1 + 40);
        if (!*(unsigned char *)(*(void *)(v87 + 8) + 24)) {
          goto LABEL_168;
        }
      }
    }
  }
  if (v148)
  {
    if (!-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), &v172))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      id v117 = v172;
LABEL_147:
      char v120 = !v148;
      uint64_t v121 = a1;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v117;
      goto LABEL_152;
    }
LABEL_150:
    char v120 = 0;
    goto LABEL_151;
  }
  v118 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataClientVersionHashesKey", *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), (uint64_t)&v172);
  id v119 = v172;
  if (v172)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v117 = v119;
    goto LABEL_147;
  }
  if (!v118) {
    goto LABEL_150;
  }
  char v120 = objc_msgSend((id)objc_msgSend(v118, "transformedValue"), "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "persistentStoreCoordinator"), "managedObjectModel"), "entityVersionHashesByName"));
LABEL_151:
  uint64_t v121 = a1;
LABEL_152:
  if (!*(unsigned char *)(*(void *)(*(void *)(v121 + 40) + 8) + 24)) {
    goto LABEL_159;
  }
  if ([*(id *)(*(void *)(v121 + 32) + 16) hasChanges])
  {
    char v122 = [*(id *)(*(void *)(a1 + 32) + 16) save:&v172];
  }
  else
  {
    BOOL v123 = +[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(*(void *)(a1 + 32) + 8));
    uint64_t v121 = a1;
    if (v123) {
      goto LABEL_159;
    }
    char v122 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), &v172);
  }
  uint64_t v121 = a1;
  if ((v122 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v124 = v172;
    uint64_t v121 = a1;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v124;
  }
LABEL_159:
  uint64_t v87 = *(void *)(v121 + 40);
  if (*(unsigned char *)(*(void *)(v87 + 8) + 24)) {
    char v125 = v120;
  }
  else {
    char v125 = 1;
  }
  if (v125) {
    goto LABEL_168;
  }
  if (-[PFCloudKitMetadataModelMigrator cleanUpAfterClientMigrationWithStore:andContext:error:](*(void *)(a1 + 32), *(void **)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), &v172))
  {
    uint64_t v126 = +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataClientVersionHashesKey", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "persistentStoreCoordinator"), "managedObjectModel"), "entityVersionHashesByName"), *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), &v172);
    uint64_t v87 = *(void *)(a1 + 40);
    if (v126) {
      goto LABEL_168;
    }
    *(unsigned char *)(*(void *)(v87 + 8) + 24) = 0;
    id v127 = v172;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v127 = v172;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v127;
  uint64_t v87 = *(void *)(a1 + 40);
LABEL_168:
  if (*(unsigned char *)(*(void *)(v87 + 8) + 24))
  {
    uint64_t PFBundleVersion = +[_PFRoutines _getPFBundleVersionNumber]();
    if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:integerValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataFrameworkVersionKey", PFBundleVersion, *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), &v172)|| (uint64_t v129 = *(void *)(a1 + 32), (v130 = *(void *)(v129 + 24)) != 0)&& *(unsigned char *)(v130 + 33)&& !+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataNeedsMetadataMigrationKey", 1, *(void *)(v129 + 8), *(void **)(v129 + 16), &v172))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;
    }
  }
  uint64_t v131 = a1;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return;
  }
  uint64_t v132 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v132 && *(unsigned char *)(v132 + 36))
  {
    v133 = [[NSBatchUpdateRequest alloc] initWithEntityName:+[NSCKRecordZoneMetadata entityPath]];
    v183[0] = @"needsImport";
    v184[0] = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
    v183[1] = @"currentChangeToken";
    v184[1] = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
    v183[2] = @"lastFetchDate";
    v184[2] = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
    -[NSBatchUpdateRequest setPropertiesToUpdate:](v133, "setPropertiesToUpdate:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v184 forKeys:v183 count:3]);
    [(NSBatchUpdateRequest *)v133 setResultType:0];
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "executeRequest:error:", v133, &v172), "result"), "BOOLValue") & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;

      v133 = 0;
    }

    uint64_t v131 = a1;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      return;
    }
  }
  char v134 = [*(id *)(*(void *)(v131 + 32) + 16) save:&v172];
  uint64_t v135 = a1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v134;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v136 = v172;
    uint64_t v135 = a1;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v136;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      return;
    }
  }
  v137 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v135 + 32) + 8), "metadata"), "mutableCopy");
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  v138 = (void *)+[NSCloudKitMirroringDelegatePreJazzkonMetadata allDefaultsKeys]();
  uint64_t v139 = [v138 countByEnumeratingWithState:&v154 objects:v182 count:16];
  if (v139)
  {
    uint64_t v140 = *(void *)v155;
    do
    {
      for (uint64_t k = 0; k != v139; ++k)
      {
        if (*(void *)v155 != v140) {
          objc_enumerationMutation(v138);
        }
        [v137 removeObjectForKey:*(void *)(*((void *)&v154 + 1) + 8 * k)];
      }
      uint64_t v139 = [v138 countByEnumeratingWithState:&v154 objects:v182 count:16];
    }
    while (v139);
  }
  [v137 removeObjectForKey:@"_NSStoreAncillaryModelVersionHashesMetadataKey"];
  [v137 removeObjectForKey:@"PFCloudKitMetadataNeedsZoneFetchAfterClientMigrationKey"];
  [*(id *)(*(void *)(a1 + 32) + 8) setMetadata:v137];

  char v142 = [*(id *)(*(void *)(a1 + 32) + 16) save:&v172];
  uint64_t v24 = a1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v142;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    goto LABEL_15;
  }
  id v23 = v172;
LABEL_14:
  uint64_t v24 = a1;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v23;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return;
  }
LABEL_15:
  int v25 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataNeedsMetadataMigrationKey", *(void *)(*(void *)(v24 + 32) + 8), *(void **)(*(void *)(v24 + 32) + 16), (uint64_t)&v172);
  id v26 = v172;
  if (v172)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v27 = v26;
LABEL_17:
    uint64_t v28 = *(void *)(a1 + 48);
LABEL_18:
    *(void *)(*(void *)(v28 + 8) + 40) = v27;
    return;
  }
  if ([v25 BOOLValue])
  {
    uint64_t v29 = *(void *)(a1 + 32);
    uint64_t v30 = *(void **)(v29 + 8);
    __int16 v31 = *(void **)(v29 + 16);
    uint64_t v151 = v29;
    uint64_t v178 = 0;
    v179 = &v178;
    uint64_t v180 = 0x2020000000;
    char v181 = 1;
    *(void *)v197 = 0;
    v198 = v197;
    uint64_t v199 = 0x3052000000;
    v200 = __Block_byref_object_copy__57;
    v201 = __Block_byref_object_dispose__57;
    uint64_t v202 = 0;
    v32 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(v30, "configurationName"));
    long long v176 = 0u;
    long long v177 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v174 objects:v196 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v175;
LABEL_22:
      uint64_t v35 = 0;
      while (1)
      {
        if (*(void *)v175 != v34) {
          objc_enumerationMutation(v32);
        }
        v36 = *(void **)(*((void *)&v174 + 1) + 8 * v35);
        if (objc_msgSend((id)objc_msgSend(v36, "attributesByName"), "objectForKey:", @"ckRecordID"))
        {
          if (objc_msgSend((id)objc_msgSend(v36, "attributesByName"), "objectForKey:", @"ckRecordSystemFields"))
          {
            v37 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", [v36 name]);
            v195[0] = @"ckRecordID";
            v195[1] = @"ckRecordSystemFields";
            -[NSFetchRequest setPropertiesToFetch:](v37, "setPropertiesToFetch:", [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:2]);
            -[NSFetchRequest setPredicate:](v37, "setPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"ckRecordID"));
            [(NSFetchRequest *)v37 setFetchBatchSize:200];
            v194 = v30;
            -[NSFetchRequest setAffectedStores:](v37, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v194 count:1]);
            v173[0] = MEMORY[0x1E4F143A8];
            v173[1] = 3221225472;
            v173[2] = __107__PFCloudKitMetadataModelMigrator_migrateMetadataForObjectsInStore_toNSCKRecordMetadataUsingContext_error___block_invoke;
            v173[3] = &unk_1E544F988;
            v173[4] = v151;
            v173[5] = v30;
            v173[6] = v31;
            v173[7] = v197;
            v173[8] = &v178;
            +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v37, v31, (uint64_t)v173);
            if (!*((unsigned char *)v179 + 24)) {
              break;
            }
          }
        }
        if (v33 == ++v35)
        {
          uint64_t v33 = [v32 countByEnumeratingWithState:&v174 objects:v196 count:16];
          if (v33) {
            goto LABEL_22;
          }
          break;
        }
      }
    }
    if (!*((unsigned char *)v179 + 24))
    {
      id v38 = *((id *)v198 + 5);
      if (v38)
      {
        id v172 = v38;
      }
      else
      {
        uint64_t v71 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v71, v72, v73, v74, v75, v76, v77, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        v78 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v191 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          __int16 v192 = 1024;
          int v193 = 1527;
          _os_log_fault_impl(&dword_18AB82000, v78, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }

    *((void *)v198 + 5) = 0;
    int v79 = *((unsigned __int8 *)v179 + 24);
    _Block_object_dispose(v197, 8);
    _Block_object_dispose(&v178, 8);
    if (v79)
    {
      if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataNeedsMetadataMigrationKey", 0, *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), &v172))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        id v27 = v172;
        goto LABEL_17;
      }
      uint64_t v80 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"PFCloudKitMetadataModelMigratorMigrationBeganCommitKey", *(void *)(*(void *)(a1 + 32) + 8), *(void **)(*(void *)(a1 + 32) + 16), (uint64_t)&v172);
      if (v80)
      {
        v81 = (void *)a1;
        [*(id *)(*(void *)(a1 + 32) + 16) deleteObject:v80];
      }
      else
      {
        id v82 = v172;
        v81 = (void *)a1;
        if (v172)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v82;
        }
      }
      if (*(unsigned char *)(*(void *)(v81[5] + 8) + 24)
        && ([*(id *)(v81[4] + 16) save:&v172] & 1) == 0)
      {
        *(unsigned char *)(*(void *)(v81[5] + 8) + 24) = 0;
        id v27 = v172;
        uint64_t v28 = v81[6];
        goto LABEL_18;
      }
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v172;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

uint64_t __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke_2(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    uint64_t result = a3;
    uint64_t v13 = a1 + 6;
    goto LABEL_15;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a2);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (![v11 recordZone]) {
          [v11 setRecordZone:a1[4]];
        }
      }
      uint64_t v8 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  uint64_t result = [*(id *)(a1[5] + 16) hasChanges];
  if (result)
  {
    uint64_t v13 = a1 + 6;
    uint64_t result = [*(id *)(a1[5] + 16) save:*(void *)(a1[6] + 8) + 40];
    if ((result & 1) == 0)
    {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
      uint64_t result = (uint64_t)*(id *)(*(void *)(a1[6] + 8) + 40);
LABEL_15:
      *(void *)(*(void *)(*v13 + 8) + 40) = result;
      *a4 = 1;
    }
  }
  return result;
}

- (uint64_t)checkForOrphanedMirroredRelationshipsInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v55 = 0;
  id v5 = (id)[a2 persistentStoreCoordinator];
  uint64_t v6 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath]);
  [(NSFetchRequest *)v6 setPropertiesToFetch:&unk_1ED7E9B20];
  [(NSFetchRequest *)v6 setPropertiesToGroupBy:&unk_1ED7E9B38];
  [(NSFetchRequest *)v6 setResultType:2];
  uint64_t v7 = [a3 executeFetchRequest:v6 error:&v55];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = (void *)[v5 managedObjectModel];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v50 = [v8 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v50)
    {
      unint64_t v46 = v9;
      uint64_t v43 = a4;
      id v44 = v5;
      uint64_t v10 = *(void *)v52;
      uint64_t v45 = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v52 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v13 = (void *)MEMORY[0x18C127630]();
          uint64_t v14 = [v12 objectForKeyedSubscript:@"cdEntityName"];
          uint64_t v15 = [v12 objectForKeyedSubscript:@"relationshipName"];
          if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "entitiesByName"), "objectForKeyedSubscript:", v14), "relationshipsByName"), "objectForKeyedSubscript:", v15))
          {
            v49 = v13;
            long long v16 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath]);
            -[NSFetchRequest setPredicate:](v16, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"cdEntityName = %@ AND relationshipName = %@", v14, v15]);
            long long v17 = [[NSBatchDeleteRequest alloc] initWithFetchRequest:v16];
            [(NSBatchDeleteRequest *)v17 setResultType:2];
            uint64_t v18 = [a3 executeRequest:v17 error:&v55];
            if (!v18)
            {
              id v32 = v55;

              a4 = v43;
              id v5 = v44;
              goto LABEL_19;
            }
            uint64_t v19 = (void *)v18;
            context = (void *)MEMORY[0x18C127630]();
            uint64_t v20 = v10;
            if ((unint64_t)__ckLoggingOverride >= 3) {
              uint64_t v21 = 3;
            }
            else {
              uint64_t v21 = __ckLoggingOverride;
            }
            uint64_t v22 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ deleted %@ mirrored relationship entries because %@:%@ is no longer in the managed object model of this store: %@"];
            [v19 result];
            uint64_t v23 = v21;
            uint64_t v10 = v20;
            _NSCoreDataLog(v23, v22, v24, v25, v26, v27, v28, v29, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForOrphanedMirroredRelationshipsInStore:inManagedObjectContext:error:]");
            uint64_t v8 = v45;
            uint64_t v9 = v46;

            uint64_t v13 = v49;
          }
        }
        uint64_t v50 = [v8 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v50) {
          continue;
        }
        break;
      }
      uint64_t v30 = 1;
      id v5 = v44;
    }
    else
    {
      uint64_t v30 = 1;
    }
    goto LABEL_26;
  }
  id v31 = v55;
LABEL_19:
  id v33 = v55;
  if (!v33)
  {
    uint64_t v34 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
    v41 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v57 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
      __int16 v58 = 1024;
      int v59 = 1476;
      _os_log_fault_impl(&dword_18AB82000, v41, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_24;
  }
  if (!a4)
  {
LABEL_24:
    uint64_t v30 = 0;
    goto LABEL_26;
  }
  uint64_t v30 = 0;
  *a4 = v33;
LABEL_26:

  return v30;
}

- (BOOL)checkForCorruptedRecordMetadataInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:
{
  v60[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v51 = 0;
  long long v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 1;
  uint64_t v45 = 0;
  unint64_t v46 = &v45;
  uint64_t v47 = 0x3052000000;
  v48 = __Block_byref_object_copy__57;
  v49 = __Block_byref_object_dispose__57;
  uint64_t v50 = 0;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
  uint64_t v8 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
  [(NSFetchRequest *)v8 setFetchBatchSize:500];
  [(NSFetchRequest *)v8 setPropertiesToFetch:&unk_1ED7E9B80];
  v60[0] = a2;
  -[NSFetchRequest setAffectedStores:](v8, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1]);
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __103__PFCloudKitMetadataModelMigrator_checkForCorruptedRecordMetadataInStore_inManagedObjectContext_error___block_invoke;
  v40[3] = &unk_1E544F9D8;
  v40[4] = a2;
  v40[5] = v7;
  v40[6] = &v41;
  v40[7] = &v51;
  v40[8] = &v45;
  +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v8, a3, (uint64_t)v40);
  if (!*((unsigned char *)v52 + 24)) {
    goto LABEL_11;
  }
  if (*((unsigned char *)v42 + 24))
  {
    uint64_t v9 = [[NSBatchDeleteRequest alloc] initWithFetchRequest:+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath])];
    [(NSBatchDeleteRequest *)v9 setResultType:0];
    uint64_t v59 = a2;
    -[NSPersistentStoreRequest setAffectedStores:](v9, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1]);
    int v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "executeRequest:error:", v9, v46 + 5), "result"), "BOOLValue");
    uint64_t v11 = (void *)MEMORY[0x18C127630]();
    unint64_t v12 = __ckLoggingOverride;
    if (v10)
    {
      uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Successfully purged record metadata during migration due to corrupted metadatas."];
      uint64_t v20 = v12 >= 0x10 ? 16 : v12;
      _NSCoreDataLog(v20, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:]");
      *((unsigned char *)v52 + 24) = 1;
    }
    else
    {
      uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to purged corrupted record metadata during migration: %@"];
      _NSCoreDataLog(v12 != 0, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:]");
      *((unsigned char *)v52 + 24) = 0;
      id v28 = (id)v46[5];
    }

    if (!*((unsigned char *)v52 + 24))
    {
LABEL_11:
      id v29 = (id)v46[5];
      if (v29)
      {
        if (a4) {
          *a4 = v29;
        }
      }
      else
      {
        uint64_t v30 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        uint64_t v37 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          __int16 v57 = 1024;
          int v58 = 1763;
          _os_log_fault_impl(&dword_18AB82000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }
  }

  v46[5] = 0;
  BOOL v38 = *((unsigned char *)v52 + 24) != 0;
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
  return v38;
}

- (BOOL)cleanUpAfterClientMigrationWithStore:(void *)a3 andContext:(void *)a4 error:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 1;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3052000000;
  char v44 = __Block_byref_object_copy__57;
  uint64_t v45 = __Block_byref_object_dispose__57;
  uint64_t v46 = 0;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = (void *)[a2 model];
  if (v7) {
    uint64_t v7 = (void *)v7[4];
  }
  uint64_t v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));
  id v9 = objc_alloc(MEMORY[0x1E4F1CA80]);
  int v10 = (void *)[a2 model];
  if (v10) {
    int v10 = (void *)v10[4];
  }
  uint64_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v12 = [a2 model];
  if (v12) {
    uint64_t v13 = *(void **)(v12 + 32);
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(unsigned int **)(*((void *)&v37 + 1) + 8 * v16);
        if (v17) {
          uint64_t v18 = v17[46];
        }
        else {
          uint64_t v18 = 0;
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v18));
        objc_msgSend(v11, "addObject:", objc_msgSend(v17, "name"));
        ++v16;
      }
      while (v14 != v16);
      uint64_t v19 = [v13 countByEnumeratingWithState:&v37 objects:v57 count:16];
      uint64_t v14 = v19;
    }
    while (v19);
  }
  uint64_t v20 = [[NSFetchRequest alloc] initWithEntityName:+[NSCKRecordMetadata entityPath]];
  -[NSFetchRequest setPredicate:](v20, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (entityId IN %@)", v8]);
  uint64_t v21 = [[NSBatchDeleteRequest alloc] initWithFetchRequest:v20];
  [(NSBatchDeleteRequest *)v21 setResultType:0];
  v56 = a2;
  -[NSPersistentStoreRequest setAffectedStores:](v21, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1]);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "executeRequest:error:", v21, v42 + 5), "result"), "BOOLValue"))
  {
    uint64_t v22 = [[NSFetchRequest alloc] initWithEntityName:+[NSCKMirroredRelationship entityPath]];
    [(NSFetchRequest *)v22 setFetchBatchSize:500];
    [(NSFetchRequest *)v22 setPropertiesToFetch:&unk_1ED7E9B98];
    id v55 = a2;
    -[NSFetchRequest setAffectedStores:](v22, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1]);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __89__PFCloudKitMetadataModelMigrator_cleanUpAfterClientMigrationWithStore_andContext_error___block_invoke;
    v36[3] = &unk_1E544F988;
    v36[4] = v11;
    v36[5] = a2;
    v36[6] = a3;
    v36[7] = &v41;
    v36[8] = &v47;
    +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v22, a3, (uint64_t)v36);
  }
  else
  {
    *((unsigned char *)v48 + 24) = 0;
    id v23 = (id)v42[5];
  }

  if (!*((unsigned char *)v48 + 24))
  {
    id v26 = (id)v42[5];
    if (v26)
    {
      if (a4) {
        *a4 = v26;
      }
    }
    else
    {
      uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      uint64_t v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v52 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        __int16 v53 = 1024;
        int v54 = 1840;
        _os_log_fault_impl(&dword_18AB82000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v42[5] = 0;
  BOOL v24 = *((unsigned char *)v48 + 24) != 0;
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  return v24;
}

- (BOOL)checkAndPerformMigrationIfNecessary:(uint64_t *)a1
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v51 = 0;
  long long v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3052000000;
  v48 = __Block_byref_object_copy__57;
  uint64_t v49 = __Block_byref_object_dispose__57;
  uint64_t v50 = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __71__PFCloudKitMetadataModelMigrator_checkAndPerformMigrationIfNecessary___block_invoke;
  v44[3] = &unk_1E544F938;
  v44[4] = a1;
  v44[5] = &v51;
  v44[6] = &v45;
  uint64_t v4 = [[NSSQLBlockRequestContext alloc] initWithBlock:v44 context:0 sqlCore:a1[1]];
  -[NSSQLCore dispatchRequest:withRetries:](a1[1], v4, 0);

  if (!*((unsigned char *)v52 + 24)) {
    goto LABEL_18;
  }
  id v5 = v46;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 1;
  uint64_t v56 = 0;
  __int16 v57 = &v56;
  uint64_t v58 = 0x3052000000;
  uint64_t v59 = __Block_byref_object_copy__57;
  v60 = __Block_byref_object_dispose__57;
  uint64_t v61 = 0;
  id v6 = (void *)a1[2];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __69__PFCloudKitMetadataModelMigrator_commitMigrationMetadataAndCleanup___block_invoke;
  v55[3] = &unk_1E544BEB8;
  v55[4] = a1;
  v55[5] = &v62;
  v55[6] = &v56;
  [v6 performBlockAndWait:v55];
  if (!*((unsigned char *)v63 + 24)) {
    goto LABEL_12;
  }
  if (a1[4] == 2)
  {
    uint64_t v7 = (void *)a1[1];
    uint64_t v8 = v57;
    uint64_t v72 = 0;
    uint64_t v73 = &v72;
    uint64_t v74 = 0x2020000000;
    char v75 = 1;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3052000000;
    uint64_t v69 = __Block_byref_object_copy__57;
    v70 = __Block_byref_object_dispose__57;
    uint64_t v71 = 0;
    id v9 = (id)[v7 persistentStoreCoordinator];
    int v10 = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
    [(NSManagedObjectContext *)v10 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    [(NSManagedObjectContext *)v10 setPersistentStoreCoordinator:v9];
    [(NSManagedObjectContext *)v10 _setAllowAncillaryEntities:1];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke;
    v81 = &unk_1E544F960;
    id v82 = a1;
    v83 = v7;
    id v86 = &v66;
    uint64_t v87 = &v72;
    id v84 = v10;
    id v85 = v9;
    [(NSManagedObjectContext *)v10 performBlockAndWait:buf];

    if (!*((unsigned char *)v73 + 24))
    {
      id v11 = (id)v67[5];
      if (v11)
      {
        v8[5] = (uint64_t)v11;
      }
      else
      {
        uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        uint64_t v19 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)uint64_t v76 = 136315394;
          uint64_t v77 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          __int16 v78 = 1024;
          int v79 = 1427;
          _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v76, 0x12u);
        }
      }
    }

    v67[5] = 0;
    int v20 = *((unsigned __int8 *)v73 + 24);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v72, 8);
    *((unsigned char *)v63 + 24) = v20;
    if (!v20)
    {
      id v21 = (id)v57[5];
      if (!*((unsigned char *)v63 + 24))
      {
LABEL_12:
        id v22 = (id)v57[5];
        if (v22)
        {
          v5[5] = (uint64_t)v22;
        }
        else
        {
          uint64_t v23 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
          uint64_t v30 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1146;
            _os_log_fault_impl(&dword_18AB82000, v30, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
      }
    }
  }

  v57[5] = 0;
  int v31 = *((unsigned __int8 *)v63 + 24);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);
  *((unsigned char *)v52 + 24) = v31;
  if (!v31)
  {
    id v32 = (id)v46[5];
    if (!*((unsigned char *)v52 + 24))
    {
LABEL_18:
      id v33 = (id)v46[5];
      if (v33)
      {
        if (a2) {
          *a2 = v33;
        }
      }
      else
      {
        uint64_t v34 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        uint64_t v41 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1189;
          _os_log_fault_impl(&dword_18AB82000, v41, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }
  }

  v46[5] = 0;
  BOOL v42 = *((unsigned char *)v52 + 24) != 0;
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
  return v42;
}

void __71__PFCloudKitMetadataModelMigrator_checkAndPerformMigrationIfNecessary___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v453 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  uint64_t v2 = (uint64_t *)a1[4];
  if (a2) {
    uint64_t v3 = *(void **)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  if (!v2) {
    goto LABEL_386;
  }
  uint64_t v4 = *(void *)(a1[6] + 8);
  *(void *)&long long v425 = 0;
  *((void *)&v425 + 1) = &v425;
  *(void *)&long long v426 = 0x2020000000;
  BYTE8(v426) = 1;
  uint64_t v440 = 0;
  v441 = &v440;
  uint64_t v442 = 0x3052000000;
  v443 = __Block_byref_object_copy__57;
  v444 = __Block_byref_object_dispose__57;
  uint64_t v445 = 0;
  uint64_t PFBundleVersion = (void *)+[_PFRoutines _getPFBundleVersionNumber]();
  id v6 = +[PFCloudKitMetadataModel newMetadataModelForFrameworkVersion:]((uint64_t)PFCloudKitMetadataModel, PFBundleVersion);
  uint64_t v8 = [[NSSQLModel alloc] initWithManagedObjectModel:v6];
  id v9 = (void *)v2[3];
  if (v9)
  {
    objc_setProperty_nonatomic(v9, v7, v6, 48);
    id v11 = (void *)v2[3];
    if (v11) {
      objc_setProperty_nonatomic(v11, v10, v8, 56);
    }
  }
  v422[0] = 0;
  id v12 = +[PFCloudKitMetadataModel identifyModelForStore:withConnection:hasOldMetadataTables:]((uint64_t)PFCloudKitMetadataModel, v2[1], v3, v422);
  uint64_t v14 = [[NSSQLModel alloc] initWithManagedObjectModel:v12];
  uint64_t v15 = (void *)v2[3];
  if (v15)
  {
    objc_setProperty_nonatomic(v15, v13, v12, 64);
    uint64_t v17 = (void *)v2[3];
    if (v17)
    {
      objc_setProperty_nonatomic(v17, v16, v14, 72);
      uint64_t v18 = v2[3];
      if (v18) {
        *(unsigned char *)(v18 + 34) = v422[0];
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend((id)v2[1], "metadata"), "objectForKey:", @"PFCloudKitMetadataNeedsZoneFetchAfterClientMigrationKey"))
  {
    uint64_t v19 = v2[3];
    if (v19) {
      *(unsigned char *)(v19 + 36) = 1;
    }
  }
  int v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = objc_msgSend(-[NSSQLModel entityNamed:](v8, "entityNamed:", NSStringFromClass(v20)), "tableName");
  if (v3 && (-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v3, v21, 0) & 1) != 0)
  {
    *(void *)v423 = 0;
    *(void *)&v423[8] = v423;
    *(void *)&v423[16] = 0x2020000000;
    char v424 = 0;
    if (v8) {
      entitiesByName = v8->_entitiesByName;
    }
    else {
      entitiesByName = 0;
    }
    *(void *)&long long v429 = MEMORY[0x1E4F143A8];
    *((void *)&v429 + 1) = 3221225472;
    *(void *)&long long v430 = __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke;
    *((void *)&v430 + 1) = &unk_1E544F8E8;
    *(void *)&long long v431 = v14;
    *((void *)&v431 + 1) = v423;
    uint64_t v23 = [(NSKnownKeysDictionary *)entitiesByName enumerateKeysAndObjectsUsingBlock:&v429];
    if (*(unsigned char *)(*(void *)&v423[8] + 24))
    {
      uint64_t v24 = (void *)MEMORY[0x18C127630](v23);
      unint64_t v25 = __ckLoggingOverride;
      uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Migration discovered mutated entity IDs, precomputing z_ent changes."];
      uint64_t v33 = v25 >= 0x10 ? 16 : v25;
      _NSCoreDataLog(v33, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[PFCloudKitMetadataModelMigrator prepareContextWithConnection:error:]");
      BOOL v34 = -[PFCloudKitMetadataModelMigrator computeAncillaryEntityPrimaryKeyTableEntriesForStore:error:]((uint64_t)v2, v2[1], v441 + 5);
      *(unsigned char *)(*((void *)&v425 + 1) + 24) = v34;
      if (!v34) {
        id v35 = (id)v441[5];
      }
    }
    uint64_t v36 = (void *)v2[2];
    *(void *)v446 = MEMORY[0x1E4F143A8];
    *(void *)&v446[8] = 3221225472;
    *(void *)&v446[16] = __70__PFCloudKitMetadataModelMigrator_prepareContextWithConnection_error___block_invoke_2;
    v447 = &unk_1E544BEB8;
    v448 = v2;
    v449 = (id *)&v425;
    v450 = &v440;
    [v36 performBlockAndWait:v446];
    _Block_object_dispose(v423, 8);
  }
  else
  {
    uint64_t v37 = v2[3];
    if (v37)
    {
      *(unsigned char *)(v37 + 33) = 1;
      uint64_t v38 = v2[3];
      if (v38) {
        *(unsigned char *)(v38 + 37) = 1;
      }
    }
  }

  if (!*(unsigned char *)(*((void *)&v425 + 1) + 24))
  {
    id v39 = (id)v441[5];
    if (v39)
    {
      *(void *)(v4 + 40) = v39;
    }
    else
    {
      uint64_t v40 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v40, v41, v42, v43, v44, v45, v46, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      uint64_t v47 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v423 = 136315394;
        *(void *)&v423[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        *(_WORD *)&v423[12] = 1024;
        *(_DWORD *)&v423[14] = 184;
        _os_log_fault_impl(&dword_18AB82000, v47, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v423, 0x12u);
      }
    }
  }

  v441[5] = 0;
  int v48 = *(unsigned __int8 *)(*((void *)&v425 + 1) + 24);
  _Block_object_dispose(&v440, 8);
  _Block_object_dispose(&v425, 8);
  if (!v48) {
    goto LABEL_386;
  }
  uint64_t v49 = a1[4];
  if (a2)
  {
    uint64_t v50 = *(void **)(a2 + 24);
    if (!v49) {
      goto LABEL_386;
    }
  }
  else
  {
    uint64_t v50 = 0;
    if (!v49) {
      goto LABEL_386;
    }
  }
  uint64_t v339 = *(void *)(a1[6] + 8);
  uint64_t v407 = 0;
  v408 = &v407;
  uint64_t v409 = 0x2020000000;
  char v410 = 1;
  uint64_t v401 = 0;
  v402 = &v401;
  uint64_t v403 = 0x3052000000;
  v404 = __Block_byref_object_copy__57;
  v405 = __Block_byref_object_dispose__57;
  uint64_t v406 = 0;
  uint64_t v51 = *(void *)(v49 + 24);
  v347 = v50;
  if (!v51)
  {
    long long v399 = 0u;
    long long v400 = 0u;
    long long v397 = 0u;
    long long v398 = 0u;
    goto LABEL_50;
  }
  if (!*(unsigned char *)(v51 + 34))
  {
    long long v399 = 0u;
    long long v400 = 0u;
    long long v397 = 0u;
    long long v398 = 0u;
LABEL_48:
    uint64_t v57 = *(void *)(v51 + 56);
    if (v57) {
      uint64_t v51 = *(void *)(v57 + 32);
    }
    else {
      uint64_t v51 = 0;
    }
    goto LABEL_50;
  }
  long long v52 = (NSSQLiteStatement *)[v50 adapter];
  long long v411 = 0u;
  long long v412 = 0u;
  long long v413 = 0u;
  long long v414 = 0u;
  uint64_t v53 = [&unk_1ED7E9B50 countByEnumeratingWithState:&v411 objects:v446 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v412;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v412 != v54) {
          objc_enumerationMutation(&unk_1ED7E9B50);
        }
        uint64_t v56 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v52, *(void *)(*((void *)&v411 + 1) + 8 * i));
        [*(id *)(v51 + 8) addObject:v56];
        *(unsigned char *)(v51 + 32) = 1;
      }
      uint64_t v53 = [&unk_1ED7E9B50 countByEnumeratingWithState:&v411 objects:v446 count:16];
    }
    while (v53);
  }
  uint64_t v51 = *(void *)(v49 + 24);
  long long v399 = 0u;
  long long v400 = 0u;
  long long v397 = 0u;
  long long v398 = 0u;
  uint64_t v50 = v347;
  if (v51) {
    goto LABEL_48;
  }
LABEL_50:
  uint64_t v58 = [(id)v51 countByEnumeratingWithState:&v397 objects:&v440 count:16];
  if (v58)
  {
    uint64_t v348 = *(void *)v398;
    uint64_t v344 = v51;
    do
    {
      uint64_t v349 = 0;
      uint64_t v345 = v58;
      do
      {
        if (*(void *)v398 != v348) {
          objc_enumerationMutation((id)v51);
        }
        if (!*((unsigned char *)v408 + 24)) {
          goto LABEL_354;
        }
        uint64_t v59 = *(id **)(*((void *)&v397 + 1) + 8 * v349);
        uint64_t v60 = [v59 tableName];
        if (!v50 || (-[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v50, v60, 0) & 1) == 0)
        {
          uint64_t v66 = *(void *)(v49 + 24);
          if (!v66) {
            goto LABEL_161;
          }
LABEL_159:
          [*(id *)(v66 + 16) addObject:v59];
          long long v154 = (unsigned char *)(v66 + 32);
LABEL_160:
          *long long v154 = 1;
          goto LABEL_161;
        }
        if (!-[NSSQLiteConnection _tableHasRows:]((BOOL)v50, [v59 tableName]))
        {
          v67 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]((NSSQLiteStatement *)[v50 adapter], objc_msgSend(v59, "tableName"));
          uint64_t v68 = *(void *)(v49 + 24);
          if (v68)
          {
            [*(id *)(v68 + 8) addObject:v67];
            *(unsigned char *)(v68 + 32) = 1;
          }

          uint64_t v66 = *(void *)(v49 + 24);
          if (v66) {
            goto LABEL_159;
          }
          goto LABEL_161;
        }
        id v61 = -[NSSQLiteConnection fetchTableCreationSQLContaining:](v50, (void *)[v59 tableName]);
        long long v414 = 0u;
        long long v413 = 0u;
        long long v412 = 0u;
        long long v411 = 0u;
        uint64_t v62 = [v61 countByEnumeratingWithState:&v411 objects:v446 count:16];
        if (v62)
        {
          uint64_t v63 = *(void *)v412;
LABEL_61:
          uint64_t v64 = 0;
          while (1)
          {
            if (*(void *)v412 != v63) {
              objc_enumerationMutation(v61);
            }
            char v65 = *(void **)(*((void *)&v411 + 1) + 8 * v64);
            if (objc_msgSend((id)objc_msgSend(v65, "objectAtIndex:", 0), "isEqualToString:", objc_msgSend(v59, "tableName")))break; {
            if (v62 == ++v64)
            }
            {
              uint64_t v62 = [v61 countByEnumeratingWithState:&v411 objects:v446 count:16];
              if (v62) {
                goto LABEL_61;
              }
              goto LABEL_75;
            }
          }
          id v351 = (id)[v65 objectAtIndex:1];
          if (v351) {
            goto LABEL_78;
          }
        }
LABEL_75:
        uint64_t v69 = [NSString stringWithUTF8String:"Couldn't find sql for table '%@', did you check if it exists first?"];
        uint64_t v70 = [v59 tableName];
        _NSCoreDataLog(17, v69, v71, v72, v73, v74, v75, v76, v70);
        uint64_t v77 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          uint64_t v130 = [v59 tableName];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v130;
          _os_log_fault_impl(&dword_18AB82000, v77, OS_LOG_TYPE_FAULT, "CoreData: Couldn't find sql for table '%@', did you check if it exists first?", (uint8_t *)&buf, 0xCu);
        }
        id v351 = 0;
LABEL_78:
        __int16 v78 = (void *)[v59 name];
        int v79 = (objc_class *)objc_opt_class();
        if (([v78 isEqualToString:NSStringFromClass(v79)] & 1) == 0)
        {
          uint64_t v80 = (void *)[v59 name];
          v81 = (objc_class *)objc_opt_class();
          if (![v80 isEqualToString:NSStringFromClass(v81)])
          {
            uint64_t v121 = (void *)[v59 name];
            char v122 = (objc_class *)objc_opt_class();
            if (![v121 isEqualToString:NSStringFromClass(v122)]) {
              goto LABEL_153;
            }
            BOOL v123 = *(void **)(v49 + 16);
            v388[0] = MEMORY[0x1E4F143A8];
            v388[1] = 3221225472;
            v388[2] = __79__PFCloudKitMetadataModelMigrator_calculateMigrationStepsWithConnection_error___block_invoke;
            v388[3] = &unk_1E544F910;
            v388[4] = v49;
            v388[5] = v59;
            v388[6] = &v401;
            v388[7] = &v407;
            [v123 performBlockAndWait:v388];
            [*(id *)(v49 + 24) addConstrainedEntityToPreflight:v59];
            uint64_t v124 = [v347 adapter];
            if (v124) {
              id v125 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v124, (uint64_t)v59, 0);
            }
            else {
              id v125 = 0;
            }
            long long v386 = 0u;
            long long v387 = 0u;
            long long v384 = 0u;
            long long v385 = 0u;
            uint64_t v126 = [v125 countByEnumeratingWithState:&v384 objects:v423 count:16];
            if (v126)
            {
              uint64_t v127 = *(void *)v385;
              do
              {
                for (uint64_t j = 0; j != v126; ++j)
                {
                  if (*(void *)v385 != v127) {
                    objc_enumerationMutation(v125);
                  }
                  uint64_t v129 = *(void *)(v49 + 24);
                  if (v129)
                  {
                    [*(id *)(v129 + 8) addObject:*(void *)(*((void *)&v384 + 1) + 8 * j)];
                    *(unsigned char *)(v129 + 32) = 1;
                  }
                }
                uint64_t v126 = [v125 countByEnumeratingWithState:&v384 objects:v423 count:16];
              }
              while (v126);
            }
LABEL_136:

            goto LABEL_153;
          }
        }
        uint64_t v82 = *(void *)(v49 + 24);
        if (v82) {
          v83 = *(void **)(v82 + 72);
        }
        else {
          v83 = 0;
        }
        uint64_t v84 = objc_msgSend(v83, "entityNamed:", objc_msgSend(v59, "name"));
        if ([v351 containsString:@"ZENTITYNAME"]) {
          -[PFCloudKitMetadataModelMigrator addMigrationStatementToContext:forRenamingAttributeNamed:withOldColumnName:toAttributeName:onOldSQLEntity:andCurrentSQLEntity:](*(void *)(v49 + 24), @"entityName", @"ZENTITYNAME", @"cdEntityName", v84, v59);
        }
        if ([v351 containsString:@"ZISDELETED"]) {
          -[PFCloudKitMetadataModelMigrator addMigrationStatementToContext:forRenamingAttributeNamed:withOldColumnName:toAttributeName:onOldSQLEntity:andCurrentSQLEntity:](*(void *)(v49 + 24), @"isDeleted", @"ZISDELETED", @"needsDelete", v84, v59);
        }
        id v85 = (void *)[v59 name];
        id v86 = (objc_class *)objc_opt_class();
        if (![v85 isEqualToString:NSStringFromClass(v86)])
        {
          v96 = (void *)[v59 name];
          v97 = (objc_class *)objc_opt_class();
          if (![v96 isEqualToString:NSStringFromClass(v97)]) {
            goto LABEL_153;
          }
          long long v391 = 0u;
          long long v392 = 0u;
          long long v389 = 0u;
          long long v390 = 0u;
          uint64_t v98 = [&unk_1ED7E9A30 countByEnumeratingWithState:&v389 objects:&v425 count:16];
          if (!v98) {
            goto LABEL_153;
          }
          uint64_t v99 = *(void *)v390;
          while (2)
          {
            uint64_t v100 = 0;
LABEL_100:
            if (*(void *)v390 != v99) {
              objc_enumerationMutation(&unk_1ED7E9A30);
            }
            v101 = *(void **)(*((void *)&v389 + 1) + 8 * v100);
            if (v59) {
              unint64_t v102 = (unsigned char *)[v59[5] objectForKey:*(void *)(*((void *)&v389 + 1) + 8 * v100)];
            }
            else {
              unint64_t v102 = 0;
            }
            if (objc_msgSend(v351, "containsString:", objc_msgSend(v102, "columnName")))
            {
              uint64_t v103 = (void *)MEMORY[0x18C127630]();
              if ((unint64_t)__ckLoggingOverride >= 9) {
                uint64_t v104 = 9;
              }
              else {
                uint64_t v104 = __ckLoggingOverride;
              }
              uint64_t v105 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping migration for '%@' because it already has a column named '%@'"];
              [v59 tableName];
              [v102 columnName];
              _NSCoreDataLog(v104, v105, v106, v107, v108, v109, v110, v111, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
LABEL_114:
              if (v98 == ++v100)
              {
                uint64_t v120 = [&unk_1ED7E9A30 countByEnumeratingWithState:&v389 objects:&v425 count:16];
                uint64_t v98 = v120;
                if (!v120) {
                  goto LABEL_153;
                }
                continue;
              }
              goto LABEL_100;
            }
            break;
          }
          -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v102, *(void *)(v49 + 24), *(void **)(v49 + 8));
          if (([v101 isEqualToString:@"recordZoneName"] & 1) != 0
            || [v101 isEqualToString:@"relatedRecordZoneName"])
          {
            uint64_t v112 = [NSSQLiteStatement alloc];
            id v113 = -[NSSQLiteStatement initWithEntity:sqlString:](v112, "initWithEntity:sqlString:", v59, [NSString stringWithFormat:@"UPDATE %@ SET %@ = '%@'", objc_msgSend(v59, "tableName"), objc_msgSend(v102, "columnName"), @"com.apple.coredata.cloudkit.zone"]);
            uint64_t v114 = *(void *)(v49 + 24);
            if (v114)
            {
              [*(id *)(v114 + 8) addObject:v113];
              *(unsigned char *)(v114 + 32) = 1;
            }
          }
          else
          {
            if (([v101 isEqualToString:@"recordZoneOwnerName"] & 1) == 0
              && ![v101 isEqualToString:@"relatedRecordZoneOwnerName"])
            {
              goto LABEL_114;
            }
            uint64_t v115 = [NSSQLiteStatement alloc];
            uint64_t v116 = NSString;
            uint64_t v117 = [v59 tableName];
            uint64_t v118 = [v102 columnName];
            id v113 = -[NSSQLiteStatement initWithEntity:sqlString:](v115, "initWithEntity:sqlString:", v59, [v116 stringWithFormat:@"UPDATE %@ SET %@ = '%@'", v117, v118, getCloudKitCKCurrentUserDefaultName[0]()]);
            uint64_t v119 = *(void *)(v49 + 24);
            if (v119)
            {
              [*(id *)(v119 + 8) addObject:v113];
              *(unsigned char *)(v119 + 32) = 1;
            }
          }

          goto LABEL_114;
        }
        if (v59) {
          uint64_t v87 = (void *)[v59[5] objectForKey:@"recordZone"];
        }
        else {
          uint64_t v87 = 0;
        }
        if ((objc_msgSend(v351, "containsString:", objc_msgSend(v87, "columnName")) & 1) == 0)
        {
          uint64_t v88 = (void *)[[NSString alloc] initWithFormat:@"ALTER TABLE %@ ADD COLUMN %@ INTEGER", objc_msgSend(v59, "tableName"), objc_msgSend(v87, "columnName")];
          uint64_t v89 = [[NSSQLiteStatement alloc] initWithEntity:v59 sqlString:v88];
          uint64_t v90 = *(void *)(v49 + 24);
          if (v90)
          {
            [*(id *)(v90 + 8) addObject:v89];
            *(unsigned char *)(v90 + 32) = 1;
            uint64_t v91 = *(void *)(v49 + 24);
            if (v91) {
              *(unsigned char *)(v91 + 35) = 1;
            }
          }

          v92 = *(uint64_t **)(v49 + 16);
          uint64_t v93 = *(uint64_t **)(v49 + 24);
          v94 = v402;
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v438 = 0x2020000000;
          char v439 = 1;
          *(void *)&long long v411 = 0;
          *((void *)&v411 + 1) = &v411;
          *(void *)&long long v412 = 0x3052000000;
          *((void *)&v412 + 1) = __Block_byref_object_copy__57;
          *(void *)&long long v413 = __Block_byref_object_dispose__57;
          *((void *)&v413 + 1) = 0;
          *(void *)v446 = MEMORY[0x1E4F143A8];
          *(void *)&v446[8] = 3221225472;
          *(void *)&v446[16] = __149__PFCloudKitMetadataModelMigrator_addMigrationStatementsToDeleteDuplicateMirroredRelationshipsToContext_withManagedObjectContext_andSQLEntity_error___block_invoke;
          v447 = &unk_1E544F9B0;
          v448 = v92;
          v449 = v59;
          v451 = &v411;
          v450 = v93;
          p_long long buf = &buf;
          [v92 performBlockAndWait:v446];
          if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
          {
            id v95 = *(id *)(*((void *)&v411 + 1) + 40);
            if (v95)
            {
              v94[5] = (uint64_t)v95;
            }
            else
            {
              uint64_t v131 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
              _NSCoreDataLog(17, v131, v132, v133, v134, v135, v136, v137, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
              v138 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v433 = 136315394;
                v434 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
                __int16 v435 = 1024;
                int v436 = 1695;
                _os_log_fault_impl(&dword_18AB82000, v138, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v433, 0x12u);
              }
            }
          }

          *(void *)(*((void *)&v411 + 1) + 40) = 0;
          int v139 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
          _Block_object_dispose(&v411, 8);
          _Block_object_dispose(&buf, 8);
          if (!v139)
          {
            *((unsigned char *)v408 + 24) = 0;
            id v145 = (id)v402[5];
            goto LABEL_153;
          }
          uint64_t v140 = [v347 adapter];
          if (v140) {
            id v125 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v140, (uint64_t)v59, 0);
          }
          else {
            id v125 = 0;
          }
          long long v395 = 0u;
          long long v396 = 0u;
          long long v393 = 0u;
          long long v394 = 0u;
          uint64_t v141 = [v125 countByEnumeratingWithState:&v393 objects:&v429 count:16];
          if (v141)
          {
            uint64_t v142 = *(void *)v394;
            do
            {
              for (uint64_t k = 0; k != v141; ++k)
              {
                if (*(void *)v394 != v142) {
                  objc_enumerationMutation(v125);
                }
                uint64_t v144 = *(void *)(v49 + 24);
                if (v144)
                {
                  [*(id *)(v144 + 8) addObject:*(void *)(*((void *)&v393 + 1) + 8 * k)];
                  *(unsigned char *)(v144 + 32) = 1;
                }
              }
              uint64_t v141 = [v125 countByEnumeratingWithState:&v393 objects:&v429 count:16];
            }
            while (v141);
          }
          goto LABEL_136;
        }
LABEL_153:
        uint64_t v50 = v347;
        uint64_t v51 = v344;
        uint64_t v58 = v345;
        char v146 = (void *)[v59 name];
        v147 = (objc_class *)objc_opt_class();
        if (([v146 isEqualToString:NSStringFromClass(v147)] & 1) != 0
          || (BOOL v148 = (void *)[v59 name],
              v149 = (objc_class *)objc_opt_class(),
              ([v148 isEqualToString:NSStringFromClass(v149)] & 1) != 0)
          || (uint64_t v150 = (void *)[v59 name],
              uint64_t v151 = (objc_class *)objc_opt_class(),
              [v150 isEqualToString:NSStringFromClass(v151)]))
        {
          id v152 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:]((NSSQLiteStatement *)[v347 adapter], objc_msgSend(v59, "tableName"));
          uint64_t v153 = *(void *)(v49 + 24);
          if (v153)
          {
            [*(id *)(v153 + 8) addObject:v152];
            *(unsigned char *)(v153 + 32) = 1;
          }

          uint64_t v66 = *(void *)(v49 + 24);
          if (v66) {
            goto LABEL_159;
          }
        }
        else
        {
          long long v155 = (void *)[v59 name];
          long long v156 = (objc_class *)objc_opt_class();
          if ([v155 isEqualToString:NSStringFromClass(v156)])
          {
            long long v382 = 0u;
            long long v383 = 0u;
            long long v380 = 0u;
            long long v381 = 0u;
            uint64_t v157 = [&unk_1ED7E9A60 countByEnumeratingWithState:&v380 objects:v422 count:16];
            if (v157)
            {
              uint64_t v158 = *(void *)v381;
              do
              {
                uint64_t v159 = 0;
                do
                {
                  if (*(void *)v381 != v158) {
                    objc_enumerationMutation(&unk_1ED7E9A60);
                  }
                  if (v59) {
                    long long v160 = (unsigned char *)[v59[5] objectForKey:*(void *)(*((void *)&v380 + 1) + 8 * v159)];
                  }
                  else {
                    long long v160 = 0;
                  }
                  if (objc_msgSend(v351, "containsString:", objc_msgSend(v160, "columnName")))
                  {
                    long long v161 = (void *)MEMORY[0x18C127630]();
                    if ((unint64_t)__ckLoggingOverride >= 9) {
                      uint64_t v162 = 9;
                    }
                    else {
                      uint64_t v162 = __ckLoggingOverride;
                    }
                    uint64_t v163 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping migration for '%@' because it already has a column named '%@'"];
                    [v59 tableName];
                    [v160 columnName];
                    _NSCoreDataLog(v162, v163, v164, v165, v166, v167, v168, v169, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                  }
                  else
                  {
                    -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v160, *(void *)(v49 + 24), *(void **)(v49 + 8));
                  }
                  ++v159;
                }
                while (v157 != v159);
                uint64_t v170 = [&unk_1ED7E9A60 countByEnumeratingWithState:&v380 objects:v422 count:16];
                uint64_t v157 = v170;
              }
              while (v170);
            }
            [*(id *)(v49 + 24) addConstrainedEntityToPreflight:v59];
            uint64_t v171 = [v347 adapter];
            if (v171) {
              id v172 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v171, (uint64_t)v59, 0);
            }
            else {
              id v172 = 0;
            }
            long long v378 = 0u;
            long long v379 = 0u;
            long long v376 = 0u;
            long long v377 = 0u;
            uint64_t v173 = [v172 countByEnumeratingWithState:&v376 objects:v421 count:16];
            if (v173)
            {
              uint64_t v174 = *(void *)v377;
              do
              {
                for (uint64_t m = 0; m != v173; ++m)
                {
                  if (*(void *)v377 != v174) {
                    objc_enumerationMutation(v172);
                  }
                  uint64_t v176 = *(void *)(v49 + 24);
                  if (v176)
                  {
                    [*(id *)(v176 + 8) addObject:*(void *)(*((void *)&v376 + 1) + 8 * m)];
                    *(unsigned char *)(v176 + 32) = 1;
                  }
                }
                uint64_t v173 = [v172 countByEnumeratingWithState:&v376 objects:v421 count:16];
              }
              while (v173);
            }

            uint64_t v50 = v347;
          }
          long long v177 = (void *)[v59 name];
          uint64_t v178 = (objc_class *)objc_opt_class();
          if (([v177 isEqualToString:NSStringFromClass(v178)] & 1) != 0
            || (v179 = (void *)[v59 name],
                uint64_t v180 = (objc_class *)objc_opt_class(),
                [v179 isEqualToString:NSStringFromClass(v180)]))
          {
            if ([v351 containsString:@"ZHASCHANGES"])
            {
              char v181 = (void *)[v59 name];
              v182 = (objc_class *)objc_opt_class();
              char v350 = [v181 isEqualToString:NSStringFromClass(v182)];
              v183 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"CREATE TEMPORARY TABLE %@_tmp("), objc_msgSend(v59, "tableName");
              v343 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"INSERT INTO %@_tmp ("), objc_msgSend(v59, "tableName");
              v341 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT"];
              v342 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"INSERT INTO %@ ("), objc_msgSend(v59, "tableName");
              v184 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT"];
              uint64_t v185 = v59;
              while (v185)
              {
                v186 = v185;
                uint64_t v185 = (id *)v185[21];
                if (v185 == v186)
                {
                  id v187 = v186[9];
                  goto LABEL_200;
                }
              }
              id v187 = 0;
LABEL_200:
              uint64_t v188 = [v187 count];
              uint64_t v189 = v188;
              if (v188)
              {
                unint64_t v190 = 0;
                unint64_t v191 = v188 - 1;
                do
                {
                  __int16 v192 = v59;
                  while (v192)
                  {
                    int v193 = v192;
                    __int16 v192 = (id *)v192[21];
                    if (v192 == v193)
                    {
                      id v194 = v193[9];
                      goto LABEL_206;
                    }
                  }
                  id v194 = 0;
LABEL_206:
                  v195 = (void *)[v194 objectAtIndexedSubscript:v190];
                  if (objc_msgSend(v351, "containsString:", objc_msgSend(v195, "columnName")))
                  {
                    [v183 appendFormat:@" %@", objc_msgSend(v195, "columnName")];
                    [v343 appendFormat:@" %@", objc_msgSend(v195, "columnName")];
                    [v342 appendFormat:@" %@", objc_msgSend(v195, "columnName")];
                    [v184 appendFormat:@" %@", objc_msgSend(v195, "columnName")];
                    [v341 appendFormat:@" %@", objc_msgSend(v195, "columnName")];
                    if (v190 < v191)
                    {
                      [v183 appendString:@","];
                      [v343 appendString:@","];
                      [v342 appendString:@","];
                      [v184 appendString:@","];
                      [v341 appendString:@","];
                    }
                  }
                  ++v190;
                }
                while (v190 != v189);
              }
              [v183 appendString:@""]);
              [v342 appendString:@""]);
              [v343 appendString:@""]);
              [v341 appendFormat:@" FROM %@", objc_msgSend(v59, "tableName")];
              [v184 appendFormat:@" FROM %@_tmp", objc_msgSend(v59, "tableName")];
              v196 = [[NSSQLiteStatement alloc] initWithEntity:v59 sqlString:v183];
              uint64_t v197 = *(void *)(v49 + 24);
              if (v197)
              {
                [*(id *)(v197 + 8) addObject:v196];
                *(unsigned char *)(v197 + 32) = 1;
              }

              v198 = [NSSQLiteStatement alloc];
              uint64_t v199 = -[NSSQLiteStatement initWithEntity:sqlString:](v198, "initWithEntity:sqlString:", v59, [NSString stringWithFormat:@"%@ %@", v343, v341]);
              uint64_t v200 = *(void *)(v49 + 24);
              if (v200)
              {
                [*(id *)(v200 + 8) addObject:v199];
                *(unsigned char *)(v200 + 32) = 1;
              }

              v201 = [NSSQLiteStatement alloc];
              uint64_t v202 = -[NSSQLiteStatement initWithEntity:sqlString:](v201, "initWithEntity:sqlString:", v59, [NSString stringWithFormat:@"DROP TABLE %@", objc_msgSend(v59, "tableName")]);
              uint64_t v203 = *(void *)(v49 + 24);
              if (v203)
              {
                [*(id *)(v203 + 8) addObject:v202];
                *(unsigned char *)(v203 + 32) = 1;
              }

              v204 = -[NSSQLiteAdapter newCreateTableStatementForEntity:]((__CFString *)[v50 adapter], v59);
              id v351 = [(NSSQLiteStatement *)v204 sqlString];
              uint64_t v205 = *(void *)(v49 + 24);
              if (v205)
              {
                [*(id *)(v205 + 8) addObject:v204];
                *(unsigned char *)(v205 + 32) = 1;
              }

              v206 = [NSSQLiteStatement alloc];
              v207 = -[NSSQLiteStatement initWithEntity:sqlString:](v206, "initWithEntity:sqlString:", v59, [NSString stringWithFormat:@"%@ %@", v342, v184]);
              uint64_t v208 = *(void *)(v49 + 24);
              if (v208)
              {
                [*(id *)(v208 + 8) addObject:v207];
                *(unsigned char *)(v208 + 32) = 1;
              }

              v209 = [NSSQLiteStatement alloc];
              v210 = -[NSSQLiteStatement initWithEntity:sqlString:](v209, "initWithEntity:sqlString:", v59, [NSString stringWithFormat:@"DROP TABLE %@_tmp", objc_msgSend(v59, "tableName")]);
              uint64_t v211 = *(void *)(v49 + 24);
              if (v211)
              {
                [*(id *)(v211 + 8) addObject:v210];
                *(unsigned char *)(v211 + 32) = 1;
                v212 = *(void **)(v49 + 24);
              }
              else
              {
                v212 = 0;
              }
              [v212 addConstrainedEntityToPreflight:v59];
              v213 = v183;
              uint64_t v214 = [v50 adapter];
              if (v214) {
                id v215 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v214, (uint64_t)v59, 0);
              }
              else {
                id v215 = 0;
              }
              v216 = v184;
              long long v374 = 0u;
              long long v375 = 0u;
              long long v372 = 0u;
              long long v373 = 0u;
              uint64_t v217 = [v215 countByEnumeratingWithState:&v372 objects:v420 count:16];
              if (v217)
              {
                uint64_t v218 = *(void *)v373;
                do
                {
                  for (uint64_t n = 0; n != v217; ++n)
                  {
                    if (*(void *)v373 != v218) {
                      objc_enumerationMutation(v215);
                    }
                    uint64_t v220 = *(void *)(v49 + 24);
                    if (v220)
                    {
                      [*(id *)(v220 + 8) addObject:*(void *)(*((void *)&v372 + 1) + 8 * n)];
                      *(unsigned char *)(v220 + 32) = 1;
                    }
                  }
                  uint64_t v217 = [v215 countByEnumeratingWithState:&v372 objects:v420 count:16];
                }
                while (v217);
              }
            }
            else
            {
              char v350 = 0;
            }
            long long v370 = 0u;
            long long v371 = 0u;
            long long v368 = 0u;
            long long v369 = 0u;
            uint64_t v221 = [&unk_1ED7E9A78 countByEnumeratingWithState:&v368 objects:v419 count:16];
            if (v221)
            {
              uint64_t v222 = *(void *)v369;
              do
              {
                uint64_t v223 = 0;
                do
                {
                  if (*(void *)v369 != v222) {
                    objc_enumerationMutation(&unk_1ED7E9A78);
                  }
                  if (v59) {
                    v224 = (unsigned char *)[v59[5] objectForKey:*(void *)(*((void *)&v368 + 1) + 8 * v223)];
                  }
                  else {
                    v224 = 0;
                  }
                  if (objc_msgSend(v351, "containsString:", objc_msgSend(v224, "columnName")))
                  {
                    v225 = (void *)MEMORY[0x18C127630]();
                    if ((unint64_t)__ckLoggingOverride >= 9) {
                      uint64_t v226 = 9;
                    }
                    else {
                      uint64_t v226 = __ckLoggingOverride;
                    }
                    uint64_t v227 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping migration for '%@' because it already has a column named '%@'"];
                    [v59 tableName];
                    [v224 columnName];
                    _NSCoreDataLog(v226, v227, v228, v229, v230, v231, v232, v233, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                  }
                  else
                  {
                    -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v224, *(void *)(v49 + 24), *(void **)(v49 + 8));
                  }
                  ++v223;
                }
                while (v221 != v223);
                uint64_t v234 = [&unk_1ED7E9A78 countByEnumeratingWithState:&v368 objects:v419 count:16];
                uint64_t v221 = v234;
              }
              while (v234);
            }
            v235 = (void *)[v59 name];
            v236 = (objc_class *)objc_opt_class();
            if ([v235 isEqualToString:NSStringFromClass(v236)])
            {
              long long v366 = 0u;
              long long v367 = 0u;
              long long v364 = 0u;
              long long v365 = 0u;
              uint64_t v237 = [&unk_1ED7E9A90 countByEnumeratingWithState:&v364 objects:v418 count:16];
              if (v237)
              {
                uint64_t v238 = *(void *)v365;
                do
                {
                  uint64_t v239 = 0;
                  do
                  {
                    if (*(void *)v365 != v238) {
                      objc_enumerationMutation(&unk_1ED7E9A90);
                    }
                    if (v59) {
                      v240 = (unsigned char *)[v59[5] objectForKey:*(void *)(*((void *)&v364 + 1) + 8 * v239)];
                    }
                    else {
                      v240 = 0;
                    }
                    if (objc_msgSend(v351, "containsString:", objc_msgSend(v240, "columnName")))
                    {
                      v241 = (void *)MEMORY[0x18C127630]();
                      if ((unint64_t)__ckLoggingOverride >= 9) {
                        uint64_t v242 = 9;
                      }
                      else {
                        uint64_t v242 = __ckLoggingOverride;
                      }
                      uint64_t v243 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping migration for '%@' because it already has a column named '%@'"];
                      [v59 tableName];
                      [v240 columnName];
                      _NSCoreDataLog(v242, v243, v244, v245, v246, v247, v248, v249, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                    }
                    else
                    {
                      -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v240, *(void *)(v49 + 24), *(void **)(v49 + 8));
                      char v350 = 1;
                    }
                    ++v239;
                  }
                  while (v237 != v239);
                  uint64_t v250 = [&unk_1ED7E9A90 countByEnumeratingWithState:&v364 objects:v418 count:16];
                  uint64_t v237 = v250;
                }
                while (v250);
              }
              long long v362 = 0u;
              long long v363 = 0u;
              long long v360 = 0u;
              long long v361 = 0u;
              uint64_t v251 = [&unk_1ED7E9AA8 countByEnumeratingWithState:&v360 objects:v417 count:16];
              if (v251)
              {
                uint64_t v252 = *(void *)v361;
                do
                {
                  uint64_t v253 = 0;
                  do
                  {
                    if (*(void *)v361 != v252) {
                      objc_enumerationMutation(&unk_1ED7E9AA8);
                    }
                    if (v59) {
                      v254 = (unsigned char *)[v59[5] objectForKey:*(void *)(*((void *)&v360 + 1) + 8 * v253)];
                    }
                    else {
                      v254 = 0;
                    }
                    if (objc_msgSend(v351, "containsString:", objc_msgSend(v254, "columnName")))
                    {
                      v255 = (void *)MEMORY[0x18C127630]();
                      if ((unint64_t)__ckLoggingOverride >= 9) {
                        uint64_t v256 = 9;
                      }
                      else {
                        uint64_t v256 = __ckLoggingOverride;
                      }
                      uint64_t v257 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping migration for '%@' because it already has a column named '%@'"];
                      [v59 tableName];
                      [v254 columnName];
                      _NSCoreDataLog(v256, v257, v258, v259, v260, v261, v262, v263, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                    }
                    else
                    {
                      -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v254, *(void *)(v49 + 24), *(void **)(v49 + 8));
                    }
                    ++v253;
                  }
                  while (v251 != v253);
                  uint64_t v264 = [&unk_1ED7E9AA8 countByEnumeratingWithState:&v360 objects:v417 count:16];
                  uint64_t v251 = v264;
                }
                while (v264);
              }
            }
            if (v350)
            {
              v265 = [NSSQLiteStatement alloc];
              v266 = NSString;
              uint64_t v267 = [v59 tableName];
              if (v59) {
                v268 = (void *)[v59[5] objectForKey:@"hasRecordZoneNum"];
              }
              else {
                v268 = 0;
              }
              v269 = -[NSSQLiteStatement initWithEntity:sqlString:](v265, "initWithEntity:sqlString:", v59, [v266 stringWithFormat:@"UPDATE %@ SET %@=0", v267, objc_msgSend(v268, "columnName")]);
              uint64_t v270 = *(void *)(v49 + 24);
              if (v270)
              {
                [*(id *)(v270 + 8) addObject:v269];
                *(unsigned char *)(v270 + 32) = 1;
              }
            }
          }
          v271 = (void *)[v59 name];
          v272 = (objc_class *)objc_opt_class();
          if ([v271 isEqualToString:NSStringFromClass(v272)])
          {
            long long v358 = 0u;
            long long v359 = 0u;
            long long v356 = 0u;
            long long v357 = 0u;
            uint64_t v273 = [&unk_1ED7E9AC0 countByEnumeratingWithState:&v356 objects:v416 count:16];
            if (v273)
            {
              uint64_t v274 = *(void *)v357;
              do
              {
                uint64_t v275 = 0;
                do
                {
                  if (*(void *)v357 != v274) {
                    objc_enumerationMutation(&unk_1ED7E9AC0);
                  }
                  if (v59) {
                    v276 = (unsigned char *)[v59[5] objectForKey:*(void *)(*((void *)&v356 + 1) + 8 * v275)];
                  }
                  else {
                    v276 = 0;
                  }
                  if (objc_msgSend(v351, "containsString:", objc_msgSend(v276, "columnName")))
                  {
                    v277 = (void *)MEMORY[0x18C127630]();
                    if ((unint64_t)__ckLoggingOverride >= 9) {
                      uint64_t v278 = 9;
                    }
                    else {
                      uint64_t v278 = __ckLoggingOverride;
                    }
                    uint64_t v279 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping migration for '%@' because it already has a column named '%@'"];
                    [v59 tableName];
                    [v276 columnName];
                    _NSCoreDataLog(v278, v279, v280, v281, v282, v283, v284, v285, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                  }
                  else
                  {
                    -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v276, *(void *)(v49 + 24), *(void **)(v49 + 8));
                  }
                  ++v275;
                }
                while (v273 != v275);
                uint64_t v286 = [&unk_1ED7E9AC0 countByEnumeratingWithState:&v356 objects:v416 count:16];
                uint64_t v273 = v286;
              }
              while (v286);
            }
          }
          v287 = (void *)[v59 name];
          v288 = (objc_class *)objc_opt_class();
          if ([v287 isEqualToString:NSStringFromClass(v288)])
          {
            long long v354 = 0u;
            long long v355 = 0u;
            long long v352 = 0u;
            long long v353 = 0u;
            uint64_t v289 = [&unk_1ED7E9AD8 countByEnumeratingWithState:&v352 objects:v415 count:16];
            if (v289)
            {
              uint64_t v290 = *(void *)v353;
              do
              {
                uint64_t v291 = 0;
                do
                {
                  if (*(void *)v353 != v290) {
                    objc_enumerationMutation(&unk_1ED7E9AD8);
                  }
                  if (v59) {
                    v292 = (unsigned char *)[v59[5] objectForKey:*(void *)(*((void *)&v352 + 1) + 8 * v291)];
                  }
                  else {
                    v292 = 0;
                  }
                  if (objc_msgSend(v351, "containsString:", objc_msgSend(v292, "columnName")))
                  {
                    v293 = (void *)MEMORY[0x18C127630]();
                    if ((unint64_t)__ckLoggingOverride >= 9) {
                      uint64_t v294 = 9;
                    }
                    else {
                      uint64_t v294 = __ckLoggingOverride;
                    }
                    uint64_t v295 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping migration for '%@' because it already has a column named '%@'"];
                    [v59 tableName];
                    [v292 columnName];
                    _NSCoreDataLog(v294, v295, v296, v297, v298, v299, v300, v301, (uint64_t)"-[PFCloudKitMetadataModelMigrator calculateMigrationStepsWithConnection:error:]");
                  }
                  else
                  {
                    -[PFCloudKitMetadataModelMigrator addMigrationStatementForAddingAttribute:toContext:inStore:](v292, *(void *)(v49 + 24), *(void **)(v49 + 8));
                  }
                  ++v291;
                }
                while (v289 != v291);
                uint64_t v302 = [&unk_1ED7E9AD8 countByEnumeratingWithState:&v352 objects:v415 count:16];
                uint64_t v289 = v302;
              }
              while (v302);
            }
          }
          uint64_t v303 = *(void *)(v49 + 24);
          if (v303) {
            v304 = *(void **)(v303 + 80);
          }
          else {
            v304 = 0;
          }
          uint64_t v50 = v347;
          uint64_t v51 = v344;
          uint64_t v58 = v345;
          if ([v304 integerValue] <= 976)
          {
            v305 = [NSSQLiteStatement alloc];
            v306 = -[NSSQLiteStatement initWithEntity:sqlString:](v305, "initWithEntity:sqlString:", v59, [NSString stringWithFormat:@"UPDATE %@ SET Z_OPT = 1 WHERE Z_OPT IS NULL OR Z_OPT <= 0", objc_msgSend(v59, "tableName")]);
            uint64_t v307 = *(void *)(v49 + 24);
            if (v307)
            {
              [*(id *)(v307 + 8) addObject:v306];
              *(unsigned char *)(v307 + 32) = 1;
            }
          }
          uint64_t v308 = *(void *)(v49 + 24);
          if (v308) {
            v309 = *(void **)(v308 + 80);
          }
          else {
            v309 = 0;
          }
          if ([v309 integerValue] <= 1031)
          {
            uint64_t v310 = *(void *)(v49 + 24);
            if (v310)
            {
              long long v154 = (unsigned char *)(v310 + 38);
              goto LABEL_160;
            }
          }
        }
LABEL_161:
        ++v349;
      }
      while (v349 != v58);
      uint64_t v311 = [(id)v51 countByEnumeratingWithState:&v397 objects:&v440 count:16];
      uint64_t v58 = v311;
    }
    while (v311);
  }
LABEL_354:
  if (!*((unsigned char *)v408 + 24))
  {
    id v312 = (id)v402[5];
    if (v312)
    {
      *(void *)(v339 + 40) = v312;
    }
    else
    {
      uint64_t v313 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v313, v314, v315, v316, v317, v318, v319, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      v320 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v446 = 136315394;
        *(void *)&v446[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        *(_WORD *)&v446[12] = 1024;
        *(_DWORD *)&v446[14] = 542;
        _os_log_fault_impl(&dword_18AB82000, v320, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v446, 0x12u);
      }
    }
  }

  v402[5] = 0;
  int v321 = *((unsigned __int8 *)v408 + 24);
  _Block_object_dispose(&v401, 8);
  _Block_object_dispose(&v407, 8);
  if (v321)
  {
    uint64_t v322 = a1[4];
    if (a2)
    {
      uint64_t v323 = *(void *)(a2 + 24);
      if (v322) {
        goto LABEL_362;
      }
    }
    else
    {
      uint64_t v323 = 0;
      if (v322)
      {
LABEL_362:
        uint64_t v324 = *(void *)(v322 + 24);
        if (v324 && *(unsigned char *)(v324 + 32))
        {
          -[NSSQLiteConnection connect](v323);
          -[NSSQLiteConnection beginTransaction](v323);
          long long v432 = 0u;
          long long v431 = 0u;
          long long v430 = 0u;
          long long v429 = 0u;
          uint64_t v325 = *(void *)(v322 + 24);
          if (v325) {
            v326 = *(void **)(v325 + 24);
          }
          else {
            v326 = 0;
          }
          uint64_t v327 = [v326 countByEnumeratingWithState:&v429 objects:v446 count:16];
          if (v327)
          {
            uint64_t v328 = *(void *)v430;
            do
            {
              for (iuint64_t i = 0; ii != v327; ++ii)
              {
                if (*(void *)v430 != v328) {
                  objc_enumerationMutation(v326);
                }
                -[NSSQLiteConnection dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity:](v323, *(void *)(*((void *)&v429 + 1) + 8 * ii));
              }
              uint64_t v327 = [v326 countByEnumeratingWithState:&v429 objects:v446 count:16];
            }
            while (v327);
          }
          long long v428 = 0u;
          long long v427 = 0u;
          long long v426 = 0u;
          long long v425 = 0u;
          uint64_t v330 = *(void *)(v322 + 24);
          if (v330) {
            v331 = *(void **)(v330 + 8);
          }
          else {
            v331 = 0;
          }
          uint64_t v332 = [v331 countByEnumeratingWithState:&v425 objects:&v440 count:16];
          if (v332)
          {
            uint64_t v333 = *(void *)v426;
            do
            {
              for (juint64_t j = 0; jj != v332; ++jj)
              {
                if (*(void *)v426 != v333) {
                  objc_enumerationMutation(v331);
                }
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v323, *(void **)(*((void *)&v425 + 1) + 8 * jj));
              }
              uint64_t v332 = [v331 countByEnumeratingWithState:&v425 objects:&v440 count:16];
            }
            while (v332);
          }
          uint64_t v335 = *(void *)(v322 + 24);
          if (v335) {
            v336 = *(void **)(v335 + 16);
          }
          else {
            v336 = 0;
          }
          -[NSSQLiteConnection createTablesForEntities:](v323, v336);
          -[NSSQLiteConnection commitTransaction](v323);
        }
        -[NSSQLiteConnection endFetchAndRecycleStatement:](v323, 0);
        return;
      }
    }
  }
LABEL_386:
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  v337 = *(void **)(*(void *)(a1[6] + 8) + 40);

  id v338 = v337;
}

void __94__PFCloudKitMetadataModelMigrator_computeAncillaryEntityPrimaryKeyTableEntriesForStore_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v3 = *(void **)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = (NSSQLiteStatement *)[v3 adapter];
  uint64_t v26 = a1;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "ancillarySQLModels"), "objectForKey:", @"NSPersistentStoreMirroringDelegateOptionKey");
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 32);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v28 = *(void *)v34;
    obuint64_t j = v7;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(unsigned int **)(*((void *)&v33 + 1) + 8 * v9);
        id v11 = [NSSQLiteStatement alloc];
        if (v10) {
          uint64_t v12 = v10[46];
        }
        else {
          uint64_t v12 = 0;
        }
        uint64_t v13 = -[NSSQLiteStatement initWithEntity:sqlString:](v11, "initWithEntity:sqlString:", 0, [NSString stringWithFormat:@"DELETE FROM %@ WHERE Z_ENT = %@", @"Z_PRIMARYKEY", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12)]);
        [v4 addObject:v13];

        uint64_t v14 = -[NSSQLiteAdapter newPrimaryKeyInitializeStatementForEntity:withInitialMaxPK:](v5, (uint64_t)v10, 0);
        [v4 addObject:v14];

        uint64_t v15 = [v10 tableName];
        if (v3 && -[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v3, v15, 0))
        {
          uint64_t v16 = -[NSSQLiteAdapter newSimplePrimaryKeyUpdateStatementForEntity:](v5, v10);
          [v4 addObject:v16];

          uint64_t v17 = [NSSQLiteStatement alloc];
          uint64_t v18 = NSString;
          uint64_t v19 = [v10 tableName];
          if (v10) {
            uint64_t v20 = v10[46];
          }
          else {
            uint64_t v20 = 0;
          }
          uint64_t v21 = -[NSSQLiteStatement initWithEntity:sqlString:](v17, "initWithEntity:sqlString:", 0, [v18 stringWithFormat:@"UPDATE %@ SET Z_ENT = %@", v19, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v20)]);
          [v4 addObject:v21];
        }
        ++v9;
      }
      while (v8 != v9);
      uint64_t v22 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      uint64_t v8 = v22;
    }
    while (v22);
  }
  -[NSSQLiteConnection connect]((uint64_t)v3);
  -[NSSQLiteConnection beginTransaction]((uint64_t)v3);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v23 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v4);
        }
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v3, *(void **)(*((void *)&v29 + 1) + 8 * i));
      }
      uint64_t v23 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v23);
  }
  -[NSSQLiteConnection commitTransaction]((uint64_t)v3);
  *(unsigned char *)(*(void *)(*(void *)(v26 + 40) + 8) + 24) = 1;
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v3, 0);
}

void __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke(uint64_t a1)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
  uint64_t v3 = (void *)[v2 initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:getCloudKitCKCurrentUserDefaultName[0]()];
  id v4 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v3, *(void *)(*(void *)(a1 + 32) + 32), *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v4)
  {
    id v5 = v4;
    if ([(NSManagedObject *)v4 isInserted])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 48) save:*(void *)(*(void *)(a1 + 64) + 8) + 40];
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        id v6 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      uint64_t v7 = [(NSManagedObject *)v5 objectID];
      uint64_t v8 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
      [(NSFetchRequest *)v8 setRelationshipKeyPathsForPrefetching:&unk_1ED7E9B08];
      v34[0] = *(void *)(a1 + 40);
      -[NSFetchRequest setAffectedStores:](v8, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1]);
      [(NSFetchRequest *)v8 setFetchBatchSize:200];
      uint64_t v9 = *(void **)(a1 + 48);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke_2;
      v22[3] = &unk_1E544F588;
      v22[4] = v9;
      v22[5] = v7;
      long long v23 = *(_OWORD *)(a1 + 64);
      +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v8, v9, (uint64_t)v22);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    id v10 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v11 && *(unsigned char *)(v11 + 37))
  {
    uint64_t v12 = *(void **)(a1 + 56);
    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v13 = objc_msgSend(v12, "currentPersistentHistoryTokenFromStores:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v33, 1));
    uint64_t v14 = v13
        ? objc_msgSend((id)objc_msgSend(v13, "storeTokens"), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "identifier")): &unk_1ED7E2C50;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      uint64_t v15 = [[NSBatchUpdateRequest alloc] initWithEntityName:+[NSCKRecordMetadata entityPath]];
      -[NSBatchUpdateRequest setPredicate:](v15, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"ckRecordSystemFields == NULL"]);
      v31[0] = @"needsUpload";
      v32[0] = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
      v31[1] = @"pendingExportTransactionNumber";
      v32[1] = [MEMORY[0x1E4F28C68] expressionForConstantValue:v14];
      -[NSBatchUpdateRequest setPropertiesToUpdate:](v15, "setPropertiesToUpdate:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2]);
      uint64_t v30 = *(void *)(a1 + 40);
      -[NSPersistentStoreRequest setAffectedStores:](v15, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1]);
      [(NSBatchUpdateRequest *)v15 setResultType:0];
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v15, *(void *)(*(void *)(a1 + 64) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        id v16 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        uint64_t v17 = [[NSBatchUpdateRequest alloc] initWithEntityName:+[NSCKRecordMetadata entityPath]];
        -[NSBatchUpdateRequest setPredicate:](v17, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"ckRecordSystemFields != NULL"]);
        uint64_t v28 = @"lastExportedTransactionNumber";
        uint64_t v29 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v14];
        -[NSBatchUpdateRequest setPropertiesToUpdate:](v17, "setPropertiesToUpdate:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1]);
        [(NSBatchUpdateRequest *)v17 setResultType:0];
        uint64_t v27 = *(void *)(a1 + 40);
        -[NSPersistentStoreRequest setAffectedStores:](v17, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1]);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v17, *(void *)(*(void *)(a1 + 64) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
          id v18 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        }
      }
    }
  }
  uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v19 && *(unsigned char *)(v19 + 39) && *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v20 = [[NSBatchUpdateRequest alloc] initWithEntityName:+[NSCKRecordZoneMetadata entityPath]];
    -[NSBatchUpdateRequest setPredicate:](v20, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"needsNewShareInvitation == NULL"]);
    unint64_t v25 = @"needsNewShareInvitation";
    uint64_t v26 = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC28]];
    -[NSBatchUpdateRequest setPropertiesToUpdate:](v20, "setPropertiesToUpdate:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1]);
    [(NSBatchUpdateRequest *)v20 setResultType:0];
    uint64_t v24 = *(void *)(a1 + 40);
    -[NSPersistentStoreRequest setAffectedStores:](v20, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1]);
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v20, *(void *)(*(void *)(a1 + 64) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      id v21 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
  }
}

uint64_t __85__PFCloudKitMetadataModelMigrator_checkForRecordMetadataZoneCorruptionInStore_error___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v5 = a1;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 40) = result;
LABEL_23:
    *a4 = 1;
    return result;
  }
  uint64_t v7 = [*(id *)(a1 + 32) existingObjectWithID:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v35 = v5;
    long long v36 = a4;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v9 = [a2 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(a2);
          }
          uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v14 = (void *)MEMORY[0x18C127630]();
          uint64_t v15 = (void *)[v13 recordZone];
          if (![v15 ckRecordZoneName] || objc_msgSend(v15, "isDeleted"))
          {
            id v16 = (void *)MEMORY[0x18C127630]();
            if ((unint64_t)__ckLoggingOverride >= 9) {
              uint64_t v17 = 9;
            }
            else {
              uint64_t v17 = __ckLoggingOverride;
            }
            uint64_t v18 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Found corrupt zone on record metadata: %@"];
            [v13 objectID];
            _NSCoreDataLog(v17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForRecordMetadataZoneCorruptionInStore:error:]_block_invoke_2");
            [v13 setRecordZone:v8];
          }
        }
        uint64_t v10 = [a2 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v10);
    }
    uint64_t v5 = v35;
    uint64_t result = [*(id *)(v35 + 32) save:*(void *)(*(void *)(v35 + 48) + 8) + 40];
    a4 = v36;
    if ((result & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(v35 + 56) + 8) + 24) = 0;
      uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(v35 + 48) + 8) + 40);
    }
  }
  else
  {
    uint64_t v26 = [NSString stringWithUTF8String:"Failed to refresh zone for assignment during corrupt zone cleanup: %@"];
    _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 40));
    uint64_t v33 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v34 = *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v42 = v34;
      _os_log_fault_impl(&dword_18AB82000, v33, OS_LOG_TYPE_FAULT, "CoreData: Failed to refresh zone for assignment during corrupt zone cleanup: %@", buf, 0xCu);
    }
    uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(v5 + 48) + 8) + 40);
    *(unsigned char *)(*(void *)(*(void *)(v5 + 56) + 8) + 24) = 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(v5 + 56) + 8) + 24)) {
    goto LABEL_23;
  }
  return result;
}

void __107__PFCloudKitMetadataModelMigrator_migrateMetadataForObjectsInStore_toNSCKRecordMetadataUsingContext_error___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v5 = a1;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
    *(void *)(*(void *)(a1[7] + 8) + 40) = a3;
LABEL_28:
    *a4 = 1;
    return;
  }
  uint64_t v6 = a1[4];
  if (!v6)
  {
LABEL_27:
    *(unsigned char *)(*(void *)(v5[8] + 8) + 24) = 0;
    id v34 = *(id *)(*(void *)(v5[7] + 8) + 40);
    goto LABEL_28;
  }
  uint64_t v8 = (void *)a1[5];
  uint64_t v9 = (void *)a1[6];
  uint64_t v10 = *(void *)(a1[7] + 8);
  uint64_t v44 = 0;
  id v11 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:*(void *)(v6 + 32)];
  uint64_t v12 = (void *)[objc_alloc(getCloudKitCKRecordZoneClass()) initWithZoneID:v11];
  id v13 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, (void *)[a2 valueForKey:@"objectID"], v8, v9, &v44);
  uint64_t v14 = [v8 mirroringDelegate];
  if (!v13)
  {

LABEL_22:
    if (v44)
    {
      *(void *)(v10 + 40) = v44;
    }
    else
    {
      uint64_t v26 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      uint64_t v33 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        __int16 v47 = 1024;
        int v48 = 1580;
        _os_log_fault_impl(&dword_18AB82000, v33, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    goto LABEL_27;
  }
  uint64_t v15 = v14;
  long long v39 = v11;
  long long v37 = a4;
  long long v38 = v9;
  uint64_t v35 = v10;
  long long v36 = v5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v16 = [a2 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v41;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(a2);
        }
        uint64_t v20 = *(void **)(*((void *)&v40 + 1) + 8 * v19);
        if (!objc_msgSend(v13, "objectForKey:", objc_msgSend(v20, "objectID")))
        {
          if (v15) {
            uint64_t v21 = *(void **)(v15 + 8);
          }
          else {
            uint64_t v21 = 0;
          }
          id v22 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:](NSCKRecordMetadata, "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:", v20, [v21 preserveLegacyRecordMetadataBehavior], objc_msgSend(v12, "zoneID"), 0, &v44);
          id v23 = (id)[v20 valueForKey:@"ckRecordSystemFields"];
          [v22 setCkRecordSystemFields:v23];
        }
        [v20 setValue:0 forKey:@"ckRecordSystemFields"];
        ++v19;
      }
      while (v17 != v19);
      uint64_t v24 = [a2 countByEnumeratingWithState:&v40 objects:v49 count:16];
      uint64_t v17 = v24;
    }
    while (v24);
  }
  if (![v38 hasChanges])
  {

    return;
  }
  char v25 = [v38 save:&v44];

  uint64_t v5 = v36;
  a4 = v37;
  uint64_t v10 = v35;
  if ((v25 & 1) == 0) {
    goto LABEL_22;
  }
}

void __149__PFCloudKitMetadataModelMigrator_addMigrationStatementsToDeleteDuplicateMirroredRelationshipsToContext_withManagedObjectContext_andSQLEntity_error___block_invoke(uint64_t a1)
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath]);
  uint64_t v3 = objc_alloc_init(NSExpressionDescription);
  [(NSPropertyDescription *)v3 setName:@"count"];
  -[NSExpressionDescription setExpression:](v3, "setExpression:", [MEMORY[0x1E4F28C68] expressionWithFormat:@"ckRecordID.@count"]);
  [(NSExpressionDescription *)v3 setExpressionResultType:300];
  v59[0] = @"ckRecordID";
  v59[1] = v3;
  long long v43 = v3;
  -[NSFetchRequest setPropertiesToFetch:](v2, "setPropertiesToFetch:", [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2]);
  [(NSFetchRequest *)v2 setPropertiesToGroupBy:&unk_1ED7E9B68];
  [(NSFetchRequest *)v2 setResultType:2];
  id v4 = (void *)[*(id *)(a1 + 32) executeFetchRequest:v2 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
  if (v4)
  {
    uint64_t v5 = v4;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v54;
      uint64_t v44 = *(void *)v54;
      uint64_t v45 = v5;
      do
      {
        uint64_t v9 = 0;
        uint64_t v46 = v7;
        do
        {
          if (*(void *)v54 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v53 + 1) + 8 * v9);
          if (objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"count"), "integerValue") >= 2)
          {
            id v11 = (void *)MEMORY[0x18C127630]();
            uint64_t v12 = [v10 objectForKey:@"ckRecordID"];
            if (v12)
            {
              uint64_t v13 = v12;
              context = v11;
              uint64_t v14 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath]);
              uint64_t v42 = v13;
              -[NSFetchRequest setPredicate:](v14, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"ckRecordID = %@"]);
              [(NSFetchRequest *)v14 setResultType:1];
              uint64_t v15 = [*(id *)(a1 + 32) executeFetchRequest:v14 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
              if (!v15)
              {
                *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
                id v41 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
                goto LABEL_37;
              }
              uint64_t v16 = (void *)v15;
              uint64_t v17 = a1;
              id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v49 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              uint64_t v19 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = 0;
                uint64_t v22 = *(void *)v50;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v50 != v22) {
                      objc_enumerationMutation(v16);
                    }
                    if (v21) {
                      objc_msgSend(v18, "addObject:", objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "_referenceData64")));
                    }
                    else {
                      uint64_t v21 = *(void *)(*((void *)&v49 + 1) + 8 * i);
                    }
                  }
                  uint64_t v20 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
                }
                while (v20);
              }
              a1 = v17;
              uint64_t v8 = v44;
              if ([v18 count])
              {
                uint64_t v24 = [NSSQLiteStatement alloc];
                char v25 = NSString;
                uint64_t v26 = [*(id *)(v17 + 40) tableName];
                uint64_t v27 = *(void *)(v17 + 40);
                if (v27) {
                  uint64_t v28 = *(void **)(v27 + 128);
                }
                else {
                  uint64_t v28 = 0;
                }
                [v28 columnName];
                uint64_t v42 = v26;
                uint64_t v29 = -[NSSQLiteStatement initWithEntity:sqlString:](v24, "initWithEntity:sqlString:", 0, [v25 stringWithFormat:@"DELETE FROM %@ WHERE %@ IN %@"]);
                uint64_t v30 = *(void *)(v17 + 48);
                if (v30)
                {
                  [*(id *)(v30 + 8) addObject:v29];
                  *(unsigned char *)(v30 + 32) = 1;
                }
              }
              uint64_t v5 = v45;
              uint64_t v7 = v46;
              id v11 = context;
            }
            else
            {
              uint64_t v31 = [NSString stringWithUTF8String:"Found mirrored relationships without a recordID."];
              _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, v42);
              long long v38 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_fault_impl(&dword_18AB82000, v38, OS_LOG_TYPE_FAULT, "CoreData: Found mirrored relationships without a recordID.", buf, 2u);
              }
            }
          }
          ++v9;
        }
        while (v9 != v7);
        uint64_t v39 = [v5 countByEnumeratingWithState:&v53 objects:v58 count:16];
        uint64_t v7 = v39;
      }
      while (v39);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v40 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
LABEL_37:
}

void __103__PFCloudKitMetadataModelMigrator_checkForCorruptedRecordMetadataInStore_inManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v6 = [a2 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(a2);
          }
          uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
          unint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "entityId"), "unsignedIntegerValue");
          uint64_t v12 = [*(id *)(a1 + 32) model];
          if (v12) {
            unint64_t v13 = *(unsigned int *)(v12 + 64);
          }
          else {
            unint64_t v13 = 0;
          }
          if (v11 > v13)
          {
            uint64_t v15 = (void *)MEMORY[0x18C127630]();
            if ((unint64_t)__ckLoggingOverride >= 0x10) {
              uint64_t v16 = 16;
            }
            else {
              uint64_t v16 = __ckLoggingOverride;
            }
            uint64_t v17 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Found record metadata that points to missing entity: %@"];
            _NSCoreDataLog(v16, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:]_block_invoke");
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            return;
          }
          if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "model"), "entityForID:", objc_msgSend((id)objc_msgSend(v10, "entityId"), "unsignedLongValue")))
          {
            uint64_t v24 = (void *)MEMORY[0x18C127630]();
            if ((unint64_t)__ckLoggingOverride >= 0x10) {
              uint64_t v25 = 16;
            }
            else {
              uint64_t v25 = __ckLoggingOverride;
            }
            uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Found record metadata that points to missing entity: %@"];
            goto LABEL_32;
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "configurationName"), "length")
            && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "configurationName"), "isEqualToString:", @"PF_DEFAULT_CONFIGURATION_NAME") & 1) == 0&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 32), "configurationName")), "containsObject:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "entitiesByName"), "objectForKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "model"), "entityForID:", objc_msgSend((id)objc_msgSend(v10, "entityId"), "unsignedLongValue")), "name"))) & 1) == 0)
          {
            uint64_t v24 = (void *)MEMORY[0x18C127630]();
            if ((unint64_t)__ckLoggingOverride >= 0x10) {
              uint64_t v25 = 16;
            }
            else {
              uint64_t v25 = __ckLoggingOverride;
            }
            uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Found record metadata that points to an entity that is no longer part of the store's configuration: %@"];
LABEL_32:
            _NSCoreDataLog(v25, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[PFCloudKitMetadataModelMigrator checkForCorruptedRecordMetadataInStore:inManagedObjectContext:error:]_block_invoke");
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            *a4 = 1;
            return;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v14 = [a2 countByEnumeratingWithState:&v34 objects:v38 count:16];
        uint64_t v7 = v14;
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = a3;
  }
}

void __89__PFCloudKitMetadataModelMigrator_cleanUpAfterClientMigrationWithStore_andContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4, unsigned char *a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(a2);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v14, "cdEntityName"))
            || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v14, "relatedEntityName")) & 1) == 0)
          {
            objc_msgSend(v9, "addObject:", objc_msgSend(v14, "objectID"));
          }
        }
        uint64_t v11 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }
    if ([v9 count])
    {
      uint64_t v15 = [[NSBatchDeleteRequest alloc] initWithObjectIDs:v9];
      [(NSBatchDeleteRequest *)v15 setResultType:0];
      uint64_t v21 = *(void *)(a1 + 40);
      -[NSPersistentStoreRequest setAffectedStores:](v15, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1]);
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v15, *(void *)(*(void *)(a1 + 56) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        id v16 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        a5 = a4;
      }
      *a5 = 1;
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }
}

@end