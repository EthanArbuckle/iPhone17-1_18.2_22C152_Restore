@interface PHChangeHandlingDebugger
- (PHChangeHandlingDebugger)init;
- (PHChangeHandlingDebugger)initWithMaxPreviousEvents:(unint64_t)a3;
- (id)_beginCurrentEvent;
- (id)beginProcessPendingChanges;
- (id)beginPublishCloudStatusChange;
- (id)formattedStringFromTimestamp:(double)a3;
- (id)stateCaptureDictionary;
- (void)changeHandlingActiveStateDidChange:(BOOL)a3;
- (void)endCurrentEvent;
- (void)processPendingChangesStateDidChange:(BOOL)a3;
@end

@implementation PHChangeHandlingDebugger

- (void)changeHandlingActiveStateDidChange:(BOOL)a3
{
}

- (PHChangeHandlingDebugger)init
{
  return [(PHChangeHandlingDebugger *)self initWithMaxPreviousEvents:50];
}

- (PHChangeHandlingDebugger)initWithMaxPreviousEvents:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PHChangeHandlingDebugger;
  v4 = [(PHChangeHandlingDebugger *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_maxPreviousEvents = a3;
    v4->_eventLock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    eventLock_previousEvents = v5->_eventLock_previousEvents;
    v5->_eventLock_previousEvents = v6;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v5->_activeLock._os_unfair_lock_opaque = 0;
    v5->_activeLock_isActive = 0;
    v5->_activeLock_isActiveTimestamp = v8;
    v5->_pendingLock_isChangeProcessingPending = 0;
    v5->_pendingLock_isChangeProcessingPendingTimestamp = v8;
    v9 = v5;
  }

  return v5;
}

uint64_t __63__PHChangeHandlingDebugger_changeHandlingActiveStateDidChange___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 52) = *(unsigned char *)(a1 + 40);
  uint64_t result = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 56) = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventLock_previousEvents, 0);
  objc_storeStrong((id *)&self->_eventLock_nextEvent, 0);

  objc_storeStrong((id *)&self->_eventLock_currentEvent, 0);
}

- (id)formattedStringFromTimestamp:(double)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F8A228], "stringFromTimestamp:");
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v6 = [MEMORY[0x1E4F8A228] stringFromRelativeTimeInterval:a3 - v5];
  v7 = [NSString stringWithFormat:@"%@ (%@)", v4, v6];

  return v7;
}

- (id)stateCaptureDictionary
{
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__47118;
  v53 = __Block_byref_object_dispose__47119;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__47118;
  v47 = __Block_byref_object_dispose__47119;
  id v48 = 0;
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  v38 = __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke;
  v39 = &unk_1E58485C8;
  v40 = self;
  v41 = &v49;
  v42 = &v43;
  PLRunWithUnfairLock();
  uint64_t v3 = objc_msgSend((id)v44[5], "_pl_map:", &__block_literal_global_47120);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v28 = 0;
  v29 = (double *)&v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke_3;
  v24 = &unk_1E58485C8;
  v25 = self;
  v26 = &v32;
  v27 = &v28;
  PLRunWithUnfairLock();
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  PLRunWithUnfairLock();
  v4 = [(PHChangeHandlingDebugger *)self formattedStringFromTimestamp:v29[3]];
  double v5 = [(PHChangeHandlingDebugger *)self formattedStringFromTimestamp:v14[3]];
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = [(id)v50[5] description];
  [v6 setObject:v7 forKeyedSubscript:@"currentEvent"];

  [v6 setObject:v3 forKeyedSubscript:@"previousEvents"];
  if (*((unsigned char *)v33 + 24)) {
    double v8 = @"YES";
  }
  else {
    double v8 = @"NO";
  }
  v9 = v8;
  [v6 setObject:v9 forKeyedSubscript:@"isActive"];

  [v6 setObject:v4 forKeyedSubscript:@"isActiveTimestamp"];
  if (*((unsigned char *)v18 + 24)) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  objc_super v11 = v10;
  [v6 setObject:v11 forKeyedSubscript:@"isChangeProcessingPending"];

  [v6 setObject:v5 forKeyedSubscript:@"isChangeProcessingPendingTimestamp"];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v6;
}

void __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  uint64_t v2 = [*(id *)(a1[4] + 40) copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

double __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke_3(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 52);
  double result = *(double *)(a1[4] + 56);
  *(double *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

double __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke_4(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 68);
  double result = *(double *)(a1[4] + 72);
  *(double *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (void)processPendingChangesStateDidChange:(BOOL)a3
{
}

uint64_t __64__PHChangeHandlingDebugger_processPendingChangesStateDidChange___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 68) = *(unsigned char *)(a1 + 40);
  uint64_t result = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 72) = v3;
  return result;
}

- (void)endCurrentEvent
{
}

void __43__PHChangeHandlingDebugger_endCurrentEvent__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v2, "setEndTimestamp:");
  unint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 40) count];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 >= *(void *)(v6 + 8))
  {
    uint64_t v7 = [*(id *)(v6 + 40) objectAtIndexedSubscript:0];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v7;

    [*(id *)(*(void *)(a1 + 32) + 40) removeObjectAtIndex:0];
  }
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 40) addObject:v2];
  }
  else
  {
    v10 = PLChangeHandlingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)objc_super v11 = 0;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_FAULT, "Debugger.endCurrentEvent: Unexpected nil debugger event", v11, 2u);
    }
  }
}

- (id)beginPublishCloudStatusChange
{
  id v2 = [(PHChangeHandlingDebugger *)self _beginCurrentEvent];
  [v2 startPublishCloudStatus];

  return v2;
}

- (id)beginProcessPendingChanges
{
  id v2 = [(PHChangeHandlingDebugger *)self _beginCurrentEvent];
  [v2 startProcessPendingChanges];

  return v2;
}

- (id)_beginCurrentEvent
{
  id v2 = PLResultWithUnfairLock();

  return v2;
}

id __46__PHChangeHandlingDebugger__beginCurrentEvent__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24))
  {
    uint64_t v3 = PLChangeHandlingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
      int v14 = 138412290;
      uint64_t v15 = v4;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_FAULT, "Debugger._beginCurrentEvent: Unexpected current event: %@", (uint8_t *)&v14, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) reset];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v7 = *(void **)(v2 + 32);
  if (v7)
  {
    objc_storeStrong((id *)(v2 + 24), v7);
    [*(id *)(*(void *)(a1 + 32) + 24) reset];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;
  }
  else
  {
    v10 = objc_alloc_init(PHChangeHandlingDebugEvent);
    uint64_t v11 = *(void *)(a1 + 32);
    v9 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;
  }

  v12 = *(void **)(*(void *)(a1 + 32) + 24);

  return v12;
}

@end