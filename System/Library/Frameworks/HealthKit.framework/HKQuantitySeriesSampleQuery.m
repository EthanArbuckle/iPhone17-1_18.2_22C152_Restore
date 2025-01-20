@interface HKQuantitySeriesSampleQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
- (BOOL)includeSample;
- (BOOL)orderByQuantitySampleStartDate;
- (HKQuantitySeriesSampleQuery)initWithQuantityType:(HKQuantityType *)quantityType predicate:(NSPredicate *)predicate quantityHandler:(void *)quantityHandler;
- (HKQuantitySeriesSampleQuery)initWithQuantityType:(id)a3 predicate:(id)a4 quantityBatchHandler:(id)a5;
- (HKQuantitySeriesSampleQuery)initWithSample:(HKQuantitySample *)quantitySample quantityHandler:(void *)quantityHandler;
- (NSDictionary)unitTest_cachedQuantitySamplesByUUID;
- (id)_quantitySampleForEnumerationResult:(id)a3 UUID:(id)a4;
- (id)quantityHandlerWithSample;
- (id)quantityHandlerWithoutSample;
- (void)client_deliverEnumerationResults:(id)a3 isFinal:(BOOL)a4 query:(id)a5;
- (void)client_deliverQuantitySeries:(id)a3 seriesAnchor:(int64_t)a4 isFinal:(BOOL)a5 query:(id)a6;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)setIncludeSample:(BOOL)includeSample;
- (void)setOrderByQuantitySampleStartDate:(BOOL)orderByQuantitySampleStartDate;
@end

@implementation HKQuantitySeriesSampleQuery

- (HKQuantitySeriesSampleQuery)initWithSample:(HKQuantitySample *)quantitySample quantityHandler:(void *)quantityHandler
{
  v7 = quantitySample;
  v8 = quantityHandler;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "quantitySample");
    if (v9) {
      goto LABEL_3;
    }
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "quantityHandler");
LABEL_3:
  v10 = [(HKQuantitySample *)v7 quantityType];
  v16.receiver = self;
  v16.super_class = (Class)HKQuantitySeriesSampleQuery;
  v11 = [(HKQuery *)&v16 _initWithObjectType:v10 predicate:0];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_sample, quantitySample);
    v11->_anchor = 0;
    [(HKSample *)v11->_sample _startTimestamp];
    v11->_startTime = v12;
    uint64_t v13 = [v9 copy];
    id seriesHandler = v11->_seriesHandler;
    v11->_id seriesHandler = (id)v13;
  }
  return v11;
}

- (HKQuantitySeriesSampleQuery)initWithQuantityType:(HKQuantityType *)quantityType predicate:(NSPredicate *)predicate quantityHandler:(void *)quantityHandler
{
  v8 = quantityType;
  v9 = predicate;
  v10 = quantityHandler;
  v11 = v10;
  if (v8)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "quantityType");
    if (v11) {
      goto LABEL_3;
    }
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "quantityHandler");
LABEL_3:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__HKQuantitySeriesSampleQuery_initWithQuantityType_predicate_quantityHandler___block_invoke;
  v17[3] = &unk_1E58C2198;
  id v12 = v11;
  id v18 = v12;
  uint64_t v13 = [(HKQuantitySeriesSampleQuery *)self initWithQuantityType:v8 predicate:v9 quantityBatchHandler:v17];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    id v15 = v13->_quantityHandler;
    v13->_quantityHandler = (id)v14;
  }
  return v13;
}

void __78__HKQuantitySeriesSampleQuery_initWithQuantityType_predicate_quantityHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, double a5, double a6, uint64_t a7, uint64_t a8, void *a9)
{
  id v22 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  if (v15)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a5];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a6];
    v21 = (void *)[v18 initWithStartDate:v19 endDate:v20];
  }
  else
  {
    v21 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKQuantitySeriesSampleQuery)initWithQuantityType:(id)a3 predicate:(id)a4 quantityBatchHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "quantityType");
    if (v11) {
      goto LABEL_3;
    }
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "quantityBatchHandler");
LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)HKQuantitySeriesSampleQuery;
  id v12 = [(HKQuery *)&v16 _initWithObjectType:v8 predicate:v9];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    id quantityBatchHandler = v12->_quantityBatchHandler;
    v12->_id quantityBatchHandler = (id)v13;
  }
  return v12;
}

- (id)quantityHandlerWithoutSample
{
  v2 = _Block_copy(self->_seriesHandler);

  return v2;
}

- (id)quantityHandlerWithSample
{
  v2 = _Block_copy(self->_quantityHandler);

  return v2;
}

- (void)setIncludeSample:(BOOL)includeSample
{
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v5 = [(HKQuery *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HKQuantitySeriesSampleQuery_setIncludeSample___block_invoke;
  v6[3] = &unk_1E58BDA20;
  v6[4] = self;
  BOOL v7 = includeSample;
  dispatch_sync(v5, v6);
}

uint64_t __48__HKQuantitySeriesSampleQuery_setIncludeSample___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 240) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setOrderByQuantitySampleStartDate:(BOOL)orderByQuantitySampleStartDate
{
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v5 = [(HKQuery *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HKQuantitySeriesSampleQuery_setOrderByQuantitySampleStartDate___block_invoke;
  v6[3] = &unk_1E58BDA20;
  v6[4] = self;
  BOOL v7 = orderByQuantitySampleStartDate;
  dispatch_sync(v5, v6);
}

uint64_t __65__HKQuantitySeriesSampleQuery_setOrderByQuantitySampleStartDate___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 241) = *(unsigned char *)(result + 40);
  return result;
}

- (void)client_deliverQuantitySeries:(id)a3 seriesAnchor:(int64_t)a4 isFinal:(BOOL)a5 query:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__HKQuantitySeriesSampleQuery_client_deliverQuantitySeries_seriesAnchor_isFinal_query___block_invoke;
  block[3] = &unk_1E58C21E8;
  block[4] = self;
  id v16 = v11;
  BOOL v19 = a5;
  id v17 = v10;
  int64_t v18 = a4;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(v12, block);
}

void __87__HKQuantitySeriesSampleQuery_client_deliverQuantitySeries_seriesAnchor_isFinal_query___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 > *(void *)(v3 + 168))
  {
    *(void *)(v3 + 168) = v2;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__19;
  int64_t v18 = __Block_byref_object_dispose__19;
  id v19 = _Block_copy(*(const void **)(v3 + 152));
  if (v15[5])
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __87__HKQuantitySeriesSampleQuery_client_deliverQuantitySeries_seriesAnchor_isFinal_query___block_invoke_15;
    v9[3] = &unk_1E58C21C0;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    id v12 = &v14;
    char v13 = *(unsigned char *)(a1 + 64);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, v6, v9);
  }
  _Block_object_dispose(&v14, 8);
}

void __87__HKQuantitySeriesSampleQuery_client_deliverQuantitySeries_seriesAnchor_isFinal_query___block_invoke_15(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) values];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) deactivateCallCount];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [*(id *)(a1 + 32) values];
    uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v25 = 0;
      uint64_t v7 = *(void *)v27;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        if ([*(id *)(a1 + 40) deactivateCallCount] > v4) {
          break;
        }
        id v10 = (void *)MEMORY[0x19F395970]();
        uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 160) quantity];
        id v12 = [v11 _unit];
        [v9 value];
        char v13 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v12);

        if ([v9 hasDuration])
        {
          [v9 timeInterval];
          double v15 = v14;
        }
        else
        {
          double v15 = *(double *)(*(void *)(a1 + 40) + 176);
        }
        int v16 = [v9 hasDuration];
        [v9 timeInterval];
        double v18 = v17;
        if (v16)
        {
          [v9 duration];
          double v18 = v18 + v19;
        }
        [*(id *)(a1 + 40) applicationSDKVersionToken];
        if (HKProgramSDKTokenAtLeast()) {
          double v20 = v15;
        }
        else {
          double v20 = v18;
        }
        v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v20];
        *(double *)(*(void *)(a1 + 40) + 176) = v18;
        if (*(unsigned char *)(a1 + 56))
        {
          id v22 = [*(id *)(a1 + 32) values];
          [v22 count];
        }
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();

        if (v6 == ++v8)
        {
          uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
          v25 += v8;
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    v23 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16);
    v23();
  }
}

- (void)client_deliverEnumerationResults:(id)a3 isFinal:(BOOL)a4 query:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HKQuery *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__HKQuantitySeriesSampleQuery_client_deliverEnumerationResults_isFinal_query___block_invoke;
  v13[3] = &unk_1E58BD7D8;
  id v14 = v8;
  double v15 = self;
  id v16 = v9;
  BOOL v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __78__HKQuantitySeriesSampleQuery_client_deliverEnumerationResults_isFinal_query___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) results];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) results];
    uint64_t v5 = [v4 lastObject];
    [v5 startTime];
    double v7 = v6;

    uint64_t v8 = *(void *)(a1 + 40);
    if (!*(unsigned char *)(v8 + 208) || v7 > *(double *)(v8 + 216))
    {
      *(double *)(v8 + 216) = v7;
      uint64_t v8 = *(void *)(a1 + 40);
    }
    *(unsigned char *)(v8 + 208) = 1;
    id v9 = [*(id *)(a1 + 32) results];
    id v10 = [v9 lastObject];
    uint64_t v11 = [v10 uuid];
    uint64_t v12 = *(void *)(a1 + 40);
    char v13 = *(void **)(v12 + 224);
    *(void *)(v12 + 224) = v11;

    id v14 = (void *)MEMORY[0x1E4F1C9C8];
    [*(id *)(a1 + 32) latestSampleStartTime];
    uint64_t v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v16 = *(void *)(a1 + 40);
    BOOL v17 = *(void **)(v16 + 232);
    *(void *)(v16 + 232) = v15;
  }
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__19;
  v32 = __Block_byref_object_dispose__19;
  id v33 = _Block_copy(*(const void **)(*(void *)(a1 + 40) + 192));
  if (v29[5])
  {
    double v18 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(unsigned __int8 *)(a1 + 56);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __78__HKQuantitySeriesSampleQuery_client_deliverEnumerationResults_isFinal_query___block_invoke_2;
    v23[3] = &unk_1E58C21C0;
    id v21 = *(id *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    id v24 = v21;
    uint64_t v25 = v22;
    long long v26 = &v28;
    char v27 = *(unsigned char *)(a1 + 56);
    objc_msgSend(v18, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v19, v20, v23);
  }
  _Block_object_dispose(&v28, 8);
}

void __78__HKQuantitySeriesSampleQuery_client_deliverEnumerationResults_isFinal_query___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) results];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v28 = [*(id *)(a1 + 40) deactivateCallCount];
    double v6 = [*(id *)(a1 + 40) objectType];
    long long v29 = [v6 canonicalUnit];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [*(id *)(a1 + 32) results];
    uint64_t v27 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v31;
LABEL_4:
      uint64_t v7 = 0;
      uint64_t v8 = v3 - 1;
      while (1)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * v7);
        if ([*(id *)(a1 + 40) deactivateCallCount] > v28) {
          break;
        }
        id v10 = (void *)MEMORY[0x19F395970]();
        [v9 value];
        uint64_t v11 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v29);
        uint64_t v12 = (void *)MEMORY[0x1E4F29128];
        char v13 = [v9 uuid];
        id v14 = objc_msgSend(v12, "hk_UUIDWithData:", v13);

        uint64_t v15 = [*(id *)(a1 + 40) _quantitySampleForEnumerationResult:v9 UUID:v14];
        uint64_t v16 = *(void *)(a1 + 40);
        uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        [v9 startTime];
        double v19 = v18;
        [v9 endTime];
        v21.n128_u64[0] = v20;
        if (*(unsigned char *)(a1 + 56)) {
          BOOL v22 = v8 == 0;
        }
        else {
          BOOL v22 = 0;
        }
        uint64_t v23 = v22;
        (*(void (**)(uint64_t, uint64_t, void *, void *, uint64_t, uint64_t, void, double, __n128))(v17 + 16))(v17, v16, v11, v15, v8, v23, 0, v19, v21);

        ++v7;
        --v8;
        if (v27 == v7)
        {
          uint64_t v3 = v8 + 1;
          uint64_t v27 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v27) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v24 = *(void (**)(__n128, __n128))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16);
    v4.n128_u64[0] = 0;
    v5.n128_u64[0] = 0;
    v24(v4, v5);
  }
}

- (id)_quantitySampleForEnumerationResult:(id)a3 UUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_includeSample)
  {
    if ([v6 hasQuantitySample])
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      id v10 = [v6 quantitySample];
      uint64_t v11 = [v8 unarchivedObjectOfClass:v9 fromData:v10 error:0];

      if (!self->_receivedSamplesByUUID)
      {
        uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        receivedSamplesByUUID = self->_receivedSamplesByUUID;
        self->_receivedSamplesByUUID = v12;
      }
      if ([v11 count] >= 2)
      {
        uint64_t v14 = [v6 seriesIndex] + 1;
        if (v14 < [v6 count]) {
          [(NSMutableDictionary *)self->_receivedSamplesByUUID setObject:v11 forKeyedSubscript:v7];
        }
      }
    }
    else
    {
      uint64_t v11 = [(NSMutableDictionary *)self->_receivedSamplesByUUID objectForKeyedSubscript:v7];
      uint64_t v15 = [v6 seriesIndex] + 1;
      if (v15 >= [v6 count]) {
        [(NSMutableDictionary *)self->_receivedSamplesByUUID removeObjectForKey:v7];
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED05828;
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKQuantitySeriesSampleQuery;
  [(HKQuery *)&v8 queue_populateConfiguration:v4];
  [v4 setQuantitySample:self->_sample];
  [v4 setSeriesAnchor:self->_anchor];
  [v4 setMode:self->_seriesHandler == 0];
  if (self->_orderByQuantitySampleStartDate) {
    uint64_t includeSample = self->_includeSample | 2;
  }
  else {
    uint64_t includeSample = self->_includeSample;
  }
  [v4 setOptions:includeSample];
  if (self->_hasMaximumReceivedStartTime)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_maximumReceivedStartTime];
    [v4 setMaximumStartDate:v6];
  }
  else
  {
    [v4 setMaximumStartDate:0];
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", self->_latestReceivedUUIDData);
  [v4 setLatestUUID:v7];

  [v4 setLatestSampleStartDate:self->_latestSampleStartDate];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  __n128 v5 = _Block_copy(self->_seriesHandler);
  id v6 = _Block_copy(self->_quantityBatchHandler);
  id v7 = v6;
  if (v5)
  {
    objc_super v8 = [(HKQuery *)self clientQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__HKQuantitySeriesSampleQuery_queue_deliverError___block_invoke;
    v15[3] = &unk_1E58BB9A0;
    uint64_t v9 = &v17;
    id v17 = v5;
    v15[4] = self;
    id v10 = &v16;
    id v16 = v4;
    uint64_t v11 = v15;
LABEL_5:
    dispatch_async(v8, v11);

    goto LABEL_6;
  }
  if (v6)
  {
    objc_super v8 = [(HKQuery *)self clientQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__HKQuantitySeriesSampleQuery_queue_deliverError___block_invoke_2;
    v12[3] = &unk_1E58BB9A0;
    uint64_t v9 = &v14;
    id v14 = v7;
    v12[4] = self;
    id v10 = &v13;
    id v13 = v4;
    uint64_t v11 = v12;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __50__HKQuantitySeriesSampleQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, 1, a1[5]);
}

uint64_t __50__HKQuantitySeriesSampleQuery_queue_deliverError___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, uint64_t, void, double, double))(a1[6] + 16))(a1[6], a1[4], 0, 0, 0, 1, a1[5], 0.0, 0.0);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKQuantitySeriesSampleQuery;
  [(HKQuery *)&v6 queue_queryDidDeactivate:a3];
  id seriesHandler = self->_seriesHandler;
  self->_id seriesHandler = 0;

  id quantityBatchHandler = self->_quantityBatchHandler;
  self->_id quantityBatchHandler = 0;
}

- (NSDictionary)unitTest_cachedQuantitySamplesByUUID
{
  return (NSDictionary *)self->_receivedSamplesByUUID;
}

- (BOOL)includeSample
{
  return self->_includeSample;
}

- (BOOL)orderByQuantitySampleStartDate
{
  return self->_orderByQuantitySampleStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSampleStartDate, 0);
  objc_storeStrong((id *)&self->_latestReceivedUUIDData, 0);
  objc_storeStrong((id *)&self->_receivedSamplesByUUID, 0);
  objc_storeStrong(&self->_quantityBatchHandler, 0);
  objc_storeStrong(&self->_quantityHandler, 0);
  objc_storeStrong((id *)&self->_sample, 0);

  objc_storeStrong(&self->_seriesHandler, 0);
}

@end