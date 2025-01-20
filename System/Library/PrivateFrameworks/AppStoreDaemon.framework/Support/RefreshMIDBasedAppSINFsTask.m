@interface RefreshMIDBasedAppSINFsTask
- (RefreshMIDBasedAppSINFsTask)init;
- (void)main;
@end

@implementation RefreshMIDBasedAppSINFsTask

- (RefreshMIDBasedAppSINFsTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)RefreshMIDBasedAppSINFsTask;
  v2 = [(Task *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9appstored6LogKey);
    logKey = v2->_logKey;
    v2->_logKey = v3;
  }
  return v2;
}

- (void)main
{
  +[NSMutableArray array];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1003A0048;
  v41[3] = &unk_10052A388;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v42 = v3;
  +[ApplicationProxy enumerateApplicationsOfType:0 usingBlock:v41];
  v4 = ASDLogHandleForCategory();
  v34 = self;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    id v6 = [v3 count];
    *(_DWORD *)buf = 138412546;
    v44 = logKey;
    self = v34;
    __int16 v45 = 2048;
    id v46 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to update %ld MID app(s)", buf, 0x16u);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  id v7 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v10);
        v13 = [v11 bundleID];
        unsigned int v14 = [v11 isAppClip];
        v15 = ASDLogHandleForCategory();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            v17 = self->_logKey;
            *(_DWORD *)buf = 138412546;
            v44 = v17;
            __int16 v45 = 2114;
            id v46 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] Skipping MID based clip", buf, 0x16u);
          }
        }
        else
        {
          if (v16)
          {
            v18 = self->_logKey;
            *(_DWORD *)buf = 138412546;
            v44 = v18;
            __int16 v45 = 2114;
            id v46 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] MID refresh update requesting SINF update", buf, 0x16u);
          }

          id v19 = objc_alloc((Class)ASDManagedApplicationRequestOptions);
          v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 storeItemID]);
          v21 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 storeExternalVersionID]);
          v22 = [v11 bundleVersion];
          id v23 = [v19 initWithItemIdentifer:v20 externalVersionIdentifier:v21 bundleIdentifier:v13 bundleVersion:v22 skipDownloads:0];

          self = v34;
          v24 = sub_1002F3C98((id *)[ManagedApplicationTask alloc], v23, 0);
          id v36 = 0;
          [(Task *)v34 runSubTask:v24 returningError:&v36];
          v15 = v36;
          v25 = ASDLogHandleForCategory();
          v26 = v25;
          if (v15)
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v27 = v34->_logKey;
              *(_DWORD *)buf = 138412802;
              v44 = v27;
              __int16 v45 = 2114;
              id v46 = v13;
              __int16 v47 = 2114;
              v48[0] = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[%@] [%{public}@] MID refresh update resulted in error: %{public}@", buf, 0x20u);
            }
          }
          else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            if (v24)
            {
              int v28 = (_BYTE)v24[3] & 1;
              id v29 = v24[21];
            }
            else
            {
              int v28 = 0;
              id v29 = 0;
            }
            v30 = v34->_logKey;
            *(_DWORD *)buf = 138413058;
            v44 = v30;
            __int16 v45 = 2114;
            id v46 = v13;
            __int16 v47 = 1024;
            LODWORD(v48[0]) = v28;
            WORD2(v48[0]) = 2048;
            *(void *)((char *)v48 + 6) = v29;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] MID refresh update complete with status: %d changeType: %ld", buf, 0x26u);
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v31 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
      id v8 = v31;
    }
    while (v31);
  }

  v32 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = self->_logKey;
    *(_DWORD *)buf = 138412290;
    v44 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%@] MID update triggered migration completed", buf, 0xCu);

LABEL_28:
    self->super._success = 1;
    goto LABEL_29;
  }

  if (self) {
    goto LABEL_28;
  }
LABEL_29:
}

- (void).cxx_destruct
{
}

@end