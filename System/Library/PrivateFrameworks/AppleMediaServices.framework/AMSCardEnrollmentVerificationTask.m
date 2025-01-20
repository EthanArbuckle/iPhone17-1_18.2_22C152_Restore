@interface AMSCardEnrollmentVerificationTask
+ (id)_performSilentEnrollmentPaymentSessionWithContext:(id)a3;
+ (id)performPaymentVerificationForPayment:(id)a3 isDefault:(BOOL)a4;
+ (id)performPaymentVerificationForPayment:(id)a3 isDefault:(BOOL)a4 bag:(id)a5;
+ (void)verifyPayment:(id)a3 isDefault:(BOOL)a4 bag:(id)a5 completion:(id)a6;
+ (void)verifyPayment:(id)a3 isDefault:(BOOL)a4 completion:(id)a5;
@end

@implementation AMSCardEnrollmentVerificationTask

+ (void)verifyPayment:(id)a3 isDefault:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, uint64_t, id))a5;
  v9 = [a1 performPaymentVerificationForPayment:a3 isDefault:v5];
  id v17 = 0;
  v10 = [v9 resultWithError:&v17];
  id v11 = v17;

  if (v11)
  {
    v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      id v15 = v14;
      v16 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      v19 = v14;
      __int16 v20 = 2114;
      v21 = v16;
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed with error: %{public}@", buf, 0x20u);
    }
  }
  if (v8) {
    v8[2](v8, [v10 BOOLValue], v11);
  }
}

+ (void)verifyPayment:(id)a3 isDefault:(BOOL)a4 bag:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v10 = (void (**)(id, uint64_t, id))a6;
  id v11 = [a1 performPaymentVerificationForPayment:a3 isDefault:v7 bag:a5];
  id v19 = 0;
  v12 = [v11 resultWithError:&v19];
  id v13 = v19;

  if (v13)
  {
    v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      id v17 = v16;
      v18 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      v21 = v16;
      __int16 v22 = 2114;
      id v23 = v18;
      __int16 v24 = 2114;
      id v25 = v13;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed with error: %{public}@", buf, 0x20u);
    }
  }
  if (v10) {
    v10[2](v10, [v12 BOOLValue], v13);
  }
}

+ (id)performPaymentVerificationForPayment:(id)a3 isDefault:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = AMSSetLogKeyIfNeeded();
  BOOL v7 = objc_alloc_init(AMSPromise);
  v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    v8 = +[AMSLogConfig sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    id v11 = (void *)MEMORY[0x1E4F28ED0];
    id v12 = v5;
    id v13 = v10;
    v14 = [v11 numberWithBool:v4];
    int v25 = 138543874;
    uint64_t v26 = v10;
    __int16 v27 = 2114;
    v28 = v6;
    __int16 v29 = 2114;
    v30 = v14;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing silent-enrolllment payment verification with isDefault: %{public}@", (uint8_t *)&v25, 0x20u);

    id v5 = v12;
  }

  id v15 = [(id)objc_opt_class() bagSubProfile];
  v16 = [(id)objc_opt_class() bagSubProfileVersion];
  id v17 = +[AMSBag bagForProfile:v15 profileVersion:v16];
  if (v17)
  {
    v18 = [(id)objc_opt_class() performPaymentVerificationForPayment:v5 isDefault:v4 bag:v17];
  }
  else
  {
    id v19 = +[AMSLogConfig sharedConfig];
    if (!v19)
    {
      id v19 = +[AMSLogConfig sharedConfig];
    }
    __int16 v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_opt_class();
      int v25 = 138543618;
      uint64_t v26 = v21;
      __int16 v27 = 2114;
      v28 = v6;
      id v22 = v21;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load bag", (uint8_t *)&v25, 0x16u);
    }
    id v23 = AMSError(203, @"Silent Enrollment Error", @"Bag Load Failed", 0);
    [(AMSPromise *)v7 finishWithError:v23];
    v18 = v7;
  }
  return v18;
}

+ (id)performPaymentVerificationForPayment:(id)a3 isDefault:(BOOL)a4 bag:(id)a5
{
  BOOL v6 = a4;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v7 = a5;
  v8 = AMSSetLogKeyIfNeeded();
  v9 = objc_alloc_init(AMSMutablePromise);
  v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v13 = (void *)MEMORY[0x1E4F28ED0];
    id v14 = v12;
    id v15 = [v13 numberWithBool:v6];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    v84 = v15;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing silent-enrolllment payment verification with isDefault: %{public}@", buf, 0x20u);
  }
  v16 = [v7 BOOLForKey:@"use-silent-enrollment"];
  id v17 = [v16 valueWithError:0];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_24;
  }
  v18 = [v7 BOOLForKey:@"use-silent-enrollment"];
  id v19 = [v18 valueWithError:0];
  char v20 = [v19 BOOLValue];

  if ((v20 & 1) == 0)
  {
LABEL_24:
    v43 = +[AMSLogConfig sharedConfig];
    if (!v43)
    {
      v43 = +[AMSLogConfig sharedConfig];
    }
    v44 = [v43 OSLogObject];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v45;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      id v46 = v45;
      _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed for feature not enabled", buf, 0x16u);
    }
    id v22 = AMSError(5, @"Silent Enrollment Error", @"Feature Not Enabled", 0);
    [(AMSMutablePromise *)v9 finishWithError:v22];
    v42 = v9;
    goto LABEL_51;
  }
  v21 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v22 = objc_msgSend(v21, "ams_activeiTunesAccount");

  if (v22)
  {
    id v23 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v74 = objc_msgSend(v23, "ams_activeiCloudAccount");

    if (v74)
    {
      __int16 v24 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      char v25 = objc_msgSend(v24, "ams_isActiveAccountCombined");

      if (v25)
      {
        v73 = [[AMSURLRequestEncoder alloc] initWithBag:v7];
        [(AMSURLRequestEncoder *)v73 setAccount:v74];
        [(AMSURLRequestEncoder *)v73 setRequestEncoding:1];
        uint64_t v26 = [v77 token];
        v70 = [v26 paymentData];

        __int16 v27 = +[AMSLogConfig sharedConfig];
        if (!v27)
        {
          __int16 v27 = +[AMSLogConfig sharedConfig];
        }
        v28 = [v27 OSLogObject];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v29 = objc_opt_class();
          v30 = (void *)MEMORY[0x1E4F28ED0];
          id v71 = v29;
          uint64_t v31 = [v30 numberWithBool:v6];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v29;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v8;
          *(_WORD *)&buf[22] = 2114;
          v84 = v31;
          _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Is card default? %{public}@", buf, 0x20u);
        }
        v32 = [v7 URLForKey:@"applePayEnroll"];
        v33 = [v32 valueWithError:0];

        if (v6) {
          v34 = &unk_1EDD01A20;
        }
        else {
          v34 = &unk_1EDD01A48;
        }
        v35 = objc_msgSend(v33, "ams_URLByAppendingQueryParameters:", v34);

        v36 = [(AMSURLRequestEncoder *)v73 requestWithMethod:4 URL:v35 parameters:v70];
        id v78 = 0;
        v37 = [v36 resultWithError:&v78];
        id v72 = v78;

        if (v72)
        {
          v38 = +[AMSLogConfig sharedConfig];
          if (!v38)
          {
            v38 = +[AMSLogConfig sharedConfig];
          }
          v39 = [v38 OSLogObject];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v40;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v8;
            *(_WORD *)&buf[22] = 2114;
            v84 = v72;
            id v41 = v40;
            _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed to encode request with error: %{public}@", buf, 0x20u);
          }
          [(AMSMutablePromise *)v9 finishWithError:v72];
          v42 = v9;
        }
        else
        {
          objc_msgSend(v37, "ams_addSilentEnrollmentHeadersForAccount:", v74);
          uint64_t v79 = 0;
          v80 = &v79;
          uint64_t v81 = 0x2050000000;
          v59 = (void *)getSSSilentEnrollmentContextClass_softClass_0;
          uint64_t v82 = getSSSilentEnrollmentContextClass_softClass_0;
          if (!getSSSilentEnrollmentContextClass_softClass_0)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getSSSilentEnrollmentContextClass_block_invoke_0;
            v84 = &unk_1E559EC70;
            v85 = &v79;
            __getSSSilentEnrollmentContextClass_block_invoke_0((uint64_t)buf);
            v59 = (void *)v80[3];
          }
          v60 = v59;
          _Block_object_dispose(&v79, 8);
          id v61 = objc_alloc_init(v60);
          v62 = objc_msgSend(v74, "ams_DSID");
          [v61 setAccountIdentifier:v62];

          v63 = [v37 valueForHTTPHeaderField:@"X-Apple-ADSID"];
          [v61 setHeaderADSID:v63];

          v64 = [v37 valueForHTTPHeaderField:@"X-Apple-GS-Token"];
          [v61 setHeaderGSToken:v64];

          v65 = [v37 valueForHTTPHeaderField:@"Guid"];
          [v61 setHeaderGuid:v65];

          v66 = [v37 valueForHTTPHeaderField:@"X-MMe-Client-Info"];
          [v61 setHeaderMMeClientInfo:v66];

          v67 = [v37 valueForHTTPHeaderField:@"X-Mme-Device-Id"];
          [v61 setHeaderMMeDeviceId:v67];

          [v61 setParameters:v70];
          v68 = [v35 absoluteString];
          [v61 setURLString:v68];

          v42 = [a1 _performSilentEnrollmentPaymentSessionWithContext:v61];
        }
        goto LABEL_49;
      }
      v55 = +[AMSLogConfig sharedConfig];
      if (!v55)
      {
        v55 = +[AMSLogConfig sharedConfig];
      }
      v56 = [v55 OSLogObject];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v57;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        id v58 = v57;
        _os_log_impl(&dword_18D554000, v56, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed for no combined account", buf, 0x16u);
      }
      AMSError(105, @"Silent Enrollment Error", @"Split Account", 0);
      v73 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      [(AMSMutablePromise *)v9 finishWithError:v73];
    }
    else
    {
      v51 = +[AMSLogConfig sharedConfig];
      if (!v51)
      {
        v51 = +[AMSLogConfig sharedConfig];
      }
      v52 = [v51 OSLogObject];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v53;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        id v54 = v53;
        _os_log_impl(&dword_18D554000, v52, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed for no active iCloud account", buf, 0x16u);
      }
      AMSError(103, @"Silent Enrollment Error", @"No active iCloud account", 0);
      v73 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      [(AMSMutablePromise *)v9 finishWithError:v73];
    }
    v42 = v9;
LABEL_49:

    goto LABEL_51;
  }
  v47 = +[AMSLogConfig sharedConfig];
  if (!v47)
  {
    v47 = +[AMSLogConfig sharedConfig];
  }
  v48 = [v47 OSLogObject];
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    v49 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v49;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    id v50 = v49;
    _os_log_impl(&dword_18D554000, v48, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed for no active iTunes account", buf, 0x16u);
  }
  v75 = AMSError(103, @"Silent Enrollment Error", @"No active iTunes account", 0);
  [(AMSMutablePromise *)v9 finishWithError:v75];
  v42 = v9;

LABEL_51:
  return v42;
}

+ (id)_performSilentEnrollmentPaymentSessionWithContext:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  id v5 = [AMSMutableLazyPromise alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__AMSCardEnrollmentVerificationTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke;
  v9[3] = &unk_1E55A0A40;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = [(AMSMutableLazyPromise *)v5 initWithBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __87__AMSCardEnrollmentVerificationTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v5 = (void *)getSSSilentEnrollmentVerificationClass_softClass;
  uint64_t v15 = getSSSilentEnrollmentVerificationClass_softClass;
  if (!getSSSilentEnrollmentVerificationClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getSSSilentEnrollmentVerificationClass_block_invoke;
    v11[3] = &unk_1E559EC70;
    v11[4] = &v12;
    __getSSSilentEnrollmentVerificationClass_block_invoke((uint64_t)v11);
    id v5 = (void *)v13[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v12, 8);
  id v7 = (void *)[[v6 alloc] initWithSilentEnrollmentContext:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__AMSCardEnrollmentVerificationTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke_2;
  v9[3] = &unk_1E55A0D28;
  void v9[4] = WeakRetained;
  id v10 = v3;
  id v8 = v3;
  [v7 startWithCompletion:v9];
}

void __87__AMSCardEnrollmentVerificationTask__performSilentEnrollmentPaymentSessionWithContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = AMSSetLogKeyIfNeeded();
  if (v6)
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v28 = 138543874;
      *(void *)&v28[4] = objc_opt_class();
      *(_WORD *)&v28[12] = 2114;
      *(void *)&v28[14] = v7;
      *(_WORD *)&v28[22] = 2114;
      id v29 = v6;
      id v10 = *(id *)&v28[4];
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed with error: %{public}@", v28, 0x20u);
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
        *(_DWORD *)v28 = 138543618;
        *(void *)&v28[4] = objc_opt_class();
        *(_WORD *)&v28[12] = 2114;
        *(void *)&v28[14] = v7;
        id v14 = *(id *)&v28[4];
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silent-enrollment payment verification returned response dictionary", v28, 0x16u);
      }
      uint64_t v15 = [v5 objectForKeyedSubscript:@"paymentId"];
      uint64_t v16 = [v15 length];
      uint64_t v17 = +[AMSLogConfig sharedConfig];
      v18 = (void *)v17;
      if (v16)
      {
        if (!v17)
        {
          v18 = +[AMSLogConfig sharedConfig];
        }
        id v19 = objc_msgSend(v18, "OSLogObject", *(_OWORD *)v28, *(void *)&v28[16]);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          char v20 = objc_opt_class();
          *(_DWORD *)v28 = 138543618;
          *(void *)&v28[4] = v20;
          *(_WORD *)&v28[12] = 2114;
          *(void *)&v28[14] = v7;
          id v21 = v20;
          _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silent-enrollment payment verification successfully parsed paymentId", v28, 0x16u);
        }
        [*(id *)(a1 + 40) finishWithResult:MEMORY[0x1E4F1CC38]];
      }
      else
      {
        if (!v17)
        {
          v18 = +[AMSLogConfig sharedConfig];
        }
        __int16 v24 = objc_msgSend(v18, "OSLogObject", *(void *)v28, *(_OWORD *)&v28[8]);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          char v25 = objc_opt_class();
          *(_DWORD *)v28 = 138543618;
          *(void *)&v28[4] = v25;
          *(_WORD *)&v28[12] = 2114;
          *(void *)&v28[14] = v7;
          id v26 = v25;
          _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silent-enrollment payment verification failed to parse paymentId", v28, 0x16u);
        }
        __int16 v27 = AMSError(301, @"Silent Enrollment Error", @"No paymentId", 0);
        [*(id *)(a1 + 40) finishWithError:v27];
      }
    }
    else
    {
      if (!v11)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      id v22 = [v12 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v28 = 138543618;
        *(void *)&v28[4] = objc_opt_class();
        *(_WORD *)&v28[12] = 2114;
        *(void *)&v28[14] = v7;
        id v23 = *(id *)&v28[4];
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent-enrollment payment verification failed with nil response", v28, 0x16u);
      }
      uint64_t v15 = AMSError(301, @"Silent Enrollment Error", @"No response dictionary", 0);
      [*(id *)(a1 + 40) finishWithError:v15];
    }
  }
}

@end