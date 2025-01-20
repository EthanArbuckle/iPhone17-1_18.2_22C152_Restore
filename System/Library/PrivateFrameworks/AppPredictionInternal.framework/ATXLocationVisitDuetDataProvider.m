@interface ATXLocationVisitDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (int64_t)supportedCoreDuetStream;
- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 limit:(unint64_t)a6 ascending:(BOOL)a7;
@end

@implementation ATXLocationVisitDuetDataProvider

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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F935D0] sharedInstance];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v10];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__43;
  v30 = __Block_byref_object_dispose__43;
  id v31 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __106__ATXLocationVisitDuetDataProvider_fetchEventsBetweenStartDate_andEndDate_withPredicates_limit_ascending___block_invoke;
  v23 = &unk_1E68AC9A8;
  v25 = &v26;
  v15 = v14;
  v24 = v15;
  [v12 fetchLocationsOfInterestVisitedDuring:v13 handler:&v20];
  objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:", v15, 10.0, v20, v21, v22, v23);
  v16 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v27[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = v17;
    _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "SortedLoiEvents: %@", buf, 0xCu);
  }

  id v18 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v18;
}

void __106__ATXLocationVisitDuetDataProvider_fetchEventsBetweenStartDate_andEndDate_withPredicates_limit_ascending___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v29 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v2;
  uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v35;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v3;
        v4 = *(void **)(*((void *)&v34 + 1) + 8 * v3);
        v5 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v4;
          _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "LOI: %@", buf, 0xCu);
        }

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v6 = [v4 visits];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v31 != v9) {
                objc_enumerationMutation(v6);
              }
              unint64_t v11 = [*(id *)(*((void *)&v30 + 1) + 8 * i) rangeValue];
              uint64_t v13 = v12;
              dispatch_semaphore_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)v11];
              v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)(v11 + v13)];
              v16 = [ATXLocationVisitDuetEvent alloc];
              uint64_t v17 = [v4 uuid];
              id v18 = [(ATXLocationVisitDuetEvent *)v16 initWithLocationOfInterestIdentifier:v17 startDate:v14 endDate:v15];

              [v29 addObject:v18];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v8);
        }

        uint64_t v3 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v27);
  }

  v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v38 = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  uint64_t v21 = [v29 sortedArrayUsingDescriptors:v20];
  uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
  v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end