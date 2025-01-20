@interface _UIDocumentPickerCloudDirectoryObserver
- (BOOL)afterInitialUpdate;
- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4;
- (NSArray)scopes;
- (NSDate)lastSnapshotDate;
- (NSMetadataQuery)query;
- (NSOperationQueue)queryWorkerQueue;
- (NSOrderedSet)staticItems;
- (NSPredicate)queryPredicate;
- (NSString)description;
- (OS_dispatch_queue)queryQueue;
- (_UIDocumentPickerCloudDirectoryObserver)initWithRecursiveScopes:(id)a3 delegate:(id)a4;
- (_UIDocumentPickerCloudDirectoryObserver)initWithScopes:(id)a3 delegate:(id)a4;
- (id)_queryResultsWithChangedObjects:(id)a3 changedResults:(id *)a4;
- (id)isVisiblePredicate;
- (void)_initialGatherFinished:(id)a3;
- (void)_queryUpdated:(id)a3;
- (void)_updateObservers:(id)a3;
- (void)_updateQuery;
- (void)assertOnQueryQueue;
- (void)callUpdateHandler:(id)a3 changeDictionary:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setAfterInitialUpdate:(BOOL)a3;
- (void)setLastSnapshotDate:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueryPredicate:(id)a3;
- (void)setQueryQueue:(id)a3;
- (void)setQueryWorkerQueue:(id)a3;
- (void)setScopes:(id)a3;
- (void)setStaticItems:(id)a3;
@end

@implementation _UIDocumentPickerCloudDirectoryObserver

- (_UIDocumentPickerCloudDirectoryObserver)initWithScopes:(id)a3 delegate:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_UIDocumentPickerCloudDirectoryObserver;
  v7 = [(_UIArrayController *)&v33 initWithDelegate:a4];
  v8 = v7;
  if (v7)
  {
    [(_UIDocumentPickerCloudDirectoryObserver *)v7 setScopes:v6];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_storeStrong((id *)&v8->_firstURL, v14);
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    v15 = NSString;
    v16 = [v9 firstObject];
    id v17 = [v15 stringWithFormat:@"directory observer queue for %@", v16];
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
    queryQueue = v8->_queryQueue;
    v8->_queryQueue = (OS_dispatch_queue *)v18;

    v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queryWorkerQueue = v8->_queryWorkerQueue;
    v8->_queryWorkerQueue = v20;

    [(NSOperationQueue *)v8->_queryWorkerQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v8->_queryWorkerQueue setUnderlyingQueue:v8->_queryQueue];
    [(NSOperationQueue *)v8->_queryWorkerQueue setQualityOfService:25];
    uint64_t v22 = objc_opt_new();
    staticItems = v8->_staticItems;
    v8->_staticItems = (NSOrderedSet *)v22;

    v24 = [(_UIDocumentPickerCloudDirectoryObserver *)v8 isVisiblePredicate];
    [(_UIArrayController *)v8 setPredicate:v24];

    [(_UIDocumentPickerCloudDirectoryObserver *)v8 setQueryPredicate:0];
    v25 = v8->_queryWorkerQueue;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __67___UIDocumentPickerCloudDirectoryObserver_initWithScopes_delegate___block_invoke;
    v27[3] = &unk_26492CC78;
    v28 = v8;
    [(NSOperationQueue *)v25 addOperationWithBlock:v27];
  }
  return v8;
}

- (_UIDocumentPickerCloudDirectoryObserver)initWithRecursiveScopes:(id)a3 delegate:(id)a4
{
  self->_recursive = 1;
  return [(_UIDocumentPickerCloudDirectoryObserver *)self initWithScopes:a3 delegate:a4];
}

- (void)assertOnQueryQueue
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_UIDocumentPickerCloudDirectoryObserver;
  [(_UIArrayController *)&v2 dealloc];
}

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerCloudDirectoryObserver;
  [(_UIArrayController *)&v5 invalidate];
  queryQueue = self->_queryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53___UIDocumentPickerCloudDirectoryObserver_invalidate__block_invoke;
  block[3] = &unk_26492CC78;
  block[4] = self;
  dispatch_async(queryQueue, block);
}

- (void)setQuery:(id)a3
{
  v7 = (NSMetadataQuery *)a3;
  [(_UIDocumentPickerCloudDirectoryObserver *)self assertOnQueryQueue];
  query = self->_query;
  if (query != v7)
  {
    [(NSMetadataQuery *)query stopQuery];
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self name:0 object:self->_query];

    objc_storeStrong((id *)&self->_query, a3);
  }
}

- (void)_updateQuery
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (self->_query)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F08390] object:self->_query];
  }
  id v4 = objc_alloc_init(MEMORY[0x263F08998]);
  [(_UIDocumentPickerCloudDirectoryObserver *)self setQuery:v4];

  objc_super v5 = [(_UIDocumentPickerCloudDirectoryObserver *)self queryWorkerQueue];
  [(NSMetadataQuery *)self->_query setOperationQueue:v5];

  id v6 = [(_UIDocumentPickerCloudDirectoryObserver *)self scopes];
  v7 = [v6 arrayByAddingObject:*MEMORY[0x263F08398]];
  [(NSMetadataQuery *)self->_query setSearchScopes:v7];

  v39 = [MEMORY[0x263EFF980] array];
  v37 = [MEMORY[0x263F32588] allContainersByContainerID];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v8 = self;
  id obj = [(_UIDocumentPickerCloudDirectoryObserver *)self scopes];
  uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v9)
  {
    v36 = 0;
    goto LABEL_23;
  }
  uint64_t v10 = v9;
  v36 = 0;
  uint64_t v11 = *(void *)v41;
  uint64_t v12 = *MEMORY[0x263F083C0];
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v41 != v11) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
LABEL_11:
        id v17 = v8;
        goto LABEL_12;
      }
      v16 = [v37 objectForKeyedSubscript:v14];
      id v15 = [v16 documentsURL];

      if (v15) {
        goto LABEL_11;
      }
      id v17 = v8;
      v24 = v36;
      if (!v36) {
        v24 = objc_opt_new();
      }
      v36 = v24;
      id v15 = [v24 URLForUbiquityContainerIdentifier:v14];
LABEL_12:
      BOOL recursive = v17->_recursive;
      v19 = (void *)MEMORY[0x263F08A98];
      uint64_t v20 = [v15 path];
      v21 = (void *)v20;
      if (recursive) {
        uint64_t v22 = @"%K.URLByDeletingLastPathComponent.path BEGINSWITH %@";
      }
      else {
        uint64_t v22 = @"%K.URLByDeletingLastPathComponent.path = %@";
      }
      v23 = objc_msgSend(v19, "predicateWithFormat:", v22, v12, v20);

      [v39 addObject:v23];
      ++v13;
    }
    while (v10 != v13);
    uint64_t v25 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    uint64_t v10 = v25;
  }
  while (v25);
LABEL_23:

  v26 = (NSPredicate *)[objc_alloc(MEMORY[0x263F08730]) initWithType:2 subpredicates:v39];
  queryPredicate = v8->_queryPredicate;
  if (queryPredicate)
  {
    v28 = [MEMORY[0x263F08A98] predicateWithValue:0];
    int v29 = [(NSPredicate *)queryPredicate isEqual:v28];

    if (v29)
    {
      long long v30 = v8->_queryPredicate;
      query = v8->_query;
      goto LABEL_27;
    }
    id v32 = objc_alloc(MEMORY[0x263F08730]);
    v44[0] = v8->_queryPredicate;
    v44[1] = v26;
    objc_super v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
    v34 = (void *)[v32 initWithType:1 subpredicates:v33];
    [(NSMetadataQuery *)v8->_query setPredicate:v34];
  }
  else
  {
    query = v8->_query;
    long long v30 = v26;
LABEL_27:
    [(NSMetadataQuery *)query setPredicate:v30];
  }
  uint64_t v35 = [MEMORY[0x263F08A00] defaultCenter];
  [v35 addObserver:v8 selector:sel__initialGatherFinished_ name:*MEMORY[0x263F08388] object:v8->_query];

  [(NSMetadataQuery *)v8->_query startQuery];
}

- (void)setQueryPredicate:(id)a3
{
  id v4 = a3;
  queryWorkerQueue = self->_queryWorkerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61___UIDocumentPickerCloudDirectoryObserver_setQueryPredicate___block_invoke;
  v7[3] = &unk_26492CCC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)queryWorkerQueue addOperationWithBlock:v7];
}

- (NSPredicate)queryPredicate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queryQueue = self->_queryQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57___UIDocumentPickerCloudDirectoryObserver_queryPredicate__block_invoke;
  v5[3] = &unk_26492CE70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSPredicate *)v3;
}

- (void)_initialGatherFinished:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(_UIDocumentPickerCloudDirectoryObserver *)self assertOnQueryQueue];
  unint64_t v5 = 0x263F08000uLL;
  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F08388] object:self->_query];

  if (![(NSMetadataQuery *)self->_query resultCount]
    && !self->_queryPredicate
    && [(NSArray *)self->_scopes count])
  {
    id v20 = v4;
    uint64_t v8 = [MEMORY[0x263F32588] allContainersByContainerID];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = self->_scopes;
    uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v21 = *(void *)v24;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = [v8 objectForKey:v14];
            id v16 = [v15 documentsURL];
          }
          else
          {
            id v16 = v14;
          }
          id v17 = objc_alloc_init(MEMORY[0x263F08850]);
          memset(v22, 0, sizeof(v22));
          dispatch_queue_t v18 = [v17 enumeratorAtURL:v16 includingPropertiesForKeys:0 options:4 errorHandler:0];
          uint64_t v19 = [v18 countByEnumeratingWithState:v22 objects:v27 count:16];

          if (v19)
          {
            id v4 = v20;
            unint64_t v5 = 0x263F08000;
            goto LABEL_7;
          }
          ++v13;
        }
        while (v12 != v13);
        uint64_t v12 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v4 = v20;
    unint64_t v5 = 0x263F08000;
  }
  v7 = [v4 userInfo];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x263F083A0]];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(_UIDocumentPickerCloudDirectoryObserver *)self _updateObservers:v9];
LABEL_7:

  uint64_t v10 = [*(id *)(v5 + 2560) defaultCenter];
  [v10 addObserver:self selector:sel__queryUpdated_ name:*MEMORY[0x263F08390] object:self->_query];
}

- (void)_queryUpdated:(id)a3
{
  id v4 = a3;
  [(_UIDocumentPickerCloudDirectoryObserver *)self assertOnQueryQueue];
  unint64_t v5 = [v4 userInfo];

  id v7 = [v5 objectForKey:*MEMORY[0x263F083A0]];

  if (v7)
  {
    uint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:v7];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(_UIDocumentPickerCloudDirectoryObserver *)self _updateObservers:v6];
}

- (id)_queryResultsWithChangedObjects:(id)a3 changedResults:(id *)a4
{
  id v6 = a3;
  [(_UIDocumentPickerCloudDirectoryObserver *)self assertOnQueryQueue];
  id v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  query = self->_query;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90___UIDocumentPickerCloudDirectoryObserver__queryResultsWithChangedObjects_changedResults___block_invoke;
  v17[3] = &unk_26492CE98;
  id v10 = v7;
  id v18 = v10;
  id v19 = v6;
  id v20 = v8;
  id v11 = v8;
  id v12 = v6;
  [(NSMetadataQuery *)query enumerateResultsUsingBlock:v17];
  id v13 = v11;
  *a4 = v13;
  v14 = v20;
  id v15 = v10;

  return v15;
}

- (void)_updateObservers:(id)a3
{
  id v4 = a3;
  [(_UIDocumentPickerCloudDirectoryObserver *)self assertOnQueryQueue];
  unint64_t v5 = [(_UIDocumentPickerCloudDirectoryObserver *)self query];
  [v5 disableUpdates];

  id v11 = 0;
  id v6 = [(_UIDocumentPickerCloudDirectoryObserver *)self _queryResultsWithChangedObjects:v4 changedResults:&v11];

  id v7 = v11;
  uint64_t v8 = [(_UIDocumentPickerCloudDirectoryObserver *)self query];
  [v8 enableUpdates];

  if (self->_staticItems)
  {
    uint64_t v9 = [MEMORY[0x263EFF980] arrayWithArray:v6];
    id v10 = [(NSOrderedSet *)self->_staticItems array];
    [v9 addObjectsFromArray:v10];

    [(_UIArrayController *)self processUpdate:v9 changedObjects:v7];
  }
  else
  {
    [(_UIArrayController *)self processUpdate:v6 changedObjects:v7];
  }
}

- (void)setStaticItems:(id)a3
{
  id v4 = a3;
  queryQueue = self->_queryQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58___UIDocumentPickerCloudDirectoryObserver_setStaticItems___block_invoke;
  v7[3] = &unk_26492CCC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queryQueue, v7);
}

- (NSOrderedSet)staticItems
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queryQueue = self->_queryQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54___UIDocumentPickerCloudDirectoryObserver_staticItems__block_invoke;
  v5[3] = &unk_26492CE70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4
{
  unint64_t v5 = objc_msgSend(a4, "modificationDate", a3);
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  uint64_t v8 = [(_UIDocumentPickerCloudDirectoryObserver *)self lastSnapshotDate];
  [v8 timeIntervalSinceReferenceDate];
  BOOL v10 = v7 > v9;

  return v10;
}

- (id)isVisiblePredicate
{
  if (self->_recursive) {
    objc_super v2 = &__block_literal_global_2;
  }
  else {
    objc_super v2 = &__block_literal_global_31;
  }
  id v3 = [MEMORY[0x263F08A98] predicateWithBlock:v2];

  return v3;
}

- (void)callUpdateHandler:(id)a3 changeDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  [(_UIDocumentPickerCloudDirectoryObserver *)self setLastSnapshotDate:v8];

  if (v7 || ![(_UIDocumentPickerCloudDirectoryObserver *)self afterInitialUpdate])
  {
    [(_UIDocumentPickerCloudDirectoryObserver *)self setAfterInitialUpdate:1];
    v9.receiver = self;
    v9.super_class = (Class)_UIDocumentPickerCloudDirectoryObserver;
    [(_UIArrayController *)&v9 callUpdateHandler:v6 changeDictionary:v7];
  }
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentPickerCloudDirectoryObserver;
  id v4 = [(_UIDocumentPickerCloudDirectoryObserver *)&v8 description];
  unint64_t v5 = [(NSArray *)self->_scopes firstObject];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (NSMetadataQuery)query
{
  return self->_query;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
}

- (NSDate)lastSnapshotDate
{
  return self->_lastSnapshotDate;
}

- (void)setLastSnapshotDate:(id)a3
{
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (void)setQueryQueue:(id)a3
{
}

- (NSOperationQueue)queryWorkerQueue
{
  return self->_queryWorkerQueue;
}

- (void)setQueryWorkerQueue:(id)a3
{
}

- (BOOL)afterInitialUpdate
{
  return self->_afterInitialUpdate;
}

- (void)setAfterInitialUpdate:(BOOL)a3
{
  self->_afterInitialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryWorkerQueue, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_lastSnapshotDate, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_firstURL, 0);
  objc_storeStrong((id *)&self->_queryPredicate, 0);

  objc_storeStrong((id *)&self->_staticItems, 0);
}

@end