@interface HMDLogEventMessageEventsAnalyzer
+ (id)managedEventCounterRequestGroups;
- (HMDEventCounterGroup)homeManagerMessagesGroup;
- (HMDEventCounterGroup)residentSyncGroup;
- (HMDEventCountersManager)eventCountersManager;
- (HMDLogEventMessageEventsAnalyzer)initWithDataSource:(id)a3;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)workQueue;
- (id)messageDirectionStringForRemoteMessageCounterRequestGroup:(id)a3;
- (id)periodicRemoteMessageCounterEventNameWithMessageName:(id)a3 peerInformation:(id)a4;
- (id)transportTypeStringForRemoteMessageCounterRequestGroup:(id)a3;
- (void)_handleRemoteMessageLogEvent:(id)a3;
- (void)_handleXPCMessageCounterLogEvent:(id)a3;
- (void)_updateDailySubmissionGroupRemoteMessageEventCountersForTransportType:(int)a3 messageDirectionSending:(BOOL)a4;
- (void)_updatePeriodicSubmissionGroupRemoteMessageEventCountersForMessageName:(id)a3 peerInformation:(id)a4 transportType:(int)a5 messageDirectionSending:(BOOL)a6 identifier:(id)a7;
- (void)_updateResidentSyncCountersWithRemoteMessageLogEvent:(id)a3;
- (void)addTTRThresholdTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6 radarInitiator:(id)a7;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)handlePrimaryResidentChangedNotification:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)registerEWSTriggersWithDataSource:(id)a3;
- (void)registerTTRTriggersWithDataSource:(id)a3;
- (void)resetAggregationAnalysisContext;
- (void)submitDailyMessageEvents;
- (void)submitRemoteMessageCounters;
- (void)submitRemoteMessageCountersForGroup:(id)a3;
- (void)submitXPCMessageCounters;
- (void)submitXPCMessageCountersForGroup:(id)a3;
@end

@implementation HMDLogEventMessageEventsAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManagerMessagesGroup, 0);
  objc_storeStrong((id *)&self->_residentSyncGroup, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
}

- (HMDEventCounterGroup)homeManagerMessagesGroup
{
  return self->_homeManagerMessagesGroup;
}

- (HMDEventCounterGroup)residentSyncGroup
{
  return self->_residentSyncGroup;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void)submitDailyMessageEvents
{
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCounters];
  [(HMDLogEventMessageEventsAnalyzer *)self submitXPCMessageCounters];
}

- (void)resetAggregationAnalysisContext
{
  v3 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  [v3 resetEventCountersForRequestGroup:@"HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup"];

  v4 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  [v4 resetEventCountersForRequestGroup:@"HMDLogEventXPCSentMessagesCountDailyRequestGroup"];

  v5 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  [v5 resetEventCountersForRequestGroup:@"HMDLogEventXPCAErroredMessagesCountDailyRequestGroup"];

  v6 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  [v6 resetEventCountersForRequestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"];

  v7 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  [v7 resetEventCountersForRequestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"];

  v8 = [(HMDLogEventMessageEventsAnalyzer *)self residentSyncGroup];
  [v8 resetEventCounters];

  id v9 = [(HMDLogEventMessageEventsAnalyzer *)self homeManagerMessagesGroup];
  [v9 resetEventCounters];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  id v9 = [v8 counterGroupForName:@"HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup"];
  objc_msgSend(v7, "setAcceptedXPCRequestsCount:", objc_msgSend(v9, "summedEventCountersForDate:", v6));

  v10 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  v11 = [v10 counterGroupForName:@"HMDLogEventXPCSentMessagesCountDailyRequestGroup"];
  objc_msgSend(v7, "setSentXPCNotificationsCount:", objc_msgSend(v11, "summedEventCountersForDate:", v6));

  v12 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  v13 = [v12 counterGroupForName:@"HMDLogEventXPCAErroredMessagesCountDailyRequestGroup"];
  objc_msgSend(v7, "setErroredXPCRequestsCount:", objc_msgSend(v13, "summedEventCountersForDate:", v6));

  v14 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  id v22 = [v14 counterGroupForName:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"];

  v15 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  v16 = [v15 counterGroupForName:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"];

  objc_msgSend(v7, "setRxIDSMessagesCount:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", @"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter", v6));
  objc_msgSend(v7, "setTxIDSMessagesCount:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", @"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter", v6));
  objc_msgSend(v7, "setRxIDSProxyMessagesCount:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", @"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter", v6));
  objc_msgSend(v7, "setTxIDSProxyMessagesCount:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", @"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter", v6));
  objc_msgSend(v7, "setRxLoxyMessagesCount:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", @"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter", v6));
  objc_msgSend(v7, "setTxLoxyMessagesCount:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", @"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter", v6));
  objc_msgSend(v7, "setRxRapportMessagesCount:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", @"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeRapportEventCounter", v6));
  objc_msgSend(v7, "setTxRapportMessagesCount:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", @"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeRapportEventCounter", v6));
  objc_msgSend(v7, "setRxSecureMessagesCount:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", @"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeSecureEventCounter", v6));
  objc_msgSend(v7, "setTxSecureMessagesCount:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", @"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeSecureEventCounter", v6));
  objc_msgSend(v7, "setRemoteMessagesSentCount:", objc_msgSend(v7, "txIDSProxyMessagesCount")+ objc_msgSend(v7, "txIDSMessagesCount")+ objc_msgSend(v7, "txRapportMessagesCount")+ objc_msgSend(v7, "txLoxyMessagesCount"));
  objc_msgSend(v7, "setRemoteMessagesReceivedCount:", objc_msgSend(v7, "rxLoxyMessagesCount")+ objc_msgSend(v7, "rxIDSMessagesCount")+ objc_msgSend(v7, "rxIDSProxyMessagesCount")+ objc_msgSend(v7, "rxRapportMessagesCount")+ objc_msgSend(v7, "rxSecureMessagesCount"));
  v17 = [(HMDLogEventMessageEventsAnalyzer *)self residentSyncGroup];
  objc_msgSend(v7, "setResidentSyncHomeDataChangedNotificationCount:", objc_msgSend(v17, "fetchEventCounterForEventName:forDate:", @"HMDLogEventResidentSyncHomeDataChangedNotificationCounter", v6));

  v18 = [(HMDLogEventMessageEventsAnalyzer *)self residentSyncGroup];
  objc_msgSend(v7, "setResidentSyncFetchHomeDataRequestCount:", objc_msgSend(v18, "fetchEventCounterForEventName:forDate:", @"HMDLogEventResidentSyncFetchHomeDataRequestCounter", v6));

  v19 = [(HMDLogEventMessageEventsAnalyzer *)self homeManagerMessagesGroup];
  objc_msgSend(v7, "setGenerationCounterIncrementCount:", objc_msgSend(v19, "fetchEventCounterForEventName:forDate:", @"HMDMessageEventsAnalyzerHomeManagerIncrementGenerationCounterEvent", v6));

  v20 = [(HMDLogEventMessageEventsAnalyzer *)self homeManagerMessagesGroup];
  uint64_t v21 = [v20 fetchEventCounterForEventName:@"HMDMessageEventsAnalyzerHomeManagerNotifyXPCClientsEvent" forDate:v6];

  [v7 setNotifyXPCClientsHomeDataChangedCount:v21];
}

- (void)handlePrimaryResidentChangedNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
    v10 = [v9 counterGroupForName:@"HMDLogEventMessageAnalyzerCommon"];

    if ([v8 isCurrentDevice]) {
      [v10 resumeDurationCounter:@"PrimaryResidentDuration"];
    }
    else {
      [v10 pauseDurationCounter:@"PrimaryResidentDuration"];
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received update primary resident notification but the primary resident is nil", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_handleXPCMessageCounterLogEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 type];
  if ([v5 isEqual:@"XPCAcceptedRequests"])
  {
    id v6 = @"HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup";
LABEL_5:

    goto LABEL_6;
  }
  if ([v5 isEqual:@"XPCSentNotifications"])
  {
    id v6 = @"HMDLogEventXPCSentMessagesCountDailyRequestGroup";
    goto LABEL_5;
  }
  int v16 = [v5 isEqual:@"XPCErroredRequests"];
  char v17 = v16;
  if (v16) {
    id v6 = @"HMDLogEventXPCAErroredMessagesCountDailyRequestGroup";
  }
  else {
    id v6 = 0;
  }

  if (v17)
  {
LABEL_6:
    id v7 = [v4 peerInformation];
    BOOL v8 = +[HMDMetricsUtilities shouldRedactBundleID:v7];
    id v9 = @"Third-party app";
    if (!v8) {
      id v9 = v7;
    }
    v10 = v9;

    v11 = NSString;
    v12 = [v4 messageName];
    v13 = [v11 stringWithFormat:@"%@/%@", v10, v12];

    v14 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
    int v15 = [v4 count];
    objc_msgSend(v14, "incrementEventCounterForEventName:requestGroup:withValue:", v13, v6, objc_msgSend(v15, "unsignedIntegerValue"));

    goto LABEL_9;
  }
  v18 = (void *)MEMORY[0x230FBD990]();
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v22 = v20;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Unknown XPC message counter type - dropping the LogEvent %@", buf, 0x16u);
  }
LABEL_9:
}

- (void)_updateResidentSyncCountersWithRemoteMessageLogEvent:(id)a3
{
  id v11 = a3;
  if ([v11 sending])
  {
    id v4 = [v11 msgName];
    int v5 = [v4 isEqualToString:@"HMDHomeDataChangedMessage"];

    if (v5)
    {
      id v6 = [(HMDLogEventMessageEventsAnalyzer *)self residentSyncGroup];
      id v7 = v6;
      BOOL v8 = @"HMDLogEventResidentSyncHomeDataChangedNotificationCounter";
    }
    else
    {
      id v9 = [v11 msgName];
      int v10 = [v9 isEqualToString:@"HMDFetchHomeDataMessage"];

      if (!v10) {
        goto LABEL_7;
      }
      id v6 = [(HMDLogEventMessageEventsAnalyzer *)self residentSyncGroup];
      id v7 = v6;
      BOOL v8 = @"HMDLogEventResidentSyncFetchHomeDataRequestCounter";
    }
    [v6 incrementEventCounterForEventName:v8];
  }
LABEL_7:
}

- (void)_updatePeriodicSubmissionGroupRemoteMessageEventCountersForMessageName:(id)a3 peerInformation:(id)a4 transportType:(int)a5 messageDirectionSending:(BOOL)a6 identifier:(id)a7
{
  BOOL v8 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  switch(a5)
  {
    case 1:
      int v15 = @"HMDLogEventMessageAnalyzerRxSecureMessagesCountPeriodicRequestGroup";
      int v16 = @"HMDLogEventMessageAnalyzerTxSecureMessagesCountPeriodicRequestGroup";
      goto LABEL_10;
    case 2:
      int v15 = @"HMDLogEventMessageAnalyzerRxIDSMessagesCountPeriodicRequestGroup";
      int v16 = @"HMDLogEventMessageAnalyzerTxIDSMessagesCountPeriodicRequestGroup";
      goto LABEL_10;
    case 3:
      int v15 = @"HMDLogEventMessageAnalyzerRxLoxyMessagesCountPeriodicRequestGroup";
      int v16 = @"HMDLogEventMessageAnalyzerTxLoxyMessagesCountPeriodicRequestGroup";
      goto LABEL_10;
    case 4:
      int v15 = @"HMDLogEventMessageAnalyzerRxIDSProxyMessagesCountPeriodicRequestGroup";
      int v16 = @"HMDLogEventMessageAnalyzerTxIDSProxyMessagesCountPeriodicRequestGroup";
      goto LABEL_10;
    case 6:
      int v15 = @"HMDLogEventMessageAnalyzerRxRapportMessagesCountPeriodicRequestGroup";
      int v16 = @"HMDLogEventMessageAnalyzerTxRapportMessagesCountPeriodicRequestGroup";
LABEL_10:
      if (v8) {
        int v15 = v16;
      }
      v20 = v15;
      uint64_t v21 = [(HMDLogEventMessageEventsAnalyzer *)self periodicRemoteMessageCounterEventNameWithMessageName:v12 peerInformation:v13];
      if (v21)
      {
        id v22 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
        [v22 incrementEventCounterForEventName:v21 requestGroup:v20];
      }
      else
      {
        __int16 v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v25 = HMFGetLogIdentifier();
          int v26 = 138543618;
          v27 = v25;
          __int16 v28 = 2112;
          id v29 = v14;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Unable to retrieve eventName for remoteMessage - dropping remote message log event with identifier %@", (uint8_t *)&v26, 0x16u);
        }
      }

      break;
    default:
      char v17 = (void *)MEMORY[0x230FBD990]();
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = HMFGetLogIdentifier();
        int v26 = 138543618;
        v27 = v19;
        __int16 v28 = 2112;
        id v29 = v14;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Invalid transport type - dropping remote message log event with identifier %@", (uint8_t *)&v26, 0x16u);
      }
      break;
  }
}

- (void)_updateDailySubmissionGroupRemoteMessageEventCountersForTransportType:(int)a3 messageDirectionSending:(BOOL)a4
{
  int v5 = a3 - 1;
  if (a3 - 1) <= 5 && ((0x2Fu >> v5))
  {
    id v7 = off_264A18308[v5];
    BOOL v8 = @"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup";
    if (a4) {
      BOOL v8 = @"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup";
    }
    id v9 = v8;
    id v10 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
    [v10 incrementEventCounterForEventName:v7 requestGroup:v9];
  }
}

- (void)_handleRemoteMessageLogEvent:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    int v9 = [v4 secure];
    id v10 = &stru_26E2EB898;
    if (v9) {
      id v10 = @"secure ";
    }
    uint64_t v25 = v10;
    id v11 = [v4 msgName];
    if ([v4 sending]) {
      id v12 = @"sent";
    }
    else {
      id v12 = @"received";
    }
    unsigned int v13 = [v4 transportType];
    if (v13 > 6) {
      id v14 = 0;
    }
    else {
      id v14 = off_264A2EB80[v13];
    }
    int v15 = v14;
    unint64_t v16 = [v4 msgType];
    if (v16 > 3) {
      char v17 = 0;
    }
    else {
      char v17 = off_264A2EBD0[v16];
    }
    v18 = v17;
    [v4 msgQoS];
    v19 = HMFQualityOfServiceToString();
    *(_DWORD *)buf = 138544898;
    v27 = v8;
    __int16 v28 = 2114;
    id v29 = v25;
    __int16 v30 = 2114;
    v31 = v11;
    __int16 v32 = 2114;
    v33 = v12;
    __int16 v34 = 2114;
    v35 = v15;
    __int16 v36 = 2114;
    v37 = v18;
    __int16 v38 = 2114;
    v39 = v19;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[CA] HMDRemoteMessageLogEvent -- %{public}@message %{public}@ %{public}@ over %{public}@ as %{public}@ (QoS: %{public}@)", buf, 0x48u);
  }
  -[HMDLogEventMessageEventsAnalyzer _updateDailySubmissionGroupRemoteMessageEventCountersForTransportType:messageDirectionSending:](v6, "_updateDailySubmissionGroupRemoteMessageEventCountersForTransportType:messageDirectionSending:", [v4 transportType], objc_msgSend(v4, "sending"));
  v20 = [v4 msgName];
  uint64_t v21 = [v4 peerInformation];
  uint64_t v22 = [v4 transportType];
  uint64_t v23 = [v4 sending];
  id v24 = [v4 msgIdentifier];
  [(HMDLogEventMessageEventsAnalyzer *)v6 _updatePeriodicSubmissionGroupRemoteMessageEventCountersForMessageName:v20 peerInformation:v21 transportType:v22 messageDirectionSending:v23 identifier:v24];

  [(HMDLogEventMessageEventsAnalyzer *)v6 _updateResidentSyncCountersWithRemoteMessageLogEvent:v4];
}

- (id)periodicRemoteMessageCounterEventNameWithMessageName:(id)a3 peerInformation:(id)a4
{
  int v5 = (__CFString *)a4;
  id v6 = v5;
  if (a3)
  {
    if (!v5) {
      id v6 = @"Unknown";
    }
    a3 = [NSString stringWithFormat:@"%@/%@", v6, a3];
  }

  return a3;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDLogEventMessageEventsAnalyzer_didReceiveEventFromDispatcher___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __66__HMDLogEventMessageEventsAnalyzer_didReceiveEventFromDispatcher___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v14 = v3;

  if (v14)
  {
    [*(id *)(a1 + 40) _handleRemoteMessageLogEvent:v14];
  }
  else
  {
    id v4 = *(id *)(a1 + 32);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v5 = v4;
    }
    else {
      int v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      [*(id *)(a1 + 40) _handleXPCMessageCounterLogEvent:v6];
    }
    else
    {
      id v7 = *(id *)(a1 + 32);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
      id v9 = v8;

      if (v9)
      {
        id v10 = [*(id *)(a1 + 40) homeManagerMessagesGroup];
        [v10 incrementEventCounterForEventName:@"HMDMessageEventsAnalyzerHomeManagerIncrementGenerationCounterEvent"];
      }
      else
      {
        id v11 = *(id *)(a1 + 32);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }
        id v10 = v12;

        if (v10)
        {
          unsigned int v13 = [*(id *)(a1 + 40) homeManagerMessagesGroup];
          [v13 incrementEventCounterForEventName:@"HMDMessageEventsAnalyzerHomeManagerNotifyXPCClientsEvent"];
        }
      }
    }
  }
}

- (void)submitRemoteMessageCounters
{
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCountersForGroup:@"HMDLogEventMessageAnalyzerRxIDSMessagesCountPeriodicRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCountersForGroup:@"HMDLogEventMessageAnalyzerTxIDSMessagesCountPeriodicRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCountersForGroup:@"HMDLogEventMessageAnalyzerRxIDSProxyMessagesCountPeriodicRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCountersForGroup:@"HMDLogEventMessageAnalyzerTxIDSProxyMessagesCountPeriodicRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCountersForGroup:@"HMDLogEventMessageAnalyzerRxLoxyMessagesCountPeriodicRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCountersForGroup:@"HMDLogEventMessageAnalyzerTxLoxyMessagesCountPeriodicRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCountersForGroup:@"HMDLogEventMessageAnalyzerRxRapportMessagesCountPeriodicRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCountersForGroup:@"HMDLogEventMessageAnalyzerTxRapportMessagesCountPeriodicRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCountersForGroup:@"HMDLogEventMessageAnalyzerRxSecureMessagesCountPeriodicRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitRemoteMessageCountersForGroup:@"HMDLogEventMessageAnalyzerTxSecureMessagesCountPeriodicRequestGroup"];
}

- (void)submitXPCMessageCounters
{
  [(HMDLogEventMessageEventsAnalyzer *)self submitXPCMessageCountersForGroup:@"HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitXPCMessageCountersForGroup:@"HMDLogEventXPCSentMessagesCountDailyRequestGroup"];
  [(HMDLogEventMessageEventsAnalyzer *)self submitXPCMessageCountersForGroup:@"HMDLogEventXPCAErroredMessagesCountDailyRequestGroup"];
}

- (void)submitRemoteMessageCountersForGroup:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  id v6 = [v5 counterGroupForName:@"HMDLogEventMessageAnalyzerCommon"];
  [v6 durationForCounter:@"PrimaryResidentDuration"];
  double v8 = v7;

  id v9 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  id v10 = [v9 fetchEventCountersForRequestGroup:v4];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [v10 allKeys];
  uint64_t v26 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v26)
  {
    uint64_t v11 = *(void *)v30;
    id v24 = v10;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        unsigned int v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v14 = [v13 componentsSeparatedByString:@"/"];
        __int16 v28 = [v14 firstObject];
        v27 = [v14 lastObject];
        int v15 = [(HMDLogEventMessageEventsAnalyzer *)self transportTypeStringForRemoteMessageCounterRequestGroup:v4];
        unint64_t v16 = [(HMDLogEventMessageEventsAnalyzer *)self messageDirectionStringForRemoteMessageCounterRequestGroup:v4];
        char v17 = objc_msgSend(v10, "hmf_numberForKey:", v13);
        if (v15 && v16)
        {
          v18 = +[HMDAggregateRemoteMessageCountersLogEvent aggregateRemoteCountersLogEventWithMessageName:v27 deviceType:v28 transportType:v15 direction:v16 primaryResidentDuration:v17 count:v8];
          [(HMDLogEventMessageEventsAnalyzer *)self logEventSubmitter];
          uint64_t v19 = v11;
          v20 = self;
          v22 = id v21 = v4;
          [v22 submitLogEvent:v18];

          id v4 = v21;
          self = v20;
          uint64_t v11 = v19;

          id v10 = v24;
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v26);
  }

  uint64_t v23 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  [v23 resetEventCountersForRequestGroup:v4];
}

- (id)messageDirectionStringForRemoteMessageCounterRequestGroup:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"HMDLogEventMessageAnalyzerTxIDSMessagesCountPeriodicRequestGroup"] & 1) != 0
    || ([v3 isEqualToString:@"HMDLogEventMessageAnalyzerTxIDSProxyMessagesCountPeriodicRequestGroup"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerTxLoxyMessagesCountPeriodicRequestGroup") & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerTxRapportMessagesCountPeriodicRequestGroup") & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerTxSecureMessagesCountPeriodicRequestGroup") & 1) != 0)
  {
    id v4 = @"Sent";
  }
  else if (([v3 isEqualToString:@"HMDLogEventMessageAnalyzerRxIDSMessagesCountPeriodicRequestGroup"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerRxIDSProxyMessagesCountPeriodicRequestGroup") & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerRxLoxyMessagesCountPeriodicRequestGroup") & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerRxRapportMessagesCountPeriodicRequestGroup") & 1) != 0|| objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerRxSecureMessagesCountPeriodicRequestGroup"))
  {
    id v4 = @"Received";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)transportTypeStringForRemoteMessageCounterRequestGroup:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"HMDLogEventMessageAnalyzerTxIDSMessagesCountPeriodicRequestGroup"] & 1) != 0
    || ([v3 isEqualToString:@"HMDLogEventMessageAnalyzerRxIDSMessagesCountPeriodicRequestGroup"] & 1) != 0)
  {
    id v4 = @"IDS";
  }
  else if ([v3 isEqualToString:@"HMDLogEventMessageAnalyzerTxIDSProxyMessagesCountPeriodicRequestGroup"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerRxIDSProxyMessagesCountPeriodicRequestGroup"))
  {
    id v4 = @"IDSProxy";
  }
  else if ([v3 isEqualToString:@"HMDLogEventMessageAnalyzerTxLoxyMessagesCountPeriodicRequestGroup"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerRxLoxyMessagesCountPeriodicRequestGroup"))
  {
    id v4 = @"Loxy";
  }
  else if ([v3 isEqualToString:@"HMDLogEventMessageAnalyzerTxRapportMessagesCountPeriodicRequestGroup"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerRxRapportMessagesCountPeriodicRequestGroup"))
  {
    id v4 = @"Rapport";
  }
  else if (([v3 isEqualToString:@"HMDLogEventMessageAnalyzerTxSecureMessagesCountPeriodicRequestGroup"] & 1) != 0|| objc_msgSend(v3, "isEqualToString:", @"HMDLogEventMessageAnalyzerRxSecureMessagesCountPeriodicRequestGroup"))
  {
    id v4 = @"Secure";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)submitXPCMessageCountersForGroup:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  id v6 = [v5 counterGroupForName:@"HMDLogEventMessageAnalyzerCommon"];
  [v6 durationForCounter:@"PrimaryResidentDuration"];
  double v8 = v7;

  id v24 = self;
  id v9 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  id v10 = [v9 fetchEventCountersForRequestGroup:v4];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v25 = v10;
  id obj = [v10 allKeys];
  uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        unint64_t v16 = [v15 componentsSeparatedByString:@"/"];
        char v17 = [v16 firstObject];
        v18 = [v16 lastObject];
        uint64_t v19 = objc_msgSend(v25, "hmf_numberForKey:", v15);
        if ([v4 isEqualToString:@"HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup"])
        {
          v20 = +[HMDAggregateXPCMessageCountersLogEvent xpcAcceptedCountersLogEventWithPeerInformation:v17 messageName:v18 primaryResidentDuration:v19 count:v8];
        }
        else
        {
          v20 = 0;
        }
        if ([v4 isEqualToString:@"HMDLogEventXPCSentMessagesCountDailyRequestGroup"])
        {
          uint64_t v21 = +[HMDAggregateXPCMessageCountersLogEvent xpcSentCountersLogEventWithPeerInformation:v17 messageName:v18 primaryResidentDuration:v19 count:v8];

          v20 = (void *)v21;
        }
        if (v20)
        {
          uint64_t v22 = [(HMDLogEventMessageEventsAnalyzer *)v24 logEventSubmitter];
          [v22 submitLogEvent:v20];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }
}

- (void)addTTRThresholdTrigger:(id)a3 forEventName:(id)a4 requestGroup:(id)a5 atThreshold:(unint64_t)a6 radarInitiator:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v17 = [(HMDLogEventMessageEventsAnalyzer *)self eventCountersManager];
  unint64_t v16 = [[HMDCounterThresholdTTRTrigger alloc] initWithThreshold:a6 displayReason:v15 radarInitiator:v12];

  [v17 addObserver:v16 forEventName:v14 requestGroup:v13];
}

- (void)registerTTRTriggersWithDataSource:(id)a3
{
  id v4 = [a3 radarInitiator];
  if (v4)
  {
    int v5 = v4;
    [(HMDLogEventMessageEventsAnalyzer *)self addTTRThresholdTrigger:@"we detected excessive remote message counts" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup" atThreshold:100000 radarInitiator:v4];
    [(HMDLogEventMessageEventsAnalyzer *)self addTTRThresholdTrigger:@"we detected excessive remote message counts" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup" atThreshold:100000 radarInitiator:v5];
    [(HMDLogEventMessageEventsAnalyzer *)self addTTRThresholdTrigger:@"we detected excessive remote message counts" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup" atThreshold:100000 radarInitiator:v5];
    [(HMDLogEventMessageEventsAnalyzer *)self addTTRThresholdTrigger:@"we detected excessive remote message counts" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeSecureEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup" atThreshold:100000 radarInitiator:v5];
    [(HMDLogEventMessageEventsAnalyzer *)self addTTRThresholdTrigger:@"we detected excessive remote message counts" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup" atThreshold:100000 radarInitiator:v5];
    [(HMDLogEventMessageEventsAnalyzer *)self addTTRThresholdTrigger:@"we detected excessive remote message counts" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup" atThreshold:100000 radarInitiator:v5];
    [(HMDLogEventMessageEventsAnalyzer *)self addTTRThresholdTrigger:@"we detected excessive remote message counts" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup" atThreshold:100000 radarInitiator:v5];
    [(HMDLogEventMessageEventsAnalyzer *)self addTTRThresholdTrigger:@"we detected excessive remote message counts" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeSecureEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup" atThreshold:100000 radarInitiator:v5];
    id v4 = v5;
  }
}

- (void)registerEWSTriggersWithDataSource:(id)a3
{
  id v3 = a3;
  [v3 addThresholdTrigger:@"sentIDSMessageCount" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup" atThreshold:5000];
  [v3 addThresholdTrigger:@"receivedIDSMessageCount" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup" atThreshold:5000];
  [v3 addThresholdTrigger:@"sentIDSProxyMessageCount" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup" atThreshold:5000];
  [v3 addThresholdTrigger:@"receivedIDSProxyMessageCount" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup" atThreshold:5000];
  [v3 addThresholdTrigger:@"sentLoXYMessageCount" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup" atThreshold:5000];
  [v3 addThresholdTrigger:@"receivedLoXYMessageCount" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup" atThreshold:5000];
  [v3 addRateTrigger:@"sentIDSMessageRate" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup" atThreshold:100 windowSize:3600];
  [v3 addRateTrigger:@"receivedIDSMessageRate" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup" atThreshold:100 windowSize:3600];
  [v3 addRateTrigger:@"sentIDSProxyMessageRate" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup" atThreshold:100 windowSize:3600];
  [v3 addRateTrigger:@"receivedIDSProxyMessageRate" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup" atThreshold:100 windowSize:3600];
  [v3 addRateTrigger:@"sentLoXYMessageRate" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup" atThreshold:100 windowSize:3600];
  [v3 addRateTrigger:@"receivedLoXYMessageRate" forEventName:@"HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter" requestGroup:@"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup" atThreshold:100 windowSize:3600];
}

- (HMDLogEventMessageEventsAnalyzer)initWithDataSource:(id)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDLogEventMessageEventsAnalyzer;
  int v5 = [(HMDLogEventMessageEventsAnalyzer *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 legacyCountersManager];
    eventCountersManager = v5->_eventCountersManager;
    v5->_eventCountersManager = (HMDEventCountersManager *)v6;

    uint64_t v8 = [v4 logEventSubmitter];
    logEventSubmitter = v5->_logEventSubmitter;
    v5->_logEventSubmitter = (HMMLogEventSubmitting *)v8;

    uint64_t v10 = [v4 userDefaults];
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = (NSUserDefaults *)v10;

    id v12 = [v4 logEventDispatcher];
    uint64_t v13 = [v12 clientQueue];
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [(HMDEventCountersManager *)v5->_eventCountersManager counterGroupForName:@"HMDLogEventResidentSyncRemoteMessagesRequestGroup"];
    residentSyncGroup = v5->_residentSyncGroup;
    v5->_residentSyncGroup = (HMDEventCounterGroup *)v15;

    uint64_t v17 = [(HMDEventCountersManager *)v5->_eventCountersManager counterGroupForName:@"HMDMessageEventsAnalyzerHomeManagerMessagesRequestGroup"];
    homeManagerMessagesGroup = v5->_homeManagerMessagesGroup;
    v5->_homeManagerMessagesGroup = (HMDEventCounterGroup *)v17;

    uint64_t v19 = [v4 logEventDispatcher];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
    [v19 addObserver:v5 forEventClasses:v20];

    uint64_t v21 = [v4 notificationCenter];
    [v21 addObserver:v5 selector:sel_handlePrimaryResidentChangedNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:0];

    [(HMDLogEventMessageEventsAnalyzer *)v5 registerEWSTriggersWithDataSource:v4];
    [(HMDLogEventMessageEventsAnalyzer *)v5 registerTTRTriggersWithDataSource:v4];
  }

  return v5;
}

+ (id)managedEventCounterRequestGroups
{
  v4[17] = *MEMORY[0x263EF8340];
  v4[0] = @"HMDLogEventMessageAnalyzerRxIDSMessagesCountPeriodicRequestGroup";
  v4[1] = @"HMDLogEventMessageAnalyzerTxIDSMessagesCountPeriodicRequestGroup";
  v4[2] = @"HMDLogEventMessageAnalyzerRxIDSProxyMessagesCountPeriodicRequestGroup";
  v4[3] = @"HMDLogEventMessageAnalyzerTxIDSProxyMessagesCountPeriodicRequestGroup";
  v4[4] = @"HMDLogEventMessageAnalyzerRxLoxyMessagesCountPeriodicRequestGroup";
  v4[5] = @"HMDLogEventMessageAnalyzerTxLoxyMessagesCountPeriodicRequestGroup";
  v4[6] = @"HMDLogEventMessageAnalyzerRxRapportMessagesCountPeriodicRequestGroup";
  v4[7] = @"HMDLogEventMessageAnalyzerTxRapportMessagesCountPeriodicRequestGroup";
  v4[8] = @"HMDLogEventMessageAnalyzerRxSecureMessagesCountPeriodicRequestGroup";
  v4[9] = @"HMDLogEventMessageAnalyzerTxSecureMessagesCountPeriodicRequestGroup";
  v4[10] = @"HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup";
  v4[11] = @"HMDLogEventXPCSentMessagesCountDailyRequestGroup";
  v4[12] = @"HMDLogEventXPCAErroredMessagesCountDailyRequestGroup";
  v4[13] = @"HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup";
  v4[14] = @"HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup";
  v4[15] = @"HMDLogEventResidentSyncRemoteMessagesRequestGroup";
  v4[16] = @"HMDMessageEventsAnalyzerHomeManagerMessagesRequestGroup";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:17];
  return v2;
}

@end