@interface HKBluetoothDeviceDataSource
- (HKBluetoothDeviceDataSource)init;
- (HKBluetoothDeviceDataSource)initWithDiscoveryType:(Class)a3;
- (HKCBDiscovery)discovery;
- (id)_beginDiscoveryWithObserver:(id)a1;
- (id)_devicesWithError:(uint64_t)a1;
- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4;
- (id)pairedDevicesWithError:(id *)a3;
- (void)_endDiscovery;
- (void)dealloc;
- (void)registerObserverForDevicePairingChanges:(id)a3 updateHandler:(id)a4;
- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4;
- (void)unregisterObserverForDevicePairingChanges:(id)a3;
@end

@implementation HKBluetoothDeviceDataSource

- (HKBluetoothDeviceDataSource)init
{
  uint64_t v3 = objc_opt_class();

  return [(HKBluetoothDeviceDataSource *)self initWithDiscoveryType:v3];
}

- (HKBluetoothDeviceDataSource)initWithDiscoveryType:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKBluetoothDeviceDataSource;
  result = [(HKObserverBridge *)&v5 init];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_DiscoveryType = a3;
    result->_lock_isDiscoveryActive = 0;
  }
  return result;
}

- (void)dealloc
{
  -[HKBluetoothDeviceDataSource _endDiscovery]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HKBluetoothDeviceDataSource;
  [(HKObserverBridge *)&v3 dealloc];
}

- (void)_endDiscovery
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    [*(id *)(a1 + 40) invalidate];
    v2 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  }
}

- (id)_devicesWithError:(uint64_t)a1
{
  if (a1)
  {
    v4 = +[_HKBehavior sharedBehavior];
    int v5 = [v4 supportsBluetoothDiscovery];

    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
      if (*(unsigned char *)(a1 + 48)) {
        [*(id *)(a1 + 40) discoveredDevices];
      }
      else {
      v6 = [*(id *)(a1 + 56) devicesWithDiscoveryFlags:0x800000 error:a2];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    }
    else
    {
      v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pairedDevicesWithError:(id *)a3
{
  objc_super v3 = -[HKBluetoothDeviceDataSource _devicesWithError:]((uint64_t)self, (uint64_t)a3);
  v4 = objc_msgSend(v3, "hk_filter:", &__block_literal_global_115);

  return v4;
}

uint64_t __54__HKBluetoothDeviceDataSource_pairedDevicesWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isGuestPaired] ^ 1;
}

- (id)_beginDiscoveryWithObserver:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1 + 8);
    if (*((void *)a1 + 5))
    {
      _HKInitializeLogging();
      v4 = HKLogInfrastructure();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        -[HKBluetoothDeviceDataSource _beginDiscoveryWithObserver:]((uint64_t)a1, v4);
      }

      [*((id *)a1 + 5) invalidate];
      *((unsigned char *)a1 + 48) = 0;
    }
    id v5 = objc_alloc_init((Class)objc_opt_class());
    uint64_t v6 = objc_opt_class();
    [v5 setDiscoveryFlags:0x800000];
    [v5 setLabel:@"HKBluetoothDeviceDataSource"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke;
    v17[3] = &unk_1E58C7F58;
    uint64_t v19 = v6;
    id v7 = v3;
    id v18 = v7;
    [v5 setDeviceFoundHandler:v17];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_12;
    v14[3] = &unk_1E58C7F58;
    uint64_t v16 = v6;
    id v15 = v7;
    [v5 setDeviceLostHandler:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_13;
    v13[3] = &__block_descriptor_40_e17_v16__0__NSError_8lu32l8;
    v13[4] = v6;
    [v5 setErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_16;
    v11[3] = &unk_1E58C4FC0;
    v11[4] = a1;
    id v8 = v5;
    id v12 = v8;
    [v8 activateWithCompletion:v11];
    objc_storeStrong((id *)a1 + 5, v5);
    os_unfair_lock_unlock((os_unfair_lock_t)a1 + 8);
    v9 = v12;
    a1 = v8;
  }

  return a1;
}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [v3 identifier];
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device found: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) notifyObserversOfChangeForKey:@"CBDiscoveryObservation" newValue:0];
}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [v3 identifier];
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device lost: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) notifyObserversOfChangeForKey:@"CBDiscoveryObservation" newValue:0];
}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_13_cold_1(a1, (uint64_t)v3, v4);
  }
}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) == *(void *)(v4 + 40))
  {
    *(unsigned char *)(v4 + 48) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  _HKInitializeLogging();
  uint64_t v5 = HKLogInfrastructure();
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_16_cold_1(a1 + 32, (uint64_t)v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    id v9 = v7;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Activated CBDiscovery:%p", (uint8_t *)&v10, 0x16u);
  }
}

- (void)registerObserverForDevicePairingChanges:(id)a3 updateHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__HKBluetoothDeviceDataSource_registerObserverForDevicePairingChanges_updateHandler___block_invoke;
  v8[3] = &unk_1E58C0640;
  id v9 = v6;
  id v7 = v6;
  [(HKObserverBridge *)self registerObserver:a3 forKey:@"CBDiscoveryObservation" newValueHandler:v8];
}

uint64_t __85__HKBluetoothDeviceDataSource_registerObserverForDevicePairingChanges_updateHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterObserverForDevicePairingChanges:(id)a3
{
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"CBDiscoveryObservation"])
  {
    -[HKBluetoothDeviceDataSource _beginDiscoveryWithObserver:](self, v7);
    uint64_t v8 = (HKBluetoothDeviceDataSource *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    id v9 = HKLogInfrastructure();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[HKBluetoothDeviceDataSource makeAndRegisterBridgedObserverForKey:handle:]();
    }

    uint64_t v8 = self;
  }
  int v10 = v8;

  return v10;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:@"CBDiscoveryObservation"])
  {
    -[HKBluetoothDeviceDataSource _endDiscovery]((uint64_t)self);
  }
  else
  {
    _HKInitializeLogging();
    id v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[HKBluetoothDeviceDataSource unregisterBridgedObserver:forKey:]();
    }
  }
}

- (HKCBDiscovery)discovery
{
  return self->_discovery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);

  objc_storeStrong((id *)&self->_lock_discovery, 0);
}

- (void)_beginDiscoveryWithObserver:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_19C023000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] CBDiscovery beginning while another is currently running", (uint8_t *)&v4, 0xCu);
}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_13_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Error during CBDiscovery: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __59__HKBluetoothDeviceDataSource__beginDiscoveryWithObserver___block_invoke_16_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = objc_opt_class();
  id v5 = OUTLINED_FUNCTION_0_8(v4);
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Error activating CBDiscovery: %{public}@", v6, 0x16u);
}

- (void)makeAndRegisterBridgedObserverForKey:handle:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_8(v0);
  OUTLINED_FUNCTION_1_7(&dword_19C023000, v2, v3, "[%{public}@] Unsupported registration key: %{public}@", v4, v5, v6, v7, v8);
}

- (void)unregisterBridgedObserver:forKey:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_8(v0);
  OUTLINED_FUNCTION_1_7(&dword_19C023000, v2, v3, "[%{public}@] Unsupported unregistration key: %{public}@", v4, v5, v6, v7, v8);
}

@end