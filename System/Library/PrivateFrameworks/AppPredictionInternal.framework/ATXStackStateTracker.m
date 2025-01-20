@interface ATXStackStateTracker
+ (ATXStackStateTracker)sharedInstance;
- (ATXStackStateTracker)init;
- (BOOL)lastStackRotationWasALongTimeAgoForStackId:(id)a3;
- (BOOL)lastStalenessRotationWasALongTimeAgoForStackId:(id)a3;
- (BOOL)lastUserScrollWasALongTimeAgoForStackId:(id)a3;
- (BOOL)loadInternalState;
- (BOOL)mostRecentRotationOfStackIsSystemInitiated:(id)a3;
- (BOOL)persistInternalState;
- (BOOL)stackIsStale:(id)a3;
- (BOOL)stackWasCreatedALongTimeAgo:(id)a3;
- (NSDictionary)currentAppPredictionPanelLayouts;
- (NSDictionary)currentSuggestionsWidgetLayouts;
- (id)_blendingCacheIdToStackIdMap:(id)a3;
- (id)dataFromDisk;
- (id)initTrackerInDirectory:(id)a3;
- (id)jsonRepresentation;
- (id)lastStackRotationEvent:(id)a3;
- (id)lastStackShownEvent:(id)a3;
- (id)lastThreeUserVisitDatesOfPage:(unint64_t)a3;
- (id)lastUserScrollStackRotationEvent:(id)a3;
- (id)layoutForLastStalenessRotation:(id)a3;
- (id)stackCreationEvent:(id)a3;
- (id)stackStateForStackId:(id)a3;
- (id)topWidgetUniqueIdOfStack:(id)a3;
- (void)_persistInternalStateImmediatelyOnSigterm;
- (void)cleanupOldDataWithHomeScreenPages:(id)a3;
- (void)coalescedPersistInternalState;
- (void)dataFromDisk;
- (void)handleSigterm;
- (void)loadInternalState;
- (void)setCurrentAppPredictionPanelLayouts:(id)a3;
- (void)setCurrentSuggestionsWidgetLayouts:(id)a3;
- (void)setLayoutForLastStalenessRotation:(id)a3 stackId:(id)a4 date:(id)a5;
- (void)updateStackRotationEvents;
- (void)updateStackRotationEventsByQueryingBiome;
@end

@implementation ATXStackStateTracker

- (ATXStackStateTracker)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionCacheDirectory];
  v4 = [(ATXStackStateTracker *)self initTrackerInDirectory:v3];

  return v4;
}

+ (ATXStackStateTracker)sharedInstance
{
  if (sharedInstance__pasOnceToken17 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken17, &__block_literal_global_159);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_24;
  return (ATXStackStateTracker *)v2;
}

void __38__ATXStackStateTracker_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_24;
  sharedInstance__pasExprOnceResult_24 = v1;
}

- (id)initTrackerInDirectory:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ATXStackStateTracker;
  v5 = [(ATXStackStateTracker *)&v24 init];
  if (v5)
  {
    v6 = (void *)os_transaction_create();
    uint64_t v7 = [v4 stringByAppendingPathComponent:@"ATXStackStates"];
    path = v5->_path;
    v5->_path = (NSString *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v11 = dispatch_queue_create("ATXStackStateTracker", v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    objc_initWeak(&location, v5);
    id v13 = objc_alloc(MEMORY[0x1E4F93B98]);
    v14 = v5->_queue;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __47__ATXStackStateTracker_initTrackerInDirectory___block_invoke;
    v21 = &unk_1E68AC2D0;
    objc_copyWeak(&v22, &location);
    uint64_t v15 = [v13 initWithQueue:v14 operation:&v18];
    coalescedPersistInternalStateOperation = v5->_coalescedPersistInternalStateOperation;
    v5->_coalescedPersistInternalStateOperation = (_PASSimpleCoalescingTimer *)v15;

    [(ATXStackStateTracker *)v5 loadInternalState];
    [(ATXStackStateTracker *)v5 updateStackRotationEvents];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __47__ATXStackStateTracker_initTrackerInDirectory___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained persistInternalState];
}

- (id)jsonRepresentation
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__55;
  v10 = __Block_byref_object_dispose__55;
  id v11 = 0;
  internalStateLock = self->_internalStateLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__ATXStackStateTracker_jsonRepresentation__block_invoke;
  v5[3] = &unk_1E68B1D70;
  v5[4] = &v6;
  [(_PASLock *)internalStateLock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__ATXStackStateTracker_jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 stackStateByStackId];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)stackIsStale:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  internalStateLock = self->_internalStateLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__ATXStackStateTracker_stackIsStale___block_invoke;
  v8[3] = &unk_1E68B1D98;
  id v6 = v4;
  id v9 = v6;
  v10 = self;
  id v11 = &v12;
  [(_PASLock *)internalStateLock runWithLockAcquired:v8];
  LOBYTE(self) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __37__ATXStackStateTracker_stackIsStale___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_3(a1, v3, v4);
  }

  if ([*(id *)(a1 + 40) stackWasCreatedALongTimeAgo:*(void *)(a1 + 32)])
  {
    if (![*(id *)(a1 + 40) lastStackRotationWasALongTimeAgoForStackId:*(void *)(a1 + 32)])
    {
      char v6 = 0;
      goto LABEL_13;
    }
    v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_1((uint64_t *)(a1 + 32), v5);
    }
    char v6 = 1;
  }
  else
  {
    v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_2((uint64_t *)(a1 + 32), v5);
    }
    char v6 = 0;
  }

LABEL_13:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
}

- (BOOL)mostRecentRotationOfStackIsSystemInitiated:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalStateLock = self->_internalStateLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__ATXStackStateTracker_mostRecentRotationOfStackIsSystemInitiated___block_invoke;
  v8[3] = &unk_1E68B1DC0;
  id v6 = v4;
  id v9 = v6;
  v10 = &v11;
  [(_PASLock *)internalStateLock runWithLockAcquired:v8];
  LOBYTE(internalStateLock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalStateLock;
}

void __67__ATXStackStateTracker_mostRecentRotationOfStackIsSystemInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 stackStateByStackId];
  id v14 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  id v4 = [v14 lastStackRotationEvent];
  v5 = [v4 reason];
  id v6 = NSStringForATXHomeScreenStackChangeReason();
  if ([v5 isEqualToString:v6]) {
    goto LABEL_4;
  }
  uint64_t v7 = [v14 lastStackRotationEvent];
  uint64_t v8 = [v7 reason];
  id v9 = NSStringForATXHomeScreenStackChangeReason();
  if ([v8 isEqualToString:v9])
  {

LABEL_4:
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_6;
  }
  v10 = [v14 lastStackRotationEvent];
  uint64_t v11 = [v10 reason];
  uint64_t v12 = NSStringForATXHomeScreenStackChangeReason();
  char v13 = [v11 isEqualToString:v12];

  if (v13) {
    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)lastStackRotationWasALongTimeAgoForStackId:(id)a3
{
  id v3 = [(ATXStackStateTracker *)self lastStackRotationEvent:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 date];
    [v5 timeIntervalSinceNow];
    double v7 = v6;
    uint64_t v8 = [MEMORY[0x1E4F93550] sharedInstance];
    [v8 maxAgeOfStackSuggestionToConsiderStaleInSeconds];
    BOOL v10 = v7 < -v9;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)stackWasCreatedALongTimeAgo:(id)a3
{
  id v3 = [(ATXStackStateTracker *)self stackCreationEvent:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 date];
    [v5 timeIntervalSinceNow];
    double v7 = v6;
    uint64_t v8 = [MEMORY[0x1E4F93550] sharedInstance];
    [v8 maxAgeOfStackSuggestionToConsiderStaleInSeconds];
    BOOL v10 = v7 < -v9;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)lastUserScrollWasALongTimeAgoForStackId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalStateLock = self->_internalStateLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__ATXStackStateTracker_lastUserScrollWasALongTimeAgoForStackId___block_invoke;
  v8[3] = &unk_1E68B1DC0;
  id v6 = v4;
  id v9 = v6;
  BOOL v10 = &v11;
  [(_PASLock *)internalStateLock runWithLockAcquired:v8];
  LOBYTE(internalStateLock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalStateLock;
}

void __64__ATXStackStateTracker_lastUserScrollWasALongTimeAgoForStackId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 stackStateByStackId];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  v5 = [v4 lastUserScrollStackRotationEvent];
  id v13 = [v5 date];

  id v6 = v13;
  if (v13)
  {
    [v13 timeIntervalSinceNow];
    double v8 = v7;
    id v9 = [MEMORY[0x1E4F93550] sharedInstance];
    [v9 maxAgeOfStackSuggestionToConsiderStaleInSeconds];
    double v11 = -v10;

    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    *(unsigned char *)(v12 + 24) = v8 < v11;
    id v6 = v13;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)lastStalenessRotationWasALongTimeAgoForStackId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalStateLock = self->_internalStateLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__ATXStackStateTracker_lastStalenessRotationWasALongTimeAgoForStackId___block_invoke;
  v8[3] = &unk_1E68B1DC0;
  id v6 = v4;
  id v9 = v6;
  double v10 = &v11;
  [(_PASLock *)internalStateLock runWithLockAcquired:v8];
  LOBYTE(internalStateLock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalStateLock;
}

void __71__ATXStackStateTracker_lastStalenessRotationWasALongTimeAgoForStackId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 stackStateByStackId];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v12 = [v4 dateOfLastStalenessRotation];

  v5 = v12;
  if (v12)
  {
    [v12 timeIntervalSinceNow];
    double v7 = v6;
    double v8 = [MEMORY[0x1E4F93550] sharedInstance];
    [v8 maxAgeOfStackSuggestionToConsiderStaleInSeconds];
    double v10 = -v9;

    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    *(unsigned char *)(v11 + 24) = v7 < v10;
    v5 = v12;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)topWidgetUniqueIdOfStack:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__55;
  v16 = __Block_byref_object_dispose__55;
  id v17 = 0;
  internalStateLock = self->_internalStateLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__ATXStackStateTracker_topWidgetUniqueIdOfStack___block_invoke;
  v9[3] = &unk_1E68B1DC0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(_PASLock *)internalStateLock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __49__ATXStackStateTracker_topWidgetUniqueIdOfStack___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 stackStateByStackId];
  v5 = (uint64_t *)(a1 + 32);
  id v6 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

  id v7 = [v6 lastStackShownEvent];
  if (v7)
  {

LABEL_4:
    double v9 = [v6 lastStackShownEvent];
    id v10 = [v9 date];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    uint64_t v13 = v12;

    uint64_t v14 = [v6 lastStackRotationEvent];
    char v15 = [v14 date];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    uint64_t v18 = v17;

    uint64_t v19 = [v13 laterDate:v18];

    if (v13 == v19) {
      [v6 lastStackShownEvent];
    }
    else {
    v20 = [v6 lastStackRotationEvent];
    }
    uint64_t v21 = [v20 widgetUniqueId];
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    goto LABEL_14;
  }
  double v8 = [v6 lastStackRotationEvent];

  if (v8) {
    goto LABEL_4;
  }
  objc_super v24 = __atxlog_handle_blending();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    __49__ATXStackStateTracker_topWidgetUniqueIdOfStack___block_invoke_cold_1(v5, v3, v24);
  }

LABEL_14:
}

- (id)stackStateForStackId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__55;
  v16 = __Block_byref_object_dispose__55;
  id v17 = 0;
  internalStateLock = self->_internalStateLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__ATXStackStateTracker_stackStateForStackId___block_invoke;
  v9[3] = &unk_1E68B1DE8;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)internalStateLock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__ATXStackStateTracker_stackStateForStackId___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 stackStateByStackId];
  uint64_t v3 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)stackCreationEvent:(id)a3
{
  uint64_t v3 = [(ATXStackStateTracker *)self stackStateForStackId:a3];
  uint64_t v4 = [v3 stackCreationEvent];

  return v4;
}

- (id)lastStackRotationEvent:(id)a3
{
  uint64_t v3 = [(ATXStackStateTracker *)self stackStateForStackId:a3];
  uint64_t v4 = [v3 lastStackRotationEvent];

  return v4;
}

- (id)lastStackShownEvent:(id)a3
{
  uint64_t v3 = [(ATXStackStateTracker *)self stackStateForStackId:a3];
  uint64_t v4 = [v3 lastStackShownEvent];

  return v4;
}

- (id)lastUserScrollStackRotationEvent:(id)a3
{
  uint64_t v3 = [(ATXStackStateTracker *)self stackStateForStackId:a3];
  uint64_t v4 = [v3 lastUserScrollStackRotationEvent];

  return v4;
}

- (id)layoutForLastStalenessRotation:(id)a3
{
  uint64_t v3 = [(ATXStackStateTracker *)self stackStateForStackId:a3];
  uint64_t v4 = [v3 layoutForLastStalenessRotation];

  return v4;
}

- (void)setLayoutForLastStalenessRotation:(id)a3 stackId:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalStateLock = self->_internalStateLock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__ATXStackStateTracker_setLayoutForLastStalenessRotation_stackId_date___block_invoke;
  v15[3] = &unk_1E68B1E10;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  uint64_t v19 = self;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [(_PASLock *)internalStateLock runWithLockAcquired:v15];
}

void __71__ATXStackStateTracker_setLayoutForLastStalenessRotation_stackId_date___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 stackStateByStackId];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (!v4)
  {
    v5 = objc_opt_new();
    id v6 = [v9 stackStateByStackId];
    [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  id v7 = [v9 stackStateByStackId];
  id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];

  [v8 setLayoutForLastStalenessRotation:*(void *)(a1 + 40)];
  [v8 setDateOfLastStalenessRotation:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) coalescedPersistInternalState];
}

- (id)lastThreeUserVisitDatesOfPage:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__55;
  uint64_t v11 = __Block_byref_object_dispose__55;
  id v12 = 0;
  internalStateLock = self->_internalStateLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__ATXStackStateTracker_lastThreeUserVisitDatesOfPage___block_invoke;
  v6[3] = &unk_1E68B1E38;
  v6[4] = &v7;
  v6[5] = a3;
  [(_PASLock *)internalStateLock runWithLockAcquired:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__ATXStackStateTracker_lastThreeUserVisitDatesOfPage___block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 lastThreeUserVisitDatesOfPages];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v4 = [v7 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)updateStackRotationEvents
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Timed out getting current SuggestionsWidget and AppPredictionPanel layouts.", v1, 2u);
}

void __49__ATXStackStateTracker_updateStackRotationEvents__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __49__ATXStackStateTracker_updateStackRotationEvents__block_invoke_cold_1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }

    [*(id *)(a1 + 32) setCurrentSuggestionsWidgetLayouts:0];
    id v16 = *(void **)(a1 + 32);
    id v17 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) setCurrentSuggestionsWidgetLayouts:a2];
    id v16 = *(void **)(a1 + 32);
    id v17 = v7;
  }
  [v16 setCurrentAppPredictionPanelLayouts:v17];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)updateStackRotationEventsByQueryingBiome
{
}

void __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__55;
  v29 = __Block_byref_object_dispose__55;
  id v30 = 0;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-43200.0];
  uint64_t v4 = objc_opt_new();
  [v3 timeIntervalSinceReferenceDate];
  uint64_t v5 = objc_msgSend(v4, "genericEventPublisherFromStartTime:consumerSubType:", 34);

  id v6 = objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_2;
  v23[3] = &unk_1E68AF140;
  id v7 = v3;
  id v24 = v7;
  id v8 = [v5 filterWithIsIncluded:v23];
  uint64_t v9 = [v2 bookmark];
  uint64_t v10 = [v9 bookmark];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_175;
  v22[3] = &unk_1E68B1EA8;
  v22[4] = &v25;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_177;
  uint64_t v19 = &unk_1E68AD360;
  id v11 = v2;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  id v13 = (id)[v8 sinkWithBookmark:v10 completion:v22 receiveInput:&v16];

  id v14 = objc_alloc(MEMORY[0x1E4F4B618]);
  uint64_t v15 = objc_msgSend(v14, "initWithURLPath:versionNumber:bookmark:metadata:", 0, &unk_1F27F17A0, v26[5], 0, v16, v17, v18, v19);
  [v11 setBookmark:v15];

  _Block_object_dispose(&v25, 8);
}

uint64_t __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 eventBody];
    id v7 = [v6 homeScreenEvent];

    if (!v7) {
      goto LABEL_16;
    }
    id v8 = [v7 eventTypeString];

    if (!v8) {
      goto LABEL_16;
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v7 date];
    id v11 = [v9 earlierDate:v10];
    id v12 = [v7 date];

    if (v11 == v12)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v3 timestamp];
      uint64_t v17 = objc_msgSend(v16, "initWithTimeIntervalSinceReferenceDate:");
      id v18 = __atxlog_handle_blending();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v7 date];
        uint64_t v20 = *(void *)(a1 + 32);
        int v25 = 138543874;
        v26 = v19;
        __int16 v27 = 2114;
        uint64_t v28 = v20;
        __int16 v29 = 2114;
        id v30 = v17;
        _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "Encountered a BiomeEvent that has a date before the queryStartDate. ATXHomeScreenEvent Date: %{public}@, Query Start Date: %{public}@, Biome Event Date: %{public}@", (uint8_t *)&v25, 0x20u);
      }
      goto LABEL_16;
    }
    id v13 = [v7 eventTypeString];
    if ([v13 isEqualToString:@"Unknown"])
    {
      int v14 = 0;
LABEL_7:

      uint64_t v15 = [v7 stackId];

      if (!v15)
      {
LABEL_17:

        goto LABEL_18;
      }
      if (v14 == 3)
      {
        uint64_t v22 = [v7 reason];
        v23 = NSStringForATXHomeScreenStackChangeReason();
        int v24 = [v22 isEqualToString:v23];

        uint64_t v15 = v24 ^ 1u;
        goto LABEL_17;
      }
      uint64_t v15 = 1;
      if (v14 == 14 || v14 == 16) {
        goto LABEL_17;
      }
LABEL_16:
      uint64_t v15 = 0;
      goto LABEL_17;
    }
    if (([v13 isEqualToString:@"HomeScreenPageShown"] & 1) == 0)
    {
      if ([v13 isEqualToString:@"HomeScreenDisappeared"])
      {
        int v14 = 2;
        goto LABEL_7;
      }
      if ([v13 isEqualToString:@"StackChanged"])
      {
        int v14 = 3;
        goto LABEL_7;
      }
      if ([v13 isEqualToString:@"WidgetTapped"])
      {
        int v14 = 4;
        goto LABEL_7;
      }
      if ([v13 isEqualToString:@"WidgetLongLook"])
      {
        int v14 = 5;
        goto LABEL_7;
      }
      if ([v13 isEqualToString:@"WidgetUserFeedback"])
      {
        int v14 = 6;
        goto LABEL_7;
      }
      if ([v13 isEqualToString:@"UserStackConfigChanged"])
      {
        int v14 = 7;
        goto LABEL_7;
      }
      if ([v13 isEqualToString:@"DeviceLocked"])
      {
        int v14 = 8;
        goto LABEL_7;
      }
      if ([v13 isEqualToString:@"DeviceUnlocked"])
      {
        int v14 = 9;
        goto LABEL_7;
      }
      if ([v13 isEqualToString:@"PinnedWidgetAdded"])
      {
        int v14 = 10;
        goto LABEL_7;
      }
      if ([v13 isEqualToString:@"PinnedWidgetDeleted"])
      {
        int v14 = 11;
        goto LABEL_7;
      }
      if (([v13 isEqualToString:@"SpecialPageAppeared"] & 1) == 0)
      {
        if ([v13 isEqualToString:@"SpecialPageDisappeared"])
        {
          int v14 = 13;
        }
        else if ([v13 isEqualToString:@"StackShown"])
        {
          int v14 = 14;
        }
        else if ([v13 isEqualToString:@"StackDisappeared"])
        {
          int v14 = 15;
        }
        else if ([v13 isEqualToString:@"StackCreated"])
        {
          int v14 = 16;
        }
        else if ([v13 isEqualToString:@"StackDeleted"])
        {
          int v14 = 17;
        }
        else if ([v13 isEqualToString:@"WidgetAddedToStack"])
        {
          int v14 = 18;
        }
        else if ([v13 isEqualToString:@"WidgetRemovedFromStack"])
        {
          int v14 = 19;
        }
        else if ([v13 isEqualToString:@"StackVisibilityChanged"])
        {
          int v14 = 20;
        }
        else if ([v13 isEqualToString:@"AppAdded"])
        {
          int v14 = 21;
        }
        else if ([v13 isEqualToString:@"AppRemoved"])
        {
          int v14 = 22;
        }
        else
        {
          int v14 = 0;
        }
        goto LABEL_7;
      }
    }

    uint64_t v15 = 1;
    goto LABEL_17;
  }
  uint64_t v15 = 0;
LABEL_18:

  return v15;
}

void __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 state] == 1)
  {
    id v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_175_cold_1(v5, v7);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
}

void __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_177(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 eventBody];
    id v7 = [v6 homeScreenEvent];

    id v8 = [v7 eventTypeString];
    if ([v8 isEqualToString:@"Unknown"])
    {
      int v9 = 0;
    }
    else
    {
      if ([v8 isEqualToString:@"HomeScreenPageShown"])
      {

        uint64_t v10 = *(void **)(a1 + 32);
        id v11 = [v7 metadata];
        id v12 = [v11 pageIndex];
        id v13 = [v7 date];
        [v10 updateLastThreeUserVisitDatesIfNecessaryForPage:v12 date:v13];
LABEL_6:

LABEL_7:
LABEL_71:

        goto LABEL_72;
      }
      if ([v8 isEqualToString:@"HomeScreenDisappeared"])
      {
        int v9 = 2;
      }
      else if ([v8 isEqualToString:@"StackChanged"])
      {
        int v9 = 3;
      }
      else if ([v8 isEqualToString:@"WidgetTapped"])
      {
        int v9 = 4;
      }
      else if ([v8 isEqualToString:@"WidgetLongLook"])
      {
        int v9 = 5;
      }
      else if ([v8 isEqualToString:@"WidgetUserFeedback"])
      {
        int v9 = 6;
      }
      else if ([v8 isEqualToString:@"UserStackConfigChanged"])
      {
        int v9 = 7;
      }
      else if ([v8 isEqualToString:@"DeviceLocked"])
      {
        int v9 = 8;
      }
      else if ([v8 isEqualToString:@"DeviceUnlocked"])
      {
        int v9 = 9;
      }
      else if ([v8 isEqualToString:@"PinnedWidgetAdded"])
      {
        int v9 = 10;
      }
      else if ([v8 isEqualToString:@"PinnedWidgetDeleted"])
      {
        int v9 = 11;
      }
      else
      {
        if ([v8 isEqualToString:@"SpecialPageAppeared"])
        {

          int v14 = [v7 metadata];
          uint64_t v15 = [v14 pageIndex];
          uint64_t v16 = [v15 unsignedIntegerValue];

          if (v16 != 2)
          {
LABEL_72:

            goto LABEL_73;
          }
          uint64_t v17 = *(void **)(a1 + 32);
          id v11 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F4B540]];
          id v12 = [v7 date];
          [v17 updateLastThreeUserVisitDatesIfNecessaryForPage:v11 date:v12];
          goto LABEL_7;
        }
        if ([v8 isEqualToString:@"SpecialPageDisappeared"])
        {
          int v9 = 13;
        }
        else if ([v8 isEqualToString:@"StackShown"])
        {
          int v9 = 14;
        }
        else if ([v8 isEqualToString:@"StackDisappeared"])
        {
          int v9 = 15;
        }
        else if ([v8 isEqualToString:@"StackCreated"])
        {
          int v9 = 16;
        }
        else if ([v8 isEqualToString:@"StackDeleted"])
        {
          int v9 = 17;
        }
        else if ([v8 isEqualToString:@"WidgetAddedToStack"])
        {
          int v9 = 18;
        }
        else if ([v8 isEqualToString:@"WidgetRemovedFromStack"])
        {
          int v9 = 19;
        }
        else if ([v8 isEqualToString:@"StackVisibilityChanged"])
        {
          int v9 = 20;
        }
        else if ([v8 isEqualToString:@"AppAdded"])
        {
          int v9 = 21;
        }
        else if ([v8 isEqualToString:@"AppRemoved"])
        {
          int v9 = 22;
        }
        else
        {
          int v9 = 0;
        }
      }
    }

    id v18 = [*(id *)(a1 + 32) stackStateByStackId];
    uint64_t v19 = [v7 stackId];
    id v11 = [v18 objectForKeyedSubscript:v19];

    if (!v11)
    {
      id v11 = objc_opt_new();
      uint64_t v20 = [*(id *)(a1 + 32) stackStateByStackId];
      id v21 = [v7 stackId];
      [v20 setObject:v11 forKeyedSubscript:v21];
    }
    if (v9 == 14)
    {
      __int16 v29 = __atxlog_handle_blending();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [v7 stackId];
        uint64_t v31 = [v7 date];
        v32 = [v7 stackId];
        v33 = [v7 eventTypeString];
        v34 = [v7 widgetBundleId];
        v35 = [v7 reason];
        *(_DWORD *)buf = 138544642;
        v60 = v30;
        __int16 v61 = 2114;
        v62 = v31;
        __int16 v63 = 2112;
        v64 = v32;
        __int16 v65 = 2112;
        v66 = v33;
        __int16 v67 = 2112;
        v68 = v34;
        __int16 v69 = 2114;
        v70 = v35;
        _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "Found a stack shown event for stack %{public}@: %{public}@ - %@: %@ - %@ - %{public}@", buf, 0x3Eu);
      }
      [v11 setLastStackShownEvent:v7];
      goto LABEL_71;
    }
    if (v9 == 16)
    {
      uint64_t v22 = __atxlog_handle_blending();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v7 stackId];
        int v24 = [v7 date];
        int v25 = [v7 stackId];
        v26 = [v7 eventTypeString];
        __int16 v27 = [v7 widgetBundleId];
        uint64_t v28 = [v7 reason];
        *(_DWORD *)buf = 138544642;
        v60 = v23;
        __int16 v61 = 2114;
        v62 = v24;
        __int16 v63 = 2112;
        v64 = v25;
        __int16 v65 = 2112;
        v66 = v26;
        __int16 v67 = 2112;
        v68 = v27;
        __int16 v69 = 2114;
        v70 = v28;
        _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "Found a stack creation event for stack %{public}@: %{public}@ - %@: %@ - %@ - %{public}@", buf, 0x3Eu);
      }
      [v11 setStackCreationEvent:v7];
      goto LABEL_71;
    }
    v36 = __atxlog_handle_blending();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v57 = [v7 stackId];
      v55 = [v7 date];
      v37 = [v7 stackId];
      [v7 eventTypeString];
      v38 = uint64_t v58 = a1;
      v39 = [v7 widgetBundleId];
      v40 = [v7 reason];
      v56 = [v7 metadata];
      v41 = [v56 isStalenessRotation];
      int v42 = [v41 BOOLValue];
      *(_DWORD *)buf = 138544898;
      v43 = @"NO";
      v60 = v57;
      __int16 v61 = 2114;
      if (v42) {
        v43 = @"YES";
      }
      v62 = v55;
      __int16 v63 = 2112;
      v64 = v37;
      __int16 v65 = 2112;
      v66 = v38;
      __int16 v67 = 2112;
      v68 = v39;
      __int16 v69 = 2114;
      v70 = v40;
      __int16 v71 = 2114;
      v72 = v43;
      _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEFAULT, "Found a stack rotation event for stack %{public}@: %{public}@ - %@: %@ - %@ - %{public}@ - isStalenessRotation %{public}@", buf, 0x48u);

      a1 = v58;
    }

    [v11 setLastStackRotationEvent:v7];
    v44 = [v7 reason];
    v45 = NSStringForATXHomeScreenStackChangeReason();
    int v46 = [v44 isEqualToString:v45];

    if (v46)
    {
      [v11 setLastUserScrollStackRotationEvent:v7];
      goto LABEL_71;
    }
    v47 = [v7 reason];
    v48 = NSStringForATXHomeScreenStackChangeReason();
    int v49 = [v47 isEqualToString:v48];

    if (!v49) {
      goto LABEL_71;
    }
    v50 = [v7 metadata];
    v51 = [v50 isStalenessRotation];
    int v52 = [v51 BOOLValue];

    if (!v52) {
      goto LABEL_71;
    }
    v53 = [v7 date];
    [v11 setDateOfLastStalenessRotation:v53];

    id v12 = [v7 blendingCacheId];
    v54 = *(void **)(a1 + 40);
    id v13 = [v7 stackId];
    [v54 setObject:v12 forKeyedSubscript:v13];
    goto LABEL_6;
  }
LABEL_73:
}

- (id)_blendingCacheIdToStackIdMap:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ATXStackStateTracker__blendingCacheIdToStackIdMap___block_invoke;
  v7[3] = &unk_1E68B1ED0;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __53__ATXStackStateTracker__blendingCacheIdToStackIdMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  [v6 addObject:v7];
}

- (void)cleanupOldDataWithHomeScreenPages:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up state in ATXStackStateTracker...", buf, 2u);
  }

  id v5 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x1D25F6CC0]();
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v11 = [v9 config];
        id v12 = [v11 stacks];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v30;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * v16);
              id v18 = (void *)MEMORY[0x1D25F6CC0]();
              uint64_t v19 = [v17 identifier];
              [v5 addObject:v19];

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
          }
          while (v14);
        }

        ++v8;
      }
      while (v8 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v7);
  }

  internalStateLock = self->_internalStateLock;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __58__ATXStackStateTracker_cleanupOldDataWithHomeScreenPages___block_invoke;
  v26[3] = &unk_1E68B1EF8;
  id v27 = v5;
  uint64_t v28 = self;
  id v21 = v5;
  [(_PASLock *)internalStateLock runWithLockAcquired:v26];
  uint64_t v22 = __atxlog_handle_blending();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "Done cleaning up state in ATXStackStateTracker.", buf, 2u);
  }
}

void __58__ATXStackStateTracker_cleanupOldDataWithHomeScreenPages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v5 = [v3 stackStateByStackId];
  uint64_t v6 = [v5 allKeys];
  uint64_t v7 = (void *)[v4 initWithArray:v6];

  [v7 minusSet:*(void *)(a1 + 32)];
  uint64_t v8 = __atxlog_handle_blending();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    uint64_t v15 = (uint64_t)v7;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Removing entries for the following stacks from ATXStackStateTracker: %@", (uint8_t *)&v14, 0xCu);
  }

  int v9 = [v3 stackStateByStackId];
  uint64_t v10 = [v7 allObjects];
  [v9 removeObjectsForKeys:v10];

  id v11 = __atxlog_handle_blending();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v3 stackStateByStackId];
    uint64_t v13 = [v12 count];
    int v14 = 134217984;
    uint64_t v15 = v13;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Entries for %lu stacks remain in ATXStackStateTracker", (uint8_t *)&v14, 0xCu);
  }
  [*(id *)(a1 + 40) coalescedPersistInternalState];
}

- (void)handleSigterm
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ATXStackStateTracker_handleSigterm__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__ATXStackStateTracker_handleSigterm__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 8)) {
    return [*(id *)(v1 + 24) runImmediately];
  }
  return result;
}

- (void)_persistInternalStateImmediatelyOnSigterm
{
  if (!self->_sigtermListener)
  {
    id v3 = [MEMORY[0x1E4F4B670] sharedInstance];
    sigtermListener = self->_sigtermListener;
    self->_sigtermListener = v3;

    id v5 = self->_sigtermListener;
    [(ATXSigtermListener *)v5 registerObserver:self];
  }
}

- (void)coalescedPersistInternalState
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ATXStackStateTracker_coalescedPersistInternalState__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__ATXStackStateTracker_coalescedPersistInternalState__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2[1])
  {
    uint64_t v3 = os_transaction_create();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    id v2 = *(void **)(a1 + 32);
  }
  [v2 _persistInternalStateImmediatelyOnSigterm];
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v6 runAfterDelaySeconds:0 coalescingBehavior:10.0];
}

- (BOOL)persistInternalState
{
  id v2 = self;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  internalStateLock = self->_internalStateLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ATXStackStateTracker_persistInternalState__block_invoke;
  v7[3] = &unk_1E68B1DE8;
  void v7[4] = v2;
  v7[5] = &v8;
  [(_PASLock *)internalStateLock runWithLockAcquired:v7];
  queue = v2->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ATXStackStateTracker_persistInternalState__block_invoke_190;
  block[3] = &unk_1E68AB818;
  block[4] = v2;
  dispatch_async(queue, block);
  LOBYTE(v2) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

void __44__ATXStackStateTracker_persistInternalState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v21 = 0;
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:0 error:&v21];
  id v6 = v21;
  if (!v5)
  {
    id v12 = __atxlog_handle_blending();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_1((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);
    }

    goto LABEL_12;
  }
  int v7 = open((const char *)[*(id *)(*(void *)(a1 + 32) + 40) UTF8String], 514, 384);
  if (v7 == -1)
  {
    uint64_t v19 = __atxlog_handle_blending();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_2();
    }

LABEL_12:
    LOBYTE(v9) = 0;
    goto LABEL_17;
  }
  int v8 = v7;
  int v9 = ATXCacheFileWrite();
  uint64_t v10 = __atxlog_handle_blending();
  char v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXStackStateTracker: Done persisting internal state.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_3(v11);
  }

  if ((v8 & 0x80000000) == 0) {
    close(v8);
  }
LABEL_17:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

void __44__ATXStackStateTracker_persistInternalState__block_invoke_190(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (BOOL)loadInternalState
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  uint64_t v4 = [(ATXStackStateTracker *)self dataFromDisk];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D25F6CC0]();
    id v27 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v27];
    id v7 = v27;
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v6 == 0;
    }
    BOOL v9 = !v8;
    if (v8)
    {
      uint64_t v22 = __atxlog_handle_blending();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        [(ATXStackStateTracker *)(uint64_t)v7 loadInternalState];
      }

      id v23 = objc_alloc(MEMORY[0x1E4F93B70]);
      id v12 = objc_opt_new();
      int v24 = (_PASLock *)[v23 initWithGuardedData:v12];
      internalStateLock = self->_internalStateLock;
      self->_internalStateLock = v24;
    }
    else
    {
      uint64_t v10 = (_PASLock *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v6];
      char v11 = self->_internalStateLock;
      self->_internalStateLock = v10;

      id v12 = __atxlog_handle_blending();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        long long v29 = "-[ATXStackStateTracker loadInternalState]";
        _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Success", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v13 = __atxlog_handle_blending();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(ATXStackStateTracker *)v13 loadInternalState];
    }

    id v7 = (id)objc_opt_new();
    id v21 = (_PASLock *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v7];
    BOOL v9 = 0;
    id v6 = self->_internalStateLock;
    self->_internalStateLock = v21;
  }

  return v9;
}

- (id)dataFromDisk
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(&v14.st_size, 0, 48);
  p_path = &self->_path;
  if (!lstat([(NSString *)self->_path fileSystemRepresentation], &v14)&& v14.st_size > 0x200000)
  {
    id v3 = __atxlog_handle_blending();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[ATXStackStateTracker dataFromDisk](v3);
    }

LABEL_16:
    id v6 = 0;
    goto LABEL_17;
  }
  int v4 = open([(NSString *)*p_path UTF8String], 0);
  if (v4 == -1)
  {
    int v7 = *__error();
    BOOL v8 = __atxlog_handle_blending();
    BOOL v9 = v8;
    if (v7 == 2)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *p_path;
        char v11 = __error();
        id v12 = strerror(*v11);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v10;
        __int16 v16 = 2082;
        uint64_t v17 = v12;
        _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Stack state tracker file at path %{public}@ exists but we were unable to read it. Error: %{public}s", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[ATXStackStateTracker dataFromDisk]();
    }

    goto LABEL_16;
  }
  int v5 = v4;
  *(void *)buf = 0;
  ATXCacheFileRead();
  if ((v5 & 0x80000000) == 0) {
    close(v5);
  }
  id v6 = *(id *)buf;

LABEL_17:
  return v6;
}

- (NSDictionary)currentSuggestionsWidgetLayouts
{
  return self->_currentSuggestionsWidgetLayouts;
}

- (void)setCurrentSuggestionsWidgetLayouts:(id)a3
{
}

- (NSDictionary)currentAppPredictionPanelLayouts
{
  return self->_currentAppPredictionPanelLayouts;
}

- (void)setCurrentAppPredictionPanelLayouts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAppPredictionPanelLayouts, 0);
  objc_storeStrong((id *)&self->_currentSuggestionsWidgetLayouts, 0);
  objc_storeStrong((id *)&self->_sigtermListener, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_internalStateLock, 0);
  objc_storeStrong((id *)&self->_coalescedPersistInternalStateOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

void __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Stack %{public}@ is stale because no rotations have happened recently.", (uint8_t *)&v3, 0xCu);
}

void __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Stack %{public}@ is not stale because it was created recently.", (uint8_t *)&v3, 0xCu);
}

void __37__ATXStackStateTracker_stackIsStale___block_invoke_cold_3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [a2 stackStateByStackId];
  int v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  int v8 = 138543618;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  char v11 = v7;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "Stack state for stackId %{public}@:\n%{public}@", (uint8_t *)&v8, 0x16u);
}

void __49__ATXStackStateTracker_topWidgetUniqueIdOfStack___block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = [a2 stackStateByStackId];
  id v6 = [v5 allKeys];
  int v7 = 136315650;
  int v8 = "-[ATXStackStateTracker topWidgetUniqueIdOfStack:]_block_invoke";
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%s: Failed for stack %{public}@. internalState.stackStateByStackId has entry for stacks %@", (uint8_t *)&v7, 0x20u);
}

void __49__ATXStackStateTracker_updateStackRotationEvents__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__ATXStackStateTracker_updateStackRotationEventsByQueryingBiome__block_invoke_175_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Biome query for HomeScreen UI events completed with failure. Error: %@", (uint8_t *)&v4, 0xCu);
}

void __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_2()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_2_6(&dword_1D0FA3000, v1, v2, "ATXStackStateTracker: Couldn't persist internal state - unable to create cache file at path %{public}@: [%i] %{public}s", v3, v4, v5, v6, 2u);
}

void __44__ATXStackStateTracker_persistInternalState__block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXStackStateTracker: Couldn't persist internal state due to ATXCacheFileWrite failure.", v1, 2u);
}

- (void)loadInternalState
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136446722;
  uint64_t v4 = "-[ATXStackStateTracker loadInternalState]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%{public}s: Using empty internal state because loadInternalState failed (unarchiveErr %@, internalState %@)", (uint8_t *)&v3, 0x20u);
}

- (void)dataFromDisk
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_2_6(&dword_1D0FA3000, v1, v2, "No stack state tracker file found at path %{public}@: [%{public}i] %{public}s", v3, v4, v5, v6, 2u);
}

@end