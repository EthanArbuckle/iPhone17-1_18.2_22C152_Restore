@interface HMDAccessoryDiagnosticMetricEvent
- (HMDAccessory)accessory;
- (HMDAccessoryDiagnosticMetricEvent)initWithAccessory:(id)a3 diagnostics:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSDictionary)diagnostics;
- (NSString)coreAnalyticsEventName;
@end

@implementation HMDAccessoryDiagnosticMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (NSDictionary)diagnostics
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(HMDAccessoryDiagnosticMetricEvent *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v4 metricLoggingTransportDetails];
  v8 = [v6 metricLoggingVendorDetails];
  v9 = [v8 category];
  [v3 setObject:v9 forKeyedSubscript:@"accessoryCategory"];

  v10 = [v8 firmwareVersion];
  [v3 setObject:v10 forKeyedSubscript:@"accessoryFirmwareVersion"];

  v11 = [v8 manufacturer];
  [v3 setObject:v11 forKeyedSubscript:@"accessoryManufacturer"];

  v12 = [v8 model];
  [v3 setObject:v12 forKeyedSubscript:@"accessoryModel"];

  v13 = [v7 accessoryProtocol];
  [v3 setObject:v13 forKeyedSubscript:@"accessoryProtocol"];

  [v6 linkLayerType];
  v14 = HAPLinkLayerTypeDescription();
  [v3 setObject:v14 forKeyedSubscript:@"accessoryTransport"];

  v15 = [v6 expectedTransport];
  [v3 setObject:v15 forKeyedSubscript:@"expectedTransport"];

  v16 = [(HMDAccessoryDiagnosticMetricEvent *)self diagnostics];
  [v3 addEntriesFromDictionary:v16];

  v17 = (void *)MEMORY[0x230FBD990]();
  v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = HMFGetLogIdentifier();
    v21 = [v4 name];
    [v4 identifier];
    v25 = v17;
    v23 = v22 = v7;
    *(_DWORD *)buf = 138544130;
    v27 = v20;
    __int16 v28 = 2112;
    v29 = v21;
    __int16 v30 = 2112;
    v31 = v23;
    __int16 v32 = 2112;
    v33 = v3;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Serialized HMDAccessoryDiagnosticMetricEvent for accessory: %@/%@ - %@", buf, 0x2Au);

    v7 = v22;
    v17 = v25;
  }

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.Matter.Accessory.Diagnostic";
}

- (HMDAccessoryDiagnosticMetricEvent)initWithAccessory:(id)a3 diagnostics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAccessoryDiagnosticMetricEvent;
  v8 = [(HMDHAPMetrics *)&v11 initWithHMDAccessory:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_storeStrong((id *)&v9->_diagnostics, a4);
  }

  return v9;
}

@end