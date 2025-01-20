@interface HMDLogEventHAPMetricsEventAnalyzer
+ (id)managedEventCounterRequestGroups;
- (HMDEventCountersManager)eventCountersManager;
- (HMDLogEventHAPMetricsEventAnalyzer)initWithEventCountersManager:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)resetAggregationAnalysisContext;
@end

@implementation HMDLogEventHAPMetricsEventAnalyzer

- (void).cxx_destruct
{
}

- (HMDEventCountersManager)eventCountersManager
{
  return (HMDEventCountersManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)resetAggregationAnalysisContext
{
  id v2 = [(HMDLogEventHAPMetricsEventAnalyzer *)self eventCountersManager];
  [v2 resetEventCountersForRequestGroup:@"HMDLogEventHAPMetricsRequestGroup"];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDLogEventHAPMetricsEventAnalyzer *)self eventCountersManager];
  id v10 = [v8 counterGroupForName:@"HMDLogEventHAPMetricsRequestGroup"];

  objc_msgSend(v7, "setHapIPSentHTTPRequestsCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventHAPMetricsEventAnalyzerHAPIPSentHTTPMessagesCounter", v6));
  objc_msgSend(v7, "setHapIPReceivedHTTPResponsesCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventHAPMetricsEventAnalyzerHAPIPReceivedHTTPMessagesCounter", v6));
  objc_msgSend(v7, "setHapIPInvalidationCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventHAPMetricsEventAnalyzerHAPIPInvalidationCounter", v6));
  objc_msgSend(v7, "setHapIPReceivedHTTPEventCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventHAPMetricsEventAnalyzerHAPIPReceivedHTTPEventsCounter", v6));
  objc_msgSend(v7, "setHapBTLEConnectionsCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventHAPMetricsEventAnalyzerHAPBTLEConnectionsCounter", v6));
  objc_msgSend(v7, "setHapBTLEDiscoveriesCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventHAPMetricsEventAnalyzerHAPBTLEDiscoveryCounter", v6));
  uint64_t v9 = [v10 fetchEventCounterForEventName:@"HMDLogEventHAPMetricsEventAnalyzerHAPBTLEConnectionPerReasonCounter" forDate:v6];

  [v7 setHapBTLEConnectionPerReasonsCount:v9];
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v13;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    id v6 = [(HMDLogEventHAPMetricsEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventHAPMetricsEventAnalyzerHAPIPInvalidationCounter", @"HMDLogEventHAPMetricsRequestGroup", objc_msgSend(v5, "accessoryServerInvalidations"));

    id v7 = [(HMDLogEventHAPMetricsEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v7, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventHAPMetricsEventAnalyzerHAPIPSentHTTPMessagesCounter", @"HMDLogEventHAPMetricsRequestGroup", objc_msgSend(v5, "sentHTTPRequests"));

    v8 = [(HMDLogEventHAPMetricsEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v8, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventHAPMetricsEventAnalyzerHAPIPReceivedHTTPMessagesCounter", @"HMDLogEventHAPMetricsRequestGroup", objc_msgSend(v5, "receivedHTTPResponses"));

    uint64_t v9 = [(HMDLogEventHAPMetricsEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v9, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventHAPMetricsEventAnalyzerHAPIPReceivedHTTPEventsCounter", @"HMDLogEventHAPMetricsRequestGroup", objc_msgSend(v5, "receivedHTTPEvents"));

    id v10 = [(HMDLogEventHAPMetricsEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v10, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventHAPMetricsEventAnalyzerHAPBTLEConnectionsCounter", @"HMDLogEventHAPMetricsRequestGroup", objc_msgSend(v5, "btleConnections"));

    v11 = [(HMDLogEventHAPMetricsEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v11, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventHAPMetricsEventAnalyzerHAPBTLEDiscoveryCounter", @"HMDLogEventHAPMetricsRequestGroup", objc_msgSend(v5, "btleDiscoveries"));

    v12 = [(HMDLogEventHAPMetricsEventAnalyzer *)self eventCountersManager];
    objc_msgSend(v12, "incrementEventCounterForEventName:requestGroup:withValue:", @"HMDLogEventHAPMetricsEventAnalyzerHAPBTLEConnectionPerReasonCounter", @"HMDLogEventHAPMetricsRequestGroup", objc_msgSend(v5, "btleConnectionPerReasons"));
  }
}

- (HMDLogEventHAPMetricsEventAnalyzer)initWithEventCountersManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLogEventHAPMetricsEventAnalyzer;
  id v6 = [(HMDLogEventHAPMetricsEventAnalyzer *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_eventCountersManager, a3);
  }

  return v7;
}

+ (id)managedEventCounterRequestGroups
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"HMDLogEventHAPMetricsRequestGroup";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end