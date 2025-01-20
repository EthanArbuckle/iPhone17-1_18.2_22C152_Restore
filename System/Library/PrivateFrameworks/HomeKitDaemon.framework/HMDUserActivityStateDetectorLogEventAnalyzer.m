@interface HMDUserActivityStateDetectorLogEventAnalyzer
- (HMDEventCounterGroup)type3DetectorTransitionCounterGroup;
- (HMDEventCounterGroup)type6DetectorTransitionCounterGroup;
- (HMDLogEventAnalyzerDataSource)dataSource;
- (HMDUserActivityStateDetectorLogEventAnalyzer)initWithDataSource:(id)a3;
- (unint64_t)maxCoreLocationStateEndOffset;
- (void)configure;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)handleType3LogEvent:(id)a3;
- (void)handleType6TransitionLogEvent:(id)a3;
- (void)resetCounterGroups;
- (void)resetType6DetectorTransitionCounterGroup;
- (void)runDailyTask;
- (void)setMaxCoreLocationStateEndOffset:(unint64_t)a3;
- (void)submitCounterGroups;
- (void)submitType3DetectorCounterGroups;
- (void)submitType6DetectorTransitionCounterGroups;
@end

@implementation HMDUserActivityStateDetectorLogEventAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type3DetectorTransitionCounterGroup, 0);
  objc_storeStrong((id *)&self->_type6DetectorTransitionCounterGroup, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (HMDEventCounterGroup)type3DetectorTransitionCounterGroup
{
  return self->_type3DetectorTransitionCounterGroup;
}

- (HMDEventCounterGroup)type6DetectorTransitionCounterGroup
{
  return (HMDEventCounterGroup *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMaxCoreLocationStateEndOffset:(unint64_t)a3
{
  self->_maxCoreLocationStateEndOffset = a3;
}

- (unint64_t)maxCoreLocationStateEndOffset
{
  return self->_maxCoreLocationStateEndOffset;
}

- (HMDLogEventAnalyzerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)resetType6DetectorTransitionCounterGroup
{
  [(HMDUserActivityStateDetectorLogEventAnalyzer *)self setMaxCoreLocationStateEndOffset:0];
  id v3 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self type6DetectorTransitionCounterGroup];
  [v3 resetEventCounters];
}

- (void)resetCounterGroups
{
  [(HMDUserActivityStateDetectorLogEventAnalyzer *)self resetType6DetectorTransitionCounterGroup];
  id v3 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self type3DetectorTransitionCounterGroup];
  [v3 resetEventCounters];
}

- (void)submitType3DetectorCounterGroups
{
  id v6 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self type3DetectorTransitionCounterGroup];
  id v3 = -[HMDUserActivityType3StateDailyCountLogEvent initWithTotalManualScheduleUpdateCount:totalAutomaticScheduleStateUpdateCount:totalManualFocusUpdateCount:enterType5ByManualScheduleUpdateCount:enterType5ByAutomaticScheduleStateUpdateCount:enterType5ByManualFocusUpdateCount:enterTransitionByManualScheduleUpdateCount:enterTransitionByAutomaticScheduleStateUpdateCount:enterTransitionByManualFocusUpdateCount:]([HMDUserActivityType3StateDailyCountLogEvent alloc], "initWithTotalManualScheduleUpdateCount:totalAutomaticScheduleStateUpdateCount:totalManualFocusUpdateCount:enterType5ByManualScheduleUpdateCount:enterType5ByAutomaticScheduleStateUpdateCount:enterType5ByManualFocusUpdateCount:enterTransitionByManualScheduleUpdateCount:enterTransitionByAutomaticScheduleStateUpdateCount:enterTransitionByManualFocusUpdateCount:", [v6 fetchEventCounterForEventName:@"totalManualScheduleUpdateCount"], objc_msgSend(v6, "fetchEventCounterForEventName:", @"totalAutomaticScheduleStateUpdateCount"), objc_msgSend(v6, "fetchEventCounterForEventName:", @"totalManualFocusUpdateCount"), objc_msgSend(v6, "fetchEventCounterForEventName:", @"enterType5ByManualScheduleUpdateCount"), objc_msgSend(v6, "fetchEventCounterForEventName:", @"enterType5ByAutomaticScheduleStateUpdateCount"), objc_msgSend(v6, "fetchEventCounterForEventName:", @"enterType5ByManualFocusUpdateCount"), objc_msgSend(v6, "fetchEventCounterForEventName:", @"enterTransitionByManualScheduleUpdateCount"), objc_msgSend(v6, "fetchEventCounterForEventName:", @"enterTransitionByAutomaticScheduleStateUpdateCount"), objc_msgSend(v6, "fetchEventCounterForEventName:", @"enterTransitionByManualFocusUpdateCount"));
  v4 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self dataSource];
  v5 = [v4 logEventSubmitter];
  [v5 submitLogEvent:v3];
}

- (void)submitType6DetectorTransitionCounterGroups
{
  id v45 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self type6DetectorTransitionCounterGroup];
  v2 = [NSString stringWithFormat:@"%@-%@", @"None", @"EndedHome"];
  uint64_t v34 = [v45 fetchEventCounterForEventName:v2];
  id v3 = [NSString stringWithFormat:@"%@-%@", @"CoreLocation", @"Started"];

  uint64_t v42 = [v45 fetchEventCounterForEventName:v3];
  v4 = [NSString stringWithFormat:@"%@-%@", @"CoreLocation", @"EndedHome"];

  uint64_t v40 = [v45 fetchEventCounterForEventName:v4];
  v5 = [NSString stringWithFormat:@"%@-%@", @"CoreLocation", @"ArrivedHomeWithVisit"];

  uint64_t v38 = [v45 fetchEventCounterForEventName:v5];
  id v6 = [NSString stringWithFormat:@"%@-%@", @"CoreLocation", @"ArrivedNonHome"];

  uint64_t v36 = [v45 fetchEventCounterForEventName:v6];
  v7 = [NSString stringWithFormat:@"%@-%@", @"CoreLocation", @"EndedTooFarAway"];

  uint64_t v8 = [v45 fetchEventCounterForEventName:v7];
  v9 = [NSString stringWithFormat:@"%@-%@", @"CoreLocation", @"EndedTooLongAway"];

  uint64_t v10 = [v45 fetchEventCounterForEventName:v9];
  v11 = [NSString stringWithFormat:@"%@-%@", @"CoreLocation", @"EndedNoProgress"];

  uint64_t v12 = [v45 fetchEventCounterForEventName:v11];
  v13 = [NSString stringWithFormat:@"%@-%@", @"CoreLocation", @"EndDateUpdated"];

  uint64_t v14 = [v45 fetchEventCounterForEventName:v13];
  v15 = [NSString stringWithFormat:@"%@-%@", @"CoreLocation", @"IgnoredVisitExit"];

  uint64_t v16 = [v45 fetchEventCounterForEventName:v15];
  v17 = [NSString stringWithFormat:@"%@-%@", @"CoreLocation", @"IgnoredVisitEntry"];

  uint64_t v18 = [v45 fetchEventCounterForEventName:v17];
  uint64_t v19 = v8 + v36;
  uint64_t v20 = v8 + v36 + v42 + v40 + v38 + v10 + v12 + v14 + v16 + v18;
  if (v20)
  {
    v37 = v17;
    uint64_t v21 = v18 + v38;
    uint64_t v22 = v16 + v42;
    uint64_t v23 = v19 + v10;
    v24 = [HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent alloc];
    v43 = [NSNumber numberWithUnsignedInteger:v34];
    v25 = [NSNumber numberWithUnsignedInteger:v20];
    v41 = [NSNumber numberWithUnsignedInteger:v40];
    v39 = [NSNumber numberWithUnsignedInteger:v38];
    v26 = [NSNumber numberWithUnsignedInteger:v23];
    v33 = [NSNumber numberWithUnsignedInteger:v12];
    v27 = [NSNumber numberWithUnsignedInteger:v14];
    v28 = [NSNumber numberWithUnsignedInteger:v22];
    v29 = [NSNumber numberWithUnsignedInteger:v21];
    v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityStateDetectorLogEventAnalyzer maxCoreLocationStateEndOffset](self, "maxCoreLocationStateEndOffset"));
    v35 = [(HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *)v24 initWithEndedHomeCount:v43 coreLocationCount:v25 coreLocationEndedHomeCount:v41 coreLocationEndedNonHome:v39 coreLocationEndedNotMakingProgress:v26 coreLocationResume:v33 coreLocationEndDateUpdated:v27 coreLocationVisitExit:v28 coreLocationVisitEntry:v29 maxCoreLocationStateEndOffset:v30];

    v31 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self dataSource];
    v32 = [v31 logEventSubmitter];
    [v32 submitLogEvent:v35];

    v17 = v37;
  }
}

- (void)submitCounterGroups
{
  [(HMDUserActivityStateDetectorLogEventAnalyzer *)self submitType6DetectorTransitionCounterGroups];
  [(HMDUserActivityStateDetectorLogEventAnalyzer *)self submitType3DetectorCounterGroups];
}

- (void)runDailyTask
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self dataSource];
  int v4 = [v3 isThisDeviceDesignatedFMFDevice];

  if (v4)
  {
    [(HMDUserActivityStateDetectorLogEventAnalyzer *)self submitCounterGroups];
  }
  else
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Not submitting daily task because this device is not FMF Device", (uint8_t *)&v9, 0xCu);
    }
  }
  [(HMDUserActivityStateDetectorLogEventAnalyzer *)self resetCounterGroups];
}

- (void)handleType3LogEvent:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [v11 logReason] - 1;
  if (v4 <= 2)
  {
    v5 = off_264A1EA90[v4];
    id v6 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self type3DetectorTransitionCounterGroup];
    [v6 incrementEventCounterForEventName:*v5];
  }
  if ([v11 didEnterType5])
  {
    unint64_t v7 = [v11 logReason] - 1;
    if (v7 < 3)
    {
      uint64_t v8 = off_264A1EAA8;
LABEL_9:
      int v9 = v8[v7];
      uint64_t v10 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self type3DetectorTransitionCounterGroup];
      [v10 incrementEventCounterForEventName:*v9];

      goto LABEL_10;
    }
  }
  if ([v11 didEnterTransition])
  {
    unint64_t v7 = [v11 logReason] - 1;
    if (v7 < 3)
    {
      uint64_t v8 = off_264A1EAC0;
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (void)handleType6TransitionLogEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 eventString];
  id v6 = (void *)MEMORY[0x230FBD990]();
  unint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v9;
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Incrementing daily total counters for %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)v7 type6DetectorTransitionCounterGroup];
  [v10 incrementEventCounterForEventName:v5];

  if ([v4 trackerType] == 2 && objc_msgSend(v4, "reason") == 2)
  {
    unint64_t v11 = [v4 stateEndOffset];
    if (v11 > -[HMDUserActivityStateDetectorLogEventAnalyzer maxCoreLocationStateEndOffset](v7, "maxCoreLocationStateEndOffset"))-[HMDUserActivityStateDetectorLogEventAnalyzer setMaxCoreLocationStateEndOffset:](v7, "setMaxCoreLocationStateEndOffset:", [v4 stateEndOffset]); {
  }
    }
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v9;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    [(HMDUserActivityStateDetectorLogEventAnalyzer *)self handleType6TransitionLogEvent:v5];
  }
  else
  {
    id v6 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0;
    }
    id v8 = v7;

    if (v8) {
      [(HMDUserActivityStateDetectorLogEventAnalyzer *)self handleType3LogEvent:v8];
    }
  }
}

- (void)configure
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self dataSource];
  id v4 = [v3 dailyScheduler];
  [v4 registerDailyTaskRunner:self];

  id v5 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)self dataSource];
  id v6 = [v5 logEventDispatcher];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  unint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v6 addObserver:self forEventClasses:v7];
}

- (HMDUserActivityStateDetectorLogEventAnalyzer)initWithDataSource:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDUserActivityStateDetectorLogEventAnalyzer;
  id v6 = [(HMDUserActivityStateDetectorLogEventAnalyzer *)&v17 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    id v8 = [v5 legacyCountersManager];
    id v9 = [NSString stringWithFormat:@"HMDUserActivityStateType6Transitions"];
    uint64_t v10 = [v8 counterGroupForName:v9];
    type6DetectorTransitionCounterGroup = v7->_type6DetectorTransitionCounterGroup;
    v7->_type6DetectorTransitionCounterGroup = (HMDEventCounterGroup *)v10;

    int v12 = [v5 legacyCountersManager];
    v13 = [NSString stringWithFormat:@"HMDUserActivityType3StateDailyCountLogEvent"];
    uint64_t v14 = [v12 counterGroupForName:v13];
    type3DetectorTransitionCounterGroup = v7->_type3DetectorTransitionCounterGroup;
    v7->_type3DetectorTransitionCounterGroup = (HMDEventCounterGroup *)v14;
  }
  [(HMDUserActivityStateDetectorLogEventAnalyzer *)v7 configure];

  return v7;
}

@end