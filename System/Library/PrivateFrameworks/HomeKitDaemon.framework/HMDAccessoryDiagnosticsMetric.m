@interface HMDAccessoryDiagnosticsMetric
+ (id)logCategory;
- (HMDAccessoryDiagnosticsMetric)initWithAccessory:(id)a3;
- (HMDHAPAccessory)accessory;
- (NSDate)metricCollectionStartTime;
- (NSDictionary)metric;
- (id)collectMetric;
- (id)logIdentifier;
- (void)reset;
- (void)setMetricCollectionStartTime:(id)a3;
- (void)submitMetric:(id)a3;
@end

@implementation HMDAccessoryDiagnosticsMetric

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_metricCollectionStartTime, 0);
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (NSDictionary)metric
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetricCollectionStartTime:(id)a3
{
}

- (NSDate)metricCollectionStartTime
{
  return self->_metricCollectionStartTime;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryDiagnosticsMetric *)self accessory];
  v3 = NSString;
  v4 = [v2 name];
  v5 = [v2 identifier];
  v6 = [v3 stringWithFormat:@"%@ : %@", v4, v5];

  return v6;
}

- (void)reset
{
  v2 = [(HMDAccessoryDiagnosticsMetric *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  [v4 resetAccessoryDiagnosticCounters];
}

- (void)submitMetric:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAccessoryDiagnosticsMetric *)self accessory];
  if (v4)
  {
    v6 = [[HMDAccessoryDiagnosticMetricEvent alloc] initWithAccessory:v5 diagnostics:v4];
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [v5 name];
      v12 = [v5 identifier];
      v13 = [(HMDAccessoryDiagnosticMetricEvent *)v6 coreAnalyticsEventDictionary];
      int v16 = 138544130;
      v17 = v10;
      __int16 v18 = 2114;
      v19 = v11;
      __int16 v20 = 2114;
      v21 = v12;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Submitting AccessoryDiagnosticMetric for accessory: %{public}@/%{public}@ - %{public}@", (uint8_t *)&v16, 0x2Au);
    }
    v14 = [v5 home];
    v15 = [v14 logEventSubmitter];
    [v15 submitLogEvent:v6];
  }
}

- (id)collectMetric
{
  v2 = [(HMDAccessoryDiagnosticsMetric *)self accessory];
  v3 = [v2 accessoryDiagnosticCounters];

  return v3;
}

- (HMDAccessoryDiagnosticsMetric)initWithAccessory:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAccessoryDiagnosticsMetric;
  v5 = [(HMDAccessoryDiagnosticsMetric *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_accessory, v4);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_96447 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_96447, &__block_literal_global_256);
  }
  v2 = (void *)logCategory__hmf_once_v9_96448;
  return v2;
}

void __44__HMDAccessoryDiagnosticsMetric_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v9_96448;
  logCategory__hmf_once_v9_96448 = v0;
}

@end