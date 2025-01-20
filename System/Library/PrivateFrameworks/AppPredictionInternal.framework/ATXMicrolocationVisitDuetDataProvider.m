@interface ATXMicrolocationVisitDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (int64_t)supportedCoreDuetStream;
- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5;
- (void)adjustDatesForMicrolocationEvents:(id)a3;
@end

@implementation ATXMicrolocationVisitDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 11;
}

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  v31.receiver = self;
  v31.super_class = (Class)ATXMicrolocationVisitDuetDataProvider;
  v24 = v9;
  v25 = v8;
  v23 = v10;
  [(ATXDuetDataProvider *)&v31 fetchEventsBetweenStartDate:v8 andEndDate:v9 withPredicates:v10];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1D25F6CC0]();
        v18 = [v16 dominantMicrolocationUUID];
        v19 = [v11 lastObject];
        v20 = [v19 dominantMicrolocationUUID];
        char v21 = [v18 isEqual:v20];

        if ((v21 & 1) == 0) {
          [v11 addObject:v16];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v13);
  }

  return v11;
}

- (void)adjustDatesForMicrolocationEvents:(id)a3
{
  id v3 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__62;
  v8[4] = __Block_byref_object_dispose__62;
  id v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__ATXMicrolocationVisitDuetDataProvider_adjustDatesForMicrolocationEvents___block_invoke;
  v5[3] = &unk_1E68B2AE8;
  id v4 = v3;
  id v6 = v4;
  v7 = v8;
  [v4 enumerateObjectsWithOptions:2 usingBlock:v5];

  _Block_object_dispose(v8, 8);
}

void __75__ATXMicrolocationVisitDuetDataProvider_adjustDatesForMicrolocationEvents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) count] - 1 != a3) {
    [v8 setEndDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  uint64_t v5 = [v8 startDate];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end