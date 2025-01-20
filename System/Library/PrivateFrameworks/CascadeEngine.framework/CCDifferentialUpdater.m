@interface CCDifferentialUpdater
+ (id)updaterForSet:(id)a3 withRequest:(id)a4 setWriter:(id)a5 changeNotifier:(id)a6 timeout:(double)a7;
- (BOOL)_clearSetTombstoneStatus;
- (BOOL)_deleteStaleItems;
- (BOOL)_diffUpdateItemsWithContents:(id)a3 metaContents:(id)a4;
- (BOOL)_shouldCommit:(BOOL *)a3;
- (BOOL)_tombstoneSet;
- (BOOL)addItemsWithContents:(id)a3 metaContents:(id)a4;
- (BOOL)didCommit;
- (BOOL)finish:(BOOL)a3;
- (BOOL)isIncremental;
- (BOOL)mergeDelta:(id)a3;
- (BOOL)removeSourceItemIdentifier:(id)a3;
- (CCDifferentialUpdater)initWithSet:(id)a3 device:(id)a4 request:(id)a5 setWriter:(id)a6 database:(id)a7 changeNotifier:(id)a8 completion:(id)a9;
- (int64_t)incrementalErrorCode;
- (unint64_t)modifiedRowCount;
- (unint64_t)priorVersion;
- (void)_complete:(BOOL)a3;
- (void)_interrupt;
- (void)_tombstoneSet;
- (void)abort;
- (void)setDidCommit:(BOOL)a3;
@end

@implementation CCDifferentialUpdater

uint64_t __42__CCDifferentialUpdater__deleteStaleItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 81))
  {
    if (([*(id *)(v4 + 64) hasUnmodifiedSourceItemIdHash:v3] & 1) != 0
      || ([*(id *)(*(void *)(a1 + 32) + 8) deleteSourceItemIdHash:v3] & 1) != 0)
    {
      uint64_t v5 = 1;
      goto LABEL_6;
    }
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __42__CCDifferentialUpdater__deleteStaleItems__block_invoke_cold_1();
    }
  }
  uint64_t v5 = 0;
LABEL_6:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNotifier, 0);
  objc_storeStrong((id *)&self->_diffUpdateCache, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_setWriter, 0);
  objc_storeStrong((id *)&self->_stateReader, 0);
  objc_storeStrong((id *)&self->_databaseUpdater, 0);
}

- (BOOL)isIncremental
{
  return self->_isIncremental;
}

- (int64_t)incrementalErrorCode
{
  return self->_incrementalErrorCode;
}

+ (id)updaterForSet:(id)a3 withRequest:(id)a4 setWriter:(id)a5 changeNotifier:(id)a6 timeout:(double)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy_;
  v51 = __Block_byref_object_dispose_;
  id v52 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke;
  v42[3] = &unk_265278418;
  v44 = v45;
  v17 = v16;
  v43 = v17;
  v18 = (void *)MEMORY[0x24C5B0C10](v42);
  v19 = _sharedQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_2;
  block[3] = &unk_265278468;
  id v20 = v12;
  id v32 = v20;
  id v21 = v13;
  id v33 = v21;
  id v22 = v11;
  id v34 = v22;
  v39 = &v47;
  id v23 = v14;
  id v35 = v23;
  id v24 = v18;
  id v38 = v24;
  v25 = v15;
  v36 = v25;
  v26 = v17;
  double v41 = a7;
  v37 = v26;
  v40 = v45;
  dispatch_async(v19, block);

  dispatch_time_t v27 = dispatch_time(0, (uint64_t)(a7 * 1000000000.0));
  if (dispatch_semaphore_wait(v25, v27))
  {
    v28 = __biome_log_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[CCDifferentialUpdater updaterForSet:withRequest:setWriter:changeNotifier:timeout:](a7);
    }

    (*((void (**)(id, void))v24 + 2))(v24, 0);
    id v29 = 0;
  }
  else
  {
    id v29 = (id)v48[5];
  }

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v47, 8);

  return v29;
}

- (BOOL)_diffUpdateItemsWithContents:(id)a3 metaContents:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v55 = a4;
  v56 = v6;
  unint64_t v54 = [v6 count];
  if (!v54)
  {
    BOOL v7 = 1;
    goto LABEL_53;
  }
  BOOL v7 = 0;
  uint64_t v8 = 0;
  v9 = 0;
  unint64_t v10 = 0x263F31000uLL;
  while (1)
  {
    id v11 = (void *)MEMORY[0x24C5B0A20]();
    if (self->_interrupt) {
      break;
    }
    id v12 = *(void **)(v10 + 1816);
    uint64_t v13 = [(CCSet *)self->_set itemType];
    id v14 = [v56 objectAtIndex:v8];
    v65 = v9;
    dispatch_semaphore_t v15 = [v12 contentMessageForItemType:v13 data:v14 error:&v65];
    dispatch_semaphore_t v16 = v65;

    if (!v15)
    {
      v36 = __biome_log_for_category();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[CCDifferentialUpdater _diffUpdateItemsWithContents:metaContents:]();
      }

      v9 = v16;
      break;
    }
    v17 = *(void **)(v10 + 1816);
    uint64_t v18 = [(CCSet *)self->_set itemType];
    v19 = [v55 objectAtIndex:v8];
    v64 = v16;
    id v20 = [v17 metaContentMessageForItemType:v18 data:v19 error:&v64];
    id v21 = v64;

    if (!v20)
    {
      id v23 = __biome_log_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v21;
        _os_log_error_impl(&dword_249B69000, v23, OS_LOG_TYPE_ERROR, "Failed to initialize metaContent message: %@", buf, 0xCu);
      }
      int v31 = 1;
      v9 = v21;
      goto LABEL_44;
    }
    id v22 = objc_alloc(MEMORY[0x263F31710]);
    v63 = v21;
    id v23 = [v22 initWithContent:v15 metaContent:v20 error:&v63];
    v9 = v63;

    if (!v23)
    {
      v25 = __biome_log_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v67 = v15;
        __int16 v68 = 2112;
        v69 = v20;
        __int16 v70 = 2112;
        v71 = v9;
        _os_log_error_impl(&dword_249B69000, v25, OS_LOG_TYPE_ERROR, "Failed to initialize instance from content: %@ metaContent: %@ error: %@", buf, 0x20u);
      }
      int v31 = 1;
      goto LABEL_43;
    }
    id v24 = [v20 sourceItemIdentifier];
    v25 = CCHash64String();

    v53 = [v23 instanceIdentifier];
    char v62 = 0;
    databaseUpdater = self->_databaseUpdater;
    id v60 = 0;
    id v61 = 0;
    id v58 = 0;
    id v59 = 0;
    id v57 = 0;
    LODWORD(v24) = [(CCDatabaseUpdater *)databaseUpdater selectSourceItemIdHash:v25 outLocalInstanceRowId:&v61 outProvenanceRowId:&v60 outInstanceHash:&v59 outContentHash:&v58 outContentSequenceNumber:&v57 isDuplicate:&v62];
    id v49 = v61;
    id v52 = v60;
    id v51 = v59;
    id v50 = v58;
    id v27 = v57;
    if (!v24) {
      goto LABEL_36;
    }
    id v48 = v27;
    if (v62)
    {
      v28 = __biome_log_for_category();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v25;
        id v29 = v28;
        v30 = "Donated set contains multiple duplicate sourceItemIds (hash: %@) not donated previously";
        goto LABEL_11;
      }
      goto LABEL_39;
    }
    if (!v52)
    {
      v28 = [v23 sharedIdentifier];
      v40 = self->_databaseUpdater;
      os_log_t logb = [v20 data];
      id v38 = [v15 data];
      LOBYTE(v40) = [(CCDatabaseUpdater *)v40 insertItemWithSourceItemIdHash:v25 instanceHash:v53 contentHash:v28 metaContent:logb content:v38 isDuplicate:&v62];

      if (v40) {
        goto LABEL_39;
      }
      log = __biome_log_for_category();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v25;
        id v32 = log;
        id v33 = "Failed to insert new sourceItemId (hash: %@)";
        goto LABEL_33;
      }
      goto LABEL_35;
    }
    if (![v53 isEqual:v51])
    {
      v28 = [v23 sharedIdentifier];
      int v34 = [v28 isEqual:v50];
      loga = self->_databaseUpdater;
      if (v34)
      {
        double v41 = [v20 data];
        char logc = [(CCDatabaseUpdater *)loga updateMetaContent:v41 localInstanceRowId:v49 provenanceRowId:v52 priorInstanceHash:v51 instanceHash:v53 contentHash:v28 contentSequenceNumber:v48 isDuplicate:&v62];

        if (logc) {
          goto LABEL_39;
        }
        log = __biome_log_for_category();
        if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 138412546;
        v67 = v25;
        __int16 v68 = 2112;
        v69 = v28;
        id v32 = log;
        id v33 = "Failed to update MetaContent for existing sourceItemId (hash: %@) with unchanged content (hash: %@)";
        uint32_t v35 = 22;
      }
      else
      {
        v42 = [v15 data];
        v39 = [v20 data];
        char logd = [(CCDatabaseUpdater *)loga updateContent:v42 andMetaContent:v39 localInstanceRowId:v49 priorProvenanceRowId:v52 contentHash:v28 instanceHash:v53 isDuplicate:&v62];

        if (logd) {
          goto LABEL_39;
        }
        log = __biome_log_for_category();
        if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 138412290;
        v67 = v25;
        id v32 = log;
        id v33 = "Failed to update Content and MetaContent for existing sourceItemId (hash: %@)";
LABEL_33:
        uint32_t v35 = 12;
      }
      _os_log_error_impl(&dword_249B69000, v32, OS_LOG_TYPE_ERROR, v33, buf, v35);
LABEL_35:

      id v27 = v48;
LABEL_36:
      if (!v62)
      {
        int v31 = 1;
        goto LABEL_42;
      }
      id v48 = v27;
      v28 = __biome_log_for_category();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v67 = v25;
        __int16 v68 = 2112;
        v69 = v53;
        _os_log_fault_impl(&dword_249B69000, v28, OS_LOG_TYPE_FAULT, "Skipping sourceItemId (hash: %@) for an item instance (hash: %@) that collides with an existing record unexpectedly", buf, 0x16u);
      }
      goto LABEL_39;
    }
    if (![(CCDifferentialUpdateCache *)self->_diffUpdateCache addUnmodifiedSourceItemIdHash:v25])
    {
      v28 = __biome_log_for_category();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v25;
        id v29 = v28;
        v30 = "Donated set contains multiple duplicate sourceItemIds (hash: %@) matching a previously donated item";
LABEL_11:
        _os_log_error_impl(&dword_249B69000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
      }
LABEL_39:
    }
    int v31 = 4;
    id v27 = v48;
LABEL_42:

LABEL_43:
LABEL_44:

    if (v31 == 4)
    {
      BOOL v7 = ++v8 >= v54;
      unint64_t v10 = 0x263F31000;
      if (v54 != v8) {
        continue;
      }
    }
    goto LABEL_52;
  }
LABEL_52:

LABEL_53:
  return v7;
}

- (BOOL)_shouldCommit:(BOOL *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (self->_isIncremental
    || ![(CCDatabaseUpdater *)self->_databaseUpdater priorLocalInstanceCount])
  {
    goto LABEL_2;
  }
  uint64_t clientAddOrUpdateCount = self->_clientAddOrUpdateCount;
  if (clientAddOrUpdateCount)
  {
    int v22 = [(CCDifferentialUpdateCache *)self->_diffUpdateCache unmodifiedItemCount] == clientAddOrUpdateCount;
    if ([(CCDatabaseUpdater *)self->_databaseUpdater priorLocalInstanceCount] == v22)
    {
      id v23 = __biome_log_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_249B69000, v23, OS_LOG_TYPE_DEFAULT, "Full set update contains no modified item(s)", (uint8_t *)&v27, 2u);
      }

      goto LABEL_2;
    }
    if ([(CCDifferentialUpdater *)self _deleteStaleItems]) {
      goto LABEL_2;
    }
    return 0;
  }
  v26 = __biome_log_for_category();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_249B69000, v26, OS_LOG_TYPE_DEFAULT, "Full set update is empty - deleting stored items", (uint8_t *)&v27, 2u);
  }

  if (([(CCDatabaseUpdater *)self->_databaseUpdater deleteAllLocalInstances] & 1) == 0) {
    return 0;
  }
LABEL_2:
  char v5 = [(CCDatabaseUpdater *)self->_databaseUpdater finish:a3];
  if ((v5 & 1) == 0)
  {
    BOOL v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CCDifferentialUpdater _shouldCommit:](v7, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_17;
  }
  BOOL isIncremental = self->_isIncremental;
  BOOL v7 = __biome_log_for_category();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (isIncremental)
  {
    if (v8)
    {
      unsigned int v9 = self->_clientAddOrUpdateCount;
      unsigned int clientRemoveCount = self->_clientRemoveCount;
      int v27 = 67109376;
      unsigned int v28 = v9;
      __int16 v29 = 1024;
      unsigned int v30 = clientRemoveCount;
      id v11 = "Committing incremental set update. Client added or updated %u item(s) and removed %u item(s)";
      id v12 = v7;
      uint32_t v13 = 14;
LABEL_16:
      _os_log_impl(&dword_249B69000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v27, v13);
    }
  }
  else if (v8)
  {
    unsigned int v24 = self->_clientAddOrUpdateCount;
    int v27 = 67109120;
    unsigned int v28 = v24;
    id v11 = "Committing full set update. Client registered %u item(s)";
    id v12 = v7;
    uint32_t v13 = 8;
    goto LABEL_16;
  }
LABEL_17:

  return v5;
}

- (CCDifferentialUpdater)initWithSet:(id)a3 device:(id)a4 request:(id)a5 setWriter:(id)a6 database:(id)a7 changeNotifier:(id)a8 completion:(id)a9
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v64 = a6;
  id v19 = a7;
  id v63 = a8;
  id v20 = a9;
  v65.receiver = self;
  v65.super_class = (Class)CCDifferentialUpdater;
  id v21 = [(CCDifferentialUpdater *)&v65 init];
  if (!v21)
  {
LABEL_35:
    int v34 = v21;
    goto LABEL_36;
  }
  id v62 = v16;
  id v22 = objc_alloc(MEMORY[0x263F316F8]);
  id v23 = [MEMORY[0x263EFF910] date];
  [v23 timeIntervalSince1970];
  uint64_t v25 = [v22 initWithDatabase:v19 device:v17 request:v18 startTimeMicros:(uint64_t)(v24 * 1000000.0)];
  databaseUpdater = v21->_databaseUpdater;
  v21->_databaseUpdater = (CCDatabaseUpdater *)v25;

  if (v21->_databaseUpdater)
  {
    uint64_t v27 = [objc_alloc(MEMORY[0x263F316F0]) initWithDatabaseAccess:v19];
    stateReader = v21->_stateReader;
    v21->_stateReader = (CCDatabaseSetStateReader *)v27;

    objc_storeStrong((id *)&v21->_set, a3);
    objc_storeStrong((id *)&v21->_setWriter, a6);
    v21->_incrementalErrorCode = 0;
    __int16 v29 = v21->_databaseUpdater;
    id v30 = v18;
    uint64_t v31 = v29;
    id v32 = [v30 remoteDevice];

    id v16 = v62;
    if (v32)
    {
      LOBYTE(v33) = 1;
      goto LABEL_29;
    }
    if (![v30 version])
    {
      id v33 = [v30 validity];

      if (!v33)
      {
LABEL_29:

        v21->_BOOL isIncremental = (char)v33;
        uint64_t v48 = MEMORY[0x24C5B0C10](v20);
        id completion = v21->_completion;
        v21->_id completion = (id)v48;

        if (v21->_isIncremental) {
          id v50 = objc_alloc_init(CCDifferentialUpdateCache);
        }
        else {
          id v50 = [[CCDifferentialUpdateCache alloc] initWithCapacity:[(CCDatabaseUpdater *)v21->_databaseUpdater priorLocalInstanceCount]];
        }
        diffUpdateCache = v21->_diffUpdateCache;
        v21->_diffUpdateCache = v50;

        objc_storeStrong((id *)&v21->_changeNotifier, a8);
        id v52 = __biome_log_for_category();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          set = v21->_set;
          unint64_t v54 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCDatabaseUpdater priorLocalInstanceCount](v21->_databaseUpdater, "priorLocalInstanceCount"));
          *(_DWORD *)buf = 138412546;
          os_log_t v67 = (os_log_t)set;
          id v16 = v62;
          __int16 v68 = 2112;
          unint64_t v69 = (unint64_t)v54;
          _os_log_impl(&dword_249B69000, v52, OS_LOG_TYPE_DEFAULT, "Updating set: %@ stored local item instance count: %@", buf, 0x16u);
        }
        goto LABEL_35;
      }
    }
    id v60 = v20;
    uint64_t v35 = [(CCDatabaseUpdater *)v31 priorValidityHash];
    id v61 = v35;
    if (!v35)
    {
      id v33 = __biome_log_for_category();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249B69000, v33, OS_LOG_TYPE_DEFAULT, "No prior set found - full update required", buf, 2u);
      }

      LOBYTE(v33) = 0;
      v21->_incrementalErrorCode = 11;
      goto LABEL_28;
    }
    v36 = (void *)v35;
    id v59 = v30;
    v37 = [(CCDatabaseUpdater *)v31 updateValidityHash];
    id v38 = v31;
    char v39 = [v36 isEqual:v37];

    if ((v39 & 1) == 0)
    {
      uint64_t v31 = v38;
      id v33 = __biome_log_for_category();
      id v20 = v60;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v45 = [(CCDatabaseUpdater *)v38 updateValidityHash];
        char v46 = [v59 validity];
        *(_DWORD *)buf = 138412802;
        os_log_t v67 = v61;
        __int16 v68 = 2112;
        unint64_t v69 = (unint64_t)v45;
        __int16 v70 = 2112;
        v71 = v46;
        _os_log_impl(&dword_249B69000, v33, OS_LOG_TYPE_DEFAULT, "Validity hash mismatch detected {prior: %@ requested: %@ (%@)} - full update required", buf, 0x20u);

        id v16 = v62;
      }

      LOBYTE(v33) = 0;
      v21->_incrementalErrorCode = 8;
      id v30 = v59;
      goto LABEL_28;
    }
    unint64_t v40 = [(CCDatabaseUpdater *)v38 priorVersion];
    unint64_t v41 = [(CCDatabaseUpdater *)v38 updateVersion];
    unint64_t v42 = v41;
    unint64_t v58 = v40;
    BOOL v43 = v41 >= v40;
    uint64_t v31 = v38;
    id v20 = v60;
    if (v43)
    {
      loga = __biome_log_for_category();
      BOOL v47 = os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT);
      id v30 = v59;
      if (v42 != v58)
      {
        if (v47)
        {
          *(_DWORD *)buf = 134218240;
          os_log_t v67 = (os_log_t)v58;
          __int16 v68 = 2048;
          unint64_t v69 = v42;
          _os_log_impl(&dword_249B69000, loga, OS_LOG_TYPE_DEFAULT, "Validity and version evolution verified - set is eligible for incremental update from version (%llu) to (%llu)", buf, 0x16u);
        }

        LOBYTE(v33) = 1;
        goto LABEL_28;
      }
      if (v47)
      {
        *(_DWORD *)buf = 134218240;
        os_log_t v67 = (os_log_t)v58;
        __int16 v68 = 2048;
        unint64_t v69 = v58;
        _os_log_impl(&dword_249B69000, loga, OS_LOG_TYPE_DEFAULT, "Update set version (%llu) is equal to the prior version (%llu) - update may either be skipped or completed in full", buf, 0x16u);
      }

      LOBYTE(v33) = 0;
      uint64_t v44 = 9;
    }
    else
    {
      os_log_t log = (os_log_t)v41;
      id v33 = __biome_log_for_category();
      id v30 = v59;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        os_log_t v67 = log;
        __int16 v68 = 2048;
        unint64_t v69 = v58;
        _os_log_impl(&dword_249B69000, v33, OS_LOG_TYPE_DEFAULT, "Update set version (%llu) is not greater than prior version (%llu) - full update required", buf, 0x16u);
      }

      LOBYTE(v33) = 0;
      uint64_t v44 = 10;
    }
    v21->_incrementalErrorCode = v44;
LABEL_28:

    goto LABEL_29;
  }
  int v34 = 0;
  id v16 = v62;
LABEL_36:

  return v34;
}

BOOL __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = a1 + 32;
  BOOL v7 = [*(id *)(a1 + 32) remoteDevice];
  if (!v7)
  {
    uint64_t v8 = *MEMORY[0x263F316C0];
    id v31 = 0;
    unsigned int v9 = [MEMORY[0x263F316F0] persistedKeyValueForKey:v8 database:v5 error:&v31];
    id v10 = v31;
    id v11 = [v9 stringValue];

    if (v11) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (!v12)
    {
      uint32_t v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        uint64_t v29 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v33 = v29;
        __int16 v34 = 2112;
        uint64_t v35 = v30;
        __int16 v36 = 2112;
        id v37 = v10;
        _os_log_error_impl(&dword_249B69000, v13, OS_LOG_TYPE_ERROR, "Failed to find local device identifier for set: %@, request: %@, error: %@", buf, 0x20u);
      }

      BOOL v7 = 0;
      goto LABEL_18;
    }
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x263F31700]) initWithIdentifier:v11 options:1];
  }
  uint64_t v14 = [[CCDifferentialUpdater alloc] initWithSet:*(void *)(a1 + 40) device:v7 request:*(void *)(a1 + 32) setWriter:*(void *)(a1 + 48) database:v5 changeNotifier:*(void *)(a1 + 56) completion:*(void *)(a1 + 80)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    id v17 = *(NSObject **)(a1 + 72);
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 104) * 1000000000.0));
    if (dispatch_semaphore_wait(v17, v18))
    {
      id v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1_cold_2((void *)(a1 + 104), (void *)(a1 + 32), v19);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) _interrupt];
      [*(id *)(a1 + 32) timeout];
    }
    else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      *a3 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) modifiedRowCount];
      BOOL v27 = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) != 0;
      goto LABEL_19;
    }
  }
  else
  {
    id v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1_cold_1(v6, v20, v21, v22, v23, v24, v25, v26);
    }
  }
LABEL_18:
  BOOL v27 = 0;
LABEL_19:

  return v27;
}

- (unint64_t)modifiedRowCount
{
  return [(CCDatabaseUpdater *)self->_databaseUpdater modifiedRowCount];
}

- (BOOL)finish:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  unsigned __int8 v17 = 0;
  [(CCDifferentialUpdater *)self _complete:[(CCDifferentialUpdater *)self _shouldCommit:&v17]];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v5 = _sharedQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__CCDifferentialUpdater_finish___block_invoke;
  block[3] = &unk_265277EA0;
  void block[4] = self;
  block[5] = &v13;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v14 + 24))
  {
    uint64_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v17;
      uint64_t v8 = v17 ? @"the following local item instance" : @"NO";
      if (v17)
      {
        unsigned int v9 = [NSString stringWithFormat:@": (%u added, %u updated, %u removed) and shared item changes (%u added, %u removed, %u provenance updated)", -[CCDatabaseUpdater localInstanceAddedCount](self->_databaseUpdater, "localInstanceAddedCount"), -[CCDatabaseUpdater localInstanceUpdatedCount](self->_databaseUpdater, "localInstanceUpdatedCount"), -[CCDatabaseUpdater localInstanceRemovedCount](self->_databaseUpdater, "localInstanceRemovedCount"), -[CCDatabaseUpdater sharedItemAddedCount](self->_databaseUpdater, "sharedItemAddedCount"), -[CCDatabaseUpdater sharedItemRemovedCount](self->_databaseUpdater, "sharedItemRemovedCount"), -[CCDatabaseUpdater sharedItemProvenanceUpdatedCount](self->_databaseUpdater, "sharedItemProvenanceUpdatedCount")];
      }
      else
      {
        unsigned int v9 = @".";
      }
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      _os_log_impl(&dword_249B69000, v6, OS_LOG_TYPE_DEFAULT, "Committed dataset update producing %@ changes%@", buf, 0x16u);
      if (v7) {
    }
      }
    if (v17) {
      [(CCSetChangeNotifierProtocol *)self->_changeNotifier notifyChangeToSet:self->_set];
    }
    if (v3)
    {
      if (![(CCDifferentialUpdater *)self _tombstoneSet])
      {
LABEL_19:
        BOOL v10 = 0;
        goto LABEL_20;
      }
    }
    else if (v17 && ![(CCDifferentialUpdater *)self _clearSetTombstoneStatus])
    {
      goto LABEL_19;
    }
  }
  BOOL v10 = *((unsigned char *)v14 + 24) != 0;
LABEL_20:
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (BOOL)addItemsWithContents:(id)a3 metaContents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CCDifferentialUpdater addItemsWithContents:metaContents:]();
    }
    goto LABEL_8;
  }
  uint64_t v8 = [v6 count];
  if (v8 != [v7 count])
  {
    BOOL v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CCDifferentialUpdater addItemsWithContents:metaContents:]();
    }
LABEL_8:

    [(CCDifferentialUpdater *)self abort];
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  self->_clientAddOrUpdateCount += [v6 count];
  if (![(CCDifferentialUpdater *)self _diffUpdateItemsWithContents:v6 metaContents:v7])
  {
    [(CCDifferentialUpdater *)self _complete:0];
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)_deleteStaleItems
{
  databaseUpdater = self->_databaseUpdater;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__CCDifferentialUpdater__deleteStaleItems__block_invoke;
  v4[3] = &unk_265278490;
  v4[4] = self;
  return [(CCDatabaseUpdater *)databaseUpdater enumerateUnmodifiedLocalInstancesUsingBlock:v4];
}

- (void)_complete:(BOOL)a3
{
  id completion = (void (**)(id, BOOL))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    id v5 = self->_completion;
    self->_id completion = 0;
  }
}

intptr_t __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __32__CCDifferentialUpdater_finish___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 82);
  return result;
}

void __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = *(__CFString **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = v3;
    _os_log_impl(&dword_249B69000, v2, OS_LOG_TYPE_DEFAULT, "Submitting transaction for request %@", buf, 0xCu);
  }

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  char v16 = __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1;
  unsigned __int8 v17 = &unk_265278440;
  uint64_t v4 = *(void **)(a1 + 40);
  id v18 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 88);
  id v19 = v5;
  uint64_t v25 = v6;
  id v20 = *(id *)(a1 + 40);
  id v21 = *(id *)(a1 + 56);
  id v24 = *(id *)(a1 + 80);
  id v22 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  uint64_t v27 = *(void *)(a1 + 104);
  uint64_t v8 = *(void *)(a1 + 96);
  id v23 = v7;
  uint64_t v26 = v8;
  uint64_t v9 = [v4 submitDatabaseTransactionUsingBlock:&v14];
  BOOL v10 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (!v10)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    BOOL v10 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  }
  objc_msgSend(v10, "setDidCommit:", v9, v14, v15, v16, v17);
  id v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = @"aborted";
    uint64_t v13 = *(void *)(a1 + 32);
    if (v9) {
      BOOL v12 = @"committed";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v29 = v12;
    __int16 v30 = 2112;
    uint64_t v31 = v13;
    _os_log_impl(&dword_249B69000, v11, OS_LOG_TYPE_DEFAULT, "Database update %@ for request %@", buf, 0x16u);
  }
}

- (void)setDidCommit:(BOOL)a3
{
  self->_didCommit = a3;
}

- (unint64_t)priorVersion
{
  return [(CCDatabaseUpdater *)self->_databaseUpdater priorVersion];
}

- (BOOL)removeSourceItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = CCHash64String();
  char v6 = [(CCDatabaseUpdater *)self->_databaseUpdater deleteSourceItemIdHash:v5];
  if (v6)
  {
    ++self->_clientRemoveCount;
  }
  else
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CCDifferentialUpdater removeSourceItemIdentifier:]();
    }
  }
  return v6;
}

- (BOOL)_tombstoneSet
{
  if (self->_isIncremental)
  {
    v2 = __biome_log_for_category();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(CCDifferentialUpdater *)v2 _tombstoneSet];
    }
LABEL_7:
    LOBYTE(v17) = 0;
    goto LABEL_8;
  }
  if (self->_clientAddOrUpdateCount)
  {
    v2 = __biome_log_for_category();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(CCDifferentialUpdater *)v2 _tombstoneSet];
    }
    goto LABEL_7;
  }
  setWriter = self->_setWriter;
  uint64_t v21 = 0;
  int v17 = [(CCDataResourceWriter *)setWriter tombstoneResource:&v21];
  if (!v17) {
    return v17;
  }
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_249B69000, v2, OS_LOG_TYPE_DEFAULT, "Updater successfully tombstoned resource", v20, 2u);
  }
LABEL_8:

  return v17;
}

- (BOOL)_clearSetTombstoneStatus
{
  setWriter = self->_setWriter;
  uint64_t v4 = 0;
  return [(CCDataResourceWriter *)setWriter clearTombstoneStatus:&v4];
}

- (void)abort
{
  [(CCDifferentialUpdater *)self _interrupt];
  [(CCDifferentialUpdater *)self _complete:0];
}

- (void)_interrupt
{
  self->_interrupt = 1;
}

- (BOOL)mergeDelta:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v38[0] = 0;
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F327E8]) initWithMergeableDelta:v4 error:v38];
    id v6 = v38[0];
    if (v5)
    {
      stateReader = self->_stateReader;
      id v37 = 0;
      uint64_t v8 = [(CCDatabaseSetStateReader *)stateReader constructDeviceMapping:&v37];
      uint64_t v9 = v37;
      if (v8)
      {
        uint64_t v33 = 0;
        __int16 v34 = &v33;
        uint64_t v35 = 0x2020000000;
        char v36 = 0;
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __36__CCDifferentialUpdater_mergeDelta___block_invoke;
        v29[3] = &unk_2652784B8;
        id v10 = v8;
        id v30 = v10;
        uint64_t v31 = self;
        uint64_t v32 = &v33;
        [v5 enumerateAtomsWithOptions:0 usingBlock:v29];
        if (*((unsigned char *)v34 + 24))
        {
          char v11 = 0;
        }
        else
        {
          uint64_t v13 = [v5 vectors];
          uint64_t v14 = [v13 contents];
          uint64_t v15 = (void *)[v14 mutableCopy];

          uint64_t v16 = [v5 vectors];
          int v17 = [v16 removals];
          [v15 unionStateVector:v17];

          id v18 = [v15 allSiteIdentifiers];
          uint64_t v21 = MEMORY[0x263EF8330];
          uint64_t v22 = 3221225472;
          id v23 = __36__CCDifferentialUpdater_mergeDelta___block_invoke_35;
          id v24 = &unk_265278508;
          id v25 = v10;
          id v19 = v15;
          id v26 = v19;
          uint64_t v27 = self;
          unsigned int v28 = &v33;
          [v18 enumerateObjectsUsingBlock:&v21];
          if (*((unsigned char *)v34 + 24)) {
            char v11 = 0;
          }
          else {
            char v11 = [(CCDatabaseUpdater *)self->_databaseUpdater deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord];
          }
        }
        _Block_object_dispose(&v33, 8);
      }
      else
      {
        uint64_t v12 = __biome_log_for_category();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CCDifferentialUpdater mergeDelta:]();
        }

        char v11 = 0;
      }
    }
    else
    {
      uint64_t v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CCDifferentialUpdater mergeDelta:]((uint64_t)v6, self);
      }
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

void __36__CCDifferentialUpdater_mergeDelta___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [NSString alloc];
  uint64_t v8 = [v6 timestamp];
  uint64_t v9 = [v8 distributedSiteIdentifier];
  id v10 = [v9 identifier];
  char v11 = (void *)[v7 initWithData:v10 encoding:4];

  id v12 = objc_alloc(MEMORY[0x263EFD678]);
  uint64_t v13 = [v6 timestamp];
  uint64_t v14 = [v13 distributedSiteIdentifier];
  uint64_t v15 = [v14 identifier];
  uint64_t v16 = (void *)[v12 initWithIdentifier:v15];

  int v17 = [*(id *)(a1 + 32) deviceRowIdForSiteIdentifier:v16];
  if (v17)
  {
    uint64_t v38 = v11;
    id v18 = NSNumber;
    id v19 = [v6 timestamp];
    id v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "clock"));

    uint64_t v21 = [v6 value];
    uint64_t v22 = (void *)MEMORY[0x263F31718];
    uint64_t v23 = [*(id *)(*(void *)(a1 + 40) + 48) itemType];
    id v41 = 0;
    id v24 = [v22 contentMessageForItemType:v23 data:v21 error:&v41];
    id v25 = v41;
    if (!v24)
    {
      id v26 = __biome_log_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_2();
      }
      id v27 = v25;
      goto LABEL_22;
    }
    char v36 = a4;
    id v40 = v25;
    id v26 = [objc_alloc(MEMORY[0x263F317A8]) initWithContent:v24 error:&v40];
    id v27 = v40;

    if (!v26)
    {
      uint64_t v33 = __biome_log_for_category();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_3();
      }
      goto LABEL_21;
    }
    id v35 = v27;
    uint64_t v37 = [v26 sharedIdentifier];
    unsigned int v28 = *(void **)(*(void *)(a1 + 40) + 8);
    id v39 = 0;
    char v29 = [v28 selectProvenanceWithContentSequenceNumber:v20 onDeviceRowId:v17 outProvenanceRowId:&v39];
    id v30 = v39;
    if (v29)
    {
      uint64_t v31 = __biome_log_for_category();
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v32)
        {
          *(_DWORD *)buf = 138412546;
          BOOL v43 = v38;
          __int16 v44 = 2112;
          v45 = v20;
          _os_log_impl(&dword_249B69000, v31, OS_LOG_TYPE_DEFAULT, "dropping atom with dot %@::%@ which we've already received", buf, 0x16u);
        }

        goto LABEL_19;
      }
      if (v32)
      {
        *(_DWORD *)buf = 138412802;
        BOOL v43 = v38;
        __int16 v44 = 2112;
        v45 = v20;
        __int16 v46 = 2112;
        uint64_t v47 = v37;
        _os_log_impl(&dword_249B69000, v31, OS_LOG_TYPE_DEFAULT, "inserting atom with dot %@::%@ contentHash %@", buf, 0x20u);
      }

      uint64_t v33 = v37;
      if ([*(id *)(*(void *)(a1 + 40) + 8) insertContent:v21 contentHash:v37 sequenceNumber:v20 onDeviceRowId:v17])goto LABEL_20; {
      __int16 v34 = __biome_log_for_category();
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_4();
      }
    }
    else
    {
      __int16 v34 = __biome_log_for_category();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_5();
      }
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    unsigned char *v36 = 1;
LABEL_19:
    uint64_t v33 = v37;
LABEL_20:

    id v27 = v35;
LABEL_21:

LABEL_22:
    char v11 = v38;
    goto LABEL_23;
  }
  id v20 = __biome_log_for_category();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_1();
  }
LABEL_23:
}

void __36__CCDifferentialUpdater_mergeDelta___block_invoke_35(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) deviceRowIdForSiteIdentifier:v5];
  id v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __36__CCDifferentialUpdater_mergeDelta___block_invoke_36;
    v12[3] = &unk_2652784E0;
    uint64_t v8 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 48);
    id v9 = v6;
    uint64_t v10 = *(void *)(a1 + 56);
    id v13 = v9;
    uint64_t v14 = v10;
    [v8 enumerateClockValuesForSiteIdentifier:v5 usingBlock:v12];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      *a3 = 1;
    }
  }
  else
  {
    char v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_1();
    }
  }
}

void __36__CCDifferentialUpdater_mergeDelta___block_invoke_36(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned char *a6)
{
  if (a5 != 1
    && (objc_msgSend(*(id *)(a1[4] + 8), "tombstoneContentSequenceNumbersInRange:forDeviceRowId:", a2, a3, a1[5]) & 1) == 0)
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __36__CCDifferentialUpdater_mergeDelta___block_invoke_36_cold_1();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a6 = 1;
  }
}

- (BOOL)didCommit
{
  return self->_didCommit;
}

+ (void)updaterForSet:(double)a1 withRequest:setWriter:changeNotifier:timeout:.cold.1(double a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  double v3 = a1;
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_249B69000, v1, OS_LOG_TYPE_ERROR, "Timed out waiting for updater to be initialized for %lf seconds - %@", (uint8_t *)&v2, 0x16u);
}

void __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __84__CCDifferentialUpdater_updaterForSet_withRequest_setWriter_changeNotifier_timeout___block_invoke_1_cold_2(void *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)double v3 = 134218242;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_8_0(&dword_249B69000, (uint64_t)a2, a3, "Transaction timed out after %lf seconds. Aborting update - %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)addItemsWithContents:metaContents:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0(&dword_249B69000, v0, v1, "Donation contains asymmetrical batch counts: {%@, %@}");
}

- (void)addItemsWithContents:metaContents:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v0 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_8_1(&dword_249B69000, v1, v2, "Donation contains unexpected batch objects: {%@, %@} expected: %@", v3, v4, v5, v6, 2u);
}

- (void)removeSourceItemIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0(&dword_249B69000, v0, v1, "Failed to remove sourceItemId: %@ (hash: %@)");
}

- (void)_tombstoneSet
{
}

- (void)_shouldCommit:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_diffUpdateItemsWithContents:metaContents:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "Failed to initialize content message: %@", v2, v3, v4, v5, v6);
}

void __42__CCDifferentialUpdater__deleteStaleItems__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "Failed to remove stale sourceItemId (hash: %@)", v2, v3, v4, v5, v6);
}

- (void)mergeDelta:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_249B69000, v3, v4, "Failed to initialize CKAtomBatch from incoming mergeable delta %@, %@", v5, v6, v7, v8, 2u);
}

- (void)mergeDelta:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "Failed to construct device mapping: %@", v2, v3, v4, v5, v6);
}

void __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "Relaying changes not yet supported, dropping atoms for site identifier %@", v2, v3, v4, v5, v6);
}

void __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v0, "length"));
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_1(&dword_249B69000, v4, v5, "%@ failed to be initialized and verified from itemBuffer length: %@ error: %@", v6, v7, v8, v9, 2u);
}

void __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "Failed to initialize sharedItem: %@", v2, v3, v4, v5, v6);
}

void __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0(&dword_249B69000, v0, v1, "failed to insert content %@ with sequence number %@");
}

void __36__CCDifferentialUpdater_mergeDelta___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0(&dword_249B69000, v0, v1, "failed to search for existing provenance row for content hash %@ with sequence number %@");
}

void __36__CCDifferentialUpdater_mergeDelta___block_invoke_36_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:v1];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:v1 + v0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_249B69000, v4, v5, "failed to delete content with sequence numbers in range (%@, %@)", v6, v7, v8, v9, 2u);
}

@end