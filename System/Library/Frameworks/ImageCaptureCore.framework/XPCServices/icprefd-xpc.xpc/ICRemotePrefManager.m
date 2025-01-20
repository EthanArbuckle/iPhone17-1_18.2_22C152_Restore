@interface ICRemotePrefManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICRemotePrefManager)init;
- (NSMutableArray)remoteManagerConnections;
- (NSMutableDictionary)osTransactions;
- (int)checkFilesAndFoldersAccess:(id)a3 shouldPrompt:(BOOL)a4;
- (int)checkTetheringAccess:(id)a3 shouldPrompt:(BOOL)a4;
- (void)addRemoteManagerConnection:(id)a3;
- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5;
- (void)dealloc;
- (void)removeRemoteManagerConnectionWithProcessIdentifier:(int)a3;
- (void)requestContentsAuthorizationStatusShouldPrompt:(BOOL)a3 withReply:(id)a4;
- (void)requestControlAuthorizationStatusShouldPrompt:(BOOL)a3 withReply:(id)a4;
- (void)requestGoodNewsStatusWithReply:(id)a3;
- (void)resetContentsAuthorizationStatusWithReply:(id)a3;
- (void)resetControlAuthorizationStatusWithReply:(id)a3;
- (void)setOsTransactions:(id)a3;
- (void)setRemoteManagerConnections:(id)a3;
@end

@implementation ICRemotePrefManager

- (ICRemotePrefManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)ICRemotePrefManager;
  v2 = [(ICRemotePrefManager *)&v4 init];
  if (v2)
  {
    v2->_remoteManagerConnections = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_osTransactions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_remoteManagerConnectionsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_remoteManagerConnections)
  {
    [(ICRemotePrefManager *)self removeRemoteManagerConnectionWithProcessIdentifier:0xFFFFFFFFLL];

    self->_remoteManagerConnections = 0;
  }
  osTransactions = self->_osTransactions;
  if (osTransactions)
  {

    self->_osTransactions = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ICRemotePrefManager;
  [(ICRemotePrefManager *)&v4 dealloc];
}

- (void)addRemoteManagerConnection:(id)a3
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_100005E28;
  v12[4] = sub_100005E38;
  v12[5] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005E44;
  v11[3] = &unk_10000C4E8;
  v11[4] = a3;
  v11[5] = v12;
  [a3 setInvalidationHandler:v11];
  objc_msgSend(a3, "setInterruptionHandler:", objc_msgSend(a3, "invalidationHandler"));
  os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%05d", [a3 processIdentifier]);
  [(NSString *)v5 UTF8String];
  v6 = (void *)os_transaction_create();
  [(NSMutableDictionary *)self->_osTransactions setObject:v6 forKeyedSubscript:v5];
  __ICOSLogCreate();
  if ((unint64_t)[@"PrefRemote" length] < 0x15) {
    v7 = @"PrefRemote";
  }
  else {
    v7 = (__CFString *)objc_msgSend(objc_msgSend(@"PrefRemote", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
  }
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"+ transactions: [%05lu]", objc_msgSend(-[NSMutableDictionary allKeys](-[ICRemotePrefManager osTransactions](self, "osTransactions"), "allKeys"), "count"));
  v9 = _gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(__CFString *)v7 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v14 = v10;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  [(NSMutableArray *)self->_remoteManagerConnections addObject:a3];
  os_unfair_lock_unlock(&self->_remoteManagerConnectionsLock);
  _Block_object_dispose(v12, 8);
}

- (void)removeRemoteManagerConnectionWithProcessIdentifier:(int)a3
{
  os_unfair_lock_t lock = &self->_remoteManagerConnectionsLock;
  os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
  id v5 = [(NSMutableArray *)self->_remoteManagerConnections copy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    v9 = &CFRelease_ptr;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned int v12 = [v11 processIdentifier];
        if (a3 == -1 || v12 == a3)
        {
          -[NSMutableDictionary removeObjectForKey:](-[ICRemotePrefManager osTransactions](self, "osTransactions"), "removeObjectForKey:", objc_msgSend(v9[95], "stringWithFormat:", @"%05d", objc_msgSend(v11, "processIdentifier"), lock));
          __ICOSLogCreate();
          v13 = @"PrefRemote";
          if ((unint64_t)[@"PrefRemote" length] >= 0x15) {
            v13 = (__CFString *)objc_msgSend(objc_msgSend(@"PrefRemote", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
          }
          id v14 = v9;
          id v15 = objc_msgSend(v9[95], "stringWithFormat:", @"- transactions: [%05lu]", objc_msgSend(-[NSMutableDictionary allKeys](-[ICRemotePrefManager osTransactions](self, "osTransactions"), "allKeys"), "count"));
          v16 = _gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [(__CFString *)v13 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v25 = v17;
            __int16 v26 = 2114;
            id v27 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          [v11 setInvalidationHandler:0];
          [v11 setInterruptionHandler:0];
          [v11 invalidate];
          [(NSMutableArray *)self->_remoteManagerConnections removeObject:v11];
          v9 = v14;
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  BOOL v5 = a5;
  if (qword_100014758 != -1) {
    dispatch_once(&qword_100014758, &stru_10000C508);
  }
  uint64_t v8 = qword_100014750;
  SEL v9 = NSSelectorFromString((NSString *)a4);

  [a3 setClasses:v8 forSelector:v9 argumentIndex:0 ofReply:v5];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  __ICOSLogCreate();
  id v6 = @"remoteManager";
  if ((unint64_t)[@"remoteManager" length] >= 0x15) {
    id v6 = (__CFString *)objc_msgSend(objc_msgSend(@"remoteManager", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"New Connection: %d", [a4 processIdentifier]);
  uint64_t v8 = _gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = [(__CFString *)v6 UTF8String];
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  SEL v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICXPCAuthManagerProtocol];
  id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICXPCAuthManagerProtocol];
  [(ICRemotePrefManager *)self addSelectorToInterface:v9 selectorString:@"requestContentsAuthorizationStatusShouldPrompt:withReply:" origin:1];
  [(ICRemotePrefManager *)self addSelectorToInterface:v9 selectorString:@"requestControlAuthorizationStatusShouldPrompt:withReply:" origin:1];
  [(ICRemotePrefManager *)self addSelectorToInterface:v9 selectorString:@"requestGoodNewsStatusWithReply:" origin:1];
  [(ICRemotePrefManager *)self addSelectorToInterface:v9 selectorString:@"resetContentsAuthorizationStatusWithReply:" origin:1];
  [(ICRemotePrefManager *)self addSelectorToInterface:v9 selectorString:@"resetControlAuthorizationStatusWithReply:" origin:1];
  [a4 setExportedInterface:v9];
  [a4 setRemoteObjectInterface:v10];
  [a4 setExportedObject:self];
  [(ICRemotePrefManager *)self addRemoteManagerConnection:a4];
  [a4 resume];
  return 1;
}

- (int)checkFilesAndFoldersAccess:(id)a3 shouldPrompt:(BOOL)a4
{
  BOOL v4 = a4;
  if (sub_100005958(a3)) {
    return 0;
  }
  memset(&v49[1], 0, 32);
  if (a3) {
    [a3 auditToken];
  }
  audit_token_t token = *(audit_token_t *)&v49[1];
  id v7 = SecTaskCreateWithAuditToken(0, &token);
  uint64_t v8 = (id)SecTaskCopySigningIdentifier(v7, 0);
  if (v7) {
    CFRelease(v7);
  }
  id v9 = +[ICDeviceAccessManager sharedAccessManager];
  if (!v9)
  {
    __ICOSLogCreate();
    __int16 v14 = @"TCC";
    if ((unint64_t)[@"TCC" length] >= 0x15) {
      __int16 v14 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
    }
    id v15 = +[NSString stringWithFormat:@"Access Manager could not be created"];
    v16 = _gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    id v17 = [(__CFString *)v14 UTF8String];
    token.val[0] = 136446466;
    *(void *)&token.val[1] = v17;
    LOWORD(token.val[3]) = 2114;
    *(void *)((char *)&token.val[3] + 2) = v15;
    goto LABEL_43;
  }
  id v10 = v9;
  v49[0] = 0;
  v11 = v8;
  if (([(__CFString *)v8 containsString:@"com.apple"] & 1) == 0)
  {
    id v12 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v8 allowPlaceholder:0 error:v49];
    id v13 = v12;
    if (!v12 || v49[0])
    {
      __ICOSLogCreate();
      v18 = @"TCC";
      if ((unint64_t)[@"TCC" length] >= 0x15) {
        v18 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
      }
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"LSAppRecord missing, suppressing frobtboard notification with error: %@", [v49[0] description]);
      long long v20 = _gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [(__CFString *)v18 UTF8String];
        token.val[0] = 136446466;
        *(void *)&token.val[1] = v21;
        LOWORD(token.val[3]) = 2114;
        *(void *)((char *)&token.val[3] + 2) = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
      }
      if (!v13)
      {
LABEL_35:
        __ICOSLogCreate();
        v31 = @"TCC";
        if ((unint64_t)[@"TCC" length] >= 0x15) {
          v31 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
        }
        v32 = +[NSString stringWithFormat:@"LSApp Proxy authorization has no application name, suppressing frobtboard notification"];
        v16 = _gICOSLog;
        if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
          return 1;
        }
LABEL_42:
        id v33 = [(__CFString *)v31 UTF8String];
        token.val[0] = 136446466;
        *(void *)&token.val[1] = v33;
        LOWORD(token.val[3]) = 2114;
        *(void *)((char *)&token.val[3] + 2) = v32;
LABEL_43:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
        return 1;
      }
      v11 = 0;
    }
    else
    {
      v11 = (__CFString *)[v12 localizedName];
    }
  }
  if (!v11) {
    goto LABEL_35;
  }
  __ICOSLogCreate();
  long long v22 = @"TCC";
  if ((unint64_t)[@"TCC" length] >= 0x15) {
    long long v22 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
  }
  long long v23 = +[NSString stringWithFormat:@"%@ is checking access to *contents* on external device", v11];
  v24 = _gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [(__CFString *)v22 UTF8String];
    token.val[0] = 136446466;
    *(void *)&token.val[1] = v25;
    LOWORD(token.val[3]) = 2114;
    *(void *)((char *)&token.val[3] + 2) = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
  }
  id v26 = [v10 bundleIdentifier:v8 stateForAccessType:@"read_access"];
  if (!v26)
  {
    if (!v4) {
      return 2;
    }
    __ICOSLogCreate();
    v35 = @"TCC";
    if ((unint64_t)[@"TCC" length] >= 0x15) {
      v35 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
    }
    v36 = +[NSString stringWithFormat:@"%@ is requesting a prompt to access to *contents* on external device", v11];
    v37 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = [(__CFString *)v35 UTF8String];
      token.val[0] = 136446466;
      *(void *)&token.val[1] = v38;
      LOWORD(token.val[3]) = 2114;
      *(void *)((char *)&token.val[3] + 2) = v36;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
    }
    v50[0] = kCFUserNotificationAlertHeaderKey;
    v51[0] = +[NSString stringWithFormat:sub_1000027C4(@"IC_AUTH_TITLE"), v11];
    v50[1] = kCFUserNotificationAlertMessageKey;
    v51[1] = +[NSString stringWithFormat:sub_1000027C4(@"IC_AUTH_BODY"), v11];
    v50[2] = kCFUserNotificationDefaultButtonTitleKey;
    v51[2] = sub_1000027C4(@"IC_ACCESS_ALLOW");
    v50[3] = kCFUserNotificationAlternateButtonTitleKey;
    v51[3] = sub_1000027C4(@"IC_ACCESS_DENY");
    v50[4] = kCFUserNotificationAlertTopMostKey;
    v51[4] = +[NSNumber numberWithBool:1];
    v50[5] = SBUserNotificationDontDismissOnUnlock;
    v51[5] = +[NSNumber numberWithBool:1];
    unsigned int v39 = objc_msgSend(v10, "captureUserIntentForBundleIdentifier:withNotification:", v8, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 6));
    [v10 addBundleIdentifier:v8];
    __ICOSLogCreate();
    id v40 = [@"TCC" length];
    if (v39)
    {
      if ((unint64_t)v40 >= 0x15) {
        v41 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
      }
      else {
        v41 = @"TCC";
      }
      v42 = +[NSString stringWithFormat:@"User allowed %@ access to *contents* on external device", v11];
      v43 = _gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = [(__CFString *)v41 UTF8String];
        token.val[0] = 136446466;
        *(void *)&token.val[1] = v44;
        LOWORD(token.val[3]) = 2114;
        *(void *)((char *)&token.val[3] + 2) = v42;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
      }
      [v10 updateBundleIdentifier:v8 accessType:@"read_access" withState:2];
      return 0;
    }
    if ((unint64_t)v40 >= 0x15) {
      v45 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
    }
    else {
      v45 = @"TCC";
    }
    v46 = +[NSString stringWithFormat:@"User denied %@ access to *contents* on external device", v11];
    v47 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v48 = [(__CFString *)v45 UTF8String];
      token.val[0] = 136446466;
      *(void *)&token.val[1] = v48;
      LOWORD(token.val[3]) = 2114;
      *(void *)((char *)&token.val[3] + 2) = v46;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
    }
    int v6 = 1;
    [v10 updateBundleIdentifier:v8 accessType:@"read_access" withState:1];
    return v6;
  }
  if (v26 == (id)1)
  {
    __ICOSLogCreate();
    v31 = @"TCC";
    if ((unint64_t)[@"TCC" length] >= 0x15) {
      v31 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
    }
    v32 = +[NSString stringWithFormat:@"User denied or disabled %@ access to *contents* on external device", v11];
    v16 = _gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    goto LABEL_42;
  }
  if (v26 != (id)2) {
    return 1;
  }
  __ICOSLogCreate();
  id v27 = @"TCC";
  if ((unint64_t)[@"TCC" length] >= 0x15) {
    id v27 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
  }
  v28 = +[NSString stringWithFormat:@"Granted %@ access to *contents* on external device", v11];
  v29 = _gICOSLog;
  int v6 = 0;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [(__CFString *)v27 UTF8String];
    token.val[0] = 136446466;
    *(void *)&token.val[1] = v30;
    LOWORD(token.val[3]) = 2114;
    *(void *)((char *)&token.val[3] + 2) = v28;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
    return 0;
  }
  return v6;
}

- (void)requestContentsAuthorizationStatusShouldPrompt:(BOOL)a3 withReply:(id)a4
{
  BOOL v5 = a3;
  id v7 = +[NSXPCConnection currentConnection];
  id v8 = +[NSMutableDictionary dictionary];
  unsigned int v9 = [(ICRemotePrefManager *)self checkFilesAndFoldersAccess:v7 shouldPrompt:v5];
  CFStringRef v10 = @"ICAuthorizationStatusAuthorized";
  if (v9 == 2) {
    CFStringRef v10 = @"ICAuthorizationStatusNotDetermined";
  }
  if (v9 == 1) {
    CFStringRef v11 = @"ICAuthorizationStatusDenied";
  }
  else {
    CFStringRef v11 = v10;
  }
  [v8 setObject:v11 forKeyedSubscript:@"ICAuthorizationStatus"];
  id v12 = (void (*)(id, id))*((void *)a4 + 2);

  v12(a4, v8);
}

- (int)checkTetheringAccess:(id)a3 shouldPrompt:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    [a3 auditToken];
  }
  memset(buf, 0, 32);
  int v5 = TCCAccessPreflightWithAuditToken();
  __ICOSLogCreate();
  id v6 = [@"TCC Prompt" length];
  if (v4)
  {
    if ((unint64_t)v6 >= 0x15) {
      id v7 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC Prompt", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
    }
    else {
      id v7 = @"TCC Prompt";
    }
    id v8 = +[NSString stringWithFormat:@"Prompting for kTCCServiceCamera", (unsigned __int128)0, (unsigned __int128)0];
    unsigned int v9 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(__CFString *)v7 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    uint64_t v27 = kTCCAccessCheckOptionPrompt;
    v28 = +[NSNumber numberWithBool:1];
    +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    *(_OWORD *)buf = v25;
    *(_OWORD *)&buf[16] = v26;
    int v11 = TCCAccessCheckAuditToken();
    __ICOSLogCreate();
    if (v11)
    {
      id v12 = @"TCC Access";
      if ((unint64_t)[@"TCC Access" length] >= 0x15) {
        id v12 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC Access", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
      }
      id v13 = +[NSString stringWithFormat:@"Access has been granted"];
      __int16 v14 = _gICOSLog;
      int v5 = 0;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(__CFString *)v12 UTF8String];
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        return 0;
      }
    }
    else
    {
      long long v20 = @"TCC Prompt";
      if ((unint64_t)[@"TCC Prompt" length] >= 0x15) {
        long long v20 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC Prompt", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
      }
      id v21 = +[NSString stringWithFormat:@"kTCCServiceCamera denied"];
      long long v22 = _gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [(__CFString *)v20 UTF8String];
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      return 1;
    }
  }
  else
  {
    if ((unint64_t)v6 >= 0x15) {
      v16 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC Prompt", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
    }
    else {
      v16 = @"TCC Prompt";
    }
    id v17 = +[NSString stringWithFormat:@"Not Prompting for kCTCCService", (unsigned __int128)0, (unsigned __int128)0];
    v18 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(__CFString *)v16 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  return v5;
}

- (void)requestControlAuthorizationStatusShouldPrompt:(BOOL)a3 withReply:(id)a4
{
  BOOL v5 = a3;
  id v7 = +[NSXPCConnection currentConnection];
  id v8 = +[NSMutableDictionary dictionary];
  if (sub_100005958(v7))
  {
    CFStringRef v9 = @"ICAuthorizationStatusAuthorized";
LABEL_7:
    [v8 setObject:v9 forKeyedSubscript:@"ICAuthorizationStatus"];
    goto LABEL_8;
  }
  unsigned int v10 = [(ICRemotePrefManager *)self checkTetheringAccess:v7 shouldPrompt:v5];
  if (v10 == 2)
  {
    CFStringRef v9 = @"ICAuthorizationStatusNotDetermined";
    goto LABEL_7;
  }
  if (v10 == 1)
  {
    CFStringRef v9 = @"ICAuthorizationStatusDenied";
    goto LABEL_7;
  }
  __ICOSLogCreate();
  int v11 = @"TCC";
  if ((unint64_t)[@"TCC" length] >= 0x15) {
    int v11 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
  }
  id v12 = +[NSString stringWithFormat:@"kTCCServiceCamera also grants *control* on external device, checking if user has been informed (once)"];
  id v13 = _gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    buf.val[0] = 136446466;
    *(void *)&buf.val[1] = [(__CFString *)v11 UTF8String];
    LOWORD(buf.val[3]) = 2114;
    *(void *)((char *)&buf.val[3] + 2) = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
  }
  [v8 setObject:@"ICAuthorizationStatusAuthorized" forKeyedSubscript:@"ICAuthorizationStatus"];
  memset(&buf, 0, sizeof(buf));
  if (v7) {
    [(NSXPCConnection *)v7 auditToken];
  }
  audit_token_t token = buf;
  __int16 v14 = SecTaskCreateWithAuditToken(0, &token);
  id v15 = (__CFString *)SecTaskCopySigningIdentifier(v14, 0);
  if (v14) {
    CFRelease(v14);
  }
  id v16 = +[ICDeviceAccessManager sharedAccessManager];
  if (!v16) {
    goto LABEL_44;
  }
  id v17 = v16;
  id v44 = 0;
  v18 = v15;
  if (([(__CFString *)v15 containsString:@"com.apple"] & 1) == 0)
  {
    id v19 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v15 allowPlaceholder:0 error:&v44];
    long long v20 = v19;
    if (!v19 || v44)
    {
      __ICOSLogCreate();
      id v21 = @"kTCCServiceCamera";
      if ((unint64_t)[@"kTCCServiceCamera" length] >= 0x15) {
        id v21 = (__CFString *)objc_msgSend(objc_msgSend(@"kTCCServiceCamera", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
      }
      long long v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"LSAppRecord missing, suppressing frobtboard notification with error: %@", [v44 description]);
      id v23 = _gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [(__CFString *)v21 UTF8String];
        token.val[0] = 136446466;
        *(void *)&token.val[1] = v24;
        LOWORD(token.val[3]) = 2114;
        *(void *)((char *)&token.val[3] + 2) = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
      }
      if (!v20) {
        goto LABEL_33;
      }
      v18 = 0;
    }
    else
    {
      v18 = (__CFString *)[v19 localizedName];
    }
  }
  if (!v18)
  {
LABEL_33:
    __ICOSLogCreate();
    v29 = @"kTCCServiceCamera";
    if ((unint64_t)[@"kTCCServiceCamera" length] >= 0x15) {
      v29 = (__CFString *)objc_msgSend(objc_msgSend(@"kTCCServiceCamera", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
    }
    id v30 = +[NSString stringWithFormat:@"LSApp Proxy authorization has no application name, suppressing frobtboard notification"];
    v31 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = [(__CFString *)v29 UTF8String];
      token.val[0] = 136446466;
      *(void *)&token.val[1] = v32;
      LOWORD(token.val[3]) = 2114;
      *(void *)((char *)&token.val[3] + 2) = v30;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
    }
LABEL_43:
    id v38 = dispatch_semaphore_create(0);
    id v39 = objc_alloc_init((Class)FBSOpenApplicationService);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100007A70;
    v43[3] = &unk_10000C530;
    v43[4] = v38;
    [v39 openApplication:@"com.apple.Preferences" withOptions:0 completion:v43];
    dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v38);

    goto LABEL_44;
  }
  v45[0] = kCFUserNotificationAlertHeaderKey;
  v46[0] = +[NSString stringWithFormat:sub_1000027C4(@"IC_AUTH_CONTROL_TITLE"), v18];
  v45[1] = kCFUserNotificationAlertMessageKey;
  v46[1] = +[NSString stringWithFormat:sub_1000027C4(@"IC_AUTH_CONTROL_BODY"), v18];
  v45[2] = kCFUserNotificationDefaultButtonTitleKey;
  v46[2] = sub_1000027C4(@"IC_ACCESS_ALLOW");
  v45[3] = kCFUserNotificationAlternateButtonTitleKey;
  v46[3] = sub_1000027C4(@"IC_ACCESS_SETTINGS");
  v45[4] = kCFUserNotificationAlertTopMostKey;
  v46[4] = +[NSNumber numberWithBool:1];
  v45[5] = SBUserNotificationDontDismissOnUnlock;
  v46[5] = +[NSNumber numberWithBool:1];
  long long v25 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:6];
  id v26 = [v17 bundleIdentifier:v15 stateForAccessType:@"control_informed"];
  __ICOSLogCreate();
  id v27 = [@"TCC" length];
  if ((unint64_t)v26 > 1)
  {
    if ((unint64_t)v27 < 0x15) {
      id v33 = @"TCC";
    }
    else {
      id v33 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
    }
    id v40 = +[NSString stringWithFormat:@"%@ has already notified about *control* on external device", v18];
    v41 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = [(__CFString *)v33 UTF8String];
      token.val[0] = 136446466;
      *(void *)&token.val[1] = v42;
      LOWORD(token.val[3]) = 2114;
      *(void *)((char *)&token.val[3] + 2) = v40;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
    }
    goto LABEL_44;
  }
  if ((unint64_t)v27 < 0x15) {
    v28 = @"TCC";
  }
  else {
    v28 = (__CFString *)objc_msgSend(objc_msgSend(@"TCC", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
  }
  v34 = +[NSString stringWithFormat:@"%@ is notifying user that kTCCServiceCamera also grants *control* on external device", v18];
  v35 = _gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = [(__CFString *)v28 UTF8String];
    token.val[0] = 136446466;
    *(void *)&token.val[1] = v36;
    LOWORD(token.val[3]) = 2114;
    *(void *)((char *)&token.val[3] + 2) = v34;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
  }
  unsigned __int8 v37 = [v17 captureUserIntentForBundleIdentifier:v15 withNotification:v25];
  [v17 updateBundleIdentifier:v15 accessType:@"control_informed" withState:2];
  if ((v37 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_44:
  if (v15) {
    CFRelease(v15);
  }
LABEL_8:
  (*((void (**)(id, id))a4 + 2))(a4, v8);
}

- (void)requestGoodNewsStatusWithReply:(id)a3
{
  BOOL v4 = +[NSXPCConnection currentConnection];
  id v5 = +[NSMutableDictionary dictionary];
  if (sub_100005958(v4))
  {
    [v5 setObject:@"ICAuthorizationStatusAuthorized" forKeyedSubscript:@"ICAuthorizationStatus"];
  }
  else
  {
    [v5 setObject:@"ICAuthorizationStatusDenied" forKeyedSubscript:@"ICAuthorizationStatus"];
    memset(&v10[1], 0, sizeof(audit_token_t));
    if (v4) {
      [(NSXPCConnection *)v4 auditToken];
    }
    v10[0] = v10[1];
    id v6 = SecTaskCreateWithAuditToken(0, v10);
    id v7 = (__CFString *)SecTaskCopySigningIdentifier(v6, 0);
    if (v6) {
      CFRelease(v6);
    }
    id v8 = +[ICDeviceAccessManager sharedAccessManager];
    if (v8)
    {
      id v9 = [v8 bundleIdentifier:v7 stateForAccessType:@"control_informed"];
      if ((unint64_t)v9 <= 2) {
        [v5 setObject:*(&off_10000C550 + (void)v9) forKeyedSubscript:@"ICAuthorizationStatus"];
      }
    }
    if (v7) {
  }
    }
  (*((void (**)(id, id))a3 + 2))(a3, v5);
}

- (void)resetContentsAuthorizationStatusWithReply:(id)a3
{
  BOOL v4 = +[NSXPCConnection currentConnection];
  id v5 = +[NSMutableDictionary dictionary];
  memset(&v9[1], 0, sizeof(audit_token_t));
  if (v4) {
    [(NSXPCConnection *)v4 auditToken];
  }
  v9[0] = v9[1];
  id v6 = SecTaskCreateWithAuditToken(0, v9);
  id v7 = (__CFString *)SecTaskCopySigningIdentifier(v6, 0);
  if (v6) {
    CFRelease(v6);
  }
  id v8 = +[ICDeviceAccessManager sharedAccessManager];
  if (v8) {
    [v8 updateBundleIdentifier:v7 accessType:@"read_access" withState:0];
  }
  if (v7) {

  }
  [v5 setObject:@"ICAuthorizationStatusNotDetermined" forKeyedSubscript:@"ICAuthorizationStatus"];
  (*((void (**)(id, id))a3 + 2))(a3, v5);
}

- (void)resetControlAuthorizationStatusWithReply:(id)a3
{
  BOOL v4 = +[NSXPCConnection currentConnection];
  id v5 = +[NSMutableDictionary dictionary];
  memset(&v9[1], 0, sizeof(audit_token_t));
  if (v4) {
    [(NSXPCConnection *)v4 auditToken];
  }
  v9[0] = v9[1];
  id v6 = SecTaskCreateWithAuditToken(0, v9);
  id v7 = (__CFString *)SecTaskCopySigningIdentifier(v6, 0);
  if (v6) {
    CFRelease(v6);
  }
  id v8 = +[ICDeviceAccessManager sharedAccessManager];
  if (v8) {
    [v8 updateBundleIdentifier:v7 accessType:@"control_informed" withState:0];
  }
  if (v7) {

  }
  [v5 setObject:@"ICAuthorizationStatusNotDetermined" forKeyedSubscript:@"ICAuthorizationStatus"];
  (*((void (**)(id, id))a3 + 2))(a3, v5);
}

- (NSMutableArray)remoteManagerConnections
{
  return self->_remoteManagerConnections;
}

- (void)setRemoteManagerConnections:(id)a3
{
}

- (NSMutableDictionary)osTransactions
{
  return self->_osTransactions;
}

- (void)setOsTransactions:(id)a3
{
}

@end