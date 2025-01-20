@interface ADDeviceSyncTimerProvider
- (ADDeviceSyncTimerProvider)initWithDelegate:(id)a3;
- (NSString)type;
- (void)clockTimerObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5;
- (void)clockTimerObserver:(id)a3 timerDidDismiss:(id)a4;
- (void)clockTimerObserver:(id)a3 timerDidFire:(id)a4;
- (void)getGenerationWithCompletion:(id)a3;
- (void)getIncrementalChangesAfterGeneration:(unint64_t)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)getSnapshotWithCompletion:(id)a3;
@end

@implementation ADDeviceSyncTimerProvider

- (void).cxx_destruct
{
}

- (void)getSnapshotWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ADDeviceSyncTimerProvider getSnapshotWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v3)
  {
    v5 = AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[ADDeviceSyncTimerProvider getSnapshotWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Fetching local timer snapshot...", buf, 0xCu);
    }
    v6 = +[SOClockTimerObserver sharedObserver];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002C9E20;
    v7[3] = &unk_10050A468;
    id v8 = v3;
    [v6 getTimerSnapshotWithCompletion:v7];
  }
}

- (void)getIncrementalChangesAfterGeneration:(unint64_t)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void, void *))a5;
  v9 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[ADDeviceSyncTimerProvider getIncrementalChangesAfterGeneration:limit:completion:]";
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 2048;
    unint64_t v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s generation = %llu, limit = %llu", buf, 0x20u);
  }
  if (v8)
  {
    v10 = (void *)AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_ERROR))
    {
      v15 = v10;
      v16 = [(ADDeviceSyncTimerProvider *)self type];
      *(_DWORD *)buf = 136315394;
      v18 = "-[ADDeviceSyncTimerProvider getIncrementalChangesAfterGeneration:limit:completion:]";
      __int16 v19 = 2112;
      unint64_t v20 = (unint64_t)v16;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Delta pulling mode is not supported for type %@.", buf, 0x16u);
    }
    id v11 = objc_alloc((Class)NSString);
    v12 = [(ADDeviceSyncTimerProvider *)self type];
    id v13 = [v11 initWithFormat:@"Delta pulling mode is not supported for type %@.", v12];
    v14 = +[AFError errorWithCode:2415 description:v13 underlyingError:0];
    v8[2](v8, 0, v14);
  }
}

- (void)getGenerationWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ADDeviceSyncTimerProvider getGenerationWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v3)
  {
    v5 = AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[ADDeviceSyncTimerProvider getGenerationWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Loading local timer generation...", buf, 0xCu);
    }
    v6 = +[SOClockTimerObserver sharedObserver];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002CA51C;
    v7[3] = &unk_10050A468;
    id v8 = v3;
    [v6 getTimerSnapshotWithCompletion:v7];
  }
}

- (NSString)type
{
  v2 = @"com.apple.assistant.device-sync.data-type.timer";
  return (NSString *)@"com.apple.assistant.device-sync.data-type.timer";
}

- (void)clockTimerObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    v14 = "-[ADDeviceSyncTimerProvider clockTimerObserver:snapshotDidUpdateFrom:to:]";
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s fromSnapshot = %@", (uint8_t *)&v13, 0x16u);
    id v11 = AFSiriLogContextDeviceSync;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    v14 = "-[ADDeviceSyncTimerProvider clockTimerObserver:snapshotDidUpdateFrom:to:]";
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s toSnapshot = %@", (uint8_t *)&v13, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deviceSyncDataProviderDidUpdate:self];
}

- (void)clockTimerObserver:(id)a3 timerDidDismiss:(id)a4
{
  id v4 = a4;
  v5 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    v7 = "-[ADDeviceSyncTimerProvider clockTimerObserver:timerDidDismiss:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s dismissedTimerID = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)clockTimerObserver:(id)a3 timerDidFire:(id)a4
{
  id v4 = a4;
  v5 = AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    v7 = "-[ADDeviceSyncTimerProvider clockTimerObserver:timerDidFire:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s firedTimerID = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (ADDeviceSyncTimerProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADDeviceSyncTimerProvider;
  v5 = [(ADDeviceSyncTimerProvider *)&v9 init];
  int v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[SOClockTimerObserver sharedObserver];
    [v7 addListener:v6];
  }
  return v6;
}

@end