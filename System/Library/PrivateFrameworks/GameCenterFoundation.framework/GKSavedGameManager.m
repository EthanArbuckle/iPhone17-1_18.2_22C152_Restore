@interface GKSavedGameManager
+ (id)sharedManager;
- (BOOL)ubiquityUnavailable;
- (GKSavedGameManager)init;
- (NSMetadataQuery)query;
- (NSMutableArray)fetchHandlers;
- (NSMutableDictionary)documents;
- (NSURL)ubiquityURL;
- (id)currentDocumentWithName:(id)a3;
- (id)documentForSavedGame:(id)a3;
- (id)documentToSaveWithName:(id)a3;
- (id)errorForNoUbiquity;
- (id)fileURLForName:(id)a3;
- (id)savedGameForDocument:(id)a3;
- (id)savedGameForDocuments:(id)a3;
- (id)savedGamesWithName:(id)a3;
- (int64_t)queryDisableCount;
- (void)addDocument:(id)a3;
- (void)callFetchHandlers;
- (void)dealloc;
- (void)deleteSavedGamesWithName:(id)a3 completionHandler:(id)a4;
- (void)disableQueryUpdates;
- (void)documentConflictStateChanged:(id)a3;
- (void)documentModified:(id)a3;
- (void)enableQueryUpdates;
- (void)fetchSavedGamesWithCompletionHandler:(id)a3;
- (void)loadDataForSavedGame:(id)a3 completionHandler:(id)a4;
- (void)queryDidFinishGathering:(id)a3;
- (void)queryDidUpdate:(id)a3;
- (void)removeDocument:(id)a3;
- (void)resolveConflictingSavedGames:(id)a3 withData:(id)a4 completionHandler:(id)a5;
- (void)saveGameData:(id)a3 withName:(id)a4 completionHandler:(id)a5;
- (void)setDocuments:(id)a3;
- (void)setFetchHandlers:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueryDisableCount:(int64_t)a3;
- (void)setUbiquityURL:(id)a3;
- (void)setUbiquityUnavailable:(BOOL)a3;
- (void)setupUbiquity;
- (void)startSavedGameQuery;
- (void)updateSavedGameDocumentsForQueryWithHandler:(id)a3;
@end

@implementation GKSavedGameManager

+ (id)sharedManager
{
  if (sharedManager_sOnceToken != -1) {
    dispatch_once(&sharedManager_sOnceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedManager_sManager;

  return v2;
}

uint64_t __35__GKSavedGameManager_sharedManager__block_invoke()
{
  sharedManager_sManager = objc_alloc_init(GKSavedGameManager);

  return MEMORY[0x1F41817F8]();
}

- (GKSavedGameManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKSavedGameManager;
  v2 = [(GKSavedGameManager *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_documentModified_ name:@"GKSavedGameDocumentModifiedNotification" object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_documentConflictStateChanged_ name:@"GKSavedGameDocumentConflictStateChangedNotification" object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_ubiquityAvailabilityChanged_ name:*MEMORY[0x1E4F28A38] object:0];

    [(GKSavedGameManager *)v2 setupUbiquity];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKSavedGameManager;
  [(GKSavedGameManager *)&v4 dealloc];
}

- (void)fetchSavedGamesWithCompletionHandler:(id)a3
{
  if (a3)
  {
    objc_super v4 = (void *)[a3 copy];
    fetchHandlers = self->_fetchHandlers;
    id v11 = v4;
    if (fetchHandlers)
    {
      v6 = _Block_copy(v4);
      [(NSMutableArray *)fetchHandlers addObject:v6];
    }
    else
    {
      objc_super v7 = (void *)MEMORY[0x1E4F1CA48];
      v6 = _Block_copy(v4);
      v8 = [v7 arrayWithObject:v6];
      [(GKSavedGameManager *)self setFetchHandlers:v8];
    }
    documents = self->_documents;
    if (documents
      && (uint64_t v10 = [(NSMutableDictionary *)documents count],
          v10 == [(NSMetadataQuery *)self->_query resultCount])
      || self->_ubiquityUnavailable)
    {
      [(GKSavedGameManager *)self callFetchHandlers];
    }
  }
}

- (id)savedGamesWithName:(id)a3
{
  if (a3)
  {
    objc_super v4 = -[NSMutableDictionary objectForKey:](self->_documents, "objectForKey:");
    v5 = [v4 allObjects];

    id v6 = [(GKSavedGameManager *)self savedGameForDocuments:v5];
  }
  else
  {
    objc_super v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_documents, "count"));
    documents = self->_documents;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__GKSavedGameManager_savedGamesWithName___block_invoke;
    v11[3] = &unk_1E646D8D8;
    id v9 = v7;
    id v12 = v9;
    v13 = self;
    [(NSMutableDictionary *)documents enumerateKeysAndObjectsUsingBlock:v11];
    id v6 = v9;
  }

  return v6;
}

void __41__GKSavedGameManager_savedGamesWithName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 allObjects];
  objc_super v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) savedGameForDocuments:v6];
  [v4 addObjectsFromArray:v5];
}

- (id)savedGameForDocuments:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[GKSavedGameManager savedGameForDocument:](self, "savedGameForDocument:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)savedGameForDocument:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(GKSavedGame);
    v5 = [v3 fileURL];
    [(GKSavedGame *)v4 setFileURL:v5];

    id v6 = [v3 name];
    [(GKSavedGame *)v4 setName:v6];

    uint64_t v7 = [v3 deviceName];
    [(GKSavedGame *)v4 setDeviceName:v7];

    uint64_t v8 = [v3 modificationDate];

    [(GKSavedGame *)v4 setModificationDate:v8];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)fileURLForName:(id)a3
{
  id v3 = [(NSURL *)self->_ubiquityURL URLByAppendingPathComponent:a3];
  id v4 = [v3 URLByAppendingPathExtension:@"bundle"];

  return v4;
}

- (void)addDocument:(id)a3
{
  documents = self->_documents;
  id v5 = a3;
  id v6 = [v5 name];
  id v11 = [(NSMutableDictionary *)documents objectForKey:v6];

  if (v11)
  {
    uint64_t v7 = [v5 fileURL];
    [v11 setObject:v5 forKey:v7];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v9 = [v5 fileURL];
    id v11 = [v8 dictionaryWithObject:v5 forKey:v9];

    uint64_t v10 = self->_documents;
    uint64_t v7 = [v5 name];

    [(NSMutableDictionary *)v10 setObject:v11 forKey:v7];
  }
}

- (void)removeDocument:(id)a3
{
  id v4 = a3;
  id v7 = [v4 name];
  id v5 = -[NSMutableDictionary objectForKey:](self->_documents, "objectForKey:");
  id v6 = [v4 fileURL];

  [v5 removeObjectForKey:v6];
  if (![v5 count]) {
    [(NSMutableDictionary *)self->_documents removeObjectForKey:v7];
  }
}

- (id)documentForSavedGame:(id)a3
{
  documents = self->_documents;
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = [(NSMutableDictionary *)documents objectForKey:v5];

  id v7 = [v4 fileURL];

  uint64_t v8 = [v6 objectForKey:v7];

  return v8;
}

- (id)documentToSaveWithName:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[GKSavedGameDocument currentDeviceName];
    id v23 = v4;
    id v6 = [(NSMutableDictionary *)self->_documents objectForKey:v4];
    id v7 = [v6 allObjects];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v8);
          }
          long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v15 = [v14 deviceName];
          int v16 = [v15 isEqualToString:v5];

          if (v16)
          {
            id v21 = v14;

            id v11 = v21;
            goto LABEL_17;
          }
          if (v11)
          {
            v17 = [v14 modificationDate];
            uint64_t v18 = [v11 modificationDate];
            uint64_t v19 = [v17 compare:v18];

            if (v19 != 1) {
              continue;
            }
          }
          id v20 = v14;

          id v11 = v20;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v11 = 0;
    }
LABEL_17:

    id v4 = v23;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)currentDocumentWithName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_documents objectForKey:v4];
    id v6 = [v5 allObjects];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v7);
          }
          long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isConflictVersion", (void)v16) & 1) == 0)
          {
            id v14 = v13;

            uint64_t v10 = v14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)loadDataForSavedGame:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = NSString;
    id v8 = a3;
    uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", @"%s:%d %s", "GKSavedGameManager.m", 206, "-[GKSavedGameManager loadDataForSavedGame:completionHandler:]");
    uint64_t v10 = +[GKDispatchGroup dispatchGroupWithName:v9];

    [(GKSavedGameManager *)self disableQueryUpdates];
    uint64_t v11 = [(GKSavedGameManager *)self documentForSavedGame:v8];

    if (v11)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke;
      v18[3] = &unk_1E646D928;
      id v19 = v11;
      id v20 = v10;
      [v20 perform:v18];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
      [v10 setError:v12];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke_3;
    v14[3] = &unk_1E646D950;
    long long v16 = self;
    id v17 = v6;
    id v15 = v10;
    id v13 = v10;
    [v13 notifyOnMainQueueWithBlock:v14];
  }
}

void __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke_2;
  v6[3] = &unk_1E646D900;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 loadDataWithCompletionHandler:v6];
}

uint64_t __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setObject:a2 forKeyedSubscript:@"data"];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

uint64_t __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"data"];
    id v4 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);
  }
  id v5 = *(void **)(a1 + 40);

  return [v5 enableQueryUpdates];
}

- (void)saveGameData:(id)a3 withName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKSavedGameManager.m", 232, "-[GKSavedGameManager saveGameData:withName:completionHandler:]");
  uint64_t v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  [(GKSavedGameManager *)self disableQueryUpdates];
  id v13 = [(GKSavedGameManager *)self documentToSaveWithName:v9];
  if ([(GKSavedGameDocument *)v13 hasConflict])
  {
    if (!os_log_GKGeneral) {
      id v14 = GKOSLoggers();
    }
    id v15 = (void *)os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKSavedGameManager saveGameData:withName:completionHandler:](v15, v13);
    }
  }
  if (v9) {
    BOOL v16 = v13 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  char v17 = v16;
  if (v16)
  {
    if (!self->_ubiquityURL)
    {
      char v17 = 0;
      goto LABEL_19;
    }
    long long v18 = [GKSavedGameDocument alloc];
    id v19 = [(GKSavedGameManager *)self fileURLForName:v9];
    id v13 = [(GKSavedGameDocument *)v18 initWithFileURL:v19];

    [(GKSavedGameDocument *)v13 setName:v9];
  }
  if (!v13)
  {
LABEL_19:
    uint64_t v21 = [(GKSavedGameManager *)self errorForNoUbiquity];
    [v12 setError:v21];
    id v20 = 0;
    goto LABEL_20;
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke;
  v31[3] = &unk_1E646D9A0;
  id v20 = v13;
  v32 = v20;
  id v33 = v8;
  id v34 = v12;
  [v34 perform:v31];

  uint64_t v21 = v32;
LABEL_20:

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke_3;
  v25[3] = &unk_1E646D9C8;
  char v30 = v17;
  id v26 = v12;
  long long v27 = self;
  v28 = v20;
  id v29 = v10;
  id v22 = v10;
  id v23 = v20;
  id v24 = v12;
  [v24 notifyOnMainQueueWithBlock:v25];
}

void __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke_2;
  v7[3] = &unk_1E646D978;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  [v4 saveData:v5 completionHandler:v7];
}

uint64_t __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = [*(id *)(a1 + 32) error];

    if (!v2) {
      [*(id *)(a1 + 40) addDocument:*(void *)(a1 + 48)];
    }
  }
  if (*(void *)(a1 + 56))
  {
    id v3 = [*(id *)(a1 + 32) error];
    if (v3)
    {
      id v4 = 0;
    }
    else
    {
      id v4 = [*(id *)(a1 + 40) savedGameForDocument:*(void *)(a1 + 48)];
    }

    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v6);
  }
  id v7 = *(void **)(a1 + 40);

  return [v7 enableQueryUpdates];
}

- (void)deleteSavedGamesWithName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKSavedGameManager.m", 274, "-[GKSavedGameManager deleteSavedGamesWithName:completionHandler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  [(GKSavedGameManager *)self disableQueryUpdates];
  id v10 = [(GKSavedGameManager *)self currentDocumentWithName:v6];
  uint64_t v11 = v10;
  if (v10)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke;
    v20[3] = &unk_1E646D928;
    id v21 = v10;
    id v22 = v9;
    [v22 perform:v20];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke_3;
  v15[3] = &unk_1E646D9F0;
  id v16 = v9;
  char v17 = self;
  id v18 = v6;
  id v19 = v7;
  id v12 = v7;
  id v13 = v6;
  id v14 = v9;
  [v14 notifyOnMainQueueWithBlock:v15];
}

void __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke_2;
  v6[3] = &unk_1E646D978;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 deleteAllVersionsIncludingCurrent:1 withCompletionHandler:v6];
}

uint64_t __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];

  if (!v2) {
    [*(id *)(*(void *)(a1 + 40) + 32) removeObjectForKey:*(void *)(a1 + 48)];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  id v5 = *(void **)(a1 + 40);

  return [v5 enableQueryUpdates];
}

- (void)documentModified:(id)a3
{
  id v15 = a3;
  id v4 = [MEMORY[0x1E4F29060] currentThread];
  char v5 = [v4 isMainThread];

  if ((v5 & 1) == 0)
  {
    id v6 = NSString;
    id v7 = [NSString stringWithFormat:@"document modified notification received on thread other than main thread"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKSavedGameManager.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = [v6 stringWithFormat:@"%@ ([[NSThread currentThread] isMainThread])\n[%s (%s:%d)]", v7, "-[GKSavedGameManager documentModified:]", objc_msgSend(v9, "UTF8String"), 300];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v10 format];
  }
  uint64_t v11 = [v15 object];
  id v12 = [(GKSavedGameManager *)self savedGameForDocument:v11];
  id v13 = +[GKLocalPlayer localPlayer];
  id v14 = [v13 eventEmitter];
  [v14 player:v13 didModifySavedGame:v12];
}

- (id)errorForNoUbiquity
{
  uint64_t v3 = +[GKLocalPlayer localPlayer];
  int v4 = [v3 isAuthenticated];

  if (v4)
  {
    if (self->_ubiquityUnavailable) {
      uint64_t v5 = 27;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 6;
  }
  id v6 = (void *)MEMORY[0x1E4F28C58];

  return (id)[v6 userErrorForCode:v5 underlyingError:0];
}

- (void)startSavedGameQuery
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__GKSavedGameManager_startSavedGameQuery__block_invoke;
  block[3] = &unk_1E646D7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__GKSavedGameManager_startSavedGameQuery__block_invoke(uint64_t a1)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28E38]);
    [*(id *)(a1 + 32) setQuery:v2];

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v4 = *MEMORY[0x1E4F28640];
    v17[0] = *MEMORY[0x1E4F28638];
    v17[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [v3 setSearchScopes:v5];

    id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K ENDSWITH %@", *MEMORY[0x1E4F285E8], @"bundle"];
    [*(id *)(*(void *)(a1 + 32) + 24) setPredicate:v6];
    id v7 = *(void **)(*(void *)(a1 + 32) + 24);
    id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F285D8] ascending:1];
    id v16 = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [v7 setSortDescriptors:v9];

    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:*(void *)(a1 + 32) selector:sel_queryDidFinishGathering_ name:*MEMORY[0x1E4F28618] object:*(void *)(*(void *)(a1 + 32) + 24)];

    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:*(void *)(a1 + 32) selector:sel_queryDidUpdate_ name:*MEMORY[0x1E4F28620] object:*(void *)(*(void *)(a1 + 32) + 24)];

    if (([*(id *)(*(void *)(a1 + 32) + 24) startQuery] & 1) == 0)
    {
      id v12 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v13 = GKOSLoggers();
        id v12 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __41__GKSavedGameManager_startSavedGameQuery__block_invoke_cold_2(v12);
      }
      [*(id *)(a1 + 32) setQuery:0];
      [*(id *)(a1 + 32) callFetchHandlers];
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v14 = GKOSLoggers();
    }
    id v15 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      __41__GKSavedGameManager_startSavedGameQuery__block_invoke_cold_1(v15);
    }
  }
}

- (void)disableQueryUpdates
{
  int64_t queryDisableCount = self->_queryDisableCount;
  if (!queryDisableCount)
  {
    [(NSMetadataQuery *)self->_query disableUpdates];
    int64_t queryDisableCount = self->_queryDisableCount;
  }
  self->_int64_t queryDisableCount = queryDisableCount + 1;
}

- (void)enableQueryUpdates
{
  int64_t v2 = self->_queryDisableCount - 1;
  self->_int64_t queryDisableCount = v2;
  if (!v2) {
    [(NSMetadataQuery *)self->_query enableUpdates];
  }
}

- (void)queryDidFinishGathering:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 removeObserver:self name:*MEMORY[0x1E4F28618] object:self->_query];

  [(GKSavedGameManager *)self disableQueryUpdates];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__GKSavedGameManager_queryDidFinishGathering___block_invoke;
  v5[3] = &unk_1E646DA18;
  v5[4] = self;
  [(GKSavedGameManager *)self updateSavedGameDocumentsForQueryWithHandler:v5];
}

uint64_t __46__GKSavedGameManager_queryDidFinishGathering___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) callFetchHandlers];
  int64_t v2 = *(void **)(a1 + 32);

  return [v2 enableQueryUpdates];
}

- (void)queryDidUpdate:(id)a3
{
  [(GKSavedGameManager *)self disableQueryUpdates];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__GKSavedGameManager_queryDidUpdate___block_invoke;
  v4[3] = &unk_1E646DA18;
  v4[4] = self;
  [(GKSavedGameManager *)self updateSavedGameDocumentsForQueryWithHandler:v4];
}

uint64_t __37__GKSavedGameManager_queryDidUpdate___block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) documents];
  uint64_t v3 = [v2 count];
  uint64_t v4 = [*(id *)(a1 + 32) query];
  uint64_t v5 = [v4 resultCount];

  if (v3 == v5) {
    [*(id *)(a1 + 32) callFetchHandlers];
  }
  id v6 = *(void **)(a1 + 32);

  return [v6 enableQueryUpdates];
}

- (void)updateSavedGameDocumentsForQueryWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKSavedGameManager.m", 390, "-[GKSavedGameManager updateSavedGameDocumentsForQueryWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  query = self->_query;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke;
  v21[3] = &unk_1E646DAB8;
  v21[4] = self;
  id v10 = v7;
  id v22 = v10;
  id v23 = v6;
  id v11 = v8;
  id v24 = v11;
  id v12 = v6;
  [(NSMetadataQuery *)query enumerateResultsUsingBlock:v21];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_61;
  v16[3] = &unk_1E646DAE0;
  id v17 = v10;
  id v18 = self;
  id v19 = v11;
  id v20 = v4;
  id v13 = v11;
  id v14 = v4;
  id v15 = v10;
  [v12 notifyOnMainQueueWithBlock:v16];
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F28608];
  id v4 = a2;
  uint64_t v5 = [v4 valueForAttribute:v3];
  id v6 = [v4 valueForAttribute:*MEMORY[0x1E4F285E8]];
  id v7 = [v6 stringByDeletingPathExtension];

  id v8 = [v4 valueForAttribute:*MEMORY[0x1E4F28688]];

  if ([v8 isEqualToString:*MEMORY[0x1E4F28690]])
  {
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v39 = 0;
    char v10 = [v9 startDownloadingUbiquitousItemAtURL:v5 error:&v39];
    id v11 = v39;

    if ((v10 & 1) == 0)
    {
      if (!os_log_GKGeneral) {
        id v12 = GKOSLoggers();
      }
      id v13 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_cold_1((uint64_t)v5, (uint64_t)v11, v13);
      }
    }
  }
  else
  {
    if (v5) {
      BOOL v14 = v7 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      if (!os_log_GKGeneral) {
        id v15 = GKOSLoggers();
      }
      id v16 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_cold_2(v16);
      }
    }
    else
    {
      id v17 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v7];
      id v18 = [MEMORY[0x1E4F1CA60] dictionary];
      [*(id *)(a1 + 40) setObject:v18 forKey:v7];
      uint64_t v19 = [v17 objectForKey:v5];
      id v20 = (GKSavedGameDocument *)v19;
      if (!v19)
      {
        id v20 = [[GKSavedGameDocument alloc] initWithFileURL:v5];
        [(GKSavedGameDocument *)v20 setName:v7];
      }
      id v21 = *(void **)(a1 + 48);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_58;
      v35[3] = &unk_1E646D9A0;
      id v22 = v20;
      v36 = v22;
      id v23 = v18;
      id v37 = v23;
      id v38 = v5;
      [v21 perform:v35];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_3;
      v28[3] = &unk_1E646DA90;
      id v29 = v22;
      id v24 = *(void **)(a1 + 48);
      id v30 = *(id *)(a1 + 56);
      id v31 = v7;
      id v32 = v17;
      id v33 = *(id *)(a1 + 48);
      id v34 = v23;
      long long v25 = v22;
      id v26 = v17;
      id v27 = v23;
      [v24 perform:v28];
    }
  }
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_58(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_2;
  v6[3] = &unk_1E646DA40;
  id v4 = a1[4];
  id v7 = a1[5];
  id v8 = a1[4];
  id v9 = a1[6];
  id v10 = v3;
  id v5 = v3;
  [v4 loadMetadataWithCompletionHandler:v6];
}

uint64_t __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  char v4 = [a1[4] hasConflict];
  id v5 = a1[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_4;
  v7[3] = &unk_1E646DA68;
  id v8 = v5;
  char v15 = v4;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = a1[7];
  id v12 = a1[8];
  id v13 = a1[9];
  id v14 = v3;
  id v6 = v3;
  [v8 updateConflictStateWithCompletionHandler:v7];
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) hasConflict])
  {
    if (!*(unsigned char *)(a1 + 88)) {
      [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "URL", v15);
          id v11 = [*(id *)(a1 + 56) objectForKey:v10];
          if (!v11)
          {
            id v11 = [[GKSavedGameDocument alloc] initWithFileURL:v10];
            [(GKSavedGameDocument *)v11 setName:*(void *)(a1 + 48)];
            [(GKSavedGameDocument *)v11 setIsConflictVersion:1];
            [(GKSavedGameDocument *)v11 setHasConflict:1];
            [(GKSavedGameDocument *)v11 setFileVersion:v9];
          }
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_5;
          v16[3] = &unk_1E646D9A0;
          id v17 = v11;
          id v12 = *(void **)(a1 + 64);
          id v18 = *(id *)(a1 + 72);
          id v19 = v10;
          id v13 = v10;
          id v14 = v11;
          [v12 perform:v16];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    id v3 = v15;
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_6;
  v6[3] = &unk_1E646DA40;
  id v4 = a1[4];
  id v7 = a1[5];
  id v8 = a1[4];
  id v9 = a1[6];
  id v10 = v3;
  id v5 = v3;
  [v4 loadMetadataWithCompletionHandler:v6];
}

uint64_t __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_61(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v9 = [*(id *)(a1 + 32) objectForKey:v8];
        if (![v9 count]) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v5);
  }

  id v24 = v2;
  [*(id *)(a1 + 32) removeObjectsForKeys:v2];
  id v10 = [*(id *)(*(void *)(a1 + 40) + 32) allKeys];
  id v11 = [*(id *)(a1 + 32) allKeys];
  int v12 = [v10 isEqualToArray:v11];

  [*(id *)(a1 + 40) setDocuments:*(void *)(a1 + 32)];
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    (*(void (**)(uint64_t, void))(v13 + 16))(v13, v12 ^ 1u);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(a1 + 40) savedGamesWithName:*(void *)(*((void *)&v27 + 1) + 8 * j)];
        if ((unint64_t)[v19 count] >= 2)
        {
          long long v20 = +[GKLocalPlayer localPlayer];
          long long v21 = [v20 eventEmitter];
          [v21 player:v20 hasConflictingSavedGames:v19];

          long long v22 = os_log_GKGeneral;
          if (!os_log_GKGeneral)
          {
            id v23 = GKOSLoggers();
            long long v22 = os_log_GKGeneral;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_61_cold_1(&buf, v26, v22);
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v16);
  }
}

- (void)callFetchHandlers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_ubiquityUnavailable)
  {
    id v3 = [(GKSavedGameManager *)self errorForNoUbiquity];
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(GKSavedGameManager *)self savedGamesWithName:0];
    id v3 = 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_fetchHandlers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void (**)(void *, void *, void *))_Block_copy(*(const void **)(*((void *)&v11 + 1) + 8 * i));
        v10[2](v10, v4, v3);
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  -[GKSavedGameManager setFetchHandlers:](self, "setFetchHandlers:", 0, (void)v11);
}

- (void)documentConflictStateChanged:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F29060], "currentThread", a3);
  char v5 = [v4 isMainThread];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = [NSString stringWithFormat:@"document conflict notification received on thread other than main thread"];
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKSavedGameManager.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = [v6 stringWithFormat:@"%@ ([[NSThread currentThread] isMainThread])\n[%s (%s:%d)]", v7, "-[GKSavedGameManager documentConflictStateChanged:]", objc_msgSend(v9, "UTF8String"), 520];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v10 format];
  }

  [(GKSavedGameManager *)self updateSavedGameDocumentsForQueryWithHandler:0];
}

- (void)resolveConflictingSavedGames:(id)a3 withData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [v8 firstObject];
  long long v12 = [v11 name];

  if (v12)
  {
    long long v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKSavedGameManager.m", 533, "-[GKSavedGameManager resolveConflictingSavedGames:withData:completionHandler:]");
    long long v14 = +[GKDispatchGroup dispatchGroupWithName:v13];

    [(GKSavedGameManager *)self disableQueryUpdates];
    uint64_t v15 = [(GKSavedGameManager *)self currentDocumentWithName:v12];
    uint64_t v16 = v15;
    if (v15)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke;
      v26[3] = &unk_1E646D9A0;
      id v27 = v15;
      id v28 = v8;
      id v29 = v14;
      [v29 perform:v26];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_7;
    v19[3] = &unk_1E646DB80;
    id v20 = v8;
    long long v21 = self;
    id v22 = v12;
    id v23 = v9;
    id v24 = v14;
    id v25 = v10;
    id v17 = v14;
    [v17 notifyOnMainQueueWithBlock:v19];
  }
  else if (v10)
  {
    id v18 = [MEMORY[0x1E4F28C58] userErrorForCode:17 underlyingError:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
  }
}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_2;
  v6[3] = &unk_1E646DB30;
  id v4 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = a1[4];
  id v10 = v3;
  id v5 = v3;
  [v4 updateConflictStateWithCompletionHandler:v6];
}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v32 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v11 = [v10 fileURL];

        if (v11)
        {
          long long v12 = [v10 fileURL];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v7);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v13 = v3;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v53 count:16];
  uint64_t v15 = v32;
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v13);
        }
        id v19 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        id v20 = [v19 URL];
        int v21 = [v4 containsObject:v20];

        if (v21) {
          [v32 addObject:v19];
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v16);
  }

  uint64_t v22 = [v32 count];
  if (v22 == [v13 count])
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_3;
    v41[3] = &unk_1E646D928;
    id v23 = *(void **)(a1 + 40);
    id v42 = *(id *)(a1 + 48);
    id v43 = *(id *)(a1 + 40);
    [v23 perform:v41];

    id v24 = v42;
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v24 = v32;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v52 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v38;
      do
      {
        id v28 = v24;
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(v28);
          }
          uint64_t v30 = *(void *)(*((void *)&v37 + 1) + 8 * k);
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_5;
          v33[3] = &unk_1E646D9A0;
          long long v31 = *(void **)(a1 + 40);
          id v34 = *(id *)(a1 + 48);
          uint64_t v35 = v30;
          id v36 = *(id *)(a1 + 40);
          [v31 perform:v33];
        }
        id v24 = v28;
        uint64_t v26 = [v28 countByEnumeratingWithState:&v37 objects:v52 count:16];
      }
      while (v26);
      uint64_t v15 = v32;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_4;
  v6[3] = &unk_1E646D978;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 deleteAllVersionsIncludingCurrent:1 withCompletionHandler:v6];
}

uint64_t __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_6;
  v6[3] = &unk_1E646DB08;
  id v7 = *(id *)(a1 + 48);
  id v5 = a2;
  [v3 deleteConflictVersion:v4 completionHandler:v6];
  v5[2](v5);
}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) error];

  if (!v3) {
    [*(id *)(a1 + 32) setError:v4];
  }
}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(a1 + 40) documentForSavedGame:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        if (v7) {
          [*(id *)(a1 + 40) removeDocument:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }

  uint64_t v8 = [*(id *)(a1 + 40) documentToSaveWithName:*(void *)(a1 + 48)];
  id v9 = (GKSavedGameDocument *)v8;
  if (!v8)
  {
    id v10 = [GKSavedGameDocument alloc];
    long long v11 = [*(id *)(a1 + 40) fileURLForName:*(void *)(a1 + 48)];
    id v9 = [(GKSavedGameDocument *)v10 initWithFileURL:v11];

    [(GKSavedGameDocument *)v9 setName:*(void *)(a1 + 48)];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_8;
  v15[3] = &unk_1E646DB58;
  BOOL v20 = v8 == 0;
  long long v12 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  void v15[4] = *(void *)(a1 + 40);
  uint64_t v16 = v9;
  id v17 = v12;
  id v19 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 64);
  uint64_t v14 = v9;
  [(GKSavedGameDocument *)v14 saveData:v13 completionHandler:v15];
}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (!v6 && *(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) addDocument:*(void *)(a1 + 40)];
  }
  uint64_t v3 = [*(id *)(a1 + 32) savedGamesWithName:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 40), "setHasConflict:", (unint64_t)objc_msgSend(v3, "count") > 1);
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4)
  {
    if (v6)
    {
      (*(void (**)(void, void *))(v4 + 16))(*(void *)(a1 + 64), v3);
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 56) error];
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);
    }
  }
  [*(id *)(a1 + 32) enableQueryUpdates];
}

- (void)setupUbiquity
{
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__GKSavedGameManager_setupUbiquity__block_invoke;
  block[3] = &unk_1E646D7F0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __35__GKSavedGameManager_setupUbiquity__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [v2 URLForUbiquityContainerIdentifier:0];
  [*(id *)(a1 + 32) setUbiquityURL:v3];

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 16))
  {
    uint64_t result = [(id)v4 startSavedGameQuery];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  }
  else
  {
    [*(id *)(v4 + 24) stopQuery];
    [*(id *)(a1 + 32) setQuery:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    id v6 = *(void **)(a1 + 32);
    return [v6 callFetchHandlers];
  }
  return result;
}

- (NSURL)ubiquityURL
{
  return self->_ubiquityURL;
}

- (void)setUbiquityURL:(id)a3
{
}

- (BOOL)ubiquityUnavailable
{
  return self->_ubiquityUnavailable;
}

- (void)setUbiquityUnavailable:(BOOL)a3
{
  self->_ubiquityUnavailable = a3;
}

- (NSMetadataQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSMutableDictionary)documents
{
  return self->_documents;
}

- (void)setDocuments:(id)a3
{
}

- (int64_t)queryDisableCount
{
  return self->_queryDisableCount;
}

- (void)setQueryDisableCount:(int64_t)a3
{
  self->_int64_t queryDisableCount = a3;
}

- (NSMutableArray)fetchHandlers
{
  return self->_fetchHandlers;
}

- (void)setFetchHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchHandlers, 0);
  objc_storeStrong((id *)&self->_documents, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_ubiquityURL, 0);
}

- (void)saveGameData:(void *)a1 withName:(void *)a2 completionHandler:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 name];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_ERROR, "Unresolved saved game conflict for file: \"%{public}@\". Provide a GKSavedGameListener protocol conformance to resolve conflicts. https://developer.apple.com/documentation/gamekit/gksavedgamelistener", (uint8_t *)&v5, 0xCu);
}

void __41__GKSavedGameManager_startSavedGameQuery__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "Error - Unable to access the iCloud ubiquity container", v1, 2u);
}

void __41__GKSavedGameManager_startSavedGameQuery__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "GKSavedGameManager in startSavedGameQuery Error - Failed to start NSMetaDataQuery", v1, 2u);
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "GKSavedGameManager->updateSavedGameDocumentsForQueryWithHandler: Error - error downloading item at url: %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "GKSavedGameManager->updateSavedGameDocumentsForQueryWithHandler: Error - saved game document NSMetadataItem missing URL or filename", v1, 2u);
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_61_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "Saved Games API: hasConflictingSavedGames:savedGames event emitter fired.", buf, 2u);
}

@end