@interface PurchaseRequestTask
- (void)main;
@end

@implementation PurchaseRequestTask

- (void)main
{
  v45 = sub_100213454();
  if (self) {
    options = self->super._options;
  }
  else {
    options = 0;
  }
  v4 = options;
  v5 = [(ASDRequestOptions *)v4 purchases];

  v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (_TtC9appstored6LogKey *)[v5 count];
    if (self) {
      client = self->super._client;
    }
    else {
      client = 0;
    }
    v9 = client;
    v10 = [(XPCClient *)v9 clientID];
    *(_DWORD *)buf = 134218242;
    v57 = v7;
    __int16 v58 = 2114;
    v59 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Purchasing %ld app(s) for client: %{public}@", buf, 0x16u);
  }
  if ([v5 count])
  {
    if (self) {
      v11 = self->super._client;
    }
    else {
      v11 = 0;
    }
    v12 = v11;
    v13 = [(XPCClient *)v12 clientID];

    if (v13)
    {
      id v14 = objc_alloc((Class)AMSProcessInfo);
      if (self) {
        v15 = self->super._client;
      }
      else {
        v15 = 0;
      }
      v16 = self;
      v17 = v15;
      v18 = [(XPCClient *)v17 clientID];
      id v19 = [v14 initWithBundleIdentifier:v18];
    }
    else
    {
      v16 = self;
      id v19 = 0;
    }
    v42 = v19;
    v44 = sub_1004168E0((uint64_t)XPCRequestToken, v19);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v5;
    id v20 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v51;
      do
      {
        v23 = 0;
        do
        {
          if (*(void *)v51 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v23);
          v25 = [_TtC9appstored6LogKey alloc];
          v26 = [v24 bundleID];
          v27 = [v24 itemID];
          v28 = [(LogKey *)v25 initWithBatchLogKey:0 logCode:@"BUY" externalID:0 bundleID:v26 itemID:v27];

          v29 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v28;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%@]: Starting purchase", buf, 0xCu);
          }

          dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
          v54 = v24;
          v31 = +[NSArray arrayWithObjects:&v54 count:1];
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_1003AB8C0;
          v46[3] = &unk_10052B840;
          v32 = v28;
          v47 = v32;
          v48 = v16;
          v33 = v30;
          v49 = v33;
          [v45 processPurchases:v31 failBatchOnError:0 requestToken:v44 withReplyHandler:v46];

          dispatch_time_t v34 = dispatch_time(0, 7200000000000);
          if (dispatch_semaphore_wait(v33, v34))
          {
            v35 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v32;
              _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "[%@]: Purchase never completed after two hours", buf, 0xCu);
            }

            v36 = ASDErrorWithTitleAndMessage();
            id v37 = [objc_alloc((Class)ASDPurchaseResponse) initWithError:v36];
            sub_1003AB9FC(v16, v37);
          }
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v21);
    }

    self = v16;
  }
  v38 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      v39 = self->super._client;
    }
    else {
      v39 = 0;
    }
    v40 = v39;
    v41 = [(XPCClient *)v40 clientID];
    *(_DWORD *)buf = 138543362;
    v57 = v41;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Purchasing complete for client: %{public}@", buf, 0xCu);
  }
}

@end