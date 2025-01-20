@interface BUNetworkMonitor
- (BOOL)hasCellularCapability;
- (BOOL)hasCellularConnection;
- (BOOL)hasWAPICapability;
- (BOOL)hasWifiConnection;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isConnected;
- (BUNetworkMonitor)initWithQueue:(id)a3;
- (OS_dispatch_queue)monitorQueue;
- (OS_nw_path)currentPath;
- (OS_nw_path_monitor)pathMonitor;
- (RadiosPreferences)radiosPreferences;
- (void)setCurrentPath:(id)a3;
- (void)setMonitorQueue:(id)a3;
- (void)setPathMonitor:(id)a3;
- (void)setRadiosPreferences:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation BUNetworkMonitor

- (BUNetworkMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BUNetworkMonitor;
  v6 = [(BUNetworkMonitor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_monitorQueue, a3);
    v8 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x263F255D0]);
    radiosPreferences = v7->_radiosPreferences;
    v7->_radiosPreferences = v8;
  }
  return v7;
}

- (void)start
{
  monitorQueue = self->_monitorQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1D5F0C;
  block[3] = &unk_26449D948;
  block[4] = self;
  dispatch_async(monitorQueue, block);
}

- (void)stop
{
  monitorQueue = self->_monitorQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1D61F4;
  block[3] = &unk_26449D948;
  block[4] = self;
  dispatch_async(monitorQueue, block);
}

- (BOOL)hasCellularCapability
{
  if (qword_267D298A8 != -1) {
    dispatch_once(&qword_267D298A8, &unk_26CF10A18);
  }
  return byte_267D298A0;
}

- (BOOL)hasWAPICapability
{
  if (qword_267D298B8 != -1) {
    dispatch_once(&qword_267D298B8, &unk_26CF10A38);
  }
  return byte_267D298B0;
}

- (BOOL)isAirplaneModeEnabled
{
  v4 = objc_msgSend_radiosPreferences(self, a2, v2);
  objc_msgSend_refresh(v4, v5, v6);

  v9 = objc_msgSend_radiosPreferences(self, v7, v8);
  LOBYTE(v4) = objc_msgSend_airplaneMode(v9, v10, v11);

  return (char)v4;
}

- (BOOL)hasCellularConnection
{
  if (!objc_msgSend_isConnected(self, a2, v2)) {
    return 0;
  }
  currentPath = self->_currentPath;
  if (!currentPath) {
    return 0;
  }

  return nw_path_uses_interface_type(currentPath, nw_interface_type_cellular);
}

- (BOOL)hasWifiConnection
{
  if (!objc_msgSend_isConnected(self, a2, v2)) {
    return 0;
  }
  currentPath = self->_currentPath;
  if (!currentPath) {
    return 0;
  }

  return nw_path_uses_interface_type(currentPath, nw_interface_type_wifi);
}

- (BOOL)isConnected
{
  currentPath = self->_currentPath;
  return !currentPath || (nw_path_get_status(currentPath) & 0xFFFFFFFD) != 0;
}

- (void)setCurrentPath:(id)a3
{
  id v5 = (OS_nw_path *)a3;
  currentPath = self->_currentPath;
  p_currentPath = &self->_currentPath;
  if (currentPath != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)p_currentPath, a3);
    v10 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v8, v9);
    objc_msgSend_postNotificationName_object_(v10, v11, @"BUNetworkMonitorInterfaceDidChangeNotification", 0);

    id v5 = v12;
  }
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
}

- (OS_nw_path)currentPath
{
  return self->_currentPath;
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)setRadiosPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);

  objc_storeStrong((id *)&self->_monitorQueue, 0);
}

@end