@interface ACAccountStore
- (id)amsd_iTunesAccountForHomeParticipant:(id)a3 createEphemeral:(BOOL)a4;
@end

@implementation ACAccountStore

- (id)amsd_iTunesAccountForHomeParticipant:(id)a3 createEphemeral:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 fieldForKey:@"AMSHomeParticipant_iTunesAltDSID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  v9 = [v6 fieldForKey:@"AMSHomeParticipant_iTunesDSID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v11 = [v6 fieldForKey:@"AMSHomeParticipant_iTunesUsername"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v8 || v10 || v12)
  {
    id v14 = [(ACAccountStore *)self ams_iTunesAccountWithAltDSID:v8 DSID:v10 username:v12];
    if (!v14)
    {
      v15 = +[AMSLogConfig sharedAccountsMultiUserConfig];
      if (!v15)
      {
        v15 = +[AMSLogConfig sharedConfig];
      }
      v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        BOOL v17 = v4;
        uint64_t v18 = objc_opt_class();
        AMSLogKey();
        v19 = v28 = self;
        v20 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        uint64_t v30 = v18;
        BOOL v4 = v17;
        __int16 v31 = 2114;
        v32 = v19;
        __int16 v33 = 2114;
        v34 = v20;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] This device isn't signed into an iTunes account associated with a home participant. homeParticipant = %{public}@", buf, 0x20u);

        self = v28;
      }

      if (v4)
      {
        v21 = +[AMSLogConfig sharedAccountsMultiUserConfig];
        if (!v21)
        {
          v21 = +[AMSLogConfig sharedConfig];
        }
        v22 = [v21 OSLogObject];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = objc_opt_class();
          v24 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v30 = v23;
          __int16 v31 = 2114;
          v32 = v24;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Creating an ephemeral account.", buf, 0x16u);
        }
        v26 = [(ACAccountStore *)self accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifieriTunesStore];
        id v14 = [objc_alloc((Class)ACAccount) initWithAccountType:v26];
        [v14 setActive:0];
        objc_msgSend(v14, "ams_setAltDSID:", v8);
        objc_msgSend(v14, "ams_setDSID:", v10);
        [v14 setUsername:v12];
      }
      else
      {
        id v14 = 0;
      }
    }
    id v13 = v14;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end