@interface HMFNetworkDiagnosticCollector
+ (id)logCategory;
- (HMFNetworkBrowser)browser;
- (HMFNetworkDiagnosticCollector)initWithQueue:(id)a3;
- (HMFNetworkDiagnosticCollector)initWithQueue:(id)a3 discoveryTimeout:(double)a4 resolveTimeout:(double)a5 diagnosticTimeout:(double)a6 serviceTypes:(id)a7;
- (NSArray)currentDiagnostics;
- (NSArray)serviceTypes;
- (NSMutableDictionary)devicesMap;
- (OS_dispatch_queue)workQueue;
- (double)diagnosticTimeout;
- (double)discoveryTimeout;
- (double)resolveTimeout;
- (id)activeDevices;
- (id)devices;
- (id)diagnosticReport;
- (id)discoverDevicesWithTimeout:(double)a3;
- (id)networkDiagnostics;
- (id)resolveDevicesWithAddressType:(unint64_t)a3 timeout:(double)a4;
- (id)run;
- (id)startDiagnosticsWithTimeout:(double)a3;
- (id)workContext;
- (void)browser:(id)a3 didFindNetworkService:(id)a4;
- (void)browser:(id)a3 didLoseNetworkService:(id)a4;
- (void)browser:(id)a3 didStartBrowsingForServiceType:(id)a4;
- (void)browser:(id)a3 didStopBrowsingForServiceType:(id)a4;
- (void)browser:(id)a3 didUpdateNetworkService:(id)a4;
- (void)diagnostic:(id)a3 didCompleteWithError:(id)a4;
- (void)diagnostic:(id)a3 didStartWithDevice:(id)a4;
- (void)setBrowser:(id)a3;
- (void)setDevicesMap:(id)a3;
- (void)setDiagnosticTimeout:(double)a3;
- (void)setDiscoveryTimeout:(double)a3;
- (void)setResolveTimeout:(double)a3;
- (void)setServiceTypes:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)stop;
@end

@implementation HMFNetworkDiagnosticCollector

- (HMFNetworkDiagnosticCollector)initWithQueue:(id)a3 discoveryTimeout:(double)a4 resolveTimeout:(double)a5 diagnosticTimeout:(double)a6 serviceTypes:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HMFNetworkDiagnosticCollector;
  v15 = [(HMFNetworkDiagnosticCollector *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeStrong((id *)&v16->_serviceTypes, a7);
    v17 = [[HMFNetworkBrowser alloc] initWithQueue:v13 domain:@"local" serviceTypes:v14];
    browser = v16->_browser;
    v16->_browser = v17;

    [(HMFNetworkBrowser *)v16->_browser setDelegate:v16];
    v16->_discoveryTimeout = a4;
    v16->_diagnosticTimeout = a6;
    v16->_resolveTimeout = a5;
  }

  return v16;
}

- (HMFNetworkDiagnosticCollector)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = +[HMFNetworkServiceInfo defaultServiceTypes];
  v6 = [(HMFNetworkDiagnosticCollector *)self initWithQueue:v4 discoveryTimeout:v5 resolveTimeout:5.0 diagnosticTimeout:10.0 serviceTypes:30.0];

  return v6;
}

- (id)networkDiagnostics
{
  if (_MergedGlobals_3_8 != -1) {
    dispatch_once(&_MergedGlobals_3_8, &__block_literal_global_26);
  }
  v2 = (void *)qword_1EB4EEAD0;
  return v2;
}

void __51__HMFNetworkDiagnosticCollector_networkDiagnostics__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)qword_1EB4EEAD0;
  qword_1EB4EEAD0 = v0;
}

- (id)workContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HMFNetworkDiagnosticCollector_workContext__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  if (qword_1EB4EEAD8 != -1) {
    dispatch_once(&qword_1EB4EEAD8, block);
  }
  return (id)qword_1EB4EEAE0;
}

void __44__HMFNetworkDiagnosticCollector_workContext__block_invoke(uint64_t a1)
{
  v2 = [HMFDispatchContext alloc];
  id v5 = [*(id *)(a1 + 32) workQueue];
  uint64_t v3 = [(HMFDispatchContext *)v2 initWithQueue:v5];
  id v4 = (void *)qword_1EB4EEAE0;
  qword_1EB4EEAE0 = v3;
}

- (id)run
{
  uint64_t v3 = [(HMFNetworkDiagnosticCollector *)self workContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__HMFNetworkDiagnosticCollector_run__block_invoke;
  v6[3] = &unk_1E5957FB8;
  v6[4] = self;
  id v4 = +[HMFFuture inContext:v3 perform:v6];

  return v4;
}

uint64_t __36__HMFNetworkDiagnosticCollector_run__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 discoveryTimeout];
  uint64_t v3 = objc_msgSend(v2, "discoverDevicesWithTimeout:");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__HMFNetworkDiagnosticCollector_run__block_invoke_2;
  v12[3] = &unk_1E5957C80;
  v12[4] = *(void *)(a1 + 32);
  id v4 = [v3 then:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__HMFNetworkDiagnosticCollector_run__block_invoke_3;
  v11[3] = &unk_1E5957FB8;
  v11[4] = *(void *)(a1 + 32);
  id v5 = [v4 finally:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__HMFNetworkDiagnosticCollector_run__block_invoke_4;
  v10[3] = &unk_1E5957FB8;
  v10[4] = *(void *)(a1 + 32);
  v6 = [v5 finally:v10];

  id v7 = v6;
  if (!v7) {
    _HMFPreconditionFailure(@"future");
  }
  v8 = v7;

  return 3;
}

uint64_t __36__HMFNetworkDiagnosticCollector_run__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  [v4 resolveTimeout];
  objc_msgSend(v4, "resolveDevicesWithAddressType:timeout:", 2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    _HMFPreconditionFailure(@"future");
  }
  v6 = v5;

  return 3;
}

uint64_t __36__HMFNetworkDiagnosticCollector_run__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 diagnosticTimeout];
  objc_msgSend(v1, "startDiagnosticsWithTimeout:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2) {
    _HMFPreconditionFailure(@"future");
  }
  id v3 = v2;

  return 3;
}

uint64_t __36__HMFNetworkDiagnosticCollector_run__block_invoke_4(uint64_t a1)
{
  return 1;
}

- (void)stop
{
  id v3 = [(HMFNetworkDiagnosticCollector *)self currentDiagnostics];
  objc_msgSend(v3, "na_each:", &__block_literal_global_11_0);

  id v4 = [(HMFNetworkDiagnosticCollector *)self devices];
  objc_msgSend(v4, "na_each:", &__block_literal_global_14);
}

uint64_t __37__HMFNetworkDiagnosticCollector_stop__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

uint64_t __37__HMFNetworkDiagnosticCollector_stop__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (id)devices
{
  id v2 = [(HMFNetworkDiagnosticCollector *)self browser];
  id v3 = [v2 foundNetworkServices];

  return v3;
}

- (id)activeDevices
{
  id v2 = [(HMFNetworkDiagnosticCollector *)self devices];
  id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_17);

  return v3;
}

uint64_t __46__HMFNetworkDiagnosticCollector_activeDevices__block_invoke(uint64_t a1, void *a2)
{
  return [a2 lowPowerMode] ^ 1;
}

- (id)discoverDevicesWithTimeout:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMFNetworkDiagnosticCollector *)self serviceTypes];
  uint64_t v6 = [v5 count];
  id v7 = (void *)MEMORY[0x19F3A87A0]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      v11 = HMFGetLogIdentifier(v8);
      v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      id v13 = [NSNumber numberWithDouble:a3];
      int v18 = 138543874;
      v19 = v11;
      __int16 v20 = 2112;
      v21 = v12;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_INFO, "%{public}@=> Run browse with %@ services and timeout: %@", (uint8_t *)&v18, 0x20u);
    }
    id v14 = [(HMFNetworkDiagnosticCollector *)v8 browser];
    v15 = [v14 startBrowsingWithTimeout:a3];
  }
  else
  {
    if (v10)
    {
      v16 = HMFGetLogIdentifier(v8);
      int v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_INFO, "%{public}@Nothing to do, no service types provided", (uint8_t *)&v18, 0xCu);
    }
    v15 = +[HMFFuture futureWithNoValue];
  }

  return v15;
}

- (id)resolveDevicesWithAddressType:(unint64_t)a3 timeout:(double)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = [(HMFNetworkDiagnosticCollector *)self activeDevices];
  uint64_t v8 = [v7 count];
  v9 = (void *)MEMORY[0x19F3A87A0]();
  BOOL v10 = self;
  v11 = HMFGetOSLogHandle();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier(v10);
      id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v15 = [NSNumber numberWithDouble:a4];
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      __int16 v28 = 2112;
      v29 = v14;
      __int16 v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_INFO, "%{public}@=> Run resolve with %@ devices and timeout: %@", buf, 0x20u);
    }
    v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__HMFNetworkDiagnosticCollector_resolveDevicesWithAddressType_timeout___block_invoke;
    v22[3] = &unk_1E5958040;
    id v23 = v16;
    unint64_t v24 = a3;
    double v25 = a4;
    id v17 = v16;
    objc_msgSend(v7, "na_each:", v22);
    int v18 = +[HMFFuture allSettled:v17];
    v19 = [v18 ignoreResult];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier(v10);
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_ERROR, "%{public}@No devices to resolve", buf, 0xCu);
    }
    v19 = +[HMFFuture futureWithNoValue];
  }

  return v19;
}

void __71__HMFNetworkDiagnosticCollector_resolveDevicesWithAddressType_timeout___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 resolveAddressWithAddressType:*(void *)(a1 + 40) timeout:0 receivedDataHandler:*(double *)(a1 + 48)];
  [v2 addObject:v3];
}

- (id)startDiagnosticsWithTimeout:(double)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMFNetworkDiagnosticCollector *)self activeDevices];
  uint64_t v6 = [v5 count];
  id v7 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v8 = self;
  v9 = HMFGetOSLogHandle();
  BOOL v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier(v8);
      v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      id v13 = [NSNumber numberWithDouble:a3];
      *(_DWORD *)buf = 138543874;
      v29 = v11;
      __int16 v30 = 2114;
      v31 = v12;
      __int16 v32 = 2114;
      v33 = v13;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@=> Run diagnostics with %{public}@ devices and timeout: %{public}@", buf, 0x20u);
    }
    id v14 = [(HMFNetworkDiagnosticCollector *)v8 networkDiagnostics];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    unint64_t v24 = __61__HMFNetworkDiagnosticCollector_startDiagnosticsWithTimeout___block_invoke;
    double v25 = &unk_1E5958090;
    id v26 = v5;
    v27 = v8;
    uint64_t v15 = objc_msgSend(v14, "na_flatMap:", &v22);
    currentDiagnostics = v8->_currentDiagnostics;
    v8->_currentDiagnostics = (NSArray *)v15;

    id v17 = [(HMFNetworkDiagnosticCollector *)v8 currentDiagnostics];
    int v18 = +[HMFNetworkDiagnostic runDiagnostics:v17 timeout:a3];

    v19 = v26;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier(v8);
      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_ERROR, "%{public}@No devices to run diagnostics", buf, 0xCu);
    }
    v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    int v18 = +[HMFFuture futureWithError:v19];
  }

  return v18;
}

id __61__HMFNetworkDiagnosticCollector_startDiagnosticsWithTimeout___block_invoke(uint64_t a1, uint64_t a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__HMFNetworkDiagnosticCollector_startDiagnosticsWithTimeout___block_invoke_2;
  v5[3] = &unk_1E5958068;
  id v2 = *(void **)(a1 + 32);
  v5[4] = *(void *)(a1 + 40);
  v5[5] = a2;
  id v3 = objc_msgSend(v2, "na_map:", v5);
  return v3;
}

id __61__HMFNetworkDiagnosticCollector_startDiagnosticsWithTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(objc_class **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [v6 workQueue];
  uint64_t v8 = (void *)[v5 initWithDevice:v4 delegate:v6 queue:v7];

  return v8;
}

- (id)diagnosticReport
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[@"Service Type\t\tDevice ID\t\tCategory\tS#\tC#\tSF\tPing\t\t\t\t Model / Name / Address / Port\t\n" mutableCopy];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"device.serviceInfo.serviceType.length" ascending:1];
  id v5 = [(HMFNetworkDiagnosticCollector *)self currentDiagnostics];
  v22[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v7 = [v5 sortedArrayUsingDescriptors:v6];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  uint64_t v8 = [v7 firstObject];
  v9 = [v8 device];
  BOOL v10 = [v9 serviceInfo];
  id v21 = [v10 serviceType];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __49__HMFNetworkDiagnosticCollector_diagnosticReport__block_invoke;
  id v17 = &unk_1E59580B8;
  v19 = v20;
  id v11 = v3;
  id v18 = v11;
  objc_msgSend(v7, "na_each:", &v14);
  v12 = objc_msgSend(v11, "copy", v14, v15, v16, v17);

  _Block_object_dispose(v20, 8);
  return v12;
}

void __49__HMFNetworkDiagnosticCollector_diagnosticReport__block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 device];
  id v4 = [v3 serviceInfo];
  id v5 = [v4 serviceType];
  char v6 = [v5 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  if ((v6 & 1) == 0)
  {
    id v7 = [v14 device];
    uint64_t v8 = [v7 serviceInfo];
    uint64_t v9 = [v8 serviceType];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [*(id *)(a1 + 32) appendFormat:@"\n"];
  }
  v12 = *(void **)(a1 + 32);
  id v13 = [v14 dumpReport];
  [v12 appendString:v13];
}

- (void)diagnostic:(id)a3 didStartWithDevice:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 addresses];
  uint64_t v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_36);

  uint64_t v10 = (void *)MEMORY[0x19F3A87A0]();
  id v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v18 = v10;
    v19 = HMFGetLogIdentifier(v11);
    id v13 = [v6 shortDescription];
    id v14 = [v6 device];
    uint64_t v15 = [v14 shortDescription];
    uint64_t v16 = [v9 count];
    if (v16)
    {
      id v17 = [v9 componentsJoinedByString:@","];
    }
    else
    {
      id v17 = 0;
    }
    *(_DWORD *)buf = 138544130;
    id v21 = v19;
    __int16 v22 = 2114;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    double v25 = v15;
    __int16 v26 = 2114;
    v27 = v17;
    _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_INFO, "%{public}@Started %{public}@ with device: %@ and addresses: %{public}@", buf, 0x2Au);
    if (v16) {

    }
    uint64_t v10 = v18;
  }
}

uint64_t __63__HMFNetworkDiagnosticCollector_diagnostic_didStartWithDevice___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addressString];
}

- (void)diagnostic:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier(v9);
    if (v7) {
      v12 = @"❌";
    }
    else {
      v12 = @"✅";
    }
    id v13 = [v6 shortDescription];
    id v14 = [v6 device];
    uint64_t v15 = [v14 shortDescription];
    int v16 = 138544386;
    id v17 = v11;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2114;
    id v21 = v13;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    __int16 v24 = 2114;
    id v25 = v7;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@%@ Completed %{public}@ for device: %@ with error: %{public}@", (uint8_t *)&v16, 0x34u);
  }
}

- (void)browser:(id)a3 didStartBrowsingForServiceType:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier(v9);
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Browser started browsing for service type: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)browser:(id)a3 didStopBrowsingForServiceType:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier(v9);
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Browser stopped browsing for service type: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)browser:(id)a3 didFindNetworkService:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier(v9);
    int v12 = [v7 shortDescription];
    int v13 = 138543618;
    __int16 v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Browser did find network service: %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)browser:(id)a3 didLoseNetworkService:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier(v9);
    int v12 = [v7 shortDescription];
    int v13 = 138543618;
    __int16 v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Browser did lose network service: %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)browser:(id)a3 didUpdateNetworkService:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier(v9);
    int v12 = [v7 shortDescription];
    int v13 = 138543618;
    __int16 v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Browser did update network service: %@", (uint8_t *)&v13, 0x16u);
  }
}

+ (id)logCategory
{
  if (qword_1EB4EEAE8 != -1) {
    dispatch_once(&qword_1EB4EEAE8, &__block_literal_global_47);
  }
  id v2 = (void *)qword_1EB4EEAF0;
  return v2;
}

uint64_t __44__HMFNetworkDiagnosticCollector_logCategory__block_invoke()
{
  qword_1EB4EEAF0 = HMFCreateOSLogHandle(@"HMFNetworkDiagnostic", @"com.apple.HomeKit");
  return MEMORY[0x1F41817F8]();
}

- (HMFNetworkBrowser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
}

- (NSArray)currentDiagnostics
{
  return self->_currentDiagnostics;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
}

- (NSMutableDictionary)devicesMap
{
  return self->_devicesMap;
}

- (void)setDevicesMap:(id)a3
{
}

- (double)discoveryTimeout
{
  return self->_discoveryTimeout;
}

- (void)setDiscoveryTimeout:(double)a3
{
  self->_discoveryTimeout = a3;
}

- (double)resolveTimeout
{
  return self->_resolveTimeout;
}

- (void)setResolveTimeout:(double)a3
{
  self->_resolveTimeout = a3;
}

- (double)diagnosticTimeout
{
  return self->_diagnosticTimeout;
}

- (void)setDiagnosticTimeout:(double)a3
{
  self->_diagnosticTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesMap, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentDiagnostics, 0);
  objc_storeStrong((id *)&self->_browser, 0);
}

@end