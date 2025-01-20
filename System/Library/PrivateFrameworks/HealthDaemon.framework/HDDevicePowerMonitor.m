@interface HDDevicePowerMonitor
- (BOOL)primarySourceIsCharging;
- (HDDevicePowerMonitor)init;
- (void)_queue_updatePrimaryPowerSourceState:(uint64_t)a1;
- (void)addDevicePowerObserver:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)removeDevicePowerObserver:(id)a3;
@end

@implementation HDDevicePowerMonitor

- (HDDevicePowerMonitor)init
{
  v21.receiver = self;
  v21.super_class = (Class)HDDevicePowerMonitor;
  v2 = [(HDDevicePowerMonitor *)&v21 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    _HKInitializeLogging();
    id v5 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v6 = [v5 initWithName:@"device-power-observers" loggingCategory:*MEMORY[0x1E4F29F28]];
    observers = v2->_observers;
    v2->_observers = (HKObserverSet *)v6;

    v8 = (CUPowerSourceMonitor *)objc_alloc_init(MEMORY[0x1E4F5E1B0]);
    monitor = v2->_monitor;
    v2->_monitor = v8;

    [(CUPowerSourceMonitor *)v2->_monitor setDispatchQueue:v2->_queue];
    [(CUPowerSourceMonitor *)v2->_monitor setChangeFlags:4];
    objc_initWeak(&location, v2);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __28__HDDevicePowerMonitor_init__block_invoke;
    v18[3] = &unk_1E63096E8;
    objc_copyWeak(&v19, &location);
    [(CUPowerSourceMonitor *)v2->_monitor setPowerSourceFoundHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __28__HDDevicePowerMonitor_init__block_invoke_2;
    v16[3] = &unk_1E63096E8;
    objc_copyWeak(&v17, &location);
    [(CUPowerSourceMonitor *)v2->_monitor setPowerSourceLostHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __28__HDDevicePowerMonitor_init__block_invoke_3;
    v14[3] = &unk_1E6309710;
    objc_copyWeak(&v15, &location);
    [(CUPowerSourceMonitor *)v2->_monitor setPowerSourceChangedHandler:v14];
    v10 = v2->_monitor;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __28__HDDevicePowerMonitor_init__block_invoke_4;
    v12[3] = &unk_1E62F3170;
    v13 = v2;
    [(CUPowerSourceMonitor *)v10 activateWithCompletion:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __28__HDDevicePowerMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(v2);
  id v4 = v3;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = WeakRetained;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Discovered a power source: %{public}@.", buf, 0x16u);
    }
    uint64_t v6 = [v4 type];
    int v7 = [v6 isEqualToString:@"InternalBattery"];

    if (v7) {
      -[HDDevicePowerMonitor _queue_updatePrimaryPowerSourceState:]((uint64_t)WeakRetained, [v4 powerState]);
    }
  }
}

void __28__HDDevicePowerMonitor_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(v2);
  id v4 = v3;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v8 = WeakRetained;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Lost a power source: %{public}@.", buf, 0x16u);
    }
  }
}

void __28__HDDevicePowerMonitor_init__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(v2);
  id v4 = v3;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v10 = WeakRetained;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Power source updated: %{public}@.", buf, 0x16u);
    }
    uint64_t v6 = [v4 type];
    int v7 = [v6 isEqualToString:@"InternalBattery"];

    if (v7) {
      -[HDDevicePowerMonitor _queue_updatePrimaryPowerSourceState:]((uint64_t)WeakRetained, [v4 powerState]);
    }
  }
}

void __28__HDDevicePowerMonitor_init__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F28];
  id v5 = *MEMORY[0x1E4F29F28];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to activate power source monitor: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Activated power source monitoring.", (uint8_t *)&v8, 0xCu);
  }
}

- (void)dealloc
{
  [(CUPowerSourceMonitor *)self->_monitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDDevicePowerMonitor;
  [(HDDevicePowerMonitor *)&v3 dealloc];
}

- (void)addDevicePowerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  if (a4) {
    -[HKObserverSet registerObserver:queue:](observers, "registerObserver:queue:", a3);
  }
  else {
    [(HKObserverSet *)observers registerObserver:a3];
  }
}

- (void)removeDevicePowerObserver:(id)a3
{
}

- (void)_queue_updatePrimaryPowerSourceState:(uint64_t)a1
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  unsigned int v4 = (a2 < 4) & (0xCu >> (a2 & 0xF));
  if (*(unsigned __int8 *)(a1 + 32) != v4)
  {
    *(unsigned char *)(a1 + 32) = v4;
    id v5 = *(void **)(a1 + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__HDDevicePowerMonitor__queue_updatePrimaryPowerSourceState___block_invoke;
    v6[3] = &unk_1E6309738;
    v6[4] = a1;
    char v7 = (a2 < 4) & (0xCu >> (a2 & 0xF));
    [v5 notifyObservers:v6];
  }
}

uint64_t __61__HDDevicePowerMonitor__queue_updatePrimaryPowerSourceState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 devicePowerMonitor:*(void *)(a1 + 32) primaryPowerSourceIsCharging:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)primarySourceIsCharging
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__HDDevicePowerMonitor_primarySourceIsCharging__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__HDDevicePowerMonitor_primarySourceIsCharging__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end