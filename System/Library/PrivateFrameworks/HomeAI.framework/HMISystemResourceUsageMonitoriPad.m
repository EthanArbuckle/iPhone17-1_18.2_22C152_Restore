@interface HMISystemResourceUsageMonitoriPad
- (BOOL)computeResourceUsageLevel;
- (BOOL)isDisplayOn;
- (BOOL)isLocked;
- (HMINotifydObserver)notifydObserverForDisplayState;
- (HMINotifydObserver)notifydObserverForLockState;
- (HMISystemResourceUsage)currentSystemResourceUsage;
- (HMISystemResourceUsageMonitorDelegate)delegate;
- (HMISystemResourceUsageMonitoriPad)initWithWorkQueue:(id)a3;
- (OS_dispatch_queue)workQueue;
- (id)getCurrentSystemResourceUsage;
- (void)handleResourceUsageNotification;
- (void)possibleComputeResourceChange;
- (void)setDelegate:(id)a3;
- (void)setDisplayOn:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)start;
@end

@implementation HMISystemResourceUsageMonitoriPad

- (HMISystemResourceUsageMonitoriPad)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMISystemResourceUsageMonitoriPad;
  v6 = [(HMISystemResourceUsageMonitoriPad *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    v8 = objc_alloc_init(HMISystemResourceUsage);
    currentSystemResourceUsage = v7->_currentSystemResourceUsage;
    v7->_currentSystemResourceUsage = v8;

    v7->_displayOn = 1;
    v10 = [HMINotifydObserver alloc];
    v11 = [(HMISystemResourceUsageMonitoriPad *)v7 workQueue];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __55__HMISystemResourceUsageMonitoriPad_initWithWorkQueue___block_invoke;
    v23[3] = &unk_26477D838;
    v12 = v7;
    v24 = v12;
    uint64_t v13 = [(HMINotifydObserver *)v10 initWithNotificationName:"com.apple.iokit.hid.displayStatus" andQueue:v11 andCallback:v23];
    notifydObserverForDisplayState = v12->_notifydObserverForDisplayState;
    v12->_notifydObserverForDisplayState = (HMINotifydObserver *)v13;

    v15 = [HMINotifydObserver alloc];
    v16 = [(HMISystemResourceUsageMonitoriPad *)v12 workQueue];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __55__HMISystemResourceUsageMonitoriPad_initWithWorkQueue___block_invoke_4;
    v21[3] = &unk_26477D838;
    v17 = v12;
    v22 = v17;
    uint64_t v18 = [(HMINotifydObserver *)v15 initWithNotificationName:"com.apple.springboard.lockstate" andQueue:v16 andCallback:v21];
    notifydObserverForLockState = v17->_notifydObserverForLockState;
    v17->_notifydObserverForLockState = (HMINotifydObserver *)v18;
  }
  return v7;
}

void __55__HMISystemResourceUsageMonitoriPad_initWithWorkQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = (void *)MEMORY[0x22A641C70]([*(id *)(a1 + 32) setDisplayOn:a3 != 0]);
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = [*(id *)(a1 + 32) isDisplayOn];
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 1024;
    int v13 = v9;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Display enabled: %d", (uint8_t *)&v10, 0x12u);
  }
  [*(id *)(a1 + 32) possibleComputeResourceChange];
}

void __55__HMISystemResourceUsageMonitoriPad_initWithWorkQueue___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = (void *)MEMORY[0x22A641C70]([*(id *)(a1 + 32) setLocked:a3 != 0]);
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = [*(id *)(a1 + 32) isLocked];
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 1024;
    int v13 = v9;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Device lock state: %d", (uint8_t *)&v10, 0x12u);
  }
  [*(id *)(a1 + 32) possibleComputeResourceChange];
}

- (void)start
{
  v3 = [(HMISystemResourceUsageMonitoriPad *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMISystemResourceUsageMonitoriPad *)self possibleComputeResourceChange];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_handleResourceUsageNotification name:*MEMORY[0x263F42038] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_handleResourceUsageNotification name:*MEMORY[0x263F42030] object:0];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_handleResourceUsageNotification name:*MEMORY[0x263F08450] object:0];

  v7 = [MEMORY[0x263F42600] sharedManager];
  [v7 start];

  v8 = [(HMISystemResourceUsageMonitoriPad *)self notifydObserverForDisplayState];
  [v8 start];

  id v9 = [(HMISystemResourceUsageMonitoriPad *)self notifydObserverForLockState];
  [v9 start];
}

- (void)handleResourceUsageNotification
{
  v3 = [(HMISystemResourceUsageMonitoriPad *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMISystemResourceUsageMonitoriPad_handleResourceUsageNotification__block_invoke;
  block[3] = &unk_26477B7D8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __68__HMISystemResourceUsageMonitoriPad_handleResourceUsageNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) possibleComputeResourceChange];
}

- (void)possibleComputeResourceChange
{
  v3 = [(HMISystemResourceUsageMonitoriPad *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMISystemResourceUsageMonitoriPad *)self computeResourceUsageLevel])
  {
    id v5 = [(HMISystemResourceUsageMonitoriPad *)self delegate];
    v4 = [(HMISystemResourceUsageMonitoriPad *)self currentSystemResourceUsage];
    objc_msgSend(v5, "systemResourceUsageDidChangeTo:", objc_msgSend(v4, "systemResourceUsageLevel"));
  }
}

- (BOOL)computeResourceUsageLevel
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [(HMISystemResourceUsageMonitoriPad *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [MEMORY[0x263F08AB0] processInfo];
  int v5 = [v4 isLowPowerModeEnabled];

  if (v5)
  {
    v6 = (void *)MEMORY[0x22A641C70]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_5:
      uint64_t v11 = 3;
LABEL_23:

      goto LABEL_24;
    }
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)v33 = 138543362;
    *(void *)&v33[4] = v9;
    int v10 = "%{public}@System is in low power mode";
LABEL_4:
    _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_INFO, v10, v33, 0xCu);

    goto LABEL_5;
  }
  __int16 v12 = [MEMORY[0x263F42600] sharedManager];
  uint64_t v13 = [v12 batteryState];

  uint64_t v14 = [MEMORY[0x263F42600] sharedManager];
  [v14 batteryLevel];
  float v16 = v15;

  if ([(HMISystemResourceUsageMonitoriPad *)self isDisplayOn]) {
    int v17 = ![(HMISystemResourceUsageMonitoriPad *)self isLocked];
  }
  else {
    int v17 = 0;
  }
  if ((unint64_t)(v13 - 2) < 2)
  {
    v6 = (void *)MEMORY[0x22A641C70]();
    objc_super v25 = self;
    v8 = HMFGetOSLogHandle();
    BOOL v26 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (!v17)
    {
      if (v26)
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)v33 = 138543362;
        *(void *)&v33[4] = v32;
        uint64_t v11 = 1;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_INFO, "%{public}@Battery state charging/charged", v33, 0xCu);
      }
      else
      {
        uint64_t v11 = 1;
      }
      goto LABEL_23;
    }
    if (!v26) {
      goto LABEL_22;
    }
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)v33 = 138543362;
    *(void *)&v33[4] = v21;
    v22 = "%{public}@Battery state charging/charged but user is actively using the device";
    goto LABEL_20;
  }
  if (!v13)
  {
    v6 = (void *)MEMORY[0x22A641C70]();
    v27 = self;
    v8 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)v33 = 138543362;
    *(void *)&v33[4] = v21;
    v22 = "%{public}@Battery state unknown, should get the real one shortly";
LABEL_20:
    v23 = v8;
    uint32_t v24 = 12;
    goto LABEL_21;
  }
  if (v13 == 1)
  {
    double v18 = v16;
    v6 = (void *)MEMORY[0x22A641C70]();
    v19 = self;
    v8 = HMFGetOSLogHandle();
    BOOL v20 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v18 <= 0.2)
    {
      if (!v20) {
        goto LABEL_5;
      }
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)v33 = 138543362;
      *(void *)&v33[4] = v9;
      int v10 = "%{public}@Battery level critical";
      goto LABEL_4;
    }
    if (v20)
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)v33 = 138543618;
      *(void *)&v33[4] = v21;
      *(_WORD *)&v33[12] = 2048;
      *(double *)&v33[14] = v18;
      v22 = "%{public}@Battery level: %f";
      v23 = v8;
      uint32_t v24 = 22;
LABEL_21:
      _os_log_impl(&dword_225DC6000, v23, OS_LOG_TYPE_INFO, v22, v33, v24);
    }
LABEL_22:
    uint64_t v11 = 2;
    goto LABEL_23;
  }
  uint64_t v11 = 0;
LABEL_24:
  v28 = [(HMISystemResourceUsageMonitoriPad *)self currentSystemResourceUsage];
  uint64_t v29 = [v28 systemResourceUsageLevel];

  if (v29 != v11)
  {
    v30 = [(HMISystemResourceUsageMonitoriPad *)self currentSystemResourceUsage];
    [v30 setSystemResourceUsageLevel:v11];
  }
  return v29 != v11;
}

- (id)getCurrentSystemResourceUsage
{
  v3 = [(HMISystemResourceUsageMonitoriPad *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return [(HMISystemResourceUsageMonitoriPad *)self currentSystemResourceUsage];
}

- (HMISystemResourceUsageMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMISystemResourceUsageMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMISystemResourceUsage)currentSystemResourceUsage
{
  return (HMISystemResourceUsage *)objc_getProperty(self, a2, 32, 1);
}

- (HMINotifydObserver)notifydObserverForDisplayState
{
  return (HMINotifydObserver *)objc_getProperty(self, a2, 40, 1);
}

- (HMINotifydObserver)notifydObserverForLockState
{
  return (HMINotifydObserver *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isDisplayOn
{
  return self->_displayOn;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOn = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifydObserverForLockState, 0);
  objc_storeStrong((id *)&self->_notifydObserverForDisplayState, 0);
  objc_storeStrong((id *)&self->_currentSystemResourceUsage, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end