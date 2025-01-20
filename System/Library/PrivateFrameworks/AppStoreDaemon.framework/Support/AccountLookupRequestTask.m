@interface AccountLookupRequestTask
- (void)main;
@end

@implementation AccountLookupRequestTask

- (void)main
{
  v3 = objc_alloc_init(_TtC9appstored6LogKey);
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    if (self) {
      client = self->super._client;
    }
    else {
      client = 0;
    }
    v8 = client;
    v9 = [(XPCClient *)v8 clientID];
    if (self) {
      options = self->super._options;
    }
    else {
      options = 0;
    }
    v11 = options;
    *(_DWORD *)buf = 138544130;
    v29 = v5;
    __int16 v30 = 2114;
    v31 = v3;
    __int16 v32 = 2114;
    v33 = v9;
    __int16 v34 = 1024;
    LODWORD(v35) = [(ASDRequestOptions *)v11 authIfNeeded];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Account lookup request by client: %{public}@ for authIfNeeded: %d", buf, 0x26u);
  }
  v12 = +[ACAccountStore ams_sharedAccountStore];
  v13 = objc_msgSend(v12, "ams_activeiTunesAccount");
  v14 = objc_msgSend(v13, "ams_DSID");

  BOOL v27 = 0;
  v15 = sub_100420D50();
  if (self) {
    v16 = self->super._options;
  }
  else {
    v16 = 0;
  }
  v17 = v16;
  id v26 = 0;
  uint64_t v18 = sub_100420E2C((uint64_t)v15, v3, 1, (int)[(ASDRequestOptions *)v17 authIfNeeded], &v27, &v26);
  id v19 = v26;

  id v20 = objc_alloc((Class)ASDAccountLookupResponse);
  if (v19) {
    id v21 = [v20 initWithError:v19];
  }
  else {
    id v21 = [v20 initWithAccountID:v14 askToBuyEnabled:v18];
  }
  v22 = v21;
  sub_1000079C8(self, v21);
  if (self) {
    self->super.super._success = v19 == 0;
  }
  v23 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_opt_class();
    *(_DWORD *)buf = 138544130;
    v29 = v24;
    __int16 v30 = 2114;
    v31 = v3;
    __int16 v32 = 2114;
    v33 = v14;
    __int16 v34 = 2048;
    uint64_t v35 = v18;
    id v25 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Account lookup request complete with accountID: %{public}@ for askToBuy: %ld", buf, 0x2Au);
  }
}

@end