@interface ODRBaseListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)odrEntitlementName;
- (NSString)odrServiceName;
@end

@implementation ODRBaseListener

- (NSString)odrEntitlementName
{
  return 0;
}

- (NSString)odrServiceName
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [(ODRBaseListener *)self odrEntitlementName];
  v7 = [(ODRBaseListener *)self odrServiceName];
  if (MKBDeviceUnlockedSinceBoot() != 1)
  {
    v13 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      v16 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Connection to %@ interface failed: device has not been unlocked since boot", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_12;
  }
  v8 = [v5 valueForEntitlement:v6];
  unsigned int v9 = [v8 BOOLValue];

  v10 = ASDLogHandleForCategory();
  v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      v16 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Connection to %@ interface failed: client is not suitably entitled", (uint8_t *)&v15, 0xCu);
    }

LABEL_12:
    [v5 invalidate];
    BOOL v12 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Connection to %@ interface permitted with suitable entitlements", (uint8_t *)&v15, 0xCu);
  }

  [(ODRBaseListener *)self configureClientWithConnection:v5];
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

@end