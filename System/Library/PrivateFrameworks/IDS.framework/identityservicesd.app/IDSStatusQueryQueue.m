@interface IDSStatusQueryQueue
- (IDSStatusQueryQueue)init;
- (void)_callStateChanged;
- (void)dealloc;
- (void)enqueueQueryBlock:(id)a3 cleanup:(id)a4;
@end

@implementation IDSStatusQueryQueue

- (IDSStatusQueryQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSStatusQueryQueue;
  v2 = [(IDSStatusQueryQueue *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_callStateChanged" name:IMCallMonitorCallStatusChanged object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)IDSStatusQueryQueue;
  [(IDSStatusQueryQueue *)&v4 dealloc];
}

- (void)_callStateChanged
{
  v3 = +[IMCallMonitor sharedInstance];
  unsigned __int8 v4 = [v3 isOnTelephonyCall];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NSMutableArray *)self->_queue count];
      *(_DWORD *)buf = 138412546;
      v21 = self;
      __int16 v22 = 2048;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ _callStateChanged - no longer on a call, processing %lu pending queries!", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v13 = [(NSMutableArray *)self->_queue count];
      MarcoLogMadridLevel();
      id v14 = [(NSMutableArray *)self->_queue count];
      IMLogString();
      if (_IMWillLog())
      {
        [(NSMutableArray *)self->_queue count];
        _IMAlwaysLog();
      }
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = self->_queue;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = (void (**)(void))objc_retainBlock(*(id *)(*((void *)&v15 + 1) + 8 * i));
          v11[2]();
        }
        id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    queue = self->_queue;
    self->_queue = 0;
  }
}

- (void)enqueueQueryBlock:(id)a3 cleanup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10033CF3C;
    v28[3] = &unk_100989518;
    id v29 = v6;
    id v8 = (void (**)(void))v7;
    id v30 = v8;
    uint64_t v9 = objc_retainBlock(v28);
    v10 = +[IMMobileNetworkManager sharedInstance];
    unsigned int v11 = [v10 isWiFiUsable];

    v12 = +[FTDeviceSupport sharedInstance];
    unsigned int v13 = [v12 supportsSimultaneousVoiceAndDataRightNow];

    if ((v11 | v13))
    {
      id v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v15 = @"NO";
        if (v11) {
          CFStringRef v15 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v32 = self;
        __int16 v33 = 2112;
        CFStringRef v34 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ - we're not on a call or wifi is usable, processing query immediately (Usable WiFi: %@)", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
    }
    else
    {
      long long v16 = +[IMCallMonitor sharedInstance];
      unsigned int v17 = [v16 isOnTelephonyCall];

      if (v17)
      {
        queue = self->_queue;
        if (!queue)
        {
          v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          v20 = self->_queue;
          self->_queue = v19;

          queue = self->_queue;
        }
        if ((unint64_t)[(NSMutableArray *)queue count] <= 0xC7)
        {
          v21 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = self;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ - on a call and wifi isn't usable, enqueuing query to avoid mRAB", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            MarcoLogMadridLevel();
            v27 = self;
            IMLogString();
            if (_IMWillLog())
            {
              v27 = self;
              _IMAlwaysLog();
            }
          }
          id v22 = objc_msgSend(v9, "copy", v27);

          id v23 = self->_queue;
          id v24 = objc_retainBlock(v22);
          [(NSMutableArray *)v23 addObject:v24];

          goto LABEL_35;
        }
        v26 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = self;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ - too many enqueued queries, dropping this one", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          MarcoLogMadridLevel();
          IMLogString();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (v8) {
          v8[2](v8);
        }
LABEL_34:
        id v22 = v9;
LABEL_35:

        goto LABEL_36;
      }
      v25 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = self;
        __int16 v33 = 2112;
        CFStringRef v34 = @"NO";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ - we're on a call but the network is usable, processing query immediately (Usable WiFi: %@)", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        MarcoLogMadridLevel();
        IMLogString();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
    }
    ((void (*)(void *))v9[2])(v9);
    goto LABEL_34;
  }
LABEL_36:
}

- (void).cxx_destruct
{
}

@end