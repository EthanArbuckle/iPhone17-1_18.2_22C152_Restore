@interface HDOntologyManifestImporter
+ (BOOL)canImportEntry:(id)a3;
+ (BOOL)importManifestWithEntry:(id)a3 updateCoordinator:(id)a4 error:(id *)a5;
+ (BOOL)importOntologyShardEntry:(id)a3 shardRegistry:(id)a4 error:(id *)a5;
+ (id)pruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6;
+ (id)willPruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6;
- (HDOntologyManifestImporter)init;
@end

@implementation HDOntologyManifestImporter

- (HDOntologyManifestImporter)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)canImportEntry:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 schemaType];
  uint64_t v5 = *MEMORY[0x1E4F2A2E8];
  if (v4 == (void *)*MEMORY[0x1E4F2A2E8])
  {
    LOBYTE(v5) = [v3 schemaVersion] == 1;
  }
  else if (v5)
  {
    v6 = [v3 schemaType];
    if ([v6 isEqualToString:v5]) {
      LOBYTE(v5) = [v3 schemaVersion] == 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (BOOL)importManifestWithEntry:(id)a3 updateCoordinator:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 shardRegistry];
  v11 = [v10 openShardFileForEntry:v8 error:a5];

  if (v11)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __78__HDOntologyManifestImporter_importManifestWithEntry_updateCoordinator_error___block_invoke;
    v23[3] = &unk_1E6303D58;
    id v27 = a1;
    id v12 = v8;
    id v24 = v12;
    id v13 = v9;
    id v25 = v13;
    id v14 = v11;
    id v26 = v14;
    int v15 = [v13 performOntologyTransactionForWrite:1 databaseTransaction:0 error:a5 transactionHandler:v23];
    [v14 closeFile];
    if (v15)
    {
      id v16 = v12;
      id v17 = v13;
      uint64_t v18 = self;
      v19 = [v17 shardRegistry];

      id v28 = 0;
      LOBYTE(v17) = [v19 deleteStagedShardFileForEntry:v16 error:&v28];
      id v20 = v28;

      if ((v17 & 1) == 0)
      {
        _HKInitializeLogging();
        v21 = HKLogHealthOntology();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v30 = v18;
          __int16 v31 = 2114;
          id v32 = v16;
          __int16 v33 = 2114;
          id v34 = v20;
          _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: After import unable to delete staged file for %{public}@: %{public}@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

BOOL __78__HDOntologyManifestImporter_importManifestWithEntry_updateCoordinator_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  id v8 = a2;
  id v9 = v6;
  id v10 = v5;
  self;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  uint64_t v14 = self;
  int v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __96__HDOntologyManifestImporter__importManifestWithFileHandle_updateCoordinator_transaction_error___block_invoke;
  id v25 = &unk_1E630F3E0;
  id v26 = v11;
  id v27 = v12;
  id v28 = v15;
  uint64_t v29 = v14;
  id v16 = v15;
  id v17 = v12;
  id v18 = v11;
  LODWORD(v12) = objc_msgSend(v13, "hk_enumerateLinesWithError:handler:", a3, &v22);

  if (v12)
  {
    v19 = objc_msgSend(v7, "copyWithAvailableStateImported", v22, v23, v24, v25);
    BOOL v20 = +[HDOntologyShardRegistry insertEntry:v19 transaction:v17 error:a3];
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (id)willPruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)pruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)importOntologyShardEntry:(id)a3 shardRegistry:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 updateCoordinator];
  LOBYTE(a5) = [a1 importManifestWithEntry:v8 updateCoordinator:v9 error:a5];

  return (char)a5;
}

BOOL __96__HDOntologyManifestImporter__importManifestWithFileHandle_updateCoordinator_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  id v10 = a2;
  self;
  id v11 = +[_HDOntologyManifestItem manifestItemFromLine:v10 error:a3];

  if (v11)
  {
    id v12 = v11;
    id v13 = v7;
    id v54 = v8;
    uint64_t v56 = a3;
    id v14 = v8;
    id v53 = v9;
    id v57 = v9;
    self;
    int v15 = [v13 shardRegistry];
    id v16 = [v12 identifier];
    id v17 = [v12 schemaType];
    v58[0] = 0;
    id v18 = v14;
    int v19 = objc_msgSend(v15, "entryWithIdentifier:schemaType:schemaVersion:entryOut:transaction:error:", v16, v17, objc_msgSend(v12, "schemaVersion"), v58, v14, v56);
    id v20 = v58[0];

    v55 = v20;
    if (!v19)
    {
      BOOL v31 = 0;
      id v9 = v53;
      id v8 = v54;
LABEL_12:

      goto LABEL_13;
    }
    id v49 = v13;
    id v50 = v7;
    if (v20)
    {
      id v47 = v18;
      id v45 = v57;
      id v21 = v12;
      id v22 = v20;
      self;
      uint64_t v51 = [v21 version];
      uint64_t v23 = [v21 region];
      id v24 = [v21 locale];
      id v25 = [v21 URL];
      id v26 = [v21 checksum];
      uint64_t v27 = [v21 size];

      uint64_t v28 = [v22 updatedCopyWithAvailableVersion:v51 availableRegion:v23 availableLocale:v24 availableURL:v25 availableChecksum:v26 availableSize:v27 date:v45];

      uint64_t v29 = v22;
      if ((id)v28 == v22)
      {
        BOOL v31 = 1;
        id v13 = v49;
        id v7 = v50;
        id v9 = v53;
        id v8 = v54;
        goto LABEL_11;
      }
      uint64_t v29 = (void *)v28;
      id v13 = v49;
      id v7 = v50;
      id v9 = v53;
      id v8 = v54;
      uint64_t v30 = v56;
    }
    else
    {
      id v32 = v57;
      v44 = v18;
      id v46 = v18;
      id v33 = v12;
      self;
      id v52 = objc_alloc(MEMORY[0x1E4F2B2F8]);
      v48 = [v33 identifier];
      v42 = [v33 schemaType];
      uint64_t v43 = [v33 schemaVersion];
      uint64_t v34 = [v33 version];
      uint64_t v35 = [v33 region];
      v36 = [v33 locale];
      v41 = [v33 URL];
      v37 = [v33 checksum];
      uint64_t v38 = [v33 size];

      uint64_t v39 = v34;
      id v7 = v50;
      uint64_t v28 = [v52 initWithIdentifier:v48 schemaType:v42 schemaVersion:v43 availableVersion:v39 availableRegion:v35 availableLocale:v36 availableURL:v41 availableChecksum:v37 availableSize:v38 date:v32];

      id v18 = v44;
      uint64_t v30 = v56;

      id v13 = v49;
      uint64_t v29 = v46;

      id v47 = (id)v28;
      id v9 = v53;
      id v8 = v54;
    }
    BOOL v31 = +[HDOntologyShardRegistry insertEntry:v28 transaction:v18 error:v30];
LABEL_11:

    goto LABEL_12;
  }
  BOOL v31 = 0;
LABEL_13:

  return v31;
}

@end