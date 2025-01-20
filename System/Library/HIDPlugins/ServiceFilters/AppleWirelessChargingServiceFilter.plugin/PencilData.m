@interface PencilData
- (BCBatteryDeviceController)batteryController;
- (OS_dispatch_queue)batteryQueue;
- (PencilData)initWithQueue:(id)a3;
- (int64_t)batteryPercentage;
- (void)connectedDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)setBatteryController:(id)a3;
- (void)setBatteryQueue:(id)a3;
@end

@implementation PencilData

- (PencilData)initWithQueue:(id)a3
{
  id v5 = a3;
  v6 = LoggingAWCSF();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[PencilData initWithQueue:]";
    __int16 v23 = 1024;
    int v24 = 61;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s line %d []", buf, 0x12u);
  }

  v7 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/BatteryCenter.framework/BatteryCenter" UTF8String], 1);
  if (!v7)
  {
    v17 = LoggingAWCSF();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_5A94();
    }

    goto LABEL_18;
  }
  v8 = v7;
  Class Class = objc_getClass("BCBatteryDeviceController");
  if (!Class)
  {
    v18 = LoggingAWCSF();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_5B10();
    }

    dlclose(v8);
LABEL_18:

    v12 = 0;
    goto LABEL_19;
  }
  v10 = Class;
  v20.receiver = self;
  v20.super_class = (Class)PencilData;
  v11 = [(PencilData *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_batteryQueue, a3);
    v13 = (BCBatteryDeviceController *)objc_alloc_init(v10);
    batteryController = v12->_batteryController;
    v12->_batteryController = v13;

    v15 = v12->_batteryController;
    if (v15) {
      [(BCBatteryDeviceController *)v15 addBatteryDeviceObserver:v12 queue:v12->_batteryQueue];
    }
    v12->_batteryPercentage = 0;
    v16 = LoggingAWCSF();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[PencilData initWithQueue:]";
      __int16 v23 = 1024;
      int v24 = 95;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%s line %d [Initiation succeeded]", buf, 0x12u);
    }
  }
  dlclose(v8);
LABEL_19:

  return v12;
}

- (void)dealloc
{
  v3 = LoggingAWCSF();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[PencilData dealloc]";
    __int16 v9 = 1024;
    int v10 = 103;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s line %d []", buf, 0x12u);
  }

  batteryController = self->_batteryController;
  if (batteryController) {
    [(BCBatteryDeviceController *)batteryController removeBatteryDeviceObserver:self];
  }
  batteryQueue = self->_batteryQueue;
  self->_batteryQueue = 0;

  v6.receiver = self;
  v6.super_class = (Class)PencilData;
  [(PencilData *)&v6 dealloc];
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_batteryQueue);
  id v5 = LoggingAWCSF();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[PencilData connectedDevicesDidChange:]";
    __int16 v22 = 1024;
    int v23 = 117;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s line %d []", buf, 0x12u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v17;
    *(void *)&long long v8 = 136315650;
    long long v15 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "vendor", v15, (void)v16) == (char *)&dword_0 + 1
          && ([v12 productIdentifier] == &stru_108.reserved1
           || [v12 productIdentifier] == (char *)&stru_420.offset + 2)
          && [v12 accessoryCategory] == (char *)&dword_4 + 3)
        {
          id v13 = [v12 percentCharge];
          if (self->_batteryPercentage != v13)
          {
            v14 = LoggingAWCSF();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              v21 = "-[PencilData connectedDevicesDidChange:]";
              __int16 v22 = 1024;
              int v23 = 129;
              __int16 v24 = 2048;
              id v25 = v13;
              _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%s line %d [percentCharge = %ld]", buf, 0x1Cu);
            }
          }
          self->_batteryPercentage = (int64_t)v13;
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v9);
  }
}

- (BCBatteryDeviceController)batteryController
{
  return self->_batteryController;
}

- (void)setBatteryController:(id)a3
{
}

- (OS_dispatch_queue)batteryQueue
{
  return self->_batteryQueue;
}

- (void)setBatteryQueue:(id)a3
{
}

- (int64_t)batteryPercentage
{
  return self->_batteryPercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryQueue, 0);

  objc_storeStrong((id *)&self->_batteryController, 0);
}

@end