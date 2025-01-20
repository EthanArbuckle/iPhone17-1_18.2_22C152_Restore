@interface WDSleepStageSampleBucket
- (HKDevice)device;
- (HKSortedSampleArray)sortedSamples;
- (HKSourceRevision)sourceRevision;
- (NSArray)samples;
- (NSPredicate)predicate;
- (WDSleepStageSampleBucket)initWithSleepStage:(int64_t)a3 timePeriod:(id)a4 sourceRevision:(id)a5 device:(id)a6;
- (WDTimePeriod)timePeriod;
- (double)totalDuration;
- (int64_t)sleepStage;
- (unint64_t)numberOfSamples;
- (unint64_t)sortNumber;
- (void)addSample:(id)a3;
- (void)removeAllSamples;
- (void)removeSample:(id)a3;
@end

@implementation WDSleepStageSampleBucket

- (WDSleepStageSampleBucket)initWithSleepStage:(int64_t)a3 timePeriod:(id)a4 sourceRevision:(id)a5 device:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WDSleepStageSampleBucket;
  v14 = [(WDSleepStageSampleBucket *)&v20 init];
  v15 = v14;
  if (v14)
  {
    v14->_sleepStage = a3;
    objc_storeStrong((id *)&v14->_timePeriod, a4);
    objc_storeStrong((id *)&v15->_sourceRevision, a5);
    objc_storeStrong((id *)&v15->_device, a6);
    v16 = (HKSortedSampleArray *)objc_alloc_init(MEMORY[0x263F0A798]);
    sortedSamples = v15->_sortedSamples;
    v15->_sortedSamples = v16;

    v18 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F80] ascending:0];
    [(HKSortedSampleArray *)v15->_sortedSamples setSortDescriptor:v18];
  }
  return v15;
}

- (void)addSample:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  sortedSamples = self->_sortedSamples;
  id v7 = a3;
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v7 count:1];
  -[HKSortedSampleArray insertSamples:](sortedSamples, "insertSamples:", v6, v7, v8);
}

- (void)removeSample:(id)a3
{
}

- (void)removeAllSamples
{
}

- (NSArray)samples
{
  return (NSArray *)[(HKSortedSampleArray *)self->_sortedSamples allSamples];
}

- (unint64_t)numberOfSamples
{
  return [(HKSortedSampleArray *)self->_sortedSamples count];
}

- (double)totalDuration
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(HKSortedSampleArray *)self->_sortedSamples allSamples];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__WDSleepStageSampleBucket_totalDuration__block_invoke;
  v5[3] = &unk_26458DF58;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __41__WDSleepStageSampleBucket_totalDuration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 endDate];
  id v5 = [v3 startDate];

  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v7 + *(double *)(v8 + 24);
  *(double *)(v8 + 24) = result;
  return result;
}

- (NSPredicate)predicate
{
  v18[3] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F0A668] predicateForCategorySamplesWithOperatorType:4 value:self->_sleepStage];
  v4 = (void *)MEMORY[0x263F0A668];
  id v5 = [(WDTimePeriod *)self->_timePeriod startDate];
  double v6 = [(WDTimePeriod *)self->_timePeriod endDate];
  double v7 = [v4 predicateForSamplesWithStartDate:v5 endDate:v6 options:0];

  uint64_t v8 = (void *)MEMORY[0x263F0A668];
  uint64_t v9 = (void *)MEMORY[0x263EFFA08];
  v10 = [(WDSleepStageSampleBucket *)self sourceRevision];
  id v11 = [v10 source];
  id v12 = [v9 setWithObject:v11];
  id v13 = [v8 predicateForObjectsFromSources:v12];

  v14 = (void *)MEMORY[0x263F08730];
  v18[0] = v7;
  v18[1] = v3;
  v18[2] = v13;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v16 = [v14 andPredicateWithSubpredicates:v15];

  return (NSPredicate *)v16;
}

- (HKDevice)device
{
  return self->_device;
}

- (int64_t)sleepStage
{
  return self->_sleepStage;
}

- (WDTimePeriod)timePeriod
{
  return self->_timePeriod;
}

- (HKSourceRevision)sourceRevision
{
  return self->_sourceRevision;
}

- (HKSortedSampleArray)sortedSamples
{
  return self->_sortedSamples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedSamples, 0);
  objc_storeStrong((id *)&self->_sourceRevision, 0);
  objc_storeStrong((id *)&self->_timePeriod, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (unint64_t)sortNumber
{
  int64_t v2 = [(WDSleepStageSampleBucket *)self sleepStage];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_22113DF70[v2 - 1];
  }
}

@end