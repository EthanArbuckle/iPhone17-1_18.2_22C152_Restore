@interface ECSecureMIMETrustEvaluation
+ (BOOL)supportsSecureCoding;
+ (NSArray)anchorCertificatesForTesting;
+ (OS_os_log)log;
+ (id)evaluateTrust:(__SecTrust *)a3 withOptions:(unint64_t)a4 signerEmailAddress:(id)a5;
+ (id)reevaluateWithNetworkAccessAllowed:(id)a3;
+ (void)setAnchorCertificatesForTesting:(id)a3;
- (BOOL)requiresReevaluationWithNetworkAccess;
- (ECSecureMIMETrustEvaluation)initWithCoder:(id)a3;
- (NSError)error;
- (NSString)description;
- (NSString)signerEmailAddress;
- (__SecTrust)trust;
- (id)_initWithTrust:(__SecTrust *)a3 options:(unint64_t)a4 signerEmailAddress:(id)a5;
- (unint64_t)options;
- (unsigned)trustResult;
- (void)_evaluate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ECSecureMIMETrustEvaluation

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ECSecureMIMETrustEvaluation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, block);
  }
  v2 = (void *)log_log_3;
  return (OS_os_log *)v2;
}

void __34__ECSecureMIMETrustEvaluation_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;
}

+ (id)evaluateTrust:(__SecTrust *)a3 withOptions:(unint64_t)a4 signerEmailAddress:(id)a5
{
  id v8 = a5;
  v9 = (void *)[objc_alloc((Class)a1) _initWithTrust:a3 options:a4 signerEmailAddress:v8];

  return v9;
}

+ (id)reevaluateWithNetworkAccessAllowed:(id)a3
{
  v17[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 requiresReevaluationWithNetworkAccess])
  {
    v17[0] = 0;
    v5 = serializeTrust([v4 trust], v17);
    id v6 = v17[0];
    v7 = v6;
    if (v5)
    {
      id v16 = v6;
      id v8 = (const void *)copyDeserializedTrust((uint64_t)v5, &v16);
      id v9 = v16;

      if (v8)
      {

        uint64_t v10 = [v4 options];
        uint64_t v11 = [v4 trust];
        v12 = [v4 signerEmailAddress];
        id v13 = [a1 evaluateTrust:v11 withOptions:v10 | 3 signerEmailAddress:v12];

        CFRelease(v8);
        goto LABEL_12;
      }
      v14 = +[ECSecureMIMETrustEvaluation log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[ECSecureMIMETrustEvaluation reevaluateWithNetworkAccessAllowed:]();
      }
      v7 = v9;
    }
    else
    {
      v14 = +[ECSecureMIMETrustEvaluation log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[ECSecureMIMETrustEvaluation reevaluateWithNetworkAccessAllowed:]();
      }
    }

    id v13 = 0;
  }
  else
  {
    id v13 = v4;
  }
LABEL_12:

  return v13;
}

- (id)_initWithTrust:(__SecTrust *)a3 options:(unint64_t)a4 signerEmailAddress:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v34 = a5;
  if (!a3)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"ECSecureMIMETrustEvaluation.m", 132, @"Invalid parameter not satisfying: %@", @"trust" object file lineNumber description];
  }
  v35.receiver = self;
  v35.super_class = (Class)ECSecureMIMETrustEvaluation;
  id v9 = [(ECSecureMIMETrustEvaluation *)&v35 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_trust = a3;
    CFRetain(a3);
    v10->_unint64_t options = a4;
    uint64_t v11 = [v34 copy];
    signerEmailAddress = v10->_signerEmailAddress;
    v10->_signerEmailAddress = (NSString *)v11;

    trust = v10->_trust;
    unint64_t options = v10->_options;
    CFArrayRef policies = 0;
    LODWORD(Allowed) = SecTrustCopyPolicies(trust, &policies);
    CFArrayRef v33 = policies;
    if (Allowed)
    {
      id v16 = +[ECSecureMIMETrustEvaluation log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ECSecureMIMETrustEvaluation _initWithTrust:options:signerEmailAddress:].cold.4(Allowed, v16);
      }
    }
    else
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      CFArrayRef v18 = v33;
      uint64_t v19 = [(__CFArray *)v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v37;
        v21 = (const void *)*MEMORY[0x1E4F3BBC0];
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v37 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            OidString = (const void *)SecPolicyGetOidString();
            if (!CFEqual(v21, OidString)) {
              [v17 addObject:v23];
            }
          }
          uint64_t v19 = [(__CFArray *)v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v19);
      }

      if ((options & 2) != 0)
      {
        if (options) {
          CFOptionFlags v25 = 3;
        }
        else {
          CFOptionFlags v25 = 67;
        }
        SecPolicyRef Revocation = SecPolicyCreateRevocation(v25);
        [v17 addObject:Revocation];
      }
      uint64_t Allowed = SecTrustSetPolicies(trust, v17);
      if (Allowed)
      {
        v27 = +[ECSecureMIMETrustEvaluation log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[ECSecureMIMETrustEvaluation _initWithTrust:options:signerEmailAddress:]((uint64_t)v17, Allowed, v27);
        }
      }
      else
      {
        uint64_t Allowed = SecTrustSetNetworkFetchAllowed(trust, options & 1);
        if (Allowed)
        {
          v27 = +[ECSecureMIMETrustEvaluation log];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[ECSecureMIMETrustEvaluation _initWithTrust:options:signerEmailAddress:](options & 1, Allowed, v27);
          }
        }
        else
        {
          v27 = +[ECSecureMIMETrustEvaluation anchorCertificatesForTesting];
          if (v27)
          {
            LODWORD(Allowed) = SecTrustSetAnchorCertificates(trust, (CFArrayRef)v27);
            if (Allowed)
            {
              v28 = +[ECSecureMIMETrustEvaluation log];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                -[ECSecureMIMETrustEvaluation _initWithTrust:options:signerEmailAddress:]();
              }
            }
          }
          else
          {
            LODWORD(Allowed) = 0;
          }
        }
      }

      if (!Allowed)
      {
        [(ECSecureMIMETrustEvaluation *)v10 _evaluate];
        goto LABEL_36;
      }
    }
    v10->_trustResult = 7;
    uint64_t v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)Allowed userInfo:0];
    error = v10->_error;
    v10->_error = (NSError *)v29;
  }
LABEL_36:

  return v10;
}

- (void)dealloc
{
  CFRelease(self->_trust);
  v3.receiver = self;
  v3.super_class = (Class)ECSecureMIMETrustEvaluation;
  [(ECSecureMIMETrustEvaluation *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ECSecureMIMETrustEvaluation)initWithCoder:(id)a3
{
  v17[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ECSecureMIMETrustEvaluation *)self init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_trust"];
    v17[0] = 0;
    uint64_t v7 = copyDeserializedTrust((uint64_t)v6, v17);
    id v8 = v17[0];
    if (!v7)
    {
      id v9 = +[ECSecureMIMETrustEvaluation log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[ECSecureMIMETrustEvaluation initWithCoder:]();
      }
    }
    v5->_trust = (__SecTrust *)v7;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_signerEmailAddress"];
    signerEmailAddress = v5->_signerEmailAddress;
    v5->_signerEmailAddress = (NSString *)v10;

    v5->_unint64_t options = [v4 decodeIntegerForKey:@"EFPropertyKey_options"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_error"];
    error = v5->_error;
    v5->_error = (NSError *)v12;

    v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"EFPropertyKey_trustResult"];
    v5->_trustResult = [v15 unsignedIntValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11[0] = 0;
  v5 = serializeTrust((uint64_t)[(ECSecureMIMETrustEvaluation *)self trust], v11);
  id v6 = v11[0];
  if (!v5)
  {
    uint64_t v7 = +[ECSecureMIMETrustEvaluation log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[ECSecureMIMETrustEvaluation encodeWithCoder:]();
    }
  }
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_trust"];
  id v8 = [(ECSecureMIMETrustEvaluation *)self signerEmailAddress];
  [v4 encodeObject:v8 forKey:@"EFPropertyKey_signerEmailAddress"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ECSecureMIMETrustEvaluation options](self, "options"), @"EFPropertyKey_options");
  id v9 = [(ECSecureMIMETrustEvaluation *)self error];
  [v4 encodeObject:v9 forKey:@"EFPropertyKey_error"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ECSecureMIMETrustEvaluation trustResult](self, "trustResult"));
  [v4 encodeObject:v10 forKey:@"EFPropertyKey_trustResult"];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = self->_trustResult - 1;
  if (v5 > 6) {
    id v6 = "kSecTrustResultInvalid";
  }
  else {
    id v6 = off_1E63EEED0[v5];
  }
  return (NSString *)[v3 stringWithFormat:@"<%@ %p trust=%@ signerEmailAddress=%@ options=%d trustResult=%s(%d) error=%@>", v4, self, self->_trust, self->_signerEmailAddress, self->_options, v6, self->_trustResult, self->_error];
}

- (void)_evaluate
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1BF11D000, v0, v1, "SecTrustGetTrustResult returned %d, evaluation=%@");
}

- (BOOL)requiresReevaluationWithNetworkAccess
{
  if (self->_options)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  objc_super v3 = [(NSError *)self->_error domain];
  if (![v3 isEqual:*MEMORY[0x1E4F28760]])
  {

    goto LABEL_7;
  }
  NSInteger v4 = [(NSError *)self->_error code];

  if (v4 != -25318)
  {
LABEL_7:
    CFDictionaryRef v6 = SecTrustCopyResult(self->_trust);
    uint64_t v7 = [(__CFDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x1E4F3BCD0]];
    int v5 = [v7 BOOLValue] ^ 1;

    return v5;
  }
  LOBYTE(v5) = 1;
  return v5;
}

+ (NSArray)anchorCertificatesForTesting
{
  v2 = (void *)[(id)sAnchorCertificatesForTesting copy];
  return (NSArray *)v2;
}

+ (void)setAnchorCertificatesForTesting:(id)a3
{
  id v5 = a3;
  uint64_t v3 = [v5 copy];
  NSInteger v4 = (void *)sAnchorCertificatesForTesting;
  sAnchorCertificatesForTesting = v3;
}

- (__SecTrust)trust
{
  return self->_trust;
}

- (NSString)signerEmailAddress
{
  return self->_signerEmailAddress;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSError)error
{
  return self->_error;
}

- (unsigned)trustResult
{
  return self->_trustResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_signerEmailAddress, 0);
}

+ (void)reevaluateWithNetworkAccessAllowed:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1BF11D000, v3, v4, "Failed to serialize trust when copying trust: %{public}@", v5);
}

+ (void)reevaluateWithNetworkAccessAllowed:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1BF11D000, v3, v4, "Failed to deserialize trust when copying trust: %{public}@", v5);
}

- (void)_initWithTrust:options:signerEmailAddress:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1BF11D000, v0, v1, "SecTrustSetAnchorCertificates returned %d, certificates = %@");
}

- (void)_initWithTrust:(char)a1 options:(uint64_t)a2 signerEmailAddress:(NSObject *)a3 .cold.2(char a1, uint64_t a2, NSObject *a3)
{
  int v3 = "false";
  if (a1) {
    int v3 = "true";
  }
  LODWORD(v4) = 136315394;
  HIDWORD(v4) = v3;
  OUTLINED_FUNCTION_0_2(&dword_1BF11D000, a2, a3, "SecTrustSetNetworkFetchAllowed(%s) returned %d", v4, HIDWORD(v3));
}

- (void)_initWithTrust:(uint64_t)a1 options:(uint64_t)a2 signerEmailAddress:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2114;
  *(void *)((char *)&v4 + 2) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1BF11D000, a2, a3, "SecTrustSetPolicies returned %d, CFArrayRef policies = %{public}@", v3, (void)v4, WORD4(v4), *MEMORY[0x1E4F143B8]);
}

- (void)_initWithTrust:(int)a1 options:(NSObject *)a2 signerEmailAddress:.cold.4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1BF11D000, a2, OS_LOG_TYPE_ERROR, "SecTrustCopyPolicies returned %d", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1BF11D000, v3, v4, "Failed to deserialize trust when decoding: %{public}@", v5);
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1BF11D000, v3, v4, "Failed to serialize trust when encoding: %{public}@", v5);
}

@end