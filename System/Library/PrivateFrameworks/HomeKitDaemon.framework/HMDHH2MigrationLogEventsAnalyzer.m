@interface HMDHH2MigrationLogEventsAnalyzer
- (HMDCounterThresholdTTRTrigger)migrationFailureTTRTrigger;
- (HMDEventCounterGroup)counterGroup;
- (HMDHH2MigrationLogEventsAnalyzer)initWithDataSource:(id)a3;
- (OS_dispatch_queue)queue;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)runDailyTask;
@end

@implementation HMDHH2MigrationLogEventsAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_migrationFailureTTRTrigger, 0);
}

- (HMDEventCounterGroup)counterGroup
{
  return self->_counterGroup;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCounterThresholdTTRTrigger)migrationFailureTTRTrigger
{
  return self->_migrationFailureTTRTrigger;
}

- (void)runDailyTask
{
  v3 = [(HMDHH2MigrationLogEventsAnalyzer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HMDHH2MigrationLogEventsAnalyzer_runDailyTask__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __48__HMDHH2MigrationLogEventsAnalyzer_runDailyTask__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) counterGroup];
  [v1 resetEventCounters];
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDHH2MigrationLogEventsAnalyzer_didReceiveEventFromDispatcher___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__HMDHH2MigrationLogEventsAnalyzer_didReceiveEventFromDispatcher___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v16 = v3;

  id v4 = v16;
  if (v16)
  {
    BOOL v5 = (unint64_t)[v16 migrationEventType] >= 4;
    id v4 = v16;
    if (v5)
    {
      id v6 = [v16 error];
      id v4 = v16;
      if (v6)
      {
        id v7 = [v16 error];
        id v8 = [v7 domain];
        int v9 = [v8 isEqualToString:*MEMORY[0x263F0C710]];

        if (v9)
        {
          uint64_t v10 = [v7 code];
          if ((unint64_t)(v10 - 2704) <= 0x1C)
          {
            if (((1 << (v10 + 112)) & 0x1F718102) != 0)
            {
LABEL_11:

LABEL_22:
              id v4 = v16;
              goto LABEL_23;
            }
            if (v10 == 2704)
            {
              v11 = [v7 userInfo];
              v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F08608]];

              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v13 = v12;
              }
              else {
                v13 = 0;
              }
              id v14 = v13;

              char v15 = isTransientCloudKitError(v14);
              id v4 = v16;
              if (v15) {
                goto LABEL_23;
              }
              goto LABEL_21;
            }
          }
          if ((unint64_t)(v10 - 75) < 2 || v10 == 2013) {
            goto LABEL_11;
          }
        }

LABEL_21:
        id v6 = [*(id *)(a1 + 40) counterGroup];
        [v6 incrementEventCounterForEventName:@"migrationFailureToTriggerTTRCounter"];
        goto LABEL_22;
      }
    }
  }
LABEL_23:
}

- (HMDHH2MigrationLogEventsAnalyzer)initWithDataSource:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HMDHH2MigrationLogEventsAnalyzer;
  BOOL v5 = [(HMDHH2MigrationLogEventsAnalyzer *)&v21 init];
  if (v5)
  {
    id v6 = [v4 legacyCountersManager];
    uint64_t v7 = [v6 counterGroupForName:@"HMDHH2MigrationLogEventsAnalyzerGroupName"];
    counterGroup = v5->_counterGroup;
    v5->_counterGroup = (HMDEventCounterGroup *)v7;

    int v9 = [v4 logEventDispatcher];
    uint64_t v10 = [v9 clientQueue];
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    v12 = [v4 logEventDispatcher];
    [v12 addObserver:v5 forEventClass:objc_opt_class()];

    v13 = [v4 radarInitiator];

    if (v13)
    {
      id v14 = [HMDCounterThresholdTTRTrigger alloc];
      char v15 = [v4 radarInitiator];
      uint64_t v16 = [(HMDCounterThresholdTTRTrigger *)v14 initWithThreshold:1 displayReason:@"HH2 migration failed" radarInitiator:v15];
      migrationFailureTTRTrigger = v5->_migrationFailureTTRTrigger;
      v5->_migrationFailureTTRTrigger = (HMDCounterThresholdTTRTrigger *)v16;

      v18 = [v4 legacyCountersManager];
      [v18 addObserver:v5->_migrationFailureTTRTrigger forEventName:@"migrationFailureToTriggerTTRCounter" requestGroup:@"HMDHH2MigrationLogEventsAnalyzerGroupName"];
    }
    v19 = [v4 dailyScheduler];
    [v19 registerDailyTaskRunner:v5];
  }
  return v5;
}

@end