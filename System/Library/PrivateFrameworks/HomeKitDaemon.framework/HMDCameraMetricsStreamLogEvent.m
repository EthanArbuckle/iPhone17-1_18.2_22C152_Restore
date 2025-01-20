@interface HMDCameraMetricsStreamLogEvent
- (HMDCameraMetricsStreamLogEvent)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)referenceTimestamp;
- (NSString)accessoryIdentifier;
- (NSString)coreAnalyticsEventName;
- (id)_durationBetweenMilestone1:(id)a3 andMilestone2:(id)a4 index:(id)a5;
- (id)_milestonesSortedByTimestamp;
- (unint64_t)coreAnalyticsEventOptions;
- (void)_addDurationsBetweenMilestones:(id)a3 toEvent:(id)a4;
- (void)_addFirstToLastDurationFromMilestones:(id)a3 toEvent:(id)a4;
- (void)_addInitialConfigurationMetricsToEvent:(id)a3;
- (void)_addStreamStartToFirstFrameDurationFromMilestones:(id)a3 toEvent:(id)a4;
- (void)setReferenceTimestamp:(id)a3;
@end

@implementation HMDCameraMetricsStreamLogEvent

- (void).cxx_destruct
{
}

- (void)setReferenceTimestamp:(id)a3
{
}

- (NSNumber)referenceTimestamp
{
  return self->_referenceTimestamp;
}

- (void)_addInitialConfigurationMetricsToEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraMetricsLogEvent *)self sessionID];
  v6 = [v5 deviceMilestones];
  id v7 = [v6 objectForKeyedSubscript:@"InitialConfiguration"];

  [v4 addEntriesFromDictionary:v7];
}

- (void)_addDurationsBetweenMilestones:(id)a3 toEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__HMDCameraMetricsStreamLogEvent__addDurationsBetweenMilestones_toEvent___block_invoke;
  v10[3] = &unk_264A22DB8;
  id v11 = v6;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  id v9 = v6;
  [v9 enumerateObjectsWithOptions:2 usingBlock:v10];
}

void __73__HMDCameraMetricsStreamLogEvent__addDurationsBetweenMilestones_toEvent___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a3)
  {
    id v6 = (void *)a1[4];
    uint64_t v7 = a3 - 1;
    id v8 = a2;
    id v13 = [v6 objectAtIndexedSubscript:v7];
    v10 = (void *)a1[5];
    id v9 = (void *)a1[6];
    id v11 = [NSNumber numberWithUnsignedInteger:a3];
    id v12 = [v9 _durationBetweenMilestone1:v13 andMilestone2:v8 index:v11];

    [v10 addEntriesFromDictionary:v12];
  }
  else
  {
    *a4 = 1;
  }
}

- (void)_addStreamStartToFirstFrameDurationFromMilestones:(id)a3 toEvent:(id)a4
{
  id v18 = a4;
  v5 = [(HMDCameraMetricsLogEvent *)self sessionID];
  id v6 = [v5 deviceMilestones];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"ReceivedFirstFrame"];

  if (v7)
  {
    BOOL v8 = [(HMDCameraMetricsLogEvent *)self isLocal];
    id v9 = @"SentStartRemoteStreamRequest";
    if (v8) {
      id v9 = @"SentStartResponse";
    }
    v10 = v9;
    id v11 = [(HMDCameraMetricsLogEvent *)self sessionID];
    id v12 = [v11 deviceMilestones];
    id v13 = [v12 objectForKeyedSubscript:v10];
    uint64_t v14 = [v13 integerValue];

    v15 = [[HMDCameraMetricsMilestone alloc] initWithKey:v10 timestamp:v14];
    v16 = -[HMDCameraMetricsMilestone initWithKey:timestamp:]([HMDCameraMetricsMilestone alloc], "initWithKey:timestamp:", @"ReceivedFirstFrame", [v7 integerValue]);

    v17 = [(HMDCameraMetricsStreamLogEvent *)self _durationBetweenMilestone1:v15 andMilestone2:v16 index:0];
    [v18 addEntriesFromDictionary:v17];
  }
}

- (void)_addFirstToLastDurationFromMilestones:(id)a3 toEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [v7 firstObject];
  BOOL v8 = [v7 lastObject];

  id v9 = [(HMDCameraMetricsStreamLogEvent *)self _durationBetweenMilestone1:v10 andMilestone2:v8 index:0];
  [v6 addEntriesFromDictionary:v9];
}

- (id)_durationBetweenMilestone1:(id)a3 andMilestone2:(id)a4 index:(id)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x263EFFA78];
  if (v8 && a4)
  {
    id v11 = a4;
    BOOL v12 = [(HMDCameraMetricsLogEvent *)self isLocal];
    id v13 = @"Remote";
    if (v12) {
      id v13 = @"Local";
    }
    uint64_t v14 = NSString;
    v15 = v13;
    v16 = [v8 key];
    uint64_t v17 = [v11 key];
    id v18 = (void *)v17;
    if (v9) {
      [v14 stringWithFormat:@"%@_%@_%@_%@", v15, v9, v16, v17];
    }
    else {
    v19 = [v14 stringWithFormat:@"%@_%@_%@", v15, v16, v17, v24];
    }

    uint64_t v20 = [v11 timestamp];
    uint64_t v21 = [v8 timestamp];
    v25 = v19;
    v22 = [NSNumber numberWithInteger:v20 - v21];
    v26[0] = v22;
    id v10 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
  }
  return v10;
}

- (id)_milestonesSortedByTimestamp
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(HMDCameraMetricsLogEvent *)self sessionID];
  v5 = [v4 deviceMilestones];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__HMDCameraMetricsStreamLogEvent__milestonesSortedByTimestamp__block_invoke;
  v8[3] = &unk_264A2BD48;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __62__HMDCameraMetricsStreamLogEvent__milestonesSortedByTimestamp__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  if (v7)
  {
    id v8 = -[HMDCameraMetricsMilestone initWithKey:timestamp:]([HMDCameraMetricsMilestone alloc], "initWithKey:timestamp:", v9, [v7 integerValue]);
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v8, objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_164264));
  }
}

uint64_t __62__HMDCameraMetricsStreamLogEvent__milestonesSortedByTimestamp__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "timestamp"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 timestamp];

  id v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (NSString)accessoryIdentifier
{
  v2 = [(HMDCameraMetricsLogEvent *)self accessory];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 4;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(HMDCameraMetricsStreamLogEvent *)self _milestonesSortedByTimestamp];
  [(HMDCameraMetricsStreamLogEvent *)self _addFirstToLastDurationFromMilestones:v4 toEvent:v3];
  [(HMDCameraMetricsStreamLogEvent *)self _addStreamStartToFirstFrameDurationFromMilestones:v4 toEvent:v3];
  [(HMDCameraMetricsStreamLogEvent *)self _addDurationsBetweenMilestones:v4 toEvent:v3];
  [(HMDCameraMetricsStreamLogEvent *)self _addInitialConfigurationMetricsToEvent:v3];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCameraMetricsLogEvent isLocal](self, "isLocal"));
  [v3 setObject:v5 forKeyedSubscript:@"isLocal"];

  id v6 = (void *)[v3 copy];
  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.camera.stream";
}

- (HMDCameraMetricsStreamLogEvent)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HMDCameraMetricsStreamLogEvent;
  return [(HMDCameraMetricsLogEvent *)&v6 initWithSessionID:a3 cameraAccessory:a4 isLocal:a5];
}

@end