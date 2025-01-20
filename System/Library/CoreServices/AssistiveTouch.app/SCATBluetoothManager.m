@interface SCATBluetoothManager
+ (id)sharedInstance;
+ (id)superNew;
- (SCATBluetoothManager)init;
- (int)_desiredSessionState;
- (int)_sessionState;
- (void)_accessoryCustomMessageForAccessoryManager:(BTAccessoryManagerImpl *)a3 device:(BTDeviceImpl *)a4 customMessageType:(int)a5 data:(char *)a6 dataSize:(unint64_t)a7;
- (void)_beginAttach;
- (void)_beginDetach;
- (void)_beginStateTransitionIfNecessary;
- (void)_didConnectWithSession:(BTSessionImpl *)a3;
- (void)_didDisconnect;
- (void)_probeAccessories;
- (void)_sessionEventForSession:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5;
- (void)addActivationReason:(id)a3;
- (void)addDeviceListener:(id)a3;
- (void)checkIfActiveForReason:(id)a3 completion:(id)a4;
- (void)getExtantDevicesWithCompletion:(id)a3;
- (void)removeActivationReason:(id)a3;
- (void)removeDeviceListener:(id)a3;
- (void)sendConfigurationMessageToDevice:(id)a3 ofType:(unsigned __int8)a4 value:(unsigned int)a5;
- (void)sendCustomMessageToDevice:(id)a3 ofType:(int)a4 withData:(id)a5;
@end

@implementation SCATBluetoothManager

+ (id)superNew
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SCATBluetoothManager;
  id v2 = objc_msgSendSuper2(&v4, "new");

  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001F09F8 != -1) {
    dispatch_once(&qword_1001F09F8, &stru_1001ABC88);
  }
  id v2 = (void *)qword_1001F0A00;

  return v2;
}

- (SCATBluetoothManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)SCATBluetoothManager;
  id v2 = [(SCATBluetoothManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSPointerArray weakObjectsPointerArray];
    deviceListeners = v2->_deviceListeners;
    v2->_deviceListeners = (NSPointerArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.scat.bluetoothmanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[NSMutableArray array];
    activationReasons = v2->_activationReasons;
    v2->_activationReasons = (NSMutableArray *)v7;

    v2->_sessionState = 0;
    uint64_t v9 = +[NSMutableDictionary dictionary];
    addressToDeviceMap = v2->_addressToDeviceMap;
    v2->_addressToDeviceMap = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (int)_sessionState
{
  return self->_sessionState;
}

- (int)_desiredSessionState
{
  return 2 * ([(NSMutableArray *)self->_activationReasons count] != 0);
}

- (void)_beginAttach
{
  if ([(SCATBluetoothManager *)self _sessionState]) {
    _AXAssert();
  }
  v5[5] = sub_10003AEA0;
  if (BTSessionAttachWithQueue())
  {
    uint64_t v3 = SWCHLogHW();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1001140E8();
    }

    dispatch_time_t v4 = dispatch_time(0, 30000000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003AEB4;
    v5[3] = &unk_1001AAA90;
    v5[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v5);
  }
  self->_sessionState = 1;
}

- (void)_beginDetach
{
  if ([(SCATBluetoothManager *)self _sessionState] != 2) {
    _AXAssert();
  }
  self->_sessionState = 3;
  BTSessionDetachWithQueue();

  [(SCATBluetoothManager *)self _didDisconnect];
}

- (void)_beginStateTransitionIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_time_t v4 = SWCHLogHW();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10011411C(self, a2, v4);
  }

  if ([(SCATBluetoothManager *)self _sessionState] != 1
    && [(SCATBluetoothManager *)self _sessionState] != 3)
  {
    unsigned int v5 = [(SCATBluetoothManager *)self _desiredSessionState];
    if (v5 != [(SCATBluetoothManager *)self _sessionState])
    {
      if ([(SCATBluetoothManager *)self _desiredSessionState] == 2)
      {
        [(SCATBluetoothManager *)self _beginAttach];
      }
      else
      {
        if ([(SCATBluetoothManager *)self _desiredSessionState])
        {
          uint64_t v6 = [(SCATBluetoothManager *)self _desiredSessionState];
          _AXAssert();
        }
        [(SCATBluetoothManager *)self _beginDetach];
      }
    }
  }
}

- (void)_probeAccessories
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  unint64_t v54 = 0;
  do
  {
    if (2 * v4 <= 1) {
      unint64_t v4 = 1;
    }
    else {
      v4 *= 2;
    }
    unsigned int v5 = malloc_type_realloc(v3, 8 * v4, 0x2004093837F09uLL);
    if (!v5)
    {
      v35 = SWCHLogHW();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100114210();
      }

      v36 = v3;
      goto LABEL_48;
    }
    uint64_t v6 = v5;
    int ConnectedDevices = BTLocalDeviceGetConnectedDevices();
    if (ConnectedDevices)
    {
      int v37 = ConnectedDevices;
      v38 = SWCHLogHW();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_100114244(v37, v38);
      }

      v36 = v6;
LABEL_48:
      free(v36);
      [(SCATBluetoothManager *)self _beginDetach];
      return;
    }
    if (v4 > 0x400) {
      break;
    }
    uint64_t v3 = v6;
  }
  while (v54 >= v4);
  v8 = +[NSMutableDictionary dictionary];
  v40 = +[NSMutableArray array];
  free(v6);
  uint64_t v9 = +[NSMutableArray array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v10 = [(NSMutableDictionary *)self->_addressToDeviceMap keyEnumerator];
  id v11 = [v10 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v51;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        v16 = [(NSMutableDictionary *)v8 objectForKey:v15];

        if (!v16)
        {
          v17 = [(NSMutableDictionary *)self->_addressToDeviceMap objectForKey:v15];
          [v9 addObject:v17];
        }
        v18 = [(NSMutableDictionary *)self->_addressToDeviceMap objectForKey:v15];
        [v18 deviceDisappeared];
      }
      id v12 = [v10 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v12);
  }

  if ([(NSPointerArray *)self->_deviceListeners count])
  {
    uint64_t v19 = 0;
    v39 = v9;
    do
    {
      uint64_t v41 = v19;
      v20 = [(NSPointerArray *)self->_deviceListeners pointerAtIndex:v19];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v21 = v9;
      id v22 = [v21 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v47;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v47 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
            if (objc_opt_respondsToSelector()) {
              [v20 bluetoothManager:self forgotDevice:v26];
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v46 objects:v56 count:16];
        }
        while (v23);
      }

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v27 = v40;
      id v28 = [v27 countByEnumeratingWithState:&v42 objects:v55 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v43;
        do
        {
          for (k = 0; k != v29; k = (char *)k + 1)
          {
            if (*(void *)v43 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v42 + 1) + 8 * (void)k);
            if (objc_opt_respondsToSelector()) {
              [v20 bluetoothManager:self discoveredDevice:v32];
            }
          }
          id v29 = [v27 countByEnumeratingWithState:&v42 objects:v55 count:16];
        }
        while (v29);
      }

      uint64_t v19 = v41 + 1;
      uint64_t v9 = v39;
    }
    while (v41 + 1 < [(NSPointerArray *)self->_deviceListeners count]);
  }
  v33 = SWCHLogHW();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v59 = v40;
    __int16 v60 = 2112;
    v61 = v9;
    __int16 v62 = 2112;
    v63 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Completed BT device scan. New devices: %@\nobsolete devices: %@\nnew map: %@", buf, 0x20u);
  }

  addressToDeviceMap = self->_addressToDeviceMap;
  self->_addressToDeviceMap = v8;
}

- (void)_didConnectWithSession:(BTSessionImpl *)a3
{
  self->_sessionState = 2;
  self->_session = a3;
  BTAccessoryManagerGetDefault();
  BTLocalDeviceGetDefault();
  BTAccessoryManagerAddCallbacks();
  BTAccessoryManagerRegisterCustomMessageClient();
  BTServiceAddCallbacks();
  [(SCATBluetoothManager *)self _probeAccessories];
}

- (void)_didDisconnect
{
  uint64_t v3 = SWCHLogHW();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1001142BC();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_sessionState = 0;
  self->_localDevice = 0;
  self->_accessoryManager = 0;
  self->_session = 0;
}

- (void)_sessionEventForSession:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  switch(a4)
  {
    case 0:
      v8 = SWCHLogHW();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BTSession attached.", buf, 2u);
      }

      self->_sessionState = 1;
      if (a5) {
        goto LABEL_19;
      }
      [(SCATBluetoothManager *)self _didConnectWithSession:a3];
      break;
    case 1:
      uint64_t v9 = SWCHLogHW();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BTSession detached.", v13, 2u);
      }

      self->_sessionState = 3;
      goto LABEL_19;
    case 2:
      v10 = SWCHLogHW();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BTSession terminated.", v12, 2u);
      }

      if (self->_session != a3) {
        goto LABEL_17;
      }
      goto LABEL_19;
    case 3:
      id v11 = SWCHLogHW();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001142FC();
      }

      if (a3 && self->_session != a3) {
LABEL_17:
      }
        _AXAssert();
      if (self->_session == a3) {
LABEL_19:
      }
        [(SCATBluetoothManager *)self _didDisconnect];
      break;
    default:
      break;
  }
  [(SCATBluetoothManager *)self _beginStateTransitionIfNecessary];
}

- (void)_accessoryCustomMessageForAccessoryManager:(BTAccessoryManagerImpl *)a3 device:(BTDeviceImpl *)a4 customMessageType:(int)a5 data:(char *)a6 dataSize:(unint64_t)a7
{
  uint64_t v9 = *(void *)&a5;
  if (BTDeviceGetAddressString())
  {
    id v12 = SWCHLogHW();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100114330(a2, v12);
    }
  }
  else
  {
    id v12 = +[NSString stringWithUTF8String:v24];
    uint64_t v13 = [(NSMutableDictionary *)self->_addressToDeviceMap objectForKey:v12];
    v14 = +[NSData dataWithBytes:a6 length:a7];
    uint64_t v15 = SWCHLogHW();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315906;
      v17 = v24;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      __int16 v20 = 1024;
      int v21 = v9;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Custom message received from %s (%@): %d, %@", (uint8_t *)&v16, 0x26u);
    }

    [v13 customMessageReceived:v9 withData:v14];
  }
}

- (void)addActivationReason:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BB9C;
  v7[3] = &unk_1001AAC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeActivationReason:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BC74;
  v7[3] = &unk_1001AAC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)checkIfActiveForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BD7C;
  block[3] = &unk_1001ABCB0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)addDeviceListener:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BE60;
  v7[3] = &unk_1001AAC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)removeDeviceListener:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BF04;
  v7[3] = &unk_1001AAC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)getExtantDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C02C;
  v7[3] = &unk_1001AB420;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)sendCustomMessageToDevice:(id)a3 ofType:(int)a4 withData:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003C158;
  v13[3] = &unk_1001ABCD8;
  int v17 = a4;
  id v14 = v8;
  id v15 = v9;
  int v16 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)sendConfigurationMessageToDevice:(id)a3 ofType:(unsigned __int8)a4 value:(unsigned int)a5
{
  id v8 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C460;
  block[3] = &unk_1001ABD00;
  unsigned __int8 v15 = a4;
  unsigned int v14 = a5;
  id v12 = v8;
  id v13 = self;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressToDeviceMap, 0);
  objc_storeStrong((id *)&self->_activationReasons, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_deviceListeners, 0);
}

@end