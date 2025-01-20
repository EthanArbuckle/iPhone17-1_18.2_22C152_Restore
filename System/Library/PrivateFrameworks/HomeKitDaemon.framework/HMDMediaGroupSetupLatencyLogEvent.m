@interface HMDMediaGroupSetupLatencyLogEvent
- (HMDMediaGroupSetupLatencyLogEvent)initWithRequestType:(id)a3 systemUUID:(id)a4 deviceRole:(id)a5 totalDurationMS:(unint64_t)a6 setupSessionIdentifier:(id)a7 totalDurationSinceAccessorySetupStartMS:(unint64_t)a8 errorStage:(id)a9;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)deviceRole;
- (NSString)errorStage;
- (NSString)requestType;
- (NSString)setupSessionIdentifier;
- (NSString)systemUUID;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)totalDurationMS;
- (unint64_t)totalDurationSinceAccessorySetupStartMS;
@end

@implementation HMDMediaGroupSetupLatencyLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_errorStage, 0);
  objc_storeStrong((id *)&self->_deviceRole, 0);
  objc_storeStrong((id *)&self->_systemUUID, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
}

- (unint64_t)totalDurationSinceAccessorySetupStartMS
{
  return self->_totalDurationSinceAccessorySetupStartMS;
}

- (NSString)setupSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)errorStage
{
  return self->_errorStage;
}

- (unint64_t)totalDurationMS
{
  return self->_totalDurationMS;
}

- (NSString)deviceRole
{
  return self->_deviceRole;
}

- (NSString)systemUUID
{
  return self->_systemUUID;
}

- (NSString)requestType
{
  return self->_requestType;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(HMDMediaGroupSetupLatencyLogEvent *)self requestType];
  [v3 setObject:v4 forKeyedSubscript:@"requestType"];

  v5 = [(HMDMediaGroupSetupLatencyLogEvent *)self systemUUID];
  [v3 setObject:v5 forKeyedSubscript:@"systemUUID"];

  v6 = [(HMDMediaGroupSetupLatencyLogEvent *)self deviceRole];
  [v3 setObject:v6 forKeyedSubscript:@"deviceRole"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDMediaGroupSetupLatencyLogEvent totalDurationMS](self, "totalDurationMS"));
  [v3 setObject:v7 forKeyedSubscript:@"totalDurationMS"];

  v8 = [(HMDMediaGroupSetupLatencyLogEvent *)self errorStage];
  [v3 setObject:v8 forKeyedSubscript:@"errorStage"];

  v9 = [(HMDMediaGroupSetupLatencyLogEvent *)self setupSessionIdentifier];

  if (v9)
  {
    v10 = [(HMDMediaGroupSetupLatencyLogEvent *)self setupSessionIdentifier];
    [v3 setObject:v10 forKeyedSubscript:@"setupSessionIdentifier"];

    v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDMediaGroupSetupLatencyLogEvent totalDurationSinceAccessorySetupStartMS](self, "totalDurationSinceAccessorySetupStartMS"));
    [v3 setObject:v11 forKeyedSubscript:@"totalDurationSinceAccessorySetupStartMS"];
  }
  v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.multidevice.homepod.feature.setup";
}

- (HMDMediaGroupSetupLatencyLogEvent)initWithRequestType:(id)a3 systemUUID:(id)a4 deviceRole:(id)a5 totalDurationMS:(unint64_t)a6 setupSessionIdentifier:(id)a7 totalDurationSinceAccessorySetupStartMS:(unint64_t)a8 errorStage:(id)a9
{
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)HMDMediaGroupSetupLatencyLogEvent;
  v18 = [(HMMLogEvent *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_requestType, a3);
    objc_storeStrong((id *)&v19->_systemUUID, a4);
    objc_storeStrong((id *)&v19->_deviceRole, a5);
    v19->_totalDurationMS = a6;
    objc_storeStrong((id *)&v19->_setupSessionIdentifier, a7);
    v19->_totalDurationSinceAccessorySetupStartMS = a8;
    objc_storeStrong((id *)&v19->_errorStage, a9);
  }

  return v19;
}

@end