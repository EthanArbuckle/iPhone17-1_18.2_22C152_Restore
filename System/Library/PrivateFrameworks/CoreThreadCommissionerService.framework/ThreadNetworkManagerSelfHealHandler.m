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
  uint32_t v3 = arc4random();
  v4 = sub_1000090D4(1);
  unsigned int v5 = v3 % 0x349 + 600;
  uint64_t v6 = 60 * v5;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v30 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
    __int16 v31 = 1024;
    int v32 = 53;
    __int16 v33 = 2048;
    *(void *)&double v34 = 60 * v5;
    __int16 v35 = 1024;
    LODWORD(v36) = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%d : initiating self heal thread network timer, default waitTime (secs) : %ld, randomWatiTimeInMinutes : %d", buf, 0x22u);
  }

  double v7 = sub_100006C20("SelfHealTimeStamp");
  v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
    __int16 v31 = 1024;
    int v32 = 58;
    __int16 v33 = 2048;
    double v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d : initiating self heal thread network timer, selfHealTimeStamp : %f", buf, 0x1Cu);
  }

  dispatch_time_t v9 = dispatch_time(0, 1000000000 * v6);
  if (v7 != 0.0)
  {
    v10 = +[NSDate date];
    [v10 timeIntervalSince1970];
    double v12 = v11;

    if (v12 <= 1657720000.0)
    {
      v16 = sub_1000090D4(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316162;
        v30 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
        __int16 v31 = 1024;
        int v32 = 82;
        __int16 v33 = 2048;
        double v34 = v12;
        __int16 v35 = 2048;
        uint64_t v36 = 0x41D8B3B330000000;
        __int16 v37 = 2048;
        uint64_t v38 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d : Invalid case : current timestamp :%f is less than default time stamp :%f of self heal thread network timer, default wait time in secs : %ld", buf, 0x30u);
      }
      goto LABEL_12;
    }
    v13 = sub_1000090D4(1);
    double v14 = v7 + 604800.0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
      __int16 v31 = 1024;
      int v32 = 69;
      __int16 v33 = 2048;
      double v34 = v12;
      __int16 v35 = 2048;
      uint64_t v36 = *(void *)&v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s:%d : self heal thread network timer, current time : %f,  next stop to trigger timer : %f ", buf, 0x26u);
    }

    if (v12 < v14)
    {
      double v15 = v14 - v12;
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
      v16 = sub_1000090D4(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v30 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
        __int16 v31 = 1024;
        int v32 = 75;
        __int16 v33 = 2048;
        double v34 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d : current is less than periodicity of self heal thread network timer, wait time in secs : %f", buf, 0x1Cu);
      }
LABEL_12:

      goto LABEL_17;
    }
    dispatch_time_t v9 = dispatch_time(0, 0);
  }
LABEL_17:
  v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v18 = (OS_dispatch_queue *)dispatch_queue_create("selfHeal.ThreadNetwork.Queue", v17);
  selfHealThreadNetworkTimerQueue = self->_selfHealThreadNetworkTimerQueue;
  self->_selfHealThreadNetworkTimerQueue = v18;

  v20 = self->_selfHealThreadNetworkTimerQueue;
  if (!v20)
  {
    v26 = sub_1000090D4(1);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000547C8(v26);
    }

    __assert_rtn("-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]", "ThreadNetworkManager_SelfHealHandler.mm", 91, "false");
  }
  v21 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v20);
  selfHealThreadNetworkTimer = self->_selfHealThreadNetworkTimer;
  self->_selfHealThreadNetworkTimer = v21;

  v23 = self->_selfHealThreadNetworkTimer;
  if (!v23)
  {
    v27 = sub_1000090D4(1);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10005484C();
    }

    __assert_rtn("-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]", "ThreadNetworkManager_SelfHealHandler.mm", 99, "false");
  }
  dispatch_source_set_timer(v23, v9, 0x2260FF9290000uLL, 0);
  v24 = self->_selfHealThreadNetworkTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100009AD4;
  handler[3] = &unk_100074940;
  handler[4] = self;
  dispatch_source_set_event_handler(v24, handler);
  v25 = sub_1000090D4(1);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
    __int16 v31 = 1024;
    int v32 = 114;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s:%d : activating self heal thread network timer", buf, 0x12u);
  }

  dispatch_activate((dispatch_object_t)self->_selfHealThreadNetworkTimer);
}

- (void)selfHealThreadNetworkTimerHandler
{
  v4 = sub_1000090D4(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    dispatch_time_t v9 = "-[ThreadNetworkManagerSelfHealHandler selfHealThreadNetworkTimerHandler]";
    __int16 v10 = 1024;
    int v11 = 122;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%d: Self heal thread network timer handler", (uint8_t *)&v8, 0x12u);
  }

  unsigned int v5 = +[THThreadNetworkCredentialsKeychainBackingStore defaultBackingStore];
  id v6 = [[THThreadNetworkCredentialsStoreLocalClient alloc] initApplePrivateStoreWithBackingStore:v5];
  if (v6)
  {
    [(ThreadNetworkManagerSelfHealHandler *)self cleanUpThreadKeychainEntries];
    double v7 = sub_1000090D4(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      dispatch_time_t v9 = "-[ThreadNetworkManagerSelfHealHandler selfHealThreadNetworkTimerHandler]";
      __int16 v10 = 1024;
      int v11 = 140;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%d: Self heal thread network timer handler Done", (uint8_t *)&v8, 0x12u);
    }
  }
  else
  {
    double v7 = sub_1000090D4(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000548D8();
    }
  }
}

- (void)cleanUpThreadKeychainEntries
{
  v2 = sub_1000090D4(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[ThreadNetworkManagerSelfHealHandler cleanUpThreadKeychainEntries]";
    __int16 v9 = 1024;
    int v10 = 146;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:%d: Starting the cleanup for thread keychain database", (uint8_t *)&v7, 0x12u);
  }

  uint32_t v3 = +[THThreadNetworkCredentialsKeychainBackingStore defaultBackingStore];
  id v4 = [[THThreadNetworkCredentialsStoreLocalClient alloc] initApplePrivateStoreWithBackingStore:v3];
  unsigned int v5 = v4;
  if (v4)
  {
    [v4 cleanThreadKeychainDatabase:&stru_100074980];
  }
  else
  {
    id v6 = sub_1000090D4(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100054964(v6);
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

@end