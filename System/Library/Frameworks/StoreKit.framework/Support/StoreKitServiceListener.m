@interface StoreKitServiceListener
+ (void)start;
- (StoreKitServiceListener)init;
- (void)_invalidateUnfinishedTransactionsForBundleID:(id)a3 logKey:(id)a4;
- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4;
@end

@implementation StoreKitServiceListener

+ (void)start
{
  if (qword_1003A0100 != -1) {
    dispatch_once(&qword_1003A0100, &stru_100359BB0);
  }
}

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
  id v7 = a5;
  if ([a4 isEqualToString:SSEventNamePurchaseSucceeded])
  {
    v8 = +[NSUUID UUID];
    v9 = objc_msgSend(v8, "lib_logUUID");

    if (qword_1003A0110 != -1) {
      dispatch_once(&qword_1003A0110, &stru_100359BD0);
    }
    v10 = qword_100399AF8;
    if (os_log_type_enabled((os_log_t)qword_100399AF8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received purchase success event", buf, 0xCu);
    }
    v11 = objc_msgSend(v7, "tcr_dataForKey:", @"response");
    if (!v11)
    {
      if (qword_1003A0110 != -1) {
        dispatch_once(&qword_1003A0110, &stru_100359BD0);
      }
      v16 = qword_100399AF8;
      if (os_log_type_enabled((os_log_t)qword_100399AF8, OS_LOG_TYPE_ERROR)) {
        sub_1002C8BFC((uint64_t)v9, v16);
      }
      goto LABEL_18;
    }
    v55 = v9;
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    id v59 = 0;
    v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v11 error:&v59];
    id v15 = v59;

    if (v15)
    {
      if (qword_1003A0110 != -1) {
        dispatch_once(&qword_1003A0110, &stru_100359BD0);
      }
      if (os_log_type_enabled((os_log_t)qword_100399AF8, OS_LOG_TYPE_ERROR)) {
        sub_1002C8EF0();
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (qword_1003A0110 != -1) {
            dispatch_once(&qword_1003A0110, &stru_100359BD0);
          }
          v22 = qword_100399AF8;
          if (os_log_type_enabled((os_log_t)qword_100399AF8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543619;
            v61 = v9;
            __int16 v62 = 2113;
            v63 = v14;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring purchase success event because the response is a dictionary. Likely from a gift card redemption. Response: %{private}@", buf, 0x16u);
          }
        }
        else
        {
          if (qword_1003A0110 != -1) {
            dispatch_once(&qword_1003A0110, &stru_100359BD0);
          }
          v23 = (void *)qword_100399AF8;
          if (os_log_type_enabled((os_log_t)qword_100399AF8, OS_LOG_TYPE_ERROR)) {
            sub_1002C8E54((uint64_t)v9, v23);
          }
        }
        goto LABEL_13;
      }
      id v15 = [v14 purchase];
      if (v15)
      {
        v17 = [v14 URLResponse];
        v18 = [v17 bodyData];

        if ([v18 length])
        {
          id v58 = 0;
          v19 = +[NSPropertyListSerialization propertyListWithData:v18 options:0 format:0 error:&v58];
          v20 = v58;
          if (v20)
          {
            v21 = sub_10007A59C(4u);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1002C8DEC();
            }
          }
          else
          {
            v54 = objc_msgSend(v19, "tcr_stringForKey:", @"jingleAction");
            unsigned __int8 v25 = [v54 isEqualToString:@"inAppBuy"];
            v26 = sub_10007A59C(4u);
            BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            if (v25)
            {
              v50 = v19;
              if (v27)
              {
                *(_DWORD *)buf = 138543362;
                v61 = v9;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Purchase response is for an in app buy", buf, 0xCu);
              }

              v28 = [v15 buyParameters];
              v29 = +[AMSBuyParams buyParamsWithString:v28];

              v30 = [v29 dictionary];
              v31 = objc_msgSend(v30, "tcr_numberForKey:", @"appAdamId");

              v48 = v29;
              v53 = [v29 parameterForKey:@"bid"];
              v49 = v31;
              if (v31
                && (v51 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithStoreItemIdentifier:error:", objc_msgSend(v31, "longLongValue"), 0)) != 0|| objc_msgSend(v53, "length")&& (v51 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v53, 0, 0)) != 0)
              {
                v32 = sub_10007A59C(4u);
                v9 = v55;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  v33 = [v51 bundleIdentifier];
                  *(_DWORD *)buf = 138543618;
                  v61 = v55;
                  __int16 v62 = 2114;
                  v63 = v33;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Writing receipt to app %{public}@", buf, 0x16u);
                }
                uint64_t v34 = sub_100046CAC(v50, v55);
                if (v34)
                {
                  v35 = [v51 URL];
                  +[WriteReceipt writeReceiptData:v34 forBundleURL:v35 logKey:v55 error:0];
                }
                v46 = (void *)v34;
                [(StoreKitServiceListener *)self _invalidateUnfinishedTransactionsForBundleID:v53 logKey:v55];
                v36 = [_TtC9storekitd6Client alloc];
                v37 = [v51 URL];
                v38 = [(Client *)v36 initWithURL:v37 overridesDictionary:0];

                v45 = v38;
                if (v38)
                {
                  v39 = +[ReceiptManager managerForClient:v38];
                  v40 = [v39 lastUpdated];

                  v41 = sub_10007A59C(4u);
                  BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
                  v47 = v39;
                  if (v40)
                  {
                    v19 = v50;
                    v21 = v54;
                    if (v42)
                    {
                      *(_DWORD *)buf = 138543618;
                      v61 = v55;
                      __int16 v62 = 2114;
                      v63 = v53;
                      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Syncing transactions for app using StoreKit 2 %{public}@", buf, 0x16u);
                    }

                    v56[0] = _NSConcreteStackBlock;
                    v56[1] = 3221225472;
                    v56[2] = sub_10007B024;
                    v56[3] = &unk_100358660;
                    v57 = v55;
                    [v39 syncReceiptsWithReason:1 completionHandler:v56];
                    v41 = v57;
                  }
                  else
                  {
                    v19 = v50;
                    v21 = v54;
                    if (v42)
                    {
                      *(_DWORD *)buf = 138543618;
                      v61 = v55;
                      __int16 v62 = 2114;
                      v63 = v53;
                      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping transaction sync for app not using StoreKit 2 %{public}@", buf, 0x16u);
                    }
                  }

                  v26 = v48;
                  v43 = v51;
                }
                else
                {
                  v43 = v51;
                  v47 = sub_10007A59C(4u);
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
                    sub_1002C8D84();
                  }
                  v19 = v50;
                  v21 = v54;
                  v26 = v48;
                }
              }
              else
              {
                v52 = sub_10007A59C(4u);
                v19 = v50;
                v9 = v55;
                if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                {
                  v44 = self;
                  v43 = v52;
                  sub_1002C8CEC((uint64_t)v55, (uint64_t)v44, v52);
                  v21 = v54;
                  v26 = v48;
                }
                else
                {
                  v21 = v54;
                  v26 = v48;
                  v43 = v52;
                }
              }
            }
            else
            {
              if (v27)
              {
                *(_DWORD *)buf = 138543362;
                v61 = v9;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Purchase response is not for an in app buy", buf, 0xCu);
              }
              v21 = v54;
            }

            v20 = 0;
          }
        }
        else
        {
          v20 = sub_10007A59C(4u);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v61 = v9;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Purchase response has no data", buf, 0xCu);
          }
        }
      }
      else
      {
        if (qword_1003A0110 != -1) {
          dispatch_once(&qword_1003A0110, &stru_100359BD0);
        }
        v24 = qword_100399AF8;
        if (os_log_type_enabled((os_log_t)qword_100399AF8, OS_LOG_TYPE_ERROR)) {
          sub_1002C8C74((uint64_t)v9, v24);
        }
      }
    }

LABEL_13:
LABEL_18:
  }
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4
{
  id v4 = a4;
  v5 = +[NSUUID UUID];
  objc_super v6 = objc_msgSend(v5, "lib_logUUID");

  id v7 = [v4 valueForUserInfoKey:@"2"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_43:
      v30 = 0;
      goto LABEL_44;
    }
    v51 = v7;
    id v8 = +[NSArray arrayWithObjects:&v51 count:1];
  }
  v9 = v8;
  if (!v8) {
    goto LABEL_43;
  }
  v31 = v7;
  if (qword_1003A0110 != -1) {
    dispatch_once(&qword_1003A0110, &stru_100359BD0);
  }
  v10 = (void *)qword_100399B00;
  if (os_log_type_enabled((os_log_t)qword_100399B00, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 138543874;
    v46 = v6;
    __int16 v47 = 2048;
    id v48 = [v4 actionType];
    __int16 v49 = 2114;
    id v50 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received push action %ld for %{public}@", buf, 0x20u);
  }
  v33 = v4;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v41;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v15);
        id v39 = 0;
        v17 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v16 allowPlaceholder:0 error:&v39];
        id v18 = v39;
        if (v17)
        {
          v19 = [_TtC9storekitd6Client alloc];
          v20 = [v17 URL];
          v21 = [(Client *)v19 initWithURL:v20 overridesDictionary:0];

          if (v21)
          {
            v22 = +[ReceiptManager managerForClient:v21];
            if ([v33 actionType] == (id)37)
            {
              if (qword_1003A0110 != -1) {
                dispatch_once(&qword_1003A0110, &stru_100359BD0);
              }
              v23 = qword_100399B00;
              if (os_log_type_enabled((os_log_t)qword_100399B00, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v46 = v6;
                __int16 v47 = 2114;
                id v48 = v16;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating subscription status for %{public}@", buf, 0x16u);
              }
              v37[0] = _NSConcreteStackBlock;
              v37[1] = 3221225472;
              v37[2] = sub_10007B760;
              v37[3] = &unk_100358238;
              v38[0] = v6;
              v38[1] = v16;
              [v22 syncSubscriptionStatusWithReason:2 completionHandler:v37];
              v24 = (id *)v38;
              goto LABEL_37;
            }
            if ([v33 actionType] == (id)36)
            {
              if (qword_1003A0110 != -1) {
                dispatch_once(&qword_1003A0110, &stru_100359BD0);
              }
              v29 = qword_100399B00;
              if (os_log_type_enabled((os_log_t)qword_100399B00, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v46 = v6;
                __int16 v47 = 2114;
                id v48 = v16;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating transaction history for %{public}@", buf, 0x16u);
              }
              v35[0] = _NSConcreteStackBlock;
              v35[1] = 3221225472;
              v35[2] = sub_10007B7EC;
              v35[3] = &unk_100358238;
              v36[0] = v6;
              v36[1] = v16;
              [v22 syncReceiptsWithReason:2 completionHandler:v35];
              v24 = (id *)v36;
LABEL_37:
              [(StoreKitServiceListener *)self _invalidateUnfinishedTransactionsForBundleID:v16 logKey:v6];
            }
          }
          else
          {
            if (qword_1003A0110 != -1) {
              dispatch_once(&qword_1003A0110, &stru_100359BD0);
            }
            v26 = (void *)qword_100399B00;
            if (os_log_type_enabled((os_log_t)qword_100399B00, OS_LOG_TYPE_ERROR))
            {
              BOOL v27 = v26;
              v28 = [v17 URL];
              *(_DWORD *)buf = 138543618;
              v46 = v6;
              __int16 v47 = 2114;
              id v48 = v28;
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Could not initialize client with URL %{public}@", buf, 0x16u);
            }
          }

          goto LABEL_40;
        }
        if (qword_1003A0110 != -1) {
          dispatch_once(&qword_1003A0110, &stru_100359BD0);
        }
        unsigned __int8 v25 = qword_100399B00;
        if (os_log_type_enabled((os_log_t)qword_100399B00, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v46 = v6;
          __int16 v47 = 2114;
          id v48 = v16;
          __int16 v49 = 2114;
          id v50 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[%{public}@] Could not find bundle record for %{public}@ - %{public}@", buf, 0x20u);
        }
LABEL_40:

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v13);
  }
  v30 = obj;

  id v4 = v33;
  id v7 = v31;
LABEL_44:
}

- (void)_invalidateUnfinishedTransactionsForBundleID:(id)a3 logKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1003A0110 != -1) {
    dispatch_once(&qword_1003A0110, &stru_100359BD0);
  }
  id v7 = (void *)qword_100399B00;
  if (os_log_type_enabled((os_log_t)qword_100399B00, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    *(_DWORD *)v16 = 138543874;
    *(void *)&v16[4] = objc_opt_class();
    *(_WORD *)&v16[12] = 2114;
    *(void *)&v16[14] = v6;
    *(_WORD *)&v16[22] = 2114;
    id v17 = v5;
    id v9 = *(id *)&v16[4];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Marking cache stale in response to push for client: %{public}@", v16, 0x20u);
  }
  if (!+[LoadUnfinishedInAppTransactionsTask invalidateCacheForBundleID:withLogKey:](LoadUnfinishedInAppTransactionsTask, "invalidateCacheForBundleID:withLogKey:", v5, v6, *(_OWORD *)v16, *(void *)&v16[16], v17))
  {
    if (qword_1003A0110 != -1) {
      dispatch_once(&qword_1003A0110, &stru_100359BD0);
    }
    v10 = (void *)qword_100399B00;
    if (os_log_type_enabled((os_log_t)qword_100399B00, OS_LOG_TYPE_ERROR)) {
      sub_1002C9128(v10);
    }
  }
  if (qword_1003A0110 != -1) {
    dispatch_once(&qword_1003A0110, &stru_100359BD0);
  }
  v11 = (void *)qword_100399B00;
  if (os_log_type_enabled((os_log_t)qword_100399B00, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = objc_opt_class();
    *(_DWORD *)v16 = 138543618;
    *(void *)&v16[4] = v13;
    *(_WORD *)&v16[12] = 2114;
    *(void *)&v16[14] = v6;
    id v14 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Sending unfinished transactions notification in response to push", v16, 0x16u);
  }
  sub_100056304((uint64_t)v5);
  id v15 = objc_claimAutoreleasedReturnValue();
  notify_post((const char *)[v15 UTF8String]);
}

- (void).cxx_destruct
{
}

@end