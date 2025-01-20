@interface IAPInfoRequestTask
- (void)main;
@end

@implementation IAPInfoRequestTask

- (void)main
{
  v3 = sub_100416894((uint64_t)XPCRequestToken, 1);
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v34 = (id)objc_opt_class();
    __int16 v35 = 2114;
    v36 = v3;
    id v22 = v34;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: %{public}@ Starting legacy request to get IAPs for active account", buf, 0x16u);
  }
  if (self) {
    options = self->super._options;
  }
  else {
    options = 0;
  }
  v6 = options;
  v7 = [(ASDRequestOptions *)v6 adamIds];
  id v8 = [v7 count];
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v10 = sub_1000109AC();
  if (v8)
  {
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_100392800;
    v28 = &unk_1005258B0;
    v29 = self;
    dispatch_semaphore_t v30 = v9;
    v11 = v9;
    sub_100370F00((uint64_t)v10, v7, v3, &v25);

    dispatch_time_t v12 = dispatch_time(0, 60000000000);
    intptr_t v13 = dispatch_semaphore_wait(v11, v12);
    dispatch_semaphore_t v14 = v30;
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100008B10;
    v31[3] = &unk_1005258B0;
    v31[4] = self;
    dispatch_semaphore_t v32 = v9;
    v11 = v9;
    sub_100007F68((uint64_t)v10, v3, v31);

    dispatch_time_t v15 = dispatch_time(0, 60000000000);
    intptr_t v13 = dispatch_semaphore_wait(v11, v15);
    dispatch_semaphore_t v14 = v32;
  }

  if (v13)
  {
    id v16 = objc_alloc((Class)ASDIAPInfoResponse);
    v17 = +[NSError errorWithDomain:ASDErrorDomain code:515 userInfo:0];
    id v18 = [v16 initWithError:v17];
    sub_1000079C8(self, v18);

    if (self) {
      self->super.super._success = 0;
    }
    v20 = +[NSError errorWithDomain:@"IAPInfoRequestOperationErrorDomain", 1, 0, v25, v26, v27, v28, v29 code userInfo];
    if (self) {
      objc_setProperty_atomic_copy(self, v19, v20, 32);
    }

    v21 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v34 = v23;
      __int16 v35 = 2114;
      v36 = v3;
      id v24 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%{public}@]: %{public}@ Timed out on semaphore", buf, 0x16u);
    }
  }
}

@end