@interface HMMCoreAnalyticsTagObserver
+ (id)logCategory;
- (HMMCoreAnalyticsLogEventFactory)logEventFactory;
- (HMMCoreAnalyticsTagObserver)initWithTagDispatcher:(id)a3 logEventSubmitter:(id)a4 logEventFactory:(id)a5;
- (HMMLogEventSubmitting)logEventSubmitter;
- (HMMTagDispatching)tagDispatcher;
- (void)configure;
- (void)observeTaggedEvent:(id)a3 addProcessorBlock:(id)a4;
- (void)unconfigure;
@end

@implementation HMMCoreAnalyticsTagObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventFactory, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_tagDispatcher, 0);
}

- (HMMCoreAnalyticsLogEventFactory)logEventFactory
{
  return (HMMCoreAnalyticsLogEventFactory *)objc_getProperty(self, a2, 24, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 16, 1);
}

- (HMMTagDispatching)tagDispatcher
{
  return (HMMTagDispatching *)objc_getProperty(self, a2, 8, 1);
}

- (void)observeTaggedEvent:(id)a3 addProcessorBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMMCoreAnalyticsTagObserver *)self logEventFactory];
  v9 = [v8 logEventForTaggedEvent:v6];

  if (v6)
  {
    v10 = [(HMMCoreAnalyticsTagObserver *)self logEventSubmitter];
    [v10 submitLogEvent:v9];
  }
  else
  {
    v11 = (void *)MEMORY[0x1D944E970]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v14;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      _os_log_impl(&dword_1D4999000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get logged event from tagged event: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)unconfigure
{
  id v5 = [(HMMCoreAnalyticsTagObserver *)self tagDispatcher];
  v3 = [(HMMCoreAnalyticsTagObserver *)self logEventFactory];
  v4 = [v3 supportedTags];
  [v5 unregisterTagObserver:self forTags:v4];
}

- (void)configure
{
  id v5 = [(HMMCoreAnalyticsTagObserver *)self tagDispatcher];
  v3 = [(HMMCoreAnalyticsTagObserver *)self logEventFactory];
  v4 = [v3 supportedTags];
  [v5 registerTagObserver:self forTags:v4];
}

- (HMMCoreAnalyticsTagObserver)initWithTagDispatcher:(id)a3 logEventSubmitter:(id)a4 logEventFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v16 = (void *)_HMFPreconditionFailure();
    return (HMMCoreAnalyticsTagObserver *)+[HMMCoreAnalyticsTagObserver logCategory];
  }
  v18.receiver = self;
  v18.super_class = (Class)HMMCoreAnalyticsTagObserver;
  v13 = [(HMMCoreAnalyticsTagObserver *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tagDispatcher, a3);
    objc_storeStrong((id *)&v14->_logEventSubmitter, a4);
    objc_storeStrong((id *)&v14->_logEventFactory, a5);
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1 != -1) {
    dispatch_once(&logCategory__hmf_once_t1, &__block_literal_global_197);
  }
  v2 = (void *)logCategory__hmf_once_v2;
  return v2;
}

uint64_t __42__HMMCoreAnalyticsTagObserver_logCategory__block_invoke()
{
  logCategory__hmf_once_v2 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end