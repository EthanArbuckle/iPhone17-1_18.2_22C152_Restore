@interface ServiceDelegate
- (BOOL)_auditToken:(id *)a3 hasEntitlement:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  BOOL v9 = [(ServiceDelegate *)self _auditToken:v13 hasEntitlement:@"com.apple.private.DiagnosticsSessionAvailability.client"];
  if (v9)
  {
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DSDiagnosticsSessionAvailabilityServiceProtocol];
    [v8 setExportedInterface:v10];

    v11 = objc_opt_new();
    [v8 setExportedObject:v11];
    [v8 activate];
  }
  else
  {
    [v8 invalidate];
  }

  return v9;
}

- (BOOL)_auditToken:(id *)a3 hasEntitlement:(id)a4
{
  id v4 = a4;
  [v4 UTF8String];
  v5 = (void *)xpc_copy_entitlement_for_token();
  id v6 = v5;
  if (v5 && xpc_BOOL_get_value(v5))
  {
    BOOL v7 = 1;
  }
  else
  {
    v8 = DSLogSessionAvailability();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000CB9C(v8);
    }

    BOOL v9 = +[NSError errorWithDomain:v4 code:0 userInfo:0];
    +[DSAnalytics sendAnalyticsWithEvent:5 error:v9];

    BOOL v7 = 0;
  }

  return v7;
}

@end