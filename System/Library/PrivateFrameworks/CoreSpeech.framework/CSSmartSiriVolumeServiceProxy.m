@interface CSSmartSiriVolumeServiceProxy
- (CSSmartSiriVolumeManager)ssvManager;
- (CSSmartSiriVolumeServiceProxy)init;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)xpcConnection;
- (void)getVolumeForTTSType:(unint64_t)a3 withContext:(id)a4 reply:(id)a5;
- (void)setListenerDelegate:(id)a3;
- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSmartSiriVolumeDirection:(BOOL)a3;
- (void)setSmartSiriVolumePercentage:(float)a3;
- (void)setSsvManager:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSSmartSiriVolumeServiceProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssvManager, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setSsvManager:(id)a3
{
}

- (CSSmartSiriVolumeManager)ssvManager
{
  return self->_ssvManager;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[CSSmartSiriVolumeManager sharedInstance];
  v5 = v4;
  if (v4)
  {
    [v4 setPermanentVolumeOffsetWithDirection:v3];
  }
  else
  {
    v6 = +[NSString stringWithFormat:@"SmartSiriVolume not supported on this device type. smartSiriVolume : %p", 0];
    v7 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSSmartSiriVolumeServiceProxy setPermanentVolumeOffsetWithDirection:]";
      __int16 v10 = 2114;
      v11 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
  }
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[CSSmartSiriVolumeManager sharedInstance];
  v5 = v4;
  if (v4)
  {
    [v4 setSmartSiriVolumeDirection:v3];
  }
  else
  {
    v6 = +[NSString stringWithFormat:@"SmartSiriVolume not supported on this device type. smartSiriVolume : %p", 0];
    v7 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSSmartSiriVolumeServiceProxy setSmartSiriVolumeDirection:]";
      __int16 v10 = 2114;
      v11 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
  }
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
  v4 = +[CSSmartSiriVolumeManager sharedInstance];
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = a3;
    [v4 setSmartSiriVolumePercentage:v5];
  }
  else
  {
    v7 = +[NSString stringWithFormat:@"SmartSiriVolume not supported on this device type. smartSiriVolume : %p", 0];
    v8 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v10 = "-[CSSmartSiriVolumeServiceProxy setSmartSiriVolumePercentage:]";
      __int16 v11 = 2114;
      v12 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
  }
}

- (void)getVolumeForTTSType:(unint64_t)a3 withContext:(id)a4 reply:(id)a5
{
  v7 = (void (**)(id, void *, void *))a5;
  v8 = [a4 objectForKeyedSubscript:@"overrideMediaVolume"];
  v9 = +[CSSmartSiriVolumeManager sharedInstance];
  if (v9)
  {
    uint64_t v10 = [v9 getVolumeForTTSType:a3 withOverrideMediaVolume:v8 WithRequestTime:mach_absolute_time()];
    if (v10)
    {
      __int16 v11 = (void *)v10;
      v12 = 0;
      if (!v7) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    v13 = +[NSString stringWithFormat:@"SSV Manager returned estimate as nil"];
    v19 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[CSSmartSiriVolumeServiceProxy getVolumeForTTSType:withContext:reply:]";
      __int16 v27 = 2114;
      v28 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    uint64_t v20 = CSErrorDomain;
    CFStringRef v23 = @"reason";
    v24 = v13;
    v16 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v17 = v20;
    uint64_t v18 = 1701;
  }
  else
  {
    v13 = +[NSString stringWithFormat:@"SmartSiriVolume not supported on this device type. smartSiriVolume : %p", 0];
    v14 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[CSSmartSiriVolumeServiceProxy getVolumeForTTSType:withContext:reply:]";
      __int16 v27 = 2114;
      v28 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    uint64_t v15 = CSErrorDomain;
    CFStringRef v21 = @"reason";
    v22 = v13;
    v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v17 = v15;
    uint64_t v18 = 1702;
  }
  v12 = +[NSError errorWithDomain:v17 code:v18 userInfo:v16];

  __int16 v11 = 0;
  if (v7) {
LABEL_12:
  }
    v7[2](v7, v12, v11);
LABEL_13:
}

- (void)setListenerDelegate:(id)a3
{
}

- (CSSmartSiriVolumeServiceProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSSmartSiriVolumeServiceProxy;
  v2 = [(CSSmartSiriVolumeServiceProxy *)&v8 init];
  if (v2
    && (+[CSSmartSiriVolumeManager sharedInstance],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        ssvManager = v2->_ssvManager,
        v2->_ssvManager = (CSSmartSiriVolumeManager *)v3,
        ssvManager,
        !v2->_ssvManager))
  {
    v6 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[CSSmartSiriVolumeServiceProxy init]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s ERR: Failed to initialize SSV Manager!", buf, 0xCu);
    }
    double v5 = 0;
  }
  else
  {
    double v5 = v2;
  }

  return v5;
}

@end