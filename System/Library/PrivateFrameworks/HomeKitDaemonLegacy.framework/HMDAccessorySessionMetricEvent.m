@interface HMDAccessorySessionMetricEvent
- (BOOL)bonjourUpdateForced;
- (BOOL)isHomeThreadCapable;
- (BOOL)isPrimary;
- (BOOL)isPrimaryThreadCapable;
- (BOOL)isThreadAccessory;
- (BOOL)isThreadNetworkUp;
- (BOOL)lastSeenWithLowBattery;
- (HMDAccessory)accessory;
- (HMDAccessorySessionMetricEvent)initWithAccessory:(id)a3 expectedTransport:(id)a4 homeUUID:(id)a5 topErrorDomain:(id)a6 topErrorCode:(int64_t)a7 sessionFailureCount:(unint64_t)a8;
- (HMDAccessorySessionMetricEvent)initWithAccessory:(id)a3 sessionMetric:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)accessoryTransport;
- (NSString)coreAnalyticsEventName;
- (NSString)expectedTransport;
- (NSString)topErrorDomain;
- (NSUUID)homeUUID;
- (double)sessionCheckIntervalSec;
- (double)submissionIntervalSec;
- (int64_t)topErrorCode;
- (unint64_t)lastSeenSecondsAgo;
- (unint64_t)numActiveSessionClients;
- (unint64_t)numBonjourNames;
- (unint64_t)numIPAddresses;
- (unint64_t)numIPAddressesTried;
- (unint64_t)percentDurationReachable;
- (unint64_t)percentageDurationActiveSession;
- (unint64_t)sessionFailures;
- (unint64_t)successfulSessionRetries;
@end

@implementation HMDAccessorySessionMetricEvent

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_expectedTransport, 0);
  objc_storeStrong((id *)&self->_accessoryTransport, 0);
  objc_storeStrong((id *)&self->_topErrorDomain, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (BOOL)bonjourUpdateForced
{
  return self->_bonjourUpdateForced;
}

- (unint64_t)numBonjourNames
{
  return self->_numBonjourNames;
}

- (unint64_t)numIPAddressesTried
{
  return self->_numIPAddressesTried;
}

- (unint64_t)numIPAddresses
{
  return self->_numIPAddresses;
}

- (BOOL)isThreadAccessory
{
  return self->_isThreadAccessory;
}

- (NSString)expectedTransport
{
  return self->_expectedTransport;
}

- (NSString)accessoryTransport
{
  return self->_accessoryTransport;
}

- (BOOL)lastSeenWithLowBattery
{
  return self->_lastSeenWithLowBattery;
}

- (unint64_t)lastSeenSecondsAgo
{
  return self->_lastSeenSecondsAgo;
}

- (unint64_t)numActiveSessionClients
{
  return self->_numActiveSessionClients;
}

- (NSString)topErrorDomain
{
  return self->_topErrorDomain;
}

- (int64_t)topErrorCode
{
  return self->_topErrorCode;
}

- (unint64_t)successfulSessionRetries
{
  return self->_successfulSessionRetries;
}

- (double)submissionIntervalSec
{
  return self->_submissionIntervalSec;
}

- (unint64_t)sessionFailures
{
  return self->_sessionFailures;
}

- (double)sessionCheckIntervalSec
{
  return self->_sessionCheckIntervalSec;
}

- (unint64_t)percentDurationReachable
{
  return self->_percentDurationReachable;
}

- (unint64_t)percentageDurationActiveSession
{
  return self->_percentageDurationActiveSession;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)isThreadNetworkUp
{
  return self->_isThreadNetworkUp;
}

- (BOOL)isPrimaryThreadCapable
{
  return self->_isPrimaryThreadCapable;
}

- (BOOL)isHomeThreadCapable
{
  return self->_isHomeThreadCapable;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMDAccessorySessionMetricEvent *)self accessory];
  v5 = [v4 metricLoggingTransportDetails];
  v6 = [v5 accessoryProtocol];
  [v3 setObject:v6 forKeyedSubscript:@"accessoryProtocol"];

  v7 = [(HMDAccessorySessionMetricEvent *)self accessoryTransport];
  [v3 setObject:v7 forKeyedSubscript:@"accessoryTransport"];

  v8 = [(HMDAccessorySessionMetricEvent *)self expectedTransport];
  [v3 setObject:v8 forKeyedSubscript:@"expectedTransport"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isAccessoryBatteryPowered"));
  [v3 setObject:v9 forKeyedSubscript:@"isAccessoryBatteryPowered"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isAccessoryBridged"));
  [v3 setObject:v10 forKeyedSubscript:@"isAccessoryBridged"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isThreadAccessory"));
  [v3 setObject:v11 forKeyedSubscript:@"isThreadAccessory"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetricEvent isHomeThreadCapable](self, "isHomeThreadCapable"));
  [v3 setObject:v12 forKeyedSubscript:@"isHomeThreadCapable"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetricEvent isPrimaryThreadCapable](self, "isPrimaryThreadCapable"));
  [v3 setObject:v13 forKeyedSubscript:@"isPrimaryResidentThreadCapable"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetricEvent isThreadNetworkUp](self, "isThreadNetworkUp"));
  [v3 setObject:v14 forKeyedSubscript:@"isThreadNetworkUp"];

  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetricEvent isPrimary](self, "isPrimary"));
  [v3 setObject:v15 forKeyedSubscript:@"isPrimary"];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent percentageDurationActiveSession](self, "percentageDurationActiveSession"));
  [v3 setObject:v16 forKeyedSubscript:@"percentageDurationActiveSession"];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent percentDurationReachable](self, "percentDurationReachable"));
  [v3 setObject:v17 forKeyedSubscript:@"percentDurationReachable"];

  v18 = NSNumber;
  [(HMDAccessorySessionMetricEvent *)self sessionCheckIntervalSec];
  v19 = objc_msgSend(v18, "numberWithDouble:");
  [v3 setObject:v19 forKeyedSubscript:@"sessionCheckInterval"];

  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent sessionFailures](self, "sessionFailures"));
  [v3 setObject:v20 forKeyedSubscript:@"sessionFailures"];

  v21 = NSNumber;
  [(HMDAccessorySessionMetricEvent *)self submissionIntervalSec];
  v23 = [v21 numberWithDouble:floor(v22)];
  [v3 setObject:v23 forKeyedSubscript:@"submissionInterval"];

  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent successfulSessionRetries](self, "successfulSessionRetries"));
  [v3 setObject:v24 forKeyedSubscript:@"successfulSessionRetries"];

  v25 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessorySessionMetricEvent topErrorCode](self, "topErrorCode"));
  [v3 setObject:v25 forKeyedSubscript:@"topErrorCode"];

  v26 = [(HMDAccessorySessionMetricEvent *)self topErrorDomain];
  [v3 setObject:v26 forKeyedSubscript:@"topErrorDomain"];

  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent numActiveSessionClients](self, "numActiveSessionClients"));
  [v3 setObject:v27 forKeyedSubscript:@"numActiveSessionClients"];

  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent lastSeenSecondsAgo](self, "lastSeenSecondsAgo"));
  [v3 setObject:v28 forKeyedSubscript:@"lastSeenSecondsAgo"];

  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetricEvent lastSeenWithLowBattery](self, "lastSeenWithLowBattery"));
  [v3 setObject:v29 forKeyedSubscript:@"lastSeenWithLowBattery"];

  v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent numIPAddresses](self, "numIPAddresses"));
  [v3 setObject:v30 forKeyedSubscript:@"numIPAddressesResolved"];

  v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent numIPAddressesTried](self, "numIPAddressesTried"));
  [v3 setObject:v31 forKeyedSubscript:@"numIPAddressesTried"];

  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent numBonjourNames](self, "numBonjourNames"));
  [v3 setObject:v32 forKeyedSubscript:@"numBonjourNamesSeen"];

  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetricEvent bonjourUpdateForced](self, "bonjourUpdateForced"));
  [v3 setObject:v33 forKeyedSubscript:@"bonjourUpdateForced"];

  v34 = (void *)MEMORY[0x1D9452090]();
  v35 = self;
  v36 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v37 = HMFGetLogIdentifier();
    v38 = [v4 name];
    v39 = [v4 identifier];
    int v41 = 138544130;
    v42 = v37;
    __int16 v43 = 2112;
    v44 = v38;
    __int16 v45 = 2112;
    v46 = v39;
    __int16 v47 = 2112;
    v48 = v3;
    _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Serialized HMDAccessorySessionMetricEvent for accessory: %@/%@ - %@", (uint8_t *)&v41, 0x2Au);
  }

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeAccessory.Session";
}

- (HMDAccessorySessionMetricEvent)initWithAccessory:(id)a3 expectedTransport:(id)a4 homeUUID:(id)a5 topErrorDomain:(id)a6 topErrorCode:(int64_t)a7 sessionFailureCount:(unint64_t)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDAccessorySessionMetricEvent;
  v18 = [(HMDHAPMetrics *)&v21 initWithHMDAccessory:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_expectedTransport, a4);
    objc_storeStrong((id *)&v19->_homeUUID, a5);
    objc_storeStrong((id *)&v19->_topErrorDomain, a6);
    v19->_topErrorCode = a7;
    v19->_sessionFailures = a8;
  }

  return v19;
}

- (HMDAccessorySessionMetricEvent)initWithAccessory:(id)a3 sessionMetric:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HMDAccessorySessionMetricEvent;
  v8 = [(HMDHAPMetrics *)&v36 initWithHMDAccessory:v6];
  if (v8)
  {
    v9 = [v6 metricLoggingTransportDetails];
    objc_storeWeak((id *)&v8->_accessory, v6);
    v8->_isHomeThreadCapable = [v7 isHomeThreadCapable];
    v8->_isPrimaryThreadCapable = [v7 isPrimaryResidentThreadCapable];
    v8->_isThreadNetworkUp = [v7 isThreadNetworkUp];
    v8->_isPrimary = [v7 isFromPrimary];
    [v7 activeSessionDurationSec];
    double v11 = v10;
    [v7 submissionIntervalSec];
    v8->_percentageDurationActiveSession = vcvtmd_u64_f64(v11 / v12 * 100.0);
    [v7 reachableDurationSec];
    double v14 = v13;
    [v7 submissionIntervalSec];
    v8->_percentDurationReachable = vcvtmd_u64_f64(v14 / v15 * 100.0);
    [v7 sessionCheckIntervalSec];
    v8->_sessionCheckIntervalSec = v16;
    v8->_sessionFailures = [v7 sessionFailures];
    [v7 submissionIntervalSec];
    v8->_submissionIntervalSec = v17;
    v8->_successfulSessionRetries = [v7 successfulSessionRetries];
    v18 = [v7 topError];
    v8->_topErrorCode = [v18 code];

    v19 = [v7 topError];
    uint64_t v20 = [v19 domain];
    topErrorDomain = v8->_topErrorDomain;
    v8->_topErrorDomain = (NSString *)v20;

    v8->_numActiveSessionClients = [v6 numActiveSessionClients];
    if ([v6 isReachable])
    {
      v8->_lastSeenSecondsAgo = 0;
      v8->_lastSeenWithLowBattery = 0;
    }
    else
    {
      double v22 = [MEMORY[0x1E4F1C9C8] date];
      v23 = [v6 lastSeenDate];
      [v22 timeIntervalSinceDate:v23];
      v8->_lastSeenSecondsAgo = (unint64_t)v24;

      v8->_lastSeenWithLowBattery = [v6 isLowBattery];
    }
    uint64_t v25 = [v7 accessoryTransport];
    accessoryTransport = v8->_accessoryTransport;
    v8->_accessoryTransport = (NSString *)v25;

    uint64_t v27 = [v7 expectedTransport];
    expectedTransport = v8->_expectedTransport;
    v8->_expectedTransport = (NSString *)v27;

    v8->_isThreadAccessory = [v9 isThreadAccessory];
    v29 = [v7 sessionInfo];
    v8->_numIPAddresses = [v29 numIPAddresses];

    v30 = [v7 sessionInfo];
    v8->_numIPAddressesTried = [v30 numIPAddressesTried];

    v31 = [v7 sessionInfo];
    v8->_numBonjourNames = [v31 numBonjourNames];

    v8->_bonjourUpdateForced = [v7 isBonjourUpdateForced];
    v32 = [v6 home];
    uint64_t v33 = [v32 uuid];
    homeUUID = v8->_homeUUID;
    v8->_homeUUID = (NSUUID *)v33;
  }
  return v8;
}

@end