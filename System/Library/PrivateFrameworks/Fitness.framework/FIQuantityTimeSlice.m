@interface FIQuantityTimeSlice
- (BOOL)finalized;
- (FIQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4;
- (FIQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (FIQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5 uncommitedSamples:(id)a6 lastCommitDate:(id)a7 committedTotal:(id)a8 finalized:(BOOL)a9;
- (HKQuantity)committedAndAddedTotal;
- (HKQuantity)committedTotal;
- (HKQuantityType)quantityType;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)_commitingSamples:(id)a3 toPreviousCommittedTotal:(id)a4 untilDate:(id)a5 startDate:(id)a6 endDate:(id)a7;
- (id)_totalByCommittingSample:(id)a3 toPreviousTotal:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (id)addingSample:(id)a3 error:(id *)a4;
- (id)addingSamples:(id)a3 error:(id *)a4;
- (id)committingUntilDate:(id)a3;
- (id)description;
- (id)settingEndDate:(id)a3;
@end

@implementation FIQuantityTimeSlice

- (FIQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4
{
  v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 distantFuture];
  v10 = [(FIQuantityTimeSlice *)self initWithQuantityType:v8 startDate:v7 endDate:v9];

  return v10;
}

- (FIQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF910];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 distantPast];
  v13 = (void *)MEMORY[0x263F0A630];
  v14 = [v11 canonicalUnit];
  v15 = [v13 quantityWithUnit:v14 doubleValue:0.0];
  LOBYTE(v18) = 0;
  v16 = [(FIQuantityTimeSlice *)self initWithQuantityType:v11 startDate:v10 endDate:v9 uncommitedSamples:MEMORY[0x263EFFA68] lastCommitDate:v12 committedTotal:v15 finalized:v18];

  return v16;
}

- (FIQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5 uncommitedSamples:(id)a6 lastCommitDate:(id)a7 committedTotal:(id)a8 finalized:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)FIQuantityTimeSlice;
  v19 = [(FIQuantityTimeSlice *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_quantityType, a3);
    objc_storeStrong((id *)&v20->_startDate, a4);
    objc_storeStrong((id *)&v20->_endDate, a5);
    objc_storeStrong((id *)&v20->_uncommittedSamples, a6);
    objc_storeStrong((id *)&v20->_lastCommitDate, a7);
    objc_storeStrong((id *)&v20->_committedTotal, a8);
    v20->_finalized = a9;
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

- (id)addingSamples:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__5;
  v14[4] = __Block_byref_object_dispose__5;
  id v15 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__FIQuantityTimeSlice_addingSamples_error___block_invoke;
  v9[3] = &unk_26441CF08;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = v14;
  [v5 enumerateObjectsUsingBlock:v9];
  if (*((unsigned char *)v11 + 24))
  {
    uint64_t v6 = [(NSArray *)self->_uncommittedSamples arrayByAddingObjectsFromArray:v5];
    uint64_t v7 = [(FIQuantityTimeSlice *)self _commitingSamples:v6 toPreviousCommittedTotal:self->_committedTotal untilDate:self->_lastCommitDate startDate:self->_startDate endDate:self->_endDate];
  }
  else
  {
    uint64_t v7 = self;
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);

  return v7;
}

void __43__FIQuantityTimeSlice_addingSamples_error___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = a1[4];
  uint64_t v8 = *(void **)(v7 + 40);
  id v9 = *(void **)(v7 + 48);
  int v10 = *(unsigned __int8 *)(v7 + 24);
  uint64_t v11 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v11 + 40);
  char v12 = _ValidateSample_0(a2, v8, v9, v10, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v12;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *a4 = 1;
  }
}

- (id)addingSample:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (_ValidateSample_0(v6, self->_startDate, self->_endDate, self->_finalized, a4))
  {
    uint64_t v7 = [(NSArray *)self->_uncommittedSamples arrayByAddingObject:v6];
    uint64_t v8 = [(FIQuantityTimeSlice *)self _commitingSamples:v7 toPreviousCommittedTotal:self->_committedTotal untilDate:self->_lastCommitDate startDate:self->_startDate endDate:self->_endDate];
  }
  else
  {
    uint64_t v8 = self;
  }

  return v8;
}

- (id)committingUntilDate:(id)a3
{
  return [(FIQuantityTimeSlice *)self _commitingSamples:self->_uncommittedSamples toPreviousCommittedTotal:self->_committedTotal untilDate:a3 startDate:self->_startDate endDate:self->_endDate];
}

- (id)settingEndDate:(id)a3
{
  id v4 = a3;
  id v5 = [FIQuantityTimeSlice alloc];
  LOBYTE(v9) = self->_finalized;
  id v6 = [(FIQuantityTimeSlice *)v5 initWithQuantityType:self->_quantityType startDate:self->_startDate endDate:v4 uncommitedSamples:self->_uncommittedSamples lastCommitDate:self->_lastCommitDate committedTotal:self->_committedTotal finalized:v9];
  uint64_t v7 = [(FIQuantityTimeSlice *)v6 committingUntilDate:v4];

  return v7;
}

- (BOOL)finalized
{
  return self->_finalized;
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
  objc_storeStrong((id *)&self->_uncommittedSamples, 0);
}

- (id)_totalByCommittingSample:(id)a3 toPreviousTotal:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  uint64_t v9 = (objc_class *)MEMORY[0x263F08798];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[[v9 alloc] initWithStartDate:v11 endDate:v10];

  uint64_t v18 = 0;
  id v15 = FISampleQuantityInsideDateInterval(v13, v14, &v18);

  long long v16 = [v12 _quantityByAddingQuantity:v15];

  return v16;
}

- (id)_commitingSamples:(id)a3 toPreviousCommittedTotal:(id)a4 untilDate:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__5;
  v48 = __Block_byref_object_dispose__5;
  id v17 = v13;
  id v49 = v17;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __112__FIQuantityTimeSlice_SampleProcessing___commitingSamples_toPreviousCommittedTotal_untilDate_startDate_endDate___block_invoke;
  v32 = &unk_26441CF30;
  id v18 = v14;
  id v33 = v18;
  id v19 = v15;
  id v34 = v19;
  id v20 = v16;
  id v35 = v20;
  v36 = self;
  v37 = &v44;
  v38 = &v50;
  v39 = &v40;
  [v12 enumerateObjectsUsingBlock:&v29];
  uint64_t v21 = v51[3];
  uint64_t v22 = [v12 count];
  id v23 = objc_msgSend(v12, "subarrayWithRange:", v21, v22 - v51[3]);
  id v24 = [FIQuantityTimeSlice alloc];
  objc_super v25 = [(FIQuantityTimeSlice *)self quantityType];
  LOBYTE(v28) = *((unsigned char *)v41 + 24);
  v26 = -[FIQuantityTimeSlice initWithQuantityType:startDate:endDate:uncommitedSamples:lastCommitDate:committedTotal:finalized:](v24, "initWithQuantityType:startDate:endDate:uncommitedSamples:lastCommitDate:committedTotal:finalized:", v25, v19, v20, v23, v18, v45[5], v28, v29, v30, v31, v32);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v26;
}

void __112__FIQuantityTimeSlice_SampleProcessing___commitingSamples_toPreviousCommittedTotal_untilDate_startDate_endDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 48);
  id v17 = v6;
  id v9 = v7;
  id v10 = v8;
  if ((objc_msgSend(v17, "fi_isAfterDate:", v10) & 1) == 0)
  {
    if ((objc_msgSend(v17, "fi_isAfterDate:", v9) & 1) == 0)
    {
      if (objc_msgSend(v17, "fi_spansDate:useStrictDateLimits:", v10, 0))
      {

        uint64_t v11 = [*(id *)(a1 + 56) _totalByCommittingSample:v17 toPreviousTotal:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) startDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48)];
        uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
        id v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
        goto LABEL_9;
      }
      if ((objc_msgSend(v17, "fi_spansDate:useStrictDateLimits:", v9, 1) & 1) == 0)
      {

        uint64_t v14 = [*(id *)(a1 + 56) _totalByCommittingSample:v17 toPreviousTotal:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) startDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48)];
        uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
        id v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        goto LABEL_9;
      }
    }

    *a4 = 1;
    goto LABEL_10;
  }

LABEL_9:
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
LABEL_10:
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(FIQuantityTimeSlice *)self finalized]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  id v6 = [(FIQuantityTimeSlice *)self quantityType];
  uint64_t v7 = [(FIQuantityTimeSlice *)self startDate];
  uint64_t v8 = [(FIQuantityTimeSlice *)self endDate];
  id v9 = [v3 stringWithFormat:@"<%@:%p, finalized:%@, quantityType:%@, startDate:%@, endDate:%@, numUncommitedSamples:%lu, lastCommitDate:%@, commitedTotal:%@>", v4, self, v5, v6, v7, v8, -[NSArray count](self->_uncommittedSamples, "count"), self->_lastCommitDate, self->_committedTotal];

  return v9;
}

@end