@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 6;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[ServiceDelegate listener:shouldAcceptNewConnection:]();
    }
    v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    v9 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "got new xpc connection!", buf, 2u);
  }

  v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCBluetoothPairingServiceProtocol];
  [v6 setExportedInterface:v10];

  v11 = objc_opt_new();
  [v6 setExportedObject:v11];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v13[3] = &unk_10000C378;
  objc_copyWeak(&v14, (id *)buf);
  [v6 setInvalidationHandler:v13];
  [v6 resume];
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

  return 1;
}

void __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 6;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[ServiceDelegate listener:shouldAcceptNewConnection:]();
    }
    v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    v4 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v14 = 138412290;
    id v15 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated: %@", (uint8_t *)&v14, 0xCu);
  }
  id v6 = (id *)(a1 + 32);
  id v7 = objc_loadWeakRetained(v6);
  [v7 setInvalidationHandler:0];

  id v8 = objc_loadWeakRetained(v6);
  v9 = [v8 exportedObject];

  if (v9)
  {
    [v9 cleanup];
  }
  id v10 = objc_loadWeakRetained(v6);
  [v10 setExportedObject:0];

  if (gLogObjects && gNumLogObjects >= 6)
  {
    v11 = *(id *)(gLogObjects + 40);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[ServiceDelegate listener:shouldAcceptNewConnection:]();
    }
    v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_loadWeakRetained(v6);
    int v14 = 138412290;
    id v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "END - XPC connection invalidated: %@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, &_os_log_default, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

@end