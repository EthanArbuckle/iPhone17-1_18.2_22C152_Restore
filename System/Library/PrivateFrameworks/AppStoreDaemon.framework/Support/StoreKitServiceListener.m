@interface StoreKitServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (StoreKitServiceListener)init;
- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5;
@end

@implementation StoreKitServiceListener

- (StoreKitServiceListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)StoreKitServiceListener;
  v2 = [(StoreKitServiceListener *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    eventMonitor = v2->_eventMonitor;
    v2->_eventMonitor = (SSEventMonitor *)v3;

    [(SSEventMonitor *)v2->_eventMonitor setDelegate:v2];
  }
  return v2;
}

- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5
{
  id v6 = a5;
  if ([a4 isEqualToString:SSEventNamePurchaseSucceeded])
  {
    v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v56 = (id)objc_opt_class();
      id v8 = v56;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Received purchase success event", buf, 0xCu);
    }
    v9 = sub_100268348(v6, @"response");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = objc_opt_class();
      v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
      id v54 = 0;
      v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v9 error:&v54];
      v13 = v54;

      if (v13)
      {
        v14 = ASDLogHandleForCategory();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        v35 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v56 = v35;
        __int16 v57 = 2114;
        v58 = v13;
        id v28 = v35;
        v29 = "%{public}@: Failed to unarchive event data - %{public}@";
        v30 = v14;
        uint32_t v31 = 22;
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [v12 purchase];
        if (v13)
        {
          v15 = [v12 URLResponse];
          v14 = [v15 bodyData];

          if ([v14 length])
          {
            id v53 = 0;
            id v52 = +[NSPropertyListSerialization propertyListWithData:v14 options:0 format:0 error:&v53];
            v16 = v53;
            if (v16)
            {
              ASDLogHandleForCategory();
              v17 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
              {
                v18 = objc_opt_class();
                *(_DWORD *)buf = 138543618;
                id v56 = v18;
                __int16 v57 = 2114;
                v58 = v16;
                id v19 = v18;
                _os_log_error_impl((void *)&_mh_execute_header, &v17->super, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive response data - %{public}@", buf, 0x16u);
              }
            }
            else
            {
              v17 = objc_alloc_init(_TtC9appstored6LogKey);
              v36 = [v13 buyParameters];
              v37 = +[AMSBuyParams buyParamsWithString:v36];

              v38 = [v37 dictionary];
              uint64_t v39 = sub_10026811C(v38, @"salableAdamId");

              v40 = [v37 dictionary];
              v50 = sub_1002689B4(v40, AMSBuyParamPropertyBundleId);

              v51 = (void *)v39;
              if (v39)
              {
                v49 = v37;
                v41 = [v12 URLResponse];

                if (v41)
                {
                  v42 = [v12 URLResponse];
                  v48 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v42 statusCode]);
                }
                else
                {
                  v48 = 0;
                }
                v46 = sub_100268568(v52, @"ad-network");
                sub_1003C44E0();
                v47 = (long long *)objc_claimAutoreleasedReturnValue();
                v44 = v51;
                v43 = v48;
                sub_1003CA5AC(v47, v51, v50, v46, v48);

                v45 = v50;
                v37 = v49;
              }
              else
              {
                v43 = ASDLogHandleForCategory();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v56 = v17;
                  _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "[%@] Interrupted purchase no app adam ID found", buf, 0xCu);
                }
                v45 = v50;
                v44 = 0;
              }

              v16 = 0;
            }
          }
          else
          {
            v16 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v33 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              id v56 = v33;
              id v34 = v33;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Purchase response has no data", buf, 0xCu);
            }
          }

          goto LABEL_7;
        }
        v14 = ASDLogHandleForCategory();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_7:

          goto LABEL_8;
        }
        v27 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v56 = v27;
        id v28 = v27;
        v29 = "%{public}@: Event payload has no original purchase";
        v30 = v14;
        uint32_t v31 = 12;
LABEL_29:
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);

        goto LABEL_7;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v21 = ASDLogHandleForCategory();
      v13 = v21;
      if ((isKindOfClass & 1) == 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = objc_opt_class();
          id v24 = v23;
          v25 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v56 = v23;
          __int16 v57 = 2114;
          v58 = v25;
          v26 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Event payload has invalid response. Expected: [SSPurchaseResponse | NSDictionary], Received: %{public}@", buf, 0x16u);
        }
        goto LABEL_8;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v56 = v22;
        __int16 v57 = 2114;
        v58 = v12;
        v14 = v22;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring purchase success event because the response is a dictionary. Likely from a code redemption. Response: %{public}@", buf, 0x16u);
        goto LABEL_7;
      }
    }
    else
    {
      v12 = ASDLogHandleForCategory();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      v32 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v56 = v32;
      v13 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: No payload data in event", buf, 0xCu);
    }
LABEL_8:

LABEL_10:
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 processIdentifier];
  if (proc_name(v8, buffer, 0x20u) < 1)
  {
    v9 = 0;
  }
  else
  {
    v9 = +[NSString stringWithUTF8String:buffer];
  }
  pid_t v10 = getpid();
  if (v8 == v10)
  {
    +[NSException raise:@"SKServiceDelegateLocalConnection", @"%@ received a connection from itself", self format];
  }
  else
  {
    v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      v23 = (uint64_t (*)(uint64_t, uint64_t))v7;
      id v12 = *(id *)&buf[4];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Accepting new connection (%{public}@) %{public}@", buf, 0x20u);
    }
    self;
    objc_msgSend(v7, "setExportedInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___StoreKitServiceConnection));
    v13 = objc_alloc_init(StoreKitServiceConnection);
    [v7 setExportedObject:v13];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v23 = sub_100018438;
    id v24 = sub_100017DD8;
    id v14 = v7;
    id v25 = v14;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1003E8204;
    v19[3] = &unk_1005212B0;
    v19[4] = self;
    id v15 = v9;
    id v20 = v15;
    v21 = buf;
    [v14 setInvalidationHandler:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1003E82EC;
    v17[3] = &unk_1005218C0;
    v17[4] = self;
    id v18 = v15;
    [v14 setInterruptionHandler:v17];
    [v14 resume];

    _Block_object_dispose(buf, 8);
  }

  return v8 != v10;
}

- (void).cxx_destruct
{
}

@end