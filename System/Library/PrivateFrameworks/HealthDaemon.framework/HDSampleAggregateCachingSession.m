@interface HDSampleAggregateCachingSession
- (BOOL)activateWithError:(id *)a3 cacheHandler:(id)a4;
- (HDAssertion)accessibilityAssertion;
- (HDSampleAggregateCachingSession)initWithProfile:(id)a3 cachingIdentifier:(id)a4 sourceEntity:(id)a5 queryDescriptor:(id)a6 cachedClass:(Class)a7 queryInterval:(id)a8 anchorDate:(id)a9 intervalComponents:(id)a10 timeIntervalToBucketIndex:(id)a11;
- (NSArray)invalidationQueryDescriptors;
- (id).cxx_construct;
- (id)persistentAnchorDateWithError:(id *)a3;
- (int64_t)cachesExistWithError:(id *)a3;
- (uint64_t)_performWithAccessibilityAssertion:(uint64_t)a3 requiresWrite:(uint64_t)a4 error:(void *)a5 block:;
- (void)_changeStateForFatalError:(uint64_t)a1;
- (void)_writeToDatabaseOnCachePersistenceQueueWithBlock:(void *)a3 completion:;
- (void)deleteCachesForIntervals:(id)a3 completion:(id)a4;
- (void)finishWithCompletion:(id)a3;
- (void)insertCaches:(id)a3 anchor:(id)a4 completion:(id)a5;
- (void)setAccessibilityAssertion:(id)a3;
- (void)setInvalidationQueryDescriptors:(id)a3;
@end

@implementation HDSampleAggregateCachingSession

- (HDSampleAggregateCachingSession)initWithProfile:(id)a3 cachingIdentifier:(id)a4 sourceEntity:(id)a5 queryDescriptor:(id)a6 cachedClass:(Class)a7 queryInterval:(id)a8 anchorDate:(id)a9 intervalComponents:(id)a10 timeIntervalToBucketIndex:(id)a11
{
  id v44 = a3;
  id v18 = a4;
  id v43 = a5;
  id v42 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v47.receiver = self;
  v47.super_class = (Class)HDSampleAggregateCachingSession;
  v23 = [(HDSampleAggregateCachingSession *)&v47 init];
  if (v23)
  {
    v24 = [[HDSampleAggregateCacheStore alloc] initWithProfile:v44 queryDescriptor:v42 cachingIdentifier:v18 sourceEntity:v43 anchorDate:v20 intervalComponents:v21 timeIntervalToBucketIndex:v22];
    cacheStore = v23->_cacheStore;
    v23->_cacheStore = v24;

    objc_storeStrong((id *)&v23->_profile, a3);
    v23->_cachedClass = a7;
    uint64_t v26 = [v18 copy];
    cachingIdentifier = v23->_cachingIdentifier;
    v23->_cachingIdentifier = (NSString *)v26;

    objc_storeStrong((id *)&v23->_sourceEntity, a5);
    uint64_t v28 = [v19 copy];
    queryInterval = v23->_queryInterval;
    v23->_queryInterval = (NSDateInterval *)v28;

    uint64_t v30 = [v20 copy];
    anchorDate = v23->_anchorDate;
    v23->_anchorDate = (NSDate *)v30;

    uint64_t v32 = [v21 copy];
    intervalComponents = v23->_intervalComponents;
    v23->_intervalComponents = (NSDateComponents *)v32;

    fatalError = v23->_fatalError;
    v23->_fatalError = 0;
    v23->_state = 0;

    v45[2] = 0;
    v45[3] = 0;
    int v46 = 1065353216;
    if (v23->_staleIndexes.__table_.__p2_.__value_)
    {
      next = v23->_staleIndexes.__table_.__p1_.__value_.__next_;
      if (next)
      {
        do
        {
          v36 = (void *)*next;
          operator delete(next);
          next = v36;
        }
        while (v36);
      }
      v23->_staleIndexes.__table_.__p1_.__value_.__next_ = 0;
      unint64_t value = v23->_staleIndexes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (uint64_t i = 0; i != value; ++i)
          v23->_staleIndexes.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
      }
      v23->_staleIndexes.__table_.__p2_.__value_ = 0;
    }
    v45[0] = 0;
    v39 = v23->_staleIndexes.__table_.__bucket_list_.__ptr_.__value_;
    v23->_staleIndexes.__table_.__bucket_list_.__ptr_.__value_ = 0;
    if (v39) {
      operator delete(v39);
    }
    v23->_staleIndexes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
    v23->_staleIndexes.__table_.__p1_.__value_.__next_ = 0;
    v45[1] = 0;
    v23->_staleIndexes.__table_.__p2_.__value_ = 0;
    v23->_staleIndexes.__table_.__p3_.__value_ = 1.0;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v45);
    v23->_maxAnchor = 0x7FFFFFFFFFFFFFFFLL;
    v23->_anchorSetOnInsert = 0;
    sampleAggregateCachingSessionQueue_insertError = v23->_sampleAggregateCachingSessionQueue_insertError;
    v23->_sampleAggregateCachingSessionQueue_insertError = 0;
  }
  return v23;
}

- (id)persistentAnchorDateWithError:(id *)a3
{
  persistentAnchorDate = self->_persistentAnchorDate;
  if (!persistentAnchorDate)
  {
    accessibilityAssertion = self->_accessibilityAssertion;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__HDSampleAggregateCachingSession_persistentAnchorDateWithError___block_invoke;
    v8[3] = &unk_1E62FC8B0;
    v8[4] = self;
    if (-[HDSampleAggregateCachingSession _performWithAccessibilityAssertion:requiresWrite:error:block:]((uint64_t)self, accessibilityAssertion, 0, (uint64_t)a3, v8))persistentAnchorDate = self->_persistentAnchorDate; {
    else
    }
      persistentAnchorDate = 0;
  }
  v6 = persistentAnchorDate;

  return v6;
}

uint64_t __65__HDSampleAggregateCachingSession_persistentAnchorDateWithError___block_invoke(uint64_t a1, void *a2)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v14 = 0;
  uint64_t v5 = [v4 persistentAnchorDateWithError:&v14];
  id v6 = v14;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = v5;

  if (*(void *)(*(void *)(a1 + 32) + 72)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    id v11 = v6;
    v12 = v11;
    if (a2) {
      *a2 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }
  return v10;
}

- (uint64_t)_performWithAccessibilityAssertion:(uint64_t)a3 requiresWrite:(uint64_t)a4 error:(void *)a5 block:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  id v11 = (uint64_t (**)(void, void))v10;
  if (a1)
  {
    if (v9)
    {
      v12 = [*(id *)(a1 + 16) database];
      v13 = [NSString stringWithFormat:@"%@:%@", objc_opt_class(), *(void *)(a1 + 40)];
      id v25 = 0;
      id v14 = [v12 cloneAccessibilityAssertion:v9 ownerIdentifier:v13 error:&v25];
      id v15 = v25;

      if (v14)
      {
        v16 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
        [v16 setRequiresWrite:a3];
        [v16 setCacheScope:1];
        [v16 addAccessibilityAssertion:v14];
        v17 = [*(id *)(a1 + 16) database];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __96__HDSampleAggregateCachingSession__performWithAccessibilityAssertion_requiresWrite_error_block___block_invoke;
        v23[3] = &unk_1E630EB58;
        v24 = v11;
        uint64_t v18 = [v17 performTransactionWithContext:v16 error:a4 block:v23 inaccessibilityHandler:0];

        [v14 invalidate];
      }
      else
      {
        _HKInitializeLogging();
        id v19 = (id)*MEMORY[0x1E4F29F90];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v21 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v27 = v21;
          __int16 v28 = 2114;
          id v29 = v15;
          id v22 = v21;
          _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to copy accessibility assertion; continuing: %{public}@",
            buf,
            0x16u);
        }
        uint64_t v18 = v11[2](v11, a4);
      }
    }
    else
    {
      uint64_t v18 = (*((uint64_t (**)(id, uint64_t))v10 + 2))(v10, a4);
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (int64_t)cachesExistWithError:(id *)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  accessibilityAssertion = self->_accessibilityAssertion;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HDSampleAggregateCachingSession_cachesExistWithError___block_invoke;
  v6[3] = &unk_1E62FC9E8;
  v6[4] = self;
  v6[5] = &v7;
  if (-[HDSampleAggregateCachingSession _performWithAccessibilityAssertion:requiresWrite:error:block:]((uint64_t)self, accessibilityAssertion, 0, (uint64_t)a3, v6))int64_t v4 = v8[3]; {
  else
  }
    int64_t v4 = 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

BOOL __56__HDSampleAggregateCachingSession_cachesExistWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) cachesExistWithError:a2];
  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
}

- (BOOL)activateWithError:(id *)a3 cacheHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  uint64_t v7 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
  {
    cachingIdentifier = self->_cachingIdentifier;
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2112;
    id v25 = cachingIdentifier;
    _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ Activating session for %@", buf, 0x16u);
  }
  else if (!self)
  {
LABEL_18:
    char v17 = 0;
    goto LABEL_19;
  }
  int64_t state = self->_state;
  if ((unint64_t)(state - 1) < 3)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = objc_opt_class();
    unint64_t v11 = self->_state - 1;
    if (v11 > 3) {
      v12 = @"NotStarted";
    }
    else {
      v12 = off_1E630EB78[v11];
    }
    v13 = objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v10, sel__changeStateForActivateWithError_, @"Invalid transition for HDSampleAggregateCachingSession from %@ -> Active"", v12);
    goto LABEL_11;
  }
  if (state)
  {
    if (state != 4)
    {
      id v15 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 3, @"HDSampleAggregateCachingSession experienced a fatal error", self->_fatalError);
LABEL_11:
    id v14 = v13;
    id v15 = v14;
    if (v14)
    {
      if (a3)
      {
        id v15 = v14;
        *a3 = v15;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    goto LABEL_17;
  }
  self->_int64_t state = 1;
  accessibilityAssertion = self->_accessibilityAssertion;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__HDSampleAggregateCachingSession_activateWithError_cacheHandler___block_invoke;
  v20[3] = &unk_1E6308FB0;
  v20[4] = self;
  id v21 = v6;
  char v17 = -[HDSampleAggregateCachingSession _performWithAccessibilityAssertion:requiresWrite:error:block:]((uint64_t)self, accessibilityAssertion, 0, (uint64_t)a3, v20);

LABEL_19:
  return v17;
}

uint64_t __66__HDSampleAggregateCachingSession_activateWithError_cacheHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  int64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[5];
  uint64_t v6 = v4[6];
  uint64_t v7 = v4[2];
  id v50 = 0;
  v8 = +[HDCachedQueryMetadataEntity generationNumberForQueryIdentifier:v5 sourceEntity:v6 profile:v7 error:&v50];
  id v9 = v50;
  uint64_t v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    *(void *)(*(void *)(a1 + 32) + 56) = [v8 integerValue];
    uint64_t v46 = 0;
    objc_super v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v49 = 0;
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__HDSampleAggregateCachingSession_activateWithError_cacheHandler___block_invoke_2;
    aBlock[3] = &unk_1E630EB08;
    v12 = *(void **)(a1 + 40);
    aBlock[4] = *(void *)(a1 + 32);
    v40 = &v42;
    v41 = &v46;
    id v39 = v12;
    v13 = _Block_copy(aBlock);
    id v36 = 0;
    uint64_t v37 = 0;
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 8) enumerateForInterval:*(void *)(*(void *)(a1 + 32) + 32) cachedClass:*(void *)(*(void *)(a1 + 32) + 24) anchorAfterDatabaseScan:&v37 error:&v36 cacheHandler:v13];
    id v15 = v36;
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(v16 + 88);
    if (v17 >= v37) {
      uint64_t v17 = v37;
    }
    *(void *)(v16 + 88) = v17;
    uint64_t v18 = *(void *)(a1 + 32);
    if (v14)
    {
      [*(id *)(v18 + 32) duration];
      double v20 = v19;
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "hk_approximateDuration");
      double v22 = v21;
      v23 = [*(id *)(*(void *)(a1 + 32) + 16) daemon];
      __int16 v24 = [v23 analyticsSubmissionCoordinator];

      unint64_t v25 = vcvtad_u64_f64(v20 / v22);
      objc_msgSend(v24, "database_reportCachedQueryEvent:cacheHits:cacheMisses:estimatedTotalBuckets:", *(void *)(*(void *)(a1 + 32) + 40), v47[3], v43[3], v25);
      _HKInitializeLogging();
      uint64_t v26 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = *(void *)(a1 + 32);
        uint64_t v33 = *(void *)(v32 + 40);
        uint64_t v34 = v47[3];
        uint64_t v35 = v43[3];
        *(_DWORD *)buf = 138544386;
        uint64_t v52 = v32;
        __int16 v53 = 2112;
        uint64_t v54 = v33;
        __int16 v55 = 2048;
        uint64_t v56 = v34;
        __int16 v57 = 2048;
        uint64_t v58 = v35;
        __int16 v59 = 2048;
        unint64_t v60 = v25;
        _os_log_debug_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEBUG, "%{public}@ reporting cache success rate for %@ (hits = %lu, misses = %lu, numBuckets = %lu)", buf, 0x34u);
      }
    }
    else
    {
      -[HDSampleAggregateCachingSession _changeStateForFatalError:](v18, v15);
    }
    id v29 = v15;
    uint64_t v30 = v29;
    if (v29)
    {
      if (a2) {
        *a2 = v29;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
  }
  else
  {
    id v27 = v9;
    __int16 v28 = v27;
    if (a2) {
      *a2 = v27;
    }
    else {
      _HKLogDroppedError();
    }

    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t __66__HDSampleAggregateCachingSession_activateWithError_cacheHandler___block_invoke_2(void *a1, void *a2, int a3, unint64_t a4)
{
  id v8 = a2;
  if (!a3)
  {
    uint64_t v12 = a1[7];
    goto LABEL_77;
  }
  uint64_t v9 = a1[4];
  unint64_t v10 = *(void *)(v9 + 120);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = a4;
      if (v10 <= a4) {
        unint64_t v4 = a4 % v10;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & a4;
    }
    v13 = *(void **)(*(void *)(v9 + 112) + 8 * v4);
    if (v13)
    {
      for (uint64_t i = (void *)*v13; i; uint64_t i = (void *)*i)
      {
        unint64_t v15 = i[1];
        if (v15 == a4)
        {
          if (i[2] == a4) {
            goto LABEL_76;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t v16 = operator new(0x18uLL);
  void *v16 = 0;
  v16[1] = a4;
  v16[2] = a4;
  float v17 = (float)(unint64_t)(*(void *)(v9 + 136) + 1);
  float v18 = *(float *)(v9 + 144);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    BOOL v19 = 1;
    if (v10 >= 3) {
      BOOL v19 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v10);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      int8x8_t prime = (int8x8_t)v21;
    }
    else {
      int8x8_t prime = (int8x8_t)v20;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v10 = *(void *)(v9 + 120);
    }
    if (*(void *)&prime > v10) {
      goto LABEL_32;
    }
    if (*(void *)&prime < v10)
    {
      unint64_t v29 = vcvtps_u32_f32((float)*(unint64_t *)(v9 + 136) / *(float *)(v9 + 144));
      if (v10 < 3 || (uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        unint64_t v29 = std::__next_prime(v29);
      }
      else
      {
        uint64_t v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2) {
          unint64_t v29 = v31;
        }
      }
      if (*(void *)&prime <= v29) {
        int8x8_t prime = (int8x8_t)v29;
      }
      if (*(void *)&prime >= v10)
      {
        unint64_t v10 = *(void *)(v9 + 120);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v23 = operator new(8 * *(void *)&prime);
          __int16 v24 = *(void **)(v9 + 112);
          *(void *)(v9 + 112) = v23;
          if (v24) {
            operator delete(v24);
          }
          uint64_t v25 = 0;
          *(int8x8_t *)(v9 + 120) = prime;
          do
            *(void *)(*(void *)(v9 + 112) + 8 * v25++) = 0;
          while (*(void *)&prime != v25);
          uint64_t v26 = *(void **)(v9 + 128);
          if (v26)
          {
            unint64_t v27 = v26[1];
            uint8x8_t v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(void *)&prime) {
                v27 %= *(void *)&prime;
              }
            }
            else
            {
              v27 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v9 + 112) + 8 * v27) = v9 + 128;
            uint64_t v32 = (void *)*v26;
            if (*v26)
            {
              do
              {
                unint64_t v33 = v32[1];
                if (v28.u32[0] > 1uLL)
                {
                  if (v33 >= *(void *)&prime) {
                    v33 %= *(void *)&prime;
                  }
                }
                else
                {
                  v33 &= *(void *)&prime - 1;
                }
                if (v33 != v27)
                {
                  uint64_t v34 = *(void *)(v9 + 112);
                  if (!*(void *)(v34 + 8 * v33))
                  {
                    *(void *)(v34 + 8 * v33) = v26;
                    goto LABEL_57;
                  }
                  *uint64_t v26 = *v32;
                  *uint64_t v32 = **(void **)(*(void *)(v9 + 112) + 8 * v33);
                  **(void **)(*(void *)(v9 + 112) + 8 * v33) = v32;
                  uint64_t v32 = v26;
                }
                unint64_t v33 = v27;
LABEL_57:
                uint64_t v26 = v32;
                uint64_t v32 = (void *)*v32;
                unint64_t v27 = v33;
              }
              while (v32);
            }
          }
          unint64_t v10 = (unint64_t)prime;
          goto LABEL_61;
        }
        v40 = *(void **)(v9 + 112);
        *(void *)(v9 + 112) = 0;
        if (v40) {
          operator delete(v40);
        }
        unint64_t v10 = 0;
        *(void *)(v9 + 120) = 0;
      }
    }
LABEL_61:
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v10 <= a4) {
        unint64_t v4 = a4 % v10;
      }
      else {
        unint64_t v4 = a4;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & a4;
    }
  }
  uint64_t v35 = *(void *)(v9 + 112);
  id v36 = *(void **)(v35 + 8 * v4);
  if (v36)
  {
    void *v16 = *v36;
  }
  else
  {
    void *v16 = *(void *)(v9 + 128);
    *(void *)(v9 + 128) = v16;
    *(void *)(v35 + 8 * v4) = v9 + 128;
    if (!*v16) {
      goto LABEL_75;
    }
    unint64_t v37 = *(void *)(*v16 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v37 >= v10) {
        v37 %= v10;
      }
    }
    else
    {
      v37 &= v10 - 1;
    }
    id v36 = (void *)(*(void *)(v9 + 112) + 8 * v37);
  }
  void *v36 = v16;
LABEL_75:
  ++*(void *)(v9 + 136);
LABEL_76:
  uint64_t v12 = a1[6];
LABEL_77:
  ++*(void *)(*(void *)(v12 + 8) + 24);
  uint64_t v38 = (*(uint64_t (**)(void))(a1[5] + 16))();

  return v38;
}

- (void)_changeStateForFatalError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    *(void *)(a1 + 104) = 4;
    id v6 = v3;
    if (v3)
    {
      id v4 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unknown internal fatal error encountered in HDSampleAggregateCachingSession");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v5 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v4;

    id v3 = v6;
  }
}

- (void)deleteCachesForIntervals:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v6 = a4;
  id v31 = 0;
  unint64_t v20 = v6;
  v23 = [(HDSampleAggregateCachingSession *)self persistentAnchorDateWithError:&v31];
  id v7 = v31;
  BOOL v19 = v7;
  if (v7)
  {
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v7);
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v21;
    uint64_t v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16, 0);
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
          v13 = [(HDSampleAggregateCacheStore *)self->_cacheStore timeIntervalToBucketIndex];
          uint64_t v14 = [v12 startDate];
          [v14 timeIntervalSinceReferenceDate];
          unint64_t v15 = ((uint64_t (**)(void, void *))v13)[2](v13, v23);

          std::__hash_table<long,std::hash<long>,std::equal_to<long>,std::allocator<long>>::__erase_unique<long>(&self->_staleIndexes.__table_.__bucket_list_.__ptr_.__value_, v15);
          uint64_t v16 = [NSNumber numberWithInteger:v15];
          [v8 addObject:v16];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    int64_t generationNumber = self->_generationNumber;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __71__HDSampleAggregateCachingSession_deleteCachesForIntervals_completion___block_invoke;
    v24[3] = &unk_1E63043E8;
    v24[4] = self;
    id v18 = v8;
    id v25 = v18;
    int64_t v26 = generationNumber;
    -[HDSampleAggregateCachingSession _writeToDatabaseOnCachePersistenceQueueWithBlock:completion:]((uint64_t)self, v24, v20);
  }
}

uint64_t __71__HDSampleAggregateCachingSession_deleteCachesForIntervals_completion___block_invoke(void *a1, uint64_t *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1[4] + 8) deleteCachesForIndexes:a1[5] generationNumber:a1[6] + 1 error:a2];
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v5 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = *a2;
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Encountered failure when deleting caches: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v4;
}

- (void)_writeToDatabaseOnCachePersistenceQueueWithBlock:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__HDSampleAggregateCachingSession__writeToDatabaseOnCachePersistenceQueueWithBlock_completion___block_invoke;
    block[3] = &unk_1E62FC630;
    block[4] = a1;
    if (qword_1EBA18E78 != -1) {
      dispatch_once(&qword_1EBA18E78, block);
    }
    uint64_t v7 = _MergedGlobals_226;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __95__HDSampleAggregateCachingSession__writeToDatabaseOnCachePersistenceQueueWithBlock_completion___block_invoke_2;
    v8[3] = &unk_1E62FC720;
    v8[4] = a1;
    id v9 = v6;
    id v10 = v5;
    dispatch_async(v7, v8);
  }
}

- (void)insertCaches:(id)a3 anchor:(id)a4 completion:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v45 = 0;
  if (self)
  {
    id v11 = 0;
    switch(self->_state)
    {
      case 0:
        if ([(HDSampleAggregateCachingSession *)self cachesExistWithError:&v45] == 2)
        {
          id v11 = v45;
          goto LABEL_3;
        }
        id v31 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__changeStateForInsertingWithError_, @"Must call activate on HDSampleAggregateCachingSession before inserting"");
        goto LABEL_27;
      case 1:
      case 2:
LABEL_3:
        self->_int64_t state = 2;
        id v12 = v11;
        if (v9)
        {
          int64_t maxAnchor = self->_maxAnchor;
          uint64_t v14 = [v9 longLongValue];
          if (maxAnchor >= v14) {
            int64_t v15 = v14;
          }
          else {
            int64_t v15 = maxAnchor;
          }
          self->_int64_t maxAnchor = v15;
          self->_anchorSetOnInsert = 1;
        }

        id v44 = 0;
        uint64_t v16 = [(HDSampleAggregateCachingSession *)self persistentAnchorDateWithError:&v44];
        id v17 = v44;
        if (v16)
        {
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v34 = v8;
          id v18 = v8;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v46 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v41;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v41 != v20) {
                  objc_enumerationMutation(v18);
                }
                std::__hash_table<long,std::hash<long>,std::equal_to<long>,std::allocator<long>>::__erase_unique<long>(&self->_staleIndexes.__table_.__bucket_list_.__ptr_.__value_, [*(id *)(*((void *)&v40 + 1) + 8 * v21++) bucketIndexForIntervalComponents:self->_intervalComponents anchorDate:v16]);
              }
              while (v19 != v21);
              uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v46 count:16];
            }
            while (v19);
          }

          id v8 = v34;
          double v22 = self->_cacheStore;
          int64_t generationNumber = self->_generationNumber;
          __int16 v24 = (void *)[v18 copy];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __66__HDSampleAggregateCachingSession_insertCaches_anchor_completion___block_invoke;
          v35[3] = &unk_1E630EB30;
          id v25 = v22;
          id v36 = v25;
          id v37 = v24;
          uint64_t v38 = self;
          int64_t v39 = generationNumber;
          id v26 = v24;
          -[HDSampleAggregateCachingSession _writeToDatabaseOnCachePersistenceQueueWithBlock:completion:]((uint64_t)self, v35, v10);
        }
        else
        {
          (*((void (**)(id, void, id))v10 + 2))(v10, 0, v17);
          -[HDSampleAggregateCachingSession _changeStateForFatalError:]((uint64_t)self, v17);
        }

        goto LABEL_32;
      case 3:
        long long v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = objc_opt_class();
        unint64_t v29 = self->_state - 1;
        if (v29 > 3) {
          long long v30 = @"NotStarted";
        }
        else {
          long long v30 = off_1E630EB78[v29];
        }
        id v31 = objc_msgSend(v27, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v28, sel__changeStateForInsertingWithError_, @"Invalid transition for HDSampleAggregateCachingSession from %@ -> Inserting"", v30);
        goto LABEL_27;
      case 4:
        id v31 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 3, @"HDSampleAggregateCachingSession experienced a fatal error", self->_fatalError);
LABEL_27:
        id v32 = v31;
        if (v32)
        {
          id v11 = v32;
          id v45 = v11;
        }
        else
        {
          id v11 = 0;
        }
        break;
      default:
        break;
    }

    uint64_t v33 = v45;
  }
  else
  {
    uint64_t v33 = 0;
  }
  id v17 = v33;
  (*((void (**)(id, void, id))v10 + 2))(v10, 0, v17);
LABEL_32:
}

uint64_t __66__HDSampleAggregateCachingSession_insertCaches_anchor_completion___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) saveCaches:*(void *)(a1 + 40) generationNumber:*(void *)(a1 + 56) + 1 error:a2];
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *a2;
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Encountered failure when inserting caches: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v4;
}

- (void)finishWithCompletion:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t, id))a3;
  int64_t state = self->_state;
  switch(state)
  {
    case 0:
    case 1:
      goto LABEL_3;
    case 2:
      if (!self->_anchorSetOnInsert)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__validateTransitionToFinishWithError_, @"Cannot finish HDSampleAggregateCachingSession because a non-nil anchor must be specified for at least one insertion of caches."");
        id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
        id v6 = v11;
        if (!v6) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
LABEL_3:
      self->_int64_t state = 3;
      if (self->_staleIndexes.__table_.__p2_.__value_)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__validateTransitionToFinishWithError_, @"Cannot finish HDSampleAggregateCachingSession due to %ld buckets that still need updating"", self->_staleIndexes.__table_.__p2_.__value_);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
LABEL_5:
          id v7 = 0;
LABEL_14:

          id v12 = v7;
          _HKInitializeLogging();
          uint64_t v13 = (void *)*MEMORY[0x1E4F29F90];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
          {
            uint64_t v14 = v13;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              cachingIdentifier = self->_cachingIdentifier;
              id v25 = [v12 localizedDescription];
              *(_DWORD *)buf = 138543874;
              uint64_t v54 = self;
              __int16 v55 = 2112;
              uint64_t v56 = cachingIdentifier;
              __int16 v57 = 2114;
              uint64_t v58 = v25;
              _os_log_debug_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ Finishing caching session %@ with error %{public}@", buf, 0x20u);
            }
          }
          uint64_t v15 = 0;
LABEL_19:
          v4[2](v4, v15, v12);
          goto LABEL_20;
        }
LABEL_13:
        id v7 = v6;
        goto LABEL_14;
      }
      if (!state)
      {
        _HKInitializeLogging();
        uint64_t v21 = *MEMORY[0x1E4F29F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
        {
          long long v41 = self->_cachingIdentifier;
          *(_DWORD *)buf = 138543618;
          uint64_t v54 = self;
          __int16 v55 = 2112;
          uint64_t v56 = v41;
          _os_log_debug_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ Finishing caching session %@ successfully", buf, 0x16u);
        }
        id v12 = 0;
        uint64_t v15 = 1;
        goto LABEL_19;
      }
      id v52 = 0;
      uint64_t v16 = [(HDSampleAggregateCachingSession *)self persistentAnchorDateWithError:&v52];
      id v12 = v52;
      uint64_t v47 = (void *)v16;
      if (v16)
      {
        id v17 = [(NSDateInterval *)self->_queryInterval startDate];
        if (v17)
        {
          id v18 = NSNumber;
          uint64_t v19 = [(HDSampleAggregateCacheStore *)self->_cacheStore timeIntervalToBucketIndex];
          uint64_t v20 = [(NSDateInterval *)self->_queryInterval startDate];
          [v20 timeIntervalSinceReferenceDate];
          uint64_t v46 = objc_msgSend(v18, "numberWithInteger:", v19[2](v19, v16));
        }
        else
        {
          uint64_t v46 = 0;
        }

        id v26 = [(NSDateInterval *)self->_queryInterval endDate];
        if (v26)
        {
          long long v27 = NSNumber;
          uint64_t v28 = [(HDSampleAggregateCacheStore *)self->_cacheStore timeIntervalToBucketIndex];
          unint64_t v29 = [(NSDateInterval *)self->_queryInterval endDate];
          [v29 timeIntervalSinceReferenceDate];
          id v45 = objc_msgSend(v27, "numberWithInteger:", v28[2](v28, v16) - 1);
        }
        else
        {
          id v45 = 0;
        }

        long long v30 = [HDCachedQueryMetadata alloc];
        id v31 = self->_cachingIdentifier;
        int64_t v32 = [(HDSQLiteEntity *)self->_sourceEntity persistentID];
        int64_t maxAnchor = self->_maxAnchor;
        int64_t generationNumber = self->_generationNumber;
        id v44 = [(HDProfile *)self->_profile daemon];
        uint64_t v35 = [v44 behavior];
        id v36 = [v35 currentOSBuild];
        id v37 = [(HDCachedQueryMetadata *)v30 initWithCachingIdentifier:v31 sourceEntityPersistentID:v32 maxAnchor:maxAnchor queryStartIndex:v46 queryEndIndex:v45 generationNumber:generationNumber + 1 buildVersion:v36 anchorDate:self->_anchorDate intervalComponents:self->_intervalComponents];

        uint64_t v38 = self->_profile;
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __56__HDSampleAggregateCachingSession_finishWithCompletion___block_invoke;
        v48[3] = &unk_1E63040E0;
        uint64_t v49 = v37;
        id v50 = v38;
        v51 = self;
        int64_t v39 = v38;
        long long v40 = v37;
        -[HDSampleAggregateCachingSession _writeToDatabaseOnCachePersistenceQueueWithBlock:completion:]((uint64_t)self, v48, v4);
      }
      else
      {
        _HKInitializeLogging();
        double v22 = (void *)*MEMORY[0x1E4F29F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
        {
          v23 = v22;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            long long v42 = self->_cachingIdentifier;
            long long v43 = [v12 localizedDescription];
            *(_DWORD *)buf = 138543874;
            uint64_t v54 = self;
            __int16 v55 = 2112;
            uint64_t v56 = v42;
            __int16 v57 = 2114;
            uint64_t v58 = v43;
            _os_log_debug_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ Finishing caching session %@ with error %{public}@", buf, 0x20u);
          }
        }
        v4[2](v4, 0, v12);
        -[HDSampleAggregateCachingSession _changeStateForFatalError:]((uint64_t)self, v12);
      }

LABEL_20:
      return;
    case 3:
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__changeStateForFinishWithError_, @"HDSampleAggregateCachingSession is already finished"");
      goto LABEL_8;
    case 4:
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 3, @"HDSampleAggregateCachingSession experienced a fatal error", self->_fatalError);
LABEL_8:
      id v9 = v8;
      if (!v9) {
        goto LABEL_10;
      }
      id v10 = v9;
      goto LABEL_11;
    default:
LABEL_10:
      id v10 = 0;
LABEL_11:

      id v11 = v10;
      goto LABEL_12;
  }
}

BOOL __56__HDSampleAggregateCachingSession_finishWithCompletion___block_invoke(void *a1, uint64_t *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = +[HDCachedQueryMetadataEntity updateCachedQueryMetadata:a1[4] profile:a1[5] error:a2];
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29F90];
  id v6 = *MEMORY[0x1E4F29F90];
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = a1[6];
      uint64_t v8 = *(void *)(v7 + 40);
      int v12 = 138543618;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_debug_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ Finishing query %@ successfully", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = a1[6];
    uint64_t v11 = *a2;
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Encountered failure when finishing session: %@", (uint8_t *)&v12, 0x16u);
  }
  return v4;
}

void __95__HDSampleAggregateCachingSession__writeToDatabaseOnCachePersistenceQueueWithBlock_completion___block_invoke()
{
  id v2 = (id)[[NSString alloc] initWithFormat:@"sample-aggregate-caching-session-queue"];
  uint64_t v0 = HKCreateSerialDispatchQueue();
  v1 = (void *)_MergedGlobals_226;
  _MergedGlobals_226 = v0;
}

void __95__HDSampleAggregateCachingSession__writeToDatabaseOnCachePersistenceQueueWithBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 160))
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    BOOL v4 = *(void **)(v2 + 176);
    id v11 = 0;
    uint64_t v5 = -[HDSampleAggregateCachingSession _performWithAccessibilityAssertion:requiresWrite:error:block:](v2, v4, 1, (uint64_t)&v11, *(void **)(a1 + 48));
    id v6 = v11;
    id v7 = v11;
    if ((v5 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v8 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v13 = v10;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Encountered failure when updating caches: %@", buf, 0x16u);
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), v6);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v5, v7);
    }
  }
}

uint64_t __96__HDSampleAggregateCachingSession__performWithAccessibilityAssertion_requiresWrite_error_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)invalidationQueryDescriptors
{
  return self->_invalidationQueryDescriptors;
}

- (void)setInvalidationQueryDescriptors:(id)a3
{
}

- (HDAssertion)accessibilityAssertion
{
  return self->_accessibilityAssertion;
}

- (void)setAccessibilityAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_invalidationQueryDescriptors, 0);
  objc_storeStrong((id *)&self->_sampleAggregateCachingSessionQueue_insertError, 0);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_staleIndexes);
  objc_storeStrong((id *)&self->_fatalError, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_persistentAnchorDate, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
  objc_storeStrong((id *)&self->_queryInterval, 0);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_storeStrong((id *)&self->_cacheStore, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_DWORD *)self + 36) = 1065353216;
  return self;
}

@end