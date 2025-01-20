@interface HDRollingBaselineRelativeDataSource
- (BOOL)_couldSampleEverResolveToDeterminateValue:(HDRawQuantitySample *)a3;
- (BOOL)_primeBaselineCalculatorWithPriorSamplesForSample:(HDRawQuantitySample *)a3 baselineCompatibilityID:(id)a4 error:(id *)a5;
- (BOOL)_shouldContinueWithError:(id *)a3;
- (BOOL)_supplementCalculatorWithSubsequentSamplesForSample:(HDRawQuantitySample *)a3 baselineCompatibilityID:(id)a4 error:(id *)a5;
- (HDProfile)profile;
- (HDRollingBaselineRelativeDataSource)initWithProfile:(id)a3 quantityType:(id)a4 configuration:(id)a5 queryPrefetchWindow:(double)a6 currentDate:(id)a7;
- (id).cxx_construct;
- (id)_predicateForSamplesStartingWithinDateInterval:(id)a3 sourceID:(int64_t)a4 isIntervalStartDateInclusive:(BOOL)a5;
- (id)computeRelativeValueForSample:(HDRawQuantitySample *)a3 error:(id *)a4;
- (id)shouldContinueHandler;
- (void)setShouldContinueHandler:(id)a3;
@end

@implementation HDRollingBaselineRelativeDataSource

- (HDRollingBaselineRelativeDataSource)initWithProfile:(id)a3 quantityType:(id)a4 configuration:(id)a5 queryPrefetchWindow:(double)a6 currentDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HDRollingBaselineRelativeDataSource;
  v16 = [(HDRollingBaselineRelativeDataSource *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_profile, v12);
    objc_storeStrong((id *)&v17->_quantityType, a4);
    v18 = [[HDRollingBaselineRelativeQuantityCalculator alloc] initWithConfiguration:v14];
    baselineCalculator = v17->_baselineCalculator;
    v17->_baselineCalculator = v18;

    v20 = [[_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap alloc] initWithProfile:v12 quantityType:v13];
    canonicalSourceMap = v17->_canonicalSourceMap;
    v17->_canonicalSourceMap = v20;

    v17->_queryPrefetchWindow = a6;
    objc_storeStrong((id *)&v17->_currentDate, a7);
    if (v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p2_.__value_)
    {
      std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::__deallocate_node((id *)v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p1_.__value_.__next_);
      v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p1_.__value_.__next_ = 0;
      unint64_t value = v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (uint64_t i = 0; i != value; ++i)
          v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
      }
      v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p2_.__value_ = 0;
    }
    v24 = v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_;
    v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_ = 0;
    if (v24) {
      operator delete(v24);
    }
    v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
    v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p1_.__value_.__next_ = 0;
    v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p2_.__value_ = 0;
    v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p3_.__value_ = 1.0;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::__deallocate_node(0);
  }

  return v17;
}

- (id)computeRelativeValueForSample:(HDRawQuantitySample *)a3 error:(id *)a4
{
  v7 = [(_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *)self->_canonicalSourceMap baselineCompatibilityIDForSourceID:a3->var3];
  long long v8 = *(_OWORD *)&a3->var2;
  v21[0] = *(_OWORD *)&a3->var0;
  v21[1] = v8;
  uint64_t v22 = *(void *)&a3->var4;
  if (![(HDRollingBaselineRelativeDataSource *)self _primeBaselineCalculatorWithPriorSamplesForSample:v21 baselineCompatibilityID:v7 error:a4])goto LABEL_10; {
  BOOL v9 = [(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator hasSufficientDataToBaselineSampleWithSourceID:v7];
  }
  baselineCalculator = self->_baselineCalculator;
  double var0 = a3->var0;
  if (v9)
  {
    [(HDRollingBaselineRelativeQuantityCalculator *)baselineCalculator baselineRelativeValueForSampleValue:v7 sourceID:var0];
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithDouble:");
LABEL_6:
    id v13 = (void *)v12;
    goto LABEL_11;
  }
  [(HDRollingBaselineRelativeQuantityCalculator *)baselineCalculator addSupplementarySampleValue:v7 startTime:var0 sourceID:a3->var1];
  if ([(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator hasSufficientDataToBaselineSampleWithSourceID:v7])
  {
    [(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator baselineRelativeValueForSampleValue:v7 sourceID:a3->var0];
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithDouble:");
    goto LABEL_6;
  }
  long long v14 = *(_OWORD *)&a3->var2;
  v19[0] = *(_OWORD *)&a3->var0;
  v19[1] = v14;
  uint64_t v20 = *(void *)&a3->var4;
  if ([(HDRollingBaselineRelativeDataSource *)self _supplementCalculatorWithSubsequentSamplesForSample:v19 baselineCompatibilityID:v7 error:a4])
  {
    if ([(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator hasSufficientDataToBaselineSampleWithSourceID:v7])
    {
      [(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator baselineRelativeValueForSampleValue:v7 sourceID:a3->var0];
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithDouble:");
      goto LABEL_6;
    }
    long long v16 = *(_OWORD *)&a3->var2;
    v17[0] = *(_OWORD *)&a3->var0;
    v17[1] = v16;
    uint64_t v18 = *(void *)&a3->var4;
    if ([(HDRollingBaselineRelativeDataSource *)self _couldSampleEverResolveToDeterminateValue:v17])
    {
      id v13 = &unk_1F17EF400;
    }
    else
    {
      id v13 = &unk_1F17EF410;
    }
  }
  else
  {
LABEL_10:
    id v13 = 0;
  }
LABEL_11:

  return v13;
}

- (BOOL)_primeBaselineCalculatorWithPriorSamplesForSample:(HDRawQuantitySample *)a3 baselineCompatibilityID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v33 = v8;
  [(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator pruneForNextSampleStartTime:v8 sourceID:a3->var1];
  if (std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::find<NSString * {__strong}>(&self->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_, &v33))
  {
    BOOL v9 = std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::find<NSString * {__strong}>(&self->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_, &v33);
    if (!v9) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    while (1)
    {
      v10 = v9[8];
      if (!v10) {
        break;
      }
      v11 = (void **)v9[4];
      unint64_t v12 = (unint64_t)v9[7];
      id v13 = (double *)((char *)v11[v12 / 0x66] + 40 * (v12 % 0x66));
      double v14 = v13[1];
      if (v14 >= a3->var1)
      {
        BOOL v26 = 1;
        goto LABEL_12;
      }
      unint64_t v15 = v12 + 1;
      v9[7] = (uint64_t *)v15;
      v9[8] = (uint64_t *)((char *)v10 - 1);
      if (v15 >= 0xCC)
      {
        operator delete(*v11);
        ++v9[4];
        v9[7] = (uint64_t *)((char *)v9[7] - 102);
        double v14 = v13[1];
      }
      [(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator addNextSampleValue:v8 startTime:*v13 sourceID:v14];
    }
  }
  [(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator mostRecentSampleStartTimeForSourceID:v8];
  double v17 = v16;
  double var1 = a3->var1;
  v19 = [(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator configuration];
  [v19 maximumWindowDuration];
  double v21 = var1 - v20;

  if (v17 >= v21) {
    double v21 = v17;
  }
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithStart:end:", v21, a3->var1 + self->_queryPrefetchWindow);
  v23 = [(HDRollingBaselineRelativeDataSource *)self _predicateForSamplesStartingWithinDateInterval:v22 sourceID:a3->var3 isIntervalStartDateInclusive:v21 != v17];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __119__HDRollingBaselineRelativeDataSource__primeBaselineCalculatorWithPriorSamplesForSample_baselineCompatibilityID_error___block_invoke;
  v28[3] = &unk_1E630B140;
  long long v25 = *(_OWORD *)&a3->var2;
  long long v30 = *(_OWORD *)&a3->var0;
  long long v31 = v25;
  uint64_t v32 = *(void *)&a3->var4;
  v28[4] = self;
  id v29 = v8;
  BOOL v26 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:v23 profile:WeakRetained options:0 error:a5 handler:v28];

LABEL_12:
  return v26;
}

uint64_t __119__HDRollingBaselineRelativeDataSource__primeBaselineCalculatorWithPriorSamplesForSample_baselineCompatibilityID_error___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v16 = a1;
  uint64_t v17 = *(void *)(a1 + 32);
  if (*(double *)(a1 + 56) > a2)
  {
    [*(id *)(v17 + 16) addNextSampleValue:*(void *)(a1 + 40) startTime:a4 sourceID:a5];
    goto LABEL_150;
  }
  unint64_t v20 = [*(id *)(a1 + 40) hash];
  unint64_t v21 = v20;
  unint64_t v22 = *(void *)(v17 + 56);
  uint64_t v160 = a9;
  uint64_t v161 = v16;
  if (v22)
  {
    uint8x8_t v23 = (uint8x8_t)vcnt_s8((int8x8_t)v22);
    v23.i16[0] = vaddlv_u8(v23);
    unint64_t v24 = v23.u32[0];
    if (v23.u32[0] > 1uLL)
    {
      unint64_t v12 = v20;
      if (v20 >= v22) {
        unint64_t v12 = v20 % v22;
      }
    }
    else
    {
      unint64_t v12 = (v22 - 1) & v20;
    }
    long long v25 = *(void ***)(*(void *)(v17 + 48) + 8 * v12);
    if (v25)
    {
      BOOL v26 = (char *)*v25;
      if (*v25)
      {
        do
        {
          unint64_t v27 = *((void *)v26 + 1);
          if (v27 == v21)
          {
            if (std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>::operator()[abi:ne180100](*((void **)v26 + 2), *(void **)(v16 + 40)))
            {
              uint64_t v103 = a12;
              goto LABEL_76;
            }
          }
          else
          {
            if (v24 > 1)
            {
              if (v27 >= v22) {
                v27 %= v22;
              }
            }
            else
            {
              v27 &= v22 - 1;
            }
            if (v27 != v12) {
              break;
            }
          }
          BOOL v26 = *(char **)v26;
        }
        while (v26);
      }
    }
  }
  v28 = (void *)(v17 + 64);
  BOOL v26 = (char *)operator new(0x48uLL);
  *(void *)BOOL v26 = 0;
  *((void *)v26 + 1) = v21;
  *((void *)v26 + 2) = *(id *)(v16 + 40);
  *(_OWORD *)(v26 + 24) = 0u;
  *(_OWORD *)(v26 + 40) = 0u;
  *(_OWORD *)(v26 + 56) = 0u;
  float v29 = (float)(unint64_t)(*(void *)(v17 + 72) + 1);
  float v30 = *(float *)(v17 + 80);
  if (!v22 || (float)(v30 * (float)v22) < v29)
  {
    BOOL v31 = 1;
    if (v22 >= 3) {
      BOOL v31 = (v22 & (v22 - 1)) != 0;
    }
    unint64_t v32 = v31 | (2 * v22);
    unint64_t v33 = vcvtps_u32_f32(v29 / v30);
    if (v32 <= v33) {
      int8x8_t prime = (int8x8_t)v33;
    }
    else {
      int8x8_t prime = (int8x8_t)v32;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v22 = *(void *)(v17 + 56);
    if (*(void *)&prime > v22) {
      goto LABEL_32;
    }
    if (*(void *)&prime < v22)
    {
      unint64_t v41 = vcvtps_u32_f32((float)*(unint64_t *)(v17 + 72) / *(float *)(v17 + 80));
      if (v22 < 3 || (uint8x8_t v42 = (uint8x8_t)vcnt_s8((int8x8_t)v22), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
      {
        unint64_t v41 = std::__next_prime(v41);
      }
      else
      {
        uint64_t v43 = 1 << -(char)__clz(v41 - 1);
        if (v41 >= 2) {
          unint64_t v41 = v43;
        }
      }
      if (*(void *)&prime <= v41) {
        int8x8_t prime = (int8x8_t)v41;
      }
      if (*(void *)&prime >= v22)
      {
        unint64_t v22 = *(void *)(v17 + 56);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v35 = operator new(8 * *(void *)&prime);
          v36 = *(void **)(v17 + 48);
          *(void *)(v17 + 48) = v35;
          if (v36) {
            operator delete(v36);
          }
          uint64_t v37 = 0;
          *(int8x8_t *)(v17 + 56) = prime;
          do
            *(void *)(*(void *)(v17 + 48) + 8 * v37++) = 0;
          while (*(void *)&prime != v37);
          v38 = (void *)*v28;
          if (*v28)
          {
            unint64_t v39 = v38[1];
            uint8x8_t v40 = (uint8x8_t)vcnt_s8(prime);
            v40.i16[0] = vaddlv_u8(v40);
            if (v40.u32[0] > 1uLL)
            {
              if (v39 >= *(void *)&prime) {
                v39 %= *(void *)&prime;
              }
            }
            else
            {
              v39 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v17 + 48) + 8 * v39) = v28;
            v44 = (void *)*v38;
            if (*v38)
            {
              do
              {
                unint64_t v45 = v44[1];
                if (v40.u32[0] > 1uLL)
                {
                  if (v45 >= *(void *)&prime) {
                    v45 %= *(void *)&prime;
                  }
                }
                else
                {
                  v45 &= *(void *)&prime - 1;
                }
                if (v45 != v39)
                {
                  uint64_t v46 = *(void *)(v17 + 48);
                  if (!*(void *)(v46 + 8 * v45))
                  {
                    *(void *)(v46 + 8 * v45) = v38;
                    goto LABEL_57;
                  }
                  void *v38 = *v44;
                  void *v44 = **(void **)(*(void *)(v17 + 48) + 8 * v45);
                  **(void **)(*(void *)(v17 + 48) + 8 * v45) = v44;
                  v44 = v38;
                }
                unint64_t v45 = v39;
LABEL_57:
                v38 = v44;
                v44 = (void *)*v44;
                unint64_t v39 = v45;
              }
              while (v44);
            }
          }
          unint64_t v22 = (unint64_t)prime;
          goto LABEL_61;
        }
        v104 = *(void **)(v17 + 48);
        *(void *)(v17 + 48) = 0;
        if (v104) {
          operator delete(v104);
        }
        unint64_t v22 = 0;
        *(void *)(v17 + 56) = 0;
      }
    }
LABEL_61:
    if ((v22 & (v22 - 1)) != 0)
    {
      if (v21 >= v22) {
        unint64_t v12 = v21 % v22;
      }
      else {
        unint64_t v12 = v21;
      }
    }
    else
    {
      unint64_t v12 = (v22 - 1) & v21;
    }
  }
  uint64_t v47 = *(void *)(v17 + 48);
  v48 = *(void **)(v47 + 8 * v12);
  if (v48)
  {
    *(void *)BOOL v26 = *v48;
LABEL_74:
    void *v48 = v26;
    goto LABEL_75;
  }
  *(void *)BOOL v26 = *v28;
  void *v28 = v26;
  *(void *)(v47 + 8 * v12) = v28;
  if (*(void *)v26)
  {
    unint64_t v49 = *(void *)(*(void *)v26 + 8);
    if ((v22 & (v22 - 1)) != 0)
    {
      if (v49 >= v22) {
        v49 %= v22;
      }
    }
    else
    {
      v49 &= v22 - 1;
    }
    v48 = (void *)(*(void *)(v17 + 48) + 8 * v49);
    goto LABEL_74;
  }
LABEL_75:
  uint64_t v103 = a12;
  ++*(void *)(v17 + 72);
LABEL_76:
  v50 = (char *)*((void *)v26 + 5);
  v51 = (char *)*((void *)v26 + 4);
  unint64_t v52 = (v50 - v51) >> 3;
  if (v50 == v51) {
    uint64_t v53 = 0;
  }
  else {
    uint64_t v53 = 102 * v52 - 1;
  }
  unint64_t v55 = *((void *)v26 + 7);
  uint64_t v54 = *((void *)v26 + 8);
  unint64_t v56 = v54 + v55;
  if (v53 == v54 + v55)
  {
    if (v55 >= 0x66)
    {
      *((void *)v26 + 7) = v55 - 102;
      uint64_t v59 = *(void *)v51;
      v57 = v51 + 8;
      uint64_t v58 = v59;
      *((void *)v26 + 4) = v57;
      if (v50 == *((char **)v26 + 6))
      {
        unint64_t v74 = *((void *)v26 + 3);
        uint64_t v75 = (uint64_t)&v57[-v74];
        a12 = v103;
        if ((unint64_t)v57 <= v74)
        {
          uint64_t v105 = (uint64_t)&v50[-v74];
          BOOL v95 = v105 == 0;
          uint64_t v106 = v105 >> 2;
          if (v95) {
            unint64_t v107 = 1;
          }
          else {
            unint64_t v107 = v106;
          }
          v108 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v107);
          v110 = &v108[8 * (v107 >> 2)];
          v111 = (uint64_t *)*((void *)v26 + 4);
          v50 = v110;
          uint64_t v112 = *((void *)v26 + 5) - (void)v111;
          uint64_t v16 = v161;
          if (v112)
          {
            v50 = &v110[v112 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v113 = 8 * (v112 >> 3);
            v114 = &v108[8 * (v107 >> 2)];
            do
            {
              uint64_t v115 = *v111++;
              *(void *)v114 = v115;
              v114 += 8;
              v113 -= 8;
            }
            while (v113);
          }
          v116 = (void *)*((void *)v26 + 3);
          *((void *)v26 + 3) = v108;
          *((void *)v26 + 4) = v110;
          *((void *)v26 + 5) = v50;
          *((void *)v26 + 6) = &v108[8 * v109];
          if (v116)
          {
            operator delete(v116);
            v50 = (char *)*((void *)v26 + 5);
          }
        }
        else
        {
          uint64_t v76 = v75 >> 3;
          BOOL v77 = v75 >> 3 < -1;
          uint64_t v78 = (v75 >> 3) + 2;
          if (v77) {
            uint64_t v79 = v78;
          }
          else {
            uint64_t v79 = v76 + 1;
          }
          uint64_t v80 = -(v79 >> 1);
          uint64_t v81 = v79 >> 1;
          v82 = &v57[-8 * v81];
          int64_t v83 = v50 - v57;
          uint64_t v16 = v161;
          if (v50 != v57)
          {
            memmove(&v57[-8 * v81], v57, v50 - v57);
            v50 = (char *)*((void *)v26 + 4);
          }
          v84 = &v50[8 * v80];
          v50 = &v82[v83];
          *((void *)v26 + 4) = v84;
          *((void *)v26 + 5) = &v82[v83];
        }
      }
      else
      {
        a12 = v103;
        uint64_t v16 = v161;
      }
      *(void *)v50 = v58;
      goto LABEL_147;
    }
    v60 = (char *)*((void *)v26 + 6);
    v61 = (char *)*((void *)v26 + 3);
    if (v52 < (v60 - v61) >> 3)
    {
      v62 = operator new(0xFF0uLL);
      v63 = v62;
      if (v60 != v50)
      {
        *(void *)v50 = v62;
        *((void *)v26 + 5) += 8;
        a12 = v103;
        uint64_t v16 = v161;
LABEL_148:
        uint64_t v54 = *((void *)v26 + 8);
        v51 = (char *)*((void *)v26 + 4);
        unint64_t v56 = *((void *)v26 + 7) + v54;
        goto LABEL_149;
      }
      a12 = v103;
      if (v51 == v61)
      {
        if (v50 == v51) {
          unint64_t v125 = 1;
        }
        else {
          unint64_t v125 = (v60 - v51) >> 2;
        }
        uint64_t v126 = 2 * v125;
        v127 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v125);
        v51 = &v127[(v126 + 6) & 0xFFFFFFFFFFFFFFF8];
        v129 = (uint64_t *)*((void *)v26 + 4);
        v130 = v51;
        uint64_t v131 = *((void *)v26 + 5) - (void)v129;
        uint64_t v16 = v161;
        if (v131)
        {
          v130 = &v51[v131 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v132 = 8 * (v131 >> 3);
          v133 = &v127[(v126 + 6) & 0xFFFFFFFFFFFFFFF8];
          do
          {
            uint64_t v134 = *v129++;
            *(void *)v133 = v134;
            v133 += 8;
            v132 -= 8;
          }
          while (v132);
        }
        v135 = (void *)*((void *)v26 + 3);
        *((void *)v26 + 3) = v127;
        *((void *)v26 + 4) = v51;
        *((void *)v26 + 5) = v130;
        *((void *)v26 + 6) = &v127[8 * v128];
        if (v135)
        {
          operator delete(v135);
          v51 = (char *)*((void *)v26 + 4);
        }
      }
      else
      {
        uint64_t v16 = v161;
      }
      *((void *)v51 - 1) = v63;
      v136 = (char *)*((void *)v26 + 4);
      v137 = (char *)*((void *)v26 + 5);
      *((void *)v26 + 4) = v136 - 8;
      uint64_t v138 = *((void *)v136 - 1);
      *((void *)v26 + 4) = v136;
      if (v137 == *((char **)v26 + 6))
      {
        unint64_t v139 = *((void *)v26 + 3);
        uint64_t v140 = (uint64_t)&v136[-v139];
        if ((unint64_t)v136 <= v139)
        {
          uint64_t v148 = (uint64_t)&v137[-v139];
          BOOL v95 = v148 == 0;
          uint64_t v149 = v148 >> 2;
          if (v95) {
            unint64_t v150 = 1;
          }
          else {
            unint64_t v150 = v149;
          }
          v151 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v150);
          v153 = &v151[8 * (v150 >> 2)];
          v154 = (uint64_t *)*((void *)v26 + 4);
          v137 = v153;
          uint64_t v155 = *((void *)v26 + 5) - (void)v154;
          if (v155)
          {
            v137 = &v153[v155 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v156 = 8 * (v155 >> 3);
            v157 = &v151[8 * (v150 >> 2)];
            do
            {
              uint64_t v158 = *v154++;
              *(void *)v157 = v158;
              v157 += 8;
              v156 -= 8;
            }
            while (v156);
          }
          v159 = (void *)*((void *)v26 + 3);
          *((void *)v26 + 3) = v151;
          *((void *)v26 + 4) = v153;
          *((void *)v26 + 5) = v137;
          *((void *)v26 + 6) = &v151[8 * v152];
          if (v159)
          {
            operator delete(v159);
            v137 = (char *)*((void *)v26 + 5);
          }
        }
        else
        {
          uint64_t v141 = v140 >> 3;
          BOOL v77 = v140 >> 3 < -1;
          uint64_t v142 = (v140 >> 3) + 2;
          if (v77) {
            uint64_t v143 = v142;
          }
          else {
            uint64_t v143 = v141 + 1;
          }
          uint64_t v144 = -(v143 >> 1);
          uint64_t v145 = v143 >> 1;
          v146 = &v136[-8 * v145];
          int64_t v147 = v137 - v136;
          if (v137 != v136)
          {
            memmove(&v136[-8 * v145], v136, v137 - v136);
            v136 = (char *)*((void *)v26 + 4);
          }
          v137 = &v146[v147];
          *((void *)v26 + 4) = &v136[8 * v144];
          *((void *)v26 + 5) = &v146[v147];
        }
      }
      *(void *)v137 = v138;
LABEL_147:
      *((void *)v26 + 5) += 8;
      goto LABEL_148;
    }
    if (v60 == v61) {
      unint64_t v64 = 1;
    }
    else {
      unint64_t v64 = (v60 - v61) >> 2;
    }
    v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v64);
    uint64_t v67 = v66;
    v68 = operator new(0xFF0uLL);
    v69 = &v65[8 * v52];
    v70 = &v65[8 * v67];
    if (v52 == v67)
    {
      uint64_t v71 = 8 * v52;
      a12 = v103;
      if (v50 - v51 < 1)
      {
        v120 = v68;
        uint64_t v121 = v71 >> 2;
        if (v50 == v51) {
          unint64_t v122 = 1;
        }
        else {
          unint64_t v122 = v121;
        }
        uint64_t v16 = v161;
        v123 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v122);
        v69 = &v123[8 * (v122 >> 2)];
        v70 = &v123[8 * v124];
        if (v65) {
          operator delete(v65);
        }
        v65 = v123;
        v68 = v120;
        goto LABEL_105;
      }
      uint64_t v72 = v71 >> 3;
      if (v72 >= -1) {
        unint64_t v73 = v72 + 1;
      }
      else {
        unint64_t v73 = v72 + 2;
      }
      v69 -= 8 * (v73 >> 1);
    }
    else
    {
      a12 = v103;
    }
    uint64_t v16 = v161;
LABEL_105:
    *(void *)v69 = v68;
    v85 = v69 + 8;
    for (uint64_t i = *((void *)v26 + 5); i != *((void *)v26 + 4); i -= 8)
    {
      if (v69 == v65)
      {
        if (v85 >= v70)
        {
          if (v70 == v65) {
            unint64_t v91 = 1;
          }
          else {
            unint64_t v91 = (v70 - v65) >> 2;
          }
          v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v91);
          v94 = v92;
          v69 = &v92[(2 * v91 + 6) & 0xFFFFFFFFFFFFFFF8];
          uint64_t v96 = v85 - v65;
          BOOL v95 = v85 == v65;
          v85 = v69;
          if (!v95)
          {
            v85 = &v69[v96 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v97 = 8 * (v96 >> 3);
            v98 = v69;
            v99 = (uint64_t *)v65;
            do
            {
              uint64_t v100 = *v99++;
              *(void *)v98 = v100;
              v98 += 8;
              v97 -= 8;
            }
            while (v97);
          }
          v70 = &v92[8 * v93];
          if (v65) {
            operator delete(v65);
          }
          v65 = v94;
        }
        else
        {
          uint64_t v87 = (v70 - v85) >> 3;
          if (v87 >= -1) {
            uint64_t v88 = v87 + 1;
          }
          else {
            uint64_t v88 = v87 + 2;
          }
          uint64_t v89 = v88 >> 1;
          v69 = &v65[8 * (v88 >> 1)];
          v90 = v65;
          if (v85 != v65)
          {
            memmove(v69, v65, v85 - v65);
            v90 = v85;
          }
          v85 = &v90[8 * v89];
        }
      }
      uint64_t v101 = *(void *)(i - 8);
      *((void *)v69 - 1) = v101;
      v69 -= 8;
    }
    v102 = (void *)*((void *)v26 + 3);
    *((void *)v26 + 3) = v65;
    *((void *)v26 + 4) = v69;
    *((void *)v26 + 5) = v85;
    *((void *)v26 + 6) = v70;
    if (v102) {
      operator delete(v102);
    }
    goto LABEL_148;
  }
  a12 = v103;
  uint64_t v16 = v161;
LABEL_149:
  unint64_t v117 = *(void *)&v51[8 * (v56 / 0x66)] + 40 * (v56 % 0x66);
  *(double *)unint64_t v117 = a4;
  *(double *)(v117 + 8) = a2;
  *(double *)(v117 + 16) = a3;
  *(void *)(v117 + 24) = v160;
  *(_WORD *)(v117 + 32) = 1;
  *((void *)v26 + 8) = v54 + 1;
LABEL_150:
  v118 = *(void **)(v16 + 32);

  return [v118 _shouldContinueWithError:a12];
}

- (BOOL)_supplementCalculatorWithSubsequentSamplesForSample:(HDRawQuantitySample *)a3 baselineCompatibilityID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v35 = v8;
  double var1 = a3->var1;
  v10 = [(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator configuration];
  [v10 maximumWindowDuration];
  double v12 = v11;

  double v13 = var1 + v12;
  if (std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::find<NSString * {__strong}>(&self->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_, &v35))
  {
    double v14 = std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::find<NSString * {__strong}>(&self->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_, &v35);
    unint64_t v15 = v14;
    if (!v14) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    uint64_t v16 = v14[8];
    if (v16)
    {
      for (unint64_t i = 0; (unint64_t)v16 > i; ++i)
      {
        uint64_t v18 = (double *)(v15[4][((unint64_t)v15[7] + i) / 0x66] + 40 * (((unint64_t)v15[7] + i) % 0x66));
        double v19 = v18[1];
        if (v19 > a3->var1)
        {
          if (v19 >= v13
            || (-[HDRollingBaselineRelativeQuantityCalculator addSupplementarySampleValue:startTime:sourceID:](self->_baselineCalculator, "addSupplementarySampleValue:startTime:sourceID:", v8, *v18), [(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator hasSufficientDataToBaselineSampleWithSourceID:v8]))
          {
            BOOL v26 = 1;
            goto LABEL_16;
          }
          uint64_t v16 = v15[8];
        }
      }
    }
  }
  double v20 = a3->var1;
  [(HDRollingBaselineRelativeQuantityCalculator *)self->_baselineCalculator mostRecentSupplementarySampleStartTimeForSourceID:v8];
  if (v20 >= v21) {
    double v21 = v20;
  }
  unint64_t v22 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithStart:end:", v21, v13);
  uint8x8_t v23 = [(HDRollingBaselineRelativeDataSource *)self _predicateForSamplesStartingWithinDateInterval:v22 sourceID:a3->var3 isIntervalStartDateInclusive:0];
  uint64_t v31 = 0;
  unint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __121__HDRollingBaselineRelativeDataSource__supplementCalculatorWithSubsequentSamplesForSample_baselineCompatibilityID_error___block_invoke;
  v28[3] = &unk_1E630B168;
  v28[4] = self;
  id v29 = v8;
  float v30 = &v31;
  BOOL v25 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:v23 profile:WeakRetained options:0 error:a5 handler:v28];

  BOOL v26 = v25 || *((unsigned char *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);

LABEL_16:
  return v26;
}

uint64_t __121__HDRollingBaselineRelativeDataSource__supplementCalculatorWithSubsequentSamplesForSample_baselineCompatibilityID_error___block_invoke(void *a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  [*(id *)(a1[4] + 16) addSupplementarySampleValue:a1[5] startTime:a4 sourceID:a2];
  if ([*(id *)(a1[4] + 16) hasSufficientDataToBaselineSampleWithSourceID:a1[5]])
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    return 0;
  }
  else
  {
    double v14 = (void *)a1[4];
    return [v14 _shouldContinueWithError:a11];
  }
}

- (BOOL)_shouldContinueWithError:(id *)a3
{
  shouldContinueHandler = (uint64_t (**)(id, id *))self->_shouldContinueHandler;
  if (shouldContinueHandler) {
    return shouldContinueHandler[2](shouldContinueHandler, a3);
  }
  else {
    return 1;
  }
}

- (id)_predicateForSamplesStartingWithinDateInterval:(id)a3 sourceID:(int64_t)a4 isIntervalStartDateInclusive:(BOOL)a5
{
  BOOL v5 = a5;
  v19[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = HDSampleEntityPredicateForDataType(self->_quantityType);
  v10 = [v8 endDate];
  double v11 = HDSampleEntityPredicateForStartDate(3);

  double v12 = [v8 startDate];
  if (v5) {
    HDSampleEntityPredicateForStartDate(6);
  }
  else {
  double v13 = HDSampleEntityPredicateForStartDate(5);
  }

  double v14 = [(_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *)self->_canonicalSourceMap predicateForDataEntitiesWithSourceIDsCompatibleWithSourceID:a4];
  unint64_t v15 = (void *)MEMORY[0x1E4F65D08];
  v19[0] = v9;
  v19[1] = v11;
  _OWORD v19[2] = v13;
  v19[3] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  uint64_t v17 = [v15 predicateMatchingAllPredicates:v16];

  return v17;
}

- (BOOL)_couldSampleEverResolveToDeterminateValue:(HDRawQuantitySample *)a3
{
  v4 = self;
  [(NSDate *)self->_currentDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  double var1 = a3->var1;
  id v8 = [(HDRollingBaselineRelativeQuantityCalculator *)v4->_baselineCalculator configuration];
  [v8 maximumWindowDuration];
  LOBYTE(v4) = v6 - var1 <= v9;

  return (char)v4;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (id)shouldContinueHandler
{
  return self->_shouldContinueHandler;
}

- (void)setShouldContinueHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldContinueHandler, 0);
  objc_destroyWeak((id *)&self->_profile);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::~__hash_table((uint64_t)&self->_prefetchedSamplesByBaselineCompatibilityID);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_canonicalSourceMap, 0);
  objc_storeStrong((id *)&self->_baselineCalculator, 0);

  objc_storeStrong((id *)&self->_quantityType, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end