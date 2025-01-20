@interface HDContributorEntity
+ (BOOL)deleteContributorWithUUID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_insertWithUUID:(double)a1 appleID:(uint64_t)a2 callerID:(void *)a3 deleted:(void *)a4 modificationDate:(void *)a5 syncAnchor:(uint64_t)a6 syncProvenance:(uint64_t)a7 syncIdentity:(uint64_t)a8 primaryUser:(char)a9 database:(void *)a10 error:(uint64_t)a11;
+ (id)_nextSyncAnchorInDatabase:(void *)a3 error:;
+ (id)_predicateForContributorReference:(uint64_t)a1;
+ (id)_predicateForContributorWithUUID:(uint64_t)a1;
+ (id)contributorEntityForNoContributorWithProfile:(id)a3 error:(id *)a4;
+ (id)contributorEntityWithUUID:(id)a3 profile:(id)a4 includeDeleted:(BOOL)a5 error:(id *)a6;
+ (id)contributorForReference:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)externalReferenceForContributorReference:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)insertOrLookupContributorEntityForNoContributorWithTransaction:(id)a3 syncIdentity:(int64_t)a4 error:(id *)a5;
+ (id)insertPrimaryUserWithAppleID:(id)a3 callerID:(id)a4 syncIdentity:(int64_t)a5 database:(id)a6 error:(id *)a7;
+ (id)insertWithUUID:(id)a3 appleID:(id)a4 callerID:(id)a5 primaryUser:(BOOL)a6 profile:(id)a7 error:(id *)a8;
+ (id)insertWithUUID:(id)a3 appleID:(id)a4 callerID:(id)a5 primaryUser:(BOOL)a6 syncProvenance:(int64_t)a7 syncIdentity:(int64_t)a8 transaction:(id)a9 error:(id *)a10;
+ (id)noneContributorUUID;
+ (id)primaryUserContributorInDatabase:(id)a3 error:(id *)a4;
+ (id)primaryUserContributorInProfile:(id)a3 error:(id *)a4;
+ (id)propertyForSyncAnchor;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (int64_t)protectionClass;
- (BOOL)deletedInProfile:(id)a3 error:(id *)a4;
- (BOOL)updateAppleID:(id)a3 profile:(id)a4 error:(id *)a5;
- (BOOL)updateCallerID:(id)a3 profile:(id)a4 error:(id *)a5;
- (id)appleIDInProfile:(id)a3 error:(id *)a4;
- (id)callerIDInProfile:(id)a3 error:(id *)a4;
- (id)modificationDateInProfile:(id)a3 error:(id *)a4;
- (id)syncAnchorInProfile:(id)a3 error:(id *)a4;
@end

@implementation HDContributorEntity

+ (id)databaseTable
{
  return @"contributors";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 10;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDContributorEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)insertOrLookupContributorEntityForNoContributorWithTransaction:(id)a3 syncIdentity:(int64_t)a4 error:(id *)a5
{
  v22[9] = *MEMORY[0x1E4F143B8];
  v8 = [a3 databaseForEntityClass:a1];
  v9 = [a1 noneContributorUUID];
  v10 = +[HDContributorEntity _predicateForContributorWithUUID:]((uint64_t)a1, v9);
  id v21 = 0;
  v11 = [a1 anyInDatabase:v8 predicate:v10 error:&v21];
  id v12 = v21;
  id v13 = v12;
  if (v11)
  {
    id v14 = v11;
  }
  else if (v12)
  {
    if (a5)
    {
      id v13 = v12;
      id v14 = 0;
      *a5 = v13;
    }
    else
    {
      _HKLogDroppedError();
      id v14 = 0;
    }
  }
  else
  {
    v22[0] = @"uuid";
    v22[1] = @"apple_id";
    v22[2] = @"caller_id";
    v22[3] = @"deleted";
    v22[4] = @"mod_date";
    v22[5] = @"sync_anchor";
    v22[6] = @"sync_provenance";
    v22[7] = @"sync_identity";
    v22[8] = @"primary_user";
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:9];
    id v20 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __105__HDContributorEntity_insertOrLookupContributorEntityForNoContributorWithTransaction_syncIdentity_error___block_invoke;
    v17[3] = &unk_1E62F67E8;
    id v18 = v9;
    int64_t v19 = a4;
    id v14 = [a1 insertOrReplaceEntity:0 database:v8 properties:v16 error:&v20 bindingHandler:v17];
    id v13 = v20;
  }

  return v14;
}

+ (id)_predicateForContributorWithUUID:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = (void *)MEMORY[0x1E4F65D00];
  v4 = _HDSQLiteValueForUUID();

  v5 = [v3 predicateWithProperty:@"uuid" equalToValue:v4];

  return v5;
}

void __105__HDContributorEntity_insertOrLookupContributorEntityForNoContributorWithTransaction_syncIdentity_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"uuid", *(void *)(a1 + 32));
  MEMORY[0x1C1879E90](a2, @"apple_id");
  MEMORY[0x1C1879E90](a2, @"caller_id");
  MEMORY[0x1C1879E20](a2, @"deleted", 0);
  double Current = CFAbsoluteTimeGetCurrent();
  MEMORY[0x1C1879E50](a2, @"mod_date", Current);
  MEMORY[0x1C1879E80](a2, @"sync_anchor", 0);
  MEMORY[0x1C1879E80](a2, @"sync_provenance", 0);
  MEMORY[0x1C1879E80](a2, @"sync_identity", *(void *)(a1 + 40));

  JUMPOUT(0x1C1879E20);
}

+ (id)insertWithUUID:(id)a3 appleID:(id)a4 callerID:(id)a5 primaryUser:(BOOL)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__40;
  v37 = __Block_byref_object_dispose__40;
  id v38 = 0;
  id v18 = [v17 database];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__HDContributorEntity_insertWithUUID_appleID_callerID_primaryUser_profile_error___block_invoke;
  v25[3] = &unk_1E62F9018;
  v30 = &v33;
  id v31 = a1;
  id v19 = v14;
  id v26 = v19;
  id v20 = v15;
  id v27 = v20;
  id v21 = v16;
  id v28 = v21;
  id v22 = v17;
  id v29 = v22;
  BOOL v32 = a6;
  [a1 performWriteTransactionWithHealthDatabase:v18 error:a8 block:v25];

  id v23 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v23;
}

uint64_t __81__HDContributorEntity_insertWithUUID_appleID_callerID_primaryUser_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 72)];
  uint64_t v6 = *(void *)(a1 + 72);
  id v33 = 0;
  v7 = +[HDContributorEntity _nextSyncAnchorInDatabase:error:](v6, v5, &v33);
  id v8 = v33;
  v9 = v8;
  if (!v7)
  {
    id v25 = v8;
    id v21 = v25;
    if (v25)
    {
      if (a3)
      {
        id v21 = v25;
        *a3 = v21;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    goto LABEL_13;
  }
  id v28 = a3;
  uint64_t v10 = *(void *)(a1 + 72);
  v11 = *(void **)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  id v31 = *(void **)(a1 + 48);
  double Current = CFAbsoluteTimeGetCurrent();
  id v29 = v7;
  uint64_t v14 = [v7 longLongValue];
  id v15 = [*(id *)(a1 + 56) syncIdentityManager];
  id v16 = [v15 currentSyncIdentity];
  id v17 = [v16 entity];
  uint64_t v18 = [v17 persistentID];
  char v19 = *(unsigned char *)(a1 + 80);
  id v32 = v9;
  v30 = v5;
  uint64_t v20 = +[HDContributorEntity _insertWithUUID:appleID:callerID:deleted:modificationDate:syncAnchor:syncProvenance:syncIdentity:primaryUser:database:error:](Current, v10, v11, v12, v31, v14, 0, v18, v19, v5, (uint64_t)&v32);
  id v21 = v32;

  uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  id v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v20;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v26 = v21;
    id v21 = v26;
    if (v26)
    {
      if (v28)
      {
        id v21 = v26;
        *id v28 = v21;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    v7 = v29;
    v5 = v30;
LABEL_13:

    uint64_t v24 = 0;
    goto LABEL_14;
  }
  uint64_t v24 = 1;
  v7 = v29;
  v5 = v30;
LABEL_14:

  return v24;
}

+ (id)_nextSyncAnchorInDatabase:(void *)a3 error:
{
  id v4 = a2;
  id v10 = 0;
  v5 = [self maxValueForProperty:@"sync_anchor" predicate:0 database:v4 error:&v10];

  id v6 = v10;
  v7 = v6;
  if (v5 || !v6)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "longLongValue") + 1);
  }
  else if (a3)
  {
    id v8 = 0;
    *a3 = v6;
  }
  else
  {
    _HKLogDroppedError();
    id v8 = 0;
  }

  return v8;
}

+ (id)_insertWithUUID:(double)a1 appleID:(uint64_t)a2 callerID:(void *)a3 deleted:(void *)a4 modificationDate:(void *)a5 syncAnchor:(uint64_t)a6 syncProvenance:(uint64_t)a7 syncIdentity:(uint64_t)a8 primaryUser:(char)a9 database:(void *)a10 error:(uint64_t)a11
{
  v39[9] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a10;
  uint64_t v22 = self;
  v39[0] = @"uuid";
  v39[1] = @"apple_id";
  v39[2] = @"caller_id";
  v39[3] = @"deleted";
  v39[4] = @"mod_date";
  v39[5] = @"sync_anchor";
  v39[6] = @"sync_provenance";
  v39[7] = @"sync_identity";
  v39[8] = @"primary_user";
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:9];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __147__HDContributorEntity__insertWithUUID_appleID_callerID_deleted_modificationDate_syncAnchor_syncProvenance_syncIdentity_primaryUser_database_error___block_invoke;
  v29[3] = &unk_1E62F9040;
  id v30 = v18;
  id v31 = v19;
  id v32 = v20;
  char v37 = 0;
  double v33 = a1;
  uint64_t v34 = a6;
  uint64_t v35 = a7;
  uint64_t v36 = a8;
  char v38 = a9;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = [v22 insertOrReplaceEntity:0 database:v21 properties:v23 error:a11 bindingHandler:v29];

  return v27;
}

+ (id)insertWithUUID:(id)a3 appleID:(id)a4 callerID:(id)a5 primaryUser:(BOOL)a6 syncProvenance:(int64_t)a7 syncIdentity:(int64_t)a8 transaction:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = [a9 databaseForEntityClass:a1];
  id v20 = +[HDContributorEntity _nextSyncAnchorInDatabase:error:]((uint64_t)a1, v19, a10);
  if (v20)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v22 = +[HDContributorEntity _insertWithUUID:appleID:callerID:deleted:modificationDate:syncAnchor:syncProvenance:syncIdentity:primaryUser:database:error:](Current, (uint64_t)a1, v16, v17, v18, [v20 longLongValue], a7, a8, a6, v19, (uint64_t)a10);
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (id)insertPrimaryUserWithAppleID:(id)a3 callerID:(id)a4 syncIdentity:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = +[HDContributorEntity _nextSyncAnchorInDatabase:error:]((uint64_t)a1, v14, a7);
  if (v15)
  {
    id v16 = [MEMORY[0x1E4F29128] UUID];
    double Current = CFAbsoluteTimeGetCurrent();
    id v18 = +[HDContributorEntity _insertWithUUID:appleID:callerID:deleted:modificationDate:syncAnchor:syncProvenance:syncIdentity:primaryUser:database:error:](Current, (uint64_t)a1, v16, v12, v13, [v15 longLongValue], 0, a5, 1, v14, (uint64_t)a7);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

void __147__HDContributorEntity__insertWithUUID_appleID_callerID_deleted_modificationDate_syncAnchor_syncProvenance_syncIdentity_primaryUser_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"uuid", *(void *)(a1 + 32));
  if (*(void *)(a1 + 40)) {
    MEMORY[0x1C1879EC0](a2, @"apple_id");
  }
  else {
    MEMORY[0x1C1879E90](a2, @"apple_id");
  }
  if (*(void *)(a1 + 48)) {
    MEMORY[0x1C1879EC0](a2, @"caller_id");
  }
  else {
    MEMORY[0x1C1879E90](a2, @"caller_id");
  }
  MEMORY[0x1C1879E20](a2, @"deleted", *(unsigned __int8 *)(a1 + 88));
  MEMORY[0x1C1879E50](a2, @"mod_date", *(double *)(a1 + 56));
  MEMORY[0x1C1879E80](a2, @"sync_anchor", *(void *)(a1 + 64));
  MEMORY[0x1C1879E80](a2, @"sync_provenance", *(void *)(a1 + 72));
  MEMORY[0x1C1879E80](a2, @"sync_identity", *(void *)(a1 + 80));

  JUMPOUT(0x1C1879E20);
}

+ (BOOL)deleteContributorWithUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [a4 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__HDContributorEntity_deleteContributorWithUUID_profile_error___block_invoke;
  v12[3] = &unk_1E62F9068;
  id v13 = v8;
  id v14 = a1;
  id v10 = v8;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v9 error:a5 block:v12];

  return (char)a5;
}

uint64_t __63__HDContributorEntity_deleteContributorWithUUID_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v25[5] = *MEMORY[0x1E4F143B8];
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 40);
  id v23 = 0;
  v7 = +[HDContributorEntity _nextSyncAnchorInDatabase:error:](v6, v5, &v23);
  id v8 = v23;
  v9 = v8;
  if (v7)
  {
    v25[0] = @"apple_id";
    v25[1] = @"caller_id";
    v25[2] = @"deleted";
    v25[3] = @"mod_date";
    void v25[4] = @"sync_anchor";
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];
    v11 = +[HDContributorEntity _predicateForContributorWithUUID:](*(void *)(a1 + 40), *(void **)(a1 + 32));
    v24[0] = v11;
    self;
    id v12 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
    v24[1] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

    id v14 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v13];
    id v15 = *(void **)(a1 + 40);
    id v22 = v9;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__HDContributorEntity_deleteContributorWithUUID_profile_error___block_invoke_2;
    v20[3] = &unk_1E62F35C8;
    id v21 = v7;
    uint64_t v16 = [v15 updateProperties:v10 predicate:v14 database:v5 error:&v22 bindingHandler:v20];
    id v17 = v22;
  }
  else
  {
    id v19 = v8;
    id v10 = v19;
    if (v19)
    {
      if (a3)
      {
        id v10 = v19;
        uint64_t v16 = 0;
        *a3 = v10;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v16 = 0;
      }
      id v17 = v10;
    }
    else
    {
      id v17 = 0;
      uint64_t v16 = 0;
    }
  }

  return v16;
}

void __63__HDContributorEntity_deleteContributorWithUUID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E90](a2, @"apple_id");
  MEMORY[0x1C1879E90](a2, @"caller_id");
  MEMORY[0x1C1879E20](a2, @"deleted", 1);
  double Current = CFAbsoluteTimeGetCurrent();
  MEMORY[0x1C1879E50](a2, @"mod_date", Current);
  [*(id *)(a1 + 32) longLongValue];

  JUMPOUT(0x1C1879E80);
}

+ (id)contributorEntityWithUUID:(id)a3 profile:(id)a4 includeDeleted:(BOOL)a5 error:(id *)a6
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v11 = +[HDContributorEntity _predicateForContributorWithUUID:]((uint64_t)a1, a3);
  if (!a5)
  {
    self;
    id v12 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
    id v13 = (void *)MEMORY[0x1E4F65D08];
    v19[0] = v11;
    v19[1] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    uint64_t v15 = [v13 predicateMatchingAllPredicates:v14];

    v11 = (void *)v15;
  }
  uint64_t v16 = [v10 database];
  id v17 = [a1 anyWithPredicate:v11 healthDatabase:v16 error:a6];

  return v17;
}

+ (id)contributorEntityForNoContributorWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 noneContributorUUID];
  id v8 = +[HDContributorEntity _predicateForContributorWithUUID:]((uint64_t)a1, v7);
  v9 = [v6 database];

  id v10 = [a1 anyWithPredicate:v8 healthDatabase:v9 error:a4];

  return v10;
}

+ (id)primaryUserContributorInProfile:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F65D00];
  id v7 = a3;
  id v8 = [v6 predicateWithProperty:@"primary_user" equalToValue:MEMORY[0x1E4F1CC38]];
  v9 = [v7 database];

  id v10 = [a1 anyWithPredicate:v8 healthDatabase:v9 error:a4];

  return v10;
}

+ (id)primaryUserContributorInDatabase:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F65D00];
  id v7 = a3;
  id v8 = [v6 predicateWithProperty:@"primary_user" equalToValue:MEMORY[0x1E4F1CC38]];
  v9 = [a1 anyInDatabase:v7 predicate:v8 error:a4];

  return v9;
}

+ (id)contributorForReference:(id)a3 profile:(id)a4 error:(id *)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 contributorType] == 2)
  {
    id v10 = 0;
  }
  else
  {
    v11 = +[HDContributorEntity _predicateForContributorReference:]((uint64_t)a1, v8);
    self;
    id v12 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
    id v13 = (void *)MEMORY[0x1E4F65D08];
    v31[0] = v11;
    v31[1] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    uint64_t v15 = [v13 predicateMatchingAllPredicates:v14];

    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__40;
    id v29 = __Block_byref_object_dispose__40;
    id v30 = 0;
    uint64_t v16 = [v9 database];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61__HDContributorEntity_contributorForReference_profile_error___block_invoke;
    v21[3] = &unk_1E62F6778;
    id v24 = a1;
    id v17 = v15;
    id v22 = v17;
    id v23 = &v25;
    int v18 = [a1 performReadTransactionWithHealthDatabase:v16 error:a5 block:v21];

    if (v18) {
      id v19 = (void *)v26[5];
    }
    else {
      id v19 = 0;
    }
    id v10 = v19;

    _Block_object_dispose(&v25, 8);
  }

  return v10;
}

+ (id)_predicateForContributorReference:(uint64_t)a1
{
  id v2 = a2;
  v3 = self;
  switch([v2 contributorType])
  {
    case 1:
      id v4 = (void *)MEMORY[0x1E4F65D00];
      uint64_t v5 = *MEMORY[0x1E4F65C70];
      id v6 = [v2 persistentID];
      id v7 = [v4 predicateWithProperty:v5 equalToValue:v6];

      goto LABEL_9;
    case 2:
      id v9 = [v3 noneContributorUUID];
      goto LABEL_8;
    case 3:
      uint64_t v8 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"primary_user" equalToValue:MEMORY[0x1E4F1CC38]];
      goto LABEL_6;
    case 4:
      id v9 = [v2 UUID];
LABEL_8:
      id v10 = v9;
      id v7 = +[HDContributorEntity _predicateForContributorWithUUID:]((uint64_t)v3, v9);

      goto LABEL_9;
    default:
      uint64_t v8 = [MEMORY[0x1E4F65D58] falsePredicate];
LABEL_6:
      id v7 = (void *)v8;
LABEL_9:

      return v7;
  }
}

uint64_t __61__HDContributorEntity_contributorForReference_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = [a2 databaseForEntityClass:v5];
  id v7 = [v5 queryWithDatabase:v6 predicate:*(void *)(a1 + 32)];

  v13[0] = @"uuid";
  v13[1] = @"apple_id";
  v13[2] = @"caller_id";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HDContributorEntity_contributorForReference_profile_error___block_invoke_2;
  v11[3] = &unk_1E62F9090;
  long long v12 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = [v7 enumerateProperties:v8 error:a3 enumerationHandler:v11];

  return v9;
}

uint64_t __61__HDContributorEntity_contributorForReference_profile_error___block_invoke_2(uint64_t a1)
{
  id v2 = HDSQLiteColumnWithNameAsUUID();
  v3 = [*(id *)(a1 + 40) noneContributorUUID];
  char v4 = [v2 isEqual:v3];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = HDSQLiteColumnWithNameAsString();
    id v6 = HDSQLiteColumnWithNameAsString();
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F2AE48]) _initWithUUID:v2 appleID:v5 callerID:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  return 0;
}

+ (id)externalReferenceForContributorReference:(id)a3 profile:(id)a4 error:(id *)a5
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  switch([v8 contributorType])
  {
    case 1:
    case 3:
      id v10 = +[HDContributorEntity _predicateForContributorReference:]((uint64_t)a1, v8);
      self;
      id v22 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
      v11 = (void *)MEMORY[0x1E4F65D08];
      v33[0] = v10;
      v33[1] = v22;
      long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      id v13 = [v11 predicateMatchingAllPredicates:v12];

      id v14 = v13;
      id v15 = v9;
      uint64_t v16 = self;
      uint64_t v27 = 0;
      id v28 = &v27;
      uint64_t v29 = 0x3032000000;
      id v30 = __Block_byref_object_copy__40;
      id v31 = __Block_byref_object_dispose__40;
      id v32 = 0;
      id v17 = [v15 database];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __85__HDContributorEntity__contributorReferenceForEntityMatchingPredicate_profile_error___block_invoke;
      v23[3] = &unk_1E62F6778;
      id v26 = v16;
      id v18 = v14;
      id v24 = v18;
      uint64_t v25 = &v27;
      int v19 = [v16 performReadTransactionWithHealthDatabase:v17 error:a5 block:v23];

      if (v19) {
        id v20 = (void *)v28[5];
      }
      else {
        id v20 = 0;
      }
      a5 = v20;

      _Block_object_dispose(&v27, 8);
      break;
    case 2:
    case 4:
      a5 = (id *)v8;
      break;
    default:
      break;
  }

  return a5;
}

- (id)appleIDInProfile:(id)a3 error:(id *)a4
{
  id v6 = [a3 database];
  uint64_t v7 = [(HDHealthEntity *)self valueForProperty:@"apple_id" healthDatabase:v6 error:a4];

  return v7;
}

- (BOOL)updateAppleID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_class();
  v11 = [v9 database];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__HDContributorEntity_updateAppleID_profile_error___block_invoke;
  v14[3] = &unk_1E62F2AE0;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  LOBYTE(a5) = [v10 performWriteTransactionWithHealthDatabase:v11 error:a5 block:v14];

  return (char)a5;
}

uint64_t __51__HDContributorEntity_updateAppleID_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 databaseForEntity:*(void *)(a1 + 32)];
  id v19 = 0;
  id v6 = +[HDContributorEntity _nextSyncAnchorInDatabase:error:]((uint64_t)HDContributorEntity, v5, &v19);
  id v7 = v19;
  id v8 = v7;
  if (v6)
  {
    v20[0] = @"apple_id";
    v20[1] = @"mod_date";
    v20[2] = @"sync_anchor";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    id v18 = v8;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__HDContributorEntity_updateAppleID_profile_error___block_invoke_2;
    v15[3] = &unk_1E62F3A88;
    id v10 = *(void **)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    id v17 = v6;
    uint64_t v11 = [v10 updateProperties:v9 database:v5 error:&v18 bindingHandler:v15];
    id v12 = v18;
  }
  else
  {
    id v14 = v7;
    id v9 = v14;
    if (v14)
    {
      if (a3)
      {
        id v9 = v14;
        uint64_t v11 = 0;
        *a3 = v9;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v11 = 0;
      }
      id v12 = v9;
    }
    else
    {
      id v12 = 0;
      uint64_t v11 = 0;
    }
  }

  return v11;
}

void __51__HDContributorEntity_updateAppleID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32)) {
    MEMORY[0x1C1879EC0](a2, @"apple_id");
  }
  else {
    MEMORY[0x1C1879E90](a2, @"apple_id");
  }
  double Current = CFAbsoluteTimeGetCurrent();
  MEMORY[0x1C1879E50](a2, @"mod_date", Current);
  [*(id *)(a1 + 40) longLongValue];

  JUMPOUT(0x1C1879E80);
}

- (id)callerIDInProfile:(id)a3 error:(id *)a4
{
  id v6 = [a3 database];
  id v7 = [(HDHealthEntity *)self valueForProperty:@"caller_id" healthDatabase:v6 error:a4];

  return v7;
}

- (BOOL)updateCallerID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_class();
  uint64_t v11 = [v9 database];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__HDContributorEntity_updateCallerID_profile_error___block_invoke;
  v14[3] = &unk_1E62F2AE0;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  LOBYTE(a5) = [v10 performWriteTransactionWithHealthDatabase:v11 error:a5 block:v14];

  return (char)a5;
}

uint64_t __52__HDContributorEntity_updateCallerID_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 databaseForEntity:*(void *)(a1 + 32)];
  id v19 = 0;
  id v6 = +[HDContributorEntity _nextSyncAnchorInDatabase:error:]((uint64_t)HDContributorEntity, v5, &v19);
  id v7 = v19;
  id v8 = v7;
  if (v6)
  {
    v20[0] = @"caller_id";
    v20[1] = @"mod_date";
    v20[2] = @"sync_anchor";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    id v18 = v8;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__HDContributorEntity_updateCallerID_profile_error___block_invoke_2;
    v15[3] = &unk_1E62F3A88;
    id v10 = *(void **)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    id v17 = v6;
    uint64_t v11 = [v10 updateProperties:v9 database:v5 error:&v18 bindingHandler:v15];
    id v12 = v18;
  }
  else
  {
    id v14 = v7;
    id v9 = v14;
    if (v14)
    {
      if (a3)
      {
        id v9 = v14;
        uint64_t v11 = 0;
        *a3 = v9;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v11 = 0;
      }
      id v12 = v9;
    }
    else
    {
      id v12 = 0;
      uint64_t v11 = 0;
    }
  }

  return v11;
}

void __52__HDContributorEntity_updateCallerID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32)) {
    MEMORY[0x1C1879EC0](a2, @"caller_id");
  }
  else {
    MEMORY[0x1C1879E90](a2, @"caller_id");
  }
  double Current = CFAbsoluteTimeGetCurrent();
  MEMORY[0x1C1879E50](a2, @"mod_date", Current);
  [*(id *)(a1 + 40) longLongValue];

  JUMPOUT(0x1C1879E80);
}

- (id)modificationDateInProfile:(id)a3 error:(id *)a4
{
  id v6 = [a3 database];
  id v7 = [(HDHealthEntity *)self valueForProperty:@"mod_date" healthDatabase:v6 error:a4];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 doubleValue];
    id v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)syncAnchorInProfile:(id)a3 error:(id *)a4
{
  id v6 = [a3 database];
  id v7 = [(HDHealthEntity *)self valueForProperty:@"sync_anchor" healthDatabase:v6 error:a4];

  return v7;
}

- (BOOL)deletedInProfile:(id)a3 error:(id *)a4
{
  id v6 = [a3 database];
  id v7 = [(HDHealthEntity *)self valueForProperty:@"deleted" healthDatabase:v6 error:a4];

  LOBYTE(self) = [v7 BOOLValue];
  return (char)self;
}

+ (id)noneContributorUUID
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];

  return v2;
}

uint64_t __85__HDContributorEntity__contributorReferenceForEntityMatchingPredicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = [a2 databaseForEntityClass:v5];
  id v7 = [v5 queryWithDatabase:v6 predicate:*(void *)(a1 + 32)];

  v13[0] = @"uuid";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__HDContributorEntity__contributorReferenceForEntityMatchingPredicate_profile_error___block_invoke_2;
  v11[3] = &unk_1E62F9090;
  long long v12 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = [v7 enumerateProperties:v8 error:a3 enumerationHandler:v11];

  return v9;
}

uint64_t __85__HDContributorEntity__contributorReferenceForEntityMatchingPredicate_profile_error___block_invoke_2(uint64_t a1)
{
  id v2 = HDSQLiteColumnWithNameAsUUID();
  v3 = [*(id *)(a1 + 40) noneContributorUUID];
  int v4 = [v2 isEqual:v3];

  if (v4) {
    +[HDContributorReference contributorReferenceForNoContributor];
  }
  else {
  uint64_t v5 = +[HDContributorReference contributorReferenceForOtherUserWithUUID:v2];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 0;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncAnchor
{
  return @"sync_anchor";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

@end