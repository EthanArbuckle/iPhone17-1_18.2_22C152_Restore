@interface IUIDummyITTInputTeletypeServer
+ (id)sharedServer;
- (IUIDummyITTInputTeletypeServer)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation IUIDummyITTInputTeletypeServer

+ (id)sharedServer
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (IUIDummyITTInputTeletypeServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)IUIDummyITTInputTeletypeServer;
  id v2 = [(IUIDummyITTInputTeletypeServer *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000346C;
    v10[3] = &unk_10001C4C8;
    v4 = v2;
    v11 = v4;
    uint64_t v5 = +[BSServiceConnectionListener listenerWithConfigurator:v10];
    id v6 = v4[1];
    v4[1] = (id)v5;

    v7 = sub_1000029D8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initialize dummy input teletype server.", v9, 2u);
    }

    [v4[1] activate];
  }
  return v3;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5 = a4;
  id v6 = sub_1000029D8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Rejecting connection: %@", (uint8_t *)&v7, 0xCu);
  }

  [v5 invalidate];
}

- (void).cxx_destruct
{
}

@end