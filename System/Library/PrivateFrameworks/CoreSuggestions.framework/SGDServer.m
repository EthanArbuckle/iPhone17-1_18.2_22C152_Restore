@interface SGDServer
+ (id)sharedServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SGDServer)init;
- (id)_daemonManagerForConnection:(id)a3 protocol:(id)a4;
- (void)_localeChanged:(id)a3;
- (void)_processAppsInstallUninstallNotification:(id)a3 appsInstalled:(BOOL)a4;
- (void)_receivedInstallNotification:(id)a3;
- (void)_receivedUninstallNotification:(id)a3;
- (void)dealloc;
- (void)setupWithConnectionListener:(id)a3 protocol:(id)a4 entitlement:(id)a5;
- (void)shutdown;
@end

@implementation SGDServer

- (id)_daemonManagerForConnection:(id)a3 protocol:(id)a4
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "sgd_clientName");
  unsigned int v6 = [v5 isEqualToString:@"com.apple.imdpersistenceagent"];
  id v7 = objc_alloc((Class)SGDSuggestManager);
  if (v6)
  {
    v8 = +[SGSqlEntityStore defaultHarvestStore];
    id v9 = [v7 initWithMessagesConnection:v4 store:v8];
  }
  else
  {
    v8 = +[SGSqlEntityStore defaultStore];
    id v9 = [v7 initWithConnection:v4 store:v8];
  }
  v10 = v9;

  v11 = [[SGDSuggestManagerSettingsDecorator alloc] initWithManager:v10];

  return v11;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMapTable *)v8->_xpcListeners objectForKey:v6];
  objc_sync_exit(v8);

  if (!v9)
  {
    BOOL v18 = 0;
    goto LABEL_13;
  }
  v10 = [v9 protocol];
  v11 = [v9 entitlement];
  objc_msgSend(v7, "sgd_clientName");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = ii_default_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = protocol_getName(v10);
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = [(__CFString *)v12 UTF8String];
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = [v7 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "New %s connection from %s (%d)", buf, 0x1Cu);
  }

  v14 = [v7 valueForEntitlement:v11];
  if (!v14 || (objc_opt_respondsToSelector() & 1) == 0 || ([v14 BOOLValue] & 1) == 0)
  {
    v15 = ii_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v24 = [v7 processIdentifier];
      if (v12) {
        CFStringRef v21 = v12;
      }
      else {
        CFStringRef v21 = @"(client name was nil)";
      }
      if (v11) {
        CFStringRef v22 = v11;
      }
      else {
        CFStringRef v22 = @"(expected entitlement key was nil)";
      }
      Name = protocol_getName(v10);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v24;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v21;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v22;
      __int16 v30 = 2080;
      v31 = Name;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Received a connection without suggestions entitlement, rejecting; pid: %d, name: %@, entitlementKey: %@, protocol: %s",
        buf,
        0x26u);
    }
    goto LABEL_10;
  }
  v15 = [(SGDServer *)v8 _daemonManagerForConnection:v7 protocol:v10];
  if (!v15)
  {
    v20 = ii_default_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Suggestions daemon manager failed to initialize", buf, 2u);
    }

    v15 = 0;
LABEL_10:
    BOOL v18 = 0;
    goto LABEL_11;
  }
  v16 = +[SGDSuggestManagerInterface xpcInterfaceForProtocol:v10];
  [v7 setExportedInterface:v16];

  [v7 setExportedObject:v15];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, v7);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100004D14;
  v25[3] = &unk_10000C590;
  objc_copyWeak(&v28, (id *)buf);
  v26 = v10;
  v27 = v8;
  [v7 setInvalidationHandler:v25];
  v17 = v8;
  objc_sync_enter(v17);
  [v17[2] addObject:v7];
  [v7 resume];
  objc_sync_exit(v17);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
  BOOL v18 = 1;
LABEL_11:

LABEL_13:
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_coreSuggestionClients, 0);

  objc_storeStrong((id *)&self->_xpcListeners, 0);
}

- (void)_processAppsInstallUninstallNotification:(id)a3 appsInstalled:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [a3 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 objectForKeyedSubscript:@"bundleIDs"];
  id v9 = [v8 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v7 objectForKeyedSubscript:@"isPlaceholder"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v13 = [v12 BOOLValue];

    if (v13) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  if ([v11 count])
  {
    v14 = ii_default_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v23 = @"uninstalled";
      if (v4) {
        CFStringRef v23 = @"installed";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v31 = v23;
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "application(s) %@: %@", buf, 0x16u);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v24 = v11;
    id v15 = v11;
    id v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v26;
      v19 = (void *)SGBundleIdentifierMail;
      v20 = (void *)SGBundleIdentifierCalendar;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if ([v19 isEqual:v22])
          {
            +[SGPreferenceStorage setFirstPartyMailAppIsInstalled:v4];
          }
          else if ([v20 isEqual:v22])
          {
            +[SGPreferenceStorage setFirstPartyCalendarAppIsInstalled:v4];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }

    id v11 = v24;
  }
LABEL_25:
}

- (void)_receivedUninstallNotification:(id)a3
{
}

- (void)_receivedInstallNotification:(id)a3
{
}

- (void)_localeChanged:(id)a3
{
  v3 = ii_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Locale changed. Terminating daemon.", v4, 2u);
  }

  xpc_transaction_exit_clean();
}

- (void)shutdown
{
  v3 = ii_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "suggestd shutting down, bye!", buf, 2u);
  }

  BOOL v4 = self;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v5 = v4->_coreSuggestionClients;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "invalidate", (void)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)v4->_coreSuggestionClients removeAllObjects];
  objc_sync_exit(v4);
}

- (void)setupWithConnectionListener:(id)a3 protocol:(id)a4 entitlement:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = self;
  objc_sync_enter(v10);
  long long v11 = [(NSMapTable *)v10->_xpcListeners objectForKey:v13];

  if (!v11)
  {
    long long v12 = objc_opt_new();
    [v12 setEntitlement:v9];
    [v12 setProtocol:v8];
    [(NSMapTable *)v10->_xpcListeners setObject:v12 forKey:v13];
    [v13 setDelegate:v10];
    [v13 resume];
  }
  objc_sync_exit(v10);
}

- (void)dealloc
{
  v3 = ii_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "suggestd is going away now. K BYE!", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)SGDServer;
  [(SGDServer *)&v4 dealloc];
}

- (SGDServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)SGDServer;
  v2 = [(SGDServer *)&v11 init];
  if (v2)
  {
    v3 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:1];
    xpcListeners = v2->_xpcListeners;
    v2->_xpcListeners = v3;

    uint64_t v5 = objc_opt_new();
    coreSuggestionClients = v2->_coreSuggestionClients;
    v2->_coreSuggestionClients = (NSMutableArray *)v5;

    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_localeChanged:" name:NSCurrentLocaleDidChangeNotification object:0];

    +[SGPreferenceStorage setFirstPartyMailAppIsInstalled:sub_100005388(SGBundleIdentifierMail)];
    +[SGPreferenceStorage setFirstPartyCalendarAppIsInstalled:sub_100005388(SGBundleIdentifierCalendar)];
    id v8 = +[NSDistributedNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_receivedInstallNotification:" name:@"com.apple.LaunchServices.applicationRegistered" object:0];

    id v9 = +[NSDistributedNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_receivedUninstallNotification:" name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  }
  return v2;
}

+ (id)sharedServer
{
  if (qword_1000126C0 != -1) {
    dispatch_once(&qword_1000126C0, &stru_10000C568);
  }
  v2 = (void *)qword_1000126B8;

  return v2;
}

@end