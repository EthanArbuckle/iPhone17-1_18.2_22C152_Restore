@interface HMAccessorySettingsMetricsDispatcher
- (HMAccessorySettingsMetricsDispatcher)initWithCoreAnalyticsMetricDispatcher:(id)a3;
- (HMCoreAnalyticsMetricEventDispatcher)metricEventDispatcher;
- (id)finishTrackingEventWithIdentifier:(id)a3;
- (void)startEventWithMessage:(id)a3 updateKeyPath:(id)a4;
- (void)startTrackingEvent:(id)a3 withEventIdentifier:(id)a4;
- (void)submitEventWithMessage:(id)a3 error:(id)a4;
@end

@implementation HMAccessorySettingsMetricsDispatcher

- (HMAccessorySettingsMetricsDispatcher)initWithCoreAnalyticsMetricDispatcher:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMAccessorySettingsMetricsDispatcher;
  v6 = [(HMAccessorySettingsMetricsDispatcher *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_metricEventDispatcher, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackingEvents = v7->_trackingEvents;
    v7->_trackingEvents = v8;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricEventDispatcher, 0);

  objc_storeStrong((id *)&self->_trackingEvents, 0);
}

- (HMCoreAnalyticsMetricEventDispatcher)metricEventDispatcher
{
  return (HMCoreAnalyticsMetricEventDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (id)finishTrackingEventWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = [(NSMutableDictionary *)self->_trackingEvents objectForKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_trackingEvents setObject:0 forKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v5) {
    [v5 finish];
  }

  return v5;
}

- (void)startTrackingEvent:(id)a3 withEventIdentifier:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [v7 start];
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_trackingEvents setObject:v7 forKeyedSubscript:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)submitEventWithMessage:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_super v11 = HMFGetLogIdentifier();
    int v19 = 138543618;
    v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Submitting tracking for event message: %@", (uint8_t *)&v19, 0x16u);
  }
  v12 = [v6 identifier];
  v13 = [(HMAccessorySettingsMetricsDispatcher *)v9 finishTrackingEventWithIdentifier:v12];

  if (v13)
  {
    [v13 setError:v7];
    v14 = [(HMAccessorySettingsMetricsDispatcher *)v9 metricEventDispatcher];
    [v14 sendEvent:v13];
  }
  else
  {
    v15 = (void *)MEMORY[0x19F3A64A0]();
    v16 = v9;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v18;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get tracked fetch event with message: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)startEventWithMessage:(id)a3 updateKeyPath:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_super v11 = HMFGetLogIdentifier();
    int v20 = 138543618;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting tracking for event message: %@", (uint8_t *)&v20, 0x16u);
  }
  v12 = [HMAccessorySettingsMessageDispatcherStartSendingMessageEvent alloc];
  v13 = [v6 name];
  v14 = [(HMAccessorySettingsMessageDispatcherStartSendingMessageEvent *)v12 initWithMessageName:v13 updateKeyPath:v7];

  v15 = [(HMAccessorySettingsMetricsDispatcher *)v9 metricEventDispatcher];
  [v15 sendEvent:v14];

  v16 = [HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent alloc];
  v17 = [v6 name];
  v18 = [(HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent *)v16 initWithMessageName:v17];

  int v19 = [v6 identifier];
  [(HMAccessorySettingsMetricsDispatcher *)v9 startTrackingEvent:v18 withEventIdentifier:v19];
}

@end