@interface HMMSiriSELFLogEventObserver
+ (id)logCategory;
- (HMMSiriSELFAnalyticsStream)siriAnalyticsStream;
- (HMMSiriSELFLogEventObserver)initWithSiriAnalyticsStream:(id)a3 logEventDispatcher:(id)a4;
- (void)didReceiveEventFromDispatcher:(id)a3;
@end

@implementation HMMSiriSELFLogEventObserver

- (void).cxx_destruct
{
}

- (HMMSiriSELFAnalyticsStream)siriAnalyticsStream
{
  return self->_siriAnalyticsStream;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944E970]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = objc_opt_class();
    _os_log_impl(&dword_1D4999000, v7, OS_LOG_TYPE_DEBUG, "%{public}@[SiriAnalytics] Received event from dispatcher: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 enabledForSiriSELFLogging])
  {
    v9 = [(HMMSiriSELFLogEventObserver *)v6 siriAnalyticsStream];
    v10 = [v4 siriInstrumentationMessage];
    [v9 emitMessage:v10];
  }
}

- (HMMSiriSELFLogEventObserver)initWithSiriAnalyticsStream:(id)a3 logEventDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMSiriSELFLogEventObserver;
  v9 = [(HMMSiriSELFLogEventObserver *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_siriAnalyticsStream, a3);
    [v8 addObserver:v10 forProtocol:&unk_1F2C8F010];
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_1956 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_1956, &__block_literal_global_1957);
  }
  v2 = (void *)logCategory__hmf_once_v2_1958;
  return v2;
}

uint64_t __42__HMMSiriSELFLogEventObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_1958;
  logCategory__hmf_once_v2_1958 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end