@interface HKMedicationScheduleBaseIncompatibilityResolver
+ (id)computeIncompatibleSchedulesFromSchedules:(id)a3 devices:(id)a4;
- (HKMedicationScheduleBaseIncompatibilityResolver)init;
- (NSDictionary)unitTestScheduleCompatibilityRanges;
- (id)_updatedSchedules:(void *)a1 withReplacementCompatibilityRanges:(void *)a2;
- (void)_resolveIncompatibleScheduleResultsFromSchedules:(id)a3 scheduleError:(id)a4 devices:(id)a5 deviceError:(id)a6 completion:(id)a7;
- (void)_unitTest_setScheduleCompatibilityRanges:(id)a3;
- (void)checkIncompatibilityForSchedule:(id)a3 completion:(id)a4;
- (void)setUnitTestScheduleCompatibilityRanges:(id)a3;
@end

@implementation HKMedicationScheduleBaseIncompatibilityResolver

- (HKMedicationScheduleBaseIncompatibilityResolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKMedicationScheduleBaseIncompatibilityResolver;
  v2 = [(HKMedicationScheduleBaseIncompatibilityResolver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionary];
    unitTestScheduleCompatibilityRanges = v2->_unitTestScheduleCompatibilityRanges;
    v2->_unitTestScheduleCompatibilityRanges = (NSDictionary *)v3;
  }
  return v2;
}

+ (id)computeIncompatibleSchedulesFromSchedules:(id)a3 devices:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v21 = a4;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (([v10 isUnavailable] & 1) == 0)
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v12 = v21;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v24 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                if (([v17 isCompatibleWithSchedule:v10] & 1) == 0) {
                  [v11 addObject:v17];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v14);
          }

          if ([v11 count])
          {
            v18 = [[HKMedicationScheduleIncompatibilityResult alloc] initWithSchedule:v10 incompatibleDevices:v11];
            [v20 addObject:v18];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  return v20;
}

- (void)_resolveIncompatibleScheduleResultsFromSchedules:(id)a3 scheduleError:(id)a4 devices:(id)a5 deviceError:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v24 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, void *, void))a7;
  if (v12)
  {
    if (v13)
    {
      v16 = objc_msgSend(v13, "hk_filter:", &__block_literal_global);
      v17 = [(NSDictionary *)self->_unitTestScheduleCompatibilityRanges allKeys];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        uint64_t v19 = -[HKMedicationScheduleBaseIncompatibilityResolver _updatedSchedules:withReplacementCompatibilityRanges:](self, v12);

        id v12 = (id)v19;
      }
      id v20 = [(id)objc_opt_class() computeIncompatibleSchedulesFromSchedules:v12 devices:v16];
      v15[2](v15, v20, 0);
    }
    else
    {
      if (v14)
      {
        id v22 = v14;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 0, @"Unknown error occured while fetching Apple Account devices");
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v23 = v22;
      ((void (**)(id, void *, id))v15)[2](v15, 0, v22);
    }
  }
  else
  {
    if (v24)
    {
      id v21 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 0, @"Unknown error occured while fetching schedules");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v12 = v21;
    ((void (**)(id, void *, id))v15)[2](v15, 0, v21);
  }
}

BOOL __145__HKMedicationScheduleBaseIncompatibilityResolver__resolveIncompatibleScheduleResultsFromSchedules_scheduleError_devices_deviceError_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 deviceType];
  uint64_t v3 = v2;
  if (v2) {
    BOOL v4 = (unint64_t)[v2 integerValue] < 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_updatedSchedules:(void *)a1 withReplacementCompatibilityRanges:(void *)a2
{
  if (a1)
  {
    var28[0] = MEMORY[0x1E4F143A8];
    var28[1] = 3221225472;
    var28[2] = __104__HKMedicationScheduleBaseIncompatibilityResolver__updatedSchedules_withReplacementCompatibilityRanges___block_invoke;
    var28[3] = &unk_1E62EAF68;
    var28[4] = a1;
    a1 = objc_msgSend(a2, "hk_map:", var28);
    uint64_t v2 = var28[6];
  }
  return a1;
}

id __104__HKMedicationScheduleBaseIncompatibilityResolver__updatedSchedules_withReplacementCompatibilityRanges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = [v3 UUID];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = (id)objc_msgSend(v3, "_copyByReplacingCompatibilityVersionRange:", objc_msgSend(v6, "integerValue"), objc_msgSend(v6, "integerValue"));
  }
  else {
    id v7 = v3;
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)_unitTest_setScheduleCompatibilityRanges:(id)a3
{
}

- (NSDictionary)unitTestScheduleCompatibilityRanges
{
  return self->_unitTestScheduleCompatibilityRanges;
}

- (void)setUnitTestScheduleCompatibilityRanges:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)checkIncompatibilityForSchedule:(id)a3 completion:(id)a4
{
  uint64_t v6 = objc_opt_class();

  MEMORY[0x1F40E7228](self, a2, v6);
}

@end