@interface FITrailingQuantityTimeSlice
- (BOOL)finalized;
- (FITrailingQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4;
- (FITrailingQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (FITrailingQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5 committedSamples:(id)a6 uncommittedSamples:(id)a7 lastCommitDate:(id)a8 committedTotal:(id)a9 finalized:(BOOL)a10;
- (HKQuantity)committedAndAddedTotal;
- (HKQuantity)committedTotal;
- (HKQuantityType)quantityType;
- (NSArray)committedSamples;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)activeDurationUntilDate:(id)a3;
- (double)committedDuration;
- (id)_commitingSamples:(id)a3 toPreviousCommittedTotal:(id)a4 toPreviousCommittedSamples:(id)a5 untilDate:(id)a6 startDate:(id)a7 endDate:(id)a8;
- (id)_totalByCommittingSample:(id)a3 toPreviousTotal:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (id)addingSample:(id)a3 error:(id *)a4;
- (id)addingSamples:(id)a3 error:(id *)a4;
- (id)autoCommitDateForSamples:(id)a3;
- (id)committingUntilDate:(id)a3;
- (id)description;
- (id)settingEndDate:(id)a3;
- (id)settingStartDate:(id)a3;
- (id)settingTotalQuantityLimit:(id)a3;
@end

@implementation FITrailingQuantityTimeSlice

- (FITrailingQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4
{
  v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 distantFuture];
  v10 = [(FITrailingQuantityTimeSlice *)self initWithQuantityType:v8 startDate:v7 endDate:v9];

  return v10;
}

- (FITrailingQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = (void *)MEMORY[0x263F0A630];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v11 canonicalUnit];
  v13 = [v8 quantityWithUnit:v12 doubleValue:0.0];
  LOBYTE(v16) = 0;
  v14 = [(FITrailingQuantityTimeSlice *)self initWithQuantityType:v11 startDate:v10 endDate:v9 committedSamples:MEMORY[0x263EFFA68] uncommittedSamples:MEMORY[0x263EFFA68] lastCommitDate:v10 committedTotal:v13 finalized:v16];

  return v14;
}

- (FITrailingQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5 committedSamples:(id)a6 uncommittedSamples:(id)a7 lastCommitDate:(id)a8 committedTotal:(id)a9 finalized:(BOOL)a10
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v17 = a8;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)FITrailingQuantityTimeSlice;
  v19 = [(FITrailingQuantityTimeSlice *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_quantityType, a3);
    objc_storeStrong((id *)&v20->_startDate, a4);
    objc_storeStrong((id *)&v20->_endDate, a5);
    objc_storeStrong((id *)&v20->_committedSamples, a6);
    objc_storeStrong((id *)&v20->_uncommittedSamples, a7);
    objc_storeStrong((id *)&v20->_lastCommitDate, a8);
    objc_storeStrong((id *)&v20->_committedTotal, a9);
    v20->_finalized = a10;
  }

  return v20;
}

- (HKQuantity)committedAndAddedTotal
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = self->_committedTotal;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = self->_uncommittedSamples;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      id v9 = v3;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        id v11 = objc_alloc(MEMORY[0x263F08798]);
        v12 = objc_msgSend(v11, "initWithStartDate:endDate:", self->_startDate, self->_endDate, (void)v15);
        v13 = FISampleQuantityInsideDateInterval(v10, v12, 0);

        v3 = [(HKQuantity *)v9 _quantityByAddingQuantity:v13];

        ++v8;
        id v9 = v3;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (double)committedDuration
{
  [(NSDate *)self->_lastCommitDate timeIntervalSinceDate:self->_startDate];
  return result;
}

- (double)activeDurationUntilDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FITrailingQuantityTimeSlice *)self endDate];
  int v6 = objc_msgSend(v5, "hk_isAfterDate:", v4);

  if (v6)
  {
    [v4 timeIntervalSinceDate:self->_startDate];
    double v8 = v7;
  }
  else
  {
    id v9 = [(FITrailingQuantityTimeSlice *)self endDate];
    [v9 timeIntervalSinceDate:self->_startDate];
    double v8 = v10;
  }
  return v8;
}

- (id)addingSample:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (_ValidateSample(v6, self->_startDate, self->_endDate, a4))
  {
    v12[0] = v6;
    double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    double v8 = [(FITrailingQuantityTimeSlice *)self autoCommitDateForSamples:v7];

    id v9 = [(NSArray *)self->_uncommittedSamples arrayByAddingObject:v6];
    double v10 = [(FITrailingQuantityTimeSlice *)self _commitingSamples:v9 toPreviousCommittedTotal:self->_committedTotal toPreviousCommittedSamples:self->_committedSamples untilDate:v8 startDate:self->_startDate endDate:self->_endDate];
  }
  else
  {
    double v10 = self;
  }

  return v10;
}

- (id)addingSamples:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  long long v15 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__FITrailingQuantityTimeSlice_addingSamples_error___block_invoke;
  v10[3] = &unk_26441C890;
  v10[4] = self;
  v10[5] = v17;
  v10[6] = &v11;
  [v5 enumerateObjectsUsingBlock:v10];
  if ([(id)v12[5] count])
  {
    id v6 = [(FITrailingQuantityTimeSlice *)self autoCommitDateForSamples:v12[5]];
    double v7 = [(NSArray *)self->_uncommittedSamples arrayByAddingObjectsFromArray:v12[5]];
    double v8 = [(FITrailingQuantityTimeSlice *)self _commitingSamples:v7 toPreviousCommittedTotal:self->_committedTotal toPreviousCommittedSamples:self->_committedSamples untilDate:v6 startDate:self->_startDate endDate:self->_endDate];
  }
  else
  {
    double v8 = self;
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  return v8;
}

void __51__FITrailingQuantityTimeSlice_addingSamples_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  id v5 = *(void **)(v4 + 48);
  id v6 = *(void **)(v4 + 56);
  uint64_t v7 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v7 + 40);
  int v8 = _ValidateSample(v3, v5, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8) {
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v3];
  }
}

- (id)autoCommitDateForSamples:(id)a3
{
  uint64_t v4 = FISortSamplesByDate(a3);
  id v5 = [v4 lastObject];
  id v6 = [v5 endDate];
  int v7 = objc_msgSend(v6, "hk_isAfterDate:", self->_lastCommitDate);

  if (v7)
  {
    int v8 = [v4 lastObject];
    id v9 = [v8 endDate];
    double v10 = [v9 earlierDate:self->_endDate];
  }
  else
  {
    double v10 = self->_lastCommitDate;
  }

  return v10;
}

- (id)committingUntilDate:(id)a3
{
  return [(FITrailingQuantityTimeSlice *)self _commitingSamples:self->_uncommittedSamples toPreviousCommittedTotal:self->_committedTotal toPreviousCommittedSamples:self->_committedSamples untilDate:a3 startDate:self->_startDate endDate:self->_endDate];
}

- (id)settingEndDate:(id)a3
{
  id v4 = a3;
  id v5 = [FITrailingQuantityTimeSlice alloc];
  quantityType = self->_quantityType;
  startDate = self->_startDate;
  int v8 = [(NSArray *)self->_committedSamples arrayByAddingObjectsFromArray:self->_uncommittedSamples];
  id v9 = [MEMORY[0x263EFF910] distantPast];
  double v10 = (void *)MEMORY[0x263F0A630];
  uint64_t v11 = [(HKQuantityType *)self->_quantityType canonicalUnit];
  v12 = [v10 quantityWithUnit:v11 doubleValue:0.0];
  LOBYTE(v16) = self->_finalized;
  uint64_t v13 = [(FITrailingQuantityTimeSlice *)v5 initWithQuantityType:quantityType startDate:startDate endDate:v4 committedSamples:MEMORY[0x263EFFA68] uncommittedSamples:v8 lastCommitDate:v9 committedTotal:v12 finalized:v16];

  v14 = [(FITrailingQuantityTimeSlice *)v13 committingUntilDate:v4];

  return v14;
}

- (id)settingStartDate:(id)a3
{
  id v4 = a3;
  id v5 = [FITrailingQuantityTimeSlice alloc];
  quantityType = self->_quantityType;
  endDate = self->_endDate;
  int v8 = [(NSArray *)self->_committedSamples arrayByAddingObjectsFromArray:self->_uncommittedSamples];
  id v9 = [MEMORY[0x263EFF910] distantPast];
  double v10 = (void *)MEMORY[0x263F0A630];
  uint64_t v11 = [(HKQuantityType *)self->_quantityType canonicalUnit];
  v12 = [v10 quantityWithUnit:v11 doubleValue:0.0];
  LOBYTE(v16) = self->_finalized;
  uint64_t v13 = [(FITrailingQuantityTimeSlice *)v5 initWithQuantityType:quantityType startDate:v4 endDate:endDate committedSamples:MEMORY[0x263EFFA68] uncommittedSamples:v8 lastCommitDate:v9 committedTotal:v12 finalized:v16];

  v14 = [(FITrailingQuantityTimeSlice *)v13 committingUntilDate:self->_lastCommitDate];

  return v14;
}

- (id)settingTotalQuantityLimit:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "hk_isGreaterThanQuantity:", self->_committedTotal))
  {
    id v5 = self;
  }
  else
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy_;
    v25[4] = __Block_byref_object_dispose_;
    id v6 = (void *)MEMORY[0x263F0A630];
    int v7 = [(FITrailingQuantityTimeSlice *)self quantityType];
    int v8 = [v7 canonicalUnit];
    id v26 = [v6 quantityWithUnit:v8 doubleValue:0.0];

    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy_;
    id v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    committedSamples = self->_committedSamples;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __57__FITrailingQuantityTimeSlice_settingTotalQuantityLimit___block_invoke;
    v14 = &unk_26441C8B8;
    long long v15 = self;
    long long v17 = v25;
    id v16 = v4;
    id v18 = &v19;
    [(NSArray *)committedSamples enumerateObjectsWithOptions:2 usingBlock:&v11];
    -[FITrailingQuantityTimeSlice settingStartDate:](self, "settingStartDate:", v20[5], v11, v12, v13, v14, v15);
    id v5 = (FITrailingQuantityTimeSlice *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(v25, 8);
  }
  return v5;
}

void __57__FITrailingQuantityTimeSlice_settingTotalQuantityLimit___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:*(void *)(a1[4] + 48) endDate:*(void *)(a1[4] + 56)];
  int v7 = FISampleQuantityInsideDateInterval(v17, v6, 0);

  uint64_t v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) _quantityByAddingQuantity:v7];
  uint64_t v9 = *(void *)(a1[6] + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  int v11 = objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "hk_isGreaterThanQuantity:", a1[5]);
  uint64_t v12 = (void *)a1[5];
  uint64_t v13 = *(void *)(a1[6] + 8);
  if (v11)
  {
    uint64_t v14 = FIThresholdDateInsideSample(v17, *(void **)(v13 + 40), v12, 1);
  }
  else
  {
    if ([*(id *)(v13 + 40) compare:v12]) {
      goto LABEL_6;
    }
    uint64_t v14 = [v17 startDate];
  }
  uint64_t v15 = *(void *)(a1[7] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  *a4 = 1;
LABEL_6:
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)committedSamples
{
  return self->_committedSamples;
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (HKQuantity)committedTotal
{
  return self->_committedTotal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_committedTotal, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_lastCommitDate, 0);
  objc_storeStrong((id *)&self->_committedSamples, 0);
  objc_storeStrong((id *)&self->_uncommittedSamples, 0);
}

- (id)_totalByCommittingSample:(id)a3 toPreviousTotal:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  uint64_t v9 = (objc_class *)MEMORY[0x263F08798];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)[[v9 alloc] initWithStartDate:v11 endDate:v10];

  uint64_t v18 = 0;
  uint64_t v15 = FISampleQuantityInsideDateInterval(v13, v14, &v18);

  id v16 = [v12 _quantityByAddingQuantity:v15];

  return v16;
}

- (id)_commitingSamples:(id)a3 toPreviousCommittedTotal:(id)a4 toPreviousCommittedSamples:(id)a5 untilDate:(id)a6 startDate:(id)a7 endDate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy_;
  v63 = __Block_byref_object_dispose_;
  id v34 = v15;
  id v64 = v34;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  id v20 = v16;
  id v50 = v20;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __147__FITrailingQuantityTimeSlice_SampleProcessing___commitingSamples_toPreviousCommittedTotal_toPreviousCommittedSamples_untilDate_startDate_endDate___block_invoke;
  v35[3] = &unk_26441C8E0;
  v40 = &v45;
  v41 = &v51;
  id v21 = v17;
  id v36 = v21;
  id v22 = v18;
  id v37 = v22;
  id v23 = v19;
  id v38 = v23;
  v39 = self;
  v42 = &v59;
  v43 = &v65;
  v44 = &v55;
  [v14 enumerateObjectsUsingBlock:v35];
  uint64_t v24 = v66[3];
  uint64_t v25 = [v14 count];
  id v26 = objc_msgSend(v14, "subarrayWithRange:", v24, v25 - v66[3]);
  if (*((unsigned char *)v52 + 24))
  {
    uint64_t v27 = FISortSamplesByDate((void *)v46[5]);
    v28 = (void *)v46[5];
    v46[5] = v27;
  }
  v29 = [FITrailingQuantityTimeSlice alloc];
  v30 = [(FITrailingQuantityTimeSlice *)self quantityType];
  LOBYTE(v33) = *((unsigned char *)v56 + 24);
  v31 = [(FITrailingQuantityTimeSlice *)v29 initWithQuantityType:v30 startDate:v22 endDate:v23 committedSamples:v46[5] uncommittedSamples:v26 lastCommitDate:v21 committedTotal:v60[5] finalized:v33];

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
  return v31;
}

void __147__FITrailingQuantityTimeSlice_SampleProcessing___commitingSamples_toPreviousCommittedTotal_toPreviousCommittedSamples_untilDate_startDate_endDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  int v7 = [v6 endDate];
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) lastObject];
  uint64_t v9 = [v8 endDate];
  int v10 = objc_msgSend(v7, "hk_isBeforeDate:", v9);

  if (v10) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = *(void **)(a1 + 48);
  id v28 = v6;
  id v14 = v11;
  id v15 = v13;
  if (objc_msgSend(v28, "fi_isBeforeDate:", v12) & 1) != 0 || (objc_msgSend(v28, "fi_isAfterDate:", v15))
  {

LABEL_6:
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    goto LABEL_7;
  }
  if ((objc_msgSend(v28, "fi_isAfterDate:", v14) & 1) == 0)
  {
    if (objc_msgSend(v28, "fi_spansDate:useStrictDateLimits:", v15, 0))
    {

      uint64_t v16 = [*(id *)(a1 + 56) _totalByCommittingSample:v28 toPreviousTotal:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) startDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48)];
      uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      uint64_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) arrayByAddingObject:v28];
      uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
      id v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      goto LABEL_6;
    }
    if ((objc_msgSend(v28, "fi_spansDate:useStrictDateLimits:", v14, 1) & 1) == 0)
    {

      uint64_t v22 = [*(id *)(a1 + 56) _totalByCommittingSample:v28 toPreviousTotal:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) startDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48)];
      uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      uint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) arrayByAddingObject:v28];
      uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      goto LABEL_6;
    }
  }

  *a4 = 1;
LABEL_7:
}

- (id)description
{
  id v15 = NSString;
  uint64_t v3 = objc_opt_class();
  if ([(FITrailingQuantityTimeSlice *)self finalized]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  id v5 = [(FITrailingQuantityTimeSlice *)self quantityType];
  id v6 = [(FITrailingQuantityTimeSlice *)self startDate];
  int v7 = [(FITrailingQuantityTimeSlice *)self endDate];
  NSUInteger v8 = [(NSArray *)self->_committedSamples count];
  NSUInteger v9 = [(NSArray *)self->_uncommittedSamples count];
  lastCommitDate = self->_lastCommitDate;
  committedTotal = self->_committedTotal;
  [(FITrailingQuantityTimeSlice *)self committedDuration];
  id v13 = [v15 stringWithFormat:@"<%@:%p, finalized:%@, quantityType:%@, startDate:%@, endDate:%@, numCommittedSamples:%lu, numUncommittedSamples:%lu, lastCommitDate:%@, commitedTotal:%@ committedDuration:%lu>", v3, self, v4, v5, v6, v7, v8, v9, lastCommitDate, committedTotal, (uint64_t)v12];

  return v13;
}

@end