@interface AVTStoreBackendMigrator
- (AVTCoreEnvironment)environment;
- (AVTStoreBackendMigrator)initWithEnvironment:(id)a3;
- (AVTUILogger)logger;
- (BOOL)migrateContentFromSource:(id)a3 toDestination:(id)a4 error:(id *)a5;
- (id)updatedRecordsForMigratingRecords:(id)a3 source:(id)a4 destinationBackend:(id)a5 error:(id *)a6;
@end

@implementation AVTStoreBackendMigrator

- (AVTStoreBackendMigrator)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVTStoreBackendMigrator;
  v6 = [(AVTStoreBackendMigrator *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 logger];
    logger = v6->_logger;
    v6->_logger = (AVTUILogger *)v7;

    objc_storeStrong((id *)&v6->_environment, a3);
  }

  return v6;
}

- (BOOL)migrateContentFromSource:(id)a3 toDestination:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  objc_super v10 = [(AVTStoreBackendMigrator *)self logger];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__AVTStoreBackendMigrator_migrateContentFromSource_toDestination_error___block_invoke;
  v15[3] = &unk_2647C40E0;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  v18 = &v20;
  v19 = &v26;
  id v12 = v9;
  id v17 = v12;
  [v10 migratingPersistedContent:v15];

  int v13 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((unsigned char *)v27 + 24)) {
    *a5 = (id) v21[5];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13 != 0;
}

void __72__AVTStoreBackendMigrator_migrateContentFromSource_toDestination_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logger];
  v3 = [*(id *)(a1 + 40) description];
  [v2 logMigratingSource:v3];

  v4 = [*(id *)(a1 + 40) createSourceBackend];
  id v5 = +[AVTAvatarFetchRequest requestForAllAvatars];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v4 avatarsForFetchRequest:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v7 != 0;
  id v8 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v12 = [v8 logger];
    v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) description];
    [v12 logReadingError:v19];
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v23 = *(id *)(v11 + 40);
  id v12 = [v8 updatedRecordsForMigratingRecords:v7 source:v9 destinationBackend:v10 error:&v23];
  objc_storeStrong((id *)(v11 + 40), v23);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v12 != 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v19 = [*(id *)(a1 + 32) logger];
    uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) description];
    [v19 logErrorUpdatingRecordsForMigration:v20];
    goto LABEL_9;
  }
  int v13 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  id v22 = *(id *)(v14 + 40);
  char v15 = [v13 saveAvatars:v12 error:&v22];
  objc_storeStrong((id *)(v14 + 40), v22);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v15;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v19 = [*(id *)(a1 + 32) logger];
    uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) description];
    [v19 logSavingError:v20];
    goto LABEL_9;
  }
  id v16 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  id v21 = *(id *)(v17 + 40);
  char v18 = [v16 finalizeMigration:&v21];
  objc_storeStrong((id *)(v17 + 40), v21);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v18;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v19 = [*(id *)(a1 + 32) logger];
    uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) description];
    [v19 logErrorDeletingMigratedContent:v20];
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:
}

- (id)updatedRecordsForMigratingRecords:(id)a3 source:(id)a4 destinationBackend:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = +[AVTAvatarFetchRequest requestForAllAvatars];
  uint64_t v14 = [v12 avatarsForFetchRequest:v13 error:a6];
  char v15 = objc_msgSend(v14, "avt_map:", &__block_literal_global_7);

  if (v15)
  {
    id v16 = [MEMORY[0x263EFF980] array];
    if ([v10 count])
    {
      unint64_t v17 = 0;
      do
      {
        char v18 = [v10 objectAtIndexedSubscript:v17];
        v19 = [v18 identifier];
        int v20 = [v15 containsObject:v19];

        if (v20)
        {
          id v21 = [(AVTStoreBackendMigrator *)self logger];
          [v21 logFoundExistingRecordDuringMigration];
        }
        else
        {
          id v21 = objc_msgSend(v11, "migratedRecordFromRecord:index:totalCount:", v18, v17, objc_msgSend(v10, "count"));
          [v16 addObject:v21];
        }

        ++v17;
      }
      while (v17 < [v10 count]);
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

uint64_t __93__AVTStoreBackendMigrator_updatedRecordsForMigratingRecords_source_destinationBackend_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end