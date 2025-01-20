@interface HDStatisticsCollectionCalculatorDefaultDataSource
+ (uint64_t)_addValueForQuantitySample:(void *)a3 calculator:(uint64_t)a4 error:;
- (BOOL)addValuesForQuantitySamples:(id)a3 calculator:(id)a4 includeSeries:(BOOL)a5 error:(id *)a6;
- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7;
- (BOOL)includeUnfrozenSeries;
- (HDProfile)profile;
- (HDSQLitePredicate)predicate;
- (HKQuantityType)quantityType;
- (NSNumber)anchor;
- (NSNumber)maxRowID;
- (NSSet)restrictedSourceEntities;
- (_HKFilter)filter;
- (id)initForProfile:(id)a3 categoryType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6;
- (id)initForProfile:(id)a3 quantityType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6;
- (id)shouldContinueHandler;
- (int64_t)shouldContinueFrequency;
- (uint64_t)_addValuesForQuantitySamples:(void *)a3 calculator:(char)a4 requiresSeriesValues:(void *)a5 transaction:(uint64_t)a6 error:;
- (void)_updateFullPredicate;
- (void)setAnchor:(id)a3;
- (void)setFilter:(id)a3;
- (void)setIncludeUnfrozenSeries:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setRestrictedSourceEntities:(id)a3;
- (void)setShouldContinueFrequency:(int64_t)a3;
- (void)setShouldContinueHandler:(id)a3;
@end

@implementation HDStatisticsCollectionCalculatorDefaultDataSource

- (id)initForProfile:(id)a3 quantityType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HDStatisticsCollectionCalculatorDefaultDataSource;
  v14 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)&v25 init];
  uint64_t v15 = (uint64_t)v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    uint64_t v16 = [v11 copy];
    v17 = *(void **)(v15 + 32);
    *(void *)(v15 + 32) = v16;

    uint64_t v18 = [v12 copy];
    v19 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v18;

    uint64_t v20 = [v13 copy];
    v21 = *(void **)(v15 + 48);
    *(void *)(v15 + 48) = v20;

    *(unsigned char *)(v15 + 16) = 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [*(id *)(v15 + 32) underlyingSampleType];
      v23 = objc_msgSend(MEMORY[0x1E4F2B3B8], "_quantityTypeWithCode:", objc_msgSend(v22, "code"));
      *(unsigned char *)(v15 + 16) = v23 != 0;
    }
    -[HDStatisticsCollectionCalculatorDefaultDataSource _updateFullPredicate](v15);
  }

  return (id)v15;
}

- (void)_updateFullPredicate
{
  if (a1)
  {
    id v8 = *(id *)(a1 + 32);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = [v8 underlyingSampleType];

      id v8 = (id)v2;
    }
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = HDSampleEntityPredicateForDataType(v8);
    [v3 addObject:v4];

    if ([*(id *)(a1 + 48) count])
    {
      v5 = HDDataEntityPredicateForSourceEntitySet(7, *(void **)(a1 + 48));
      [v3 addObject:v5];
    }
    if (*(void *)(a1 + 40)) {
      objc_msgSend(v3, "addObject:");
    }
    uint64_t v6 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v3];
    v7 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v6;
  }
}

- (id)initForProfile:(id)a3 categoryType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F2B618];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v10 countUnit];
  uint64_t v16 = +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:v13 aggregationStyle:1 canonicalUnit:v15];

  id v17 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)self initForProfile:v14 quantityType:v16 predicate:v12 restrictedSourceEntities:v11];
  return v17;
}

- (void)setRestrictedSourceEntities:(id)a3
{
  v4 = (NSSet *)[a3 copy];
  restrictedSourceEntities = self->_restrictedSourceEntities;
  self->_restrictedSourceEntities = v4;

  -[HDStatisticsCollectionCalculatorDefaultDataSource _updateFullPredicate]((uint64_t)self);
}

- (void)setPredicate:(id)a3
{
  v4 = (HDSQLitePredicate *)[a3 copy];
  predicate = self->_predicate;
  self->_predicate = v4;

  -[HDStatisticsCollectionCalculatorDefaultDataSource _updateFullPredicate]((uint64_t)self);
}

- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7
{
  v52[3] = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v11 = a4;
  id v37 = a6;
  id v12 = a7;
  id v13 = self->_fullPredicate;
  if (v11)
  {
    quantityType = self->_quantityType;
    uint64_t v15 = [v11 startDate];
    uint64_t v16 = [(HKQuantityType *)quantityType _earliestAllowedStartDateForSampleOverlappingDate:v15];

    id v17 = [v11 endDate];
    uint64_t v18 = HDSampleEntityPredicateForStartDate(3);

    v19 = [v11 startDate];
    uint64_t v20 = HDSampleEntityPredicateForEndDate(6);

    v52[0] = self->_fullPredicate;
    v52[1] = v18;
    v52[2] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
    if (v16)
    {
      v22 = HDSampleEntityPredicateForStartDate(6);
      uint64_t v23 = [v21 arrayByAddingObject:v22];

      v21 = (void *)v23;
    }
    uint64_t v24 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v21];

    id v13 = (HDSQLitePredicate *)v24;
  }
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = -1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v26 = [WeakRetained database];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __124__HDStatisticsCollectionCalculatorDefaultDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke;
  v39[3] = &unk_1E630E320;
  v39[4] = self;
  v27 = v13;
  v40 = v27;
  v43 = v47;
  v44 = &v48;
  v45 = v46;
  id v28 = v12;
  id v41 = v28;
  id v29 = v37;
  id v42 = v29;
  BOOL v30 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v26 error:a5 block:v39];

  if (v30)
  {
    anchor = self->_anchor;
    if (!anchor || (uint64_t v32 = v49[3], v32 > [(NSNumber *)anchor longLongValue]))
    {
      v33 = [NSNumber numberWithLongLong:v49[3]];
      v34 = self->_anchor;
      self->_anchor = v33;
    }
  }

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v48, 8);

  return v30;
}

uint64_t __124__HDStatisticsCollectionCalculatorDefaultDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v63[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v6 = [WeakRetained database];
  id v53 = 0;
  v7 = +[HDHealthEntity maxRowIDForPredicate:0 healthDatabase:v6 error:&v53];
  id v8 = v53;

  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (!v9)
  {
    if (a3)
    {
      uint64_t v25 = 0;
      *a3 = v8;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v25 = 0;
    }
    goto LABEL_22;
  }
  v46 = a3;
  uint64_t v10 = *(void *)(a1 + 32);
  if (!*(void *)(v10 + 64)) {
    goto LABEL_9;
  }
  uint64_t v11 = [v7 longLongValue];
  if (v11 > [*(id *)(*(void *)(a1 + 32) + 64) longLongValue])
  {
    uint64_t v10 = *(void *)(a1 + 32);
LABEL_9:
    objc_storeStrong((id *)(v10 + 64), v7);
  }
  id v47 = v8;
  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(a1 + 40);
  uint64_t v15 = *(void **)(v13 + 32);
  uint64_t v16 = *(void **)(v13 + 88);
  int v17 = *(unsigned __int8 *)(v13 + 16);
  int v18 = *(unsigned __int8 *)(v13 + 17);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __124__HDStatisticsCollectionCalculatorDefaultDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2;
  v48[3] = &unk_1E630E2F8;
  v48[4] = v13;
  long long v51 = *(_OWORD *)(a1 + 64);
  uint64_t v52 = *(void *)(a1 + 80);
  id v49 = *(id *)(a1 + 48);
  id v50 = *(id *)(a1 + 56);
  id v19 = v15;
  id v20 = v16;
  v21 = v48;
  id v22 = v14;
  id v23 = v12;
  self;
  if (v17)
  {
    if (v18) {
      uint64_t v24 = 5;
    }
    else {
      uint64_t v24 = 1;
    }
    uint64_t v54 = MEMORY[0x1E4F143A8];
    uint64_t v55 = 3221225472;
    v56 = __154__HDStatisticsCollectionCalculatorDefaultDataSource__enumerateWithProfile_quantityType_predicate_filter_isQuantityType_includeUnfrozenSeries_error_block___block_invoke;
    v57 = &unk_1E630E348;
    id v58 = v20;
    v59 = v21;
    uint64_t v25 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesBySeriesForPredicate:v22 profile:v23 options:v24 error:v46 handler:&v54];

    id v26 = v58;
    v27 = v21;
    id v8 = v47;
  }
  else
  {
    id v26 = v23;
    v43 = v21;
    id v41 = v21;
    id v42 = v22;
    id v45 = v19;
    id v28 = v19;
    self;
    v63[0] = @"data_provenances.source_id";
    v63[1] = @"start_date";
    v63[2] = @"end_date";
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:3];
    uint64_t v40 = [v29 indexOfObject:@"data_provenances.source_id"];
    uint64_t v39 = [v29 indexOfObject:@"start_date"];
    uint64_t v30 = [v29 indexOfObject:@"end_date"];
    v31 = (void *)[v28 dataObjectClass];

    uint64_t v32 = objc_msgSend((id)objc_msgSend(v31, "hd_dataEntityClass"), "entityClassForEnumeration");
    v33 = [v32 syntheticQuantityColumnName];
    id v8 = v47;
    id v44 = v23;
    if (v33)
    {
      uint64_t v34 = [v29 arrayByAddingObject:v33];

      id v29 = (void *)v34;
    }
    v35 = [v26 database];
    uint64_t v54 = MEMORY[0x1E4F143A8];
    uint64_t v55 = 3221225472;
    v56 = __120__HDStatisticsCollectionCalculatorDefaultDataSource__enumerateSampleTypeWithProfile_quantityType_predicate_error_block___block_invoke;
    v57 = &unk_1E630E370;
    uint64_t v60 = v39;
    uint64_t v61 = v30;
    uint64_t v62 = v40;
    id v58 = v33;
    v59 = v41;
    id v36 = v41;
    id v37 = v33;
    uint64_t v25 = [v32 enumerateProperties:v29 withPredicate:v42 healthDatabase:v35 error:v46 enumerationHandler:&v54];

    id v19 = v45;
    v27 = v43;
    id v23 = v44;
  }

LABEL_22:
  return v25;
}

uint64_t __124__HDStatisticsCollectionCalculatorDefaultDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2(void *a1, uint64_t a2, __n128 a3, __n128 a4, __n128 a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unint64_t v12 = a5.n128_u64[0];
  double v13 = a3.n128_f64[0];
  uint64_t v16 = a1[4];
  uint64_t v17 = *(void *)(v16 + 72);
  if (v17 >= 1)
  {
    uint64_t v18 = *(void *)(v16 + 80);
    if (v18)
    {
      uint64_t v19 = *(void *)(a1[7] + 8);
      uint64_t v20 = *(void *)(v19 + 24);
      if (v20 >= v17)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v18, a10);
        *(void *)(*(void *)(a1[7] + 8) + 24) = 0;
        ++*(void *)(*(void *)(a1[7] + 8) + 24);
        if (!result) {
          return result;
        }
      }
      else
      {
        *(void *)(v19 + 24) = v20 + 1;
      }
    }
  }
  uint64_t v22 = *(void *)(a1[8] + 8);
  if (*(void *)(v22 + 24) < a2) {
    *(void *)(v22 + 24) = a2;
  }
  uint64_t v23 = *(void *)(a1[9] + 8);
  if (*(void *)(v23 + 24) != a2)
  {
    if (v13 != a6)
    {
      (*(void (**)(double))(a1[5] + 16))(v13);
      uint64_t v23 = *(void *)(a1[9] + 8);
    }
    *(void *)(v23 + 24) = a2;
  }
  uint64_t v24 = *(uint64_t (**)(__n128, __n128, __n128))(a1[6] + 16);
  a3.n128_u64[0] = v12;
  a4.n128_f64[0] = a6;
  a5.n128_f64[0] = a7;

  return v24(a3, a4, a5);
}

uint64_t __154__HDStatisticsCollectionCalculatorDefaultDataSource__enumerateWithProfile_quantityType_predicate_filter_isQuantityType_includeUnfrozenSeries_error_block___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  if (!objc_msgSend(MEMORY[0x1E4F2B8E8], "filter:acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:", *(void *)(a1 + 32), a5, a6))return 1; {
  uint64_t v17 = *(uint64_t (**)(__n128, __n128, __n128, __n128, __n128))(*(void *)(a1 + 40) + 16);
  }
  v12.n128_f64[0] = a2;
  v13.n128_f64[0] = a3;
  v14.n128_f64[0] = a4;
  v15.n128_f64[0] = a5;
  v16.n128_f64[0] = a6;

  return v17(v12, v13, v14, v15, v16);
}

uint64_t __120__HDStatisticsCollectionCalculatorDefaultDataSource__enumerateSampleTypeWithProfile_quantityType_predicate_error_block___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v6 = MEMORY[0x1C1879F40](a4, a1[6]);
  double v7 = MEMORY[0x1C1879F40](a4, a1[7]);
  HDSQLiteColumnAsInt64();
  if (a1[4])
  {
    HDSQLiteColumnWithNameAsDouble();
    v10.n128_u64[0] = v8.n128_u64[0];
  }
  else
  {
    v10.n128_u64[0] = 0;
  }
  __n128 v13 = *(uint64_t (**)(__n128, __n128, __n128, __n128, __n128))(a1[5] + 16);
  v8.n128_f64[0] = v6;
  v9.n128_f64[0] = v7;
  v11.n128_f64[0] = v6;
  v12.n128_f64[0] = v7;

  return v13(v8, v9, v10, v11, v12);
}

- (BOOL)addValuesForQuantitySamples:(id)a3 calculator:(id)a4 includeSeries:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (!v7) {
    goto LABEL_4;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__HDStatisticsCollectionCalculatorDefaultDataSource_addValuesForQuantitySamples_calculator_includeSeries_error___block_invoke;
  v20[3] = &unk_1E630E398;
  v20[4] = self;
  __n128 v12 = objc_msgSend(v10, "hk_firstObjectPassingTest:", v20);

  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    __n128 v14 = [WeakRetained database];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __112__HDStatisticsCollectionCalculatorDefaultDataSource_addValuesForQuantitySamples_calculator_includeSeries_error___block_invoke_2;
    v17[3] = &unk_1E62F5A88;
    v17[4] = self;
    id v18 = v10;
    id v19 = v11;
    char v15 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 error:a6 block:v17];
  }
  else
  {
LABEL_4:
    char v15 = -[HDStatisticsCollectionCalculatorDefaultDataSource _addValuesForQuantitySamples:calculator:requiresSeriesValues:transaction:error:]((uint64_t)self, v10, v11, 0, 0, (uint64_t)a6);
  }

  return v15;
}

BOOL __112__HDStatisticsCollectionCalculatorDefaultDataSource_addValuesForQuantitySamples_calculator_includeSeries_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 quantityType];
  if ([v4 isEqual:*(void *)(*(void *)(a1 + 32) + 32)]) {
    BOOL v5 = [v3 count] > 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __112__HDStatisticsCollectionCalculatorDefaultDataSource_addValuesForQuantitySamples_calculator_includeSeries_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDStatisticsCollectionCalculatorDefaultDataSource _addValuesForQuantitySamples:calculator:requiresSeriesValues:transaction:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), 1, a2, a3);
}

- (uint64_t)_addValuesForQuantitySamples:(void *)a3 calculator:(char)a4 requiresSeriesValues:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  if (a1)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __132__HDStatisticsCollectionCalculatorDefaultDataSource__addValuesForQuantitySamples_calculator_requiresSeriesValues_transaction_error___block_invoke;
    v16[3] = &unk_1E630E3C0;
    id v17 = v11;
    uint64_t v18 = a1;
    char v21 = a4;
    id v19 = v12;
    id v20 = v13;
    uint64_t v14 = [v19 performAddSampleTransaction:v16 error:a6];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t __132__HDStatisticsCollectionCalculatorDefaultDataSource__addValuesForQuantitySamples_calculator_requiresSeriesValues_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v49 count:16];
  unsigned int v25 = 1;
  if (!v4) {
    goto LABEL_27;
  }
  uint64_t v5 = *(void *)v28;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v28 != v5) {
        objc_enumerationMutation(v3);
      }
      BOOL v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      __n128 v8 = [v7 quantityType];
      int v9 = [v8 isEqual:*(void *)(*(void *)(a1 + 40) + 32)];

      if (!v9) {
        continue;
      }
      id v10 = *(void **)(a1 + 48);
      if (!*(unsigned char *)(a1 + 64))
      {
        if (!+[HDStatisticsCollectionCalculatorDefaultDataSource _addValueForQuantitySample:calculator:error:]((uint64_t)HDStatisticsCollectionCalculatorDefaultDataSource, v7, *(void **)(a1 + 48), (uint64_t)a2))goto LABEL_26; {
        continue;
        }
      }
      id v11 = *(void **)(a1 + 56);
      id v12 = v7;
      id v13 = v10;
      id v14 = v11;
      uint64_t v15 = self;
      if ([v12 count] == 1)
      {
        char v16 = +[HDStatisticsCollectionCalculatorDefaultDataSource _addValueForQuantitySample:calculator:error:](v15, v12, v13, (uint64_t)a2);

        goto LABEL_22;
      }
      uint64_t v43 = 0;
      id v44 = &v43;
      uint64_t v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__204;
      id v47 = __Block_byref_object_dispose__204;
      id v48 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 1;
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      uint64_t v38 = 0;
      [v12 _startTimestamp];
      uint64_t v38 = v17;
      uint64_t v18 = [v12 UUID];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __115__HDStatisticsCollectionCalculatorDefaultDataSource__addValueForQuantitySeriesSample_calculator_transaction_error___block_invoke;
      v31[3] = &unk_1E630E3E8;
      uint64_t v34 = v37;
      v35 = &v39;
      id v19 = v13;
      id v32 = v19;
      id v20 = v12;
      id v33 = v20;
      id v36 = &v43;
      BOOL v21 = +[HDQuantitySampleSeriesEntity enumerateDataWithIdentifier:v18 transaction:v14 error:a2 handler:v31];

      if (!v21) {
        goto LABEL_20;
      }
      if (!*((unsigned char *)v40 + 24))
      {
        id v22 = (id)v44[5];
        uint64_t v23 = v22;
        if (v22)
        {
          if (a2) {
            *a2 = v22;
          }
          else {
            _HKLogDroppedError();
          }
        }

LABEL_20:
        char v16 = 0;
        goto LABEL_21;
      }
      char v16 = 1;
LABEL_21:

      _Block_object_dispose(v37, 8);
      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&v43, 8);

LABEL_22:
      if ((v16 & 1) == 0)
      {
LABEL_26:
        unsigned int v25 = 0;
        goto LABEL_27;
      }
    }
    uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v49 count:16];
    if (v4) {
      continue;
    }
    break;
  }
  unsigned int v25 = 1;
LABEL_27:

  return v25;
}

+ (uint64_t)_addValueForQuantitySample:(void *)a3 calculator:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  self;
  __n128 v8 = [v7 quantity];
  int v9 = [v7 quantityType];
  id v10 = [v9 canonicalUnit];
  [v8 doubleValueForUnit:v10];
  double v12 = v11;

  id v13 = [v7 startDate];
  [v13 timeIntervalSinceReferenceDate];
  double v15 = v14;
  char v16 = [v7 endDate];
  [v16 timeIntervalSinceReferenceDate];
  double v18 = v17;
  id v19 = [v7 sourceRevision];

  id v20 = [v19 source];
  BOOL v21 = [v20 _sourceID];
  uint64_t v22 = objc_msgSend(v6, "addSampleValue:startTime:endTime:sourceID:error:", objc_msgSend(v21, "longLongValue"), a4, v12, v15, v18);

  return v22;
}

uint64_t __115__HDStatisticsCollectionCalculatorDefaultDataSource__addValueForQuantitySeriesSample_calculator_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasDuration])
  {
    [v3 timeInterval];
    double v5 = v4;
  }
  else
  {
    double v5 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  int v6 = [v3 hasDuration];
  [v3 timeInterval];
  double v8 = v7;
  if (v6)
  {
    [v3 duration];
    double v8 = v8 + v9;
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  id v10 = *(void **)(a1 + 32);
  [v3 value];
  double v12 = v11;
  id v13 = [*(id *)(a1 + 40) sourceRevision];
  double v14 = [v13 source];
  double v15 = [v14 _sourceID];
  uint64_t v16 = [v15 longLongValue];
  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v17 + 40);
  LOBYTE(v10) = [v10 addSampleValue:v16 startTime:&obj endTime:v12 sourceID:v5 error:v8];
  objc_storeStrong((id *)(v17 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v10;

  uint64_t v18 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  return v18;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (HDSQLitePredicate)predicate
{
  return self->_predicate;
}

- (NSSet)restrictedSourceEntities
{
  return self->_restrictedSourceEntities;
}

- (BOOL)includeUnfrozenSeries
{
  return self->_includeUnfrozenSeries;
}

- (void)setIncludeUnfrozenSeries:(BOOL)a3
{
  self->_includeUnfrozenSeries = a3;
}

- (NSNumber)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (NSNumber)maxRowID
{
  return self->_maxRowID;
}

- (int64_t)shouldContinueFrequency
{
  return self->_shouldContinueFrequency;
}

- (void)setShouldContinueFrequency:(int64_t)a3
{
  self->_shouldContinueFrequency = a3;
}

- (id)shouldContinueHandler
{
  return self->_shouldContinueHandler;
}

- (void)setShouldContinueHandler:(id)a3
{
}

- (_HKFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong(&self->_shouldContinueHandler, 0);
  objc_storeStrong((id *)&self->_maxRowID, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_restrictedSourceEntities, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_fullPredicate, 0);
}

@end