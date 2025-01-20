@interface StoreQueueListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (StoreQueueListener)init;
- (void)checkQueueWithOptions:(id)a3 completionBlock:(id)a4;
- (void)claimApplicationsWithOptions:(id)a3 completionBlock:(id)a4;
- (void)managedApplicationRequestWithOptions:(id)a3 completionBlock:(id)a4;
@end

@implementation StoreQueueListener

- (StoreQueueListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)StoreQueueListener;
  return [(StoreQueueListener *)&v3 init];
}

- (void)checkQueueWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = sub_100205040((uint64_t)self);
    int v16 = 138543618;
    v17 = v9;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: checkQueueWithOptionsclient: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  v12 = sub_1003A0168();
  if ([v6 reason] == (id)1)
  {
    v13 = sub_100205040((uint64_t)self);
    uint64_t v14 = (uint64_t)v12;
    uint64_t v15 = 0;
LABEL_7:
    sub_1003A0244(v14, v15, (uint64_t)v13, v7);
    goto LABEL_8;
  }
  if ([v6 reason] == (id)2)
  {
    v13 = sub_100205040((uint64_t)self);
    uint64_t v14 = (uint64_t)v12;
    uint64_t v15 = 1;
    goto LABEL_7;
  }
  if (!v7) {
    goto LABEL_9;
  }
  v13 = ASDErrorWithTitleAndMessage();
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
LABEL_8:

LABEL_9:
}

- (void)claimApplicationsWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = sub_100205040((uint64_t)self);
    int v14 = 138543618;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: claimApplicationsWithOptions client: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  v12 = sub_1003A0168();
  v13 = sub_100205040((uint64_t)self);
  sub_1003A02D0((uint64_t)v12, (uint64_t)v7, v13);
}

- (void)managedApplicationRequestWithOptions:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSXPCConnection currentConnection];
  v8 = sub_10000CB98((uint64_t)AMSProcessInfo);

  v9 = [v8 bundleIdentifier];
  uint64_t v10 = qos_class_self();
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_opt_class();
    id v13 = v12;
    int v14 = sub_10032F778(v10);
    int v16 = 138544130;
    v17 = v12;
    __int16 v18 = 2114;
    v19 = v9;
    __int16 v20 = 2114;
    v21 = v14;
    __int16 v22 = 1024;
    int v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] ASDManagedApplicationRequest start with clientID: %{public}@ qoS: %{public}@ (0x%x)", (uint8_t *)&v16, 0x26u);
  }
  uint64_t v15 = sub_1003A0168();
  sub_1003A0388((uint64_t)v15, v6, v9, v10, v5);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  if (sub_10025A6C0((uint64_t)self, v5, @"com.apple.appstored.private")
    || sub_10025A6C0((uint64_t)self, v5, @"com.apple.appstored.install-apps")
    || sub_10025A984((uint64_t)self, v5, @"Queue"))
  {
    goto LABEL_7;
  }
  id v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6;
    id v18 = *(id *)&buf[4];
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Treating %i as legacy client", buf, 0x12u);
  }
  if (sub_10025A6C0((uint64_t)self, v5, @"com.apple.itunesstored.private"))
  {
LABEL_7:
    id v8 = v5;
    v9 = v8;
    if (self)
    {
      unsigned int v10 = [v8 processIdentifier];
      v11 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        id v13 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@]: Got connection from pid: %i", buf, 0x12u);
      }
      int v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASDStoreQueueProtocol];
      [v9 setExportedInterface:v14];
      [v9 setExportedObject:self];
      objc_initWeak(&location, self);
      objc_initWeak(&from, v9);
      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      int v23 = sub_1002057C8;
      v24 = &unk_100521BA8;
      objc_copyWeak(&v25, &location);
      unsigned int v26 = v10;
      [v9 setInterruptionHandler:&v21];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1002058B0;
      v30 = &unk_100521BD0;
      objc_copyWeak(&v31, &location);
      objc_copyWeak(&v32, &from);
      unsigned int v33 = v10;
      objc_msgSend(v9, "setInvalidationHandler:", buf, v21, v22, v23, v24);
      [v9 resume];
      objc_destroyWeak(&v32);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    BOOL v15 = 1;
  }
  else
  {
    v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      id v20 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{public}@]: Connection denied for pid: %i for non entitled client", buf, 0x12u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

@end