@interface ADMobileBluetoothDeviceProxy
- (ADMobileBluetoothDeviceProxy)initWithAddress:(id)a3 dataSource:(id)a4 queue:(id)a5;
- (ADMobileBluetoothDeviceProxy)initWithDeviceUID:(id)a3 dataSource:(id)a4 queue:(id)a5;
- (NSString)address;
- (NSString)description;
- (NSUUID)deviceUID;
- (id)deviceInfo;
- (id)identifier;
- (void)_accessBTDeviceAndAccessoryManagerUsingBlock:(id)a3;
- (void)_changeHeadphoneListeningMode:(int64_t)a3 completion:(id)a4;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_fetchDeviceInfoWithCompletion:(id)a3;
- (void)_fetchHeadphoneInEarDetectionStateWithCompletion:(id)a3;
- (void)_fetchHeadphoneListeningModeWithCompletion:(id)a3;
- (void)_getConversationAwareness:(id)a3;
- (void)_getDeviceInfo:(id)a3;
- (void)_getHeadphoneInEarDetectionState:(id)a3;
- (void)_getHeadphoneListeningMode:(id)a3;
- (void)_getPersonalVolume:(id)a3;
- (void)_invalidate;
- (void)_reload:(BOOL)a3;
- (void)_setConversationAwareness:(BOOL)a3 completion:(id)a4;
- (void)_setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4;
- (void)_setPersonalVolume:(BOOL)a3 completion:(id)a4;
- (void)_updateDeviceInfo:(id)a3;
- (void)_updateHeadphoneInEarDetectionState:(id)a3;
- (void)_updateHeadphoneListeningMode:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)getConversationAwareness:(id)a3;
- (void)getDeviceInfo:(id)a3;
- (void)getHeadGestures:(id)a3;
- (void)getHeadphoneInEarDetectionState:(id)a3;
- (void)getHeadphoneListeningMode:(id)a3;
- (void)getPersonalVolume:(id)a3;
- (void)invalidate;
- (void)prewarm;
- (void)reload;
- (void)removeObserver:(id)a3;
- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4;
- (void)setHeadGestures:(BOOL)a3 completion:(id)a4;
- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4;
- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4;
- (void)updateDeviceInfo:(id)a3;
- (void)updateHeadphoneInEarDetectionState:(id)a3;
- (void)updateHeadphoneListeningMode:(int64_t)a3;
@end

@implementation ADMobileBluetoothDeviceProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_headphoneInEarDetectionState, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSUUID)deviceUID
{
  return self->_deviceUID;
}

- (NSString)address
{
  return self->_address;
}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      v6 = [(NSHashTable *)observers setRepresentation];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000DD868;
      v7[3] = &unk_100507938;
      id v8 = v4;
      [v6 enumerateObjectsUsingBlock:v7];
    }
  }
}

- (void)_invalidate
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[ADMobileBluetoothDeviceProxy _invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  objc_storeWeak((id *)&self->_dataSource, 0);
  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = 0;

  headphoneInEarDetectionState = self->_headphoneInEarDetectionState;
  self->_headphoneInEarDetectionState = 0;

  self->_headphoneListeningMode = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DD9AC;
  v7[3] = &unk_100507898;
  void v7[4] = self;
  [(ADMobileBluetoothDeviceProxy *)self _enumerateObserversUsingBlock:v7];
  observers = self->_observers;
  self->_observers = 0;
}

- (void)_accessBTDeviceAndAccessoryManagerUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
      __int16 v19 = 2112;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Getting BTDevice and BTAccessoryManager for %@...", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      deviceUID = self->_deviceUID;
      if (deviceUID)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000DDD00;
        v15[3] = &unk_1005015C8;
        v15[4] = self;
        id v16 = v4;
        [WeakRetained getBTDeviceWithDeviceUID:deviceUID completion:v15];
        id v8 = v16;
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
      address = self->_address;
      if (address)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1000DDE50;
        v13[3] = &unk_1005015C8;
        v13[4] = self;
        id v14 = v4;
        [WeakRetained getBTDeviceWithAddress:address completion:v13];
        id v8 = v14;
        goto LABEL_13;
      }
      v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
        __int16 v19 = 2112;
        v20 = self;
        v12 = "%s Device UID and address of %@ are nil.";
LABEL_19:
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      }
    }
    else
    {
      v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
        __int16 v19 = 2112;
        v20 = self;
        v12 = "%s Data source of %@ is nil.";
        goto LABEL_19;
      }
    }
    v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[ADMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
      __int16 v19 = 2112;
      v20 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed getting BTDevice and BTAccessoryManager for %@.", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_14;
  }
LABEL_15:
}

- (void)_changeHeadphoneListeningMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[ADMobileBluetoothDeviceProxy _changeHeadphoneListeningMode:completion:]";
    __int16 v14 = 2048;
    int64_t v15 = a3;
    __int16 v16 = 2112;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Changing headphone listening mode to %ld for %@", buf, 0x20u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DE114;
  v9[3] = &unk_100501658;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [(ADMobileBluetoothDeviceProxy *)self _accessBTDeviceAndAccessoryManagerUsingBlock:v9];
}

- (void)_fetchHeadphoneListeningModeWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[ADMobileBluetoothDeviceProxy _fetchHeadphoneListeningModeWithCompletion:]";
      __int16 v10 = 2112;
      int64_t v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Fetching headphone listening mode for %@...", buf, 0x16u);
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DE580;
    v6[3] = &unk_1005015C8;
    v6[4] = self;
    id v7 = v4;
    [(ADMobileBluetoothDeviceProxy *)self _accessBTDeviceAndAccessoryManagerUsingBlock:v6];
  }
}

- (void)_fetchHeadphoneInEarDetectionStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[ADMobileBluetoothDeviceProxy _fetchHeadphoneInEarDetectionStateWithCompletion:]";
      __int16 v10 = 2112;
      int64_t v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Fetching headphone in-ear detection state for %@...", buf, 0x16u);
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DE98C;
    v6[3] = &unk_1005015C8;
    v6[4] = self;
    id v7 = v4;
    [(ADMobileBluetoothDeviceProxy *)self _accessBTDeviceAndAccessoryManagerUsingBlock:v6];
  }
}

- (void)_fetchDeviceInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[ADMobileBluetoothDeviceProxy _fetchDeviceInfoWithCompletion:]";
      __int16 v10 = 2112;
      int64_t v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Fetching device info for %@...", buf, 0x16u);
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DEED8;
    v6[3] = &unk_1005015C8;
    v6[4] = self;
    id v7 = v4;
    [(ADMobileBluetoothDeviceProxy *)self _accessBTDeviceAndAccessoryManagerUsingBlock:v6];
  }
}

- (void)_updateHeadphoneListeningMode:(int64_t)a3
{
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "-[ADMobileBluetoothDeviceProxy _updateHeadphoneListeningMode:]";
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s int64_t headphoneListeningMode = %ld", buf, 0x16u);
  }
  int64_t headphoneListeningMode = self->_headphoneListeningMode;
  if (headphoneListeningMode != a3)
  {
    self->_int64_t headphoneListeningMode = a3;
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v10 = "-[ADMobileBluetoothDeviceProxy _updateHeadphoneListeningMode:]";
      __int16 v11 = 2048;
      int64_t v12 = headphoneListeningMode;
      __int16 v13 = 2048;
      int64_t v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s headphoneListeningMode changed from %ld to %ld", buf, 0x20u);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DFB28;
    v8[3] = &unk_100507910;
    v8[4] = self;
    v8[5] = headphoneListeningMode;
    v8[6] = a3;
    [(ADMobileBluetoothDeviceProxy *)self _enumerateObserversUsingBlock:v8];
  }
}

- (void)_updateHeadphoneInEarDetectionState:(id)a3
{
  id v4 = (AFBluetoothHeadphoneInEarDetectionState *)a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[ADMobileBluetoothDeviceProxy _updateHeadphoneInEarDetectionState:]";
    __int16 v19 = 2112;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s headphoneInEarDetectionState = %@", buf, 0x16u);
  }
  headphoneInEarDetectionState = self->_headphoneInEarDetectionState;
  if (headphoneInEarDetectionState != v4
    && ([(AFBluetoothHeadphoneInEarDetectionState *)headphoneInEarDetectionState isEqual:v4] & 1) == 0)
  {
    id v7 = self->_headphoneInEarDetectionState;
    id v8 = (AFBluetoothHeadphoneInEarDetectionState *)[(AFBluetoothHeadphoneInEarDetectionState *)v4 copy];
    v9 = self->_headphoneInEarDetectionState;
    self->_headphoneInEarDetectionState = v8;

    __int16 v10 = self->_headphoneInEarDetectionState;
    __int16 v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[ADMobileBluetoothDeviceProxy _updateHeadphoneInEarDetectionState:]";
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s headphoneInEarDetectionState changed from %@ to %@", buf, 0x20u);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000DFD88;
    v14[3] = &unk_1005078E8;
    v14[4] = self;
    int64_t v15 = v7;
    __int16 v16 = v10;
    int64_t v12 = v10;
    __int16 v13 = v7;
    [(ADMobileBluetoothDeviceProxy *)self _enumerateObserversUsingBlock:v14];
  }
}

- (void)_updateDeviceInfo:(id)a3
{
  id v4 = (AFBluetoothDeviceInfo *)a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[ADMobileBluetoothDeviceProxy _updateDeviceInfo:]";
    __int16 v19 = 2112;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s deviceInfo = %@", buf, 0x16u);
  }
  deviceInfo = self->_deviceInfo;
  if (deviceInfo != v4 && ([(AFBluetoothDeviceInfo *)deviceInfo isEqual:v4] & 1) == 0)
  {
    id v7 = self->_deviceInfo;
    id v8 = (AFBluetoothDeviceInfo *)[(AFBluetoothDeviceInfo *)v4 copy];
    v9 = self->_deviceInfo;
    self->_deviceInfo = v8;

    __int16 v10 = self->_deviceInfo;
    __int16 v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[ADMobileBluetoothDeviceProxy _updateDeviceInfo:]";
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceInfo changed from %@ to %@", buf, 0x20u);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000DFFE8;
    v14[3] = &unk_1005078E8;
    v14[4] = self;
    int64_t v15 = v7;
    __int16 v16 = v10;
    int64_t v12 = v10;
    __int16 v13 = v7;
    [(ADMobileBluetoothDeviceProxy *)self _enumerateObserversUsingBlock:v14];
  }
}

- (void)_getPersonalVolume:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E00E4;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_getConversationAwareness:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E09E0;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_setPersonalVolume:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1014;
  block[3] = &unk_10050D378;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_setConversationAwareness:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E163C;
  block[3] = &unk_10050D378;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1C64;
  block[3] = &unk_10050C148;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_getHeadphoneListeningMode:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E1FBC;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_getHeadphoneInEarDetectionState:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E2258;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_getDeviceInfo:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = v4;
  if (v4)
  {
    if (self->_deviceInfo)
    {
      v4[2](v4);
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000E250C;
      v6[3] = &unk_1005014C0;
      v6[4] = self;
      id v7 = v4;
      [(ADMobileBluetoothDeviceProxy *)self _fetchDeviceInfoWithCompletion:v6];
    }
  }
}

- (void)_reload:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_deviceInfo) {
    BOOL v5 = !a3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int64_t v15 = "-[ADMobileBluetoothDeviceProxy _reload:]";
      __int16 v16 = 2112;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Reloading device info for %@...", buf, 0x16u);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000E2820;
    v13[3] = &unk_100501408;
    v13[4] = self;
    [(ADMobileBluetoothDeviceProxy *)self _fetchDeviceInfoWithCompletion:v13];
  }
  if (self->_headphoneInEarDetectionState) {
    BOOL v7 = !v3;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int64_t v15 = "-[ADMobileBluetoothDeviceProxy _reload:]";
      __int16 v16 = 2112;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Reloading headphone in-ear detection state for %@...", buf, 0x16u);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E2904;
    v12[3] = &unk_100501498;
    v12[4] = self;
    [(ADMobileBluetoothDeviceProxy *)self _fetchHeadphoneInEarDetectionStateWithCompletion:v12];
  }
  if (self->_headphoneListeningMode) {
    BOOL v9 = !v3;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int64_t v15 = "-[ADMobileBluetoothDeviceProxy _reload:]";
      __int16 v16 = 2112;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Reloading headphone listening mode for %@...", buf, 0x16u);
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000E29E8;
    v11[3] = &unk_10050C0A8;
    v11[4] = self;
    [(ADMobileBluetoothDeviceProxy *)self _fetchHeadphoneListeningModeWithCompletion:v11];
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E2B3C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E2BEC;
    v7[3] = &unk_10050E160;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E2CA0;
    v7[3] = &unk_10050E160;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getHeadGestures:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E2DA0;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getPersonalVolume:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E2F7C;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getConversationAwareness:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E3020;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setHeadGestures:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E30C4;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E32B0;
  block[3] = &unk_10050D378;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3368;
  block[3] = &unk_10050D378;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3420;
  block[3] = &unk_10050C148;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)getHeadphoneListeningMode:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E34D8;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getHeadphoneInEarDetectionState:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E358C;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E3640;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)deviceInfo
{
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1000E3844;
  __int16 v19 = sub_1000E3854;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int64_t v12 = sub_1000E3844;
  __int16 v13 = sub_1000E3854;
  id v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E385C;
  block[3] = &unk_100502628;
  block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(queue, block);
  BOOL v3 = v10[5];
  if (v3 && (dispatch_time_t v4 = dispatch_time(0, 4000000000), dispatch_semaphore_wait(v3, v4)))
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[ADMobileBluetoothDeviceProxy deviceInfo]";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Slow path timed out after 4 seconds.", buf, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = (id)v16[5];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (id)identifier
{
  address = [(NSUUID *)self->_deviceUID UUIDString];
  dispatch_time_t v4 = address;
  if (!address) {
    address = self->_address;
  }
  id v5 = address;

  return v5;
}

- (void)prewarm
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3B7C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reload
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3BFC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updateHeadphoneListeningMode:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E3C7C;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)updateHeadphoneInEarDetectionState:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E3D20;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)updateDeviceInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E3DC4;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (ADMobileBluetoothDeviceProxy)initWithDeviceUID:(id)a3 dataSource:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ADMobileBluetoothDeviceProxy;
  uint64_t v11 = [(ADMobileBluetoothDeviceProxy *)&v19 init];
  if (v11)
  {
    int64_t v12 = (NSUUID *)[v8 copy];
    deviceUID = v11->_deviceUID;
    v11->_deviceUID = v12;

    id v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[ADMobileBluetoothDeviceProxy initWithDeviceUID:dataSource:queue:]";
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    objc_storeWeak((id *)&v11->_dataSource, v9);
    objc_storeStrong((id *)&v11->_queue, a5);
    queue = v11->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E3F7C;
    block[3] = &unk_10050E138;
    v18 = v11;
    dispatch_async(queue, block);
  }
  return v11;
}

- (ADMobileBluetoothDeviceProxy)initWithAddress:(id)a3 dataSource:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ADMobileBluetoothDeviceProxy;
  uint64_t v11 = [(ADMobileBluetoothDeviceProxy *)&v19 init];
  if (v11)
  {
    int64_t v12 = (NSString *)[v8 copy];
    address = v11->_address;
    v11->_address = v12;

    id v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[ADMobileBluetoothDeviceProxy initWithAddress:dataSource:queue:]";
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    objc_storeWeak((id *)&v11->_dataSource, v9);
    objc_storeStrong((id *)&v11->_queue, a5);
    queue = v11->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E4328;
    block[3] = &unk_10050E138;
    v18 = v11;
    dispatch_async(queue, block);
  }
  return v11;
}

- (void)dealloc
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[ADMobileBluetoothDeviceProxy dealloc]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)ADMobileBluetoothDeviceProxy;
  [(ADMobileBluetoothDeviceProxy *)&v4 dealloc];
}

- (NSString)description
{
  if (self->_deviceUID)
  {
    id v3 = objc_alloc((Class)NSString);
    v11.receiver = self;
    v11.super_class = (Class)ADMobileBluetoothDeviceProxy;
    objc_super v4 = [(ADMobileBluetoothDeviceProxy *)&v11 description];
    id v5 = [v3 initWithFormat:@"%@ {deviceUID = %@}", v4, self->_deviceUID];
LABEL_5:
    __int16 v7 = v5;

    goto LABEL_6;
  }
  if (self->_address)
  {
    id v6 = objc_alloc((Class)NSString);
    v10.receiver = self;
    v10.super_class = (Class)ADMobileBluetoothDeviceProxy;
    objc_super v4 = [(ADMobileBluetoothDeviceProxy *)&v10 description];
    id v5 = [v6 initWithFormat:@"%@ {address = %@}", v4, self->_address];
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)ADMobileBluetoothDeviceProxy;
  __int16 v7 = [(ADMobileBluetoothDeviceProxy *)&v9 description];
LABEL_6:
  return (NSString *)v7;
}

@end