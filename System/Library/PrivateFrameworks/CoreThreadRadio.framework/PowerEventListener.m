@interface PowerEventListener
- (BOOL)registerForEvents;
- (BOOL)willSleep;
- (PowerEventListener)initWithDelegate:(id)a3 queue:(id)a4;
- (id)delegate;
- (void)_powerNotificationMessage:(unsigned int)a3 argument:(void *)a4;
- (void)allowSleep;
- (void)dealloc;
- (void)registerForEvents;
- (void)unregisterForEvents;
@end

@implementation PowerEventListener

- (PowerEventListener)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PowerEventListener;
  v8 = [(PowerEventListener *)&v20 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_23;
  }
  objc_storeWeak(&v8->_delegate, v6);
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  if (v7)
  {
    dispatch_queue_t v11 = dispatch_queue_create_with_target_V2("wpantund.PowerEventListener.Queue", v10, v7);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v11;

    v13 = log_get_logging_obg("com.apple.threadradiod", "default");
    if (v13)
    {
      if (!syslog_is_the_mask_enabled(6) || !os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_WORD *)buf = 0;
      v14 = "PowerEventListener: Cretaed WQ with Target Q";
      goto LABEL_11;
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
LABEL_15:
    -[PowerEventHandler_Rcp init:]();
    goto LABEL_16;
  }
  dispatch_queue_t v15 = dispatch_queue_create("wpantund.PowerEventListener.Queue", v10);
  v16 = v9->_workQueue;
  v9->_workQueue = (OS_dispatch_queue *)v15;

  v13 = log_get_logging_obg("com.apple.threadradiod", "default");
  if (!v13)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (!syslog_is_the_mask_enabled(6) || !os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
    goto LABEL_16;
  }
  *(_WORD *)buf = 0;
  v14 = "PowerEventListener: Cretaed new WQ";
LABEL_11:
  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, buf, 2u);
LABEL_16:

  v17 = log_get_logging_obg("com.apple.threadradiod", "default");
  if (v17)
  {
    if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = v9->_workQueue;
      *(_DWORD *)buf = 138412546;
      v22 = v7;
      __int16 v23 = 2112;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "PowerEventListener: Init with Queue: %@: rootQueue: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    -[PowerEventHandler_Rcp init:]();
  }

LABEL_23:
  return v9;
}

- (void)dealloc
{
  [(PowerEventListener *)self unregisterForEvents];
  v3.receiver = self;
  v3.super_class = (Class)PowerEventListener;
  [(PowerEventListener *)&v3 dealloc];
}

- (id)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&v2->_delegate);
  objc_sync_exit(v2);

  return WeakRetained;
}

- (BOOL)registerForEvents
{
  if (self->_powerNotificationConnection) {
    return 1;
  }
  io_connect_t v4 = IORegisterForSystemPower(self, &self->_powerNotificationPort, (IOServiceInterestCallback)_PowerEventListenerSystemPowerChanged, &self->_powerNotificationNotifier);
  self->_powerNotificationConnection = v4;
  BOOL v5 = v4 != 0;
  if (v4)
  {
    IONotificationPortSetDispatchQueue(self->_powerNotificationPort, (dispatch_queue_t)self->_workQueue);
    id v6 = log_get_logging_obg("com.apple.threadradiod", "default");
    if (v6)
    {
      if (syslog_is_the_mask_enabled(6))
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "PowerEventListener: Success to register for PM notifications", v7, 2u);
        }
      }
      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
LABEL_8:

    return v5;
  }
  id v6 = log_get_logging_obg("com.apple.threadradiod", "default");
  if (v6)
  {
    if (syslog_is_the_mask_enabled(3) && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[PowerEventListener registerForEvents](v6);

      return v5;
    }
    goto LABEL_8;
  }
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    goto LABEL_8;
  }
LABEL_16:
  -[PowerEventHandler_Rcp init:]();

  return v5;
}

- (void)unregisterForEvents
{
  if (self->_powerNotificationConnection)
  {
    IODeregisterForSystemPower(&self->_powerNotificationNotifier);
    IONotificationPortDestroy(self->_powerNotificationPort);
    IOServiceClose(self->_powerNotificationConnection);
    self->_powerNotificationConnection = 0;
  }
}

- (void)_powerNotificationMessage:(unsigned int)a3 argument:(void *)a4
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
      v7 = log_get_logging_obg("com.apple.threadradiod", "default");
      if (v7)
      {
        if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PowerEventListener: Can Sleep Msg", buf, 2u);

          uint64_t v8 = IOAllowPowerChange(self->_powerNotificationConnection, (intptr_t)a4);
          if (!v8) {
            return;
          }
LABEL_26:
          uint64_t v14 = v8;
          v10 = log_get_logging_obg("com.apple.threadradiod", "default");
          if (v10)
          {
            if (syslog_is_the_mask_enabled(4))
            {
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
                -[PowerEventListener _powerNotificationMessage:argument:](v14, v10, v15, v16, v17, v18, v19, v20);
              }
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            -[PowerEventHandler_Rcp init:]();
          }
          goto LABEL_48;
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        -[PowerEventHandler_Rcp init:]();

        uint64_t v8 = IOAllowPowerChange(self->_powerNotificationConnection, (intptr_t)a4);
        if (!v8) {
          return;
        }
        goto LABEL_26;
      }

      uint64_t v8 = IOAllowPowerChange(self->_powerNotificationConnection, (intptr_t)a4);
      if (v8) {
        goto LABEL_26;
      }
      return;
    case 1u:
      v9 = log_get_logging_obg("com.apple.threadradiod", "default");
      if (v9)
      {
        if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PowerEventListener: Will Sleep Msg", v32, 2u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        -[PowerEventHandler_Rcp init:]();
      }

      sendApStateNotification();
      uint64_t v21 = IOAllowPowerChange(self->_powerNotificationConnection, (intptr_t)a4);
      if (!v21) {
        return;
      }
      uint64_t v22 = v21;
      v10 = log_get_logging_obg("com.apple.threadradiod", "default");
      if (v10)
      {
        if (syslog_is_the_mask_enabled(4) && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[PowerEventListener _powerNotificationMessage:argument:].cold.5(v22, v10, v23, v24, v25, v26, v27, v28);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        -[PowerEventHandler_Rcp init:]();
      }
      goto LABEL_48;
    case 2u:
      v10 = log_get_logging_obg("com.apple.threadradiod", "default");
      if (v10)
      {
        if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          __int16 v31 = 0;
          dispatch_queue_t v11 = "PowerEventListener: Will Not Sleep Msg";
          v12 = (uint8_t *)&v31;
          goto LABEL_23;
        }
        goto LABEL_48;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      goto LABEL_38;
    case 9u:
      sendApStateNotification();
      v13 = log_get_logging_obg("com.apple.threadradiod", "default");
      if (v13)
      {
        if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "PowerEventListener: Has Powered On Msg, and wake reason as below:", v29, 2u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        -[PowerEventHandler_Rcp init:]();
      }

      v10 = [(PowerEventListener *)self delegate];
      [v10 powerEventListenerSystemPoweredOn_Rcp:self];
      goto LABEL_48;
    case 0xBu:
      v10 = log_get_logging_obg("com.apple.threadradiod", "default");
      if (v10)
      {
        if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v30 = 0;
          dispatch_queue_t v11 = "PowerEventListener: Will Power On Msg";
          v12 = v30;
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
LABEL_38:
        -[PowerEventHandler_Rcp init:]();
      }
LABEL_48:

      return;
    default:
      return;
  }
}

- (void)allowSleep
{
}

- (BOOL)willSleep
{
  return self->_willSleep;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak(&self->_delegate);
}

- (void)registerForEvents
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PowerEventListener: Failed to register for PM notifications", v1, 2u);
}

- (void)_powerNotificationMessage:(uint64_t)a3 argument:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, a2, a3, "In CanSleep, returned %x", a5, a6, a7, a8, 0);
}

- (void)_powerNotificationMessage:(uint64_t)a3 argument:(uint64_t)a4 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, a2, a3, "In WillSleep, IOAllowPowerChange returned %x", a5, a6, a7, a8, 0);
}

@end