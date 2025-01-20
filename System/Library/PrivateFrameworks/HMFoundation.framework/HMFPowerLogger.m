@interface HMFPowerLogger
+ (id)sharedPowerLogger;
- (id)linkTypeDescription:(int64_t)a3;
- (void)reportCharacteristicNotificationRegistrationEvent:(BOOL)a3 clientIdentifier:(id)a4;
- (void)reportConnection:(id)a3 linkType:(int64_t)a4;
- (void)reportConnection:(id)a3 linkType:(int64_t)a4 accessoryCategory:(id)a5;
- (void)reportDisconnection:(id)a3 linkType:(int64_t)a4 accessoryCategory:(id)a5;
- (void)reportIncomingAdvertisementChange:(id)a3;
- (void)reportIncomingAdvertisementChange:(id)a3 accessoryCategory:(id)a4;
- (void)reportIncomingCloudPush:(id)a3;
- (void)reportIncomingIDSPush:(id)a3 fromToken:(id)a4;
- (void)reportIncomingIPEvent:(id)a3;
- (void)reportIncomingIPEvent:(id)a3 accessoryCategory:(id)a4;
- (void)reportIncomingLoxyMessage:(id)a3;
- (void)reportRemoteReachabilityRegistrationEvent:(BOOL)a3 clientIdentifier:(id)a4;
- (void)reportToPowerLogDestinationTable:(__CFString *)a3 withEventDictionary:(id)a4;
- (void)reportWakeEvent:(id)a3 linkType:(int64_t)a4 accessoryCategory:(id)a5;
@end

@implementation HMFPowerLogger

- (void)reportCharacteristicNotificationRegistrationEvent:(BOOL)a3 clientIdentifier:(id)a4
{
  BOOL v4 = a3;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F1CA60];
  v19[0] = @"kHMFPowerLogEventType";
  v19[1] = @"kHMFPowerLogEnabledKey";
  v20[0] = @"HomeKit Characteristic Registration Event";
  v8 = [NSNumber numberWithBool:v4];
  v20[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v10 = [v7 dictionaryWithDictionary:v9];

  if (v6) {
    uint64_t v11 = [v10 setObject:v6 forKey:@"kHMFPowerLogClientIdentifierKey"];
  }
  v12 = (void *)MEMORY[0x19F3A87A0](v11);
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier(0);
    int v15 = 138543618;
    v16 = v14;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_INFO, "%{public}@Reporting characteristic notification registration event: %@", (uint8_t *)&v15, 0x16u);
  }
  [(HMFPowerLogger *)self reportToPowerLogDestinationTable:@"HomeKitRegistration" withEventDictionary:v10];
}

- (void)reportToPowerLogDestinationTable:(__CFString *)a3 withEventDictionary:(id)a4
{
}

+ (id)sharedPowerLogger
{
  if (qword_1EB4EED10 != -1) {
    dispatch_once(&qword_1EB4EED10, &__block_literal_global_16);
  }
  v2 = (void *)_MergedGlobals_61;
  return v2;
}

uint64_t __35__HMFPowerLogger_sharedPowerLogger__block_invoke()
{
  _MergedGlobals_61 = objc_alloc_init(HMFPowerLogger);
  return MEMORY[0x1F41817F8]();
}

- (id)linkTypeDescription:(int64_t)a3
{
  v3 = @"HomeKitLinkTypeUnknown";
  if (a3 == 2) {
    v3 = @"HomeKitLinkTypeBluetoothLE";
  }
  if (a3 == 1) {
    return @"HomeKitLinkTypeIP";
  }
  else {
    return v3;
  }
}

- (void)reportConnection:(id)a3 linkType:(int64_t)a4
{
}

- (void)reportConnection:(id)a3 linkType:(int64_t)a4 accessoryCategory:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier(0);
      v13 = [(HMFPowerLogger *)self linkTypeDescription:a4];
      *(_DWORD *)buf = 138544130;
      v22 = v12;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      v26 = v13;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_INFO, "%{public}@Reporting connection to: %@ for LinkType: %@ and category: %@", buf, 0x2Au);
    }
    v14 = (void *)MEMORY[0x1E4F1CA60];
    int v15 = [(HMFPowerLogger *)self linkTypeDescription:a4, @"kHMFPowerLogEventType", @"kHMFPowerLogDeviceIdentiferKey", @"kHMFPowerLogLinkTypeKey", @"HomeKit Connection", v8];
    v20[2] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:3];
    __int16 v17 = [v14 dictionaryWithDictionary:v16];

    if (v9) {
      [v17 setObject:v9 forKeyedSubscript:@"accessoryCategory"];
    }
    v18 = (void *)[v17 copy];
    [(HMFPowerLogger *)self reportToPowerLogDestinationTable:@"HomeKitEvent" withEventDictionary:v18];
  }
}

- (void)reportDisconnection:(id)a3 linkType:(int64_t)a4 accessoryCategory:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier(0);
      v13 = [(HMFPowerLogger *)self linkTypeDescription:a4];
      *(_DWORD *)buf = 138544130;
      v22 = v12;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      v26 = v13;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_INFO, "%{public}@Reporting disconnection from: %@ for LinkType: %@ and category: %@", buf, 0x2Au);
    }
    v14 = (void *)MEMORY[0x1E4F1CA60];
    int v15 = [(HMFPowerLogger *)self linkTypeDescription:a4, @"kHMFPowerLogEventType", @"kHMFPowerLogDeviceIdentiferKey", @"kHMFPowerLogLinkTypeKey", @"HomeKit Disconnection", v8];
    v20[2] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:3];
    __int16 v17 = [v14 dictionaryWithDictionary:v16];

    if (v9) {
      [v17 setObject:v9 forKeyedSubscript:@"accessoryCategory"];
    }
    v18 = (void *)[v17 copy];
    [(HMFPowerLogger *)self reportToPowerLogDestinationTable:@"HomeKitEvent" withEventDictionary:v18];
  }
}

- (void)reportWakeEvent:(id)a3 linkType:(int64_t)a4 accessoryCategory:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier(0);
    v13 = [(HMFPowerLogger *)self linkTypeDescription:a4];
    *(_DWORD *)buf = 138544130;
    v22 = v12;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    v26 = v13;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_INFO, "%{public}@Reporting wake event from: %@ for LinkType: %@ and category: %@", buf, 0x2Au);
  }
  v14 = (void *)MEMORY[0x1E4F1CA60];
  int v15 = [(HMFPowerLogger *)self linkTypeDescription:a4, @"kHMFPowerLogEventType", @"kHMFPowerLogDeviceIdentiferKey", @"kHMFPowerLogLinkTypeKey", @"HomeKit Wake Event", v8];
  v20[2] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:3];
  __int16 v17 = [v14 dictionaryWithDictionary:v16];

  if (v9) {
    [v17 setObject:v9 forKeyedSubscript:@"accessoryCategory"];
  }
  v18 = (void *)[v17 copy];
  [(HMFPowerLogger *)self reportToPowerLogDestinationTable:@"HomeKitEvent" withEventDictionary:v18];
}

- (void)reportIncomingAdvertisementChange:(id)a3
{
}

- (void)reportIncomingAdvertisementChange:(id)a3 accessoryCategory:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x19F3A87A0]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543874;
      v18 = v10;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_INFO, "%{public}@Reporting advertisement change from: %@ and category: %@", buf, 0x20u);
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
    v15[0] = @"kHMFPowerLogEventType";
    v15[1] = @"kHMFPowerLogDeviceIdentiferKey";
    v16[0] = @"HomeKit BLE Advertisement";
    v16[1] = v6;
    v15[2] = @"couldCauseWake";
    v16[2] = MEMORY[0x1E4F1CC38];
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    v13 = [v11 dictionaryWithDictionary:v12];

    if (v7) {
      [v13 setObject:v7 forKeyedSubscript:@"accessoryCategory"];
    }
    v14 = (void *)[v13 copy];
    [(HMFPowerLogger *)self reportToPowerLogDestinationTable:@"HomeKitEvent" withEventDictionary:v14];
  }
}

- (void)reportIncomingIPEvent:(id)a3
{
}

- (void)reportIncomingIPEvent:(id)a3 accessoryCategory:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x19F3A87A0]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543874;
      v18 = v10;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_INFO, "%{public}@Reporting incoming IP Event from: %@ and category: %@", buf, 0x20u);
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
    v15[0] = @"kHMFPowerLogEventType";
    v15[1] = @"kHMFPowerLogDeviceIdentiferKey";
    v16[0] = @"HomeKit IP Event";
    v16[1] = v6;
    v15[2] = @"couldCauseWake";
    v16[2] = MEMORY[0x1E4F1CC38];
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    v13 = [v11 dictionaryWithDictionary:v12];

    if (v7) {
      [v13 setObject:v7 forKeyedSubscript:@"accessoryCategory"];
    }
    v14 = (void *)[v13 copy];
    [(HMFPowerLogger *)self reportToPowerLogDestinationTable:@"HomeKitEvent" withEventDictionary:v14];
  }
}

- (void)reportIncomingCloudPush:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Reporting incoming cloud push with topic: %@", buf, 0x16u);
    }
    v9[0] = @"kHMFPowerLogEventType";
    v9[1] = @"kHMFPowerLogCloudPushTopicKey";
    v10[0] = @"HomeKit Cloud Push";
    v10[1] = v4;
    v9[2] = @"couldCauseWake";
    v10[2] = MEMORY[0x1E4F1CC38];
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
    [(HMFPowerLogger *)self reportToPowerLogDestinationTable:@"HomeKitEvent" withEventDictionary:v8];
  }
}

- (void)reportIncomingIDSPush:(id)a3 fromToken:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 rangeOfString:@"mailto"];
  id v9 = v7;
  v10 = v9;
  uint64_t v11 = v9;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [v9 substringToIndex:v8];
  }
  if (v6 && v11)
  {
    v12 = (void *)MEMORY[0x19F3A87A0]();
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543874;
      __int16 v19 = v14;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_INFO, "%{public}@Reporting incoming IDS push: %@ fromToken: %@", buf, 0x20u);
    }
    v16[0] = @"kHMFPowerLogEventType";
    v16[1] = @"kHMFPowerLogMessageTypeKey";
    v17[0] = @"HomeKit IDS Push";
    v17[1] = v6;
    v16[2] = @"kHMFPowerLogIDSDeviceTokenKey";
    void v16[3] = @"couldCauseWake";
    v17[2] = v11;
    v17[3] = MEMORY[0x1E4F1CC38];
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    [(HMFPowerLogger *)self reportToPowerLogDestinationTable:@"HomeKitEvent" withEventDictionary:v15];
  }
}

- (void)reportIncomingLoxyMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Reporting incoming Loxy message: %@", buf, 0x16u);
    }
    v9[0] = @"kHMFPowerLogEventType";
    v9[1] = @"kHMFPowerLogMessageTypeKey";
    v10[0] = @"HomeKit Loxy Event";
    v10[1] = v4;
    v9[2] = @"couldCauseWake";
    v10[2] = MEMORY[0x1E4F1CC38];
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
    [(HMFPowerLogger *)self reportToPowerLogDestinationTable:@"HomeKitEvent" withEventDictionary:v8];
  }
}

- (void)reportRemoteReachabilityRegistrationEvent:(BOOL)a3 clientIdentifier:(id)a4
{
  BOOL v4 = a3;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  v19[0] = @"kHMFPowerLogEventType";
  v19[1] = @"kHMFPowerLogEnabledKey";
  v20[0] = @"HomeKit Remote Reachability Registration Event";
  uint64_t v8 = [NSNumber numberWithBool:v4];
  v20[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v10 = [v7 dictionaryWithDictionary:v9];

  if (v6) {
    uint64_t v11 = [v10 setObject:v6 forKey:@"kHMFPowerLogClientIdentifierKey"];
  }
  v12 = (void *)MEMORY[0x19F3A87A0](v11);
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier(0);
    int v15 = 138543618;
    v16 = v14;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_INFO, "%{public}@Reporting remote reachability registration event: %@", (uint8_t *)&v15, 0x16u);
  }
  [(HMFPowerLogger *)self reportToPowerLogDestinationTable:@"HomeKitRegistration" withEventDictionary:v10];
}

@end