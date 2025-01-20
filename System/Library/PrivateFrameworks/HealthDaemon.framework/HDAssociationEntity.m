@interface HDAssociationEntity
+ (BOOL)_enumerateAssociationsWithPredicate:(id)a3 syncEntityClass:(Class)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 lastSyncAnchor:(int64_t *)a7 healthDatabase:(id)a8 error:(id *)a9 block:(id)a10;
+ (BOOL)_enumerateTypedAssociationsWithPredicate:(id)a3 syncEntityClass:(Class)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 lastSyncAnchor:(int64_t *)a7 healthDatabase:(id)a8 transaction:(id)a9 error:(id *)a10 block:(id)a11;
+ (BOOL)_insertCodableObjectAssociations:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_insertEntriesWithParentUUID:(id)a3 childUUIDsData:(id)a4 provenance:(int64_t)a5 syncIdentity:(int64_t)a6 type:(unint64_t)a7 deleted:(BOOL)a8 creationDate:(id)a9 destinationSubObjectReference:(id)a10 enforceSameSource:(BOOL)a11 permitPendingAssociations:(BOOL)a12 profile:(id)a13 lastInsertedEntityID:(id *)a14 error:(id *)a15;
+ (BOOL)_insertEntriesWithParentUUID:(void *)a3 childUUIDsData:(uint64_t)a4 provenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 type:(char)a7 deleted:(void *)a8 creationDate:(void *)a9 destinationSubObjectReference:(void *)a10 lastInsertedEntityID:(void *)a11 context:(void *)a12 error:;
+ (BOOL)associateSampleUUIDData:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 provenance:(int64_t)a9 syncIdentity:(int64_t)a10 creationDate:(id)a11 error:(id *)a12;
+ (BOOL)copyAssociationsFromChildID:(id)a3 toObjectID:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)copyAssociationsFromObject:(id)a3 toObject:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)copyAssociationsFromObject:(id)a3 toObject:(id)a4 type:(unint64_t)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)disassociateSampleUUIDData:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)disassociateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)insertEntriesWithAssociation:(id)a3 objects:(id)a4 type:(unint64_t)a5 destinationSubObject:(id)a6 enforceSameSource:(BOOL)a7 profile:(id)a8 transaction:(id)a9 error:(id *)a10;
+ (BOOL)insertEntriesWithAssociationUUID:(id)a3 objectUUIDsData:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)realizePendingAssociationsWithTransaction:(id)a3 startingAnchor:(int64_t)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_UUIDsAssociatedWithUUID:(void *)a3 subObjectReference:(void *)a4 predicateProperty:(void *)a5 enumerateProperty:(char)a6 excludeDeleted:(void *)a7 profile:(uint64_t)a8 error:;
+ (id)_findAssociationEntryWithParentID:(uint64_t)a3 childID:(uint64_t)a4 type:(void *)a5 destinationSubObjectID:(char)a6 deleted:(void *)a7 database:(uint64_t)a8 error:;
+ (id)associationUUIDsForObjectUUID:(id)a3 subObjectReference:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7;
+ (id)countOfObjectsAssociatedWithObjectPID:(int64_t)a3 excludeDeleted:(BOOL)a4 associationType:(unint64_t)a5 anchor:(int64_t)a6 transaction:(id)a7 error:(id *)a8;
+ (id)countOfObjectsAssociatedWithObjectUUID:(id)a3 subObjectReference:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7;
+ (id)databaseTable;
+ (id)deleteStatementForChildIDsWithTransaction:(id)a3;
+ (id)deleteStatementForParentIDWithTransaction:(id)a3;
+ (id)indices;
+ (id)joinClausesForProperty:(id)a3;
+ (id)journalEntryForAssociation:(id)a3 objects:(id)a4 profile:(id)a5;
+ (id)objectIDsForAssociationEntityWithPersistentID:(int64_t)a3 profile:(id)a4 error:(id *)a5;
+ (id)objectUUIDsAssociatedWithObjectUUID:(id)a3 subObjectReference:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7;
+ (id)objectsAssociatedWithObjectPID:(int64_t)a3 subObjectReference:(id)a4 dataTypes:(id)a5 associationType:(unint64_t)a6 limit:(unint64_t)a7 sortDescending:(BOOL)a8 profile:(id)a9 error:(id *)a10;
+ (id)privateSubEntities;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)tableAliases;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
+ (uint64_t)_insertAssociationEntryWithParentID:(uint64_t)a3 childID:(uint64_t)a4 provenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 type:(void *)a7 destinationSubObjectID:(char)a8 deleted:(void *)a9 creationDate:(void *)a10 lastInsertedEntityID:(void *)a11 database:(uint64_t)a12 error:;
+ (uint64_t)_insertPendingAssociationForParentUUID:(uint64_t)a3 childUUIDBytes:(uint64_t)a4 provenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 type:(void *)a7 destinationSubObjectID:(char)a8 deleted:(void *)a9 creationDate:(void *)a10 database:(void *)a11 error:;
+ (uint64_t)_removeAssociationEntryWithParentID:(uint64_t)a3 childID:(uint64_t)a4 provenance:(void *)a5 syncIdentity:(void *)a6 type:(uint64_t)a7 destinationSubObjectID:deleted:database:error:;
@end

@implementation HDAssociationEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)joinClausesForProperty:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"parent_id_objects.uuid"])
  {
    v6 = @"destination_object_id";
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"child_id_objects.uuid"]) {
    goto LABEL_6;
  }
  if (([v5 isEqualToString:@"child_id_samples.end_date"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"child_id_objects.creation_date"])
    {
LABEL_6:
      v6 = @"source_object_id";
      goto LABEL_7;
    }
    if (([v5 isEqualToString:@"child_id_samples.data_type"] & 1) == 0
      && ![v5 isEqualToString:@"child_id_samples.data_id"])
    {
      goto LABEL_14;
    }
  }
  v6 = @"source_object_id";
LABEL_7:
  uint64_t v7 = objc_opt_class();
  if (!v7)
  {
LABEL_14:
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_METACLASS___HDAssociationEntity;
    v14 = objc_msgSendSuper2(&v17, sel_joinClausesForProperty_, v5);
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  v9 = [v5 componentsSeparatedByString:@"."];
  if ([v9 count] != 2)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDAssociationEntity.m", 184, @"Invalid parameter not satisfying: %@", @"[components count] == 2" object file lineNumber description];
  }
  v10 = (void *)MEMORY[0x1E4F65D38];
  v11 = [a1 disambiguatedDatabaseTable];
  v12 = [v9 objectAtIndexedSubscript:0];
  v13 = [v10 innerJoinClauseFromTable:v11 toTargetEntity:v8 as:v12 localReference:v6 targetKey:@"data_id"];

  v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];

LABEL_15:

  return v14;
}

+ (id)databaseTable
{
  return @"associations";
}

+ (id)tableAliases
{
  return &unk_1F17E92A0;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 9;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_22;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"destination_object_id";
  v4[1] = @"source_object_id";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)indices
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  uint64_t v8 = @"source_object_id";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  id v5 = (void *)[v2 initWithEntity:v3 name:@"source_object_id" columns:v4];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v6;
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (id)privateSubEntities
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 error:(id *)a9
{
  v15 = (void *)MEMORY[0x1E4F1C9C8];
  id v16 = a8;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  if (a5) {
    [v15 now];
  }
  else {
  v20 = [v15 distantPast];
  }
  v21 = objc_msgSend(v19, "hk_dataForAllUUIDs");

  LOWORD(v24) = 256;
  char v22 = [a1 _insertEntriesWithParentUUID:v18 childUUIDsData:v21 provenance:0 syncIdentity:objc_msgSend(v16 type:"currentSyncIdentityPersistentID") deleted:a5 creationDate:0 destinationSubObjectReference:v20 enforceSameSource:v17 permitPendingAssociations:v24 profile:v16 lastInsertedEntityID:a7 error:a9];

  return v22;
}

+ (BOOL)associateSampleUUIDData:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 error:(id *)a9
{
  v15 = (void *)MEMORY[0x1E4F1C9C8];
  id v16 = a8;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  if (a5) {
    [v15 now];
  }
  else {
  v20 = [v15 distantPast];
  }
  LOWORD(v23) = 0;
  char v21 = [a1 _insertEntriesWithParentUUID:v18 childUUIDsData:v19 provenance:0 syncIdentity:objc_msgSend(v16 type:"currentSyncIdentityPersistentID") deleted:a5 creationDate:0 destinationSubObjectReference:v20 enforceSameSource:v17 permitPendingAssociations:v23 profile:v16 lastInsertedEntityID:a7 error:a9];

  return v21;
}

+ (BOOL)associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 provenance:(int64_t)a9 syncIdentity:(int64_t)a10 creationDate:(id)a11 error:(id *)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a8;
  id v21 = a11;
  if (!v21)
  {
    if (a5) {
      [MEMORY[0x1E4F1C9C8] now];
    }
    else {
    id v21 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
  }
  char v22 = objc_msgSend(v17, "hk_dataForAllUUIDs");
  LOWORD(v25) = 256;
  char v23 = objc_msgSend(a1, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v18, v22, a9, a10, a5, 0, v21, v19, v25, v20, a7, a12);

  return v23;
}

+ (BOOL)disassociateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 lastInsertedEntityID:(id *)a7 profile:(id)a8 error:(id *)a9
{
  v15 = (void *)MEMORY[0x1E4F1C9C8];
  id v16 = a8;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  if (a5) {
    [v15 now];
  }
  else {
  id v20 = [v15 distantPast];
  }
  id v21 = objc_msgSend(v19, "hk_dataForAllUUIDs");

  LOWORD(v24) = 256;
  char v22 = [a1 _insertEntriesWithParentUUID:v18 childUUIDsData:v21 provenance:0 syncIdentity:objc_msgSend(v16 type:"currentSyncIdentityPersistentID") deleted:a5 creationDate:1 destinationSubObjectReference:v20 enforceSameSource:v17 permitPendingAssociations:v24 profile:v16 lastInsertedEntityID:a7 error:a9];

  return v22;
}

+ (BOOL)disassociateSampleUUIDData:(id)a3 withSampleUUID:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 profile:(id)a7 error:(id *)a8
{
  v14 = (void *)MEMORY[0x1E4F1C9C8];
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  if (a5) {
    [v14 now];
  }
  else {
  id v19 = [v14 distantPast];
  }
  LOWORD(v22) = 0;
  char v20 = [a1 _insertEntriesWithParentUUID:v17 childUUIDsData:v18 provenance:0 syncIdentity:objc_msgSend(v15 type:"currentSyncIdentityPersistentID") deleted:a5 creationDate:1 destinationSubObjectReference:v19 enforceSameSource:v16 permitPendingAssociations:v22 profile:v15 lastInsertedEntityID:0 error:a8];

  return v20;
}

+ (BOOL)insertEntriesWithAssociation:(id)a3 objects:(id)a4 type:(unint64_t)a5 destinationSubObject:(id)a6 enforceSameSource:(BOOL)a7 profile:(id)a8 transaction:(id)a9 error:(id *)a10
{
  BOOL v32 = a7;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v34 = a6;
  id v15 = a8;
  id v16 = a9;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        char v23 = [*(id *)(*((void *)&v36 + 1) + 8 * i) UUID];
        objc_msgSend(v17, "hk_appendBytesWithUUID:", v23);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v20);
  }

  if (a5) {
    [MEMORY[0x1E4F1C9C8] now];
  }
  else {
  uint64_t v24 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  v31 = v13;
  uint64_t v25 = [v13 UUID];
  v26 = [[_HDAssociationInsertionContext alloc] initWithParentUUID:v25 enforceSameSource:v32 permitPendingAssociations:0 profile:v15 transaction:v16];
  uint64_t v27 = [v15 currentSyncIdentityPersistentID];
  v28 = HDReferenceForAssociatableObject(v34);
  BOOL v29 = +[HDAssociationEntity _insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:lastInsertedEntityID:context:error:]((uint64_t)a1, v25, v17, 0, v27, a5, 0, v24, v28, 0, v26, a10);

  return v29;
}

+ (BOOL)_insertEntriesWithParentUUID:(void *)a3 childUUIDsData:(uint64_t)a4 provenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 type:(char)a7 deleted:(void *)a8 creationDate:(void *)a9 destinationSubObjectReference:(void *)a10 lastInsertedEntityID:(void *)a11 context:(void *)a12 error:
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v73 = a2;
  id v70 = a3;
  id v71 = a8;
  id v72 = a9;
  id v14 = a11;
  uint64_t v15 = self;
  int v68 = [v14 enforceSameSource];
  char v63 = [v14 permitPendingAssociations];
  id v16 = [v14 transaction];
  v74 = [v16 databaseForEntityClass:v15];

  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__46;
  v100 = __Block_byref_object_dispose__46;
  id v101 = 0;
  id v17 = HDDataEntityPredicateForDataUUID();
  id v95 = 0;
  id v18 = +[HDDataEntity anyInDatabase:v74 predicate:v17 error:&v95];
  id v69 = v95;

  if (v18)
  {
    uint64_t v61 = [v18 persistentID];
    if (!v68)
    {
      id v34 = NSString;
      v35 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
      [v34 stringWithFormat:@"SELECT %@, %@ FROM %@ WHERE %@ = ?", @"data_id", @"type", v35, @"uuid", 0];
      id v30 = (id)objc_claimAutoreleasedReturnValue();

      id v25 = 0;
      goto LABEL_36;
    }
    v60 = [v18 valueForProperty:@"data_provenances.source_id" database:v74];
    uint64_t v19 = [v14 profile];
    uint64_t v20 = [v19 sourceManager];
    id v94 = 0;
    v62 = [v20 clientSourceForPersistentID:v60 error:&v94];
    id v59 = v94;

    if (v62)
    {
      uint64_t v21 = [v14 profile];
      uint64_t v22 = [v21 sourceManager];
      char v23 = [v62 bundleIdentifier];
      uint64_t v24 = [v22 allSourcesForBundleIdentifier:v23 error:a12];
      objc_msgSend(v24, "hk_map:", &__block_literal_global_397);
      id v25 = (id)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        id v30 = 0;
        int v31 = 1;
        goto LABEL_34;
      }
      id v26 = +[HDDataEntity joinClausesForProperty:@"data_provenances.source_id"];
      if ([v26 count] == 1)
      {
        v58 = NSString;
        uint64_t v27 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
        v28 = [v26 anyObject];
        BOOL v29 = [v28 SQLJoinClause];
        [v58 stringWithFormat:@"SELECT %@, %@, %@ FROM %@ %@ WHERE %@ = ?", @"data_id", @"type", @"data_provenances.source_id", v27, v29, @"uuid", 0];
        id v30 = (id)objc_claimAutoreleasedReturnValue();

        int v31 = 0;
LABEL_33:

LABEL_34:
        if (v31)
        {
          BOOL v33 = 0;
LABEL_49:

          goto LABEL_50;
        }
LABEL_36:
        if (v72)
        {
          v50 = [v14 transaction];
          id v93 = 0;
          v51 = [v72 persistentIDInTransaction:v50 error:&v93];
          id v52 = v93;
        }
        else
        {
          v51 = 0;
          id v52 = 0;
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v113 = __Block_byref_object_copy__46;
        v114 = __Block_byref_object_dispose__46;
        id v115 = 0;
        uint64_t v106 = 0;
        v107 = &v106;
        uint64_t v108 = 0x2020000000;
        LOBYTE(v109) = 1;
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_407;
        v75[3] = &unk_1E62F9C78;
        v75[4] = v74;
        id v30 = v30;
        char v90 = v68;
        id v76 = v30;
        v82 = &v106;
        v83 = buf;
        id v25 = v25;
        id v77 = v25;
        char v91 = a7;
        id v78 = v73;
        uint64_t v85 = v15;
        uint64_t v86 = v61;
        uint64_t v87 = a4;
        uint64_t v88 = a5;
        uint64_t v89 = a6;
        id v53 = v51;
        id v79 = v53;
        id v80 = v71;
        v84 = &v96;
        char v92 = v63;
        id v81 = v72;
        objc_msgSend(v70, "hk_enumerateUUIDBytesUsingBlock:", v75);
        if (!*((unsigned char *)v107 + 24))
        {
          id v54 = *(id *)(*(void *)&buf[8] + 40);
          v55 = v54;
          if (v54)
          {
            if (a12) {
              *a12 = v54;
            }
            else {
              _HKLogDroppedError();
            }
          }
        }
        if (a10)
        {
          v56 = (void *)v97[5];
          if (v56) {
            *a10 = v56;
          }
        }
        BOOL v33 = *((unsigned char *)v107 + 24) != 0;

        _Block_object_dispose(&v106, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_49;
      }
      _HKInitializeLogging();
      v47 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = @"data_provenances.source_id";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v26;
        _os_log_fault_impl(&dword_1BCB7D000, v47, OS_LOG_TYPE_FAULT, "Unexpected join clauses for %{public}@: %{public}@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a12, 100, @"Unexpected join clauses for %@", @"data_provenances.source_id");
      id v30 = 0;
LABEL_32:
      int v31 = 1;
      goto LABEL_33;
    }
    if (v59)
    {
      id v26 = v59;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error_, @"Unable to find parent source for source id %@"", v60);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        id v25 = 0;
        id v30 = 0;
        id v59 = 0;
        goto LABEL_32;
      }
    }
    if (a12)
    {
      id v26 = v26;
      id v25 = 0;
      id v30 = 0;
      *a12 = v26;
    }
    else
    {
      _HKLogDroppedError();
      id v25 = 0;
      id v30 = 0;
    }
    int v31 = 1;
    id v59 = v26;
    goto LABEL_33;
  }
  if (v69)
  {
    id v32 = v69;
    id v25 = v32;
    if (a12)
    {
      BOOL v33 = 0;
      *a12 = v32;
      goto LABEL_50;
    }
    _HKLogDroppedError();
LABEL_19:
    BOOL v33 = 0;
    goto LABEL_50;
  }
  if (![v14 permitPendingAssociations])
  {
    v46 = (void *)MEMORY[0x1E4F28C58];
    id v25 = [v73 UUIDString];
    objc_msgSend(v46, "hk_assignError:code:format:", a12, 3, @"Unable to find parent object for UUID %@ when inserting associations.", v25);
    goto LABEL_19;
  }
  long long v36 = [v72 UUID];
  id v37 = v73;
  id v38 = v70;
  id v39 = v71;
  id v40 = v36;
  id v41 = v74;
  uint64_t v42 = self;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__46;
  v110 = __Block_byref_object_dispose__46;
  id v111 = 0;
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x2020000000;
  char v105 = 1;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __167__HDAssociationEntity__insertPendingAssociationsForParentUUID_childUUIDData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectUUID_database_error___block_invoke;
  v113 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F9D68;
  uint64_t v120 = v42;
  v43 = (void (*)(uint64_t))v37;
  v114 = v43;
  uint64_t v121 = a4;
  uint64_t v122 = a5;
  uint64_t v123 = a6;
  id v25 = v40;
  id v115 = v25;
  char v124 = a7;
  id v44 = v39;
  id v116 = v44;
  id v45 = v41;
  id v117 = v45;
  v118 = &v106;
  v119 = &v102;
  objc_msgSend(v38, "hk_enumerateUUIDBytesUsingBlock:", buf);
  if (*((unsigned char *)v103 + 24))
  {
    BOOL v33 = 1;
  }
  else
  {
    id v48 = (id)v107[5];
    v49 = v48;
    if (v48)
    {
      if (a12) {
        *a12 = v48;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v33 = *((unsigned char *)v103 + 24) != 0;
  }

  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v106, 8);

LABEL_50:
  _Block_object_dispose(&v96, 8);

  return v33;
}

+ (BOOL)insertEntriesWithAssociationUUID:(id)a3 objectUUIDsData:(id)a4 type:(unint64_t)a5 destinationSubObjectReference:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = (void *)MEMORY[0x1E4F1C9C8];
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  if (a5) {
    [v14 now];
  }
  else {
  uint64_t v19 = [v14 distantPast];
  }
  LOWORD(v22) = 256;
  char v20 = [a1 _insertEntriesWithParentUUID:v18 childUUIDsData:v17 provenance:0 syncIdentity:objc_msgSend(v15 type:"currentSyncIdentityPersistentID") deleted:a5 creationDate:0 destinationSubObjectReference:v19 enforceSameSource:v16 permitPendingAssociations:v22 profile:v15 lastInsertedEntityID:0 error:a8];

  return v20;
}

+ (BOOL)copyAssociationsFromObject:(id)a3 toObject:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([a1 copyAssociationsFromObject:v10 toObject:v11 type:0 profile:v12 error:a6]) {
    char v13 = [a1 copyAssociationsFromObject:v10 toObject:v11 type:1 profile:v12 error:a6];
  }
  else {
    char v13 = 0;
  }

  return v13;
}

+ (BOOL)copyAssociationsFromObject:(id)a3 toObject:(id)a4 type:(unint64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = [a6 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke;
  v18[3] = &unk_1E62F5200;
  id v19 = v12;
  id v20 = v13;
  id v21 = a1;
  unint64_t v22 = a5;
  id v15 = v13;
  id v16 = v12;
  LOBYTE(a7) = [a1 performWriteTransactionWithHealthDatabase:v14 error:a7 block:v18];

  return (char)a7;
}

uint64_t __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  v6 = [*(id *)(a1 + 32) UUID];
  uint64_t v7 = HDDataEntityPredicateForDataUUID();
  id v30 = 0;
  uint64_t v8 = +[HDDataEntity anyInDatabase:v5 predicate:v7 error:&v30];
  id v9 = v30;

  if (!v9)
  {
    id v11 = [*(id *)(a1 + 40) UUID];
    id v12 = HDDataEntityPredicateForDataUUID();
    id v29 = 0;
    id v13 = +[HDDataEntity anyInDatabase:v5 predicate:v12 error:&v29];
    id v9 = v29;

    if (v9)
    {
      if (a3)
      {
        uint64_t v10 = 0;
        *a3 = v9;
LABEL_17:

        goto LABEL_18;
      }
      _HKLogDroppedError();
    }
    else
    {
      if (v8 && v13)
      {
        uint64_t v14 = [v8 persistentID];
        uint64_t v15 = [v13 persistentID];
        if (*(void *)(a1 + 56) == 1) {
          [MEMORY[0x1E4F1C9C8] date];
        }
        else {
        id v16 = [MEMORY[0x1E4F1C9C8] distantPast];
        }
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke_2;
        v28[3] = &__block_descriptor_40_e15___NSString_8__0l;
        v28[4] = *(void *)(a1 + 48);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke_3;
        v23[3] = &unk_1E62F9C00;
        id v24 = v16;
        uint64_t v25 = v15;
        uint64_t v20 = *(void *)(a1 + 56);
        uint64_t v26 = v14;
        uint64_t v27 = v20;
        id v21 = v16;
        uint64_t v10 = [v5 executeCachedStatementForKey:&HDAssociationEntityPropertyChildDataID_block_invoke_insertKey error:a3 SQLGenerator:v28 bindingHandler:v23 enumerationHandler:0];

        goto LABEL_17;
      }
      id v17 = (void *)MEMORY[0x1E4F28C58];
      id v18 = [*(id *)(a1 + 32) UUID];
      id v19 = [*(id *)(a1 + 40) UUID];
      objc_msgSend(v17, "hk_assignError:code:format:", a3, 3, @"One of the provided objects (UUIDs %@ and %@) was not found in database", v18, v19);
    }
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  if (a3)
  {
    id v9 = v9;
    uint64_t v10 = 0;
    *a3 = v9;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v10 = 0;
  }
LABEL_18:

  return v10;
}

id __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke_2(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v4 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v5 = objc_msgSend(v2, "initWithFormat:", @"INSERT INTO %@(%@, %@, %@, %@, %@, %@, %@) SELECT ?, %@, %@, %@, %@, %@, ? FROM %@ WHERE %@=? AND %@=? AND %@=? AND %@ IS NULL", v3, @"destination_object_id", @"source_object_id", @"sync_provenance", @"sync_identity", @"type", @"deleted", @"creation_date", @"source_object_id", @"sync_provenance", @"sync_identity", @"type", @"deleted", v4, @"destination_object_id", @"type",
                 @"deleted",
                 @"destination_sub_object_id",
                 0);

  return v5;
}

uint64_t __78__HDAssociationEntity_copyAssociationsFromObject_toObject_type_profile_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, 2, v4);
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 48));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 56));

  return sqlite3_bind_int64(a2, 5, 0);
}

+ (BOOL)copyAssociationsFromChildID:(id)a3 toObjectID:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__HDAssociationEntity_copyAssociationsFromChildID_toObjectID_profile_error___block_invoke;
  v18[3] = &unk_1E62F2E18;
  id v19 = v10;
  id v20 = v12;
  id v21 = v11;
  id v22 = a1;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v13 error:a6 block:v18];

  return (char)a6;
}

uint64_t __76__HDAssociationEntity_copyAssociationsFromChildID_toObjectID_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v18[7] = *MEMORY[0x1E4F143B8];
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  v6 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"source_object_id" equalToValue:*(void *)(a1 + 32)];
  v18[0] = @"destination_object_id";
  v18[1] = @"sync_provenance";
  v18[2] = @"sync_identity";
  v18[3] = @"type";
  void v18[4] = @"destination_sub_object_id";
  v18[5] = @"deleted";
  v18[6] = @"creation_date";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:7];
  uint64_t v8 = *(void **)(a1 + 56);
  id v9 = [*(id *)(a1 + 40) database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__HDAssociationEntity_copyAssociationsFromChildID_toObjectID_profile_error___block_invoke_2;
  v14[3] = &unk_1E62F7B80;
  id v10 = *(void **)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  id v15 = v10;
  id v16 = v5;
  id v11 = v5;
  uint64_t v12 = [v8 enumerateProperties:v7 withPredicate:v6 healthDatabase:v9 error:a3 enumerationHandler:v14];

  return v12;
}

uint64_t __76__HDAssociationEntity_copyAssociationsFromChildID_toObjectID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v8 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v9 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v10 = HDSQLiteColumnWithNameAsInt64();
  id v11 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  char v12 = HDSQLiteColumnWithNameAsBoolean();
  id v13 = HDSQLiteColumnWithNameAsDate();
  uint64_t v14 = +[HDAssociationEntity _insertAssociationEntryWithParentID:childID:provenance:syncIdentity:type:destinationSubObjectID:deleted:creationDate:lastInsertedEntityID:database:error:](*(void *)(a1 + 48), v7, [*(id *)(a1 + 32) longLongValue], v8, v9, v10, v11, v12, v13, &v16, *(void **)(a1 + 40), a5);

  return v14;
}

+ (uint64_t)_insertAssociationEntryWithParentID:(uint64_t)a3 childID:(uint64_t)a4 provenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 type:(void *)a7 destinationSubObjectID:(char)a8 deleted:(void *)a9 creationDate:(void *)a10 lastInsertedEntityID:(void *)a11 database:(uint64_t)a12 error:
{
  id v17 = a7;
  id v18 = a9;
  id v19 = a11;
  uint64_t v20 = self;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __176__HDAssociationEntity__insertAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_lastInsertedEntityID_database_error___block_invoke_2;
  v27[3] = &unk_1E62F9D40;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v33 = a5;
  uint64_t v34 = a6;
  char v35 = a8;
  id v28 = v17;
  id v29 = v18;
  id v26 = v18;
  id v21 = v17;
  uint64_t v22 = [v19 executeCachedStatementForKey:&_insertAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_lastInsertedEntityID_database_error__insertKey error:a12 SQLGenerator:&__block_literal_global_430 bindingHandler:v27 enumerationHandler:0];
  char v23 = +[HDAssociationEntity _findAssociationEntryWithParentID:childID:type:destinationSubObjectID:deleted:database:error:](v20, a2, a3, a6, v21, a8, v19, a12);

  *a10 = v23;
  return v22;
}

+ (uint64_t)_insertPendingAssociationForParentUUID:(uint64_t)a3 childUUIDBytes:(uint64_t)a4 provenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 type:(void *)a7 destinationSubObjectID:(char)a8 deleted:(void *)a9 creationDate:(void *)a10 database:(void *)a11 error:
{
  id v16 = a2;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  self;
  id v38 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __165__HDAssociationEntity__insertPendingAssociationForParentUUID_childUUIDBytes_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_database_error___block_invoke_2;
  v29[3] = &unk_1E62F9C28;
  id v20 = v16;
  id v30 = v20;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  uint64_t v35 = a5;
  uint64_t v36 = a6;
  char v37 = a8;
  id v21 = v18;
  id v31 = v21;
  id v22 = v17;
  id v32 = v22;
  LOBYTE(v18) = [v19 executeCachedStatementForKey:&_insertPendingAssociationForParentUUID_childUUIDBytes_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_database_error__insertKey error:&v38 SQLGenerator:&__block_literal_global_51 bindingHandler:v29 enumerationHandler:0];

  id v23 = v38;
  id v24 = v23;
  if (v18 & 1) != 0 || (objc_msgSend(v23, "hd_isConstraintViolation"))
  {
    uint64_t v25 = 1;
  }
  else
  {
    id v26 = v24;
    if (v26)
    {
      if (a11) {
        *a11 = v26;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v25 = 0;
  }

  return v25;
}

id __165__HDAssociationEntity__insertPendingAssociationForParentUUID_childUUIDBytes_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_database_error___block_invoke()
{
  v0 = NSString;
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v2 = [v0 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", v1, @"parent_uuid", @"child_uuid", @"sync_provenance", @"sync_identity", @"type", @"deleted", @"creation_date", @"destination_sub_uuid", 0];

  return v2;
}

uint64_t __165__HDAssociationEntity__insertPendingAssociationForParentUUID_childUUIDBytes_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_blob(a2, 2, *(const void **)(a1 + 56), 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 64));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 72));
  sqlite3_bind_int64(a2, 5, *(void *)(a1 + 80));
  sqlite3_bind_int64(a2, 6, *(unsigned __int8 *)(a1 + 88));
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, 7, v4);
  if (*(void *)(a1 + 48))
  {
    return HDSQLiteBindFoundationValueToStatement();
  }
  else
  {
    return sqlite3_bind_null(a2, 8);
  }
}

+ (id)journalEntryForAssociation:(id)a3 objects:(id)a4 profile:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v24 + 1) + 8 * i) UUID];
        objc_msgSend(v10, "hk_appendBytesWithUUID:", v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  id v17 = [_HDAssociationInsertionJournalEntry alloc];
  id v18 = [v7 UUID];
  uint64_t v19 = [v9 currentSyncIdentityPersistentID];
  id v20 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(v23) = 0;
  id v21 = [(_HDAssociationInsertionJournalEntry *)v17 initWithParentUUID:v18 childUUIDsData:v10 provenance:0 syncIdentity:v19 type:0 deleted:0 creationDate:v20 destinationSubObjectReference:0 enforceSameSource:v23];

  return v21;
}

uint64_t __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 persistentID];

  return [v2 numberWithLongLong:v3];
}

void __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_407(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v80 = 0;
  id v81 = &v80;
  uint64_t v82 = 0x2020000000;
  char v83 = 0;
  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x2020000000;
  char v79 = 0;
  uint64_t v72 = 0;
  id v73 = &v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = -1;
  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = -1;
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v66[4] = a2;
  id v67 = 0;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_2;
  v66[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_3;
  v64[3] = &unk_1E62F9C50;
  v64[4] = &v72;
  v64[5] = &v76;
  char v65 = *(unsigned char *)(a1 + 152);
  v64[6] = &v68;
  v64[7] = &v80;
  char v8 = [v6 executeSQL:v7 error:&v67 bindingHandler:v66 enumerationHandler:v64];
  id v9 = v67;
  id v10 = v67;
  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    *a3 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v9);
    goto LABEL_7;
  }
  if (*((unsigned char *)v77 + 24))
  {
    _HKInitializeLogging();
    id v11 = (id)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2];
      uint64_t v13 = [v12 UUIDString];
      *(_DWORD *)buf = 138543362;
      id v85 = v13;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "Not inserting association since object %{public}@ was previously deleted", buf, 0xCu);
    }
LABEL_5:

    goto LABEL_7;
  }
  if (!*((unsigned char *)v81 + 24))
  {
    if (*(unsigned char *)(a1 + 153))
    {
      *a3 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 118, @"Unable to find relationship for parentUUID and child.");
      uint64_t v26 = *(void *)(*(void *)(a1 + 96) + 8);
      long long v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      goto LABEL_7;
    }
    if (!*(unsigned char *)(a1 + 154))
    {
      _HKInitializeLogging();
      id v11 = (id)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v52 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2];
        id v53 = [v52 UUIDString];
        *(_DWORD *)buf = 138543362;
        id v85 = v53;
        _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "Not inserting association, unable to look up entity for object %{public}@ and pending associations are disabled.", buf, 0xCu);
      }
      goto LABEL_5;
    }
    uint64_t v42 = *(void *)(a1 + 112);
    v43 = *(void **)(a1 + 56);
    uint64_t v44 = *(void *)(a1 + 136);
    uint64_t v59 = *(void *)(a1 + 128);
    uint64_t v45 = *(void *)(a1 + 144);
    v46 = [*(id *)(a1 + 80) UUID];
    char v47 = *(unsigned char *)(a1 + 153);
    id v48 = *(void **)(a1 + 72);
    v49 = *(void **)(a1 + 32);
    uint64_t v50 = *(void *)(*(void *)(a1 + 96) + 8);
    id v60 = *(id *)(v50 + 40);
    char v51 = +[HDAssociationEntity _insertPendingAssociationForParentUUID:childUUIDBytes:provenance:syncIdentity:type:destinationSubObjectID:deleted:creationDate:database:error:](v42, v43, a2, v59, v44, v45, v46, v47, v48, v49, &v60);
    objc_storeStrong((id *)(v50 + 40), v60);

    if (v51) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
  if (!*(unsigned char *)(a1 + 152)
    || (uint64_t v14 = *(void **)(a1 + 48),
        [NSNumber numberWithLongLong:v69[3]],
        id v15 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v14) = [v14 containsObject:v15],
        v15,
        (v14 & 1) != 0))
  {
    if (*(unsigned char *)(a1 + 153))
    {
      uint64_t v16 = *(void *)(a1 + 112);
      uint64_t v17 = *(void *)(a1 + 120);
      uint64_t v18 = v73[3];
      uint64_t v19 = *(void *)(a1 + 144);
      id v20 = *(void **)(a1 + 64);
      id v21 = *(void **)(a1 + 32);
      uint64_t v22 = *(void *)(*(void *)(a1 + 96) + 8);
      id obj = *(id *)(v22 + 40);
      int v23 = +[HDAssociationEntity _removeAssociationEntryWithParentID:childID:provenance:syncIdentity:type:destinationSubObjectID:deleted:database:error:](v16, v17, v18, v19, v20, v21, (uint64_t)&obj);
      objc_storeStrong((id *)(v22 + 40), obj);
      if (!v23) {
        goto LABEL_24;
      }
      char v24 = *(unsigned char *)(a1 + 153) != 0;
    }
    else
    {
      char v24 = 0;
    }
    uint64_t v29 = *(void *)(a1 + 112);
    uint64_t v30 = *(void *)(a1 + 120);
    uint64_t v31 = v73[3];
    uint64_t v32 = *(void *)(a1 + 128);
    uint64_t v33 = *(void *)(a1 + 136);
    uint64_t v34 = *(void *)(a1 + 144);
    uint64_t v35 = *(void **)(a1 + 64);
    uint64_t v36 = *(void **)(a1 + 72);
    uint64_t v37 = *(void *)(*(void *)(a1 + 104) + 8);
    id v38 = *(void **)(v37 + 40);
    id v39 = *(void **)(a1 + 32);
    uint64_t v40 = *(void *)(*(void *)(a1 + 96) + 8);
    id v61 = *(id *)(v40 + 40);
    id v62 = v38;
    char v41 = +[HDAssociationEntity _insertAssociationEntryWithParentID:childID:provenance:syncIdentity:type:destinationSubObjectID:deleted:creationDate:lastInsertedEntityID:database:error:](v29, v30, v31, v32, v33, v34, v35, v24, v36, &v62, v39, (uint64_t)&v61);
    objc_storeStrong((id *)(v37 + 40), v62);
    objc_storeStrong((id *)(v40 + 40), v61);
    if (v41) {
      goto LABEL_7;
    }
LABEL_24:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    *a3 = 1;
    goto LABEL_7;
  }
  _HKInitializeLogging();
  id v28 = (id)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v54 = [*(id *)(a1 + 56) UUIDString];
    v55 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2];
    v56 = [v55 UUIDString];
    uint64_t v57 = v69[3];
    uint64_t v58 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    id v85 = v54;
    __int16 v86 = 2114;
    uint64_t v87 = v56;
    __int16 v88 = 2048;
    uint64_t v89 = v57;
    __int16 v90 = 2114;
    uint64_t v91 = v58;
    _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "Not inserting assocation from %{public}@ to %{public}@ because child source ID %lld is not in the allowable set of parent source IDs %{public}@", buf, 0x2Au);
  }
LABEL_7:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);
}

uint64_t __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_blob(a2, 1, *(const void **)(a1 + 32), 16, 0);

  return sqlite3_bind_int64(a2, 2, 1);
}

uint64_t __182__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_lastInsertedEntityID_context_error___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = HDSQLiteColumnAsInt64() == 2;
  if (*(unsigned char *)(a1 + 64)) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = HDSQLiteColumnAsInt64();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return 1;
}

+ (uint64_t)_removeAssociationEntryWithParentID:(uint64_t)a3 childID:(uint64_t)a4 provenance:(void *)a5 syncIdentity:(void *)a6 type:(uint64_t)a7 destinationSubObjectID:deleted:database:error:
{
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = self;
  id v15 = +[HDAssociationEntity _findAssociationEntryWithParentID:childID:type:destinationSubObjectID:deleted:database:error:](v14, a2, a3, a4, v13, 0, v12, a7);

  if (v15)
  {
    uint64_t v16 = NSString;
    uint64_t v17 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    uint64_t v18 = [v16 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v17, *MEMORY[0x1E4F65C70]];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __142__HDAssociationEntity__removeAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_database_error___block_invoke;
    v21[3] = &unk_1E62F43C8;
    id v22 = v15;
    uint64_t v19 = [v12 executeSQL:v18 error:a7 bindingHandler:v21 enumerationHandler:0];
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

+ (BOOL)_insertEntriesWithParentUUID:(id)a3 childUUIDsData:(id)a4 provenance:(int64_t)a5 syncIdentity:(int64_t)a6 type:(unint64_t)a7 deleted:(BOOL)a8 creationDate:(id)a9 destinationSubObjectReference:(id)a10 enforceSameSource:(BOOL)a11 permitPendingAssociations:(BOOL)a12 profile:(id)a13 lastInsertedEntityID:(id *)a14 error:(id *)a15
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a9;
  id v19 = a10;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__46;
  uint64_t v32 = __Block_byref_object_dispose__46;
  id v33 = 0;
  id v20 = a13;
  id v21 = v16;
  id v22 = v17;
  id v23 = v18;
  id v24 = v19;
  char v25 = HKWithAutoreleasePool();
  if (a14)
  {
    uint64_t v26 = (void *)v29[5];
    if (v26) {
      *a14 = v26;
    }
  }

  _Block_object_dispose(&v28, 8);
  return v25;
}

uint64_t __226__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_enforceSameSource_permitPendingAssociations_profile_lastInsertedEntityID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)(a1 + 80);
  id v5 = [*(id *)(a1 + 32) database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __226__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_enforceSameSource_permitPendingAssociations_profile_lastInsertedEntityID_error___block_invoke_2;
  v22[3] = &unk_1E62F9CA0;
  id v23 = *(id *)(a1 + 40);
  __int16 v32 = *(_WORD *)(a1 + 112);
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 80);
  id v24 = v6;
  uint64_t v29 = v7;
  id v25 = *(id *)(a1 + 48);
  long long v30 = *(_OWORD *)(a1 + 88);
  uint64_t v31 = *(void *)(a1 + 104);
  char v33 = *(unsigned char *)(a1 + 114);
  id v26 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  id v27 = v8;
  uint64_t v28 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __226__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_enforceSameSource_permitPendingAssociations_profile_lastInsertedEntityID_error___block_invoke_3;
  v12[3] = &unk_1E62F9CC8;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  long long v18 = *(_OWORD *)(a1 + 88);
  uint64_t v19 = *(void *)(a1 + 104);
  char v20 = *(unsigned char *)(a1 + 114);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  char v21 = *(unsigned char *)(a1 + 112);
  id v17 = *(id *)(a1 + 32);
  uint64_t v10 = [v4 performWriteTransactionWithHealthDatabase:v5 error:a2 block:v22 inaccessibilityHandler:v12];

  return v10;
}

BOOL __226__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_enforceSameSource_permitPendingAssociations_profile_lastInsertedEntityID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [[_HDAssociationInsertionContext alloc] initWithParentUUID:*(void *)(a1 + 32) enforceSameSource:*(unsigned __int8 *)(a1 + 112) permitPendingAssociations:*(unsigned __int8 *)(a1 + 113) profile:*(void *)(a1 + 40) transaction:v5];

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 96);
  uint64_t v11 = *(void *)(a1 + 104);
  char v12 = *(unsigned char *)(a1 + 114);
  id v13 = *(void **)(a1 + 48);
  id v14 = *(void **)(a1 + 56);
  id v15 = *(void **)(a1 + 64);
  uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v16 + 40);
  BOOL v17 = +[HDAssociationEntity _insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:lastInsertedEntityID:context:error:](v8, v7, v13, v9, v10, v11, v12, v14, v15, &obj, v6, a3);
  objc_storeStrong((id *)(v16 + 40), obj);

  return v17;
}

uint64_t __226__HDAssociationEntity__insertEntriesWithParentUUID_childUUIDsData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectReference_enforceSameSource_permitPendingAssociations_profile_lastInsertedEntityID_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [_HDAssociationInsertionJournalEntry alloc];
  LOBYTE(v10) = *(unsigned char *)(a1 + 97);
  id v6 = [(_HDAssociationInsertionJournalEntry *)v5 initWithParentUUID:*(void *)(a1 + 32) childUUIDsData:*(void *)(a1 + 40) provenance:*(void *)(a1 + 72) syncIdentity:*(void *)(a1 + 80) type:*(void *)(a1 + 88) deleted:*(unsigned __int8 *)(a1 + 96) creationDate:*(void *)(a1 + 48) destinationSubObjectReference:*(void *)(a1 + 56) enforceSameSource:v10];
  uint64_t v7 = [*(id *)(a1 + 64) database];
  uint64_t v8 = [v7 addJournalEntry:v6 error:a3];

  return v8;
}

+ (id)_findAssociationEntryWithParentID:(uint64_t)a3 childID:(uint64_t)a4 type:(void *)a5 destinationSubObjectID:(char)a6 deleted:(void *)a7 database:(uint64_t)a8 error:
{
  id v26 = a5;
  id v25 = a7;
  self;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__46;
  id v38 = __Block_byref_object_dispose__46;
  id v39 = 0;
  uint64_t v9 = NSString;
  uint64_t v10 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v11 = *MEMORY[0x1E4F65C70];
  char v12 = [v9 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ? AND %@ IS NULL", *MEMORY[0x1E4F65C70], v10, @"destination_object_id", @"source_object_id", @"type", @"deleted", @"destination_sub_object_id"];

  if (v26)
  {
    id v13 = NSString;
    id v14 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    uint64_t v15 = [v13 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ = ? AND %@ = ?", v11, v14, @"destination_object_id", @"source_object_id", @"type", @"deleted", @"destination_sub_object_id"];

    char v12 = (void *)v15;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __116__HDAssociationEntity__findAssociationEntryWithParentID_childID_type_destinationSubObjectID_deleted_database_error___block_invoke;
  v28[3] = &unk_1E62F9D18;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  char v33 = a6;
  id v16 = v26;
  id v29 = v16;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __116__HDAssociationEntity__findAssociationEntryWithParentID_childID_type_destinationSubObjectID_deleted_database_error___block_invoke_2;
  v27[3] = &unk_1E62F3640;
  void v27[4] = &v34;
  if ([v25 executeSQL:v12 error:a8 bindingHandler:v28 enumerationHandler:v27])
  {
    BOOL v17 = (void *)v35[5];
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a8, 3, @"Unable to find all associations for parent object for %lld when dis-associating.", a2);
      BOOL v17 = (void *)v35[5];
    }
    long long v18 = (void *)[v17 copy];
  }
  else
  {
    long long v18 = 0;
  }

  _Block_object_dispose(&v34, 8);

  return v18;
}

void *__116__HDAssociationEntity__findAssociationEntryWithParentID_childID_type_destinationSubObjectID_deleted_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 48));
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 56));
  sqlite3_bind_int64(a2, 4, *(unsigned __int8 *)(a1 + 64));
  result = *(void **)(a1 + 32);
  if (result)
  {
    sqlite3_int64 v5 = [result longLongValue];
    return (void *)sqlite3_bind_int64(a2, 5, v5);
  }
  return result;
}

uint64_t __116__HDAssociationEntity__findAssociationEntryWithParentID_childID_type_destinationSubObjectID_deleted_database_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithLongLong:HDSQLiteColumnAsInt64()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

uint64_t __142__HDAssociationEntity__removeAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) longLongValue];

  return sqlite3_bind_int64(a2, 1, v3);
}

id __176__HDAssociationEntity__insertAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_lastInsertedEntityID_database_error___block_invoke()
{
  v0 = NSString;
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v2 = [v0 stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", v1, @"destination_object_id", @"source_object_id", @"sync_provenance", @"sync_identity", @"destination_sub_object_id", @"type", @"deleted", @"creation_date", 0];

  return v2;
}

uint64_t __176__HDAssociationEntity__insertAssociationEntryWithParentID_childID_provenance_syncIdentity_type_destinationSubObjectID_deleted_creationDate_lastInsertedEntityID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 48));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 56));
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 64));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 72));
  double v4 = *(void **)(a1 + 32);
  if (v4) {
    sqlite3_bind_int64(a2, 5, [v4 longLongValue]);
  }
  else {
    sqlite3_bind_null(a2, 5);
  }
  sqlite3_bind_int64(a2, 6, *(void *)(a1 + 80));
  sqlite3_bind_int64(a2, 7, *(unsigned __int8 *)(a1 + 88));
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];

  return sqlite3_bind_double(a2, 8, v5);
}

void __167__HDAssociationEntity__insertPendingAssociationsForParentUUID_childUUIDData_provenance_syncIdentity_type_deleted_creationDate_destinationSubObjectUUID_database_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 96);
  uint64_t v9 = *(void *)(a1 + 104);
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 112);
  id v13 = *(void **)(a1 + 48);
  id v14 = *(void **)(a1 + 56);
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v15 + 40);
  char v16 = +[HDAssociationEntity _insertPendingAssociationForParentUUID:childUUIDBytes:provenance:syncIdentity:type:destinationSubObjectID:deleted:creationDate:database:error:](v6, v10, a2, v7, v8, v9, v11, v12, v13, v14, &obj);
  objc_storeStrong((id *)(v15 + 40), obj);
  if ((v16 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *a3 = 1;
  }
}

+ (BOOL)realizePendingAssociationsWithTransaction:(id)a3 startingAnchor:(int64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (qword_1E9FC51C0 != -1) {
    dispatch_once(&qword_1E9FC51C0, &__block_literal_global_436);
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = [v8 databaseForEntityClass:a1];
  uint64_t v11 = _MergedGlobals_3;
  id v31 = a1;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_2;
  v32[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v32[4] = a4;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_3;
  v28[3] = &unk_1E62F9D90;
  id v12 = v10;
  id v29 = v12;
  id v13 = v9;
  id v30 = v13;
  if ([v12 executeSQL:v11 error:a5 bindingHandler:v32 enumerationHandler:v28])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v22 = v13;
      uint64_t v17 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_4;
          v23[3] = &unk_1E62F43C8;
          void v23[4] = v19;
          if (![v12 executeSQL:qword_1E9FC51B8 error:a5 bindingHandler:v23 enumerationHandler:0])
          {
            BOOL v20 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      BOOL v20 = 1;
LABEL_15:
      id v13 = v22;
    }
    else
    {
      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

void __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke()
{
  id v12 = NSString;
  uint64_t v11 = *MEMORY[0x1E4F65C70];
  uint64_t v10 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v9 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v0 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v2 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  sqlite3_int64 v3 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  objc_msgSend(v12, "stringWithFormat:", @"SELECT parent.%@, child.%@, a.%@, a.%@, a.%@, a.%@, a.%@, a.%@, a.%@ FROM %@ parent CROSS JOIN %@ a ON parent.%@ = a.%@ INNER JOIN %@ child ON child.%@ = a.%@ WHERE parent.%@ > ? UNION SELECT parent.%@, child.%@, a.%@, a.%@, a.%@, a.%@, a.%@, a.%@, a.%@ FROM %@ child CROSS JOIN %@ a ON child.%@ = a.%@ INNER JOIN %@ parent ON parent.%@ = a.%@ WHERE child.%@ > ?", @"data_id", @"data_id", @"sync_provenance", @"sync_identity", v11, @"type", @"deleted", @"creation_date", @"destination_sub_uuid", v10, v9, @"uuid", @"parent_uuid", v0, @"uuid", @"child_uuid",
    @"data_id",
    @"data_id",
    @"data_id",
    @"sync_provenance",
    @"sync_identity",
    v11,
    @"type",
    @"deleted",
    @"creation_date",
    @"destination_sub_uuid",
    v1,
    v2,
    @"uuid",
    @"child_uuid",
    v3,
    @"uuid",
    @"parent_uuid",
  uint64_t v4 = @"data_id");
  double v5 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = v4;

  uint64_t v6 = NSString;
  id v13 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v7 = [v6 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v13, v11];
  id v8 = (void *)qword_1E9FC51B8;
  qword_1E9FC51B8 = v7;
}

uint64_t __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 32);

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = HDSQLiteColumnAsInt64();
  uint64_t v7 = HDSQLiteColumnAsInt64();
  uint64_t v18 = HDSQLiteColumnAsInt64();
  uint64_t v8 = HDSQLiteColumnAsInt64();
  id v9 = MEMORY[0x1C1879F70](a2, 4);
  uint64_t v10 = HDSQLiteColumnAsInt64();
  int v11 = MEMORY[0x1C1879F00](a2, 6);
  id v12 = MEMORY[0x1C1879F30](a2, 7);
  id v13 = MEMORY[0x1C1879F70](a2, 8);
  if (v11
    && !+[HDAssociationEntity _removeAssociationEntryWithParentID:childID:provenance:syncIdentity:type:destinationSubObjectID:deleted:database:error:](*(void *)(a1 + 48), v6, v7, v10, v13, *(void **)(a1 + 32), a3))
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 48);
    id v19 = 0;
    uint64_t v15 = +[HDAssociationEntity _insertAssociationEntryWithParentID:childID:provenance:syncIdentity:type:destinationSubObjectID:deleted:creationDate:lastInsertedEntityID:database:error:](v14, v6, v7, v18, v8, v10, v13, v11, v12, &v19, *(void **)(a1 + 32), a3);
    id v16 = v19;
    if (v15) {
      [*(id *)(a1 + 40) addObject:v9];
    }
  }
  return v15;
}

uint64_t __86__HDAssociationEntity_realizePendingAssociationsWithTransaction_startingAnchor_error___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) longLongValue];

  return sqlite3_bind_int64(a2, 1, v3);
}

+ (id)objectIDsForAssociationEntityWithPersistentID:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__46;
  uint64_t v17 = __Block_byref_object_dispose__46;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [v8 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__HDAssociationEntity_objectIDsForAssociationEntityWithPersistentID_profile_error___block_invoke;
  v12[3] = &unk_1E62F9DE0;
  v12[5] = a1;
  v12[6] = a3;
  void v12[4] = &v13;
  LOBYTE(a5) = [a1 performReadTransactionWithHealthDatabase:v9 error:a5 block:v12];

  if (a5) {
    id v10 = (id)v14[5];
  }
  else {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __83__HDAssociationEntity_objectIDsForAssociationEntityWithPersistentID_profile_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  double v5 = [a2 databaseForEntityClass:a1[5]];
  uint64_t v6 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v7 = [NSNumber numberWithLongLong:a1[6]];
  id v8 = [v6 predicateWithProperty:@"destination_object_id" equalToValue:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v9 setPredicate:v8];
  [v9 setEntityClass:a1[5]];
  v15[0] = @"source_object_id";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v5 descriptor:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__HDAssociationEntity_objectIDsForAssociationEntityWithPersistentID_profile_error___block_invoke_2;
  v14[3] = &unk_1E62F9DB8;
  void v14[4] = a1[4];
  uint64_t v12 = [v11 enumerateProperties:v10 error:a3 enumerationHandler:v14];

  return v12;
}

uint64_t __83__HDAssociationEntity_objectIDsForAssociationEntityWithPersistentID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v4 = MEMORY[0x1C1879F70](a3, 0);
  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  }

  return 1;
}

+ (id)deleteStatementForParentIDWithTransaction:(id)a3
{
  sqlite3_int64 v4 = [a3 databaseForEntityClass:a1];
  double v5 = [a1 deleteStatementWithProperty:@"destination_object_id" database:v4];

  return v5;
}

+ (id)deleteStatementForChildIDsWithTransaction:(id)a3
{
  sqlite3_int64 v4 = [a3 databaseForEntityClass:a1];
  double v5 = [a1 deleteStatementWithProperty:@"source_object_id" database:v4];

  return v5;
}

+ (id)objectsAssociatedWithObjectPID:(int64_t)a3 subObjectReference:(id)a4 dataTypes:(id)a5 associationType:(unint64_t)a6 limit:(unint64_t)a7 sortDescending:(BOOL)a8 profile:(id)a9 error:(id *)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__46;
  uint64_t v45 = __Block_byref_object_dispose__46;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__46;
  v39[4] = __Block_byref_object_dispose__46;
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__46;
  v37[4] = __Block_byref_object_dispose__46;
  id v38 = 0;
  id v18 = [v17 database];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __134__HDAssociationEntity_objectsAssociatedWithObjectPID_subObjectReference_dataTypes_associationType_limit_sortDescending_profile_error___block_invoke;
  v25[3] = &unk_1E62F9E30;
  id v19 = v16;
  id v26 = v19;
  int64_t v32 = a3;
  id v20 = v15;
  id v27 = v20;
  unint64_t v33 = a6;
  id v34 = a1;
  BOOL v36 = a8;
  unint64_t v35 = a7;
  id v21 = v17;
  id v28 = v21;
  id v29 = v37;
  id v30 = v39;
  id v31 = &v41;
  LOBYTE(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v18 error:a10 block:v25];

  if (a5) {
    id v22 = (id)v42[5];
  }
  else {
    id v22 = 0;
  }

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(&v41, 8);

  return v22;
}

uint64_t __134__HDAssociationEntity_objectsAssociatedWithObjectPID_subObjectReference_dataTypes_associationType_limit_sortDescending_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v47 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v47)
  {
    unint64_t v4 = 0x1E4F65000uLL;
    unint64_t v5 = 0x1E4F28000uLL;
    uint64_t v46 = *(void *)v52;
    uint64_t v6 = @"child_id_samples.data_type";
    while (2)
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v52 != v46) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v10 = *(void **)(v4 + 3328);
        int v11 = [*(id *)(v5 + 3792) numberWithLongLong:*(void *)(a1 + 80)];
        uint64_t v12 = [v10 predicateWithProperty:@"destination_object_id" equalToValue:v11];
        [v9 addObject:v12];

        uint64_t v13 = *(void **)(a1 + 40);
        if (v13)
        {
          uint64_t v14 = [v13 persistentIDInTransaction:v45 error:a3];
          if (!v14) {
            goto LABEL_25;
          }
          id v15 = v14;
          uint64_t v16 = [v14 longLongValue];
          id v17 = *(void **)(v4 + 3328);
          id v18 = [*(id *)(v5 + 3792) numberWithLongLong:v16];
          id v19 = [v17 predicateWithProperty:@"destination_sub_object_id" equalToValue:v18];
          [v9 addObject:v19];
        }
        else
        {
          id v15 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"destination_sub_object_id"];
          [v9 addObject:v15];
        }

        id v20 = [*(id *)(v4 + 3328) predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
        [v9 addObject:v20];

        id v21 = *(void **)(v4 + 3328);
        id v22 = objc_msgSend(*(id *)(v5 + 3792), "numberWithInteger:", objc_msgSend(v8, "code"));
        id v23 = [v21 predicateWithProperty:v6 equalToValue:v22];
        [v9 addObject:v23];

        long long v24 = *(void **)(v4 + 3328);
        long long v25 = [*(id *)(v5 + 3792) numberWithUnsignedInteger:*(void *)(a1 + 88)];
        id v26 = [v24 predicateWithProperty:@"type" equalToValue:v25];
        [v9 addObject:v26];

        if (*(unsigned char *)(a1 + 112))
        {
          id v27 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"creation_date" entityClass:objc_opt_class() ascending:0];
          id v28 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:v6 entityClass:objc_opt_class() ascending:0];
          id v29 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"ROWID" entityClass:*(void *)(a1 + 96) ascending:0];
          v56[0] = v28;
          v56[1] = v27;
          v56[2] = v29;
          id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
        }
        else
        {
          id v30 = 0;
        }
        id v31 = *(void **)(a1 + 96);
        int64_t v32 = v6;
        v55[0] = v6;
        v55[1] = @"child_id_samples.data_id";
        unint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
        id v34 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v9];
        uint64_t v35 = *(void *)(a1 + 104);
        BOOL v36 = [*(id *)(a1 + 48) database];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __134__HDAssociationEntity_objectsAssociatedWithObjectPID_subObjectReference_dataTypes_associationType_limit_sortDescending_profile_error___block_invoke_2;
        v49[3] = &unk_1E62F9E08;
        long long v50 = *(_OWORD *)(a1 + 56);
        LODWORD(v31) = [v31 enumerateProperties:v33 withPredicate:v34 orderingTerms:v30 groupBy:0 limit:v35 healthDatabase:v36 error:a3 enumerationHandler:v49];

        if (!v31) {
          goto LABEL_24;
        }
        unint64_t v5 = 0x1E4F28000;
        uint64_t v6 = v32;
        unint64_t v4 = 0x1E4F65000;
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
          && [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
        {
          uint64_t v37 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"data_id" values:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
          id v38 = +[HDSampleEntity samplesWithType:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) profile:*(void *)(a1 + 48) encodingOptions:0 predicate:v37 limit:*(void *)(a1 + 104) anchor:0 error:a3];
          id v39 = v38;
          if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) || ![v38 count])
          {

LABEL_24:
LABEL_25:

            uint64_t v42 = 0;
            goto LABEL_26;
          }
          [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObjectsFromArray:v39];
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeAllObjects];
          uint64_t v40 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v41 = *(void **)(v40 + 40);
          *(void *)(v40 + 40) = 0;
        }
      }
      uint64_t v42 = 1;
      uint64_t v47 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v47) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v42 = 1;
  }
LABEL_26:

  return v42;
}

uint64_t __134__HDAssociationEntity_objectsAssociatedWithObjectPID_subObjectReference_dataTypes_associationType_limit_sortDescending_profile_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F2B448] dataTypeWithCode:HDSQLiteColumnAsInt64()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = HDSQLiteColumnAsInt64();
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v7 = [NSNumber numberWithInteger:v5];
  [v6 addObject:v7];

  return 1;
}

+ (id)countOfObjectsAssociatedWithObjectUUID:(id)a3 subObjectReference:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__46;
  id v31 = __Block_byref_object_dispose__46;
  id v32 = 0;
  id v15 = [v14 database];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __110__HDAssociationEntity_countOfObjectsAssociatedWithObjectUUID_subObjectReference_excludeDeleted_profile_error___block_invoke;
  v21[3] = &unk_1E62F9E58;
  id v16 = v12;
  id v22 = v16;
  id v17 = v13;
  BOOL v26 = a5;
  id v23 = v17;
  long long v24 = &v27;
  id v25 = a1;
  LODWORD(a7) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v15 error:a7 block:v21];

  if (a7) {
    id v18 = (void *)v28[5];
  }
  else {
    id v18 = &unk_1F17EB448;
  }
  id v19 = v18;

  _Block_object_dispose(&v27, 8);

  return v19;
}

BOOL __110__HDAssociationEntity_countOfObjectsAssociatedWithObjectUUID_subObjectReference_excludeDeleted_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 protectedDatabase];
  uint64_t v7 = HDDataEntityPredicateForDataUUID();
  id v8 = +[HDDataEntity anyInDatabase:v6 predicate:v7 error:a3];

  if (v8)
  {
    id v9 = objc_opt_new();
    id v10 = (void *)MEMORY[0x1E4F65D00];
    int v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
    id v12 = [v10 predicateWithProperty:@"destination_object_id" equalToValue:v11];
    [v9 addObject:v12];

    id v13 = *(void **)(a1 + 40);
    if (v13)
    {
      id v14 = (void *)MEMORY[0x1E4F65D00];
      id v15 = [v13 UUID];
      id v16 = _HDSQLiteValueForUUID();
      id v17 = [v14 predicateWithProperty:@"child_id_objects.uuid" equalToValue:v16];
      [v9 addObject:v17];
    }
    else
    {
      id v15 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"destination_sub_object_id"];
      [v9 addObject:v15];
    }

    if (*(unsigned char *)(a1 + 64))
    {
      id v19 = (void *)MEMORY[0x1E4F65D00];
      id v20 = [NSNumber numberWithInt:0];
      id v21 = [v19 predicateWithProperty:@"deleted" equalToValue:v20];
      [v9 addObject:v21];
    }
    id v22 = *(void **)(a1 + 56);
    uint64_t v23 = *MEMORY[0x1E4F65C78];
    long long v24 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v9];
    id v25 = [v5 protectedDatabase];
    uint64_t v26 = [v22 countValueForProperty:v23 predicate:v24 database:v25 error:a3];
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    id v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    BOOL v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (id)countOfObjectsAssociatedWithObjectPID:(int64_t)a3 excludeDeleted:(BOOL)a4 associationType:(unint64_t)a5 anchor:(int64_t)a6 transaction:(id)a7 error:(id *)a8
{
  BOOL v10 = a4;
  id v13 = a7;
  id v14 = objc_opt_new();
  id v15 = (void *)MEMORY[0x1E4F65D00];
  id v16 = [NSNumber numberWithLongLong:a3];
  id v17 = [v15 predicateWithProperty:@"destination_object_id" equalToValue:v16];
  [v14 addObject:v17];

  if (v10)
  {
    BOOL v18 = (void *)MEMORY[0x1E4F65D00];
    id v19 = [NSNumber numberWithInt:0];
    id v20 = [v18 predicateWithProperty:@"deleted" equalToValue:v19];
    [v14 addObject:v20];
  }
  id v21 = (void *)MEMORY[0x1E4F65D00];
  id v22 = [NSNumber numberWithUnsignedInteger:a5];
  uint64_t v23 = [v21 predicateWithProperty:@"type" equalToValue:v22];
  [v14 addObject:v23];

  long long v24 = (void *)MEMORY[0x1E4F65D00];
  id v25 = [NSNumber numberWithLongLong:a6];
  uint64_t v26 = [v24 predicateWithProperty:@"ROWID" greaterThanValue:v25];
  [v14 addObject:v26];

  uint64_t v27 = *MEMORY[0x1E4F65C78];
  id v28 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v14];
  uint64_t v29 = [v13 protectedDatabase];

  id v30 = [a1 countValueForProperty:v27 predicate:v28 database:v29 error:a8];

  return v30;
}

+ (id)objectUUIDsAssociatedWithObjectUUID:(id)a3 subObjectReference:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDAssociationEntity _UUIDsAssociatedWithUUID:subObjectReference:predicateProperty:enumerateProperty:excludeDeleted:profile:error:]((uint64_t)a1, a3, a4, @"destination_object_id", @"child_id_objects.uuid", a5, a6, (uint64_t)a7);
}

+ (id)_UUIDsAssociatedWithUUID:(void *)a3 subObjectReference:(void *)a4 predicateProperty:(void *)a5 enumerateProperty:(char)a6 excludeDeleted:(void *)a7 profile:(uint64_t)a8 error:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v18 = self;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = [v17 database];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __132__HDAssociationEntity__UUIDsAssociatedWithUUID_subObjectReference_predicateProperty_enumerateProperty_excludeDeleted_profile_error___block_invoke;
  v31[3] = &unk_1E62F9E80;
  id v32 = v13;
  id v33 = v14;
  char v39 = a6;
  id v37 = v19;
  uint64_t v38 = v18;
  id v34 = v15;
  id v35 = v16;
  id v36 = v17;
  id v21 = v19;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  id v26 = v13;
  LODWORD(v19) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v20 error:a8 block:v31];

  if (v19) {
    uint64_t v27 = v21;
  }
  else {
    uint64_t v27 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v28 = v27;

  return v28;
}

+ (id)associationUUIDsForObjectUUID:(id)a3 subObjectReference:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDAssociationEntity _UUIDsAssociatedWithUUID:subObjectReference:predicateProperty:enumerateProperty:excludeDeleted:profile:error:]((uint64_t)a1, a3, a4, @"source_object_id", @"parent_id_objects.uuid", a5, a6, (uint64_t)a7);
}

uint64_t __132__HDAssociationEntity__UUIDsAssociatedWithUUID_subObjectReference_predicateProperty_enumerateProperty_excludeDeleted_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 protectedDatabase];
  uint64_t v7 = HDDataEntityPredicateForDataUUID();
  id v35 = 0;
  id v8 = +[HDDataEntity anyInDatabase:v6 predicate:v7 error:&v35];
  id v9 = v35;

  if (v8)
  {
    BOOL v10 = *(void **)(a1 + 40);
    if (v10)
    {
      id v34 = 0;
      id v11 = [v10 persistentIDInTransaction:v5 error:&v34];
      id v12 = v34;
      if (!v11)
      {
        id v29 = v12;
        id v15 = v29;
        if (v29)
        {
          if (a3)
          {
            id v15 = v29;
            uint64_t v14 = 0;
            *a3 = v15;
          }
          else
          {
            _HKLogDroppedError();
            uint64_t v14 = 0;
          }
          id v11 = v15;
        }
        else
        {
          id v11 = 0;
          uint64_t v14 = 1;
        }
        goto LABEL_15;
      }
      id v30 = a3;
    }
    else
    {
      id v30 = a3;
      id v11 = 0;
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v16 = (void *)MEMORY[0x1E4F65D00];
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
    id v19 = [v16 predicateWithProperty:v17 equalToValue:v18];
    [v15 addObject:v19];

    if (v11) {
      [MEMORY[0x1E4F65D00] predicateWithProperty:@"destination_sub_object_id" equalToValue:v11];
    }
    else {
    id v20 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"destination_sub_object_id"];
    }
    objc_msgSend(v15, "addObject:", v20, v30);

    if (*(unsigned char *)(a1 + 88))
    {
      id v21 = (void *)MEMORY[0x1E4F65D00];
      id v22 = [NSNumber numberWithInt:0];
      id v23 = [v21 predicateWithProperty:@"deleted" equalToValue:v22];
      [v15 addObject:v23];
    }
    id v24 = *(void **)(a1 + 80);
    v36[0] = *(void *)(a1 + 56);
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    id v26 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v15];
    uint64_t v27 = [*(id *)(a1 + 64) database];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __132__HDAssociationEntity__UUIDsAssociatedWithUUID_subObjectReference_predicateProperty_enumerateProperty_excludeDeleted_profile_error___block_invoke_2;
    v32[3] = &unk_1E62F4CC0;
    id v33 = *(id *)(a1 + 72);
    uint64_t v14 = [v24 enumerateProperties:v25 withPredicate:v26 healthDatabase:v27 error:v31 enumerationHandler:v32];

LABEL_15:
    goto LABEL_16;
  }
  id v13 = v9;
  id v11 = v13;
  if (v13)
  {
    if (a3)
    {
      id v11 = v13;
      uint64_t v14 = 0;
      *a3 = v11;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 1;
  }
LABEL_16:

  return v14;
}

uint64_t __132__HDAssociationEntity__UUIDsAssociatedWithUUID_subObjectReference_predicateProperty_enumerateProperty_excludeDeleted_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = MEMORY[0x1C1879F90](a4, 0);
  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }

  return 1;
}

+ (BOOL)_enumerateAssociationsWithPredicate:(id)a3 syncEntityClass:(Class)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 lastSyncAnchor:(int64_t *)a7 healthDatabase:(id)a8 error:(id *)a9 block:(id)a10
{
  int64_t end = a6.end;
  int64_t start = a6.start;
  v33[3] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a8;
  id v19 = a10;
  id v20 = objc_msgSend(a1, "predicateForSyncWithPredicate:syncEntityClass:session:syncAnchorRange:", v16, a4, v17, start, end);
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int64_t v32 = start;
  v33[0] = @"parent_id_objects.uuid";
  v33[1] = @"child_id_objects.uuid";
  v33[2] = @"sync_identity";
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __141__HDAssociationEntity__enumerateAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_error_block___block_invoke;
  v26[3] = &unk_1E62F9ED0;
  id v22 = v19;
  id v27 = v22;
  id v28 = &v29;
  char v23 = [a1 enumerateProperties:v21 withPredicate:v20 healthDatabase:v18 error:a9 enumerationHandler:v26];

  char v24 = v23 ^ 1;
  if (!a7) {
    char v24 = 1;
  }
  if ((v24 & 1) == 0) {
    *a7 = v30[3];
  }

  _Block_object_dispose(&v29, 8);
  return v23;
}

uint64_t __141__HDAssociationEntity__enumerateAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_error_block___block_invoke(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v1 = HKWithAutoreleasePool();

  return v1;
}

BOOL __141__HDAssociationEntity__enumerateAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_error_block___block_invoke_2(void *a1)
{
  uint64_t v2 = MEMORY[0x1C1879F90](a1[6], 0);
  id v3 = MEMORY[0x1C1879F90](a1[6], 1);
  HDSQLiteColumnAsInt64();
  char v6 = 0;
  (*(void (**)(void))(a1[4] + 16))();
  *(void *)(*(void *)(a1[5] + 8) + 24) = a1[7];
  BOOL v4 = v6 == 0;

  return v4;
}

+ (BOOL)_enumerateTypedAssociationsWithPredicate:(id)a3 syncEntityClass:(Class)a4 session:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 lastSyncAnchor:(int64_t *)a7 healthDatabase:(id)a8 transaction:(id)a9 error:(id *)a10 block:(id)a11
{
  int64_t end = a6.end;
  int64_t start = a6.start;
  v37[7] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  id v20 = a11;
  id v21 = objc_msgSend(a1, "predicateForSyncWithPredicate:syncEntityClass:session:syncAnchorRange:", v16, a4, v17, start, end);
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int64_t v36 = start;
  v37[0] = @"parent_id_objects.uuid";
  v37[1] = @"child_id_objects.uuid";
  v37[2] = @"sync_identity";
  v37[3] = @"type";
  v37[4] = @"deleted";
  void v37[5] = @"creation_date";
  v37[6] = @"destination_sub_object_id";
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:7];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __158__HDAssociationEntity__enumerateTypedAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_transaction_error_block___block_invoke;
  v29[3] = &unk_1E62F9F20;
  id v23 = v19;
  id v30 = v23;
  id v24 = v20;
  id v31 = v24;
  int64_t v32 = &v33;
  char v25 = [a1 enumerateProperties:v22 withPredicate:v21 healthDatabase:v18 error:a10 enumerationHandler:v29];

  char v26 = v25 ^ 1;
  if (!a7) {
    char v26 = 1;
  }
  if ((v26 & 1) == 0) {
    *a7 = v34[3];
  }

  _Block_object_dispose(&v33, 8);
  return v25;
}

uint64_t __158__HDAssociationEntity__enumerateTypedAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_transaction_error_block___block_invoke(uint64_t a1)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v2 = HKWithAutoreleasePool();

  return v2;
}

uint64_t __158__HDAssociationEntity__enumerateTypedAssociationsWithPredicate_syncEntityClass_session_syncAnchorRange_lastSyncAnchor_healthDatabase_transaction_error_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = MEMORY[0x1C1879F90](*(void *)(a1 + 56), 0);
  id v5 = MEMORY[0x1C1879F90](*(void *)(a1 + 56), 1);
  HDSQLiteColumnAsInt64();
  HDSQLiteColumnAsInt64();
  MEMORY[0x1C1879F00](*(void *)(a1 + 56), 4);
  char v6 = MEMORY[0x1C1879F30](*(void *)(a1 + 56), 5);
  uint64_t v7 = HDSQLiteColumnAsInt64();
  id v8 = HDReferenceForUnknownAssociatableObjectWithPersistentID(v7, *(void **)(a1 + 32), a2);
  id v9 = [v8 UUID];
  (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(a1 + 64);

  return 1;
}

+ (BOOL)_insertCodableObjectAssociations:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        id v19 = v10;
        id v20 = v9;
        int v15 = HKWithAutoreleasePool();

        if (!v15)
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

BOOL __80__HDAssociationEntity__insertCodableObjectAssociations_syncStore_profile_error___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__46;
  char v25 = __Block_byref_object_dispose__46;
  id v4 = [a1[4] syncIdentityManager];
  id v26 = [v4 legacySyncIdentity];

  id v5 = [a1[4] database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__HDAssociationEntity__insertCodableObjectAssociations_syncStore_profile_error___block_invoke_2;
  v18[3] = &unk_1E62F9998;
  id v20 = &v21;
  int8x16_t v17 = *((int8x16_t *)a1 + 2);
  id v6 = (id)v17.i64[0];
  int8x16_t v19 = vextq_s8(v17, v17, 8uLL);
  BOOL v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v5 error:a2 block:v18];

  if (v7)
  {
    id v8 = [a1[5] decodedAssociationUUID];
    id v9 = [a1[5] objectUuids];
    uint64_t v10 = [a1[6] syncProvenance];
    uint64_t v11 = [(id)v22[5] entity];
    uint64_t v12 = [v11 persistentID];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    LOWORD(v16) = 256;
    BOOL v14 = +[HDAssociationEntity _insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:](HDAssociationEntity, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v8, v9, v10, v12, 0, 0, v13, 0, v16, a1[4], 0, a2);
  }
  else
  {
    BOOL v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __80__HDAssociationEntity__insertCodableObjectAssociations_syncStore_profile_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) hasSyncIdentity])
  {
    id v6 = [*(id *)(a1 + 32) syncIdentity];
    id v19 = 0;
    BOOL v7 = +[HDSyncIdentity syncIdentityWithCodable:v6 error:&v19];
    id v8 = v19;

    if (v7)
    {
      id v9 = [*(id *)(a1 + 40) syncIdentityManager];
      id v18 = v8;
      uint64_t v10 = 1;
      uint64_t v11 = [v9 concreteIdentityForIdentity:v7 shouldCreate:1 transaction:v5 error:&v18];
      id v12 = v18;

      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v11;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
LABEL_16:

        goto LABEL_17;
      }
      _HKInitializeLogging();
      int v15 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v12;
        _os_log_fault_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      id v12 = v12;
      if (!v12)
      {
LABEL_15:

        uint64_t v10 = 0;
        goto LABEL_16;
      }
      if (!a3)
      {
LABEL_8:
        _HKLogDroppedError();
        goto LABEL_15;
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v16 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v8;
        _os_log_fault_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      id v12 = v8;
      if (!v12) {
        goto LABEL_15;
      }
      if (!a3) {
        goto LABEL_8;
      }
    }
    id v12 = v12;
    *a3 = v12;
    goto LABEL_15;
  }
  uint64_t v10 = 1;
LABEL_17:

  return v10;
}

@end