@interface HMCoreAnalyticsMetricEventDispatcher
- (HMCoreAnalyticsMetricEventDispatcher)init;
- (HMCoreAnalyticsMetricEventDispatcher)initWithSendEventHandler:(id)a3;
- (void)sendEvent:(id)a3;
@end

@implementation HMCoreAnalyticsMetricEventDispatcher

- (HMCoreAnalyticsMetricEventDispatcher)init
{
  return [(HMCoreAnalyticsMetricEventDispatcher *)self initWithSendEventHandler:&__block_literal_global_21090];
}

- (HMCoreAnalyticsMetricEventDispatcher)initWithSendEventHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)HMCoreAnalyticsMetricEventDispatcher;
    v6 = [(HMCoreAnalyticsMetricEventDispatcher *)&v12 init];
    if (v6)
    {
      v7 = _Block_copy(v5);
      id sendEventHandler = v6->_sendEventHandler;
      v6->_id sendEventHandler = v7;
    }
    return v6;
  }
  else
  {
    v10 = (HMAccessorySetupCoordinator *)_HMFPreconditionFailure();
    return (HMCoreAnalyticsMetricEventDispatcher *)[(HMAccessorySetupCoordinator *)v10 init];
  }
}

- (void).cxx_destruct
{
}

- (void)sendEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending event: %@", (uint8_t *)&v12, 0x16u);
  }
  id sendEventHandler = (void (**)(id, void *, void *))v6->_sendEventHandler;
  v10 = [v4 name];
  SEL v11 = [v4 eventPayload];
  sendEventHandler[2](sendEventHandler, v10, v11);
}

void __44__HMCoreAnalyticsMetricEventDispatcher_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__HMCoreAnalyticsMetricEventDispatcher_init__block_invoke_2;
  v14[3] = &unk_1E5942E28;
  id v6 = v5;
  id v15 = v6;
  id v7 = v4;
  v8 = v14;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v9 = (uint64_t (*)(id, void *))getAnalyticsSendEventLazySymbolLoc_ptr;
  v19 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
    v21 = &unk_1E5943DD8;
    v22 = &v16;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke((uint64_t)buf);
    v9 = (uint64_t (*)(id, void *))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v9)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  char v10 = v9(v7, v8);

  if ((v10 & 1) == 0)
  {
    SEL v11 = (void *)MEMORY[0x19F3A64A0]();
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@[HMCoreAnalyticsMetricEventDispatcherSendHandler] no event registered for event: %@", buf, 0x16u);
    }
  }
}

id __44__HMCoreAnalyticsMetricEventDispatcher_init__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end