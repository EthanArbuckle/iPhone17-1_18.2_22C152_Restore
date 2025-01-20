@interface HMDLogEventElectionEventsAnalyzer
+ (id)managedEventCounterRequestGroups;
- (BOOL)isCurrentDeviceInSecondaryResidentCoordinationMesh;
- (HMDEventCounterGroup)counterGroup;
- (HMDLogEventElectionEventsAnalyzer)initWithDataSource:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)handlePrimaryResidentChangedNotification:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)resetAggregationAnalysisContext;
- (void)setIsCurrentDeviceInSecondaryResidentCoordinationMesh:(BOOL)a3;
@end

@implementation HMDLogEventElectionEventsAnalyzer

- (void).cxx_destruct
{
}

- (HMDEventCounterGroup)counterGroup
{
  return self->_counterGroup;
}

- (void)setIsCurrentDeviceInSecondaryResidentCoordinationMesh:(BOOL)a3
{
  self->_isCurrentDeviceInSecondaryResidentCoordinationMesh = a3;
}

- (BOOL)isCurrentDeviceInSecondaryResidentCoordinationMesh
{
  return self->_isCurrentDeviceInSecondaryResidentCoordinationMesh;
}

- (void)resetAggregationAnalysisContext
{
  id v2 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  [v2 resetEventCounters];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v25 = a3;
  v7 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  objc_msgSend(v25, "setCurrentDeviceStartedLegacyElectionCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", @"currentDeviceStartedElectionCount", v6));

  v8 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  objc_msgSend(v25, "setV2ElectionCoordinationMeshUpdateCount:", objc_msgSend(v8, "fetchEventCounterForEventName:forDate:", @"v2ElectionCoordinationMeshUpdateCount", v6));

  v9 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  objc_msgSend(v25, "setV2ElectionCoordinationMeshLeaderElectedCount:", objc_msgSend(v9, "fetchEventCounterForEventName:forDate:", @"v2ElectionCoordinationMeshLeaderElectedCount", v6));

  v10 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  objc_msgSend(v25, "setV2ElectionCoordinationMeshLeaderChangedCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"v2ElectionCoordinationMeshLeaderChangedCount", v6));

  v11 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  objc_msgSend(v25, "setV2ElectionPrimaryResidentElectionRunCount:", objc_msgSend(v11, "fetchEventCounterForEventName:forDate:", @"v2ElectionPrimaryResidentElectionRunCount", v6));

  v12 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  objc_msgSend(v25, "setV2ElectionPrimaryResidentChangedCount:", objc_msgSend(v12, "fetchEventCounterForEventName:forDate:", @"v2ElectionPrimaryResidentChangedCount", v6));

  v13 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  objc_msgSend(v25, "setResidentSelectionPrimaryResidentChangedCount:", objc_msgSend(v13, "fetchEventCounterForEventName:forDate:", @"v3ResidentSelectionPrimaryResidentChangedCount", v6));

  objc_msgSend(v25, "setV2ElectionCurrentDeviceInSecondaryCoordinationMesh:", -[HMDLogEventElectionEventsAnalyzer isCurrentDeviceInSecondaryResidentCoordinationMesh](self, "isCurrentDeviceInSecondaryResidentCoordinationMesh"));
  v14 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  objc_msgSend(v25, "setV2ElectionCoordinationCurrentDeviceFlapCount:", objc_msgSend(v14, "fetchEventCounterForEventName:forDate:", @"v2ElectionCoordinationCurrentDeviceFlapCount", v6));

  v15 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  [v15 durationForCounter:@"PrimaryResidentDurationSeconds" forDate:v6];
  double v17 = v16;

  [v25 setPrimaryResidentDurationMinutes:(uint64_t)((v17 + 59.0) / 60.0)];
  v18 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  [v18 durationForCounter:@"v2CurrentDeviceInPrimaryMeshDurationSeconds" forDate:v6];
  double v20 = v19;

  v21 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  [v21 durationForCounter:@"v2CurrentDeviceInSecondaryMeshDurationSeconds" forDate:v6];
  double v23 = v22;

  if (v20 + v23 <= 0.0) {
    unint64_t v24 = 0;
  }
  else {
    unint64_t v24 = llround(v20 * 100.0 / (v20 + v23));
  }
  [v25 setV2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh:v24];
}

- (void)handlePrimaryResidentChangedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [v8 home];
    v10 = v9;
    if (v9 && ([v9 isCurrentDeviceAvailableResident] & 1) == 0)
    {
      v18 = (void *)MEMORY[0x230FBD990]();
      double v19 = self;
      double v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = HMFGetLogIdentifier();
        int v22 = 138543362;
        double v23 = v21;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification for home where we can't be a resident", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      int v11 = [v8 isCurrentDevice];
      v12 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
      v13 = v12;
      if (v11) {
        [v12 resumeDurationCounter:@"PrimaryResidentDurationSeconds"];
      }
      else {
        [v12 pauseDurationCounter:@"PrimaryResidentDurationSeconds"];
      }
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    double v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      double v17 = HMFGetLogIdentifier();
      int v22 = 138543362;
      double v23 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received update primary resident notification but the primary resident is nil", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v28 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v28;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    id v6 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
    [v6 incrementEventCounterForEventName:@"currentDeviceStartedElectionCount"];
    goto LABEL_6;
  }
  id v7 = v28;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v6 = v8;

  if (!v6)
  {
    id v20 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
    id v22 = v21;

    if (v22)
    {
      double v23 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
      [v23 incrementEventCounterForEventName:@"v2ElectionPrimaryResidentElectionRunCount"];

      if (![v22 didChangePrimary])
      {
LABEL_38:

        id v6 = 0;
        goto LABEL_6;
      }
      id v24 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
      [v24 incrementEventCounterForEventName:@"v2ElectionPrimaryResidentChangedCount"];
    }
    else
    {
      id v25 = v20;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }
      id v24 = v26;

      if (v24 && [v24 triggerReason] == 3 && objc_msgSend(v24, "count"))
      {
        v27 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
        [v27 incrementEventCounterForEventName:@"v3ResidentSelectionPrimaryResidentChangedCount"];
      }
    }

    goto LABEL_38;
  }
  v9 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
  [v9 incrementEventCounterForEventName:@"v2ElectionCoordinationMeshUpdateCount"];

  if ([v6 didElectLeader])
  {
    v10 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
    [v10 incrementEventCounterForEventName:@"v2ElectionCoordinationMeshLeaderElectedCount"];
  }
  if ([v6 didChangeLeader])
  {
    int v11 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
    [v11 incrementEventCounterForEventName:@"v2ElectionCoordinationMeshLeaderChangedCount"];
  }
  if ([v6 didCurrentDeviceLeavePrimaryMesh])
  {
    v12 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
    [v12 incrementEventCounterForEventName:@"v2ElectionCoordinationCurrentDeviceFlapCount"];
  }
  int v13 = [(HMDLogEventElectionEventsAnalyzer *)self isCurrentDeviceInSecondaryResidentCoordinationMesh];
  if (v13 != [v6 isInSecondaryMesh])
  {
    int v14 = [v6 isInSecondaryMesh];
    v15 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
    double v16 = v15;
    if (v14)
    {
      [v15 pauseDurationCounter:@"v2CurrentDeviceInPrimaryMeshDurationSeconds"];

      double v17 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
      v18 = v17;
      double v19 = @"v2CurrentDeviceInSecondaryMeshDurationSeconds";
    }
    else
    {
      [v15 pauseDurationCounter:@"v2CurrentDeviceInSecondaryMeshDurationSeconds"];

      double v17 = [(HMDLogEventElectionEventsAnalyzer *)self counterGroup];
      v18 = v17;
      double v19 = @"v2CurrentDeviceInPrimaryMeshDurationSeconds";
    }
    [v17 resumeDurationCounter:v19];

    -[HMDLogEventElectionEventsAnalyzer setIsCurrentDeviceInSecondaryResidentCoordinationMesh:](self, "setIsCurrentDeviceInSecondaryResidentCoordinationMesh:", [v6 isInSecondaryMesh]);
  }
LABEL_6:
}

- (HMDLogEventElectionEventsAnalyzer)initWithDataSource:(id)a3
{
  v20[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDLogEventElectionEventsAnalyzer;
  id v5 = [(HMDLogEventElectionEventsAnalyzer *)&v19 init];
  if (v5)
  {
    id v6 = [v4 legacyCountersManager];
    uint64_t v7 = [v6 counterGroupForName:@"HMDLogEventElectionEventsAnalyzerRequestGroup"];
    counterGroup = v5->_counterGroup;
    v5->_counterGroup = (HMDEventCounterGroup *)v7;

    v5->_isCurrentDeviceInSecondaryResidentCoordinationMesh = 0;
    v9 = [v4 logEventDispatcher];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
    [v9 addObserver:v5 forEventClasses:v10];

    int v11 = [v4 notificationCenter];
    [v11 addObserver:v5 selector:sel_handlePrimaryResidentChangedNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:0];

    [v4 addThresholdTrigger:@"legacyElectionStartCount" forEventName:@"currentDeviceStartedElectionCount" requestGroup:@"HMDLogEventElectionEventsAnalyzerRequestGroup" atThreshold:10];
    [v4 addThresholdTrigger:@"electionV2PrimaryElectionCount" forEventName:@"v2ElectionPrimaryResidentElectionRunCount" requestGroup:@"HMDLogEventElectionEventsAnalyzerRequestGroup" atThreshold:10];
    [v4 addThresholdTrigger:@"electionV2PrimaryChangedCount" forEventName:@"v2ElectionPrimaryResidentChangedCount" requestGroup:@"HMDLogEventElectionEventsAnalyzerRequestGroup" atThreshold:10];
    [v4 addThresholdTrigger:@"electionREv3PrimaryChangedCount" forEventName:@"v3ResidentSelectionPrimaryResidentChangedCount" requestGroup:@"HMDLogEventElectionEventsAnalyzerRequestGroup" atThreshold:10];
    v12 = [v4 radarInitiator];

    if (v12)
    {
      int v13 = [v4 legacyCountersManager];
      int v14 = [HMDCounterThresholdTTRTrigger alloc];
      v15 = [v4 radarInitiator];
      LOBYTE(v18) = 1;
      double v16 = [(HMDCounterThresholdTTRTrigger *)v14 initWithThreshold:100 displayReason:@"primary resident changed excessively" radarTitle:@"HomeKit Issue Detected: Excessive primary resident changes" componentName:@"Resident" componentVersion:@"Resident" componentID:938669 radarInitiator:v15 primaryOnly:v18 dataSource:v4];
      [v13 addObserver:v16 forEventName:@"v3ResidentSelectionPrimaryResidentChangedCount" requestGroup:@"HMDLogEventElectionEventsAnalyzerRequestGroup"];
    }
    [(HMDEventCounterGroup *)v5->_counterGroup resumeDurationCounter:@"v2CurrentDeviceInPrimaryMeshDurationSeconds"];
  }

  return v5;
}

+ (id)managedEventCounterRequestGroups
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"HMDLogEventElectionEventsAnalyzerRequestGroup";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end