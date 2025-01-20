@interface XPCAppRemovalService
- (id)_deleteAllUserDefaults;
- (void)removeAppWithReply:(id)a3;
@end

@implementation XPCAppRemovalService

- (void)removeAppWithReply:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = sub_100002D8C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100003434(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = [(XPCAppRemovalService *)self _deleteAllUserDefaults];
  v14 = sub_100002D8C();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    if (v15) {
      sub_100003384((uint64_t)v13, v14, v16, v17, v18, v19, v20, v21);
    }

    v4[2](v4, v13);
  }
  else
  {
    if (v15) {
      sub_1000033F0(v14);
    }

    v22 = +[RCSSavedRecordingService sharedService];
    if (v22) {
      goto LABEL_10;
    }
    v33[0] = NSLocalizedDescriptionKey;
    v33[1] = @"BundleId";
    v34[0] = @"Unable to connect to RCSSavedRecordingService.  Aborting.";
    v34[1] = RCVoiceMemosBundleID;
    v23 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    v13 = +[NSError errorWithDomain:@"com.apple.VoiceMemos.appremoval.errorDomain" code:-1 userInfo:v23];

    if (!v13)
    {
LABEL_10:
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000030A4;
      v31[3] = &unk_100004160;
      v32 = v4;
      [v22 removeAllUserDataWithCompletion:v31];

      v13 = 0;
    }
    else
    {
      v24 = sub_100002D8C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100003384((uint64_t)v13, v24, v25, v26, v27, v28, v29, v30);
      }

      v4[2](v4, v13);
    }
  }
}

- (id)_deleteAllUserDefaults
{
  v2 = +[NSUserDefaults standardUserDefaults];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [v2 dictionaryRepresentation];
  v4 = [v3 allKeys];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        uint64_t v10 = sub_100002D8C();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Removing User Default key %@", buf, 0xCu);
        }

        [v2 removeObjectForKey:v9];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v6);
  }

  if ([v2 synchronize])
  {
    uint64_t v11 = 0;
  }
  else
  {
    v18[0] = NSLocalizedDescriptionKey;
    v18[1] = @"BundleId";
    v19[0] = @"Unable to synchronize NSUserDefaults for AppRemoval.";
    v19[1] = RCVoiceMemosBundleID;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    uint64_t v11 = +[NSError errorWithDomain:@"com.apple.VoiceMemos.appremoval.errorDomain" code:-1 userInfo:v12];
  }

  return v11;
}

@end