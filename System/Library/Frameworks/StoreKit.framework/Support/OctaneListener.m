@interface OctaneListener
+ (void)start;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation OctaneListener

+ (void)start
{
  if (qword_1003A0758 != -1) {
    dispatch_once(&qword_1003A0758, &stru_10035A7C8);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v25 = a3;
  id v5 = a4;
  unsigned int v28 = [v5 processIdentifier];
  v26 = objc_msgSend(v5, "sk_clientID");
  v6 = [v5 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = [v6 mutableCopy];

      v6 = v7;
    }
  }
  if (!v6) {
    v6 = objc_opt_new();
  }
  v8 = +[NSUUID UUID];
  v29 = [v8 UUIDString];

  [v6 setObject:v29 forKeyedSubscript:@"octaneClientUUID"];
  [v5 setUserInfo:v6];
  if (qword_1003A07A8 != -1) {
    dispatch_once(&qword_1003A07A8, &stru_10035A838);
  }
  v9 = (void *)qword_1003A0798;
  if (os_log_type_enabled((os_log_t)qword_1003A0798, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    *(_DWORD *)buf = 138543874;
    uint64_t v39 = objc_opt_class();
    __int16 v40 = 1024;
    unsigned int v41 = v28;
    __int16 v42 = 2114;
    v43 = v29;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@]: Got connection from pid: %i (%{public}@)", buf, 0x1Cu);
  }
  v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___StoreKitTestingServiceProtocol];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
  [v11 setClasses:v16 forSelector:"sendTestPingbackForBundleID:completion:" argumentIndex:0 ofReply:1];

  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
  [v11 setClasses:v20 forSelector:"showMessage:forBundleID:" argumentIndex:0 ofReply:0];

  [v5 setExportedInterface:v11];
  v21 = +[StoreKitTestingService defaultService];
  [v5 setExportedObject:v21];

  objc_initWeak((id *)buf, self);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100099F0C;
  v35[3] = &unk_10035A7F0;
  objc_copyWeak(&v36, (id *)buf);
  unsigned int v37 = v28;
  [v5 setInterruptionHandler:v35];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100099F98;
  v30[3] = &unk_10035A818;
  objc_copyWeak(&v33, (id *)buf);
  unsigned int v34 = v28;
  id v22 = v29;
  id v31 = v22;
  id v23 = v26;
  id v32 = v23;
  [v5 setInvalidationHandler:v30];
  [v5 resume];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);

  return 1;
}

@end