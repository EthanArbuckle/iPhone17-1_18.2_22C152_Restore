@interface AMSDGenerateMultiUserTokenTask
+ (double)_scheduleRefreshInterval;
- (ACAccount)account;
- (AMSDGenerateMultiUserTokenTask)initWithController:(id)a3 account:(id)a4 home:(id)a5;
- (AMSDHome)home;
- (AMSDMultiUserController)controller;
- (AMSDMultiUserMetrics)metrics;
- (BOOL)_saveMultiUserToken:(id)a3 forHomeParticipant:(id)a4 iCloudAccount:(id)a5 error:(id *)a6;
- (BOOL)_shouldGenerateInviteToken;
- (BOOL)tokenNeedsRegeneration;
- (id)_generateAppProvidedDataWithAction:(id)a3 inviteToken:(id)a4;
- (id)_generateMultiUserTokenWithAction:(id)a3 iCloudAccount:(id)a4 inviteToken:(id)a5 error:(id *)a6;
- (id)_saveRecord:(id)a3 database:(id)a4;
- (id)_shareRecord:(id)a3 withError:(id *)a4;
- (id)performTask;
- (void)setMetrics:(id)a3;
- (void)setTokenNeedsRegeneration:(BOOL)a3;
@end

@implementation AMSDGenerateMultiUserTokenTask

- (AMSDGenerateMultiUserTokenTask)initWithController:(id)a3 account:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDGenerateMultiUserTokenTask;
  v12 = [(AMSDGenerateMultiUserTokenTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a4);
    objc_storeStrong((id *)&v13->_controller, a3);
    objc_storeStrong((id *)&v13->_home, a5);
  }

  return v13;
}

- (id)performTask
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100032284;
  v5[3] = &unk_100112BE0;
  objc_copyWeak(&v6, &location);
  v3 = [(AMSDGenerateMultiUserTokenTask *)self performTaskWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_generateAppProvidedDataWithAction:(id)a3 inviteToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(AMSDGenerateMultiUserTokenTask *)self home];
  id v9 = +[AMSAuthenticateOptions amsd_createAppProvidedDataWithMultiUserAction:v7 home:v8];

  id v10 = [(AMSDGenerateMultiUserTokenTask *)self account];
  id v11 = objc_msgSend(v10, "ams_altDSID");
  objc_msgSend(v9, "ams_setNullableObject:forKey:", v11, @"inviteeiTunesAltDsId");

  objc_msgSend(v9, "ams_setNullableObject:forKey:", @"com.apple.gs.itunes.mu.invite", @"inviteeiTunesAuthTokenType");
  objc_msgSend(v9, "ams_setNullableObject:forKey:", v6, @"muInviteCode");

  v12 = +[ACAccountStore ams_sharedAccountStore];
  v13 = [(AMSDGenerateMultiUserTokenTask *)self account];
  id v27 = 0;
  v14 = objc_msgSend(v12, "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:", v13, AMSAccountGrandSlamTokenIdentifierMultiUser, &v27);
  id v15 = v27;

  if (!v14)
  {
    v16 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      v19 = AMSLogKey();
      v20 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v18;
      __int16 v30 = 2114;
      v31 = v19;
      __int16 v32 = 2114;
      v33 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the GrandSlam token. error = %{public}@", buf, 0x20u);
    }
  }
  objc_msgSend(v9, "ams_setNullableObject:forKey:", v14, @"inviteeiTunesAuthToken");
  v21 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v21)
  {
    v21 = +[AMSLogConfig sharedConfig];
  }
  v22 = [v21 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = objc_opt_class();
    v24 = AMSLogKey();
    v25 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v23;
    __int16 v30 = 2114;
    v31 = v24;
    __int16 v32 = 2114;
    v33 = v25;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] appProvidedData = %{public}@", buf, 0x20u);
  }
  return v9;
}

- (id)_shareRecord:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v45 = v8;
    __int16 v46 = 2114;
    v47 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sharing a record.", buf, 0x16u);
  }
  id v10 = [(AMSDGenerateMultiUserTokenTask *)self controller];
  id v11 = [v10 cloudContainer];
  v12 = [v11 privateDatabase];

  v13 = [v5 identifier];

  v14 = [v13 zoneIdentifier];
  id v15 = [v12 shareForRecordZoneIdentifier:v14];

  v16 = [v15 identifier];
  uint64_t v17 = [v12 fetchRecordWithRecordIdentifier:v16];

  uint64_t v18 = (void *)v17;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100033990;
  v41[3] = &unk_100112B68;
  v41[4] = self;
  id v19 = v15;
  id v42 = v19;
  id v20 = v12;
  id v43 = v20;
  v21 = [v18 catchWithBlock:v41];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100033A14;
  v39[3] = &unk_100112C48;
  v39[4] = self;
  id v22 = v20;
  id v40 = v22;
  uint64_t v23 = [v21 thenWithBlock:v39];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100033C64;
  v38[3] = &unk_100112C70;
  v38[4] = self;
  v24 = [v23 thenWithBlock:v38];
  id v37 = 0;
  v25 = [v24 resultWithError:&v37];
  id v26 = v37;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    v35 = v18;
    v28 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v28)
    {
      v28 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_opt_class();
      v34 = AMSLogKey();
      uint64_t v30 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v45 = v33;
      __int16 v46 = 2114;
      v47 = v34;
      __int16 v48 = 2114;
      uint64_t v49 = v30;
      v31 = (void *)v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to share the record. error = %{public}@", buf, 0x20u);
    }
    uint64_t v18 = v35;
    if (a4) {
      *a4 = v26;
    }
  }

  return v25;
}

- (id)_generateMultiUserTokenWithAction:(id)a3 iCloudAccount:(id)a4 inviteToken:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [(AMSDGenerateMultiUserTokenTask *)self _generateAppProvidedDataWithAction:a3 inviteToken:a5];
  v12 = +[AMSAuthenticateOptions amsd_multiUserAuthenticateOptionsWithAppProvidedData:v11];
  [v12 setAuthenticationType:1];
  [v12 setDebugReason:@"Generating a multi-user token"];
  id v13 = [objc_alloc((Class)AMSAuthKitUpdateTask) initWithAccount:v10 options:v12];

  [v13 setRunMode:1];
  v14 = [v13 performAuthKitUpdate];
  id v15 = [v14 thenWithBlock:&stru_100112CB0];

  v16 = [v15 resultWithError:a6];

  return v16;
}

- (BOOL)_saveMultiUserToken:(id)a3 forHomeParticipant:(id)a4 iCloudAccount:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_msgSend(v10, "ams_altDSID");
  [v11 setField:v13 forKey:@"AMSHomeParticipant_iCloudAltDSID"];

  v14 = objc_msgSend(v10, "ams_DSID");

  [v11 setField:v14 forKey:@"AMSHomeParticipant_iCloudDSID"];
  id v15 = [(AMSDGenerateMultiUserTokenTask *)self account];
  v16 = objc_msgSend(v15, "ams_altDSID");
  [v11 setField:v16 forKey:@"AMSHomeParticipant_iTunesAltDSID"];

  uint64_t v17 = [(AMSDGenerateMultiUserTokenTask *)self account];
  uint64_t v18 = objc_msgSend(v17, "ams_DSID");
  [v11 setField:v18 forKey:@"AMSHomeParticipant_iTunesDSID"];

  id v19 = [(AMSDGenerateMultiUserTokenTask *)self account];
  id v20 = [v19 username];
  [v11 setField:v20 forKey:@"AMSHomeParticipant_iTunesUsername"];

  [v11 setField:v12 forKey:@"AMSHomeParticipant_MultiUserToken"];
  [v11 setField:&__kCFBooleanFalse forKey:@"AMSHomeParticipant_MultiUserTokenInvalid"];
  v21 = [(AMSDGenerateMultiUserTokenTask *)self controller];
  id v22 = [v21 cloudContainer];
  uint64_t v23 = [v22 privateDatabase];
  v24 = [(AMSDGenerateMultiUserTokenTask *)self _saveRecord:v11 database:v23];

  v25 = [v24 resultWithError:a6];
  LOBYTE(a6) = v25 != 0;

  return (char)a6;
}

- (id)_saveRecord:(id)a3 database:(id)a4
{
  id v5 = [a4 saveRecord:a3];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000342BC;
  v7[3] = &unk_100112CD8;
  v7[4] = self;
  [v5 addFinishBlock:v7];
  return v5;
}

+ (double)_scheduleRefreshInterval
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (*(double *)&qword_1001302D0 == 0.0) {
    double v3 = 60.0;
  }
  else {
    double v3 = *(double *)&qword_1001302D0 + *(double *)&qword_1001302D0;
  }
  qword_1001302D0 = *(void *)&v3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_shouldGenerateInviteToken
{
  id v2 = [(AMSDGenerateMultiUserTokenTask *)self home];
  char v3 = [v2 isCurrentUserOwner] ^ 1;

  return v3;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSDMultiUserController)controller
{
  return self->_controller;
}

- (AMSDHome)home
{
  return self->_home;
}

- (BOOL)tokenNeedsRegeneration
{
  return self->_tokenNeedsRegeneration;
}

- (void)setTokenNeedsRegeneration:(BOOL)a3
{
  self->_tokenNeedsRegeneration = a3;
}

- (AMSDMultiUserMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end