@interface HDAuthorizationEntity
+ (BOOL)resetAllAuthorizationStatusesWithProfile:(id)a3 error:(id *)a4;
+ (BOOL)resetAuthorizationStatusesForBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)setAuthorizationStatuses:(id)a3 authorizationRequests:(id)a4 authorizationModes:(id)a5 sourceEntity:(id)a6 options:(unint64_t)a7 profile:(id)a8 error:(id *)a9;
+ (BOOL)setAuthorizationStatuses:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_maxObjectPersistentIDForProfile:(void *)a3 error:;
+ (id)_predicateForBundleIdentifier:(void *)a3 profile:(uint64_t)a4 error:;
+ (id)_predicateForSourceEntities:(uint64_t)a1;
+ (id)_predicateForSourceEntities:(void *)a3 types:;
+ (id)_predicateForTypes:(uint64_t)a1;
+ (id)allSourcesRequestingTypes:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)authorizationRecordsBySourceForType:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)authorizationRecordsByTypeForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)authorizationRequestsForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)authorizationStatusesForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)modificationDateForSourceEntity:(id)a3 type:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)readAuthorizationStatusesByTypeForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
+ (uint64_t)_insertAuthorizationWithSourceIdentifier:(uint64_t)a3 dataTypeCode:(uint64_t)a4 authorizationStatus:(uint64_t)a5 authorizationRequest:(uint64_t)a6 authorizationMode:(void *)a7 modificationDate:(void *)a8 currentDate:(uint64_t)a9 syncProvenance:(uint64_t)a10 syncIdentity:(uint64_t)a11 objectAnchor:(void *)a12 modificationEpoch:(char)a13 options:(void *)a14 profile:(void *)a15 database:(uint64_t)a16 error:;
+ (uint64_t)_insertCodableAuthorizations:(void *)a3 sourceEntity:(uint64_t)a4 syncProvenance:(uint64_t)a5 objectAnchor:(void *)a6 currentDate:(char)a7 options:(void *)a8 profile:(void *)a9 database:(void *)a10 transaction:(uint64_t)a11 error:;
+ (uint64_t)_insertCodableSourceAuthorizations:(char)a3 overwriteExisting:(void *)a4 syncStore:(void *)a5 profile:(uint64_t)a6 error:;
+ (uint64_t)_resetAuthorizationStatusesWithPredicate:(void *)a3 profile:(uint64_t)a4 error:;
@end

@implementation HDAuthorizationEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)authorizationStatusesForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = [a1 authorizationRecordsByTypeForBundleIdentifier:a3 types:a4 profile:a5 error:a6];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v14 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v17);
          v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "status"));
          [v7 setObject:v15 forKeyedSubscript:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)authorizationRequestsForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = [a1 authorizationRecordsByTypeForBundleIdentifier:a3 types:a4 profile:a5 error:a6];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v14 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v17);
          v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "request"));
          [v7 setObject:v15 forKeyedSubscript:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)authorizationRecordsByTypeForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6
{
  v6 = [a1 readAuthorizationStatusesByTypeForBundleIdentifier:a3 types:a4 profile:a5 error:a6];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__HDAuthorizationEntity_authorizationRecordsByTypeForBundleIdentifier_types_profile_error___block_invoke;
    v11[3] = &unk_1E630F100;
    id v12 = v7;
    id v8 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
    uint64_t v9 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __91__HDAuthorizationEntity_authorizationRecordsByTypeForBundleIdentifier_types_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 authorizationRecord];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

+ (id)readAuthorizationStatusesByTypeForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, a1, @"HDAuthorizationEntity.m", 139, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];
  }
  v14 = [v13 sourceManager];
  v15 = [v14 allSourcesForBundleIdentifier:v11 error:a6];

  if (v15)
  {
    if ([v15 count])
    {
      id v56 = v13;
      v57 = v11;
      id v55 = v12;
      v16 = [MEMORY[0x1E4F2B2C0] _typesIncludingParentTypes:v12];
      long long v17 = [v15 allObjects];
      long long v18 = objc_msgSend(v17, "hk_map:", &__block_literal_global_248);
      uint64_t v19 = [v18 componentsJoinedByString:@", "];

      v54 = (void *)v19;
      long long v20 = [NSString stringWithFormat:@"%@ in (%@)", @"source_id", v19];
      if ([v16 count])
      {
        v21 = [v16 allObjects];
        uint64_t v22 = objc_msgSend(v21, "hk_map:", &__block_literal_global_339);
        v23 = [v22 componentsJoinedByString:@", "];

        uint64_t v24 = [v20 stringByAppendingFormat:@" AND %@ in (%@)", @"object_type", v23];

        long long v20 = (void *)v24;
      }
      v25 = NSString;
      v26 = [a1 disambiguatedDatabaseTable];
      v53 = v20;
      v27 = [v25 stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ ORDER BY %@ ASC, %@ DESC, %@ DESC, %@ DESC", @"object_type", @"status", @"request", @"mode", @"deleted_object_anchor", @"object_limit_anchor", @"object_limit_modified", v26, v20, @"object_type", @"modification_epoch", @"date_modified", @"status"];

      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v29 = [v13 database];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_3;
      v62[3] = &unk_1E6305DC0;
      id v68 = a1;
      id v52 = v27;
      id v63 = v52;
      id v64 = v15;
      id v51 = v16;
      id v65 = v51;
      id v30 = v28;
      id v66 = v30;
      id v67 = v57;
      int v50 = [a1 performReadTransactionWithHealthDatabase:v29 error:a6 block:v62];

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v31 = [v30 allKeys];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v58 objects:v69 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v59 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            v37 = [v36 parentType];

            if (v37)
            {
              v38 = [v30 objectForKeyedSubscript:v36];
              v39 = [v36 parentType];
              v40 = [v30 objectForKeyedSubscript:v39];

              if (v40
                && ([v40 authorizationRequest] == 203
                 || (uint64_t v41 = [v38 authorizationRequest], v41 == objc_msgSend(v40, "authorizationRequest"))))
              {
                v42 = [v40 authorizationRecord];
                char v43 = [v42 readingEnabled];

                if ((v43 & 1) == 0) {
                  [v38 disableReading];
                }
                v44 = [v40 authorizationRecord];
                char v45 = [v44 sharingEnabled];

                if ((v45 & 1) == 0) {
                  [v38 disableSharing];
                }
              }
              else
              {
                [v30 removeObjectForKey:v36];
              }
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v58 objects:v69 count:16];
        }
        while (v33);
      }

      if (v50) {
        v46 = v30;
      }
      else {
        v46 = 0;
      }
      id v47 = v46;

      id v13 = v56;
      id v11 = v57;
      id v12 = v55;
    }
    else
    {
      id v47 = (id)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    id v47 = 0;
  }

  return v47;
}

__CFString *__96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke()
{
  return @"?";
}

__CFString *__96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_2()
{
  return @"?";
}

uint64_t __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:*(void *)(a1 + 72)];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_4;
  v13[3] = &unk_1E62F2900;
  uint64_t v6 = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_5;
  v9[3] = &unk_1E62FA460;
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 40);
  uint64_t v7 = [v5 executeSQL:v6 error:a3 bindingHandler:v13 enumerationHandler:v9];

  return v7;
}

void __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    int v8 = 1;
    do
    {
      uint64_t v9 = 0;
      int v10 = v8;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        sqlite3_bind_int64(a2, v10 + v9, [*(id *)(*((void *)&v21 + 1) + 8 * v9) persistentID]);
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      int v8 = v10 + v9;
    }
    while (v6);
    int v11 = v10 + v9;
  }
  else
  {
    int v11 = 1;
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        sqlite3_bind_int64(a2, v11 + i, objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "code", (void)v17));
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      v11 += i;
    }
    while (v14);
  }
}

BOOL __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = HDSQLiteColumnAsInt64();
  uint64_t v7 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:v6];
  if (v7)
  {
    int v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

    if (!v8)
    {
      uint64_t v9 = HDSQLiteColumnAsInt64();
      uint64_t v10 = HDSQLiteColumnAsInt64();
      int v11 = [HDReadAuthorizationStatus alloc];
      uint64_t v12 = HDSQLiteColumnAsInt64();
      if (v9 == 102)
      {
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 48);
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
      }
      uint64_t v15 = MEMORY[0x1C1879F70](a2, 4);
      if (v10 == 1)
      {
        v16 = MEMORY[0x1C1879F70](a2, 5);
        uint64_t v17 = MEMORY[0x1C1879F30](a2, 6);
        long long v18 = v11;
        long long v19 = (void *)v17;
        long long v20 = [(HDReadAuthorizationStatus *)v18 initWithReadAuthorizationStatus:v9 authorizationRequest:v12 authorizationMode:1 restrictedBundleIdentifier:v13 restrictedSourceEntities:v14 deletedObjectBaselineAnchor:v15 objectLimitAnchor:v16 objectLimitModifiedDate:v17];
      }
      else
      {
        long long v20 = [(HDReadAuthorizationStatus *)v11 initWithReadAuthorizationStatus:v9 authorizationRequest:v12 authorizationMode:v10 restrictedBundleIdentifier:v13 restrictedSourceEntities:v14 deletedObjectBaselineAnchor:v15 objectLimitAnchor:0 objectLimitModifiedDate:0];
      }

      [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:v7];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Unable to instantiate object type for code: %ld", v6);
  }

  return v7 != 0;
}

+ (id)modificationDateForSourceEntity:(id)a3 type:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v12)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"HDAuthorizationEntity.m", 262, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"HDAuthorizationEntity.m", 263, @"Invalid parameter not satisfying: %@", @"sourceEntity != nil" object file lineNumber description];

LABEL_3:
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__211;
  id v30 = __Block_byref_object_dispose__211;
  id v31 = 0;
  uint64_t v14 = [v13 database];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__HDAuthorizationEntity_modificationDateForSourceEntity_type_profile_error___block_invoke;
  v21[3] = &unk_1E6306A58;
  id v25 = a1;
  id v15 = v11;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  long long v24 = &v26;
  [a1 performReadTransactionWithHealthDatabase:v14 error:a6 block:v21];

  id v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

uint64_t __76__HDAuthorizationEntity_modificationDateForSourceEntity_type_profile_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 databaseForEntityClass:a1[7]];
  uint64_t v6 = a1[7];
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:a1[4]];
  int v8 = [MEMORY[0x1E4F1CAD0] setWithObject:a1[5]];
  uint64_t v9 = +[HDAuthorizationEntity _predicateForSourceEntities:types:](v6, v7, v8);

  uint64_t v10 = [(id)a1[7] anyInDatabase:v5 predicate:v9 error:a3];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 dateForProperty:@"date_modified" database:v5];
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  return 1;
}

+ (id)_predicateForSourceEntities:(void *)a3 types:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  uint64_t v7 = +[HDAuthorizationEntity _predicateForSourceEntities:](v6, v5);

  int v8 = +[HDAuthorizationEntity _predicateForTypes:](v6, v4);

  uint64_t v9 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v8 otherPredicate:v7];

  return v9;
}

+ (BOOL)setAuthorizationStatuses:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  return [a1 setAuthorizationStatuses:a3 authorizationRequests:MEMORY[0x1E4F1CC08] authorizationModes:MEMORY[0x1E4F1CC08] sourceEntity:a4 options:0 profile:a5 error:a6];
}

+ (id)_maxObjectPersistentIDForProfile:(void *)a3 error:
{
  id v4 = a2;
  self;
  id v10 = 0;
  id v5 = +[HDKeyValueEntity numberForKey:@"HDMaxObjectPersistentID" domain:&stru_1F1728D60 category:0 profile:v4 entity:0 error:&v10];

  id v6 = v10;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = v5;
  }
  else if (v6)
  {
    if (a3)
    {
      id v8 = 0;
      *a3 = v6;
    }
    else
    {
      _HKLogDroppedError();
      id v8 = 0;
    }
  }
  else
  {
    id v8 = &unk_1F17EF2B8;
  }

  return v8;
}

+ (BOOL)setAuthorizationStatuses:(id)a3 authorizationRequests:(id)a4 authorizationModes:(id)a5 sourceEntity:(id)a6 options:(unint64_t)a7 profile:(id)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  if (!v16)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"HDAuthorizationEntity.m", 322, @"Invalid parameter not satisfying: %@", @"authorizationStatuses != nil" object file lineNumber description];
  }
  if (!v19)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"HDAuthorizationEntity.m", 323, @"Invalid parameter not satisfying: %@", @"sourceEntity != nil" object file lineNumber description];

    if (v20) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"HDAuthorizationEntity.m", 324, @"Invalid parameter not satisfying: %@", @"profile !=nil" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v20) {
    goto LABEL_7;
  }
LABEL_5:
  long long v21 = [MEMORY[0x1E4F1C9C8] date];
  id v22 = [v20 database];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __126__HDAuthorizationEntity_setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_options_profile_error___block_invoke;
  v34[3] = &unk_1E62F40C0;
  id v35 = v19;
  id v36 = v20;
  id v37 = v16;
  id v38 = v17;
  id v39 = v18;
  id v40 = v21;
  id v41 = a1;
  unint64_t v42 = a7;
  id v23 = v21;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  id v27 = v20;
  id v28 = v19;
  char v29 = [a1 performWriteTransactionWithHealthDatabase:v22 error:a9 block:v34];

  return v29;
}

uint64_t __126__HDAuthorizationEntity_setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_options_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v107[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:*(void *)(a1 + 80)];
  if (![*(id *)(a1 + 32) existsInDatabase:v6])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Source %lld does not exist", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
    goto LABEL_23;
  }
  uint64_t v7 = +[HDAuthorizationEntity _maxObjectPersistentIDForProfile:error:](*(void *)(a1 + 80), *(void **)(a1 + 40), a3);
  if (!v7)
  {
LABEL_23:
    uint64_t v49 = 0;
    goto LABEL_33;
  }
  v80 = a3;
  id v8 = *(void **)(a1 + 72);
  uint64_t v9 = *(void **)(a1 + 48);
  id v10 = *(void **)(a1 + 56);
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void **)(a1 + 64);
  v73 = v7;
  uint64_t v71 = [v7 longLongValue];
  uint64_t v72 = *(void *)(a1 + 88);
  uint64_t v13 = *(void **)(a1 + 40);
  id v14 = v9;
  id v85 = v10;
  id v15 = v12;
  id v16 = v11;
  id v84 = v8;
  id v83 = v13;
  id v17 = v6;
  id v18 = v5;
  id v81 = v16;
  v82 = self;
  if (!v16)
  {
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:sel__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error_, v82, @"HDAuthorizationEntity.m", 844, @"Invalid parameter not satisfying: %@", @"sourceEntity != nil" object file lineNumber description];
  }
  v78 = v18;
  v79 = v17;
  id v19 = v14;
  if (!v14)
  {
    long long v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:sel__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error_, v82, @"HDAuthorizationEntity.m", 845, @"Invalid parameter not satisfying: %@", @"authorizationStatuses != nil" object file lineNumber description];
  }
  uint64_t v20 = (uint64_t)v80;
  if (!v85)
  {
    long long v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:sel__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error_, v82, @"HDAuthorizationEntity.m", 846, @"Invalid parameter not satisfying: %@", @"authorizationRequests != nil" object file lineNumber description];
  }
  v74 = v6;
  if (!v15)
  {
    long long v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:sel__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error_, v82, @"HDAuthorizationEntity.m", 847, @"Invalid parameter not satisfying: %@", @"authorizationModes != nil" object file lineNumber description];
  }
  v77 = [MEMORY[0x1E4F1CA80] set];
  long long v21 = [MEMORY[0x1E4F1CA48] array];
  id v22 = [MEMORY[0x1E4F1CA80] set];
  id v23 = [v19 allKeys];
  [v22 addObjectsFromArray:v23];

  id v24 = [v85 allKeys];
  [v22 addObjectsFromArray:v24];

  id v25 = [v15 allKeys];
  [v22 addObjectsFromArray:v25];

  v76 = v22;
  id v26 = v81;
  id v27 = v83;
  id v75 = v5;
  if (![v22 count]) {
    goto LABEL_29;
  }
  uint64_t v70 = a1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __189__HDAuthorizationEntity__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error___block_invoke;
  aBlock[3] = &unk_1E630F1A0;
  id v98 = &unk_1F17EF2D0;
  id v99 = v19;
  id v28 = v83;
  id v100 = v28;
  id v101 = v85;
  id v102 = v15;
  id v103 = v84;
  id v104 = v21;
  v105 = v82;
  char v29 = _Block_copy(aBlock);
  id v30 = [v28 sourceManager];
  id v31 = [v30 clientSourceForSourceEntity:v81 error:v80];

  v69 = v31;
  if (v31)
  {
    id v68 = v29;
    uint64_t v32 = [v28 sourceManager];
    uint64_t v33 = [v31 bundleIdentifier];
    uint64_t v34 = [v32 allSourcesForBundleIdentifier:v33 error:v80];

    id v35 = v34;
    if (v34)
    {
      id v66 = v15;
      id v67 = v19;
      id v65 = v34;
      id v64 = +[HDAuthorizationEntity _predicateForSourceEntities:types:]((uint64_t)v82, v34, v76);
      id v36 = objc_msgSend(v82, "queryWithDatabase:predicate:", v79);
      v107[0] = @"object_type";
      v107[1] = @"request";
      v107[2] = @"mode";
      v107[3] = @"sync_identity";
      uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:4];
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __189__HDAuthorizationEntity__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error___block_invoke_420;
      v91[3] = &unk_1E630F1C8;
      id v38 = v28;
      id v92 = v38;
      id v93 = v78;
      id v94 = v77;
      id v39 = v68;
      id v96 = v39;
      id v40 = v76;
      id v95 = v40;
      v62 = (void *)v37;
      id v63 = v36;
      [v36 enumeratePersistentIDsAndProperties:v37 error:v80 enumerationHandler:v91];
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id obj = v40;
      uint64_t v41 = [obj countByEnumeratingWithState:&v87 objects:v106 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v88 != v43) {
              objc_enumerationMutation(obj);
            }
            uint64_t v45 = *(void *)(*((void *)&v87 + 1) + 8 * i);
            v46 = [v38 syncIdentityManager];
            id v47 = [v46 currentSyncIdentity];
            (*((void (**)(id, uint64_t, void, void *, void *))v39 + 2))(v39, v45, 0, &unk_1F17EF2E8, v47);
          }
          uint64_t v42 = [obj countByEnumeratingWithState:&v87 objects:v106 count:16];
        }
        while (v42);
      }

      int v48 = 0;
      uint64_t v20 = (uint64_t)v80;
      id v15 = v66;
      id v19 = v67;
      id v35 = v65;
    }
    else
    {
      int v48 = 1;
    }
    char v29 = v68;

    a1 = v70;
    id v26 = v81;
  }
  else
  {
    int v48 = 1;
    a1 = v70;
  }
  id v27 = v83;

  if (v48)
  {
    int v50 = v19;
    id v51 = v15;
    uint64_t v49 = 0;
    id v52 = v84;
    v54 = v78;
    v53 = v79;
  }
  else
  {
LABEL_29:
    int v50 = v19;
    id v51 = v15;
    v54 = v78;
    v53 = v79;
    uint64_t v61 = v20;
    id v52 = v84;
    uint64_t v49 = +[HDAuthorizationEntity _insertCodableAuthorizations:sourceEntity:syncProvenance:objectAnchor:currentDate:options:profile:database:transaction:error:]((uint64_t)v82, v21, v26, 0, v71, v84, v72, v27, v79, v78, v61);
  }

  if (v49)
  {
    id v55 = objc_msgSend(NSString, "stringWithFormat:", @"Authorization status changed for source %lld", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
    HDSetHealthInUseDefaultWithReason(v55);
  }
  id v6 = v74;
  id v5 = v75;
LABEL_33:

  return v49;
}

+ (id)authorizationRecordsBySourceForType:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"HDAuthorizationEntity.m", 374, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];
  }
  id v10 = [v9 sourceManager];
  id v11 = [v10 allSourcesWithError:a5];

  if (v11)
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v25 = v11;
    id obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v17 = [v16 bundleIdentifier];
          id v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
          id v19 = [a1 authorizationRecordsByTypeForBundleIdentifier:v17 types:v18 profile:v9 error:a5];

          if (!v19)
          {

            id v22 = 0;
            long long v21 = v27;
            goto LABEL_16;
          }
          uint64_t v20 = [v19 objectForKeyedSubscript:v8];
          if (v20) {
            [v27 setObject:v20 forKeyedSubscript:v16];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    long long v21 = v27;
    id v22 = v27;
LABEL_16:

    id v11 = v25;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

+ (id)allSourcesRequestingTypes:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__211;
  id v26 = __Block_byref_object_dispose__211;
  id v27 = 0;
  id v10 = [v8 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__HDAuthorizationEntity__allSourcesRequestingTypes_additionalPredicate_profile_error___block_invoke;
  v16[3] = &unk_1E62FD8C8;
  long long v21 = v9;
  id v11 = v7;
  id v17 = v11;
  id v18 = 0;
  id v12 = v8;
  id v19 = v12;
  uint64_t v20 = &v22;
  LODWORD(a5) = [v9 performReadTransactionWithHealthDatabase:v10 error:a5 block:v16];

  if (a5) {
    uint64_t v13 = (void *)v23[5];
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  _Block_object_dispose(&v22, 8);

  return v14;
}

BOOL __86__HDAuthorizationEntity__allSourcesRequestingTypes_additionalPredicate_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = +[HDAuthorizationEntity _predicateForTypes:](*(void *)(a1 + 64), *(void **)(a1 + 32));
  id v6 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v5 otherPredicate:*(void *)(a1 + 40)];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v8 = *(void **)(a1 + 64);
  v21[0] = @"source_id";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v10 = [*(id *)(a1 + 48) database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__HDAuthorizationEntity__allSourcesRequestingTypes_additionalPredicate_profile_error___block_invoke_2;
  v19[3] = &unk_1E62F4CC0;
  id v11 = v7;
  id v20 = v11;
  LODWORD(v8) = [v8 enumerateProperties:v9 withPredicate:v6 healthDatabase:v10 error:a3 enumerationHandler:v19];

  if (v8)
  {
    id v12 = [*(id *)(a1 + 48) sourceManager];
    uint64_t v13 = [v11 allObjects];
    uint64_t v14 = [v12 clientSourcesForSourceIDs:v13 error:a3];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    BOOL v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (id)_predicateForTypes:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if ([v2 count])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "code", (void)v12));
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    id v10 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"object_type" values:v3];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __86__HDAuthorizationEntity__allSourcesRequestingTypes_additionalPredicate_profile_error___block_invoke_2(uint64_t a1)
{
  id v2 = HDSQLiteColumnWithNameAsNumber();
  [*(id *)(a1 + 32) addObject:v2];

  return 1;
}

+ (BOOL)resetAuthorizationStatusesForBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HDAuthorizationEntity.m", 449, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];
  }
  id v11 = +[HDAuthorizationEntity _predicateForBundleIdentifier:profile:error:]((uint64_t)a1, v9, v10, (uint64_t)a5);
  if (v11) {
    char v12 = +[HDAuthorizationEntity _resetAuthorizationStatusesWithPredicate:profile:error:]((uint64_t)a1, v11, v10, (uint64_t)a5);
  }
  else {
    char v12 = 0;
  }

  return v12;
}

+ (id)_predicateForBundleIdentifier:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = self;
  id v9 = [v6 sourceManager];

  id v10 = [v9 allSourcesForBundleIdentifier:v7 error:a4];

  if (v10)
  {
    id v11 = +[HDAuthorizationEntity _predicateForSourceEntities:](v8, v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (uint64_t)_resetAuthorizationStatusesWithPredicate:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = [v7 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__HDAuthorizationEntity__resetAuthorizationStatusesWithPredicate_profile_error___block_invoke;
  v14[3] = &unk_1E62F4200;
  id v16 = v7;
  uint64_t v17 = v8;
  id v15 = v6;
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = [v8 performWriteTransactionWithHealthDatabase:v9 error:a4 block:v14];

  return v12;
}

+ (BOOL)resetAllAuthorizationStatusesWithProfile:(id)a3 error:(id *)a4
{
  return +[HDAuthorizationEntity _resetAuthorizationStatusesWithPredicate:profile:error:]((uint64_t)a1, 0, a3, (uint64_t)a4);
}

+ (uint64_t)_insertCodableSourceAuthorizations:(char)a3 overwriteExisting:(void *)a4 syncStore:(void *)a5 profile:(uint64_t)a6 error:
{
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  long long v13 = self;
  long long v14 = [v12 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__HDAuthorizationEntity__insertCodableSourceAuthorizations_overwriteExisting_syncStore_profile_error___block_invoke;
  v20[3] = &unk_1E630F150;
  id v21 = v12;
  id v22 = v10;
  id v23 = v11;
  uint64_t v24 = v13;
  char v25 = a3;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  uint64_t v18 = [v13 performWriteTransactionWithHealthDatabase:v14 error:a6 block:v20];

  return v18;
}

uint64_t __102__HDAuthorizationEntity__insertCodableSourceAuthorizations_overwriteExisting_syncStore_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v16 = [v5 databaseForEntityClass:*(void *)(a1 + 56)];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = +[HDAuthorizationEntity _maxObjectPersistentIDForProfile:error:](*(void *)(a1 + 56), *(void **)(a1 + 32), a3);
  if (v7)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(id *)(a1 + 48);
          id v18 = *(id *)(a1 + 32);
          id v19 = v16;
          id v20 = v7;
          id v21 = v6;
          id v22 = v5;
          int v12 = HKWithAutoreleasePool();

          if (!v12)
          {
            uint64_t v13 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v13 = 1;
LABEL_12:
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __102__HDAuthorizationEntity__insertCodableSourceAuthorizations_overwriteExisting_syncStore_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) decodedSourceUUID];
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v68 = 0;
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  id v11 = v7;
  self;
  int v12 = [v8 decodedSourceUUID];
  uint64_t v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &v68, 100, @"Missing source UUID on codable source authorization");
    id v16 = 0;
    goto LABEL_13;
  }
  long long v14 = v3;
  id v15 = HDSourceEntityPredicateForSourceWithUUID(v12, 0);
  *(void *)buf = 0;
  id v16 = +[HDSourceEntity firstSourceWithPredicate:v15 database:v11 error:buf];
  id v17 = *(id *)buf;
  id v18 = v17;
  if (!v16)
  {
    if (v17)
    {
      id v16 = 0;
      id v68 = v17;
    }
    else
    {
      if ([v8 hasSource])
      {
        char v69 = 0;
        long long v60 = [v10 sourceManager];
        long long v58 = [v8 source];
        id v16 = objc_msgSend(v60, "sourceForCodableSource:provenance:createIfNecessary:isDeleted:error:", v58, objc_msgSend(v9, "syncProvenance"), 1, &v69, &v68);

        if (!v16 || !v69) {
          goto LABEL_12;
        }
        uint64_t v61 = (void *)MEMORY[0x1E4F28C58];
        long long v59 = [v13 UUIDString];
        objc_msgSend(v61, "hk_assignError:code:format:", &v68, 100, @"Source %@ is deleted", v59);
      }
      else
      {
        v62 = (void *)MEMORY[0x1E4F28C58];
        id v16 = [v13 UUIDString];
        objc_msgSend(v62, "hk_assignError:code:format:", &v68, 100, @"Failed to find source for UUID %@", v16);
      }

      id v16 = 0;
    }
  }
LABEL_12:

  v3 = v14;
LABEL_13:

  id v19 = v68;
  id v20 = v19;
  if (v16)
  {
    if (*(unsigned char *)(a1 + 96))
    {
LABEL_15:
      uint64_t v21 = *(void *)(a1 + 88);
      id v22 = [*(id *)(a1 + 32) authorizations];
      uint64_t v23 = +[HDAuthorizationEntity _insertCodableAuthorizations:sourceEntity:syncProvenance:objectAnchor:currentDate:options:profile:database:transaction:error:](v21, v22, v16, [*(id *)(a1 + 40) syncProvenance], objc_msgSend(*(id *)(a1 + 64), "longLongValue"), *(void **)(a1 + 72), 0, *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 80), a2);

      goto LABEL_19;
    }
    uint64_t v26 = *(void *)(a1 + 56);
    id v67 = v19;
    id v27 = [v16 sourceBundleIdentifierInDatabase:v26 error:&v67];
    id v28 = v67;

    if (v27)
    {
      uint64_t v29 = *(void *)(a1 + 88);
      long long v30 = *(void **)(a1 + 48);
      id v66 = v28;
      long long v31 = +[HDAuthorizationEntity _predicateForBundleIdentifier:profile:error:](v29, v27, v30, (uint64_t)&v66);
      id v32 = v66;

      if (v31)
      {
        id v63 = v3;
        uint64_t v33 = (void *)MEMORY[0x1E4F65D00];
        uint64_t v34 = [*(id *)(a1 + 88) propertyForSyncProvenance];
        id v35 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "syncProvenance"));
        id v36 = [v33 predicateWithProperty:v34 notEqualToValue:v35];

        uint64_t v37 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v31 otherPredicate:v36];
        id v38 = *(void **)(a1 + 88);
        uint64_t v39 = *(void *)(a1 + 56);
        id v65 = v32;
        id v40 = [v38 anyInDatabase:v39 predicate:v37 error:&v65];
        id v20 = v65;

        if (!v40)
        {
          if (!v20)
          {

            v3 = v63;
            goto LABEL_15;
          }
          _HKInitializeLogging();
          uint64_t v41 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            id v55 = v41;
            id v56 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v56;
            __int16 v71 = 2114;
            uint64_t v72 = v27;
            __int16 v73 = 2114;
            id v74 = v20;
            id v57 = v56;
            _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "%{public}@: Failed to look up existing authorizations for \"%{public}@\": %{public}@", buf, 0x20u);
          }
        }

        uint64_t v23 = 1;
        v3 = v63;
        goto LABEL_19;
      }
      _HKInitializeLogging();
      uint64_t v43 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        id v52 = v43;
        v53 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v53;
        __int16 v71 = 2114;
        uint64_t v72 = v27;
        __int16 v73 = 2114;
        id v74 = v32;
        id v54 = v53;
        _os_log_error_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create source authorization predicate for \"%{public}@\": %{public}@", buf, 0x20u);
      }
      uint64_t v23 = 1;
      id v20 = v32;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v42 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        int v48 = v42;
        uint64_t v49 = objc_opt_class();
        id v50 = v49;
        id v51 = [v3 UUIDString];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v49;
        __int16 v71 = 2114;
        uint64_t v72 = v51;
        __int16 v73 = 2114;
        id v74 = v28;
        _os_log_error_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get source bundle identifier for UUID %{public}@: %{public}@", buf, 0x20u);
      }
      uint64_t v23 = 1;
      id v20 = v28;
    }
  }
  else
  {
    _HKInitializeLogging();
    long long v24 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v44 = v24;
      uint64_t v45 = objc_opt_class();
      id v46 = v45;
      id v47 = [v3 UUIDString];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v45;
      __int16 v71 = 2114;
      uint64_t v72 = v47;
      __int16 v73 = 2114;
      id v74 = v20;
      _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find source for UUID %{public}@: %{public}@", buf, 0x20u);
    }
    uint64_t v23 = 1;
  }
LABEL_19:

  return v23;
}

+ (uint64_t)_insertCodableAuthorizations:(void *)a3 sourceEntity:(uint64_t)a4 syncProvenance:(uint64_t)a5 objectAnchor:(void *)a6 currentDate:(char)a7 options:(void *)a8 profile:(void *)a9 database:(void *)a10 transaction:(uint64_t)a11 error:
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v15 = a3;
  id v54 = a6;
  id v16 = a8;
  id v53 = a9;
  id v46 = a10;
  uint64_t v51 = self;
  if (!v15)
  {
    uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:sel__insertCodableAuthorizations_sourceEntity_syncProvenance_objectAnchor_currentDate_options_profile_database_transaction_error_, v51, @"HDAuthorizationEntity.m", 630, @"Invalid parameter not satisfying: %@", @"sourceEntity != nil" object file lineNumber description];
  }
  uint64_t v47 = [v15 persistentID];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v14;
  uint64_t v55 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (!v55)
  {
    uint64_t v39 = 1;
    goto LABEL_51;
  }
  uint64_t v45 = *(void *)v61;
  id v44 = v15;
  while (2)
  {
    uint64_t v17 = 0;
    uint64_t v18 = v45;
    do
    {
      if (*(void *)v61 != v18) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(id *)(*((void *)&v60 + 1) + 8 * v17);
      BOOL v20 = [v19 hasObjectType]
         && ([v19 _dataTypeCode], _HKValidDataTypeCode())
         && [v19 hasAuthorizationStatus]
         && [v19 _authorizationStatus] >= 100
         && [v19 _authorizationStatus] <= 104
         && [v19 hasAuthorizationRequest]
         && [v19 _authorizationRequest] >= 201
         && [v19 _authorizationRequest] < 204;
      if ([v19 hasAuthorizationMode])
      {
        if (!v20 || [v19 _authorizationMode] < 0 || objc_msgSend(v19, "_authorizationMode") >= 2)
        {
LABEL_47:
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a11, 3, @"Invalid authorization %@", v19);

LABEL_48:
          uint64_t v39 = 0;
LABEL_49:
          id v15 = v44;
          goto LABEL_51;
        }
      }
      else if (!v20)
      {
        goto LABEL_47;
      }
      if (([v19 hasModificationDate] & 1) == 0) {
        goto LABEL_47;
      }

      if ([v19 hasAuthorizationMode]) {
        uint64_t v21 = [v19 _authorizationMode];
      }
      else {
        uint64_t v21 = 0;
      }
      id v22 = [v16 syncIdentityManager];
      uint64_t v23 = [v22 legacySyncIdentity];

      if ([v19 hasSyncIdentity])
      {
        long long v24 = [v19 syncIdentity];
        id v59 = 0;
        long long v25 = +[HDSyncIdentity syncIdentityWithCodable:v24 error:&v59];
        id v26 = v59;

        if (v25)
        {
          uint64_t v57 = v21;
          id v27 = [v16 syncIdentityManager];
          id v58 = v26;
          [v27 concreteIdentityForIdentity:v25 shouldCreate:1 transaction:v46 error:&v58];
          v23 = id v28 = v23;
          id v29 = v58;

          if (v23)
          {

            goto LABEL_32;
          }
          _HKInitializeLogging();
          uint64_t v41 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v65 = v29;
            _os_log_fault_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
          id v26 = v29;
        }
        else
        {
          _HKInitializeLogging();
          id v40 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v65 = v26;
            _os_log_fault_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
        }
        goto LABEL_44;
      }
      uint64_t v57 = v21;
LABEL_32:
      id v56 = v23;
      uint64_t v30 = [v19 _dataTypeCode];
      uint64_t v31 = [v19 _authorizationStatus];
      uint64_t v32 = [v19 _authorizationRequest];
      [v19 modificationDate];
      uint64_t v33 = HDDecodeDateForValue();
      uint64_t v34 = [v23 entity];
      uint64_t v35 = [v34 persistentID];
      if ([v19 hasModificationEpoch])
      {
        id v36 = v16;
        uint64_t v37 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v19, "modificationEpoch"));
        char v38 = +[HDAuthorizationEntity _insertAuthorizationWithSourceIdentifier:dataTypeCode:authorizationStatus:authorizationRequest:authorizationMode:modificationDate:currentDate:syncProvenance:syncIdentity:objectAnchor:modificationEpoch:options:profile:database:error:](v51, v47, v30, v31, v32, v57, v33, v54, a4, v35, a5, v37, a7, v36, v53, a11);

        id v16 = v36;
        uint64_t v18 = v45;

        if ((v38 & 1) == 0) {
          goto LABEL_48;
        }
      }
      else
      {
        uint64_t v39 = +[HDAuthorizationEntity _insertAuthorizationWithSourceIdentifier:dataTypeCode:authorizationStatus:authorizationRequest:authorizationMode:modificationDate:currentDate:syncProvenance:syncIdentity:objectAnchor:modificationEpoch:options:profile:database:error:](v51, v47, v30, v31, v32, v57, v33, v54, a4, v35, a5, 0, a7, v16, v53, a11);

        if (!v39) {
          goto LABEL_49;
        }
      }
LABEL_44:
      ++v17;
    }
    while (v55 != v17);
    uint64_t v39 = 1;
    id v15 = v44;
    uint64_t v55 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v55) {
      continue;
    }
    break;
  }
LABEL_51:

  return v39;
}

+ (uint64_t)_insertAuthorizationWithSourceIdentifier:(uint64_t)a3 dataTypeCode:(uint64_t)a4 authorizationStatus:(uint64_t)a5 authorizationRequest:(uint64_t)a6 authorizationMode:(void *)a7 modificationDate:(void *)a8 currentDate:(uint64_t)a9 syncProvenance:(uint64_t)a10 syncIdentity:(uint64_t)a11 objectAnchor:(void *)a12 modificationEpoch:(char)a13 options:(void *)a14 profile:(void *)a15 database:(uint64_t)a16 error:
{
  id v18 = a7;
  id obj = a8;
  id v19 = a8;
  id v20 = a12;
  id v21 = a14;
  id v22 = a15;
  uint64_t v23 = self;
  uint64_t v24 = v23;
  uint64_t v74 = 0;
  uint64_t v75 = &v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  uint64_t v68 = 0;
  char v69 = (id *)&v68;
  uint64_t v70 = 0x3032000000;
  __int16 v71 = __Block_byref_object_copy__211;
  uint64_t v72 = __Block_byref_object_dispose__211;
  id v73 = 0;
  uint64_t v48 = a6;
  if (a6 == 1)
  {
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke;
    v67[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v67[4] = v23;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_2;
    v66[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
    v66[4] = a2;
    v66[5] = a3;
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_3;
    v65[3] = &unk_1E62F5978;
    v65[4] = &v74;
    v65[5] = &v68;
    if (![v22 executeCachedStatementForKey:&_insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error__lookupKey error:a16 SQLGenerator:v67 bindingHandler:v66 enumerationHandler:v65])goto LABEL_18; {
  }
    }
  id v25 = v20;
  if (v25) {
    goto LABEL_14;
  }
  id v41 = v21;
  id v43 = v22;
  uint64_t v39 = self;
  uint64_t v42 = [(HDSQLiteEntity *)[HDSourceEntity alloc] initWithPersistentID:a2];
  id v44 = [(HDSourceEntity *)v42 sourceBundleIdentifierInDatabase:v43 error:a16];
  if (v44)
  {
    id v26 = [v41 sourceManager];
    id v40 = [v26 allSourcesForBundleIdentifier:v44 error:a16];

    id v27 = v40;
    if (v40)
    {
      id v28 = [v40 allObjects];
      id v29 = objc_msgSend(v28, "hk_map:", &__block_literal_global_402_0);
      char v38 = [v29 componentsJoinedByString:@", "];

      uint64_t v30 = NSString;
      uint64_t v31 = [v39 disambiguatedDatabaseTable];
      uint64_t v32 = [v30 stringWithFormat:@"SELECT COALESCE(MAX(%@ + 1), 0) FROM %@ WHERE %@ in (%@) AND %@ = ?", @"modification_epoch", v31, @"source_id", v38, @"object_type"];

      uint64_t v82 = 0;
      id v83 = &v82;
      uint64_t v84 = 0x3032000000;
      id v85 = __Block_byref_object_copy__211;
      v86 = __Block_byref_object_dispose__211;
      id v87 = 0;
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __95__HDAuthorizationEntity__nextModificationEpochForSourceIdentifier_type_profile_database_error___block_invoke_2;
      v79[3] = &unk_1E62F33F8;
      id v80 = v40;
      uint64_t v81 = a3;
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __95__HDAuthorizationEntity__nextModificationEpochForSourceIdentifier_type_profile_database_error___block_invoke_3;
      v78[3] = &unk_1E62F3640;
      v78[4] = &v82;
      uint64_t v33 = [v43 executeSQL:v32 error:a16 bindingHandler:v79 enumerationHandler:v78]
          ? (void *)v83[5]
          : 0;
      id v27 = v40;
      id v25 = v33;

      _Block_object_dispose(&v82, 8);
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
  }

  if (v25)
  {
LABEL_14:
    uint64_t v34 = v48;
    if (v48 == 1 && (a13 & 1) != 0)
    {
      v75[3] = a11;
      objc_storeStrong(v69 + 5, obj);
      uint64_t v34 = 1;
    }
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_4;
    v64[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v64[4] = v24;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_5;
    v51[3] = &unk_1E630F178;
    uint64_t v56 = a2;
    uint64_t v57 = a3;
    uint64_t v58 = a4;
    uint64_t v59 = a5;
    uint64_t v60 = v34;
    uint64_t v62 = a10;
    uint64_t v63 = a11;
    id v52 = v18;
    id v54 = &v74;
    uint64_t v61 = a9;
    uint64_t v55 = &v68;
    id v35 = v25;
    id v53 = v35;
    uint64_t v36 = [v22 executeCachedStatementForKey:&_insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error__insertKey error:a16 SQLGenerator:v64 bindingHandler:v51 enumerationHandler:0];
  }
  else
  {
LABEL_18:
    uint64_t v36 = 0;
  }
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  return v36;
}

id __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  id v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@, %@ FROM %@ WHERE %@ = ? AND %@ = ?", @"object_limit_anchor", @"object_limit_modified", v2, @"source_id", @"object_type", 0];

  return v3;
}

uint64_t __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  uint64_t v4 = MEMORY[0x1C1879F30](a2, 1);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 0;
}

id __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_4(uint64_t a1)
{
  v5[12] = *MEMORY[0x1E4F143B8];
  v5[0] = @"source_id";
  v5[1] = @"object_type";
  v5[2] = @"status";
  v5[3] = @"request";
  v5[4] = @"mode";
  v5[5] = @"date_modified";
  v5[6] = @"provenance";
  v5[7] = @"sync_identity";
  v5[8] = @"deleted_object_anchor";
  v5[9] = @"object_limit_anchor";
  v5[10] = @"object_limit_modified";
  v5[11] = @"modification_epoch";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:12];
  v3 = [*(id *)(a1 + 32) insertSQLForProperties:v2 shouldReplace:1];

  return v3;
}

uint64_t __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 64));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 72));
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 80));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 88));
  sqlite3_bind_int64(a2, 5, *(void *)(a1 + 96));
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, 6, v4);
  sqlite3_bind_int64(a2, 7, *(void *)(a1 + 104));
  sqlite3_bind_int64(a2, 8, *(void *)(a1 + 112));
  sqlite3_bind_int64(a2, 9, *(void *)(a1 + 120));
  sqlite3_bind_int64(a2, 10, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v5 = [*(id *)(a1 + 40) longLongValue];

  return sqlite3_bind_int64(a2, 12, v5);
}

__CFString *__95__HDAuthorizationEntity__nextModificationEpochForSourceIdentifier_type_profile_database_error___block_invoke()
{
  return @"?";
}

uint64_t __95__HDAuthorizationEntity__nextModificationEpochForSourceIdentifier_type_profile_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    int v8 = 1;
    do
    {
      uint64_t v9 = 0;
      int v10 = v8;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        sqlite3_bind_int64(a2, v10 + v9, objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "persistentID", (void)v13));
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      int v8 = v10 + v9;
    }
    while (v6);
    int v11 = v10 + v9;
  }
  else
  {
    int v11 = 1;
  }

  return sqlite3_bind_int64(a2, v11, *(void *)(a1 + 40));
}

uint64_t __95__HDAuthorizationEntity__nextModificationEpochForSourceIdentifier_type_profile_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

void __189__HDAuthorizationEntity__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = *(id *)(a1 + 32);
  id v14 = v10;
  id v15 = v11;
  long long v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];

  if (v16)
  {
    uint64_t v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];

    uint64_t v18 = [*(id *)(a1 + 48) syncIdentityManager];
    uint64_t v19 = [v18 currentSyncIdentity];

    id v13 = (id)v17;
    id v12 = (id)v19;
  }
  id v20 = [*(id *)(a1 + 56) objectForKeyedSubscript:v9];

  if (v20)
  {
    id v21 = [*(id *)(a1 + 56) objectForKeyedSubscript:v9];

    id v22 = [*(id *)(a1 + 48) syncIdentityManager];
    uint64_t v23 = [v22 currentSyncIdentity];

    id v12 = (id)v23;
  }
  else
  {
    id v21 = v14;
  }
  uint64_t v24 = [*(id *)(a1 + 64) objectForKeyedSubscript:v9];

  if (v24)
  {
    id v25 = [*(id *)(a1 + 64) objectForKeyedSubscript:v9];

    id v26 = [*(id *)(a1 + 48) syncIdentityManager];
    uint64_t v27 = [v26 currentSyncIdentity];

    id v12 = (id)v27;
    if (!v13) {
      goto LABEL_13;
    }
  }
  else
  {
    id v25 = v15;
    if (!v13) {
      goto LABEL_13;
    }
  }
  if (v21 && v25)
  {
    id v28 = objc_alloc_init(HDCodableAuthorization);
    [(HDCodableAuthorization *)v28 _setDataTypeCodeWithObjectType:v9];
    [(HDCodableAuthorization *)v28 _setAuthorizationStatusWithNumber:v13];
    [(HDCodableAuthorization *)v28 _setAuthorizationRequestWithNumber:v21];
    [(HDCodableAuthorization *)v28 _setAuthorizationModeWithNumber:v25];
    [(HDCodableAuthorization *)v28 _setModificationDate:*(void *)(a1 + 72)];
    id v29 = [v12 identity];
    [v29 codableSyncIdentity];
    id v41 = v9;
    id v30 = v12;
    uint64_t v31 = v25;
    id v32 = v13;
    uint64_t v33 = v21;
    id v34 = v15;
    v36 = id v35 = v14;
    [(HDCodableAuthorization *)v28 setSyncIdentity:v36];

    id v14 = v35;
    id v15 = v34;
    id v21 = v33;
    id v13 = v32;
    id v25 = v31;
    id v12 = v30;
    id v9 = v41;

    [*(id *)(a1 + 80) addObject:v28];
    goto LABEL_15;
  }
LABEL_13:
  _HKInitializeLogging();
  uint64_t v37 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
  {
    id v38 = v14;
    uint64_t v39 = v37;
    *(_DWORD *)buf = 138413058;
    id v43 = (id)objc_opt_class();
    __int16 v44 = 2112;
    id v45 = v9;
    __int16 v46 = 2112;
    id v47 = v13;
    __int16 v48 = 2112;
    uint64_t v49 = v21;
    id v40 = v43;
    _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "%@: skipping authorization for type %@ with status %@ request %@", buf, 0x2Au);

    id v14 = v38;
  }
LABEL_15:
}

BOOL __189__HDAuthorizationEntity__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error___block_invoke_420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = HDSQLiteColumnAsInt64();
  uint64_t v8 = HDSQLiteColumnAsInt64();
  uint64_t v9 = HDSQLiteColumnAsInt64();
  uint64_t v10 = HDSQLiteColumnAsInt64();
  id v11 = [*(id *)(a1 + 32) syncIdentityManager];
  uint64_t v12 = *(void *)(a1 + 40);
  id v21 = 0;
  id v13 = [v11 identityForEntityID:v10 transaction:v12 error:&v21];
  id v14 = v21;

  if (v13)
  {
    id v15 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:v7];
    if (([*(id *)(a1 + 48) containsObject:v15] & 1) == 0)
    {
      uint64_t v16 = *(void *)(a1 + 64);
      uint64_t v17 = [NSNumber numberWithInteger:v8];
      uint64_t v18 = [NSNumber numberWithInteger:v9];
      (*(void (**)(uint64_t, id, void *, void *, void *))(v16 + 16))(v16, v15, v17, v18, v13);

      [*(id *)(a1 + 48) addObject:v15];
      [*(id *)(a1 + 56) removeObject:v15];
    }
  }
  else
  {
    id v19 = v14;
    id v15 = v19;
    if (v19)
    {
      if (a5)
      {
        id v15 = v19;
        *a5 = v15;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
  }

  return v13 != 0;
}

uint64_t __80__HDAuthorizationEntity__resetAuthorizationStatusesWithPredicate_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 databaseForEntityClass:*(void *)(a1 + 48)];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  v23[0] = @"source_id";
  v23[1] = @"object_type";
  v23[2] = @"request";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  uint64_t v8 = *(void **)(a1 + 48);
  id v22 = 0;
  uint64_t v9 = [v8 maxPersistentIDWithPredicate:0 database:v5 error:&v22];
  id v10 = v22;
  id v11 = v10;
  if (v9) {
    goto LABEL_2;
  }
  if (!v10)
  {
    uint64_t v9 = &unk_1F17EF2B8;
LABEL_2:
    uint64_t v12 = [MEMORY[0x1E4F65D00] predicateWithProperty:*MEMORY[0x1E4F65C70] lessThanOrEqualToValue:v9];
    id v13 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v12 otherPredicate:*(void *)(a1 + 32)];
    id v14 = [*(id *)(a1 + 48) queryWithDatabase:v5 predicate:v13];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__HDAuthorizationEntity__resetAuthorizationStatusesWithPredicate_profile_error___block_invoke_2;
    v17[3] = &unk_1E630F1F0;
    uint64_t v21 = *(void *)(a1 + 48);
    id v18 = v6;
    id v19 = *(id *)(a1 + 40);
    id v20 = v5;
    uint64_t v15 = [v14 enumeratePersistentIDsAndProperties:v7 error:a3 enumerationHandler:v17];

    goto LABEL_3;
  }
  if (a3)
  {
    uint64_t v15 = 0;
    *a3 = v10;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v15 = 0;
  }
LABEL_3:

  return v15;
}

uint64_t __80__HDAuthorizationEntity__resetAuthorizationStatusesWithPredicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = HDSQLiteColumnAsInt64();
  uint64_t v8 = HDSQLiteColumnAsInt64();
  uint64_t v9 = HDSQLiteColumnAsInt64();
  return +[HDAuthorizationEntity _insertAuthorizationWithSourceIdentifier:dataTypeCode:authorizationStatus:authorizationRequest:authorizationMode:modificationDate:currentDate:syncProvenance:syncIdentity:objectAnchor:modificationEpoch:options:profile:database:error:](*(void *)(a1 + 56), v7, v8, 100, v9, 0, *(void **)(a1 + 32), *(void **)(a1 + 32), 0, [*(id *)(a1 + 40) currentSyncIdentityPersistentID], 0, 0, 0, *(void **)(a1 + 40), *(void **)(a1 + 48), a5);
}

+ (id)_predicateForSourceEntities:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_424);

  uint64_t v4 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"source_id" values:v3];

  return v4;
}

uint64_t __53__HDAuthorizationEntity__predicateForSourceEntities___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 persistentID];

  return [v2 numberWithLongLong:v3];
}

+ (id)databaseTable
{
  return @"authorization";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_110;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"source_id";
  id v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"source_id";
  v4[1] = @"object_type";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)propertyForSyncProvenance
{
  return @"provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

@end