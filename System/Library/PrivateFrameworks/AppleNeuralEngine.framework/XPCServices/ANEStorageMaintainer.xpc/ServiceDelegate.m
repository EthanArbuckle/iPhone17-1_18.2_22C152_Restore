@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[_ANEStrings storageMaintainerAccessEntitlement];
  v7 = [v5 valueForEntitlement:v6];
  v8 = v7;
  if (v7 && ([v7 BOOLValue] & 1) != 0)
  {
    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____ANEStorageMaintainerProtocol];
    [v5 setExportedInterface:v9];

    v10 = objc_opt_new();
    [v5 setExportedObject:v10];
    [v5 resume];

    BOOL v11 = 1;
  }
  else
  {
    v12 = +[_ANELog maintenance];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(a2);
      int v15 = 138412802;
      v16 = v14;
      __int16 v17 = 1024;
      unsigned int v18 = [v5 processIdentifier];
      __int16 v19 = 2112;
      v20 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: client(%d) : missing entitlement(%@)", (uint8_t *)&v15, 0x1Cu);
    }
    [v5 invalidate];
    BOOL v11 = 0;
  }

  return v11;
}

@end