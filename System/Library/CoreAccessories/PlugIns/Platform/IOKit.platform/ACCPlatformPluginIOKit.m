@interface ACCPlatformPluginIOKit
- (BOOL)getBatteryChargingTypeIsInductive;
- (BOOL)getExternalBatteryChargingTypeIsInductive;
- (BOOL)getUSBFaultStateforType:(int)a3;
- (BOOL)getUSBHubOverCurrentState:(id)a3;
- (BOOL)isExternalChargerConnected;
- (BOOL)isRunning;
- (NSString)pluginName;
- (USBFaultMonitor)monitor;
- (id)createBatteryNotificationClient;
- (id)createSleepNotificationClient;
- (int)getBatteryChargingState;
- (int)getBatteryChargingType;
- (int)getExternalBatteryChargingType;
- (unsigned)getBatteryChargeLevel;
- (unsigned)getUSBHubSiphoningCurrentActualRequirementInmA:(id)a3;
- (unsigned)getUSBHubSiphoningCurrentRequirementInmA:(id)a3;
- (unsigned)getUSBHubUnitLoadInmA:(id)a3;
- (void)clientHandledSleepNotification:(id)a3;
- (void)createApplePencilSleepAssertion;
- (void)createEASleepAssertion;
- (void)createMFi4SleepAssertion;
- (void)createSleepAssertionForUUID:(id)a3;
- (void)destroyBatteryNotificationsForClient:(id)a3;
- (void)destroySleepAssertionForUUID:(id)a3;
- (void)destroySleepNotificationsForClient:(id)a3;
- (void)initPlugin;
- (void)initUSBCameraKitHubNotifications:(id)a3;
- (void)removeApplePencilSleepAssertion;
- (void)removeEASleepAssertion;
- (void)removeMFi4SleepAssertion;
- (void)resetUSBHubOverCurrentSiphoning:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setMonitor:(id)a3;
- (void)setUSBHubOverCurrentSiphoning:(id)a3;
- (void)startPlugin;
- (void)stopPlugin;
- (void)usbCableTypeMonitor:(BOOL)a3 forUUID:(id)a4;
- (void)usbFaultMonitor:(BOOL)a3 forUUID:(id)a4;
@end

@implementation ACCPlatformPluginIOKit

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)initPlugin
{
  init_logging();
  [(ACCPlatformPluginIOKit *)self setIsRunning:0];
}

- (void)startPlugin
{
}

- (void)stopPlugin
{
}

- (void)usbFaultMonitor:(BOOL)a3 forUUID:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = +[USBFaultMonitor sharedMonitor];
  id v7 = v6;
  if (v4) {
    [v6 startFaultMonitoringForUUID:v5];
  }
  else {
    [v6 stopFaultMonitoringForUUID:v5];
  }
}

- (void)usbCableTypeMonitor:(BOOL)a3 forUUID:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = +[USBCableTypeMonitor sharedMonitor];
  id v7 = v6;
  if (v4) {
    [v6 startCableTypeMonitoringForUUID:v5];
  }
  else {
    [v6 stopCableTypeMonitoringForUUID:v5];
  }
}

- (BOOL)getUSBFaultStateforType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = +[USBFaultMonitor sharedMonitor];
  LOBYTE(v3) = [v4 getFaultState:v3];

  return v3;
}

- (BOOL)isExternalChargerConnected
{
  v2 = +[PowerMonitor sharedMonitor];
  char v3 = [v2 isExternalChargerConnected];

  return v3;
}

- (int)getBatteryChargingState
{
  v2 = +[PowerMonitor sharedMonitor];
  int v3 = [v2 getBatteryChargingState];

  return v3;
}

- (unsigned)getBatteryChargeLevel
{
  v2 = +[PowerMonitor sharedMonitor];
  unsigned __int8 v3 = [v2 getBatteryChargeLevel];

  return v3;
}

- (id)createBatteryNotificationClient
{
  v2 = +[PowerMonitor sharedMonitor];
  unsigned __int8 v3 = [v2 createBatteryNotificationClient];

  return v3;
}

- (void)destroyBatteryNotificationsForClient:(id)a3
{
  id v3 = a3;
  id v4 = +[PowerMonitor sharedMonitor];
  [v4 destroyBatteryNotificationsForClient:v3];
}

- (id)createSleepNotificationClient
{
  v2 = +[PowerMonitor sharedMonitor];
  id v3 = [v2 createSleepNotificationClient];

  return v3;
}

- (void)destroySleepNotificationsForClient:(id)a3
{
  id v3 = a3;
  id v4 = +[PowerMonitor sharedMonitor];
  [v4 destroySleepNotificationsForClient:v3];
}

- (void)clientHandledSleepNotification:(id)a3
{
  id v3 = a3;
  id v4 = +[PowerMonitor sharedMonitor];
  [v4 clientHandledSleepNotification:v3];
}

- (int)getBatteryChargingType
{
  v2 = +[PowerMonitor sharedMonitor];
  int v3 = [v2 getBatteryChargingType];

  return v3;
}

- (int)getExternalBatteryChargingType
{
  v2 = +[PowerMonitor sharedMonitor];
  int v3 = [v2 getExternalBatteryChargingType];

  return v3;
}

- (BOOL)getBatteryChargingTypeIsInductive
{
  v2 = +[PowerMonitor sharedMonitor];
  char v3 = [v2 getBatteryChargingTypeIsInductive];

  return v3;
}

- (BOOL)getExternalBatteryChargingTypeIsInductive
{
  v2 = +[PowerMonitor sharedMonitor];
  char v3 = [v2 getExternalBatteryChargingTypeIsInductive];

  return v3;
}

- (void)initUSBCameraKitHubNotifications:(id)a3
{
  id v3 = a3;
  id v4 = +[USBCameraKitHubMonitor sharedMonitor];
  [v4 initUSBCameraKitHubNotifications:v3];
}

- (unsigned)getUSBHubUnitLoadInmA:(id)a3
{
  id v3 = a3;
  id v4 = +[USBCameraKitHubMonitor sharedMonitor];
  unsigned int v5 = [v4 getUSBHubUnitLoadInmA:v3];

  return v5;
}

- (unsigned)getUSBHubSiphoningCurrentRequirementInmA:(id)a3
{
  id v3 = a3;
  id v4 = +[USBCameraKitHubMonitor sharedMonitor];
  unsigned int v5 = [v4 getUSBHubSiphoningCurrentRequirementInmA:v3];

  return v5;
}

- (unsigned)getUSBHubSiphoningCurrentActualRequirementInmA:(id)a3
{
  id v3 = a3;
  id v4 = +[USBCameraKitHubMonitor sharedMonitor];
  unsigned int v5 = [v4 getUSBHubSiphoningCurrentActualRequirementInmA:v3];

  return v5;
}

- (BOOL)getUSBHubOverCurrentState:(id)a3
{
  id v3 = a3;
  id v4 = +[USBCameraKitHubMonitor sharedMonitor];
  char v5 = [v4 overcurrentState:v3];

  return v5;
}

- (void)resetUSBHubOverCurrentSiphoning:(id)a3
{
  id v3 = a3;
  id v4 = +[USBCameraKitHubMonitor sharedMonitor];
  [v4 resetOvercurrentSiphoning:v3];
}

- (void)setUSBHubOverCurrentSiphoning:(id)a3
{
  id v3 = a3;
  id v4 = +[USBCameraKitHubMonitor sharedMonitor];
  [v4 setOvercurrentSiphoning:v3];
}

- (void)createSleepAssertionForUUID:(id)a3
{
  id v3 = a3;
  id v4 = +[SleepAssertionManager sharedManager];
  [v4 createSleepAssertionForUUID:v3];
}

- (void)destroySleepAssertionForUUID:(id)a3
{
  id v3 = a3;
  id v4 = +[SleepAssertionManager sharedManager];
  [v4 destroySleepAssertionForUUID:v3];
}

- (void)createEASleepAssertion
{
  id v2 = +[SleepAssertionManager sharedManager];
  [v2 createEASleepAssertion];
}

- (void)removeEASleepAssertion
{
  id v2 = +[SleepAssertionManager sharedManager];
  [v2 removeEASleepAssertion];
}

- (void)createApplePencilSleepAssertion
{
  id v2 = +[SleepAssertionManager sharedManager];
  [v2 createApplePencilSleepAssertion];
}

- (void)removeApplePencilSleepAssertion
{
  id v2 = +[SleepAssertionManager sharedManager];
  [v2 removeApplePencilSleepAssertion];
}

- (void)createMFi4SleepAssertion
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_222C9E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v0, 0x12u);
}

- (void)removeMFi4SleepAssertion
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginIOKit createMFi4SleepAssertion]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_222C9E000, v4, OS_LOG_TYPE_DEFAULT, "ACCPlatformPluginIOKit: removeMFi4SleepAssertion: MFi4 sleep assertion removed", v6, 2u);
  }

  char v5 = +[SleepAssertionManager sharedManager];
  [v5 removeMFi4SleepAssertion];
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (USBFaultMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end