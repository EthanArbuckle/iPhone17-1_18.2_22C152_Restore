@interface ODRDeveloperToolsClient
- (void)getSimulatedBandwidthWithReply:(id)a3;
- (void)purgeAllTagsInBundleWithID:(id)a3 replyBlock:(id)a4;
- (void)purgeTagWithName:(id)a3 inBundleWithID:(id)a4 replyBlock:(id)a5;
- (void)registerManifest:(id)a3 forBundleID:(id)a4 replyBlock:(id)a5;
- (void)setSimulatedBandwidth:(unint64_t)a3 withReply:(id)a4;
- (void)tagStatusForBundle:(id)a3 replyBlock:(id)a4;
@end

@implementation ODRDeveloperToolsClient

- (void)tagStatusForBundle:(id)a3 replyBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000181D8;
  v20 = sub_100017CA8;
  id v21 = (id)objc_opt_new();
  v7 = sub_1003B9318((uint64_t)ODRApplication, v5);
  id v8 = sub_1003B9F24(v7, 0);
  v9 = sub_1002393C4();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100319204;
  v12[3] = &unk_100527EB0;
  id v10 = v8;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  v15 = &v16;
  [v9 readUsingSession:v12];

  v6[2](v6, v17[5], 0);
  _Block_object_dispose(&v16, 8);
}

- (void)purgeAllTagsInBundleWithID:(id)a3 replyBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "-[ODRDeveloperToolsClient purgeAllTagsInBundleWithID:replyBlock:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s BundleID [%{public}@]", buf, 0x16u);
  }

  id v8 = sub_1003B9318((uint64_t)ODRApplication, v5);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v27 = sub_1000181D8;
  v28 = sub_100017CA8;
  id v29 = 0;
  v9 = sub_1002393C4();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10031982C;
  v22[3] = &unk_100527F18;
  id v10 = v8;
  id v23 = v10;
  v24 = buf;
  [v9 readUsingSession:v22];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = *(id *)(*(void *)&buf[8] + 40);
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v14);
        uint64_t v16 = sub_10024E080();
        v17 = sub_100297AC0(v15);
        sub_100250AFC((uint64_t)v16, v17, 1);

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v12);
  }

  v6[2](v6, 0);
  _Block_object_dispose(buf, 8);
}

- (void)purgeTagWithName:(id)a3 inBundleWithID:(id)a4 replyBlock:(id)a5
{
  id v7 = a3;
  v25 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v24 = (void (**)(id, void))a5;
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&buf[4] = "-[ODRDeveloperToolsClient purgeTagWithName:inBundleWithID:replyBlock:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v42 = v25;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s TagName [%{public}@] BundleID [%{public}@]", buf, 0x20u);
  }

  v9 = sub_1003B9318((uint64_t)ODRApplication, v25);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v42 = sub_1000181D8;
  v43 = sub_100017CA8;
  id v44 = 0;
  id v10 = sub_1002393C4();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100319D38;
  v30[3] = &unk_100525368;
  v33 = buf;
  id v23 = v7;
  id v31 = v23;
  id v22 = v9;
  id v32 = v22;
  [v10 readUsingSession:v30];

  id v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [*(id *)(*(void *)&buf[8] + 40) count];
    *(_DWORD *)v35 = 134218498;
    id v36 = v12;
    __int16 v37 = 2114;
    id v38 = v23;
    __int16 v39 = 2114;
    v40 = v25;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "There are [%ld] tags with name [%{public}@] for bundleID [%{public}@]", v35, 0x20u);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = *(id *)(*(void *)&buf[8] + 40);
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v18 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = sub_100297AC0(v17);
          *(_DWORD *)v35 = 138543362;
          id v36 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Requesting purge of asset pack [%{public}@]", v35, 0xCu);
        }
        long long v20 = sub_10024E080();
        long long v21 = sub_100297AC0(v17);
        sub_100250AFC((uint64_t)v20, v21, 1);
      }
      id v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v14);
  }

  v24[2](v24, 0);
  _Block_object_dispose(buf, 8);
}

- (void)registerManifest:(id)a3 forBundleID:(id)a4 replyBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1003B9318((uint64_t)ODRApplication, v8);
  id v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v22 = [v7 length];
    __int16 v23 = 2114;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[DT] Importing %{iec-bytes}lu manifest for %{public}@", buf, 0x16u);
  }

  id v12 = sub_10035FE84([ODRApplicationImportTask alloc], v10);
  id v13 = [ODRManifest alloc];
  id v14 = sub_1003B9E28((uint64_t)v10);
  uint64_t v15 = sub_1002AEA04(v13, (uint64_t)v7, v14, 0);

  if (v12) {
    objc_setProperty_atomic(v12, v16, v15, 48);
  }
  objc_initWeak((id *)buf, v12);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10031A02C;
  v18[3] = &unk_1005229D0;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v9;
  id v19 = v17;
  [v12 setCompletionBlock:v18];
  sub_10026F10C((uint64_t)ODRTaskQueue, v12, -1);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)getSimulatedBandwidthWithReply:(id)a3
{
  id v5 = a3;
  id v4 = sub_1002E0568();
  (*((void (**)(id, id, void))a3 + 2))(v5, v4, 0);
}

- (void)setSimulatedBandwidth:(unint64_t)a3 withReply:(id)a4
{
  v6 = (void (**)(id, id, void))a4;
  sub_1002E04E4((uint64_t)ODRSimulatedDownloadsManager, a3);
  id v5 = sub_1002E0568();
  v6[2](v6, v5, 0);
}

@end