@interface ODRServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ODRServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "appstored is pondering accepting a new connection...", buf, 2u);
  }

  int v6 = MKBDeviceUnlockedSinceBoot();
  if (v6 == 1)
  {
  }
  else
  {
    v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Refusing connection to the foundation interface. This device has not been unlocked since boot, and we can do no useful work.", v9, 2u);
    }

    [v4 invalidate];
  }

  return v6 == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPacksPath, 0);
  objc_storeStrong((id *)&self->_legacyDatabasePath, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_libraryPath, 0);
}

@end