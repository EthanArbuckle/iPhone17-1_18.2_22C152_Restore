@interface HMDLogEventErrorEventsAnalyzer
+ (NSArray)errorEventsRequestGroupKeys;
+ (id)eventCounterNameForError:(id)a3;
+ (id)managedEventCounterRequestGroups;
- (HMDEventCountersManager)eventCountersManager;
- (HMDLogEventErrorEventsAnalyzer)initWithDataSource:(id)a3;
- (HMMLogEventSubmitting)logEventSubmitter;
- (id)errorEventsAnalyzedSummaryForDate:(id)a3;
- (id)eventCounterRequestGroupNameForLogEvent:(id)a3;
- (void)_handleAdditionalErrorsForAccessoryPairingLogEvent:(id)a3 logEventUnderlyingErrorGroupName:(id)a4;
- (void)_handleAdditionalErrorsForCloudShareTrustManagerFailureLogEvent:(id)a3 logEventUnderlyingErrorGroupName:(id)a4;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)resetEventCountersForAllErrorEventRequestGroups;
- (void)submitAllFormattedErrorAggregationLogEvents;
- (void)submitErrorAggregationLogEventsForErrorEventGroup:(id)a3;
@end

@implementation HMDLogEventErrorEventsAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void)resetEventCountersForAllErrorEventRequestGroups
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(id)objc_opt_class() errorEventsRequestGroupKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        v9 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
        [v9 resetEventCountersForRequestGroup:v8];

        v10 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
        v11 = [NSString stringWithFormat:@"%@_UnderlyingError", v8];
        [v10 resetEventCountersForRequestGroup:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)submitErrorAggregationLogEventsForErrorEventGroup:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
  uint64_t v17 = v4;
  uint64_t v7 = [v6 fetchEventCountersForRequestGroup:v4];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v13 isEqualToString:@"Total Events"] & 1) == 0)
        {
          long long v14 = [(HMDLogEventErrorEventsAnalyzer *)v5 logEventSubmitter];
          long long v15 = [v8 objectForKeyedSubscript:v13];
          v16 = +[HMDErrorAggregationLogEvent createErrorEventForRequestGroup:v17 errorString:v13 errorCount:v15];
          [v14 submitLogEvent:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)submitAllFormattedErrorAggregationLogEvents
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(id)objc_opt_class() errorEventsRequestGroupKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * v6);
        id v8 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
        uint64_t v9 = [v8 fetchEventCounterForEventName:@"Any Error" requestGroup:v7];

        uint64_t v10 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
        uint64_t v11 = [v10 fetchEventCounterForEventName:@"Total Events" requestGroup:v7];

        long long v12 = [(HMDLogEventErrorEventsAnalyzer *)self logEventSubmitter];
        long long v13 = [NSNumber numberWithUnsignedInteger:v9];
        long long v14 = [NSNumber numberWithUnsignedInteger:v11];
        long long v15 = +[HMDErrorAggregationLogEvent createSummaryEventForRequestGroup:v7 totalErrorCount:v13 totalEventCount:v14];
        [v12 submitLogEvent:v15];

        [(HMDLogEventErrorEventsAnalyzer *)self submitErrorAggregationLogEventsForErrorEventGroup:v7];
        v16 = [NSString stringWithFormat:@"%@_UnderlyingError", v7];
        [(HMDLogEventErrorEventsAnalyzer *)self submitErrorAggregationLogEventsForErrorEventGroup:v16];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  [(HMDLogEventErrorEventsAnalyzer *)self resetEventCountersForAllErrorEventRequestGroups];
}

- (id)errorEventsAnalyzedSummaryForDate:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v20 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(id)objc_opt_class() errorEventsRequestGroupKeys];
  uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v18 = *(void *)v28;
    uint64_t v3 = @"Aggregated error counts: \n";
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v6 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
        uint64_t v7 = [v6 counterGroupForName:v5];

        v22 = v7;
        id v8 = [v7 eventCountersForDate:v20];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v24;
          do
          {
            uint64_t v12 = 0;
            long long v13 = v3;
            do
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v12);
              long long v15 = [v8 objectForKeyedSubscript:v14];
              uint64_t v3 = [(__CFString *)v13 stringByAppendingFormat:@"   Error: %@ Event: %@ Count: %@ \n", v14, v5, v15];

              ++v12;
              long long v13 = v3;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v10);
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }
  else
  {
    uint64_t v3 = @"Aggregated error counts: \n";
  }

  return v3;
}

- (void)_handleAdditionalErrorsForCloudShareTrustManagerFailureLogEvent:(id)a3 logEventUnderlyingErrorGroupName:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v13 trustManagerErrorCode];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = [v13 trustManagerErrorCode];
    uint64_t v10 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", @"HMDCloudShareTrustManagerErrorDomain", objc_msgSend(v9, "integerValue"), 0);

    uint64_t v11 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
    uint64_t v12 = +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:v10];
    [v11 incrementEventCounterForEventName:v12 requestGroup:v6];
  }
}

- (void)_handleAdditionalErrorsForAccessoryPairingLogEvent:(id)a3 logEventUnderlyingErrorGroupName:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v13 threadCommissioningError];

  if (v7)
  {
    id v8 = NSString;
    uint64_t v9 = [v13 threadCommissioningError];
    uint64_t v10 = +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:v9];
    uint64_t v11 = [v8 stringWithFormat:@"Thread_%@", v10];

    uint64_t v12 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
    [v12 incrementEventCounterForEventName:v11 requestGroup:v6];
  }
}

- (id)eventCounterRequestGroupNameForLogEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v3 && (isKindOfClass & 1) != 0)
  {
    uint64_t v5 = @"HMDCharacteristicReadWriteLogEvent";
    goto LABEL_60;
  }
  id v6 = v3;
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();

  if (v3 && (v7 & 1) != 0)
  {
    uint64_t v5 = @"HAPPairVerifyLogEvent";
    goto LABEL_60;
  }
  id v8 = v6;
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v3 && (v9 & 1) != 0)
  {
    id v10 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    int v13 = [v12 isAddOperation];
    if (v13) {
      uint64_t v5 = @"HMDAddAccessoryPairingLogEvent";
    }
    else {
      uint64_t v5 = @"HMDRemoveAccessoryPairingLogEvent";
    }
    goto LABEL_60;
  }
  id v14 = v8;
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v3 && (v15 & 1) != 0)
  {
    uint64_t v5 = @"HMDLogEventErrorEventsAnalyzerCloudSyncLegacyUploadRequestGroup";
    goto LABEL_60;
  }
  id v16 = v14;
  objc_opt_class();
  char v17 = objc_opt_isKindOfClass();

  if (v3 && (v17 & 1) != 0)
  {
    uint64_t v5 = @"HMDCloudShareTrustManagerFailureLogEvent";
    goto LABEL_60;
  }
  id v18 = v16;
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  if (v3 && (v19 & 1) != 0)
  {
    uint64_t v5 = @"HMDDatabaseCKOperationCompletionEvent";
    goto LABEL_60;
  }
  id v20 = v18;
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  if (v3 && (v21 & 1) != 0)
  {
    uint64_t v5 = @"HMDBackingStoreCKOperationZoneCompletionLogEvent";
    goto LABEL_60;
  }
  id v22 = v20;
  objc_opt_class();
  char v23 = objc_opt_isKindOfClass();

  if (v3 && (v23 & 1) != 0)
  {
    uint64_t v5 = @"HMDCameraMetricsStreamLogEvent";
    goto LABEL_60;
  }
  id v24 = v22;
  objc_opt_class();
  char v25 = objc_opt_isKindOfClass();

  if (v3 && (v25 & 1) != 0)
  {
    uint64_t v5 = @"HMDCameraMetricsSnapshotLogEvent";
    goto LABEL_60;
  }
  id v26 = v24;
  objc_opt_class();
  char v27 = objc_opt_isKindOfClass();

  if (v3 && (v27 & 1) != 0)
  {
    uint64_t v5 = @"HMDActionSetLogEvent";
    goto LABEL_60;
  }
  id v28 = v26;
  objc_opt_class();
  char v29 = objc_opt_isKindOfClass();

  if (v3 && (v29 & 1) != 0)
  {
    uint64_t v5 = @"HomeKitEventTriggerExecutionSessionLogEvent";
    goto LABEL_60;
  }
  id v30 = v28;
  objc_opt_class();
  char v31 = objc_opt_isKindOfClass();

  if (v3 && (v31 & 1) != 0)
  {
    uint64_t v5 = @"HMDSiriCommandLogEvent";
    goto LABEL_60;
  }
  id v32 = v30;
  objc_opt_class();
  char v33 = objc_opt_isKindOfClass();

  if (!v3 || (v33 & 1) == 0)
  {
    id v37 = v32;
    objc_opt_class();
    char v38 = objc_opt_isKindOfClass();

    if (v3 && (v38 & 1) != 0)
    {
      uint64_t v5 = @"HMDCameraRecordingUploadOperationLogEvent";
      goto LABEL_60;
    }
    id v39 = v37;
    objc_opt_class();
    char v40 = objc_opt_isKindOfClass();

    if (v3 && (v40 & 1) != 0)
    {
      v41 = [v39 error];
      if (+[HMDCameraRecordingSessionLogEvent isRecordingSessionAlreadyInProgressError:v41])
      {

LABEL_73:
        uint64_t v5 = 0;
        goto LABEL_60;
      }
      v49 = [v39 error];
      uint64_t v50 = [v49 code];

      v51 = @"HMDCameraRecordingSessionCoordinationLogEvent";
    }
    else
    {
      id v46 = v39;
      objc_opt_class();
      char v47 = objc_opt_isKindOfClass();

      uint64_t v5 = 0;
      if (!v3 || (v47 & 1) == 0) {
        goto LABEL_60;
      }
      v48 = [v46 error];
      if (+[HMDCameraRecordingSessionLogEvent isRecordingSessionAlreadyInProgressError:v48])
      {

        goto LABEL_73;
      }
      v52 = [v46 error];
      uint64_t v50 = [v52 code];

      v51 = @"HMDCameraRecordingSessionLogEvent";
    }
    if (v50 == 14) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v51;
    }
    goto LABEL_60;
  }
  id v34 = v32;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v35 = v34;
  }
  else {
    v35 = 0;
  }
  id v36 = v35;

  if ([v36 transportType] == 6)
  {
    uint64_t v5 = @"txRapportRemoteMessageLogEvent";
  }
  else if ([v36 transportType] == 2)
  {
    uint64_t v5 = @"txIDSRemoteMessageLogEvent";
  }
  else
  {
    uint64_t v5 = 0;
  }

LABEL_60:
  id v42 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v43 = v42;
  }
  else {
    v43 = 0;
  }
  id v44 = v43;

  if (v44)
  {
    if ([v44 operationType] == 1)
    {
      uint64_t v5 = @"CoreDataCloudKitImportEvent";
    }
    else if ([v44 operationType] == 2)
    {
      uint64_t v5 = @"CoreDataCloudKitExportEvent";
    }
  }

  return v5;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v29 = a3;
  -[HMDLogEventErrorEventsAnalyzer eventCounterRequestGroupNameForLogEvent:](self, "eventCounterRequestGroupNameForLogEvent:");
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    uint64_t v5 = [v29 error];

    id v6 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
    char v7 = v6;
    if (v5)
    {
      [v6 incrementEventCounterForEventName:@"Any Error" requestGroup:@"All Event Groups"];

      id v6 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
      char v7 = v6;
      id v8 = @"Any Error";
      char v9 = v4;
    }
    else
    {
      id v8 = @"No Error";
      char v9 = @"All Event Groups";
    }
    [v6 incrementEventCounterForEventName:v8 requestGroup:v9];

    id v10 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
    [v10 incrementEventCounterForEventName:@"Total Events" requestGroup:@"All Event Groups"];

    uint64_t v11 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
    [v11 incrementEventCounterForEventName:@"Total Events" requestGroup:v4];

    id v12 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
    int v13 = [v29 error];
    id v14 = +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:v13];
    [v12 incrementEventCounterForEventName:v14 requestGroup:v4];

    char v15 = [NSString stringWithFormat:@"%@_UnderlyingError", v4];
    id v16 = [v29 error];
    char v17 = [v16 userInfo];
    id v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v19 = v18;
    }
    else {
      char v19 = 0;
    }
    id v20 = v19;

    if (v20)
    {
      char v21 = [(HMDLogEventErrorEventsAnalyzer *)self eventCountersManager];
      id v22 = +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:v20];
      [v21 incrementEventCounterForEventName:v22 requestGroup:v15];
    }
    id v23 = v29;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }
    id v25 = v24;

    if (v25)
    {
      [(HMDLogEventErrorEventsAnalyzer *)self _handleAdditionalErrorsForAccessoryPairingLogEvent:v25 logEventUnderlyingErrorGroupName:v15];
    }
    else
    {
      id v26 = v23;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v27 = v26;
      }
      else {
        char v27 = 0;
      }
      id v28 = v27;

      if (v28) {
        [(HMDLogEventErrorEventsAnalyzer *)self _handleAdditionalErrorsForCloudShareTrustManagerFailureLogEvent:v28 logEventUnderlyingErrorGroupName:v15];
      }
    }
  }
}

- (HMDLogEventErrorEventsAnalyzer)initWithDataSource:(id)a3
{
  v15[17] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDLogEventErrorEventsAnalyzer;
  uint64_t v5 = [(HMDLogEventErrorEventsAnalyzer *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 legacyCountersManager];
    eventCountersManager = v5->_eventCountersManager;
    v5->_eventCountersManager = (HMDEventCountersManager *)v6;

    uint64_t v8 = [v4 logEventSubmitter];
    logEventSubmitter = v5->_logEventSubmitter;
    v5->_logEventSubmitter = (HMMLogEventSubmitting *)v8;

    id v10 = [v4 dailyScheduler];
    [v10 registerDailyTaskRunner:v5];

    uint64_t v11 = [v4 logEventDispatcher];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v15[5] = objc_opt_class();
    v15[6] = objc_opt_class();
    v15[7] = objc_opt_class();
    v15[8] = objc_opt_class();
    v15[9] = objc_opt_class();
    v15[10] = objc_opt_class();
    v15[11] = objc_opt_class();
    v15[12] = objc_opt_class();
    v15[13] = objc_opt_class();
    v15[14] = objc_opt_class();
    v15[15] = objc_opt_class();
    v15[16] = objc_opt_class();
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:17];
    [v11 addObserver:v5 forEventClasses:v12];

    [v4 addThresholdTrigger:@"pairingFailureCount" forEventName:@"Any Error" requestGroup:@"HMDAddAccessoryPairingLogEvent" atThreshold:3];
    [v4 addThresholdTrigger:@"cameraRecordingUploadErrorCount" forEventName:@"Any Error" requestGroup:@"HMDCameraRecordingUploadOperationLogEvent" atThreshold:1 uploadImmediately:1];
    [v4 addThresholdTrigger:@"cloudKitImportErrorCount" forEventName:@"Any Error" requestGroup:@"CoreDataCloudKitImportEvent" atThreshold:1];
    [v4 addThresholdTrigger:@"cloudKitExportErrorCount" forEventName:@"Any Error" requestGroup:@"CoreDataCloudKitExportEvent" atThreshold:1];
  }

  return v5;
}

+ (id)managedEventCounterRequestGroups
{
  v2 = objc_opt_class();
  return (id)[v2 errorEventsRequestGroupKeys];
}

+ (id)eventCounterNameForError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [v3 domain];
    if (v6)
    {
      char v7 = [v4 domain];
    }
    else
    {
      char v7 = @"<No Domain>";
    }
    uint64_t v8 = [v5 stringWithFormat:@"%@ %ld", v7, objc_msgSend(v4, "code")];
    if (v6) {
  }
    }
  else
  {
    uint64_t v8 = @"No Error";
  }

  return v8;
}

+ (NSArray)errorEventsRequestGroupKeys
{
  if (errorEventsRequestGroupKeys_onceToken != -1) {
    dispatch_once(&errorEventsRequestGroupKeys_onceToken, &__block_literal_global_270319);
  }
  v2 = (void *)errorEventsRequestGroupKeys_errorEventsRequestGroupKeys;
  return (NSArray *)v2;
}

void __61__HMDLogEventErrorEventsAnalyzer_errorEventsRequestGroupKeys__block_invoke()
{
  v2[21] = *MEMORY[0x263EF8340];
  v2[0] = @"HMDLogEventErrorEventsAnalyzerCloudSyncLegacyUploadRequestGroup";
  v2[1] = @"HMDCloudShareTrustManagerFailureLogEvent";
  v2[2] = @"HMDDatabaseCKOperationCompletionEvent";
  v2[3] = @"HMDBackingStoreCKOperationZoneCompletionLogEvent";
  v2[4] = @"HMDCameraRecordingUploadOperationLogEvent";
  v2[5] = @"HMDCameraMetricsStreamLogEvent";
  v2[6] = @"HMDCameraMetricsSnapshotLogEvent";
  v2[7] = @"HMDAddAccessoryPairingLogEvent";
  v2[8] = @"HMDRemoveAccessoryPairingLogEvent";
  v2[9] = @"HMDCharacteristicReadWriteLogEvent";
  v2[10] = @"HMDActionSetLogEvent";
  v2[11] = @"HomeKitEventTriggerExecutionSessionLogEvent";
  v2[12] = @"HMDSiriCommandLogEvent";
  v2[13] = @"HMDCameraRecordingSessionCoordinationLogEvent";
  v2[14] = @"HMDCameraRecordingSessionLogEvent";
  v2[15] = @"HAPPairVerifyLogEvent";
  v2[16] = @"CoreDataCloudKitImportEvent";
  v2[17] = @"CoreDataCloudKitExportEvent";
  v2[18] = @"txRapportRemoteMessageLogEvent";
  v2[19] = @"txIDSRemoteMessageLogEvent";
  v2[20] = @"All Event Groups";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:21];
  v1 = (void *)errorEventsRequestGroupKeys_errorEventsRequestGroupKeys;
  errorEventsRequestGroupKeys_errorEventsRequestGroupKeys = v0;
}

@end