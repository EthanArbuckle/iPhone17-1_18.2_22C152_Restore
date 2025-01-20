@interface AMSDBiometricsTokenUpdateTask
+ (AMSThreadSafeDictionary)lockUptimeDictionary;
+ (id)confirmationDialogRequestForBiometricsType:(int64_t)a3 clientInfo:(id)a4 acceptActionIdentifier:(id *)a5 declineActionIdentifier:(id *)a6;
- (ACAccount)account;
- (AMSDBiometricsTokenUpdateTask)initWithAccount:(id)a3;
- (AMSProcessInfo)clientInfo;
- (AMSSecurityClientInterface)delegate;
- (AMSURLSession)session;
- (BOOL)_canAttemptTokenUpdate:(id *)a3;
- (BOOL)_isSupported:(id *)a3;
- (BOOL)_isSupportedMediaType:(id)a3;
- (BOOL)_performPasscodeDialogOperationWithError:(id *)a3;
- (BOOL)_presentConfirmation:(id *)a3 currentBiometricsState:(int64_t *)a4;
- (BOOL)_runConfirmationDialogWithError:(id *)a3;
- (BOOL)_shouldCreateCertsWithOption:(id)a3 forCerts:(id)a4;
- (BOOL)_updateTokens:(id *)a3 currentBiometricsState:(int64_t *)a4;
- (BOOL)isUserInitiated;
- (BOOL)shouldGenerateKeysOnly;
- (BOOL)shouldRequestConfirmation;
- (NSDictionary)additionalDialogMetrics;
- (id)_buildRequestBodyWithStyle:(unint64_t)a3 primaryCerts:(id)a4 extendedCerts:(id)a5;
- (id)_buildRequestWithBody:(id)a3 bag:(id)a4;
- (id)_handleDialogRequest:(id)a3;
- (id)_keychainOptionWithPurpose:(unint64_t)a3 style:(unint64_t)a4 regenerate:(BOOL)a5;
- (id)_lookupAttestationForOption:(id)a3;
- (id)performUpdate;
- (int64_t)_runUpdateRequestWithStyle:(unint64_t)a3 primaryCerts:(id)a4 extendedCerts:(id)a5 error:(id *)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)setAdditionalDialogMetrics:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSession:(id)a3;
- (void)setShouldGenerateKeysOnly:(BOOL)a3;
- (void)setShouldRequestConfirmation:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation AMSDBiometricsTokenUpdateTask

- (AMSDBiometricsTokenUpdateTask)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDBiometricsTokenUpdateTask;
  v6 = [(AMSDBiometricsTokenUpdateTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

+ (id)confirmationDialogRequestForBiometricsType:(int64_t)a3 clientInfo:(id)a4 acceptActionIdentifier:(id *)a5 declineActionIdentifier:(id *)a6
{
  objc_super v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"TOUCHID_CONFIRMATION_DIALOG_OPT_IN_IOS" value:&stru_100117BD0 table:0];
  v11 = +[AMSDialogAction actionWithTitle:v10];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"TOUCHID_CONFIRMATION_DIALOG_OPT_OUT" value:&stru_100117BD0 table:0];
  v14 = +[AMSDialogAction actionWithTitle:v13];

  if (a3 == 3)
  {
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = v15;
    CFStringRef v17 = @"FACEID_CONFIRMATION_DIALOG_TITLE_IOS";
  }
  else
  {
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = v15;
    if (a3 == 7) {
      CFStringRef v17 = @"OPTICID_CONFIRMATION_DIALOG_TITLE_VISIONOS";
    }
    else {
      CFStringRef v17 = @"TOUCHID_CONFIRMATION_DIALOG_TITLE_IOS";
    }
  }
  v18 = [v15 localizedStringForKey:v17 value:&stru_100117BD0 table:0];

  id v19 = [objc_alloc((Class)AMSDialogRequest) initWithTitle:v18 message:0];
  v22[0] = v11;
  v22[1] = v14;
  v20 = +[NSArray arrayWithObjects:v22 count:2];
  [v19 setButtonActions:v20];

  if (a5)
  {
    *a5 = [v11 identifier];
  }
  if (a6)
  {
    *a6 = [v14 identifier];
  }

  return v19;
}

- (id)performUpdate
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B3FC;
  v4[3] = &unk_100112020;
  v4[4] = self;
  v2 = [(AMSDBiometricsTokenUpdateTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

- (BOOL)_presentConfirmation:(id *)a3 currentBiometricsState:(int64_t *)a4
{
  if (![(AMSDBiometricsTokenUpdateTask *)self shouldRequestConfirmation]) {
    return 0;
  }
  id v16 = 0;
  unsigned __int8 v7 = [(AMSDBiometricsTokenUpdateTask *)self _runConfirmationDialogWithError:&v16];
  id v8 = v16;
  objc_super v9 = v8;
  if ((v7 & 1) == 0)
  {
    if ([v8 code] != (id)6) {
      goto LABEL_10;
    }
    int64_t v13 = 2;
LABEL_9:
    *a4 = v13;
    +[AMSDefaults setDeviceBiometricsState:](AMSDefaults, "setDeviceBiometricsState:");
    goto LABEL_10;
  }
  id v15 = v8;
  unsigned __int8 v10 = [(AMSDBiometricsTokenUpdateTask *)self _performPasscodeDialogOperationWithError:&v15];
  id v11 = v15;

  if ((v10 & 1) == 0)
  {
    int64_t v13 = 0;
    objc_super v9 = v11;
    goto LABEL_9;
  }
  objc_super v9 = v11;
LABEL_10:
  if (a3) {
    *a3 = v9;
  }
  BOOL v12 = v9 == 0;

  return v12;
}

- (id)_keychainOptionWithPurpose:(unint64_t)a3 style:(unint64_t)a4 regenerate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = objc_alloc_init((Class)AMSKeychainOptions);
  [v8 setStyle:a4];
  [v8 setPurpose:a3];
  [v8 setRegenerateKeys:v5];
  return v8;
}

- (id)_lookupAttestationForOption:(id)a3
{
  id v3 = a3;
  if ([v3 regenerateKeys])
  {
    v4 = 0;
  }
  else
  {
    unint64_t v5 = (unint64_t)[v3 style];
    if (v5 > 5)
    {
      id v6 = 0;
      v4 = 0;
    }
    else
    {
      if (((1 << v5) & 0x39) != 0)
      {
        id v19 = 0;
        v4 = +[AMSKeychain certificateChainStringsForOptions:v3 error:&v19];
        id v6 = v19;
        unsigned __int8 v7 = +[AMSLogConfig sharedBiometricsConfig];
        if (!v7)
        {
          unsigned __int8 v7 = +[AMSLogConfig sharedConfig];
        }
        id v8 = [v7 OSLogObject];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v9 = objc_opt_class();
          id v10 = v9;
          id v11 = AMSLogKey();
          id v12 = [v4 count];
          *(_DWORD *)buf = 138544130;
          v21 = v9;
          __int16 v22 = 2114;
          v23 = v11;
          __int16 v24 = 2050;
          id v25 = v12;
          __int16 v26 = 2114;
          id v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found %{public}ld certs in chain (primary), error: %{public}@", buf, 0x2Au);
        }
      }
      else
      {
        id v18 = 0;
        v4 = +[AMSAttestation attestationWithOptions:v3 error:&v18];
        id v6 = v18;
        unsigned __int8 v7 = +[AMSLogConfig sharedBiometricsConfig];
        if (!v7)
        {
          unsigned __int8 v7 = +[AMSLogConfig sharedConfig];
        }
        id v8 = [v7 OSLogObject];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v13 = objc_opt_class();
          id v14 = v13;
          id v15 = AMSLogKey();
          id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
          *(_DWORD *)buf = 138544130;
          v21 = v13;
          __int16 v22 = 2114;
          v23 = v15;
          __int16 v24 = 2114;
          id v25 = v16;
          __int16 v26 = 2114;
          id v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did fetch attestation: %{public}@, error: %{public}@", buf, 0x2Au);
        }
      }
    }
  }

  return v4;
}

- (BOOL)_shouldCreateCertsWithOption:(id)a3 forCerts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = ![v5 style] && objc_msgSend(v6, "count") != (id)2
    || [v5 style] == (id)3 && objc_msgSend(v6, "count") != (id)2
    || [v5 style] == (id)4 && objc_msgSend(v6, "count") != (id)2
    || [v5 style] == (id)5 && objc_msgSend(v6, "count") != (id)2
    || [v5 style] == (id)1 && objc_msgSend(v6, "count") != (id)1
    || [v5 style] == (id)2 && objc_msgSend(v6, "count") != (id)1;

  return v7;
}

- (BOOL)_updateTokens:(id *)a3 currentBiometricsState:(int64_t *)a4
{
  id v5 = +[AMSKeychainOptions preferredAttestationStyle];
  char v6 = 1;
  BOOL v7 = [(AMSDBiometricsTokenUpdateTask *)self _keychainOptionWithPurpose:0 style:v5 regenerate:1];
  id v48 = v5;
  v52 = [(AMSDBiometricsTokenUpdateTask *)self _keychainOptionWithPurpose:1 style:v5 regenerate:1];
  id v8 = 0;
  objc_super v9 = &swift_willThrow_ptr;
  v49 = v7;
  while (1)
  {
    char v10 = v6;
    id v11 = [(AMSDBiometricsTokenUpdateTask *)self _lookupAttestationForOption:v7];
    char v50 = v10;
    if ([(AMSDBiometricsTokenUpdateTask *)self _shouldCreateCertsWithOption:v7 forCerts:v11])
    {
      id v12 = [v9[175] sharedBiometricsConfig];
      if (!v12)
      {
        id v12 = [v9[175] sharedConfig];
      }
      int64_t v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = objc_opt_class();
        id v15 = v14;
        id v16 = AMSLogKey();
        id v17 = [v49 style];
        *(_DWORD *)buf = 138543874;
        v57 = v14;
        __int16 v58 = 2114;
        v59 = v16;
        __int16 v60 = 2048;
        id v61 = v17;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating attestation tokens (primary) for style: %ld", buf, 0x20u);
      }
      id v55 = v8;
      BOOL v7 = v49;
      v51 = +[AMSAttestation attestationWithOptions:v49 error:&v55];
      id v18 = v55;

      id v19 = [v9[175] sharedBiometricsConfig];
      if (!v19)
      {
        id v19 = [v9[175] sharedConfig];
      }
      v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_opt_class();
        id v22 = v21;
        v23 = AMSLogKey();
        id v24 = [v51 count];
        id v25 = [v49 style];
        *(_DWORD *)buf = 138544386;
        v57 = v21;
        __int16 v58 = 2114;
        v59 = v23;
        __int16 v60 = 2048;
        id v61 = v24;
        objc_super v9 = &swift_willThrow_ptr;
        __int16 v62 = 2048;
        id v63 = v25;
        __int16 v64 = 2114;
        id v65 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished creating attestation tokens (primary). Count: %ld, Style: %ld, error: %{public}@", buf, 0x34u);
      }
    }
    else
    {
      v51 = v11;
      id v18 = v8;
    }
    id v54 = v18;
    __int16 v26 = +[AMSAttestation attestationWithOptions:v52 error:&v54];
    id v8 = v54;

    id v27 = [v9[175] sharedBiometricsConfig];
    if (!v27)
    {
      id v27 = [v9[175] sharedConfig];
    }
    v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_opt_class();
      id v30 = v29;
      v31 = AMSSetLogKeyIfNeeded();
      v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 count]);
      v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v52 style]);
      *(_DWORD *)buf = 138544386;
      v57 = v29;
      objc_super v9 = &swift_willThrow_ptr;
      __int16 v58 = 2114;
      v59 = v31;
      __int16 v60 = 2114;
      id v61 = v32;
      __int16 v62 = 2114;
      id v63 = v33;
      __int16 v64 = 2114;
      id v65 = v8;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished creating attestation tokens (extended). Count: %{public}@, Style: %{public}@, error: %{public}@", buf, 0x34u);

      BOOL v7 = v49;
    }

    if (v8 || [(AMSDBiometricsTokenUpdateTask *)self shouldGenerateKeysOnly]) {
      break;
    }
    v34 = [v9[175] sharedBiometricsConfig];
    if (!v34)
    {
      v34 = [v9[175] sharedConfig];
    }
    v35 = [v34 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = objc_opt_class();
      id v37 = v36;
      v38 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      v57 = v36;
      __int16 v58 = 2114;
      v59 = v38;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running update request", buf, 0x16u);

      objc_super v9 = &swift_willThrow_ptr;
    }

    id v53 = 0;
    v39 = v51;
    int64_t v40 = [(AMSDBiometricsTokenUpdateTask *)self _runUpdateRequestWithStyle:v48 primaryCerts:v51 extendedCerts:v26 error:&v53];
    id v8 = v53;
    if (v40 != 498) {
      goto LABEL_33;
    }
    [v7 setRegenerateKeys:1];
    [v52 setRegenerateKeys:1];

    char v6 = 0;
    if ((v50 & 1) == 0) {
      goto LABEL_34;
    }
  }
  if ([(AMSDBiometricsTokenUpdateTask *)self shouldGenerateKeysOnly])
  {
    v41 = [v9[175] sharedBiometricsConfig];
    v39 = v51;
    if (!v41)
    {
      v41 = [v9[175] sharedConfig];
    }
    v42 = [v41 OSLogObject];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_opt_class();
      id v44 = v43;
      v45 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      v57 = v43;
      __int16 v58 = 2114;
      v59 = v45;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping attestation due to shouldGenerateKeysOnly being set", buf, 0x16u);
    }
  }
  else
  {
    v39 = v51;
  }
LABEL_33:

LABEL_34:
  if (a3) {
    *a3 = v8;
  }

  return v8 == 0;
}

- (BOOL)_isSupported:(id *)a3
{
  if (+[AMSBiometrics type]
    && +[AMSBiometrics type] != (id)1)
  {
    id v4 = 0;
    BOOL v5 = 1;
  }
  else
  {
    AMSError();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v4 = v4;
      BOOL v5 = 0;
      *a3 = v4;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_canAttemptTokenUpdate:(id *)a3
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100015A8C;
  id v25 = sub_100015A44;
  id v26 = 0;
  BOOL v5 = +[NSProcessInfo processInfo];
  [v5 systemUptime];
  uint64_t v7 = v6;

  id v8 = [(AMSDBiometricsTokenUpdateTask *)self account];
  objc_super v9 = [v8 identifier];

  char v10 = [(id)objc_opt_class() lockUptimeDictionary];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001CA70;
  v15[3] = &unk_100112048;
  id v11 = v9;
  uint64_t v20 = v7;
  id v16 = v11;
  id v17 = self;
  id v18 = &v27;
  id v19 = &v21;
  [v10 readWrite:v15];

  int v12 = *((unsigned __int8 *)v28 + 24);
  if (a3 && !*((unsigned char *)v28 + 24))
  {
    *a3 = (id) v22[5];
    int v12 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v13;
}

- (BOOL)_runConfirmationDialogWithError:(id *)a3
{
  BOOL v5 = objc_opt_class();
  id v6 = +[AMSBiometrics type];
  uint64_t v7 = [(AMSDBiometricsTokenUpdateTask *)self clientInfo];
  id v36 = 0;
  id v37 = 0;
  id v8 = [v5 confirmationDialogRequestForBiometricsType:v6 clientInfo:v7 acceptActionIdentifier:&v37 declineActionIdentifier:&v36];
  id v9 = v37;
  id v10 = v36;

  id v11 = [(AMSDBiometricsTokenUpdateTask *)self _handleDialogRequest:v8];
  id v35 = 0;
  int v12 = [v11 resultWithError:&v35];
  id v13 = v35;

  id v14 = [v12 selectedActionIdentifier];
  unsigned int v15 = [v14 isEqualToString:v9];

  if (v15)
  {
    id v16 = +[AMSLogConfig sharedBiometricsConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = a3;
      id v19 = objc_opt_class();
      id v31 = v19;
      AMSLogKey();
      v33 = v8;
      id v20 = v9;
      id v22 = v21 = v10;
      *(_DWORD *)buf = 138543618;
      v39 = v19;
      a3 = v18;
      __int16 v40 = 2114;
      v41 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Biometrics confirmation dialog accepted", buf, 0x16u);

      id v10 = v21;
      id v9 = v20;
      id v8 = v33;
    }
  }
  else
  {
    uint64_t v23 = [v12 selectedActionIdentifier];
    id v34 = v10;
    unsigned int v24 = [v23 isEqualToString:v10];

    if (v24)
    {
      id v25 = +[AMSLogConfig sharedBiometricsConfig];
      if (!v25)
      {
        id v25 = +[AMSLogConfig sharedConfig];
      }
      id v26 = [v25 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = objc_opt_class();
        id v32 = v27;
        AMSLogKey();
        uint64_t v29 = v28 = a3;
        *(_DWORD *)buf = 138543618;
        v39 = v27;
        __int16 v40 = 2114;
        v41 = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Biometrics confirmation dialog declined", buf, 0x16u);

        a3 = v28;
      }
    }
    AMSError();
    id v16 = v13;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v34;
  }

  [(AMSDBiometricsTokenUpdateTask *)self _sendMetricsForDialog];
  if (a3) {
    *a3 = v13;
  }

  return v13 == 0;
}

- (BOOL)_performPasscodeDialogOperationWithError:(id *)a3
{
  id v4 = objc_alloc_init(AMSDVerifyDevicePasscodeTask);
  BOOL v5 = [(AMSDVerifyDevicePasscodeTask *)v4 verifyPasscode];
  id v13 = 0;
  unsigned __int8 v6 = [v5 resultWithError:&v13];
  id v7 = v13;
  if (v7)
  {
    id v8 = +[AMSLogConfig sharedBiometricsConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v11;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Passcode operation failed with error: %{public}@", buf, 0x20u);
    }
  }
  if (a3) {
    *a3 = v7;
  }

  return v6;
}

- (id)_buildRequestBodyWithStyle:(unint64_t)a3 primaryCerts:(id)a4 extendedCerts:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v10 = v9;
  if (a3 - 1 > 1)
  {
    if (v7) {
      [v9 setObject:v7 forKeyedSubscript:@"primaryX509Chain"];
    }
    if (v8) {
      [v10 setObject:v8 forKeyedSubscript:@"extendedX509Chain"];
    }
  }
  else
  {
    if ([v7 count])
    {
      id v11 = [v7 objectAtIndexedSubscript:0];
      [v10 setObject:v11 forKeyedSubscript:@"touchIdAttestation"];
    }
    if ([v8 count])
    {
      int v12 = [v8 objectAtIndexedSubscript:0];
      [v10 setObject:v12 forKeyedSubscript:@"extendedAttestation"];
    }
  }

  return v10;
}

- (id)_buildRequestWithBody:(id)a3 bag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMSDBiometricsTokenUpdateTask *)self clientInfo];
  if (!v8)
  {
    id v8 = +[AMSProcessInfo currentProcess];
    [v8 setAccountMediaType:AMSAccountMediaTypeProduction];
  }
  id v9 = [objc_alloc((Class)AMSURLRequestEncoder) initWithBag:v6];
  uint64_t v10 = [(AMSDBiometricsTokenUpdateTask *)self account];
  [v9 setAccount:v10];

  [v9 setClientInfo:v8];
  [v9 setRequestEncoding:2];
  id v11 = [v6 URLForKey:@"update-touch-id-settings"];

  int v12 = [v9 requestWithMethod:4 bagURL:v11 parameters:v7];

  return v12;
}

- (BOOL)_isSupportedMediaType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AMSAccountMediaTypeAppStoreSandbox]) {
    LOBYTE(v4) = 0;
  }
  else {
    unsigned int v4 = [v3 isEqualToString:AMSAccountMediaTypeAppStoreBeta] ^ 1;
  }

  return v4;
}

- (int64_t)_runUpdateRequestWithStyle:(unint64_t)a3 primaryCerts:(id)a4 extendedCerts:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  int v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_opt_class();
    id v14 = v13;
    uint64_t v15 = AMSLogKey();
    *(_DWORD *)buf = 138544130;
    v38 = v13;
    __int16 v39 = 2114;
    __int16 v40 = v15;
    __int16 v41 = 2048;
    id v42 = [v9 count];
    __int16 v43 = 2048;
    id v44 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running update task. (primaryCount: %ld, extendedCount: %ld)", buf, 0x2Au);
  }
  __int16 v16 = +[AMSProcessInfo currentProcess];
  id v17 = [v16 accountMediaType];

  if ([(AMSDBiometricsTokenUpdateTask *)self _isSupportedMediaType:v17])
  {
    id v33 = v9;
    __int16 v18 = [(AMSDBiometricsTokenUpdateTask *)self _buildRequestBodyWithStyle:a3 primaryCerts:v9 extendedCerts:v10];
    id v19 = +[AMSDBag defaultBag];
    id v20 = [(AMSDBiometricsTokenUpdateTask *)self _buildRequestWithBody:v18 bag:v19];

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001DA20;
    v36[3] = &unk_100112070;
    v36[4] = self;
    id v21 = [v20 thenWithBlock:v36];
    id v35 = 0;
    id v22 = [v21 resultWithError:&v35];
    id v23 = v35;
    unsigned int v24 = [(AMSDBiometricsTokenUpdateTask *)self session];
    [v24 invalidateAndCancel];

    if (v23)
    {
      id v25 = 0;
    }
    else
    {
      uint64_t v29 = [v22 object];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v30 = v29;
      }
      else {
        id v30 = 0;
      }

      id v31 = [v30 objectForKeyedSubscript:@"status"];
      if (objc_opt_respondsToSelector())
      {
        id v25 = [v31 integerValue];
        id v23 = 0;
      }
      else
      {
        AMSError();
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        id v25 = 0;
      }
    }
    if (a6) {
      *a6 = v23;
    }

    id v9 = v33;
  }
  else
  {
    __int16 v18 = +[AMSLogConfig sharedBiometricsConfig];
    if (!v18)
    {
      __int16 v18 = +[AMSLogConfig sharedConfig];
    }
    id v20 = [v18 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = objc_opt_class();
      id v27 = v26;
      v28 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      v38 = v26;
      __int16 v39 = 2114;
      __int16 v40 = v28;
      __int16 v41 = 2114;
      id v42 = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometrics task for media type. processMediaType = %{public}@", buf, 0x20u);
    }
    id v25 = 0;
  }

  return (int64_t)v25;
}

- (id)_handleDialogRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AMSMutablePromise);
  id v6 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    __int16 v18 = v8;
    __int16 v19 = 2114;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Informing delegate about dialog request. Request: %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  id v11 = [(AMSDBiometricsTokenUpdateTask *)self delegate];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001DD68;
  v14[3] = &unk_100112098;
  objc_copyWeak(&v16, (id *)buf);
  id v12 = v5;
  id v15 = v12;
  [v11 handleDialogRequest:v4 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

  return v12;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v23 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v13)
  {
    id v13 = +[AMSLogConfig sharedConfig];
  }
  id v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_opt_class();
    id v16 = v15;
    id v17 = AMSLogKey();
    __int16 v18 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    v28 = v15;
    __int16 v29 = 2114;
    id v30 = v17;
    __int16 v31 = 2114;
    id v32 = v18;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Informing delegate about authenticate request. Request: %{public}@", buf, 0x20u);
  }
  __int16 v19 = [(AMSDBiometricsTokenUpdateTask *)self delegate];
  BOOL v20 = v19 == 0;

  if (v20)
  {
    id v22 = AMSError();
    v12[2](v12, 0, v22);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    __int16 v21 = [(AMSDBiometricsTokenUpdateTask *)self delegate];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001E190;
    v24[3] = &unk_1001120C0;
    objc_copyWeak(&v26, (id *)buf);
    id v25 = v12;
    [v21 handleAuthenticateRequest:v11 completion:v24];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = [(AMSDBiometricsTokenUpdateTask *)self _handleDialogRequest:a5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001E3F4;
  v11[3] = &unk_1001120E8;
  id v12 = v8;
  id v10 = v8;
  [v9 addFinishBlock:v11];
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)additionalDialogMetrics
{
  return self->_additionalDialogMetrics;
}

- (void)setAdditionalDialogMetrics:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (AMSSecurityClientInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSSecurityClientInterface *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldGenerateKeysOnly
{
  return self->_shouldGenerateKeysOnly;
}

- (void)setShouldGenerateKeysOnly:(BOOL)a3
{
  self->_shouldGenerateKeysOnly = a3;
}

- (BOOL)shouldRequestConfirmation
{
  return self->_shouldRequestConfirmation;
}

- (void)setShouldRequestConfirmation:(BOOL)a3
{
  self->_shouldRequestConfirmation = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_additionalDialogMetrics, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (AMSThreadSafeDictionary)lockUptimeDictionary
{
  if (qword_100130260 != -1) {
    dispatch_once(&qword_100130260, &stru_100112128);
  }
  v2 = (void *)qword_100130268;
  return (AMSThreadSafeDictionary *)v2;
}

@end