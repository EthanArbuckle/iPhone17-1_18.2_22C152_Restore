@interface ODRAppReviewClient
- (void)registerManifest:(id)a3 forBundleID:(id)a4 replyBlock:(id)a5;
@end

@implementation ODRAppReviewClient

- (void)registerManifest:(id)a3 forBundleID:(id)a4 replyBlock:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void))a5;
  id v9 = a4;
  v10 = sub_1002AEA04([ODRManifest alloc], (uint64_t)v7, v9, 0);
  v11 = sub_1003B9834((uint64_t)ODRApplication, v9);

  if (!sub_1003BAB60((uint64_t)v11)
    || (sub_1003BA26C((uint64_t)v11), (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v13 = (void *)v12,
        sub_1003BA7E4((uint64_t)v11),
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v14))
  {
    id v15 = [v11 mutableCopy];
    v16 = sub_1002AEB78(v10);
    sub_1003BBC48((uint64_t)v15, v16);

    v17 = sub_1002AEAE0(v10);
    v18 = [v17 stringValue];
    sub_1003BBDEC((uint64_t)v15, v18);

    id v19 = [v15 copy];
    v11 = v19;
  }
  v20 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v33 = [v7 length];
    __int16 v34 = 2114;
    v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[App Review] Importing %{iec-bytes}lu manifest for %{public}@", buf, 0x16u);
  }

  id v21 = sub_1003B9F24(v11, 0);
  if (!v21)
  {
    v22 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v27 = sub_1003B9E28((uint64_t)v11);
      *(_DWORD *)buf = 138543362;
      id v33 = v27;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[App Review] We failed to copy the tag manifest for %{public}@, importing just the manifest data", buf, 0xCu);
    }
  }
  v23 = sub_1002393C4();
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1002AFBBC;
  v28[3] = &unk_1005258F0;
  id v29 = v21;
  id v30 = v10;
  id v31 = v11;
  id v24 = v11;
  v25 = v10;
  id v26 = v21;
  [v23 modifyUsingTransaction:v28];

  v8[2](v8, 0);
}

@end