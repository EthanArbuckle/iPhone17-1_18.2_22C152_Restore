@interface HDDataEntity
+ (BOOL)_removeObjectWithPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5;
+ (BOOL)acceptsObject:(id)a3;
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)enumerateAssociatedObjectsForIdentifier:(int64_t)a3 inDatabase:(id)a4 error:(id *)a5 associatedObjectHandler:(id)a6;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncEntityClass:(Class)a4 predicate:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 profile:(id)a7 messageHandler:(id)a8 error:(id *)a9;
+ (BOOL)isBackedByTable;
+ (BOOL)isConcreteEntity;
+ (BOOL)journalObjects:(id)a3 insertionContext:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)replaceExistingObject:(id)a3 existingObjectID:(id)a4 replacementObject:(id)a5 replacementObjectID:(id)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9;
+ (BOOL)requiresSampleTypePredicate;
+ (BOOL)supportsObjectMerging;
+ (Class)_deletedEntityClass;
+ (Class)_entityClassForDeletion;
+ (Class)baseDataEntityClass;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_insertDataObject:(id)a3 withProvenanceID:(id)a4 inDatabase:(id)a5 error:(id *)a6;
+ (id)_objectWithPredicate:(void *)a3 encodingOptions:(void *)a4 profile:(uint64_t)a5 error:;
+ (id)_primitiveInsertDataObject:(void *)a3 insertionContext:(void *)a4 entityClass:(uint64_t)a5 provenanceEntityID:(void *)a6 profile:(void *)a7 transaction:(uint64_t)a8 error:;
+ (id)anyInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5;
+ (id)attachmentObjectIdentifierForSampleWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)columnNamesForTimeOffset;
+ (id)dataEntityForObject:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)dataEntityForObject:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)defaultForeignKey;
+ (id)deleteStatementsForRelatedEntitiesWithTransaction:(id)a3;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)entityEnumeratorWithProfile:(id)a3;
+ (id)foreignKeys;
+ (id)hk_timeZoneEncodingOptions;
+ (id)indices;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)joinClausesForProperty:(id)a3;
+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8;
+ (id)objectInsertionFilterForProfile:(id)a3;
+ (id)objectWithID:(id)a3 encodingOptions:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)objectWithUUID:(id)a3 encodingOptions:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)orderingTermForSortDescriptor:(id)a3;
+ (id)predicateForObjectsFromLocalSourceWithBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:(id)a3;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)sourceIDForObjectID:(id)a3 type:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6;
+ (id)sourceIDsForObjectsOfType:(int64_t)a3 profile:(id)a4 predicate:(id)a5 error:(id *)a6;
+ (int64_t)compareForReplacmentWithObject:(id)a3 existingObject:(id)a4;
+ (int64_t)countOfObjectsWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (int64_t)preferredEntityType;
+ (int64_t)protectionClass;
+ (int64_t)shouldInsertObject:(id)a3 sourceID:(id)a4 profile:(id)a5 transaction:(id)a6 objectToReplace:(id *)a7 objectID:(id *)a8 error:(id *)a9;
+ (void)deleteDataObjects:(id)a3 restrictedSourceEntities:(id)a4 failIfNotFound:(BOOL)a5 profile:(id)a6 recursiveDeleteAuthorizationBlock:(id)a7 completionHandler:(id)a8;
+ (void)insertDataObjects:(id)a3 insertionContext:(id)a4 profile:(id)a5 completionHandler:(id)a6;
@end

@implementation HDDataEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:(id)a3
{
  id v4 = a3;
  if ([a1 requiresSampleTypePredicate])
  {
    v5 = (void *)MEMORY[0x1E4F65D58];
    v6 = HDDataEntityPredicateForType([a1 preferredEntityType]);
    id v7 = [v5 compoundPredicateWithPredicate:v4 otherPredicate:v6];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

+ (id)_insertDataObject:(id)a3 withProvenanceID:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)[a1 superclass];
  if ([v13 isSubclassOfClass:objc_opt_class()])
  {
    id v14 = [v13 _insertDataObject:v10 withProvenanceID:v11 inDatabase:v12 error:a6];
  }
  else
  {
    id v14 = 0;
  }
  if ([a1 participatesInInsertion])
  {
    uint64_t v15 = objc_opt_class();
    if (v15 == objc_opt_class())
    {
      id v21 = v10;
      id v30 = v11;
      id v22 = v12;
      uint64_t v23 = self;
      v24 = objc_opt_class();
      if (([v24 isEqual:objc_opt_class()] & 1) == 0)
      {
        v29 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__insertBaseDataObject_withProvenance_inDatabase_error_, v23, @"HDDataEntity.m", 1339, @"Subclasses must not override %s", "+[HDDataEntity _insertBaseDataObject:withProvenance:inDatabase:error:]");
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __70__HDDataEntity__insertBaseDataObject_withProvenance_inDatabase_error___block_invoke;
      v33 = &unk_1E62F2900;
      id v25 = v21;
      id v34 = v25;
      id v26 = v30;
      id v35 = v26;
      uint64_t v27 = 0;
      if ([v22 executeSQL:@"INSERT OR IGNORE INTO objects (uuid, provenance, type, creation_date) VALUES (?, ?, ?, ?)", a6, buf, 0 error bindingHandler enumerationHandler])
      {
        if ((int)[v22 getChangesCount] < 1)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 115, @"Duplicate HKObject");
          uint64_t v27 = 0;
        }
        else
        {
          uint64_t v27 = [v22 lastInsertRowID];
        }
      }
    }
    else
    {
      if (!v14) {
        goto LABEL_26;
      }
      v16 = [a1 insertDataObject:v10 withProvenance:v11 inDatabase:v12 persistentID:v14 error:a6];
      if (!v16)
      {
        id v31 = 0;
        char v17 = objc_msgSend(a1, "_removeObjectWithPersistentID:database:error:", objc_msgSend(v14, "longLongValue"), v12, &v31);
        id v18 = v31;
        if ((v17 & 1) == 0)
        {
          _HKInitializeLogging();
          v19 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v14;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v18;
            _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_INFO, "Failed to remove object with persistent id %{public}@ after failing subclasss insertion: %{public}@", buf, 0x16u);
          }
          id v20 = v18;
          if (v20)
          {
            if (a6) {
              *a6 = v20;
            }
            else {
              _HKLogDroppedError();
            }
          }
        }
        id v14 = 0;
      }
      id v14 = v14;

      uint64_t v27 = (uint64_t)v14;
    }

    id v14 = (id)v27;
  }
LABEL_26:

  return v14;
}

+ (BOOL)isBackedByTable
{
  return 1;
}

+ (id)entityEnumeratorWithProfile:(id)a3
{
  id v5 = a3;
  if (([a1 isConcreteEntity] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = NSStringFromSelector(a2);
    id v10 = NSStringFromClass((Class)a1);
    [v8 handleFailureInMethod:a2, a1, @"HDDataEntity.m", 918, @"%@ should not be used for abstract class %@", v9, v10 object file lineNumber description];
  }
  id v6 = [[HDDataEntityEnumerator alloc] _initWithEntityClass:a1 profile:v5];

  return v6;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F65C70]])
  {
    id v5 = NSString;
    id v6 = [a1 disambiguatedDatabaseTable];
    id v7 = [v5 stringWithFormat:@"%@.%@", v6, v4];
  }
  else
  {
    v8 = (void *)[a1 entityForProperty:v4];
    if (v8)
    {
      v9 = NSString;
      id v10 = [v8 disambiguatedDatabaseTable];
      id v7 = [v9 stringWithFormat:@"%@.%@", v10, v4];
    }
    else
    {
      id v7 = v4;
    }
  }

  return v7;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  id v5 = (id)[a1 entityForProperty:v4];
  if (v5)
  {
    id v6 = v5;
    if (v5 != a1)
    {
      id v7 = (void *)MEMORY[0x1E4F65D38];
      v8 = [a1 disambiguatedDatabaseTable];
      v9 = [v7 innerJoinClauseFromTable:v8 toTargetEntity:v6 as:0 localReference:@"data_id" targetKey:@"data_id"];

      id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
      id v11 = [v6 joinClausesForProperty:v4];
      if (v11)
      {
        uint64_t v12 = [v10 setByAddingObjectsFromSet:v11];

        id v10 = (void *)v12;
      }

      goto LABEL_28;
    }
  }
  if (qword_1EBA18BD0 != -1) {
    dispatch_once(&qword_1EBA18BD0, &__block_literal_global_460);
  }
  if (([v4 isEqualToString:@"data_provenances.sync_provenance"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.origin_build"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.origin_product_type"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.local_build"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.local_product_type"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.source_version"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.tz_name"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.source_id"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.device_id"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.origin_major_version"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.origin_minor_version"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.origin_patch_version"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.derived_flags"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.contributor_id"] & 1) != 0
    || ([v4 isEqualToString:@"data_provenances.sync_identity"] & 1) != 0)
  {
    v13 = &_MergedGlobals_5;
  }
  else
  {
    if (([v4 isEqualToString:@"external_sync_ids.sid"] & 1) == 0
      && ([v4 isEqualToString:@"external_sync_ids.version"] & 1) == 0
      && ![v4 isEqualToString:@"external_sync_ids.object_code"])
    {
      goto LABEL_36;
    }
    v13 = &qword_1EBA18BC8;
  }
  id v14 = (id)*v13;
  if (v14)
  {
    v9 = v14;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    char v17 = (void *)MEMORY[0x1E4F1CAD0];
    if (v15 == v16)
    {
      id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    }
    else
    {
      id v18 = (void *)MEMORY[0x1E4F65D38];
      v19 = [a1 disambiguatedDatabaseTable];
      id v20 = [v18 innerJoinClauseFromTable:v19 toTargetEntity:objc_opt_class() as:0 localReference:@"data_id" targetKey:@"data_id"];
      id v10 = objc_msgSend(v17, "setWithObjects:", v9, v20, 0);
    }
LABEL_28:

    goto LABEL_29;
  }
LABEL_36:
  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___HDDataEntity;
  id v10 = objc_msgSendSuper2(&v22, sel_joinClausesForProperty_, v4);
LABEL_29:

  return v10;
}

+ (Class)baseDataEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)propertyForSyncProvenance
{
  return @"data_provenances.sync_provenance";
}

+ (int64_t)countOfObjectsWithPredicate:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:a3];
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___HDDataEntity;
  id v10 = objc_msgSendSuper2(&v12, sel_countOfObjectsWithPredicate_healthDatabase_error_, v9, v8, a5);

  return (int64_t)v10;
}

+ (id)anyInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [a1 predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:a4];
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___HDDataEntity;
  id v10 = objc_msgSendSuper2(&v12, sel_anyInDatabase_predicate_error_, v8, v9, a5);

  return v10;
}

+ (BOOL)supportsObjectMerging
{
  return 0;
}

+ (id)_primitiveInsertDataObject:(void *)a3 insertionContext:(void *)a4 entityClass:(uint64_t)a5 provenanceEntityID:(void *)a6 profile:(void *)a7 transaction:(uint64_t)a8 error:
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = [v17 databaseForEntityClass:self];
  v19 = [NSNumber numberWithLongLong:a5];
  id v20 = [a4 _insertDataObject:v14 withProvenanceID:v19 inDatabase:v18 error:a8];

  if (v20)
  {
    if (objc_msgSend(v14, "hd_insertRelatedDataWithPersistentID:insertionContext:profile:transaction:error:", v20, v15, v16, v17, a8))id v21 = v20; {
    else
    }
      id v21 = 0;
    id v22 = v21;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

+ (int64_t)shouldInsertObject:(id)a3 sourceID:(id)a4 profile:(id)a5 transaction:(id)a6 objectToReplace:(id *)a7 objectID:(id *)a8 error:(id *)a9
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v57 = a4;
  id v15 = a5;
  id v56 = a6;
  id v16 = [v14 metadata];
  uint64_t v17 = *MEMORY[0x1E4F2A1F0];
  id v18 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F2A1F0]];

  if (v18)
  {
    v19 = [v15 sourceManager];
    v55 = [v19 localSourceForSourceID:v57 copyIfNecessary:1 error:a9];

    if (!v55)
    {
      int64_t v40 = 2;
LABEL_41:

      goto LABEL_42;
    }
    v54 = [v56 databaseForEntityClass:objc_opt_class()];
    id v66 = 0;
    BOOL v20 = +[HDDataExternalSyncIdentifierEntity populateSyncInfoForLocalSourceID:externalSyncObjectCode:syncIdentifier:deleted:database:objectIDOut:errorOut:](HDDataExternalSyncIdentifierEntity, "populateSyncInfoForLocalSourceID:externalSyncObjectCode:syncIdentifier:deleted:database:objectIDOut:errorOut:", [v55 persistentID], objc_msgSend(v14, "_externalSyncObjectCode"), v18, 0, v54, &v66, a9);
    id v21 = v66;
    if (v20)
    {
      id v22 = v21;
      if (v21)
      {
        v51 = objc_msgSend(v14, "hd_dataEntityClass");
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x3032000000;
        v63 = __Block_byref_object_copy__73;
        v64 = __Block_byref_object_dispose__73;
        id v65 = 0;
        v53 = [v51 entityEnumeratorWithProfile:v15];
        uint64_t v23 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"data_id" value:v22 comparisonType:1];
        [v53 setPredicate:v23];

        [v53 setIgnoreEntityClassAdditionalPredicateForEnumeration:1];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __95__HDDataEntity_shouldInsertObject_sourceID_profile_transaction_objectToReplace_objectID_error___block_invoke;
        v58[3] = &unk_1E62F2FE0;
        v58[4] = &v60;
        id v59 = 0;
        [v53 enumerateWithError:&v59 handler:v58];
        id v24 = v59;
        id v25 = (void *)v61[5];
        if (!v25)
        {
          if (v24)
          {
            id v27 = v24;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Could not find existing object of class %@ to delete with external sync identifier '%@' (object ID %@)", v51, v18, v22);
            id v27 = (id)objc_claimAutoreleasedReturnValue();
            if (!v27)
            {
              v50 = 0;
              int64_t v40 = 2;
              goto LABEL_39;
            }
          }
          if (a9)
          {
            id v27 = v27;
            *a9 = v27;
          }
          else
          {
            _HKLogDroppedError();
          }
          int64_t v40 = 2;
          v50 = v27;
          goto LABEL_39;
        }
        v50 = v24;
        if (a7) {
          *a7 = v25;
        }
        if (a8) {
          *a8 = v22;
        }
        id v26 = [(id)v61[5] metadata];
        id v27 = [v26 objectForKeyedSubscript:v17];

        if ([v27 isEqualToString:v18])
        {
          v48 = (id)v61[5];
          id v49 = v14;
          uint64_t v28 = self;
          if (!v49)
          {
            v45 = [MEMORY[0x1E4F28B00] currentHandler];
            [v45 handleFailureInMethod:sel__shouldReplaceExistingObject_withObject_dataEntityClass_, v28, @"HDDataEntity.m", 205, @"Invalid parameter not satisfying: %@", @"dataObject != nil" object file lineNumber description];
          }
          v29 = v48;
          if (!v48)
          {
            v46 = [MEMORY[0x1E4F28B00] currentHandler];
            [v46 handleFailureInMethod:sel__shouldReplaceExistingObject_withObject_dataEntityClass_, v28, @"HDDataEntity.m", 206, @"Invalid parameter not satisfying: %@", @"existingObject != nil" object file lineNumber description];

            v29 = 0;
          }
          id v30 = [v29 metadata];
          uint64_t v31 = *MEMORY[0x1E4F2A1F8];
          v32 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F2A1F8]];

          if (v32)
          {
            v33 = [v49 metadata];
            id v34 = [v33 objectForKeyedSubscript:v31];

            if (!v34)
            {

LABEL_44:
              int64_t v40 = 1;
              goto LABEL_39;
            }
            uint64_t v35 = [v34 compare:v32];
            if (!v35)
            {
              uint64_t v36 = [v49 _creationDate];
              v37 = [v48 _creationDate];
              uint64_t v35 = [v36 compare:v37];

              if (!v35)
              {
                uint64_t v35 = [v51 compareForReplacmentWithObject:v49 existingObject:v48];
                if (!v35)
                {
                  v52 = [v49 UUID];
                  v47 = [v52 UUIDString];
                  v38 = [v48 UUID];
                  v39 = [v38 UUIDString];
                  uint64_t v35 = [v47 compare:v39];
                }
              }
            }

            if (v35 == -1) {
              goto LABEL_44;
            }
LABEL_38:
            int64_t v40 = 0;
LABEL_39:

            _Block_object_dispose(&v60, 8);
            goto LABEL_40;
          }

          v41 = v48;
        }
        else
        {
          _HKInitializeLogging();
          v41 = (id)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v42 = [(id)v61[5] UUID];
            v43 = [v42 UUIDString];
            *(_DWORD *)buf = 138412802;
            id v68 = v27;
            __int16 v69 = 2112;
            v70 = v18;
            __int16 v71 = 2114;
            v72 = v43;
            _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "Unexpected sync identifier %@ (expected %@) for existing object %{public}@", buf, 0x20u);
          }
        }

        goto LABEL_38;
      }
      int64_t v40 = 0;
    }
    else
    {
      id v22 = v21;
      int64_t v40 = 2;
    }
LABEL_40:

    goto LABEL_41;
  }
  int64_t v40 = 0;
LABEL_42:

  return v40;
}

uint64_t __95__HDDataEntity_shouldInsertObject_sourceID_profile_transaction_objectToReplace_objectID_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

id __113__HDDataEntity__insertDataObject_insertionContext_provenanceEntityID_profile_transaction_insertedEntityID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return +[HDDataEntity _primitiveInsertDataObject:insertionContext:entityClass:provenanceEntityID:profile:transaction:error:](*(void *)(a1 + 56), a2, *(void **)(a1 + 32), *(void **)(a1 + 64), *(void *)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 48), a3);
}

+ (BOOL)replaceExistingObject:(id)a3 existingObjectID:(id)a4 replacementObject:(id)a5 replacementObjectID:(id)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  if (+[HDAssociationEntity copyAssociationsFromChildID:a4 toObjectID:a6 profile:v13 error:a9])
  {
    id v14 = [v13 dataManager];
    v18[0] = v12;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    char v16 = [v14 deleteDataObjects:v15 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:a9];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

+ (void)insertDataObjects:(id)a3 insertionContext:(id)a4 profile:(id)a5 completionHandler:(id)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v9 = a4;
  id v47 = a5;
  id v49 = v9;
  v50 = (void (**)(id, uint64_t, BOOL))a6;
  id v10 = [v9 provenance];
  LOBYTE(a5) = [v10 isValid];

  if (a5)
  {
    id v66 = 0;
    id v11 = v48;
    id v12 = v9;
    id v46 = v47;
    uint64_t v51 = self;
    v43 = v12;
    char v13 = [v12 skipInsertionFilter];
    id v14 = 0;
    if ((v13 & 1) == 0) {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v11;
    uint64_t v15 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v68;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v68 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v66, 3, @"Invalid data object %@", v18);
            goto LABEL_31;
          }
          if ((v13 & 1) == 0)
          {
            uint64_t v19 = objc_msgSend(v18, "hd_dataEntityClass");
            if (v19) {
              BOOL v20 = (objc_class *)v19;
            }
            else {
              BOOL v20 = (objc_class *)v51;
            }
            id v21 = NSStringFromClass(v20);
            id v22 = [v14 objectForKeyedSubscript:v21];
            if (!v22)
            {
              id v22 = [(objc_class *)v20 objectInsertionFilterForProfile:v46];
              uint64_t v23 = _Block_copy(v22);
              [v14 setObject:v23 forKeyedSubscript:v21];
            }
            *(void *)buf = 0;
            char v24 = ((uint64_t (**)(void, void *, unsigned char *))v22)[2](v22, v18, buf);
            id v25 = *(id *)buf;
            if ((v24 & 1) == 0)
            {
              if (v25)
              {
                id v30 = v25;
                goto LABEL_29;
              }
              objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Internal error occurred for %@ insertionFilter.", objc_opt_class());
              id v30 = (id)objc_claimAutoreleasedReturnValue();
              if (v30)
              {
LABEL_29:
                id v66 = v30;
              }
LABEL_31:
              char v26 = 0;
              goto LABEL_32;
            }
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    char v26 = 1;
LABEL_32:

    id v31 = v66;
    v29 = v31;
    if (v26)
    {
      *(void *)v76 = 0;
      *(void *)&v76[8] = v76;
      *(void *)&v76[16] = 0x3032000000;
      v77 = __Block_byref_object_copy__73;
      v78 = __Block_byref_object_dispose__73;
      id v79 = 0;
      *(void *)&long long v67 = 0;
      *((void *)&v67 + 1) = &v67;
      *(void *)&long long v68 = 0x2020000000;
      BYTE8(v68) = 0;
      v32 = [v46 database];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __77__HDDataEntity_insertDataObjects_insertionContext_profile_completionHandler___block_invoke;
      v59[3] = &unk_1E62FD8C8;
      id v64 = a1;
      id v65 = v29;
      id v60 = v43;
      id v61 = v46;
      id v62 = obj;
      v63 = v76;
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __77__HDDataEntity_insertDataObjects_insertionContext_profile_completionHandler___block_invoke_2;
      v53[3] = &unk_1E62FD8F0;
      id v57 = &v67;
      id v58 = a1;
      id v54 = v62;
      id v55 = v60;
      id v56 = v61;
      uint64_t v33 = [a1 performWriteTransactionWithHealthDatabase:v32 error:&v65 block:v59 inaccessibilityHandler:v53];
      id v34 = v65;

      if ((v33 & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v35 = (void *)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = v35;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v37 = objc_opt_class();
            if (*(unsigned char *)(*((void *)&v67 + 1) + 24)) {
              v38 = @"journaling";
            }
            else {
              v38 = @"insertion";
            }
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v37;
            __int16 v72 = 2114;
            uint64_t v73 = v38;
            __int16 v74 = 2114;
            id v75 = v34;
            id v39 = v37;
            _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_INFO, "%{public}@: object %{public}@ failed with error: %{public}@", buf, 0x20u);
          }
        }
      }
      if (v50) {
        v50[2](v50, v33, *(void *)(*(void *)&v76[8] + 40) != 0);
      }

      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(v76, 8);

      v29 = v34;
    }
    else
    {
      if (!v31)
      {
        v29 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Internal error attempting to validate objects for insertion."");
      }
      if (v50) {
        ((void (*)(void))v50[2])();
      }
    }
    goto LABEL_48;
  }
  _HKInitializeLogging();
  id v27 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    int64_t v40 = v27;
    uint64_t v41 = [v48 count];
    v42 = [v49 provenance];
    *(_DWORD *)v76 = 134218242;
    *(void *)&v76[4] = v41;
    *(_WORD *)&v76[12] = 2114;
    *(void *)&v76[14] = v42;
    _os_log_error_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_ERROR, "Failed to insert %lu objects, invalid provenance %{public}@", v76, 0x16u);
  }
  uint64_t v28 = v50;
  if (v50)
  {
    v29 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Invalid provenance."");
    ((void (*)(void (**)(id, uint64_t, BOOL), void, void, void, void *))v50[2])(v50, 0, 0, 0, v29);
LABEL_48:

    uint64_t v28 = v50;
  }
}

uint64_t __77__HDDataEntity_insertDataObjects_insertionContext_profile_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 64)];
  id v7 = [*(id *)(a1 + 32) provenance];
  id v8 = [*(id *)(a1 + 40) dataProvenanceManager];
  id v43 = 0;
  id v34 = v5;
  id v9 = [v8 provenanceEntityForProvenance:v7 transaction:v5 error:&v43];
  id v10 = v43;

  if (!v9)
  {
    _HKInitializeLogging();
    uint64_t v16 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v46 = v7;
      __int16 v47 = 2114;
      id v48 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Failed to lookup data provenance for %@: %{public}@", buf, 0x16u);
      if (v10) {
        goto LABEL_12;
      }
    }
    else if (v10)
    {
LABEL_12:
      id v10 = v10;
      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Internal error occurred fetching provenance %@", v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_41:
      uint64_t v26 = 0;
      goto LABEL_42;
    }
LABEL_37:
    if (a3)
    {
      *a3 = v10;
LABEL_40:

      goto LABEL_41;
    }
LABEL_39:
    _HKLogDroppedError();
    goto LABEL_40;
  }
  if (([*(id *)(a1 + 32) resolveAssociations] & 1) != 0 || objc_msgSend(v7, "syncProvenance"))
  {
    id v11 = *(void **)(a1 + 64);
    id v42 = 0;
    id v12 = [v11 maxPersistentIDWithPredicate:0 database:v6 error:&v42];
    id v13 = v42;
    id v14 = v13;
    if (!v12 && v13)
    {
      _HKInitializeLogging();
      uint64_t v15 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v46 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Failed to find current max persistent ID to prepare for pending association realization: %{public}@", buf, 0xCu);
      }
      if (a3) {
        *a3 = v14;
      }
      else {
        _HKLogDroppedError();
      }

      goto LABEL_41;
    }
    uint64_t v29 = [v12 longLongValue];

    int v30 = 0;
  }
  else
  {
    uint64_t v29 = 0;
    int v30 = 1;
  }
  id v31 = a3;
  v32 = v9;
  uint64_t v33 = v6;
  [v9 persistentID];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v17 = *(id *)(a1 + 48);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v39;
LABEL_17:
    uint64_t v21 = 0;
    id v22 = v10;
    while (1)
    {
      if (*(void *)v39 != v20) {
        objc_enumerationMutation(v17);
      }
      id v35 = *(id *)(a1 + 32);
      id v36 = *(id *)(a1 + 40);
      id v37 = v34;
      int v23 = HKWithAutoreleasePool();
      id v10 = v22;

      if (!v23) {
        break;
      }
      ++v21;
      id v22 = v10;
      if (v19 == v21)
      {
        uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v19) {
          goto LABEL_17;
        }
        goto LABEL_23;
      }
    }

    if (v10)
    {
      id v10 = v10;
      id v6 = v33;
      id v27 = v31;
      id v9 = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Internal error reporting failure.");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = v33;
      id v27 = v31;
      id v9 = v32;
      if (!v10) {
        goto LABEL_41;
      }
    }
    if (v27)
    {
      *id v27 = v10;
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_23:

  uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v24)
  {
    BOOL v25 = +[HDKeyValueEntity setNumber:v24 forKey:@"HDMaxObjectPersistentID" domain:&stru_1F1728D60 category:0 profile:*(void *)(a1 + 40) error:v31];
    id v6 = v33;
    id v9 = v32;
    if (!(v30 | !v25)) {
      BOOL v25 = +[HDAssociationEntity realizePendingAssociationsWithTransaction:v34 startingAnchor:v29 error:v31];
    }
    uint64_t v26 = v25;
  }
  else
  {
    uint64_t v26 = 1;
    id v6 = v33;
    id v9 = v32;
  }
LABEL_42:

  return v26;
}

BOOL __77__HDDataEntity_insertDataObjects_insertionContext_profile_completionHandler___block_invoke_395(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 40);
  uint64_t v47 = *(void *)(a1 + 80);
  id v5 = *(void **)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v8 prepareObjectForInsertion:v7];
  uint64_t v12 = objc_msgSend(v7, "hd_dataEntityClass");
  if (v12) {
    id v13 = (void *)v12;
  }
  else {
    id v13 = (void *)v11;
  }
  uint64_t v51 = [v8 provenance];
  id v14 = [v8 provenance];
  uint64_t v15 = [v14 sourceID];
  id v56 = 0;
  id v57 = 0;
  v45 = a2;
  id v43 = a2;
  uint64_t v16 = v9;
  v53 = v10;
  uint64_t v17 = [v13 shouldInsertObject:v7 sourceID:v15 profile:v9 transaction:v10 objectToReplace:&v57 objectID:&v56 error:v43];
  id v52 = v57;
  id v50 = v56;

  if (v17 == 2)
  {
    id v18 = 0;
    BOOL v19 = 0;
    goto LABEL_8;
  }
  if (v17 == 1)
  {
    id v18 = 0;
    BOOL v19 = 1;
LABEL_8:
    uint64_t v20 = v16;
    uint64_t v21 = v52;
    id v22 = v50;
    goto LABEL_33;
  }
  id v55 = 0;
  uint64_t v20 = v16;
  int v23 = +[HDDataEntity _primitiveInsertDataObject:insertionContext:entityClass:provenanceEntityID:profile:transaction:error:](v11, v7, v8, v13, v47, v16, v10, (uint64_t)&v55);
  id v24 = v55;
  BOOL v25 = v24;
  if (!v23)
  {
    if ((objc_msgSend(v24, "hk_isHealthKitErrorWithCode:", 115) & 1) == 0)
    {
      id v33 = v25;
      id v34 = v33;
      uint64_t v21 = v52;
      id v22 = v50;
      if (v33)
      {
        if (v45) {
          void *v45 = v33;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v18 = 0;
      BOOL v19 = 0;
      goto LABEL_32;
    }
    if (([v13 supportsObjectMerging] & 1) == 0)
    {
      _HKInitializeLogging();
      id v35 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v62 = 138543618;
        *(void *)&v62[4] = v7;
        *(_WORD *)&v62[12] = 2114;
        *(void *)&v62[14] = v25;
        _os_log_debug_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEBUG, "Ignoring duplicate object error while inserting %{public}@: %{public}@", v62, 0x16u);
      }
      id v18 = 0;
      BOOL v19 = 1;
      goto LABEL_28;
    }
    uint64_t v29 = v25;
    id v54 = 0;
    *(void *)id v62 = MEMORY[0x1E4F143A8];
    *(void *)&v62[8] = 3221225472;
    *(void *)&v62[16] = __113__HDDataEntity__insertDataObject_insertionContext_provenanceEntityID_profile_transaction_insertedEntityID_error___block_invoke;
    v63 = &unk_1E62FD878;
    uint64_t v67 = v11;
    id v64 = v8;
    long long v68 = v13;
    uint64_t v69 = v47;
    id v30 = v16;
    id v65 = v30;
    id v66 = v10;
    id v18 = [v13 mergeDataObject:v7 provenance:v51 profile:v30 transaction:v66 error:&v54 insertHandler:v62];
    id v31 = v54;
    uint64_t v49 = v31;
    if (v18)
    {
      id v32 = v18;
      BOOL v19 = 1;
    }
    else
    {
      BOOL v25 = v29;
      if (v31)
      {
        if (v45)
        {
          BOOL v19 = 0;
          void *v45 = v31;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v19 = 0;
        }
        goto LABEL_19;
      }
      _HKInitializeLogging();
      BOOL v19 = 1;
      id v46 = (void *)*MEMORY[0x1E4F29F18];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
      {
LABEL_19:

LABEL_28:
        uint64_t v21 = v52;
        goto LABEL_29;
      }
      long long v41 = v46;
      id v42 = [v7 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v59 = v11;
      __int16 v60 = 2114;
      id v61 = v42;
      _os_log_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_INFO, "%{public}@ failed to find existing object with UUID (%{public}@) during object merge", buf, 0x16u);

      uint64_t v20 = v16;
    }
    BOOL v25 = v29;
    goto LABEL_19;
  }
  id v18 = v23;
  uint64_t v21 = v52;
  if (v52)
  {
    id v48 = [v16 attachmentManager];
    uint64_t v26 = [v52 attachmentObjectIdentifier];
    id v27 = [v7 attachmentObjectIdentifier];
    uint64_t v28 = +[HDObjectAttachmentSchemaProvider schemaIdentifier];
    int v44 = [v48 replaceReferencesWithObjectIdentifier:v26 replacementIdentifier:v27 schemaIdentifier:v28 error:v45];

    uint64_t v21 = v52;
    uint64_t v20 = v16;

    id v22 = v50;
    BOOL v19 = v44
       && ([v13 replaceExistingObject:v52 existingObjectID:v50 replacementObject:v7 replacementObjectID:v18 profile:v16 transaction:v53 error:v45] & 1) != 0;
    goto LABEL_32;
  }
  BOOL v19 = 1;
LABEL_29:
  id v22 = v50;
LABEL_32:

LABEL_33:
  id v36 = v18;
  id v37 = v36;
  if (v36)
  {
    uint64_t v38 = *(void *)(*(void *)(a1 + 64) + 8);
    if (!*(void *)(v38 + 40))
    {
LABEL_37:
      objc_storeStrong((id *)(v38 + 40), v18);
      goto LABEL_38;
    }
    uint64_t v39 = [v36 longLongValue];
    if (v39 > [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) longLongValue])
    {
      uint64_t v38 = *(void *)(*(void *)(a1 + 64) + 8);
      goto LABEL_37;
    }
  }
LABEL_38:

  return v19;
}

uint64_t __77__HDDataEntity_insertDataObjects_insertionContext_profile_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return [*(id *)(a1 + 64) journalObjects:*(void *)(a1 + 32) insertionContext:*(void *)(a1 + 40) profile:*(void *)(a1 + 48) error:a3];
}

+ (BOOL)journalObjects:(id)a3 insertionContext:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v43 = v10;
  uint64_t v12 = [v10 provenance];
  id v13 = v11;
  id v14 = [v11 sourceManager];
  uint64_t v15 = [v12 sourceID];
  id v49 = 0;
  uint64_t v16 = [v14 clientSourceForPersistentID:v15 error:&v49];
  id v17 = v49;

  id v18 = [v16 bundleIdentifier];
  if (v18)
  {
    uint64_t v38 = v17;
    uint64_t v39 = v16;
    id v36 = a6;
    long long v41 = v12;
    BOOL v19 = objc_alloc_init(HDCodableObjectCollection);
    id v42 = v18;
    context = (void *)MEMORY[0x1C187C0E0]([(HDCodableObjectCollection *)v19 setSourceBundleIdentifier:v18]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v40 = v9;
    id v22 = v9;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          [v43 prepareObjectForInsertion:v27];
          uint64_t v28 = objc_msgSend(v27, "hd_relatedJournalEntriesWithProfile:", v13);
          [v21 addObjectsFromArray:v28];

          [v27 _setSourceBundleIdentifier:0];
          [v27 _setSourceRevision:0];
          if (([v27 addCodableRepresentationToCollectionForJournal:v19] & 1) == 0)
          {
            [v27 _setSourceBundleIdentifier:v42];
            uint64_t v29 = -[_HDDataInsertionJournalEntry initWithDataObject:provenance:]((id *)[_HDDataInsertionJournalEntry alloc], v27, v41);
            [v20 addObject:v29];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v24);
    }

    uint64_t v12 = v41;
    if ([(HDCodableObjectCollection *)v19 count])
    {
      id v30 = -[_HDDataBatchInsertionJournalEntry initWithCodableObjectCollection:provenance:]((id *)[_HDDataBatchInsertionJournalEntry alloc], v19, v41);
      [v20 addObject:v30];
    }
    [v20 addObjectsFromArray:v21];
    id v31 = [v13 database];
    id v44 = v38;
    char v32 = [v31 addJournalEntries:v20 error:&v44];
    id v33 = v44;

    uint64_t v16 = v39;
    id v18 = v42;
    if (v32)
    {
      BOOL v34 = 1;
      id v9 = v40;
      goto LABEL_22;
    }
    id v9 = v40;
    a6 = v36;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Batch journal failed on nil identifier, %@", v12);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v33 = v33;
  if (v33)
  {
    if (a6) {
      *a6 = v33;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v34 = 0;
LABEL_22:

  return v34;
}

uint64_t __71__HDDataEntity__sourceBundleIdentifierForSourceEntities_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "sourceBundleIdentifierInDatabase:error:", v6, a3, (void)v16);
        if (!v12)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
        id v13 = (void *)v12;
        [*(id *)(a1 + 40) addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

+ (void)deleteDataObjects:(id)a3 restrictedSourceEntities:(id)a4 failIfNotFound:(BOOL)a5 profile:(id)a6 recursiveDeleteAuthorizationBlock:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  long long v18 = (void (**)(id, uint64_t, uint64_t, void, id, id))a8;
  uint64_t v54 = 0;
  id v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy__73;
  id v52 = __Block_byref_object_dispose__73;
  id v53 = 0;
  id v19 = objc_alloc_init(MEMORY[0x1E4F2AEE8]);
  id v20 = [v16 database];
  id v47 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __134__HDDataEntity_deleteDataObjects_restrictedSourceEntities_failIfNotFound_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke;
  v38[3] = &unk_1E62FD918;
  id v39 = v15;
  id v40 = v16;
  id v43 = v17;
  id v41 = v14;
  id v21 = v19;
  BOOL v46 = a5;
  id v42 = v21;
  id v44 = &v54;
  long long v45 = &v48;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __134__HDDataEntity_deleteDataObjects_restrictedSourceEntities_failIfNotFound_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_2;
  v32[3] = &unk_1E62FD940;
  id v22 = v43;
  id v36 = v22;
  id v31 = v39;
  id v33 = v31;
  id v37 = a1;
  id v23 = v40;
  id v34 = v23;
  id v24 = v41;
  id v35 = v24;
  uint64_t v25 = [a1 performWriteTransactionWithHealthDatabase:v20 error:&v47 block:v38 inaccessibilityHandler:v32];
  id v26 = v47;

  if (v18)
  {
    if (v25)
    {
      if (*((unsigned char *)v55 + 24))
      {
        id v27 = 0;
        uint64_t v28 = v49[5];
        uint64_t v29 = 1;
        id v30 = v21;
      }
      else
      {
        uint64_t v29 = 0;
        uint64_t v28 = 0;
        id v30 = 0;
        id v27 = 0;
      }
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v28 = 0;
      id v30 = 0;
      id v27 = v26;
    }
    v18[2](v18, v25, v29, v28, v30, v27);
  }

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
}

uint64_t __134__HDDataEntity_deleteDataObjects_restrictedSourceEntities_failIfNotFound_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v41 = a1;
  uint64_t v39 = [*(id *)(a1 + 32) count];
  if (v39)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v55 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "persistentID"));
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }
  id v13 = [[HDDataEntityDeletionContext alloc] initWithProfile:*(void *)(v41 + 40) transaction:v5];
  int v14 = 1;
  [(HDDataEntityDeletionContext *)v13 setInsertDeletedObjects:1];
  [(HDDataEntityDeletionContext *)v13 setRecursiveDeleteAuthorizationBlock:*(void *)(v41 + 64)];
  uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = *(id *)(v41 + 48);
  uint64_t v44 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (!v44)
  {
    id v27 = 0;
    goto LABEL_35;
  }
  id v36 = a3;
  id v37 = v5;
  uint64_t v43 = *(void *)v51;
  uint64_t v15 = v41;
LABEL_13:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v51 != v43) {
      objc_enumerationMutation(obj);
    }
    id v17 = *(void **)(*((void *)&v50 + 1) + 8 * v16);
    uint64_t v18 = objc_msgSend(v17, "hd_dataEntityClass");
    id v19 = [v17 UUID];
    id v20 = objc_msgSend(v17, "hd_sampleType");
    long long v48 = 0u;
    long long v49 = 0u;
    id v47 = 0;
    if (!v13)
    {
      id v21 = 0;
LABEL_23:
      id v27 = v21;
      id v21 = v27;
      goto LABEL_24;
    }
    [(HDDataEntityDeletionContext *)v13 deleteInfoForObjectWithUUID:v19 error:&v47];
    id v21 = v47;
    if (!(_BYTE)v48) {
      goto LABEL_23;
    }
    if (v39)
    {
      id v22 = [NSNumber numberWithLongLong:(void)v49];
      int v23 = [v6 containsObject:v22];

      if (!v23) {
        break;
      }
    }
    uint64_t v40 = v18;
    uint64_t v24 = *((void *)&v48 + 1);
    uint64_t v25 = [NSNumber numberWithLongLong:*((void *)&v49 + 1)];
    uint64_t v26 = *(void *)(v41 + 56);
    id v45 = 0;
    LOBYTE(v40) = [(HDDataEntityDeletionContext *)v13 deleteObjectWithPersistentID:v24 objectUUID:v19 entityClass:v40 objectType:v20 provenanceIdentifier:v25 deletionDate:v38 deletedSampleIntervals:v26 error:&v45];
    id v27 = v45;

    uint64_t v15 = v41;
    if ((v40 & 1) == 0) {
      goto LABEL_24;
    }
LABEL_27:

    if (v44 == ++v16)
    {
      uint64_t v28 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      uint64_t v44 = v28;
      if (!v28)
      {
        id v27 = 0;
        int v14 = 1;
        goto LABEL_33;
      }
      goto LABEL_13;
    }
  }
  id v46 = 0;
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &v46, 3, @"object not found");
  id v27 = v46;
  uint64_t v15 = v41;
LABEL_24:
  if (!*(unsigned char *)(v15 + 88) && (!v27 || [v27 code] == 3)) {
    goto LABEL_27;
  }

  int v14 = 0;
LABEL_33:
  a3 = v36;
  id v5 = v37;
LABEL_35:

  [(HDDataEntityDeletionContext *)v13 finish];
  *(unsigned char *)(*(void *)(*(void *)(v41 + 72) + 8) + 24) = [(HDDataEntityDeletionContext *)v13 deletedObjectCount] != 0;
  uint64_t v29 = [(HDDataEntityDeletionContext *)v13 lastInsertedDeletedObjectPersistentID];
  uint64_t v30 = *(void *)(*(void *)(v41 + 80) + 8);
  id v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;

  if (v14
    && ((uint64_t v32 = *(void *)(*(void *)(*(void *)(v41 + 80) + 8) + 40)) == 0
     || +[HDKeyValueEntity setNumber:v32 forKey:@"HDMaxObjectPersistentID" domain:&stru_1F1728D60 category:0 profile:*(void *)(v41 + 40) error:a3]))
  {
    uint64_t v33 = 1;
  }
  else
  {
    id v34 = v27;
    if (v34)
    {
      if (a3) {
        *a3 = v34;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v33 = 0;
  }

  return v33;
}

uint64_t __134__HDDataEntity_deleteDataObjects_restrictedSourceEntities_failIfNotFound_profile_recursiveDeleteAuthorizationBlock_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 100, @"No support for deleting objects with options when database is not available");
    return 0;
  }
  if (![*(id *)(a1 + 32) count])
  {
    id v13 = 0;
    goto LABEL_12;
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v8 = v6;
  self;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v10 = [v8 database];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71__HDDataEntity__sourceBundleIdentifierForSourceEntities_profile_error___block_invoke;
  v29[3] = &unk_1E62F2AE0;
  id v11 = v7;
  id v30 = v11;
  id v12 = v9;
  id v31 = v12;
  LODWORD(v9) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v10 error:v3 block:v29];

  if (!v9) {
    goto LABEL_8;
  }
  if ((unint64_t)[v12 count] >= 2)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v3, 100, @"Multiple bundle identifiers (%@) found for source entities (%@)", v12, v11);
LABEL_8:
    id v13 = 0;
    goto LABEL_11;
  }
  id v13 = [v12 anyObject];
LABEL_11:

  if (!v13) {
    return 0;
  }
LABEL_12:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v25 + 1) + 8 * v18);
        if (v13) {
          [*(id *)(*((void *)&v25 + 1) + 8 * v18) _setSourceBundleIdentifier:v13];
        }
        id v20 = -[_HDDataDeletionJournalEntry initWithDataObject:restrictSource:]([_HDDataDeletionJournalEntry alloc], v19, v13 != 0);
        id v21 = [*(id *)(a1 + 40) database];
        uint64_t v22 = v3;
        int v23 = [v21 addJournalEntry:v20 error:v3];

        if (!v23)
        {
          uint64_t v4 = 0;
          goto LABEL_24;
        }
        ++v18;
        uint64_t v3 = v22;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v32 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  uint64_t v4 = 1;
LABEL_24:

  return v4;
}

+ (id)dataEntityForObject:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    int v23 = __Block_byref_object_copy__73;
    uint64_t v24 = __Block_byref_object_dispose__73;
    id v25 = 0;
    id v11 = [v9 database];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__HDDataEntity_dataEntityForObject_profile_error___block_invoke;
    v16[3] = &unk_1E62F66D8;
    uint64_t v18 = &v20;
    id v19 = a1;
    id v17 = v8;
    int v12 = [a1 performReadTransactionWithHealthDatabase:v11 error:a5 block:v16];

    if (v12) {
      id v13 = (void *)v21[5];
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

uint64_t __50__HDDataEntity_dataEntityForObject_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 48) dataEntityForObject:*(void *)(a1 + 32) transaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

+ (id)dataEntityForObject:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__73;
  uint64_t v22 = __Block_byref_object_dispose__73;
  id v23 = 0;
  uint64_t v10 = [v9 databaseForEntityClass:a1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__HDDataEntity_dataEntityForObject_transaction_error___block_invoke_2;
  v16[3] = &unk_1E62F43C8;
  id v11 = v8;
  id v17 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__HDDataEntity_dataEntityForObject_transaction_error___block_invoke_3;
  v15[3] = &unk_1E62F2EA8;
  v15[4] = &v18;
  v15[5] = a1;
  if ([v10 executeCachedStatementForKey:&dataEntityForObject_transaction_error__lookupKey error:a5 SQLGenerator:&__block_literal_global_80 bindingHandler:v16 enumerationHandler:v15])int v12 = (void *)v19[5]; {
  else
  }
    int v12 = 0;
  id v13 = v12;

  _Block_object_dispose(&v18, 8);

  return v13;
}

__CFString *__54__HDDataEntity_dataEntityForObject_transaction_error___block_invoke()
{
  return @"SELECT data_id FROM objects WHERE uuid = ? AND type = ?;";
}

uint64_t __54__HDDataEntity_dataEntityForObject_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 2, 1);
}

uint64_t __54__HDDataEntity_dataEntityForObject_transaction_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(*(Class *)(a1 + 40)) initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

+ (id)sourceIDsForObjectsOfType:(int64_t)a3 profile:(id)a4 predicate:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if ([a1 requiresSampleTypePredicate])
  {
    int v12 = (void *)MEMORY[0x1E4F65D08];
    id v13 = HDDataEntityPredicateForType(a3);
    uint64_t v14 = [v12 compoundPredicateWithPredicate:v11 otherPredicate:v13];

    id v11 = (id)v14;
  }
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__73;
  uint64_t v29 = __Block_byref_object_dispose__73;
  id v30 = 0;
  uint64_t v15 = [v10 database];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__HDDataEntity_sourceIDsForObjectsOfType_profile_predicate_error___block_invoke;
  v21[3] = &unk_1E62F66D8;
  id v23 = &v25;
  id v24 = a1;
  id v16 = v11;
  id v22 = v16;
  int v17 = [a1 performReadTransactionWithHealthDatabase:v15 error:a6 block:v21];

  if (v17) {
    uint64_t v18 = (void *)v26[5];
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = v18;

  _Block_object_dispose(&v25, 8);

  return v19;
}

uint64_t __66__HDDataEntity_sourceIDsForObjectsOfType_profile_predicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v6 = [*(id *)(a1 + 48) distinctProperty:@"data_provenances.source_id" predicate:*(void *)(a1 + 32) database:v5 error:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return 1;
}

+ (id)sourceIDForObjectID:(id)a3 type:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6
{
  id v10 = a3;
  id v11 = (void *)MEMORY[0x1E4F65D00];
  id v12 = a5;
  id v13 = [v11 predicateWithProperty:@"data_id" equalToValue:v10];
  id v18 = 0;
  uint64_t v14 = [a1 sourceIDsForObjectsOfType:a4 profile:v12 predicate:v13 error:&v18];

  id v15 = v18;
  id v16 = [v14 firstObject];
  if (!v16)
  {
    if (v15)
    {
      id v15 = v15;
LABEL_5:
      if (a6) {
        *a6 = v15;
      }
      else {
        _HKLogDroppedError();
      }

      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Could not find expected sourceID for object with ID %@", v10);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15) {
      goto LABEL_5;
    }
  }
LABEL_9:

  return v16;
}

+ (id)predicateForObjectsFromLocalSourceWithBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [a4 sourceManager];
  id v13 = 0;
  id v9 = [v8 localSourceForBundleIdentifier:v7 error:&v13];
  id v10 = v13;

  if (v9)
  {
    id v11 = HDDataEntityPredicateForSourceEntity(v9);
    goto LABEL_9;
  }
  if (v10)
  {
    if (a5)
    {
      id v11 = 0;
      *a5 = v10;
      goto LABEL_9;
    }
    _HKLogDroppedError();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 100, @"No source found with bundle identifier \"%@\"", v7);
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

+ (id)objectWithUUID:(id)a3 encodingOptions:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = HDDataEntityPredicateForDataUUID();
  id v12 = +[HDDataEntity _objectWithPredicate:encodingOptions:profile:error:]((uint64_t)a1, v11, v10, v9, (uint64_t)a6);

  return v12;
}

+ (id)_objectWithPredicate:(void *)a3 encodingOptions:(void *)a4 profile:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__73;
  id v19 = __Block_byref_object_dispose__73;
  id v20 = 0;
  id v11 = [self entityEnumeratorWithProfile:v10];
  [v11 setPredicate:v8];
  [v11 addEncodingOptionsFromDictionary:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__HDDataEntity__objectWithPredicate_encodingOptions_profile_error___block_invoke;
  v14[3] = &unk_1E62F2FE0;
  v14[4] = &v15;
  [v11 enumerateWithError:a5 handler:v14];
  id v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v12;
}

+ (id)objectWithID:(id)a3 encodingOptions:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = (void *)MEMORY[0x1E4F65D00];
  id v11 = a5;
  id v12 = a4;
  id v13 = [v10 predicateWithProperty:@"data_id" value:a3 comparisonType:1];
  uint64_t v14 = +[HDDataEntity _objectWithPredicate:encodingOptions:profile:error:]((uint64_t)a1, v13, v12, v11, (uint64_t)a6);

  return v14;
}

uint64_t __67__HDDataEntity__objectWithPredicate_encodingOptions_profile_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncEntityClass:(Class)a4 predicate:(id)a5 syncAnchorRange:(HDSyncAnchorRange)a6 profile:(id)a7 messageHandler:(id)a8 error:(id *)a9
{
  int64_t end = a6.end;
  int64_t start = a6.start;
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = [v17 database];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __117__HDDataEntity_generateSyncObjectsForSession_syncEntityClass_predicate_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v25[3] = &unk_1E62FD990;
  id v26 = v17;
  id v27 = v15;
  Class v30 = a4;
  id v31 = a1;
  id v28 = v18;
  id v29 = v16;
  int64_t v32 = start;
  int64_t v33 = end;
  id v20 = v16;
  id v21 = v18;
  id v22 = v15;
  id v23 = v17;
  LOBYTE(a1) = [a1 performReadTransactionWithHealthDatabase:v19 error:a9 block:v25];

  return (char)a1;
}

uint64_t __117__HDDataEntity_generateSyncObjectsForSession_syncEntityClass_predicate_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [[HDDataProvenanceCache alloc] initWithProfile:*(void *)(a1 + 32) transaction:v5 purpose:0];
  uint64_t v7 = [*(id *)(a1 + 40) maxEncodedBytesPerChangeSetForSyncEntityClass:*(void *)(a1 + 64)];
  uint64_t v8 = [*(id *)(a1 + 40) maxEncodedBytesPerCodableChangeForSyncEntityClass:*(void *)(a1 + 64)];
  id v9 = 0;
  if ([*(id *)(a1 + 40) shouldOverrideCycleTrackingSymptomsForBackwardsCompatibilty])
  {
    id v24 = @"OverrideMCCategorySampleValue";
    v25[0] = MEMORY[0x1E4F1CC38];
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v10 = [*(id *)(a1 + 64) syncVersionRangeForSession:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v10 = 0;
  }
  id v20 = v6;
  id v11 = [[_HDDataEntitySyncMessageBuilder alloc] initWithProfile:*(void *)(a1 + 32) transaction:v5 entityClass:*(void *)(a1 + 72) version:v10 provenanceCache:v6 encodingOptions:v9 messageHandler:*(void *)(a1 + 48) bytesPerChangeSet:v7 bytesPerChange:v8];
  uint64_t v23 = -1;
  id v12 = *(void **)(a1 + 72);
  id v13 = [(_HDDataEntitySyncMessageBuilder *)v11 orderedProperties];
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = [*(id *)(a1 + 32) database];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __117__HDDataEntity_generateSyncObjectsForSession_syncEntityClass_predicate_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v21[3] = &unk_1E62FD968;
  id v17 = v11;
  id v22 = v17;
  uint64_t v18 = objc_msgSend(v12, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v13, v14, v15, *(void *)(a1 + 80), *(void *)(a1 + 88), 0, &v23, v16, a3, v21);

  if (v18 && v23 != -1) {
    uint64_t v18 = [(_HDDataEntitySyncMessageBuilder *)v17 finishAndFlushWithError:a3];
  }

  return v18;
}

uint64_t __117__HDDataEntity_generateSyncObjectsForSession_syncEntityClass_predicate_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = *(void **)(a1 + 32);
  id v17 = 0;
  uint64_t v13 = [v12 addEntity:v11 row:a4 anchor:a5 error:&v17];
  id v14 = v17;
  if (v13 == 2)
  {
    _HKInitializeLogging();
    uint64_t v15 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v11;
      __int16 v20 = 2114;
      id v21 = v14;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Failed to include entity %{public}@ when constructing messages for sync: %{public}@.", buf, 0x16u);
    }
  }
  else if (v13 == 1)
  {
    *a7 = 1;
  }

  return 1;
}

void __39__HDDataEntity_joinClausesForProperty___block_invoke()
{
  id v4 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v0 = [MEMORY[0x1E4F65D38] innerJoinClauseFromTable:v4 toTargetEntity:objc_opt_class() as:0 localReference:@"provenance" targetKey:*MEMORY[0x1E4F65C70]];
  v1 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v0;

  uint64_t v2 = [MEMORY[0x1E4F65D38] leftJoinClauseFromTable:v4 toTargetEntity:objc_opt_class() as:0 localReference:@"data_id" targetKey:@"object_id"];
  uint64_t v3 = (void *)qword_1EBA18BC8;
  qword_1EBA18BC8 = v2;
}

+ (id)propertyForSyncIdentity
{
  return @"data_provenances.sync_identity";
}

+ (id)databaseTable
{
  return @"objects";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_38;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"provenance";
  uint64_t v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)defaultForeignKey
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F65D20]) initWithEntityClass:a1 property:@"data_id" deletionAction:2];

  return v2;
}

+ (id)indices
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  uint64_t v3 = [a1 disambiguatedSQLForProperty:@"type"];
  id v4 = [v2 stringWithFormat:@"%@ = %ld", v3, 2];

  id v5 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v6 = objc_opt_class();
  id v11 = @"type";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  uint64_t v8 = (void *)[v5 initWithEntity:v6 name:@"deleted" columns:v7 unique:0 predicateString:v4];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v9;
}

+ (Class)_deletedEntityClass
{
  return 0;
}

+ (Class)_entityClassForDeletion
{
  return 0;
}

+ (BOOL)requiresSampleTypePredicate
{
  return 0;
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 key];
  uint64_t v6 = [v4 ascending];
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A280]])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    id v9 = @"data_id";
LABEL_5:
    uint64_t v10 = [v7 orderingTermWithProperty:v9 entityClass:v8 ascending:v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2BA50]])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    id v9 = @"creation_date";
    goto LABEL_5;
  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___HDDataEntity;
  uint64_t v10 = objc_msgSendSuper2(&v13, sel_orderingTermForSortDescriptor_, v4);
LABEL_7:
  id v11 = (void *)v10;

  return v11;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  return 0;
}

uint64_t __70__HDDataEntity__insertBaseDataObject_withProvenance_inDatabase_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 32) entityType]);
  [*(id *)(a1 + 32) _creationTimestamp];

  return sqlite3_bind_double(a2, 4, v5);
}

+ (BOOL)_removeObjectWithPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)[a1 superclass];
  if ([v9 isSubclassOfClass:objc_opt_class()]
    && ![v9 _removeObjectWithPersistentID:a3 database:v8 error:a5])
  {
    char v11 = 0;
  }
  else
  {
    uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithPersistentID:a3];
    char v11 = [v10 deleteFromDatabase:v8 error:a5];
  }
  return v11;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  return 0;
}

+ (int64_t)compareForReplacmentWithObject:(id)a3 existingObject:(id)a4
{
  return 0;
}

+ (int64_t)preferredEntityType
{
  return 0;
}

+ (BOOL)isConcreteEntity
{
  return 0;
}

+ (id)objectInsertionFilterForProfile:(id)a3
{
  return &__block_literal_global_512;
}

uint64_t __48__HDDataEntity_objectInsertionFilterForProfile___block_invoke()
{
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [[_HDDataEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (BOOL)acceptsObject:(id)a3
{
  return 1;
}

+ (id)deleteStatementsForRelatedEntitiesWithTransaction:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[HDMetadataValueEntity deleteStatementForObjectMetadataWithTransaction:v3];
  v8[0] = v4;
  double v5 = +[HDAssociationEntity deleteStatementForChildIDsWithTransaction:v3];

  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

+ (BOOL)enumerateAssociatedObjectsForIdentifier:(int64_t)a3 inDatabase:(id)a4 error:(id *)a5 associatedObjectHandler:(id)a6
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return 0;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  return 0;
}

+ (id)columnNamesForTimeOffset
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v4[0] = @"creation_date";
    uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

+ (id)attachmentObjectIdentifierForSampleWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return (id)[a3 UUIDString];
}

+ (id)hk_timeZoneEncodingOptions
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"IncludeAutomaticTimeZone";
  v5[0] = MEMORY[0x1E4F1CC38];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

@end