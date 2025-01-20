@interface CSMockRemotePlugin
- (AVAudioRemoteInputPluginDelegate)delegate;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSMockRemotePlugin)initWithPluginDelegate:(id)a3;
- (NSArray)devices;
- (NSMutableDictionary)deviceDictionary;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (OS_os_log)logger;
- (void)createMockRemoteDeviceWithName:(id)a3 deviceID:(id)a4 completion:(id)a5;
- (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4;
- (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)listMockRemoteDeviecesWithCompletion:(id)a3;
- (void)listen;
- (void)publishDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceDictionary:(id)a3;
- (void)setListener:(id)a3;
- (void)setLogger:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSMockRemotePlugin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceDictionary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDeviceDictionary:(id)a3
{
}

- (NSMutableDictionary)deviceDictionary
{
  return self->_deviceDictionary;
}

- (void)setDelegate:(id)a3
{
}

- (AVAudioRemoteInputPluginDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVAudioRemoteInputPluginDelegate *)WeakRetained;
}

- (void)setLogger:(id)a3
{
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_listener == v6)
  {
    v10 = MockRemotePluginXPCGetInterface();
    [v7 setExportedInterface:v10];

    v11 = [v7 valueForEntitlement:kCSMockRemotePluginServiceName];

    if (v11)
    {
      [v7 setExportedObject:self];
      [v7 resume];
      BOOL v9 = 1;
      goto LABEL_7;
    }
    [v7 invalidate];
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_0, (os_log_t)logger, OS_LOG_TYPE_ERROR, "we got unknown types of XPC connection request", v13, 2u);
    }
  }
  BOOL v9 = 0;
LABEL_7:

  return v9;
}

- (void)listMockRemoteDeviecesWithCompletion:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSMutableDictionary *)self->_deviceDictionary count])
  {
    v20 = v4;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v6 = self->_deviceDictionary;
    id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [(NSMutableDictionary *)self->_deviceDictionary objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          v12 = [v11 deviceName];
          [v5 addObject:v12];

          v13 = [v11 deviceUUID];
          v14 = [v13 UUIDString];
          [v5 addObject:v14];

          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
          {
            v16 = logger;
            v17 = [v11 deviceName];
            v18 = [v11 deviceUUID];
            *(_DWORD *)buf = 138412546;
            v26 = v17;
            __int16 v27 = 2112;
            v28 = v18;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "DeviceName %@ with UUID %@", buf, 0x16u);
          }
        }
        id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v8);
    }

    v4 = v20;
  }
  else
  {
    v19 = self->_logger;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "No devices to list", buf, 2u);
    }
  }
  if (v4) {
    v4[2](v4, v5);
  }
}

- (void)createMockRemoteDeviceWithName:(id)a3 deviceID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void, void *))a5;
  logger = self->_logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v43 = v8;
    __int16 v44 = 2112;
    id v45 = v9;
    _os_log_impl(&dword_0, (os_log_t)logger, OS_LOG_TYPE_DEFAULT, "Request to init device with deviceName : %@, deviceId : %@", buf, 0x16u);
  }
  v32 = v9;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v12 = [(NSMutableDictionary *)self->_deviceDictionary allKeys];
  id v33 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v33)
  {
    uint64_t v13 = *(void *)v38;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v12);
        }
        v15 = [(NSMutableDictionary *)self->_deviceDictionary objectForKey:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        v16 = [v15 deviceName];
        unsigned int v17 = [v16 isEqualToString:v8];

        if (v17)
        {
          v18 = self->_logger;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = v18;
            v20 = [v15 deviceName];
            [v15 deviceUUID];
            uint64_t v21 = v13;
            long long v22 = self;
            long long v23 = v10;
            id v24 = v8;
            v26 = v25 = v12;
            *(_DWORD *)buf = 138412546;
            id v43 = v20;
            __int16 v44 = 2112;
            id v45 = v26;
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "DeviceName %@ with UUID already exits%@", buf, 0x16u);

            v12 = v25;
            id v8 = v24;
            v10 = v23;
            self = v22;
            uint64_t v13 = v21;
          }
          __int16 v27 = [v15 deviceUUID];
          v10[2](v10, 1, 0, v27);
        }
      }
      id v33 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v33);
  }

  v28 = [[CSMockRemoteDevice alloc] initWithDeviceName:v8];
  v29 = v28;
  if (v28)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_299C;
    block[3] = &unk_83A8;
    v35 = v28;
    v36 = self;
    dispatch_async((dispatch_queue_t)queue, block);
  }
  if (v10)
  {
    v31 = [(CSMockRemoteDevice *)v29 deviceUUID];
    v10[2](v10, 1, 0, v31);
  }
}

- (void)publishDevice:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2A74;
  v7[3] = &unk_83A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)invalidate
{
  logger = self->_logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)logger, OS_LOG_TYPE_DEFAULT, "Invalidating Mock Remote Plugin", buf, 2u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2BC4;
  block[3] = &unk_8380;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  logger = self->_logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_0, (os_log_t)logger, OS_LOG_TYPE_DEFAULT, "Request inject audio %@ into device with UUID %@", buf, 0x16u);
  }
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v13 = [v8 path];
  v14 = [v12 URLForResource:v13 withExtension:0];

  if (!v14
    || (+[NSFileManager defaultManager],
        v15 = objc_claimAutoreleasedReturnValue(),
        [v14 path],
        v16 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v17 = [v15 fileExistsAtPath:v16],
        v16,
        v15,
        (v17 & 1) == 0))
  {
    v19 = self->_logger;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v14;
      _os_log_error_impl(&dword_0, (os_log_t)v19, OS_LOG_TYPE_ERROR, "Audio url %@ is nil, or url not existing in path", buf, 0xCu);
      if (!v10) {
        goto LABEL_9;
      }
    }
    else if (!v10)
    {
      goto LABEL_9;
    }
    v20 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    (*((void (**)(id, void, void *, void, void))v10 + 2))(v10, 0, v20, 0, 0);

    goto LABEL_9;
  }
  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_2F7C;
  v21[3] = &unk_8358;
  v21[4] = self;
  id v22 = v9;
  id v24 = v10;
  id v23 = v14;
  dispatch_async((dispatch_queue_t)queue, v21);

LABEL_9:
}

- (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  logger = self->_logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_0, (os_log_t)logger, OS_LOG_TYPE_DEFAULT, "Request disconnect device with UUID %@", buf, 0xCu);
  }
  if (!v6)
  {
    id v10 = self->_logger;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_0, (os_log_t)v10, OS_LOG_TYPE_ERROR, "input device uuid is nil", buf, 2u);
      if (!v7) {
        goto LABEL_8;
      }
    }
    else if (!v7)
    {
      goto LABEL_8;
    }
    v11 = +[NSError errorWithDomain:CSErrorDomain code:1651 userInfo:0];
    v7[2](v7, 0, v11);

    goto LABEL_8;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_34BC;
  block[3] = &unk_82E0;
  void block[4] = self;
  id v13 = v6;
  v14 = v7;
  dispatch_async((dispatch_queue_t)queue, block);

LABEL_8:
}

- (void)listen
{
  id v3 = objc_alloc((Class)NSXPCListener);
  id v4 = (NSXPCListener *)[v3 initWithMachServiceName:kCSMockRemotePluginServiceName];
  listener = self->_listener;
  self->_listener = v4;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  logger = self->_logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, (os_log_t)logger, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginXPCListener start listening", v7, 2u);
  }
}

- (NSArray)devices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_3848;
  id v10 = sub_3858;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3860;
  v5[3] = &unk_82B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (CSMockRemotePlugin)initWithPluginDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSMockRemotePlugin;
  id v5 = [(CSMockRemotePlugin *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("CSMockRemotePlugin", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    os_log_t v8 = os_log_create("com.apple.corespeech", "remote_mock_plugin");
    logger = v5->_logger;
    v5->_logger = (OS_os_log *)v8;

    [(CSMockRemotePlugin *)v5 setDelegate:v4];
    id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceDictionary = v5->_deviceDictionary;
    v5->_deviceDictionary = v10;

    [(CSMockRemotePlugin *)v5 listen];
  }

  return v5;
}

@end