@interface GNSSLocationServiceDelegate
- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)isExecutableAllowed:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)executablePathOfConnection:(id)a3;
@end

@implementation GNSSLocationServiceDelegate

- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4
{
  v5 = [a3 valueForEntitlement:a4];
  self->BOOL hasEntitlementToRunRaven = v5 != 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasEntitlementToRunRaven = self->hasEntitlementToRunRaven;
    v9[0] = 67109120;
    v9[1] = hasEntitlementToRunRaven;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,returnValue,%d", (uint8_t *)v9, 8u);
  }
  BOOL v7 = self->hasEntitlementToRunRaven;

  return v7;
}

- (id)executablePathOfConnection:(id)a3
{
  id v3 = a3;
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath((int)[v3 processIdentifier], buffer, 0x1000u) < 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = +[NSString stringWithUTF8String:buffer];
  }

  return v4;
}

- (BOOL)isExecutableAllowed:(id)a3
{
  id v4 = a3;
  v5 = +[NSSet setWithObjects:@"locationd", 0];
  v6 = [(GNSSLocationServiceDelegate *)self executablePathOfConnection:v4];
  BOOL v7 = [v6 lastPathComponent];

  LOBYTE(v6) = [v5 containsObject:v7];
  return (char)v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  if (![(GNSSLocationServiceDelegate *)self clientConnection:v5 hasEntitlement:@"com.apple.private.corelocation.GNSSLocationService"])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,Application does not have correct entitlement", (uint8_t *)&v12, 2u);
    }
    goto LABEL_8;
  }
  if (![(GNSSLocationServiceDelegate *)self isExecutableAllowed:v5])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(GNSSLocationServiceDelegate *)self executablePathOfConnection:v5];
      v10 = [v9 lastPathComponent];
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,Application not allowed to establish connection,%@", (uint8_t *)&v12, 0xCu);
    }
LABEL_8:
    [v5 invalidate];
    BOOL v8 = 0;
    goto LABEL_9;
  }
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GNSSLocationServiceProtocol];
  [v5 setExportedInterface:v6];

  BOOL v7 = objc_opt_new();
  [v7 setEntitlementsForRaven:self->hasEntitlementToRunRaven];
  [v5 setExportedObject:v7];
  [v5 resume];

  BOOL v8 = 1;
LABEL_9:

  return v8;
}

@end