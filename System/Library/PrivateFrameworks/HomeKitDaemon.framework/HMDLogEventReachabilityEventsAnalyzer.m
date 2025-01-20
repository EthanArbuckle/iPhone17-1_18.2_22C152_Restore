@interface HMDLogEventReachabilityEventsAnalyzer
+ (id)managedEventCounterRequestGroups;
- (HMDEventCountersManager)eventCountersManager;
- (HMDLogEventReachabilityEventsAnalyzer)initWithEventCountersManager:(id)a3;
- (void)_handleCameraRecordingReachabilityLogEvent:(id)a3;
- (void)_handleReachabiltiyAddRemoveEvent:(id)a3;
- (void)_handleRemoteDeviceReachabilityChangedLogEvent:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)resetAggregationAnalysisContext;
@end

@implementation HMDLogEventReachabilityEventsAnalyzer

- (void).cxx_destruct
{
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void)resetAggregationAnalysisContext
{
  id v2 = [(HMDLogEventReachabilityEventsAnalyzer *)self eventCountersManager];
  [v2 resetEventCountersForRequestGroup:@"HMDLogEventReachabilityEventsAnalyzerRequestGroup"];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDLogEventReachabilityEventsAnalyzer *)self eventCountersManager];
  id v10 = [v8 counterGroupForName:@"HMDLogEventReachabilityEventsAnalyzerRequestGroup"];

  objc_msgSend(v7, "setCameraRecordingReachabilityChangedCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventReachabilityEventsAnalyzerCameraRecordingReachabilityChangedCounter", v6));
  objc_msgSend(v7, "setCameraRecordingReachabilityOfflineDuration:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventReachabilityEventsAnalyzerCameraRecordingOfflineDurationCounter", v6));
  objc_msgSend(v7, "setHomeHubReachabilityChangedCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventReachabilityEventsAnalyzerHomeHubReachabilityChangedCounter", v6));
  uint64_t v9 = [v10 fetchEventCounterForEventName:@"HMDLogEventReachabilityEventsAnalyzerReachabilityChangedCounter" forDate:v6];

  [v7 setIpAccessoryReachabilityChangedCount:v9];
}

- (void)_handleCameraRecordingReachabilityLogEvent:(id)a3
{
  id v8 = a3;
  if ([v8 didCreateEventModel])
  {
    v4 = [(HMDLogEventReachabilityEventsAnalyzer *)self eventCountersManager];
    [v4 incrementEventCounterForEventName:@"HMDLogEventReachabilityEventsAnalyzerCameraRecordingReachabilityChangedCounter" requestGroup:@"HMDLogEventReachabilityEventsAnalyzerRequestGroup"];

    [v8 offlineDuration];
    if (v5 > 0.0)
    {
      id v6 = [(HMDLogEventReachabilityEventsAnalyzer *)self eventCountersManager];
      [v8 offlineDuration];
      [v6 incrementEventCounterForEventName:@"HMDLogEventReachabilityEventsAnalyzerCameraRecordingOfflineDurationCounter" requestGroup:@"HMDLogEventReachabilityEventsAnalyzerRequestGroup" withValue:(unint64_t)v7];
    }
  }
}

- (void)_handleRemoteDeviceReachabilityChangedLogEvent:(id)a3
{
  id v3 = [(HMDLogEventReachabilityEventsAnalyzer *)self eventCountersManager];
  [v3 incrementEventCounterForEventName:@"HMDLogEventReachabilityEventsAnalyzerHomeHubReachabilityChangedCounter" requestGroup:@"HMDLogEventReachabilityEventsAnalyzerRequestGroup"];
}

- (void)_handleReachabiltiyAddRemoveEvent:(id)a3
{
  id v3 = [(HMDLogEventReachabilityEventsAnalyzer *)self eventCountersManager];
  [v3 incrementEventCounterForEventName:@"HMDLogEventReachabilityEventsAnalyzerReachabilityChangedCounter" requestGroup:@"HMDLogEventReachabilityEventsAnalyzerRequestGroup"];
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v12;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    [(HMDLogEventReachabilityEventsAnalyzer *)self _handleRemoteDeviceReachabilityChangedLogEvent:v5];
  }
  else
  {
    id v6 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      [(HMDLogEventReachabilityEventsAnalyzer *)self _handleCameraRecordingReachabilityLogEvent:v8];
    }
    else
    {
      id v9 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      id v11 = v10;

      if (v11) {
        [(HMDLogEventReachabilityEventsAnalyzer *)self _handleReachabiltiyAddRemoveEvent:v11];
      }
    }
  }
}

- (HMDLogEventReachabilityEventsAnalyzer)initWithEventCountersManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLogEventReachabilityEventsAnalyzer;
  id v6 = [(HMDLogEventReachabilityEventsAnalyzer *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_eventCountersManager, a3);
  }

  return v7;
}

+ (id)managedEventCounterRequestGroups
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"HMDLogEventReachabilityEventsAnalyzerRequestGroup";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end