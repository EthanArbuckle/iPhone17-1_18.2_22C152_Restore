@interface HMDWiFiReconfigurationLogEvent
- (BOOL)isUsingFailSafeUpdate;
- (HMDAccessory)accessory;
- (HMDAccessory)routerAccessory;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int64_t)credentialType;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setAccessory:(id)a3;
- (void)setCredentialType:(int64_t)a3;
- (void)setRouterAccessory:(id)a3;
- (void)setUsingFailSafeUpdate:(BOOL)a3;
@end

@implementation HMDWiFiReconfigurationLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routerAccessory, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (void)setRouterAccessory:(id)a3
{
}

- (HMDAccessory)routerAccessory
{
  return self->_routerAccessory;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setUsingFailSafeUpdate:(BOOL)a3
{
  self->_usingFailSafeUpdate = a3;
}

- (BOOL)isUsingFailSafeUpdate
{
  return self->_usingFailSafeUpdate;
}

- (void)setAccessory:(id)a3
{
}

- (HMDAccessory)accessory
{
  return self->_accessory;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDWiFiReconfigurationLogEvent isUsingFailSafeUpdate](self, "isUsingFailSafeUpdate"));
  [v3 setObject:v4 forKeyedSubscript:@"failSafeUpdate"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDWiFiReconfigurationLogEvent credentialType](self, "credentialType"));
  [v3 setObject:v5 forKeyedSubscript:@"credentialType"];

  v6 = objc_msgSend(NSNumber, "numberWithDouble:", ceil((double)-[HMMLogEvent durationMilliseconds](self, "durationMilliseconds") / 1000.0));
  [v3 setObject:v6 forKeyedSubscript:@"duration"];

  v7 = [(HMDWiFiReconfigurationLogEvent *)self accessory];
  [v7 populateVendorDetailsForCoreAnalytics:v3 keyPrefix:@"accessory"];

  v8 = [(HMDWiFiReconfigurationLogEvent *)self routerAccessory];
  [v8 populateVendorDetailsForCoreAnalytics:v3 keyPrefix:@"router"];

  v9 = (void *)[v3 copy];
  return (NSDictionary *)v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.wiFiReconfiguration";
}

@end