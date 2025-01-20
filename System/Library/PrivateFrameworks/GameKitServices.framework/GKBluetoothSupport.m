@interface GKBluetoothSupport
+ (Class)_bluetoothManagerClass;
+ (int)_determineBluetoothStatus;
+ (int)_directBTStatus;
+ (int)bluetoothStatus;
+ (void)_btPowerStateChanged:(id)a3;
+ (void)_determineBluetoothStatus;
+ (void)cleanup;
+ (void)turnBluetoothOn;
@end

@implementation GKBluetoothSupport

+ (int)bluetoothStatus
{
  int result = __bluetoothStatus;
  if (!__bluetoothStatus)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      __bluetoothStatus = [a1 _determineBluetoothStatus];
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__GKBluetoothSupport_bluetoothStatus__block_invoke;
      block[3] = &unk_2645B7C20;
      block[4] = a1;
      dispatch_sync(MEMORY[0x263EF83A0], block);
    }
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v5 = *MEMORY[0x263F2B980];
    [v4 addObserver:a1 selector:sel__btPowerStateChanged_ name:*MEMORY[0x263F2B980] object:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", a1, sel__btPowerStateChanged_, v5, 0);
    return __bluetoothStatus;
  }
  return result;
}

uint64_t __37__GKBluetoothSupport_bluetoothStatus__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _determineBluetoothStatus];
  __bluetoothStatus = result;
  return result;
}

+ (void)cleanup
{
  __bluetoothStatus = 0;
}

+ (void)turnBluetoothOn
{
  v2 = objc_msgSend((id)objc_msgSend(a1, "_bluetoothManagerClass"), "sharedInstance");
  [v2 setPowered:1];
}

+ (Class)_bluetoothManagerClass
{
  return (Class)objc_opt_class();
}

+ (int)_determineBluetoothStatus
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend((id)objc_msgSend(a1, "_bluetoothManagerClass"), "sharedInstance");
  if (v3)
  {
    v4 = v3;
    if ([v3 available])
    {
      uint64_t v5 = [v4 localDeviceSupportsService:2048];
      if (v5 != -1)
      {
        if (v5)
        {
          int v13 = [v4 powered];
          if (v13) {
            int v6 = 5;
          }
          else {
            int v6 = 4;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              v16 = @"OFF";
              int v18 = 136315906;
              uint64_t v19 = v14;
              __int16 v20 = 2080;
              v21 = "+[GKBluetoothSupport _determineBluetoothStatus]";
              if (v13) {
                v16 = @"ON";
              }
              __int16 v22 = 1024;
              int v23 = 142;
              __int16 v24 = 2112;
              v25 = v16;
              _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d determined bluetooth is %@", (uint8_t *)&v18, 0x26u);
            }
          }
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
              +[GKBluetoothSupport _determineBluetoothStatus].cold.4();
            }
          }
          return 1;
        }
        return v6;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        int v6 = 3;
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          +[GKBluetoothSupport _determineBluetoothStatus].cold.5();
        }
        return v6;
      }
      return 3;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        +[GKBluetoothSupport _determineBluetoothStatus].cold.6();
      }
    }
    return 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        +[GKBluetoothSupport _determineBluetoothStatus];
      }
    }
    int v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_bluetoothManagerClass"), "lastInitError");
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v9 == 9)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          +[GKBluetoothSupport _determineBluetoothStatus]();
        }
      }
      return 2;
    }
    else
    {
      if (ErrorLogLevelForModule < 3) {
        return 3;
      }
      int v6 = 3;
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        +[GKBluetoothSupport _determineBluetoothStatus];
      }
    }
  }
  return v6;
}

+ (void)_btPowerStateChanged:(id)a3
{
  if (![MEMORY[0x263F08B88] isMainThread])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__GKBluetoothSupport__btPowerStateChanged___block_invoke;
    block[3] = &unk_2645B7C20;
    block[4] = a1;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    if (!__bluetoothStatus) {
      return;
    }
    goto LABEL_5;
  }
  __bluetoothStatus = [a1 _determineBluetoothStatus];
  if (__bluetoothStatus) {
LABEL_5:
  }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"GKBluetoothPowerStatusChangedNotification", a1, objc_msgSend(a3, "userInfo"));
}

uint64_t __43__GKBluetoothSupport__btPowerStateChanged___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _determineBluetoothStatus];
  __bluetoothStatus = result;
  return result;
}

+ (int)_directBTStatus
{
  return __bluetoothStatus;
}

+ (void)_determineBluetoothStatus
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d BT not available - try again later.", v2, v3, v4, v5, v6);
}

@end