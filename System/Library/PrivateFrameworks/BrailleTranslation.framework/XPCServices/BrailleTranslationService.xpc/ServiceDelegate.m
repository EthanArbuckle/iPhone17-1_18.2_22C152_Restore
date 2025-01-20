@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  char HasEntitlement = BRLTSConnectionHasEntitlement();
  v6 = BRLTLog();
  v7 = v6;
  if (HasEntitlement)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 auditSessionIdentifier]);
      v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 processIdentifier]);
      int v13 = 138412802;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Accepting connection from client. auditID:%@ pid:%@, connection:%@", (uint8_t *)&v13, 0x20u);
    }
    v10 = +[BRLTSTranslationService exportedInterface];
    [v4 setExportedInterface:v10];

    id v11 = objc_alloc_init((Class)BRLTSTranslationService);
    [v4 setExportedObject:v11];

    [v4 resume];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000038FC(v4, v7);
    }
  }
  return HasEntitlement;
}

@end