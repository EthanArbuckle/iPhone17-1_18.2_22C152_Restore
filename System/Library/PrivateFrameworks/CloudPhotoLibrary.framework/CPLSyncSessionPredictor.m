@interface CPLSyncSessionPredictor
- (CPLSyncSessionPrediction)currentPrediction;
- (CPLSyncSessionPredictor)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)description;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)updatePredictedValue:(id)a3 forType:(id)a4;
- (void)updatePredictionWithValuesAndTypes:(id)a3;
- (void)updatePredictionsWithDerivativesStatistics:(id)a3;
@end

@implementation CPLSyncSessionPredictor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_currentPrediction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(CPLSyncSessionPredictor *)self currentPrediction];
  v6 = (void *)[v3 initWithFormat:@"<%@ current: %@>", v4, v5];

  return v6;
}

- (void)updatePredictedValue:(id)a3 forType:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v11[0] = a3;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(CPLSyncSessionPredictor *)self updatePredictionWithValuesAndTypes:v9];
}

- (void)updatePredictionWithValuesAndTypes:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__344;
  v22 = __Block_byref_object_dispose__345;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__344;
  v16[4] = __Block_byref_object_dispose__345;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v10 = __62__CPLSyncSessionPredictor_updatePredictionWithValuesAndTypes___block_invoke;
  v11 = &unk_1E60AB7C8;
  v14 = v16;
  v12 = self;
  id v5 = v4;
  id v13 = v5;
  v15 = &v18;
  v6 = v9;
  os_unfair_lock_lock(&self->_lock);
  v10(v6);
  os_unfair_lock_unlock(&self->_lock);

  id v7 = (void *)v19[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CPLSyncSessionPredictor_updatePredictionWithValuesAndTypes___block_invoke_46;
  v8[3] = &unk_1E60A6D40;
  v8[4] = self;
  v8[5] = v16;
  [v7 enumerateObjectsUsingBlock:v8];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
}

void __62__CPLSyncSessionPredictor_updatePredictionWithValuesAndTypes___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 24) updatedPredictionWithValuesAndTypes:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1[4] + 16) allObjects];
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    objc_storeStrong((id *)(a1[4] + 24), *(id *)(*(void *)(a1[6] + 8) + 40));
    if (!_CPLSilentLogging)
    {
      if (__CPLPredictorOSLogDomain_onceToken != -1) {
        dispatch_once(&__CPLPredictorOSLogDomain_onceToken, &__block_literal_global_368);
      }
      id v8 = (void *)__CPLPredictorOSLogDomain_result;
      if (os_log_type_enabled((os_log_t)__CPLPredictorOSLogDomain_result, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = *(void *)(a1[4] + 32);
        uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40);
        v11 = *(void **)(*(void *)(a1[7] + 8) + 40);
        v12 = v8;
        int v13 = 138543874;
        uint64_t v14 = v9;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        __int16 v17 = 2048;
        uint64_t v18 = [v11 count];
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "Updated predictions for %{public}@: %@ - informing %lu observers", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

uint64_t __62__CPLSyncSessionPredictor_updatePredictionWithValuesAndTypes___block_invoke_46(uint64_t a1, void *a2)
{
  return [a2 predictor:*(void *)(a1 + 32) changedPrediction:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  uint64_t v9 = __42__CPLSyncSessionPredictor_removeObserver___block_invoke;
  uint64_t v10 = &unk_1E60A6728;
  v11 = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = v8;
  os_unfair_lock_lock(p_lock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __42__CPLSyncSessionPredictor_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  uint64_t v9 = __39__CPLSyncSessionPredictor_addObserver___block_invoke;
  uint64_t v10 = &unk_1E60A6728;
  v11 = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = v8;
  os_unfair_lock_lock(p_lock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __39__CPLSyncSessionPredictor_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (CPLSyncSessionPrediction)currentPrediction
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__344;
  __int16 v15 = __Block_byref_object_dispose__345;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v7 = __44__CPLSyncSessionPredictor_currentPrediction__block_invoke;
  id v8 = &unk_1E60A5CE8;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  uint64_t v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CPLSyncSessionPrediction *)v4;
}

void __44__CPLSyncSessionPredictor_currentPrediction__block_invoke(uint64_t a1)
{
}

- (CPLSyncSessionPredictor)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPLSyncSessionPredictor;
  uint64_t v5 = [(CPLSyncSessionPredictor *)&v14 init];
  id v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    id v7 = objc_alloc_init(CPLSyncSessionPrediction);
    currentPrediction = v6->_currentPrediction;
    v6->_currentPrediction = v7;

    uint64_t v9 = [v4 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v11;
  }
  return v6;
}

- (void)updatePredictionsWithDerivativesStatistics:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v24 = self;
    unint64_t v5 = +[CPLResource largeResourceSizeThreshold];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v27;
      double v12 = 0.0;
      double v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v6);
          }
          __int16 v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v15 generationDuration];
          if (v16 > 1.0)
          {
            double v17 = v16;
            uint64_t v18 = [v15 sourceResource];
            uint64_t v19 = [v18 identity];
            unint64_t v20 = [v19 fileSize];

            if (v20 <= v5)
            {
              if (v20 != 0 && v17 > v13)
              {
                unint64_t v10 = v20;
                double v13 = v17;
              }
            }
            else if (v17 > v12)
            {
              unint64_t v9 = v20;
              double v12 = v17;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
      unint64_t v10 = 0;
      double v12 = 0.0;
      double v13 = 0.0;
    }

    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    if (v10)
    {
      v22 = [NSNumber numberWithDouble:(double)v10 / v13];
      [v21 setObject:v22 forKeyedSubscript:@"derivativesSpeed"];
    }
    if (v9)
    {
      id v23 = [NSNumber numberWithDouble:(double)v9 / v12];
      [v21 setObject:v23 forKeyedSubscript:@"largeDerivativesSpeed"];
    }
    if ([v21 count]) {
      [(CPLSyncSessionPredictor *)v24 updatePredictionWithValuesAndTypes:v21];
    }

    id v4 = v25;
  }
}

@end