@interface FollowUpServer
+ (id)_executablePathForPID:(int)a3;
+ (id)fl_getProcNameForPID:(int)a3;
- (BOOL)_connectionHasEntitlement:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FollowUpServer)init;
- (NSMutableSet)unentitledClients;
- (NSXPCListener)listener;
- (void)_beginObservingLanguageChangeNotfication;
- (void)_stopObservingLanguageChangeNotification;
- (void)dealloc;
- (void)lightStart;
- (void)setListener:(id)a3;
- (void)setUnentitledClients:(id)a3;
- (void)start;
@end

@implementation FollowUpServer

- (FollowUpServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)FollowUpServer;
  v2 = [(FollowUpServer *)&v7 init];
  if (v2)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.corefollowup.agent"];
    listener = v2->_listener;
    v2->_listener = v3;

    v5 = +[NSMutableSet set];
    [(FollowUpServer *)v2 setUnentitledClients:v5];
  }
  return v2;
}

- (void)start
{
  +[ClientInterface updateBadgeCounts:1];
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = [v3 addObserverForName:MCRestrictionChangedNotification object:0 queue:0 usingBlock:&stru_10001C818];
  id restrictionNotificationObject = self->_restrictionNotificationObject;
  self->_id restrictionNotificationObject = v4;

  v9 = objc_alloc_init(FLUserNotificationProvider);
  v6 = +[NotificationController sharedController];
  [(FLUserNotificationProvider *)v9 setDelegate:v6];

  [(FLUserNotificationProvider *)v9 start];
  objc_super v7 = +[NotificationController sharedController];
  [v7 setNotificationProvider:v9];

  v8 = +[NotificationController sharedController];
  [v8 start];

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  [(FollowUpServer *)self _beginObservingLanguageChangeNotfication];
}

- (void)lightStart
{
  [(NSXPCListener *)self->_listener setDelegate:self];
  listener = self->_listener;

  [(NSXPCListener *)listener resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(FollowUpServer *)self _connectionHasEntitlement:v5];
  if (v6)
  {
    objc_super v7 = [[ClientInterface alloc] initWithXPCConnection:v5];
    v8 = FLDaemonExportedInterface();
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:v7];
    [v5 resume];
  }
  else
  {
    +[FollowUpServer fl_getProcNameForPID:](FollowUpServer, "fl_getProcNameForPID:", [v5 processIdentifier]);
    objc_super v7 = (ClientInterface *)objc_claimAutoreleasedReturnValue();
    id v9 = [v5 processIdentifier];

    id v5 = +[FollowUpServer _executablePathForPID:v9];
    v10 = [(FollowUpServer *)self unentitledClients];
    LOBYTE(v9) = [v10 containsObject:v7];

    if ((v9 & 1) == 0)
    {
      v11 = +[NSString stringWithFormat:@"Unentitled connection to followupd from %@ at %@", v7, v5];
      v12 = [(FollowUpServer *)self unentitledClients];
      [v12 addObject:v7];

      if (qword_100022E68)
      {
        free((void *)qword_100022E68);
        qword_100022E68 = 0;
      }
      id v13 = v11;
      qword_100022E68 = (uint64_t)strdup((const char *)[v13 UTF8String]);
      qword_100022E20 = qword_100022E68;
      v14 = _FLLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_100010634((uint64_t)v13, v14);
      }
    }
  }

  return v6;
}

- (BOOL)_connectionHasEntitlement:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.followup"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (id)_executablePathForPID:(int)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", buffer, proc_pidpath(a3, buffer, 0x1000u), 4);

  return v3;
}

+ (id)fl_getProcNameForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (proc_name(a3, buffer, 0x100u) >= 1)
  {
    unsigned __int8 v4 = buffer;
LABEL_6:
    BOOL v6 = +[NSString stringWithUTF8String:v4];
    goto LABEL_7;
  }
  size_t v8 = 648;
  *(void *)v10 = 0xE00000001;
  memset(v9, 0, 512);
  int v11 = 1;
  int v12 = v3;
  int v5 = sysctl(v10, 4u, v9, &v8, 0, 0);
  BOOL v6 = 0;
  if (!v5 && BYTE3(v9[15]))
  {
    unsigned __int8 v4 = (char *)&v9[15] + 3;
    goto LABEL_6;
  }
LABEL_7:
  if (!v6)
  {
    BOOL v6 = +[NSString stringWithFormat:@"<pid:%d>", v3];
  }

  return v6;
}

- (void)dealloc
{
  [(FollowUpServer *)self _stopObservingLanguageChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)FollowUpServer;
  [(FollowUpServer *)&v3 dealloc];
}

- (void)_beginObservingLanguageChangeNotfication
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100005278, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopObservingLanguageChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.language.changed", 0);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)unentitledClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUnentitledClients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unentitledClients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong(&self->_restrictionNotificationObject, 0);
}

@end