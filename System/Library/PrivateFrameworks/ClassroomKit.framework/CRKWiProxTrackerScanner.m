@interface CRKWiProxTrackerScanner
- (CRKWiProxTrackerScanner)initWithDelegate:(id)a3;
- (CRKWiProxTrackerScannerDelegate)delegate;
- (WPDeviceScanner)deviceScanner;
- (WPZoneTracker)zoneTracker;
- (int64_t)deviceScannerState;
- (int64_t)zoneTrackerState;
- (void)dealloc;
- (void)deviceScannerDidUpdateState:(id)a3;
- (void)invalidate;
- (void)registerForDevicesMatching:(id)a3 options:(id)a4;
- (void)registerForZoneChangesMatching:(id)a3;
- (void)scanner:(id)a3 didFailToRegisterDevices:(id)a4 withError:(id)a5;
- (void)scanner:(id)a3 foundDevice:(id)a4 withData:(id)a5;
- (void)scanner:(id)a3 foundRequestedDevices:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceScanner:(id)a3;
- (void)setZoneTracker:(id)a3;
- (void)unregisterAllDeviceChanges;
- (void)unregisterAllZoneChanges;
- (void)unregisterForZoneChanges:(id)a3;
- (void)zoneTracker:(id)a3 didFailToRegisterZones:(id)a4 withError:(id)a5;
- (void)zoneTracker:(id)a3 enteredZone:(id)a4;
- (void)zoneTracker:(id)a3 exitedZone:(id)a4;
- (void)zoneTrackerDidUpdateState:(id)a3;
@end

@implementation CRKWiProxTrackerScanner

- (void)dealloc
{
  [(CRKWiProxTrackerScanner *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRKWiProxTrackerScanner;
  [(CRKWiProxTrackerScanner *)&v3 dealloc];
}

- (CRKWiProxTrackerScanner)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKWiProxTrackerScanner;
  v5 = [(CRKWiProxTrackerScanner *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F864D0]);
    v7 = (void *)MEMORY[0x263EF83A0];
    uint64_t v8 = [v6 initWithDelegate:v5 queue:MEMORY[0x263EF83A0]];
    zoneTracker = v5->_zoneTracker;
    v5->_zoneTracker = (WPZoneTracker *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F864C0]) initWithDelegate:v5 queue:v7];
    deviceScanner = v5->_deviceScanner;
    v5->_deviceScanner = (WPDeviceScanner *)v10;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)invalidate
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_224C00000, v2, v3, "entered %{public}@", v4, v5, v6, v7, v8);
}

- (int64_t)zoneTrackerState
{
  uint64_t v2 = [(CRKWiProxTrackerScanner *)self zoneTracker];
  int64_t v3 = [v2 state];

  return v3;
}

- (int64_t)deviceScannerState
{
  uint64_t v2 = [(CRKWiProxTrackerScanner *)self deviceScanner];
  int64_t v3 = [v2 state];

  return v3;
}

- (void)unregisterAllZoneChanges
{
  uint64_t v4 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  uint64_t v5 = [(CRKWiProxTrackerScanner *)self zoneTracker];
  [v5 unregisterAllZoneChanges];
}

- (void)unregisterForZoneChanges:(id)a3
{
  id v5 = a3;
  uint64_t v6 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  uint64_t v7 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner unregisterForZoneChanges:]();
  }

  uint8_t v8 = [(CRKWiProxTrackerScanner *)self zoneTracker];
  [v8 unregisterForZoneChanges:v5];
}

- (void)registerForZoneChangesMatching:(id)a3
{
  id v5 = a3;
  uint64_t v6 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  uint64_t v7 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner unregisterForZoneChanges:]();
  }

  uint8_t v8 = [(CRKWiProxTrackerScanner *)self zoneTracker];
  [v8 registerForZoneChangesMatching:v5];
}

- (void)unregisterAllDeviceChanges
{
  uint64_t v4 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  id v5 = [(CRKWiProxTrackerScanner *)self deviceScanner];
  [v5 unregisterAllDeviceChanges];
}

- (void)registerForDevicesMatching:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  uint64_t v10 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner registerForDevicesMatching:options:]();
  }

  v11 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner registerForDevicesMatching:options:]();
  }

  v12 = [(CRKWiProxTrackerScanner *)self deviceScanner];
  [v12 registerForDevicesMatching:v7 options:v8];
}

- (void)zoneTrackerDidUpdateState:(id)a3
{
  id v5 = a3;
  uint64_t v6 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  id v7 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner zoneTrackerDidUpdateState:](v5);
  }

  id v8 = [(CRKWiProxTrackerScanner *)self delegate];
  [v8 trackerScanner:self didUpdateZoneTrackerState:v5];
}

- (void)zoneTracker:(id)a3 enteredZone:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  uint64_t v10 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner zoneTracker:enteredZone:]();
  }

  v11 = [(CRKWiProxTrackerScanner *)self delegate];
  [v11 trackerScanner:self zoneTracker:v8 enteredZone:v7];
}

- (void)zoneTracker:(id)a3 exitedZone:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  uint64_t v10 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner zoneTracker:enteredZone:]();
  }

  v11 = [(CRKWiProxTrackerScanner *)self delegate];
  [v11 trackerScanner:self zoneTracker:v8 exitedZone:v7];
}

- (void)zoneTracker:(id)a3 didFailToRegisterZones:(id)a4 withError:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  objc_super v13 = [(CRKWiProxTrackerScanner *)self delegate];
  [v13 trackerScanner:self zoneTracker:v11 didFailToRegisterZones:v10 withError:v9];
}

- (void)deviceScannerDidUpdateState:(id)a3
{
  id v5 = a3;
  uint64_t v6 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  id v7 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner zoneTrackerDidUpdateState:](v5);
  }

  id v8 = [(CRKWiProxTrackerScanner *)self delegate];
  [v8 trackerScanner:self didUpdateDeviceScannerState:v5];
}

- (void)scanner:(id)a3 foundRequestedDevices:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  id v10 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner registerForDevicesMatching:options:]();
  }

  id v11 = [(CRKWiProxTrackerScanner *)self delegate];
  [v11 trackerScanner:self scanner:v8 foundRequestedDevices:v7];
}

- (void)scanner:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  objc_super v13 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner scanner:foundDevice:withData:]();
  }

  v14 = [(CRKWiProxTrackerScanner *)self delegate];
  [v14 trackerScanner:self scanner:v11 foundDevice:v9 withData:v10];
}

- (void)scanner:(id)a3 didFailToRegisterDevices:(id)a4 withError:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = _CRKLogBluetooth_0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CRKWiProxTrackerScanner invalidate](a2);
  }

  objc_super v13 = [(CRKWiProxTrackerScanner *)self delegate];
  [v13 trackerScanner:self scanner:v11 didFailToRegisterDevices:v10 withError:v9];
}

- (WPZoneTracker)zoneTracker
{
  return self->_zoneTracker;
}

- (void)setZoneTracker:(id)a3
{
}

- (WPDeviceScanner)deviceScanner
{
  return self->_deviceScanner;
}

- (void)setDeviceScanner:(id)a3
{
}

- (CRKWiProxTrackerScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKWiProxTrackerScannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceScanner, 0);

  objc_storeStrong((id *)&self->_zoneTracker, 0);
}

- (void)unregisterForZoneChanges:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_224C00000, v0, v1, "zones: %{public}@", v2);
}

- (void)registerForDevicesMatching:options:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_224C00000, v0, v1, "options: %{public}@", v2);
}

- (void)registerForDevicesMatching:options:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_224C00000, v0, v1, "devices: %{public}@", v2);
}

- (void)zoneTrackerDidUpdateState:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "state"));
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_224C00000, v2, v3, "state: %{public}@", v4, v5, v6, v7, v8);
}

- (void)zoneTracker:enteredZone:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_224C00000, v0, v1, "zone: %{public}@", v2);
}

- (void)scanner:foundDevice:withData:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_224C00000, v0, v1, "device: %{public}@", v2);
}

@end