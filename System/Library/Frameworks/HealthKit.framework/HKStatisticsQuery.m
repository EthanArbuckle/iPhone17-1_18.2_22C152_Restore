@interface HKStatisticsQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKStatisticsQuery)initWithQuantityType:(HKQuantityType *)quantityType quantitySamplePredicate:(NSPredicate *)quantitySamplePredicate options:(HKStatisticsOptions)options completionHandler:(void *)handler;
- (HKStatisticsQuery)initWithSampleType:(id)a3 samplePredicate:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (NSDateInterval)_dateInterval;
- (id)_filter;
- (id)_filterForDateInterval:(id)a3;
- (id)completionHandler;
- (unint64_t)mergeStrategy;
- (unint64_t)options;
- (void)_setDateInterval:(id)a3;
- (void)client_deliverStatistics:(id)a3 forQuery:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setMergeStrategy:(unint64_t)a3;
@end

@implementation HKStatisticsQuery

- (HKStatisticsQuery)initWithQuantityType:(HKQuantityType *)quantityType quantitySamplePredicate:(NSPredicate *)quantitySamplePredicate options:(HKStatisticsOptions)options completionHandler:(void *)handler
{
  result = [(HKStatisticsQuery *)self initWithSampleType:quantityType samplePredicate:quantitySamplePredicate options:options completionHandler:handler];
  if (result) {
    result->_requireQuantityType = 1;
  }
  return result;
}

- (HKStatisticsQuery)initWithSampleType:(id)a3 samplePredicate:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKStatisticsQuery;
  v11 = [(HKQuery *)&v16 _initWithObjectType:a3 predicate:a4];
  v12 = v11;
  if (v11)
  {
    v11->_options = a5;
    v13 = _Block_copy(v10);
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v13;

    v12->_mergeStrategy = 0;
  }

  return v12;
}

- (id)_filterForDateInterval:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v6 = [(HKQuery *)self objectType];
    v7 = [v5 setWithObject:v6];

    v8 = [v4 endDate];
    v9 = +[_HKSampleComparisonFilter startDateFilterWithOperatorType:1 date:v8 dataTypes:v7];

    id v10 = [v4 startDate];
    v11 = +[_HKSampleComparisonFilter endDateFilterWithOperatorType:3 date:v10 dataTypes:v7];

    v20[0] = v9;
    v20[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    if (HKProgramSDKAtLeast())
    {
      v13 = [(HKQuery *)self objectType];
      v14 = [v4 startDate];
      v15 = [v13 _earliestAllowedStartDateForSampleOverlappingDate:v14];

      if (v15)
      {
        objc_super v16 = +[_HKComparisonFilter filterForKeyPath:@"startDate" operatorType:3 value:v15 dataTypes:v7];
        uint64_t v17 = [v12 arrayByAddingObject:v16];

        v12 = (void *)v17;
      }
    }
    v18 = +[_HKCompoundFilter andFilterWithSubfilters:v12];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_filter
{
  v7.receiver = self;
  v7.super_class = (Class)HKStatisticsQuery;
  v3 = [(HKQuery *)&v7 _filter];
  id v4 = [(HKStatisticsQuery *)self _filterForDateInterval:self->_dateInterval];
  v5 = +[_HKCompoundFilter compoundFilterWithFilter:v3 otherFilter:v4];

  return v5;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED012D0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKStatisticsQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverStatistics_forQuery_, 0, 0);
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKStatisticsQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setOptions:", self->_options, v5.receiver, v5.super_class);
  [v4 setMergeStrategy:self->_mergeStrategy];
  [v4 setDateInterval:self->_dateInterval];
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKStatisticsQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)queue_validate
{
  v10.receiver = self;
  v10.super_class = (Class)HKStatisticsQuery;
  [(HKQuery *)&v10 queue_validate];
  if (self->_requireQuantityType)
  {
    v3 = [(HKQuery *)self objectType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_super v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3C8];
      uint64_t v7 = objc_opt_class();
      [v5 raise:v6, @"%@ data type must be of class %@", v7, objc_opt_class() format];
    }
  }
  if (!self->_completionHandler) {
    [MEMORY[0x1E4F1CA00] raise:@"HKQueryValidationFailureException", @"%@ completionHandler cannot be nil", objc_opt_class() format];
  }
  unint64_t options = self->_options;
  v9 = [(HKQuery *)self objectType];
  +[HKStatistics _validateOptions:options forDataType:v9];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  objc_super v5 = _Block_copy(self->_completionHandler);
  if (v5)
  {
    uint64_t v6 = [(HKQuery *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__HKStatisticsQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __40__HKStatisticsQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)_setDateInterval:(id)a3
{
  id v4 = (NSDateInterval *)a3;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:sel__setDateInterval_];
  dateInterval = self->_dateInterval;
  self->_dateInterval = v4;
}

- (void)client_deliverStatistics:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HKStatisticsQuery_client_deliverStatistics_forQuery___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __55__HKStatisticsQuery_client_deliverStatistics_forQuery___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 160));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__HKStatisticsQuery_client_deliverStatistics_forQuery___block_invoke_2;
    v6[3] = &unk_1E58BD808;
    id v7 = *(id *)(a1 + 48);
    id v5 = v2;
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = v5;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 1, v6);
  }
}

void __55__HKStatisticsQuery_client_deliverStatistics_forQuery___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    [*(id *)(a1 + 40) applicationSDKVersionToken];
    if (HKProgramSDKTokenAtLeast())
    {
      uint64_t v5 = a1 + 40;
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(v5 + 8);
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 11, @"No data available for the specified predicate.");
      id v10 = (HKStatistics *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void, HKStatistics *))(v4 + 16))(v4, v3, 0, v10);
    }
    else
    {
      id v6 = [HKStatistics alloc];
      id v7 = [*(id *)(a1 + 40) objectType];
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
      id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
      id v10 = [(HKStatistics *)v6 initWithDataType:v7 startDate:v8 endDate:v9];

      (*(void (**)(void, void, HKStatistics *, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), v10, 0);
    }
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)mergeStrategy
{
  return self->_mergeStrategy;
}

- (void)setMergeStrategy:(unint64_t)a3
{
  self->_mergeStrategy = a3;
}

- (NSDateInterval)_dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end