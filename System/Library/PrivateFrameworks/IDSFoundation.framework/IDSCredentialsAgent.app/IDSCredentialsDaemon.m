@interface IDSCredentialsDaemon
+ (id)sharedInstance;
- (IDSCredentialsDaemon)init;
- (id)credentialLoaderForUniqueID:(id)a3;
- (void)_pidSuspended:(int)a3;
- (void)_terminate;
- (void)addCredentialLoader:(id)a3;
- (void)dealloc;
- (void)removeCredentialLoaderForUniqueID:(id)a3;
- (void)shutdown;
@end

@implementation IDSCredentialsDaemon

+ (id)sharedInstance
{
  if (qword_1000157F0 != -1) {
    dispatch_once(&qword_1000157F0, &stru_100010678);
  }
  v2 = (void *)qword_1000157F8;
  return v2;
}

- (IDSCredentialsDaemon)init
{
  v3 = +[IMSystemMonitor sharedInstance];
  unsigned int v4 = [v3 systemIsShuttingDown];

  if (v4)
  {
    v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = @"IDSCredentialsDaemon";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ System is shutting down, not creating daemon", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    v6 = 0;
  }
  else
  {
    v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Building daemon", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v23.receiver = self;
    v23.super_class = (Class)IDSCredentialsDaemon;
    v8 = [(IDSCredentialsDaemon *)&v23 init];
    if (v8)
    {
      id v9 = objc_alloc_init((Class)BKSApplicationStateMonitor);
      id stateMonitor = v8->_stateMonitor;
      v8->_id stateMonitor = v9;

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v8);
      id v11 = v8->_stateMonitor;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000846C;
      v21[3] = &unk_1000106A0;
      objc_copyWeak(&v22, (id *)buf);
      [v11 setHandler:v21];
      v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      uniqueIDToCredentialLoaderMap = v8->_uniqueIDToCredentialLoaderMap;
      v8->_uniqueIDToCredentialLoaderMap = v12;

      v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Opening up the grant MIG port", v20, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v15 = +[IDSCredentialsDaemonMIGInterface sharedInstance];
      [v15 acceptIncomingGrantRequests];
      v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Now accepting grants, setup complete", v20, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v17 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Opening up the IDS interface", v20, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      id v18 = +[IDSCredentialsDaemonIDSInterface sharedInstance];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    self = v8;
    v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_terminate" object:0];
  v3.receiver = self;
  v3.super_class = (Class)IDSCredentialsDaemon;
  [(IDSCredentialsDaemon *)&v3 dealloc];
}

- (void)_terminate
{
  v2 = +[IDSCredentialsDaemonMIGInterface sharedInstance];
  [v2 denyIncomingGrantRequests];

  IMSyncronizeAppPreferences();
  exit(0);
}

- (void)shutdown
{
  objc_super v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  [(IDSCredentialsDaemon *)self _terminate];
}

- (void)addCredentialLoader:(id)a3
{
  unsigned int v4 = (NSMutableDictionary *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = [(NSMutableDictionary *)v4 uniqueID];
    if ([v6 length])
    {
      v7 = [(NSMutableDictionary *)self->_uniqueIDToCredentialLoaderMap objectForKey:v6];

      if (!v7)
      {
        v8 = [(NSMutableDictionary *)self->_uniqueIDToCredentialLoaderMap allKeys];
        id v9 = [v8 count];

        if (!v9)
        {
          v10 = +[IMMobileNetworkManager sharedInstance];
          [v10 addFastDormancyDisableToken:@"IDSCredentialsDaemon"];
        }
        [(NSMutableDictionary *)self->_uniqueIDToCredentialLoaderMap setObject:v5 forKey:v6];
        id v11 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v5;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Adding Loader %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        v12 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uniqueIDToCredentialLoaderMap = self->_uniqueIDToCredentialLoaderMap;
          *(_DWORD *)buf = 138412290;
          v15 = uniqueIDToCredentialLoaderMap;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "New map %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (void)removeCredentialLoaderForUniqueID:(id)a3
{
  unsigned int v4 = (NSMutableDictionary *)a3;
  if ([(NSMutableDictionary *)v4 length])
  {
    [(NSMutableDictionary *)self->_uniqueIDToCredentialLoaderMap removeObjectForKey:v4];
    v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Removing Loader for uniqueID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uniqueIDToCredentialLoaderMap = self->_uniqueIDToCredentialLoaderMap;
      *(_DWORD *)buf = 138412290;
      id v9 = uniqueIDToCredentialLoaderMap;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "New map %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    im_dispatch_after_primary_queue();
  }
}

- (id)credentialLoaderForUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(NSMutableDictionary *)self->_uniqueIDToCredentialLoaderMap objectForKey:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_pidSuspended:(int)a3
{
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PID: %d was suspended", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_uniqueIDToCredentialLoaderMap, 0);
}

@end