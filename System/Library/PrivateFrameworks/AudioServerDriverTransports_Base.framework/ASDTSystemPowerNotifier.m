@interface ASDTSystemPowerNotifier
+ (id)notifierForBundleName:(id)a3 delegate:(id)a4 earlyWake:(BOOL)a5;
- (ASDTSystemPowerNotifierDelegate)delegate;
- (BOOL)allowSleepStateNotification:(int)a3;
- (BOOL)registerForSystemSleepNotificationsSystemPower;
- (BOOL)systemIsSleeping;
- (BOOL)wakeForEarlyWake;
- (NSString)bundleName;
- (OS_dispatch_queue)powerNotificationQueue;
- (id)initForBundleName:(id)a3 delegate:(id)a4 earlyWake:(BOOL)a5;
- (void)dealloc;
- (void)deregisterForSystemSleepNotificationsSystemPower;
- (void)handlePowerNotificationWithMessageType:(unsigned int)a3 andArgument:(void *)a4;
- (void)registerForSystemSleepNotificationsSystemPower;
- (void)setBundleName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPowerNotificationQueue:(id)a3;
- (void)setSystemIsSleeping:(BOOL)a3;
- (void)setWakeForEarlyWake:(BOOL)a3;
@end

@implementation ASDTSystemPowerNotifier

+ (id)notifierForBundleName:(id)a3 delegate:(id)a4 earlyWake:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = [[ASDTSystemPowerNotifier alloc] initForBundleName:v7 delegate:v8 earlyWake:v5];

  return v9;
}

- (id)initForBundleName:(id)a3 delegate:(id)a4 earlyWake:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)ASDTSystemPowerNotifier;
  v10 = [(ASDTSystemPowerNotifier *)&v22 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_5;
  }
  [(ASDTSystemPowerNotifier *)v10 setBundleName:v8];
  [(ASDTSystemPowerNotifier *)v11 setDelegate:v9];
  if (!v8 || !v9)
  {
    v20 = ASDTBaseLogType();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ASDTSystemPowerNotifier initForBundleName:delegate:earlyWake:](v20);
    }

    goto LABEL_9;
  }
  [(ASDTSystemPowerNotifier *)v11 setWakeForEarlyWake:v5];
  v12 = NSString;
  v13 = [(ASDTSystemPowerNotifier *)v11 bundleName];
  v14 = [v12 stringWithFormat:@"%@.PowerNotification", v13];

  v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INTERACTIVE, 0);

  id v17 = v14;
  dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], v16);
  [(ASDTSystemPowerNotifier *)v11 setPowerNotificationQueue:v18];

  LOBYTE(v18) = [(ASDTSystemPowerNotifier *)v11 registerForSystemSleepNotificationsSystemPower];
  if ((v18 & 1) == 0)
  {
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
LABEL_5:
  v19 = v11;
LABEL_10:

  return v19;
}

- (void)dealloc
{
  [(ASDTSystemPowerNotifier *)self deregisterForSystemSleepNotificationsSystemPower];
  v3.receiver = self;
  v3.super_class = (Class)ASDTSystemPowerNotifier;
  [(ASDTSystemPowerNotifier *)&v3 dealloc];
}

- (BOOL)allowSleepStateNotification:(int)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
      v4 = [(ASDTSystemPowerNotifier *)self delegate];
      char v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) == 0) {
        return 1;
      }
      v6 = [(ASDTSystemPowerNotifier *)self delegate];
      char v7 = [v6 allowSystemSleep];

      return v7;
    case 1:
      BOOL v8 = [(ASDTSystemPowerNotifier *)self systemIsSleeping];
      id v9 = ASDTBaseLogType();
      v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          [(ASDTSystemPowerNotifier *)self bundleName];
          objc_claimAutoreleasedReturnValue();
          -[ASDTSystemPowerNotifier allowSleepStateNotification:]();
        }
        goto LABEL_7;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(ASDTSystemPowerNotifier *)self bundleName];
        int v18 = 138412290;
        v19 = v15;
        _os_log_impl(&dword_2489BC000, v10, OS_LOG_TYPE_DEFAULT, "%@: Sleeping.", (uint8_t *)&v18, 0xCu);
      }
      [(ASDTSystemPowerNotifier *)self setSystemIsSleeping:1];
      v16 = [(ASDTSystemPowerNotifier *)self delegate];
      [v16 systemWillSleep];

      return 1;
    case 2:
      if ([(ASDTSystemPowerNotifier *)self wakeForEarlyWake]) {
        goto LABEL_9;
      }
      return 1;
    case 3:
LABEL_9:
      BOOL v11 = [(ASDTSystemPowerNotifier *)self systemIsSleeping];
      v12 = ASDTBaseLogType();
      v10 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [(ASDTSystemPowerNotifier *)self bundleName];
          int v18 = 138412290;
          v19 = v13;
          _os_log_impl(&dword_2489BC000, v10, OS_LOG_TYPE_DEFAULT, "%@: Waking.", (uint8_t *)&v18, 0xCu);
        }
        [(ASDTSystemPowerNotifier *)self setSystemIsSleeping:0];
        v14 = [(ASDTSystemPowerNotifier *)self delegate];
        [v14 systemHasPoweredOn];
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          [(ASDTSystemPowerNotifier *)self bundleName];
          objc_claimAutoreleasedReturnValue();
          -[ASDTSystemPowerNotifier allowSleepStateNotification:]();
        }
LABEL_7:
      }
      break;
    default:
      return 1;
  }
  return 1;
}

- (void)handlePowerNotificationWithMessageType:(unsigned int)a3 andArgument:(void *)a4
{
  HIDWORD(v5) = a3;
  LODWORD(v5) = a3 + 536870288;
  switch((v5 >> 4))
  {
    case 0u:
      BOOL v7 = [(ASDTSystemPowerNotifier *)self allowSleepStateNotification:0];
      io_connect_t powerConnection = self->_powerConnection;
      if (v7) {
        goto LABEL_10;
      }
      IOCancelPowerChange(powerConnection, (intptr_t)a4);
      break;
    case 1u:
      [(ASDTSystemPowerNotifier *)self allowSleepStateNotification:1];
      io_connect_t powerConnection = self->_powerConnection;
LABEL_10:
      IOAllowPowerChange(powerConnection, (intptr_t)a4);
      break;
    case 2u:
      return;
    case 9u:
      uint64_t v10 = 3;
      goto LABEL_15;
    case 0xBu:
      uint64_t v10 = 2;
LABEL_15:
      [(ASDTSystemPowerNotifier *)self allowSleepStateNotification:v10];
      break;
    default:
      id v9 = ASDTBaseLogType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        [(ASDTSystemPowerNotifier *)self bundleName];
        objc_claimAutoreleasedReturnValue();
        -[ASDTSystemPowerNotifier handlePowerNotificationWithMessageType:andArgument:]();
      }

      break;
  }
}

- (BOOL)registerForSystemSleepNotificationsSystemPower
{
  p_powerNotificationPort = &self->_powerNotificationPort;
  p_powerNotifier = &self->_powerNotifier;
  io_connect_t v5 = IORegisterForSystemPower(self, &self->_powerNotificationPort, (IOServiceInterestCallback)ASDTSystemPowerInterestCallback, &self->_powerNotifier);
  self->_io_connect_t powerConnection = v5;
  if (v5 && *p_powerNotificationPort && *p_powerNotifier)
  {
    IONotificationPortSetDispatchQueue(*p_powerNotificationPort, (dispatch_queue_t)self->_powerNotificationQueue);
    return 1;
  }
  else
  {
    BOOL v7 = ASDTBaseLogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(ASDTSystemPowerNotifier *)self bundleName];
      objc_claimAutoreleasedReturnValue();
      -[ASDTSystemPowerNotifier registerForSystemSleepNotificationsSystemPower]();
    }

    return 0;
  }
}

- (void)deregisterForSystemSleepNotificationsSystemPower
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = ASDTBaseLogType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(ASDTSystemPowerNotifier *)self bundleName];
    int v7 = 138412290;
    BOOL v8 = v4;
    _os_log_impl(&dword_2489BC000, v3, OS_LOG_TYPE_DEFAULT, "%@: Deregistered for system sleep notifications", (uint8_t *)&v7, 0xCu);
  }
  if (self->_powerNotifier)
  {
    IODeregisterForSystemPower(&self->_powerNotifier);
    self->_powerNotifier = 0;
  }
  powerNotificationPort = self->_powerNotificationPort;
  if (powerNotificationPort)
  {
    IONotificationPortDestroy(powerNotificationPort);
    self->_powerNotificationPort = 0;
  }
  io_connect_t powerConnection = self->_powerConnection;
  if (powerConnection)
  {
    IOServiceClose(powerConnection);
    self->_io_connect_t powerConnection = 0;
  }
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
}

- (ASDTSystemPowerNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASDTSystemPowerNotifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)wakeForEarlyWake
{
  return self->_wakeForEarlyWake;
}

- (void)setWakeForEarlyWake:(BOOL)a3
{
  self->_wakeForEarlyWake = a3;
}

- (OS_dispatch_queue)powerNotificationQueue
{
  return self->_powerNotificationQueue;
}

- (void)setPowerNotificationQueue:(id)a3
{
}

- (BOOL)systemIsSleeping
{
  return self->_systemIsSleeping;
}

- (void)setSystemIsSleeping:(BOOL)a3
{
  self->_systemIsSleeping = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerNotificationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleName, 0);
}

- (void)initForBundleName:(os_log_t)log delegate:earlyWake:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "ASDTSystemPowerNotifier: Invalid arguments.", v1, 2u);
}

- (void)allowSleepStateNotification:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(v1, v2, 5.7779e-34);
  _os_log_debug_impl(&dword_2489BC000, v3, OS_LOG_TYPE_DEBUG, "%@: Already asleep.", v4, 0xCu);
}

- (void)allowSleepStateNotification:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(v1, v2, 5.7779e-34);
  _os_log_debug_impl(&dword_2489BC000, v3, OS_LOG_TYPE_DEBUG, "%@: Already awake.", v4, 0xCu);
}

- (void)handlePowerNotificationWithMessageType:andArgument:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(v1, v2, 5.778e-34);
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = v4;
  _os_log_debug_impl(&dword_2489BC000, v6, OS_LOG_TYPE_DEBUG, "%@: Unexpected power notification: %u", v5, 0x12u);
}

- (void)registerForSystemSleepNotificationsSystemPower
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(v1, v2, 5.7779e-34);
  _os_log_error_impl(&dword_2489BC000, v3, OS_LOG_TYPE_ERROR, "%@: Failed failed to register for system power notifications.", v4, 0xCu);
}

@end