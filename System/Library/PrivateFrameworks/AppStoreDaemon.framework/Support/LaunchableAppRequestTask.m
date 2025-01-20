@interface LaunchableAppRequestTask
- (void)main;
@end

@implementation LaunchableAppRequestTask

- (void)main
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    id v5 = v4;
    if (self) {
      client = self->super._client;
    }
    else {
      client = 0;
    }
    v7 = client;
    v8 = [(XPCClient *)v7 clientID];
    if (self) {
      options = self->super._options;
    }
    else {
      options = 0;
    }
    v10 = options;
    v11 = [(ASDRequestOptions *)v10 bundleIDs];
    v12 = [v11 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543874;
    v38 = v4;
    __int16 v39 = 2114;
    v40 = v8;
    __int16 v41 = 2114;
    v42 = v12;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Launable apps request by client: %{public}@ for bundleIDs: [%{public}@]", buf, 0x20u);
  }
  v13 = objc_opt_new();
  +[LSDatabaseContext sharedDatabaseContext];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v30 = v31 = self;
  unsigned int v29 = [v30 startAccessingReturningError:0];
  if (self) {
    v14 = self->super._options;
  }
  else {
    v14 = 0;
  }
  v15 = v14;
  v16 = [(ASDRequestOptions *)v15 bundleIDs];

  id v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v23 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v21 allowPlaceholder:0 error:0];
        v24 = v23;
        if (v23)
        {
          if ((sub_100428044(v23) & 2) != 0)
          {
            [v13 addObject:v21];
          }
          else
          {
            v25 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v26 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v38 = v26;
              __int16 v39 = 2114;
              v40 = v21;
              id v27 = v26;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[%{public}@]: App: %{public}@ is not launchable", buf, 0x16u);
            }
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v18);
  }

  if (v29) {
    [v30 stopAccessing];
  }
  id v28 = [objc_alloc((Class)ASDLaunchableAppsResponse) initWithBundleIDs:v13];
  sub_1000079C8(v31, v28);
  if (v31) {
    v31->super.super._success = 1;
  }
}

@end