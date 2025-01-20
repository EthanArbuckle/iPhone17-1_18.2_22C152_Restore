@interface ADMobileBluetoothWirelessSplitterSessionProxy
- (ADMobileBluetoothWirelessSplitterSessionProxy)initWithDataSource:(id)a3 queue:(id)a4;
- (void)_accessBTLocalDeviceUsingBlock:(id)a3;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_fetchWirelessSplitterSessionInfoWithCompletion:(id)a3;
- (void)_getWirelessSplitterSessionInfo:(id)a3;
- (void)_invalidate;
- (void)_reload:(BOOL)a3;
- (void)_updateWirelessSplitterSessionInfo:(id)a3;
- (void)addObserver:(id)a3;
- (void)bluetoothWirelessSplitterSessionStateObserver:(id)a3 didChangeStateFrom:(int64_t)a4 to:(int64_t)a5;
- (void)dealloc;
- (void)getSessionInfo:(id)a3;
- (void)invalidate;
- (void)reload;
- (void)removeObserver:(id)a3;
- (void)updateWirelessSplitterSessionInfo:(id)a3;
@end

@implementation ADMobileBluetoothWirelessSplitterSessionProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_wirelessSplitterSessionInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queue, 0);
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
      v7[2] = sub_1000E49F8;
      v7[3] = &unk_100501798;
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
    v9 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  [(AFBluetoothWirelessSplitterSessionStateObserver *)self->_observer invalidate];
  observer = self->_observer;
  self->_observer = 0;

  objc_storeWeak((id *)&self->_dataSource, 0);
  wirelessSplitterSessionInfo = self->_wirelessSplitterSessionInfo;
  self->_wirelessSplitterSessionInfo = 0;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E4B40;
  v7[3] = &unk_100501770;
  void v7[4] = self;
  [(ADMobileBluetoothWirelessSplitterSessionProxy *)self _enumerateObserversUsingBlock:v7];
  observers = self->_observers;
  self->_observers = 0;
}

- (void)_accessBTLocalDeviceUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _accessBTLocalDeviceUsingBlock:]";
      __int16 v12 = 2112;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Getting BTLocalDevice for %@...", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000E4DC8;
      v8[3] = &unk_100501720;
      v8[4] = self;
      id v9 = v4;
      [WeakRetained getBTLocalDeviceWithCompletion:v8];
    }
    else
    {
      v7 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _accessBTLocalDeviceUsingBlock:]";
        __int16 v12 = 2112;
        v13 = self;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Data source of %@ is nil.", buf, 0x16u);
        v7 = AFSiriLogContextDaemon;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _accessBTLocalDeviceUsingBlock:]";
        __int16 v12 = 2112;
        v13 = self;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Failed getting BTLocalDevice for %@.", buf, 0x16u);
      }
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

- (void)_fetchWirelessSplitterSessionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v9 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _fetchWirelessSplitterSessionInfoWithCompletion:]";
      __int16 v10 = 2112;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Fetching Wireless Splitter session info for %@...", buf, 0x16u);
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E5050;
    v6[3] = &unk_100501720;
    v6[4] = self;
    id v7 = v4;
    [(ADMobileBluetoothWirelessSplitterSessionProxy *)self _accessBTLocalDeviceUsingBlock:v6];
  }
}

- (void)_updateWirelessSplitterSessionInfo:(id)a3
{
  id v4 = (AFBluetoothWirelessSplitterSessionInfo *)a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _updateWirelessSplitterSessionInfo:]";
    __int16 v19 = 2112;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s wirelessSplitterSessionInfo = %@", buf, 0x16u);
  }
  wirelessSplitterSessionInfo = self->_wirelessSplitterSessionInfo;
  if (wirelessSplitterSessionInfo != v4
    && ([(AFBluetoothWirelessSplitterSessionInfo *)wirelessSplitterSessionInfo isEqual:v4] & 1) == 0)
  {
    id v7 = self->_wirelessSplitterSessionInfo;
    id v8 = (AFBluetoothWirelessSplitterSessionInfo *)[(AFBluetoothWirelessSplitterSessionInfo *)v4 copy];
    id v9 = self->_wirelessSplitterSessionInfo;
    self->_wirelessSplitterSessionInfo = v8;

    __int16 v10 = self->_wirelessSplitterSessionInfo;
    v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _updateWirelessSplitterSessionInfo:]";
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s wirelessSplitterSessionInfo changed from %@ to %@", buf, 0x20u);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000E5674;
    v14[3] = &unk_1005016F8;
    v14[4] = self;
    v15 = v7;
    v16 = v10;
    __int16 v12 = v10;
    v13 = v7;
    [(ADMobileBluetoothWirelessSplitterSessionProxy *)self _enumerateObserversUsingBlock:v14];
  }
}

- (void)_getWirelessSplitterSessionInfo:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = v4;
  if (v4)
  {
    if (self->_wirelessSplitterSessionInfo)
    {
      v4[2](v4);
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000E5790;
      v6[3] = &unk_1005016D0;
      v6[4] = self;
      id v7 = v4;
      [(ADMobileBluetoothWirelessSplitterSessionProxy *)self _fetchWirelessSplitterSessionInfoWithCompletion:v6];
    }
  }
}

- (void)_reload:(BOOL)a3
{
  if (self->_wirelessSplitterSessionInfo) {
    BOOL v3 = !a3;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v8 = "-[ADMobileBluetoothWirelessSplitterSessionProxy _reload:]";
      __int16 v9 = 2112;
      __int16 v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Reloading Wireless Splitter session info for %@...", buf, 0x16u);
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E5914;
    v6[3] = &unk_1005016A8;
    v6[4] = self;
    [(ADMobileBluetoothWirelessSplitterSessionProxy *)self _fetchWirelessSplitterSessionInfoWithCompletion:v6];
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E5A6C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E5B1C;
    v7[3] = &unk_10050E160;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E5BD0;
    v7[3] = &unk_10050E160;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getSessionInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E5CE0;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)bluetoothWirelessSplitterSessionStateObserver:(id)a3 didChangeStateFrom:(int64_t)a4 to:(int64_t)a5
{
  id v6 = a3;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    __int16 v9 = AFBluetoothWirelessSplitterSessionStateGetName();
    __int16 v10 = AFBluetoothWirelessSplitterSessionStateGetName();
    *(_DWORD *)buf = 136315906;
    v17 = "-[ADMobileBluetoothWirelessSplitterSessionProxy bluetoothWirelessSplitterSessionStateObserver:didChangeStateFrom:to:]";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    __int16 v21 = v9;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s observer = %@, fromState = %@, toState = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000E5E74;
  v13[3] = &unk_10050E160;
  id v14 = v6;
  v15 = self;
  id v12 = v6;
  dispatch_async(queue, v13);
}

- (void)reload
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E5F04;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updateWirelessSplitterSessionInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E5FA8;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (ADMobileBluetoothWirelessSplitterSessionProxy)initWithDataSource:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ADMobileBluetoothWirelessSplitterSessionProxy;
  id v8 = [(ADMobileBluetoothWirelessSplitterSessionProxy *)&v16 init];
  if (v8)
  {
    __int16 v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v18 = "-[ADMobileBluetoothWirelessSplitterSessionProxy initWithDataSource:queue:]";
      __int16 v19 = 2112;
      __int16 v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v8->_queue, a4);
    __int16 v10 = (AFBluetoothWirelessSplitterSessionStateObserver *)[objc_alloc((Class)AFBluetoothWirelessSplitterSessionStateObserver) initWithQueue:v8->_queue delegate:v8];
    observer = v8->_observer;
    v8->_observer = v10;

    queue = v8->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E6160;
    block[3] = &unk_10050E138;
    v15 = v8;
    dispatch_async(queue, block);
  }
  return v8;
}

- (void)dealloc
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[ADMobileBluetoothWirelessSplitterSessionProxy dealloc]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)ADMobileBluetoothWirelessSplitterSessionProxy;
  [(ADMobileBluetoothWirelessSplitterSessionProxy *)&v4 dealloc];
}

@end