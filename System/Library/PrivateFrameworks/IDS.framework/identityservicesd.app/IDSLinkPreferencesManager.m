@interface IDSLinkPreferencesManager
+ (id)sharedInstance;
- (BOOL)_validatePreferences:(id)a3 forService:(id)a4;
- (IDSLinkPreferencesManager)init;
- (id)accumulativePreferencesForAllServices;
- (id)preferencesForService:(id)a3;
- (void)_logRequestInPowerDictionaryForService:(id)a3 preferences:(id)a4;
- (void)dealloc;
- (void)resetPreferencesForAllServices;
- (void)updateService:(id)a3 withPreferences:(id)a4;
@end

@implementation IDSLinkPreferencesManager

+ (id)sharedInstance
{
  if (qword_100A4A7C8 != -1) {
    dispatch_once(&qword_100A4A7C8, &stru_100983648);
  }
  v2 = (void *)qword_100A4A7D0;

  return v2;
}

- (IDSLinkPreferencesManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)IDSLinkPreferencesManager;
  v2 = [(IDSLinkPreferencesManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_preferencesLock, 0);
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    servicesWithPreferences = v3->_servicesWithPreferences;
    v3->_servicesWithPreferences = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("IDSPowerLogQueue", v6);
    power_log_queue = v3->_power_log_queue;
    v3->_power_log_queue = (OS_dispatch_queue *)v7;
  }
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_preferencesLock);
  servicesWithPreferences = self->_servicesWithPreferences;
  self->_servicesWithPreferences = 0;

  power_log_queue = self->_power_log_queue;
  self->_power_log_queue = 0;

  v5.receiver = self;
  v5.super_class = (Class)IDSLinkPreferencesManager;
  [(IDSLinkPreferencesManager *)&v5 dealloc];
}

- (void)updateService:(id)a3 withPreferences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IDSLinkPreferencesManager *)self _validatePreferences:v7 forService:v6])
  {
    id v8 = [v7 mutableCopy];
    v9 = +[NSDate date];
    [v8 setObject:v9 forKey:@"Timestamp"];
    objc_super v10 = +[NSDictionary dictionaryWithDictionary:v8];

    pthread_mutex_lock(&self->_preferencesLock);
    [(NSMutableDictionary *)self->_servicesWithPreferences setObject:v10 forKey:v6];
    pthread_mutex_unlock(&self->_preferencesLock);
    v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = v6;
      __int16 v16 = 2114;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "updateService: %{public}@, withPreferences: %{public}@.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v12 = v6;
      v13 = v10;
      _IDSLogV();
    }
    -[IDSLinkPreferencesManager _logRequestInPowerDictionaryForService:preferences:](self, "_logRequestInPowerDictionaryForService:preferences:", v6, v8, v12, v13);
  }
  else
  {
    objc_super v10 = v7;
  }
}

- (void)resetPreferencesForAllServices
{
  p_preferencesLock = &self->_preferencesLock;
  pthread_mutex_lock(&self->_preferencesLock);
  id v3 = [(NSMutableDictionary *)self->_servicesWithPreferences mutableCopy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v16 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(v4);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v8 = [v4 objectForKey:v7];
        id v9 = [v8 mutableCopy];
        [v9 setObject:&off_1009D16B0 forKey:@"PacketsPerSecond"];
        [v9 setObject:&off_1009D16B0 forKey:@"InputBytesPerSecond"];
        [v9 setObject:&off_1009D16B0 forKey:@"OutputBytesPerSecond"];
        [v9 removeObjectForKey:@"Intent"];
        objc_super v10 = +[NSDate date];
        [v9 setObject:v10 forKey:@"Timestamp"];
        v11 = +[NSDictionary dictionaryWithDictionary:v9];

        id v12 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v22 = v7;
          __int16 v23 = 2114;
          v24 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resetting preferences to 0 for service: %{public}@, at time: %{public}@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v13 = v7;
          v14 = v10;
          _IDSLogV();
        }
        -[NSMutableDictionary setObject:forKey:](self->_servicesWithPreferences, "setObject:forKey:", v11, v7, v13, v14);
        [(IDSLinkPreferencesManager *)self _logRequestInPowerDictionaryForService:v7 preferences:v9];
      }
      id v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }

  pthread_mutex_unlock(p_preferencesLock);
}

- (BOOL)_validatePreferences:(id)a3 forService:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [v5 objectForKey:@"PacketsPerSecond"];
    id v8 = [v5 objectForKey:@"InputBytesPerSecond"];
    id v9 = [v5 objectForKey:@"OutputBytesPerSecond"];
    if (([v7 intValue] & 0x80000000) != 0
      || ([v8 intValue] & 0x80000000) != 0
      || ([v9 intValue] & 0x80000000) != 0)
    {
      v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v14 = v6;
        __int16 v15 = 2114;
        id v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cannot update preferences for service: %{public}@ with negative values, preferences: %{public}@.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      BOOL v10 = 0;
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)preferencesForService:(id)a3
{
  p_preferencesLock = &self->_preferencesLock;
  id v5 = a3;
  pthread_mutex_lock(p_preferencesLock);
  id v6 = [(NSMutableDictionary *)self->_servicesWithPreferences objectForKey:v5];

  pthread_mutex_unlock(p_preferencesLock);

  return v6;
}

- (id)accumulativePreferencesForAllServices
{
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  p_preferencesLock = &self->_preferencesLock;
  pthread_mutex_lock(&self->_preferencesLock);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v28 = self;
  obj = self->_servicesWithPreferences;
  id v30 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v30)
  {
    CFStringRef v29 = 0;
    uint64_t v32 = 0;
    unsigned int v31 = 0;
    LODWORD(v3) = 0;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v6 = [(NSMutableDictionary *)v28->_servicesWithPreferences objectForKey:v5];
        uint64_t v7 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v5;
          __int16 v39 = 2114;
          v40 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Getting accumulativePreferencesForAllServices. Service: %{public}@, preferences: %{public}@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v22 = v5;
          __int16 v23 = v6;
          _IDSLogV();
        }
        id v8 = objc_msgSend(v6, "objectForKey:", @"PacketsPerSecond", v22, v23, p_preferencesLock);
        id v9 = [v6 objectForKey:@"InputBytesPerSecond"];
        BOOL v10 = [v6 objectForKey:@"OutputBytesPerSecond"];
        v11 = [v6 objectForKey:@"Intent"];
        unsigned int v12 = [v8 unsignedIntValue];
        unsigned int v13 = [v9 unsignedIntValue];
        unsigned int v14 = [v10 unsignedIntValue];
        if ((v32 & 0x100000000) != 0)
        {
          BYTE4(v32) = 1;
        }
        else
        {
          HIDWORD(v32) = [v11 isEqualToString:@"forceBTClassic"];
          CFStringRef v15 = v29;
          if (HIDWORD(v32)) {
            CFStringRef v15 = @"forceBTClassic";
          }
          CFStringRef v29 = v15;
        }

        uint64_t v3 = v12 + v3;
        v31 += v13;
        LODWORD(v32) = v14 + v32;
      }
      id v30 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v30);
  }
  else
  {
    CFStringRef v29 = 0;
    unsigned int v31 = 0;
    LODWORD(v32) = 0;
    uint64_t v3 = 0;
  }

  pthread_mutex_unlock(p_preferencesLock);
  id v16 = +[NSNumber numberWithUnsignedInt:v3];
  [v25 setObject:v16 forKeyedSubscript:@"PacketsPerSecond"];

  long long v17 = +[NSNumber numberWithUnsignedInt:v31];
  [v25 setObject:v17 forKeyedSubscript:@"InputBytesPerSecond"];

  long long v18 = +[NSNumber numberWithUnsignedInt:v32];
  [v25 setObject:v18 forKeyedSubscript:@"OutputBytesPerSecond"];

  [v25 setObject:v29 forKeyedSubscript:@"Intent"];
  long long v19 = +[NSDate date];
  [v25 setObject:v19 forKeyedSubscript:@"Timestamp"];

  long long v20 = +[NSDictionary dictionaryWithDictionary:v25];

  return v20;
}

- (void)_logRequestInPowerDictionaryForService:(id)a3 preferences:(id)a4
{
  id v6 = a4;
  [v6 setObject:a3 forKey:@"ServiceName"];
  power_log_queue = self->_power_log_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100139300;
  block[3] = &unk_10097E4D0;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(power_log_queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_power_log_queue, 0);

  objc_storeStrong((id *)&self->_servicesWithPreferences, 0);
}

@end