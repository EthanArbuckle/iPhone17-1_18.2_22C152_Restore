@interface HMDDiagnosticReporterLogObserver
+ (BOOL)isSupportedEvent:(id)a3;
+ (id)domainForEvent:(id)a3;
+ (id)logCategory;
+ (id)subTypeForEvent:(id)a3;
+ (id)supportedEventClasses;
+ (id)typeForEvent:(id)a3;
- (BOOL)shouldSubmitEvent:(id)a3;
- (HMDDiagnosticReporterLogObserver)initWithLogEventDispatcher:(id)a3;
- (HMMLogEventDispatching)logEventDispatcher;
- (OS_dispatch_queue)clientQueue;
- (SDRDiagnosticReporter)reporter;
- (unint64_t)memoryExceptionThreshold;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDDiagnosticReporterLogObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_logEventDispatcher);
}

- (SDRDiagnosticReporter)reporter
{
  return (SDRDiagnosticReporter *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (unint64_t)memoryExceptionThreshold
{
  return self->_memoryExceptionThreshold;
}

- (HMMLogEventDispatching)logEventDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventDispatcher);
  return (HMMLogEventDispatching *)WeakRetained;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isSupportedEvent:v4])
  {
    v5 = [(HMDDiagnosticReporterLogObserver *)self clientQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __66__HMDDiagnosticReporterLogObserver_didReceiveEventFromDispatcher___block_invoke;
    v6[3] = &unk_264A2F820;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __66__HMDDiagnosticReporterLogObserver_didReceiveEventFromDispatcher___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) shouldSubmitEvent:*(void *)(a1 + 40)])
  {
    v2 = [MEMORY[0x263F42618] processInfo];
    v3 = [*(id *)(a1 + 32) reporter];
    id v4 = [(id)objc_opt_class() domainForEvent:*(void *)(a1 + 40)];
    v5 = [(id)objc_opt_class() typeForEvent:*(void *)(a1 + 40)];
    v6 = [(id)objc_opt_class() subTypeForEvent:*(void *)(a1 + 40)];
    id v7 = [v2 name];
    v8 = [v3 signatureWithDomain:v4 type:v5 subType:v6 detectedProcess:v7 triggerThresholdValues:0];

    v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "identifier"));
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F7C178]];

    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 objectForInfoDictionaryKey:*MEMORY[0x263EFFB70]];

    if (v11) {
      [v8 setObject:v11 forKeyedSubscript:@"projectver"];
    }
    if ([*(id *)(a1 + 40) conformsToProtocol:&unk_26E4C91A0])
    {
      id v12 = *(id *)(a1 + 40);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      id v14 = v13;

      [v14 updateDiagnosticReportSignature:v8];
    }
    v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v39 = v18;
      __int16 v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Submitting event: %@", buf, 0x16u);
    }
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v23;
      __int16 v40 = 2112;
      v41 = v8;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Submitting signature: %@", buf, 0x16u);
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    v24 = [*(id *)(a1 + 32) reporter];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __66__HMDDiagnosticReporterLogObserver_didReceiveEventFromDispatcher___block_invoke_92;
    v35[3] = &unk_264A2F228;
    objc_copyWeak(&v36, &location);
    char v25 = [v24 snapshotWithSignature:v8 duration:0 event:0 payload:v35 reply:15.0];

    if ((v25 & 1) == 0)
    {
      v30 = (void *)MEMORY[0x230FBD990](v26, v27, v28, v29);
      id v31 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = HMFGetLogIdentifier();
        v34 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v39 = v33;
        __int16 v40 = 2112;
        v41 = v34;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to submit event: %@", buf, 0x16u);
      }
    }
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
}

void __66__HMDDiagnosticReporterLogObserver_didReceiveEventFromDispatcher___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Submitted event with response: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)stop
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMDDiagnosticReporterLogObserver *)v4 logEventDispatcher];
  [v7 removeObserver:v4];
}

- (void)start
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(HMDDiagnosticReporterLogObserver *)v4 logEventDispatcher];
  int v8 = [(id)objc_opt_class() supportedEventClasses];
  [v7 addObserver:v4 forEventClasses:v8];
}

- (HMDDiagnosticReporterLogObserver)initWithLogEventDispatcher:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDDiagnosticReporterLogObserver;
  v5 = [(HMDDiagnosticReporterLogObserver *)&v18 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_logEventDispatcher, v4);
    id v7 = [MEMORY[0x263F42608] sharedPreferences];
    int v8 = [v7 preferenceForKey:@"memoryTriggerSize"];
    int v9 = [v8 numberValue];
    v6->_memoryExceptionThreshold = [v9 unsignedIntegerValue];

    HMDispatchQueueNameString();
    id v10 = objc_claimAutoreleasedReturnValue();
    uint64_t v11 = (const char *)[v10 UTF8String];
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x263F7C080]) initWithQueue:v6->_clientQueue];
    reporter = v6->_reporter;
    v6->_reporter = (SDRDiagnosticReporter *)v15;
  }
  return v6;
}

- (BOOL)shouldSubmitEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  BOOL v13 = 1;
  if (v6)
  {
    unint64_t v8 = [v6 currentMemoryUsage];
    if (v8 < [(HMDDiagnosticReporterLogObserver *)self memoryExceptionThreshold]
      || ([MEMORY[0x263EFFA40] standardUserDefaults],
          int v9 = objc_claimAutoreleasedReturnValue(),
          [v9 doubleForKey:@"HMDDiagnosticReporterMemoryEventReportTime"],
          double v11 = v10,
          v9,
          [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate],
          v12 - v11 < 86400.0))
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_270512 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_270512, &__block_literal_global_95_270513);
  }
  v2 = (void *)logCategory__hmf_once_v9_270514;
  return v2;
}

void __47__HMDDiagnosticReporterLogObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v9_270514;
  logCategory__hmf_once_v9_270514 = v0;
}

+ (id)subTypeForEvent:(id)a3
{
  id v3 = a3;
  if (![v3 conformsToProtocol:&unk_26E4C91A0]
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v3 diagnosticReportEventSubType], (id v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v4 = @"Assertion";
    }
    else if (v5 == objc_opt_class())
    {
      id v4 = @"Messaging";
    }
    else if (v5 == objc_opt_class())
    {
      MREExceptionTypeToString();
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = @"Unknown";
    }
  }

  return v4;
}

+ (id)typeForEvent:(id)a3
{
  id v3 = a3;
  if (![v3 conformsToProtocol:&unk_26E4C91A0]
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v3 diagnosticReportEventType], (id v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v6 = (id *)MEMORY[0x263F7C1A8];
      goto LABEL_8;
    }
    if (v5 != objc_opt_class())
    {
      id v6 = (id *)MEMORY[0x263F7C1A0];
LABEL_8:
      id v4 = (__CFString *)*v6;
      goto LABEL_10;
    }
    id v4 = @"MemoryResourceException";
  }
LABEL_10:

  return v4;
}

+ (id)domainForEvent:(id)a3
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    return @"Performance";
  }
  else {
    return @"HomeKit";
  }
}

+ (BOOL)isSupportedEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 supportedEventClasses];
  uint64_t v6 = objc_opt_class();

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

+ (id)supportedEventClasses
{
  if (supportedEventClasses_onceToken_270538 != -1) {
    dispatch_once(&supportedEventClasses_onceToken_270538, &__block_literal_global_270539);
  }
  v2 = (void *)supportedEventClasses_supportedEventClasses_270540;
  return v2;
}

void __57__HMDDiagnosticReporterLogObserver_supportedEventClasses__block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  v1 = (void *)supportedEventClasses_supportedEventClasses_270540;
  supportedEventClasses_supportedEventClasses_270540 = v0;
}

@end