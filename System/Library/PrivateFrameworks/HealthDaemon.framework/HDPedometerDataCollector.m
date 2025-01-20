@interface HDPedometerDataCollector
+ (BOOL)isPedometerDataCollectionSupported;
- (Class)coreMotionDatumClass;
- (HDPedometerDataCollector)initWithProfile:(id)a3;
- (double)queue_differenceFromDatum:(id)a3 toDatum:(id)a4 type:(id)a5;
- (id)collectedTypes;
- (id)persistentIdentifier;
- (id)queue_newDataSource;
- (void)dealloc;
- (void)userCharacteristicsManager:(id)a3 didUpdateUserProfile:(id)a4;
@end

@implementation HDPedometerDataCollector

- (HDPedometerDataCollector)initWithProfile:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(id)objc_opt_class() isPedometerDataCollectionSupported])
  {
LABEL_5:
    v12 = 0;
    goto LABEL_9;
  }
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"HDDataCollectionDisablePedometer"];

  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x1E4F1CB18];
      v9 = v7;
      v10 = [v8 standardUserDefaults];
      v11 = [v10 valueForKey:@"HDDataCollectionDisablePedometer"];
      *(_DWORD *)buf = 138543618;
      v18 = @"HDDataCollectionDisablePedometer";
      __int16 v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "Calorimetry data collection disabled because defaults key '%{public}@' is %{public}@", buf, 0x16u);
    }
    goto LABEL_5;
  }
  v16.receiver = self;
  v16.super_class = (Class)HDPedometerDataCollector;
  v13 = [(HDCoreMotionDataCollector *)&v16 initWithProfile:v4];
  if (v13)
  {
    v14 = [v4 userCharacteristicsManager];
    [v14 addProfileObserver:v13];
  }
  self = v13;
  v12 = self;
LABEL_9:

  return v12;
}

- (void)userCharacteristicsManager:(id)a3 didUpdateUserProfile:(id)a4
{
  id v5 = a4;
  int v6 = [(HDCoreMotionDataCollector *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__HDPedometerDataCollector_userCharacteristicsManager_didUpdateUserProfile___block_invoke;
  v8[3] = &unk_1E62F31C0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

+ (BOOL)isPedometerDataCollectionSupported
{
  if (([MEMORY[0x1E4F22258] isStepCountingAvailable] & 1) != 0
    || ([MEMORY[0x1E4F22258] isFloorCountingAvailable] & 1) != 0)
  {
    return 1;
  }
  v3 = (void *)MEMORY[0x1E4F22258];

  return [v3 isDistanceAvailable];
}

- (void)dealloc
{
  v3 = [(HDCoreMotionDataCollector *)self profile];
  id v4 = [v3 userCharacteristicsManager];
  [v4 removeProfileObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HDPedometerDataCollector;
  [(HDCoreMotionDataCollector *)&v5 dealloc];
}

- (Class)coreMotionDatumClass
{
  return (Class)objc_opt_class();
}

- (id)collectedTypes
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F0]];
  v10[0] = v3;
  id v4 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A890]];
  v10[1] = v4;
  objc_super v5 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A808]];
  v10[2] = v5;
  int v6 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E0]];
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  v8 = [v2 setWithArray:v7];

  return v8;
}

- (id)queue_newDataSource
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self && self->_userCondition)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F22258]);
  }
  else
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = self;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Not creating data source: user condition is not yet set.", (uint8_t *)&v6, 0xCu);
    }
    id v3 = 0;
  }

  return v3;
}

- (double)queue_differenceFromDatum:(id)a3 toDatum:(id)a4 type:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(v9, "hd_epochDatestamp");
  v12 = objc_msgSend(v8, "hd_epochDatestamp");
  int v13 = [v11 isEqualToDate:v12];

  v14 = objc_msgSend(v8, "hd_epochDatestamp");
  v15 = objc_msgSend(v8, "hd_datestamp");
  if ([v14 isEqualToDate:v15])
  {
    int v16 = 1;
  }
  else
  {
    v17 = objc_msgSend(v9, "hd_epochDatestamp");
    v18 = objc_msgSend(v9, "hd_datestamp");
    int v16 = [v17 isEqualToDate:v18];
  }
  __int16 v19 = [v10 identifier];
  int v20 = [v19 isEqualToString:*MEMORY[0x1E4F2A7E0]];

  if (v20)
  {
    if (self && ![(NSNumber *)self->_userCondition integerValue]
      || (double v21 = 0.0, objc_msgSend(v9, "hd_hasWorkout")))
    {
      v22 = [v9 distance];
      [v22 doubleValue];
      double v21 = v23;
      if ((v13 | v16))
      {
        v24 = [v8 distance];
LABEL_16:
        v31 = v24;
        [v24 doubleValue];
        double v21 = v21 - v32;

LABEL_17:
        if (v21 < 0.0) {
          double v21 = 0.0;
        }
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else
  {
    v25 = [v10 identifier];
    int v26 = [v25 isEqualToString:*MEMORY[0x1E4F2A808]];

    if (v26)
    {
      v22 = [v9 floorsAscended];
      [v22 doubleValue];
      double v21 = v27;
      if ((v13 | v16))
      {
        v24 = [v8 floorsAscended];
        goto LABEL_16;
      }
LABEL_20:

      goto LABEL_21;
    }
    v28 = [v10 identifier];
    int v29 = [v28 isEqualToString:*MEMORY[0x1E4F2A890]];

    if (v29)
    {
      v22 = [v9 numberOfPushes];
      [v22 doubleValue];
      double v21 = v30;
      if ((v13 | v16))
      {
        v24 = [v8 numberOfPushes];
        goto LABEL_16;
      }
      goto LABEL_20;
    }
    v34 = [v10 identifier];
    int v35 = [v34 isEqualToString:*MEMORY[0x1E4F2A8F0]];

    if (v35)
    {
      if (self && ![(NSNumber *)self->_userCondition integerValue]
        || (double v21 = 0.0, objc_msgSend(v9, "hd_hasWorkout")))
      {
        v36 = [v9 numberOfSteps];
        [v36 doubleValue];
        double v21 = v37;
        if ((v13 | v16) == 1)
        {
          v38 = [v8 numberOfSteps];
          [v38 doubleValue];
          double v21 = v21 - v39;
        }
        if (v21 > 10000.0)
        {
          _HKInitializeLogging();
          v40 = *MEMORY[0x1E4F29F10];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
          {
            int v42 = 134218498;
            v43 = *(HDPedometerDataCollector **)&v21;
            __int16 v44 = 2112;
            id v45 = v8;
            __int16 v46 = 2112;
            id v47 = v9;
            _os_log_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_DEFAULT, "Unexpectedly large step count (%lf) between %@ and %@", (uint8_t *)&v42, 0x20u);
          }
        }
        goto LABEL_17;
      }
    }
    else
    {
      _HKInitializeLogging();
      v41 = *MEMORY[0x1E4F29F10];
      double v21 = 0.0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_FAULT))
      {
        int v42 = 138412546;
        v43 = self;
        __int16 v44 = 2112;
        id v45 = v10;
        _os_log_fault_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_FAULT, "%@: Unexpected type '%@' during difference calculation.", (uint8_t *)&v42, 0x16u);
      }
    }
  }
LABEL_21:

  return v21;
}

- (id)persistentIdentifier
{
  return @"HDPedometerDataCollector";
}

uint64_t __76__HDPedometerDataCollector_userCharacteristicsManager_didUpdateUserProfile___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F22160]];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(void *)(v5 + 72)) {
      *(void *)(v5 + 72) = &unk_1F17EEFD0;
    }
  }
  _HKInitializeLogging();
  int v6 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated user characteristics", (uint8_t *)&v9, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "queue_recomputeCurrentState");
}

- (void).cxx_destruct
{
}

@end