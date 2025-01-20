@interface HMAudioAnalysisLastKnownEventSubscriber
- (HMAudioAnalysisLastKnownEventSubscriber)initWithContext:(id)a3 subscriptionProvider:(id)a4 dataSource:(id)a5 workQueue:(id)a6;
- (HMAudioAnalysisLastKnownEventSubscriberDataSource)dataSource;
- (HMAudioAnalysisLastKnownEventSubscriberDelegate)delegate;
- (HMESubscriptionProviding)subscriptionProvider;
- (NSUUID)homeIdentifier;
- (OS_dispatch_queue)workQueue;
- (_HMContext)context;
- (void)_didReceiveEvent:(id)a3;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)setDelegate:(id)a3;
- (void)subscribeLastKnownEventsForAccessory:(id)a3 completion:(id)a4;
@end

@implementation HMAudioAnalysisLastKnownEventSubscriber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_subscriptionProvider);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMAudioAnalysisLastKnownEventSubscriberDataSource)dataSource
{
  return (HMAudioAnalysisLastKnownEventSubscriberDataSource *)objc_getProperty(self, a2, 32, 1);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subscriptionProvider);

  return (HMESubscriptionProviding *)WeakRetained;
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMAudioAnalysisLastKnownEventSubscriberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMAudioAnalysisLastKnownEventSubscriberDelegate *)WeakRetained;
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(HMAudioAnalysisLastKnownEventSubscriber *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__HMAudioAnalysisLastKnownEventSubscriber_didReceiveCachedEvent_topic_source___block_invoke;
  block[3] = &unk_1E5945650;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

uint64_t __78__HMAudioAnalysisLastKnownEventSubscriber_didReceiveCachedEvent_topic_source___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didReceiveEvent:*(void *)(a1 + 40) topic:*(void *)(a1 + 48)];
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v5 = a3;
  v6 = [(HMAudioAnalysisLastKnownEventSubscriber *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HMAudioAnalysisLastKnownEventSubscriber_didReceiveEvent_topic___block_invoke;
  v8[3] = &unk_1E5945628;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __65__HMAudioAnalysisLastKnownEventSubscriber_didReceiveEvent_topic___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveEvent:*(void *)(a1 + 40)];
}

- (void)_didReceiveEvent:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAudioAnalysisLastKnownEventSubscriber *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v27 = 0;
  v6 = +[HMAudioAnalysisAggregateEventBulletin decodeBulletinsFromEvent:v4 error:&v27];
  id v7 = v27;
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v12;
      __int16 v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@unable to decode bulletin event with :%@", buf, 0x16u);
    }
  }
  id v13 = [(HMAudioAnalysisLastKnownEventSubscriber *)self delegate];
  id v14 = (void *)MEMORY[0x19F3A64A0]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    v18 = [v6 bulletins];
    *(_DWORD *)buf = 138543874;
    v29 = v17;
    __int16 v30 = 2112;
    v31 = v18;
    __int16 v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updates with events: %@ delegate: %@", buf, 0x20u);
  }
  v19 = [(HMAudioAnalysisLastKnownEventSubscriber *)v15 context];
  v20 = [v19 delegateCaller];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__HMAudioAnalysisLastKnownEventSubscriber__didReceiveEvent___block_invoke;
  v23[3] = &unk_1E5945650;
  id v24 = v13;
  v25 = v15;
  id v26 = v6;
  id v21 = v6;
  id v22 = v13;
  [v20 invokeBlock:v23];
}

void __60__HMAudioAnalysisLastKnownEventSubscriber__didReceiveEvent___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) bulletins];
    [v2 subscriber:v3 didUpdateBulletins:v4];
  }
}

- (void)subscribeLastKnownEventsForAccessory:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMAudioAnalysisLastKnownEventSubscriber *)self dataSource];
  id v9 = [v8 accessoryUUIDForIdentifier:v6];
  if (v9)
  {
    id v10 = [v8 uuid];
    id v11 = +[HMAudioAnalysisAggregateEventBulletin topicWithAccessoryUUID:v9 homeUUID:v10];

    v12 = [(HMAudioAnalysisLastKnownEventSubscriber *)self subscriptionProvider];
    v20 = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke;
    v18[3] = &unk_1E5941AC0;
    v18[4] = self;
    id v19 = v7;
    [v12 registerConsumer:self topicFilters:v13 completion:v18];
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v22 = v17;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@accessory identifier invalid", buf, 0xCu);
    }
    id v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Subscribe changed topics with error: %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribe changed topics, received cached events %@", buf, 0x16u);
    }
    if ([v5 count])
    {
      id v13 = [*(id *)(a1 + 32) workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_3;
      block[3] = &unk_1E5945628;
      id v14 = v5;
      uint64_t v15 = *(void *)(a1 + 32);
      id v24 = v14;
      uint64_t v25 = v15;
      dispatch_async(v13, block);
    }
  }
  v16 = [*(id *)(a1 + 32) context];
  v17 = [v16 delegateCaller];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_5;
  v20[3] = &unk_1E59454E8;
  id v18 = *(id *)(a1 + 40);
  id v21 = v6;
  id v22 = v18;
  id v19 = v6;
  [v17 invokeBlock:v20];
}

uint64_t __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_2;
  v3[3] = &unk_1E5941A98;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

uint64_t __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __91__HMAudioAnalysisLastKnownEventSubscriber_subscribeLastKnownEventsForAccessory_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveEvent:");
}

- (NSUUID)homeIdentifier
{
  v2 = [(HMAudioAnalysisLastKnownEventSubscriber *)self dataSource];
  uint64_t v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (HMAudioAnalysisLastKnownEventSubscriber)initWithContext:(id)a3 subscriptionProvider:(id)a4 dataSource:(id)a5 workQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMAudioAnalysisLastKnownEventSubscriber;
  uint64_t v15 = [(HMAudioAnalysisLastKnownEventSubscriber *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeWeak((id *)&v16->_subscriptionProvider, v12);
    objc_storeStrong((id *)&v16->_dataSource, a5);
    objc_storeStrong((id *)&v16->_workQueue, a6);
  }

  return v16;
}

@end