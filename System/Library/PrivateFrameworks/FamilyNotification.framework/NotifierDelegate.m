@interface NotifierDelegate
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)start;
@end

@implementation NotifierDelegate

+ (id)sharedInstance
{
  if (qword_10000DB38 != -1) {
    dispatch_once(&qword_10000DB38, &stru_100008270);
  }
  v2 = (void *)qword_10000DB30;
  return v2;
}

- (void)start
{
  v3 = +[NotificationController sharedController];
  [v3 start];

  v4 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.familynotification.agent"];
  listener = self->_listener;
  self->_listener = v4;

  [(NSXPCListener *)self->_listener setDelegate:self];
  v6 = self->_listener;
  [(NSXPCListener *)v6 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FAFamilyNotifierAgentProtocol];
  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
  [v5 setClasses:v7 forSelector:"pendingNotificationsWithIdentifier:replyBlock:" argumentIndex:0 ofReply:1];

  [v4 setExportedInterface:v5];
  v8 = [[NotifierInterface alloc] initWithXPCConnection:v4];
  [v4 setExportedObject:v8];
  [v4 resume];

  return 1;
}

- (void).cxx_destruct
{
}

@end