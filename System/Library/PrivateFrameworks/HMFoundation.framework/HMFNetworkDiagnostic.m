@interface HMFNetworkDiagnostic
+ (id)logCategory;
+ (id)runDiagnostics:(id)a3 timeout:(double)a4;
- (BOOL)isStarted;
- (HMFNetworkDiagnostic)initWithDevice:(id)a3 delegate:(id)a4 queue:(id)a5;
- (HMFNetworkDiagnosticDelegate)delegate;
- (HMFNetworkService)device;
- (OS_dispatch_queue)workQueue;
- (id)dumpReport;
- (id)run;
- (id)runWithDelay:(double)a3;
- (id)shortDescription;
- (void)handleReceivedData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)stop;
@end

@implementation HMFNetworkDiagnostic

- (HMFNetworkDiagnostic)initWithDevice:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMFNetworkDiagnostic;
  v12 = [(HMFNetworkDiagnostic *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_workQueue, a5);
  }

  return v13;
}

- (id)runWithDelay:(double)a3
{
  return +[HMFFuture futureWithNoValue];
}

- (id)run
{
  return +[HMFFuture futureWithNoValue];
}

+ (id)runDiagnostics:(id)a3 timeout:(double)a4
{
  id v5 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__HMFNetworkDiagnostic_runDiagnostics_timeout___block_invoke;
  v11[3] = &unk_1E5957D48;
  v11[4] = v12;
  v6 = objc_msgSend(v5, "na_map:", v11);
  v7 = +[HMFFuture allSettled:v6];
  v8 = [v7 ignoreResult];
  id v9 = [v8 timeout:a4];

  _Block_object_dispose(v12, 8);
  return v9;
}

double __47__HMFNetworkDiagnostic_runDiagnostics_timeout___block_invoke(uint64_t a1, void *a2)
{
  [a2 runWithDelay:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v3 + 24) + 1.0;
  *(double *)(v3 + 24) = result;
  return result;
}

- (void)stop
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 stringWithFormat:@"You must override %@ in a subclass", v7];
  id v6 = (id)[v2 exceptionWithName:v3 reason:v5 userInfo:0];
}

- (void)handleReceivedData:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  NSStringFromSelector(a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v7 = (id)[v3 exceptionWithName:v4 reason:v6 userInfo:0];
}

- (id)dumpReport
{
  return &stru_1EEF0F5E0;
}

+ (id)logCategory
{
  if (_MergedGlobals_3_3 != -1) {
    dispatch_once(&_MergedGlobals_3_3, &__block_literal_global_14);
  }
  v2 = (void *)qword_1EB4EEA80;
  return v2;
}

uint64_t __35__HMFNetworkDiagnostic_logCategory__block_invoke()
{
  qword_1EB4EEA80 = HMFCreateOSLogHandle(@"HMFNetworkDiagnostic", @"com.apple.HomeKit");
  return MEMORY[0x1F41817F8]();
}

- (id)shortDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HMFNetworkDiagnostic *)self device];
  id v6 = [v5 hostName];
  id v7 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

  return v7;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (HMFNetworkService)device
{
  return self->_device;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMFNetworkDiagnosticDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFNetworkDiagnosticDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end