@interface HKFeatureAvailabilityCapabilityIsSupportedOnAnyPairedBluetoothDeviceRequirement
- (BOOL)capabilityIsSupportedOnPairedBluetoothDevice:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityCapabilityIsSupportedOnAnyPairedBluetoothDeviceRequirement

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  v6 = [a3 bluetoothDeviceDataSource];
  v7 = [v6 pairedDevicesWithError:a4];

  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __115__HKFeatureAvailabilityCapabilityIsSupportedOnAnyPairedBluetoothDeviceRequirement_isSatisfiedWithDataSource_error___block_invoke;
    v10[3] = &unk_1E58BF038;
    v10[4] = self;
    v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hk_containsObjectPassingTest:", v10));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __115__HKFeatureAvailabilityCapabilityIsSupportedOnAnyPairedBluetoothDeviceRequirement_isSatisfiedWithDataSource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) capabilityIsSupportedOnPairedBluetoothDevice:a2];
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, v7);
  v8 = [v7 bluetoothDeviceDataSource];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __114__HKFeatureAvailabilityCapabilityIsSupportedOnAnyPairedBluetoothDeviceRequirement_registerObserver_forDataSource___block_invoke;
  v9[3] = &unk_1E58BF060;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [v8 registerObserverForDevicePairingChanges:v6 updateHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __114__HKFeatureAvailabilityCapabilityIsSupportedOnAnyPairedBluetoothDeviceRequirement_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    v5 = (void *)(a1 + 32);
    id v10 = 0;
    id v7 = [v6 isSatisfiedWithDataSource:WeakRetained error:&v10];
    id v8 = v10;
    if (v7)
    {
      objc_msgSend(v3, "featureAvailabilityRequirement:didUpdateSatisfaction:", *v5, objc_msgSend(v7, "BOOLValue"));
    }
    else
    {
      _HKInitializeLogging();
      v9 = HKLogInfrastructure();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __114__HKFeatureAvailabilityCapabilityIsSupportedOnAnyPairedBluetoothDeviceRequirement_registerObserver_forDataSource___block_invoke_cold_1((uint64_t)v5, (uint64_t)v8, v9);
      }
    }
  }
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5 = a3;
  id v6 = [a4 bluetoothDeviceDataSource];
  [v6 unregisterObserverForDevicePairingChanges:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)capabilityIsSupportedOnPairedBluetoothDevice:(id)a3
{
  return 0;
}

void __114__HKFeatureAvailabilityCapabilityIsSupportedOnAnyPairedBluetoothDeviceRequirement_registerObserver_forDataSource___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "[%{public}@]: Error determining satisfaction in response to change in device pairing: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end