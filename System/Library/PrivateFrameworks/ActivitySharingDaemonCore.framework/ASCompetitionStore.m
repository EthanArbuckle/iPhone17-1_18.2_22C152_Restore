@interface ASCompetitionStore
- (ASCompetitionStore)initWithDatabaseClient:(id)a3;
- (BOOL)_removeCompetitionsWithFriendFromDatabase:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (BOOL)_saveCompetitionListToDatabase:(id)a3 owner:(int64_t)a4 error:(id *)a5;
- (BOOL)_saveCompetitionLists:(id)a3 owner:(int64_t)a4;
- (BOOL)_saveCompetitionsToDatabase:(id)a3 friendUUID:(id)a4 type:(int64_t)a5 error:(id *)a6;
- (BOOL)loadCachedCompetitions;
- (BOOL)saveCompetitionLists:(id)a3;
- (BOOL)saveRemoteCompetitionList:(id)a3;
- (id)_cachedCompetitionListForFriendWithUUID:(id)a3 type:(int64_t)a4 owner:(int64_t)a5;
- (id)_queue_competitionListCacheForType:(int64_t)a3 owner:(int64_t)a4;
- (id)archivedCompetitionListForFriendWithUUID:(id)a3;
- (id)currentCompetitionListForFriendWithUUID:(id)a3;
- (id)currentRemoteCompetitionForContact:(id)a3;
- (void)_queue_saveCompetitionListsToCache:(id)a3 owner:(int64_t)a4;
- (void)deleteCachedCompetitions;
@end

@implementation ASCompetitionStore

- (ASCompetitionStore)initWithDatabaseClient:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASCompetitionStore;
  v6 = [(ASCompetitionStore *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseClient, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    currentCompetitionListCache = v7->_currentCompetitionListCache;
    v7->_currentCompetitionListCache = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    archivedCompetitionListCache = v7->_archivedCompetitionListCache;
    v7->_archivedCompetitionListCache = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    remoteCompetitionListCache = v7->_remoteCompetitionListCache;
    v7->_remoteCompetitionListCache = (NSMutableDictionary *)v12;

    uint64_t v14 = HKCreateSerialUtilityDispatchQueue();
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v14;
  }
  return v7;
}

- (BOOL)loadCachedCompetitions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__ASCompetitionStore_loadCachedCompetitions__block_invoke;
  v5[3] = &unk_2652161B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __44__ASCompetitionStore_loadCachedCompetitions__block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  v2 = *MEMORY[0x263F23AB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "CompetitionStore loading cached competitions", buf, 2u);
  }
  char v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v69 = 0;
  uint64_t v4 = [v3 allCodableDatabaseCompetitionsWithError:&v69];
  id v5 = v69;
  v56 = (void *)v4;
  if (v4)
  {
    id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
    id v68 = v5;
    v7 = [v6 allCodableDatabaseCompetitionListEntriesWithError:&v68];
    id v50 = v68;

    v49 = v7;
    if (v7)
    {
      uint64_t v51 = a1;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = v7;
      uint64_t v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16, v7);
      if (v57)
      {
        uint64_t v55 = *(void *)v65;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v65 != v55) {
              objc_enumerationMutation(obj);
            }
            uint64_t v58 = v8;
            char v9 = *(void **)(*((void *)&v64 + 1) + 8 * v8);
            uint64_t v10 = [v9 type];
            ASLoggingInitialize();
            v11 = (void *)*MEMORY[0x263F23AB8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEBUG)) {
              __44__ASCompetitionStore_loadCachedCompetitions__block_invoke_cold_3(buf, v11, v9, &v74);
            }
            id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            id v12 = v56;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v60 objects:v72 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v61;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v61 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  objc_super v17 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                  if ([v17 type] == v10)
                  {
                    v18 = [v17 friendUUID];
                    v19 = [v9 friendUUID];
                    int v20 = [v18 isEqual:v19];

                    if (v20) {
                      [v59 addObject:v17];
                    }
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v60 objects:v72 count:16];
              }
              while (v14);
            }

            v21 = [MEMORY[0x263F23BB8] competitionListFromCodableDatabaseCompetitionList:v9 codableCompetitions:v59 withType:v10];
            if (![v9 owner]) {
              [v52 addObject:v21];
            }
            if ([v9 owner] == 1) {
              [v53 addObject:v21];
            }

            uint64_t v8 = v58 + 1;
          }
          while (v58 + 1 != v57);
          uint64_t v57 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
        }
        while (v57);
      }

      objc_msgSend(*(id *)(v51 + 32), "_queue_saveCompetitionListsToCache:owner:", v52, 0);
      objc_msgSend(*(id *)(v51 + 32), "_queue_saveCompetitionListsToCache:owner:", v53, 1);
      ASLoggingInitialize();
      v22 = (void *)*MEMORY[0x263F23AB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(void **)(*(void *)(v51 + 32) + 24);
        v24 = v22;
        uint64_t v25 = [v23 count];
        *(_DWORD *)v70 = 134217984;
        uint64_t v71 = v25;
        _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "Loaded %lu cached current competition lists", v70, 0xCu);
      }
      ASLoggingInitialize();
      v26 = (void *)*MEMORY[0x263F23AB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
      {
        v27 = *(void **)(*(void *)(v51 + 32) + 32);
        v28 = v26;
        uint64_t v29 = [v27 count];
        *(_DWORD *)v70 = 134217984;
        uint64_t v71 = v29;
        _os_log_impl(&dword_2474C9000, v28, OS_LOG_TYPE_DEFAULT, "Loaded %lu cached archived competition lists", v70, 0xCu);
      }
      ASLoggingInitialize();
      v30 = (void *)*MEMORY[0x263F23AB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
      {
        v31 = *(void **)(*(void *)(v51 + 32) + 40);
        v32 = v30;
        uint64_t v33 = [v31 count];
        *(_DWORD *)v70 = 134217984;
        uint64_t v71 = v33;
        _os_log_impl(&dword_2474C9000, v32, OS_LOG_TYPE_DEFAULT, "Loaded %lu cached remote competitions", v70, 0xCu);
      }
    }
    else
    {
      ASLoggingInitialize();
      v42 = *MEMORY[0x263F23AB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
        __44__ASCompetitionStore_loadCachedCompetitions__block_invoke_cold_2((uint64_t)v50, v42, v43, v44, v45, v46, v47, v48);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }

    id v5 = v50;
  }
  else
  {
    uint64_t v34 = a1;
    ASLoggingInitialize();
    v35 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      __44__ASCompetitionStore_loadCachedCompetitions__block_invoke_cold_1((uint64_t)v5, v35, v36, v37, v38, v39, v40, v41);
    }
    *(unsigned char *)(*(void *)(*(void *)(v34 + 40) + 8) + 24) = 0;
  }
}

- (void)deleteCachedCompetitions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__ASCompetitionStore_deleteCachedCompetitions__block_invoke;
  v11[3] = &unk_265217200;
  v11[4] = self;
  char v3 = (void *)MEMORY[0x24C557E50](v11, a2);
  databaseClient = self->_databaseClient;
  id v10 = 0;
  BOOL v5 = [(ASDatabaseClient *)databaseClient performDatabaseCompetitionWriteTransactionBlock:v3 error:&v10];
  id v6 = v10;
  v7 = v6;
  if (!v5 || v6 != 0)
  {
    ASLoggingInitialize();
    char v9 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v7;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Error deleting all cached competitions: %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __46__ASCompetitionStore_deleteCachedCompetitions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v15 = 0;
  int v5 = [v4 removeAllCodableDatabaseCompetitionListsWithError:&v15];
  id v6 = v15;
  v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v14 = 0;
  unsigned int v8 = [v7 removeAllCodableDatabaseCompetitionsWithError:&v14];
  id v9 = v14;
  id v10 = v9;
  if (v6) {
    v11 = v6;
  }
  else {
    v11 = v9;
  }
  id v12 = v11;
  if (v12)
  {
    if (a2) {
      *a2 = v12;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v5 & v8;
}

- (id)currentCompetitionListForFriendWithUUID:(id)a3
{
  return [(ASCompetitionStore *)self _cachedCompetitionListForFriendWithUUID:a3 type:0 owner:0];
}

- (id)archivedCompetitionListForFriendWithUUID:(id)a3
{
  return [(ASCompetitionStore *)self _cachedCompetitionListForFriendWithUUID:a3 type:1 owner:0];
}

- (id)currentRemoteCompetitionForContact:(id)a3
{
  uint64_t v4 = [a3 primaryRemoteRelationship];
  int v5 = [v4 UUID];
  id v6 = [(ASCompetitionStore *)self _cachedCompetitionListForFriendWithUUID:v5 type:0 owner:1];

  v7 = [v6 currentCompetition];

  return v7;
}

- (BOOL)saveCompetitionLists:(id)a3
{
  return [(ASCompetitionStore *)self _saveCompetitionLists:a3 owner:0];
}

- (BOOL)saveRemoteCompetitionList:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v8 count:1];

  LOBYTE(self) = -[ASCompetitionStore _saveCompetitionLists:owner:](self, "_saveCompetitionLists:owner:", v6, 1, v8, v9);
  return (char)self;
}

- (BOOL)_saveCompetitionLists:(id)a3 owner:(int64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __50__ASCompetitionStore__saveCompetitionLists_owner___block_invoke;
  v27[3] = &unk_265217228;
  id v7 = v6;
  uint64_t v29 = self;
  int64_t v30 = a4;
  id v28 = v7;
  id v8 = (void *)MEMORY[0x24C557E50](v27);
  databaseClient = self->_databaseClient;
  id v26 = 0;
  BOOL v10 = [(ASDatabaseClient *)databaseClient performDatabaseCompetitionWriteTransactionBlock:v8 error:&v26];
  id v11 = v26;
  id v12 = v11;
  if (!v10 || v11)
  {
    ASLoggingInitialize();
    uint64_t v13 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      -[ASCompetitionStore _saveCompetitionLists:owner:]((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ASCompetitionStore__saveCompetitionLists_owner___block_invoke_288;
  block[3] = &unk_265215B80;
  block[4] = self;
  id v24 = v7;
  int64_t v25 = a4;
  id v21 = v7;
  dispatch_async(serialQueue, block);

  return v10;
}

uint64_t __50__ASCompetitionStore__saveCompetitionLists_owner___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v55 = *MEMORY[0x263EF8340];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v39 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v47;
    LODWORD(v5) = 1;
    id v6 = (os_log_t *)MEMORY[0x263F23AB8];
    *(void *)&long long v4 = 138412290;
    long long v36 = v4;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        ASLoggingInitialize();
        uint64_t v9 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(v3 + 48);
          *(_DWORD *)buf = 134218242;
          uint64_t v51 = v10;
          __int16 v52 = 2112;
          id v53 = v8;
          _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "CompetitionStore persisting competition list to database for owner: %lu, competitionList: %@", buf, 0x16u);
        }
        int v42 = v5;
        id v11 = *(void **)(v3 + 40);
        uint64_t v12 = *(void *)(v3 + 48);
        id v45 = 0;
        int v41 = objc_msgSend(v11, "_saveCompetitionListToDatabase:owner:error:", v8, v12, &v45, v36);
        id v13 = v45;
        ASLoggingInitialize();
        os_log_t v14 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = v14;
          uint64_t v16 = [v8 type];
          uint64_t v17 = [v8 friendUUID];
          *(_DWORD *)buf = 134218242;
          uint64_t v51 = v16;
          id v6 = (os_log_t *)MEMORY[0x263F23AB8];
          __int16 v52 = 2112;
          id v53 = v17;
          _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "CompetitionStore removing competitions of type %lu with friend %@", buf, 0x16u);
        }
        uint64_t v18 = a2;
        uint64_t v19 = *(void **)(v3 + 40);
        int v20 = [v8 friendUUID];
        uint64_t v21 = [v8 type];
        id v44 = 0;
        int v40 = [v19 _removeCompetitionsWithFriendFromDatabase:v20 type:v21 error:&v44];
        id v22 = v44;

        ASLoggingInitialize();
        os_log_t v23 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = v23;
          int64_t v25 = [v8 competitions];
          *(_DWORD *)buf = v36;
          uint64_t v51 = (uint64_t)v25;
          _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "CompetitionStore saving competitions [%@]", buf, 0xCu);
        }
        uint64_t v26 = v3;
        v27 = *(void **)(v3 + 40);
        id v28 = [v8 competitions];
        uint64_t v29 = [v8 friendUUID];
        uint64_t v30 = [v8 type];
        id v43 = 0;
        unsigned int v31 = [v27 _saveCompetitionsToDatabase:v28 friendUUID:v29 type:v30 error:&v43];
        id v32 = v43;

        if (v22) {
          uint64_t v33 = v22;
        }
        else {
          uint64_t v33 = v32;
        }
        if (v13) {
          uint64_t v33 = v13;
        }
        id v34 = v33;
        a2 = v18;
        if (v34)
        {
          if (v18) {
            void *v18 = v34;
          }
          else {
            _HKLogDroppedError();
          }
        }
        uint64_t v5 = v42 & v41 & v40 & v31;

        uint64_t v3 = v26;
        id v6 = (os_log_t *)MEMORY[0x263F23AB8];
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v39);
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

void __50__ASCompetitionStore__saveCompetitionLists_owner___block_invoke_288(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 40) copy];
  objc_msgSend(v2, "_queue_saveCompetitionListsToCache:owner:", v3, *(void *)(a1 + 48));
}

- (BOOL)_saveCompetitionListToDatabase:(id)a3 owner:(int64_t)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [v8 codableDatabaseCompetitionListEntryForOwner:a4];
  BOOL v10 = [(ASDatabaseClient *)self->_databaseClient saveCodableDatabaseCompetitionListEntry:v9 error:a5];
  if (!v10)
  {
    ASLoggingInitialize();
    id v11 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = *a5;
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "CompetitionStore: Persisting competition list [%@] failed with error [%@]", (uint8_t *)&v14, 0x16u);
    }
  }

  return v10;
}

- (BOOL)_removeCompetitionsWithFriendFromDatabase:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = [(ASDatabaseClient *)self->_databaseClient removeCodableDatabaseCompetitionsWithFriendUUID:v8 type:a4 error:a5];
  if (!v9)
  {
    ASLoggingInitialize();
    BOOL v10 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *a5;
      int v13 = 134218498;
      int64_t v14 = a4;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "CompetitionStore: Removing competitions of type %lu for friend with UUID [%@] failed with error [%@]", (uint8_t *)&v13, 0x20u);
    }
  }

  return v9;
}

- (BOOL)_saveCompetitionsToDatabase:(id)a3 friendUUID:(id)a4 type:(int64_t)a5 error:(id *)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = [MEMORY[0x263F23BB0] codableDatabaseCompetitionsFromCompetitions:v10 withFriendWithUUID:a4 withType:a5];
  BOOL v12 = [(ASDatabaseClient *)self->_databaseClient saveCodableDatabaseCompetitions:v11 error:a6];
  if (!v12)
  {
    ASLoggingInitialize();
    int v13 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *a6;
      int v16 = 138412546;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "CompetitionStore: Persisting competitions to database [%@] failed with error [%@]", (uint8_t *)&v16, 0x16u);
    }
  }

  return v12;
}

- (void)_queue_saveCompetitionListsToCache:(id)a3 owner:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v21;
    BOOL v12 = (os_log_t *)MEMORY[0x263F23AB8];
    *(void *)&long long v9 = 138412290;
    long long v19 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        __int16 v15 = objc_msgSend(v14, "friendUUID", v19, (void)v20);

        if (v15)
        {
          int v16 = -[ASCompetitionStore _queue_competitionListCacheForType:owner:](self, "_queue_competitionListCacheForType:owner:", [v14 type], a4);
          id v17 = [v14 friendUUID];
          [v16 setObject:v14 forKeyedSubscript:v17];
        }
        else
        {
          ASLoggingInitialize();
          __int16 v18 = *v12;
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            int64_t v25 = v14;
            _os_log_error_impl(&dword_2474C9000, v18, OS_LOG_TYPE_ERROR, "Unable to cache competition list with no friend UUID: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v10);
  }
}

- (id)_cachedCompetitionListForFriendWithUUID:(id)a3 type:(int64_t)a4 owner:(int64_t)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__10;
  long long v22 = __Block_byref_object_dispose__10;
  id v23 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ASCompetitionStore__cachedCompetitionListForFriendWithUUID_type_owner___block_invoke;
  block[3] = &unk_265217250;
  int64_t v16 = a4;
  int64_t v17 = a5;
  id v14 = v8;
  __int16 v15 = &v18;
  block[4] = self;
  id v10 = v8;
  dispatch_sync(serialQueue, block);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __73__ASCompetitionStore__cachedCompetitionListForFriendWithUUID_type_owner___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_competitionListCacheForType:owner:", *(void *)(a1 + 56), *(void *)(a1 + 64));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_queue_competitionListCacheForType:(int64_t)a3 owner:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a4 != 1)
  {
    if (a4) {
      goto LABEL_14;
    }
    if (a3 == 1)
    {
      archivedCompetitionListCache = self->_archivedCompetitionListCache;
    }
    else
    {
      if (a3) {
        goto LABEL_14;
      }
      archivedCompetitionListCache = self->_currentCompetitionListCache;
    }
LABEL_10:
    id v7 = archivedCompetitionListCache;
    goto LABEL_14;
  }
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_14;
    }
    archivedCompetitionListCache = self->_remoteCompetitionListCache;
    goto LABEL_10;
  }
  ASLoggingInitialize();
  long long v9 = *MEMORY[0x263F23AB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
    -[ASCompetitionStore _queue_competitionListCacheForType:owner:](v9);
  }
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
LABEL_14:
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCompetitionListCache, 0);
  objc_storeStrong((id *)&self->_archivedCompetitionListCache, 0);
  objc_storeStrong((id *)&self->_currentCompetitionListCache, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_databaseClient, 0);
}

void __44__ASCompetitionStore_loadCachedCompetitions__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__ASCompetitionStore_loadCachedCompetitions__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__ASCompetitionStore_loadCachedCompetitions__block_invoke_cold_3(uint8_t *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = [a3 friendUUID];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEBUG, "Filtering for competition list with friendUUID: %@", a1, 0xCu);
}

- (void)_saveCompetitionLists:(uint64_t)a3 owner:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queue_competitionListCacheForType:(os_log_t)log owner:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "Archived competitions are not supported for remote owner", v1, 2u);
}

@end