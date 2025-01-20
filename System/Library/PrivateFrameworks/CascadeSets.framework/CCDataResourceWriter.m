@interface CCDataResourceWriter
+ (BOOL)incrementRowsModified:(unint64_t)a3 database:(id)a4;
+ (BOOL)purgeTombstonedResources:(id)a3;
+ (int)defaultDataProtectionClass;
- (BOOL)_cleanupDatabaseIfRequired;
- (BOOL)_clearTombstoneStatus:(id *)a3;
- (BOOL)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(id)a3;
- (BOOL)_didCompleteMaintenance:(id *)a3 shouldDefer:(id)a4;
- (BOOL)_executeDatabaseTransactionUsingBlock:(id)a3;
- (BOOL)_removeResource:(id *)a3;
- (BOOL)_tombstoneResource:(id *)a3;
- (BOOL)initializeDatabaseWithLocalDeviceIdentifier:(id)a3 error:(id *)a4;
- (BOOL)performMaintenance:(id *)a3 shouldDefer:(id)a4;
- (BOOL)removeResource:(id *)a3;
- (BOOL)submitDatabaseTransactionUsingBlock:(id)a3;
- (CCDataResource)dataResource;
- (CCDataResourceWriter)initWithDataResource:(id)a3 accessAssertion:(id)a4;
- (id)_loadDatabase:(id *)a3;
- (id)_temporaryDirectoryURLWithError:(id *)a3;
- (id)description;
- (void)_cleanupDatabaseIfRequired;
@end

@implementation CCDataResourceWriter

- (CCDataResourceWriter)initWithDataResource:(id)a3 accessAssertion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CCDataResourceWriter;
  v9 = [(CCDataResourceWriter *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataResource, a3);
    objc_storeStrong((id *)&v10->_accessAssertion, a4);
    id v11 = [(CCDataResourceWriter *)v10 description];
    v12 = (const char *)[v11 cStringUsingEncoding:4];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v14;
  }
  return v10;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CCDataResourceWriter;
  v4 = [(CCDataResourceWriter *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ %@", v4, self->_dataResource];

  return v5;
}

- (BOOL)initializeDatabaseWithLocalDeviceIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CCDataResourceWriter_initializeDatabaseWithLocalDeviceIdentifier_error___block_invoke;
  block[3] = &unk_26527A790;
  id v10 = v5;
  id v11 = &v12;
  block[4] = self;
  id v7 = v5;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)queue;
}

uint64_t __74__CCDataResourceWriter_initializeDatabaseWithLocalDeviceIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _createDatabaseIfNotExistsWithLocalDeviceIdentifier:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __60__CCDataResourceWriter_submitDatabaseTransactionUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _executeDatabaseTransactionUsingBlock:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_executeDatabaseTransactionUsingBlock:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v4 = (unsigned int (**)(id, void *, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v24 = 0;
  id v5 = [(CCDataResourceWriter *)self _loadDatabase:&v24];
  id v6 = v24;
  id v7 = v6;
  if (!v5)
  {
    char v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:]();
    }

LABEL_17:
    BOOL v14 = 0;
    goto LABEL_22;
  }
  id v23 = v6;
  char v8 = [v5 beginTransactionWithError:&v23];
  id v9 = v23;

  if (v8)
  {
    uint64_t v22 = 0;
    if (v4[2](v4, v5, &v22)
      && [(id)objc_opt_class() incrementRowsModified:v22 database:v5])
    {
      id v21 = v9;
      int v10 = [v5 commitTransactionWithError:&v21];
      id v7 = v21;

      id v11 = __biome_log_for_category();
      uint64_t v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          dataResource = self->_dataResource;
          *(_DWORD *)buf = 138412290;
          v26 = dataResource;
          _os_log_impl(&dword_249B92000, v12, OS_LOG_TYPE_DEFAULT, "(%@) Successfully committed database transaction", buf, 0xCu);
        }
        BOOL v14 = 1;
LABEL_21:

        goto LABEL_22;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:]();
      }
    }
    else
    {
      id v7 = v9;
    }
    objc_super v17 = v7;
    id v20 = v7;
    char v18 = [v5 rollbackTransactionWithError:&v20];
    id v7 = v20;

    if ((v18 & 1) == 0)
    {
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:]();
      }
      BOOL v14 = 0;
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  v16 = __biome_log_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:].cold.4();
  }

  BOOL v14 = 0;
  id v7 = v9;
LABEL_22:

  return v14;
}

- (BOOL)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_dataResource = (id *)&self->_dataResource;
  id v6 = [(CCDataResource *)self->_dataResource databaseURL];
  if (!+[CCDataResource databaseExistsAtURL:v6])
  {
    id v71 = 0;
    id v9 = [(CCDataResourceWriter *)self _temporaryDirectoryURLWithError:&v71];
    int v10 = v71;
    id v7 = v10;
    if (!v9 || v10)
    {
      id v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:]();
      }
      BOOL v8 = 0;
      goto LABEL_33;
    }
    id v11 = +[CCDataResource databaseURLFromParentDirectoryURL:v9];
    uint64_t v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *p_dataResource;
      BOOL v14 = [v11 path];
      *(_DWORD *)buf = 138412546;
      id v73 = v13;
      __int16 v74 = 2112;
      v75 = v14;
      _os_log_impl(&dword_249B92000, v12, OS_LOG_TYPE_DEFAULT, "(%@) Creating database in temporary path: %@", buf, 0x16u);
    }
    char v15 = +[CCDatabaseConnection connectionToDatabaseAtURL:dataProtectionClass:openMode:accessAssertion:](CCDatabaseConnection, "connectionToDatabaseAtURL:dataProtectionClass:openMode:accessAssertion:", v11, [(id)objc_opt_class() defaultDataProtectionClass], 3, self->_accessAssertion);
    v16 = v15;
    if (v4)
    {
      id v70 = 0;
      char v17 = [v15 openWithError:&v70];
      char v18 = v70;
      id v7 = v18;
      if (v17)
      {
        v69 = v18;
        char v19 = [v16 beginTransactionWithError:&v69];
        id v20 = v69;

        if ((v19 & 1) == 0)
        {
          v39 = __biome_log_for_category();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:]1();
          }
          goto LABEL_37;
        }
        v68 = v20;
        char v21 = [v16 prepareWithError:&v68];
        id v7 = v68;

        if (v21)
        {
          uint64_t v22 = NSNumber;
          id v23 = [MEMORY[0x263EFF910] date];
          [v23 timeIntervalSince1970];
          v25 = [v22 numberWithLongLong:(uint64_t)(v24 * 1000000.0)];
          BOOL v26 = +[CCDatabaseUpdater insertResourceVersion:v25 database:v16];

          if (v26)
          {
            if (+[CCDatabaseUpdater insertOrUpdateLocalDeviceIdentifier:v4 database:v16])
            {
              v67 = v7;
              char v27 = [v16 commitTransactionWithError:&v67];
              id v20 = v67;

              if ((v27 & 1) == 0)
              {
                v39 = __biome_log_for_category();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                  -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.7();
                }
                goto LABEL_37;
              }
              v66 = v20;
              char v28 = [v16 closeWithError:&v66];
              id v7 = v66;

              if (v28)
              {
                v29 = [MEMORY[0x263F08850] defaultManager];
                v30 = [*p_dataResource resourceDirectoryURL];
                v31 = [v30 path];
                LODWORD(v63) = [v29 fileExistsAtPath:v31];

                if (v63)
                {
LABEL_20:
                  objc_msgSend(v9, "path", v63);
                  id v34 = objc_claimAutoreleasedReturnValue();
                  v64 = (char *)[v34 cStringUsingEncoding:4];

                  v35 = [*p_dataResource databaseDirectoryURL];
                  id v36 = [v35 path];
                  v37 = (const char *)[v36 cStringUsingEncoding:4];

                  LODWORD(v36) = renamex_np(v64, v37, 4u);
                  v38 = __biome_log_for_category();
                  v39 = v38;
                  if (!v36)
                  {
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                    {
                      id v62 = *p_dataResource;
                      *(_DWORD *)buf = 138412546;
                      id v73 = v62;
                      __int16 v74 = 2080;
                      v75 = v37;
                      _os_log_impl(&dword_249B92000, v39, OS_LOG_TYPE_DEFAULT, "(%@) Successfully renamed temporary directory and moved to final path: %s", buf, 0x16u);
                    }
                    BOOL v8 = 1;
                    goto LABEL_32;
                  }
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                    -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.4();
                  }
                  goto LABEL_31;
                }
                v32 = [MEMORY[0x263F08850] defaultManager];
                v33 = [*p_dataResource resourceDirectoryURL];
                v65 = v7;
                LODWORD(v63) = [v32 createDirectoryAtURL:v33 withIntermediateDirectories:1 attributes:0 error:&v65];
                id v20 = v65;

                if (v63)
                {
                  id v7 = v20;
                  goto LABEL_20;
                }
                v39 = __biome_log_for_category();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                  [(CCDataResourceWriter *)p_dataResource _createDatabaseIfNotExistsWithLocalDeviceIdentifier:v39];
                }
LABEL_37:
                BOOL v8 = 0;
                id v7 = v20;
                goto LABEL_32;
              }
              v39 = __biome_log_for_category();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.6();
              }
            }
            else
            {
              v39 = __biome_log_for_category();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.8(v39, v55, v56, v57, v58, v59, v60, v61);
              }
            }
          }
          else
          {
            v39 = __biome_log_for_category();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.9(v39, v48, v49, v50, v51, v52, v53, v54);
            }
          }
        }
        else
        {
          v39 = __biome_log_for_category();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:]0();
          }
        }
      }
      else
      {
        v39 = __biome_log_for_category();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:]2();
        }
      }
    }
    else
    {
      v39 = __biome_log_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:](v39, v40, v41, v42, v43, v44, v45, v46);
      }
      id v7 = 0;
    }
LABEL_31:
    BOOL v8 = 0;
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(CCDataResourceWriter *)(uint64_t)&self->_dataResource _createDatabaseIfNotExistsWithLocalDeviceIdentifier:v7];
  }
  BOOL v8 = 1;
LABEL_34:

  return v8;
}

- (id)_loadDatabase:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(CCDataResource *)self->_dataResource databaseURL];
  if (+[CCDataResource databaseExistsAtURL:v5])
  {
    id v6 = +[CCDatabaseConnection connectionToDatabaseAtURL:dataProtectionClass:openMode:accessAssertion:](CCDatabaseConnection, "connectionToDatabaseAtURL:dataProtectionClass:openMode:accessAssertion:", v5, [(id)objc_opt_class() defaultDataProtectionClass], 2, self->_accessAssertion);
    if ([v6 openWithError:a3]) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (BOOL)incrementRowsModified:(unint64_t)a3 database:(id)a4
{
  id v5 = a4;
  uint64_t v13 = 0;
  uint64_t v6 = +[CCDatabaseUpdater selectRowsModifiedCountInDatabase:v5 error:&v13];
  id v7 = (void *)v6;
  uint64_t v8 = v13;
  id v9 = &unk_26FDCD580;
  if (v6) {
    id v9 = (void *)v6;
  }
  id v10 = v9;

  if (v8) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = +[CCDatabaseUpdater insertOrUpdateRowsModified:database:](CCDatabaseUpdater, "insertOrUpdateRowsModified:database:", [v10 unsignedIntegerValue] + a3, v5);
  }

  return v11;
}

+ (int)defaultDataProtectionClass
{
  return 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_dataResource, 0);
}

- (BOOL)submitDatabaseTransactionUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CCDataResourceWriter_submitDatabaseTransactionUsingBlock___block_invoke;
  block[3] = &unk_26527A7E0;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

+ (BOOL)purgeTombstonedResources:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F29E48]);
  id v5 = (void *)[v4 initWithUseCase:*MEMORY[0x263F29E40]];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v29;
    *(void *)&long long v8 = 138412802;
    long long v26 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        unsigned int v13 = objc_msgSend(v12, "resourceStatus", v26);
        if (v13 == 4)
        {
          char v14 = [v12 specifier];
          id v27 = 0;
          int v15 = [v5 removeResource:v14 error:&v27];
          id v16 = v27;

          char v17 = __biome_log_for_category();
          char v18 = v17;
          if (v15) {
            BOOL v19 = v16 == 0;
          }
          else {
            BOOL v19 = 0;
          }
          if (!v19)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              +[CCDataResourceWriter purgeTombstonedResources:]();
            }

            BOOL v23 = 0;
            goto LABEL_22;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v12;
            _os_log_impl(&dword_249B92000, v18, OS_LOG_TYPE_DEFAULT, "Successfully purged tombstoned resource: %@", buf, 0xCu);
          }
        }
        else
        {
          unsigned int v20 = v13;
          char v18 = __biome_log_for_category();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            char v21 = CCDataResourceStatusToString(v20);
            uint64_t v22 = CCDataResourceStatusToString(4u);
            *(_DWORD *)buf = v26;
            v33 = v12;
            __int16 v34 = 2112;
            v35 = v21;
            __int16 v36 = 2112;
            v37 = v22;
            _os_log_error_impl(&dword_249B92000, v18, OS_LOG_TYPE_ERROR, "Not purging resource: %@ - status %@ is not %@", buf, 0x20u);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v23 = 1;
LABEL_22:

  return v23;
}

- (BOOL)removeResource:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__4;
  unsigned int v13 = __Block_byref_object_dispose__4;
  id v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CCDataResourceWriter_removeResource___block_invoke;
  block[3] = &unk_26527A7B8;
  block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(queue, block);
  id v5 = (void *)v10[5];
  if (v5) {
    CCSetError(a3, v5);
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __39__CCDataResourceWriter_removeResource___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 _removeResource:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)performMaintenance:(id *)a3 shouldDefer:(id)a4
{
  id v6 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__4;
  BOOL v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__CCDataResourceWriter_performMaintenance_shouldDefer___block_invoke;
  v11[3] = &unk_26527A808;
  unsigned int v13 = &v21;
  id v14 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  dispatch_sync(queue, v11);
  if (a3) {
    *a3 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __55__CCDataResourceWriter_performMaintenance_shouldDefer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v2 + 40);
  char v3 = [*(id *)(a1 + 32) _didCompleteMaintenance:&obj shouldDefer:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(v2 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

- (id)_temporaryDirectoryURLWithError:(id *)a3
{
  p_dataResource = &self->_dataResource;
  dataResource = self->_dataResource;
  id v23 = 0;
  id v6 = [(CCDataResource *)dataResource setWithError:&v23];
  id v7 = v23;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v12 = CCTypeIdentifierRegistryBridge();
    unsigned int v13 = objc_msgSend(v12, "setIdentifierForItemType:", objc_msgSend(v6, "itemType"));

    if (v13)
    {
      id v14 = (void *)MEMORY[0x263F29E70];
      uint64_t v15 = [(CCDataResource *)*p_dataResource container];
      id v16 = [v14 biomeTemporaryDirectoryForContainer:v15];

      id v17 = [NSString alloc];
      char v18 = objc_opt_new();
      BOOL v19 = [v18 UUIDString];
      id v20 = (void *)[v17 initWithFormat:@"%@-%@-%@", @".tmp.", v13, v19];

      uint64_t v21 = [v16 stringByAppendingPathComponent:v20];
      uint64_t v11 = [NSURL fileURLWithPath:v21];
    }
    else
    {
      id v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CCDataResourceWriter _temporaryDirectoryURLWithError:](v6, v16);
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CCDataResourceWriter _temporaryDirectoryURLWithError:]();
    }

    CCSetError(a3, v8);
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)_removeResource:(id *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v22 = 0;
  id v5 = [(CCDataResourceWriter *)self _temporaryDirectoryURLWithError:&v22];
  id v6 = v22;
  id v7 = v6;
  if (!v5 || v6)
  {
    CCSetError(a3, v6);
    uint64_t v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CCDataResourceWriter _removeResource:]();
    }
    goto LABEL_9;
  }
  id v8 = [v5 path];
  BOOL v9 = (const char *)[v8 cStringUsingEncoding:4];

  uint64_t v10 = [(CCDataResource *)self->_dataResource databaseDirectoryURL];
  id v11 = [v10 path];
  id v12 = (const char *)[v11 cStringUsingEncoding:4];

  LODWORD(v11) = renamex_np(v12, v9, 4u);
  unsigned int v13 = __biome_log_for_category();
  id v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.4();
    }

    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    CCSetError(a3, v15);
    id v7 = 0;
LABEL_9:
    BOOL v16 = 0;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    char v24 = v12;
    __int16 v25 = 2080;
    long long v26 = v9;
    _os_log_impl(&dword_249B92000, v14, OS_LOG_TYPE_DEFAULT, "Successfully renamed directory at path %s into %s", buf, 0x16u);
  }

  char v18 = [MEMORY[0x263F08850] defaultManager];
  id v21 = 0;
  char v19 = [v18 removeItemAtURL:v5 error:&v21];
  id v7 = v21;

  id v20 = __biome_log_for_category();
  uint64_t v15 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v24 = (const char *)v5;
      _os_log_impl(&dword_249B92000, v15, OS_LOG_TYPE_DEFAULT, "Successfully removed folder at %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    -[CCDataResourceWriter _removeResource:]();
  }
  BOOL v16 = 1;
LABEL_10:

  return v16;
}

- (BOOL)_tombstoneResource:(id *)a3
{
  dataResource = self->_dataResource;
  id v5 = objc_opt_new();
  LOBYTE(a3) = [(CCDataResource *)dataResource markTombstoned:v5 error:a3];

  return (char)a3;
}

- (BOOL)_clearTombstoneStatus:(id *)a3
{
  return [(CCDataResource *)self->_dataResource clearTombstoneStatus:a3];
}

- (BOOL)_cleanupDatabaseIfRequired
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v21 = 0;
  char v3 = [(CCDataResourceWriter *)self _loadDatabase:&v21];
  id v4 = v21;
  if (v3)
  {
    id v20 = v4;
    id v5 = +[CCDatabaseUpdater selectRowsModifiedCountInDatabase:v3 error:&v20];
    id v6 = v20;

    if (v6)
    {
      id v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CCDataResourceWriter _cleanupDatabaseIfRequired].cold.5();
      }
      goto LABEL_25;
    }
    unint64_t v9 = [v5 unsignedIntegerValue];
    uint64_t v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      dataResource = self->_dataResource;
      id v12 = @"not ";
      *(_DWORD *)buf = 138412802;
      if (v9 > 0x3E8) {
        id v12 = &stru_26FDBF2B8;
      }
      id v23 = dataResource;
      __int16 v24 = 2112;
      __int16 v25 = v12;
      __int16 v26 = 2112;
      uint64_t v27 = v5;
      _os_log_impl(&dword_249B92000, v10, OS_LOG_TYPE_DEFAULT, "(%@) Database cleanup is %@ required. %@ rows have been modified since last cleanup", buf, 0x20u);
    }

    if (v9 < 0x3E9)
    {
      id v14 = 0;
    }
    else
    {
      id v19 = 0;
      int v13 = [v3 cleanup:&v19];
      id v14 = v19;
      if (!v13)
      {
        uint64_t v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[CCDataResourceWriter _cleanupDatabaseIfRequired]();
        }
        goto LABEL_21;
      }
      if (!+[CCDatabaseUpdater insertOrUpdateRowsModified:0 database:v3])
      {
        uint64_t v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[CCDataResourceWriter _cleanupDatabaseIfRequired]();
        }
LABEL_21:

        BOOL v8 = 0;
        goto LABEL_22;
      }
    }
    BOOL v8 = 1;
LABEL_22:
    id v18 = v14;
    char v16 = [v3 closeWithError:&v18];
    id v6 = v18;

    if (v16)
    {
LABEL_26:
      id v4 = v6;
      goto LABEL_27;
    }
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CCDataResourceWriter _cleanupDatabaseIfRequired]();
    }
LABEL_25:

    BOOL v8 = 0;
    goto LABEL_26;
  }
  id v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:]();
  }
  BOOL v8 = 0;
LABEL_27:

  return v8;
}

- (BOOL)_didCompleteMaintenance:(id *)a3 shouldDefer:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_dataResource = &self->_dataResource;
  BOOL v8 = [(CCDataResource *)self->_dataResource databaseURL];
  BOOL v9 = +[CCDataResource databaseExistsAtURL:v8];

  uint64_t v10 = __biome_log_for_category();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v11)
    {
LABEL_12:
      BOOL v17 = 1;
      goto LABEL_28;
    }
    uint64_t v15 = *p_dataResource;
    *(_DWORD *)buf = 138412290;
    long long v29 = v15;
    char v16 = "(%@) Database not found";
LABEL_11:
    _os_log_impl(&dword_249B92000, v10, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    goto LABEL_12;
  }
  if (v11)
  {
    id v12 = *p_dataResource;
    *(_DWORD *)buf = 138412290;
    long long v29 = v12;
    _os_log_impl(&dword_249B92000, v10, OS_LOG_TYPE_DEFAULT, "(%@) Starting data resource-specific maintenance", buf, 0xCu);
  }

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __60__CCDataResourceWriter__didCompleteMaintenance_shouldDefer___block_invoke;
  v26[3] = &unk_26527A830;
  int v13 = v6;
  uint64_t v27 = v13;
  if ([(CCDataResourceWriter *)self _executeDatabaseTransactionUsingBlock:v26])
  {

    if (v13 && ((unsigned int (*))v13[2].isa)(v13))
    {
      uint64_t v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = *p_dataResource;
        *(_DWORD *)buf = 138412290;
        long long v29 = v14;
        _os_log_impl(&dword_249B92000, v10, OS_LOG_TYPE_DEFAULT, "(%@) Aborting maintenance due to deferral signal", buf, 0xCu);
      }
LABEL_27:
      BOOL v17 = 0;
      goto LABEL_28;
    }
    if (![(CCDataResourceWriter *)self _cleanupDatabaseIfRequired])
    {
      uint64_t v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CCDataResourceWriter _didCompleteMaintenance:shouldDefer:]();
      }
      goto LABEL_27;
    }
    if (![(CCDataResourceWriter *)self _executeDatabaseTransactionUsingBlock:&__block_literal_global_7])
    {
      uint64_t v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CCDataResourceWriter _didCompleteMaintenance:shouldDefer:]();
      }
      goto LABEL_27;
    }
    if (a3)
    {
      id v19 = *p_dataResource;
      id v25 = 0;
      id v20 = [(CCDataResource *)v19 setWithError:&v25];
      uint64_t v10 = v25;
      if (!v20)
      {
        __int16 v24 = __biome_log_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[CCDataResourceWriter _didCompleteMaintenance:shouldDefer:]();
        }

        goto LABEL_27;
      }
      id v21 = v20;
      *a3 = v21;
    }
    uint64_t v10 = __biome_log_for_category();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v22 = *p_dataResource;
    *(_DWORD *)buf = 138412290;
    long long v29 = v22;
    char v16 = "(%@) Finished database maintenance";
    goto LABEL_11;
  }
  id v18 = __biome_log_for_category();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[CCDataResourceWriter _didCompleteMaintenance:shouldDefer:].cold.4();
  }

  BOOL v17 = 0;
  uint64_t v10 = v27;
LABEL_28:

  return v17;
}

BOOL __60__CCDataResourceWriter__didCompleteMaintenance_shouldDefer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:a2 deletedCount:a3 shouldDefer:*(void *)(a1 + 32)];
}

BOOL __60__CCDataResourceWriter__didCompleteMaintenance_shouldDefer___block_invoke_29(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = objc_opt_new();
  BOOL v4 = +[CCDatabaseUpdater insertOrUpdateLastMaintenanceDate:v3 database:v2];

  return v4;
}

- (CCDataResource)dataResource
{
  return self->_dataResource;
}

+ (void)purgeTombstonedResources:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "Could not purge resource: %@ - access client returned error: %@");
}

- (void)_temporaryDirectoryURLWithError:.cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "Could not obtain set from data resource: %@ with error: %@");
}

- (void)_temporaryDirectoryURLWithError:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 itemType];
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Could not resolve set identifier for item type %hu'", (uint8_t *)v3, 8u);
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a2 path];
  OUTLINED_FUNCTION_10();
  uint64_t v7 = v5;
  _os_log_debug_impl(&dword_249B92000, a3, OS_LOG_TYPE_DEBUG, "(%@) Database already exists at path: %@", v6, 0x16u);
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Could not resolve temporary database path with error: %@", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_7_0();
  __error();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_249B92000, v0, v1, "Could not rename directory at path %s into %s with error: %d", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(NSObject *)a3 .cold.5(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 resourceDirectoryURL];
  OUTLINED_FUNCTION_11();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_249B92000, a3, OS_LOG_TYPE_ERROR, "Could not create data resource directory: %@ with error: %@", v6, 0x16u);
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Could not close database connection with error: %@", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Could not commit database transaction with error: %@", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Could not prepare database connection with error: %@", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.11()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Could not begin database transaction with error: %@", v2, v3, v4, v5, v6);
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.12()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Could not open database connection with error: %@", v2, v3, v4, v5, v6);
}

- (void)_removeResource:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Could not resolve temporary directory path with error: %@", v2, v3, v4, v5, v6);
}

- (void)_removeResource:.cold.2()
{
  OUTLINED_FUNCTION_7_0();
  [MEMORY[0x263F61E30] isUnlocked];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_249B92000, v0, v1, "Can't remove folder at %@ with error %@, isUnlocked: %hhd", v2, v3, v4, v5, v6);
}

- (void)_executeDatabaseTransactionUsingBlock:.cold.1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "(%@) Failed to open database: %@");
}

- (void)_executeDatabaseTransactionUsingBlock:.cold.2()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "(%@) Failed to rollback transaction: %@");
}

- (void)_executeDatabaseTransactionUsingBlock:.cold.3()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "(%@) Failed to commit transaction: %@");
}

- (void)_executeDatabaseTransactionUsingBlock:.cold.4()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "(%@) Failed to begin transaction: %@");
}

- (void)_cleanupDatabaseIfRequired
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "(%@) Failed to select database rows modified with error: %@");
}

- (void)_didCompleteMaintenance:shouldDefer:.cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "(%@) Failed to resolve set: %@");
}

- (void)_didCompleteMaintenance:shouldDefer:.cold.2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "(%@) Failed to update last maintenance date", v2, v3, v4, v5, 2u);
}

- (void)_didCompleteMaintenance:shouldDefer:.cold.3()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "(%@) Failed to clean database", v2, v3, v4, v5, 2u);
}

- (void)_didCompleteMaintenance:shouldDefer:.cold.4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "(%@) Failed to perform data resource-specific maintenance", v2, v3, v4, v5, 2u);
}

@end