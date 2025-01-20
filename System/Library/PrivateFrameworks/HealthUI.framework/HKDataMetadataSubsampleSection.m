@interface HKDataMetadataSubsampleSection
+ (id)displayNameForSampleType:(id)a3 displayTypeController:(id)a4;
- (BOOL)showOnlyExertion;
- (HKDataMetadataSubsampleDelegate)subsampleDelegate;
- (HKDataMetadataSubsampleSection)initWithSample:(id)a3 workoutActivity:(id)a4 subSampleTypes:(id)a5 showOnlyExertion:(BOOL)a6 healthStore:(id)a7 displayTypeController:(id)a8 unitController:(id)a9 subsampleDelegate:(id)a10;
- (HKDisplayTypeController)displayTypeController;
- (HKHealthStore)healthStore;
- (HKSample)sample;
- (HKUnitPreferenceController)unitController;
- (HKWorkoutActivity)workoutActivity;
- (NSArray)exertionSamples;
- (NSArray)subSampleTypes;
- (NSMutableDictionary)aggregationValue;
- (id)_allFixedValuesFromSamples:(id)a3 displayTypeController:(id)a4 unitController:(id)a5;
- (id)_fixedValuesfromSamples:(id)a3 ofExertionType:(id)a4 displayTypeController:(id)a5 unitController:(id)a6;
- (id)_formattedDisplayValueFromValue:(id)a3 exertionType:(id)a4 displayTypeController:(id)a5 unitController:(id)a6;
- (id)_formattedValueWithUnits:(id)a3 sampleType:(id)a4;
- (id)_localizedWorkoutEffortRatingFromValue:(id)a3 stringValue:(id)a4;
- (id)_mergeTypesForFixedValues:(id)a3 subSampleTypes:(id)a4;
- (id)_mostRelevantFixedValuesFromSamples:(id)a3 displayTypeController:(id)a4 unitController:(id)a5;
- (id)_subSampleAggregatePredicate:(id)a3;
- (id)_subSamplePredicateOnSelectCellForSampleType:(id)a3;
- (id)_subSampleTypesWithoutWorkoutEffort;
- (id)_trimAndSortSampleTypes:(id)a3;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
- (void)_exertionFixedValuesDisplayTypeController:(id)a3 unitController:(id)a4 healthStore:(id)a5 completion:(id)a6;
- (void)_submitAverageAggregateQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4;
- (void)_submitCountStandHourQueryForSampleType:(id)a3 aggregateQueryFinishedBlock:(id)a4;
- (void)_submitMaximumValueQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4;
- (void)_submitRangeValueQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4;
- (void)_submitRateOfExertionFixedValuesWithDisplayTypeController:(id)a3 unitController:(id)a4 healthStore:(id)a5 finishedBlock:(id)a6;
- (void)_submitSingleValueQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4;
- (void)_submitSubSampleAggregateQueriesWithCompletion:(id)a3;
- (void)_submitSumAggregateQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4;
- (void)_updateAggregateValue:(id)a3 sampleType:(id)a4 aggregateQueryFinishedBlock:(id)a5;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)setAggregationValue:(id)a3;
- (void)setExertionSamples:(id)a3;
- (void)setShowOnlyExertion:(BOOL)a3;
@end

@implementation HKDataMetadataSubsampleSection

- (HKDataMetadataSubsampleSection)initWithSample:(id)a3 workoutActivity:(id)a4 subSampleTypes:(id)a5 showOnlyExertion:(BOOL)a6 healthStore:(id)a7 displayTypeController:(id)a8 unitController:(id)a9 subsampleDelegate:(id)a10
{
  BOOL v12 = a6;
  id v34 = a3;
  id v32 = a4;
  id v33 = a5;
  id v31 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v37.receiver = self;
  v37.super_class = (Class)HKDataMetadataSubsampleSection;
  v20 = [(HKDataMetadataSubsampleSection *)&v37 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_sample, a3);
    objc_storeStrong((id *)&v21->_workoutActivity, a4);
    objc_storeStrong((id *)&v21->_healthStore, a7);
    objc_storeStrong((id *)&v21->_displayTypeController, a8);
    objc_storeStrong((id *)&v21->_unitController, a9);
    objc_storeWeak((id *)&v21->_subsampleDelegate, v19);
    v21->_showOnlyExertion = v12;
    v22 = [v34 fixedAggregateValuesWithDisplayTypeController:v17 unitController:v18];
    v23 = [v22 allKeys];
    uint64_t v24 = [(HKDataMetadataSubsampleSection *)v21 _mergeTypesForFixedValues:v23 subSampleTypes:v33];
    subSampleTypes = v21->_subSampleTypes;
    v21->_subSampleTypes = (NSArray *)v24;

    if (![(NSArray *)v21->_subSampleTypes count])
    {

      v29 = 0;
      goto LABEL_8;
    }
    if (v12)
    {
      v26 = v21->_subSampleTypes;
      v21->_subSampleTypes = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v22];
    aggregationValue = v21->_aggregationValue;
    v21->_aggregationValue = (NSMutableDictionary *)v27;

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __164__HKDataMetadataSubsampleSection_initWithSample_workoutActivity_subSampleTypes_showOnlyExertion_healthStore_displayTypeController_unitController_subsampleDelegate___block_invoke;
    v35[3] = &unk_1E6D50ED8;
    v36 = v21;
    [(HKDataMetadataSubsampleSection *)v36 _submitSubSampleAggregateQueriesWithCompletion:v35];
  }
  v29 = v21;
LABEL_8:

  return v29;
}

void __164__HKDataMetadataSubsampleSection_initWithSample_workoutActivity_subSampleTypes_showOnlyExertion_healthStore_displayTypeController_unitController_subsampleDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained finishedAggregateQuery];
}

- (void)_updateAggregateValue:(id)a3 sampleType:(id)a4 aggregateQueryFinishedBlock:(id)a5
{
  aggregationValue = self->_aggregationValue;
  v8 = (void (**)(void))a5;
  [(NSMutableDictionary *)aggregationValue setObject:a3 forKey:a4];
  v8[2]();
}

- (id)_formattedValueWithUnits:(id)a3 sampleType:(id)a4
{
  displayTypeController = self->_displayTypeController;
  id v7 = a3;
  v8 = [(HKDisplayTypeController *)displayTypeController displayTypeForObjectType:a4];
  v9 = [(HKUnitPreferenceController *)self->_unitController unitForDisplayType:v8];
  [v7 doubleValueForUnit:v9];
  double v11 = v10;

  BOOL v12 = [NSNumber numberWithDouble:v11];
  v13 = HKFormattedStringFromValueForContext(v12, v8, self->_unitController, 0, 0, 1);
  v14 = [(HKUnitPreferenceController *)self->_unitController localizedDisplayNameForDisplayType:v8];
  if (v14)
  {
    HKFormatValueAndUnit(v13, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = v13;
  }
  v16 = v15;

  return v16;
}

- (id)_subSampleAggregatePredicate:(id)a3
{
  p_subsampleDelegate = &self->_subsampleDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_subsampleDelegate);
  id v7 = [WeakRetained defaultPredicateForSampleType:v5];

  v8 = [(HKSample *)self->_sample subSamplePredicate];
  v9 = HKUIPredicateMatchingPredicates(v7, v8);

  return v9;
}

- (void)_submitSumAggregateQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKDataMetadataSubsampleSection *)self _subSampleAggregatePredicate:v6];
  id v9 = objc_alloc(MEMORY[0x1E4F2B5D0]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__HKDataMetadataSubsampleSection__submitSumAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke;
  v13[3] = &unk_1E6D569D0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  BOOL v12 = (void *)[v9 initWithQuantityType:v11 quantitySamplePredicate:v8 options:16 completionHandler:v13];
  [(HKHealthStore *)self->_healthStore executeQuery:v12];
  [(NSMutableDictionary *)self->_aggregationValue setObject:@" " forKey:v11];
}

void __102__HKDataMetadataSubsampleSection__submitSumAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 sumQuantity];
  id v5 = [*(id *)(a1 + 32) _formattedValueWithUnits:v4 sampleType:*(void *)(a1 + 40)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__HKDataMetadataSubsampleSection__submitSumAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2;
  v8[3] = &unk_1E6D518B0;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __102__HKDataMetadataSubsampleSection__submitSumAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAggregateValue:*(void *)(a1 + 40) sampleType:*(void *)(a1 + 48) aggregateQueryFinishedBlock:*(void *)(a1 + 56)];
}

- (void)_submitAverageAggregateQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKDataMetadataSubsampleSection *)self _subSampleAggregatePredicate:v6];
  id v9 = objc_alloc(MEMORY[0x1E4F2B5D0]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__HKDataMetadataSubsampleSection__submitAverageAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke;
  v13[3] = &unk_1E6D569D0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  BOOL v12 = (void *)[v9 initWithQuantityType:v11 quantitySamplePredicate:v8 options:2 completionHandler:v13];
  [(HKHealthStore *)self->_healthStore executeQuery:v12];
  [(NSMutableDictionary *)self->_aggregationValue setObject:@" " forKey:v11];
}

void __106__HKDataMetadataSubsampleSection__submitAverageAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 averageQuantity];
  id v5 = [*(id *)(a1 + 32) _formattedValueWithUnits:v4 sampleType:*(void *)(a1 + 40)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__HKDataMetadataSubsampleSection__submitAverageAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2;
  v8[3] = &unk_1E6D518B0;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __106__HKDataMetadataSubsampleSection__submitAverageAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAggregateValue:*(void *)(a1 + 40) sampleType:*(void *)(a1 + 48) aggregateQueryFinishedBlock:*(void *)(a1 + 56)];
}

- (void)_submitSingleValueQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKDataMetadataSubsampleSection *)self _subSampleAggregatePredicate:v6];
  id v9 = objc_alloc(MEMORY[0x1E4F2B440]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__HKDataMetadataSubsampleSection__submitSingleValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke;
  v13[3] = &unk_1E6D51368;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  BOOL v12 = (void *)[v9 initWithSampleType:v11 predicate:v8 limit:1 sortDescriptors:0 resultsHandler:v13];
  [(HKHealthStore *)self->_healthStore executeQuery:v12];
  [(NSMutableDictionary *)self->_aggregationValue setObject:@" " forKey:v11];
}

void __101__HKDataMetadataSubsampleSection__submitSingleValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 firstObject];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 quantity];
    id v7 = [*(id *)(a1 + 32) _formattedValueWithUnits:v6 sampleType:*(void *)(a1 + 40)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __101__HKDataMetadataSubsampleSection__submitSingleValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2;
    v10[3] = &unk_1E6D518B0;
    v8 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v7;
    id v12 = v8;
    id v13 = *(id *)(a1 + 48);
    id v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __101__HKDataMetadataSubsampleSection__submitSingleValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAggregateValue:*(void *)(a1 + 40) sampleType:*(void *)(a1 + 48) aggregateQueryFinishedBlock:*(void *)(a1 + 56)];
}

- (void)_submitMaximumValueQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKDataMetadataSubsampleSection *)self _subSampleAggregatePredicate:v6];
  id v9 = objc_alloc(MEMORY[0x1E4F2B5D0]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__HKDataMetadataSubsampleSection__submitMaximumValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke;
  v13[3] = &unk_1E6D569D0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = (void *)[v9 initWithQuantityType:v11 quantitySamplePredicate:v8 options:8 completionHandler:v13];
  [(HKHealthStore *)self->_healthStore executeQuery:v12];
  [(NSMutableDictionary *)self->_aggregationValue setObject:@" " forKey:v11];
}

void __102__HKDataMetadataSubsampleSection__submitMaximumValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 maximumQuantity];
  id v5 = [*(id *)(a1 + 32) _formattedValueWithUnits:v4 sampleType:*(void *)(a1 + 40)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__HKDataMetadataSubsampleSection__submitMaximumValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2;
  v8[3] = &unk_1E6D518B0;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __102__HKDataMetadataSubsampleSection__submitMaximumValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAggregateValue:*(void *)(a1 + 40) sampleType:*(void *)(a1 + 48) aggregateQueryFinishedBlock:*(void *)(a1 + 56)];
}

- (void)_submitRangeValueQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKDataMetadataSubsampleSection *)self _subSampleAggregatePredicate:v6];
  id v9 = objc_alloc(MEMORY[0x1E4F2B5D0]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__HKDataMetadataSubsampleSection__submitRangeValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke;
  v13[3] = &unk_1E6D569D0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = (void *)[v9 initWithQuantityType:v11 quantitySamplePredicate:v8 options:12 completionHandler:v13];
  [(HKHealthStore *)self->_healthStore executeQuery:v12];
  [(NSMutableDictionary *)self->_aggregationValue setObject:@" " forKey:v11];
}

void __100__HKDataMetadataSubsampleSection__submitRangeValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 maximumQuantity];
  id v6 = [v4 minimumQuantity];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 48) displayTypeForObjectType:*(void *)(a1 + 40)];
  v8 = [*(id *)(*(void *)(a1 + 32) + 56) unitForDisplayType:v7];
  id v9 = NSNumber;
  [v5 doubleValueForUnit:v8];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  id v11 = NSNumber;
  [v6 doubleValueForUnit:v8];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  id v13 = objc_alloc_init(HKInteractiveChartNumberRangeFormatter);
  id v14 = [(HKInteractiveChartNumberRangeFormatter *)v13 stringForMinimumValue:v12 maximumValue:v10 displayType:v7 unitPreferenceController:*(void *)(*(void *)(a1 + 32) + 56)];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __100__HKDataMetadataSubsampleSection__submitRangeValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2;
  v17[3] = &unk_1E6D518B0;
  id v15 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 32);
  id v18 = v14;
  id v19 = v15;
  id v20 = *(id *)(a1 + 48);
  id v16 = v14;
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

uint64_t __100__HKDataMetadataSubsampleSection__submitRangeValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAggregateValue:*(void *)(a1 + 40) sampleType:*(void *)(a1 + 48) aggregateQueryFinishedBlock:*(void *)(a1 + 56)];
}

- (void)_submitCountStandHourQueryForSampleType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__HKDataMetadataSubsampleSection__submitCountStandHourQueryForSampleType_aggregateQueryFinishedBlock___block_invoke;
  aBlock[3] = &unk_1E6D51368;
  aBlock[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = _Block_copy(aBlock);
  id v11 = [(HKDataMetadataSubsampleSection *)self _subSampleAggregatePredicate:v9];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F2B440]) initWithSampleType:v9 predicate:v11 limit:0 sortDescriptors:0 resultsHandler:v10];
  [(HKHealthStore *)self->_healthStore executeQuery:v12];
  [(NSMutableDictionary *)self->_aggregationValue setObject:@" " forKey:v9];
}

void __102__HKDataMetadataSubsampleSection__submitCountStandHourQueryForSampleType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) startDate];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) endDate];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setHour:1];
    id v19 = (void *)v6;
    id v20 = (void *)v5;
    id v8 = [MEMORY[0x1E4F2B958] calculateIncludedValuesWithSamples:v4 startDate:v5 endDate:v6 intervalComponents:v7];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          v11 += [v14 containsObject:&unk_1F3C22870];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v15 = [NSNumber numberWithInteger:v11];
    id v16 = HKLocalizedStringForNumberWithTemplate(v15, 1);

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__HKDataMetadataSubsampleSection__submitCountStandHourQueryForSampleType_aggregateQueryFinishedBlock___block_invoke_290;
    block[3] = &unk_1E6D518B0;
    id v17 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v22 = v16;
    id v23 = v17;
    id v24 = *(id *)(a1 + 48);
    id v18 = v16;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __102__HKDataMetadataSubsampleSection__submitCountStandHourQueryForSampleType_aggregateQueryFinishedBlock___block_invoke_290(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAggregateValue:*(void *)(a1 + 40) sampleType:*(void *)(a1 + 48) aggregateQueryFinishedBlock:*(void *)(a1 + 56)];
}

- (void)_submitSubSampleAggregateQueriesWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v24 = self;
  id v4 = self->_subSampleTypes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v25 = *(void *)v27;
    uint64_t v7 = *MEMORY[0x1E4F2A950];
    uint64_t v8 = *MEMORY[0x1E4F2A800];
    uint64_t v22 = *MEMORY[0x1E4F29770];
    uint64_t v23 = *MEMORY[0x1E4F2A800];
    unint64_t v9 = 0x1E4F2B000uLL;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
        uint64_t v12 = [*(id *)(v9 + 952) quantityTypeForIdentifier:v7];
        if (([v11 isEqual:v12] & 1) == 0)
        {
          [*(id *)(v9 + 952) quantityTypeForIdentifier:v8];
          id v14 = v13 = v9;
          char v15 = [v11 isEqual:v14];

          unint64_t v9 = v13;
          if (v15) {
            goto LABEL_15;
          }
          id v16 = v4;
          uint64_t v12 = [MEMORY[0x1E4F2B2C0] categoryTypeForIdentifier:v22];
          id v17 = [v11 identifier];
          id v18 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:v17];
          if (v18)
          {
            id v19 = [(NSMutableDictionary *)v24->_aggregationValue objectForKey:v11];
            if (!v19)
            {
              switch([v11 associatedSampleAggregationStyle])
              {
                case 1:
                  [(HKDataMetadataSubsampleSection *)v24 _submitSumAggregateQueryForQuantityType:v18 aggregateQueryFinishedBlock:v21];
                  break;
                case 2:
                  [(HKDataMetadataSubsampleSection *)v24 _submitAverageAggregateQueryForQuantityType:v18 aggregateQueryFinishedBlock:v21];
                  break;
                case 3:
                  [(HKDataMetadataSubsampleSection *)v24 _submitSingleValueQueryForQuantityType:v18 aggregateQueryFinishedBlock:v21];
                  break;
                case 4:
                  [(HKDataMetadataSubsampleSection *)v24 _submitMaximumValueQueryForQuantityType:v18 aggregateQueryFinishedBlock:v21];
                  break;
                case 5:
                  [(HKDataMetadataSubsampleSection *)v24 _submitRangeValueQueryForQuantityType:v18 aggregateQueryFinishedBlock:v21];
                  break;
                default:
                  break;
              }
            }

            unint64_t v9 = v13;
          }
          else if ([v12 isEqual:v11])
          {
            [(HKDataMetadataSubsampleSection *)v24 _submitCountStandHourQueryForSampleType:v11 aggregateQueryFinishedBlock:v21];
          }

          id v4 = v16;
          uint64_t v8 = v23;
        }

LABEL_15:
        ++v10;
      }
      while (v6 != v10);
      uint64_t v20 = [(NSArray *)v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v6 = v20;
    }
    while (v20);
  }

  [(HKDataMetadataSubsampleSection *)v24 _submitRateOfExertionFixedValuesWithDisplayTypeController:v24->_displayTypeController unitController:v24->_unitController healthStore:v24->_healthStore finishedBlock:v21];
}

- (id)_subSampleTypesWithoutWorkoutEffort
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_subSampleTypes];
  v3 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A950]];
  [v2 removeObject:v3];

  id v4 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A800]];
  [v2 removeObject:v4];

  return v2;
}

- (void)_submitRateOfExertionFixedValuesWithDisplayTypeController:(id)a3 unitController:(id)a4 healthStore:(id)a5 finishedBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HKDataMetadataSubsampleSection *)self sample];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __133__HKDataMetadataSubsampleSection__submitRateOfExertionFixedValuesWithDisplayTypeController_unitController_healthStore_finishedBlock___block_invoke;
    v16[3] = &unk_1E6D53038;
    v16[4] = self;
    id v17 = v13;
    [(HKDataMetadataSubsampleSection *)self _exertionFixedValuesDisplayTypeController:v10 unitController:v11 healthStore:v12 completion:v16];
  }
}

void __133__HKDataMetadataSubsampleSection__submitRateOfExertionFixedValuesWithDisplayTypeController_unitController_healthStore_finishedBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      _HKInitializeLogging();
      id v17 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR)) {
        __133__HKDataMetadataSubsampleSection__submitRateOfExertionFixedValuesWithDisplayTypeController_unitController_healthStore_finishedBlock___block_invoke_cold_1((uint64_t)v7, v17);
      }
    }
    id v18 = *(void **)(a1 + 32);
    goto LABEL_11;
  }
  _HKInitializeLogging();
  uint64_t v8 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v8;
    int v22 = 138543618;
    uint64_t v23 = v9;
    __int16 v24 = 1024;
    int v25 = [v5 count];
    _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched %i exertion values.", (uint8_t *)&v22, 0x12u);
  }
  uint64_t v11 = [v5 count];
  id v12 = *(void **)(a1 + 32);
  if (!v11)
  {
    id v18 = *(void **)(a1 + 32);
LABEL_11:
    uint64_t v19 = [v18 _subSampleTypesWithoutWorkoutEffort];
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = *(void **)(v20 + 32);
    *(void *)(v20 + 32) = v19;

    goto LABEL_12;
  }
  id v13 = [v5 allKeys];
  uint64_t v14 = [v12 _mergeTypesForFixedValues:v13 subSampleTypes:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 32);
  *(void *)(v15 + 32) = v14;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "hk_addEntriesFromNonNilDictionary:", v5);
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_exertionFixedValuesDisplayTypeController:(id)a3 unitController:(id)a4 healthStore:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(HKDataMetadataSubsampleSection *)self sample];
  id v13 = (void *)MEMORY[0x1E4F2B3C0];
  uint64_t v14 = [v12 UUID];
  uint64_t v15 = [v13 predicateForObjectWithUUID:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F2B790]);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke;
  __int16 v24 = &unk_1E6D569F8;
  int v25 = self;
  id v26 = v9;
  id v27 = v10;
  id v28 = v11;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  uint64_t v20 = (void *)[v16 initWithPredicate:v15 anchor:0 options:0 resultsHandler:&v21];
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v20, v21, v22, v23, v24, v25);
}

void __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [*(id *)(*(void *)(a1 + 32) + 40) stopQuery:a2];
  if (!v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_2;
    block[3] = &unk_1E6D52348;
    id v48 = *(id *)(a1 + 56);
    id v47 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);

    int v25 = v48;
    goto LABEL_25;
  }
  if (![v8 count])
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_3;
    v44[3] = &unk_1E6D52FB8;
    id v45 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], v44);
    int v25 = v45;
    goto LABEL_25;
  }
  id v34 = v9;
  id v35 = v8;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v41;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v41 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      id v16 = [*(id *)(a1 + 32) workoutActivity];
      if (v16)
      {
      }
      else
      {
        uint64_t v22 = [v15 samples];

        if (v22) {
          goto LABEL_14;
        }
      }
      uint64_t v17 = [*(id *)(a1 + 32) workoutActivity];
      if (v17)
      {
        id v18 = (void *)v17;
        id v19 = [*(id *)(a1 + 32) workoutActivity];
        uint64_t v20 = [v15 activity];
        int v21 = [v19 isEqual:v20];

        if (v21)
        {
LABEL_14:
          uint64_t v23 = [v15 samples];
          [v36 addObjectsFromArray:v23];

          continue;
        }
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v53 count:16];
  }
  while (v12);
LABEL_17:

  _HKInitializeLogging();
  __int16 v24 = *MEMORY[0x1E4F29FB8];
  int v25 = v36;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v50 = v26;
    __int16 v51 = 2112;
    id v52 = v36;
    _os_log_impl(&dword_1E0B26000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched samples %@", buf, 0x16u);
  }
  int v27 = [*(id *)(a1 + 32) showOnlyExertion];
  id v28 = *(void **)(a1 + 32);
  uint64_t v29 = *(void *)(a1 + 40);
  uint64_t v30 = *(void *)(a1 + 48);
  if (v27)
  {
    uint64_t v31 = [v28 _allFixedValuesFromSamples:v36 displayTypeController:v29 unitController:v30];
    [*(id *)(a1 + 32) setExertionSamples:v36];
  }
  else
  {
    uint64_t v31 = [v28 _mostRelevantFixedValuesFromSamples:v36 displayTypeController:v29 unitController:v30];
  }
  id v8 = v35;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_298;
  v37[3] = &unk_1E6D52348;
  id v32 = *(id *)(a1 + 56);
  id v38 = v31;
  id v39 = v32;
  id v33 = v31;
  dispatch_async(MEMORY[0x1E4F14428], v37);

  id v9 = v34;
LABEL_25:
}

uint64_t __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_298(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)_allFixedValuesFromSamples:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:304];
  uint64_t v12 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:298];
  uint64_t v13 = +[HKExertionUtilities filterSamplesOfExertionTypeCode:304 fromExertionSamples:v8];
  uint64_t v22 = (void *)v11;
  uint64_t v14 = [(HKDataMetadataSubsampleSection *)self _fixedValuesfromSamples:v13 ofExertionType:v11 displayTypeController:v9 unitController:v10];
  _HKInitializeLogging();
  uint64_t v15 = (NSObject **)MEMORY[0x1E4F29FB8];
  id v16 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    _os_log_impl(&dword_1E0B26000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received effort %@", buf, 0x16u);
  }
  uint64_t v17 = +[HKExertionUtilities filterSamplesOfExertionTypeCode:298 fromExertionSamples:v8];
  id v18 = [(HKDataMetadataSubsampleSection *)self _fixedValuesfromSamples:v17 ofExertionType:v12 displayTypeController:v9 unitController:v10];
  _HKInitializeLogging();
  id v19 = *v15;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    _os_log_impl(&dword_1E0B26000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received estimated %@", buf, 0x16u);
  }
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  objc_msgSend(v20, "hk_addEntriesFromNonNilDictionary:", v14);
  objc_msgSend(v20, "hk_addEntriesFromNonNilDictionary:", v18);

  return v20;
}

- (id)_fixedValuesfromSamples:(id)a3 ofExertionType:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = NSNumber;
        id v19 = [*(id *)(*((void *)&v25 + 1) + 8 * i) quantity];
        [v19 _value];
        uint64_t v20 = objc_msgSend(v18, "numberWithDouble:");

        int v21 = [(HKDataMetadataSubsampleSection *)self _formattedDisplayValueFromValue:v20 exertionType:v11 displayTypeController:v12 unitController:v13];
        if (v21) {
          [v24 setObject:v21 forKey:v11];
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  return v24;
}

- (id)_mostRelevantFixedValuesFromSamples:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  _HKInitializeLogging();
  id v11 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v26 = self;
    _os_log_impl(&dword_1E0B26000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finding most relevant sample", buf, 0xCu);
  }
  id v12 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:304];
  id v13 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:298];
  id v24 = +[HKExertionUtilities filterSamplesOfExertionTypeCode:304 fromExertionSamples:v10];
  uint64_t v14 = +[HKExertionUtilities mostRelevantValueFromExertionSamples:](HKExertionUtilities, "mostRelevantValueFromExertionSamples:");
  uint64_t v15 = +[HKExertionUtilities filterSamplesOfExertionTypeCode:298 fromExertionSamples:v10];

  uint64_t v16 = +[HKExertionUtilities mostRelevantValueFromExertionSamples:v15];
  uint64_t v17 = [(HKDataMetadataSubsampleSection *)self _formattedDisplayValueFromValue:v14 exertionType:v12 displayTypeController:v9 unitController:v8];
  id v18 = [(HKDataMetadataSubsampleSection *)self _formattedDisplayValueFromValue:v16 exertionType:v13 displayTypeController:v9 unitController:v8];

  _HKInitializeLogging();
  id v19 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    long long v26 = self;
    __int16 v27 = 2112;
    long long v28 = v17;
    __int16 v29 = 2112;
    uint64_t v30 = v18;
    _os_log_impl(&dword_1E0B26000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Most relevant workout effort %@ and estimated value %@", buf, 0x20u);
  }
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  if (v17)
  {
    int v21 = [(HKDataMetadataSubsampleSection *)self _localizedWorkoutEffortRatingFromValue:v14 stringValue:v17];
    [v20 setObject:v21 forKey:v12];
  }
  if (v18)
  {
    uint64_t v22 = [(HKDataMetadataSubsampleSection *)self _localizedWorkoutEffortRatingFromValue:v16 stringValue:v18];
    [v20 setObject:v22 forKey:v13];
  }
  return v20;
}

- (id)_localizedWorkoutEffortRatingFromValue:(id)a3 stringValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((int)[v5 intValue] > 3)
  {
    if ((int)[v5 intValue] > 6)
    {
      int v11 = [v5 intValue];
      uint64_t v7 = NSString;
      id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v9 = v8;
      if (v11 > 8) {
        id v10 = @"%@_WORKOUT_LOAD_ALLOUT";
      }
      else {
        id v10 = @"%@_WORKOUT_LOAD_HARD";
      }
    }
    else
    {
      uint64_t v7 = NSString;
      id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v9 = v8;
      id v10 = @"%@_WORKOUT_LOAD_MODERATE";
    }
  }
  else
  {
    uint64_t v7 = NSString;
    id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v9 = v8;
    id v10 = @"%@_WORKOUT_LOAD_EASY";
  }
  id v12 = [v8 localizedStringForKey:v10 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v13 = objc_msgSend(v7, "stringWithFormat:", v12, v6);

  return v13;
}

- (id)_formattedDisplayValueFromValue:(id)a3 exertionType:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  if (a3)
  {
    id v9 = a6;
    id v10 = a3;
    int v11 = [a5 displayTypeForObjectType:a4];
    id v12 = [v9 unitForDisplayType:v11];
    id v13 = objc_msgSend(v11, "hk_numberFormatterForUnit:", v12);
    uint64_t v14 = [v13 stringFromNumber:v10 displayType:v11 unitController:v9];
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

- (id)sectionTitle
{
  return [(HKSample *)self->_sample subSampleSectionTitle];
}

- (unint64_t)numberOfRowsInSection
{
  return [(NSArray *)self->_subSampleTypes count];
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  subSampleTypes = self->_subSampleTypes;
  id v7 = a4;
  id v8 = [(NSArray *)subSampleTypes objectAtIndex:a3];
  id v9 = [(NSMutableDictionary *)self->_aggregationValue objectForKey:v8];
  id v10 = [v7 dequeueReusableCellWithIdentifier:@"sub_samples"];

  if (!v10)
  {
    id v10 = [[HKDataMetadataSimpleTableViewCell alloc] initWithReuseIdentifier:@"sub_samples"];
    [(HKDataMetadataSimpleTableViewCell *)v10 setAccessoryType:1];
  }
  int v11 = [(id)objc_opt_class() displayNameForSampleType:v8 displayTypeController:self->_displayTypeController];
  switch([v8 associatedSampleAggregationStyle])
  {
    case 0:
    case 3:
      id v12 = v11;
      break;
    case 1:
      id v13 = NSString;
      uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v15 = v14;
      uint64_t v16 = @"SUBSAMPLE_TYPE_TOTAL %@";
      goto LABEL_10;
    case 2:
      id v13 = NSString;
      uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v15 = v14;
      uint64_t v16 = @"SUBSAMPLE_TYPE_AVERAGE %@";
      goto LABEL_10;
    case 4:
      id v13 = NSString;
      uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v15 = v14;
      uint64_t v16 = @"SUBSAMPLE_TYPE_MAXIMUM %@";
      goto LABEL_10;
    case 5:
      id v13 = NSString;
      uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v15 = v14;
      uint64_t v16 = @"%@ SUBSAMPLE_TYPE_RANGE";
LABEL_10:
      uint64_t v17 = [v14 localizedStringForKey:v16 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      objc_msgSend(v13, "stringWithFormat:", v17, v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      break;
    default:
      id v12 = 0;
      break;
  }
  id v18 = [(HKDataMetadataSimpleTableViewCell *)v10 titleTextLabel];
  id v19 = v18;
  if (v9)
  {
    [v18 setText:v9];

    id v18 = [(HKDataMetadataSimpleTableViewCell *)v10 subtitleTextLabel];
    id v19 = v18;
    id v20 = v12;
  }
  else
  {
    id v20 = v11;
  }
  [v18 setText:v20];

  return v10;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a4;
  if ([(HKDataMetadataSubsampleSection *)self showOnlyExertion])
  {
    id v8 = [(HKDataMetadataSubsampleSection *)self exertionSamples];
    id v9 = [v8 objectAtIndexedSubscript:a3];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_subsampleDelegate);
    int v11 = [WeakRetained viewControllerForSampleSelected:v9];
  }
  else
  {
    id v9 = [(NSArray *)self->_subSampleTypes objectAtIndex:a3];
    id WeakRetained = [(HKDataMetadataSubsampleSection *)self _subSamplePredicateOnSelectCellForSampleType:v9];
    id v12 = [(id)objc_opt_class() displayNameForSampleType:v9 displayTypeController:self->_displayTypeController];
    id v13 = objc_loadWeakRetained((id *)&self->_subsampleDelegate);
    int v11 = [v13 viewControllerForSampleType:v9 subSamplePredicate:WeakRetained title:v12];
  }
  if (v11) {
    [v14 pushViewController:v11 animated:v5];
  }
}

- (id)_mergeTypesForFixedValues:(id)a3 subSampleTypes:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:a4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v13, (void)v16) & 1) == 0) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = [(HKDataMetadataSubsampleSection *)self _trimAndSortSampleTypes:v7];

  return v14;
}

- (id)_trimAndSortSampleTypes:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__HKDataMetadataSubsampleSection__trimAndSortSampleTypes___block_invoke;
  v12[3] = &unk_1E6D56A20;
  v12[4] = self;
  id v5 = a3;
  id v6 = [v4 predicateWithBlock:v12];
  id v7 = [v5 filteredArrayUsingPredicate:v6];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HKDataMetadataSubsampleSection__trimAndSortSampleTypes___block_invoke_2;
  v11[3] = &unk_1E6D56A48;
  v11[4] = self;
  id v8 = _Block_copy(v11);
  uint64_t v9 = [v7 sortedArrayUsingComparator:v8];

  return v9;
}

BOOL __58__HKDataMetadataSubsampleSection__trimAndSortSampleTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 48) displayTypeForObjectType:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __58__HKDataMetadataSubsampleSection__trimAndSortSampleTypes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [(id)objc_opt_class() displayNameForSampleType:v6 displayTypeController:*(void *)(*(void *)(a1 + 32) + 48)];

  id v8 = [(id)objc_opt_class() displayNameForSampleType:v5 displayTypeController:*(void *)(*(void *)(a1 + 32) + 48)];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (id)_subSamplePredicateOnSelectCellForSampleType:(id)a3
{
  id v4 = a3;
  if ([v4 code] == 298 || objc_msgSend(v4, "code") == 304)
  {
    uint64_t v5 = [(HKSample *)self->_sample subExertionSamplePredicate];
  }
  else
  {
    uint64_t v5 = [(HKSample *)self->_sample subSamplePredicate];
  }
  id v6 = (void *)v5;

  return v6;
}

+ (id)displayNameForSampleType:(id)a3 displayTypeController:(id)a4
{
  id v4 = [a4 displayTypeForObjectType:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 localization];
    id v7 = [v6 displayName];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (HKSample)sample
{
  return self->_sample;
}

- (HKWorkoutActivity)workoutActivity
{
  return self->_workoutActivity;
}

- (NSArray)subSampleTypes
{
  return self->_subSampleTypes;
}

- (BOOL)showOnlyExertion
{
  return self->_showOnlyExertion;
}

- (void)setShowOnlyExertion:(BOOL)a3
{
  self->_showOnlyExertion = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (HKDataMetadataSubsampleDelegate)subsampleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subsampleDelegate);
  return (HKDataMetadataSubsampleDelegate *)WeakRetained;
}

- (NSMutableDictionary)aggregationValue
{
  return self->_aggregationValue;
}

- (void)setAggregationValue:(id)a3
{
}

- (NSArray)exertionSamples
{
  return self->_exertionSamples;
}

- (void)setExertionSamples:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exertionSamples, 0);
  objc_storeStrong((id *)&self->_aggregationValue, 0);
  objc_destroyWeak((id *)&self->_subsampleDelegate);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_subSampleTypes, 0);
  objc_storeStrong((id *)&self->_workoutActivity, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

void __133__HKDataMetadataSubsampleSection__submitRateOfExertionFixedValuesWithDisplayTypeController_unitController_healthStore_finishedBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch rating of exertion samples: %@", (uint8_t *)&v2, 0xCu);
}

@end