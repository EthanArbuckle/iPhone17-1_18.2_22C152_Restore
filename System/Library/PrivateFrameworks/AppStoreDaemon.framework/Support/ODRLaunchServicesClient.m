@interface ODRLaunchServicesClient
- (void)bytesUsedForApplicationWithBundleID:(id)a3 replyBlock:(id)a4;
@end

@implementation ODRLaunchServicesClient

- (void)bytesUsedForApplicationWithBundleID:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_1000183B8;
  v22 = sub_100017D98;
  v23 = &off_10054CCD8;
  self;
  v8 = sub_1002393C4();
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1003B6DA4;
  v15 = &unk_100523B10;
  v17 = &v18;
  id v9 = v6;
  id v16 = v9;
  [v8 readUsingSession:&v12];

  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = objc_msgSend((id)v19[5], "longLongValue", v12, v13, v14, v15);
    *(_DWORD *)buf = 134218498;
    v25 = self;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2048;
    id v29 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "(ODRLaunchServicesClient) [%p] bytes used for '%@' = %{iec-bytes}lld", buf, 0x20u);
  }

  v7[2](v7, [(id)v19[5] integerValue], 0);
  _Block_object_dispose(&v18, 8);
}

@end