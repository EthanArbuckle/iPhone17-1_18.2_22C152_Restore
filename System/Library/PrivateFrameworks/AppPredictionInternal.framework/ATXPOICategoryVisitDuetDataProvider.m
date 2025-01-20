@interface ATXPOICategoryVisitDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (id)sharedInstance;
+ (int64_t)supportedCoreDuetStream;
- (ATXPOICategoryVisitDuetDataProvider)init;
- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 limit:(unint64_t)a6 ascending:(BOOL)a7;
- (id)getCurrentVisit;
- (void)subscribeToPOIChangesForCategory:(id)a3 observer:(id)a4 enterSelector:(SEL)a5 exitSelector:(SEL)a6;
- (void)unsubscribeToPOIChanges;
@end

@implementation ATXPOICategoryVisitDuetDataProvider

- (ATXPOICategoryVisitDuetDataProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXPOICategoryVisitDuetDataProvider;
  v2 = [(ATXPOICategoryVisitDuetDataProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    streamAggregator = v2->_streamAggregator;
    v2->_streamAggregator = (ATXPOICategoryEventAggregator *)v3;

    uint64_t v5 = objc_opt_new();
    dataProvider = v2->_dataProvider;
    v2->_dataProvider = (ATXPOICategoryVisitDataProvider *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_13 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_13, &__block_literal_global_92);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_17;
  return v2;
}

void __53__ATXPOICategoryVisitDuetDataProvider_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_17;
  sharedInstance__pasExprOnceResult_17 = v1;
}

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 13;
}

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 limit:(unint64_t)a6 ascending:(BOOL)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  [v9 timeIntervalSinceReferenceDate];
  double v12 = v11;
  v35 = v10;
  [v10 timeIntervalSinceReferenceDate];
  double v14 = v13;
  v15 = BiomeLibrary();
  v16 = [v15 Location];
  v17 = [v16 PointOfInterest];
  v18 = [v17 Category];
  v36 = v9;
  uint64_t v19 = objc_msgSend(v18, "atx_publisherFromStartDate:", v9);

  v34 = (void *)v19;
  v20 = [(ATXPOICategoryEventAggregator *)self->_streamAggregator groupVisitsFromPublisher:v19 startTimestamp:v12 endTimestamp:v14];
  v21 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v33 = v20;
  id obj = [v20 events];
  uint64_t v22 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v27 = [ATXPOICategoryVisitDuetEvent alloc];
        v28 = [v26 possibleCategoryNames];
        v29 = [v26 startDate];
        v30 = [v26 endDate];
        v31 = -[ATXPOICategoryVisitDuetEvent initWithPossibleCategoryNames:startDate:endDate:hasExited:](v27, "initWithPossibleCategoryNames:startDate:endDate:hasExited:", v28, v29, v30, [v26 hasExited]);

        [v21 addObject:v31];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v23);
  }

  return v21;
}

- (id)getCurrentVisit
{
  v2 = [(ATXPOICategoryVisitDataProvider *)self->_dataProvider getCurrentVisit];
  uint64_t v3 = [ATXPOICategoryVisitDuetEvent alloc];
  v4 = [v2 possibleCategoryNames];
  uint64_t v5 = [v2 startDate];
  v6 = [v2 endDate];
  v7 = [(ATXPOICategoryVisitDuetEvent *)v3 initWithPossibleCategoryNames:v4 startDate:v5 endDate:v6];

  return v7;
}

- (void)subscribeToPOIChangesForCategory:(id)a3 observer:(id)a4 enterSelector:(SEL)a5 exitSelector:(SEL)a6
{
}

void __108__ATXPOICategoryVisitDuetDataProvider_subscribeToPOIChangesForCategory_observer_enterSelector_exitSelector___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __108__ATXPOICategoryVisitDuetDataProvider_subscribeToPOIChangesForCategory_observer_enterSelector_exitSelector___block_invoke_cold_1(v2, v4);
    }
  }
}

- (void)unsubscribeToPOIChanges
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_streamAggregator, 0);
}

void __108__ATXPOICategoryVisitDuetDataProvider_subscribeToPOIChangesForCategory_observer_enterSelector_exitSelector___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXPOICategoryVisitDuetDataProvider: error subscribing to stream: %@", (uint8_t *)&v4, 0xCu);
}

@end