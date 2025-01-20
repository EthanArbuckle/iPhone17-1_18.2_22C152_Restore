@interface HMDSoftwareUpdateEventProvider
+ (id)logCategory;
- (HMDSoftwareUpdateEventProvider)initWithContext:(id)a3 scanOptionsFactory:(id)a4 timerFactory:(id)a5;
- (HMDSoftwareUpdateEventProviderContext)context;
- (HMFTimer)progressDebounceTimer;
- (HMSoftwareUpdateDescriptor)lastSentSoftwareUpdateDescriptor;
- (HMSoftwareUpdateProgress)lastSentSoftwareUpdateProgress;
- (HMSoftwareUpdateProgressEvent)debouncedProgressEvent;
- (NSMutableArray)scanFutures;
- (id)descriptorFromControllerStatus:(id)a3 controllerDescriptor:(id)a4 errorCode:(id)a5;
- (id)scanOptionsFactory;
- (void)forwardDebouncedProgressEvent;
- (void)forwardDescriptorEventWithErrorCode:(id)a3;
- (void)forwardProgressEventWithProgress:(id)a3;
- (void)manager:(id)a3 didChangeProgressOnDownload:(id)a4;
- (void)manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5;
- (void)manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5;
- (void)manager:(id)a3 didFinishDownload:(id)a4;
- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6;
- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6 denialReasons:(id)a7;
- (void)manager:(id)a3 didFinishInstallation:(id)a4;
- (void)manager:(id)a3 scanRequestDidLocateUpdate:(id)a4 error:(id)a5;
- (void)manager:(id)a3 scanRequestPostponed:(id)a4 error:(id)a5;
- (void)respondToScanFuturesWithError:(id)a3;
- (void)scanWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)setDebouncedProgressEvent:(id)a3;
- (void)setLastSentSoftwareUpdateDescriptor:(id)a3;
- (void)setProgressDebounceTimer:(id)a3;
- (void)setScanFutures:(id)a3;
- (void)setScanOptionsFactory:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDSoftwareUpdateEventProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debouncedProgressEvent, 0);
  objc_storeStrong((id *)&self->_progressDebounceTimer, 0);
  objc_storeStrong(&self->_scanOptionsFactory, 0);
  objc_storeStrong((id *)&self->_scanFutures, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lastSentSoftwareUpdateProgress, 0);
  objc_storeStrong((id *)&self->_lastSentSoftwareUpdateDescriptor, 0);
}

- (void)setDebouncedProgressEvent:(id)a3
{
}

- (HMSoftwareUpdateProgressEvent)debouncedProgressEvent
{
  return (HMSoftwareUpdateProgressEvent *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProgressDebounceTimer:(id)a3
{
}

- (HMFTimer)progressDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScanOptionsFactory:(id)a3
{
}

- (id)scanOptionsFactory
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setScanFutures:(id)a3
{
}

- (NSMutableArray)scanFutures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (HMDSoftwareUpdateEventProviderContext)context
{
  return (HMDSoftwareUpdateEventProviderContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSoftwareUpdateEventProvider *)self progressDebounceTimer];

  if (v5 == v4)
  {
    [(HMDSoftwareUpdateEventProvider *)self forwardDebouncedProgressEvent];
  }
}

- (void)manager:(id)a3 didFinishInstallation:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFinishInstallation", (uint8_t *)&v12, 0xCu);
  }
  [(HMDSoftwareUpdateEventProvider *)v9 forwardDescriptorEventWithErrorCode:0];
}

- (void)manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  int v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v16 = 138543362;
    v17 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFailInstallation", (uint8_t *)&v16, 0xCu);
  }
  if (v10)
  {
    v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
  }
  else
  {
    v15 = 0;
  }
  [(HMDSoftwareUpdateEventProvider *)v12 forwardDescriptorEventWithErrorCode:v15];
}

- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6 denialReasons:(id)a7
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  v13 = (void *)MEMORY[0x230FBD990]();
  uint64_t v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v16 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v16;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFinishDownload", (uint8_t *)&v17, 0xCu);
  }
  [(HMDSoftwareUpdateEventProvider *)v14 forwardDescriptorEventWithErrorCode:0];
}

- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = HMFGetLogIdentifier();
    int v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFinishDownload", (uint8_t *)&v14, 0xCu);
  }
  [(HMDSoftwareUpdateEventProvider *)v11 forwardDescriptorEventWithErrorCode:0];
}

- (void)manager:(id)a3 didFinishDownload:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFinishDownload", (uint8_t *)&v12, 0xCu);
  }
  [(HMDSoftwareUpdateEventProvider *)v9 forwardDescriptorEventWithErrorCode:0];
}

- (void)manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  int v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v16 = 138543362;
    int v17 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFailDownload", (uint8_t *)&v16, 0xCu);
  }
  if (v10)
  {
    v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
  }
  else
  {
    v15 = 0;
  }
  [(HMDSoftwareUpdateEventProvider *)v12 forwardDescriptorEventWithErrorCode:v15];
}

- (void)manager:(id)a3 didChangeProgressOnDownload:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didChangeProgressOnDownload", (uint8_t *)&v13, 0xCu);
  }
  int v12 = [v7 progress];
  [(HMDSoftwareUpdateEventProvider *)v9 forwardProgressEventWithProgress:v12];
}

- (void)manager:(id)a3 scanRequestPostponed:(id)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  int v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    int v17 = v14;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager scanRequestPostponed with error: %@", (uint8_t *)&v16, 0x16u);
  }
  if (v10)
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
  }
  else
  {
    uint64_t v15 = 0;
  }
  [(HMDSoftwareUpdateEventProvider *)v12 forwardDescriptorEventWithErrorCode:v15];
  [(HMDSoftwareUpdateEventProvider *)v12 respondToScanFuturesWithError:v10];
}

- (void)manager:(id)a3 scanRequestDidLocateUpdate:(id)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  int v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    int v17 = v14;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager scanRequestDidLocateUpdate with error: %@", (uint8_t *)&v16, 0x16u);
  }
  if (v10)
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
  }
  else
  {
    uint64_t v15 = 0;
  }
  [(HMDSoftwareUpdateEventProvider *)v12 forwardDescriptorEventWithErrorCode:v15];
  [(HMDSoftwareUpdateEventProvider *)v12 respondToScanFuturesWithError:v10];
}

- (void)respondToScanFuturesWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSoftwareUpdateEventProvider *)self context];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__HMDSoftwareUpdateEventProvider_respondToScanFuturesWithError___block_invoke;
  v8[3] = &unk_264A2F820;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __64__HMDSoftwareUpdateEventProvider_respondToScanFuturesWithError___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    v2 = (void *)MEMORY[0x263EFFA80];
  }
  else {
    v2 = (void *)MEMORY[0x263EFFA88];
  }
  id v3 = v2;
  id v4 = [*(id *)(a1 + 40) scanFutures];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __64__HMDSoftwareUpdateEventProvider_respondToScanFuturesWithError___block_invoke_2;
  id v10 = &unk_264A146B0;
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", &v7);

  id v6 = objc_msgSend(MEMORY[0x263EFF980], "array", v7, v8, v9, v10, v11);
  [*(id *)(a1 + 40) setScanFutures:v6];
}

void __64__HMDSoftwareUpdateEventProvider_respondToScanFuturesWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    [*(id *)(a1 + 40) BOOLValue];
    uint64_t v8 = HMFBooleanToString();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Responding to scan futures with didFindUpdate: %@", (uint8_t *)&v9, 0x16u);
  }
  [v3 finishWithResult:*(void *)(a1 + 40)];
}

- (void)forwardDebouncedProgressEvent
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDSoftwareUpdateEventProvider *)self debouncedProgressEvent];
  [(HMDSoftwareUpdateEventProvider *)self setDebouncedProgressEvent:0];
  id v5 = [(HMDSoftwareUpdateEventProvider *)self progressDebounceTimer];
  int v6 = [v5 isRunning];

  if (v6)
  {
    uint64_t v7 = [(HMDSoftwareUpdateEventProvider *)self progressDebounceTimer];
    [v7 suspend];
  }
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      __int16 v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Forwarding progress event", (uint8_t *)&v13, 0xCu);
    }
    id v12 = [(HMDSoftwareUpdateEventProvider *)v9 context];
    [v12 forwardEvent:v4 withTopicSuffixID:*MEMORY[0x263F0B320]];
  }
}

- (void)forwardProgressEventWithProgress:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  int v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v31 = 138543362;
    v32 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Debouncing progress event", (uint8_t *)&v31, 0xCu);
  }
  if (!v4)
  {
    int v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = v6;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Progress is nil. Refreshing software update descriptor.", (uint8_t *)&v31, 0xCu);
    }
    [(HMDSoftwareUpdateEventProvider *)v10 forwardDescriptorEventWithErrorCode:0];
  }
  int v13 = +[HMDSULocalUtilities progressFromControllerProgress:v4];
  if (v13)
  {
    uint64_t v14 = [(HMDSoftwareUpdateEventProvider *)v6 context];
    uint64_t v15 = [v14 eventSource];

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x263F0E800]);
      int v17 = [(HMDSoftwareUpdateEventProvider *)v6 context];
      [v17 eventTimeStamp];
      __int16 v18 = objc_msgSend(v16, "initWithProgress:eventSource:eventTimestamp:", v13, v15);

      p_lock = &v6->_lock;
      os_unfair_lock_lock_with_options();
      [(HMDSoftwareUpdateEventProvider *)v6 setDebouncedProgressEvent:v18];
      objc_storeStrong((id *)&v6->_lastSentSoftwareUpdateProgress, v13);
      uint64_t v20 = [(HMDSoftwareUpdateEventProvider *)v6 progressDebounceTimer];
      char v21 = [v20 isRunning];

      if ((v21 & 1) == 0)
      {
        v22 = [(HMDSoftwareUpdateEventProvider *)v6 progressDebounceTimer];
        [v22 resume];
      }
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v27 = (void *)MEMORY[0x230FBD990]();
      v28 = v6;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        int v31 = 138543362;
        v32 = v30;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Event source was nil", (uint8_t *)&v31, 0xCu);
      }
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    v24 = v6;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HMSoftwareUpdateProgress", (uint8_t *)&v31, 0xCu);
    }
  }
}

- (id)descriptorFromControllerStatus:(id)a3 controllerDescriptor:(id)a4 errorCode:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[HMDSULocalUtilities descriptorFromControllerStatus:v8 controllerDescriptor:v9 errorCode:v10];
  id v12 = v11;
  if (!v9)
  {
    int v13 = [(HMDSoftwareUpdateEventProvider *)self context];
    uint64_t v14 = [v13 lastEventForTopicSuffixID:*MEMORY[0x263F0B318]];

    if (v14)
    {
      uint64_t v15 = [MEMORY[0x263F0E7D8] descriptorFromEvent:v14];
      if (v15)
      {
        id v12 = v15;

        id v16 = (void *)MEMORY[0x230FBD990](objc_msgSend(v12, "setStatus:", objc_msgSend(v11, "status")));
        int v17 = self;
        __int16 v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = HMFGetLogIdentifier();
          int v29 = 138543618;
          v30 = v19;
          __int16 v31 = 2112;
          id v32 = v12;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Forwarding previous descriptor: %@", (uint8_t *)&v29, 0x16u);
        }

LABEL_13:
        goto LABEL_14;
      }
      uint64_t v20 = (void *)MEMORY[0x230FBD990]();
      char v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        int v29 = 138543618;
        v30 = v23;
        __int16 v31 = 2112;
        id v32 = v14;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse descriptor from previous event: %@", (uint8_t *)&v29, 0x16u);
      }
    }
    v24 = (void *)MEMORY[0x230FBD990]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Current and previous descriptor are both nil", (uint8_t *)&v29, 0xCu);
    }
    id v12 = v11;
    goto LABEL_13;
  }
LABEL_14:

  return v12;
}

- (void)forwardDescriptorEventWithErrorCode:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  int v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Forwarding descriptor event", buf, 0xCu);
  }
  id v9 = [(HMDSoftwareUpdateEventProvider *)v6 context];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__HMDSoftwareUpdateEventProvider_forwardDescriptorEventWithErrorCode___block_invoke;
  v11[3] = &unk_264A14688;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  [v9 managerStatus:v11];
}

void __70__HMDSoftwareUpdateEventProvider_forwardDescriptorEventWithErrorCode___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = HMFGetLogIdentifier();
    int v32 = 138544130;
    uint64_t v33 = v13;
    __int16 v34 = 2112;
    id v35 = v7;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Controller status:\n%@\n\nController descriptor:\n%@\nerror: %@", (uint8_t *)&v32, 0x2Au);
  }
  if (v9)
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_17;
    }
    int v17 = HMFGetLogIdentifier();
    int v32 = 138543618;
    uint64_t v33 = v17;
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v18 = "%{public}@Failed to fetch manager status with error: %@";
    id v19 = v16;
    uint32_t v20 = 22;
LABEL_6:
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v32, v20);

    goto LABEL_7;
  }
  if (!v7)
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v17 = HMFGetLogIdentifier();
    int v32 = 138543362;
    uint64_t v33 = v17;
    __int16 v18 = "%{public}@Controller status was nil";
    id v19 = v16;
    uint32_t v20 = 12;
    goto LABEL_6;
  }
  char v21 = [*(id *)(a1 + 32) descriptorFromControllerStatus:v7 controllerDescriptor:v8 errorCode:*(void *)(a1 + 40)];
  v22 = [*(id *)(a1 + 32) context];
  v23 = [v22 eventSource];

  if (v23)
  {
    id v24 = objc_alloc(MEMORY[0x263F0E7E0]);
    v25 = [*(id *)(a1 + 32) context];
    [v25 eventTimeStamp];
    v26 = objc_msgSend(v24, "initWithDescriptor:eventSource:eventTimestamp:", v21, v23);

    [*(id *)(a1 + 32) forwardDebouncedProgressEvent];
    [*(id *)(a1 + 32) setLastSentSoftwareUpdateDescriptor:v21];
    v27 = [*(id *)(a1 + 32) context];
    [v27 forwardEvent:v26 withTopicSuffixID:*MEMORY[0x263F0B318]];
  }
  else
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = *(id *)(a1 + 32);
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      int v32 = 138543362;
      uint64_t v33 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Event source was nil", (uint8_t *)&v32, 0xCu);
    }
  }

LABEL_17:
}

- (HMSoftwareUpdateProgress)lastSentSoftwareUpdateProgress
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_lastSentSoftwareUpdateProgress;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLastSentSoftwareUpdateDescriptor:(id)a3
{
  id v4 = (HMSoftwareUpdateDescriptor *)a3;
  os_unfair_lock_lock_with_options();
  lastSentSoftwareUpdateDescriptor = self->_lastSentSoftwareUpdateDescriptor;
  self->_lastSentSoftwareUpdateDescriptor = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMSoftwareUpdateDescriptor)lastSentSoftwareUpdateDescriptor
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_lastSentSoftwareUpdateDescriptor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)scanWithOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    __int16 v27 = 2048;
    unint64_t v28 = a3;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Scanning with options: %lu", buf, 0x16u);
  }
  id v11 = [(HMDSoftwareUpdateEventProvider *)v8 scanOptionsFactory];
  id v12 = v11[2](v11, a3);

  id v13 = objc_alloc_init(MEMORY[0x263F58190]);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __61__HMDSoftwareUpdateEventProvider_scanWithOptions_completion___block_invoke;
  v23[3] = &unk_264A14660;
  id v24 = v6;
  id v14 = v6;
  id v15 = (id)[v13 addCompletionBlock:v23];
  id v16 = [(HMDSoftwareUpdateEventProvider *)v8 context];
  int v17 = [v16 workQueue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61__HMDSoftwareUpdateEventProvider_scanWithOptions_completion___block_invoke_2;
  v20[3] = &unk_264A2F2F8;
  v20[4] = v8;
  id v21 = v13;
  id v22 = v12;
  id v18 = v12;
  id v19 = v13;
  dispatch_async(v17, v20);
}

uint64_t __61__HMDSoftwareUpdateEventProvider_scanWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 BOOLValue];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

void __61__HMDSoftwareUpdateEventProvider_scanWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) scanFutures];
  [v2 addObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) context];
  [v3 scanWithOptions:*(void *)(a1 + 48)];
}

- (HMDSoftwareUpdateEventProvider)initWithContext:(id)a3 scanOptionsFactory:(id)a4 timerFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t, double))a5;
  v24.receiver = self;
  v24.super_class = (Class)HMDSoftwareUpdateEventProvider;
  id v12 = [(HMDSoftwareUpdateEventProvider *)&v24 init];
  id v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_context, a3);
    id v14 = _Block_copy(v10);
    id scanOptionsFactory = v13->_scanOptionsFactory;
    v13->_id scanOptionsFactory = v14;

    uint64_t v16 = [MEMORY[0x263EFF980] array];
    scanFutures = v13->_scanFutures;
    v13->_scanFutures = (NSMutableArray *)v16;

    [(HMDSoftwareUpdateEventProviderContext *)v13->_context configureWithDelegate:v13];
    [(HMDSoftwareUpdateEventProvider *)v13 forwardDescriptorEventWithErrorCode:0];
    id v18 = v11[2](v11, 8, 5.0);
    [(HMDSoftwareUpdateEventProvider *)v13 setProgressDebounceTimer:v18];

    id v19 = [(HMDSoftwareUpdateEventProvider *)v13 progressDebounceTimer];
    [v19 setDelegate:v13];

    uint32_t v20 = [(HMDSoftwareUpdateEventProvider *)v13 context];
    id v21 = [v20 workQueue];
    id v22 = [(HMDSoftwareUpdateEventProvider *)v13 progressDebounceTimer];
    [v22 setDelegateQueue:v21];
  }
  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29 != -1) {
    dispatch_once(&logCategory__hmf_once_t29, &__block_literal_global);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v30;
  return v2;
}

void __45__HMDSoftwareUpdateEventProvider_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v30;
  logCategory__hmf_once_v30 = v0;
}

@end