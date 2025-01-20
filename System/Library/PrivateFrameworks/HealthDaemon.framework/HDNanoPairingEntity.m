@interface HDNanoPairingEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_nanoPairingEntitiesWithPredicate:(void *)a3 database:(uint64_t)a4 error:;
+ (id)_predicateWithRegistryUUID:(uint64_t)a1;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)nanoPairingEntityWithRegistryUUID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)nanoPairingEntityWithRegistryUUID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)sourceEntityForRegistryUUID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
- (BOOL)isRestoreComplete;
- (BOOL)saveWithHealthDatabase:(id)a3 error:(id *)a4;
- (NSString)defaultSourceBundleIdentifier;
- (NSString)deviceIdentifier;
- (NSUUID)healthDatabaseUUID;
- (NSUUID)nanoRegistryUUID;
- (NSUUID)persistentUUID;
- (id)description;
- (id)resetProvenanceForProfile:(id)a3 error:(id *)a4;
- (int64_t)syncProvenance;
- (void)setDefaultSourceBundleIdentifier:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setHealthDatabaseUUID:(id)a3;
- (void)setPersistentUUID:(id)a3;
- (void)setRestoreComplete:(BOOL)a3;
@end

@implementation HDNanoPairingEntity

- (NSString)defaultSourceBundleIdentifier
{
  return self->_defaultSourceBundleIdentifier;
}

- (NSUUID)nanoRegistryUUID
{
  return self->_nanoRegistryUUID;
}

+ (int64_t)protectionClass
{
  return 1;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (NSUUID)persistentUUID
{
  return self->_persistentUUID;
}

+ (id)nanoPairingEntityWithRegistryUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HDNanoPairingEntity.m", 98, @"Invalid parameter not satisfying: %@", @"nanoRegistryUUID != nil" object file lineNumber description];
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__81;
  v28 = __Block_byref_object_dispose__81;
  id v29 = 0;
  v11 = [v10 database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__HDNanoPairingEntity_nanoPairingEntityWithRegistryUUID_profile_error___block_invoke;
  v19[3] = &unk_1E62FC0B8;
  id v23 = a1;
  id v12 = v9;
  id v20 = v12;
  v22 = &v24;
  id v13 = v10;
  id v21 = v13;
  int v14 = [a1 performWriteTransactionWithHealthDatabase:v11 error:a5 block:v19];

  if (v14) {
    v15 = (void *)v25[5];
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  _Block_object_dispose(&v24, 8);

  return v16;
}

BOOL __71__HDNanoPairingEntity_nanoPairingEntityWithRegistryUUID_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v52[7] = *MEMORY[0x1E4F143B8];
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  v6 = +[HDNanoPairingEntity _predicateWithRegistryUUID:](*(void *)(a1 + 56), *(void **)(a1 + 32));
  v7 = +[HDNanoPairingEntity _nanoPairingEntitiesWithPredicate:database:error:](*(void *)(a1 + 56), v6, v5, a3);
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 firstObject];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v12)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = [*(id *)(a1 + 40) database];
      v15 = +[HDSyncStoreEntity syncStoreEntityWithUUID:v13 type:1 healthDatabase:v14 error:a3];

      if (v15)
      {
        id v16 = [HDNanoPairingEntity alloc];
        id v17 = *(id *)(a1 + 32);
        id v18 = v15;
        id v19 = v5;
        id v20 = v19;
        v44 = v17;
        v45 = v18;
        if (v16)
        {
          v42 = v15;
          id v43 = v19;
          if (!v17)
          {
            v41 = [MEMORY[0x1E4F28B00] currentHandler];
            id v17 = 0;
            [v41 handleFailureInMethod:sel__initWithNanoRegistryUUID_persistentUUID_healthDatabaseUUID_sourceBundleIdentifier_deviceIdentifier_syncStoreEntity_restoreComplete_database_error_, v16, @"HDNanoPairingEntity.m", 55, @"Invalid parameter not satisfying: %@", @"nanoRegistryUUID != nil" object file lineNumber description];

            id v18 = v45;
          }
          v52[0] = @"registry_uuid";
          v52[1] = @"persistent_uuid";
          v52[2] = @"health_uuid";
          v52[3] = @"source_bundle_id";
          v52[4] = @"ids_id";
          v52[5] = @"sync_provenance";
          v52[6] = @"restored";
          id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:7];
          uint64_t v22 = objc_opt_class();
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __170__HDNanoPairingEntity__initWithNanoRegistryUUID_persistentUUID_healthDatabaseUUID_sourceBundleIdentifier_deviceIdentifier_syncStoreEntity_restoreComplete_database_error___block_invoke;
          v46[3] = &unk_1E62FE950;
          id v23 = v17;
          id v47 = v23;
          long long v48 = 0u;
          long long v49 = 0u;
          id v24 = v18;
          id v50 = v24;
          char v51 = 0;
          v25 = (void *)v22;
          id v20 = v43;
          uint64_t v26 = [v25 insertOrReplaceEntity:0 database:v43 properties:v21 error:a3 bindingHandler:v46];

          if (v26)
          {
            uint64_t v27 = [v23 copy];
            v28 = *(void **)(v26 + 24);
            *(void *)(v26 + 24) = v27;

            uint64_t v29 = [0 copy];
            v30 = *(void **)(v26 + 32);
            *(void *)(v26 + 32) = v29;

            uint64_t v31 = [0 copy];
            v32 = *(void **)(v26 + 40);
            *(void *)(v26 + 40) = v31;

            uint64_t v33 = [0 copy];
            v34 = *(void **)(v26 + 48);
            *(void *)(v26 + 48) = v33;

            uint64_t v35 = [0 copy];
            v36 = *(void **)(v26 + 56);
            *(void *)(v26 + 56) = v35;

            *(void *)(v26 + 64) = [v24 persistentID];
            *(unsigned char *)(v26 + 16) = 0;
          }
          id v16 = (HDNanoPairingEntity *)(id)v26;

          v15 = v42;
        }

        uint64_t v37 = *(void *)(*(void *)(a1 + 48) + 8);
        v38 = *(void **)(v37 + 40);
        *(void *)(v37 + 40) = v16;
      }
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    BOOL v39 = v12 != 0;
  }
  else
  {
    BOOL v39 = 0;
  }

  return v39;
}

+ (id)_predicateWithRegistryUUID:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = (void *)MEMORY[0x1E4F65D00];
  v4 = objc_msgSend(v2, "hk_dataForUUIDBytes");

  v5 = [v3 predicateWithProperty:@"registry_uuid" equalToValue:v4];

  return v5;
}

+ (id)_nanoPairingEntitiesWithPredicate:(void *)a3 database:(uint64_t)a4 error:
{
  v18[7] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a2;
  v8 = self;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18[0] = @"registry_uuid";
  v18[1] = @"persistent_uuid";
  v18[2] = @"health_uuid";
  v18[3] = @"source_bundle_id";
  v18[4] = @"ids_id";
  v18[5] = @"sync_provenance";
  v18[6] = @"restored";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:7];
  v11 = [v8 queryWithDatabase:v6 predicate:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__HDNanoPairingEntity__nanoPairingEntitiesWithPredicate_database_error___block_invoke;
  v16[3] = &unk_1E62F4CC0;
  id v17 = v9;
  id v12 = v9;
  if ([v11 enumeratePersistentIDsAndProperties:v10 error:a4 enumerationHandler:v16]) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  return v14;
}

+ (id)databaseTable
{
  return @"nano_pairing";
}

uint64_t __72__HDNanoPairingEntity__nanoPairingEntitiesWithPredicate_database_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [(HDSQLiteEntity *)[HDNanoPairingEntity alloc] initWithPersistentID:a2];
  v8 = MEMORY[0x1C1879F90](a4, 0);
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v7, v8, 24);
  }

  id v9 = MEMORY[0x1C1879F90](a4, 1);
  [(HDNanoPairingEntity *)v6 setPersistentUUID:v9];

  uint64_t v10 = MEMORY[0x1C1879F90](a4, 2);
  [(HDNanoPairingEntity *)v6 setHealthDatabaseUUID:v10];

  v11 = MEMORY[0x1C1879F80](a4, 3);
  [(HDNanoPairingEntity *)v6 setDefaultSourceBundleIdentifier:v11];

  id v12 = MEMORY[0x1C1879F80](a4, 4);
  [(HDNanoPairingEntity *)v6 setDeviceIdentifier:v12];

  uint64_t v13 = HDSQLiteColumnAsInt64();
  if (v6) {
    v6->_syncProvenance = v13;
  }
  [(HDNanoPairingEntity *)v6 setRestoreComplete:MEMORY[0x1C1879F00](a4, 6)];
  [*(id *)(a1 + 32) addObject:v6];

  return 1;
}

- (void)setPersistentUUID:(id)a3
{
}

- (void)setDefaultSourceBundleIdentifier:(id)a3
{
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (void)setRestoreComplete:(BOOL)a3
{
  self->_restoreComplete = a3;
}

- (BOOL)isRestoreComplete
{
  return self->_restoreComplete;
}

void __170__HDNanoPairingEntity__initWithNanoRegistryUUID_persistentUUID_healthDatabaseUUID_sourceBundleIdentifier_deviceIdentifier_syncStoreEntity_restoreComplete_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"registry_uuid", *(void *)(a1 + 32));
  MEMORY[0x1C1879EF0](a2, @"persistent_uuid", *(void *)(a1 + 40));
  MEMORY[0x1C1879EF0](a2, @"health_uuid", *(void *)(a1 + 48));
  MEMORY[0x1C1879EC0](a2, @"source_bundle_id", *(void *)(a1 + 56));
  MEMORY[0x1C1879EC0](a2, @"ids_id", *(void *)(a1 + 64));
  MEMORY[0x1C1879E80](a2, @"sync_provenance", [*(id *)(a1 + 72) persistentID]);

  JUMPOUT(0x1C1879E20);
}

+ (id)nanoPairingEntityWithRegistryUUID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[HDNanoPairingEntity _predicateWithRegistryUUID:]((uint64_t)a1, a3);
  uint64_t v10 = +[HDNanoPairingEntity _nanoPairingEntitiesWithPredicate:database:error:]((uint64_t)a1, v9, v8, (uint64_t)a5);

  v11 = [v10 firstObject];

  return v11;
}

+ (id)sourceEntityForRegistryUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HDNanoPairingEntity.m", 187, @"Invalid parameter not satisfying: %@", @"registryUUID != nil" object file lineNumber description];
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__81;
  v28 = __Block_byref_object_dispose__81;
  id v29 = 0;
  v11 = [v10 database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__HDNanoPairingEntity_sourceEntityForRegistryUUID_profile_error___block_invoke;
  v19[3] = &unk_1E62FC0B8;
  id v23 = a1;
  id v12 = v9;
  id v20 = v12;
  uint64_t v22 = &v24;
  id v13 = v10;
  id v21 = v13;
  int v14 = [a1 performReadTransactionWithHealthDatabase:v11 error:a5 block:v19];

  if (v14) {
    v15 = (void *)v25[5];
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  _Block_object_dispose(&v24, 8);

  return v16;
}

BOOL __65__HDNanoPairingEntity_sourceEntityForRegistryUUID_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 56)];
  id v6 = +[HDNanoPairingEntity _predicateWithRegistryUUID:](*(void *)(a1 + 56), *(void **)(a1 + 32));
  id v7 = [*(id *)(a1 + 56) propertyValueForAnyInDatabase:v5 property:@"source_bundle_id" predicate:v6 error:a3];
  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) sourceManager];
    uint64_t v9 = [v8 localSourceForBundleIdentifier:v7 error:a3];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    id v8 = [*(id *)(a1 + 32) UUIDString];
    objc_msgSend(v12, "hk_assignError:code:format:", a3, 100, @"missing source bundle identifier for registry UUID %@", v8);
  }

  BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v13;
}

- (BOOL)saveWithHealthDatabase:(id)a3 error:(id *)a4
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"persistent_uuid";
  v11[1] = @"health_uuid";
  v11[2] = @"source_bundle_id";
  v11[3] = @"ids_id";
  v11[4] = @"sync_provenance";
  v11[5] = @"restored";
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  id v8 = [v6 arrayWithObjects:v11 count:6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HDNanoPairingEntity_saveWithHealthDatabase_error___block_invoke;
  v10[3] = &unk_1E62F35C8;
  v10[4] = self;
  LOBYTE(a4) = [(HDHealthEntity *)self updateProperties:v8 healthDatabase:v7 error:a4 bindingHandler:v10];

  return (char)a4;
}

void __52__HDNanoPairingEntity_saveWithHealthDatabase_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"persistent_uuid", *(void *)(*(void *)(a1 + 32) + 32));
  MEMORY[0x1C1879EF0](a2, @"health_uuid", *(void *)(*(void *)(a1 + 32) + 40));
  MEMORY[0x1C1879EC0](a2, @"source_bundle_id", *(void *)(*(void *)(a1 + 32) + 48));
  MEMORY[0x1C1879EC0](a2, @"ids_id", *(void *)(*(void *)(a1 + 32) + 56));
  MEMORY[0x1C1879E80](a2, @"sync_provenance", *(void *)(*(void *)(a1 + 32) + 64));

  JUMPOUT(0x1C1879E20);
}

- (id)resetProvenanceForProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__81;
  id v19 = __Block_byref_object_dispose__81;
  id v20 = 0;
  id v7 = [v6 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HDNanoPairingEntity_resetProvenanceForProfile_error___block_invoke;
  v12[3] = &unk_1E62F5CB0;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  int v14 = &v15;
  LODWORD(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:a4 block:v12];

  if (a4) {
    uint64_t v9 = (void *)v16[5];
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __55__HDNanoPairingEntity_resetProvenanceForProfile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = +[HDSyncStoreEntity recreateSyncStoreWithUUID:*(void *)(*(void *)(a1 + 32) + 24) type:1 profile:*(void *)(a1 + 40) error:a3];
  if (v5
    && (+[HDNanoPairingEntity nanoPairingEntityWithRegistryUUID:*(void *)(*(void *)(a1 + 32) + 24) profile:*(void *)(a1 + 40) error:a3], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v7 = *(void *)(*(void *)(a1 + 48) + 8), v8 = *(void **)(v7 + 40), *(void *)(v7 + 40) = v6, v8, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)))
  {
    uint64_t v9 = [*(id *)(a1 + 32) persistentUUID];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPersistentUUID:v9];

    id v10 = [*(id *)(a1 + 32) healthDatabaseUUID];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setHealthDatabaseUUID:v10];

    v11 = [*(id *)(a1 + 32) defaultSourceBundleIdentifier];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDefaultSourceBundleIdentifier:v11];

    id v12 = [*(id *)(a1 + 32) deviceIdentifier];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDeviceIdentifier:v12];

    uint64_t v13 = [v5 persistentID];
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v14) {
      *(void *)(v14 + 64) = v13;
    }
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setRestoreComplete:", objc_msgSend(*(id *)(a1 + 32), "isRestoreComplete"));
    uint64_t v15 = *(void **)(a1 + 40);
    id v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v17 = [v15 database];
    uint64_t v18 = [v16 saveWithHealthDatabase:v17 error:a3];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_45;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"sync_provenance";
  id v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSUUID *)self->_nanoRegistryUUID UUIDString];
  uint64_t v6 = [(NSUUID *)self->_persistentUUID UUIDString];
  uint64_t v7 = [(NSUUID *)self->_healthDatabaseUUID UUIDString];
  id v8 = [v3 stringWithFormat:@"<%@:%p registry:%@ persistent:%@ health:%@ device:%@>", v4, self, v5, v6, v7, self->_deviceIdentifier, 0];

  return v8;
}

- (NSUUID)healthDatabaseUUID
{
  return self->_healthDatabaseUUID;
}

- (void)setHealthDatabaseUUID:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultSourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_healthDatabaseUUID, 0);
  objc_storeStrong((id *)&self->_persistentUUID, 0);

  objc_storeStrong((id *)&self->_nanoRegistryUUID, 0);
}

@end