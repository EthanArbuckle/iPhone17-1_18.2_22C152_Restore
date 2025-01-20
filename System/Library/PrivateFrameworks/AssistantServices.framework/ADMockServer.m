@interface ADMockServer
+ (id)sharedServer;
- (BOOL)_establishConnectionIfNeeded;
- (void)replayWithFileURL:(id)a3 completion:(id)a4;
@end

@implementation ADMockServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)replayWithFileURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0;
  unsigned int v8 = [v6 checkResourceIsReachableAndReturnError:&v18];
  id v9 = v18;
  if (v8)
  {
    if (_AFPreferencesAuthenticationDisabled())
    {
      if ([(ADMockServer *)self _establishConnectionIfNeeded])
      {
        remoteProxy = self->_remoteProxy;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100080750;
        v16[3] = &unk_10050D440;
        id v17 = v7;
        [(AMSMockServerProtocol *)remoteProxy startMockServerWithReplayFile:v6 withReply:v16];

        goto LABEL_10;
      }
      NSErrorUserInfoKey v25 = NSDebugDescriptionErrorKey;
      CFStringRef v26 = @"mock server connection not available";
      v12 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v13 = kAFAssistantErrorDomain;
      uint64_t v14 = 2301;
    }
    else
    {
      NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
      CFStringRef v24 = @"mock server requires mobile default com.apple.assistant 'Authentication Disabled' set to YES";
      v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v13 = kAFAssistantErrorDomain;
      uint64_t v14 = 2300;
    }
    uint64_t v15 = +[NSError errorWithDomain:v13 code:v14 userInfo:v12];

    id v9 = (id)v15;
    goto LABEL_10;
  }
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[ADMockServer replayWithFileURL:completion:]";
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Cannot play MockServer replay file at: %@", buf, 0x16u);
  }
LABEL_10:
  if (v7 && v9) {
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }
}

- (BOOL)_establishConnectionIfNeeded
{
  if (!self->_connection)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.siri.MockServer"];
    connection = self->_connection;
    self->_connection = v3;

    v5 = self->_connection;
    id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AMSMockServerProtocol];
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_connection resume];
    id v7 = self->_connection;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008086C;
    v11[3] = &unk_10050C610;
    v11[4] = self;
    unsigned int v8 = [(NSXPCConnection *)v7 remoteObjectProxyWithErrorHandler:v11];
    remoteProxy = self->_remoteProxy;
    self->_remoteProxy = v8;
  }
  return self->_remoteProxy != 0;
}

+ (id)sharedServer
{
  if (qword_100585868 != -1) {
    dispatch_once(&qword_100585868, &stru_1004FFF08);
  }
  v2 = (void *)qword_100585870;
  return v2;
}

@end