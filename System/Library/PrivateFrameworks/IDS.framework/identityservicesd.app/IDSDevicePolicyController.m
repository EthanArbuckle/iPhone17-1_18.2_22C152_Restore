@interface IDSDevicePolicyController
+ (id)sharedInstance;
- (BOOL)shouldBlackOutDeviceWithCbuuid:(id)a3;
- (IDSDevicePolicyController)init;
- (void)endFairplayAuthenticationForDeviceWithCbuuid:(id)a3;
- (void)startFairplayAuthenticationForDeviceWithCbuuid:(id)a3;
@end

@implementation IDSDevicePolicyController

+ (id)sharedInstance
{
  if (qword_100A4C9F0 != -1) {
    dispatch_once(&qword_100A4C9F0, &stru_10098CBD0);
  }
  v2 = (void *)qword_100A4C9F8;

  return v2;
}

- (IDSDevicePolicyController)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSDevicePolicyController;
  v2 = [(IDSDevicePolicyController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    devices = v3->_devices;
    v3->_devices = v4;
  }
  return v3;
}

- (void)startFairplayAuthenticationForDeviceWithCbuuid:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_devices objectForKey:v4];
  v6 = [v5 objectForKey:@"start-count"];
  objc_super v7 = (char *)[v6 integerValue];

  devices = self->_devices;
  v18[0] = @"start-count";
  v9 = +[NSNumber numberWithInteger:v7 + 1];
  v18[1] = @"start-time";
  v19[0] = v9;
  ids_monotonic_time();
  v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [(NSMutableDictionary *)devices setObject:v11 forKey:v4];

  v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_devices;
    *(_DWORD *)buf = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "started policy for %@, devices: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)endFairplayAuthenticationForDeviceWithCbuuid:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_devices removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)shouldBlackOutDeviceWithCbuuid:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    devices = self->_devices;
    *(_DWORD *)buf = 138412290;
    double v23 = *(double *)&devices;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "checking blackout for %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v21 = self->_devices;
    _IDSLogV();
  }
  v8 = -[NSMutableDictionary objectForKey:](self->_devices, "objectForKey:", v4, v21);
  v9 = v8;
  if (!v8) {
    goto LABEL_22;
  }
  v10 = [v8 objectForKey:@"start-time"];
  [v10 doubleValue];
  double v12 = v11;

  ids_monotonic_time();
  double v14 = v13 - v12;
  if (v14 >= 10800.0)
  {
    [(NSMutableDictionary *)self->_devices removeObjectForKey:v4];
    v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v23 = v14;
      __int16 v24 = 1024;
      int v25 = 10800;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "repeated fairplay failure blackout lifted (elapse %0.6lf > window %0.1d)", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          _IDSLogV();
          BOOL v18 = 0;
          goto LABEL_23;
        }
      }
    }
LABEL_22:
    BOOL v18 = 0;
    goto LABEL_23;
  }
  id v15 = [v9 objectForKey:@"start-count"];
  uint64_t v16 = (uint64_t)[v15 integerValue];

  if (v16 < 5) {
    goto LABEL_22;
  }
  v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v23 = 10800.0 - v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "blackout due to repeated fairplay failure (blackout ending in %0.6lf seconds)", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  BOOL v18 = 1;
LABEL_23:

  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (void).cxx_destruct
{
}

@end