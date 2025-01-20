@interface InstallWatchAppsTask
- (void)main;
@end

@implementation InstallWatchAppsTask

- (void)main
{
  v3 = dispatch_group_create();
  v4 = +[NSMutableArray array];
  v44 = v4;
  if ((id)[(NSArray *)self->_purchaseInfo count] == (id)1)
  {
    v5 = [(NSArray *)self->_purchaseInfo firstObject];
    v6 = sub_10036CD64((uint64_t)InstallWatchAppsTask, v5);
    if (v6)
    {
      v7 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [v5 logKey];
        *(_DWORD *)buf = 138412546;
        v66 = v8;
        __int16 v67 = 2114;
        id v68 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Active installation already exists: %{public}@", buf, 0x16u);
      }
      [v44 addObject:v6];
      [(Task *)self completeWithSuccess];
      id v9 = 0;
      goto LABEL_39;
    }
    v29 = self;
    v30 = [v5 buyParams];
    v31 = sub_1003D1A14(v30);

    if ([v5 isUserInitiated])
    {
      id v9 = 0;
    }
    else
    {
      uint64_t requestThrottle = (uint64_t)v29->_requestThrottle;
      v33 = [v5 itemID];
      v34 = [v33 stringValue];
      id v63 = 0;
      char v35 = sub_1003C410C(requestThrottle, v34, v31, (uint64_t)&v63);
      id v9 = v63;

      if ((v35 & 1) == 0)
      {
        v39 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = [v5 logKey];
          *(_DWORD *)buf = 138412546;
          v66 = v40;
          __int16 v67 = 2114;
          id v68 = v9;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[%@] Redownload request throttled with error: %{public}@", buf, 0x16u);
        }
        [(Task *)v29 completeWithError:v9];
        goto LABEL_38;
      }
    }
    dispatch_group_enter(v3);
    v36 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = [v5 logKey];
      *(_DWORD *)buf = 138412290;
      v66 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[%@] Starting purchase for redownload", buf, 0xCu);
    }
    v38 = sub_100213454();
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10036CF08;
    v57[3] = &unk_100529E40;
    id v58 = v5;
    v59 = v29;
    id v60 = v31;
    id v61 = v44;
    v62 = v3;
    sub_100213A9C((uint64_t)v38, v58, v57);

LABEL_38:
    self = v29;
LABEL_39:

    v4 = v44;
    goto LABEL_40;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obj = self->_purchaseInfo;
  id v47 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v64 count:16];
  id v9 = 0;
  if (!v47) {
    goto LABEL_28;
  }
  uint64_t v10 = *(void *)v54;
  uint64_t v45 = *(void *)v54;
  v43 = v3;
  do
  {
    for (i = 0; i != v47; i = (char *)i + 1)
    {
      if (*(void *)v54 != v10) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v53 + 1) + 8 * i);
      v13 = sub_10036CD64((uint64_t)InstallWatchAppsTask, v12);
      if (!v13)
      {
        v16 = [v12 buyParams];
        v17 = sub_1003D1A14(v16);

        if ([v12 isUserInitiated])
        {
          id v18 = v9;
          goto LABEL_19;
        }
        v19 = self;
        v20 = self->_requestThrottle;
        v21 = [v12 itemID];
        v22 = [v21 stringValue];
        id v52 = v9;
        char v23 = sub_1003C410C((uint64_t)v20, v22, v17, (uint64_t)&v52);
        id v18 = v52;

        if (v23)
        {
          self = v19;
          v3 = v43;
          v4 = v44;
LABEL_19:
          dispatch_group_enter(v3);
          v24 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = [v12 logKey];
            *(_DWORD *)buf = 138412290;
            v66 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%@] Starting purchases for redownload", buf, 0xCu);
          }
          v26 = sub_100213454();
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10036D238;
          v48[3] = &unk_100529E40;
          v48[4] = v12;
          v48[5] = self;
          id v49 = v17;
          id v50 = v4;
          v51 = v3;
          sub_100213A9C((uint64_t)v26, v12, v48);
        }
        else
        {
          v27 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [v12 logKey];
            *(_DWORD *)buf = 138412546;
            v66 = v28;
            __int16 v67 = 2114;
            id v68 = v18;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@] Redownload request throttled with error: %{public}@", buf, 0x16u);
          }
          self = v19;
          v3 = v43;
          v4 = v44;
        }
        uint64_t v10 = v45;

        id v9 = v18;
        goto LABEL_26;
      }
      v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v12 logKey];
        *(_DWORD *)buf = 138412546;
        v66 = v15;
        __int16 v67 = 2114;
        id v68 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Active installation already exists: %{public}@", buf, 0x16u);
      }
      [v4 addObject:v13];
LABEL_26:
    }
    id v47 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v64 count:16];
  }
  while (v47);
LABEL_28:

  [(Task *)self completeWithSuccess];
LABEL_40:
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  [(Task *)self lock];
  v41 = (NSArray *)[v4 copy];
  processedExternalIDs = self->_processedExternalIDs;
  self->_processedExternalIDs = v41;

  [(Task *)self unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedExternalIDs, 0);
  objc_storeStrong((id *)&self->_requestThrottle, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
}

@end