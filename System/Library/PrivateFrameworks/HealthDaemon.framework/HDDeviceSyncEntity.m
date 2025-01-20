@interface HDDeviceSyncEntity
+ (BOOL)_syncCodableDevice:(id *)a3 fromRow:(HDSQLiteRow *)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)excludedSyncStoresForSession:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int)nanoSyncObjectType;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
@end

@implementation HDDeviceSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 12;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:13];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  id v12 = a3;
  id v13 = a5;
  id v24 = a6;
  v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = +[HDDeviceEntity _propertiesForDevice];
  v16 = [v13 database];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = -1;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __97__HDDeviceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v25[3] = &unk_1E6305DE8;
  id v17 = v15;
  id v26 = v17;
  id v18 = v12;
  int64_t v32 = start;
  int64_t v33 = end;
  id v27 = v18;
  v31 = &v34;
  id v19 = v16;
  id v28 = v19;
  id v20 = v13;
  id v29 = v20;
  id v21 = v14;
  id v30 = v21;
  if (+[HDHealthEntity performReadTransactionWithHealthDatabase:v19 error:a7 block:v25])
  {
    char v22 = [v24 sendCodableChange:v21 resultAnchor:v35[3] sequence:0 done:1 error:a7];
  }
  else
  {
    char v22 = 0;
  }

  _Block_object_dispose(&v34, 8);
  return v22;
}

BOOL __97__HDDeviceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8) + 24;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__HDDeviceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v15[3] = &unk_1E62F6FD0;
  uint64_t v9 = *(void *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = v5;
  id v18 = *(id *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 88);
  id v12 = v5;
  BOOL v13 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDDeviceEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, 0, v7, v11, v10, 0, v8, v9, a3, v15);

  return v13;
}

BOOL __97__HDDeviceSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v14 = 0;
  BOOL v9 = +[HDDeviceSyncEntity _syncCodableDevice:&v14 fromRow:a4 profile:*(void *)(a1 + 32) transaction:*(void *)(a1 + 40) error:a8];
  id v10 = v14;
  uint64_t v11 = v10;
  if (v9 && v10 != 0) {
    [*(id *)(a1 + 48) addObject:v10];
  }

  return v9;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [a5 database];
  int64_t v11 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v9 healthDatabase:v10 error:a6];

  return v11;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  v4 = [[HDCodableDevice alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a3;
  LODWORD(a7) = +[HDDeviceEntity insertCodableDevices:syncProvenance:profile:error:](HDDeviceEntity, "insertCodableDevices:syncProvenance:profile:error:", v11, [a5 syncProvenance], v10, a7);

  return a7 ^ 1;
}

+ (id)excludedSyncStoresForSession:(id)a3
{
  id v3 = a3;
  v4 = [v3 syncStore];
  uint64_t v5 = [v4 syncStoreType];

  if ((unint64_t)(v5 - 3) >= 3 && v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    uint64_t v6 = [v3 excludedSyncStores];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

+ (BOOL)_syncCodableDevice:(id *)a3 fromRow:(HDSQLiteRow *)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  BOOL v13 = +[HDDeviceEntity _codableDeviceWithRow:a4];
  uint64_t v14 = HDSQLiteColumnWithNameAsInt64();
  v15 = [v12 syncIdentityManager];

  id v22 = 0;
  id v16 = [v15 identityForEntityID:v14 transaction:v11 error:&v22];

  id v17 = v22;
  if (v16)
  {
    id v18 = [v16 identity];
    id v19 = [v18 codableSyncIdentity];
    [v13 setSyncIdentity:v19];

    if (a3) {
      *a3 = v13;
    }
  }
  else
  {
    id v20 = v17;
    if (v20)
    {
      if (a7) {
        *a7 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v16 != 0;
}

@end