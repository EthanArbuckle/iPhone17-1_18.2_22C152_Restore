@interface HKHeartbeatSeriesBuilder
+ (NSUInteger)maximumCount;
- (HKHeartbeatSeriesBuilder)initWithHealthStore:(HKHealthStore *)healthStore device:(HKDevice *)device startDate:(NSDate *)startDate;
- (void)_resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate:(double)a3 precededByGap:(BOOL)a4 completion:(id)a5;
- (void)_resourceQueue_addMetadata:(id)a3 completion:(id)a4;
- (void)_resourceQueue_finishSeriesWithCompletion:(id)a3;
- (void)addHeartbeatWithTimeIntervalSinceSeriesStartDate:(NSTimeInterval)timeIntervalSinceStart precededByGap:(BOOL)precededByGap completion:(void *)completion;
- (void)addMetadata:(NSDictionary *)metadata completion:(void *)completion;
- (void)discard;
- (void)finishSeriesWithCompletion:(void *)completion;
@end

@implementation HKHeartbeatSeriesBuilder

- (HKHeartbeatSeriesBuilder)initWithHealthStore:(HKHealthStore *)healthStore device:(HKDevice *)device startDate:(NSDate *)startDate
{
  v8 = startDate;
  v9 = device;
  v10 = healthStore;
  v11 = [[HKSeriesBuilderConfiguration alloc] initWithDevice:v9 workoutBuilderID:0];

  v20.receiver = self;
  v20.super_class = (Class)HKHeartbeatSeriesBuilder;
  v12 = [(HKSeriesBuilder *)&v20 _initWithHealthStore:v10 identifier:0 configuration:v11];

  if (v12)
  {
    uint64_t v13 = [(NSDate *)v8 copy];
    v14 = v12->_startDate;
    v12->_startDate = (NSDate *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableMetadata = v12->_mutableMetadata;
    v12->_mutableMetadata = v15;

    v17 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    mutableHeartbeats = v12->_mutableHeartbeats;
    v12->_mutableHeartbeats = v17;

    v12->_count = 0;
    v12->_lastHeartbeatTimeInterval = -1.0;
    [(HKSeriesBuilder *)v12 setState:1];
  }

  return v12;
}

+ (NSUInteger)maximumCount
{
  return 1000;
}

- (void)addHeartbeatWithTimeIntervalSinceSeriesStartDate:(NSTimeInterval)timeIntervalSinceStart precededByGap:(BOOL)precededByGap completion:(void *)completion
{
  v8 = completion;
  v9 = [(HKSeriesBuilder *)self resourceQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__HKHeartbeatSeriesBuilder_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke;
  v11[3] = &unk_1E58BF548;
  NSTimeInterval v13 = timeIntervalSinceStart;
  BOOL v14 = precededByGap;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, v11);
}

uint64_t __102__HKHeartbeatSeriesBuilder_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate:precededByGap:completion:", *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)addMetadata:(NSDictionary *)metadata completion:(void *)completion
{
  v6 = metadata;
  v7 = completion;
  v8 = [(HKSeriesBuilder *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HKHeartbeatSeriesBuilder_addMetadata_completion___block_invoke;
  block[3] = &unk_1E58BBA78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __51__HKHeartbeatSeriesBuilder_addMetadata_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addMetadata:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)finishSeriesWithCompletion:(void *)completion
{
  v4 = completion;
  v5 = [(HKSeriesBuilder *)self resourceQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HKHeartbeatSeriesBuilder_finishSeriesWithCompletion___block_invoke;
  v7[3] = &unk_1E58BB978;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__HKHeartbeatSeriesBuilder_finishSeriesWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_finishSeriesWithCompletion:", *(void *)(a1 + 40));
}

- (void)_resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate:(double)a3 precededByGap:(BOOL)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = [(HKSeriesBuilder *)self resourceQueue];
  dispatch_assert_queue_V2(v10);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__HKHeartbeatSeriesBuilder__resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke;
  aBlock[3] = &unk_1E58BE3B0;
  aBlock[4] = self;
  id v20 = v9;
  v11 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  int64_t v12 = [(HKSeriesBuilder *)self state];
  if ((unint64_t)(v12 - 2) < 2 || !v12)
  {
    BOOL v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = objc_opt_class();
    v16 = @"Cannot add data to an inactive builder";
    goto LABEL_9;
  }
  if (v12 == 1)
  {
    unint64_t count = self->_count;
    if (count >= +[HKHeartbeatSeriesBuilder maximumCount])
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Cannot add more than %lu heartbeats per series", +[HKHeartbeatSeriesBuilder maximumCount](HKHeartbeatSeriesBuilder, "maximumCount""));
      goto LABEL_10;
    }
    if (a3 >= 0.0 && self->_lastHeartbeatTimeInterval < a3)
    {
      HKHeartbeatSeriesAppendDatum(*(uint64_t *)&a3, a4, self->_mutableHeartbeats);
      ++self->_count;
      self->_lastHeartbeatTimeInterval = a3;
      v11[2](v11, 1, 0);
      goto LABEL_11;
    }
    BOOL v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = objc_opt_class();
    v16 = @"Heartbeats must be added in order and should have a time interval since the series start date greater than or equal to 0";
LABEL_9:
    objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v15, a2, v16, v18);
    v17 = LABEL_10:;
    ((void (**)(void *, uint64_t, void *))v11)[2](v11, 0, v17);
  }
LABEL_11:
}

void __117__HKHeartbeatSeriesBuilder__resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) completionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__HKHeartbeatSeriesBuilder__resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke_2;
    block[3] = &unk_1E58BBA28;
    id v9 = *(id *)(a1 + 40);
    char v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __117__HKHeartbeatSeriesBuilder__resourceQueue_addHeartbeatWithTimeIntervalSinceSeriesStartDate_precededByGap_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_resourceQueue_addMetadata:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HKSeriesBuilder *)self resourceQueue];
  dispatch_assert_queue_V2(v9);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__HKHeartbeatSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke;
  aBlock[3] = &unk_1E58BE3B0;
  aBlock[4] = self;
  id v16 = v8;
  char v10 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  int64_t v11 = [(HKSeriesBuilder *)self state];
  if ((unint64_t)(v11 - 2) < 2 || !v11)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Cannot add metadata to an inactive builder"");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v11 == 1)
  {
    id v14 = 0;
    char v12 = objc_msgSend(v7, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", 1, 851968, &v14);
    id v13 = v14;
    if (v12)
    {
      [(NSMutableDictionary *)self->_mutableMetadata addEntriesFromDictionary:v7];
      v10[2](v10, 1, 0);
LABEL_8:

      goto LABEL_9;
    }
LABEL_7:
    ((void (**)(void *, uint64_t, id))v10)[2](v10, 0, v13);
    goto LABEL_8;
  }
LABEL_9:
}

void __66__HKHeartbeatSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) completionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__HKHeartbeatSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_2;
    block[3] = &unk_1E58BBA28;
    id v9 = *(id *)(a1 + 40);
    char v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __66__HKHeartbeatSeriesBuilder__resourceQueue_addMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_resourceQueue_finishSeriesWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [(HKSeriesBuilder *)self resourceQueue];
  dispatch_assert_queue_V2(v6);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58BF570;
  aBlock[4] = self;
  id v25 = v5;
  id v7 = _Block_copy(aBlock);
  int64_t v8 = [(HKSeriesBuilder *)self state];
  if ((unint64_t)(v8 - 2) < 2 || !v8)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = objc_opt_class();
    id v20 = @"Cannot finish an inactive builder";
    goto LABEL_7;
  }
  if (v8 == 1)
  {
    [(HKSeriesBuilder *)self setState:2];
    if (self->_count)
    {
      id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:self->_startDate sinceDate:self->_lastHeartbeatTimeInterval];
      char v10 = (void *)[(NSMutableData *)self->_mutableHeartbeats copy];
      startDate = self->_startDate;
      char v12 = [(HKSeriesBuilder *)self configuration];
      id v13 = [v12 device];
      id v14 = (void *)[(NSMutableDictionary *)self->_mutableMetadata copy];
      uint64_t v15 = +[HKHeartbeatSeriesSample _heartbeatSeriesSampleWithData:v10 startDate:startDate endDate:v9 device:v13 metadata:v14];

      id v16 = [(HKSeriesBuilder *)self store];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_3;
      v21[3] = &unk_1E58BF5C0;
      v21[4] = self;
      id v22 = v15;
      id v23 = v7;
      id v17 = v15;
      [v16 saveObject:v17 withCompletion:v21];

LABEL_8:
      goto LABEL_9;
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = objc_opt_class();
    id v20 = @"No data was added to this builder";
LABEL_7:
    id v9 = objc_msgSend(v18, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v19, a2, v20);
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v9);
    goto LABEL_8;
  }
LABEL_9:
}

void __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) completionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_2;
    block[3] = &unk_1E58BB9A0;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_3(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1[4] completionQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_4;
  v8[3] = &unk_1E58BF598;
  char v12 = a2;
  id v11 = a1[6];
  id v9 = v5;
  id v10 = a1[5];
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __70__HKHeartbeatSeriesBuilder__resourceQueue_finishSeriesWithCompletion___block_invoke_4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, *(void *)(a1 + 32));
}

- (void)discard
{
  uint64_t v3 = [(HKSeriesBuilder *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HKHeartbeatSeriesBuilder_discard__block_invoke;
  block[3] = &unk_1E58BBA00;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __35__HKHeartbeatSeriesBuilder_discard__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:3];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableHeartbeats, 0);
  objc_storeStrong((id *)&self->_mutableMetadata, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end