@interface FITrailingIntervalController
- (BOOL)addEvent:(id)a3 withError:(id *)a4;
- (BOOL)thresholdReached;
- (FITrailingIntervalController)initWithQuantityType:(id)a3 threshold:(id)a4 startDate:(id)a5;
- (HKQuantity)quantity;
- (HKQuantity)threshold;
- (NSArray)pauseResumeEvents;
- (double)activeDurationUntilDate:(id)a3;
- (double)committedDuration;
- (double)idleDurationUntilDate:(id)a3;
- (void)_addPauseEvent:(id)a3;
- (void)_addResumeEvent:(id)a3;
- (void)_determineAndProcessThresholdReached;
- (void)_processUncommittedSamples;
- (void)_updateSlicesWithSamples:(id)a3;
- (void)addSample:(id)a3;
- (void)addSamples:(id)a3;
- (void)setThreshold:(id)a3;
@end

@implementation FITrailingIntervalController

- (FITrailingIntervalController)initWithQuantityType:(id)a3 threshold:(id)a4 startDate:(id)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)FITrailingIntervalController;
  v12 = [(FITrailingIntervalController *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_quantityType, a3);
    objc_storeStrong((id *)&v13->_threshold, a4);
    v14 = [[FITrailingQuantityTimeSlice alloc] initWithQuantityType:v9 startDate:v11];
    v22[0] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    slices = v13->_slices;
    v13->_slices = (NSArray *)v15;

    uncommittedSamples = v13->_uncommittedSamples;
    v18 = (NSArray *)MEMORY[0x263EFFA68];
    v13->_uncommittedSamples = (NSArray *)MEMORY[0x263EFFA68];

    pauseResumeEvents = v13->_pauseResumeEvents;
    v13->_pauseResumeEvents = v18;
  }
  return v13;
}

- (void)addSample:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v7 count:1];

  -[FITrailingIntervalController addSamples:](self, "addSamples:", v6, v7, v8);
}

- (void)addSamples:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = FIFilterSamplesByType(a3, self->_quantityType);
  v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [v10 startDate];
        v12 = [(NSArray *)self->_slices lastObject];
        v13 = [v12 endDate];
        int v14 = objc_msgSend(v11, "hk_isBeforeDate:", v13);

        if (v14)
        {
          [v17 addObject:v10];
        }
        else
        {
          uint64_t v15 = [(NSArray *)self->_uncommittedSamples arrayByAddingObject:v10];
          uncommittedSamples = self->_uncommittedSamples;
          self->_uncommittedSamples = v15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  if ([v17 count])
  {
    [(FITrailingIntervalController *)self _updateSlicesWithSamples:v17];
    [(FITrailingIntervalController *)self _determineAndProcessThresholdReached];
  }
}

- (void)_determineAndProcessThresholdReached
{
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__2;
  v21[4] = __Block_byref_object_dispose__2;
  v3 = (void *)MEMORY[0x263F0A630];
  v4 = [(HKQuantityType *)self->_quantityType canonicalUnit];
  id v22 = [v3 quantityWithUnit:v4 doubleValue:0.0];

  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__2;
  uint64_t v15 = __Block_byref_object_dispose__2;
  id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_slices, "count"));
  slices = self->_slices;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__FITrailingIntervalController__determineAndProcessThresholdReached__block_invoke;
  v10[3] = &unk_26441CBF0;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = v21;
  v10[7] = &v11;
  [(NSArray *)slices enumerateObjectsWithOptions:2 usingBlock:v10];
  uint64_t v6 = [(id)v12[5] reverseObjectEnumerator];
  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = (NSArray *)[v7 copy];
  id v9 = self->_slices;
  self->_slices = v8;

  self->_thresholdReached = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);
}

void __68__FITrailingIntervalController__determineAndProcessThresholdReached__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    *a4 = 1;
    goto LABEL_9;
  }
  uint64_t v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v30 = v6;
  uint64_t v8 = [v6 committedTotal];
  uint64_t v9 = [v7 _quantityByAddingQuantity:v8];
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (![*(id *)(*(void *)(a1[6] + 8) + 40) compare:*(void *)(a1[4] + 40)])
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    goto LABEL_7;
  }
  if (!objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "hk_isGreaterThanQuantity:", *(void *)(a1[4] + 40)))
  {
LABEL_7:
    id v29 = v30;
    goto LABEL_8;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v13 = [*(id *)(a1[4] + 16) canonicalUnit];
  [v12 doubleValueForUnit:v13];
  double v15 = v14;
  uint64_t v16 = a1[4];
  uint64_t v17 = *(void **)(v16 + 40);
  long long v18 = [*(id *)(v16 + 16) canonicalUnit];
  [v17 doubleValueForUnit:v18];
  double v20 = v15 - v19;

  long long v21 = [v30 committedTotal];
  id v22 = [*(id *)(a1[4] + 16) canonicalUnit];
  [v21 doubleValueForUnit:v22];
  double v24 = v23 - v20;

  v25 = (void *)MEMORY[0x263F0A630];
  v26 = [*(id *)(a1[4] + 16) canonicalUnit];
  v27 = [v25 quantityWithUnit:v26 doubleValue:v24];
  uint64_t v28 = [v30 settingTotalQuantityLimit:v27];

  id v29 = (id)v28;
LABEL_8:
  id v31 = v29;
  [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v29];
  id v6 = v31;
LABEL_9:
}

- (void)_updateSlicesWithSamples:(id)a3
{
  id v4 = a3;
  slices = self->_slices;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__FITrailingIntervalController__updateSlicesWithSamples___block_invoke;
  v9[3] = &unk_26441CC18;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)slices fi_mapUsingBlock:v9];
  uint64_t v8 = self->_slices;
  self->_slices = v7;
}

id __57__FITrailingIntervalController__updateSlicesWithSamples___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v5 = 0;
  v3 = [a2 addingSamples:v2 error:&v5];
  return v3;
}

- (void)_processUncommittedSamples
{
  if ([(NSArray *)self->_uncommittedSamples count])
  {
    [(FITrailingIntervalController *)self _updateSlicesWithSamples:self->_uncommittedSamples];
    uncommittedSamples = self->_uncommittedSamples;
    self->_uncommittedSamples = (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (BOOL)addEvent:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSArray *)self->_pauseResumeEvents lastObject];
  id v8 = v6;
  id v9 = v7;
  if ([v8 type] != 1 && objc_msgSend(v8, "type") != 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Event must be pause or resume event.  Event type: %ld", objc_msgSend(v8, "type"), v25);
    goto LABEL_9;
  }
  if (v9)
  {
    id v10 = [v8 dateInterval];
    uint64_t v11 = [v10 startDate];
    v12 = [v9 dateInterval];
    uint64_t v13 = [v12 startDate];
    int v14 = objc_msgSend(v11, "hk_isBeforeDate:", v13);

    if (v14)
    {
      double v15 = NSString;
      uint64_t v16 = [v9 dateInterval];
      uint64_t v17 = [v16 startDate];
      long long v18 = [v8 dateInterval];
      double v19 = [v18 startDate];
      double v20 = [v15 stringWithFormat:@"New event date must be after previous date. Previous event date: %@. New event date: %@.", v17, v19];

LABEL_10:
      long long v21 = FIIntervalErrorWithDescription(v20);
      FISetOutErrorIfNotNull(a4, v21);

      BOOL v22 = 0;
      goto LABEL_20;
    }
    if ([v9 type] == 1 && objc_msgSend(v8, "type") != 2)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"New event type must be resume. Previous event type: %ld. New event type: %ld.", objc_msgSend(v9, "type"), objc_msgSend(v8, "type"));
    }
    else
    {
      if ([v9 type] != 2 || objc_msgSend(v8, "type") == 1) {
        goto LABEL_15;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"Current event type must be pause. Previous event type: %ld. New event type: %ld.", objc_msgSend(v9, "type"), objc_msgSend(v8, "type"));
    }
    double v20 = LABEL_9:;
    goto LABEL_10;
  }
  if ([v8 type] != 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"First event must be pause event.  Event type: %ld", objc_msgSend(v8, "type"), v25);
    goto LABEL_9;
  }
LABEL_15:

  uint64_t v23 = [v8 type];
  if (v23 == 2)
  {
    [(FITrailingIntervalController *)self _addResumeEvent:v8];
  }
  else if (v23 == 1)
  {
    [(FITrailingIntervalController *)self _addPauseEvent:v8];
  }
  BOOL v22 = 1;
LABEL_20:

  return v22;
}

- (void)_addPauseEvent:(id)a3
{
  id v14 = a3;
  if ([(NSArray *)self->_slices count])
  {
    id v4 = [MEMORY[0x263EFF980] arrayWithArray:self->_slices];
    uint64_t v5 = [(NSArray *)v4 count] - 1;
    id v6 = [(NSArray *)v4 lastObject];
    uint64_t v7 = [v14 dateInterval];
    id v8 = [v7 startDate];
    id v9 = [v6 settingEndDate:v8];
    [(NSArray *)v4 replaceObjectAtIndex:v5 withObject:v9];

    slices = self->_slices;
    self->_slices = v4;
    uint64_t v11 = v4;

    v12 = [(NSArray *)self->_pauseResumeEvents arrayByAddingObject:v14];
    pauseResumeEvents = self->_pauseResumeEvents;
    self->_pauseResumeEvents = v12;
  }
}

- (void)_addResumeEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [FITrailingQuantityTimeSlice alloc];
  quantityType = self->_quantityType;
  uint64_t v7 = [v4 dateInterval];
  id v8 = [v7 startDate];
  uint64_t v13 = [(FITrailingQuantityTimeSlice *)v5 initWithQuantityType:quantityType startDate:v8];

  id v9 = [(NSArray *)self->_slices arrayByAddingObject:v13];
  slices = self->_slices;
  self->_slices = v9;

  [(FITrailingIntervalController *)self _processUncommittedSamples];
  uint64_t v11 = [(NSArray *)self->_pauseResumeEvents arrayByAddingObject:v4];

  pauseResumeEvents = self->_pauseResumeEvents;
  self->_pauseResumeEvents = v11;
}

- (void)setThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_threshold, a3);
  [(FITrailingIntervalController *)self _determineAndProcessThresholdReached];
}

- (double)committedDuration
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = self->_slices;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "committedDuration", (void)v10);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)activeDurationUntilDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_slices;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "activeDurationUntilDate:", v4, (void)v13);
        double v9 = v9 + v11;
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (double)idleDurationUntilDate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  slices = self->_slices;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__FITrailingIntervalController_idleDurationUntilDate___block_invoke;
  v9[3] = &unk_26441CC40;
  id v6 = v4;
  id v10 = v6;
  double v11 = &v12;
  [(NSArray *)slices enumerateObjectsWithOptions:2 usingBlock:v9];
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__FITrailingIntervalController_idleDurationUntilDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v26 = a2;
  id v6 = [v26 committedTotal];
  double v7 = [v26 committedTotal];
  uint64_t v8 = [v7 _unit];
  [v6 doubleValueForUnit:v8];
  double v10 = v9;

  double v11 = [v26 endDate];
  int v12 = objc_msgSend(v11, "hk_isAfterDate:", *(void *)(a1 + 32));

  if (v10 <= 2.22044605e-16)
  {
    if (v12)
    {
      uint64_t v18 = *(void **)(a1 + 32);
      double v19 = [v26 startDate];
      [v18 timeIntervalSinceDate:v19];
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v20
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
    }
    else
    {
      uint64_t v23 = [v26 endDate];
      double v24 = [v26 startDate];
      [v23 timeIntervalSinceDate:v24];
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v25
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
    }
  }
  else
  {
    if (v12)
    {
      long long v13 = *(void **)(a1 + 32);
      uint64_t v14 = [v26 committedSamples];
      uint64_t v15 = [v14 lastObject];
      long long v16 = [v15 endDate];
      [v13 timeIntervalSinceDate:v16];
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v17
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
    }
    else
    {
      uint64_t v14 = [v26 endDate];
      uint64_t v15 = [v26 committedSamples];
      long long v16 = [v15 lastObject];
      long long v21 = [v16 endDate];
      [v14 timeIntervalSinceDate:v21];
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v22
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
    }
    *a4 = 1;
  }
}

- (HKQuantity)quantity
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F0A630];
  id v4 = [(HKQuantityType *)self->_quantityType canonicalUnit];
  uint64_t v5 = [v3 quantityWithUnit:v4 doubleValue:0.0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_slices;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      double v11 = v5;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "committedTotal", (void)v14);
        uint64_t v5 = [v11 _quantityByAddingQuantity:v12];

        ++v10;
        double v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return (HKQuantity *)v5;
}

- (HKQuantity)threshold
{
  return self->_threshold;
}

- (BOOL)thresholdReached
{
  return self->_thresholdReached;
}

- (NSArray)pauseResumeEvents
{
  return self->_pauseResumeEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseResumeEvents, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_uncommittedSamples, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_slices, 0);
}

@end