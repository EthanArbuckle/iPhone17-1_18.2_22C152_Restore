@interface HDActiveQuantityDataAggregator
- (Class)sensorDatumClass;
- (HKQuantityType)quantityType;
- (id)additionalMetadataForCollector:(id)a3;
- (id)aggregateForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8 error:(id *)a9;
- (id)description;
- (id)initForQuantityType:(id)a3 dataCollectionManager:(id)a4;
- (id)objectType;
@end

@implementation HDActiveQuantityDataAggregator

- (id)initForQuantityType:(id)a3 dataCollectionManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDActiveQuantityDataAggregator.m", 30, @"Invalid parameter not satisfying: %@", @"[quantityType isKindOfClass:[HKQuantityType class]]" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HDActiveQuantityDataAggregator;
  v10 = [(HDActiveDataAggregator *)&v17 initWithDataCollectionManager:v9];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_quantityType, a3);
    id v12 = v8;
    if (([MEMORY[0x1E4F2B860] isDataCollectionForwarderDisabled] & 1) != 0
      || (unint64_t)([v12 code] - 280) > 2)
    {
      v13 = 0;
    }
    else
    {
      v13 = objc_alloc_init(HDCyclingDataCollectionForwarder);
    }

    dataForwarder = v11->_dataForwarder;
    v11->_dataForwarder = (HDDataCollectionForwarder *)v13;
  }
  return v11;
}

- (id)objectType
{
  return self->_quantityType;
}

- (Class)sensorDatumClass
{
  return (Class)objc_opt_class();
}

- (id)additionalMetadataForCollector:(id)a3
{
  return 0;
}

- (id)aggregateForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8 error:(id *)a9
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  [(HDActiveDataAggregator *)self aggregationIntervalForCollector:v15];
  double v19 = v18;
  id v20 = v14;
  id v21 = v17;
  if (self)
  {
    v22 = [(HDActiveQuantityDataAggregator *)self additionalMetadataForCollector:v15];
    v23 = [v20 unaggregatedSensorData];
    if (v21)
    {
      quantityType = self->_quantityType;
      v25 = [MEMORY[0x1E4F1C9C8] date];
      HDAggregateQuantitySensorDataThroughDate(v23, quantityType, v25, v21, a7 == 0, v22, v19);
    }
    else
    {
      v26 = self->_quantityType;
      v25 = [MEMORY[0x1E4F1C9C8] date];
      HDAggregateQuantitySensorData(v23, v26, v25, v22, v19);
    v27 = };
  }
  else
  {
    v27 = 0;
  }

  if (v27)
  {
    if (([v20 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      _HKInitializeLogging();
      v28 = (void *)*MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_FAULT))
      {
        v39 = v28;
        v40 = (objc_class *)objc_opt_class();
        v41 = NSStringFromClass(v40);
        *(_DWORD *)buf = 138543618;
        v47 = self;
        __int16 v48 = 2114;
        v49 = v41;
        _os_log_fault_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_FAULT, "%{public}@: unexpected state object %{public}@", buf, 0x16u);
      }
    }
    v29 = [HDDataAggregationState alloc];
    v30 = [v27 remainingSensorData];
    v31 = [(HDDataAggregationState *)v29 initWithRemainingSensorData:v30];

    v32 = [v27 aggregatedSamples];
    uint64_t v33 = [v32 count];

    v34 = [HDDataAggregationResult alloc];
    v35 = v34;
    if (v33)
    {
      v36 = [v27 consumedSensorData];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __113__HDActiveQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke;
      v42[3] = &unk_1E62F4558;
      v42[4] = self;
      id v43 = v27;
      id v44 = v16;
      id v45 = v15;
      v37 = [(HDDataAggregationResult *)v35 initWithResultingAggregationState:v31 consumedSensorData:v36 persistenceHandler:v42];
    }
    else
    {
      v37 = [(HDDataAggregationResult *)v34 initWithResultingAggregationState:v31 consumedSensorData:0 persistenceHandler:0];
    }
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

uint64_t __113__HDActiveQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 dataCollectionManager];
  id v8 = [v7 profile];
  id v9 = [v8 dataManager];
  v10 = [*(id *)(a1 + 40) aggregatedSamples];
  int v11 = [v9 insertDataObjects:v10 withProvenance:v6 creationDate:1 skipInsertionFilter:a3 error:CFAbsoluteTimeGetCurrent()];

  if (!v11) {
    return 0;
  }
  id v12 = *(void **)(*(void *)(a1 + 32) + 88);
  v13 = [*(id *)(a1 + 40) aggregatedSamples];
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = [*(id *)(a1 + 56) sourceForDataAggregator:*(void *)(a1 + 32)];
  [v12 insertSamples:v13 device:v14 source:v15];

  id v16 = *(void **)(a1 + 32);
  id v17 = [*(id *)(a1 + 40) aggregatedSamples];
  double v18 = [*(id *)(a1 + 40) consumedSensorData];
  double v19 = [v18 lastObject];
  uint64_t v20 = [v16 didPersistObjects:v17 lastDatum:v19 collector:*(void *)(a1 + 56) error:a3];

  return v20;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDActiveQuantityDataAggregator;
  v4 = [(HDActiveQuantityDataAggregator *)&v8 description];
  v5 = [(HKQuantityType *)self->_quantityType identifier];
  id v6 = [v3 stringWithFormat:@"<%@ %@>", v4, v5];

  return v6;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);

  objc_storeStrong((id *)&self->_dataForwarder, 0);
}

@end