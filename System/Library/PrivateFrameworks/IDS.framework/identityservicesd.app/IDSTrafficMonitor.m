@interface IDSTrafficMonitor
+ (id)sharedInstance;
- (BOOL)_noteActionType:(id)a3 forService:(id)a4 serviceType:(unsigned int)a5 requestor:(id)a6;
- (BOOL)noteOutgoingFallbackMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5;
- (BOOL)noteOutgoingMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5;
- (BOOL)noteOutgoingServerMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5;
- (BOOL)noteQueryForService:(id)a3 requestor:(id)a4;
- (BOOL)noteQueryRequestForService:(id)a3 requestor:(id)a4;
- (IDSTrafficMonitor)init;
- (void)_dailyTimerHandler;
- (void)_setDailyTimer;
- (void)_setHourlyTimer;
- (void)dealloc;
- (void)logState;
- (void)noteIncomingLocalMessageForService:(id)a3;
- (void)noteIncomingMessageForService:(id)a3;
@end

@implementation IDSTrafficMonitor

+ (id)sharedInstance
{
  if (qword_100A4A648 != -1) {
    dispatch_once(&qword_100A4A648, &stru_100982038);
  }
  v2 = (void *)qword_100A4A650;

  return v2;
}

- (IDSTrafficMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSTrafficMonitor;
  v2 = [(IDSTrafficMonitor *)&v6 init];
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v3;

    [(IDSTrafficMonitor *)v2 _setDailyTimer];
    [(IDSTrafficMonitor *)v2 _setHourlyTimer];
  }
  return v2;
}

- (void)dealloc
{
  hourlyTimer = self->_hourlyTimer;
  if (hourlyTimer)
  {
    [(IMDispatchTimer *)hourlyTimer invalidate];
    v4 = self->_hourlyTimer;
    self->_hourlyTimer = 0;
  }
  dailyTimer = self->_dailyTimer;
  if (dailyTimer)
  {
    [(IMDispatchTimer *)dailyTimer invalidate];
    objc_super v6 = self->_dailyTimer;
    self->_dailyTimer = 0;
  }
  [(NSRecursiveLock *)self->_lock lock];
  traffic = self->_traffic;
  self->_traffic = 0;

  [(NSRecursiveLock *)self->_lock unlock];
  v8.receiver = self;
  v8.super_class = (Class)IDSTrafficMonitor;
  [(IDSTrafficMonitor *)&v8 dealloc];
}

- (void)_dailyTimerHandler
{
  [(IDSTrafficMonitor *)self logState];
  [(NSRecursiveLock *)self->_lock lock];
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** Clearing traffic ***", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  traffic = self->_traffic;
  self->_traffic = 0;

  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_setDailyTimer
{
  id v3 = objc_alloc((Class)IMDispatchTimer);
  v4 = im_primary_queue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F166C;
  v7[3] = &unk_100980598;
  v7[4] = self;
  v5 = (IMDispatchTimer *)[v3 initWithQueue:v4 interval:86400 repeats:1 handlerBlock:v7];
  dailyTimer = self->_dailyTimer;
  self->_dailyTimer = v5;
}

- (void)_setHourlyTimer
{
  id v3 = objc_alloc((Class)IMDispatchTimer);
  v4 = im_primary_queue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F1730;
  v7[3] = &unk_100980598;
  v7[4] = self;
  v5 = (IMDispatchTimer *)[v3 initWithQueue:v4 interval:3600 repeats:1 handlerBlock:v7];
  hourlyTimer = self->_hourlyTimer;
  self->_hourlyTimer = v5;
}

- (BOOL)_noteActionType:(id)a3 forService:(id)a4 serviceType:(unsigned int)a5 requestor:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  v10 = (__CFString *)a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a6;
  if ([(__CFString *)v10 length] && [(__CFString *)v11 length])
  {
    v76 = v12;
    [(NSRecursiveLock *)self->_lock lock];
    traffic = self->_traffic;
    if (!traffic)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v15 = self->_traffic;
      self->_traffic = Mutable;

      traffic = self->_traffic;
    }
    v16 = [(NSMutableDictionary *)traffic objectForKey:v11];
    if (!v16)
    {
      v16 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      [(NSMutableDictionary *)self->_traffic setObject:v16 forKey:v11];
    }
    v77 = v16;
    v17 = [v16 objectForKey:v10];
    +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)[v17 longLongValue] + 1);
    v79 = (__CFString *)objc_claimAutoreleasedReturnValue();

    [v16 setObject:v79 forKey:v10];
    if (v7 == -1)
    {
      v78 = 0;
      v19 = 0;
    }
    else
    {
      v18 = +[NSString stringWithFormat:@"global-%u", v7];
      v19 = [(NSMutableDictionary *)self->_traffic objectForKey:v18];
      if (!v19)
      {
        v19 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        [(NSMutableDictionary *)self->_traffic setObject:v19 forKey:v18];
      }
      v20 = [v19 objectForKey:v18];
      +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)[v20 longLongValue] + 1);
      v78 = (__CFString *)objc_claimAutoreleasedReturnValue();

      [v19 setObject:v78 forKey:v18];
    }
    v22 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      CFStringRef v81 = v10;
      __int16 v82 = 2112;
      v83 = v11;
      __int16 v84 = 2112;
      v85 = v76;
      __int16 v86 = 1024;
      unsigned int v87 = [(__CFString *)v79 intValue];
      __int16 v88 = 1024;
      int v89 = v7;
      __int16 v90 = 2112;
      v91 = v78;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "  == Incrementing %@ for service: %@   Requestor: %@  (Count: %d, GlobalCountForAdhocType%u: %@)", buf, 0x36u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v73 = v7;
      v74 = v78;
      v70 = v76;
      id v72 = [(__CFString *)v79 intValue];
      v64 = v10;
      v67 = v11;
      _IDSLogV();
    }
    if (([(__CFString *)v10 isEqualToIgnoringCase:@"outgoing-messages", v64, v67, v70, v72, v73, v74] & 1) != 0|| [(__CFString *)v10 isEqualToIgnoringCase:@"outgoing-fallback-messages"])
    {
      if ([(__CFString *)v10 isEqualToIgnoringCase:@"outgoing-messages"]) {
        CFStringRef v23 = &stru_10099BE78;
      }
      else {
        CFStringRef v23 = @"-fallback";
      }
      if (v78)
      {
        v24 = +[NSString stringWithFormat:@"peer%@-message-budget-global-daily-%u", v23, v7];
        v25 = +[IDSServerBag sharedInstanceForBagType:1];
        v26 = [v25 objectForKey:v24];

        if ((int)[(__CFString *)v26 intValue] >= 1)
        {
          v27 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            CFStringRef v81 = v23;
            __int16 v82 = 2112;
            v83 = v26;
            __int16 v84 = 2112;
            v85 = v78;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "     Server daily global%@ budget is: %@   Current count is: %@", buf, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            v69 = v26;
            v71 = v78;
            CFStringRef v66 = v23;
            _IDSLogV();
          }
          id v28 = [(__CFString *)v78 unsignedLongLongValue];
          if (v28 > [(__CFString *)v26 unsignedLongLongValue])
          {
            v29 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "     **** we are over budget", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
            v30 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v81 = v26;
              __int16 v82 = 2112;
              v83 = v78;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "     **** We are over budget - Server daily global budget is: %@   Current count is: %@", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                CFStringRef v65 = v26;
                v68 = v78;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  CFStringRef v65 = v26;
                  v68 = v78;
                  _IDSLogV();
                }
              }
            }
LABEL_56:
            int v35 = 0;
LABEL_124:

            BOOL v21 = v35 != 0;
LABEL_125:
            [(NSRecursiveLock *)self->_lock unlock];

            v12 = v76;
            goto LABEL_126;
          }
        }
      }
      v24 = +[NSString stringWithFormat:@"peer%@-message-budget-daily-%@", v23, v11];
      v31 = +[IDSServerBag sharedInstanceForBagType:1];
      v26 = [v31 objectForKey:v24];

      if ((int)[(__CFString *)v26 intValue] >= 1)
      {
        v32 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          CFStringRef v81 = v23;
          __int16 v82 = 2112;
          v83 = v26;
          __int16 v84 = 2112;
          v85 = v79;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "     Server daily%@ budget is: %@   Current count is: %@", buf, 0x20u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v68 = v26;
          v71 = v79;
          CFStringRef v65 = v23;
          _IDSLogV();
        }
        id v33 = [(__CFString *)v79 unsignedLongLongValue];
        if (v33 > [(__CFString *)v26 unsignedLongLongValue])
        {
          v34 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            CFStringRef v81 = v23;
            __int16 v82 = 2112;
            v83 = v26;
            __int16 v84 = 2112;
            v85 = v79;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "     **** We are over budget - Server service%@ budget is: %@   Current count is: %@", buf, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              v68 = v26;
              v71 = v79;
              CFStringRef v65 = v23;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                v68 = v26;
                v71 = v79;
                CFStringRef v65 = v23;
                _IDSLogV();
              }
            }
          }
          goto LABEL_56;
        }
LABEL_103:
        int v35 = 1;
        goto LABEL_124;
      }
      if (v7 == -1)
      {
        v53 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "     No budget specified", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        goto LABEL_103;
      }
      v75 = +[NSString stringWithFormat:@"peer%@-message-budget-default-daily-%u", v23, v7];
      v43 = +[IDSServerBag sharedInstanceForBagType:1];
      v44 = [v43 objectForKey:v75];

      if ((int)[(__CFString *)v44 intValue] < 1)
      {
        v59 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "     No budget specified", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
      else
      {
        v45 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          CFStringRef v81 = v23;
          __int16 v82 = 2112;
          v83 = v44;
          __int16 v84 = 2112;
          v85 = v79;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "     Server daily%@ default budget is: %@   Current count is: %@", buf, 0x20u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v68 = v44;
          v71 = v79;
          CFStringRef v65 = v23;
          _IDSLogV();
        }
        id v46 = [(__CFString *)v79 unsignedLongLongValue];
        if (v46 > [(__CFString *)v44 unsignedLongLongValue])
        {
          v47 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            CFStringRef v81 = v23;
            __int16 v82 = 2112;
            v83 = v44;
            __int16 v84 = 2112;
            v85 = v79;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "     **** We are over budget - Server daily%@ default budget is: %@   Current count is: %@", buf, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              v68 = v44;
              v71 = v79;
              CFStringRef v65 = v23;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                v68 = v44;
                v71 = v79;
                CFStringRef v65 = v23;
                _IDSLogV();
              }
            }
          }
          int v35 = 0;
          goto LABEL_123;
        }
      }
      int v35 = 1;
LABEL_123:

      goto LABEL_124;
    }
    if (![(__CFString *)v10 isEqualToIgnoringCase:@"outgoing-server-messages"])
    {
      if (![(__CFString *)v10 isEqualToIgnoringCase:@"query-requests"])
      {
        if (![(__CFString *)v10 isEqualToIgnoringCase:@"queries"])
        {
          BOOL v21 = 1;
          goto LABEL_125;
        }
        v36 = +[NSString stringWithFormat:@"query-budget-daily-%@", v11];
        v54 = +[IDSServerBag sharedInstanceForBagType:1];
        v38 = [v54 objectForKey:v36];

        int v55 = [(__CFString *)v38 intValue];
        BOOL v21 = v55 < 1;
        if (v55 < 1)
        {
          v63 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "     No budget specified", buf, 2u);
          }

          if os_log_shim_legacy_logging_enabled() && (_IDSShouldLog()) {
            goto LABEL_138;
          }
        }
        else
        {
          v56 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v81 = v38;
            __int16 v82 = 2112;
            v83 = v79;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "     Server daily budget is: %@   Current count is: %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            CFStringRef v65 = v38;
            v68 = v79;
            _IDSLogV();
          }
          id v57 = [(__CFString *)v79 unsignedLongLongValue];
          if (v57 > [(__CFString *)v38 unsignedLongLongValue])
          {
            v58 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "     **** we are over budget", buf, 2u);
            }

            if (!os_log_shim_legacy_logging_enabled() || (_IDSShouldLog() & 1) == 0)
            {
              BOOL v21 = 0;
              goto LABEL_148;
            }
            goto LABEL_138;
          }
        }
        BOOL v21 = 1;
        goto LABEL_148;
      }
      v36 = +[NSString stringWithFormat:@"query-ui-budget-daily-%@", v11];
      v48 = +[IDSServerBag sharedInstanceForBagType:1];
      v38 = [v48 objectForKey:v36];

      int v49 = [(__CFString *)v38 intValue];
      BOOL v21 = v49 < 1;
      if (v49 < 1)
      {
        v62 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "     No budget specified", buf, 2u);
        }

        if os_log_shim_legacy_logging_enabled() && (_IDSShouldLog()) {
          goto LABEL_138;
        }
      }
      else
      {
        v50 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v81 = v38;
          __int16 v82 = 2112;
          v83 = v79;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "     Server daily budget is: %@   Current count is: %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          CFStringRef v65 = v38;
          v68 = v79;
          _IDSLogV();
        }
        id v51 = [(__CFString *)v79 unsignedLongLongValue];
        if (v51 > [(__CFString *)v38 unsignedLongLongValue])
        {
          v52 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "     **** we are over budget", buf, 2u);
          }

          if (!os_log_shim_legacy_logging_enabled() || (_IDSShouldLog() & 1) == 0)
          {
            BOOL v21 = 0;
            goto LABEL_148;
          }
          goto LABEL_138;
        }
      }
      BOOL v21 = 1;
      goto LABEL_148;
    }
    v36 = +[NSString stringWithFormat:@"server-message-budget-daily-%@", v11];
    v37 = +[IDSServerBag sharedInstanceForBagType:1];
    v38 = [v37 objectForKey:v36];

    int v39 = [(__CFString *)v38 intValue];
    BOOL v21 = v39 < 1;
    if (v39 < 1)
    {
      v61 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "     No budget specified", buf, 2u);
      }

      if os_log_shim_legacy_logging_enabled() && (_IDSShouldLog()) {
        goto LABEL_138;
      }
    }
    else
    {
      v40 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v81 = v38;
        __int16 v82 = 2112;
        v83 = v79;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "     Server daily budget is: %@   Current count is: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        CFStringRef v65 = v38;
        v68 = v79;
        _IDSLogV();
      }
      id v41 = [(__CFString *)v79 unsignedLongLongValue];
      if (v41 > [(__CFString *)v38 unsignedLongLongValue])
      {
        v42 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "     **** we are over budget", buf, 2u);
        }

        if os_log_shim_legacy_logging_enabled() && (_IDSShouldLog())
        {
LABEL_138:
          _IDSLogV();
          goto LABEL_148;
        }
        BOOL v21 = 0;
LABEL_148:

        goto LABEL_125;
      }
    }
    BOOL v21 = 1;
    goto LABEL_148;
  }
  BOOL v21 = 1;
LABEL_126:

  return v21;
}

- (void)logState
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "====== IDS Traffic Usage:", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(NSMutableDictionary *)self->_traffic allKeys];
  id v20 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v4 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = v3;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "   Service: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v15 = v3;
          _IDSLogV();
        }
        v5 = -[NSMutableDictionary objectForKey:](self->_traffic, "objectForKey:", v3, v15, v16);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        objc_super v6 = [v5 allKeys];
        id v7 = [v6 countByEnumeratingWithState:&v22 objects:v34 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v23;
          do
          {
            for (j = 0; j != v7; j = (char *)j + 1)
            {
              if (*(void *)v23 != v8) {
                objc_enumerationMutation(v6);
              }
              uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
              v11 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                v12 = [v5 objectForKey:v10];
                *(_DWORD *)buf = 138412546;
                uint64_t v31 = v10;
                __int16 v32 = 2112;
                id v33 = v12;
                _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "     %@: %@", buf, 0x16u);
              }
              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                [v5 objectForKey:v10];
                v16 = uint64_t v15 = v10;
                _IDSLogV();
              }
            }
            id v7 = [v6 countByEnumeratingWithState:&v22 objects:v34 count:16];
          }
          while (v7);
        }

        v13 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v20);
  }

  v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "====== Done", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (BOOL)noteQueryForService:(id)a3 requestor:(id)a4
{
  return [(IDSTrafficMonitor *)self _noteActionType:@"queries" forService:a3 serviceType:0xFFFFFFFFLL requestor:a4];
}

- (BOOL)noteQueryRequestForService:(id)a3 requestor:(id)a4
{
  return [(IDSTrafficMonitor *)self _noteActionType:@"query-requests" forService:a3 serviceType:0xFFFFFFFFLL requestor:a4];
}

- (void)noteIncomingMessageForService:(id)a3
{
}

- (void)noteIncomingLocalMessageForService:(id)a3
{
}

- (BOOL)noteOutgoingMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5
{
  return [(IDSTrafficMonitor *)self _noteActionType:@"outgoing-messages" forService:a3 serviceType:*(void *)&a4 requestor:a5];
}

- (BOOL)noteOutgoingFallbackMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5
{
  return [(IDSTrafficMonitor *)self _noteActionType:@"outgoing-fallback-messages" forService:a3 serviceType:*(void *)&a4 requestor:a5];
}

- (BOOL)noteOutgoingServerMessageForService:(id)a3 serviceType:(unsigned int)a4 requestor:(id)a5
{
  return [(IDSTrafficMonitor *)self _noteActionType:@"outgoing-server-messages" forService:a3 serviceType:*(void *)&a4 requestor:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_dailyTimer, 0);
  objc_storeStrong((id *)&self->_hourlyTimer, 0);

  objc_storeStrong((id *)&self->_traffic, 0);
}

@end