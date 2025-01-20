@interface LegacyManifestRequestTask
- (void)main;
@end

@implementation LegacyManifestRequestTask

- (void)main
{
  if (self) {
    options = self->super._options;
  }
  else {
    options = 0;
  }
  v4 = options;
  v5 = [(ASDRequestOptions *)v4 manifest];

  id v6 = [v5 manifestType];
  if (self) {
    client = self->super._client;
  }
  else {
    client = 0;
  }
  v8 = client;
  v9 = [(XPCClient *)v8 clientID];

  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v26 = (id)objc_opt_class();
    __int16 v27 = 2114;
    v28 = v5;
    __int16 v29 = 2114;
    v30 = v9;
    id v11 = v26;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Installing manifest: %{public}@ for client: %{public}@", buf, 0x20u);
  }
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_1002274B8;
  v20 = &unk_100522960;
  id v21 = objc_alloc_init((Class)NSMutableArray);
  id v22 = v9;
  v23 = self;
  id v24 = v6;
  id v12 = v9;
  id v13 = v21;
  [v5 enumerateActivitiesUsingBlock:&v17];
  id v14 = objc_alloc((Class)ASDInstallManifestRequestResponse);
  id v15 = objc_msgSend(v14, "initWithResults:", v13, v17, v18, v19, v20);
  sub_1000079C8(self, v15);

  if (self)
  {
    self->super.super._success = 1;
    objc_setProperty_atomic_copy(self, v16, 0, 32);
  }
}

@end