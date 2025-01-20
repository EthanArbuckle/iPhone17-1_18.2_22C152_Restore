@interface ACXDeviceManager
+ (id)sharedManager;
- (ACXDevice)activePairedDevice;
- (ACXDeviceManager)init;
- (ACXDeviceManagerDelegate)delegate;
- (ACXIDSMessaging)currentMessagingService;
- (ACXIDSMessaging)legacyMessagingService;
- (NSArray)allDevices;
- (NSMutableDictionary)devices;
- (OS_dispatch_queue)internalQueue;
- (id)currentActivePairedDevice;
- (id)deviceForIDSIdentifier:(id)a3;
- (id)deviceForNRDevice:(id)a3;
- (id)deviceForPairingID:(id)a3;
- (void)setActivePairedDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLegacyMessagingService:(id)a3 currentMessagingService:(id)a4;
- (void)updatedIDSDevices:(id)a3 forMessager:(id)a4;
@end

@implementation ACXDeviceManager

+ (id)sharedManager
{
  if (qword_1000A55C0 != -1) {
    dispatch_once(&qword_1000A55C0, &stru_10008DC68);
  }
  v2 = (void *)qword_1000A55B8;

  return v2;
}

- (ACXDeviceManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ACXDeviceManager;
  v2 = [(ACXDeviceManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    devices = v2->_devices;
    v2->_devices = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.appconduitd.ACXDeviceManager.internal", v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)setLegacyMessagingService:(id)a3 currentMessagingService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ACXDeviceManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C47C;
  block[3] = &unk_10008CA40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (id)currentActivePairedDevice
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_10003C628;
  id v12 = sub_10003C638;
  id v13 = 0;
  uint64_t v3 = [(ACXDeviceManager *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C640;
  v7[3] = &unk_10008C950;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v3, v7);

  v4 = (void *)v9[5];
  if (!v4)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3)
    {
      v4 = 0;
    }
    else
    {
      MOLogWrite();
      v4 = (void *)v9[5];
    }
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)deviceForIDSIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_10003C628;
  v17 = sub_10003C638;
  id v18 = 0;
  id v5 = [(ACXDeviceManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C820;
  block[3] = &unk_10008CA18;
  id v12 = &v13;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(v5, block);

  id v7 = (void *)v14[5];
  if (!v7)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3)
    {
      id v7 = 0;
    }
    else
    {
      MOLogWrite();
      id v7 = (void *)v14[5];
    }
  }
  id v8 = v7;

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)deviceForPairingID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_10003C628;
  v17 = sub_10003C638;
  id v18 = 0;
  id v5 = [(ACXDeviceManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CA1C;
  block[3] = &unk_10008CA68;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  dispatch_sync(v5, block);

  id v7 = (void *)v14[5];
  if (!v7)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3)
    {
      id v7 = 0;
    }
    else
    {
      MOLogWrite();
      id v7 = (void *)v14[5];
    }
  }
  id v8 = v7;

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)deviceForNRDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForProperty:NRDevicePropertyPairingID];
  if (v5)
  {
    id v6 = [(ACXDeviceManager *)self deviceForPairingID:v5];
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    id v6 = 0;
  }

  return v6;
}

- (NSArray)allDevices
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10003C628;
  id v11 = sub_10003C638;
  id v12 = 0;
  uint64_t v3 = [(ACXDeviceManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003CD2C;
  v6[3] = &unk_10008C950;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)updatedIDSDevices:(id)a3 forMessager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXDeviceManager *)self internalQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003CE6C;
  v11[3] = &unk_10008CA40;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  sub_100006BB8(v8, v11);
}

- (ACXDeviceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACXDeviceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (ACXDevice)activePairedDevice
{
  return self->_activePairedDevice;
}

- (void)setActivePairedDevice:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (ACXIDSMessaging)legacyMessagingService
{
  return self->_legacyMessagingService;
}

- (ACXIDSMessaging)currentMessagingService
{
  return self->_currentMessagingService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMessagingService, 0);
  objc_storeStrong((id *)&self->_legacyMessagingService, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_activePairedDevice, 0);
  objc_storeStrong((id *)&self->_devices, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end