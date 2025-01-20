@interface DeviceStateMonitor
- (DeviceStateMonitor)init;
- (void)_handleSetupAssistantNotification:(id)a3;
@end

@implementation DeviceStateMonitor

- (DeviceStateMonitor)init
{
  v18.receiver = self;
  v18.super_class = (Class)DeviceStateMonitor;
  v2 = [(DeviceStateMonitor *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("com.apple.appstored.DeviceStateMonitor", v3, v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = sem_open("appstored.run-once", 0);
    v8 = v7;
    if (v7 != (sem_t *)-1) {
      sem_close(v7);
    }
    v9 = ASDLogHandleForCategory();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8 == (sem_t *)-1)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Device] First boot. Clearing once per boot items", buf, 2u);
      }

      sub_1003F33A0((uint64_t)AppDefaultsManager, 0);
      v11 = sem_open("appstored.run-once", 512, 256, 0);
      if (v11 != (sem_t *)-1)
      {
        sem_close(v11);
LABEL_14:
        v12 = v2->_dispatchQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10026CD3C;
        block[3] = &unk_100521388;
        v17 = v2;
        dispatch_async(v12, block);

        return v2;
      }
      v9 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v14 = __error();
        v15 = strerror(*v14);
        *(_DWORD *)buf = 136315394;
        v20 = v15;
        __int16 v21 = 2080;
        v22 = "appstored.run-once";
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[Device] Failed to create first-run semaphore: %s sem: %s", buf, 0x16u);
      }
    }
    else if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Device] Starting", buf, 2u);
    }

    goto LABEL_14;
  }
  return v2;
}

- (void)_handleSetupAssistantNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026DF04;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
}

@end