@interface LAEndpointProviderServer
+ (BOOL)handleConnection:(id)a3;
- (void)provideEndpoint:(int64_t)a3 uid:(unsigned int)a4 reply:(id)a5;
@end

@implementation LAEndpointProviderServer

+ (BOOL)handleConnection:(id)a3
{
  id v3 = a3;
  v4 = (id *)objc_opt_new();
  objc_storeWeak(v4 + 1, v3);
  v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LAProtocolEndpointProviderServer];
  [v3 setExportedInterface:v5];

  [v3 setExportedObject:v4];
  [v3 setInvalidationHandler:&stru_100038BF0];

  return 1;
}

- (void)provideEndpoint:(int64_t)a3 uid:(unsigned int)a4 reply:(id)a5
{
  v6 = (void (**)(id, void))a5;
  if ((unint64_t)a3 >= 4)
  {
    v8 = sub_10000BA10();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100027614(a3, v8);
    }

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = qword_100038C98[a3];
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10000BC60;
  v19 = sub_10000BC70;
  id v20 = 0;
  if (a3)
  {
    id v9 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v7 options:0];
    v10 = [v9 _xpcConnection];
    xpc_connection_set_target_uid();

    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LAProtocolEndpointProvider];
    [v9 setRemoteObjectInterface:v11];

    [v9 resume];
    v12 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&stru_100038C30];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000BCCC;
    v14[3] = &unk_100038C58;
    v14[4] = &v15;
    [v12 getEndpoint:v14];

    [v9 invalidate];
    uint64_t v13 = v16[5];
  }
  else
  {
    uint64_t v13 = 0;
  }
  v6[2](v6, v13);
  _Block_object_dispose(&v15, 8);
}

- (void).cxx_destruct
{
}

@end