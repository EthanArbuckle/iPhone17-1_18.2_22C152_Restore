@interface MPRemotePlayerService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation MPRemotePlayerService

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  v9 = MSVBundleIDForAuditToken();
  unsigned int v10 = [v8 processIdentifier];
  id v11 = [v9 length];
  if (v11)
  {
    v12 = sub_100004424();
    id v13 = [v12 beginTaskWithName:@"shouldAcceptNewConnection" expirationHandler:0];

    v14 = sub_100003CC4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v25 = self;
      __int16 v26 = 2112;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MPRemotePlayerService: %p: Received new incoming XPC connection: %@", buf, 0x16u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005110;
    block[3] = &unk_100008340;
    id v17 = v8;
    id v18 = v9;
    v19 = self;
    unsigned int v21 = v10;
    id v20 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [v8 invalidate];
  }

  return v11 != 0;
}

@end