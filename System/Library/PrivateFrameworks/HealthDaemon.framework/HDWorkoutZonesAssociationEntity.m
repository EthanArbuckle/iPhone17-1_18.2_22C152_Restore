@interface HDWorkoutZonesAssociationEntity
+ (BOOL)_wasDeletedObjectWithUUID:(void *)a3 transaction:(uint64_t)a4 error:;
+ (BOOL)associateSyncedZonesSamplesWithUUIDs:(id)a3 withWorkoutUUID:(id)a4 syncIdentity:(id)a5 syncProvenance:(int64_t)a6 transaction:(id)a7 error:(id *)a8;
+ (BOOL)associateZonesSamplesWithUUIDs:(id)a3 withWorkoutUUID:(id)a4 transaction:(id)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)enumerateZonesSamplesWithWorkoutPersistentID:(unint64_t)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 handler:(id)a7;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
+ (uint64_t)_insertAssociationsForZonesSamplesWithUUIDs:(void *)a3 withWorkoutUUID:(uint64_t)a4 syncProvenance:(uint64_t)a5 syncIdentity:(int)a6 ignoreDeletedObjects:(void *)a7 transaction:(void *)a8 error:;
- (id)_dataObjectUUIDWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:;
- (id)workoutUUIDWithTransaction:(id)a3 error:(id *)a4;
- (id)zonesUUIDWithTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDWorkoutZonesAssociationEntity

+ (id)databaseTable
{
  return @"workout_zones_associations";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_30;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"workout_id";
  v4[1] = @"zones_sample_id";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)foreignKeys
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"workout_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[1] = @"zones_sample_id";
  v7[0] = v2;
  v3 = +[HDDataEntity defaultForeignKey];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (BOOL)associateZonesSamplesWithUUIDs:(id)a3 withWorkoutUUID:(id)a4 transaction:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  LOBYTE(a7) = +[HDWorkoutZonesAssociationEntity _insertAssociationsForZonesSamplesWithUUIDs:withWorkoutUUID:syncProvenance:syncIdentity:ignoreDeletedObjects:transaction:error:]((uint64_t)a1, v14, v13, 0, [a6 currentSyncIdentityPersistentID], 0, v12, a7);

  return (char)a7;
}

+ (uint64_t)_insertAssociationsForZonesSamplesWithUUIDs:(void *)a3 withWorkoutUUID:(uint64_t)a4 syncProvenance:(uint64_t)a5 syncIdentity:(int)a6 ignoreDeletedObjects:(void *)a7 transaction:(void *)a8 error:
{
  v44[4] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = self;
  v15 = [v13 databaseForEntityClass:v14];
  v44[0] = @"workout_id";
  v44[1] = @"zones_sample_id";
  v44[2] = @"sync_provenance";
  v44[3] = @"sync_identity";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  v17 = HDDataEntityPredicateForDataUUID();
  id v41 = 0;
  v18 = +[HDDataEntity anyInDatabase:v15 predicate:v17 error:&v41];
  id v19 = v41;

  if (v18)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __162__HDWorkoutZonesAssociationEntity__insertAssociationsForZonesSamplesWithUUIDs_withWorkoutUUID_syncProvenance_syncIdentity_ignoreDeletedObjects_transaction_error___block_invoke;
    v30[3] = &unk_1E62FBA78;
    char v39 = a6;
    id v31 = v15;
    uint64_t v36 = v14;
    id v32 = v13;
    id v33 = v12;
    id v34 = v16;
    id v35 = v18;
    uint64_t v37 = a4;
    uint64_t v38 = a5;
    uint64_t v20 = objc_msgSend(v11, "hk_enumerateUUIDsWithError:block:", a8, v30);

    goto LABEL_16;
  }
  if (!v19)
  {
    if (a6)
    {
      id v40 = 0;
      BOOL v21 = +[HDWorkoutZonesAssociationEntity _wasDeletedObjectWithUUID:transaction:error:](v14, v12, v13, (uint64_t)&v40);
      id v19 = v40;
      if (v21)
      {
        _HKInitializeLogging();
        v22 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v43 = v12;
          _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "Not inserting zones associations since workout %{public}@ was previously deleted", buf, 0xCu);
        }
        goto LABEL_13;
      }
    }
  }
  if (v19)
  {
    id v19 = v19;
  }
  else
  {
    v23 = (void *)MEMORY[0x1E4F28C58];
    v24 = [v12 UUIDString];
    v25 = objc_msgSend(v23, "hk_error:format:", 118, @"Workout %@ does not exist when associating zones", v24);

    id v19 = v25;
    if (!v19)
    {
LABEL_13:
      uint64_t v20 = 1;
      goto LABEL_16;
    }
  }
  if (a8) {
    *a8 = v19;
  }
  else {
    _HKLogDroppedError();
  }

  uint64_t v20 = 0;
LABEL_16:

  return v20;
}

+ (BOOL)associateSyncedZonesSamplesWithUUIDs:(id)a3 withWorkoutUUID:(id)a4 syncIdentity:(id)a5 syncProvenance:(int64_t)a6 transaction:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  v17 = +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:a5 transaction:v16 error:a8];
  v18 = v17;
  if (v17)
  {
    id v19 = [v17 entity];
    char v20 = +[HDWorkoutZonesAssociationEntity _insertAssociationsForZonesSamplesWithUUIDs:withWorkoutUUID:syncProvenance:syncIdentity:ignoreDeletedObjects:transaction:error:]((uint64_t)a1, v14, v15, a6, [v19 persistentID], 1, v16, a8);
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

+ (BOOL)enumerateZonesSamplesWithWorkoutPersistentID:(unint64_t)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 handler:(id)a7
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  id v14 = (void *)MEMORY[0x1E4F65D00];
  id v15 = NSNumber;
  id v16 = a5;
  v17 = [v15 numberWithUnsignedLongLong:a3];
  v18 = [v14 predicateWithProperty:@"workout_id" equalToValue:v17];

  id v19 = [v16 databaseForEntityClass:a1];

  char v20 = [a1 queryWithDatabase:v19 predicate:v18];
  v28[0] = @"zones_sample_id";
  BOOL v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __114__HDWorkoutZonesAssociationEntity_enumerateZonesSamplesWithWorkoutPersistentID_profile_transaction_error_handler___block_invoke;
  v25[3] = &unk_1E62FBA28;
  id v26 = v12;
  id v27 = v13;
  id v22 = v13;
  id v23 = v12;
  LOBYTE(a6) = [v20 enumerateProperties:v21 error:a6 enumerationHandler:v25];

  return (char)a6;
}

uint64_t __114__HDWorkoutZonesAssociationEntity_enumerateZonesSamplesWithWorkoutPersistentID_profile_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6 = [NSNumber numberWithUnsignedLongLong:HDSQLiteColumnWithNameAsInt64()];
  v7 = +[HDDataEntity objectWithID:v6 encodingOptions:0 profile:*(void *)(a1 + 32) error:a4];

  if (v7) {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)workoutUUIDWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDHealthEntity *)self numberForProperty:@"workout_id" transaction:v6 error:a4];
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    v9 = HDDataEntityPredicateForRowID(v7, 1);
    v10 = -[HDWorkoutZonesAssociationEntity _dataObjectUUIDWithPredicate:transaction:error:]((uint64_t)self, v9, v6, (uint64_t)a4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_dataObjectUUIDWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:
{
  if (a1)
  {
    id v6 = a3;
    id v7 = a2;
    uint64_t v8 = [v6 databaseForEntityClass:objc_opt_class()];

    v9 = +[HDSQLiteEntity propertyValueForAnyInDatabase:v8 property:@"uuid" predicate:v7 error:a4];

    v10 = _HDUUIDForSQLiteValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)zonesUUIDWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDHealthEntity *)self numberForProperty:@"zones_sample_id" transaction:v6 error:a4];
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    v9 = HDDataEntityPredicateForRowID(v7, 1);
    v10 = -[HDWorkoutZonesAssociationEntity _dataObjectUUIDWithPredicate:transaction:error:]((uint64_t)self, v9, v6, (uint64_t)a4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_wasDeletedObjectWithUUID:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  self;
  uint64_t v8 = +[HDDeletedObjectEntity deletedObjectEntityWithUUID:v7 transaction:v6 error:a4];

  return v8 != 0;
}

BOOL __162__HDWorkoutZonesAssociationEntity__insertAssociationsForZonesSamplesWithUUIDs_withWorkoutUUID_syncProvenance_syncIdentity_ignoreDeletedObjects_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = HDDataEntityPredicateForDataUUID();
  id v31 = 0;
  v9 = +[HDDataEntity anyInDatabase:v7 predicate:v8 error:&v31];
  id v10 = v31;

  if (v9)
  {
    id v11 = *(void **)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 56);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __162__HDWorkoutZonesAssociationEntity__insertAssociationsForZonesSamplesWithUUIDs_withWorkoutUUID_syncProvenance_syncIdentity_ignoreDeletedObjects_transaction_error___block_invoke_320;
    v26[3] = &unk_1E62FBA50;
    id v27 = v9;
    id v28 = *(id *)(a1 + 64);
    long long v29 = *(_OWORD *)(a1 + 80);
    id v14 = [v11 insertOrReplaceEntity:0 database:v12 properties:v13 error:a4 bindingHandler:v26];
    BOOL v15 = v14 != 0;

    goto LABEL_13;
  }
  if (v10) {
    goto LABEL_4;
  }
  if (!*(unsigned char *)(a1 + 96)) {
    goto LABEL_15;
  }
  uint64_t v16 = *(void *)(a1 + 72);
  v17 = *(void **)(a1 + 40);
  id v30 = 0;
  BOOL v18 = +[HDWorkoutZonesAssociationEntity _wasDeletedObjectWithUUID:transaction:error:](v16, v6, v17, (uint64_t)&v30);
  id v19 = v30;
  id v10 = v19;
  if (v18)
  {
    _HKInitializeLogging();
    char v20 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v6;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "Not inserting zones associations since zones sample %{public}@ was previously deleted", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (!v19)
  {
LABEL_15:
    id v22 = (void *)MEMORY[0x1E4F28C58];
    id v23 = [v6 UUIDString];
    v24 = [*(id *)(a1 + 48) UUIDString];
    v25 = objc_msgSend(v22, "hk_error:format:", 118, @"Zones sample %@ does not exist when associating with workout %@", v23, v24);

    id v10 = v25;
    if (v10) {
      goto LABEL_5;
    }
LABEL_16:
    BOOL v15 = 1;
    goto LABEL_13;
  }
LABEL_4:
  id v10 = v10;
LABEL_5:
  if (a4) {
    *a4 = v10;
  }
  else {
    _HKLogDroppedError();
  }

  BOOL v15 = 0;
LABEL_13:

  return v15;
}

void __162__HDWorkoutZonesAssociationEntity__insertAssociationsForZonesSamplesWithUUIDs_withWorkoutUUID_syncProvenance_syncIdentity_ignoreDeletedObjects_transaction_error___block_invoke_320(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"zones_sample_id", [*(id *)(a1 + 32) persistentID]);
  MEMORY[0x1C1879E80](a2, @"workout_id", [*(id *)(a1 + 40) persistentID]);
  MEMORY[0x1C1879E80](a2, @"sync_provenance", *(void *)(a1 + 48));

  JUMPOUT(0x1C1879E80);
}

@end