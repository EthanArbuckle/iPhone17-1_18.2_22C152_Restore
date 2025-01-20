@interface ClipURLSession
- (ClipURLSession)init;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation ClipURLSession

- (ClipURLSession)init
{
  v3 = +[AMSProcessInfo currentProcess];
  id v4 = v3;
  if (self)
  {
    v12.receiver = self;
    v12.super_class = (Class)ClipURLSession;
    v5 = [(ClipURLSession *)&v12 init];
    self = v5;
    if (v5)
    {
      objc_storeStrong((id *)&v5->_clientInfo, v3);
      self->_lock._os_unfair_lock_opaque = 0;
      v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      tasks = self->_tasks;
      self->_tasks = v6;

      v8 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
      v9 = +[NSURLSession sessionWithConfiguration:v8 delegate:self delegateQueue:0];
      session = self->_session;
      self->_session = v9;
    }
  }

  return self;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  tasks = self->_tasks;
  v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 taskIdentifier]);
  objc_super v12 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v11];

  v13 = self->_tasks;
  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 taskIdentifier]);
  [(NSMutableDictionary *)v13 setObject:0 forKeyedSubscript:v14];

  os_unfair_lock_unlock(p_lock);
  if (v12) {
    id Property = objc_getProperty(v12, v15, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v17 = Property;
  id v19 = [v17 completedUnitCount];
  if (v12)
  {
    id v20 = objc_getProperty(v12, v18, 32, 1);
    [v20 setTotalUnitCount:v19];

    id v22 = objc_getProperty(v12, v21, 48, 1);
  }
  else
  {
    [0 setTotalUnitCount:v19];

    id v22 = 0;
  }
  id v23 = v22;
  [v23 close];

  if (v8)
  {
    if (v12 && (id v25 = objc_getProperty(v12, v24, 24, 1)) != 0)
    {
      id v26 = v25;
      id v27 = v26;
    }
    else
    {
      ASDErrorWithSafeUserInfo();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = 0;
    }

    v34 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      if (v12) {
        id v36 = objc_getProperty(v12, v35, 56, 1);
      }
      else {
        id v36 = 0;
      }
      id v37 = v36;
      int v41 = 138412802;
      id v42 = v37;
      __int16 v43 = 2114;
      id v44 = v7;
      __int16 v45 = 2114;
      id v46 = v27;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[%@] Failed task: %{public}@ error: %{public}@", (uint8_t *)&v41, 0x20u);
    }
    if (v12) {
      id v39 = objc_getProperty(v12, v38, 40, 1);
    }
    else {
      id v39 = 0;
    }
    id v40 = v39;
    sub_1002029D0((uint64_t)v40, v27);
  }
  else
  {
    v28 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      if (v12) {
        id v30 = objc_getProperty(v12, v29, 56, 1);
      }
      else {
        id v30 = 0;
      }
      id v31 = v30;
      int v41 = 138412546;
      id v42 = v31;
      __int16 v43 = 2114;
      id v44 = v7;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%@] Completed task: %{public}@", (uint8_t *)&v41, 0x16u);
    }
    if (v12) {
      id v33 = objc_getProperty(v12, v32, 40, 1);
    }
    else {
      id v33 = 0;
    }
    id v27 = v33;
    sub_100202928((uint64_t)v27, &__kCFBooleanTrue);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Received data: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  tasks = self->_tasks;
  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 taskIdentifier]);
  v15 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v14];

  os_unfair_lock_unlock(p_lock);
  id v17 = [v9 countOfBytesReceived];
  if (v15)
  {
    id v18 = objc_getProperty(v15, v16, 32, 1);
    [v18 setCompletedUnitCount:v17];

    id Property = objc_getProperty(v15, v19, 48, 1);
  }
  else
  {
    [0 setCompletedUnitCount:v17];
    id Property = 0;
  }
  id v21 = Property;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_100018298;
  v34 = sub_100017D08;
  id v35 = 0;
  id v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  id v27 = sub_10035C75C;
  v28 = &unk_100529478;
  id v22 = v21;
  id v29 = v22;
  p_long long buf = &buf;
  [v10 enumerateByteRangesUsingBlock:&v25];
  v24 = *(void **)(*((void *)&buf + 1) + 40);
  if (v24)
  {
    if (v15) {
      objc_setProperty_atomic(v15, v23, v24, 24);
    }
    objc_msgSend(v9, "cancel", v25, v26, v27, v28);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  tasks = self->_tasks;
  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 taskIdentifier]);
  v15 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v14];

  os_unfair_lock_unlock(p_lock);
  v16 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v15) {
      id Property = objc_getProperty(v15, v17, 56, 1);
    }
    else {
      id Property = 0;
    }
    id v19 = Property;
    *(_DWORD *)long long buf = 138412546;
    id v40 = v19;
    __int16 v41 = 2114;
    id v42 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%@] Received response: %{public}@", buf, 0x16u);
  }
  id v20 = sub_1002B29C4(v10);
  id v21 = v20;
  if (v20 && [v20 length])
  {
    id v22 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      if (v15) {
        id v24 = objc_getProperty(v15, v23, 56, 1);
      }
      else {
        id v24 = 0;
      }
      id v25 = v24;
      *(_DWORD *)long long buf = 138412802;
      id v40 = v25;
      __int16 v41 = 2114;
      id v42 = v9;
      __int16 v43 = 2114;
      id v44 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%@] Task: %{public}@ CDNUUID: %{public}@", buf, 0x20u);
    }
  }
  unint64_t v26 = sub_10029FEA8((uint64_t)v10);
  if (v26 > 0x18F)
  {
    uint64_t v37 = ASDErrorHTTPStatusCodeKey;
    v34 = +[NSNumber numberWithUnsignedInteger:v26];
    v38 = v34;
    id v32 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];

    id v36 = ASDErrorWithUserInfoAndFormat();
    if (v15) {
      objc_setProperty_atomic(v15, v35, v36, 24);
    }

    uint64_t v33 = 0;
  }
  else
  {
    id v28 = [v9 countOfBytesExpectedToReceive];
    if (v15)
    {
      id v29 = objc_getProperty(v15, v27, 32, 1);
      [v29 setTotalUnitCount:v28];

      id v31 = objc_getProperty(v15, v30, 48, 1);
    }
    else
    {
      [0 setTotalUnitCount:v28];
      id v31 = 0;
    }
    id v32 = v31;
    objc_msgSend(v32, "expectedContentLength:", objc_msgSend(v9, "countOfBytesExpectedToReceive"));
    uint64_t v33 = 1;
  }
  v11[2](v11, v33);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end