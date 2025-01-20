@interface HMDAccessoryRetrievalCompletionTuple
- (HMDAccessory)accessory;
- (HMDAccessoryRetrievalCompletionTuple)initWithHome:(id)a3 accessory:(id)a4 linkType:(int64_t)a5;
- (HMDHome)home;
- (HMFTimer)timer;
- (NSMutableArray)completions;
- (double)retrievalTimeout;
- (int64_t)linkType;
- (void)addCompletion:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setCompletions:(id)a3;
- (void)setHome:(id)a3;
- (void)setLinkType:(int64_t)a3;
- (void)setRetrievalTimeout:(double)a3;
- (void)setTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDAccessoryRetrievalCompletionTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_destroyWeak((id *)&self->_home);
}

- (void)setTimer:(id)a3
{
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)setRetrievalTimeout:(double)a3
{
  self->_retrievalTimeout = a3;
}

- (double)retrievalTimeout
{
  return self->_retrievalTimeout;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setCompletions:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setAccessory:(id)a3
{
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAccessoryRetrievalCompletionTuple *)self home];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 workQueue];
    dispatch_assert_queue_V2(v7);

    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [(HMDAccessoryRetrievalCompletionTuple *)v9 accessory];
      v13 = [v12 shortDescription];
      unint64_t v14 = [(HMDAccessoryRetrievalCompletionTuple *)v9 linkType];
      if (v14 > 2) {
        v15 = @"Undefined";
      }
      else {
        v15 = off_264A1CE08[v14];
      }
      v20 = v15;
      int v24 = 138543874;
      v25 = v11;
      __int16 v26 = 2112;
      v27 = v13;
      __int16 v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory retrieval timed out for accessory %@/%@", (uint8_t *)&v24, 0x20u);
    }
    v21 = [MEMORY[0x263F087E8] hmErrorWithCode:100];
    v22 = [(HMDAccessoryRetrievalCompletionTuple *)v9 accessory];
    v23 = [v22 identifier];
    objc_msgSend(v6, "_notifyRetrievalError:accessoryServer:linkType:accessoryOperationBlock:", v21, v23, -[HMDAccessoryRetrievalCompletionTuple linkType](v9, "linkType"), 0);
  }
  else
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      int v24 = 138543362;
      v25 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory retrieval lost reference to home", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)stop
{
  v3 = [(HMDAccessoryRetrievalCompletionTuple *)self home];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(HMDAccessoryRetrievalCompletionTuple *)self timer];
  [v5 suspend];

  [(HMDAccessoryRetrievalCompletionTuple *)self setTimer:0];
}

- (void)start
{
  id v11 = [(HMDAccessoryRetrievalCompletionTuple *)self home];
  v3 = [v11 workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessoryRetrievalCompletionTuple *)self timer];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F42658]);
    [(HMDAccessoryRetrievalCompletionTuple *)self retrievalTimeout];
    v6 = objc_msgSend(v5, "initWithTimeInterval:options:", 0);
    [(HMDAccessoryRetrievalCompletionTuple *)self setTimer:v6];

    v7 = [v11 workQueue];
    v8 = [(HMDAccessoryRetrievalCompletionTuple *)self timer];
    [v8 setDelegateQueue:v7];

    v9 = [(HMDAccessoryRetrievalCompletionTuple *)self timer];
    [v9 setDelegate:self];

    v10 = [(HMDAccessoryRetrievalCompletionTuple *)self timer];
    [v10 resume];
  }
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryRetrievalCompletionTuple *)self home];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v8 = [(HMDAccessoryRetrievalCompletionTuple *)self completions];
  v7 = _Block_copy(v4);

  [v8 addObject:v7];
}

- (HMDAccessoryRetrievalCompletionTuple)initWithHome:(id)a3 accessory:(id)a4 linkType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDAccessoryRetrievalCompletionTuple;
  v10 = [(HMDAccessoryRetrievalCompletionTuple *)&v17 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_home, v8);
    objc_storeWeak((id *)&v11->_accessory, v9);
    v11->_linkType = a5;
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    completions = v11->_completions;
    v11->_completions = (NSMutableArray *)v12;

    if (a5 == 2)
    {
      double v14 = 60.0;
    }
    else
    {
      int v15 = [v9 isSuspendCapable];
      double v14 = 60.0;
      if (!v15) {
        double v14 = 30.0;
      }
    }
    v11->_retrievalTimeout = v14;
  }

  return v11;
}

@end