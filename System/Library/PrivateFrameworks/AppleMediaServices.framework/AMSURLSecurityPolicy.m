@interface AMSURLSecurityPolicy
+ (AMSURLSecurityPolicy)defaultPolicy;
- (AMSURLSecurityPolicy)initWithTrustMode:(int64_t)a3;
- (AMSURLSecurityPolicy)initWithTrustMode:(int64_t)a3 pinnedCertificated:(id)a4;
- (BOOL)_evaluateExtendedValidationWithTrust:(__SecTrust *)a3 forTask:(id)a4;
- (BOOL)_evaluatePinnedCertificatesWithTrust:(__SecTrust *)a3 forTask:(id)a4;
- (BOOL)_shouldSkipValidation;
- (BOOL)evaluateTrust:(__SecTrust *)a3 forTask:(id)a4;
- (NSSet)pinnedCertificates;
- (int64_t)trustMode;
- (void)setPinnedCertificates:(id)a3;
- (void)setTrustMode:(int64_t)a3;
@end

@implementation AMSURLSecurityPolicy

+ (AMSURLSecurityPolicy)defaultPolicy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AMSURLSecurityPolicy_defaultPolicy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_153 != -1) {
    dispatch_once(&_MergedGlobals_153, block);
  }
  v2 = (void *)qword_1EB38E068;
  return (AMSURLSecurityPolicy *)v2;
}

uint64_t __37__AMSURLSecurityPolicy_defaultPolicy__block_invoke()
{
  qword_1EB38E068 = [objc_alloc((Class)objc_opt_class()) initWithTrustMode:1];
  return MEMORY[0x1F41817F8]();
}

- (AMSURLSecurityPolicy)initWithTrustMode:(int64_t)a3
{
  return [(AMSURLSecurityPolicy *)self initWithTrustMode:a3 pinnedCertificated:0];
}

- (AMSURLSecurityPolicy)initWithTrustMode:(int64_t)a3 pinnedCertificated:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSURLSecurityPolicy;
  v8 = [(AMSURLSecurityPolicy *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_trustMode = a3;
    objc_storeStrong((id *)&v8->_pinnedCertificates, a4);
  }

  return v9;
}

- (BOOL)evaluateTrust:(__SecTrust *)a3 forTask:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(AMSURLSecurityPolicy *)self trustMode];
  if (v7 == 2)
  {
    BOOL v8 = [(AMSURLSecurityPolicy *)self _evaluatePinnedCertificatesWithTrust:a3 forTask:v6];
  }
  else
  {
    if (v7 != 1)
    {
      BOOL v9 = 1;
      goto LABEL_7;
    }
    BOOL v8 = [(AMSURLSecurityPolicy *)self _evaluateExtendedValidationWithTrust:a3 forTask:v6];
  }
  BOOL v9 = v8;
LABEL_7:

  return v9;
}

- (BOOL)_evaluateExtendedValidationWithTrust:(__SecTrust *)a3 forTask:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = +[AMSURLTaskInfo taskInfoForTask:a4];
    if ([(AMSURLSecurityPolicy *)self _shouldSkipValidation])
    {
      int64_t v7 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v7)
      {
        int64_t v7 = +[AMSLogConfig sharedConfig];
      }
      BOOL v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v9 = objc_opt_class();
        id v10 = v9;
        objc_super v11 = [v6 properties];
        v12 = [v11 logUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = (uint64_t)v9;
        __int16 v33 = 2114;
        v34 = v12;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ignoring extended validation (EV) for trust", buf, 0x16u);
      }
      goto LABEL_8;
    }
    CFErrorRef error = 0;
    if (!SecTrustEvaluateWithError(a3, &error) || error)
    {
      v18 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v18)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = objc_opt_class();
        v21 = [v6 properties];
        v22 = [v21 logUUID];
        *(_DWORD *)buf = 138543874;
        uint64_t v32 = v20;
        __int16 v33 = 2114;
        v34 = v22;
        __int16 v35 = 2114;
        CFErrorRef v36 = error;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid trust (EV) error: %{public}@", buf, 0x20u);
      }
      if (error) {
        CFRelease(error);
      }
    }
    else
    {
      CFDictionaryRef v14 = (const __CFDictionary *)SecTrustCopyInfo();
      if (v14)
      {
        CFDictionaryRef v15 = v14;
        v16 = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E4F3BCB0]);
        if (objc_opt_respondsToSelector())
        {
          char v17 = [v16 BOOLValue];
          CFRelease(v15);

          if (v17)
          {
LABEL_8:
            BOOL v13 = 1;
LABEL_29:

            return v13;
          }
        }
        else
        {
          CFRelease(v15);
        }
      }
      v23 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v23)
      {
        v23 = +[AMSLogConfig sharedConfig];
      }
      v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_opt_class();
        id v26 = v25;
        v27 = [v6 properties];
        v28 = [v27 logUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = (uint64_t)v25;
        __int16 v33 = 2114;
        v34 = v28;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Trust failed extended validation (EV)", buf, 0x16u);
      }
    }
    BOOL v13 = 0;
    goto LABEL_29;
  }
  return 0;
}

- (BOOL)_evaluatePinnedCertificatesWithTrust:(__SecTrust *)a3 forTask:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = +[AMSURLTaskInfo taskInfoForTask:a4];
    if ([(AMSURLSecurityPolicy *)self _shouldSkipValidation])
    {
      id v7 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v7)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      BOOL v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v9 = objc_opt_class();
        id v10 = v9;
        objc_super v11 = [v6 properties];
        v12 = [v11 logUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = (uint64_t)v9;
        __int16 v46 = 2114;
        v47 = v12;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ignoring certificate pinning validation", buf, 0x16u);
      }
LABEL_8:
      BOOL v13 = 1;
LABEL_36:

      return v13;
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    CFDictionaryRef v14 = [(AMSURLSecurityPolicy *)self pinnedCertificates];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v14);
          }
          SecCertificateRef v19 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((void *)&v40 + 1) + 8 * i));
          [v7 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v16);
    }

    SecTrustSetAnchorCertificates(a3, (CFArrayRef)v7);
    CFErrorRef error = 0;
    if (!SecTrustEvaluateWithError(a3, &error) || error)
    {
      __int16 v33 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v33)
      {
        __int16 v33 = +[AMSLogConfig sharedConfig];
      }
      v34 = [v33 OSLogObject];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = objc_opt_class();
        CFErrorRef v36 = [v6 properties];
        uint64_t v37 = [v36 logUUID];
        *(_DWORD *)buf = 138543874;
        uint64_t v45 = v35;
        __int16 v46 = 2114;
        v47 = v37;
        __int16 v48 = 2114;
        CFErrorRef v49 = error;
        _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid trust (pinned) error: %{public}@", buf, 0x20u);
      }
      if (error) {
        CFRelease(error);
      }
    }
    else
    {
      CFIndex CertificateCount = SecTrustGetCertificateCount(a3);
      if ((CertificateCount & 0x8000000000000000) == 0)
      {
        CFIndex v21 = CertificateCount;
        do
        {
          CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, v21);
          CFDataRef v23 = SecCertificateCopyData(CertificateAtIndex);
          v24 = [(AMSURLSecurityPolicy *)self pinnedCertificates];
          char v25 = [v24 containsObject:v23];

          if (v25) {
            goto LABEL_8;
          }
        }
        while (v21-- >= 1);
      }
      v27 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v27)
      {
        v27 = +[AMSLogConfig sharedConfig];
      }
      v28 = [v27 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = objc_opt_class();
        id v30 = v29;
        v31 = [v6 properties];
        uint64_t v32 = [v31 logUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = (uint64_t)v29;
        __int16 v46 = 2114;
        v47 = v32;
        _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Trust failed certificate pinning validation", buf, 0x16u);
      }
    }
    BOOL v13 = 0;
    goto LABEL_36;
  }
  return 0;
}

- (BOOL)_shouldSkipValidation
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    if (+[AMSDefaults QAMode]
      || +[AMSDefaults ignoreServerTrustEvaluation])
    {
      LOBYTE(has_internal_content) = 1;
    }
    else
    {
      LOBYTE(has_internal_content) = +[AMSDefaults ss_ignoreServerTrustEvaluation];
    }
  }
  return has_internal_content;
}

- (int64_t)trustMode
{
  return self->_trustMode;
}

- (void)setTrustMode:(int64_t)a3
{
  self->_trustMode = a3;
}

- (NSSet)pinnedCertificates
{
  return self->_pinnedCertificates;
}

- (void)setPinnedCertificates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end