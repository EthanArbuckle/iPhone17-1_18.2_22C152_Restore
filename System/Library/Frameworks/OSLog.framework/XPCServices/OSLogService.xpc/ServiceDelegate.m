@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(&v14, 0, sizeof(v14));
  v7 = [v6 _xpcConnection];
  xpc_connection_get_audit_token();

  v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___OSLogServiceProtocol];
  [v6 setExportedInterface:v8];

  v9 = objc_opt_new();
  memset(&atoken, 0, sizeof(atoken));
  [v9 setCallingProcessIdentifier:audit_token_to_pid(&atoken)];
  audit_token_t atoken = v14;
  [v9 setCallingProcessIdentifierVersion:audit_token_to_pidversion(&atoken)];
  [v6 setExportedObject:v9];
  objc_initWeak((id *)&atoken, v9);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100002A8C;
  v11[3] = &unk_100004378;
  objc_copyWeak(&v12, (id *)&atoken);
  [v6 setInvalidationHandler:v11];
  [v6 resume];
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&atoken);

  return 1;
}

@end