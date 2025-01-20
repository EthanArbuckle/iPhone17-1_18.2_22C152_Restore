@interface AMSVerifyCredentialsTask
+ (BOOL)_shouldUpdateBundleOwnerStatusForAccount:(id)a3;
+ (id)_fetchSecondaryPasswordForAccount:(id)a3;
+ (id)_handleBundleGDPRRequirementsForAuthenticatedAccount:(id)a3 task:(id)a4 gdprFailureAction:(id)a5;
+ (id)_processAccountDeviceRequirementsForAutheniticatedAccount:(id)a3 accountStore:(id)a4 bag:(id)a5;
+ (void)_postAuthenticationBeganNotification;
+ (void)_postAuthenticationFailedNotification;
+ (void)_postAuthenticationFinishedNotification;
+ (void)_postAuthenticationSubmittedNotification;
- (ACAccount)account;
- (ACDAccountStore)accountStore;
- (AMSAuthenticateMetrics)metrics;
- (AMSAuthenticateOptions)options;
- (AMSBagProtocol)bag;
- (AMSDialogRequest)dialogRequest;
- (AMSVerifyCredentialsTask)initWithAccount:(id)a3 accountStore:(id)a4 bag:(id)a5 options:(id)a6;
- (BOOL)AMSURLSession:(id)a3 task:(id)a4 shouldFailWithServerError:(id)a5;
- (BOOL)accountWasOriginallyActive;
- (id)_createAuthenticateRequestEncoder;
- (id)_createAuthenticateRequestForAccount:(id)a3 URL:(id)a4 requestEncoder:(id)a5;
- (id)_createAuthenticateRequestParametersForAccount:(id)a3;
- (id)_createUpdatedAccountWithAuthenticationResult:(id)a3;
- (id)_generatePasswordIfNeeded;
- (id)_processAuthenticationFailureWithResult:(id)a3;
- (id)_promiseOfAccountFromResult:(id)a3 orError:(id)a4;
- (id)performTask;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)_handleBiometricsForAuthenticatedAccount:(id)a3;
- (void)_handleDeviceOffersForAuthenticatedAccount:(id)a3;
- (void)_handleIDMSRetentionForAuthenticatedAccount:(id)a3;
- (void)_processAuthenticationSuccessWithResult:(id)a3 authenticatedAccount:(id)a4;
- (void)_removeInactiveDuplicatesForAuthenticatedAccount:(id)a3;
- (void)_retainIDMS:(BOOL)a3 forAccount:(id)a4;
- (void)_startDataSyncForAccount:(id)a3;
- (void)setDialogRequest:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation AMSVerifyCredentialsTask

- (AMSVerifyCredentialsTask)initWithAccount:(id)a3 accountStore:(id)a4 bag:(id)a5 options:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)AMSVerifyCredentialsTask;
  v15 = [(AMSVerifyCredentialsTask *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_accountStore, a4);
    objc_storeStrong((id *)&v16->_bag, a5);
    v17 = (AMSAuthenticateMetrics *)[objc_alloc((Class)AMSAuthenticateMetrics) initWithBag:v13];
    metrics = v16->_metrics;
    v16->_metrics = v17;

    objc_storeStrong((id *)&v16->_options, a6);
    v19 = [v11 identifier];
    v20 = [v12 accountWithIdentifier:v19];
    v16->_accountWasOriginallyActive = [v20 isActive];

    v21 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
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
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating an AMSVerifyCredentialsTask. account = %{public}@", buf, 0x20u);
    }
  }

  return v16;
}

- (id)performTask
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_53CC;
  v4[3] = &unk_145D8;
  v4[4] = self;
  v2 = [(AMSVerifyCredentialsTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

- (id)_promiseOfAccountFromResult:(id)a3 orError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v8)
  {
    v8 = +[AMSLogConfig sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = AMSLogKey();
    id v12 = AMSHashIfNeeded();
    id v13 = AMSHashIfNeeded();
    int v31 = 138544130;
    uint64_t v32 = v10;
    __int16 v33 = 2114;
    v34 = v11;
    __int16 v35 = 2114;
    v36 = v12;
    __int16 v37 = 2114;
    v38 = v13;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The authentication finished. result = %{public}@ | error = %{public}@", (uint8_t *)&v31, 0x2Au);
  }
  if (v6)
  {
    id v14 = [(AMSVerifyCredentialsTask *)self _createUpdatedAccountWithAuthenticationResult:v6];
    [(AMSVerifyCredentialsTask *)self _handleIDMSRetentionForAuthenticatedAccount:v14];
    if (v14)
    {
      v15 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v15)
      {
        v15 = +[AMSLogConfig sharedConfig];
      }
      v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = objc_opt_class();
        v18 = AMSLogKey();
        v19 = AMSHashIfNeeded();
        v20 = AMSHashIfNeeded();
        int v31 = 138544130;
        uint64_t v32 = v17;
        __int16 v33 = 2114;
        v34 = v18;
        __int16 v35 = 2114;
        v36 = v19;
        __int16 v37 = 2114;
        v38 = v20;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The authentication succeeded. result = %{public}@ | authenticatedAccount = %{public}@", (uint8_t *)&v31, 0x2Au);
      }
      [(AMSVerifyCredentialsTask *)self _processAuthenticationSuccessWithResult:v6 authenticatedAccount:v14];
      id v21 = [objc_alloc((Class)AMSPromiseResult) initWithResult:v14 error:0];
      goto LABEL_19;
    }
    id v22 = [(AMSVerifyCredentialsTask *)self _processAuthenticationFailureWithResult:v6];
  }
  else
  {
    [(AMSVerifyCredentialsTask *)self _handleIDMSRetentionForAuthenticatedAccount:0];
    id v22 = v7;
  }
  id v14 = v22;
  uint64_t v23 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v23)
  {
    uint64_t v23 = +[AMSLogConfig sharedConfig];
  }
  v24 = [v23 OSLogObject];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = objc_opt_class();
    v26 = AMSLogKey();
    objc_super v27 = AMSHashIfNeeded();
    int v31 = 138543874;
    uint64_t v32 = v25;
    __int16 v33 = 2114;
    v34 = v26;
    __int16 v35 = 2114;
    v36 = v27;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The authentication failed. error = %{public}@", (uint8_t *)&v31, 0x20u);
  }
  id v28 = objc_alloc((Class)AMSPromiseResult);
  uint64_t v29 = objc_msgSend(v14, "ams_sanitizedForSecureCoding");
  id v21 = [v28 initWithResult:0 error:v29];

LABEL_19:
  return v21;
}

- (void)_startDataSyncForAccount:(id)a3
{
  id v3 = a3;
  id v7 = [objc_alloc((Class)AMSEngagement) initWithoutBag];
  id v4 = [v7 fetchMetricsIdentifiers];
  v5 = +[AMSAccountCachedServerData sharedInstance];
  id v6 = objc_msgSend(v3, "ams_accountID");

  [v5 accountAuthSyncForAccountID:v6];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  v8 = (void (**)(id, void, id))a6;
  [(AMSVerifyCredentialsTask *)self setDialogRequest:a5];
  AMSError();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8[2](v8, 0, v9);
}

- (BOOL)AMSURLSession:(id)a3 task:(id)a4 shouldFailWithServerError:(id)a5
{
  return 0;
}

- (id)_createAuthenticateRequestEncoder
{
  id v3 = objc_alloc((Class)AMSURLRequestEncoder);
  id v4 = [(AMSVerifyCredentialsTask *)self bag];
  id v5 = [v3 initWithBag:v4];

  id v6 = [(AMSVerifyCredentialsTask *)self options];
  uint64_t v7 = [v6 clientInfo];
  [v5 setClientInfo:v7];

  v8 = [(AMSVerifyCredentialsTask *)self options];
  LOBYTE(v7) = [v8 allowServerDialogs];

  if ((v7 & 1) == 0) {
    [v5 setDialogOptions:1];
  }
  [v5 setIncludeClientVersions:0];
  id v9 = [(AMSVerifyCredentialsTask *)self options];
  uint64_t v10 = [v9 logKey];
  [v5 setLogUUID:v10];

  [v5 setMescalType:1];
  [v5 setRequestEncoding:2];
  [v5 setShouldSetCookiesFromResponse:0];
  [v5 setShouldSetStorefrontFromResponse:0];
  return v5;
}

- (id)_createAuthenticateRequestForAccount:(id)a3 URL:(id)a4 requestEncoder:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v8 setAccount:v10];
  id v11 = [(AMSVerifyCredentialsTask *)self _createAuthenticateRequestParametersForAccount:v10];

  id v12 = [v8 requestWithMethod:4 bagURL:v9 parameters:v11];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_6678;
  v15[3] = &unk_14628;
  v15[4] = self;
  id v13 = [v12 thenWithBlock:v15];

  return v13;
}

- (id)_createAuthenticateRequestParametersForAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v5, "ams_setNullableObject:forKey:", &__kCFBooleanTrue, @"createSession");
  id v6 = [(AMSVerifyCredentialsTask *)self options];
  uint64_t v7 = (char *)[v6 credentialSource];

  id v8 = +[NSNumber numberWithUnsignedInteger:v7];
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v8, @"credentialSource");

  id v9 = +[AMSDevice deviceGUID];
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v9, @"guid");

  id v10 = +[NSNumber numberWithBool:(unint64_t)(v7 - 5) < 2];
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v10, @"isSilentAuthentication");

  id v11 = [v4 credential];
  id v12 = [v11 password];
  if (v7 == (unsigned char *)&dword_4 + 2) {
    CFStringRef v13 = @"homeToken";
  }
  else {
    CFStringRef v13 = @"password";
  }
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v12, v13);

  objc_msgSend(v5, "ams_setNullableObject:forKey:", @"0", @"rmp");
  v19[0] = @"free";
  id v14 = +[AMSSyncPasswordSettingsTask serverValueForFreePasswordSetting:](AMSSyncPasswordSettingsTask, "serverValueForFreePasswordSetting:", objc_msgSend(v4, "ams_freePasswordPromptSetting"));
  v19[1] = @"paid";
  v20[0] = v14;
  v15 = +[AMSSyncPasswordSettingsTask serverValueForPaidPasswordSetting:](AMSSyncPasswordSettingsTask, "serverValueForPaidPasswordSetting:", objc_msgSend(v4, "ams_paidPasswordPromptSetting"));
  v20[1] = v15;
  v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v16, @"passwordSettings");

  uint64_t v17 = [v4 username];
  objc_msgSend(v5, "ams_setNullableObject:forKey:", v17, @"appleId");

  +[AMSDevice setDeviceOffersCheckEncodingForRequestParameters:v5];
  return v5;
}

- (id)_createUpdatedAccountWithAuthenticationResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  uint64_t v7 = objc_msgSend(v6, "ams_username");
  if (![v7 length])
  {
    id v81 = 0;
    goto LABEL_49;
  }
  v90 = v7;
  id v8 = [(AMSVerifyCredentialsTask *)self account];
  id v9 = [v8 copy];

  id v10 = [(AMSVerifyCredentialsTask *)self accountStore];
  id v11 = objc_msgSend(v6, "ams_altDSID");
  id v12 = objc_msgSend(v6, "ams_DSID");
  CFStringRef v13 = objc_msgSend(v6, "ams_username");
  id v14 = objc_msgSend(v10, "ams_iTunesAccountWithAltDSID:DSID:username:", v11, v12, v13);

  v86 = self;
  id v88 = v4;
  v89 = v14;
  if (v14 && objc_msgSend(v9, "ams_isDuplicate:", v14))
  {
    v15 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      v19 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v93 = v17;
      __int16 v94 = 2114;
      v95 = v18;
      __int16 v96 = 2114;
      v97 = v19;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] A duplicate account was added while the authentication was in progress. We'll update the already existing account. existingAccount = %{public}@", buf, 0x20u);

      id v14 = v89;
    }

    v20 = [(AMSVerifyCredentialsTask *)self options];
    id v21 = [v20 clientInfo];
    id v22 = [v21 accountMediaType];
    if (objc_msgSend(v9, "ams_isActiveForMediaType:", v22))
    {
      uint64_t v23 = [(AMSVerifyCredentialsTask *)self options];
      v24 = [v23 clientInfo];
      uint64_t v25 = [v24 accountMediaType];
      unsigned __int8 v26 = objc_msgSend(v89, "ams_isActiveForMediaType:", v25);

      self = v86;
      id v14 = v89;

      if (v26)
      {
LABEL_19:
        int v31 = [v9 credential];
        [v14 setCredential:v31];

        id v32 = v14;
        id v9 = v32;
        goto LABEL_20;
      }
      objc_super v27 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v27)
      {
        objc_super v27 = +[AMSLogConfig sharedConfig];
      }
      id v28 = [v27 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = objc_opt_class();
        __int16 v30 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v93 = v29;
        __int16 v94 = 2114;
        v95 = v30;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The existing account wasn't active, but our just authenticated account was active. Updating the existing account to be active.", buf, 0x16u);
      }
      v20 = [(AMSVerifyCredentialsTask *)v86 options];
      id v21 = [v20 clientInfo];
      id v22 = [v21 accountMediaType];
      objc_msgSend(v89, "ams_setActive:forMediaType:", 1, v22);
    }

    goto LABEL_19;
  }
LABEL_20:
  uint64_t v7 = v90;
  __int16 v33 = objc_msgSend(v6, "ams_creditsString");
  objc_msgSend(v9, "ams_setCreditsString:", v33);

  v34 = objc_msgSend(v6, "ams_firstName");
  objc_msgSend(v9, "ams_setFirstName:", v34);

  __int16 v35 = objc_msgSend(v6, "ams_lastName");
  objc_msgSend(v9, "ams_setLastName:", v35);

  objc_msgSend(v9, "ams_setManagedAppleID:", objc_msgSend(v6, "ams_isManagedAppleID"));
  v36 = objc_msgSend(v6, "ams_privacyAcknowledgement");
  objc_msgSend(v9, "ams_mergePrivacyAcknowledgement:", v36);

  __int16 v37 = [v4 response];
  v38 = objc_msgSend(v37, "ams_storefront");

  v91 = v38;
  if ([v38 length])
  {
    v39 = [(AMSVerifyCredentialsTask *)self options];
    v40 = [v39 clientInfo];
    v41 = [v40 accountMediaType];
    v42 = objc_msgSend(v9, "ams_storefrontForMediaType:", v41);
    unsigned __int8 v43 = [v42 isEqualToString:v38];

    if ((v43 & 1) == 0)
    {
      v44 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v44)
      {
        v44 = +[AMSLogConfig sharedConfig];
      }
      v45 = [v44 OSLogObject];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v83 = objc_opt_class();
        v46 = AMSLogKey();
        v47 = [(AMSVerifyCredentialsTask *)self options];
        v48 = [v47 clientInfo];
        v49 = [v48 accountMediaType];
        v50 = objc_msgSend(v9, "ams_storefrontForMediaType:", v49);
        *(_DWORD *)buf = 138544130;
        uint64_t v93 = v83;
        __int16 v94 = 2114;
        v95 = v46;
        __int16 v96 = 2114;
        v97 = v50;
        __int16 v98 = 2114;
        v99 = v91;
        _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating the account's storefront. oldStorefront = %{public}@ | newStorefront = %{public}@", buf, 0x2Au);

        self = v86;
      }

      v51 = [(AMSVerifyCredentialsTask *)self options];
      v52 = [v51 clientInfo];
      v53 = [v52 accountMediaType];
      objc_msgSend(v9, "ams_setStorefront:forMediaType:", v91, v53);
    }
  }
  v54 = objc_msgSend(v6, "ams_altDSID", v83);
  if (v54)
  {
    v55 = objc_msgSend(v9, "ams_altDSID");
    unsigned __int8 v56 = [v55 isEqualToString:v54];

    if ((v56 & 1) == 0)
    {
      v57 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v57)
      {
        v57 = +[AMSLogConfig sharedConfig];
      }
      v58 = [v57 OSLogObject];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v84 = objc_opt_class();
        v59 = AMSLogKey();
        v60 = objc_msgSend(v9, "ams_altDSID");
        v61 = AMSHashIfNeeded();
        v62 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544130;
        uint64_t v93 = v84;
        __int16 v94 = 2114;
        v95 = v59;
        __int16 v96 = 2114;
        v97 = v61;
        __int16 v98 = 2114;
        v99 = v62;
        _os_log_impl(&dword_0, v58, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating the account's altDSID. oldAltDSID = %{public}@ | newAltDSID = %{public}@", buf, 0x2Au);
      }
      objc_msgSend(v9, "ams_setAltDSID:", v54);
    }
  }
  v63 = objc_msgSend(v6, "ams_DSID", v84);
  if (v63)
  {
    v64 = objc_msgSend(v9, "ams_DSID");
    unsigned __int8 v65 = [v64 isEqualToNumber:v63];

    if ((v65 & 1) == 0)
    {
      v66 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v66)
      {
        v66 = +[AMSLogConfig sharedConfig];
      }
      v67 = [v66 OSLogObject];
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v85 = objc_opt_class();
        v68 = AMSLogKey();
        v69 = objc_msgSend(v9, "ams_DSID");
        v70 = AMSHashIfNeeded();
        v71 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544130;
        uint64_t v93 = v85;
        __int16 v94 = 2114;
        v95 = v68;
        __int16 v96 = 2114;
        v97 = v70;
        __int16 v98 = 2114;
        v99 = v71;
        _os_log_impl(&dword_0, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating the account's DSID. oldDSID = %{public}@ | newDSID = %{public}@", buf, 0x2Au);

        uint64_t v7 = v90;
      }

      objc_msgSend(v9, "ams_setDSID:", v63);
    }
  }
  v72 = objc_msgSend(v9, "username", v85);
  unsigned __int8 v73 = [v72 isEqualToString:v7];

  if ((v73 & 1) == 0)
  {
    v74 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v74)
    {
      v74 = +[AMSLogConfig sharedConfig];
    }
    v75 = [v74 OSLogObject];
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v76 = objc_opt_class();
      v77 = AMSLogKey();
      v78 = [v9 username];
      v79 = AMSHashIfNeeded();
      AMSHashIfNeeded();
      v80 = v87 = v54;
      *(_DWORD *)buf = 138544130;
      uint64_t v93 = v76;
      __int16 v94 = 2114;
      v95 = v77;
      __int16 v96 = 2114;
      v97 = v79;
      __int16 v98 = 2114;
      v99 = v80;
      _os_log_impl(&dword_0, v75, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating the account's username. oldUsername = %{public}@ | newUsername = %{public}@", buf, 0x2Au);

      v54 = v87;
      uint64_t v7 = v90;
    }
    [v9 setUsername:v7];
  }
  id v81 = v9;

  id v4 = v88;
LABEL_49:

  return v81;
}

+ (id)_fetchSecondaryPasswordForAccount:(id)a3
{
  return 0;
}

- (id)_generatePasswordIfNeeded
{
  id v3 = [(AMSVerifyCredentialsTask *)self account];
  id v4 = objc_msgSend(v3, "ams_password");

  if (v4)
  {
    id v5 = [(AMSVerifyCredentialsTask *)self account];
    uint64_t v6 = +[AMSPromise promiseWithResult:v5];
  }
  else
  {
    uint64_t v7 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v9;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The account has no password.", buf, 0x16u);
    }
    id v11 = [(AMSVerifyCredentialsTask *)self options];
    id v12 = (char *)[v11 allowPasswordGeneration];

    if (v12 != (unsigned char *)&dword_0 + 1
      && (v12
       || ([(AMSVerifyCredentialsTask *)self options],
           CFStringRef v13 = objc_claimAutoreleasedReturnValue(),
           id v14 = (char *)[v13 authenticationType],
           v13,
           v14 == (unsigned char *)&dword_0 + 2)))
    {
      AMSError();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v5 = +[AMSPromise promiseWithError:v15];
    }
    else
    {
      v16 = [(AMSVerifyCredentialsTask *)self options];
      id v15 = [v16 copy];

      [v15 setAuthenticationType:1];
      id v17 = objc_alloc((Class)AMSAuthKitUpdateTask);
      v18 = [(AMSVerifyCredentialsTask *)self account];
      id v19 = [v17 initWithAccount:v18 options:v15];

      v20 = [v19 performAuthKitUpdate];
      id v5 = [v20 thenWithBlock:&stru_14668];
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_7C58;
    v24[3] = &unk_14690;
    v24[4] = self;
    [v5 addErrorBlock:v24];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_7D8C;
    v23[3] = &unk_146B8;
    v23[4] = self;
    [v5 addSuccessBlock:v23];
    uint64_t v6 = [v5 catchWithBlock:&stru_146F8];
  }
  id v21 = (void *)v6;

  return v21;
}

- (void)_handleIDMSRetentionForAuthenticatedAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 isActive];
    uint64_t v7 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      id v11 = AMSHashIfNeeded();
      int v33 = 138544130;
      uint64_t v34 = v9;
      __int16 v35 = 2114;
      v36 = v10;
      __int16 v37 = 1024;
      LODWORD(v38[0]) = v6;
      WORD2(v38[0]) = 2114;
      *(void *)((char *)v38 + 6) = v11;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] retainIDMS = %d | authenticatedAccount = %{public}@", (uint8_t *)&v33, 0x26u);
    }
    [(AMSVerifyCredentialsTask *)self _retainIDMS:v6 forAccount:v5];
  }
  else
  {
    id v12 = [(AMSVerifyCredentialsTask *)self accountStore];
    CFStringRef v13 = [(AMSVerifyCredentialsTask *)self account];
    id v14 = objc_msgSend(v13, "ams_altDSID");
    id v15 = [(AMSVerifyCredentialsTask *)self account];
    v16 = objc_msgSend(v15, "ams_DSID");
    id v17 = [(AMSVerifyCredentialsTask *)self account];
    v18 = [v17 username];
    id v19 = objc_msgSend(v12, "ams_iTunesAccountWithAltDSID:DSID:username:", v14, v16, v18);

    if (v19)
    {
      id v20 = [v19 isActive];
      id v21 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v21)
      {
        id v21 = +[AMSLogConfig sharedConfig];
      }
      id v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = objc_opt_class();
        v24 = AMSLogKey();
        uint64_t v25 = AMSHashIfNeeded();
        int v33 = 138544130;
        uint64_t v34 = v23;
        __int16 v35 = 2114;
        v36 = v24;
        __int16 v37 = 1024;
        LODWORD(v38[0]) = v20;
        WORD2(v38[0]) = 2114;
        *(void *)((char *)v38 + 6) = v25;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] retainIDMS = %d | accountOnDevice = %{public}@", (uint8_t *)&v33, 0x26u);
      }
      [(AMSVerifyCredentialsTask *)self _retainIDMS:v20 forAccount:v19];
    }
    else
    {
      uint64_t v26 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v26)
      {
        uint64_t v26 = +[AMSLogConfig sharedConfig];
      }
      __int16 v27 = [v26 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = objc_opt_class();
        uint64_t v29 = AMSLogKey();
        __int16 v30 = [(AMSVerifyCredentialsTask *)self account];
        int v31 = AMSHashIfNeeded();
        int v33 = 138543874;
        uint64_t v34 = v28;
        __int16 v35 = 2114;
        v36 = v29;
        __int16 v37 = 2114;
        v38[0] = v31;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] retainIDMS = 0 | self.account = %{public}@", (uint8_t *)&v33, 0x20u);
      }
      id v32 = [(AMSVerifyCredentialsTask *)self account];
      [(AMSVerifyCredentialsTask *)self _retainIDMS:0 forAccount:v32];
    }
  }
}

- (void)_handleDeviceOffersForAuthenticatedAccount:(id)a3
{
  id v4 = a3;
  if ((+[AMSDefaults didRetrieveDeviceOffers] & 1) == 0)
  {
    id v5 = objc_alloc((Class)AMSDeviceOfferRegistrationTask);
    id v6 = [(AMSVerifyCredentialsTask *)self bag];
    id v7 = [v5 initWithAccount:v4 bag:v6];

    id v8 = [v7 perform];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_83E0;
    v10[3] = &unk_14690;
    v10[4] = self;
    [v8 addErrorBlock:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_8500;
    v9[3] = &unk_14760;
    v9[4] = self;
    [v8 addSuccessBlock:v9];
  }
}

- (void)_handleBiometricsForAuthenticatedAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSVerifyCredentialsTask *)self options];
  id v6 = (char *)[v5 credentialSource];

  id v7 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v59 = v9;
    __int16 v60 = 2114;
    v61 = v10;
    __int16 v62 = 2048;
    id v63 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Determining whether we need to provision biometrics. credentialSource = %ld", buf, 0x20u);
  }
  if (v6 != (unsigned char *)&dword_4 + 1)
  {
    id v15 = objc_msgSend(v4, "ams_DSID");
    v16 = +[NSString stringWithFormat:@"%@%@", @"mt-tid-", v15];

    id v17 = objc_msgSend(v4, "ams_cookies");
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_8EFC;
    v56[3] = &unk_14788;
    id v11 = v16;
    v57 = v11;
    unsigned int v18 = objc_msgSend(v17, "ams_anyWithTest:", v56);

    id v19 = &_s18AppleMediaServices18PromiseSerialQueueC03runD5BlockySo10AMSPromiseCyyXlGyyyXlSg_So7NSErrorCSgtccFTj_ptr;
    id v20 = +[AMSBiometricsSecurityService isAvailableForAccount:v4];
    unsigned int v21 = [v20 resultWithError:0];

    if (v21)
    {
      id v22 = +[AMSBiometricsSecurityService saveIdentityMap];
      [v22 resultWithError:0];

      uint64_t v23 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v23)
      {
        uint64_t v23 = +[AMSLogConfig sharedConfig];
      }
      v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = objc_opt_class();
        uint64_t v26 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v59 = v25;
        __int16 v60 = 2114;
        v61 = v26;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Biometrics are enabled.", buf, 0x16u);
      }
    }
    __int16 v27 = (char *)+[AMSBiometrics stateForAccount:v4];
    if (v27 != (unsigned char *)&dword_0 + 1)
    {
      id v43 = v27;
      id v38 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v38)
      {
        id v38 = +[AMSLogConfig sharedConfig];
      }
      v44 = [v38 OSLogObject];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = objc_opt_class();
        v46 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v59 = v45;
        __int16 v60 = 2114;
        v61 = v46;
        __int16 v62 = 2048;
        id v63 = v43;
        _os_log_impl(&dword_0, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometrics provisioning. biometricState = %ld", buf, 0x20u);
      }
      goto LABEL_52;
    }
    if (!v18) {
      goto LABEL_40;
    }
    uint64_t v28 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v28)
    {
      uint64_t v28 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = objc_opt_class();
      int v31 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v59 = v30;
      __int16 v60 = 2112;
      v61 = v31;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%@] Attestation exists. Checking the ACL version.", buf, 0x16u);
    }
    id v32 = objc_alloc_init((Class)AMSKeychainOptions);
    [v32 setPurpose:0];
    objc_msgSend(v32, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
    id v33 = +[AMSKeychain copyAccessControlRefWithAccount:v4 options:v32 error:0];
    unsigned int v34 = +[AMSBiometrics isActionSupported:4 withAccessControl:v33];
    if ((v34 & 1) == 0)
    {
      __int16 v35 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v35)
      {
        __int16 v35 = +[AMSLogConfig sharedConfig];
      }
      v36 = [v35 OSLogObject];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v54 = objc_opt_class();
        __int16 v37 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v59 = v54;
        __int16 v60 = 2112;
        v61 = v37;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%@] Attestation is out-of-date. An update is required.", buf, 0x16u);

        id v19 = &_s18AppleMediaServices18PromiseSerialQueueC03runD5BlockySo10AMSPromiseCyyXlGyyyXlSg_So7NSErrorCSgtccFTj_ptr;
      }
    }
    if (v33) {
      CFRelease(v33);
    }

    if (v34)
    {
      id v38 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v38)
      {
        id v38 = +[AMSLogConfig sharedConfig];
      }
      v39 = [v38 OSLogObject];
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      uint64_t v40 = objc_opt_class();
      v41 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v59 = v40;
      __int16 v60 = 2114;
      v61 = v41;
      v42 = "%{public}@: [%{public}@] Skipping biometrics provisioning. Attestation is up-to-date.";
    }
    else
    {
LABEL_40:
      v47 = [v19[101] isIdentityMapValid];
      unsigned __int8 v48 = [v47 resultWithError:0];

      uint64_t v49 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      id v38 = (id)v49;
      if (v48)
      {
        if (!v49)
        {
          id v38 = +[AMSLogConfig sharedConfig];
        }
        v50 = [v38 OSLogObject];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v51 = objc_opt_class();
          v52 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v59 = v51;
          __int16 v60 = 2112;
          v61 = v52;
          _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: [%@] Provisoning biometrics.", buf, 0x16u);
        }
        id v38 = [objc_alloc((Class)AMSBiometricsTokenUpdateTask) initWithAccount:v4];
        v39 = [v38 performUpdate];
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_8F40;
        v55[3] = &unk_145B0;
        v55[4] = self;
        [v39 addFinishBlock:v55];
        goto LABEL_51;
      }
      if (!v49)
      {
        id v38 = +[AMSLogConfig sharedConfig];
      }
      v39 = [v38 OSLogObject];
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      uint64_t v53 = objc_opt_class();
      v41 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v59 = v53;
      __int16 v60 = 2114;
      v61 = v41;
      v42 = "%{public}@: [%{public}@] Skipping biometrics provisioning. Identity map is invalid.";
    }
    _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, v42, buf, 0x16u);

LABEL_51:
LABEL_52:

    id v12 = v57;
    goto LABEL_53;
  }
  id v11 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    id v14 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v59 = v13;
    __int16 v60 = 2114;
    v61 = v14;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometrics provisioning. The authentication was silent.", buf, 0x16u);
  }
LABEL_53:
}

- (id)_processAuthenticationFailureWithResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AMSLogKey();
  if (!v5)
  {
    uint64_t v5 = AMSSetLogKeyIfNeeded();
  }
  v71 = (void *)v5;
  id v6 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = AMSHashIfNeeded();
    id v10 = [v4 object];
    id v11 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v79 = v8;
    __int16 v80 = 2114;
    id v81 = v71;
    __int16 v82 = 2114;
    uint64_t v83 = v9;
    __int16 v84 = 2112;
    uint64_t v85 = v11;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The authentication failed. result = %{public}@ | result.object = %@", buf, 0x2Au);
  }
  [(id)objc_opt_class() _postAuthenticationFailedNotification];
  id v12 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  id v14 = [(AMSVerifyCredentialsTask *)self options];
  id v15 = [v14 clientInfo];
  uint64_t v16 = [v15 accountMediaType];

  v72 = (void *)v16;
  if (!v16)
  {
    v72 = +[AMSProcessInfo defaultMediaTypeForCurrentProcess];
  }
  id v70 = v13;
  v69 = (dylib_command *)objc_msgSend(v13, "ams_errorCode");
  id v17 = v71;
  if (v69 == (dylib_command *)((char *)&stru_1380.dylib.name.offset + 1)
    && [(AMSVerifyCredentialsTask *)self accountWasOriginallyActive])
  {
    unsigned int v18 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v18)
    {
      unsigned int v18 = +[AMSLogConfig sharedConfig];
    }
    id v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      unsigned int v21 = [(AMSVerifyCredentialsTask *)self account];
      id v22 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v79 = v20;
      __int16 v80 = 2114;
      id v81 = v71;
      __int16 v82 = 2114;
      uint64_t v83 = v22;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received an Account Conversion Needed error for the active account, storing cookies on the account. account = %{public}@", buf, 0x20u);
    }
    uint64_t v23 = [(AMSVerifyCredentialsTask *)self account];
    if (v23) {
      goto LABEL_25;
    }
  }
  v24 = [(AMSVerifyCredentialsTask *)self accountStore];
  uint64_t v25 = objc_msgSend(v24, "ams_localiTunesAccountForAccountMediaType:", v72);
  id v75 = 0;
  uint64_t v23 = [v25 resultWithError:&v75];
  id v26 = v75;

  if (v23)
  {
    __int16 v27 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v27)
    {
      __int16 v27 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = objc_opt_class();
      uint64_t v30 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v79 = v29;
      __int16 v80 = 2114;
      id v81 = v71;
      __int16 v82 = 2114;
      uint64_t v83 = v30;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Using the local account for cookie storage. account = %{public}@", buf, 0x20u);
    }
LABEL_25:
    int v31 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v31)
    {
      int v31 = +[AMSLogConfig sharedConfig];
    }
    id v32 = [v31 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = objc_opt_class();
      unsigned int v34 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v79 = v33;
      __int16 v80 = 2114;
      id v81 = v71;
      __int16 v82 = 2114;
      uint64_t v83 = v34;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Saving cookies. account = %{public}@", buf, 0x20u);
    }
    __int16 v35 = [(AMSVerifyCredentialsTask *)self accountStore];
    id v74 = 0;
    unsigned __int8 v36 = objc_msgSend(v35, "ams_addCookiesForResult:account:error:", v4, v23, &v74);
    __int16 v37 = v74;

    uint64_t v38 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    v39 = (void *)v38;
    if (v36)
    {
      if (!v38)
      {
        v39 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v40 = [v39 OSLogObject];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v79 = v41;
        __int16 v80 = 2114;
        id v81 = v71;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Saving cookies succeeded.", buf, 0x16u);
      }
    }
    else
    {
      if (!v38)
      {
        v39 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v40 = [v39 OSLogObject];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = objc_opt_class();
        id v43 = AMSHashIfNeeded();
        v44 = AMSHashIfNeeded();
        AMSHashIfNeeded();
        uint64_t v45 = v68 = v4;
        *(_DWORD *)buf = 138544386;
        uint64_t v79 = v42;
        __int16 v80 = 2114;
        id v81 = v71;
        __int16 v82 = 2112;
        uint64_t v83 = v43;
        __int16 v84 = 2114;
        uint64_t v85 = v44;
        __int16 v86 = 2114;
        v87 = v45;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Saving response cookies to the account failed. result = %{result}@ | error = %{public}@ | account = %{public}@", buf, 0x34u);

        id v4 = v68;
        id v17 = v71;
      }
    }

    goto LABEL_39;
  }
  uint64_t v48 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  uint64_t v49 = (void *)v48;
  if (v26)
  {
    if (!v48)
    {
      uint64_t v49 = +[AMSLogConfig sharedConfig];
    }
    v50 = [v49 OSLogObject];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = objc_opt_class();
      v52 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v79 = v51;
      __int16 v80 = 2114;
      id v81 = v71;
      __int16 v82 = 2114;
      uint64_t v83 = v52;
      _os_log_impl(&dword_0, v50, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve the local iTunes account for cookie storage. error = %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (!v48)
    {
      uint64_t v49 = +[AMSLogConfig sharedConfig];
    }
    v50 = [v49 OSLogObject];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      uint64_t v66 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v79 = v66;
      __int16 v80 = 2114;
      id v81 = v71;
      _os_log_impl(&dword_0, v50, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve the local iTunes account for cookie storage and didn’t get an error.", buf, 0x16u);
    }
  }

  uint64_t v23 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v23)
  {
    uint64_t v23 = +[AMSLogConfig sharedConfig];
  }
  __int16 v37 = [v23 OSLogObject];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v67 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v79 = v67;
    __int16 v80 = 2114;
    id v81 = v71;
    _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Not saving cookies, no account to save to.", buf, 0x16u);
  }
LABEL_39:

  if (v69 == (dylib_command *)-5000
    || v69 == &stru_14B8
    || v69 == (dylib_command *)((char *)&stru_1380.dylib.name.offset + 1))
  {
    v46 = v70;
    v47 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AMSServerErrorDomain, v68);
  }
  else
  {
    v47 = AMSError();
    v46 = v70;
  }
  uint64_t v53 = [(AMSVerifyCredentialsTask *)self dialogRequest];

  if (v53)
  {
    uint64_t v54 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v54)
    {
      uint64_t v54 = +[AMSLogConfig sharedConfig];
    }
    id v55 = v4;
    unsigned __int8 v56 = [v54 OSLogObject];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v57 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v79 = v57;
      __int16 v80 = 2114;
      id v81 = v17;
      _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The authentication resulted in an AMSDialogRequest. Encoding the request.", buf, 0x16u);
    }

    v58 = [(AMSVerifyCredentialsTask *)self dialogRequest];
    id v73 = 0;
    uint64_t v59 = +[NSKeyedArchiver archivedDataWithRootObject:v58 requiringSecureCoding:1 error:&v73];
    id v60 = v73;

    if (v59)
    {
      uint64_t v76 = AMSAuthenticateErrorDialogKey;
      v77 = v59;
      v61 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      [v47 ams_errorByAddingUserInfo:v61];
      v47 = __int16 v62 = v47;
    }
    else
    {
      v61 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v61)
      {
        v61 = +[AMSLogConfig sharedConfig];
      }
      __int16 v62 = [v61 OSLogObject];
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        uint64_t v63 = objc_opt_class();
        v64 = AMSLogableError();
        *(_DWORD *)buf = 138543874;
        uint64_t v79 = v63;
        __int16 v80 = 2114;
        id v81 = v17;
        __int16 v82 = 2114;
        uint64_t v83 = v64;
        _os_log_impl(&dword_0, v62, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode the AMSDialogRequest. error = %{public}@", buf, 0x20u);
      }
    }
    id v4 = v55;

    v46 = v70;
  }

  return v47;
}

- (void)_processAuthenticationSuccessWithResult:(id)a3 authenticatedAccount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = AMSLogKey();
    id v12 = AMSHashIfNeeded();
    int v48 = 138543874;
    uint64_t v49 = v10;
    __int16 v50 = 2114;
    uint64_t v51 = v11;
    __int16 v52 = 2114;
    uint64_t v53 = v12;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The authentication succeeded. authenticatedAccount = %{public}@", (uint8_t *)&v48, 0x20u);
  }
  [sub_A2C4() beginSuspendingSubscriptionStatusChangeNotifications];
  objc_msgSend(v6, "ams_addCookiesForResult:", v7);
  id v13 = [(AMSVerifyCredentialsTask *)self accountStore];
  objc_msgSend(v13, "ams_addCookiesForResult:account:error:", v7, 0, 0);

  id v14 = [v7 object];

  objc_opt_class();
  id v15 = 0;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }

  uint64_t v16 = objc_msgSend(v15, "ams_secureToken");

  if (v16)
  {
    id v17 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
    if (!v17)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = AMSLogKey();
      int v48 = 138543618;
      uint64_t v49 = v19;
      __int16 v50 = 2114;
      uint64_t v51 = v20;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received a strong token.", (uint8_t *)&v48, 0x16u);
    }
    unsigned int v21 = [(AMSVerifyCredentialsTask *)self accountStore];
    id v22 = objc_msgSend(v15, "ams_secureToken");
    unsigned __int8 v23 = objc_msgSend(v21, "ams_setSecureToken:forAccount:error:", v22, v6, 0);

    if ((v23 & 1) == 0)
    {
      v24 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v24)
      {
        v24 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = objc_opt_class();
        __int16 v27 = AMSLogKey();
        uint64_t v28 = AMSHashIfNeeded();
        int v48 = 138543874;
        uint64_t v49 = v26;
        __int16 v50 = 2114;
        uint64_t v51 = v27;
        __int16 v52 = 2114;
        uint64_t v53 = v28;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to set the strong token. error = %{public}@", (uint8_t *)&v48, 0x20u);
      }
    }
  }
  uint64_t v29 = AMSLogKey();
  +[AMSDevice tearDownAllDeviceOfferFollowUpsForAccount:v6 logKey:v29];

  uint64_t v30 = AMSLogKey();
  unsigned int v31 = +[AMSDevice saveDeviceOffersForAccount:v6 response:v15 logKey:v30];

  if (v31)
  {
    id v32 = +[AMSLogConfig sharedDeviceOffersConfig];
    if (!v32)
    {
      id v32 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v33 = [v32 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = objc_opt_class();
      __int16 v35 = AMSLogKey();
      int v48 = 138543618;
      uint64_t v49 = v34;
      __int16 v50 = 2114;
      uint64_t v51 = v35;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The authentication response had device offers.", (uint8_t *)&v48, 0x16u);
    }
    unsigned __int8 v36 = +[AMSProcessInfo isBuddyRunning];
    uint64_t v37 = +[AMSLogConfig sharedDeviceOffersConfig];
    uint64_t v38 = (void *)v37;
    if (v36)
    {
      if (!v37)
      {
        uint64_t v38 = +[AMSLogConfig sharedConfig];
      }
      v39 = [v38 OSLogObject];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = objc_opt_class();
        uint64_t v41 = AMSLogKey();
        int v48 = 138543618;
        uint64_t v49 = v40;
        __int16 v50 = 2114;
        uint64_t v51 = v41;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Refusing to post device offer follow-ups because we're running in Buddy.", (uint8_t *)&v48, 0x16u);
      }
    }
    else
    {
      if (!v37)
      {
        uint64_t v38 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v42 = [v38 OSLogObject];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = objc_opt_class();
        v44 = AMSLogKey();
        int v48 = 138543618;
        uint64_t v49 = v43;
        __int16 v50 = 2114;
        uint64_t v51 = v44;
        _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting follow-ups for the device offers.", (uint8_t *)&v48, 0x16u);
      }
      uint64_t v38 = [(AMSVerifyCredentialsTask *)self bag];
      v39 = AMSLogKey();
      +[AMSDevice postAllDeviceOfferFollowUpsForAccount:v6 priority:0 bag:v38 logKey:v39];
    }
  }
  if ((+[AMSUnitTests isRunningUnitTests] & 1) == 0)
  {
    id v45 = sub_A2C4();
    v46 = objc_msgSend(v6, "ams_DSID");
    [v45 updateWithResponseDictionary:v15 accountIdentifier:v46];

    [sub_A2C4() endSuspendingSubscriptionStatusChangeNotifications];
  }
  v47 = +[NSDate date];
  objc_msgSend(v6, "ams_setLastAuthenticated:", v47);

  objc_msgSend(v6, "ams_setServerResponse:", v15);
  [(AMSVerifyCredentialsTask *)self _handleBiometricsForAuthenticatedAccount:v6];
  [(AMSVerifyCredentialsTask *)self _handleDeviceOffersForAuthenticatedAccount:v6];
  [(AMSVerifyCredentialsTask *)self _removeInactiveDuplicatesForAuthenticatedAccount:v6];
  [(AMSVerifyCredentialsTask *)self _removeRenewCredentialsFollowUp];
}

- (void)_removeInactiveDuplicatesForAuthenticatedAccount:(id)a3
{
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v22 = self;
  uint64_t v5 = [(AMSVerifyCredentialsTask *)self accountStore];
  id v6 = [v5 accounts];

  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    id v21 = v4;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v11 isActive] & 1) == 0
          && objc_msgSend(v4, "ams_isDuplicate:", v11))
        {
          id v12 = AMSLogKey();
          id v13 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
          if (!v13)
          {
            id v13 = +[AMSLogConfig sharedConfig];
          }
          id v14 = [v13 OSLogObject];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = objc_opt_class();
            if (v12) {
              +[NSString stringWithFormat:@"%@: [%@] ", v15, v12];
            }
            else {
            uint64_t v16 = +[NSString stringWithFormat:@"%@: ", v15, v20];
            }
            id v17 = AMSHashIfNeeded();
            *(_DWORD *)buf = 138543618;
            unsigned int v31 = v16;
            __int16 v32 = 2114;
            uint64_t v33 = v17;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Removing an inactive duplicate of the account we just authenticated. duplicateAccount = %{public}@", buf, 0x16u);

            id v4 = v21;
          }

          unsigned int v18 = [(AMSVerifyCredentialsTask *)v22 accountStore];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_A688;
          v23[3] = &unk_147B0;
          id v24 = v12;
          uint64_t v25 = v22;
          id v19 = v12;
          [v18 removeAccount:v11 withCompletionHandler:v23];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v8);
  }
}

- (void)_retainIDMS:(BOOL)a3 forAccount:(id)a4
{
}

+ (void)_postAuthenticationBeganNotification
{
  v2 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = AMSLogKey();
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Authentication began. Setting AuthenticationStarted to now.", (uint8_t *)&v8, 0x16u);
  }
  id v6 = +[NSDate date];
  +[AMSDefaults setAuthenticationStarted:v6];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.authbegin", 0, 0, 1u);
}

+ (void)_postAuthenticationFailedNotification
{
  v2 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = AMSLogKey();
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    __int16 v10 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Authentication failed. Setting AuthenticationStarted to nil.", (uint8_t *)&v7, 0x16u);
  }
  +[AMSDefaults setAuthenticationStarted:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.authfail", 0, 0, 1u);
}

+ (void)_postAuthenticationFinishedNotification
{
  v2 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = AMSLogKey();
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    __int16 v10 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Authentication finished. Setting AuthenticationStarted to nil.", (uint8_t *)&v7, 0x16u);
  }
  +[AMSDefaults setAuthenticationStarted:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.authfinish", 0, 0, 1u);
}

+ (void)_postAuthenticationSubmittedNotification
{
  v2 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = AMSLogKey();
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    __int16 v10 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Authentication submitted.", (uint8_t *)&v7, 0x16u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.authsubmit", 0, 0, 1u);
}

+ (id)_processAccountDeviceRequirementsForAutheniticatedAccount:(id)a3 accountStore:(id)a4 bag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)AMSMutablePromise);
  if ([(id)objc_opt_class() _shouldUpdateBundleOwnerStatusForAccount:v8])
  {
    id v12 = [objc_alloc((Class)AMSAccountDeviceInfoTask) initWithAccount:v8 accountStore:v9 bag:v10];
    id v13 = [v12 perform];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_AF44;
    v24[3] = &unk_147D8;
    id v25 = v11;
    [v13 addFinishBlock:v24];
  }
  else
  {
    [v11 finishWithResult:v8];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_AFD4;
  v19[3] = &unk_14868;
  id v20 = v9;
  id v21 = v8;
  id v22 = v10;
  id v23 = a1;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  id v17 = [v11 thenWithBlock:v19];

  return v17;
}

+ (BOOL)_shouldUpdateBundleOwnerStatusForAccount:(id)a3
{
  id v3 = objc_msgSend(a3, "ams_isBundleOwner");
  if (v3) {
    unsigned int v4 = +[AMSDefaults didFetchBundleOwnerStatus] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

+ (id)_handleBundleGDPRRequirementsForAuthenticatedAccount:(id)a3 task:(id)a4 gdprFailureAction:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = objc_alloc_init((Class)AMSMutablePromise);
  id v11 = [v8 performPrivacyAcknowledgement];
  id v26 = 0;
  unsigned __int8 v12 = [v11 resultWithError:&v26];
  id v13 = v26;

  if (v13 || (v12 & 1) == 0)
  {
    if (!v13)
    {
      AMSError();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v14 = +[AMSLogConfig sharedAccountsConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v16;
      __int16 v29 = 2114;
      uint64_t v30 = v17;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Successfully authenticated the account but required GDPR acknowledgment missing", buf, 0x16u);
    }
    unsigned int v18 = v9[2](v9, v7);
    id v25 = 0;
    [v18 resultWithError:&v25];
    id v19 = v25;

    if (v19)
    {
      id v20 = +[AMSLogConfig sharedAccountsConfig];
      if (!v20)
      {
        id v20 = +[AMSLogConfig sharedConfig];
      }
      id v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = objc_opt_class();
        id v23 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v22;
        __int16 v29 = 2114;
        uint64_t v30 = v23;
        __int16 v31 = 2114;
        id v32 = v19;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to sign out of account that has failed to meet GDPR requirements for this device. Signout error: %{public}@", buf, 0x20u);
      }
    }
    [v10 finishWithError:v13];
  }
  else
  {
    [v10 finishWithResult:v7];
  }

  return v10;
}

- (ACAccount)account
{
  return self->_account;
}

- (ACDAccountStore)accountStore
{
  return self->_accountStore;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSAuthenticateOptions)options
{
  return self->_options;
}

- (BOOL)accountWasOriginallyActive
{
  return self->_accountWasOriginallyActive;
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void)setDialogRequest:(id)a3
{
}

- (AMSAuthenticateMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end