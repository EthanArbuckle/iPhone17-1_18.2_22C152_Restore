@interface HDMCRecentBasalBodyTemperatureRangeQuery
+ (id)recentRangeForAnalysisWithProfile:(id)a3;
- (HDMCRecentBasalBodyTemperatureRangeQuery)initWithProfile:(id)a3 sampleLimit:(int64_t)a4 upperQuantileBound:(double)a5 lowerQuantileBound:(double)a6;
- (id)_basalBodyTemperatureDescendingEndDateQueryWithTransaction:(uint64_t)a3 limit:;
- (id)_bbtType;
- (id)rangeWithError:(id *)a3;
- (uint64_t)enumerateValuesInTransaction:(uint64_t)a1 handler:(void *)a2 error:(void *)a3;
- (uint64_t)enumerateValuesWithHandler:(uint64_t)a3 error:;
- (void)accumulateSortedValuesWithError:(void *)a3@<X8>;
@end

@implementation HDMCRecentBasalBodyTemperatureRangeQuery

- (HDMCRecentBasalBodyTemperatureRangeQuery)initWithProfile:(id)a3 sampleLimit:(int64_t)a4 upperQuantileBound:(double)a5 lowerQuantileBound:(double)a6
{
  id v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDMCRecentBasalBodyTemperatureRangeQuery;
  v12 = [(HDMCRecentBasalBodyTemperatureRangeQuery *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_profile, v11);
    v13->_sampleLimit = a4;
    v13->_upperQuantileBound = a5;
    v13->_lowerQuantileBound = a6;
    if (HKCompareDoubles() != -1)
    {
      v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:a2, v13, @"HDMCRecentBasalBodyTemperatureRangeQuery.mm", 111, @"Invalid parameter not satisfying: %@", @"HKCompareDoubles(upperQuantileBound, 1.0) == NSOrderedAscending" object file lineNumber description];
    }
    if (HKCompareDoubles() == -1)
    {
      v16 = [MEMORY[0x263F08690] currentHandler];
      [v16 handleFailureInMethod:a2, v13, @"HDMCRecentBasalBodyTemperatureRangeQuery.mm", 112, @"Invalid parameter not satisfying: %@", @"HKCompareDoubles(lowerQuantileBound, 0.0) != NSOrderedAscending" object file lineNumber description];
    }
    if (HKCompareDoubles() == 1)
    {
      v17 = [MEMORY[0x263F08690] currentHandler];
      [v17 handleFailureInMethod:a2, v13, @"HDMCRecentBasalBodyTemperatureRangeQuery.mm", 113, @"Invalid parameter not satisfying: %@", @"HKCompareDoubles(lowerQuantileBound, upperQuantileBound) != NSOrderedDescending" object file lineNumber description];
    }
  }

  return v13;
}

- (id)rangeWithError:(id *)a3
{
  id v20 = 0;
  [(HDMCRecentBasalBodyTemperatureRangeQuery *)(uint64_t)self accumulateSortedValuesWithError:&__p];
  id v5 = v20;
  uint64_t v6 = v22 - (unsigned char *)__p;
  if (v22 != __p)
  {
    double upperQuantileBound = self->_upperQuantileBound;
    double lowerQuantileBound = self->_lowerQuantileBound;
    v9 = [HDMCRecentBasalBodyTemperatureRange alloc];
    double v10 = (double)(v6 >> 3);
    signed int v11 = vcvtmd_s64_f64(lowerQuantileBound * v10);
    double v12 = *((double *)__p + (int)vcvtmd_s64_f64(upperQuantileBound * v10));
    double v13 = *((double *)__p + (int)vcvtmd_s64_f64(v10 * 0.5));
    double v14 = *((double *)__p + v11);
    v15 = -[HDMCRecentBasalBodyTemperatureRangeQuery _bbtType](self);
    id v16 = [v15 canonicalUnit];
    id v17 = [(HDMCRecentBasalBodyTemperatureRange *)v9 _initWithUpperQuantileValue:v16 medianValue:v12 lowerQuantileValue:v13 unit:v14];
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 11, @"Could not compute a range due to no values");
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v18;
  if (v18)
  {
    if (a3)
    {
      id v16 = v18;
      id v17 = 0;
      *a3 = v16;
      v15 = v16;
      goto LABEL_8;
    }
    _HKLogDroppedError();
  }
  id v17 = 0;
  v15 = v16;
LABEL_8:

  if (__p)
  {
    v22 = __p;
    operator delete(__p);
  }

  return v17;
}

- (void)accumulateSortedValuesWithError:(void *)a3@<X8>
{
  if (a1)
  {
    uint64_t v13 = 0;
    double v14 = &v13;
    uint64_t v15 = 0x4812000000;
    id v16 = __Block_byref_object_copy__8;
    id v17 = __Block_byref_object_dispose__8;
    id v18 = &unk_2257B4DE7;
    id v20 = 0;
    uint64_t v21 = 0;
    __p = 0;
    id v11 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__HDMCRecentBasalBodyTemperatureRangeQuery_accumulateSortedValuesWithError___block_invoke;
    v12[3] = &unk_2647510C8;
    v12[4] = &v13;
    int v5 = -[HDMCRecentBasalBodyTemperatureRangeQuery enumerateValuesWithHandler:error:](a1, v12, (uint64_t)&v11);
    id v6 = v11;
    v7 = v6;
    if (v5)
    {
      std::__sort<std::__less<double,double> &,double *>();
      v8 = v14;
      a3[1] = 0;
      a3[2] = 0;
      *a3 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a3, (const void *)v8[6], v8[7], (v8[7] - v8[6]) >> 3);
    }
    else
    {
      id v9 = v6;
      double v10 = v9;
      if (v9)
      {
        if (a2) {
          *a2 = v9;
        }
        else {
          _HKLogDroppedError();
        }
      }

      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
    }

    _Block_object_dispose(&v13, 8);
    if (__p)
    {
      id v20 = __p;
      operator delete(__p);
    }
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
}

- (id)_bbtType
{
  if (a1)
  {
    a1 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09C00]];
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t __76__HDMCRecentBasalBodyTemperatureRangeQuery_accumulateSortedValuesWithError___block_invoke(uint64_t a1, double a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v4 = (double *)v3[7];
  unint64_t v5 = v3[8];
  if ((unint64_t)v4 >= v5)
  {
    v7 = (double *)v3[6];
    uint64_t v8 = v4 - v7;
    if ((unint64_t)(v8 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = v5 - (void)v7;
    unint64_t v10 = (uint64_t)(v5 - (void)v7) >> 2;
    if (v10 <= v8 + 1) {
      unint64_t v10 = v8 + 1;
    }
    if (v9 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    if (v11)
    {
      double v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(v3 + 8), v11);
      v7 = (double *)v3[6];
      v4 = (double *)v3[7];
    }
    else
    {
      double v12 = 0;
    }
    uint64_t v13 = (double *)&v12[8 * v8];
    double v14 = &v12[8 * v11];
    double *v13 = a2;
    id v6 = v13 + 1;
    while (v4 != v7)
    {
      uint64_t v15 = *((void *)v4-- - 1);
      *((void *)v13-- - 1) = v15;
    }
    v3[6] = v13;
    v3[7] = v6;
    v3[8] = v14;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    double *v4 = a2;
    id v6 = v4 + 1;
  }
  v3[7] = v6;
  return 1;
}

- (uint64_t)enumerateValuesWithHandler:(uint64_t)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = (void *)MEMORY[0x263F432E8];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v8 = [WeakRetained database];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __77__HDMCRecentBasalBodyTemperatureRangeQuery_enumerateValuesWithHandler_error___block_invoke;
    v11[3] = &unk_2647510F0;
    v11[4] = a1;
    id v12 = v5;
    uint64_t v9 = [v6 performReadTransactionWithHealthDatabase:v8 error:a3 block:v11];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __77__HDMCRecentBasalBodyTemperatureRangeQuery_enumerateValuesWithHandler_error___block_invoke(uint64_t a1, void *a2)
{
  return -[HDMCRecentBasalBodyTemperatureRangeQuery enumerateValuesInTransaction:handler:error:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40));
}

- (uint64_t)enumerateValuesInTransaction:(uint64_t)a1 handler:(void *)a2 error:(void *)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = -[HDMCRecentBasalBodyTemperatureRangeQuery _basalBodyTemperatureDescendingEndDateQueryWithTransaction:limit:](a1, v5, *(void *)(a1 + 16));
    v15[0] = *MEMORY[0x263F43070];
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    id v14 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __87__HDMCRecentBasalBodyTemperatureRangeQuery_enumerateValuesInTransaction_handler_error___block_invoke;
    v12[3] = &unk_264751118;
    id v13 = v6;
    uint64_t v9 = [v7 enumerateProperties:v8 error:&v14 enumerationHandler:v12];
    id v10 = v14;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_basalBodyTemperatureDescendingEndDateQueryWithTransaction:(uint64_t)a3 limit:
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    id v6 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09C00]];
    v7 = HDSampleEntityPredicateForDataType();

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v5 databaseForEntityClass:v8];
    id v10 = [MEMORY[0x263F434C8] orderingTermWithProperty:*MEMORY[0x263F43080] entityClass:objc_opt_class() ascending:0];
    v14[0] = v10;
    unint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

    id v12 = [v8 queryWithDatabase:v9 predicate:v7 limit:a3 orderingTerms:v11 groupBy:0];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __87__HDMCRecentBasalBodyTemperatureRangeQuery_enumerateValuesInTransaction_handler_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22A634700](a3, 0);
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

+ (id)recentRangeForAnalysisWithProfile:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (id *)MEMORY[0x263F09930];
  id v6 = *MEMORY[0x263F09930];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x263F09930]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_225722000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "recentRangeForAnalysis", "", buf, 2u);
  }
  v7 = (void *)[objc_alloc((Class)a1) initWithProfile:v4 sampleLimit:90 upperQuantileBound:0.9 lowerQuantileBound:0.1];
  id v16 = 0;
  uint64_t v8 = [v7 rangeWithError:&v16];
  id v9 = v16;
  id v10 = v9;
  if (!v8 && (objc_msgSend(v9, "hk_isHealthKitErrorWithCode:", 11) & 1) == 0)
  {
    _HKInitializeLogging();
    unint64_t v11 = *v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_opt_class();
      +[HDMCRecentBasalBodyTemperatureRangeQuery recentRangeForAnalysisWithProfile:](v12, (uint64_t)v10, (uint64_t)buf, v11);
    }
  }
  _HKInitializeLogging();
  id v13 = *v5;
  if (os_signpost_enabled((os_log_t)*v5))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_225722000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "recentRangeForAnalysis", "", v15, 2u);
  }

  return v8;
}

- (void).cxx_destruct
{
}

+ (void)recentRangeForAnalysisWithProfile:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  id v6 = a1;
  _os_log_error_impl(&dword_225722000, a4, OS_LOG_TYPE_ERROR, "[%{public}@] Error querying recent BBT range: %{public}@", (uint8_t *)a3, 0x16u);
}

@end