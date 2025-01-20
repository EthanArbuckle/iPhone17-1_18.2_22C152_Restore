@interface AMSDSecurityService
+ (BOOL)isConnectionEntitled:(id)a3;
+ (OS_dispatch_queue)sharedPerformQueue;
- (AMSSecurityClientInterface)delegate;
- (BOOL)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 error:(id *)a6;
- (void)_absintheHeadersForRequest:(id)a3 bag:(id)a4 buyParams:(id)a5 completion:(id)a6;
- (void)deleteAllKeysWithCompletion:(id)a3;
- (void)handleResponse:(id)a3 completion:(id)a4;
- (void)hasKeysForAccount:(id)a3 forSignaturePurpose:(unint64_t)a4 completion:(id)a5;
- (void)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 completion:(id)a6;
- (void)isBiometricsAvailableForAccount:(id)a3 completion:(id)a4;
- (void)isDeviceInBiometricLockoutWithCompletion:(id)a3;
- (void)isIdentityMapValidWithCompletion:(id)a3;
- (void)paymentServicesMerchantURLWithCompletion:(id)a3;
- (void)performBiometricTokenUpdateWithAccount:(id)a3 clientInfo:(id)a4 additionalDialogMetrics:(id)a5 shouldGenerateKeysOnly:(BOOL)a6 shouldRequestConfirmation:(BOOL)a7 userInitiated:(BOOL)a8 completion:(id)a9;
- (void)performClientCertChainRequestWithOptions:(id)a3 completion:(id)a4;
- (void)performDevicePasscodeVerificationWithCompletion:(id)a3;
- (void)performSilentEnrollmentWithRequest:(id)a3 logKey:(id)a4 completion:(id)a5;
- (void)saveIdentityMapWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shouldAttemptApplePayWithAccount:(id)a3 options:(id)a4 countryCode:(id)a5 paymentNetworks:(id)a6 completion:(id)a7;
- (void)shouldAttemptApplePayWithCountryCode:(id)a3 paymentNetworks:(id)a4 completion:(id)a5;
- (void)signChallengeForRequest:(id)a3 completion:(id)a4;
- (void)signedHeadersForRequest:(id)a3 buyParams:(id)a4 completion:(id)a5;
@end

@implementation AMSDSecurityService

+ (OS_dispatch_queue)sharedPerformQueue
{
  if (qword_1001304C8 != -1) {
    dispatch_once(&qword_1001304C8, &stru_100114278);
  }
  v2 = (void *)qword_1001304D0;
  return (OS_dispatch_queue *)v2;
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.applemediaservices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned __int8 v5 = [v4 BOOLValue];
  return v5;
}

- (void)performClientCertChainRequestWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[AMSDClientCertificateTask alloc] initWithOptions:v6];

  v8 = [(AMSDClientCertificateTask *)v7 performClientCertChainRequest];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005A690;
  v10[3] = &unk_1001142A0;
  id v11 = v5;
  id v9 = v5;
  [v8 addFinishBlock:v10];
}

- (void)isIdentityMapValidWithCompletion:(id)a3
{
  id v5 = a3;
  id v3 = +[AMSBiometrics isIdentityMapValid];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, id, void))v5 + 2))(v5, v3, 0);
    id v4 = v5;
  }
}

- (void)saveIdentityMapWithCompletion:(id)a3
{
  id v4 = a3;
  +[AMSBiometrics saveIdentityMap];
  id v3 = v4;
  if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    id v3 = v4;
  }
}

- (BOOL)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = AMSSetLogKeyIfNeeded();
  id v25 = 0;
  id v12 = +[AMSKeychain copyAccessControlRefWithAccount:v10 options:v9 error:&v25];

  id v13 = v25;
  if (v13)
  {
    v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v27 = v16;
      __int16 v28 = 2114;
      v29 = v11;
      __int16 v30 = 2114;
      id v31 = v13;
      id v17 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL copy failed with error: %{public}@", buf, 0x20u);
    }
    unsigned __int8 v18 = 0;
    if (a6) {
      *a6 = v13;
    }
  }
  else
  {
    unsigned __int8 v18 = +[AMSBiometrics isActionSupported:a3 withAccessControl:v12];
    if ((v18 & 1) == 0)
    {
      v19 = +[AMSBiometrics ACLVersionForAccessControl:v12];
      v20 = +[AMSLogConfig sharedConfig];
      if (!v20)
      {
        v20 = +[AMSLogConfig sharedConfig];
      }
      v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v27 = v22;
        __int16 v28 = 2114;
        v29 = v11;
        __int16 v30 = 2114;
        id v31 = v19;
        id v23 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric/ACL check for bad ACL version: %{public}@", buf, 0x20u);
      }
    }
    if (v12) {
      CFRelease(v12);
    }
  }

  return v18;
}

- (void)hasKeysForAccount:(id)a3 forSignaturePurpose:(unint64_t)a4 completion:(id)a5
{
  v7 = (void (**)(id, id, id))a5;
  id v10 = 0;
  id v8 = +[AMSBiometrics hasKeysForAccount:a3 forSignaturePurpose:a4 withError:&v10];
  id v9 = v10;
  if (v7) {
    v7[2](v7, v8, v9);
  }
}

- (void)isDeviceInBiometricLockoutWithCompletion:(id)a3
{
  id v5 = a3;
  id v3 = +[AMSBiometrics isDeviceInBiometricLockout];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v3);
    id v4 = v5;
  }
}

- (void)deleteAllKeysWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id, void *))a3;
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = AMSLogKey();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v7)
    {
      AMSLogKey();
      self = (AMSDSecurityService *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:@"%@: [%@] ", v9, self];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v8];
    id v10 = };
    *(_DWORD *)buf = 138543362;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Requested to delete all biometrics keys.", buf, 0xCu);
    if (v7)
    {

      id v10 = self;
    }
  }
  id v15 = 0;
  id v11 = +[AMSBiometrics deleteAllKeysWithError:&v15];
  id v12 = v15;
  id v13 = v12;
  if (v4)
  {
    v14 = objc_msgSend(v12, "ams_sanitizedForSecureCoding");
    v4[2](v4, v11, v14);
  }
}

- (void)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, BOOL, NSObject *))a6;
  id v13 = AMSSetLogKeyIfNeeded();
  v14 = +[AMSLogConfig sharedConfig];
  if (!v14)
  {
    v14 = +[AMSLogConfig sharedConfig];
  }
  id v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v13;
    uint64_t v17 = objc_opt_class();
    unsigned __int8 v18 = +[NSNumber numberWithInteger:a3];
    AMSHashIfNeeded();
    v19 = id v28 = v10;
    AMSHashIfNeeded();
    v27 = v12;
    int64_t v20 = a3;
    v22 = v21 = self;
    *(_DWORD *)buf = 138544386;
    uint64_t v31 = v17;
    id v13 = v16;
    __int16 v32 = 2114;
    v33 = v16;
    __int16 v34 = 2114;
    v35 = v18;
    __int16 v36 = 2114;
    v37 = v19;
    __int16 v38 = 2114;
    v39 = v22;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking auto enrollment for action type = %{public}@ | account = %{public}@ | options = %{public}@", buf, 0x34u);

    self = v21;
    a3 = v20;
    id v12 = v27;

    id v10 = v28;
  }

  if (v12)
  {
    id v29 = 0;
    BOOL v23 = [(AMSDSecurityService *)self isActionSupportedForType:a3 account:v10 options:v11 error:&v29];
    id v24 = v29;
    id v25 = objc_msgSend(v24, "ams_sanitizedForSecureCoding");
    v12[2](v12, v23, v25);
  }
  else
  {
    id v24 = +[AMSLogConfig sharedConfig];
    if (!v24)
    {
      id v24 = +[AMSLogConfig sharedConfig];
    }
    id v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v26;
      __int16 v32 = 2114;
      v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Checking auto enrollment for action type failed for no completion handler", buf, 0x16u);
    }
  }
}

- (void)isBiometricsAvailableForAccount:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v5 = +[AMSBiometrics isAvailableForAccount:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v5, 0);
    id v6 = v7;
  }
}

- (void)performBiometricTokenUpdateWithAccount:(id)a3 clientInfo:(id)a4 additionalDialogMetrics:(id)a5 shouldGenerateKeysOnly:(BOOL)a6 shouldRequestConfirmation:(BOOL)a7 userInitiated:(BOOL)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  v19 = [(id)objc_opt_class() sharedPerformQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005B198;
  v24[3] = &unk_1001142C8;
  v24[4] = self;
  id v25 = v15;
  id v26 = v17;
  id v27 = v16;
  BOOL v29 = a6;
  BOOL v30 = a7;
  BOOL v31 = a8;
  id v28 = v18;
  id v20 = v18;
  id v21 = v16;
  id v22 = v17;
  id v23 = v15;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.biometrics" withQueue:v19 whilePerformingBlock:v24];
}

- (void)performDevicePasscodeVerificationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() sharedPerformQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B6AC;
  v7[3] = &unk_100112600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.devicepasscode" withQueue:v5 whilePerformingBlock:v7];
}

- (void)paymentServicesMerchantURLWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = AMSSetLogKeyIfNeeded();
  if (v5)
  {
    objc_initWeak((id *)location, self);
    id v7 = objc_alloc((Class)AMSMutableLazyPromise);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005BD40;
    v18[3] = &unk_100114340;
    objc_copyWeak(v20, (id *)location);
    id v19 = v6;
    v20[1] = (id)a2;
    id v8 = [v7 initWithBlock:v18];
    id v17 = 0;
    uint64_t v9 = [v8 resultWithError:&v17];
    id v10 = v17;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005C7A8;
    v14[3] = &unk_100114368;
    id v16 = v5;
    id v11 = v9;
    id v15 = v11;
    [v8 addFinishBlock:v14];

    objc_destroyWeak(v20);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = objc_opt_class();
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [apple-pay-classic] Merchant URL lookup failed for no completion handler", location, 0x16u);
    }
  }
}

- (void)shouldAttemptApplePayWithAccount:(id)a3 options:(id)a4 countryCode:(id)a5 paymentNetworks:(id)a6 completion:(id)a7
{
  id v39 = a3;
  id v40 = a4;
  id v36 = a5;
  id v37 = a6;
  id v12 = (void (**)(id, void, void *))a7;
  __int16 v38 = AMSSetLogKeyIfNeeded();
  id v13 = +[AMSLogConfig sharedConfig];
  if (!v13)
  {
    id v13 = +[AMSLogConfig sharedConfig];
  }
  v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = NSStringFromSelector(a2);
    id v17 = AMSHashIfNeeded();
    id v18 = AMSHashIfNeeded();
    id v19 = AMSHashIfNeeded();
    id v20 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544898;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v38;
    *(_WORD *)&buf[22] = 2114;
    id v53 = v16;
    __int16 v54 = 2114;
    v55 = v17;
    __int16 v56 = 2114;
    v57 = v18;
    __int16 v58 = 2114;
    v59 = v19;
    __int16 v60 = 2114;
    v61 = v20;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] %{public}@ account = %{public}@ | options = %{public}@ | countryCode = %{public}@ | paymentNetworks = %{public}@", buf, 0x48u);
  }
  if (v12)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    id v53 = 0;
    id v45 = 0;
    id v21 = +[AMSKeychain copyAccessControlRefWithAccount:v39 options:v40 error:&v45];
    id v22 = v45;
    id v53 = v21;
    if (v22)
    {
      id v23 = +[AMSLogConfig sharedConfig];
      if (!v23)
      {
        id v23 = +[AMSLogConfig sharedConfig];
      }
      id v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = objc_opt_class();
        *(_DWORD *)v46 = 138543874;
        v47 = v25;
        __int16 v48 = 2114;
        v49 = v38;
        __int16 v50 = 2114;
        id v51 = v22;
        id v26 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [apple-pay-classic] ACL copy failed with error: %{public}@", v46, 0x20u);
      }
      id v27 = objc_msgSend(v22, "ams_sanitizedForSecureCoding");
      v12[2](v12, 0, v27);
    }
    else if (+[AMSBiometrics isActionSupported:4 withAccessControl:*(void *)(*(void *)&buf[8] + 24)])
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10005CDAC;
      v41[3] = &unk_100114390;
      v41[4] = self;
      id v42 = v38;
      v44 = buf;
      v43 = v12;
      [(AMSDSecurityService *)self shouldAttemptApplePayWithCountryCode:v36 paymentNetworks:v37 completion:v41];
    }
    else
    {
      BOOL v30 = +[AMSBiometrics ACLVersionForAccessControl:*(void *)(*(void *)&buf[8] + 24)];
      BOOL v31 = +[AMSLogConfig sharedConfig];
      if (!v31)
      {
        BOOL v31 = +[AMSLogConfig sharedConfig];
      }
      __int16 v32 = [v31 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_opt_class();
        *(_DWORD *)v46 = 138543874;
        v47 = v33;
        __int16 v48 = 2114;
        v49 = v38;
        __int16 v50 = 2114;
        id v51 = v30;
        id v34 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Skipping biometric/ACL check for bad ACL version: %{public}@", v46, 0x20u);
      }
      v12[2](v12, 0, 0);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      id v22 = +[AMSLogConfig sharedConfig];
    }
    id v28 = [v22 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v38;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [apple-pay-classic] Apple Pay Classic evaluation failed for no completion block", buf, 0x16u);
    }
  }
}

- (void)shouldAttemptApplePayWithCountryCode:(id)a3 paymentNetworks:(id)a4 completion:(id)a5
{
  id v25 = a3;
  id v26 = a4;
  uint64_t v9 = (void (**)(id, id, void *))a5;
  id v27 = AMSSetLogKeyIfNeeded();
  id v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    id v13 = NSStringFromSelector(a2);
    v14 = AMSHashIfNeeded();
    uint64_t v15 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544386;
    uint64_t v35 = v12;
    __int16 v36 = 2114;
    id v37 = v27;
    __int16 v38 = 2114;
    id v39 = v13;
    __int16 v40 = 2114;
    v41 = v14;
    __int16 v42 = 2114;
    v43 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] %{public}@ | countryCode = %{public}@ | paymentNetworks = %{public}@", buf, 0x34u);
  }
  if (v9)
  {
    objc_initWeak((id *)buf, self);
    id v16 = objc_alloc((Class)AMSMutableLazyPromise);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10005D394;
    v29[3] = &unk_1001143E0;
    objc_copyWeak(v33, (id *)buf);
    id v30 = v25;
    id v31 = v27;
    v33[1] = (id)a2;
    id v32 = v26;
    id v17 = [v16 initWithBlock:v29];
    id v28 = 0;
    id v18 = [v17 resultWithError:&v28];
    id v19 = v28;
    id v20 = [v18 BOOLValue];

    id v21 = objc_msgSend(v19, "ams_sanitizedForSecureCoding");
    v9[2](v9, v20, v21);

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      id v22 = +[AMSLogConfig sharedConfig];
    }
    id v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v24;
      __int16 v36 = 2114;
      id v37 = v27;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [apple-pay-classic] Apple Pay Classic evaluation failed for no completion block", buf, 0x16u);
    }
  }
}

- (void)signedHeadersForRequest:(id)a3 buyParams:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(id)objc_opt_class() sharedPerformQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005DEA0;
  v15[3] = &unk_100114430;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.signingsecurity" withQueue:v11 whilePerformingBlock:v15];
}

- (void)signChallengeForRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() sharedPerformQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005E0CC;
  v10[3] = &unk_100112600;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.biometrics" withQueue:v7 whilePerformingBlock:v10];
}

- (void)performSilentEnrollmentWithRequest:(id)a3 logKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    AMSSetLogKeyIfNeeded();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = objc_opt_class();
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting silent-enrollment payment session", buf, 0x16u);
  }

  id v13 = +[AMSURLSession defaultSession];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005E370;
  v17[3] = &unk_100114458;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = [v13 dataTaskWithRequest:v8 completionHandler:v17];

  [v16 resume];
}

- (void)handleResponse:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  id v6 = a3;
  id v7 = +[AMSDBag defaultBag];
  id v8 = +[AMSAbsinthe handleResponse:v6 bag:v7];

  v5[2](v5, v8);
}

- (void)_absintheHeadersForRequest:(id)a3 bag:(id)a4 buyParams:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = +[AMSAbsinthe headersForRequest:a3 buyParams:a5 bag:a4];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005E7E8;
  v12[3] = &unk_100114408;
  id v13 = v9;
  id v11 = v9;
  [v10 addFinishBlock:v12];
}

- (AMSSecurityClientInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSSecurityClientInterface *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end