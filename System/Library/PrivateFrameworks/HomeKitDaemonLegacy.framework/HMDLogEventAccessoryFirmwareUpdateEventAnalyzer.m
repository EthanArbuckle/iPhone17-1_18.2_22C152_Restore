@interface HMDLogEventAccessoryFirmwareUpdateEventAnalyzer
+ (id)managedEventCounterRequestGroups;
- (HMDEventCountersManager)eventCountersManager;
- (HMDLogEventAccessoryFirmwareUpdateEventAnalyzer)initWithEventCountersManager:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)resetAggregationAnalysisContext;
@end

@implementation HMDLogEventAccessoryFirmwareUpdateEventAnalyzer

- (void).cxx_destruct
{
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void)resetAggregationAnalysisContext
{
  id v2 = [(HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *)self eventCountersManager];
  [v2 resetEventCountersForRequestGroup:@"HMDLogEventAccessoryFirmwareUpdateRequestGroup"];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *)self eventCountersManager];
  id v10 = [v8 counterGroupForName:@"HMDLogEventAccessoryFirmwareUpdateRequestGroup"];

  objc_msgSend(v7, "setPeakConcurrentIPAccessoryUpdateStaging:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventPeakConcurrentIPAccessoryUpdateStagingCounter", v6));
  objc_msgSend(v7, "setPeakConcurrentIPAccessoryUpdateApply:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventPeakConcurrentIPAccessoryUpdateApplyCounter", v6));
  objc_msgSend(v7, "setPeakConcurrentBLEAccessoryUpdateStaging:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventPeakConcurrentBLEAccessoryUpdateStagingCounter", v6));
  objc_msgSend(v7, "setPeakConcurrentBLEAccessoryUpdateApply:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventPeakConcurrentBLEAccessoryUpdateApplyCounter", v6));
  objc_msgSend(v7, "setPeakConcurrentThreadAccessoryUpdateStaging:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventPeakConcurrentThreadAccessoryUpdateStagingCounter", v6));
  uint64_t v9 = [v10 fetchEventCounterForEventName:@"HMDLogEventPeakConcurrentThreadAccessoryUpdateApplyCounter" forDate:v6];

  [v7 setPeakConcurrentThreadAccessoryUpdateApply:v9];
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
    id v6 = [(HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventPeakConcurrentIPAccessoryUpdateStagingCounter", @"HMDLogEventAccessoryFirmwareUpdateRequestGroup", objc_msgSend(v5, "peakConcurrentIPAccessoryUpdateStaging"));

    id v7 = [(HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v7, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventPeakConcurrentIPAccessoryUpdateApplyCounter", @"HMDLogEventAccessoryFirmwareUpdateRequestGroup", objc_msgSend(v5, "peakConcurrentIPAccessoryUpdateApply"));

    v8 = [(HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v8, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventPeakConcurrentBLEAccessoryUpdateStagingCounter", @"HMDLogEventAccessoryFirmwareUpdateRequestGroup", objc_msgSend(v5, "peakConcurrentBLEAccessoryUpdateStaging"));

    uint64_t v9 = [(HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v9, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventPeakConcurrentBLEAccessoryUpdateApplyCounter", @"HMDLogEventAccessoryFirmwareUpdateRequestGroup", objc_msgSend(v5, "peakConcurrentBLEAccessoryUpdateApply"));

    id v10 = [(HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v10, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventPeakConcurrentThreadAccessoryUpdateStagingCounter", @"HMDLogEventAccessoryFirmwareUpdateRequestGroup", objc_msgSend(v5, "peakConcurrentThreadAccessoryUpdateStaging"));

    v11 = [(HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v11, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventPeakConcurrentThreadAccessoryUpdateApplyCounter", @"HMDLogEventAccessoryFirmwareUpdateRequestGroup", objc_msgSend(v5, "peakConcurrentThreadAccessoryUpdateApply"));
  }
}

- (HMDLogEventAccessoryFirmwareUpdateEventAnalyzer)initWithEventCountersManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLogEventAccessoryFirmwareUpdateEventAnalyzer;
  id v6 = [(HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_eventCountersManager, a3);
  }

  return v7;
}

+ (id)managedEventCounterRequestGroups
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HMDLogEventAccessoryFirmwareUpdateRequestGroup";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

@end