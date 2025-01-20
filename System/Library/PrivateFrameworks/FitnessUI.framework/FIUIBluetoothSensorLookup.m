@interface FIUIBluetoothSensorLookup
+ (BOOL)hasHadPairedCyclingCadenceSensors;
+ (BOOL)hasHadPairedCyclingPowerSensors;
+ (BOOL)hasHadPairedCyclingSpeedSensors;
+ (id)didUpdateBTSensorSeenStatus;
+ (id)shared;
- (BOOL)hasHadPairedCyclingCadenceSensors;
- (BOOL)hasHadPairedCyclingPowerSensors;
- (BOOL)hasHadPairedCyclingSpeedSensors;
- (BOOL)hideBluetoothPowerAlert;
- (BOOL)testAndSetPeripheral:(id)a3 forTag:(id)a4 defaultsKey:(id)a5;
- (CBCentralManager)centralManager;
- (FIUIBluetoothSensorLookup)init;
- (OS_dispatch_queue)queue;
- (int64_t)pendingTypes;
- (void)_queueCheckForPeripherals;
- (void)_queueSpinUpBTCheck:(int64_t)a3;
- (void)_spinUpCheck;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setPendingTypes:(int64_t)a3;
- (void)setQueue:(id)a3;
@end

@implementation FIUIBluetoothSensorLookup

+ (id)didUpdateBTSensorSeenStatus
{
  return @"DidUpdateBTSensorSeenStatus";
}

+ (BOOL)hasHadPairedCyclingSpeedSensors
{
  v2 = [a1 shared];
  char v3 = [v2 hasHadPairedCyclingSpeedSensors];

  return v3;
}

+ (BOOL)hasHadPairedCyclingCadenceSensors
{
  v2 = [a1 shared];
  char v3 = [v2 hasHadPairedCyclingCadenceSensors];

  return v3;
}

+ (BOOL)hasHadPairedCyclingPowerSensors
{
  v2 = [a1 shared];
  char v3 = [v2 hasHadPairedCyclingPowerSensors];

  return v3;
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)shared___shared;
  return v2;
}

uint64_t __35__FIUIBluetoothSensorLookup_shared__block_invoke()
{
  shared___shared = objc_alloc_init(FIUIBluetoothSensorLookup);
  return MEMORY[0x270F9A758]();
}

- (FIUIBluetoothSensorLookup)init
{
  v5.receiver = self;
  v5.super_class = (Class)FIUIBluetoothSensorLookup;
  v2 = [(FIUIBluetoothSensorLookup *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("BTSensorLookup", 0);
    [(FIUIBluetoothSensorLookup *)v2 setQueue:v3];

    [(FIUIBluetoothSensorLookup *)v2 setPendingTypes:0];
  }
  return v2;
}

- (BOOL)hasHadPairedCyclingSpeedSensors
{
  return 1;
}

- (BOOL)hasHadPairedCyclingCadenceSensors
{
  return 1;
}

- (BOOL)hasHadPairedCyclingPowerSensors
{
  return 1;
}

- (BOOL)hideBluetoothPowerAlert
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"CyclingHideBluetoothPowerAlert"];

  return v3;
}

- (void)_spinUpCheck
{
  objc_initWeak(&location, self);
  char v3 = [(FIUIBluetoothSensorLookup *)self queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__FIUIBluetoothSensorLookup__spinUpCheck__block_invoke;
  v4[3] = &unk_2644A7960;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__FIUIBluetoothSensorLookup__spinUpCheck__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _queueSpinUpBTCheck:7];
}

- (void)_queueSpinUpBTCheck:(int64_t)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = [(FIUIBluetoothSensorLookup *)self queue];
  dispatch_assert_queue_V2(v5);

  [(FIUIBluetoothSensorLookup *)self setPendingTypes:[(FIUIBluetoothSensorLookup *)self pendingTypes] | a3];
  v6 = [(FIUIBluetoothSensorLookup *)self centralManager];

  if (v6)
  {
    v7 = [(FIUIBluetoothSensorLookup *)self centralManager];
    uint64_t v8 = [v7 state];

    if (v8 == 5)
    {
      [(FIUIBluetoothSensorLookup *)self _queueCheckForPeripherals];
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x263F09970];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_21E433000, v15, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Waiting for CBCentralManager to power on", v21, 2u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v9 = (os_log_t *)MEMORY[0x263F09970];
    v10 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21E433000, v10, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Powering up CBCentralManager", v21, 2u);
    }
    int v11 = [MEMORY[0x263F82438] isRunningInStoreDemoMode];
    if ([(FIUIBluetoothSensorLookup *)self hideBluetoothPowerAlert])
    {
      _HKInitializeLogging();
      v12 = *v9;
      BOOL v13 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
      uint64_t v14 = 0;
      if (v13)
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_21E433000, v12, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Always hiding Bluetooth Power Alert, overriden in defaults", v21, 2u);
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = v11 ^ 1u;
    }
    id v16 = objc_alloc(MEMORY[0x263EFEF00]);
    v17 = [(FIUIBluetoothSensorLookup *)self queue];
    uint64_t v22 = *MEMORY[0x263EFED38];
    v18 = [NSNumber numberWithBool:v14];
    v23[0] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v20 = (void *)[v16 initWithDelegate:self queue:v17 options:v19];
    [(FIUIBluetoothSensorLookup *)self setCentralManager:v20];
  }
}

- (BOOL)testAndSetPeripheral:(id)a3 forTag:(id)a4 defaultsKey:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v7 hasTag:v8]) {
    goto LABEL_5;
  }
  _HKInitializeLogging();
  v10 = *MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_21E433000, v10, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Did find %@ peripheral %@", (uint8_t *)&v15, 0x16u);
  }
  int v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v12 = [v11 BOOLForKey:v9];

  if ((v12 & 1) == 0)
  {
    BOOL v13 = 1;
    objc_msgSend(MEMORY[0x263EFFA40], "fu_backupAndSetBool:forKey:", 1, v9);
  }
  else
  {
LABEL_5:
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_queueCheckForPeripherals
{
  char v3 = [(FIUIBluetoothSensorLookup *)self queue];
  dispatch_assert_queue_V2(v3);

  int64_t v4 = [(FIUIBluetoothSensorLookup *)self pendingTypes];
  [(FIUIBluetoothSensorLookup *)self setPendingTypes:0];
  id v5 = [(FIUIBluetoothSensorLookup *)self centralManager];

  if (v5)
  {
    v6 = [(FIUIBluetoothSensorLookup *)self centralManager];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__FIUIBluetoothSensorLookup__queueCheckForPeripherals__block_invoke;
    v8[3] = &unk_2644A7FA8;
    v8[4] = self;
    v8[5] = v4;
    [v6 retrievePeripheralsWithCustomProperties:&unk_26CF74740 completion:v8];
  }
  else
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E433000, v7, OS_LOG_TYPE_DEFAULT, "[Bluetooth] CBCentralManager has gone away before we could check", buf, 2u);
    }
  }
}

void __54__FIUIBluetoothSensorLookup__queueCheckForPeripherals__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      __54__FIUIBluetoothSensorLookup__queueCheckForPeripherals__block_invoke_cold_1((uint64_t)v6, v7);
    }
    goto LABEL_26;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v9 = v8;
  int v10 = 0;
  uint64_t v11 = *(void *)v26;
  uint64_t v12 = *MEMORY[0x263F09C68];
  uint64_t v13 = *MEMORY[0x263F09C50];
  uint64_t v14 = *MEMORY[0x263F09C60];
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v5);
      }
      uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * v15);
      uint64_t v17 = *(void *)(a1 + 40);
      if (v17)
      {
        v10 |= [*(id *)(a1 + 32) testAndSetPeripheral:*(void *)(*((void *)&v25 + 1) + 8 * v15) forTag:v12 defaultsKey:@"CyclingSpeedSensorWasConnected"];
        uint64_t v17 = *(void *)(a1 + 40);
        if ((v17 & 2) == 0)
        {
LABEL_11:
          if ((v17 & 1) == 0) {
            goto LABEL_13;
          }
LABEL_12:
          v10 |= [*(id *)(a1 + 32) testAndSetPeripheral:v16 forTag:v14 defaultsKey:@"CyclingPowerSensorWasConnected"];
          goto LABEL_13;
        }
      }
      else if ((v17 & 2) == 0)
      {
        goto LABEL_11;
      }
      v10 |= [*(id *)(a1 + 32) testAndSetPeripheral:v16 forTag:v13 defaultsKey:@"CyclingCadenceSensorWasConnected"];
      if (*(void *)(a1 + 40)) {
        goto LABEL_12;
      }
LABEL_13:
      ++v15;
    }
    while (v9 != v15);
    uint64_t v18 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    uint64_t v9 = v18;
  }
  while (v18);
  id v6 = 0;
  if (v10)
  {
    _HKInitializeLogging();
    uint64_t v19 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E433000, v19, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Posting update notification", buf, 2u);
    }
    v20 = [MEMORY[0x263F08A00] defaultCenter];
    v21 = [(id)objc_opt_class() didUpdateBTSensorSeenStatus];
    [v20 postNotificationName:v21 object:*(void *)(a1 + 32)];
  }
LABEL_23:
  _HKInitializeLogging();
  uint64_t v22 = *MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E433000, v22, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Removing reference to CBCentralManager.", buf, 2u);
  }
  v23 = [*(id *)(a1 + 32) centralManager];
  [v23 setDelegate:0];

  [*(id *)(a1 + 32) setCentralManager:0];
LABEL_26:
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = [(FIUIBluetoothSensorLookup *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 state];
  if (v6 == 5)
  {
    [(FIUIBluetoothSensorLookup *)self _queueCheckForPeripherals];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)pendingTypes
{
  return self->_pendingTypes;
}

- (void)setPendingTypes:(int64_t)a3
{
  self->_pendingTypes = a3;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__FIUIBluetoothSensorLookup__queueCheckForPeripherals__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E433000, a2, OS_LOG_TYPE_ERROR, "[Bluetooth] Error retrieving peripherals: %@", (uint8_t *)&v2, 0xCu);
}

@end