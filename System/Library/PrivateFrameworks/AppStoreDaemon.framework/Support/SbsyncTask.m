@interface SbsyncTask
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)main;
@end

@implementation SbsyncTask

- (void)main
{
  if (!self->_logKey)
  {
    v3 = [[_TtC9appstored6LogKey alloc] initWithCategory:@"Sbsync/Default"];
    logKey = self->_logKey;
    self->_logKey = v3;
  }
  sub_1002CE90C((uint64_t)SbsyncTask, 0);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_logKey;
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v7;
    __int16 v134 = 2114;
    v135 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] Starting with subscriptionInfo: %{public}@", buf, 0x16u);
  }

  if (self->_syncType) {
    v8 = @"Signout";
  }
  else {
    v8 = @"Ocelot";
  }
  v9 = v8;
  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_logKey;
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v11;
    __int16 v134 = 2114;
    v135 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] Starting with sbsyncType: %{public}@", buf, 0x16u);
  }
  v121 = v9;

  v12 = [SbsyncTaskRequestEncoder alloc];
  v13 = sub_10030B11C();
  v14 = [(SbsyncTaskRequestEncoder *)v12 initWithBag:v13];

  if (self->_account)
  {
    v15 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_logKey;
      account = self->_account;
      v18 = v16;
      v19 = [(ACAccount *)account ams_DSID];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v16;
      __int16 v134 = 2114;
      v135 = v19;
      v20 = "[%@] Starting with provided account: %{public}@";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
    }
  }
  else
  {
    v21 = +[ACAccountStore ams_sharedAccountStore];
    objc_msgSend(v21, "ams_activeiTunesAccount");
    v22 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v23 = self->_account;
    self->_account = v22;

    v15 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_logKey;
      v25 = self->_account;
      v18 = v24;
      v19 = [(ACAccount *)v25 ams_DSID];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v24;
      __int16 v134 = 2114;
      v135 = v19;
      v20 = "[%@] Starting with active account: %{public}@";
      goto LABEL_15;
    }
  }

  v26 = self->_account;
  if (v26 && v5)
  {
    v27 = [(ACAccount *)self->_account ams_DSID];
    self->_initialSubscriptionStatus = sub_1002CEA58((uint64_t)SbsyncTask, v27, v5);

    v26 = self->_account;
  }
  if (v26) {
    -[SbsyncTaskRequestEncoder setAccount:](v14, "setAccount:");
  }
  v28 = sub_10030B11C();
  uint64_t v29 = [v28 URLForKey:@"subscription-keybag-refresh"];

  v120 = (void *)v29;
  v122 = v5;
  if (v29)
  {
    v30 = 0;
  }
  else
  {
    v30 = ASDErrorWithTitleAndMessage();
  }
  v123 = v14;
  id v31 = v30;

  id v32 = v31;
  v33 = objc_opt_new();
  v34 = +[AMSDevice deviceGUID];
  if (v34) {
    [v33 setObject:v34 forKeyedSubscript:@"guid"];
  }
  v124 = v33;
  v35 = [(ACAccount *)self->_account ams_DSID];
  int64_t syncType = self->_syncType;
  v37 = self->_logKey;
  id v38 = v35;
  self;
  uint64_t v132 = 0;
  unsigned int v131 = 0;
  v39 = +[AMSKeybag sharedInstance];
  id v130 = 0;
  id v40 = [v39 fairplayContextWithError:&v130];
  id v41 = v130;

  if (syncType == 1) {
    uint64_t v42 = 314;
  }
  else {
    uint64_t v42 = 313;
  }
  v43 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v37;
    __int16 v134 = 2048;
    v135 = (__CFString *)v42;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%@] Getting sbsync data with transactionType: %ld", buf, 0x16u);
  }

  id v44 = [v38 longLongValue];
  sub_100127BD8((uint64_t)v40, (uint64_t)v44, v42, 0, 0, 0, 0, 0, 0, (uint64_t)&v132, (uint64_t)&v131);
  if (v45)
  {
    v46 = +[NSString stringWithFormat:@"Failed to generate sbsync data. Fairplay error status: %d", v45];
    uint64_t v47 = ASDErrorWithTitleAndMessage();

    id v48 = 0;
    id v41 = (id)v47;
    v49 = v124;
  }
  else
  {
    v49 = v124;
    if (v131)
    {
      id v50 = objc_alloc((Class)NSData);
      id v48 = [v50 initWithBytesNoCopy:v132 length:v131 deallocator:&stru_1005263E0];
    }
    else
    {
      id v48 = 0;
    }
  }
  id v51 = v41;

  id v52 = v51;
  if (v48)
  {
    v53 = [v48 base64EncodedStringWithOptions:0];
    [v49 setObject:v53 forKeyedSubscript:@"sbsync"];
  }
  if (self->_syncType == 1) {
    [v49 setObject:@"opt-out" forKeyedSubscript:@"action"];
  }
  id v54 = v32;
  if (v52) {
    id v54 = v52;
  }

  v55 = (__CFString *)v54;
  if (v55)
  {
    BOOL v56 = 0;
    v57 = v122;
    goto LABEL_84;
  }
  if (self->_timeout <= 0.0)
  {
    id v64 = [(SbsyncTaskRequestEncoder *)v123 requestWithMethod:4 bagURL:v120 parameters:v49];
    id v128 = 0;
    v63 = [v64 resultWithError:&v128];
    v65 = (__CFString *)v128;
  }
  else
  {
    v58 = +[NSDate date];
    [v58 timeIntervalSinceReferenceDate];
    double v60 = v59 - self->_startTime;

    double v61 = self->_timeout - v60;
    if (v61 <= 0.0)
    {
      ASDErrorWithTitleAndMessage();
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      goto LABEL_54;
    }
    v62 = [(SbsyncTaskRequestEncoder *)v123 requestWithMethod:4 bagURL:v120 parameters:v49];
    id v129 = 0;
    v63 = [v62 resultWithTimeout:&v129 error:v61];
    id v64 = v129;

    if (!v64)
    {
      v55 = 0;
      goto LABEL_52;
    }
    if (ASDErrorIsEqual()) {
      ASDErrorWithUnderlyingErrorAndDescription();
    }
    else {
      ASDErrorWithSafeUserInfo();
    }
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v55 = v65;
LABEL_52:

LABEL_54:
  v66 = self->_subscriptionDuration;
  if (v66)
  {
    v67 = v66;
    int has_internal_content = os_variant_has_internal_content();

    if (has_internal_content)
    {
      v69 = [(NSNumber *)self->_subscriptionDuration stringValue];
      [v63 setValue:v69 forHTTPHeaderField:@"X-iTMS-ValidityDurationInSeconds"];
    }
  }
  v119 = v63;
  if (!v55)
  {
    v71 = [(AMSURLSession *)self->_urlSession dataTaskPromiseWithRequest:v63];
    v72 = v71;
    if (self->_timeout == 0.0)
    {
      id v126 = 0;
      v70 = [v71 resultWithError:&v126];
      id v78 = v126;
      id v76 = v78;
      if (v78)
      {
        v79 = [v78 userInfo];
        v80 = [v79 objectForKeyedSubscript:@"AMSServerErrorCode"];

        if (v80 && [v80 isEqualToNumber:&off_10054C318])
        {
          uint64_t v81 = ASDErrorWithDescription();
        }
        else
        {
          uint64_t v81 = ASDErrorWithSafeUserInfo();
        }
        v55 = (__CFString *)v81;
      }
      else
      {
        v55 = 0;
      }
      goto LABEL_80;
    }
    v73 = +[NSDate date];
    [v73 timeIntervalSinceReferenceDate];
    double v75 = v74 - self->_startTime;

    if (self->_timeout - v75 <= 0.0)
    {
      ASDErrorWithTitleAndMessage();
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      goto LABEL_81;
    }
    id v127 = 0;
    v70 = objc_msgSend(v72, "resultWithTimeout:error:", &v127);
    id v76 = v127;
    if (!v76)
    {
      v55 = 0;
LABEL_80:

LABEL_81:
      if (v55) {
        goto LABEL_82;
      }
      v84 = [v70 object];
      v93 = [v84 objectForKeyedSubscript:@"subKeyBag"];

      if (!v93)
      {
        v108 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          v109 = self->_logKey;
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v109;
          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "[%@] Subscribed status unchanged due to sbKeyBag not in response", buf, 0xCu);
        }

        v55 = 0;
        self->_int64_t subscriptionStatus = self->_initialSubscriptionStatus;
        BOOL v56 = 1;
        goto LABEL_83;
      }
      v118 = [v84 objectForKeyedSubscript:@"subKeyBag"];
      id v94 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v118 options:0];
      v95 = [(ACAccount *)self->_account ams_DSID];
      v96 = self->_logKey;
      id v125 = v95;
      v97 = v96;
      id v98 = v94;
      uint64_t v114 = self;
      v99 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v97;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "[%@] Importing sbKeyBag", buf, 0xCu);
      }
      v117 = v97;

      v100 = +[AMSKeybag sharedInstance];
      *(void *)buf = 0;
      [v100 fairplayContextWithError:buf];
      id v101 = *(id *)buf;

      v116 = v101;
      v102 = ASDErrorWithSafeUserInfo();
      uint64_t v132 = 0;
      LODWORD(v130) = 0;
      id v103 = v98;
      [v103 bytes];
      [v103 length];

      sub_100186434();
      if (v104)
      {
        v105 = +[NSString stringWithFormat:@"Failed to import sbsync data. Fairplay error status: %d", v104];
        uint64_t v106 = ASDErrorWithTitleAndMessage();

        int64_t v115 = 0;
        v102 = (void *)v106;
      }
      else
      {
        if (!v132)
        {
          int64_t v115 = 0;
          goto LABEL_103;
        }
        v105 = sub_1002CEEB0(v114, v132, v130);
        int64_t v115 = sub_1002CEA58((uint64_t)SbsyncTask, v125, v105);
        sub_1001F4F90(v132);
      }

LABEL_103:
      id v110 = v102;
      BOOL v56 = v110 == 0;

      v55 = (__CFString *)v110;
      if (!v110) {
        self->_int64_t subscriptionStatus = v115;
      }
      v111 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        v112 = self->_logKey;
        int64_t subscriptionStatus = self->_subscriptionStatus;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v112;
        __int16 v134 = 2048;
        v135 = (__CFString *)subscriptionStatus;
        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "[%@] Subscribed status updated to: %ld", buf, 0x16u);
      }

      goto LABEL_83;
    }
    if (ASDErrorIsEqual())
    {
      v77 = ASDErrorWithUnderlyingErrorAndDescription();
    }
    else
    {
      v82 = [v76 userInfo];
      v77 = [v82 objectForKeyedSubscript:@"AMSServerErrorCode"];

      if (!v77 || ![v77 isEqualToNumber:&off_10054C318])
      {
        uint64_t v83 = ASDErrorWithSafeUserInfo();
LABEL_79:
        v55 = (__CFString *)v83;

        goto LABEL_80;
      }
    }
    uint64_t v83 = ASDErrorWithDescription();
    goto LABEL_79;
  }
  v70 = 0;
LABEL_82:
  v84 = 0;
  BOOL v56 = 0;
LABEL_83:

  v57 = v122;
LABEL_84:
  v85 = +[NSDate date];
  [v85 timeIntervalSinceReferenceDate];
  double v87 = v86 - self->_startTime;

  v88 = ASDLogHandleForCategory();
  v89 = v88;
  if (v56)
  {
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      v90 = self->_logKey;
      int64_t v91 = self->_subscriptionStatus;
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v90;
      __int16 v134 = 2048;
      v135 = (__CFString *)v91;
      __int16 v136 = 2048;
      double v137 = v87;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "[%@] Successfully completed with subscription status: %ld time: %f", buf, 0x20u);
    }

    notify_post("com.apple.appstored.ASDArcadeSubscriptionBagUpdatedNotification");
  }
  else
  {
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      v107 = self->_logKey;
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v107;
      __int16 v134 = 2114;
      v135 = v55;
      __int16 v136 = 2048;
      double v137 = v87;
      _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "[%@] Encountered error: %{public}@ time: %f", buf, 0x20u);
    }
  }
  objc_setProperty_atomic_copy(self, v92, v55, 32);
  self->super._success = v56;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = off_10050F1A0;
  if (self)
  {
    self->_displayingDialog = 1;
    if (self->_userInitiated) {
      v14 = &off_10050ED90;
    }
  }
  id v15 = objc_alloc_init(*v14);
  v16 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      logKey = self->_logKey;
    }
    else {
      logKey = 0;
    }
    *(_DWORD *)buf = 138412546;
    v22 = logKey;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%@] Presenting dialog request: %{public}@", buf, 0x16u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002CED78;
  v19[3] = &unk_100524170;
  v19[4] = self;
  id v20 = v13;
  id v18 = v13;
  [v15 presentDialogRequest:v12 resultHandler:v19];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_subscriptionDuration, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end