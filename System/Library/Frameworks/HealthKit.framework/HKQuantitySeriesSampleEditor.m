@interface HKQuantitySeriesSampleEditor
+ (id)serverInterface;
- (BOOL)_performWithError:(id *)a3 stateValidator:(id)a4 lockedBlock:(id)a5;
- (BOOL)removeQuantityForDateInterval:(id)a3 error:(id *)a4;
- (HKQuantitySample)quantitySample;
- (HKQuantitySeriesSampleEditor)initWithHealthStore:(id)a3 quantitySample:(id)a4;
- (NSString)description;
- (id)exportedInterface;
- (id)remoteInterface;
- (int64_t)unitTest_state;
- (void)commitWithCompletion:(id)a3;
- (void)dealloc;
- (void)discard;
@end

@implementation HKQuantitySeriesSampleEditor

- (HKQuantitySeriesSampleEditor)initWithHealthStore:(id)a3 quantitySample:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HKQuantitySeriesSampleEditor;
  v9 = [(HKQuantitySeriesSampleEditor *)&v22 init];
  if (v9)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v11 = (void *)MEMORY[0x1E4F1C3C8];
    if ((isKindOfClass & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*v11, @"A valid %@ object is required.", objc_opt_class() format];
    }
    if ([v8 count] <= 1) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v11, @"A quantity sample with count = %ld is invalid. A count greater than 1 is required.", objc_msgSend(v8, "count"));
    }
    uint64_t v12 = [v8 copy];
    quantitySample = v9->_quantitySample;
    v9->_quantitySample = (HKQuantitySample *)v12;

    objc_storeStrong((id *)&v9->_healthStore, a3);
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v14;

    v16 = [[HKQuantitySeriesSampleEditorTaskServerConfiguration alloc] initWithQuantitySample:v9->_quantitySample];
    v17 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v9->_healthStore taskIdentifier:@"HKQuantitySeriesSampleEditorTaskServerIdentifier" exportedObject:v9 taskUUID:v9->_identifier];
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = v17;

    [(HKProxyProvider *)v9->_proxyProvider setShouldRetryOnInterruption:0];
    [(HKTaskServerProxyProvider *)v9->_proxyProvider setTaskConfiguration:v16];
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_state = 0;
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    datesIntervalsToRemove = v9->_datesIntervalsToRemove;
    v9->_datesIntervalsToRemove = v19;
  }
  return v9;
}

- (void)dealloc
{
  if (self->_state == 1)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"HKQuantitySeriesSampleEditor.m", 84, @"Editor %@ must be committed or discarded prior to deallocation", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)HKQuantitySeriesSampleEditor;
  [(HKQuantitySeriesSampleEditor *)&v5 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = self->_state - 1;
  if (v5 > 3) {
    v6 = @"Not Started";
  }
  else {
    v6 = off_1E58C5C60[v5];
  }
  return (NSString *)[v3 stringWithFormat:@"<%@:%p %@ %@>", v4, self, self->_identifier, v6];
}

- (BOOL)removeQuantityForDateInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HKQuantitySeriesSampleEditor_removeQuantityForDateInterval_error___block_invoke_2;
  v9[3] = &unk_1E58BBBD0;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [(HKQuantitySeriesSampleEditor *)self _performWithError:a4 stateValidator:&__block_literal_global_91 lockedBlock:v9];

  return (char)a4;
}

BOOL __68__HKQuantitySeriesSampleEditor_removeQuantityForDateInterval_error___block_invoke(uint64_t a1, unint64_t a2)
{
  return a2 < 2;
}

uint64_t __68__HKQuantitySeriesSampleEditor_removeQuantityForDateInterval_error___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  *(void *)(*(void *)(a1 + 32) + 40) = 1;
  return result;
}

- (void)commitWithCompletion:(id)a3
{
  id v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__39;
  v16[4] = __Block_byref_object_dispose__39;
  id v17 = 0;
  unint64_t v5 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v4];

  id v15 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_2;
  v14[3] = &unk_1E58BBAA0;
  v14[4] = self;
  v14[5] = v16;
  BOOL v6 = [(HKQuantitySeriesSampleEditor *)self _performWithError:&v15 stateValidator:&__block_literal_global_35_0 lockedBlock:v14];
  id v7 = v15;
  if (v6)
  {
    proxyProvider = self->_proxyProvider;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_3;
    v11[3] = &unk_1E58C5C40;
    v13 = v16;
    uint64_t v12 = v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_4;
    v9[3] = &unk_1E58BBD88;
    id v10 = v12;
    [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
  }
  else
  {
    ((void (**)(void, void, id))v5)[2](v5, 0, v7);
  }

  _Block_object_dispose(v16, 8);
}

BOOL __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 1;
}

void __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1 + 32) + 40) = 2;
}

uint64_t __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_commitRemovedDatums:completion:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(a1 + 32));
}

uint64_t __53__HKQuantitySeriesSampleEditor_commitWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)discard
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "%{public}@: error performing discard: %{public}@", (uint8_t *)&v3, 0x16u);
}

BOOL __39__HKQuantitySeriesSampleEditor_discard__block_invoke(uint64_t a1, unint64_t a2)
{
  return a2 < 2;
}

uint64_t __39__HKQuantitySeriesSampleEditor_discard__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  *(void *)(*(void *)(a1 + 32) + 40) = 3;
  return result;
}

- (int64_t)unitTest_state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (BOOL)_performWithError:(id *)a3 stateValidator:(id)a4 lockedBlock:(id)a5
{
  id v8 = (void (**)(void))a5;
  v9 = (uint64_t (**)(id, unint64_t))a4;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  char v11 = v9[2](v9, state);

  if (v11)
  {
    v8[2](v8);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    if (state - 1 > 3) {
      uint64_t v12 = @"Not Started";
    }
    else {
      uint64_t v12 = off_1E58C5C60[state - 1];
    }
    v13 = [NSString stringWithFormat:@"Invalid state \"%@\"", v12];
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 3, v13);
    if (state == 3)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v13 userInfo:0];
    }
    else
    {
      uint64_t v14 = 0;
      if (state <= 1) {
        self->_unint64_t state = 4;
      }
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v14)
    {
      [v14 raise];
    }
  }

  return v11;
}

+ (id)serverInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53570];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_commitRemovedDatums_completion_, 0, 0);

  return v2;
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return +[HKQuantitySeriesSampleEditor serverInterface];
}

- (HKQuantitySample)quantitySample
{
  return (HKQuantitySample *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantitySample, 0);
  objc_storeStrong((id *)&self->_datesIntervalsToRemove, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end