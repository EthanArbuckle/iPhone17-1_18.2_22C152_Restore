@interface OwnsCheckTask
- (OwnsCheckTask)init;
- (void)main;
@end

@implementation OwnsCheckTask

- (OwnsCheckTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)OwnsCheckTask;
  return [(Task *)&v3 init];
}

- (void)main
{
  objc_super v3 = [OwnsCheckTaskRequestEncoder alloc];
  v4 = sub_10030B11C();
  v5 = [(OwnsCheckTaskRequestEncoder *)v3 initWithBag:v4];

  if (!self->_account)
  {
    v6 = +[ACAccountStore ams_sharedAccountStore];
    objc_msgSend(v6, "ams_activeiTunesAccount");
    v7 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    account = self->_account;
    self->_account = v7;

    if (!self->_account)
    {
      ASDErrorWithTitleAndMessage();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = 0;
      goto LABEL_24;
    }
  }
  -[OwnsCheckTaskRequestEncoder setAccount:](v5, "setAccount:");
  v9 = sub_10030B11C();
  *(void *)buf = 0;
  v10 = sub_10030B9EC((uint64_t)v9, @"bundle-owns-check", buf);
  uint64_t v11 = (uint64_t)*(id *)buf;

  v12 = +[AMSDevice deviceGUID];
  v13 = objc_opt_new();
  v14 = v13;
  if (v12) {
    [v13 setObject:v12 forKeyedSubscript:@"guid"];
  }
  bundleIDs = self->_bundleIDs;
  if (bundleIDs)
  {
    v16 = [(NSArray *)bundleIDs componentsJoinedByString:@","];
    [v14 setObject:v16 forKeyedSubscript:@"bids"];
  }
  if (v10)
  {
    uint64_t v17 = sub_10028908C(v10, v14);
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (!(v17 | v11))
  {
    uint64_t v11 = ASDErrorWithTitleAndMessage();
  }
  id v18 = (id) v11;

  id v19 = v18;
  id v21 = v19;
  if (v17 && !v19)
  {
    v22 = [(OwnsCheckTaskRequestEncoder *)v5 requestWithMethod:2 URL:v17 parameters:0];
    id v36 = 0;
    v23 = [v22 resultWithError:&v36];
    id v24 = v36;

    v25 = sub_1000169A4();
    v26 = sub_100223974((uint64_t)AMSURLSession, v25);

    v27 = [v26 dataTaskPromiseWithRequest:v23];
    id v35 = v24;
    v28 = [v27 resultWithError:&v35];
    id v21 = v35;

    v29 = ASDLogHandleForCategory();
    v30 = v29;
    if (v21)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error doing sbysnc. error: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Owns check completed sucessfully", buf, 2u);
      }

      v31 = [v28 object];
      v32 = [v31 objectForKeyedSubscript:@"ownsCheck"];

      if (!v32) {
        goto LABEL_22;
      }
      v30 = [v28 object];
      v33 = [v30 objectForKeyedSubscript:@"ownsCheck"];
      outputDictionary = self->_outputDictionary;
      self->_outputDictionary = v33;
    }
LABEL_22:
  }
LABEL_24:
  objc_setProperty_atomic_copy(self, v20, v21, 32);
  self->super._success = v21 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDictionary, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end