@interface AMSBiometricsSignatureRequest
+ (BOOL)supportsSecureCoding;
+ (id)biometricsSignatureRequestForURLResponse:(id)a3 account:(id)a4 session:(id)a5 task:(id)a6 clientInfo:(id)a7 options:(id)a8 error:(id *)a9;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSBiometricsSignatureRequest)initWithAccount:(id)a3 clientInfo:(id)a4 challenge:(id)a5 localAuthContext:(id)a6 options:(id)a7 error:(id *)a8;
- (AMSBiometricsSignatureRequest)initWithCoder:(id)a3;
- (AMSKeychainOptions)keychainOptions;
- (AMSProcessInfo)clientInfo;
- (BOOL)isDualAction;
- (BOOL)shouldUseApplePayClassic;
- (BOOL)shouldUseAutoEnrollment;
- (LAContext)localAuthContext;
- (NSDictionary)localAuthOptions;
- (NSString)challenge;
- (__SecAccessControl)localAuthAccessControlRef;
- (id)_localAuthOptions;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBag:(id)a3;
- (void)setDualAction:(BOOL)a3;
- (void)setLocalAuthAccessControlRef:(__SecAccessControl *)a3;
- (void)setUseApplePayClassic:(BOOL)a3;
- (void)setUseAutoEnrollment:(BOOL)a3;
@end

@implementation AMSBiometricsSignatureRequest

+ (id)biometricsSignatureRequestForURLResponse:(id)a3 account:(id)a4 session:(id)a5 task:(id)a6 clientInfo:(id)a7 options:(id)a8 error:(id *)a9
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = objc_msgSend(v14, "ams_valueForHTTPHeaderField:", @"X-Apple-TID-Challenge");
  if (v20)
  {
    id v53 = v17;
    id v54 = v16;
    v21 = [[AMSBiometricsIdentityMapChangeTask alloc] initWithAccount:v15 session:v16 task:v17];
    [(AMSTask *)v21 setRunMode:1];
    v22 = [(AMSBiometricsIdentityMapChangeTask *)v21 perform];
    id v60 = 0;
    int v23 = [v22 resultWithError:&v60];
    id v24 = v60;

    if (!v23)
    {
      id v57 = v18;
      v38 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v38)
      {
        v38 = +[AMSLogConfig sharedConfig];
      }
      v39 = [v38 OSLogObject];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = objc_opt_class();
        id v51 = v19;
        id v41 = v40;
        v42 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        v62 = v40;
        __int16 v63 = 2114;
        v64 = v42;
        _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric authentication for invalid identity map", buf, 0x16u);

        id v19 = v51;
      }

      if (a9)
      {
        id v36 = v24;
        v37 = 0;
        *a9 = v36;
      }
      else
      {
        v37 = 0;
        id v36 = v24;
      }
      id v17 = v53;
      id v18 = v57;
      goto LABEL_34;
    }
    id v50 = v19;
    id v52 = v15;
    v25 = (void *)[v19 copy];
    v26 = objc_msgSend(v14, "ams_valueForHTTPHeaderField:", @"X-Apple-TID-Pkeyid");
    if ([v26 isEqualToString:0x1EDCAC608])
    {
      uint64_t v27 = 0;
    }
    else
    {
      if (![v26 isEqual:0x1EDCAC628])
      {
LABEL_20:
        id v59 = v24;
        v43 = [[AMSBiometricsSignatureRequest alloc] initWithAccount:v52 clientInfo:v18 challenge:v20 localAuthContext:0 options:v25 error:&v59];
        id v36 = v59;

        if (v36)
        {
          id v58 = v18;
          v44 = +[AMSLogConfig sharedPurchaseConfig];
          if (!v44)
          {
            v44 = +[AMSLogConfig sharedConfig];
          }
          v45 = [v44 OSLogObject];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v55 = v43;
            v46 = objc_opt_class();
            id v49 = v46;
            v47 = AMSLogKey();
            *(_DWORD *)buf = 138543874;
            v62 = v46;
            v43 = v55;
            __int16 v63 = 2114;
            v64 = v47;
            __int16 v65 = 2114;
            id v66 = v36;
            _os_log_impl(&dword_18D554000, v45, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate biometrics request. Error: %{public}@", buf, 0x20u);
          }
          v37 = 0;
          if (a9) {
            *a9 = v36;
          }
          id v17 = v53;
          id v18 = v58;
        }
        else
        {
          v37 = v43;
          id v17 = v53;
        }

        id v19 = v50;
        id v15 = v52;
LABEL_34:

        id v16 = v54;
        goto LABEL_35;
      }
      uint64_t v27 = 1;
    }
    [v25 setPurpose:v27];
    goto LABEL_20;
  }
  id v56 = v18;
  v28 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v28)
  {
    v28 = +[AMSLogConfig sharedConfig];
  }
  v29 = [v28 OSLogObject];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_opt_class();
    id v31 = v14;
    id v32 = v19;
    id v33 = v30;
    v34 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    v62 = v30;
    __int16 v63 = 2114;
    v64 = v34;
    _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric authentication, response does not have challenge header", buf, 0x16u);

    id v19 = v32;
    id v14 = v31;
    v20 = 0;
  }

  v35 = AMSError(301, @"Missing Challenge Header", @"The response is missing the X-Apple-TID-Challenge header.", 0);
  id v36 = v35;
  if (a9)
  {
    id v36 = v35;
    v37 = 0;
    *a9 = v36;
  }
  else
  {
    v37 = 0;
  }
  id v18 = v56;
LABEL_35:

  return v37;
}

- (AMSBiometricsSignatureRequest)initWithAccount:(id)a3 clientInfo:(id)a4 challenge:(id)a5 localAuthContext:(id)a6 options:(id)a7 error:(id *)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v36 = a5;
  id v17 = a6;
  id v18 = a7;
  v39.receiver = self;
  v39.super_class = (Class)AMSBiometricsSignatureRequest;
  id v19 = [(AMSBiometricsSignatureRequest *)&v39 init];
  v20 = v19;
  if (!v19)
  {
    id v22 = 0;
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v19->_account, a3);
  objc_storeStrong((id *)&v20->_clientInfo, a4);
  objc_storeStrong((id *)&v20->_challenge, a5);
  objc_storeStrong((id *)&v20->_keychainOptions, a7);
  id v38 = 0;
  v21 = +[AMSKeychain copyAccessControlRefWithAccount:v15 options:v18 error:&v38];
  id v22 = v38;
  v20->_localAuthAccessControlRef = v21;
  if (v21)
  {
    if (v17)
    {
LABEL_4:
      int v23 = (LAContext *)v17;
      goto LABEL_12;
    }
  }
  else
  {
    id v35 = v16;
    id v24 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v24)
    {
      id v24 = +[AMSLogConfig sharedConfig];
    }
    v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_opt_class();
      id v34 = v26;
      uint64_t v27 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      id v41 = v26;
      __int16 v42 = 2114;
      v43 = v27;
      __int16 v44 = 2114;
      id v45 = v22;
      _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to copy access control reference with error: %{public}@", buf, 0x20u);
    }
    id v37 = v22;
    v28 = +[AMSKeychain createAccessControlRefWithOptions:v18 error:&v37];
    id v29 = v37;

    v20->_localAuthAccessControlRef = v28;
    id v22 = v29;
    id v16 = v35;
    if (v17) {
      goto LABEL_4;
    }
  }
  int v23 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
LABEL_12:
  localAuthContext = v20->_localAuthContext;
  v20->_localAuthContext = v23;

  if (v22)
  {

    if (a8)
    {
      id v22 = v22;
      v20 = 0;
      *a8 = v22;
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    uint64_t v31 = [(AMSBiometricsSignatureRequest *)v20 _localAuthOptions];
    localAuthOptions = v20->_localAuthOptions;
    v20->_localAuthOptions = (NSDictionary *)v31;
  }
LABEL_17:

  return v20;
}

- (AMSBiometricsSignatureRequest)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  id v22 = [v4 decodeObjectOfClass:v5 forKey:@"kAccountKey"];

  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChallengeKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kClientInfoKey"];
  uint64_t v7 = [v4 decodeBoolForKey:@"kDualActionKey"];
  uint64_t v8 = [v4 decodeBoolForKey:@"kUseApplePayClassicKey"];
  uint64_t v9 = [v4 decodeBoolForKey:@"kUseAutoEnrollmentKey"];
  v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kKeychainOptionsKey"];

  v12 = [[AMSKeychainOptions alloc] initWithOptionsDictionary:v11];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLocalAuthContextKey"];

  if (v13) {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F30B50]) initWithExternalizedContext:v13];
  }
  else {
    id v14 = 0;
  }
  id v23 = 0;
  id v15 = [(AMSBiometricsSignatureRequest *)self initWithAccount:v22 clientInfo:v6 challenge:v21 localAuthContext:v14 options:v12 error:&v23];
  id v16 = v23;
  [(AMSBiometricsSignatureRequest *)v15 setDualAction:v7];
  [(AMSBiometricsSignatureRequest *)v15 setUseApplePayClassic:v8];
  [(AMSBiometricsSignatureRequest *)v15 setUseAutoEnrollment:v9];
  if (v16)
  {
    id v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    id v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v19;
      __int16 v26 = 2114;
      id v27 = v16;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Error re-initializing signature request. %{public}@", buf, 0x16u);
    }
  }
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(AMSBiometricsSignatureRequest *)self account];
  [v11 encodeObject:v4 forKey:@"kAccountKey"];

  v5 = [(AMSBiometricsSignatureRequest *)self challenge];
  [v11 encodeObject:v5 forKey:@"kChallengeKey"];

  v6 = [(AMSBiometricsSignatureRequest *)self clientInfo];
  [v11 encodeObject:v6 forKey:@"kClientInfoKey"];

  objc_msgSend(v11, "encodeBool:forKey:", -[AMSBiometricsSignatureRequest isDualAction](self, "isDualAction"), @"kDualActionKey");
  objc_msgSend(v11, "encodeBool:forKey:", -[AMSBiometricsSignatureRequest shouldUseApplePayClassic](self, "shouldUseApplePayClassic"), @"kUseApplePayClassicKey");
  objc_msgSend(v11, "encodeBool:forKey:", -[AMSBiometricsSignatureRequest shouldUseAutoEnrollment](self, "shouldUseAutoEnrollment"), @"kUseAutoEnrollmentKey");
  uint64_t v7 = [(AMSBiometricsSignatureRequest *)self keychainOptions];
  uint64_t v8 = [v7 optionsDictionary];
  [v11 encodeObject:v8 forKey:@"kKeychainOptionsKey"];

  uint64_t v9 = [(AMSBiometricsSignatureRequest *)self localAuthContext];
  v10 = [v9 externalizedContext];

  if (v10) {
    [v11 encodeObject:v10 forKey:@"kLocalAuthContextKey"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__SecAccessControl)localAuthAccessControlRef
{
  return self->_localAuthAccessControlRef;
}

- (void)setLocalAuthAccessControlRef:(__SecAccessControl *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  localAuthAccessControlRef = self->_localAuthAccessControlRef;
  if (localAuthAccessControlRef) {
    CFRelease(localAuthAccessControlRef);
  }
  self->_localAuthAccessControlRef = a3;
}

- (void)dealloc
{
  localAuthAccessControlRef = self->_localAuthAccessControlRef;
  if (localAuthAccessControlRef) {
    CFRelease(localAuthAccessControlRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)AMSBiometricsSignatureRequest;
  [(AMSBiometricsSignatureRequest *)&v4 dealloc];
}

- (id)_localAuthOptions
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v4 = AMSSetLogKeyIfNeeded();
  v5 = [(AMSBiometricsSignatureRequest *)self clientInfo];
  v6 = [(AMSBiometricsSignatureRequest *)self clientInfo];
  uint64_t v7 = [v6 proxyAppBundleID];

  if (v7)
  {
    uint64_t v8 = [AMSProcessInfo alloc];
    uint64_t v9 = [(AMSBiometricsSignatureRequest *)self clientInfo];
    v10 = [v9 proxyAppBundleID];
    uint64_t v11 = [(AMSProcessInfo *)v8 initWithBundleIdentifier:v10];

    v5 = (void *)v11;
  }
  v12 = [(AMSBiometricsSignatureRequest *)self keychainOptions];
  int v13 = [v12 displayAuthenticationReason];

  if (v13)
  {
    id v14 = NSString;
    id v15 = AMSLocalizedString(@"TOUCHID_AUTHENTICATION_REASON_APPLE_ACCOUNT", 0);
    id v16 = [(AMSBiometricsSignatureRequest *)self account];
    id v17 = [v16 username];
    id v18 = [v14 stringWithValidatedFormat:v15, @"%@", 0, v17 validFormatSpecifiers error];
    [v3 setObject:v18 forKeyedSubscript:&unk_1EDD00D90];
  }
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:&unk_1EDD00DA8];
  uint64_t v19 = [v5 bundleURL];

  if (v19)
  {
    if (os_variant_has_internal_content()
      && !+[AMSProcessInfo BOOLForEntitlement:@"com.apple.private.CoreAuthentication.SPI"])
    {
      v20 = +[AMSLogConfig sharedConfig];
      if (!v20)
      {
        v20 = +[AMSLogConfig sharedConfig];
      }
      v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = NSString;
        uint64_t v23 = objc_opt_class();
        if (v4) {
          [v22 stringWithFormat:@"%@: [%@] ", v23, v4];
        }
        else {
        id v24 = [v22 stringWithFormat:@"%@: ", v23, v41];
        }
        *(_DWORD *)buf = 138543618;
        v43 = v24;
        __int16 v44 = 2114;
        id v45 = @"Attempting to set the icon bundle path on the local auth options, but we don’t have the correct entitlement.";
        _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@%{public}@", buf, 0x16u);
      }
    }
    uint64_t v25 = NSString;
    id v26 = [v5 bundleURL];
    id v27 = objc_msgSend(v25, "stringWithUTF8String:", objc_msgSend(v26, "fileSystemRepresentation"));
    [v3 setObject:v27 forKeyedSubscript:&unk_1EDD00DC0];
  }
  uint64_t v28 = [v5 localizedName];

  if (v28)
  {
    if (os_variant_has_internal_content()
      && !+[AMSProcessInfo BOOLForEntitlement:@"com.apple.private.LocalAuthentication.CallerName"])
    {
      id v29 = +[AMSLogConfig sharedConfig];
      if (!v29)
      {
        id v29 = +[AMSLogConfig sharedConfig];
      }
      v30 = [v29 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = NSString;
        uint64_t v32 = objc_opt_class();
        if (v4) {
          [v31 stringWithFormat:@"%@: [%@] ", v32, v4];
        }
        else {
        id v33 = [v31 stringWithFormat:@"%@: ", v32, v41];
        }
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        __int16 v44 = 2114;
        id v45 = @"Attempting to set the caller name on the local auth options, but we don’t have the correct entitlement.";
        _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@%{public}@", buf, 0x16u);
      }
    }
    id v34 = [v5 localizedName];
    [v3 setObject:v34 forKeyedSubscript:&unk_1EDD00DD8];
  }
  id v35 = (void *)MEMORY[0x1E4F28ED0];
  id v36 = [(AMSBiometricsSignatureRequest *)self keychainOptions];
  id v37 = objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "authenticationFallbackVisible"));
  [v3 setObject:v37 forKeyedSubscript:&unk_1EDD00DF0];

  id v38 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:5];
  [v3 setObject:v38 forKeyedSubscript:&unk_1EDD00E08];

  objc_super v39 = AMSLocalizedString(@"BIO_USE_PASSWORD", 0);
  [v3 setObject:v39 forKeyedSubscript:&unk_1EDD00E20];

  return v3;
}

- (LAContext)localAuthContext
{
  return self->_localAuthContext;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSString)challenge
{
  return self->_challenge;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (BOOL)isDualAction
{
  return self->_dualAction;
}

- (void)setDualAction:(BOOL)a3
{
  self->_dualAction = a3;
}

- (AMSKeychainOptions)keychainOptions
{
  return self->_keychainOptions;
}

- (NSDictionary)localAuthOptions
{
  return self->_localAuthOptions;
}

- (BOOL)shouldUseApplePayClassic
{
  return self->_useApplePayClassic;
}

- (void)setUseApplePayClassic:(BOOL)a3
{
  self->_useApplePayClassic = a3;
}

- (BOOL)shouldUseAutoEnrollment
{
  return self->_useAutoEnrollment;
}

- (void)setUseAutoEnrollment:(BOOL)a3
{
  self->_useAutoEnrollment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthOptions, 0);
  objc_storeStrong((id *)&self->_keychainOptions, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_localAuthContext, 0);
}

@end