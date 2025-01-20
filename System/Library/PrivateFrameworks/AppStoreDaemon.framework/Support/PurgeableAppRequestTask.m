@interface PurgeableAppRequestTask
- (void)main;
@end

@implementation PurgeableAppRequestTask

- (void)main
{
  v3 = objc_alloc_init(_TtC9appstored6LogKey);
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    if (self)
    {
      v7 = self->super._options;
      client = self->super._client;
      v9 = v7;
    }
    else
    {
      v7 = 0;
      v9 = 0;
      client = 0;
    }
    v10 = client;
    v11 = [(XPCClient *)v10 clientID];
    int v31 = 138544130;
    v32 = v5;
    __int16 v33 = 2114;
    v34 = v3;
    __int16 v35 = 2114;
    v36 = v7;
    __int16 v37 = 2114;
    v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Purgeable request with options: %{public}@ client: %{public}@", (uint8_t *)&v31, 0x2Au);
  }
  uint64_t v12 = sub_1002C5D90();
  v13 = (void *)v12;
  if (v12) {
    v14 = *(void **)(v12 + 48);
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (self) {
    options = self->super._options;
  }
  else {
    options = 0;
  }
  v17 = options;
  v18 = sub_10021C24C(v15, v17, v3);

  v19 = [v18 error];

  v20 = ASDLogHandleForCategory();
  v21 = v20;
  if (v19)
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v22 = objc_opt_class();
    id v23 = v22;
    v24 = [v18 error];
    int v31 = 138543874;
    v32 = v22;
    __int16 v33 = 2114;
    v34 = v3;
    __int16 v35 = 2114;
    v36 = v24;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@] Purgable app request resulted in error: %{public}@", (uint8_t *)&v31, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v25 = objc_opt_class();
    id v23 = v25;
    v26 = (ASDRequestOptions *)[v18 purgeableSize];
    int v31 = 138543874;
    v32 = v25;
    __int16 v33 = 2114;
    v34 = v3;
    __int16 v35 = 2048;
    v36 = v26;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Purgeable request complete with purgeableSize: %lld", (uint8_t *)&v31, 0x20u);
  }

LABEL_15:
  sub_1000079C8(self, v18);
  unsigned __int8 v27 = [v18 success];
  if (self) {
    self->super.super._success = v27;
  }
  v28 = [v18 error];
  v30 = ASDErrorWithSafeUserInfo();
  if (self) {
    objc_setProperty_atomic_copy(self, v29, v30, 32);
  }
}

@end