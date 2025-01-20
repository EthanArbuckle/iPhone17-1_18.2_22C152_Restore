@interface AMSCardEnrollmentPaymentSessionTask
+ (id)_paymentServiceURLStringForMerchantURL:(id)a3;
+ (id)_performPaymentSessionWithBag:(id)a3 isForParentalVerification:(BOOL)a4;
+ (id)_performSilentEnrollmentPaymentSessionWithContext:(id)a3;
+ (id)performPaymentSessionEnrollmentWithBag:(id)a3;
+ (id)performPaymentSessionForVerificationWithBag:(id)a3;
+ (void)paymentSessionWithBag:(id)a3 completion:(id)a4;
@end

@implementation AMSCardEnrollmentPaymentSessionTask

+ (void)paymentSessionWithBag:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void *, id))a4;
  v7 = [a1 performPaymentSessionEnrollmentWithBag:a3];
  id v15 = 0;
  v8 = [v7 resultWithError:&v15];
  id v9 = v15;

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
      v12 = objc_opt_class();
      id v13 = v12;
      v14 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      v17 = v12;
      __int16 v18 = 2114;
      v19 = v14;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Payment session failed with error: %{public}@", buf, 0x20u);
    }
  }
  if (v6) {
    v6[2](v6, v8, v9);
  }
}

+ (id)performPaymentSessionEnrollmentWithBag:(id)a3
{
  return (id)[a1 _performPaymentSessionWithBag:a3 isForParentalVerification:0];
}

+ (id)performPaymentSessionForVerificationWithBag:(id)a3
{
  return (id)[a1 _performPaymentSessionWithBag:a3 isForParentalVerification:1];
}

+ (id)_performPaymentSessionWithBag:(id)a3 isForParentalVerification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v67 = AMSSetLogKeyIfNeeded();
  v7 = objc_alloc_init(AMSMutablePromise);
  v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v67;
    id v10 = *(id *)&buf[4];
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing silent-enrollment payment session task", buf, 0x16u);
  }
  v11 = [v6 BOOLForKey:@"use-silent-enrollment"];
  v12 = [v11 valueWithError:0];
  if (objc_opt_respondsToSelector())
  {
    id v13 = [v6 BOOLForKey:@"use-silent-enrollment"];
    v14 = [v13 valueWithError:0];
    char v15 = [v14 BOOLValue];

    if (v15)
    {
      v16 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v17 = objc_msgSend(v16, "ams_activeiTunesAccount");

      if (!v17)
      {
        v40 = +[AMSLogConfig sharedConfig];
        if (!v40)
        {
          v40 = +[AMSLogConfig sharedConfig];
        }
        v41 = [v40 OSLogObject];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v42;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v67;
          id v43 = v42;
          _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed for no active iTunes account", buf, 0x16u);
        }
        v19 = AMSError(103, @"Silent Enrollment Error", @"No active iTunes account", 0);
        [(AMSMutablePromise *)v7 finishWithError:v19];
        v35 = v7;
        goto LABEL_45;
      }
      __int16 v18 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v19 = objc_msgSend(v18, "ams_activeiCloudAccount");

      if (v19)
      {
        __int16 v20 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
        char v21 = objc_msgSend(v20, "ams_isActiveAccountCombined");

        if (v21)
        {
          v66 = [[AMSURLRequestEncoder alloc] initWithBag:v6];
          [(AMSURLRequestEncoder *)v66 setAccount:v19];
          uint64_t v22 = [v6 URLForKey:@"applePayPaymentSession"];
          v65 = [v22 valueWithError:0];

          v62 = +[AMSCardEnrollment paymentServicesMerchantURL];
          v64 = [a1 _paymentServiceURLStringForMerchantURL:v62];
          v23 = NSString;
          v24 = [v65 absoluteString];
          v63 = [v23 stringWithFormat:@"%@?paymentServiceUrl=%@", v24, v64];

          if (v4)
          {
            v25 = NSString;
            v26 = [v65 absoluteString];
            uint64_t v27 = [v25 stringWithFormat:@"%@?isPVK=true&paymentServiceUrl=%@", v26, v64];

            v63 = (void *)v27;
          }
          v28 = [(AMSURLRequestEncoder *)v66 requestWithMethod:2 URL:v65 parameters:0];
          id v68 = 0;
          v29 = [v28 resultWithError:&v68];
          id v30 = v68;

          if (v30)
          {
            v31 = +[AMSLogConfig sharedConfig];
            if (!v31)
            {
              v31 = +[AMSLogConfig sharedConfig];
            }
            v32 = [v31 OSLogObject];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v33;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v67;
              *(_WORD *)&buf[22] = 2114;
              v74 = v30;
              id v34 = v33;
              _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed to encode request with error: %{public}@", buf, 0x20u);
            }
            [(AMSMutablePromise *)v7 finishWithError:v30];
            v35 = v7;
          }
          else
          {
            objc_msgSend(v29, "ams_addSilentEnrollmentHeadersForAccount:", v19);
            uint64_t v69 = 0;
            v70 = &v69;
            uint64_t v71 = 0x2050000000;
            v52 = (void *)getSSSilentEnrollmentContextClass_softClass;
            uint64_t v72 = getSSSilentEnrollmentContextClass_softClass;
            if (!getSSSilentEnrollmentContextClass_softClass)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __getSSSilentEnrollmentContextClass_block_invoke;
              v74 = &unk_1E559EC70;
              v75 = &v69;
              __getSSSilentEnrollmentContextClass_block_invoke((uint64_t)buf);
              v52 = (void *)v70[3];
            }
            v53 = v52;
            _Block_object_dispose(&v69, 8);
            id v54 = objc_alloc_init(v53);
            v55 = objc_msgSend(v19, "ams_DSID");
            [v54 setAccountIdentifier:v55];

            v56 = [v29 valueForHTTPHeaderField:@"X-Apple-ADSID"];
            [v54 setHeaderADSID:v56];

            v57 = [v29 valueForHTTPHeaderField:@"X-Apple-GS-Token"];
            [v54 setHeaderGSToken:v57];

            v58 = [v29 valueForHTTPHeaderField:@"Guid"];
            [v54 setHeaderGuid:v58];

            v59 = [v29 valueForHTTPHeaderField:@"X-MMe-Client-Info"];
            [v54 setHeaderMMeClientInfo:v59];

            v60 = [v29 valueForHTTPHeaderField:@"X-Mme-Device-Id"];
            [v54 setHeaderMMeDeviceId:v60];

            [v54 setURLString:v63];
            v35 = [a1 _performSilentEnrollmentPaymentSessionWithContext:v54];
          }
          goto LABEL_44;
        }
        v48 = +[AMSLogConfig sharedConfig];
        if (!v48)
        {
          v48 = +[AMSLogConfig sharedConfig];
        }
        v49 = [v48 OSLogObject];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v50;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v67;
          id v51 = v50;
          _os_log_impl(&dword_18D554000, v49, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed for no combined account", buf, 0x16u);
        }
        AMSError(105, @"Silent Enrollment Error", @"Split Account", 0);
        v66 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
        [(AMSMutablePromise *)v7 finishWithError:v66];
      }
      else
      {
        v44 = +[AMSLogConfig sharedConfig];
        if (!v44)
        {
          v44 = +[AMSLogConfig sharedConfig];
        }
        v45 = [v44 OSLogObject];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v46;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v67;
          id v47 = v46;
          _os_log_impl(&dword_18D554000, v45, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed for no active iCloud account", buf, 0x16u);
        }
        AMSError(103, @"Silent Enrollment Error", @"No active iCloud account", 0);
        v66 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
        [(AMSMutablePromise *)v7 finishWithError:v66];
      }
      v35 = v7;
LABEL_44:

LABEL_45:
      goto LABEL_46;
    }
  }
  else
  {
  }
  v36 = +[AMSLogConfig sharedConfig];
  if (!v36)
  {
    v36 = +[AMSLogConfig sharedConfig];
  }
  v37 = [v36 OSLogObject];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    v38 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v38;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v67;
    id v39 = v38;
    _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed for feature not enabled", buf, 0x16u);
  }
  v17 = AMSError(5, @"Silent Enrollment Error", @"Feature Not Enabled", 0);
  [(AMSMutablePromise *)v7 finishWithError:v17];
  v35 = v7;
LABEL_46:

  return v35;
}

+ (id)_paymentServiceURLStringForMerchantURL:(id)a3
{
  v3 = objc_msgSend(a3, "ams_URLByDeletingTrailingSlash");
  BOOL v4 = [v3 absoluteString];
  v5 = [v3 host];
  uint64_t v6 = [v4 rangeOfString:v5];

  v7 = [v3 absoluteString];
  v8 = [v7 substringFromIndex:v6];

  id v9 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":/"];
  id v10 = [v9 invertedSet];
  v11 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v10];

  return v11;
}

+ (id)_performSilentEnrollmentPaymentSessionWithContext:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  v5 = [AMSMutableLazyPromise alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__AMSCardEnrollmentPaymentSessionTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke;
  v9[3] = &unk_1E55A0A40;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  v7 = [(AMSMutableLazyPromise *)v5 initWithBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __89__AMSCardEnrollmentPaymentSessionTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)getSSSilentEnrollmentPaymentSessionClass_softClass;
  uint64_t v15 = getSSSilentEnrollmentPaymentSessionClass_softClass;
  if (!getSSSilentEnrollmentPaymentSessionClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getSSSilentEnrollmentPaymentSessionClass_block_invoke;
    v11[3] = &unk_1E559EC70;
    v11[4] = &v12;
    __getSSSilentEnrollmentPaymentSessionClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v12, 8);
  v7 = (void *)[[v6 alloc] initWithSilentEnrollmentContext:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__AMSCardEnrollmentPaymentSessionTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke_2;
  v9[3] = &unk_1E55A0D28;
  void v9[4] = WeakRetained;
  id v10 = v3;
  id v8 = v3;
  [v7 startWithCompletion:v9];
}

void __89__AMSCardEnrollmentPaymentSessionTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = AMSSetLogKeyIfNeeded();
  if (v6)
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v27 = v6;
      id v10 = *(id *)&buf[4];
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed with error: %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
    uint64_t v12 = (void *)v11;
    if (v5)
    {
      if (!v11)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      id v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v7;
        id v14 = *(id *)&buf[4];
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silent-enrollment payment session returned response dictionary", buf, 0x16u);
      }
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2050000000;
      uint64_t v15 = (void *)_MergedGlobals_91;
      uint64_t v25 = _MergedGlobals_91;
      if (!_MergedGlobals_91)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getPKPaymentMerchantSessionClass_block_invoke;
        uint64_t v27 = &unk_1E559EC70;
        v28 = &v22;
        __getPKPaymentMerchantSessionClass_block_invoke((uint64_t)buf);
        uint64_t v15 = (void *)v23[3];
      }
      v16 = v15;
      _Block_object_dispose(&v22, 8);
      id v17 = [v16 alloc];
      __int16 v18 = objc_msgSend(v17, "initWithDictionary:", v5, v22);
      [*(id *)(a1 + 40) finishWithResult:v18];
    }
    else
    {
      if (!v11)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v12 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v7;
        id v20 = *(id *)&buf[4];
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment session failed with nil response", buf, 0x16u);
      }
      char v21 = AMSError(301, @"Silent Enrollment Error", @"No response dictionary", 0);
      [*(id *)(a1 + 40) finishWithError:v21];
    }
  }
}

@end