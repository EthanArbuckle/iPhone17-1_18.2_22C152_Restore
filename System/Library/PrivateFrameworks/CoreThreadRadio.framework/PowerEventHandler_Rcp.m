@interface PowerEventHandler_Rcp
- (id)init:(id)a3;
- (void)powerEventListenerSystemPoweredOn_Rcp:(id)a3;
@end

@implementation PowerEventHandler_Rcp

- (id)init:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PowerEventHandler_Rcp;
  v5 = [(PowerEventHandler_Rcp *)&v12 init];
  if (v5)
  {
    v6 = [[PowerEventListener alloc] initWithDelegate:v5 queue:v4];
    v7 = (void *)powerEventListener;
    powerEventListener = (uint64_t)v6;

    v8 = log_get_logging_obg("com.apple.threadradiod", "default");
    if (v8)
    {
      if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "PowerEventHandler_Rcp: Init", buf, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      -[PowerEventHandler_Rcp init:]();
    }

    unsigned int v9 = [(id)powerEventListener registerForEvents];
    v10 = log_get_logging_obg("com.apple.threadradiod", "default");
    if (v10)
    {
      if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PowerEventHandler_Rcp: registerForEvents: %d", buf, 8u);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      -[PowerEventHandler_Rcp init:]();
    }
  }
  return v5;
}

- (void)powerEventListenerSystemPoweredOn_Rcp:(id)a3
{
  v3 = dispatch_get_current_queue();
  id v4 = log_get_logging_obg("com.apple.threadradiod", "default");
  if (v4)
  {
    if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[PWR_EVT]powerEventListenerSystemPoweredOn: Received SystemHasPoweredOn on Q: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    -[PowerEventHandler_Rcp init:]();
  }

  findWakeReason_Rcp();
}

- (void)init:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v0, "Logging1 Module is not defined for SubSystem: %s, Category: %s", v1, v2, v3, v4, 2u);
}

@end