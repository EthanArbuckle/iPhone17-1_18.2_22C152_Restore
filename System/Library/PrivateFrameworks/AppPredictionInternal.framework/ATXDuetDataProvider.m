@interface ATXDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (id)duetHelperStreamTypeToDuetEventStream:(int64_t)a3;
+ (int64_t)supportedCoreDuetStream;
- (NSArray)streamData;
- (id)fetchEventIdentifierCountsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5;
- (id)fetchEventIdentifierCountsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 dateBuckets:(id)a6;
- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5;
- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 limit:(unint64_t)a6 ascending:(BOOL)a7;
- (id)filteredEventsWithPredicate:(id)a3;
- (id)getUniqueValuesForPropertyKey:(id)a3;
- (void)tagEventsWithLocationsFromLocationVisitsArray:(id)a3;
@end

@implementation ATXDuetDataProvider

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 limit:(unint64_t)a6 ascending:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  context = (void *)MEMORY[0x1D25F6CC0]();
  v14 = objc_opt_class();
  v15 = objc_msgSend(v14, "duetHelperStreamTypeToDuetEventStream:", objc_msgSend((id)objc_opt_class(), "supportedCoreDuetStream"));
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17 = +[_ATXDuetHelper sharedInstance];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __93__ATXDuetDataProvider_fetchEventsBetweenStartDate_andEndDate_withPredicates_limit_ascending___block_invoke;
  v25[3] = &unk_1E68B4DB8;
  v25[4] = self;
  id v18 = v16;
  id v26 = v18;
  LOBYTE(v22) = a7;
  [v17 _enumerateBatchesInDuetStream:v15 startDate:v11 endDate:v12 otherPredicates:v13 limit:a6 batchSize:800 ascending:v22 block:v25];

  v19 = v26;
  id v20 = v18;

  return v20;
}

void __93__ATXDuetDataProvider_fetchEventsBetweenStartDate_andEndDate_withPredicates_limit_ascending___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1D25F6CC0](v4);
        v10 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "supportedDuetEventClass", (void)v11)), "initWithDKEvent:", v8);
        if (v10) {
          [*(id *)(a1 + 40) addObject:v10];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }
}

+ (id)duetHelperStreamTypeToDuetEventStream:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      goto LABEL_19;
    case 1:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] audioOutputRouteStream];
      break;
    case 2:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] bluetoothIsConnectedStream];
      break;
    case 3:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] userIsFirstBacklightOnAfterWakeup];
      break;
    case 4:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] carPlayIsConnectedStream];
      break;
    case 5:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] nowPlayingStream];
      break;
    case 6:
    case 11:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] microLocationVisitStream];
      break;
    case 7:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
      break;
    case 8:
      uint64_t v8 = +[_ATXGlobals sharedInstance];
      int v9 = [v8 useOriginalScreenLockStateStream];

      if (v9) {
        [MEMORY[0x1E4F5B5F8] deviceIsLockedStream];
      }
      else {
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] deviceIsLockedImputedStream];
      }
      break;
    case 9:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] appClipUsageStream];
      break;
    case 10:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] deviceIsPluggedInStream];
      break;
    case 12:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] motionStream];
      break;
    case 13:
      v10 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        +[ATXDuetDataProvider duetHelperStreamTypeToDuetEventStream:](v10);
      }

LABEL_19:
      uint64_t v4 = [MEMORY[0x1E4F5B5F8] appInFocusStream];
      break;
    default:
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"ATXDuetDataProvider.m", 199, @"Returning nil _DKEventStream for ATXDuetDataProviderStreamType %ld.", a3);

      uint64_t v4 = 0;
      break;
  }
  return v4;
}

+ (Class)supportedDuetEventClass
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXDuetDataProvider.m" lineNumber:22 description:@"Should be implemented by subclasses"];

  return 0;
}

+ (int64_t)supportedCoreDuetStream
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"ATXDuetDataProvider.m" lineNumber:28 description:@"Should be implemented by subclasses"];

  return 0;
}

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5
{
  return [(ATXDuetDataProvider *)self fetchEventsBetweenStartDate:a3 andEndDate:a4 withPredicates:a5 limit:1000000 ascending:1];
}

- (id)fetchEventIdentifierCountsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = objc_opt_new();
  long long v12 = objc_opt_class();
  long long v13 = objc_msgSend(v12, "duetHelperStreamTypeToDuetEventStream:", objc_msgSend((id)objc_opt_class(), "supportedCoreDuetStream"));
  long long v14 = +[_ATXDuetHelper sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__ATXDuetDataProvider_fetchEventIdentifierCountsBetweenStartDate_andEndDate_withPredicates___block_invoke;
  v19[3] = &unk_1E68B4DB8;
  v19[4] = self;
  id v15 = v11;
  id v20 = v15;
  [v14 _enumerateBatchesInDuetStream:v13 startDate:v10 endDate:v9 otherPredicates:v8 limit:10000000 ascending:1 block:v19];

  uint64_t v16 = v20;
  id v17 = v15;

  return v17;
}

void __92__ATXDuetDataProvider_fetchEventIdentifierCountsBetweenStartDate_andEndDate_withPredicates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1D25F6CC0](v4);
        id v10 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "supportedDuetEventClass", (void)v14)), "initWithDKEvent:", v8);
        long long v11 = v10;
        if (v10)
        {
          long long v12 = *(void **)(a1 + 40);
          long long v13 = [v10 identifier];
          [v12 addObject:v13];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }
}

- (id)fetchEventIdentifierCountsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 dateBuckets:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        [v14 setObject:&unk_1F27F2238 forKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v17);
  }

  id v20 = objc_opt_class();
  v21 = objc_msgSend(v20, "duetHelperStreamTypeToDuetEventStream:", objc_msgSend((id)objc_opt_class(), "supportedCoreDuetStream"));
  uint64_t v22 = +[_ATXDuetHelper sharedInstance];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __104__ATXDuetDataProvider_fetchEventIdentifierCountsBetweenStartDate_andEndDate_withPredicates_dateBuckets___block_invoke;
  v28[3] = &unk_1E68B0830;
  v28[4] = self;
  id v29 = v15;
  id v23 = v14;
  id v30 = v23;
  id v24 = v15;
  [v22 _enumerateBatchesInDuetStream:v21 startDate:v10 endDate:v11 otherPredicates:v12 limit:10000000 ascending:1 block:v28];

  v25 = v30;
  id v26 = v23;

  return v26;
}

void __104__ATXDuetDataProvider_fetchEventIdentifierCountsBetweenStartDate_andEndDate_withPredicates_dateBuckets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = a2;
  uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v28 + 1) + 8 * v3);
        uint64_t v5 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "supportedDuetEventClass")), "initWithDKEvent:", v4);
        if (v6)
        {
          uint64_t v22 = v5;
          uint64_t v23 = v3;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v7 = *(id *)(a1 + 40);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v25;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v25 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * v11);
                id v13 = [v6 startDate];
                long long v14 = [v13 earlierDate:v12];
                id v15 = [v6 startDate];

                if (v14 != v15)
                {
                  uint64_t v16 = NSNumber;
                  uint64_t v17 = [*(id *)(a1 + 48) objectForKeyedSubscript:v12];
                  uint64_t v18 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "integerValue") + 1);
                  [*(id *)(a1 + 48) setObject:v18 forKeyedSubscript:v12];
                }
                ++v11;
              }
              while (v9 != v11);
              uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v9);
          }

          uint64_t v5 = v22;
          uint64_t v3 = v23;
        }

        ++v3;
      }
      while (v3 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v21);
  }
}

- (id)filteredEventsWithPredicate:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"ATXDuetDataProvider.m" lineNumber:133 description:@"Method is not yet implemented"];

  streamData = self->_streamData;
  return streamData;
}

- (void)tagEventsWithLocationsFromLocationVisitsArray:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"ATXDuetDataProvider.m" lineNumber:139 description:@"Method is not yet implemented"];
}

- (id)getUniqueValuesForPropertyKey:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"ATXDuetDataProvider.m" lineNumber:145 description:@"Method is not yet implemented"];

  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSArray)streamData
{
  return self->_streamData;
}

- (void).cxx_destruct
{
}

+ (void)duetHelperStreamTypeToDuetEventStream:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Trying to access KnowledgeStore stream for None stream.", v1, 2u);
}

@end