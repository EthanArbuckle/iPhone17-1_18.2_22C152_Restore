@interface AMSCardEnrollment
+ (BOOL)_shouldAttemptAutoEnrollmentWithCountryCode:(id)a3;
+ (BOOL)beginCardEnrollmentAttemptWithBag:(id)a3 account:(id)a4;
+ (BOOL)isAURUMWithBag:(id)a3;
+ (BOOL)isApplePayWalletRefreshedForBag:(id)a3;
+ (BOOL)shouldAttemptApplePayClassicWithBag:(id)a3 accessControlRef:(__SecAccessControl *)a4;
+ (BOOL)shouldAttemptApplePayClassicWithBag:(id)a3 account:(id)a4 options:(id)a5;
+ (BOOL)shouldAttemptApplePayClassicWithCountryCode:(id)a3 paymentNetworks:(id)a4 accessControlRef:(__SecAccessControl *)a5;
+ (BOOL)shouldAttemptApplePayClassicWithCountryCode:(id)a3 paymentNetworks:(id)a4 account:(id)a5 options:(id)a6;
+ (BOOL)shouldAttemptAutoEnrollmentWithBag:(id)a3 accessControlRef:(__SecAccessControl *)a4;
+ (BOOL)shouldAttemptAutoEnrollmentWithBag:(id)a3 account:(id)a4 options:(id)a5;
+ (BOOL)shouldCheckForWalletBiometricsForBag:(id)a3;
+ (BOOL)shouldUseApplePayClassicWithBag:(id)a3;
+ (BOOL)shouldUseAutoEnrollmentWithBag:(id)a3;
+ (BOOL)shouldUseExtendedEnrollmentWithBag:(id)a3;
+ (BOOL)shouldUseUpsellEnrollmentWithBag:(id)a3;
+ (NSURL)paymentServicesMerchantURL;
+ (id)_cardEligibilityStatusForCountryCode:(id)a3;
+ (id)_currentIdentifier;
+ (id)_paymentServicesMerchantURLPromise;
+ (id)_shouldAttemptApplePayClassicWithAccount:(id)a3 options:(id)a4 countryCode:(id)a5 paymentNetworks:(id)a6;
+ (id)_shouldAttemptApplePayClassicWithCountryCode:(id)a3 paymentNetworks:(id)a4;
+ (void)clearAutoEnrollmentIdentifier;
+ (void)finishCardEnrollmentAttemptWithBag:(id)a3 buyParams:(id)a4 purchaseResult:(id)a5;
+ (void)updateAutoEnrollmentIdentifier;
@end

@implementation AMSCardEnrollment

+ (NSURL)paymentServicesMerchantURL
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _paymentServicesMerchantURLPromise];
  id v12 = 0;
  v3 = [v2 resultWithError:&v12];
  id v4 = v12;
  v5 = v4;
  if (!v3 || v4)
  {
    v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      id v9 = v8;
      v10 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      v14 = v8;
      __int16 v15 = 2114;
      v16 = v10;
      __int16 v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Payment services call failed with error: %{public}@", buf, 0x20u);
    }
  }

  return (NSURL *)v3;
}

+ (BOOL)beginCardEnrollmentAttemptWithBag:(id)a3 account:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ((!+[AMSCardEnrollment shouldCheckForWalletBiometricsForBag:](AMSCardEnrollment, "shouldCheckForWalletBiometricsForBag:", v5)|| +[AMSDevice isWalletBiometricsEnabled](AMSDevice, "isWalletBiometricsEnabled"))&& (+[AMSCardEnrollment shouldUseApplePayClassicWithBag:](AMSCardEnrollment, "shouldUseApplePayClassicWithBag:", v5)|| +[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:v5]))
  {
    v7 = objc_alloc_init(AMSKeychainOptions);
    [(AMSKeychainOptions *)v7 setPurpose:0];
    [(AMSKeychainOptions *)v7 setStyle:+[AMSKeychainOptions preferredAttestationStyle]];
    if (!AMSIsEntitledForDirectKeychainAccess())
    {
      if (+[AMSCardEnrollment shouldUseApplePayClassicWithBag:v5])
      {
        BOOL v16 = +[AMSCardEnrollment shouldAttemptApplePayClassicWithBag:v5 account:v6 options:v7];
      }
      else
      {
        if (!+[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:v5])
        {
          BOOL v15 = 0;
          goto LABEL_28;
        }
        BOOL v16 = +[AMSCardEnrollment shouldAttemptAutoEnrollmentWithBag:v5 account:v6 options:v7];
      }
      BOOL v15 = v16;
LABEL_28:

      goto LABEL_29;
    }
    id v19 = 0;
    v8 = +[AMSKeychain copyAccessControlRefWithAccount:v6 options:v7 error:&v19];
    id v9 = v19;
    if (v9)
    {
      v10 = +[AMSLogConfig sharedConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = objc_opt_class();
        id v18 = v12;
        v13 = AMSSetLogKeyIfNeeded();
        *(_DWORD *)buf = 138543874;
        v21 = v12;
        __int16 v22 = 2114;
        v23 = v13;
        __int16 v24 = 2114;
        id v25 = v9;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL copy failed with error: %{public}@", buf, 0x20u);
      }
    }
    if (+[AMSCardEnrollment shouldUseApplePayClassicWithBag:](AMSCardEnrollment, "shouldUseApplePayClassicWithBag:", v5, v18))
    {
      BOOL v14 = +[AMSCardEnrollment shouldAttemptApplePayClassicWithBag:v5 accessControlRef:v8];
    }
    else
    {
      if (!+[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:v5])
      {
        BOOL v15 = 0;
        if (!v8) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      BOOL v14 = +[AMSCardEnrollment shouldAttemptAutoEnrollmentWithBag:v5 accessControlRef:v8];
    }
    BOOL v15 = v14;
    if (!v8)
    {
LABEL_21:

      goto LABEL_28;
    }
LABEL_20:
    CFRelease(v8);
    goto LABEL_21;
  }
  BOOL v15 = 0;
LABEL_29:

  return v15;
}

+ (void)clearAutoEnrollmentIdentifier
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  +[AMSDefaults setDefaultPaymentPassIdentifier:0];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    id v5 = v4;
    id v6 = AMSSetLogKeyIfNeeded();
    int v7 = 138543618;
    v8 = v4;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Removing auto-enrollment identifier", (uint8_t *)&v7, 0x16u);
  }
}

+ (void)finishCardEnrollmentAttemptWithBag:(id)a3 buyParams:(id)a4 purchaseResult:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = AMSSetLogKeyIfNeeded();
  BOOL v11 = +[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:v9];

  if (!v11)
  {
    id v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    BOOL v15 = [v14 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 138543618;
    id v44 = (id)objc_opt_class();
    __int16 v45 = 2114;
    v46 = v10;
    id v16 = v44;
    __int16 v17 = "%{public}@: [%{public}@] Skipping DPAN update check for auto-enrollment requirement";
    goto LABEL_25;
  }
  id v12 = [v7 parameterForKey:@"applePayPaymentServiceURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  id v18 = [v7 parameterForKey:@"pkPayment"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;

    BOOL v20 = v19 != 0;
    if (v13 && v19)
    {
      v21 = +[AMSLogConfig sharedConfig];
      if (!v21)
      {
        v21 = +[AMSLogConfig sharedConfig];
      }
      __int16 v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v44 = (id)objc_opt_class();
        __int16 v45 = 2114;
        v46 = v10;
        id v23 = v44;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished auto-enrollment, performing DPAN update check", buf, 0x16u);
      }
      __int16 v24 = [v8 responseDictionary];
      id v25 = [v24 objectForKeyedSubscript:@"need-apple-pay-auto-enroll-retry"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v14 = v25;
      }
      else {
        id v14 = 0;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v14 lowercaseString],
            v32 = objc_claimAutoreleasedReturnValue(),
            int v33 = [v32 isEqualToString:@"true"],
            v32,
            v33))
      {
        v34 = +[AMSLogConfig sharedConfig];
        if (!v34)
        {
          v34 = +[AMSLogConfig sharedConfig];
        }
        v35 = [v34 OSLogObject];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v44 = v36;
          __int16 v45 = 2114;
          v46 = v10;
          id v37 = v36;
          _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clearing DPAN cache for auto-enrollment, server-driven instruction", buf, 0x16u);
        }
        +[AMSCardEnrollment clearAutoEnrollmentIdentifier];
      }
      else
      {
        v38 = +[AMSLogConfig sharedConfig];
        if (!v38)
        {
          v38 = +[AMSLogConfig sharedConfig];
        }
        v39 = [v38 OSLogObject];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v44 = v40;
          __int16 v45 = 2114;
          v46 = v10;
          id v41 = v40;
          _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating cached DPAN identifier for auto-enrollment", buf, 0x16u);
        }
        +[AMSCardEnrollment updateAutoEnrollmentIdentifier];
      }
      goto LABEL_45;
    }
  }
  else
  {

    BOOL v20 = 0;
  }
  uint64_t v26 = +[AMSLogConfig sharedConfig];
  id v14 = (id)v26;
  if (v13 && !v20)
  {
    if (!v26)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    BOOL v15 = [v14 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 138543618;
    id v44 = (id)objc_opt_class();
    __int16 v45 = 2114;
    v46 = v10;
    id v16 = v44;
    __int16 v17 = "%{public}@: [%{public}@] Did not finish auto-enrollment, leaving DPAN cache unchanged";
LABEL_25:
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);

LABEL_26:
    goto LABEL_45;
  }
  if (!v26)
  {
    id v14 = +[AMSLogConfig sharedConfig];
  }
  v27 = [v14 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_opt_class();
    v29 = (void *)MEMORY[0x1E4F28ED0];
    id v42 = v28;
    v30 = [v29 numberWithBool:v13 != 0];
    v31 = [MEMORY[0x1E4F28ED0] numberWithBool:v20];
    *(_DWORD *)buf = 138544130;
    id v44 = v28;
    __int16 v45 = 2114;
    v46 = v10;
    __int16 v47 = 2114;
    v48 = v30;
    __int16 v49 = 2114;
    v50 = v31;
    _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping DPAN update check for auto-enrollment with state: %{public}@ %{public}@", buf, 0x2Au);
  }
LABEL_45:
}

+ (BOOL)shouldAttemptApplePayClassicWithBag:(id)a3 account:(id)a4 options:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v42 = a4;
  id v10 = a5;
  BOOL v11 = AMSSetLogKeyIfNeeded();
  id v12 = [v9 stringForKey:@"countryCode"];
  id v45 = 0;
  id v13 = [v12 valueWithError:&v45];
  id v14 = v45;
  BOOL v15 = [v13 uppercaseString];

  if (v14)
  {
    id v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    __int16 v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      __int16 v47 = v18;
      __int16 v48 = 2114;
      __int16 v49 = v11;
      __int16 v50 = 2114;
      uint64_t v51 = @"countryCode";
      id v19 = v18;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] No bag key found: %{public}@", buf, 0x20u);
    }
    char v20 = 0;
  }
  else
  {
    v21 = [v9 arrayForKey:@"apple-pay-classic-networks"];
    id v44 = 0;
    id v16 = [v21 valueWithError:&v44];
    id v14 = v44;

    id v41 = v10;
    if (v14)
    {
      __int16 v17 = +[AMSLogConfig sharedConfig];
      if (!v17)
      {
        __int16 v17 = +[AMSLogConfig sharedConfig];
      }
      __int16 v22 = [v17 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        __int16 v47 = v23;
        __int16 v48 = 2114;
        __int16 v49 = v11;
        __int16 v50 = 2114;
        uint64_t v51 = @"apple-pay-classic-networks";
        id v24 = v23;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] No bag key found: %{public}@", buf, 0x20u);
      }
      char v20 = 0;
    }
    else
    {
      __int16 v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
      id v25 = [a1 _shouldAttemptApplePayClassicWithAccount:v42 options:v10 countryCode:v15 paymentNetworks:v17];
      id v43 = 0;
      __int16 v22 = [v25 resultWithError:&v43];
      id v14 = v43;

      if (v14)
      {
        v40 = v22;
        uint64_t v26 = +[AMSLogConfig sharedConfig];
        if (!v26)
        {
          uint64_t v26 = +[AMSLogConfig sharedConfig];
        }
        v39 = v26;
        v27 = [v26 OSLogObject];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          log = v27;
          uint64_t v28 = AMSLogKey();
          v29 = NSString;
          uint64_t v30 = objc_opt_class();
          id v37 = (void *)v28;
          if (v28)
          {
            uint64_t v31 = AMSLogKey();
            uint64_t v35 = NSStringFromSelector(a2);
            v36 = (void *)v31;
            [v29 stringWithFormat:@"%@: [%@] %@ ", v30, v31, v35];
          }
          else
          {
            v36 = NSStringFromSelector(a2);
            [v29 stringWithFormat:@"%@: %@ ", v30, v36];
          v32 = };
          int v33 = AMSLogableError(v14);
          *(_DWORD *)buf = 138543618;
          __int16 v47 = v32;
          __int16 v48 = 2114;
          __int16 v49 = v33;
          _os_log_impl(&dword_18D554000, log, OS_LOG_TYPE_ERROR, "%{public}@ error: %{public}@", buf, 0x16u);
          if (v37)
          {

            v32 = (void *)v35;
          }

          v27 = log;
        }

        char v20 = 0;
        __int16 v22 = v40;
      }
      else
      {
        char v20 = [v22 BOOLValue];
      }
    }

    id v10 = v41;
  }

  return v20;
}

+ (BOOL)shouldAttemptApplePayClassicWithBag:(id)a3 accessControlRef:(__SecAccessControl *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = AMSSetLogKeyIfNeeded();
  id v8 = [v6 stringForKey:@"countryCode"];
  id v23 = 0;
  id v9 = [v8 valueWithError:&v23];
  id v10 = v23;
  BOOL v11 = [v9 uppercaseString];

  if (v10)
  {
    id v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v25 = v14;
      __int16 v26 = 2114;
      v27 = v7;
      __int16 v28 = 2114;
      v29 = @"countryCode";
      id v15 = v14;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] No bag key found: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v16 = [v6 arrayForKey:@"apple-pay-classic-networks"];
    id v22 = 0;
    id v12 = [v16 valueWithError:&v22];
    id v10 = v22;

    if (!v10)
    {
      id v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
      char v20 = [a1 shouldAttemptApplePayClassicWithCountryCode:v11 paymentNetworks:v13 accessControlRef:a4];
      goto LABEL_13;
    }
    id v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    __int16 v17 = [v13 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v25 = v18;
      __int16 v26 = 2114;
      v27 = v7;
      __int16 v28 = 2114;
      v29 = @"apple-pay-classic-networks";
      id v19 = v18;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] No bag key found: %{public}@", buf, 0x20u);
    }
  }
  char v20 = 0;
LABEL_13:

  return v20;
}

+ (BOOL)shouldAttemptAutoEnrollmentWithBag:(id)a3 account:(id)a4 options:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = AMSSetLogKeyIfNeeded();
  if (+[AMSDevice biometricState] != 1)
  {
    id v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2114;
      v27 = v11;
      id v17 = v25;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Skipping biometric/ACL check for no biometrics", buf, 0x16u);
    }
    id v13 = 0;
    goto LABEL_14;
  }
  id v23 = 0;
  BOOL v12 = +[AMSBiometrics isActionSupportedForType:3 account:v9 options:v10 error:&v23];
  id v13 = v23;
  if (!v12)
  {
    id v18 = +[AMSLogConfig sharedConfig];
    if (!v18)
    {
      id v18 = +[AMSLogConfig sharedConfig];
    }
    id v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      char v20 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v25 = v20;
      __int16 v26 = 2114;
      v27 = v11;
      __int16 v28 = 2114;
      id v29 = v13;
      id v21 = v20;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Skipping biometric/ACL check for error: %{public}@", buf, 0x20u);
    }
LABEL_14:
    char v14 = 0;
    goto LABEL_15;
  }
  char v14 = [a1 isApplePayWalletRefreshedForBag:v8];
LABEL_15:

  return v14;
}

+ (BOOL)shouldAttemptAutoEnrollmentWithBag:(id)a3 accessControlRef:(__SecAccessControl *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = AMSSetLogKeyIfNeeded();
  if (+[AMSDevice biometricState] != 1)
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    int v16 = 138543618;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v7;
    id v11 = v17;
    BOOL v12 = "%{public}@: [%{public}@] [auto-enrollment] Skipping biometric/ACL check for no biometrics";
LABEL_13:
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0x16u);

LABEL_19:
    char v8 = 0;
    goto LABEL_20;
  }
  if (!a4)
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    int v16 = 138543618;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v7;
    id v11 = v17;
    BOOL v12 = "%{public}@: [%{public}@] [auto-enrollment] Skipping biometric/ACL check for no ACL";
    goto LABEL_13;
  }
  if (!+[AMSBiometrics isActionSupported:3 withAccessControl:a4])
  {
    id v9 = +[AMSBiometrics ACLVersionForAccessControl:a4];
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543874;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2114;
      id v19 = v7;
      __int16 v20 = 2114;
      id v21 = v9;
      id v14 = v17;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Skipping biometric/ACL check for bad ACL version: %{public}@", (uint8_t *)&v16, 0x20u);
    }
    goto LABEL_19;
  }
  char v8 = [a1 isApplePayWalletRefreshedForBag:v6];
LABEL_20:

  return v8;
}

+ (BOOL)shouldUseApplePayClassicWithBag:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AMSSetLogKeyIfNeeded();
  id v5 = [v3 BOOLForKey:@"use-apple-pay-classic"];

  id v24 = 0;
  id v6 = [v5 valueWithError:&v24];
  id v7 = v24;

  if (!v6)
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_opt_class();
      id v12 = v11;
      id v13 = AMSLogableError(v7);
      *(_DWORD *)buf = 138544130;
      __int16 v26 = v11;
      __int16 v27 = 2114;
      __int16 v28 = v4;
      __int16 v29 = 2114;
      uint64_t v30 = @"use-apple-pay-classic";
      __int16 v31 = 2114;
      v32 = v13;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] No bag key found: %{public}@, error: %{public}@", buf, 0x2Au);
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v14 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v15 = +[AMSLogConfig sharedConfig];
    id v9 = (void *)v15;
    if (v14)
    {
      if (!v15)
      {
        id v9 = +[AMSLogConfig sharedConfig];
      }
      int v16 = [v9 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        __int16 v26 = v17;
        __int16 v27 = 2114;
        __int16 v28 = v4;
        __int16 v29 = 2114;
        uint64_t v30 = @"use-apple-pay-classic";
        id v18 = v17;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [apple-pay-classic] Bag key is not number: %{public}@", buf, 0x20u);
      }
      id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      __int16 v20 = +[AMSLogConfig sharedConfig];
      [v19 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v20 userInfo:0];

      goto LABEL_19;
    }
    if (!v15)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      id v21 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      __int16 v26 = v21;
      __int16 v27 = 2114;
      __int16 v28 = v4;
      __int16 v29 = 2114;
      uint64_t v30 = @"use-apple-pay-classic";
      id v22 = v21;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] [apple-pay-classic] Bag key is not number: %{public}@", buf, 0x20u);
    }
LABEL_18:

LABEL_19:
    char v8 = 0;
    goto LABEL_20;
  }
  char v8 = [v6 BOOLValue];
LABEL_20:

  return v8;
}

+ (BOOL)shouldCheckForWalletBiometricsForBag:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AMSSetLogKeyIfNeeded();
  id v5 = [v3 BOOLForKey:@"auto-enrollment-check-biometrics"];

  id v19 = 0;
  id v6 = [v5 valueWithError:&v19];
  id v7 = v19;
  uint64_t v8 = [v6 BOOLValue];

  uint64_t v9 = +[AMSLogConfig sharedConfig];
  id v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v21 = v12;
      __int16 v22 = 2114;
      id v23 = v4;
      __int16 v24 = 2114;
      id v25 = v7;
      id v13 = v12;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag key found for shouldCheckForWalletBiometrics, but the flag is default to enabled, if bag key does not exist , error: %{public}@", buf, 0x20u);
    }
    LOBYTE(v8) = 1;
  }
  else
  {
    if (!v9)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = objc_opt_class();
      uint64_t v15 = (void *)MEMORY[0x1E4F28ED0];
      id v16 = v14;
      id v17 = [v15 numberWithBool:v8];
      *(_DWORD *)buf = 138543874;
      id v21 = v14;
      __int16 v22 = 2114;
      id v23 = v4;
      __int16 v24 = 2114;
      id v25 = v17;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Auto Enrollment shouldCheckForWalletBiometrics from the bag: %{public}@", buf, 0x20u);
    }
  }

  return v8;
}

+ (BOOL)shouldUseAutoEnrollmentWithBag:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AMSSetLogKeyIfNeeded();
  id v5 = [v3 doubleForKey:@"auto-enrollment-percentage"];
  id v28 = 0;
  id v6 = [v5 valueWithError:&v28];
  id v7 = v28;
  [v6 doubleValue];
  double v9 = v8;

  if (v7)
  {
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v12 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v12;
    __int16 v31 = 2114;
    v32 = v4;
    __int16 v33 = 2114;
    v34 = @"auto-enrollment-percentage";
    id v13 = v12;
LABEL_11:
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] No bag key found: %{public}@", buf, 0x20u);

LABEL_12:
    LOBYTE(v18) = 0;
    goto LABEL_13;
  }
  BOOL v14 = [v3 integerForKey:@"auto-enrollment-session-duration"];
  id v27 = 0;
  uint64_t v15 = [v14 valueWithError:&v27];
  id v7 = v27;
  uint64_t v16 = [v15 integerValue];

  if (v7)
  {
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v17 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v17;
    __int16 v31 = 2114;
    v32 = v4;
    __int16 v33 = 2114;
    v34 = @"auto-enrollment-session-duration";
    id v13 = v17;
    goto LABEL_11;
  }
  double v20 = (double)v16;
  BOOL v18 = +[AMSDefaults shouldSampleWithPercentage:0x1EDCB0888 sessionDuration:v9 identifier:(double)v16];
  id v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = objc_opt_class();
    __int16 v22 = (void *)MEMORY[0x1E4F28ED0];
    id v23 = v21;
    __int16 v24 = [v22 numberWithDouble:v9];
    id v25 = [MEMORY[0x1E4F28ED0] numberWithDouble:v20];
    uint64_t v26 = [MEMORY[0x1E4F28ED0] numberWithBool:v18];
    *(_DWORD *)buf = 138544386;
    uint64_t v30 = v21;
    __int16 v31 = 2114;
    v32 = v4;
    __int16 v33 = 2114;
    v34 = v24;
    __int16 v35 = 2114;
    v36 = v25;
    __int16 v37 = 2114;
    v38 = v26;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] [auto-enrollment] Sampling with bag values: %{public}@, %{public}@ and result: %{public}@", buf, 0x34u);
  }
  id v7 = 0;
LABEL_13:

  return v18;
}

+ (BOOL)shouldUseExtendedEnrollmentWithBag:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!os_variant_has_internal_content())
  {
LABEL_15:
    id v12 = [v3 BOOLForKey:@"use-extended-enrollment"];
    id v22 = 0;
    id v13 = [v12 valueWithError:&v22];
    id v5 = v22;
    uint64_t v8 = [v13 BOOLValue];

    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    BOOL v14 = [v6 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = (void *)MEMORY[0x1E4F28ED0];
      id v17 = v15;
      BOOL v18 = [v16 numberWithBool:v8];
      id v19 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543874;
      id v24 = v15;
      __int16 v25 = 2114;
      uint64_t v26 = v18;
      __int16 v27 = 2114;
      id v28 = v19;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [UpsellEnrollment] Retrieved extended-enrollment bag value: %{public}@, error: %{public}@", buf, 0x20u);
    }
    goto LABEL_20;
  }
  int64_t v4 = +[AMSDefaults cardEnrollmentManual];
  if (!v4)
  {
    double v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      double v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = (id)objc_opt_class();
      id v11 = v24;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [ExtendedEnrollment] Honoring extended-enrollment bag value", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      id v5 = +[AMSLogConfig sharedConfig];
      if (!v5)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      id v6 = [v5 OSLogObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = (id)objc_opt_class();
        id v7 = v24;
        _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [ExtendedEnrollment] Enabling extended-enrollment with default settings", buf, 0xCu);
      }
      LOBYTE(v8) = 1;
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = (id)objc_opt_class();
    id v21 = v24;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [ExtendedEnrollment] Skipping extended-enrollment for default settings", buf, 0xCu);
  }
  LOBYTE(v8) = 0;
LABEL_20:

  return v8;
}

+ (BOOL)shouldUseUpsellEnrollmentWithBag:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!os_variant_has_internal_content())
  {
LABEL_15:
    id v12 = [v3 BOOLForKey:@"use-enrollment-upsell"];
    id v22 = 0;
    id v13 = [v12 valueWithError:&v22];
    id v5 = v22;
    uint64_t v8 = [v13 BOOLValue];

    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    BOOL v14 = [v6 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = (void *)MEMORY[0x1E4F28ED0];
      id v17 = v15;
      BOOL v18 = [v16 numberWithBool:v8];
      id v19 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543874;
      id v24 = v15;
      __int16 v25 = 2114;
      uint64_t v26 = v18;
      __int16 v27 = 2114;
      id v28 = v19;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [UpsellEnrollment] Retrieved upsell-enrollment bag value: %{public}@, error: %{public}@", buf, 0x20u);
    }
    goto LABEL_20;
  }
  int64_t v4 = +[AMSDefaults cardEnrollmentUpsell];
  if (!v4)
  {
    double v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      double v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = (id)objc_opt_class();
      id v11 = v24;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [UpsellEnrollment] Honoring upsell-enrollment bag value", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      id v5 = +[AMSLogConfig sharedConfig];
      if (!v5)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      id v6 = [v5 OSLogObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = (id)objc_opt_class();
        id v7 = v24;
        _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [UpsellEnrollment] Enabling upsell-enrollment with default settings", buf, 0xCu);
      }
      LOBYTE(v8) = 1;
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = (id)objc_opt_class();
    id v21 = v24;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [UpsellEnrollment] Skipping upsell-enrollment for default settings", buf, 0xCu);
  }
  LOBYTE(v8) = 0;
LABEL_20:

  return v8;
}

+ (void)updateAutoEnrollmentIdentifier
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = AMSSetLogKeyIfNeeded();
  int64_t v4 = [a1 _currentIdentifier];
  id v16 = 0;
  id v5 = [v4 resultWithError:&v16];
  id v6 = v16;

  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v9 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      BOOL v18 = v9;
      __int16 v19 = 2114;
      double v20 = v3;
      __int16 v21 = 2114;
      id v22 = v6;
      id v10 = v9;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [auto-enrollment] Failed to obtain current DPAN identifier during update operation with error: %{public}@", buf, 0x20u);
    }
  }
  +[AMSDefaults setDefaultPaymentPassIdentifier:v5];
  id v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_opt_class();
    id v14 = v13;
    uint64_t v15 = AMSHashIfNeeded(v5);
    *(_DWORD *)buf = 138543874;
    BOOL v18 = v13;
    __int16 v19 = 2114;
    double v20 = v3;
    __int16 v21 = 2114;
    id v22 = v15;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Updating extended enrollment identifier with value: %{public}@", buf, 0x20u);
  }
}

+ (BOOL)isAURUMWithBag:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = [v3 doubleForKey:@"auto-enrollment-percentage"];
  id v5 = [v4 valuePromise];

  id v6 = [v3 integerForKey:@"auto-enrollment-session-duration"];

  id v7 = [v6 valuePromise];

  uint64_t v8 = AMSSetLogKeyIfNeeded();
  double v9 = [v5 binaryPromiseAdapter];
  v33[0] = v9;
  id v10 = [v7 binaryPromiseAdapter];
  v33[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  id v12 = +[AMSBinaryPromise promiseWithAll:v11];
  id v26 = 0;
  uint64_t v13 = [v12 resultWithError:&v26];
  id v14 = v26;

  if (v14)
  {
    uint64_t v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v28 = v17;
      __int16 v29 = 2114;
      uint64_t v30 = v8;
      __int16 v31 = 2114;
      id v32 = v14;
      id v18 = v17;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [auto-enrollment] Failed AURUM check with error: %{public}@", buf, 0x20u);
    }
  }
  __int16 v19 = +[AMSLogConfig sharedConfig];
  if (!v19)
  {
    __int16 v19 = +[AMSLogConfig sharedConfig];
  }
  double v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = objc_opt_class();
    id v22 = (void *)MEMORY[0x1E4F28ED0];
    id v23 = v21;
    id v24 = [v22 numberWithBool:v13];
    *(_DWORD *)buf = 138543874;
    id v28 = v21;
    __int16 v29 = 2114;
    uint64_t v30 = v8;
    __int16 v31 = 2114;
    id v32 = v24;
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] AURUM check completed with result: %{public}@", buf, 0x20u);
  }
  return v13;
}

+ (BOOL)isApplePayWalletRefreshedForBag:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t v4 = [a3 stringForKey:@"countryCode"];
  id v15 = 0;
  id v5 = [v4 valueWithError:&v15];
  id v6 = v15;
  id v7 = [v5 uppercaseString];

  if (v6)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    double v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_opt_class();
      id v11 = v10;
      id v12 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      id v17 = v10;
      __int16 v18 = 2114;
      __int16 v19 = v12;
      __int16 v20 = 2114;
      __int16 v21 = @"countryCode";
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] No bag key found: %{public}@", buf, 0x20u);
    }
    char v13 = 0;
  }
  else
  {
    char v13 = [a1 _shouldAttemptAutoEnrollmentWithCountryCode:v7];
  }

  return v13;
}

+ (BOOL)shouldAttemptApplePayClassicWithCountryCode:(id)a3 paymentNetworks:(id)a4 accessControlRef:(__SecAccessControl *)a5
{
  v48[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = AMSSetLogKeyIfNeeded();
  id v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2114;
    __int16 v47 = v8;
    LOWORD(v48[0]) = 2114;
    *(void *)((char *)v48 + 2) = v9;
    id v13 = *(id *)&buf[4];
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Performing availability check for countryCode: %{public}@, paymentNetworks: %{public}@", buf, 0x2Au);
  }
  if (+[AMSDevice biometricState] != 1)
  {
    id v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    id v14 = [v16 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      id v24 = v23;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Skipping biometric/ACL check for no biometrics", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (!a5)
  {
    id v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    id v14 = [v16 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      id v26 = v25;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Skipping biometric/ACL check for no ACL", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (!+[AMSBiometrics isActionSupported:4 withAccessControl:a5])
  {
    id v16 = +[AMSBiometrics ACLVersionForAccessControl:a5];
    id v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    __int16 v27 = [v14 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      __int16 v47 = v16;
      id v29 = v28;
      _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Skipping biometric/ACL check for bad ACL version: %{public}@", buf, 0x20u);
    }
LABEL_27:
    LOBYTE(v22) = 0;
    goto LABEL_28;
  }
  id v14 = [a1 _shouldAttemptApplePayClassicWithCountryCode:v8 paymentNetworks:v9];
  id v41 = 0;
  id v15 = [v14 resultWithError:&v41];
  id v16 = v41;
  int v17 = [v15 BOOLValue];

  if (v16)
  {
    __int16 v18 = +[AMSLogConfig sharedConfig];
    if (!v18)
    {
      __int16 v18 = +[AMSLogConfig sharedConfig];
    }
    __int16 v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      __int16 v47 = v16;
      id v21 = v20;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [apple-pay-classic] biometric/ACL check failed with error: %{public}@", buf, 0x20u);
    }
    LOBYTE(v22) = 0;
  }
  else
  {
    if (v17)
    {
      __int16 v31 = +[AMSLogConfig sharedConfig];
      if (!v31)
      {
        __int16 v31 = +[AMSLogConfig sharedConfig];
      }
      id v32 = [v31 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v33 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v10;
        id v39 = v33;
        _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Performing biometric/ACL check", buf, 0x16u);
      }
      uint64_t v42 = 0;
      id v43 = &v42;
      uint64_t v44 = 0x2050000000;
      v34 = (void *)_MergedGlobals_90;
      uint64_t v45 = _MergedGlobals_90;
      if (!_MergedGlobals_90)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getPKAuthenticatorClass_block_invoke;
        __int16 v47 = &unk_1E559EC70;
        v48[0] = &v42;
        __getPKAuthenticatorClass_block_invoke((uint64_t)buf);
        v34 = (void *)v43[3];
      }
      id v35 = v34;
      _Block_object_dispose(&v42, 8);
      uint64_t v22 = [v35 canPerformPSD2StyleBuyForAccessControlRef:a5];
    }
    else
    {
      uint64_t v22 = 0;
    }
    __int16 v18 = +[AMSLogConfig sharedConfig];
    if (!v18)
    {
      __int16 v18 = +[AMSLogConfig sharedConfig];
    }
    __int16 v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v36 = objc_opt_class();
      __int16 v37 = (void *)MEMORY[0x1E4F28ED0];
      id v40 = v36;
      v38 = [v37 numberWithBool:v22];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      __int16 v47 = v38;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Biometric/ACL check did complete with result: %{public}@", buf, 0x20u);
    }
  }

LABEL_28:
  return v22;
}

+ (BOOL)shouldAttemptApplePayClassicWithCountryCode:(id)a3 paymentNetworks:(id)a4 account:(id)a5 options:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = AMSSetLogKeyIfNeeded();
  id v15 = +[AMSLogConfig sharedConfig];
  if (!v15)
  {
    id v15 = +[AMSLogConfig sharedConfig];
  }
  id v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v37 = (id)objc_opt_class();
    __int16 v38 = 2114;
    id v39 = v14;
    __int16 v40 = 2114;
    id v41 = v10;
    __int16 v42 = 2114;
    id v43 = v11;
    id v17 = v37;
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Performing availability check for countryCode: %{public}@, paymentNetworks: %{public}@", buf, 0x2Au);
  }
  v34 = v13;
  if (+[AMSDevice biometricState] == 1)
  {
    id v33 = v10;
    __int16 v18 = [a1 _shouldAttemptApplePayClassicWithAccount:v12 options:v13 countryCode:v10 paymentNetworks:v11];
    id v35 = 0;
    __int16 v19 = [v18 resultWithError:&v35];
    id v20 = v35;
    uint64_t v21 = [v19 BOOLValue];

    uint64_t v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      uint64_t v22 = +[AMSLogConfig sharedConfig];
    }
    id v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = objc_opt_class();
      id v32 = v11;
      id v25 = v12;
      id v26 = (void *)MEMORY[0x1E4F28ED0];
      id v27 = v24;
      id v28 = [v26 numberWithBool:v21];
      *(_DWORD *)buf = 138543874;
      id v37 = v24;
      __int16 v38 = 2114;
      id v39 = v14;
      __int16 v40 = 2114;
      id v41 = v28;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Biometric/ACL check did complete with result: %{public}@", buf, 0x20u);

      id v12 = v25;
      id v11 = v32;
    }
    id v10 = v33;
  }
  else
  {
    id v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      id v20 = +[AMSLogConfig sharedConfig];
    }
    __int16 v18 = [v20 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v37 = v29;
      __int16 v38 = 2114;
      id v39 = v14;
      id v30 = v29;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [apple-pay-classic] Skipping biometric/ACL check for no biometrics", buf, 0x16u);
    }
    LOBYTE(v21) = 0;
  }

  return v21;
}

+ (id)_cardEligibilityStatusForCountryCode:(id)a3
{
  id v3 = a3;
  int64_t v4 = [AMSMutableLazyPromise alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__AMSCardEnrollment__cardEligibilityStatusForCountryCode___block_invoke;
  v8[3] = &unk_1E55A0A90;
  id v9 = v3;
  id v5 = v3;
  id v6 = [(AMSMutableLazyPromise *)v4 initWithBlock:v8];

  return v6;
}

void __58__AMSCardEnrollment__cardEligibilityStatusForCountryCode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2050000000;
  int64_t v4 = (void *)getPKInAppPaymentServiceClass_softClass;
  uint64_t v15 = getPKInAppPaymentServiceClass_softClass;
  if (!getPKInAppPaymentServiceClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getPKInAppPaymentServiceClass_block_invoke;
    v11[3] = &unk_1E559EC70;
    v11[4] = &v12;
    __getPKInAppPaymentServiceClass_block_invoke((uint64_t)v11);
    int64_t v4 = (void *)v13[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v12, 8);
  id v6 = objc_alloc_init(v5);
  uint64_t v7 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__AMSCardEnrollment__cardEligibilityStatusForCountryCode___block_invoke_2;
  v9[3] = &unk_1E55A0A68;
  id v10 = v3;
  id v8 = v3;
  [v6 cardsAvailableForAMPWithCountryCode:v7 completion:v9];
}

void __58__AMSCardEnrollment__cardEligibilityStatusForCountryCode___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
  [v2 finishWithResult:v3];
}

+ (id)_currentIdentifier
{
  id v3 = AMSSetLogKeyIfNeeded();
  int64_t v4 = [AMSMutableLazyPromise alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__AMSCardEnrollment__currentIdentifier__block_invoke;
  v8[3] = &unk_1E55A0AE0;
  id v9 = v3;
  id v10 = a1;
  id v5 = v3;
  id v6 = [(AMSMutableLazyPromise *)v4 initWithBlock:v8];

  return v6;
}

void __39__AMSCardEnrollment__currentIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  int64_t v4 = (void *)getPKPaymentServiceClass_softClass;
  uint64_t v17 = getPKPaymentServiceClass_softClass;
  if (!getPKPaymentServiceClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getPKPaymentServiceClass_block_invoke;
    v13[3] = &unk_1E559EC70;
    v13[4] = &v14;
    __getPKPaymentServiceClass_block_invoke((uint64_t)v13);
    int64_t v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  id v6 = (void *)[[v5 alloc] initWithDelegate:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__AMSCardEnrollment__currentIdentifier__block_invoke_2;
  v10[3] = &unk_1E55A0AB8;
  id v11 = v3;
  long long v9 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v3;
  [v6 defaultPaymentPassIngestionSpecificIdentifier:v10];
}

uint64_t __39__AMSCardEnrollment__currentIdentifier__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 finishWithResult:a2];
  }
  else
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      id v9 = v7;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Empty DPAN identifier found", (uint8_t *)&v10, 0x16u);
    }
    return [*(id *)(a1 + 32) finishWithResult:@"*EMPTY*"];
  }
}

+ (id)_paymentServicesMerchantURLPromise
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__14;
  int v10 = __Block_byref_object_dispose__14;
  id v11 = objc_alloc_init(AMSDaemonConnection);
  v2 = [(id)v7[5] securityServiceProxyWithDelegate:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AMSCardEnrollment__paymentServicesMerchantURLPromise__block_invoke;
  v5[3] = &unk_1E55A05D0;
  v5[4] = &v6;
  id v3 = [v2 thenWithBlock:v5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

AMSMutablePromise *__55__AMSCardEnrollment__paymentServicesMerchantURLPromise__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__AMSCardEnrollment__paymentServicesMerchantURLPromise__block_invoke_2;
  v8[3] = &unk_1E55A0B08;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  [v3 paymentServicesMerchantURLWithCompletion:v8];

  return v5;
}

void __55__AMSCardEnrollment__paymentServicesMerchantURLPromise__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = *(void **)(a1 + 32);
  if (a3) {
    objc_msgSend(v4, "finishWithError:");
  }
  else {
    [v4 finishWithResult:a2];
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

+ (id)_shouldAttemptApplePayClassicWithAccount:(id)a3 options:(id)a4 countryCode:(id)a5 paymentNetworks:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v29 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = AMSSetLogKeyIfNeeded();
  uint64_t v14 = +[AMSLogConfig sharedConfig];
  if (!v14)
  {
    uint64_t v14 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    NSStringFromSelector(a2);
    uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    __int16 v18 = AMSHashIfNeeded(v11);
    __int16 v19 = AMSHashIfNeeded(v12);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    id v39 = v17;
    *(_WORD *)__int16 v40 = 2114;
    *(void *)&v40[2] = v18;
    *(_WORD *)&v40[10] = 2114;
    *(void *)&v40[12] = v19;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ | countryCode = %{public}@ | paymentNetworks = %{public}@", buf, 0x34u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v39 = __Block_byref_object_copy__14;
  *(void *)__int16 v40 = __Block_byref_object_dispose__14;
  *(void *)&v40[8] = objc_alloc_init(AMSDaemonConnection);
  id v20 = [*(id *)(*(void *)&buf[8] + 40) securityServiceProxyWithDelegate:0];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __98__AMSCardEnrollment__shouldAttemptApplePayClassicWithAccount_options_countryCode_paymentNetworks___block_invoke;
  v30[3] = &unk_1E55A0B58;
  id v37 = a1;
  id v21 = v13;
  id v31 = v21;
  id v22 = v28;
  id v32 = v22;
  id v23 = v29;
  id v33 = v23;
  id v24 = v11;
  id v34 = v24;
  id v25 = v12;
  id v35 = v25;
  v36 = buf;
  id v26 = [v20 thenWithBlock:v30];

  _Block_object_dispose(buf, 8);
  return v26;
}

AMSMutablePromise *__98__AMSCardEnrollment__shouldAttemptApplePayClassicWithAccount_options_countryCode_paymentNetworks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int64_t v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    int64_t v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v6;
    __int16 v25 = 2114;
    uint64_t v26 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proxy object obtained, proxying to security service.", buf, 0x16u);
  }

  uint64_t v8 = objc_alloc_init(AMSMutablePromise);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__AMSCardEnrollment__shouldAttemptApplePayClassicWithAccount_options_countryCode_paymentNetworks___block_invoke_61;
  v18[3] = &unk_1E55A0B30;
  uint64_t v22 = *(void *)(a1 + 80);
  id v19 = *(id *)(a1 + 32);
  uint64_t v13 = v8;
  uint64_t v14 = *(void *)(a1 + 72);
  id v20 = v13;
  uint64_t v21 = v14;
  [v3 shouldAttemptApplePayWithAccount:v9 options:v10 countryCode:v11 paymentNetworks:v12 completion:v18];

  uint64_t v15 = v20;
  uint64_t v16 = v13;

  return v16;
}

void __98__AMSCardEnrollment__shouldAttemptApplePayClassicWithAccount_options_countryCode_paymentNetworks___block_invoke_61(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v10 = @"true";
    }
    else {
      uint64_t v10 = @"false";
    }
    uint64_t v11 = AMSLogableError(v5);
    int v16 = 138544130;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    id v23 = v11;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proxy object returned. result = %{public}@ error = %{public}@", (uint8_t *)&v16, 0x2Au);
  }
  uint64_t v12 = *(void **)(a1 + 40);
  if (v5)
  {
    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    [v12 finishWithResult:v13];
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;
}

+ (id)_shouldAttemptApplePayClassicWithCountryCode:(id)a3 paymentNetworks:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = AMSSetLogKeyIfNeeded();
  uint64_t v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    NSStringFromSelector(a2);
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    uint64_t v14 = AMSHashIfNeeded(v7);
    uint64_t v15 = AMSHashIfNeeded(v8);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    id v29 = v13;
    *(_WORD *)id v30 = 2114;
    *(void *)&v30[2] = v14;
    *(_WORD *)&v30[10] = 2114;
    *(void *)&v30[12] = v15;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ | countryCode = %{public}@ | paymentNetworks = %{public}@", buf, 0x34u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v29 = __Block_byref_object_copy__14;
  *(void *)id v30 = __Block_byref_object_dispose__14;
  *(void *)&v30[8] = objc_alloc_init(AMSDaemonConnection);
  int v16 = [*(id *)(*(void *)&buf[8] + 40) securityServiceProxyWithDelegate:0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__AMSCardEnrollment__shouldAttemptApplePayClassicWithCountryCode_paymentNetworks___block_invoke;
  v22[3] = &unk_1E55A0B80;
  id v27 = a1;
  id v17 = v9;
  id v23 = v17;
  id v18 = v7;
  id v24 = v18;
  id v19 = v8;
  id v25 = v19;
  uint64_t v26 = buf;
  __int16 v20 = [v16 thenWithBlock:v22];

  _Block_object_dispose(buf, 8);
  return v20;
}

AMSMutablePromise *__82__AMSCardEnrollment__shouldAttemptApplePayClassicWithCountryCode_paymentNetworks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int64_t v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    int64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    uint64_t v24 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proxy object obtained, proxying to security service.", buf, 0x16u);
  }

  id v8 = objc_alloc_init(AMSMutablePromise);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__AMSCardEnrollment__shouldAttemptApplePayClassicWithCountryCode_paymentNetworks___block_invoke_66;
  v16[3] = &unk_1E55A0B30;
  uint64_t v20 = *(void *)(a1 + 64);
  id v17 = *(id *)(a1 + 32);
  uint64_t v11 = v8;
  uint64_t v12 = *(void *)(a1 + 56);
  id v18 = v11;
  uint64_t v19 = v12;
  [v3 shouldAttemptApplePayWithCountryCode:v9 paymentNetworks:v10 completion:v16];

  uint64_t v13 = v18;
  uint64_t v14 = v11;

  return v14;
}

void __82__AMSCardEnrollment__shouldAttemptApplePayClassicWithCountryCode_paymentNetworks___block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v10 = @"true";
    }
    else {
      uint64_t v10 = @"false";
    }
    uint64_t v11 = AMSLogableError(v5);
    int v16 = 138544130;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Proxy object returned. result = %{public}@ error = %{public}@", (uint8_t *)&v16, 0x2Au);
  }
  uint64_t v12 = *(void **)(a1 + 40);
  if (v5)
  {
    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    [v12 finishWithResult:v13];
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;
}

+ (BOOL)_shouldAttemptAutoEnrollmentWithCountryCode:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  uint64_t v6 = +[AMSDefaults defaultPaymentPassIdentifier];
  uint64_t v7 = [a1 _currentIdentifier];
  id v48 = 0;
  uint64_t v8 = [v7 resultWithError:&v48];
  id v9 = v48;

  uint64_t v10 = +[AMSLogConfig sharedConfig];
  uint64_t v11 = v10;
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      __int16 v50 = v13;
      __int16 v51 = 2114;
      uint64_t v52 = v5;
      __int16 v53 = 2114;
      id v54 = v9;
      id v14 = v13;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [auto-enrollment] Failed to obtain current DPAN identifier during auto-enrollment check with error: %{public}@", buf, 0x20u);
    }
LABEL_25:

    goto LABEL_26;
  }
  if (!v10)
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v15 = [v11 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = objc_opt_class();
    id v42 = v16;
    AMSHashIfNeeded(v8);
    uint64_t v45 = v8;
    v18 = uint64_t v17 = v6;
    uint64_t v19 = AMSHashIfNeeded(v17);
    AMSHashIfNeeded(v4);
    v21 = id v20 = v4;
    *(_DWORD *)buf = 138544386;
    __int16 v50 = v16;
    __int16 v51 = 2114;
    uint64_t v52 = v5;
    __int16 v53 = 2114;
    id v54 = v18;
    __int16 v55 = 2114;
    v56 = v19;
    __int16 v57 = 2114;
    v58 = v21;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Comparing current extended enrollment identifier: %{public}@, with cached identifier: %{public}@, countryCode: %{public}@", buf, 0x34u);

    id v4 = v20;
    uint64_t v6 = v17;
    uint64_t v8 = v45;
  }
  if (v6 && [v6 isEqualToString:v8])
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = objc_msgSend(v9, "OSLogObject", v42);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      __int16 v50 = v22;
      __int16 v51 = 2114;
      uint64_t v52 = v5;
      id v23 = v22;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Skipping auto-enrollment due to identical identifiers", buf, 0x16u);
    }
    goto LABEL_26;
  }
  id v46 = v4;
  uint64_t v24 = objc_msgSend(a1, "_cardEligibilityStatusForCountryCode:", v4, v42);
  id v47 = 0;
  uint64_t v25 = [v24 resultWithError:&v47];
  id v9 = v47;
  uint64_t v43 = [v25 integerValue];

  uint64_t v26 = +[AMSLogConfig sharedConfig];
  if (!v26)
  {
    uint64_t v26 = +[AMSLogConfig sharedConfig];
  }
  id v27 = objc_msgSend(v26, "OSLogObject", v43);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = objc_opt_class();
    id v29 = (void *)MEMORY[0x1E4F28ED0];
    id v30 = v8;
    uint64_t v31 = v6;
    id v32 = v28;
    id v33 = [v29 numberWithInteger:v44];
    *(_DWORD *)buf = 138543874;
    __int16 v50 = v28;
    __int16 v51 = 2114;
    uint64_t v52 = v5;
    __int16 v53 = 2114;
    id v54 = v33;
    _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Auto-enrollment card eligibility status: %{public}@", buf, 0x20u);

    uint64_t v6 = v31;
    uint64_t v8 = v30;
  }

  id v4 = v46;
  if (v9)
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v34 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      __int16 v50 = v34;
      __int16 v51 = 2114;
      uint64_t v52 = v5;
      __int16 v53 = 2114;
      id v54 = v9;
      id v35 = v34;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [auto-enrollment] Failed to obtain card eligibility status during auto-enrollment with error: %{public}@", buf, 0x20u);
    }
    goto LABEL_25;
  }
  if (v44 == 1)
  {
    BOOL v36 = 1;
    goto LABEL_27;
  }
  id v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v11 = [v9 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v38 = objc_opt_class();
    id v39 = (void *)MEMORY[0x1E4F28ED0];
    id v40 = v38;
    uint64_t v41 = [v39 numberWithInteger:v44];
    *(_DWORD *)buf = 138543874;
    __int16 v50 = v38;
    __int16 v51 = 2114;
    uint64_t v52 = v5;
    __int16 v53 = 2114;
    id v54 = v41;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] [auto-enrollment] Skipping auto-enrollment due to card eligility status: %{public}@", buf, 0x20u);

    id v4 = v46;
  }
LABEL_26:

  BOOL v36 = 0;
LABEL_27:

  return v36;
}

@end