@interface HKQuantitySeriesSampleBuilder
+ (id)_clientErrorForFinishedSeries;
+ (id)_exceptionForPreviouslyDiscardedBuilder;
+ (id)serverInterface;
- (BOOL)_changeStateForDiscardWithError:(id *)a3;
- (BOOL)_changeStateForFinishWithError:(id *)a3;
- (BOOL)_changeStateForInsertWithError:(id *)a3;
- (BOOL)_insertQuantity:(id)a3 dateInterval:(id)a4 error:(id *)a5;
- (BOOL)_validateDateInterval:(id)a3 error:(id *)a4;
- (BOOL)_validateQuantity:(id)a3 error:(id *)a4;
- (BOOL)insertQuantity:(HKQuantity *)quantity date:(NSDate *)date error:(NSError *)error;
- (BOOL)insertQuantity:(HKQuantity *)quantity dateInterval:(NSDateInterval *)dateInterval error:(NSError *)error;
- (HKDevice)device;
- (HKQuantitySeriesSampleBuilder)init;
- (HKQuantitySeriesSampleBuilder)initWithHealthStore:(HKHealthStore *)healthStore quantityType:(HKQuantityType *)quantityType startDate:(NSDate *)startDate device:(HKDevice *)device;
- (HKQuantityType)quantityType;
- (NSDate)startDate;
- (id)_queue_clientErrorForFatalError;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)unitTest_insertQuantityCompletion;
- (int64_t)unitTest_state;
- (void)_changeStateForFatalError:(id)a3;
- (void)_discardWithCompletion:(id)a3;
- (void)_finishSeriesWithMetadata:(id)a3 endDate:(id)a4 completion:(id)a5;
- (void)_taskServer_discardWithCompletion:(id)a3;
- (void)_taskServer_finishSeriesWithMetadata:(id)a3 endDate:(id)a4 finalSeries:(id)a5 completion:(id)a6;
- (void)_taskServer_insertQuantitySeries:(id)a3 completion:(id)a4;
- (void)discard;
- (void)finishSeriesWithMetadata:(NSDictionary *)metadata completion:(void *)completion;
- (void)finishSeriesWithMetadata:(NSDictionary *)metadata endDate:(NSDate *)endDate completion:(void *)completion;
- (void)setUnitTest_insertQuantityCompletion:(id)a3;
- (void)unitTest_setBatchSize:(int64_t)a3;
@end

@implementation HKQuantitySeriesSampleBuilder

- (HKQuantitySeriesSampleBuilder)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKQuantitySeriesSampleBuilder)initWithHealthStore:(HKHealthStore *)healthStore quantityType:(HKQuantityType *)quantityType startDate:(NSDate *)startDate device:(HKDevice *)device
{
  v11 = healthStore;
  v12 = quantityType;
  v13 = startDate;
  v14 = device;
  v32.receiver = self;
  v32.super_class = (Class)HKQuantitySeriesSampleBuilder;
  v15 = [(HKQuantitySeriesSampleBuilder *)&v32 init];
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
    }
    [(HKHealthStore *)v11 applicationSDKVersionToken];
    if (HKProgramSDKTokenAtLeast())
    {
      [(NSDate *)v13 timeIntervalSinceReferenceDate];
    }
    else if ([(HKQuantityType *)v12 aggregationStyle])
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"A quantityType with aggregationStyle HKQuantityAggregationStyleCumulative is required", v31);
    }
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
      }
    }
    uint64_t v16 = HKCreateSerialDispatchQueue(v15, 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    fatalError = v15->_fatalError;
    v15->_fatalError = 0;
    v15->_state = 0;

    objc_storeStrong((id *)&v15->_healthStore, healthStore);
    uint64_t v19 = [(HKQuantityType *)v12 copy];
    v20 = v15->_quantityType;
    v15->_quantityType = (HKQuantityType *)v19;

    uint64_t v21 = [(NSDate *)v13 copy];
    v22 = v15->_startDate;
    v15->_startDate = (NSDate *)v21;

    uint64_t v23 = [(HKDevice *)v14 copy];
    v24 = v15->_device;
    v15->_device = (HKDevice *)v23;

    v15->_batchSize = 1024;
    uint64_t v25 = [MEMORY[0x1E4F29128] UUID];
    identifier = v15->_identifier;
    v15->_identifier = (NSUUID *)v25;

    v27 = [[HKQuantitySeriesSampleBuilderTaskServerConfiguration alloc] initWithQuantityType:v15->_quantityType startDate:v15->_startDate device:v15->_device];
    v28 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v15->_healthStore taskIdentifier:@"HKQuantitySeriesSampleBuilderTaskServerIdentifier" exportedObject:v15 taskUUID:v15->_identifier];
    proxyProvider = v15->_proxyProvider;
    v15->_proxyProvider = v28;

    [(HKProxyProvider *)v15->_proxyProvider setShouldRetryOnInterruption:0];
    [(HKTaskServerProxyProvider *)v15->_proxyProvider setTaskConfiguration:v27];
  }
  return v15;
}

- (BOOL)insertQuantity:(HKQuantity *)quantity dateInterval:(NSDateInterval *)dateInterval error:(NSError *)error
{
  v8 = quantity;
  v9 = dateInterval;
  BOOL v10 = [(HKQuantitySeriesSampleBuilder *)self _validateQuantity:v8 error:error]
     && [(HKQuantitySeriesSampleBuilder *)self _validateDateInterval:v9 error:error]
     && [(HKQuantitySeriesSampleBuilder *)self _changeStateForInsertWithError:error]
     && [(HKQuantitySeriesSampleBuilder *)self _insertQuantity:v8 dateInterval:v9 error:error];

  return v10;
}

- (BOOL)insertQuantity:(HKQuantity *)quantity date:(NSDate *)date error:(NSError *)error
{
  v8 = (void *)MEMORY[0x1E4F28C18];
  v9 = quantity;
  BOOL v10 = objc_msgSend(v8, "hk_instantaneousDateIntervalWithDate:", date);
  LOBYTE(error) = [(HKQuantitySeriesSampleBuilder *)self insertQuantity:v9 dateInterval:v10 error:error];

  return (char)error;
}

- (void)finishSeriesWithMetadata:(NSDictionary *)metadata endDate:(NSDate *)endDate completion:(void *)completion
{
  v8 = metadata;
  v9 = endDate;
  BOOL v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:completion];
  uint64_t v11 = 0;
  if ([(HKQuantitySeriesSampleBuilder *)self _changeStateForFinishWithError:&v11]) {
    [(HKQuantitySeriesSampleBuilder *)self _finishSeriesWithMetadata:v8 endDate:v9 completion:v10];
  }
  else {
    v10[2](v10, 0, v11);
  }
}

- (void)finishSeriesWithMetadata:(NSDictionary *)metadata completion:(void *)completion
{
}

- (void)discard
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__HKQuantitySeriesSampleBuilder_discard__block_invoke;
  v2[3] = &unk_1E58BBE28;
  v2[4] = self;
  [(HKQuantitySeriesSampleBuilder *)self _discardWithCompletion:v2];
}

void __40__HKQuantitySeriesSampleBuilder_discard__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      __40__HKQuantitySeriesSampleBuilder_discard__block_invoke_cold_1(a1);
    }
  }
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (HKDevice)device
{
  return self->_device;
}

- (BOOL)_insertQuantity:(id)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v9 = objc_alloc_init(HKCodableQuantitySeriesDatum);
  BOOL v10 = [(HKQuantityType *)self->_quantityType canonicalUnit];
  [v7 doubleValueForUnit:v10];
  -[HKCodableQuantitySeriesDatum setValue:](v9, "setValue:");

  uint64_t v11 = [v8 startDate];
  [v11 timeIntervalSinceReferenceDate];
  -[HKCodableQuantitySeriesDatum setTimeInterval:](v9, "setTimeInterval:");

  [(HKHealthStore *)self->_healthStore applicationSDKVersionToken];
  if (HKProgramSDKTokenAtLeast())
  {
    [v8 duration];
    *(float *)&double v12 = v12;
    [(HKCodableQuantitySeriesDatum *)v9 setDuration:v12];
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12;
  uint64_t v25 = __Block_byref_object_dispose__12;
  id v26 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke;
  block[3] = &unk_1E58C0688;
  block[4] = self;
  v14 = v9;
  uint64_t v19 = v14;
  v20 = &v21;
  dispatch_sync(queue, block);
  uint64_t v15 = v22[5];
  if (v15)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke_2;
    v17[3] = &unk_1E58BBE28;
    v17[4] = self;
    [(HKQuantitySeriesSampleBuilder *)self _taskServer_insertQuantitySeries:v15 completion:v17];
  }

  _Block_object_dispose(&v21, 8);
  return 1;
}

void __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 64);
  if (!v2)
  {
    v3 = objc_alloc_init(HKCodableQuantitySeries);
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v3;

    v2 = *(void **)(a1[4] + 64);
  }
  [v2 addValues:a1[5]];
  v6 = [*(id *)(a1[4] + 64) values];
  unint64_t v7 = [v6 count];
  unint64_t v8 = *(void *)(a1[4] + 32);

  if (v7 >= v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 64));
    uint64_t v9 = a1[4];
    BOOL v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = 0;
  }
}

void __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEBUG)) {
      __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke_2_cold_1(a1);
    }
    [*(id *)(a1 + 32) _changeStateForFatalError:v5];
  }
  v6 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 96));
  unint64_t v7 = v6;
  if (v6) {
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, a2, v5);
  }
}

- (void)_finishSeriesWithMetadata:(id)a3 endDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__HKQuantitySeriesSampleBuilder__finishSeriesWithMetadata_endDate_completion___block_invoke;
  block[3] = &unk_1E58BBAA0;
  block[4] = self;
  void block[5] = &v18;
  dispatch_sync(queue, block);
  uint64_t v12 = v19[5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__HKQuantitySeriesSampleBuilder__finishSeriesWithMetadata_endDate_completion___block_invoke_2;
  v14[3] = &unk_1E58C06B0;
  uint64_t v16 = &v18;
  v14[4] = self;
  id v13 = v10;
  id v15 = v13;
  [(HKQuantitySeriesSampleBuilder *)self _taskServer_finishSeriesWithMetadata:v8 endDate:v9 finalSeries:v12 completion:v14];

  _Block_object_dispose(&v18, 8);
}

void __78__HKQuantitySeriesSampleBuilder__finishSeriesWithMetadata_endDate_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 64));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;
}

void __78__HKQuantitySeriesSampleBuilder__finishSeriesWithMetadata_endDate_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v6 = (void (**)(void *, BOOL, id))_Block_copy(*(const void **)(a1[4] + 96));
    if (v6) {
      v6[2](v6, v7 != 0, v5);
    }
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)_discardWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  id v7 = 0;
  BOOL v5 = [(HKQuantitySeriesSampleBuilder *)self _changeStateForDiscardWithError:&v7];
  id v6 = v7;
  if (v5)
  {
    [(HKQuantitySeriesSampleBuilder *)self _taskServer_discardWithCompletion:v4];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      -[HKQuantitySeriesSampleBuilder _discardWithCompletion:]((uint64_t)self);
    }
    ((void (**)(void, void, id))v4)[2](v4, 0, v6);
  }
}

- (BOOL)_validateQuantity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  quantityType = self->_quantityType;
  id v8 = [v6 _unit];
  BOOL v9 = [(HKQuantityType *)quantityType isCompatibleWithUnit:v8];

  if (!v9) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Quantity (%@) does not have a unit compatible with quantity series builder quantity type %@", v6, self->_quantityType);
  }

  return v9;
}

- (BOOL)_validateDateInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(HKHealthStore *)self->_healthStore applicationSDKVersionToken];
  if (HKProgramSDKTokenAtLeast())
  {
    id v7 = [v6 startDate];
    [v7 timeIntervalSinceReferenceDate];
    id v8 = [v6 endDate];
    [v8 timeIntervalSinceReferenceDate];

    if ([(HKSampleType *)self->_quantityType isMaximumDurationRestricted])
    {
      [v6 duration];
      double v10 = v9;
      [(HKSampleType *)self->_quantityType maximumAllowedDuration];
      if (v10 > v11)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"dateInterval (%@) exceeds the maximum allowed duration for sample type (%@)", v6, self->_quantityType, v26);
        goto LABEL_13;
      }
    }
    if ([(HKSampleType *)self->_quantityType isMaximumDurationRestricted])
    {
      uint64_t v12 = [v6 endDate];
      [v12 timeIntervalSinceReferenceDate];
      double v14 = v13;
      [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
      double v16 = v14 - v15;
      [(HKSampleType *)self->_quantityType maximumAllowedDuration];
      double v18 = v17;

      if (v16 > v18)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"startDate (%@) and dateInterval (%@) exceed the maximum allowed duration for sample type (%@)", self->_startDate, v6, self->_quantityType);
        goto LABEL_13;
      }
    }
    if ([(HKSampleType *)self->_quantityType isMinimumDurationRestricted])
    {
      [v6 duration];
      double v20 = v19;
      [(HKSampleType *)self->_quantityType minimumAllowedDuration];
      if (v20 < v21)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"dateInterval (%@) is below the minimum allowed duration for sample type (%@)", v6, self->_quantityType, v26);
        goto LABEL_13;
      }
    }
  }
  v22 = [v6 startDate];
  int v23 = objc_msgSend(v22, "hk_isBeforeDate:", self->_startDate);

  if (!v23)
  {
    BOOL v24 = 1;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Date interval (%@) is before builder's start date %@", v6, self->_startDate, v26);
LABEL_13:
  BOOL v24 = 0;
LABEL_15:

  return v24;
}

- (BOOL)_changeStateForInsertWithError:(id *)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x3032000000;
  double v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__12;
  double v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__HKQuantitySeriesSampleBuilder__changeStateForInsertWithError___block_invoke;
  v11[3] = &unk_1E58BDAC0;
  v11[4] = self;
  v11[5] = &v24;
  v11[6] = &v18;
  v11[7] = &v12;
  dispatch_sync(queue, v11);
  if (!*((unsigned char *)v25 + 24))
  {
    id v6 = (id)v19[5];
    id v7 = v6;
    if (v6)
    {
      if (a3) {
        *a3 = v6;
      }
      else {
        _HKLogDroppedError(v6);
      }
    }
  }
  id v8 = (void *)v13[5];
  if (v8) {
    [v8 raise];
  }
  char v9 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v9;
}

void *__64__HKQuantitySeriesSampleBuilder__changeStateForInsertWithError___block_invoke(void *a1)
{
  result = (void *)a1[4];
  switch(result[7])
  {
    case 0:
      result[7] = 1;
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      return result;
    case 1:
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      return result;
    case 2:
      uint64_t v3 = objc_msgSend(result, "_queue_clientErrorForFatalError");
      goto LABEL_7;
    case 3:
      uint64_t v3 = [(id)objc_opt_class() _clientErrorForFinishedSeries];
LABEL_7:
      uint64_t v4 = a1[6];
      goto LABEL_9;
    case 4:
      uint64_t v3 = [(id)objc_opt_class() _exceptionForPreviouslyDiscardedBuilder];
      uint64_t v4 = a1[7];
LABEL_9:
      *(void *)(*(void *)(v4 + 8) + 40) = v3;
      result = (void *)MEMORY[0x1F41817F8]();
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_changeStateForFinishWithError:(id *)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  id v23 = __Block_byref_object_dispose__12;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__12;
  id v17 = __Block_byref_object_dispose__12;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HKQuantitySeriesSampleBuilder__changeStateForFinishWithError___block_invoke;
  block[3] = &unk_1E58C06D8;
  block[4] = self;
  void block[5] = &v19;
  block[7] = &v13;
  block[8] = a2;
  void block[6] = &v25;
  dispatch_sync(queue, block);
  if (!*((unsigned char *)v26 + 24))
  {
    id v7 = (id)v20[5];
    id v8 = v7;
    if (v7)
    {
      if (a3) {
        *a3 = v7;
      }
      else {
        _HKLogDroppedError(v7);
      }
    }
  }
  char v9 = (void *)v14[5];
  if (v9) {
    [v9 raise];
  }
  char v10 = *((unsigned char *)v26 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v10;
}

void __64__HKQuantitySeriesSampleBuilder__changeStateForFinishWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  switch(v2[7])
  {
    case 0:
      uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[8], @"No quantities were added to quantity series sample builder."");
      uint64_t v4 = *(void *)(a1[5] + 8);
      BOOL v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      *(void *)(a1[4] + 56) = 3;
      return;
    case 1:
      v2[7] = 3;
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      return;
    case 2:
      uint64_t v6 = objc_msgSend(v2, "_queue_clientErrorForFatalError");
      goto LABEL_7;
    case 3:
      uint64_t v6 = [(id)objc_opt_class() _clientErrorForFinishedSeries];
LABEL_7:
      uint64_t v7 = a1[5];
      goto LABEL_9;
    case 4:
      uint64_t v6 = [(id)objc_opt_class() _exceptionForPreviouslyDiscardedBuilder];
      uint64_t v7 = a1[7];
LABEL_9:
      *(void *)(*(void *)(v7 + 8) + 40) = v6;
      MEMORY[0x1F41817F8]();
      break;
    default:
      return;
  }
}

- (BOOL)_changeStateForDiscardWithError:(id *)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__12;
  double v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__HKQuantitySeriesSampleBuilder__changeStateForDiscardWithError___block_invoke;
  v11[3] = &unk_1E58BDAC0;
  v11[4] = self;
  v11[5] = &v24;
  v11[6] = &v18;
  v11[7] = &v12;
  dispatch_sync(queue, v11);
  if (!*((unsigned char *)v25 + 24))
  {
    id v6 = (id)v19[5];
    uint64_t v7 = v6;
    if (v6)
    {
      if (a3) {
        *a3 = v6;
      }
      else {
        _HKLogDroppedError(v6);
      }
    }
  }
  id v8 = (void *)v13[5];
  if (v8) {
    [v8 raise];
  }
  char v9 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v9;
}

void *__65__HKQuantitySeriesSampleBuilder__changeStateForDiscardWithError___block_invoke(void *a1)
{
  result = (void *)a1[4];
  switch(result[7])
  {
    case 0:
    case 1:
      result[7] = 4;
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      return result;
    case 2:
      uint64_t v3 = objc_msgSend(result, "_queue_clientErrorForFatalError");
      goto LABEL_5;
    case 3:
      uint64_t v3 = [(id)objc_opt_class() _clientErrorForFinishedSeries];
LABEL_5:
      uint64_t v4 = a1[6];
      goto LABEL_7;
    case 4:
      uint64_t v3 = [(id)objc_opt_class() _exceptionForPreviouslyDiscardedBuilder];
      uint64_t v4 = a1[7];
LABEL_7:
      *(void *)(*(void *)(v4 + 8) + 40) = v3;
      result = (void *)MEMORY[0x1F41817F8]();
      break;
    default:
      return result;
  }
  return result;
}

- (void)_changeStateForFatalError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HKQuantitySeriesSampleBuilder__changeStateForFatalError___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __59__HKQuantitySeriesSampleBuilder__changeStateForFatalError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 56) == 1)
  {
    *(void *)(v1 + 56) = 2;
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = v3;
    if (!v3)
    {
      id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unknown internal fatal error");
    }
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v4);
    if (!v3)
    {
    }
  }
}

+ (id)_clientErrorForFinishedSeries
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = objc_opt_class();

  return (id)objc_msgSend(v3, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v4, a2, @"Quantity series sample builder already finished"");
}

+ (id)_exceptionForPreviouslyDiscardedBuilder
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3A8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromClass((Class)a1);
  id v6 = [v4 stringWithFormat:@"%@ already discarded.", v5];
  uint64_t v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  return v7;
}

- (id)_queue_clientErrorForFatalError
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  fatalError = self->_fatalError;

  return (id)objc_msgSend(v3, "hk_error:description:underlyingError:", 3, @"Quantity series sample builder experienced a fatal error", fatalError);
}

- (void)_taskServer_insertQuantitySeries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__HKQuantitySeriesSampleBuilder__taskServer_insertQuantitySeries_completion___block_invoke;
  v13[3] = &unk_1E58C0700;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HKQuantitySeriesSampleBuilder__taskServer_insertQuantitySeries_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __77__HKQuantitySeriesSampleBuilder__taskServer_insertQuantitySeries_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertQuantitySeries:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __77__HKQuantitySeriesSampleBuilder__taskServer_insertQuantitySeries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_taskServer_finishSeriesWithMetadata:(id)a3 endDate:(id)a4 finalSeries:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  proxyProvider = self->_proxyProvider;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __101__HKQuantitySeriesSampleBuilder__taskServer_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke;
  v21[3] = &unk_1E58C0728;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__HKQuantitySeriesSampleBuilder__taskServer_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_2;
  v19[3] = &unk_1E58BBD88;
  id v20 = v25;
  id v15 = v25;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v21 errorHandler:v19];
}

uint64_t __101__HKQuantitySeriesSampleBuilder__taskServer_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_finishSeriesWithMetadata:endDate:finalSeries:completion:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __101__HKQuantitySeriesSampleBuilder__taskServer_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_taskServer_discardWithCompletion:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HKQuantitySeriesSampleBuilder__taskServer_discardWithCompletion___block_invoke;
  v9[3] = &unk_1E58C0750;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HKQuantitySeriesSampleBuilder__taskServer_discardWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __67__HKQuantitySeriesSampleBuilder__taskServer_discardWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_discardWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __67__HKQuantitySeriesSampleBuilder__taskServer_discardWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)serverInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52490];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  [v2 setClasses:v3 forSelector:sel_remote_finishSeriesWithMetadata_endDate_finalSeries_completion_ argumentIndex:0 ofReply:0];

  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_finishSeriesWithMetadata_endDate_finalSeries_completion_, 0, 1);

  return v2;
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return +[HKQuantitySeriesSampleBuilder serverInterface];
}

- (int64_t)unitTest_state
{
  return self->_state;
}

- (void)unitTest_setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (id)unitTest_insertQuantityCompletion
{
  return self->_unitTest_insertQuantityCompletion;
}

- (void)setUnitTest_insertQuantityCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_insertQuantityCompletion, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_quantitySeries, 0);
  objc_storeStrong((id *)&self->_fatalError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_quantityType, 0);
}

void __40__HKQuantitySeriesSampleBuilder_discard__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_19C023000, v1, v2, "%{public}@: error discarding quantity sample series builder: %{public}@", (void)v3, DWORD2(v3));
}

void __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138543618;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_0_7();
  _os_log_debug_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: error inserting quantity: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_discardWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_19C023000, v1, v2, "%{public}@: cannot discard quantity sample series builder: %{public}@", (void)v3, DWORD2(v3));
}

@end