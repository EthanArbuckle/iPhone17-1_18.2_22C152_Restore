@interface CUSystemMonitor
- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv4Addr;
- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv6Addr;
- ($D91DDCA3822F03E96939068EA8DE741A)bluetoothAddress48;
- ($D91DDCA3822F03E96939068EA8DE741A)rotatingIdentifier48;
- (BOOL)clamshellMode;
- (BOOL)firstUnlocked;
- (BOOL)firstUnlockedSync;
- (BOOL)manateeAvailable;
- (BOOL)meDeviceIsMe;
- (BOOL)meDeviceUseFindMyLocate;
- (BOOL)meDeviceValid;
- (BOOL)powerUnlimited;
- (BOOL)primaryAppleIDIsHSA2;
- (BOOL)screenLocked;
- (BOOL)screenLockedSync;
- (BOOL)screenOn;
- (BOOL)screenSaverActive;
- (CUSystemMonitor)init;
- (NSArray)familyMembers;
- (NSBundle)locationVisitsBundle;
- (NSData)bluetoothAddressData;
- (NSData)rotatingIdentifierData;
- (NSString)consoleUserName;
- (NSString)foregroundAppBundleID;
- (NSString)meDeviceFMFDeviceID;
- (NSString)meDeviceIDSDeviceID;
- (NSString)meDeviceName;
- (NSString)primaryAppleID;
- (NSString)primaryNetworkSignature;
- (NSString)regionISOCountryCode;
- (NSString)regionMobileCountryCode;
- (NSString)regionRoutineCountry;
- (NSString)regionRoutineState;
- (NSString)systemName;
- (OS_dispatch_queue)dispatchQueue;
- (id)bluetoothAddressChangedHandler;
- (id)callChangedHandler;
- (id)clamshellModeChangedHandler;
- (id)consoleUserChangedHandler;
- (id)familyUpdatedHandler;
- (id)firstUnlockHandler;
- (id)foregroundAppChangedHandler;
- (id)invalidationHandler;
- (id)locationVisitsChangedHandler;
- (id)manateeChangedHandler;
- (id)meDeviceChangedHandler;
- (id)motionHandler;
- (id)netFlagsChangedHandler;
- (id)netInterfacesChangedHandler;
- (id)powerUnlimitedChangedHandler;
- (id)primaryAppleIDChangedHandler;
- (id)primaryIPChangedHandler;
- (id)primaryNetworkChangedHandler;
- (id)regionChangedHandler;
- (id)rotatingIdentifierChangedHandler;
- (id)screenLockedChangedHandler;
- (id)screenOnChangedHandler;
- (id)screenSaverChangedHandler;
- (id)screenStateChangedHandler;
- (id)systemLockStateChangedHandler;
- (id)systemNameChangedHandler;
- (id)systemUIChangedHandler;
- (id)wifiStateChangedHandler;
- (int)activeCallCount;
- (int)callCountIncomingConnected;
- (int)callCountIncomingUnconnected;
- (int)callCountOutgoingConnected;
- (int)callCountOutgoingUnconnected;
- (int)connectedCallCount;
- (int)manateeState;
- (int)motionOrientation;
- (int)screenState;
- (int)systemLockState;
- (int)systemLockStateSync;
- (int)wifiState;
- (unsigned)callFlags;
- (unsigned)consoleUserID;
- (unsigned)locationVisitsFlags;
- (unsigned)motionFlags;
- (unsigned)netFlags;
- (unsigned)systemUIFlags;
- (unsigned)wifiFlags;
- (void)activateWithCompletion:(id)a3;
- (void)forceManateeStateRefresh;
- (void)invalidate;
- (void)setBluetoothAddressChangedHandler:(id)a3;
- (void)setCallChangedHandler:(id)a3;
- (void)setClamshellModeChangedHandler:(id)a3;
- (void)setConsoleUserChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFamilyUpdatedHandler:(id)a3;
- (void)setFirstUnlockHandler:(id)a3;
- (void)setForegroundAppChangedHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLocationVisitsBundle:(id)a3;
- (void)setLocationVisitsChangedHandler:(id)a3;
- (void)setManateeChangedHandler:(id)a3;
- (void)setMeDeviceChangedHandler:(id)a3;
- (void)setMeDeviceUseFindMyLocate:(BOOL)a3;
- (void)setMotionHandler:(id)a3;
- (void)setNetFlagsChangedHandler:(id)a3;
- (void)setNetInterfacesChangedHandler:(id)a3;
- (void)setPowerUnlimitedChangedHandler:(id)a3;
- (void)setPrimaryAppleIDChangedHandler:(id)a3;
- (void)setPrimaryIPChangedHandler:(id)a3;
- (void)setPrimaryNetworkChangedHandler:(id)a3;
- (void)setRegionChangedHandler:(id)a3;
- (void)setRotatingIdentifierChangedHandler:(id)a3;
- (void)setScreenLockedChangedHandler:(id)a3;
- (void)setScreenOnChangedHandler:(id)a3;
- (void)setScreenSaverChangedHandler:(id)a3;
- (void)setScreenStateChangedHandler:(id)a3;
- (void)setSystemLockStateChangedHandler:(id)a3;
- (void)setSystemNameChangedHandler:(id)a3;
- (void)setSystemUIChangedHandler:(id)a3;
- (void)setWifiStateChangedHandler:(id)a3;
@end

@implementation CUSystemMonitor

- (BOOL)screenOn
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    BOOL v2 = *(unsigned char *)(gCUSystemMonitor + 488) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (id)systemUIChangedHandler
{
  return objc_getProperty(self, a2, 240, 1);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)firstUnlocked
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    BOOL v2 = *(unsigned char *)(gCUSystemMonitor + 616) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)wifiFlags
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 640);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)screenSaverActive
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    BOOL v2 = *(unsigned char *)(gCUSystemMonitor + 496) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)manateeAvailable
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    BOOL v2 = *(unsigned char *)(gCUSystemMonitor + 148) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)meDeviceIsMe
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    BOOL v2 = *(unsigned char *)(gCUSystemMonitor + 208) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)activeCallCount
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 64);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (NSString)primaryAppleID
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  int v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    int v2 = *(void **)(gCUSystemMonitor + 368);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (int)wifiState
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 644);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wifiStateChangedHandler, 0);
  objc_storeStrong(&self->_firstUnlockHandler, 0);
  objc_storeStrong(&self->_systemUIChangedHandler, 0);
  objc_storeStrong(&self->_systemNameChangedHandler, 0);
  objc_storeStrong(&self->_systemLockStateChangedHandler, 0);
  objc_storeStrong(&self->_screenStateChangedHandler, 0);
  objc_storeStrong(&self->_screenSaverChangedHandler, 0);
  objc_storeStrong(&self->_screenOnChangedHandler, 0);
  objc_storeStrong(&self->_screenLockedChangedHandler, 0);
  objc_storeStrong(&self->_rotatingIdentifierChangedHandler, 0);
  objc_storeStrong(&self->_regionChangedHandler, 0);
  objc_storeStrong(&self->_primaryAppleIDChangedHandler, 0);
  objc_storeStrong(&self->_powerUnlimitedChangedHandler, 0);
  objc_storeStrong(&self->_primaryNetworkChangedHandler, 0);
  objc_storeStrong(&self->_primaryIPChangedHandler, 0);
  objc_storeStrong(&self->_netInterfacesChangedHandler, 0);
  objc_storeStrong(&self->_netFlagsChangedHandler, 0);
  objc_storeStrong(&self->_motionHandler, 0);
  objc_storeStrong(&self->_meDeviceChangedHandler, 0);
  objc_storeStrong(&self->_manateeChangedHandler, 0);
  objc_storeStrong(&self->_locationVisitsChangedHandler, 0);
  objc_storeStrong((id *)&self->_locationVisitsBundle, 0);
  objc_storeStrong(&self->_foregroundAppChangedHandler, 0);
  objc_storeStrong(&self->_familyUpdatedHandler, 0);
  objc_storeStrong(&self->_consoleUserChangedHandler, 0);
  objc_storeStrong(&self->_clamshellModeChangedHandler, 0);
  objc_storeStrong(&self->_callChangedHandler, 0);
  objc_storeStrong(&self->_bluetoothAddressChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)setWifiStateChangedHandler:(id)a3
{
}

- (id)wifiStateChangedHandler
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setFirstUnlockHandler:(id)a3
{
}

- (id)firstUnlockHandler
{
  return objc_getProperty(self, a2, 248, 1);
}

- (void)setSystemUIChangedHandler:(id)a3
{
}

- (void)setSystemNameChangedHandler:(id)a3
{
}

- (id)systemNameChangedHandler
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setSystemLockStateChangedHandler:(id)a3
{
}

- (id)systemLockStateChangedHandler
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setScreenStateChangedHandler:(id)a3
{
}

- (id)screenStateChangedHandler
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setScreenSaverChangedHandler:(id)a3
{
}

- (id)screenSaverChangedHandler
{
  return objc_getProperty(self, a2, 208, 1);
}

- (void)setScreenOnChangedHandler:(id)a3
{
}

- (id)screenOnChangedHandler
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setScreenLockedChangedHandler:(id)a3
{
}

- (id)screenLockedChangedHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setRotatingIdentifierChangedHandler:(id)a3
{
}

- (id)rotatingIdentifierChangedHandler
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setRegionChangedHandler:(id)a3
{
}

- (id)regionChangedHandler
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setPrimaryAppleIDChangedHandler:(id)a3
{
}

- (id)primaryAppleIDChangedHandler
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setPowerUnlimitedChangedHandler:(id)a3
{
}

- (id)powerUnlimitedChangedHandler
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setPrimaryNetworkChangedHandler:(id)a3
{
}

- (id)primaryNetworkChangedHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setPrimaryIPChangedHandler:(id)a3
{
}

- (id)primaryIPChangedHandler
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setNetInterfacesChangedHandler:(id)a3
{
}

- (id)netInterfacesChangedHandler
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setNetFlagsChangedHandler:(id)a3
{
}

- (id)netFlagsChangedHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setMotionHandler:(id)a3
{
}

- (id)motionHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setMeDeviceChangedHandler:(id)a3
{
}

- (id)meDeviceChangedHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setMeDeviceUseFindMyLocate:(BOOL)a3
{
  self->_meDeviceUseFindMyLocate = a3;
}

- (BOOL)meDeviceUseFindMyLocate
{
  return self->_meDeviceUseFindMyLocate;
}

- (void)setManateeChangedHandler:(id)a3
{
}

- (id)manateeChangedHandler
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setLocationVisitsChangedHandler:(id)a3
{
}

- (id)locationVisitsChangedHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setLocationVisitsBundle:(id)a3
{
}

- (NSBundle)locationVisitsBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setForegroundAppChangedHandler:(id)a3
{
}

- (id)foregroundAppChangedHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setFamilyUpdatedHandler:(id)a3
{
}

- (id)familyUpdatedHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setConsoleUserChangedHandler:(id)a3
{
}

- (id)consoleUserChangedHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setClamshellModeChangedHandler:(id)a3
{
}

- (id)clamshellModeChangedHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setCallChangedHandler:(id)a3
{
}

- (id)callChangedHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setBluetoothAddressChangedHandler:(id)a3
{
}

- (id)bluetoothAddressChangedHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)firstUnlockedSync
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

- (unsigned)systemUIFlags
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 596);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (NSString)systemName
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  unsigned int v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    unsigned int v2 = *(void **)(gCUSystemMonitor + 576);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (int)systemLockStateSync
{
  unsigned int v2 = MKBGetDeviceLockState();
  if (v2 <= 4) {
    return 4 - v2;
  }
  else {
    return 0;
  }
}

- (int)systemLockState
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 584);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)screenState
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 512);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)screenLockedSync
{
  if (SpringBoardServicesLibrary_sOnce != -1) {
    dispatch_once(&SpringBoardServicesLibrary_sOnce, &__block_literal_global_1263);
  }
  if (SpringBoardServicesLibrary_sLib)
  {
    int v2 = dlsym((void *)SpringBoardServicesLibrary_sLib, "SBSGetScreenLockStatus");
    if (v2) {
      LOBYTE(v2) = softLinkSBSGetScreenLockStatus(0) != 0;
    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (BOOL)screenLocked
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    BOOL v2 = *(unsigned char *)(gCUSystemMonitor + 480) != 0;
  }
  else {
    BOOL v2 = 1;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (NSData)rotatingIdentifierData
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  BOOL v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    BOOL v2 = *(void **)(gCUSystemMonitor + 464);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSData *)v3;
}

- ($D91DDCA3822F03E96939068EA8DE741A)rotatingIdentifier48
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    unint64_t v2 = *(unsigned int *)(gCUSystemMonitor + 456) | ((unint64_t)*(unsigned __int16 *)(gCUSystemMonitor + 460) << 32);
  }
  else {
    unint64_t v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return ($D91DDCA3822F03E96939068EA8DE741A)v2;
}

- (NSString)regionRoutineState
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  unint64_t v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    unint64_t v2 = *(void **)(gCUSystemMonitor + 448);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionRoutineCountry
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  unint64_t v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    unint64_t v2 = *(void **)(gCUSystemMonitor + 432);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionMobileCountryCode
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  unint64_t v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    unint64_t v2 = *(void **)(gCUSystemMonitor + 416);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionISOCountryCode
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  unint64_t v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    unint64_t v2 = *(void **)(gCUSystemMonitor + 408);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)primaryNetworkSignature
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  unint64_t v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    unint64_t v2 = *(void **)(gCUSystemMonitor + 352);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv6Addr
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v4 = gCUSystemMonitor;
  if (gCUSystemMonitor)
  {
    retstr->var0 = *(sockaddr *)(gCUSystemMonitor + 320);
    *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)(v4 + 332);
  }
  else
  {
    *(void *)&retstr->var0.sa_len = 0;
    *(void *)retstr->var2.sin6_addr.__u6_addr8 = 0;
    retstr->var2.sin6_scope_id = 0;
    *(void *)&retstr->var2.sin6_addr.__u6_addr32[2] = 0;
  }
  return ($9D4F243E34B80324A1B90A38B57CFE16 *)pthread_mutex_unlock(&gCUSystemMonitorLock);
}

- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv4Addr
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v4 = gCUSystemMonitor;
  if (gCUSystemMonitor)
  {
    *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)(gCUSystemMonitor + 304);
    retstr->var0 = *(sockaddr *)(v4 + 292);
  }
  else
  {
    *(void *)&retstr->var0.sa_len = 0;
    *(void *)retstr->var2.sin6_addr.__u6_addr8 = 0;
    retstr->var2.sin6_scope_id = 0;
    *(void *)&retstr->var2.sin6_addr.__u6_addr32[2] = 0;
  }
  return ($9D4F243E34B80324A1B90A38B57CFE16 *)pthread_mutex_unlock(&gCUSystemMonitorLock);
}

- (BOOL)primaryAppleIDIsHSA2
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    BOOL v2 = *(unsigned char *)(gCUSystemMonitor + 377) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)powerUnlimited
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    BOOL v2 = *(unsigned char *)(gCUSystemMonitor + 364) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)netFlags
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 288);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)motionOrientation
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 264);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)motionFlags
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 248);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)meDeviceValid
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    BOOL v2 = *(unsigned char *)(gCUSystemMonitor + 209) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (NSString)meDeviceName
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  BOOL v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    BOOL v2 = *(void **)(gCUSystemMonitor + 200);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)meDeviceIDSDeviceID
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  BOOL v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    BOOL v2 = *(void **)(gCUSystemMonitor + 192);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)meDeviceFMFDeviceID
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  BOOL v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    BOOL v2 = *(void **)(gCUSystemMonitor + 184);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (void)forceManateeStateRefresh
{
}

- (int)manateeState
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 152);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)locationVisitsFlags
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 144);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (NSString)foregroundAppBundleID
{
  return 0;
}

- (NSArray)familyMembers
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    unsigned int v2 = (void *)[*(id *)(gCUSystemMonitor + 104) copy];
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSArray *)v2;
}

- (NSString)consoleUserName
{
  return 0;
}

- (unsigned)consoleUserID
{
  return 0;
}

- (int)connectedCallCount
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 92);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)clamshellMode
{
  return 0;
}

- (unsigned)callFlags
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    unsigned int v2 = *(_DWORD *)(gCUSystemMonitor + 68);
  }
  else {
    unsigned int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)callCountOutgoingUnconnected
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 84);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)callCountOutgoingConnected
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 80);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)callCountIncomingUnconnected
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 76);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)callCountIncomingConnected
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    int v2 = *(_DWORD *)(gCUSystemMonitor + 72);
  }
  else {
    int v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (NSData)bluetoothAddressData
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  int v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor) {
    int v2 = *(void **)(gCUSystemMonitor + 32);
  }
  id v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSData *)v3;
}

- ($D91DDCA3822F03E96939068EA8DE741A)bluetoothAddress48
{
  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor) {
    unint64_t v2 = *(unsigned int *)(gCUSystemMonitor + 24) | ((unint64_t)*(unsigned __int16 *)(gCUSystemMonitor + 28) << 32);
  }
  else {
    unint64_t v2 = 0;
  }
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return ($D91DDCA3822F03E96939068EA8DE741A)v2;
}

- (void)invalidate
{
  self->_invalidateCalled = 1;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CUSystemMonitor_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__CUSystemMonitor_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v8 + 25))
  {
    *(unsigned char *)(v8 + 25) = 1;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitor invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v64);
    }
    pthread_mutex_lock(&gCUSystemMonitorLock);
    [(id)gCUSystemMonitor removeMonitor:*(void *)(a1 + 32)];
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 48);
    *(void *)(v12 + 48) = 0;

    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(void **)(v14 + 56);
    *(void *)(v14 + 56) = 0;

    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(void **)(v16 + 64);
    *(void *)(v16 + 64) = 0;

    uint64_t v18 = *(void *)(a1 + 32);
    v19 = *(void **)(v18 + 72);
    *(void *)(v18 + 72) = 0;

    uint64_t v20 = *(void *)(a1 + 32);
    v21 = *(void **)(v20 + 96);
    *(void *)(v20 + 96) = 0;

    uint64_t v22 = *(void *)(a1 + 32);
    v23 = *(void **)(v22 + 104);
    *(void *)(v22 + 104) = 0;

    uint64_t v24 = *(void *)(a1 + 32);
    v25 = *(void **)(v24 + 112);
    *(void *)(v24 + 112) = 0;

    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(void **)(v26 + 120);
    *(void *)(v26 + 120) = 0;

    uint64_t v28 = *(void *)(a1 + 32);
    v29 = *(void **)(v28 + 128);
    *(void *)(v28 + 128) = 0;

    uint64_t v30 = *(void *)(a1 + 32);
    v31 = *(void **)(v30 + 136);
    *(void *)(v30 + 136) = 0;

    uint64_t v32 = *(void *)(a1 + 32);
    v33 = *(void **)(v32 + 160);
    *(void *)(v32 + 160) = 0;

    uint64_t v34 = *(void *)(a1 + 32);
    v35 = *(void **)(v34 + 168);
    *(void *)(v34 + 168) = 0;

    uint64_t v36 = *(void *)(a1 + 32);
    v37 = *(void **)(v36 + 144);
    *(void *)(v36 + 144) = 0;

    uint64_t v38 = *(void *)(a1 + 32);
    v39 = *(void **)(v38 + 152);
    *(void *)(v38 + 152) = 0;

    uint64_t v40 = *(void *)(a1 + 32);
    v41 = *(void **)(v40 + 176);
    *(void *)(v40 + 176) = 0;

    uint64_t v42 = *(void *)(a1 + 32);
    v43 = *(void **)(v42 + 184);
    *(void *)(v42 + 184) = 0;

    uint64_t v44 = *(void *)(a1 + 32);
    v45 = *(void **)(v44 + 192);
    *(void *)(v44 + 192) = 0;

    uint64_t v46 = *(void *)(a1 + 32);
    v47 = *(void **)(v46 + 200);
    *(void *)(v46 + 200) = 0;

    uint64_t v48 = *(void *)(a1 + 32);
    v49 = *(void **)(v48 + 208);
    *(void *)(v48 + 208) = 0;

    uint64_t v50 = *(void *)(a1 + 32);
    v51 = *(void **)(v50 + 216);
    *(void *)(v50 + 216) = 0;

    uint64_t v52 = *(void *)(a1 + 32);
    v53 = *(void **)(v52 + 224);
    *(void *)(v52 + 224) = 0;

    uint64_t v54 = *(void *)(a1 + 32);
    v55 = *(void **)(v54 + 232);
    *(void *)(v54 + 232) = 0;

    uint64_t v56 = *(void *)(a1 + 32);
    v57 = *(void **)(v56 + 240);
    *(void *)(v56 + 240) = 0;

    uint64_t v58 = *(void *)(a1 + 32);
    v59 = *(void **)(v58 + 248);
    *(void *)(v58 + 248) = 0;

    uint64_t v60 = *(void *)(a1 + 32);
    v61 = *(void **)(v60 + 256);
    *(void *)(v60 + 256) = 0;

    uint64_t v62 = *(void *)(a1 + 32);
    v63 = *(void (***)(void))(v62 + 32);
    if (v63)
    {
      v63[2]();
      uint64_t v62 = *(void *)(a1 + 32);
      v63 = *(void (***)(void))(v62 + 32);
    }
    *(void *)(v62 + 32) = 0;
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CUSystemMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __42__CUSystemMonitor_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = *(unsigned __int8 *)(v9 + 8);
  *(unsigned char *)(v9 + 8) = 1;
  if (v10)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v11 = "Activating (again)\n";
LABEL_8:
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitor activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)v11, a5, a6, a7, a8, v19);
    }
  }
  else if (gLogCategory_CUSystemMonitor <= 30 {
         && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  }
  {
    v11 = "Activating\n";
    goto LABEL_8;
  }
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v12 = (void *)gCUSystemMonitor;
  if (!gCUSystemMonitor)
  {
    v13 = objc_alloc_init(CUSystemMonitorImp);
    uint64_t v14 = (void *)gCUSystemMonitor;
    gCUSystemMonitor = (uint64_t)v13;

    uint64_t v12 = (void *)gCUSystemMonitor;
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v16 = *(void *)(v15 + 16);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __42__CUSystemMonitor_activateWithCompletion___block_invoke_2;
    v22[3] = &unk_1E55BFC80;
    id v23 = *(id *)(a1 + 40);
    [v12 updateWithQueue:v16 completion:v22];
    v17 = v23;
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__CUSystemMonitor_activateWithCompletion___block_invoke_3;
    v20[3] = &unk_1E55BF148;
    v20[4] = v15;
    id v21 = *(id *)(a1 + 40);
    [v12 addMonitor:v15 completion:v20];
    v17 = v21;
  }

  return pthread_mutex_unlock(&gCUSystemMonitorLock);
}

uint64_t __42__CUSystemMonitor_activateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitor activateWithCompletion:]_block_invoke_2", 0x1Eu, (uint64_t)"Activated (again)\n", a5, a6, a7, a8, v11);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    int v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

uint64_t __42__CUSystemMonitor_activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitor activateWithCompletion:]_block_invoke_3", 0x1Eu, (uint64_t)"Activated\n", a5, a6, a7, a8, v11);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (CUSystemMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUSystemMonitor;
  unint64_t v2 = [(CUSystemMonitor *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    id v4 = v3;
  }

  return v3;
}

@end