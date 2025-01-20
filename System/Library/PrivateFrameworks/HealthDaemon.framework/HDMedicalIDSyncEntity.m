@interface HDMedicalIDSyncEntity
+ (BOOL)_touchSyncAnchorWithProfile:(int)a3 shouldIncrement:(void *)a4 error:;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)incrementSyncAnchorWithProfile:(id)a3 error:(id *)a4;
+ (BOOL)setSyncProvenance:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)supportsSyncStore:(id)a3;
+ (BOOL)touchSyncAnchorIfNecessaryWithProfile:(id)a3 error:(id *)a4;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_codableFromMedicalID:(id)a3;
+ (id)_medicalIDFromCodable:(id)a3;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)getSyncProvencanceOfMedicalIDForProfile:(id)a3 error:(id *)a4;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (uint64_t)_getCurrentSyncAnchorWithProfile:(uint64_t)a3 error:;
@end

@implementation HDMedicalIDSyncEntity

+ (BOOL)touchSyncAnchorIfNecessaryWithProfile:(id)a3 error:(id *)a4
{
  return +[HDMedicalIDSyncEntity _touchSyncAnchorWithProfile:shouldIncrement:error:]((uint64_t)a1, a3, 0, a4);
}

+ (BOOL)_touchSyncAnchorWithProfile:(int)a3 shouldIncrement:(void *)a4 error:
{
  id v6 = a2;
  uint64_t v7 = self;
  id v15 = 0;
  uint64_t v8 = +[HDMedicalIDSyncEntity _getCurrentSyncAnchorWithProfile:error:](v7, v6, (uint64_t)&v15);
  id v9 = v15;
  if (v9)
  {
    if (a4)
    {
      BOOL v10 = 0;
      *a4 = v9;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v10 = 0;
    }
  }
  else
  {
    if (v8 == -1)
    {
      uint64_t v11 = 1;
    }
    else
    {
      if (!a3)
      {
        BOOL v10 = 1;
        goto LABEL_11;
      }
      uint64_t v11 = v8 + 1;
    }
    id v12 = v6;
    self;
    v13 = [NSNumber numberWithLongLong:v11];
    BOOL v10 = +[HDKeyValueEntity setNumber:v13 forKey:@"CurrentRevisionAnchor" domain:@"MedicalIDDomain" category:0 profile:v12 error:a4];
  }
LABEL_11:

  return v10;
}

+ (BOOL)incrementSyncAnchorWithProfile:(id)a3 error:(id *)a4
{
  return +[HDMedicalIDSyncEntity _touchSyncAnchorWithProfile:shouldIncrement:error:]((uint64_t)a1, a3, 1, a4);
}

+ (uint64_t)_getCurrentSyncAnchorWithProfile:(uint64_t)a3 error:
{
  id v4 = a2;
  self;
  v5 = +[HDKeyValueEntity numberForKey:@"CurrentRevisionAnchor" domain:@"MedicalIDDomain" category:0 profile:v4 entity:0 error:a3];

  if (v5) {
    uint64_t v6 = [v5 longLongValue];
  }
  else {
    uint64_t v6 = -1;
  }

  return v6;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:15];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  id start = (id)a4.start;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v13 medicalIDDataManager];
  id v45 = 0;
  v16 = [v15 fetchMedicalIDWithError:&v45];
  id v17 = v45;
  v18 = v17;
  if (v16 || !v17)
  {
    v41 = v14;
    uint64_t v20 = +[HDMedicalIDSyncEntity _getCurrentSyncAnchorWithProfile:error:]((uint64_t)a1, v13, (uint64_t)a7);
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x1E4F29F58];
    int64_t v40 = end;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      HDSyncAnchorRangeDescription((uint64_t)start, end);
      v24 = id v23 = v12;
      *(_DWORD *)buf = 138544130;
      id v47 = a1;
      __int16 v48 = 2112;
      v49 = v16;
      __int16 v50 = 2114;
      v51 = v24;
      __int16 v52 = 2048;
      uint64_t v53 = v20;
      _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Generate sync objects for MedicalID %@ with syncAnchorRange %{public}@ and newSyncAnchor %lld", buf, 0x2Au);

      id v12 = v23;
    }
    if (v16)
    {
      id v44 = 0;
      v25 = [a1 getSyncProvencanceOfMedicalIDForProfile:v13 error:&v44];
      id v39 = v44;
      v36 = v25;
      if (v25)
      {
        uint64_t v26 = objc_msgSend(v25, "longLongValue", v25);
      }
      else
      {
        _HKInitializeLogging();
        v27 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v47 = v39;
          _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "Error reading syncProvenance, even though medical ID exists on disk %{public}@", buf, 0xCu);
        }
        uint64_t v26 = 0;
      }
      id v38 = v12;
      v28 = objc_msgSend(v12, "excludedSyncStores", v36);
      v29 = objc_msgSend(v28, "hk_map:", &__block_literal_global_128);
      if (v20 == -1)
      {
        char v19 = 0;
      }
      else
      {
        char v19 = 1;
        if (v20 > (uint64_t)start && v20 <= v40)
        {
          uint64_t v30 = v26;
          v31 = v29;
          v32 = [NSNumber numberWithLongLong:v30];
          id v43 = v31;
          LOBYTE(v31) = [v31 containsObject:v32];

          if (v31)
          {
            char v19 = 1;
          }
          else
          {
            v33 = [MEMORY[0x1E4F1CA48] array];
            v34 = [a1 _codableFromMedicalID:v16];
            if (v34)
            {
              [v33 addObject:v34];
              char v19 = [v41 sendCodableChange:v33 resultAnchor:v20 sequence:0 done:1 error:a7];
            }
            else
            {
              char v19 = 0;
            }
          }
          v29 = v43;
        }
      }

      id v12 = v38;
    }
    else
    {
      char v19 = 1;
    }
    id v14 = v41;
  }
  else if (a7)
  {
    char v19 = 0;
    *a7 = v17;
  }
  else
  {
    _HKLogDroppedError();
    char v19 = 0;
  }

  return v19;
}

uint64_t __100__HDMedicalIDSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 syncProvenance];

  return [v2 numberWithLongLong:v3];
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [a1 getSyncProvencanceOfMedicalIDForProfile:v11 error:a6];
  id v13 = v12;
  if (v12) {
    uint64_t v14 = [v12 longLongValue];
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = [v10 excludedSyncStores];
  v16 = objc_msgSend(v15, "hk_map:", &__block_literal_global_290_1);
  id v17 = [NSNumber numberWithLongLong:v14];
  char v18 = [v16 containsObject:v17];

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = +[HDMedicalIDSyncEntity _getCurrentSyncAnchorWithProfile:error:]((uint64_t)a1, v11, (uint64_t)a6);
    if (v19 > a4 && v19 != -1) {
      a4 = v19;
    }
  }

  return a4;
}

uint64_t __81__HDMedicalIDSyncEntity_nextSyncAnchorWithSession_startSyncAnchor_profile_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 syncProvenance];

  return [v2 numberWithLongLong:v3];
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HDCodableMedicalIDData alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if ([v11 count])
  {
    uint64_t v14 = [v11 lastObject];
    if (v14)
    {
      id v15 = (void *)v14;
      uint64_t v16 = [a1 _medicalIDFromCodable:v14];
      if (v16)
      {
        id v17 = (void *)v16;
        [v13 medicalIDDataManager];
        char v18 = v27 = a7;
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "syncProvenance"));
        id v28 = 0;
        char v20 = [v18 updateMedicalIDWithSyncedData:v17 provenance:v19 error:&v28];
        id v21 = v28;

        a7 = v27;
        int64_t v22 = 0;
        if (v20) {
          goto LABEL_15;
        }
        goto LABEL_8;
      }
    }
  }
  id v21 = 0;
LABEL_8:
  id v23 = [v12 profile];
  uint64_t v24 = +[HDMedicalIDSyncEntity _getCurrentSyncAnchorWithProfile:error:]((uint64_t)a1, v23, 0);

  _HKInitializeLogging();
  v25 = *MEMORY[0x1E4F29F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v30 = a1;
    __int16 v31 = 2048;
    uint64_t v32 = v24;
    __int16 v33 = 2114;
    id v34 = v21;
    _os_log_fault_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_FAULT, "%{public}@ Failed to save MedicalID with ignorable failure, SyncAnchor: %lld, Error: %{public}@, ", buf, 0x20u);
  }
  id v21 = v21;
  if (v21)
  {
    if (a7) {
      *a7 = v21;
    }
    else {
      _HKLogDroppedError();
    }
  }

  int64_t v22 = 1;
LABEL_15:

  return v22;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  unint64_t v3 = [a3 syncStoreType];
  return (v3 < 6) & (0x22u >> v3);
}

+ (id)_codableFromMedicalID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  unint64_t v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
  id v4 = v8;
  if (v3)
  {
    v5 = objc_alloc_init(HDCodableMedicalIDData);
    [(HDCodableMedicalIDData *)v5 setMedicalIDBytes:v3];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to encode codable medical ID: %{public}@", buf, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

+ (id)_medicalIDFromCodable:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a3 medicalIDBytes];
  id v8 = 0;
  id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to decode codable medical ID: %{public}@", buf, 0xCu);
    }
  }

  return v4;
}

+ (id)getSyncProvencanceOfMedicalIDForProfile:(id)a3 error:(id *)a4
{
  return +[HDKeyValueEntity numberForKey:@"CurrentMedicalIDSyncProvenance" domain:@"MedicalIDDomain" category:0 profile:a3 entity:0 error:a4];
}

+ (BOOL)setSyncProvenance:(id)a3 profile:(id)a4 error:(id *)a5
{
  return +[HDKeyValueEntity setNumber:a3 forKey:@"CurrentMedicalIDSyncProvenance" domain:@"MedicalIDDomain" category:0 profile:a4 error:a5];
}

@end