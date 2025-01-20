@interface HMDLogEventProcessMemoryEventsAnalyzer
+ (id)managedEventCounterRequestGroups;
- (HMDEventCountersManager)eventCountersManager;
- (HMDLogEventProcessMemoryEventsAnalyzer)initWithDataSource:(id)a3;
- (HMMRadarInitiating)radarInitiator;
- (unint64_t)storedAverageProcessMemoryKB;
- (unint64_t)storedPeakProcessMemoryKB;
- (void)_handleMemoryPressureNotificationLogEvent:(id)a3;
- (void)_handleMemorySampleLogEvent:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)resetAggregationAnalysisContext;
@end

@implementation HMDLogEventProcessMemoryEventsAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarInitiator, 0);
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
}

- (HMMRadarInitiating)radarInitiator
{
  return (HMMRadarInitiating *)objc_getProperty(self, a2, 16, 1);
}

- (HMDEventCountersManager)eventCountersManager
{
  return (HMDEventCountersManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)resetAggregationAnalysisContext
{
  id v2 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
  [v2 resetEventCountersForRequestGroup:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
  id v10 = [v8 counterGroupForName:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"];

  objc_msgSend(v7, "setProcessMemoryPressureStateWarningCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventProcessMemoryEventsAnalyzerProcessMemoryPressureStateWarningEventCounter", v6));
  uint64_t v9 = [v10 fetchEventCounterForEventName:@"HMDLogEventProcessMemoryEventsAnalyzerProcessMemoryPressureStateCriticalEventCounter" forDate:v6];

  [v7 setProcessMemoryPressureStateCriticalCount:v9];
  objc_msgSend(v7, "setSampledAverageProcessMemoryUsageMB:", -[HMDLogEventProcessMemoryEventsAnalyzer storedAverageProcessMemoryKB](self, "storedAverageProcessMemoryKB") >> 10);
  objc_msgSend(v7, "setSampledPeakProcessMemoryUsageMB:", -[HMDLogEventProcessMemoryEventsAnalyzer storedPeakProcessMemoryKB](self, "storedPeakProcessMemoryKB") >> 10);
}

- (void)_handleMemorySampleLogEvent:(id)a3
{
  id v13 = a3;
  unint64_t v4 = [v13 currentMemoryUsage];
  unint64_t v5 = ((unint64_t)[v13 intervalMaxMemoryUsage] >> 10);
  id v6 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
  id v7 = [v6 counterGroupForName:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"];

  [v7 addValue:v5 toStatisticsName:@"HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySamplePeakValueKB"];
  v8 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self radarInitiator];

  if (v8 && v5 > 0x1E000)
  {
    uint64_t v9 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self radarInitiator];
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"homed used excessive memory: %lu KB", v5);
    [v9 requestRadarWithDisplayReason:@"homed used excessive memory" radarTitle:v10 componentName:@"HomeKit" componentVersion:@"Performance - Memory" componentID:1302798];
  }
  if ([v13 reason] == 1)
  {
    v11 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
    [v11 incrementEventCounterForEventName:@"HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySampleEventCount" requestGroup:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"];

    v12 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
    [v12 incrementEventCounterForEventName:@"HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySampleAggregateValueKB" requestGroup:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup" withValue:(v4 >> 10)];
  }
}

- (void)_handleMemoryPressureNotificationLogEvent:(id)a3
{
  id v10 = a3;
  unint64_t v4 = [v10 processMemoryState];
  int v5 = [v4 isEqualToString:@"HMFProcessMemoryStateWarning"];

  if (v5)
  {
    id v6 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
    [v6 incrementEventCounterForEventName:@"HMDLogEventProcessMemoryEventsAnalyzerProcessMemoryPressureStateWarningEventCounter" requestGroup:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"];
  }
  else
  {
    id v7 = [v10 processMemoryState];
    int v8 = [v7 isEqualToString:@"HMFProcessMemoryStateCritical"];

    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v9 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
    [v9 incrementEventCounterForEventName:@"HMDLogEventProcessMemoryEventsAnalyzerProcessMemoryPressureStateCriticalEventCounter" requestGroup:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"];

    id v6 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
    [v6 forceSave];
  }

LABEL_6:
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;
  if (v6) {
    [(HMDLogEventProcessMemoryEventsAnalyzer *)self _handleMemoryPressureNotificationLogEvent:v6];
  }
  id v9 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v9;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    [(HMDLogEventProcessMemoryEventsAnalyzer *)self _handleMemorySampleLogEvent:v8];
  }
}

- (unint64_t)storedPeakProcessMemoryKB
{
  id v2 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
  v3 = [v2 counterGroupForName:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"];

  unint64_t v4 = [v3 fetchMaxValueForStatisticsName:@"HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySamplePeakValueKB"];
  return v4;
}

- (unint64_t)storedAverageProcessMemoryKB
{
  v3 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
  unint64_t v4 = [v3 fetchEventCounterForEventName:@"HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySampleEventCount" requestGroup:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"];

  if (!v4) {
    return 0;
  }
  int v5 = [(HMDLogEventProcessMemoryEventsAnalyzer *)self eventCountersManager];
  unint64_t v6 = [v5 fetchEventCounterForEventName:@"HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySampleAggregateValueKB" requestGroup:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"];

  return v6 / v4;
}

- (HMDLogEventProcessMemoryEventsAnalyzer)initWithDataSource:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDLogEventProcessMemoryEventsAnalyzer;
  int v5 = [(HMDLogEventProcessMemoryEventsAnalyzer *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 legacyCountersManager];
    eventCountersManager = v5->_eventCountersManager;
    v5->_eventCountersManager = (HMDEventCountersManager *)v6;

    uint64_t v8 = [v4 radarInitiator];
    radarInitiator = v5->_radarInitiator;
    v5->_radarInitiator = (HMMRadarInitiating *)v8;

    [v4 addThresholdTrigger:@"memoryPressureStateCritical" forEventName:@"HMDLogEventProcessMemoryEventsAnalyzerProcessMemoryPressureStateCriticalEventCounter" requestGroup:@"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup" atThreshold:1];
  }

  return v5;
}

+ (id)managedEventCounterRequestGroups
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"HMDLogEventProcessMemoryEventsAnalyzerRequestGroup";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end