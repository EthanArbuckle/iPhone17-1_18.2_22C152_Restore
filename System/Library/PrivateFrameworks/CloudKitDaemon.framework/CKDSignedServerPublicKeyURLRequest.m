@interface CKDSignedServerPublicKeyURLRequest
+ (BOOL)serverResponseIsComplete:(id)a3 requireProtectionSource:(BOOL)a4;
+ (BOOL)verifyData:(id)a3 withSignature:(id)a4 usingKey:(__SecKey *)a5;
+ (BOOL)verifyInteger:(int64_t)a3 withSignature:(id)a4 usingKey:(__SecKey *)a5 verifyFullInteger:(BOOL)a6;
+ (__SecTrust)createTrustEvalFromCertificateList:(id)a3 verifiedWithPolicy:(__SecPolicy *)a4;
+ (id)certificateListServerPlist:(id)a3;
+ (id)nearestExpirationInCertificateList:(id)a3;
- (BOOL)allowsAnonymousAccount;
- (BOOL)canVerifySignedPlistValues:(id)a3 withKey:(__SecKey *)a4;
- (BOOL)hasRequestBody;
- (BOOL)requiresConfiguration;
- (BOOL)requiresDeviceID;
- (BOOL)requiresProtectionSource;
- (BOOL)requiresTokenRegistration;
- (BOOL)verifyFullIntegers;
- (CKDSignedServerPublicKeyURLRequest)initWithOperation:(id)a3 plistURL:(id)a4 verifyWithPolicy:(__SecPolicy *)a5;
- (CKPublicKey)verifiedPublicKey;
- (NSDate)expirationDateOverride;
- (NSURL)plistURL;
- (__SecPolicy)certificateTrustPolicy;
- (id)httpMethod;
- (int64_t)partitionType;
- (int64_t)serverType;
- (void)dealloc;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParsePlistObject:(id)a3;
- (void)setExpirationDateOverride:(id)a3;
- (void)setRequiresProtectionSource:(BOOL)a3;
- (void)setVerifiedPublicKey:(id)a3;
- (void)setVerifyFullIntegers:(BOOL)a3;
@end

@implementation CKDSignedServerPublicKeyURLRequest

- (CKDSignedServerPublicKeyURLRequest)initWithOperation:(id)a3 plistURL:(id)a4 verifyWithPolicy:(__SecPolicy *)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDSignedServerPublicKeyURLRequest;
  v10 = [(CKDURLRequest *)&v13 initWithOperation:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_plistURL, a4);
    v11->_certificateTrustPolicy = a5;
    if (a5) {
      CFRetain(a5);
    }
  }

  return v11;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKDSignedServerPublicKeyURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v9 fillOutEquivalencyPropertiesBuilder:v4];
  v7 = objc_msgSend_plistURL(self, v5, v6, v9.receiver, v9.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"plistURL");
}

- (void)dealloc
{
  certificateTrustPolicy = self->_certificateTrustPolicy;
  if (certificateTrustPolicy)
  {
    CFRelease(certificateTrustPolicy);
    self->_certificateTrustPolicy = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDSignedServerPublicKeyURLRequest;
  [(CKDURLRequest *)&v4 dealloc];
}

- (BOOL)requiresConfiguration
{
  return 0;
}

- (BOOL)requiresDeviceID
{
  return 0;
}

- (BOOL)requiresTokenRegistration
{
  return 0;
}

- (BOOL)allowsAnonymousAccount
{
  return 1;
}

- (int64_t)serverType
{
  return 5;
}

- (int64_t)partitionType
{
  return 3;
}

- (id)httpMethod
{
  return @"GET";
}

- (BOOL)hasRequestBody
{
  return 0;
}

- (void)requestDidParsePlistObject:(id)a3
{
  id v68 = a3;
  objc_super v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_requiresProtectionSource(self, v5, v6);
  if ((objc_msgSend_serverResponseIsComplete_requireProtectionSource_(v4, v8, (uint64_t)v68, v7) & 1) == 0)
  {
    v12 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v9, *MEMORY[0x1E4F19DD8], 1005, @"Invalid server public key payload");
    objc_msgSend_finishWithError_(self, v49, (uint64_t)v12);
    goto LABEL_25;
  }
  v10 = objc_opt_class();
  v12 = objc_msgSend_certificateListServerPlist_(v10, v11, (uint64_t)v68);
  objc_super v13 = objc_opt_class();
  uint64_t v16 = objc_msgSend_certificateTrustPolicy(self, v14, v15);
  TrustEvalFromCertificateList_verifiedWithPolicy = (__SecTrust *)objc_msgSend_createTrustEvalFromCertificateList_verifiedWithPolicy_(v13, v17, (uint64_t)v12, v16);
  v20 = TrustEvalFromCertificateList_verifiedWithPolicy;
  if (TrustEvalFromCertificateList_verifiedWithPolicy)
  {
    SecKeyRef v21 = SecTrustCopyKey(TrustEvalFromCertificateList_verifiedWithPolicy);
    if (objc_msgSend_canVerifySignedPlistValues_withKey_(self, v22, (uint64_t)v68, v21))
    {
      v24 = (void *)MEMORY[0x1E4F1C9C8];
      v25 = objc_msgSend_objectForKeyedSubscript_(v68, v23, @"expiration");
      objc_msgSend_doubleValue(v25, v26, v27);
      v30 = objc_msgSend_dateWithTimeIntervalSince1970_(v24, v28, v29);

      v31 = objc_opt_class();
      v33 = objc_msgSend_nearestExpirationInCertificateList_(v31, v32, (uint64_t)v12);
      v35 = objc_msgSend_earlierDate_(v30, v34, (uint64_t)v33);
      v38 = objc_msgSend_expirationDateOverride(self, v36, v37);

      v66 = v30;
      if (v38)
      {
        v41 = objc_msgSend_expirationDateOverride(self, v39, v40, v30);
        uint64_t v43 = objc_msgSend_earlierDate_(v35, v42, (uint64_t)v41);

        v35 = (void *)v43;
      }
      CFArrayRef v44 = SecTrustCopyCertificateChain(v20);
      if (v44)
      {
        CFArrayRef v46 = v44;
        if (CFArrayGetCount(v44) < 1)
        {
          CFDataRef v48 = 0;
        }
        else
        {
          ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v46, 0);
          CFDataRef v48 = SecCertificateCopyData(ValueAtIndex);
        }
        CFRelease(v46);
      }
      else
      {
        CFDataRef v48 = 0;
      }
      v51 = objc_msgSend_objectForKeyedSubscript_(v68, v45, @"public key", v66);
      v53 = objc_msgSend_objectForKeyedSubscript_(v68, v52, @"version");
      uint64_t v56 = objc_msgSend_integerValue(v53, v54, v55);

      if (objc_msgSend_requiresProtectionSource(self, v57, v58))
      {
        v60 = objc_msgSend_objectForKeyedSubscript_(v68, v59, @"protection source");
      }
      else
      {
        v60 = 0;
      }
      id v61 = objc_alloc(MEMORY[0x1E4F1A288]);
      v50 = objc_msgSend_initWithPublicKey_version_expiration_certificateData_protectionSource_(v61, v62, (uint64_t)v51, v56, v35, v48, v60);

      if (v50 && (objc_msgSend_hasExpired(v50, v23, v63) & 1) == 0)
      {
        objc_msgSend_setVerifiedPublicKey_(self, v23, (uint64_t)v50);
        goto LABEL_21;
      }
    }
    else
    {
      v50 = 0;
    }
  }
  else
  {
    objc_msgSend_canVerifySignedPlistValues_withKey_(self, v19, (uint64_t)v68, 0);
    v50 = 0;
    SecKeyRef v21 = 0;
  }
  v64 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v23, *MEMORY[0x1E4F19DD8], 4001, @"Failed to verify public key data.");
  objc_msgSend_finishWithError_(self, v65, (uint64_t)v64);

  if (v20) {
LABEL_21:
  }
    CFRelease(v20);
  if (v21) {
    CFRelease(v21);
  }

LABEL_25:
}

+ (BOOL)serverResponseIsComplete:(id)a3 requireProtectionSource:(BOOL)a4
{
  BOOL v38 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"public key");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_super v9 = objc_msgSend_objectForKeyedSubscript_(v4, v8, @"public key signature");
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  v12 = objc_msgSend_objectForKeyedSubscript_(v4, v11, @"version");
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();

  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"version signature");
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  v18 = objc_msgSend_objectForKeyedSubscript_(v4, v17, @"expiration");
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  SecKeyRef v21 = objc_msgSend_objectForKeyedSubscript_(v4, v20, @"expiration signature");
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v4, v23, @"certs");
  objc_opt_class();
  v24 = (void *)v28;
  char v25 = objc_opt_isKindOfClass();
  LOBYTE(v28) = 0;
  if ((isKindOfClass & 1) == 0
    || (v10 & 1) == 0
    || (v13 & 1) == 0
    || (v16 & 1) == 0
    || (v19 & 1) == 0
    || (v22 & 1) == 0)
  {
    if (!v38) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v25)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    LODWORD(v28) = objc_msgSend_count(v24, v26, v27) != 0;
    long long v41 = 0u;
    long long v42 = 0u;
    id v29 = v24;
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v39, v43, 16);
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(v29);
          }
          objc_opt_class();
          LODWORD(v28) = v28 & objc_opt_isKindOfClass();
        }
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v35, (uint64_t)&v39, v43, 16);
      }
      while (v32);
    }
  }
  if (v38)
  {
LABEL_17:
    v36 = objc_msgSend_objectForKeyedSubscript_(v4, v26, @"protection source");
    objc_opt_class();
    LOBYTE(v28) = v28 & objc_opt_isKindOfClass();
  }
LABEL_18:

  return v28 & 1;
}

+ (id)certificateListServerPlist:(id)a3
{
  v3 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"certs");
  v5 = objc_msgSend_CKCompactMap_(v3, v4, (uint64_t)&unk_1F2043ED0);

  return v5;
}

+ (id)nearestExpirationInCertificateList:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v6 = objc_msgSend_distantFuture(MEMORY[0x1E4F1C9C8], v4, v5);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v20, v24, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      char v13 = v6;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        SecCertificateNotValidAfter();
        char v16 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v14, v15, v20);
        uint64_t v6 = objc_msgSend_earlierDate_(v13, v17, (uint64_t)v16);

        ++v12;
        char v13 = v6;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v18, (uint64_t)&v20, v24, 16);
    }
    while (v10);
  }

  return v6;
}

+ (__SecTrust)createTrustEvalFromCertificateList:(id)a3 verifiedWithPolicy:(__SecPolicy *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  SecTrustRef trust = 0;
  OSStatus v4 = SecTrustCreateWithCertificates(a3, a4, &trust);
  if (trust) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v6 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v4;
      _os_log_error_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_ERROR, "Failed to create trust from certificates with status code: %i", buf, 8u);
    }
    result = trust;
    if (!trust) {
      return result;
    }
LABEL_22:
    CFRelease(result);
    return 0;
  }
  CFTypeRef cf = 0;
  BOOL v8 = SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf);
  uint64_t v9 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v10 = *MEMORY[0x1E4F1A550];
  if (v8 && cf == 0)
  {
    if (v10 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v9);
    }
    char v13 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v17 = trust;
      _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "Successfully evaluated trust policy %{public}@", buf, 0xCu);
    }
    return trust;
  }
  else
  {
    if (v10 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v9);
    }
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = (void *)cf;
      _os_log_error_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_ERROR, "Failed to evaluate trust policy with error: %@", buf, 0xCu);
    }
    if (trust)
    {
      CFRelease(trust);
      SecTrustRef trust = 0;
    }
    result = (__SecTrust *)cf;
    if (cf) {
      goto LABEL_22;
    }
  }
  return result;
}

- (BOOL)canVerifySignedPlistValues:(id)a3 withKey:(__SecKey *)a4
{
  LOBYTE(v4) = 0;
  if (a3 && a4)
  {
    id v7 = a3;
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"public key");
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v7, v10, @"version");
    uint64_t v14 = objc_msgSend_longLongValue(v11, v12, v13);

    char v16 = objc_msgSend_objectForKeyedSubscript_(v7, v15, @"expiration");
    uint64_t v19 = objc_msgSend_longLongValue(v16, v17, v18);

    long long v21 = objc_msgSend_objectForKeyedSubscript_(v7, v20, @"public key signature");
    long long v23 = objc_msgSend_objectForKeyedSubscript_(v7, v22, @"version signature");
    uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v7, v24, @"expiration signature");

    v26 = objc_opt_class();
    LODWORD(v7) = objc_msgSend_verifyData_withSignature_usingKey_(v26, v27, (uint64_t)v9, v21, a4);
    uint64_t v28 = objc_opt_class();
    int v31 = objc_msgSend_verifyFullIntegers(self, v29, v30);
    LODWORD(v7) = v7 & objc_msgSend_verifyInteger_withSignature_usingKey_verifyFullInteger_(v28, v32, v14, v23, a4, v31 ^ 1u);
    uint64_t v33 = objc_opt_class();
    int v36 = objc_msgSend_verifyFullIntegers(self, v34, v35);
    int v4 = v7 & objc_msgSend_verifyInteger_withSignature_usingKey_verifyFullInteger_(v33, v37, v19, v25, a4, v36 ^ 1u);
  }
  return v4;
}

+ (BOOL)verifyInteger:(int64_t)a3 withSignature:(id)a4 usingKey:(__SecKey *)a5 verifyFullInteger:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  if (a3 == (int)a3 || v6)
  {
    if (v6)
    {
      unsigned int v21 = bswap32(a3);
      id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v14 = objc_msgSend_initWithBytes_length_(v12, v13, (uint64_t)&v21, 4, v20);
    }
    else
    {
      unint64_t v20 = bswap64(a3);
      id v16 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v14 = objc_msgSend_initWithBytes_length_(v16, v17, (uint64_t)&v20, 8, v20);
    }
    uint64_t v18 = (void *)v14;
    char v11 = objc_msgSend_verifyData_withSignature_usingKey_(a1, v15, v14, v10, a5);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)verifyData:(id)a3 withSignature:(id)a4 usingKey:(__SecKey *)a5
{
  return SecKeyVerifySignature(a5, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA70], (CFDataRef)a3, (CFDataRef)a4, 0) != 0;
}

- (CKPublicKey)verifiedPublicKey
{
  return (CKPublicKey *)objc_getProperty(self, a2, 392, 1);
}

- (void)setVerifiedPublicKey:(id)a3
{
}

- (BOOL)requiresProtectionSource
{
  return self->_requiresProtectionSource;
}

- (void)setRequiresProtectionSource:(BOOL)a3
{
  self->_requiresProtectionSource = a3;
}

- (BOOL)verifyFullIntegers
{
  return self->_verifyFullIntegers;
}

- (void)setVerifyFullIntegers:(BOOL)a3
{
  self->_verifyFullIntegers = a3;
}

- (NSDate)expirationDateOverride
{
  return self->_expirationDateOverride;
}

- (void)setExpirationDateOverride:(id)a3
{
}

- (NSURL)plistURL
{
  return self->_plistURL;
}

- (__SecPolicy)certificateTrustPolicy
{
  return self->_certificateTrustPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistURL, 0);
  objc_storeStrong((id *)&self->_expirationDateOverride, 0);
  objc_storeStrong((id *)&self->_verifiedPublicKey, 0);
}

@end