@interface IDSDeviceConnectionAWDMetrics
+ (id)sharedInstance;
- (BOOL)_canReportMetric:(id)a3;
- (IDSDeviceConnectionAWDMetrics)init;
- (id)_currentMetrics;
- (id)awdMetricsForConnectionUUID:(id)a3;
- (void)_reportAndRemoveForConnectionUUID:(id)a3;
- (void)_setCreatedAt:(id)a3 forConnectionUUID:(id)a4;
- (void)reportAndRemoveForConnectionUUID:(id)a3;
- (void)setClientInitTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setClientOpenSocketCompletionTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setConnectionInitTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setDaemonOpenSocketCompletionTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setDaemonOpenSocketTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setFirstPacketReceiveTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setServiceName:(id)a3 forConnectionUUID:(id)a4;
- (void)setSuccess:(BOOL)a3 forConnectionUUID:(id)a4;
@end

@implementation IDSDeviceConnectionAWDMetrics

+ (id)sharedInstance
{
  if (qword_100A4C908 != -1) {
    dispatch_once(&qword_100A4C908, &stru_10098B590);
  }
  if (qword_100A4C910 != -1) {
    dispatch_once(&qword_100A4C910, &stru_10098B5B0);
  }
  if (qword_100A4C918 != -1) {
    dispatch_once(&qword_100A4C918, &stru_10098B5D0);
  }
  v2 = (void *)qword_100A4C920;

  return v2;
}

- (IDSDeviceConnectionAWDMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSDeviceConnectionAWDMetrics;
  v2 = [(IDSDeviceConnectionAWDMetrics *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    metrics = v2->_metrics;
    v2->_metrics = v3;

    v2->_writeLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)awdMetricsForConnectionUUID:(id)a3
{
  id v4 = a3;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  objc_super v6 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v4];
  if (!v6)
  {
    objc_super v6 = +[NSMutableDictionary dictionary];
    id v7 = [v4 copy];
    [v6 setObject:v7 forKeyedSubscript:IDSDeviceConnectionAWDMetricsConnectionUUIDKey];

    ids_monotonic_time();
    v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v6 setObject:v8 forKeyedSubscript:IDSDeviceConnectionAWDMetricsCreatedAtKey];

    [(NSMutableDictionary *)self->_metrics setObject:v6 forKeyedSubscript:v4];
  }
  v9 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v4];
  id v10 = [v9 mutableCopy];

  os_unfair_lock_unlock(p_writeLock);

  return v10;
}

- (void)_reportAndRemoveForConnectionUUID:(id)a3
{
  id v4 = a3;
  ids_monotonic_time();
  uint64_t v6 = v5;
  id v7 = +[NSMutableArray array];
  os_unfair_lock_lock(&self->_writeLock);
  metrics = self->_metrics;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003DC758;
  v14[3] = &unk_10098B5F8;
  uint64_t v16 = v6;
  id v9 = v7;
  id v15 = v9;
  [(NSMutableDictionary *)metrics enumerateKeysAndObjectsUsingBlock:v14];
  id v10 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v4];

  if (v10)
  {
    v11 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v4];
    [v9 addObject:v11];
  }
  else
  {
    v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Can't find AWD metrics for %@", buf, 0xCu);
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
  }
  os_unfair_lock_unlock(&self->_writeLock);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003DC7EC;
  v13[3] = &unk_10097FE80;
  v13[4] = self;
  [v9 enumerateObjectsUsingBlock:v13];
}

- (void)reportAndRemoveForConnectionUUID:(id)a3
{
}

- (void)setServiceName:(id)a3 forConnectionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v9 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v7];
  if (v9)
  {
    id v10 = [v6 copy];
    [v9 setObject:v10 forKeyedSubscript:IDSDeviceConnectionAWDMetricsServiceNameKey];

    os_unfair_lock_unlock(p_writeLock);
  }
  else
  {
    os_unfair_lock_unlock(p_writeLock);
    v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = IDSDeviceConnectionAWDMetricsServiceNameKey;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "There is no metric dictionary for %@, %@", buf, 0x16u);
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
  }
}

- (void)setClientInitTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  v8 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = +[NSNumber numberWithDouble:a3];
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsClientInitKey];

    os_unfair_lock_unlock(p_writeLock);
  }
  else
  {
    os_unfair_lock_unlock(p_writeLock);
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = IDSDeviceConnectionAWDMetricsClientInitKey;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There is no metric dictionary for %@, %@", buf, 0x16u);
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
  }
}

- (void)setConnectionInitTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  v8 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = +[NSNumber numberWithDouble:a3];
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsConnectionInitKey];

    os_unfair_lock_unlock(p_writeLock);
  }
  else
  {
    os_unfair_lock_unlock(p_writeLock);
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = IDSDeviceConnectionAWDMetricsConnectionInitKey;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There is no metric dictionary for %@, %@", buf, 0x16u);
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
  }
}

- (void)setDaemonOpenSocketTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  v8 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = +[NSNumber numberWithDouble:a3];
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsDaemonOpenSocketKey];
  }
  os_unfair_lock_unlock(p_writeLock);
  id v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = IDSDeviceConnectionAWDMetricsDaemonOpenSocketKey;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There is no metric dictionary for %@, %@", buf, 0x16u);
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
}

- (void)setFirstPacketReceiveTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  v8 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = +[NSNumber numberWithDouble:a3];
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsFirstDataPacketReceiveKey];

    os_unfair_lock_unlock(p_writeLock);
  }
  else
  {
    os_unfair_lock_unlock(p_writeLock);
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = IDSDeviceConnectionAWDMetricsFirstDataPacketReceiveKey;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There is no metric dictionary for %@, %@", buf, 0x16u);
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
  }
}

- (void)setDaemonOpenSocketCompletionTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  v8 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = +[NSNumber numberWithDouble:a3];
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsDaemonCompletionHandlerKey];

    os_unfair_lock_unlock(p_writeLock);
  }
  else
  {
    os_unfair_lock_unlock(p_writeLock);
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = IDSDeviceConnectionAWDMetricsDaemonCompletionHandlerKey;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There is no metric dictionary for %@, %@", buf, 0x16u);
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
  }
}

- (void)setClientOpenSocketCompletionTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  v8 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = +[NSNumber numberWithDouble:a3];
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsClientOpenSocketCompletionKey];

    os_unfair_lock_unlock(p_writeLock);
  }
  else
  {
    os_unfair_lock_unlock(p_writeLock);
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = IDSDeviceConnectionAWDMetricsClientOpenSocketCompletionKey;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There is no metric dictionary for %@, %@", buf, 0x16u);
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
  }
}

- (void)setSuccess:(BOOL)a3 forConnectionUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  v8 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = +[NSNumber numberWithBool:v4];
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsSuccessKey];

    os_unfair_lock_unlock(p_writeLock);
  }
  else
  {
    os_unfair_lock_unlock(p_writeLock);
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = IDSDeviceConnectionAWDMetricsSuccessKey;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There is no metric dictionary for %@, %@", buf, 0x16u);
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
  }
}

- (void)_setCreatedAt:(id)a3 forConnectionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v9 = [(NSMutableDictionary *)self->_metrics objectForKeyedSubscript:v7];
  if (v9)
  {
    id v10 = [v6 copy];
    [v9 setObject:v10 forKeyedSubscript:IDSDeviceConnectionAWDMetricsCreatedAtKey];

    os_unfair_lock_unlock(p_writeLock);
  }
  else
  {
    os_unfair_lock_unlock(p_writeLock);
    v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = IDSDeviceConnectionAWDMetricsCreatedAtKey;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "There is no metric dictionary for %@, %@", buf, 0x16u);
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
  }
}

- (BOOL)_canReportMetric:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:IDSDeviceConnectionAWDMetricsClientOpenSocketCompletionKey];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_currentMetrics
{
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v4 = [(NSMutableDictionary *)self->_metrics copy];
  os_unfair_lock_unlock(p_writeLock);

  return v4;
}

- (void).cxx_destruct
{
}

@end