@interface HDOntologyManifestUpdater
+ (BOOL)_handleTaskError:(void *)a3 response:(void *)a4 request:(void *)a5 error:;
+ (id)manifestURLWithBaseURL:(id)a3;
+ (id)manifestVersionURLForManifestURL:(id)a3;
+ (void)_importStagedManifestFileWithEntry:(void *)a3 updateCoordinator:(void *)a4 completion:;
+ (void)_insertAndLogFailureForEntry:(void *)a3 registry:;
- (HDOntologyManifestUpdater)init;
- (HDOntologyManifestUpdater)initWithOntologyUpdateCoordinator:(id)a3;
- (HDOntologyUpdateCoordinator)updateCoordinator;
- (void)updateManifestWithURL:(id)a3 session:(id)a4 completion:(id)a5;
@end

@implementation HDOntologyManifestUpdater

- (HDOntologyManifestUpdater)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyManifestUpdater)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDOntologyManifestUpdater;
  v5 = [(HDOntologyManifestUpdater *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
  }

  return v6;
}

- (void)updateManifestWithURL:(id)a3 session:(id)a4 completion:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v49 = a4;
  id v8 = a5;
  p_updateCoordinator = &self->_updateCoordinator;
  id v10 = a3;
  id v50 = 0;
  id v11 = objc_loadWeakRetained((id *)p_updateCoordinator);
  id v12 = v10;
  self;
  v13 = [v11 shardRegistry];
  uint64_t v14 = *MEMORY[0x1E4F2A2B0];
  uint64_t v15 = *MEMORY[0x1E4F2A2E8];
  id v51 = 0;
  int v16 = [v13 entryWithIdentifier:v14 schemaType:v15 schemaVersion:1 entryOut:&v51 transaction:0 error:&v50];
  id v17 = v51;

  if (!v16)
  {
    id v27 = 0;
    goto LABEL_16;
  }
  if (!v17) {
    id v17 = (id)[objc_alloc(MEMORY[0x1E4F2B2F8]) initWithIdentifier:v14 schemaType:v15 schemaVersion:1 availableURL:v12];
  }
  id v17 = v17;
  id v18 = v11;
  uint64_t v47 = self;
  v19 = [v18 shardRegistry];
  id v52 = 0;
  id v53 = 0;
  char v20 = [v19 stagedShardFileEntryForEntry:v17 entryOut:&v53 error:&v52];
  id v21 = v53;
  id v22 = v52;

  if ((v20 & 1) == 0)
  {
    _HKInitializeLogging();
    v23 = HKLogHealthOntology();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to determine if there is already a staged manifest file: %{public}@", buf, 0x16u);
    }
  }
  if (v21)
  {
    uint64_t v24 = [v21 availableVersion];
    v25 = v17;
    if (v24 > [v17 availableVersion])
    {
      uint64_t v26 = objc_msgSend(v17, "copyWithAvailableVersion:availableState:", objc_msgSend(v21, "availableVersion"), objc_msgSend(v21, "availableState"));
LABEL_14:
      v25 = (void *)v26;

      v28 = [v18 shardRegistry];
      +[HDOntologyManifestUpdater _insertAndLogFailureForEntry:registry:](v47, v25, v28);
    }
  }
  else
  {
    v25 = v17;
    if ([v17 availableState] == 2)
    {
      uint64_t v26 = [v17 copyWithAvailableState:1];
      goto LABEL_14;
    }
  }
  id v27 = v25;

LABEL_16:
  id v29 = v50;

  if (v27)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_updateCoordinator);
    id v31 = v27;
    id v32 = v49;
    id v33 = WeakRetained;
    id v48 = v29;
    id v34 = v8;
    id v35 = v8;
    v36 = self;
    v37 = [v31 availableURL];
    v38 = [v36 manifestVersionURLForManifestURL:v37];

    v39 = [MEMORY[0x1E4F18DA8] requestWithURL:v38];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __91__HDOntologyManifestUpdater__updateManifestWithEntry_session_updateCoordinator_completion___block_invoke;
    v55 = &unk_1E6301308;
    id v60 = v35;
    v61 = v36;
    id v56 = v39;
    id v57 = v31;
    id v58 = v33;
    id v59 = v32;
    id v40 = v32;
    id v41 = v33;
    id v42 = v31;
    id v43 = v35;
    id v44 = v39;
    v45 = [v40 dataTaskWithRequest:v44 completionHandler:buf];
    [v45 resume];

    v46 = v34;
    id v29 = v48;
  }
  else
  {
    v46 = v8;
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v29);
  }
}

+ (id)manifestURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"manifest.csv"];
}

+ (id)manifestVersionURLForManifestURL:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [a3 absoluteString];
  v5 = [v4 stringByDeletingPathExtension];
  v6 = [v5 stringByAppendingString:@"-version.json"];
  v7 = [v3 URLWithString:v6];

  return v7;
}

+ (void)_insertAndLogFailureForEntry:(void *)a3 registry:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  id v10 = 0;
  char v7 = [v5 insertEntry:v4 error:&v10];

  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    v9 = HKLogHealthOntology();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      id v14 = v4;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to persist entry %{public}@: %{public}@", buf, 0x20u);
    }
  }
}

void __91__HDOntologyManifestUpdater__updateManifestWithEntry_session_updateCoordinator_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 72);
  v9 = *(void **)(a1 + 32);
  id v36 = 0;
  LOBYTE(a3) = +[HDOntologyManifestUpdater _handleTaskError:response:request:error:](v8, a4, a3, v9, &v36);
  id v10 = v36;
  if (a3)
  {
    id v35 = 0;
    id v11 = v7;
    self;
    uint64_t v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:&v35];

    if (!v12)
    {
      id v14 = 0;
      goto LABEL_12;
    }
    __int16 v13 = [v12 objectForKeyedSubscript:@"version"];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
LABEL_11:

LABEL_12:
        id v15 = v35;
        if (v14)
        {
          uint64_t v16 = [v14 integerValue];
          if (v16 > [*(id *)(a1 + 40) currentVersion])
          {
            if (v16 == [*(id *)(a1 + 40) availableVersion]
              && [*(id *)(a1 + 40) availableState] == 2)
            {
              +[HDOntologyManifestUpdater _importStagedManifestFileWithEntry:updateCoordinator:completion:](*(void *)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 64));
            }
            else
            {
              id v18 = (void *)[*(id *)(a1 + 40) copyWithAvailableVersion:v16 availableState:1];
              v19 = *(void **)(a1 + 48);
              char v20 = *(void **)(a1 + 56);
              id v21 = *(void **)(a1 + 64);
              id v22 = v18;
              id v23 = v19;
              id v24 = v21;
              id v34 = v20;
              uint64_t v25 = self;
              uint64_t v26 = (void *)MEMORY[0x1E4F18DA8];
              id v27 = [v22 availableURL];
              v28 = [v26 requestWithURL:v27];

              v37[0] = MEMORY[0x1E4F143A8];
              v37[1] = 3221225472;
              v37[2] = __93__HDOntologyManifestUpdater__downloadManifestWithEntry_session_updateCoordinator_completion___block_invoke;
              v37[3] = &unk_1E6301330;
              id v41 = v24;
              uint64_t v42 = v25;
              id v38 = v28;
              id v39 = v22;
              id v40 = v23;
              id v29 = v23;
              id v30 = v22;
              id v31 = v24;
              id v32 = v28;
              id v33 = [v34 downloadTaskWithRequest:v32 completionHandler:v37];

              [v33 resume];
            }
            goto LABEL_21;
          }
          uint64_t v17 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
        }
        else
        {
          uint64_t v17 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
        }
        v17();
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v35, 3, @"Value for key 'version' is of class '%@', but expected kind of NSNumber", objc_opt_class());
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &v35, 3, @"No value for expected key 'version'");
    }
    id v14 = 0;
    goto LABEL_11;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_22:
}

+ (BOOL)_handleTaskError:(void *)a3 response:(void *)a4 request:(void *)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  self;
  if (v8)
  {
    if (a5)
    {
      BOOL v11 = 0;
      *a5 = v8;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v11 = 0;
    }
  }
  else
  {
    id v12 = v9;
    uint64_t v13 = [v12 statusCode];
    BOOL v11 = (unint64_t)(v13 - 200) < 0x64;
    if ((unint64_t)(v13 - 200) >= 0x64)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_HTTPErrorRepresentingResponse:request:", v12, v10);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (a5) {
          *a5 = v14;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }

  return v11;
}

+ (void)_importStagedManifestFileWithEntry:(void *)a3 updateCoordinator:(void *)a4 completion:
{
  uint64_t v6 = a4;
  id v7 = a3;
  id v8 = a2;
  self;
  id v13 = 0;
  id v9 = v7;
  id v10 = v8;
  self;
  BOOL v11 = +[HDOntologyManifestImporter importManifestWithEntry:v10 updateCoordinator:v9 error:&v13];

  id v12 = v13;
  v6[2](v6, v11, v12);
}

void __93__HDOntologyManifestUpdater__downloadManifestWithEntry_session_updateCoordinator_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 64);
  id v9 = *(void **)(a1 + 32);
  id v24 = 0;
  LOBYTE(a3) = +[HDOntologyManifestUpdater _handleTaskError:response:request:error:](v8, a4, a3, v9, &v24);
  id v10 = v24;
  if (a3)
  {
    BOOL v11 = *(void **)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    id v23 = 0;
    id v13 = v11;
    id v14 = v12;
    id v15 = v7;
    self;
    uint64_t v16 = [v14 shardRegistry];
    int v17 = [v16 stageShardFileWithLocalURL:v15 entry:v13 error:&v23];

    id v18 = 0;
    if (v17)
    {
      v19 = objc_msgSend(v13, "copyWithAvailableState:", 2, v23);
      char v20 = [v14 shardRegistry];
      int v21 = [v20 insertEntry:v19 error:&v23];

      if (v21) {
        id v18 = v19;
      }
      else {
        id v18 = 0;
      }
    }
    id v22 = v23;
    if (v18) {
      +[HDOntologyManifestUpdater _importStagedManifestFileWithEntry:updateCoordinator:completion:](*(void *)(a1 + 64), v18, *(void **)(a1 + 48), *(void **)(a1 + 56));
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);

  return (HDOntologyUpdateCoordinator *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end