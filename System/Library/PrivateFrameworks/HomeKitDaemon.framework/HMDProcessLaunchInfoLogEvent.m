@interface HMDProcessLaunchInfoLogEvent
- (BOOL)eventSubmittedOnTimeOut;
- (BOOL)isConfigurationLoaded;
- (BOOL)isTTSUInProgress;
- (HMDProcessLaunchInfoLogEvent)initWithSubmissionState:(int64_t)a3 dataSyncState:(id)a4 timeIntervalSincePreviousProcessLaunch:(double)a5 millisecondsToHomeDataLoad:(int64_t)a6 millisecondsToXPCMessageTransportReady:(int64_t)a7 millisecondsSinceLaunchToDataSyncStateGood:(int64_t)a8 millisecondsToAccountResolved:(int64_t)a9 numUncommittedRecords:(int64_t)a10 numUncommittedAndPushedRecords:(int64_t)a11 processExitType:(id)a12 processExitReason:(id)a13 processLaunchCount:(int64_t)a14 processAbnormalExitCount:(int64_t)a15 processVoluntaryExitCount:(int64_t)a16 processJetsamCount:(int64_t)a17 processIdleExitCount:(int64_t)a18 processCrashCount:(int64_t)a19 isConfigurationLoaded:(BOOL)a20 isTTSUInProgress:(BOOL)a21;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)dataSyncState;
- (NSString)processExitReason;
- (NSString)processExitType;
- (double)timeIntervalSincePreviousProcessLaunch;
- (int64_t)homeDataLoadedMilliseconds;
- (int64_t)millisecondsSinceLaunchToDataSyncStateGood;
- (int64_t)millisecondsToAccountResolved;
- (int64_t)numUncommittedAndPushedRecords;
- (int64_t)numUncommittedRecords;
- (int64_t)processAbnormalExitCount;
- (int64_t)processCrashCount;
- (int64_t)processIdleExitCount;
- (int64_t)processJetsamCount;
- (int64_t)processLaunchCount;
- (int64_t)processVoluntaryExitCount;
- (int64_t)submissionState;
- (int64_t)systemUptimeMillisecondsAtLaunch;
- (int64_t)xpcMessageTransportReadyMilliseconds;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDProcessLaunchInfoLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processExitReason, 0);
  objc_storeStrong((id *)&self->_processExitType, 0);
  objc_storeStrong((id *)&self->_dataSyncState, 0);
}

- (BOOL)eventSubmittedOnTimeOut
{
  return self->_eventSubmittedOnTimeOut;
}

- (BOOL)isTTSUInProgress
{
  return self->_isTTSUInProgress;
}

- (BOOL)isConfigurationLoaded
{
  return self->_isConfigurationLoaded;
}

- (int64_t)processCrashCount
{
  return self->_processCrashCount;
}

- (int64_t)processIdleExitCount
{
  return self->_processIdleExitCount;
}

- (int64_t)processJetsamCount
{
  return self->_processJetsamCount;
}

- (int64_t)processVoluntaryExitCount
{
  return self->_processVoluntaryExitCount;
}

- (int64_t)processAbnormalExitCount
{
  return self->_processAbnormalExitCount;
}

- (int64_t)processLaunchCount
{
  return self->_processLaunchCount;
}

- (NSString)processExitReason
{
  return self->_processExitReason;
}

- (NSString)processExitType
{
  return self->_processExitType;
}

- (int64_t)numUncommittedAndPushedRecords
{
  return self->_numUncommittedAndPushedRecords;
}

- (int64_t)numUncommittedRecords
{
  return self->_numUncommittedRecords;
}

- (int64_t)millisecondsToAccountResolved
{
  return self->_millisecondsToAccountResolved;
}

- (int64_t)millisecondsSinceLaunchToDataSyncStateGood
{
  return self->_millisecondsSinceLaunchToDataSyncStateGood;
}

- (int64_t)xpcMessageTransportReadyMilliseconds
{
  return self->_xpcMessageTransportReadyMilliseconds;
}

- (int64_t)homeDataLoadedMilliseconds
{
  return self->_homeDataLoadedMilliseconds;
}

- (double)timeIntervalSincePreviousProcessLaunch
{
  return self->_timeIntervalSincePreviousProcessLaunch;
}

- (int64_t)systemUptimeMillisecondsAtLaunch
{
  return self->_systemUptimeMillisecondsAtLaunch;
}

- (NSString)dataSyncState
{
  return self->_dataSyncState;
}

- (int64_t)submissionState
{
  return self->_submissionState;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent submissionState](self, "submissionState"));
  [v3 setObject:v4 forKeyedSubscript:@"submissionState"];

  v5 = [(HMDProcessLaunchInfoLogEvent *)self dataSyncState];
  [v3 setObject:v5 forKeyedSubscript:@"dataSyncState"];

  v6 = +[HMDLogEventHistograms latencyHistogram];
  v7 = objc_msgSend(v6, "intervalIndexForValue:", -[HMDProcessLaunchInfoLogEvent millisecondsSinceLaunchToDataSyncStateGood](self, "millisecondsSinceLaunchToDataSyncStateGood"));
  [v3 setObject:v7 forKeyedSubscript:@"millisecondsSinceLaunchToDataSyncStateGood"];

  [(HMDProcessLaunchInfoLogEvent *)self timeIntervalSincePreviousProcessLaunch];
  if (v8 > 0.0)
  {
    v9 = +[HMDLogEventHistograms highVolumeHistogram];
    [(HMDProcessLaunchInfoLogEvent *)self timeIntervalSincePreviousProcessLaunch];
    v11 = [v9 intervalIndexForValue:(unint64_t)v10];
    [v3 setObject:v11 forKeyedSubscript:@"timeIntervalSincePreviousProcessLaunch"];
  }
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent homeDataLoadedMilliseconds](self, "homeDataLoadedMilliseconds"));
  [v3 setObject:v12 forKeyedSubscript:@"homeDataLoadedMilliseconds"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent xpcMessageTransportReadyMilliseconds](self, "xpcMessageTransportReadyMilliseconds"));
  [v3 setObject:v13 forKeyedSubscript:@"xpcMessageTransportReadyMilliseconds"];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent millisecondsSinceLaunchToDataSyncStateGood](self, "millisecondsSinceLaunchToDataSyncStateGood"));
  [v3 setObject:v14 forKeyedSubscript:@"dataSyncStateGoodMilliseconds"];

  v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent millisecondsToAccountResolved](self, "millisecondsToAccountResolved"));
  [v3 setObject:v15 forKeyedSubscript:@"accountResolvedMilliseconds"];

  v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent numUncommittedRecords](self, "numUncommittedRecords"));
  [v3 setObject:v16 forKeyedSubscript:@"numUncommittedRecords"];

  v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent numUncommittedAndPushedRecords](self, "numUncommittedAndPushedRecords"));
  [v3 setObject:v17 forKeyedSubscript:@"numUncommittedAndPushedRecords"];

  v18 = [(HMDProcessLaunchInfoLogEvent *)self processExitType];
  [v3 setObject:v18 forKeyedSubscript:@"processExitType"];

  v19 = [(HMDProcessLaunchInfoLogEvent *)self processExitReason];
  [v3 setObject:v19 forKeyedSubscript:@"processExitReason"];

  v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processLaunchCount](self, "processLaunchCount"));
  [v3 setObject:v20 forKeyedSubscript:@"processLaunchCount"];

  v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processAbnormalExitCount](self, "processAbnormalExitCount"));
  [v3 setObject:v21 forKeyedSubscript:@"processAbnormalExitCount"];

  v22 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processVoluntaryExitCount](self, "processVoluntaryExitCount"));
  [v3 setObject:v22 forKeyedSubscript:@"processVoluntaryExitCount"];

  v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processCrashCount](self, "processCrashCount"));
  [v3 setObject:v23 forKeyedSubscript:@"processCrashCount"];

  v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processJetsamCount](self, "processJetsamCount"));
  [v3 setObject:v24 forKeyedSubscript:@"processJetsamCount"];

  v25 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processIdleExitCount](self, "processIdleExitCount"));
  [v3 setObject:v25 forKeyedSubscript:@"processIdleExitCount"];

  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDProcessLaunchInfoLogEvent isConfigurationLoaded](self, "isConfigurationLoaded"));
  [v3 setObject:v26 forKeyedSubscript:@"isConfigurationLoaded_BOOL"];

  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDProcessLaunchInfoLogEvent isTTSUInProgress](self, "isTTSUInProgress"));
  [v3 setObject:v27 forKeyedSubscript:@"isTTSUInProgress_BOOL"];

  if ([(HMDProcessLaunchInfoLogEvent *)self isConfigurationLoaded]) {
    v28 = &unk_26E471E18;
  }
  else {
    v28 = &unk_26E471E30;
  }
  [v3 setObject:v28 forKeyedSubscript:@"isConfigurationLoaded_INT"];
  if ([(HMDProcessLaunchInfoLogEvent *)self isTTSUInProgress]) {
    v29 = &unk_26E471E18;
  }
  else {
    v29 = &unk_26E471E30;
  }
  [v3 setObject:v29 forKeyedSubscript:@"isTTSUInProgress_INT"];
  v30 = (void *)[v3 copy];

  return (NSDictionary *)v30;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.processLaunch.processLaunchInfo";
}

- (HMDProcessLaunchInfoLogEvent)initWithSubmissionState:(int64_t)a3 dataSyncState:(id)a4 timeIntervalSincePreviousProcessLaunch:(double)a5 millisecondsToHomeDataLoad:(int64_t)a6 millisecondsToXPCMessageTransportReady:(int64_t)a7 millisecondsSinceLaunchToDataSyncStateGood:(int64_t)a8 millisecondsToAccountResolved:(int64_t)a9 numUncommittedRecords:(int64_t)a10 numUncommittedAndPushedRecords:(int64_t)a11 processExitType:(id)a12 processExitReason:(id)a13 processLaunchCount:(int64_t)a14 processAbnormalExitCount:(int64_t)a15 processVoluntaryExitCount:(int64_t)a16 processJetsamCount:(int64_t)a17 processIdleExitCount:(int64_t)a18 processCrashCount:(int64_t)a19 isConfigurationLoaded:(BOOL)a20 isTTSUInProgress:(BOOL)a21
{
  id v27 = a4;
  id v28 = a12;
  id v29 = a13;
  v35.receiver = self;
  v35.super_class = (Class)HMDProcessLaunchInfoLogEvent;
  v30 = [(HMMLogEvent *)&v35 init];
  v31 = v30;
  if (v30)
  {
    v30->_submissionState = a3;
    objc_storeStrong((id *)&v30->_dataSyncState, a4);
    v31->_timeIntervalSincePreviousProcessLaunch = a5;
    v31->_homeDataLoadedMilliseconds = a6;
    v31->_xpcMessageTransportReadyMilliseconds = a7;
    v31->_millisecondsSinceLaunchToDataSyncStateGood = a8;
    v31->_millisecondsToAccountResolved = a9;
    v31->_numUncommittedRecords = a10;
    v31->_numUncommittedAndPushedRecords = a11;
    objc_storeStrong((id *)&v31->_processExitType, a12);
    objc_storeStrong((id *)&v31->_processExitReason, a13);
    v31->_processLaunchCount = a14;
    v31->_processAbnormalExitCount = a15;
    v31->_processVoluntaryExitCount = a16;
    v31->_processJetsamCount = a17;
    v31->_processIdleExitCount = a18;
    v31->_processCrashCount = a19;
    v31->_isConfigurationLoaded = a20;
    v31->_isTTSUInProgress = a21;
  }

  return v31;
}

@end