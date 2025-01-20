@interface _UIDocumentPickerLocalDirectoryObserver
- (BOOL)afterInitialUpdate;
- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4;
- (NSDate)lastSnapshotDate;
- (NSOperationQueue)queryWorkerQueue;
- (NSOrderedSet)staticItems;
- (NSPredicate)queryPredicate;
- (NSString)description;
- (_UIDocumentPickerLocalDirectoryObserver)initWithScopes:(id)a3 delegate:(id)a4;
- (id)gatherResults;
- (id)gatherResultsForSource:(id)a3;
- (id)isVisiblePredicate;
- (void)callUpdateHandler:(id)a3 changeDictionary:(id)a4;
- (void)dealloc;
- (void)dispatchSourceDidReceiveEvent:(id)a3;
- (void)initialUpdate;
- (void)invalidate;
- (void)setAfterInitialUpdate:(BOOL)a3;
- (void)setLastSnapshotDate:(id)a3;
- (void)setQueryPredicate:(id)a3;
- (void)setQueryWorkerQueue:(id)a3;
- (void)setStaticItems:(id)a3;
- (void)updateResultsForSource:(id)a3;
@end

@implementation _UIDocumentPickerLocalDirectoryObserver

- (_UIDocumentPickerLocalDirectoryObserver)initWithScopes:(id)a3 delegate:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_UIDocumentPickerLocalDirectoryObserver;
  v7 = [(_UIArrayController *)&v36 initWithDelegate:a4];
  if (v7)
  {
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queryWorkerQueue = v7->_queryWorkerQueue;
    v7->_queryWorkerQueue = v8;

    [(NSOperationQueue *)v7->_queryWorkerQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v7->_queryWorkerQueue setQualityOfService:17];
    id v10 = [(NSOperationQueue *)v7->_queryWorkerQueue name];
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 fileSystemRepresentation], 0);
    queryDispatchQueue = v7->_queryDispatchQueue;
    v7->_queryDispatchQueue = (OS_dispatch_queue *)v11;

    [(NSOperationQueue *)v7->_queryWorkerQueue setUnderlyingQueue:v7->_queryDispatchQueue];
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"observer %p", v7);
    [(NSOperationQueue *)v7->_queryWorkerQueue setName:v13];

    v14 = [MEMORY[0x263EFF980] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v31 = v6;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * v19);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = [[_UIDocumentPickerVnodeDispatchSource alloc] initWithTarget:v7 url:v20 queue:v7->_queryDispatchQueue];
            [v14 addObject:v21];
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v17);
    }

    uint64_t v22 = objc_opt_new();
    resultsForSources = v7->_resultsForSources;
    v7->_resultsForSources = (NSMutableDictionary *)v22;

    uint64_t v24 = [v14 copy];
    sources = v7->_sources;
    v7->_sources = (NSArray *)v24;

    uint64_t v26 = objc_opt_new();
    staticItems = v7->_staticItems;
    v7->_staticItems = (NSOrderedSet *)v26;

    v28 = [(_UIDocumentPickerLocalDirectoryObserver *)v7 isVisiblePredicate];
    [(_UIArrayController *)v7 setPredicate:v28];

    v29 = [MEMORY[0x263F08A98] predicateWithValue:1];
    [(_UIDocumentPickerLocalDirectoryObserver *)v7 setQueryPredicate:v29];

    [(_UIDocumentPickerLocalDirectoryObserver *)v7 initialUpdate];
    id v6 = v31;
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSArray *)self->_sources componentsJoinedByString:@" "];
  id v6 = [v3 stringWithFormat:@"<%@: %p>, %@", v4, self, v5];

  return (NSString *)v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerLocalDirectoryObserver;
  [(_UIArrayController *)&v4 dealloc];
}

- (void)invalidate
{
  [(NSArray *)self->_sources makeObjectsPerformSelector:sel_invalidate];
  [(NSOperationQueue *)self->_queryWorkerQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerLocalDirectoryObserver;
  [(_UIArrayController *)&v3 invalidate];
}

- (void)setQueryPredicate:(id)a3
{
  id v4 = a3;
  queryWorkerQueue = self->_queryWorkerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61___UIDocumentPickerLocalDirectoryObserver_setQueryPredicate___block_invoke;
  v7[3] = &unk_26492CCC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)queryWorkerQueue addOperationWithBlock:v7];
}

- (NSPredicate)queryPredicate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  dispatch_queue_t v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57___UIDocumentPickerLocalDirectoryObserver_queryPredicate__block_invoke;
  v6[3] = &unk_26492CE70;
  v6[4] = self;
  v6[5] = &v7;
  objc_super v3 = [MEMORY[0x263F086D0] blockOperationWithBlock:v6];
  [(NSOperationQueue *)self->_queryWorkerQueue addOperation:v3];
  [v3 waitUntilFinished];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return (NSPredicate *)v4;
}

- (void)setStaticItems:(id)a3
{
  id v4 = a3;
  queryWorkerQueue = self->_queryWorkerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58___UIDocumentPickerLocalDirectoryObserver_setStaticItems___block_invoke;
  v7[3] = &unk_26492CCC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)queryWorkerQueue addOperationWithBlock:v7];
}

- (NSOrderedSet)staticItems
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queryWorkerQueue = self->_queryWorkerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54___UIDocumentPickerLocalDirectoryObserver_staticItems__block_invoke;
  v5[3] = &unk_26492CE70;
  v5[4] = self;
  v5[5] = &v6;
  [(NSOperationQueue *)queryWorkerQueue addOperationWithBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [v6 attributesModified:v7];
  }
  else
  {
    uint64_t v9 = [v7 modificationDate];

    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;
    id v12 = [(_UIDocumentPickerLocalDirectoryObserver *)self lastSnapshotDate];
    [v12 timeIntervalSinceReferenceDate];
    char v8 = v11 > v13;

    id v7 = v9;
  }

  return v8;
}

- (id)isVisiblePredicate
{
  return (id)[MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_8];
}

- (void)callUpdateHandler:(id)a3 changeDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [MEMORY[0x263EFF910] date];
  [(_UIDocumentPickerLocalDirectoryObserver *)self setLastSnapshotDate:v8];

  if ([v7 count]
    || ![(_UIDocumentPickerLocalDirectoryObserver *)self afterInitialUpdate])
  {
    [(_UIDocumentPickerLocalDirectoryObserver *)self setAfterInitialUpdate:1];
    v9.receiver = self;
    v9.super_class = (Class)_UIDocumentPickerLocalDirectoryObserver;
    [(_UIArrayController *)&v9 callUpdateHandler:v6 changeDictionary:v7];
  }
}

- (id)gatherResultsForSource:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08850]);
  v5 = [v3 url];
  id v6 = +[_UIDocumentPickerContainerURLItem defaultKeys];
  id v7 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:v6 options:1 errorHandler:&__block_literal_global_31_0];

  char v8 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v15 = [_UIDocumentPickerContainerURLItem alloc];
        uint64_t v16 = -[_UIDocumentPickerContainerURLItem initWithURL:](v15, "initWithURL:", v14, (void)v18);
        [v8 addObject:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)gatherResults
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(NSMutableDictionary *)self->_resultsForSources allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v9 = [(NSOrderedSet *)self->_staticItems array];
  [v3 addObjectsFromArray:v9];

  if (self->_queryPredicate)
  {
    objc_msgSend(v3, "filteredArrayUsingPredicate:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v3;
  }
  uint64_t v11 = v10;

  return v11;
}

- (void)initialUpdate
{
  queryWorkerQueue = self->_queryWorkerQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56___UIDocumentPickerLocalDirectoryObserver_initialUpdate__block_invoke;
  v3[3] = &unk_26492CC78;
  v3[4] = self;
  [(NSOperationQueue *)queryWorkerQueue addOperationWithBlock:v3];
}

- (void)updateResultsForSource:(id)a3
{
  id v4 = a3;
  queryWorkerQueue = self->_queryWorkerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66___UIDocumentPickerLocalDirectoryObserver_updateResultsForSource___block_invoke;
  v7[3] = &unk_26492CCC8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(NSOperationQueue *)queryWorkerQueue addOperationWithBlock:v7];
}

- (void)dispatchSourceDidReceiveEvent:(id)a3
{
  id v4 = a3;
  if (!self->_updateScheduled)
  {
    self->_updateScheduled = 1;
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    queryDispatchQueue = self->_queryDispatchQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73___UIDocumentPickerLocalDirectoryObserver_dispatchSourceDidReceiveEvent___block_invoke;
    v7[3] = &unk_26492CCC8;
    void v7[4] = self;
    id v8 = v4;
    dispatch_after(v5, queryDispatchQueue, v7);
  }
}

- (NSDate)lastSnapshotDate
{
  return self->_lastSnapshotDate;
}

- (void)setLastSnapshotDate:(id)a3
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
  objc_storeStrong((id *)&self->_lastSnapshotDate, 0);
  objc_storeStrong((id *)&self->_resultsForSources, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_queryDispatchQueue, 0);
  objc_storeStrong((id *)&self->_queryPredicate, 0);
  objc_storeStrong((id *)&self->_staticItems, 0);

  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end