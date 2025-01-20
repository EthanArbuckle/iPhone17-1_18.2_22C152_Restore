@interface HMDAccessoryReachabilityChangedLogEvent
+ (id)eventWithReachable:(BOOL)a3 changed:(BOOL)a4 duration:(double)a5 accessory:(id)a6 transportReport:(id)a7;
- (BOOL)accessoryBatteryPowered;
- (BOOL)accessoryBridged;
- (BOOL)batteryLow;
- (BOOL)changed;
- (BOOL)reachable;
- (HMDAccessoryReachabilityChangedLogEvent)init;
- (HMDAccessoryTransportReachabilityReport)transportReport;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)accessoryNumber;
- (NSString)accessoryCategory;
- (NSString)accessoryFirmwareVersion;
- (NSString)accessoryManufacturer;
- (NSString)accessoryModel;
- (NSString)coreAnalyticsEventName;
- (double)duration;
- (id)__initWithReachable:(BOOL)a3 changed:(BOOL)a4 duration:(double)a5 accessory:(id)a6 transportReport:(id)a7;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDAccessoryReachabilityChangedLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportReport, 0);
  objc_storeStrong((id *)&self->_accessoryNumber, 0);
  objc_storeStrong((id *)&self->_accessoryModel, 0);
  objc_storeStrong((id *)&self->_accessoryManufacturer, 0);
  objc_storeStrong((id *)&self->_accessoryFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
}

- (HMDAccessoryTransportReachabilityReport)transportReport
{
  return self->_transportReport;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (BOOL)changed
{
  return self->_changed;
}

- (BOOL)batteryLow
{
  return self->_batteryLow;
}

- (NSNumber)accessoryNumber
{
  return self->_accessoryNumber;
}

- (NSString)accessoryModel
{
  return self->_accessoryModel;
}

- (NSString)accessoryManufacturer
{
  return self->_accessoryManufacturer;
}

- (NSString)accessoryFirmwareVersion
{
  return self->_accessoryFirmwareVersion;
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (BOOL)accessoryBridged
{
  return self->_accessoryBridged;
}

- (BOOL)accessoryBatteryPowered
{
  return self->_accessoryBatteryPowered;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = NSNumber;
  [(HMDAccessoryReachabilityChangedLogEvent *)self duration];
  v6 = [v4 numberWithInteger:(uint64_t)v5];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryReachabilityChangedLogEvent accessoryBatteryPowered](self, "accessoryBatteryPowered"));
  [v3 setObject:v7 forKeyedSubscript:@"accessoryBatteryPowered"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryReachabilityChangedLogEvent accessoryBridged](self, "accessoryBridged"));
  [v3 setObject:v8 forKeyedSubscript:@"accessoryBridged"];

  v9 = [(HMDAccessoryReachabilityChangedLogEvent *)self accessoryCategory];
  [v3 setObject:v9 forKeyedSubscript:@"accessoryCategory"];

  v10 = [(HMDAccessoryReachabilityChangedLogEvent *)self accessoryFirmwareVersion];
  [v3 setObject:v10 forKeyedSubscript:@"accessoryFirmwareVersion"];

  v11 = [(HMDAccessoryReachabilityChangedLogEvent *)self accessoryManufacturer];
  [v3 setObject:v11 forKeyedSubscript:@"accessoryManufacturer"];

  v12 = [(HMDAccessoryReachabilityChangedLogEvent *)self accessoryModel];
  [v3 setObject:v12 forKeyedSubscript:@"accessoryModel"];

  v13 = [(HMDAccessoryReachabilityChangedLogEvent *)self accessoryNumber];
  [v3 setObject:v13 forKeyedSubscript:@"accessoryNumber"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryReachabilityChangedLogEvent batteryLow](self, "batteryLow"));
  [v3 setObject:v14 forKeyedSubscript:@"batteryLow"];

  if ([(HMDAccessoryReachabilityChangedLogEvent *)self changed]) {
    v15 = &unk_26E4711A0;
  }
  else {
    v15 = &unk_26E4711B8;
  }
  [v3 setObject:v15 forKeyedSubscript:@"changeCount"];
  [v3 setObject:v6 forKeyedSubscript:@"duration"];
  v16 = NSNumber;
  v17 = [(HMDAccessoryReachabilityChangedLogEvent *)self transportReport];
  v18 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "hasAdvertisement"));
  [v3 setObject:v18 forKeyedSubscript:@"hasAdvertisement"];

  v19 = [(HMDAccessoryReachabilityChangedLogEvent *)self transportReport];
  v20 = [v19 protocol];
  [v3 setObject:v20 forKeyedSubscript:@"protocol"];

  v21 = [(HMDAccessoryReachabilityChangedLogEvent *)self transportReport];
  v22 = [v21 protocolVersion];
  [v3 setObject:v22 forKeyedSubscript:@"protocolVersion"];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryReachabilityChangedLogEvent reachable](self, "reachable"));
  [v3 setObject:v23 forKeyedSubscript:@"reachable"];

  v24 = [(HMDAccessoryReachabilityChangedLogEvent *)self transportReport];
  v25 = [v24 reason];
  [v3 setObject:v25 forKeyedSubscript:@"reason"];

  v26 = [(HMDAccessoryReachabilityChangedLogEvent *)self transportReport];
  v27 = [v26 linkType];
  [v3 setObject:v27 forKeyedSubscript:@"transport"];

  if ([(HMDAccessoryReachabilityChangedLogEvent *)self reachable]) {
    v28 = @"unreachableDuration";
  }
  else {
    v28 = @"reachableDuration";
  }
  [v3 setObject:v6 forKeyedSubscript:v28];
  v29 = (void *)[v3 copy];

  return (NSDictionary *)v29;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.AccessoryReachabilityChanged";
}

- (id)__initWithReachable:(BOOL)a3 changed:(BOOL)a4 duration:(double)a5 accessory:(id)a6 transportReport:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v28.receiver = self;
  v28.super_class = (Class)HMDAccessoryReachabilityChangedLogEvent;
  v14 = [(HMMLogEvent *)&v28 init];
  v15 = v14;
  if (v14)
  {
    v14->_reachable = a3;
    v14->_changed = a4;
    v14->_duration = a5;
    v14->_accessoryBridged = [v12 isPrimary] ^ 1;
    v15->_accessoryBatteryPowered = [v12 hasBattery];
    v15->_batteryLow = 0;
    objc_storeStrong((id *)&v15->_transportReport, a7);
    v16 = [v12 metricLoggingVendorDetails];
    uint64_t v17 = [v16 model];
    accessoryModel = v15->_accessoryModel;
    v15->_accessoryModel = (NSString *)v17;

    uint64_t v19 = [v16 manufacturer];
    accessoryManufacturer = v15->_accessoryManufacturer;
    v15->_accessoryManufacturer = (NSString *)v19;

    uint64_t v21 = [v16 category];
    accessoryCategory = v15->_accessoryCategory;
    v15->_accessoryCategory = (NSString *)v21;

    uint64_t v23 = [v16 firmwareVersion];
    accessoryFirmwareVersion = v15->_accessoryFirmwareVersion;
    v15->_accessoryFirmwareVersion = (NSString *)v23;

    uint64_t v25 = [v16 differentiationNumber];
    accessoryNumber = v15->_accessoryNumber;
    v15->_accessoryNumber = (NSNumber *)v25;
  }
  return v15;
}

- (HMDAccessoryReachabilityChangedLogEvent)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  double v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)eventWithReachable:(BOOL)a3 changed:(BOOL)a4 duration:(double)a5 accessory:(id)a6 transportReport:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a7;
  id v13 = a6;
  v14 = objc_msgSend(objc_alloc((Class)a1), "__initWithReachable:changed:duration:accessory:transportReport:", v10, v9, v13, v12, a5);

  return v14;
}

@end