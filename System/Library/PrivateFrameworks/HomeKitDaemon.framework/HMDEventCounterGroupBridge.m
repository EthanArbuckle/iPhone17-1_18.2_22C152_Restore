@interface HMDEventCounterGroupBridge
- (HMDEventCounterGroupBridge)initWithContext:(id)a3 bridgedCounterGroup:(id)a4 dateProvider:(id)a5 statisticsGroupBlock:(id)a6;
- (HMDEventCounterGroupBridge)initWithContext:(id)a3 bridgedCounterGroup:(id)a4 groupDate:(id)a5 statisticsGroupBlock:(id)a6;
- (HMDEventCounterGroupBridge)initWithContext:(id)a3 bridgedCounterGroup:(id)a4 queryDateBlock:(id)a5 statisticsGroupBlock:(id)a6;
- (HMMCounterGroup)bridgedCounterGroup;
- (HMMStatisticsGroup)bridgedStatisticsGroup;
- (double)durationForCounter:(id)a3;
- (double)durationForCounter:(id)a3 forDate:(id)a4;
- (id)eventCounters;
- (id)eventCountersForDate:(id)a3;
- (id)queryDateBlock;
- (id)statisticsGroupBlock;
- (unint64_t)fetchEventCounterForEventName:(id)a3;
- (unint64_t)fetchEventCounterForEventName:(id)a3 forDate:(id)a4;
- (unint64_t)fetchMaxValueForStatisticsName:(id)a3;
- (unint64_t)maxCounterName:(id *)a3;
- (unint64_t)summedEventCounters;
- (unint64_t)summedEventCountersForDate:(id)a3;
- (void)addMaxValueObserver:(id)a3 forStatisticsName:(id)a4;
- (void)addObserver:(id)a3 forEventName:(id)a4;
- (void)addValue:(unint64_t)a3 toStatisticsName:(id)a4;
- (void)incrementEventCounterForEventName:(id)a3 withValue:(unint64_t)a4;
- (void)pauseDurationCounter:(id)a3;
- (void)resumeDurationCounter:(id)a3;
@end

@implementation HMDEventCounterGroupBridge

- (void).cxx_destruct
{
  objc_storeStrong(&self->_queryDateBlock, 0);
  objc_storeStrong(&self->_statisticsGroupBlock, 0);
  objc_storeStrong((id *)&self->_bridgedCounterGroup, 0);
  objc_storeStrong((id *)&self->_bridgedStatisticsGroup, 0);
}

- (id)queryDateBlock
{
  return self->_queryDateBlock;
}

- (id)statisticsGroupBlock
{
  return self->_statisticsGroupBlock;
}

- (HMMCounterGroup)bridgedCounterGroup
{
  return self->_bridgedCounterGroup;
}

- (unint64_t)maxCounterName:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__81990;
  v20 = __Block_byref_object_dispose__81991;
  id v21 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v5 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  v6 = [(HMDEventCounterGroupBridge *)self queryDateBlock];
  v7 = v6[2]();
  v8 = [v5 countersInDatePartition:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__HMDEventCounterGroupBridge_maxCounterName___block_invoke;
  v11[3] = &unk_264A26D78;
  v11[4] = &v12;
  v11[5] = &v16;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];

  if (a3) {
    *a3 = (id) v17[5];
  }
  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __45__HMDEventCounterGroupBridge_maxCounterName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  unint64_t v6 = [a3 unsignedIntegerValue];
  if (v6 > *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    unint64_t v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
  }
}

- (unint64_t)summedEventCountersForDate:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  unint64_t v6 = [v5 sumOfCountersInDatePartition:v4];

  return v6;
}

- (unint64_t)summedEventCounters
{
  v3 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  id v4 = [(HMDEventCounterGroupBridge *)self queryDateBlock];
  v5 = v4[2]();
  unint64_t v6 = [v3 sumOfCountersInDatePartition:v5];

  return v6;
}

- (id)eventCountersForDate:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  unint64_t v6 = [v5 countersInDatePartition:v4];

  return v6;
}

- (id)eventCounters
{
  v3 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  id v4 = [(HMDEventCounterGroupBridge *)self queryDateBlock];
  v5 = v4[2]();
  unint64_t v6 = [v3 countersInDatePartition:v5];

  return v6;
}

- (unint64_t)fetchMaxValueForStatisticsName:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEventCounterGroupBridge *)self bridgedStatisticsGroup];
  unint64_t v6 = [(HMDEventCounterGroupBridge *)self queryDateBlock];
  unint64_t v7 = v6[2]();
  id v8 = [v5 statistics:v4 inDatePartition:v7];

  unint64_t v9 = [v8 maxValue];
  return v9;
}

- (double)durationForCounter:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  [v8 durationForCounter:v7 inDatePartition:v6];
  double v10 = v9;

  return v10;
}

- (double)durationForCounter:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  id v6 = [(HMDEventCounterGroupBridge *)self queryDateBlock];
  id v7 = v6[2]();
  [v5 durationForCounter:v4 inDatePartition:v7];
  double v9 = v8;

  return v9;
}

- (unint64_t)fetchEventCounterForEventName:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  unint64_t v9 = [v8 valueForCounter:v7 inDatePartition:v6];

  return v9;
}

- (unint64_t)fetchEventCounterForEventName:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEventCounterGroupBridge *)self queryDateBlock];
  id v6 = v5[2]();
  unint64_t v7 = [(HMDEventCounterGroupBridge *)self fetchEventCounterForEventName:v4 forDate:v6];

  return v7;
}

- (void)addValue:(unint64_t)a3 toStatisticsName:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(HMDEventCounterGroupBridge *)self bridgedStatisticsGroup];
  [v7 addValue:a3 toStatistics:v6];

  id v8 = [(HMDEventCounterGroup *)self context];
  [v8 counterChanged];
}

- (void)pauseDurationCounter:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  [v5 pauseDurationCounter:v4];
}

- (void)resumeDurationCounter:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  [v5 resumeDurationCounter:v4];
}

- (void)incrementEventCounterForEventName:(id)a3 withValue:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  [v7 incrementCounter:v6 by:a4];

  id v8 = [(HMDEventCounterGroup *)self context];
  [v8 counterChanged];
}

- (void)addMaxValueObserver:(id)a3 forStatisticsName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDEventCounterGroupBridge *)self bridgedStatisticsGroup];
  [v8 addMaxValueObserver:v7 forStatistics:v6];
}

- (void)addObserver:(id)a3 forEventName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDEventCounterGroupBridge *)self bridgedCounterGroup];
  [v8 addObserver:v7 forCounter:v6];
}

- (HMMStatisticsGroup)bridgedStatisticsGroup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_bridgedStatisticsGroup)
  {
    id v4 = [(HMDEventCounterGroupBridge *)self statisticsGroupBlock];
    v4[2]();
    id v5 = (HMMStatisticsGroup *)objc_claimAutoreleasedReturnValue();
    bridgedStatisticsGroup = self->_bridgedStatisticsGroup;
    self->_bridgedStatisticsGroup = v5;
  }
  os_unfair_lock_unlock(p_lock);
  id v7 = self->_bridgedStatisticsGroup;
  return v7;
}

- (HMDEventCounterGroupBridge)initWithContext:(id)a3 bridgedCounterGroup:(id)a4 queryDateBlock:(id)a5 statisticsGroupBlock:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x263F499F8];
  id v15 = a3;
  uint64_t v16 = [v14 sharedInstance];
  v23.receiver = self;
  v23.super_class = (Class)HMDEventCounterGroupBridge;
  v17 = [(HMDEventCounterGroup *)&v23 initWithContext:v15 serializedEventCounters:0 uptimeProvider:v16];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_bridgedCounterGroup, a4);
    uint64_t v18 = _Block_copy(v13);
    id statisticsGroupBlock = v17->_statisticsGroupBlock;
    v17->_id statisticsGroupBlock = v18;

    v20 = _Block_copy(v12);
    id queryDateBlock = v17->_queryDateBlock;
    v17->_id queryDateBlock = v20;
  }
  return v17;
}

- (HMDEventCounterGroupBridge)initWithContext:(id)a3 bridgedCounterGroup:(id)a4 groupDate:(id)a5 statisticsGroupBlock:(id)a6
{
  id v10 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__HMDEventCounterGroupBridge_initWithContext_bridgedCounterGroup_groupDate_statisticsGroupBlock___block_invoke;
  aBlock[3] = &unk_264A1D368;
  id v19 = v10;
  id v11 = v10;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = _Block_copy(aBlock);
  uint64_t v16 = [(HMDEventCounterGroupBridge *)self initWithContext:v14 bridgedCounterGroup:v13 queryDateBlock:v15 statisticsGroupBlock:v12];

  return v16;
}

id __97__HMDEventCounterGroupBridge_initWithContext_bridgedCounterGroup_groupDate_statisticsGroupBlock___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (HMDEventCounterGroupBridge)initWithContext:(id)a3 bridgedCounterGroup:(id)a4 dateProvider:(id)a5 statisticsGroupBlock:(id)a6
{
  id v10 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__HMDEventCounterGroupBridge_initWithContext_bridgedCounterGroup_dateProvider_statisticsGroupBlock___block_invoke;
  aBlock[3] = &unk_264A1D368;
  id v19 = v10;
  id v11 = v10;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = _Block_copy(aBlock);
  uint64_t v16 = [(HMDEventCounterGroupBridge *)self initWithContext:v14 bridgedCounterGroup:v13 queryDateBlock:v15 statisticsGroupBlock:v12];

  return v16;
}

uint64_t __100__HMDEventCounterGroupBridge_initWithContext_bridgedCounterGroup_dateProvider_statisticsGroupBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startOfDayByAddingDayCount:-1];
}

@end