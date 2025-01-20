@interface HMDPrimaryResidentDiscoveryOperation
+ (id)logCategory;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDHome)home;
- (HMDMessageDispatcher)messageDispatcher;
- (HMDPrimaryResidentDiscoveryLogEvent)logEvent;
- (HMDPrimaryResidentDiscoveryOperation)initWithHome:(id)a3 messageDispatcher:(id)a4 featuresDataSource:(id)a5 context:(id)a6;
- (HMDResidentDevice)currentPrimaryResident;
- (HMDResidentDeviceManagerContext)context;
- (HMFFuture)completionFuture;
- (HMFFuture)initialDiscoveryAttemptCompletionFuture;
- (HMFPromise)initialDiscoveryAttemptCompletionPromise;
- (HMFTimer)sendAccountMessageTimer;
- (HMFTimer)sendToNextDestinationTimer;
- (NSArray)candidateDestinations;
- (NSEnumerator)candidateDestinationsEnumerator;
- (NSString)logIdentifier;
- (NSUUID)currentPrimaryResidentGenerationID;
- (id)responseHandler;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)channel:(id)a3 didObservePrimaryResidentChange:(id)a4;
- (void)checkResidentStatusChannelForPrimary;
- (void)finish;
- (void)main;
- (void)residentStatusChannelCleanup;
- (void)run;
- (void)sendIDSAccountMessage;
- (void)setCandidateDestinationsEnumerator:(id)a3;
- (void)setHome:(id)a3;
- (void)setInitialDiscoveryAttemptCompletionPromise:(id)a3;
- (void)setSendAccountMessageTimer:(id)a3;
- (void)setSendToNextDestinationTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDPrimaryResidentDiscoveryOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendAccountMessageTimer, 0);
  objc_storeStrong((id *)&self->_sendToNextDestinationTimer, 0);
  objc_storeStrong((id *)&self->_candidateDestinations, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_initialDiscoveryAttemptCompletionPromise, 0);
  objc_storeStrong((id *)&self->_candidateDestinationsEnumerator, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_logEvent, 0);
  objc_storeStrong((id *)&self->_currentPrimaryResidentGenerationID, 0);
  objc_storeStrong((id *)&self->_currentPrimaryResident, 0);
  objc_storeStrong((id *)&self->_completionFuture, 0);
  objc_storeStrong((id *)&self->_initialDiscoveryAttemptCompletionFuture, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setSendAccountMessageTimer:(id)a3
{
}

- (HMFTimer)sendAccountMessageTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSendToNextDestinationTimer:(id)a3
{
}

- (HMFTimer)sendToNextDestinationTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 424, 1);
}

- (NSArray)candidateDestinations
{
  return (NSArray *)objc_getProperty(self, a2, 416, 1);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMDResidentDeviceManagerContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMDResidentDeviceManagerContext *)WeakRetained;
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 392, 1);
}

- (void)setInitialDiscoveryAttemptCompletionPromise:(id)a3
{
}

- (HMFPromise)initialDiscoveryAttemptCompletionPromise
{
  return (HMFPromise *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCandidateDestinationsEnumerator:(id)a3
{
}

- (NSEnumerator)candidateDestinationsEnumerator
{
  return (NSEnumerator *)objc_getProperty(self, a2, 376, 1);
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 368, 1);
}

- (HMDMessageDispatcher)messageDispatcher
{
  return (HMDMessageDispatcher *)objc_getProperty(self, a2, 360, 1);
}

- (HMDPrimaryResidentDiscoveryLogEvent)logEvent
{
  return (HMDPrimaryResidentDiscoveryLogEvent *)objc_getProperty(self, a2, 352, 1);
}

- (NSUUID)currentPrimaryResidentGenerationID
{
  return (NSUUID *)objc_getProperty(self, a2, 344, 1);
}

- (HMDResidentDevice)currentPrimaryResident
{
  return (HMDResidentDevice *)objc_getProperty(self, a2, 336, 1);
}

- (HMFFuture)completionFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 328, 1);
}

- (HMFFuture)initialDiscoveryAttemptCompletionFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 320, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)channel:(id)a3 didObservePrimaryResidentChange:(id)a4
{
  v5 = [(HMFOperation *)self underlyingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HMDPrimaryResidentDiscoveryOperation_channel_didObservePrimaryResidentChange___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __80__HMDPrimaryResidentDiscoveryOperation_channel_didObservePrimaryResidentChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkResidentStatusChannelForPrimary];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([(HMDPrimaryResidentDiscoveryOperation *)self isCancelled] & 1) == 0)
  {
    id v5 = [(HMDPrimaryResidentDiscoveryOperation *)self sendAccountMessageTimer];

    if (v5 == v4)
    {
      v7 = (void *)MEMORY[0x230FBD990]();
      v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v30 = v10;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Primary resident not found via StatusKit, falling back to PrimaryResidentDiscoveryMessage", buf, 0xCu);
      }
      v11 = [(HMDPrimaryResidentDiscoveryOperation *)v8 context];
      v12 = [v11 residentStatusChannel];
      v13 = [v12 presentResidentStatuses];
      uint64_t v14 = [v13 count];

      [(HMDPrimaryResidentDiscoveryLogEvent *)v8->_logEvent setResidentChannelActive:v14 != 0];
      if (v14)
      {
        [(HMDPrimaryResidentDiscoveryLogEvent *)v8->_logEvent setResidentChannelActiveNoPrimaryResolved:1];
        v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [(HMDPrimaryResidentDiscoveryLogEvent *)v8->_logEvent setResidentChannelActiveResolvePrimaryError:v15];
      }
      [(HMDPrimaryResidentDiscoveryOperation *)v8 residentStatusChannelCleanup];
      [(HMDPrimaryResidentDiscoveryOperation *)v8 sendIDSAccountMessage];
    }
    else
    {
      id v6 = [(HMDPrimaryResidentDiscoveryOperation *)self sendToNextDestinationTimer];

      if (v6 == v4)
      {
        v16 = [(HMDPrimaryResidentDiscoveryOperation *)self candidateDestinationsEnumerator];
        v17 = [v16 nextObject];

        if (v17)
        {
          v18 = (void *)MEMORY[0x230FBD990]();
          v19 = self;
          v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = HMFGetLogIdentifier();
            v22 = [v17 device];
            v23 = [v22 shortDescription];
            *(_DWORD *)buf = 138543618;
            v30 = v21;
            __int16 v31 = 2114;
            v32 = v23;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Attempting next candidate via Rapport: %{public}@", buf, 0x16u);
          }
          v24 = [HMDRemoteMessage alloc];
          v25 = [(HMDRemoteMessage *)v24 initWithName:@"primaryResidentDiscovery" qualityOfService:9 destination:v17 payload:MEMORY[0x263EFFA78] type:0 timeout:0 secure:15.0 restriction:8];
          v26 = [(HMDPrimaryResidentDiscoveryOperation *)v19 responseHandler];
          [(HMDRemoteMessage *)v25 setResponseHandler:v26];

          v27 = [(HMDPrimaryResidentDiscoveryOperation *)v19 messageDispatcher];
          [v27 sendMessage:v25];
        }
        else
        {
          v25 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
          [(HMMLogEvent *)self->_logEvent setError:v25];
        }
      }
      else
      {
        v28.receiver = self;
        v28.super_class = (Class)HMDPrimaryResidentDiscoveryOperation;
        [(HMFOperation *)&v28 timerDidFire:v4];
      }
    }
  }
}

- (void)residentStatusChannelCleanup
{
  v3 = [(HMDPrimaryResidentDiscoveryOperation *)self home];
  if (v3)
  {
    id v8 = v3;
    id v4 = [(HMDPrimaryResidentDiscoveryOperation *)self featuresDataSource];
    id v5 = [v8 uuid];
    if ([v4 isResidentSelectionEnabledForHomeUUID:v5])
    {
      int v6 = [v8 supportsResidentSelection];

      v3 = v8;
      if (!v6) {
        goto LABEL_6;
      }
      v7 = [(HMDPrimaryResidentDiscoveryOperation *)self context];
      id v4 = [v7 residentStatusChannel];

      [v4 removeObserver:self];
      id v5 = [v4 manager];
      [v5 removeClientWithIdentifier:@"primary.resident.discovery.operation"];
    }

    v3 = v8;
  }
LABEL_6:
}

- (void)cancelWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDPrimaryResidentDiscoveryOperation;
  [(HMFOperation *)&v6 cancelWithError:a3];
  id v4 = [(HMDPrimaryResidentDiscoveryOperation *)self sendToNextDestinationTimer];
  [v4 suspend];

  id v5 = [(HMDPrimaryResidentDiscoveryOperation *)self sendAccountMessageTimer];
  [v5 suspend];

  [(HMDPrimaryResidentDiscoveryOperation *)self residentStatusChannelCleanup];
}

- (void)finish
{
  v5.receiver = self;
  v5.super_class = (Class)HMDPrimaryResidentDiscoveryOperation;
  [(HMFOperation *)&v5 finish];
  v3 = [(HMDPrimaryResidentDiscoveryOperation *)self sendToNextDestinationTimer];
  [v3 suspend];

  id v4 = [(HMDPrimaryResidentDiscoveryOperation *)self sendAccountMessageTimer];
  [v4 suspend];
}

- (void)sendIDSAccountMessage
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v3 = [(HMDPrimaryResidentDiscoveryOperation *)self home];
  id v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 owner];
    objc_super v6 = [v5 account];
    v7 = [v6 handles];
    id v8 = [v7 firstObject];

    v9 = [HMDRemoteAccountMessageDestination alloc];
    v10 = [v4 uuid];
    v11 = [(HMDRemoteAccountMessageDestination *)v9 initWithTarget:v10 handle:v8 multicast:1];

    [(HMDRemoteAccountMessageDestination *)v11 setRestrictToResidentCapable:1];
    v12 = [HMDRemoteMessage alloc];
    v13 = [(HMDRemoteMessage *)v12 initWithName:@"primaryResidentDiscovery" qualityOfService:-1 destination:v11 payload:MEMORY[0x263EFFA78] type:0 timeout:0 secure:60.0];
    [(HMDPrimaryResidentDiscoveryLogEvent *)self->_logEvent setAccountMessageSent:1];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __61__HMDPrimaryResidentDiscoveryOperation_sendIDSAccountMessage__block_invoke;
    v29[3] = &unk_264A2F0C8;
    v29[4] = self;
    uint64_t v14 = (void *)MEMORY[0x230FBD990]([(HMDRemoteMessage *)v13 setResponseHandler:v29]);
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier();
      v18 = [(HMDPrimaryResidentDiscoveryOperation *)v15 candidateDestinations];
      *(_DWORD *)buf = 138543874;
      __int16 v31 = v17;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      __int16 v34 = 2114;
      v35 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Multicasting request to %@ and then %{public}@", buf, 0x20u);
    }
    v19 = [(HMDPrimaryResidentDiscoveryOperation *)v15 messageDispatcher];
    [v19 sendMessage:v13];

    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = v15;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Starting timer for next destination request", buf, 0xCu);
    }
    v24 = [(HMDPrimaryResidentDiscoveryOperation *)v21 sendToNextDestinationTimer];
    [v24 resume];
  }
  else
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      objc_super v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Home was removed during primary resident discovery operation", buf, 0xCu);
    }
    [(HMDPrimaryResidentDiscoveryOperation *)v26 cancel];
  }
}

void __61__HMDPrimaryResidentDiscoveryOperation_sendIDSAccountMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 352) setAccountMessageNoPrimaryResolved:1];
    [*(id *)(*(void *)(a1 + 32) + 352) setAccountMessageError:v5];
    id v8 = [*(id *)(a1 + 32) initialDiscoveryAttemptCompletionPromise];
    [v8 rejectWithError:v5];
  }
  else
  {
    id v8 = objc_msgSend(v6, "hmf_UUIDForKey:", @"uuid");
    if (v8)
    {
      v9 = [*(id *)(a1 + 32) initialDiscoveryAttemptCompletionPromise];
      [v9 fulfillWithNoValue];
    }
    else
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = *(id *)(a1 + 32);
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        int v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Primary resident UUID in the response is nil", (uint8_t *)&v16, 0xCu);
      }
      v9 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      [*(id *)(*(void *)(a1 + 32) + 352) setAccountMessageNoPrimaryResolved:1];
      [*(id *)(*(void *)(a1 + 32) + 352) setAccountMessageError:v9];
      uint64_t v14 = [*(id *)(a1 + 32) initialDiscoveryAttemptCompletionPromise];
      [v14 rejectWithError:v9];
    }
  }

  v15 = [*(id *)(a1 + 32) responseHandler];
  ((void (**)(void, id, void *))v15)[2](v15, v5, v7);
}

- (void)checkResidentStatusChannelForPrimary
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v3 = [(HMFOperation *)self underlyingQueue];
  dispatch_assert_queue_V2(v3);

  if (([(HMDPrimaryResidentDiscoveryOperation *)self isCancelled] & 1) == 0
    && ![(HMFOperation *)self isFinished])
  {
    id v4 = [(HMDPrimaryResidentDiscoveryOperation *)self home];
    if (v4)
    {
      id v5 = [(HMDPrimaryResidentDiscoveryOperation *)self context];
      id v6 = [v5 residentStatusChannel];

      v7 = [v6 currentPrimaryResident];
      if (v7)
      {
        id v8 = (void *)MEMORY[0x263EFFA08];
        v9 = [v4 enabledResidents];
        v10 = [v8 setWithArray:v9];
        id v11 = [v7 matchingDeviceFromResidentDevices:v10];
        currentPrimaryResident = self->_currentPrimaryResident;
        self->_currentPrimaryResident = v11;

        if (self->_currentPrimaryResident)
        {
          v13 = [v6 currentPrimaryResident];
          uint64_t v14 = [v13 generationID];
          currentPrimaryResidentGenerationID = self->_currentPrimaryResidentGenerationID;
          self->_currentPrimaryResidentGenerationID = v14;

          int v16 = (void *)MEMORY[0x230FBD990]([(HMDPrimaryResidentDiscoveryLogEvent *)self->_logEvent setResidentChannelActive:1]);
          v17 = self;
          uint64_t v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = HMFGetLogIdentifier();
            v20 = [v7 idsIdentifier];
            v21 = self->_currentPrimaryResidentGenerationID;
            int v32 = 138543874;
            uint64_t v33 = v19;
            __int16 v34 = 2114;
            v35 = v20;
            __int16 v36 = 2112;
            v37 = v21;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident located via StatusKit: %{public}@ - generation ID: %@", (uint8_t *)&v32, 0x20u);
          }
          v22 = [(HMDPrimaryResidentDiscoveryOperation *)v17 initialDiscoveryAttemptCompletionPromise];
          [v22 fulfillWithNoValue];

          [(HMDPrimaryResidentDiscoveryOperation *)v17 residentStatusChannelCleanup];
          [(HMDPrimaryResidentDiscoveryOperation *)v17 finish];
        }
        else
        {
          v27 = (void *)MEMORY[0x230FBD990]();
          objc_super v28 = self;
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = HMFGetLogIdentifier();
            __int16 v31 = [v4 enabledResidents];
            int v32 = 138543874;
            uint64_t v33 = v30;
            __int16 v34 = 2112;
            v35 = v7;
            __int16 v36 = 2112;
            v37 = v31;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Primary resident indicated by StatusKit: %@ not found, enabled residents: %@", (uint8_t *)&v32, 0x20u);
          }
        }
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = self;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        int v32 = 138543362;
        uint64_t v33 = v26;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Home was removed during primary resident discovery operation", (uint8_t *)&v32, 0xCu);
      }
    }
  }
}

- (void)main
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (([(HMDPrimaryResidentDiscoveryOperation *)self isCancelled] & 1) == 0)
  {
    v3 = [(HMDPrimaryResidentDiscoveryOperation *)self home];
    id v4 = v3;
    if (!v3)
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v36 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Home was nil during primary resident discovery operation", buf, 0xCu);
      }
      [(HMDPrimaryResidentDiscoveryOperation *)v22 cancel];
      goto LABEL_26;
    }
    id v5 = [v3 owner];
    id v6 = [v5 account];
    v7 = [v6 handles];
    id v8 = [v7 firstObject];

    if (!v8)
    {
      v25 = (void *)MEMORY[0x230FBD990]();
      v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_super v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v36 = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find any account handles for home owner during primary resident discovery operation", buf, 0xCu);
      }
      [(HMDPrimaryResidentDiscoveryOperation *)v26 cancel];
      goto LABEL_25;
    }
    if (![v4 isOwnerUser] || (objc_msgSend(v4, "hasAnyResident") & 1) != 0)
    {
      v9 = [(HMDPrimaryResidentDiscoveryOperation *)self featuresDataSource];
      v10 = [v4 uuid];
      if ([v9 isResidentSelectionEnabledForHomeUUID:v10])
      {
        int v11 = [v4 supportsResidentSelection];

        if (v11)
        {
          v12 = [(HMDPrimaryResidentDiscoveryOperation *)self context];
          v13 = [v12 residentStatusChannel];

          if (!v13)
          {
            uint64_t v14 = (void *)MEMORY[0x230FBD990]();
            v15 = self;
            int v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v17 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              __int16 v36 = v17;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Resident Status Channel is nil", buf, 0xCu);
            }
          }
          [v13 addObserver:self];
          uint64_t v18 = [v13 manager];
          [v18 addClientWithIdentifier:@"primary.resident.discovery.operation"];

          v19 = [(HMFOperation *)self underlyingQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __44__HMDPrimaryResidentDiscoveryOperation_main__block_invoke;
          block[3] = &unk_264A2F7F8;
          block[4] = self;
          dispatch_async(v19, block);

          v20 = [(HMDPrimaryResidentDiscoveryOperation *)self sendAccountMessageTimer];
          [v20 resume];

LABEL_24:
          goto LABEL_25;
        }
      }
      else
      {
      }
      [(HMDPrimaryResidentDiscoveryOperation *)self sendIDSAccountMessage];
LABEL_25:

LABEL_26:
      return;
    }
    v29 = (void *)MEMORY[0x230FBD990]();
    v30 = self;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      int v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v32;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Home has 0 residents, not attempting to discover primary", buf, 0xCu);
    }
    v13 = [MEMORY[0x263F087E8] hmErrorWithCode:91];
    uint64_t v33 = [(HMDPrimaryResidentDiscoveryOperation *)v30 initialDiscoveryAttemptCompletionPromise];
    [v33 rejectWithError:v13];

    [(HMDPrimaryResidentDiscoveryOperation *)v30 cancelWithError:v13];
    goto LABEL_24;
  }
}

uint64_t __44__HMDPrimaryResidentDiscoveryOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkResidentStatusChannelForPrimary];
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)HMDPrimaryResidentDiscoveryOperation;
  [(HMFOperation *)&v2 cancel];
}

- (void)run
{
  id v4 = [MEMORY[0x263F42628] defaultScheduler];
  id v3 = (id)[v4 performOperation:self];
}

- (HMDPrimaryResidentDiscoveryOperation)initWithHome:(id)a3 messageDispatcher:(id)a4 featuresDataSource:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v42 = a4;
  id v11 = a5;
  id v12 = a6;
  v50.receiver = self;
  v50.super_class = (Class)HMDPrimaryResidentDiscoveryOperation;
  v13 = [(HMFOperation *)&v50 initWithTimeout:120.0];
  objc_storeWeak((id *)&v13->_home, v10);
  uint64_t v14 = [v10 uuid];
  uint64_t v15 = [v14 UUIDString];
  logIdentifier = v13->_logIdentifier;
  v13->_logIdentifier = (NSString *)v15;

  objc_storeStrong((id *)&v13->_messageDispatcher, a4);
  objc_storeStrong((id *)&v13->_featuresDataSource, a5);
  objc_storeWeak((id *)&v13->_context, v12);
  uint64_t v17 = [MEMORY[0x263F42538] futureForOperation:v13];
  completionFuture = v13->_completionFuture;
  v13->_completionFuture = (HMFFuture *)v17;

  uint64_t v19 = [MEMORY[0x263F42538] futureWithPromise:&v13->_initialDiscoveryAttemptCompletionPromise];
  initialDiscoveryAttemptCompletionFuture = v13->_initialDiscoveryAttemptCompletionFuture;
  v13->_initialDiscoveryAttemptCompletionFuture = (HMFFuture *)v19;

  uint64_t v21 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:2 options:60.0];
  sendAccountMessageTimer = v13->_sendAccountMessageTimer;
  v13->_sendAccountMessageTimer = (HMFTimer *)v21;

  [(HMFTimer *)v13->_sendAccountMessageTimer setDelegate:v13];
  v23 = [(HMFOperation *)v13 underlyingQueue];
  [(HMFTimer *)v13->_sendAccountMessageTimer setDelegateQueue:v23];

  uint64_t v24 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:6 options:1.0];
  sendToNextDestinationTimer = v13->_sendToNextDestinationTimer;
  v13->_sendToNextDestinationTimer = (HMFTimer *)v24;

  [(HMFTimer *)v13->_sendToNextDestinationTimer setDelegate:v13];
  v26 = [(HMFOperation *)v13 underlyingQueue];
  [(HMFTimer *)v13->_sendToNextDestinationTimer setDelegateQueue:v26];

  v27 = [HMDPrimaryResidentDiscoveryLogEvent alloc];
  objc_super v28 = [v10 uuid];
  uint64_t v29 = [(HMDPrimaryResidentDiscoveryLogEvent *)v27 initWithHomeUUID:v28];
  logEvent = v13->_logEvent;
  v13->_logEvent = (HMDPrimaryResidentDiscoveryLogEvent *)v29;

  objc_initWeak(&location, v13);
  objc_initWeak(&from, v10);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke;
  aBlock[3] = &unk_264A1CB80;
  objc_copyWeak(&v46, &location);
  objc_copyWeak(&v47, &from);
  __int16 v31 = _Block_copy(aBlock);
  id responseHandler = v13->_responseHandler;
  v13->_id responseHandler = v31;

  uint64_t v33 = [v10 uuid];
  __int16 v34 = [v10 enabledResidents];
  v35 = [v34 sortedArrayUsingComparator:&__block_literal_global_78061];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke_2;
  v43[3] = &unk_264A1CBC8;
  id v36 = v33;
  id v44 = v36;
  uint64_t v37 = objc_msgSend(v35, "na_map:", v43);
  candidateDestinations = v13->_candidateDestinations;
  v13->_candidateDestinations = (NSArray *)v37;

  uint64_t v39 = [(NSArray *)v13->_candidateDestinations objectEnumerator];
  candidateDestinationsEnumerator = v13->_candidateDestinationsEnumerator;
  v13->_candidateDestinationsEnumerator = (NSEnumerator *)v39;

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v13;
}

void __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v8 && ([WeakRetained isCancelled] & 1) == 0)
    {
      v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"uuid");
      if (v9)
      {
        id v10 = [v8 enabledResidents];
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke_12;
        v43[3] = &unk_264A2A830;
        id v11 = v9;
        id v44 = v11;
        uint64_t v12 = objc_msgSend(v10, "na_firstObjectPassingTest:", v43);
        v13 = (void *)WeakRetained[42];
        WeakRetained[42] = v12;

        if (!WeakRetained[42])
        {
          uint64_t v14 = objc_msgSend(v6, "hmf_stringForKey:", @"kIDSMessageSourceIDKey");
          uint64_t v15 = +[HMDDeviceHandle deviceHandleForDestination:v14];
          int v16 = +[HMDAccountRegistry sharedRegistry];
          id v42 = (void *)v15;
          uint64_t v17 = [v16 deviceForHandle:v15];

          v41 = (void *)v17;
          uint64_t v18 = [[HMDResidentDevice alloc] initWithDevice:v17 home:v8];
          uint64_t v19 = (void *)WeakRetained[42];
          WeakRetained[42] = v18;

          context = (void *)MEMORY[0x230FBD990]();
          v20 = WeakRetained;
          uint64_t v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v39 = v14;
            v23 = id v22 = v11;
            uint64_t v24 = (void *)WeakRetained[42];
            *(_DWORD *)buf = 138543618;
            uint64_t v46 = (uint64_t)v23;
            __int16 v47 = 2112;
            id v48 = v24;
            _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Creating new primary resident %@ because the one that responded was unknown", buf, 0x16u);

            id v11 = v22;
            uint64_t v14 = v39;
          }
        }
        uint64_t v25 = objc_msgSend(v6, "hmf_UUIDForKey:", @"gen");
        v26 = (void *)WeakRetained[43];
        WeakRetained[43] = v25;

        v27 = (void *)MEMORY[0x230FBD990]();
        objc_super v28 = WeakRetained;
        uint64_t v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = HMFGetLogIdentifier();
          id v31 = v11;
          int v32 = (void *)v30;
          uint64_t v33 = WeakRetained[43];
          *(_DWORD *)buf = 138543874;
          uint64_t v46 = v30;
          __int16 v47 = 2114;
          id v48 = v31;
          __int16 v49 = 2112;
          uint64_t v50 = v33;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident located: %{public}@ - generation ID: %@", buf, 0x20u);
        }
        [v28 finish];
        __int16 v34 = v44;
      }
      else
      {
        v35 = (void *)MEMORY[0x230FBD990]();
        id v36 = WeakRetained;
        uint64_t v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = (uint64_t)v38;
          __int16 v47 = 2112;
          id v48 = v5;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Received invalid/error response, forcing next destination: %@", buf, 0x16u);
        }
        __int16 v34 = [v36 sendToNextDestinationTimer];
        [v34 fire];
      }
    }
  }
}

HMDRemoteDeviceMessageDestination *__98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isCurrentDevice])
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [HMDRemoteDeviceMessageDestination alloc];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = [v3 device];
    id v4 = [(HMDRemoteDeviceMessageDestination *)v5 initWithTarget:v6 device:v7];
  }
  return v4;
}

uint64_t __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isReachable];
  int v7 = [v5 isReachable];

  if (v6 == v7)
  {
    uint64_t v8 = 0;
  }
  else if ([v4 isReachable])
  {
    uint64_t v8 = -1;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t __98__HMDPrimaryResidentDiscoveryOperation_initWithHome_messageDispatcher_featuresDataSource_context___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1) {
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_40_78076);
  }
  objc_super v2 = (void *)logCategory__hmf_once_v17;
  return v2;
}

void __51__HMDPrimaryResidentDiscoveryOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v17;
  logCategory__hmf_once_uint64_t v17 = v0;
}

@end