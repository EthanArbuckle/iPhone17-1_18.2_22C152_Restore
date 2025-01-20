@interface FMDCoreAccessoryManager
- (FMDACCConnectionInfo)connectionInfo;
- (FMDCoreAccessoriesCache)cache;
- (FMDCoreAccessoryManager)initWithDelegate:(id)a3;
- (FMDCoreAccessoryManagerDelegateProtocol)delegate;
- (NSDictionary)accessoryRawInfo;
- (OS_dispatch_queue)serialQueue;
- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6;
- (void)accessoryConnectionDetached:(id)a3;
- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5;
- (void)accessoryEndpointUpdate:(id)a3 protocol:(int)a4 properties:(id)a5 forConnection:(id)a6;
- (void)setCache:(id)a3;
- (void)setConnectionInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation FMDCoreAccessoryManager

- (FMDCoreAccessoryManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMDCoreAccessoryManager;
  v5 = [(FMDCoreAccessoryManager *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    cache = v5->_cache;
    v5->_cache = (FMDCoreAccessoriesCache *)v6;

    [(FMDCoreAccessoryManager *)v5 setDelegate:v4];
    dispatch_queue_t v8 = dispatch_queue_create("FMDCoreAccessoryManager.serialQueue", 0);
    [(FMDCoreAccessoryManager *)v5 setSerialQueue:v8];

    v9 = +[FMDACCConnectionInfoFactory connectionInfo];
    [(FMDCoreAccessoryManager *)v5 setConnectionInfo:v9];

    uint64_t v16 = ACCConnectionInfoFilterAllowConnectionType;
    v17 = &off_100028B28;
    v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v11 = [(FMDCoreAccessoryManager *)v5 connectionInfo];
    [v11 registerDelegate:v5 withFilter:v10];

    v12 = sub_100006910();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDCoreAccessoryManager intialised", v14, 2u);
    }
  }
  return v5;
}

- (NSDictionary)accessoryRawInfo
{
  v2 = [(FMDCoreAccessoryManager *)self cache];
  v3 = [v2 accessoriesRawInfo];

  return (NSDictionary *)v3;
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [(FMDCoreAccessoryManager *)self serialQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000098D8;
  v16[3] = &unk_100024A08;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(FMDCoreAccessoryManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009B84;
  block[3] = &unk_100024A30;
  id v20 = v14;
  id v21 = v13;
  v22 = self;
  id v23 = v12;
  int v24 = a5;
  int v25 = a4;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  dispatch_async(v15, block);
}

- (void)accessoryConnectionDetached:(id)a3
{
  id v4 = a3;
  v5 = sub_100006910();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[FMDCoreAccessoryManager accessoryConnectionDetached:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA %s %@", buf, 0x16u);
  }

  uint64_t v6 = [(FMDCoreAccessoryManager *)self serialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000A05C;
  v8[3] = &unk_100024998;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)accessoryEndpointUpdate:(id)a3 protocol:(int)a4 properties:(id)a5 forConnection:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  id v9 = sub_100006910();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = "-[FMDCoreAccessoryManager accessoryEndpointUpdate:protocol:properties:forConnection:]";
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#CA %s %@ %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100006910();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[FMDCoreAccessoryManager accessoryConnectionInfoPropertyChanged:properties:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#CA %s %@ %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_100006910();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v17 = "-[FMDCoreAccessoryManager accessoryEndpointInfoPropertyChanged:properties:forConnection:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#CA %s %@ %@", buf, 0x20u);
  }

  __int16 v10 = [(FMDCoreAccessoryManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A560;
  block[3] = &unk_100024AA8;
  void block[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, block);
}

- (FMDCoreAccessoryManagerDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMDCoreAccessoryManagerDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FMDACCConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (FMDCoreAccessoriesCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end