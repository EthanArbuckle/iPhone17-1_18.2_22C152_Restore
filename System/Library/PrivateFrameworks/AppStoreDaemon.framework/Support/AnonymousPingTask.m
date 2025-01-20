@interface AnonymousPingTask
- (void)main;
@end

@implementation AnonymousPingTask

- (void)main
{
  if (sub_10041EB90())
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obj = self->_pingURLs;
    id v3 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v26 = *(void *)v29;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v29 != v26) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(id *)(*((void *)&v28 + 1) + 8 * i);
          if (os_variant_has_internal_content()
            && (sub_1003F344C(), v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
          {
            CFStringRef v37 = @"canaryIdentifier";
            v8 = sub_1003F344C();
            v38 = v8;
            v9 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
            sub_10028908C(v6, v9);
            id v10 = (id)objc_claimAutoreleasedReturnValue();

            v11 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v12 = sub_1003F344C();
              *(_DWORD *)buf = 138543362;
              id v33 = v12;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updated anonymous ping URL to include canaryIdentifier: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            id v10 = v6;
          }

          v13 = +[NSMutableURLRequest requestWithURL:v10 cachePolicy:1 timeoutInterval:20.0];
          id v14 = objc_alloc((Class)AMSURLRequest);
          v15 = sub_10030B11C();
          id v16 = [v14 initWithRequest:v13 bag:v15];

          id v17 = objc_alloc_init((Class)AMSPromise);
          v18 = +[AMSURLSession defaultSession];
          v19 = [v17 completionHandlerAdapter];
          v20 = [v18 dataTaskWithRequest:v16 completionHandler:v19];

          [v20 resume];
          id v27 = 0;
          v21 = [v17 resultWithError:&v27];
          id v22 = v27;
          v23 = ASDLogHandleForCategory();
          v24 = v23;
          if (v21)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v33 = v10;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Successfully sent ping to: %{public}@", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v33 = v10;
            __int16 v34 = 2114;
            id v35 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Ping failed to: %{public}@ error: %{public}@", buf, 0x16u);
          }
        }
        id v4 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v4);
    }
  }
  else
  {
    ASDLogHandleForCategory();
    obj = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&obj->super, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, &obj->super, OS_LOG_TYPE_DEBUG, "Dropping anonymous pings - DNU submission disabled", buf, 2u);
    }
  }
}

- (void).cxx_destruct
{
}

@end