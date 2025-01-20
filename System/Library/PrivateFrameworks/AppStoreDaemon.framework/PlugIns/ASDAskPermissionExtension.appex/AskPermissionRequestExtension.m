@interface AskPermissionRequestExtension
- (void)checkDownloadQueue;
- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4;
@end

@implementation AskPermissionRequestExtension

- (void)checkDownloadQueue
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Request to check download queue received", v4, 2u);
  }
  id v2 = [objc_alloc((Class)ASDCheckQueueRequestOptions) initWithReason:1];
  id v3 = [objc_alloc((Class)ASDCheckQueueRequest) initWithOptions:v2];
  [v3 sendRequestCompletionBlock:&stru_100004100];
}

- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(void))a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Request updated. Result: %{public}@", buf, 0xCu);
  }
  v7 = [v5 productType];
  unsigned int v8 = [v7 isEqualToString:@"C"];

  if (v8)
  {
    id v9 = objc_alloc_init((Class)ASDPurchase);
    v10 = [v5 bundleIdentifier];
    [v9 setBundleID:v10];

    v11 = [v5 buyParams];
    [v9 setBuyParameters:v11];

    v12 = [v5 itemIdentifier];
    v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 longLongValue]);
    [v9 setItemID:v13];

    [v9 setIsRedownload:1];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Processing purchase. Purchase: %{public}@", buf, 0xCu);
    }
    v14 = +[ASDPurchaseManager sharedManager];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000037A0;
    v16[3] = &unk_100004128;
    v17 = v6;
    [v14 processPurchase:v9 withResponseHandler:v16];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      v15 = [v5 productType];
      *(_DWORD *)buf = 138543362;
      id v19 = v15;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "AskPermission updated request for unhandled product type '%{public}@'", buf, 0xCu);
    }
    v6[2](v6);
  }
}

@end