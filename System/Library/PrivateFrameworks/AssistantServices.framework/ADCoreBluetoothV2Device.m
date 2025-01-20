@interface ADCoreBluetoothV2Device
- (ADCoreBluetoothV2Device)initWithAddress:(id)a3 cbuuid:(id)a4 dataSource:(id)a5;
- (ADCoreBluetoothV2Device)initWithAddress:(id)a3 dataSource:(id)a4;
- (ADCoreBluetoothV2Device)initWithDeviceUID:(id)a3 dataSource:(id)a4;
- (id)_deviceInfo;
- (id)_inEarDetectionStateFromCBDevice:(id)a3;
- (id)address;
- (id)cbuuid;
- (id)deviceInfo;
- (id)identifier;
- (int64_t)_headphoneListeningModeFromDevice:(id)a3;
- (int64_t)_inEarStatusFromDevicePlacement:(int)a3;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_invalidate;
- (void)_updateDevice:(id)a3;
- (void)_updateDeviceInfo:(id)a3;
- (void)addObserver:(id)a3;
- (void)fetchCBUIIDWithCompletion:(id)a3;
- (void)getConversationAwareness:(id)a3;
- (void)getDeviceInfo:(id)a3;
- (void)getHeadGestures:(id)a3;
- (void)getHeadphoneInEarDetectionState:(id)a3;
- (void)getHeadphoneListeningMode:(id)a3;
- (void)getPersonalVolume:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4;
- (void)setHeadGestures:(BOOL)a3 completion:(id)a4;
- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4;
- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4;
- (void)updateDevice:(id)a3;
@end

@implementation ADCoreBluetoothV2Device

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_cbuuid, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_aadQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (id)_inEarDetectionStateFromCBDevice:(id)a3
{
  v4 = [a3 coreBluetoothDevice];
  id v5 = [v4 primaryPlacement];
  id v6 = [v4 secondaryPlacement];
  unsigned int v7 = [v4 primaryBudSide];
  int64_t v8 = [(ADCoreBluetoothV2Device *)self _inEarStatusFromDevicePlacement:v5];
  int64_t v9 = [(ADCoreBluetoothV2Device *)self _inEarStatusFromDevicePlacement:v6];
  if (v7 == 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2 * (v7 == 2);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100239584;
  v13[3] = &unk_100507958;
  int v14 = (int)v5;
  v13[4] = v8;
  v13[5] = v9;
  v13[6] = v10;
  id v11 = [objc_alloc((Class)AFBluetoothHeadphoneInEarDetectionState) initWithBuilder:v13];

  return v11;
}

- (int64_t)_headphoneListeningModeFromDevice:(id)a3
{
  v3 = [a3 coreBluetoothDevice];
  uint64_t v4 = [v3 listeningMode] - 1;
  if (v4 >= 4) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = v4 + 2;
  }

  return v5;
}

- (int64_t)_inEarStatusFromDevicePlacement:(int)a3
{
  if ((a3 - 1) > 5) {
    return 1;
  }
  else {
    return qword_1003E2C68[a3 - 1];
  }
}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  if (observers)
  {
    id v6 = [(NSHashTable *)observers setRepresentation];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100239718;
    v7[3] = &unk_100507938;
    id v8 = v4;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

- (void)_updateDeviceInfo:(id)a3
{
  id v4 = (AFBluetoothDeviceInfo *)a3;
  deviceInfo = self->_deviceInfo;
  if (deviceInfo != v4 && ([(AFBluetoothDeviceInfo *)deviceInfo isEqual:v4] & 1) == 0)
  {
    id v6 = self->_deviceInfo;
    unsigned int v7 = (AFBluetoothDeviceInfo *)[(AFBluetoothDeviceInfo *)v4 copy];
    id v8 = self->_deviceInfo;
    self->_deviceInfo = v7;

    int64_t v9 = self->_deviceInfo;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100239824;
    v12[3] = &unk_1005078E8;
    v12[4] = self;
    v13 = v6;
    int v14 = v9;
    uint64_t v10 = v9;
    id v11 = v6;
    [(ADCoreBluetoothV2Device *)self _enumerateObserversUsingBlock:v12];
  }
}

- (id)_deviceInfo
{
  deviceInfo = self->_deviceInfo;
  if (!deviceInfo)
  {
    id v4 = sub_1002398E4(self->_device);
    [(ADCoreBluetoothV2Device *)self _updateDeviceInfo:v4];

    deviceInfo = self->_deviceInfo;
  }
  return deviceInfo;
}

- (void)_updateDevice:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023A43C;
  block[3] = &unk_10050E160;
  id v6 = v4;
  id v29 = v6;
  v30 = self;
  dispatch_async(queue, block);
  unsigned int v7 = self->_device;
  id v8 = v6;
  int64_t v9 = sub_1002398E4(v8);
  uint64_t v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    v12 = [(ADCoreBluetoothV2Device *)self cbuuid];
    *(_DWORD *)buf = 136315650;
    v32 = "-[ADCoreBluetoothV2Device _updateDevice:]";
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    v36 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s found device: %@, cbuuid: %@", buf, 0x20u);
  }
  if (v7)
  {
    v13 = [(ADCoreBluetoothV2Device *)self _inEarDetectionStateFromCBDevice:v7];
    int v14 = [(ADCoreBluetoothV2Device *)self _inEarDetectionStateFromCBDevice:v8];
    if (v13 != v14 && ([v13 isEqual:v14] & 1) == 0)
    {
      v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v32 = "-[ADCoreBluetoothV2Device _updateDevice:]";
        __int16 v33 = 2112;
        id v34 = v13;
        __int16 v35 = 2112;
        v36 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s IED state changed from %@ to %@", buf, 0x20u);
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10023A508;
      v25[3] = &unk_1005078E8;
      v25[4] = self;
      id v26 = v13;
      id v27 = v14;
      [(ADCoreBluetoothV2Device *)self _enumerateObserversUsingBlock:v25];
    }
    int64_t v16 = [(ADCoreBluetoothV2Device *)self _headphoneListeningModeFromDevice:v7];
    int64_t v17 = [(ADCoreBluetoothV2Device *)self _headphoneListeningModeFromDevice:v8];
    if (v16 != v17)
    {
      int64_t v18 = v17;
      v19 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        log = v19;
        v22 = AFBluetoothHeadphoneListeningModeGetName();
        v20 = AFBluetoothHeadphoneListeningModeGetName();
        *(_DWORD *)buf = 136315650;
        v32 = "-[ADCoreBluetoothV2Device _updateDevice:]";
        __int16 v33 = 2112;
        id v34 = v22;
        __int16 v35 = 2112;
        v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s Listening mode changed from %@ to %@", buf, 0x20u);
      }
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10023A56C;
      v24[3] = &unk_100507910;
      v24[4] = self;
      v24[5] = v16;
      v24[6] = v18;
      -[ADCoreBluetoothV2Device _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v24, v22);
    }
  }
  [(ADCoreBluetoothV2Device *)self _updateDeviceInfo:v9];
  device = self->_device;
  self->_device = (AudioAccessoryDevice *)v8;
}

- (void)updateDevice:(id)a3
{
  id v4 = a3;
  aadQueue = self->_aadQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10023A668;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(aadQueue, v7);
}

- (void)getHeadphoneListeningMode:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10023A71C;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(group, aadQueue, v8);
}

- (void)getHeadphoneInEarDetectionState:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10023A80C;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(group, aadQueue, v8);
}

- (void)setHeadGestures:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  group = self->_group;
  aadQueue = self->_aadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023A91C;
  block[3] = &unk_10050D378;
  BOOL v12 = a3;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify(group, aadQueue, block);
}

- (void)getHeadGestures:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10023ADC4;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(group, aadQueue, v8);
}

- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  group = self->_group;
  aadQueue = self->_aadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023B08C;
  block[3] = &unk_10050D378;
  BOOL v12 = a3;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify(group, aadQueue, block);
}

- (void)getPersonalVolume:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10023B33C;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(group, aadQueue, v8);
}

- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  group = self->_group;
  aadQueue = self->_aadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023B654;
  block[3] = &unk_10050D378;
  BOOL v12 = a3;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify(group, aadQueue, block);
}

- (void)getConversationAwareness:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10023B904;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(group, aadQueue, v8);
}

- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  group = self->_group;
  aadQueue = self->_aadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023BC1C;
  block[3] = &unk_10050C148;
  id v11 = v6;
  int64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_group_notify(group, aadQueue, block);
}

- (void)fetchCBUIIDWithCompletion:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10023BDB8;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(group, aadQueue, v8);
}

- (id)cbuuid
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10023BF04;
  uint64_t v10 = sub_10023BF14;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023BF1C;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)address
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10023BF04;
  uint64_t v10 = sub_10023BF14;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023C020;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)identifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10023BF04;
  uint64_t v10 = sub_10023BF14;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023C124;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getDeviceInfo:(id)a3
{
  id v4 = a3;
  group = self->_group;
  aadQueue = self->_aadQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10023C21C;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(group, aadQueue, v8);
}

- (id)deviceInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10023BF04;
  uint64_t v10 = sub_10023BF14;
  id v11 = 0;
  aadQueue = self->_aadQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10023C368;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(aadQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (v4)
  {
    aadQueue = self->_aadQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10023C45C;
    v7[3] = &unk_10050E160;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(aadQueue, v7);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (v4)
  {
    aadQueue = self->_aadQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10023C5EC;
    v7[3] = &unk_10050E160;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(aadQueue, v7);
  }
}

- (void)_invalidate
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10023C6DC;
  v4[3] = &unk_100507898;
  v4[4] = self;
  [(ADCoreBluetoothV2Device *)self _enumerateObserversUsingBlock:v4];
  device = self->_device;
  self->_device = 0;
}

- (void)invalidate
{
  aadQueue = self->_aadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023C7B0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_sync(aadQueue, block);
}

- (ADCoreBluetoothV2Device)initWithDeviceUID:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = [a3 UUIDString];
  id v8 = [(ADCoreBluetoothV2Device *)self initWithAddress:0 cbuuid:v7 dataSource:v6];

  return v8;
}

- (ADCoreBluetoothV2Device)initWithAddress:(id)a3 dataSource:(id)a4
{
  return [(ADCoreBluetoothV2Device *)self initWithAddress:a3 cbuuid:0 dataSource:a4];
}

- (ADCoreBluetoothV2Device)initWithAddress:(id)a3 cbuuid:(id)a4 dataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)ADCoreBluetoothV2Device;
  id v11 = [(ADCoreBluetoothV2Device *)&v32 init];
  if (v11)
  {
    int64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.assistantd.ADCoreBluetoothV2Device.AAD", v12);

    int v14 = (void *)*((void *)v11 + 3);
    *((void *)v11 + 3) = v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.assistantd.ADCoreBluetoothV2Device", v15);

    int64_t v17 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = v16;

    dispatch_group_t v18 = dispatch_group_create();
    v19 = (void *)*((void *)v11 + 5);
    *((void *)v11 + 5) = v18;

    v20 = *((void *)v11 + 4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10023CA6C;
    block[3] = &unk_10050DCB8;
    v21 = (id *)v11;
    id v29 = v21;
    id v30 = v8;
    id v31 = v9;
    dispatch_async(v20, block);
    objc_storeWeak(v21 + 1, v10);
    dispatch_group_enter(*((dispatch_group_t *)v11 + 5));
    objc_initWeak(&location, v21);
    v22 = *((void *)v11 + 3);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10023CAB4;
    v24[3] = &unk_10050C7C8;
    objc_copyWeak(&v26, &location);
    v25 = v21;
    dispatch_async(v22, v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return (ADCoreBluetoothV2Device *)v11;
}

@end