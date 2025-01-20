@interface MDShareETAServer
- (MDShareETAServer)initWithState:(id)a3;
- (void)_updateSharedETAServerState;
- (void)dealloc;
- (void)updateSharedETAServerState;
@end

@implementation MDShareETAServer

- (MDShareETAServer)initWithState:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MDShareETAServer;
  v6 = [(MDShareETAServer *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state, a3);
    +[MSPSharedTripServer migrateIfNeeded];
    objc_initWeak(&location, v7);
    id v8 = &_dispatch_main_q;
    v14[1] = _NSConcreteStackBlock;
    v14[2] = (id)3221225472;
    v14[3] = sub_100013CD4;
    v14[4] = &unk_1000390E8;
    objc_copyWeak(&v15, &location);
    uint64_t v9 = _GEOConfigAddBlockListenerForKey();
    id userDisabledDefaultListener = v7->_userDisabledDefaultListener;
    v7->_id userDisabledDefaultListener = (id)v9;

    objc_copyWeak(v14, &location);
    uint64_t v11 = _GEOConfigAddBlockListenerForKey();
    id serverDisabledDefaultListener = v7->_serverDisabledDefaultListener;
    v7->_id serverDisabledDefaultListener = (id)v11;

    [(MDShareETAServer *)v7 _updateSharedETAServerState];
    objc_destroyWeak(v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  id userDisabledDefaultListener = self->_userDisabledDefaultListener;
  self->_id userDisabledDefaultListener = 0;

  id serverDisabledDefaultListener = self->_serverDisabledDefaultListener;
  self->_id serverDisabledDefaultListener = 0;

  v5.receiver = self;
  v5.super_class = (Class)MDShareETAServer;
  [(MDShareETAServer *)&v5 dealloc];
}

- (void)updateSharedETAServerState
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "updateSharedETAServerState", buf, 2u);
  }

  updateSharedETAServerTimer = self->_updateSharedETAServerTimer;
  if (updateSharedETAServerTimer)
  {
    [(NSTimer *)updateSharedETAServerTimer invalidate];
    objc_super v5 = self->_updateSharedETAServerTimer;
    self->_updateSharedETAServerTimer = 0;
  }
  v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Scheduling update of SharedTripServer in 2s", v9, 2u);
  }

  v7 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_updateSharedETAServerState" selector:0 userInfo:0 repeats:2.0];
  id v8 = self->_updateSharedETAServerTimer;
  self->_updateSharedETAServerTimer = v7;
}

- (void)_updateSharedETAServerState
{
  [(NSTimer *)self->_updateSharedETAServerTimer invalidate];
  updateSharedETAServerTimer = self->_updateSharedETAServerTimer;
  self->_updateSharedETAServerTimer = 0;

  int v4 = MSPSharedTripEnabled();
  objc_super v5 = self->_sharedTripServer;
  v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v7 = @"NO";
    if (v4) {
      CFStringRef v7 = @"YES";
    }
    int v18 = 138412546;
    v19 = (void *)v7;
    __int16 v20 = 2112;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Will update SharedTripServer state if needed (enabled: %@, server: %@)", (uint8_t *)&v18, 0x16u);
  }

  if (v5) {
    int v8 = 0;
  }
  else {
    int v8 = v4;
  }
  if (v8 == 1)
  {
    uint64_t v9 = (MSPSharedTripServer *)objc_alloc_init((Class)MSPSharedTripServer);
    sharedTripServer = self->_sharedTripServer;
    self->_sharedTripServer = v9;

    uint64_t v11 = self->_sharedTripServer;
    v12 = [(MDState *)self->_state notificationCenter];
    [(MSPSharedTripServer *)v11 _setNotificationCenter:v12];

    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = self->_sharedTripServer;
      int v18 = 138412290;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Create new SharedTripServer: %@", (uint8_t *)&v18, 0xCu);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (v5) {
    char v15 = v4;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_super v17 = self->_sharedTripServer;
      int v18 = 138412290;
      v19 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Clean and nil out SharedTripServer: %@", (uint8_t *)&v18, 0xCu);
    }

    [(MSPSharedTripServer *)self->_sharedTripServer cleanConnections];
    v13 = self->_sharedTripServer;
    self->_sharedTripServer = 0;
    goto LABEL_18;
  }
LABEL_19:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong(&self->_serverDisabledDefaultListener, 0);
  objc_storeStrong(&self->_userDisabledDefaultListener, 0);
  objc_storeStrong((id *)&self->_sharedTripServer, 0);

  objc_storeStrong((id *)&self->_updateSharedETAServerTimer, 0);
}

@end