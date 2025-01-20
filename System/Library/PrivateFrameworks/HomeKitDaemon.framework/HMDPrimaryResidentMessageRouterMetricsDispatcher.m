@interface HMDPrimaryResidentMessageRouterMetricsDispatcher
- (HMDPrimaryResidentMessageRouterMetricsDispatcher)initWithLogEventSubmitter:(id)a3;
- (HMMLogEventSubmitting)logEventSubmitter;
- (void)submitFailureEventWithMessageName:(id)a3 failureType:(int64_t)a4;
@end

@implementation HMDPrimaryResidentMessageRouterMetricsDispatcher

- (void).cxx_destruct
{
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 8, 1);
}

- (void)submitFailureEventWithMessageName:(id)a3 failureType:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    if ((unint64_t)(a4 - 1) > 4) {
      v11 = @"UnknownValue";
    }
    else {
      v11 = off_264A14AF0[a4 - 1];
    }
    v12 = v11;
    int v15 = 138543874;
    v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Submitting failure event with message name: %@ failure type: %@", (uint8_t *)&v15, 0x20u);
  }
  v13 = [[HMDPrimaryResidentMessageRouterFailureEvent alloc] initWithMessageName:v6 failureType:a4];
  v14 = [(HMDPrimaryResidentMessageRouterMetricsDispatcher *)v8 logEventSubmitter];
  [v14 submitLogEvent:v13];
}

- (HMDPrimaryResidentMessageRouterMetricsDispatcher)initWithLogEventSubmitter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDPrimaryResidentMessageRouterMetricsDispatcher;
  id v6 = [(HMDPrimaryResidentMessageRouterMetricsDispatcher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logEventSubmitter, a3);
  }

  return v7;
}

@end