@interface DESSignatureKey
+ (__SecKey)keyFromCertificateChain:(id)a3;
+ (id)keyFromData:(id)a3;
- (BOOL)validateBase64Signature:(id)a3 data:(id)a4;
- (BOOL)validateBase64Signature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5;
- (BOOL)validateSignature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5;
- (DESSignatureKey)initWithKey:(__SecKey *)a3;
- (void)dealloc;
@end

@implementation DESSignatureKey

+ (id)keyFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[DESSignatureKey keyFromCertificateChain:v3];
    if (v4) {
      v4 = [[DESSignatureKey alloc] initWithKey:v4];
    }
  }
  else
  {
    v5 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[DESSignatureKey keyFromData:]();
    }

    v4 = 0;
  }

  return v4;
}

+ (__SecKey)keyFromCertificateChain:(id)a3
{
  id v33 = a3;
  id v3 = (void *)[[NSString alloc] initWithData:v33 encoding:4];
  v4 = objc_opt_new();
  if ([v3 length])
  {
    while (1)
    {
      v5 = (void *)MEMORY[0x1C189B250]();
      v6 = [MEMORY[0x1E4F28FE8] scannerWithString:v3];
      v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\n"];
      [v6 setCharactersToBeSkipped:v7];

      [v6 scanUpToString:@"-----BEGIN CERTIFICATE-----" intoString:0];
      [v6 scanString:@"-----BEGIN CERTIFICATE-----" intoString:0];
      id v37 = 0;
      [v6 scanUpToString:@"-----END CERTIFICATE-----" intoString:&v37];
      id v8 = v37;
      if (!v8)
      {

        goto LABEL_8;
      }
      v9 = v8;
      CFDataRef v10 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:1];
      if (!v10) {
        break;
      }
      SecCertificateRef v11 = SecCertificateCreateWithData(0, v10);
      if (!v11)
      {
        v26 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          +[DESSignatureKey keyFromCertificateChain:].cold.9();
        }
        goto LABEL_26;
      }
      SecCertificateRef v12 = v11;
      [v4 addObject:v11];

      [v6 scanString:@"-----END CERTIFICATE-----" intoString:0];
      v13 = [v6 string];
      v14 = objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v6, "scanLocation"));

      id v3 = v14;
      if (![v14 length]) {
        goto LABEL_9;
      }
    }
    v26 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[DESSignatureKey keyFromCertificateChain:].cold.8();
    }
LABEL_26:

    v20 = 0;
    goto LABEL_27;
  }
LABEL_8:
  v14 = v3;
LABEL_9:
  if ([v4 count])
  {
    CFStringRef commonName = 0;
    v15 = [v4 objectAtIndexedSubscript:0];
    OSStatus v16 = SecCertificateCopyCommonName(v15, &commonName);

    if (v16)
    {
      v17 = +[DESLogging coreChannel];
      v18 = v33;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        +[DESSignatureKey keyFromCertificateChain:].cold.7();
      }
LABEL_31:
      v20 = 0;
LABEL_32:

      id v3 = v14;
      goto LABEL_33;
    }
    v17 = commonName;
    if (![(__CFString *)(id)commonName isEqualToString:@"DoDML"]
      || (ApplePinned = (const void *)SecPolicyCreateApplePinned()) == 0)
    {
      v27 = +[DESLogging coreChannel];
      v18 = v33;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        +[DESSignatureKey keyFromCertificateChain:]();
      }

      goto LABEL_31;
    }
    v22 = ApplePinned;
    SecTrustRef trust = 0;
    OSStatus v23 = SecTrustCreateWithCertificates(v4, ApplePinned, &trust);
    if (v23)
    {
      OSStatus v24 = v23;
      v25 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[DESSignatureKey keyFromCertificateChain:].cold.6(v24, v25);
      }

      v20 = 0;
      v18 = v33;
      goto LABEL_42;
    }
    CFErrorRef error = 0;
    if (SecTrustEvaluateWithError(trust, &error))
    {
      v29 = [v4 objectAtIndexedSubscript:0];
      v20 = SecCertificateCopyKey(v29);

      v18 = v33;
      if (v20)
      {
LABEL_42:
        if (trust) {
          CFRelease(trust);
        }
        CFRelease(v22);
        if (v20)
        {
          v32 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            +[DESSignatureKey keyFromCertificateChain:]();
          }
        }
        goto LABEL_32;
      }
      v30 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        +[DESSignatureKey keyFromCertificateChain:].cold.4();
      }
    }
    else
    {
      v30 = error;
      v31 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        +[DESSignatureKey keyFromCertificateChain:].cold.5((uint64_t)v30, v31);
      }

      v18 = v33;
    }

    v20 = 0;
    goto LABEL_42;
  }
  v19 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    +[DESSignatureKey keyFromCertificateChain:]();
  }

  v20 = 0;
  id v3 = v14;
LABEL_27:
  v18 = v33;
LABEL_33:

  return v20;
}

- (DESSignatureKey)initWithKey:(__SecKey *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DESSignatureKey;
  result = [(DESSignatureKey *)&v5 init];
  if (result) {
    result->_key = a3;
  }
  return result;
}

- (void)dealloc
{
  key = self->_key;
  if (key) {
    CFRelease(key);
  }
  v4.receiver = self;
  v4.super_class = (Class)DESSignatureKey;
  [(DESSignatureKey *)&v4 dealloc];
}

- (BOOL)validateBase64Signature:(id)a3 data:(id)a4
{
  return [(DESSignatureKey *)self validateBase64Signature:a3 data:a4 algorithm:*MEMORY[0x1E4F3BA70]];
}

- (BOOL)validateBase64Signature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5
{
  id v8 = a4;
  if (a3)
  {
    v9 = (objc_class *)MEMORY[0x1E4F1C9B8];
    id v10 = a3;
    a3 = (id)[[v9 alloc] initWithBase64EncodedString:v10 options:1];
  }
  BOOL v11 = [(DESSignatureKey *)self validateSignature:a3 data:v8 algorithm:a5];

  return v11;
}

- (BOOL)validateSignature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5
{
  CFDataRef v9 = (const __CFData *)a3;
  CFDataRef v10 = (const __CFData *)a4;
  CFDataRef v11 = v10;
  BOOL v12 = 0;
  if (v9 && v10)
  {
    key = self->_key;
    if (!key)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"DESSignatureKey.m", 206, @"Invalid parameter not satisfying: %@", @"_key" object file lineNumber description];

      key = self->_key;
    }
    if (SecKeyIsAlgorithmSupported(key, kSecKeyOperationTypeVerify, a5))
    {
      CFErrorRef error = 0;
      int v14 = SecKeyVerifySignature(self->_key, a5, v11, v9, &error);
      BOOL v12 = v14 != 0;
      if (!v14)
      {
        CFErrorRef v15 = error;
        OSStatus v16 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[DESSignatureKey validateSignature:data:algorithm:]((uint64_t)v15, v16);
        }
      }
    }
    else
    {
      v17 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[DESSignatureKey validateSignature:data:algorithm:]();
      }

      BOOL v12 = 0;
    }
  }

  return v12;
}

+ (void)keyFromData:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1BECCB000, v0, OS_LOG_TYPE_DEBUG, "DESSignatureKey: No certificate data.", v1, 2u);
}

+ (void)keyFromCertificateChain:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BECCB000, v0, v1, "DESSignatureKey: No certificates in cert chain.", v2, v3, v4, v5, v6);
}

+ (void)keyFromCertificateChain:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BECCB000, v0, v1, "DESSignatureKey: failed to create security policy.", v2, v3, v4, v5, v6);
}

+ (void)keyFromCertificateChain:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1BECCB000, v0, OS_LOG_TYPE_DEBUG, "DESSignatureKey: successfully created public key from the certificate chain.", v1, 2u);
}

+ (void)keyFromCertificateChain:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BECCB000, v0, v1, "DESSignatureKey: failed to create public key from the certificate chain.", v2, v3, v4, v5, v6);
}

+ (void)keyFromCertificateChain:(uint64_t)a1 .cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "DESSignatureKey: certificate chain validation failed with error: %@.", (uint8_t *)&v2, 0xCu);
}

+ (void)keyFromCertificateChain:(OSStatus)a1 .cold.6(OSStatus a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (__CFString *)SecCopyErrorMessageString(a1, 0);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "DESSignatureKey: trust creation for the certificate chain failed with error: %@", (uint8_t *)&v4, 0xCu);
}

+ (void)keyFromCertificateChain:.cold.7()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BECCB000, v0, v1, "DESSignatureKey: failed to get leaf common name.", v2, v3, v4, v5, v6);
}

+ (void)keyFromCertificateChain:.cold.8()
{
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1BECCB000, v0, OS_LOG_TYPE_ERROR, "DESSignatureKey: malformed certificate string.", v1, 2u);
}

+ (void)keyFromCertificateChain:.cold.9()
{
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1BECCB000, v0, OS_LOG_TYPE_ERROR, "DESSignatureKey: invalid certificate data in certificate chain.", v1, 2u);
}

- (void)validateSignature:data:algorithm:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BECCB000, v0, v1, "DESSignatureKey: key/algorithm mismatch.", v2, v3, v4, v5, v6);
}

- (void)validateSignature:(uint64_t)a1 data:(NSObject *)a2 algorithm:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "DESSignatureKey: signature validation failed -- %@", (uint8_t *)&v2, 0xCu);
}

@end