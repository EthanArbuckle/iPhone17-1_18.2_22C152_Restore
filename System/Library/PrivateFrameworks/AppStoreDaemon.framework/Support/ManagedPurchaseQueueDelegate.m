@interface ManagedPurchaseQueueDelegate
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
@end

@implementation ManagedPurchaseQueueDelegate

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a6;
  v11 = sub_1003A0B6C();
  unsigned int v12 = sub_1003A0D4C(v11);

  if (v12)
  {
    v13 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v9 logUUID];
      *(_DWORD *)buf = 138412290;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] Interactive authentication requested but has been disabled for shared iPad", buf, 0xCu);
    }
    v15 = ASDErrorWithUserInfoAndFormat();
    v10[2](v10, 0, v15);
  }
  else
  {
    v16 = sub_10030B11C();
    v17 = [v16 BOOLForKey:@"disable-vpp-interactive-authentication"];
    v15 = [v17 valueWithError:0];

    if (v15 && [v15 BOOLValue])
    {
      v18 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v9 logUUID];
        *(_DWORD *)buf = 138412290;
        v27 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%@] Interactive authentication requested but has been disabled in the bag", buf, 0xCu);
      }
      v20 = ASDErrorWithUserInfoAndFormat();
      v10[2](v10, 0, v20);
    }
    else
    {
      v21 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v9 logUUID];
        *(_DWORD *)buf = 138412290;
        v27 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%@] Attempting interactive authentication for volume purchase", buf, 0xCu);
      }
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1002F3A68;
      v23[3] = &unk_100524148;
      id v24 = v9;
      v25 = v10;
      sub_10033CF54((uint64_t)InteractiveRequestPresenter, v8, v23);

      v20 = v24;
    }
  }
}

@end