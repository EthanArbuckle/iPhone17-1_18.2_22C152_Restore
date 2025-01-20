@interface HDOntologyMercuryZipTSVImporter
+ (BOOL)canImportEntry:(id)a3;
+ (BOOL)importOntologyShardEntry:(id)a3 shardRegistry:(id)a4 error:(id *)a5;
+ (id)pruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6;
+ (id)willPruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6;
+ (int64_t)purgeSpaceForUrgency:(int)a3 shardRegistry:(id)a4;
+ (int64_t)purgeableSpaceForUrgency:(int)a3 shardRegistry:(id)a4;
- (HDOntologyMercuryZipTSVImporter)init;
@end

@implementation HDOntologyMercuryZipTSVImporter

- (HDOntologyMercuryZipTSVImporter)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)canImportEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 schemaType];
  v6 = (void *)*MEMORY[0x1E4F2A2F8];
  if (v5 != (void *)*MEMORY[0x1E4F2A2F8])
  {
    if (!v6)
    {
      BOOL v7 = 0;
      goto LABEL_8;
    }
    v3 = [v4 schemaType];
    if (![v3 isEqualToString:v6])
    {
      BOOL v7 = 0;
LABEL_6:

      goto LABEL_8;
    }
  }
  uint64_t v8 = [v4 schemaVersion];
  v9 = [v4 identifier];
  BOOL v7 = v8 == HKCurrentSchemaVersionForShardIdentifier();

  if (v5 != v6) {
    goto LABEL_6;
  }
LABEL_8:

  return v7;
}

+ (BOOL)importOntologyShardEntry:(id)a3 shardRegistry:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 openShardFileForEntry:v8 error:a5];
  if (v10)
  {
    v11 = [v9 updateCoordinator];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __80__HDOntologyMercuryZipTSVImporter_importOntologyShardEntry_shardRegistry_error___block_invoke;
    v19 = &unk_1E6303D58;
    id v23 = a1;
    id v20 = v8;
    id v12 = v10;
    id v21 = v12;
    id v22 = v11;
    id v13 = v11;
    char v14 = [v13 performOntologyTransactionForWrite:1 databaseTransaction:0 error:a5 transactionHandler:&v16];
    objc_msgSend(v12, "closeFile", v16, v17, v18, v19);
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

uint64_t __80__HDOntologyMercuryZipTSVImporter_importOntologyShardEntry_shardRegistry_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v7 = v5;
  id v8 = a2;
  id v9 = v4;
  self;
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = self;
  uint64_t v13 = [v10 slot];
  if (v13 == *MEMORY[0x1E4F2A2E0])
  {
    id v36 = 0;
    char v14 = +[HDOntologyShardRegistry nextAvailableMercuryZipTSVSlotWithTransaction:v11 error:&v36];
    id v15 = v36;
    uint64_t v16 = v15;
    if (v14)
    {
      uint64_t v17 = objc_msgSend(v10, "copyWithSlot:", objc_msgSend(v14, "integerValue"));
    }
    else
    {
      if (objc_msgSend(v15, "hk_isObjectNotFoundError"))
      {
        _HKInitializeLogging();
        v18 = HKLogHealthOntology();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v10;
          *(_WORD *)&buf[22] = 2114;
          v47 = v16;
          _os_log_fault_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_FAULT, "%{public}@: Error assigning a slot to %{public}@: %{public}@", buf, 0x20u);
        }
      }
      id v19 = v16;
      id v20 = v19;
      if (v19)
      {
        if (a3) {
          *a3 = v19;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = (uint64_t)v10;
  }

  if (!v17)
  {
    id v27 = 0;
    goto LABEL_28;
  }
  id v21 = v6;
  id v34 = (id)v17;
  id v33 = v7;
  id v22 = v11;
  uint64_t v23 = self;
  v54[0] = @"nodes";
  v54[1] = @"attributes";
  v54[2] = @"relationships";
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F2B9C8]) initWithFileHandle:v21];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 1;
  id v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__122;
  v40 = __Block_byref_object_dispose__122;
  id v41 = 0;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __104__HDOntologyMercuryZipTSVImporter__importShardWithFileHandle_entry_updateCoordinator_transaction_error___block_invoke;
  v47 = &unk_1E6303DA0;
  id v26 = v24;
  uint64_t v53 = v23;
  id v48 = v26;
  v51 = &v42;
  id v27 = v34;
  id v49 = v27;
  id v28 = v22;
  id v50 = v28;
  v52 = &v36;
  if ([v25 enumerateEntriesWithError:a3 block:buf])
  {
    if (*((unsigned char *)v43 + 24))
    {
      uint64_t v17 = 1;
      goto LABEL_26;
    }
    id v29 = v37[5];
    v30 = v29;
    if (v29)
    {
      if (a3) {
        *a3 = v29;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  uint64_t v17 = 0;
LABEL_26:

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  if (v17)
  {
    uint64_t v31 = [v27 copyWithAvailableStateImported];

    uint64_t v17 = +[HDOntologyShardRegistry insertEntry:v31 transaction:v28 error:a3];
    id v27 = (id)v31;
  }
LABEL_28:

  return v17;
}

+ (id)willPruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a3, "hk_filter:", &__block_literal_global_143, a4, a5, a6);
}

uint64_t __80__HDOntologyMercuryZipTSVImporter_willPruneEntries_options_shardRegistry_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 schemaType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F2A2F8]];

  return v3;
}

+ (id)pruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [HDOntologyMercuryZipTSVPruner alloc];
  char v14 = [v12 updateCoordinator];

  id v15 = [(HDOntologyMercuryZipTSVPruner *)v13 initWithOntologyUpdateCoordinator:v14];
  uint64_t v16 = [(HDOntologyMercuryZipTSVPruner *)v15 pruneEntries:v11 options:a4 error:a6];
  if (v16)
  {
    if (v16 == 2)
    {
      id v17 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_8;
    }
    if (v16 == 1)
    {
      id v17 = v11;
      goto LABEL_8;
    }
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"HDOntologyMercuryZipTSVImporter.m" lineNumber:95 description:@"Unreachable code has been executed"];
  }
  id v17 = 0;
LABEL_8:

  return v17;
}

+ (int64_t)purgeableSpaceForUrgency:(int)a3 shardRegistry:(id)a4
{
  if (a3 != 4) {
    return 0;
  }
  id v4 = a4;
  self;
  v5 = [v4 daemon];

  id v6 = [v5 ontologyBackingStore];
  id v7 = [v6 sizeOfUnderlyingDatabaseInBytes];
  int64_t v8 = [v7 integerValue];

  if (v8 >= 0x100000) {
    return v8;
  }
  else {
    return 0;
  }
}

+ (int64_t)purgeSpaceForUrgency:(int)a3 shardRegistry:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a1 purgeableSpaceForUrgency:v4 shardRegistry:v6];
  if (v7 < 1)
  {
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = v7;
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Cache delete with urgency %d", v4);
    id v10 = [v6 daemon];
    id v11 = [v10 ontologyBackingStore];
    id v16 = 0;
    char v12 = [v11 obliterateWithReason:v9 error:&v16];
    id v13 = v16;

    if ((v12 & 1) == 0)
    {
      _HKInitializeLogging();
      char v14 = HKLogHealthOntology();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v18 = a1;
        __int16 v19 = 2114;
        id v20 = v9;
        __int16 v21 = 2114;
        id v22 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: error %{public}@: %{public}@", buf, 0x20u);
      }

      int64_t v8 = 0;
    }
  }
  return v8;
}

void __104__HDOntologyMercuryZipTSVImporter__importShardWithFileHandle_entry_updateCoordinator_transaction_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = [v4 pathname];
  v39 = [v5 lastPathComponent];

  if ([*(id *)(a1 + 32) containsObject:v39])
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v8 + 40);
    location = (id *)(v8 + 40);
    id v38 = v4;
    id v9 = v39;
    id v10 = v6;
    id v11 = v7;
    uint64_t v12 = self;
    id v13 = v9;
    uint64_t v14 = self;
    if ([v13 isEqualToString:@"nodes"]
      || [v13 isEqualToString:@"attributes"]
      || [v13 isEqualToString:@"relationships"])
    {
      id v20 = objc_opt_class();
    }
    else
    {
      uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:sel__lineImporterClassForFileName_ object:v14 file:@"HDOntologyMercuryZipTSVImporter.m" lineNumber:295 description:@"Unreachable code has been executed"];

      id v20 = 0;
    }

    id v21 = v20;
    CFAbsoluteTimeGetCurrent();
    uint64_t v44 = 0;
    char v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x4010000000;
    v41[3] = &unk_1BD44B655;
    long long v42 = xmmword_1BD32D1C8;
    long long v43 = *(_OWORD *)algn_1BD32D1D8;
    id v40 = 0;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __96__HDOntologyMercuryZipTSVImporter__importArchiveEntry_filename_ontologyEntry_transaction_error___block_invoke;
    v61 = &unk_1E6303DC8;
    v65 = &v44;
    uint64_t v67 = v12;
    id v22 = v13;
    id v62 = v22;
    id v68 = v21;
    id v34 = v10;
    id v63 = v34;
    id v35 = v11;
    id v64 = v35;
    v66 = v41;
    int v23 = [v38 enumerateLinesWithError:&v40 block:buf];
    id v24 = v40;
    _HKInitializeLogging();
    v25 = HKLogHealthOntology();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if (v23) {
        id v26 = @"Success";
      }
      else {
        id v26 = @"Error";
      }
      uint64_t v32 = v45[3];
      CFAbsoluteTimeGetCurrent();
      HKDiagnosticStringFromDuration();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      if (v23) {
        id v28 = &stru_1F1728D60;
      }
      else {
        id v28 = (__CFString *)[[NSString alloc] initWithFormat:@": %@", v24];
      }
      *(_DWORD *)id v48 = 138544642;
      uint64_t v49 = v12;
      __int16 v50 = 2114;
      v51 = v26;
      __int16 v52 = 2048;
      uint64_t v53 = v32;
      __int16 v54 = 2114;
      id v55 = v22;
      __int16 v56 = 2112;
      id v57 = v27;
      __int16 v58 = 2112;
      v59 = v28;
      _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ importing %ld lines of %{public}@ in %@%@", v48, 0x3Eu);
      if ((v23 & 1) == 0) {
    }
      }
    id v29 = v24;
    v30 = v29;
    if (v29) {
      id obj = v29;
    }

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(&v44, 8);

    objc_storeStrong(location, obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v23;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      *a3 = 1;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v15 = HKLogHealthOntology();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

    if (v16)
    {
      id v17 = HKLogHealthOntology();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *(void *)(a1 + 72);
        __int16 v19 = [v4 pathname];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v19;
        _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_INFO, "%{public}@: skipping unrecognized file: '%{public}@'", buf, 0x16u);
      }
    }
  }
}

uint64_t __96__HDOntologyMercuryZipTSVImporter__importArchiveEntry_filename_ontologyEntry_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if ([v5 length])
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 1
      || ![*(id *)(a1 + 80) isHeaderLine:v5])
    {
      id v9 = [[HDOntologyTSVScanner alloc] initWithString:v5];
      id v13 = *(void **)(a1 + 80);
      uint64_t v14 = [*(id *)(a1 + 40) slot];
      id v15 = [*(id *)(a1 + 48) graphDatabase];
      uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8) + 32;
      id v28 = 0;
      LOBYTE(v14) = [v13 importLineWithScanner:v9 slot:v14 graphDatabase:v15 context:v16 error:&v28];
      id v17 = v28;

      if (v14)
      {
        uint64_t v7 = 1;
      }
      else
      {
        _HKInitializeLogging();
        int v23 = HKLogHealthOntology();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = *(void *)(a1 + 72);
          uint64_t v27 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          uint64_t v30 = v26;
          __int16 v31 = 2114;
          uint64_t v32 = v27;
          __int16 v33 = 2114;
          id v34 = v5;
          __int16 v35 = 2114;
          id v36 = v17;
          _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Importing %{public}@ unable to parse line \"%{public}@\" error: %{public}@", buf, 0x2Au);
        }

        id v24 = v17;
        if (v24)
        {
          if (a3) {
            *a3 = v24;
          }
          else {
            _HKLogDroppedError();
          }
        }

        uint64_t v7 = 0;
      }

      goto LABEL_21;
    }
    _HKInitializeLogging();
    id v6 = HKLogHealthOntology();
    uint64_t v7 = 1;
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v8)
    {
      HKLogHealthOntology();
      id v9 = (HDOntologyTSVScanner *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = 1;
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 72);
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v30 = v10;
        __int16 v31 = 2114;
        uint64_t v32 = v11;
        __int16 v33 = 2112;
        id v34 = v5;
        uint64_t v12 = "%{public}@: header line in %{public}@: @\"%@\"";
LABEL_12:
        uint64_t v7 = 1;
        _os_log_impl(&dword_1BCB7D000, &v9->super, OS_LOG_TYPE_INFO, v12, buf, 0x20u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v18 = HKLogHealthOntology();
    uint64_t v7 = 1;
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

    if (v19)
    {
      HKLogHealthOntology();
      id v9 = (HDOntologyTSVScanner *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = 1;
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = *(void *)(a1 + 72);
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        id v22 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v30 = v20;
        __int16 v31 = 2048;
        uint64_t v32 = v21;
        __int16 v33 = 2114;
        id v34 = v22;
        uint64_t v12 = "%{public}@: empty line %ld in %{public}@";
        goto LABEL_12;
      }
LABEL_21:
    }
  }

  return v7;
}

@end