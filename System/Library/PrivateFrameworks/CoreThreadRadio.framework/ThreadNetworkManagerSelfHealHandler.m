@interface ThreadNetworkManagerSelfHealHandler
- (OS_dispatch_queue)selfHealThreadNetworkTimerQueue;
- (OS_dispatch_source)selfHealThreadNetworkTimer;
- (ThreadNetworkManagerSelfHealHandler)init;
- (void)cleanUpThreadKeychainEntries;
- (void)initSelfHealThreadNetworkTimer;
- (void)selfHealThreadNetworkTimerHandler;
- (void)setSelfHealThreadNetworkTimer:(id)a3;
- (void)setSelfHealThreadNetworkTimerQueue:(id)a3;
@end

@implementation ThreadNetworkManagerSelfHealHandler

- (ThreadNetworkManagerSelfHealHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)ThreadNetworkManagerSelfHealHandler;
  return [(ThreadNetworkManagerSelfHealHandler *)&v3 init];
}

- (void)initSelfHealThreadNetworkTimer
{
  v1[0] = 136315394;
  OUTLINED_FUNCTION_18();
  *(_DWORD *)((char *)&v1[3] + 2) = 98;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d Failed to create self heal thread network timer , unexpected scenario, asserting...", (uint8_t *)v1, 0x12u);
}

void __69__ThreadNetworkManagerSelfHealHandler_initSelfHealThreadNetworkTimer__block_invoke(uint64_t a1)
{
  v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  double v4 = v3;

  v5 = ThreadNetworkLoggingCategory(1u);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    v7 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 105;
    __int16 v10 = 2048;
    double v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Self heal thread network timer triggered : Timer Triggered timestamp :%f", (uint8_t *)&v6, 0x1Cu);
  }

  if (v4 > 1657720000.0 && saveDoubleValue("SelfHealTimeStamp", v4)) {
    [*(id *)(a1 + 32) selfHealThreadNetworkTimerHandler];
  }
}

- (void)selfHealThreadNetworkTimerHandler
{
  v1[0] = 136315394;
  OUTLINED_FUNCTION_18();
  *(_DWORD *)((char *)&v1[3] + 2) = 128;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d: keychain store is nil", (uint8_t *)v1, 0x12u);
}

- (void)cleanUpThreadKeychainEntries
{
  int v1 = 136315138;
  v2 = "-[ThreadNetworkManagerSelfHealHandler cleanUpThreadKeychainEntries]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : keychain is nil, exit now", (uint8_t *)&v1, 0xCu);
}

void __67__ThreadNetworkManagerSelfHealHandler_cleanUpThreadKeychainEntries__block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    double v3 = ThreadNetworkLoggingCategory(1u);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67__ThreadNetworkManagerSelfHealHandler_cleanUpThreadKeychainEntries__block_invoke_cold_1();
    }
  }
  else
  {
    double v3 = ThreadNetworkLoggingCategory(1u);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315394;
      v5 = "-[ThreadNetworkManagerSelfHealHandler cleanUpThreadKeychainEntries]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 159;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:  Cleaned up the keychain database successfully.", (uint8_t *)&v4, 0x12u);
    }
  }
}

- (OS_dispatch_source)selfHealThreadNetworkTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSelfHealThreadNetworkTimer:(id)a3
{
}

- (OS_dispatch_queue)selfHealThreadNetworkTimerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSelfHealThreadNetworkTimerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfHealThreadNetworkTimerQueue, 0);

  objc_storeStrong((id *)&self->_selfHealThreadNetworkTimer, 0);
}

void __67__ThreadNetworkManagerSelfHealHandler_cleanUpThreadKeychainEntries__block_invoke_cold_1()
{
  *(_DWORD *)v2 = 136315650;
  OUTLINED_FUNCTION_18();
  *(_DWORD *)&v2[7] = 161;
  v2[9] = 2112;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s:%d:  Failed to cleanup the keychain database, error = %@.", (uint8_t *)v2, 0x1Cu);
}

@end