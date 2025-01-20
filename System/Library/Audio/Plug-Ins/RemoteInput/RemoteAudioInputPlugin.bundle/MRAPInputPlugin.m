@interface MRAPInputPlugin
- (AVAudioRemoteInputPluginDelegate)delegate;
- (MRAPInputPlugin)initWithPluginDelegate:(id)a3;
- (NSArray)devices;
- (id)_inputDeviceWithIdentifier:(unsigned int)a3;
- (void)_reloadInputDevices;
- (void)dealloc;
- (void)invalidate;
- (void)recordingEndpoint:(id)a3 inputDeviceConnectedWithID:(unsigned int)a4;
- (void)recordingEndpoint:(id)a3 inputDeviceDisconnectedWithID:(unsigned int)a4;
- (void)recordingEndpoint:(id)a3 inputDeviceWithID:(unsigned int)a4 receivedAudioBuffer:(void *)a5 withTime:(id)a6 gain:(float)a7;
@end

@implementation MRAPInputPlugin

- (MRAPInputPlugin)initWithPluginDelegate:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MRAPInputPlugin;
  v5 = [(MRAPInputPlugin *)&v15 init];
  if (v5)
  {
    v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Plugin loaded", v14, 2u);
    }

    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(Name, v9);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v10;

    v12 = +[MRAPRecordingEndpoint sharedEndpoint];
    [v12 addDelegate:v5];
    [(MRAPInputPlugin *)v5 _reloadInputDevices];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[MRAPRecordingEndpoint sharedEndpoint];
  [v3 removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)MRAPInputPlugin;
  [(MRAPInputPlugin *)&v4 dealloc];
}

- (NSArray)devices
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_52E8;
  dispatch_queue_t v10 = sub_52F8;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5300;
  v5[3] = &unk_8320;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)invalidate
{
  id v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Plugin invalidated", buf, 2u);
  }

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5430;
  block[3] = &unk_82D0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  v5 = +[MRAPRecordingEndpoint sharedEndpoint];
  [v5 removeDelegate:self];
}

- (void)recordingEndpoint:(id)a3 inputDeviceConnectedWithID:(unsigned int)a4
{
  uint64_t v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Device with ID %u connected", (uint8_t *)v7, 8u);
  }

  [(MRAPInputPlugin *)self _reloadInputDevices];
}

- (void)recordingEndpoint:(id)a3 inputDeviceDisconnectedWithID:(unsigned int)a4
{
  uint64_t v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Device with ID %u disconnected", (uint8_t *)v7, 8u);
  }

  [(MRAPInputPlugin *)self _reloadInputDevices];
}

- (void)recordingEndpoint:(id)a3 inputDeviceWithID:(unsigned int)a4 receivedAudioBuffer:(void *)a5 withTime:(id)a6 gain:(float)a7
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  v12 = [(MRAPInputPlugin *)self _inputDeviceWithIdentifier:*(void *)&a4];
  v14 = v12;
  if (v12)
  {
    *(float *)&double v13 = a7;
    objc_msgSend(v12, "processVoiceDataWithBuffer:time:gain:", a5, var0, var1, v13);
  }
  else
  {
    objc_super v15 = _MRLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_6258(a4, v15);
    }
  }
}

- (void)_reloadInputDevices
{
  v2 = _MRLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Reloading input devices...", buf, 2u);
  }

  MRVirtualVoiceInputGetDevices();
}

- (id)_inputDeviceWithIdentifier:(unsigned int)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_52E8;
  v12 = sub_52F8;
  id v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5D4C;
  block[3] = &unk_83B8;
  unsigned int v7 = a3;
  block[4] = self;
  void block[5] = &v8;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (AVAudioRemoteInputPluginDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVAudioRemoteInputPluginDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_inputDevices, 0);
}

@end