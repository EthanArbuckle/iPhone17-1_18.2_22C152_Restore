@interface VCPCPUMonitor
+ (id)sharedCPUMonitor;
- (VCPCPUMonitor)init;
- (int)disableWithTimeoutSeconds:(int)a3;
- (void)cancelRequest:(int)a3;
- (void)dealloc;
@end

@implementation VCPCPUMonitor

- (VCPCPUMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPCPUMonitor;
  v2 = [(VCPCPUMonitor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v3;

    v2->_requestID = 0;
  }
  return v2;
}

+ (id)sharedCPUMonitor
{
  if (qword_100252430 != -1) {
    dispatch_once(&qword_100252430, &stru_100219E48);
  }
  v2 = (void *)qword_100252428;
  return v2;
}

- (void)dealloc
{
  getpid();
  if (proc_set_cpumon_defaults() && (int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to restore default CPU limits", buf, 2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPCPUMonitor;
  [(VCPCPUMonitor *)&v5 dealloc];
}

- (int)disableWithTimeoutSeconds:(int)a3
{
  if (a3 <= 0)
  {
    LODWORD(requestID) = -1;
  }
  else
  {
    objc_super v5 = self->_requests;
    objc_sync_enter(v5);
    v21 = +[NSDate date];
    objc_super v6 = [v21 dateByAddingTimeInterval:(double)a3];
    v7 = +[NSDate distantPast];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v8 = [(NSMutableDictionary *)self->_requests allValues];
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      do
      {
        v11 = 0;
        v12 = v7;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v8);
          }
          v7 = [v12 laterDate:*(void *)(*((void *)&v22 + 1) + 8 * (void)v11)];

          v11 = (char *)v11 + 1;
          v12 = v7;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v9);
    }

    if ([v7 compare:v6] != (id)-1) {
      goto LABEL_10;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Increasing CPU limits until %@", buf, 0xCu);
      }
    }
    getpid();
    if (proc_set_cpumon_params())
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v18 = VCPLogInstance();
        os_log_type_t v19 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v18, v19))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to increase CPU limits", buf, 2u);
        }
      }
      LODWORD(requestID) = -1;
    }
    else
    {
LABEL_10:
      uint64_t requestID = self->_requestID;
      self->_uint64_t requestID = requestID + 1;
      requests = self->_requests;
      v15 = +[NSNumber numberWithInt:requestID];
      [(NSMutableDictionary *)requests setObject:v6 forKeyedSubscript:v15];
    }
    objc_sync_exit(v5);
  }
  return requestID;
}

- (void)cancelRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v5 = self->_requests;
  objc_sync_enter(v5);
  requests = self->_requests;
  v7 = +[NSNumber numberWithInt:v3];
  v8 = [(NSMutableDictionary *)requests objectForKey:v7];

  if (v8)
  {
    id v9 = self->_requests;
    uint64_t v10 = +[NSNumber numberWithInt:v3];
    [(NSMutableDictionary *)v9 removeObjectForKey:v10];

    v11 = +[NSDate distantPast];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v12 = [(NSMutableDictionary *)self->_requests allValues];
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      do
      {
        v15 = 0;
        v16 = v11;
        do
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v12);
          }
          v11 = [v16 laterDate:*(void *)(*((void *)&v26 + 1) + 8 * (void)v15)];

          v15 = (char *)v15 + 1;
          v16 = v11;
        }
        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v13);
    }

    if ([v11 compare:v8] != (id)-1) {
      goto LABEL_33;
    }
    os_log_type_t v17 = +[NSDate date];
    if ([v17 compare:v11] == (id)-1)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        long long v24 = VCPLogInstance();
        os_log_type_t v25 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v24, v25))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v11;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "Updating CPU limits timeout to %@", buf, 0xCu);
        }
      }
      [v11 timeIntervalSinceDate:v17];
      getpid();
      if (!proc_set_cpumon_params() || (int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_32;
      }
      v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[4];
      if (!os_log_type_enabled(v20, v21)) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      long long v22 = "Failed to update CPU limits timeout";
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v18 = VCPLogInstance();
        os_log_type_t v19 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v18, v19))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "Restoring default CPU limits", buf, 2u);
        }
      }
      getpid();
      if (!proc_set_cpumon_defaults() || (int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_32;
      }
      v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[4];
      if (!os_log_type_enabled(v20, v21))
      {
LABEL_31:

LABEL_32:
LABEL_33:

        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      long long v22 = "Failed to restore default CPU limits";
    }
    _os_log_impl((void *)&_mh_execute_header, v20, v21, v22, buf, 2u);
    goto LABEL_31;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v11 = VCPLogInstance();
    os_log_type_t v23 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v11, v23))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, v23, "Invalid CPU monitor request specified (%d)", buf, 8u);
    }
    goto LABEL_33;
  }
LABEL_34:

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
}

@end