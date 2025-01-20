@interface AVTPAvatarRecordDataSource
+ (id)defaultUIDataSourceWithDomainIdentifier:(id)a3;
+ (id)loadRecordsWithStore:(id)a3 request:(id)a4 logger:(id)a5;
+ (id)sortedRecordsEditableFirstReverseOrder:(id)a3;
+ (unint64_t)indexForInsertingDuplicateRecord:(id)a3 original:(id)a4 inRecords:(id)a5;
+ (unint64_t)indexForInsertingRecord:(id)a3 inRecords:(id)a4;
- (AVTAvatarFetchRequest)fetchRequest;
- (AVTObservableAvatarStore)backingStore;
- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4;
- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 callbackQueue:(id)a5 environment:(id)a6;
- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 callbackQueue:(id)a5 logger:(id)a6 notificationCenter:(id)a7;
- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 environment:(id)a5;
- (AVTPAvatarStore)underlyingStore;
- (AVTUILogger)logger;
- (BOOL)areRecordsLoaded;
- (NSMutableArray)nts_recordStorage;
- (NSNotificationCenter)notificationCenter;
- (NSObject)nts_changeNotificationObserver;
- (NSPointerArray)nts_observers;
- (OS_dispatch_queue)callbackQueue;
- (id)indexSetForEditableRecords;
- (id)indexesOfRecordsPassingTest:(id)a3;
- (id)recordAtIndex:(unint64_t)a3;
- (unint64_t)indexOfRecordPassingTest:(id)a3;
- (unint64_t)numberOfRecords;
- (void)addObserver:(id)a3;
- (void)addPriorityObserver:(id)a3;
- (void)avatarStoreDidChange:(id)a3;
- (void)dealloc;
- (void)enumerateObserversRespondingToSelector:(SEL)a3 withBlock:(id)a4;
- (void)flushRecordsForEnteringBackground;
- (void)performObserversWork:(id)a3;
- (void)performSyncWorkWithRecords:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setNts_changeNotificationObserver:(id)a3;
- (void)setNts_recordStorage:(id)a3;
- (void)store:(id)a3 didCreateDuplicateAvatar:(id)a4 forOriginal:(id)a5 postCompletionHandler:(id)a6;
- (void)store:(id)a3 didDeleteAvatarWithIdentifier:(id)a4 postCompletionHandler:(id)a5;
- (void)store:(id)a3 didSaveAvatar:(id)a4 postCompletionHandler:(id)a5;
@end

@implementation AVTPAvatarRecordDataSource

+ (id)sortedRecordsEditableFirstReverseOrder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEditable", (void)v13)) {
          [v4 insertObject:v10 atIndex:0];
        }
        else {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];

  return v11;
}

+ (unint64_t)indexForInsertingRecord:(id)a3 inRecords:(id)a4
{
  id v5 = a4;
  if ([a3 isEditable]) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = [v5 count];
  }

  return v6;
}

+ (unint64_t)indexForInsertingDuplicateRecord:(id)a3 original:(id)a4 inRecords:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([a4 isEditable])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v7 format];
    }
    id v9 = v7;
    for (unint64_t i = 0; i < [v8 count]; ++i)
    {
      v11 = [v8 objectAtIndexedSubscript:i];
      int v12 = [v11 isEditable];

      if (!v12) {
        break;
      }
      long long v13 = [v8 objectAtIndexedSubscript:i];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        long long v15 = (void *)MEMORY[0x263EFF940];
        long long v16 = [v8 objectAtIndexedSubscript:i];
        [v15 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v16 format];
      }
      v17 = [v8 objectAtIndexedSubscript:i];
      uint64_t v18 = [v9 orderDate];
      v19 = [v17 orderDate];
      uint64_t v20 = [v18 compare:v19];

      if (v20 != -1) {
        break;
      }
    }
  }
  else
  {
    unint64_t i = [v8 count];
  }

  return i;
}

- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[AVTCoreEnvironment defaultEnvironment];
  id v9 = [(AVTPAvatarRecordDataSource *)self initWithRecordStore:v7 fetchRequest:v6 environment:v8];

  return v9;
}

- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 environment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 conformsToProtocol:&unk_26DA9D588] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v8 format];
  }
  v11 = [(AVTPAvatarRecordDataSource *)self initWithRecordStore:v8 fetchRequest:v9 callbackQueue:MEMORY[0x263EF83A0] environment:v10];

  return v11;
}

- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 callbackQueue:(id)a5 environment:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  long long v14 = [v10 logger];
  long long v15 = [v10 notificationCenter];

  long long v16 = [(AVTPAvatarRecordDataSource *)self initWithRecordStore:v13 fetchRequest:v12 callbackQueue:v11 logger:v14 notificationCenter:v15];
  return v16;
}

- (AVTPAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 callbackQueue:(id)a5 logger:(id)a6 notificationCenter:(id)a7
{
  id v13 = a3;
  id v25 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)AVTPAvatarRecordDataSource;
  v17 = [(AVTPAvatarRecordDataSource *)&v26 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_callbackQueue, a5);
    objc_storeStrong((id *)&v18->_underlyingStore, a3);
    v19 = [[AVTObservableAvatarStore alloc] initWithStore:v13 callbackQueue:v14];
    backingStore = v18->_backingStore;
    v18->_backingStore = v19;

    [(AVTObservableAvatarStore *)v18->_backingStore setDelegate:v18];
    objc_storeStrong((id *)&v18->_fetchRequest, a4);
    nts_recordStorage = v18->_nts_recordStorage;
    v18->_nts_recordStorage = 0;

    objc_storeStrong((id *)&v18->_logger, a6);
    objc_storeStrong((id *)&v18->_notificationCenter, a7);
    uint64_t v22 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    nts_observers = v18->_nts_observers;
    v18->_nts_observers = (NSPointerArray *)v22;
  }
  return v18;
}

- (void)flushRecordsForEnteringBackground
{
}

- (void)dealloc
{
  id v3 = [(AVTPAvatarRecordDataSource *)self nts_changeNotificationObserver];

  if (v3)
  {
    v4 = [(AVTPAvatarRecordDataSource *)self notificationCenter];
    id v5 = [(AVTPAvatarRecordDataSource *)self nts_changeNotificationObserver];
    [v4 removeObserver:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)AVTPAvatarRecordDataSource;
  [(AVTPAvatarRecordDataSource *)&v6 dealloc];
}

- (BOOL)areRecordsLoaded
{
  v2 = self;
  id v3 = [(AVTPAvatarRecordDataSource *)self callbackQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(AVTPAvatarRecordDataSource *)v2 nts_recordStorage];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (void)performSyncWorkWithRecords:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = [(AVTPAvatarRecordDataSource *)self callbackQueue];
  dispatch_assert_queue_V2(v5);

  objc_super v6 = [(AVTPAvatarRecordDataSource *)self nts_changeNotificationObserver];

  if (!v6)
  {
    objc_initWeak(&location, self);
    id v7 = [(AVTPAvatarRecordDataSource *)self notificationCenter];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __57__AVTPAvatarRecordDataSource_performSyncWorkWithRecords___block_invoke;
    v19 = &unk_2647C3368;
    objc_copyWeak(&v20, &location);
    id v8 = [v7 addObserverForName:@"AVTAvatarStoreDidChangeNotification" object:0 queue:0 usingBlock:&v16];
    -[AVTPAvatarRecordDataSource setNts_changeNotificationObserver:](self, "setNts_changeNotificationObserver:", v8, v16, v17, v18, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  if (![(AVTPAvatarRecordDataSource *)self areRecordsLoaded])
  {
    id v9 = objc_opt_class();
    id v10 = [(AVTPAvatarRecordDataSource *)self backingStore];
    id v11 = [(AVTPAvatarRecordDataSource *)self fetchRequest];
    id v12 = [(AVTPAvatarRecordDataSource *)self logger];
    id v13 = [v9 loadRecordsWithStore:v10 request:v11 logger:v12];
    id v14 = (void *)[v13 mutableCopy];
    [(AVTPAvatarRecordDataSource *)self setNts_recordStorage:v14];
  }
  id v15 = [(AVTPAvatarRecordDataSource *)self nts_recordStorage];
  v4[2](v4, v15);
}

void __57__AVTPAvatarRecordDataSource_performSyncWorkWithRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__AVTPAvatarRecordDataSource_performSyncWorkWithRecords___block_invoke_2;
  v7[3] = &unk_2647C3340;
  v7[4] = WeakRetained;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __57__AVTPAvatarRecordDataSource_performSyncWorkWithRecords___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) avatarStoreDidChange:*(void *)(a1 + 40)];
}

- (void)performObserversWork:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = [(AVTPAvatarRecordDataSource *)self callbackQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(AVTPAvatarRecordDataSource *)self nts_observers];
  [v6 compact];

  id v7 = [(AVTPAvatarRecordDataSource *)self nts_observers];
  v4[2](v4, v7);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__AVTPAvatarRecordDataSource_addObserver___block_invoke;
  v6[3] = &unk_2647C3390;
  id v7 = v4;
  id v5 = v4;
  [(AVTPAvatarRecordDataSource *)self performObserversWork:v6];
}

uint64_t __42__AVTPAvatarRecordDataSource_addObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addPointer:*(void *)(a1 + 32)];
}

- (void)addPriorityObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__AVTPAvatarRecordDataSource_addPriorityObserver___block_invoke;
  v6[3] = &unk_2647C3390;
  id v7 = v4;
  id v5 = v4;
  [(AVTPAvatarRecordDataSource *)self performObserversWork:v6];
}

uint64_t __50__AVTPAvatarRecordDataSource_addPriorityObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 insertPointer:*(void *)(a1 + 32) atIndex:0];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__AVTPAvatarRecordDataSource_removeObserver___block_invoke;
  v6[3] = &unk_2647C3390;
  id v7 = v4;
  id v5 = v4;
  [(AVTPAvatarRecordDataSource *)self performObserversWork:v6];
}

void __45__AVTPAvatarRecordDataSource_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 allObjects];
  uint64_t v4 = [v3 indexOfObject:*(void *)(a1 + 32)];

  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 removePointerAtIndex:v4];
  }
}

- (void)enumerateObserversRespondingToSelector:(SEL)a3 withBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__AVTPAvatarRecordDataSource_enumerateObserversRespondingToSelector_withBlock___block_invoke;
  v8[3] = &unk_2647C33B8;
  id v9 = v6;
  SEL v10 = a3;
  id v7 = v6;
  [(AVTPAvatarRecordDataSource *)self performObserversWork:v8];
}

void __79__AVTPAvatarRecordDataSource_enumerateObserversRespondingToSelector_withBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a2, "allObjects", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_respondsToSelector()) {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (id)loadRecordsWithStore:(id)a3 request:(id)a4 logger:(id)a5
{
  id v8 = a5;
  id v15 = 0;
  long long v9 = [a3 avatarsForFetchRequest:a4 error:&v15];
  id v10 = v15;
  long long v11 = v10;
  if (v9)
  {
    id v12 = [a1 sortedRecordsEditableFirstReverseOrder:v9];
  }
  else
  {
    uint64_t v13 = [v10 description];
    [v8 logReadingError:v13];

    id v12 = 0;
  }

  return v12;
}

- (void)avatarStoreDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVTPAvatarRecordDataSource *)self callbackQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 object];

  uint64_t v7 = [(AVTPAvatarRecordDataSource *)self underlyingStore];

  if (v6 != v7)
  {
    [(AVTPAvatarRecordDataSource *)self setNts_recordStorage:0];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__AVTPAvatarRecordDataSource_avatarStoreDidChange___block_invoke;
    v8[3] = &unk_2647C33E0;
    void v8[4] = self;
    [(AVTPAvatarRecordDataSource *)self enumerateObserversRespondingToSelector:sel_significantRecordChangeInDataSource_ withBlock:v8];
  }
}

uint64_t __51__AVTPAvatarRecordDataSource_avatarStoreDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 significantRecordChangeInDataSource:*(void *)(a1 + 32)];
}

- (unint64_t)numberOfRecords
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__AVTPAvatarRecordDataSource_numberOfRecords__block_invoke;
  v4[3] = &unk_2647C3408;
  v4[4] = &v5;
  [(AVTPAvatarRecordDataSource *)self performSyncWorkWithRecords:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __45__AVTPAvatarRecordDataSource_numberOfRecords__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)recordAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__AVTPAvatarRecordDataSource_recordAtIndex___block_invoke;
  v5[3] = &unk_2647C3430;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(AVTPAvatarRecordDataSource *)self performSyncWorkWithRecords:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__AVTPAvatarRecordDataSource_recordAtIndex___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = [v8 count];
  unint64_t v4 = a1[6];
  if (v3 <= v4)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Index %lu out of datasource %p bounds, count: %lu", v4, a1[4], objc_msgSend(v8, "count") format];
    unint64_t v4 = a1[6];
  }
  uint64_t v5 = [v8 objectAtIndexedSubscript:v4];
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)indexesOfRecordsPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  id v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__AVTPAvatarRecordDataSource_indexesOfRecordsPassingTest___block_invoke;
  v8[3] = &unk_2647C3458;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(AVTPAvatarRecordDataSource *)self performSyncWorkWithRecords:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __58__AVTPAvatarRecordDataSource_indexesOfRecordsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 indexesOfObjectsPassingTest:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)indexOfRecordPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__AVTPAvatarRecordDataSource_indexOfRecordPassingTest___block_invoke;
  v8[3] = &unk_2647C3458;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(AVTPAvatarRecordDataSource *)self performSyncWorkWithRecords:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __55__AVTPAvatarRecordDataSource_indexOfRecordPassingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 indexOfObjectPassingTest:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)indexSetForEditableRecords
{
  return [(AVTPAvatarRecordDataSource *)self indexesOfRecordsPassingTest:&__block_literal_global_0];
}

uint64_t __56__AVTPAvatarRecordDataSource_indexSetForEditableRecords__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEditable];
}

- (void)store:(id)a3 didSaveAvatar:(id)a4 postCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(AVTPAvatarRecordDataSource *)self areRecordsLoaded])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke;
    v9[3] = &unk_2647C3518;
    id v10 = v7;
    uint64_t v11 = self;
    id v12 = v8;
    [(AVTPAvatarRecordDataSource *)self performSyncWorkWithRecords:v9];
  }
}

void __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_2;
  v14[3] = &unk_2647C34A0;
  id v15 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 indexOfObjectPassingTest:v14];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(id)objc_opt_class() indexForInsertingRecord:*(void *)(a1 + 32) inRecords:v3];
    [v3 insertObject:*(void *)(a1 + 32) atIndex:v5];
  }
  else
  {
    [v3 replaceObjectAtIndex:v4 withObject:*(void *)(a1 + 32)];
    uint64_t v5 = v4;
  }
  BOOL v6 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_3;
  v10[3] = &unk_2647C34F0;
  BOOL v13 = v6;
  int8x16_t v9 = *(int8x16_t *)(a1 + 32);
  id v8 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  uint64_t v12 = v5;
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
}

uint64_t __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_3(uint64_t a1)
{
  unint64_t v2 = &selRef_dataSource_didAddRecord_atIndex_;
  char v3 = *(unsigned char *)(a1 + 56);
  if (!v3) {
    unint64_t v2 = &selRef_dataSource_didEditRecord_atIndex_;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_4;
  v8[3] = &unk_2647C34C8;
  char v11 = v3;
  void v8[4] = v5;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v9 = v6;
  uint64_t v10 = v7;
  [v5 enumerateObserversRespondingToSelector:v4 withBlock:v8];
}

uint64_t __72__AVTPAvatarRecordDataSource_store_didSaveAvatar_postCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 56)) {
    return [a2 dataSource:v2 didAddRecord:v3 atIndex:v4];
  }
  else {
    return [a2 dataSource:v2 didEditRecord:v3 atIndex:v4];
  }
}

- (void)store:(id)a3 didDeleteAvatarWithIdentifier:(id)a4 postCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(AVTPAvatarRecordDataSource *)self areRecordsLoaded])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke;
    v9[3] = &unk_2647C3590;
    id v10 = v7;
    char v11 = self;
    id v12 = v8;
    [(AVTPAvatarRecordDataSource *)self performSyncWorkWithRecords:v9];
  }
}

void __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_2;
  v13[3] = &unk_2647C34A0;
  id v14 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 indexOfObjectPassingTest:v13];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    id v6 = [v3 objectAtIndex:v4];
    [v3 removeObjectAtIndex:v5];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_3;
    v10[3] = &unk_2647C3568;
    uint64_t v7 = *(void *)(a1 + 48);
    void v10[4] = *(void *)(a1 + 40);
    id v11 = v6;
    uint64_t v12 = v5;
    id v8 = *(void (**)(uint64_t, void *))(v7 + 16);
    id v9 = v6;
    v8(v7, v10);
  }
}

uint64_t __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_4;
  v5[3] = &unk_2647C3540;
  v5[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObserversRespondingToSelector:sel_dataSource_didRemoveRecord_atIndex_ withBlock:v5];
}

uint64_t __88__AVTPAvatarRecordDataSource_store_didDeleteAvatarWithIdentifier_postCompletionHandler___block_invoke_4(void *a1, void *a2)
{
  return [a2 dataSource:a1[4] didRemoveRecord:a1[5] atIndex:a1[6]];
}

- (void)store:(id)a3 didCreateDuplicateAvatar:(id)a4 forOriginal:(id)a5 postCompletionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(AVTPAvatarRecordDataSource *)self areRecordsLoaded])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke;
    v12[3] = &unk_2647C35B8;
    v12[4] = self;
    id v13 = v9;
    id v14 = v10;
    id v15 = v11;
    [(AVTPAvatarRecordDataSource *)self performSyncWorkWithRecords:v12];
  }
}

void __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() indexForInsertingDuplicateRecord:a1[5] original:a1[6] inRecords:v3];
  [v3 insertObject:a1[5] atIndex:v4];

  uint64_t v5 = a1[7];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke_2;
  v7[3] = &unk_2647C3568;
  id v6 = (void *)a1[5];
  v7[4] = a1[4];
  id v8 = v6;
  uint64_t v9 = v4;
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);
}

void __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke_3;
  v5[3] = &unk_2647C3540;
  v5[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObserversRespondingToSelector:sel_dataSource_didAddRecord_atIndex_ withBlock:v5];
}

uint64_t __95__AVTPAvatarRecordDataSource_store_didCreateDuplicateAvatar_forOriginal_postCompletionHandler___block_invoke_3(void *a1, void *a2)
{
  return [a2 dataSource:a1[4] didAddRecord:a1[5] atIndex:a1[6]];
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTPAvatarStore)underlyingStore
{
  return self->_underlyingStore;
}

- (AVTObservableAvatarStore)backingStore
{
  return self->_backingStore;
}

- (AVTAvatarFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (NSMutableArray)nts_recordStorage
{
  return self->_nts_recordStorage;
}

- (void)setNts_recordStorage:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSPointerArray)nts_observers
{
  return self->_nts_observers;
}

- (NSObject)nts_changeNotificationObserver
{
  return self->_nts_changeNotificationObserver;
}

- (void)setNts_changeNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nts_changeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_nts_observers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_nts_recordStorage, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_underlyingStore, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

+ (id)defaultUIDataSourceWithDomainIdentifier:(id)a3
{
  uint64_t v4 = objc_alloc_init(AVTPAvatarStore);
  uint64_t v5 = +[AVTAvatarFetchRequest requestForAllAvatars];
  id v6 = (void *)[objc_alloc((Class)a1) initWithRecordStore:v4 fetchRequest:v5];

  return v6;
}

@end