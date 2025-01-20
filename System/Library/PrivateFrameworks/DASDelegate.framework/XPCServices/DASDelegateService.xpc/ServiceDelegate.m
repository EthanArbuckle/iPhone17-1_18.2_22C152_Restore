@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.dasd.DASDelegateService.allow"];
  v6 = v5;
  if (v5 && [v5 BOOLValue])
  {
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DASDelegateServiceProtocol];
    [v4 setExportedInterface:v7];

    v8 = objc_opt_new();
    [v4 setExportedObject:v8];
    [v4 resume];
    v9 = (void *)qword_100008878;
    if (os_log_type_enabled((os_log_t)qword_100008878, OS_LOG_TYPE_DEBUG)) {
      sub_1000028F4(v9, v4);
    }

    BOOL v10 = 1;
  }
  else
  {
    v11 = (void *)qword_100008878;
    if (os_log_type_enabled((os_log_t)qword_100008878, OS_LOG_TYPE_ERROR)) {
      sub_100002858(v11, v4);
    }
    BOOL v10 = 0;
  }

  return v10;
}

@end