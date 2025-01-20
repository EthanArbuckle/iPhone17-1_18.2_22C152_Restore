@interface CKDFetchServerCertificatesURLRequest
+ (BOOL)serverResponseIsComplete:(id)a3;
+ (__SecTrust)createTrustEvalFromCertificateList:(id)a3 verifiedWithPolicy:(__SecPolicy *)a4;
+ (id)certificateListServerPlist:(id)a3;
+ (id)nearestExpirationInCertificateList:(id)a3;
- (BOOL)allowsAnonymousAccount;
- (BOOL)hasRequestBody;
- (BOOL)requiresConfiguration;
- (BOOL)requiresDeviceID;
- (BOOL)requiresTokenRegistration;
- (CKDFetchServerCertificatesURLRequest)initWithOperation:(id)a3 verifyWithPolicy:(__SecPolicy *)a4;
- (NSArray)validatedTrusts;
- (__SecPolicy)certificateTrustPolicy;
- (id)httpMethod;
- (id)url;
- (int64_t)partitionType;
- (int64_t)serverType;
- (void)dealloc;
- (void)requestDidParsePlistObject:(id)a3;
- (void)setValidatedTrusts:(id)a3;
@end

@implementation CKDFetchServerCertificatesURLRequest

- (CKDFetchServerCertificatesURLRequest)initWithOperation:(id)a3 verifyWithPolicy:(__SecPolicy *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CKDFetchServerCertificatesURLRequest;
  v5 = [(CKDURLRequest *)&v8 initWithOperation:a3];
  v6 = v5;
  if (v5)
  {
    v5->_certificateTrustPolicy = a4;
    if (a4) {
      CFRetain(a4);
    }
  }
  return v6;
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
  v4.super_class = (Class)CKDFetchServerCertificatesURLRequest;
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

- (id)url
{
  return (id)objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], a2, @"https://gateway.icloud.com/config/server-signature-verification.plist");
}

- (void)requestDidParsePlistObject:(id)a3
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_serverResponseIsComplete_(v5, v6, (uint64_t)v4))
  {
    objc_super v8 = objc_opt_class();
    v10 = objc_msgSend_certificateListServerPlist_(v8, v9, (uint64_t)v4);
    id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (objc_msgSend_count(v10, v11, v12))
    {
      uint64_t v16 = 1;
      *(void *)&long long v15 = 138412546;
      long long v58 = v15;
      id v60 = v4;
      do
      {
        unint64_t v17 = objc_msgSend_count(v10, v13, v14, v58) - 1;
        uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(v10, v18, v16 - 1);
        v21 = (void *)v19;
        if (v16 - 1 >= v17)
        {
          uint64_t v65 = v19;
          v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)&v65, 1);
        }
        else
        {
          v66[0] = v19;
          v22 = objc_msgSend_objectAtIndexedSubscript_(v10, v20, v16);
          v66[1] = v22;
          v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)v66, 2);
        }
        v25 = objc_opt_class();
        uint64_t v28 = objc_msgSend_certificateTrustPolicy(self, v26, v27);
        uint64_t TrustEvalFromCertificateList_verifiedWithPolicy = objc_msgSend_createTrustEvalFromCertificateList_verifiedWithPolicy_(v25, v29, (uint64_t)v24, v28);
        if (TrustEvalFromCertificateList_verifiedWithPolicy)
        {
          v32 = (const void *)TrustEvalFromCertificateList_verifiedWithPolicy;
          v33 = (void *)MEMORY[0x1E4F1C9C8];
          v34 = objc_msgSend_objectForKeyedSubscript_(v4, v31, @"expiration");
          uint64_t v37 = objc_msgSend_integerValue(v34, v35, v36);
          v40 = objc_msgSend_dateWithTimeIntervalSince1970_(v33, v38, v39, (double)v37);

          v41 = objc_opt_class();
          v43 = objc_msgSend_nearestExpirationInCertificateList_(v41, v42, (uint64_t)v24);
          v45 = objc_msgSend_earlierDate_(v40, v44, (uint64_t)v43);
          v48 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v46, v47);
          uint64_t v50 = objc_msgSend_compare_(v45, v49, (uint64_t)v48);

          if (v50 == -1)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v52 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v58;
              v62 = v40;
              __int16 v63 = 2112;
              v64 = v43;
              _os_log_error_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_ERROR, "Server signing certificate has expired. Plist cert expiration: %@ Certificate expiration: %@", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend_addObject_(v59, v51, (uint64_t)v32);
          }
          CFRelease(v32);

          id v4 = v60;
        }

        unint64_t v55 = objc_msgSend_count(v10, v53, v54);
        unint64_t v56 = v16 + 1;
        v16 += 2;
      }
      while (v56 < v55);
    }
    objc_msgSend_setValidatedTrusts_(self, v13, (uint64_t)v59);
  }
  else
  {
    v10 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v7, *MEMORY[0x1E4F19DD8], 1005, @"Invalid server certificates payload");
    objc_msgSend_finishWithError_(self, v57, (uint64_t)v10);
  }
}

+ (BOOL)serverResponseIsComplete:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"certs");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    int v6 = objc_msgSend_count(v3, v4, v5) != 0;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v3;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v15, v19, 16);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          objc_opt_class();
          v6 &= objc_opt_isKindOfClass();
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v13, (uint64_t)&v15, v19, 16);
      }
      while (v10);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

+ (id)certificateListServerPlist:(id)a3
{
  v3 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"certs");
  uint64_t v5 = objc_msgSend_CKCompactMap_(v3, v4, (uint64_t)&unk_1F2044330);

  return v5;
}

+ (id)nearestExpirationInCertificateList:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v6 = objc_msgSend_distantFuture(MEMORY[0x1E4F1C9C8], v4, v5);
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
      v13 = v6;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        SecCertificateNotValidAfter();
        long long v16 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v14, v15, v20);
        int v6 = objc_msgSend_earlierDate_(v13, v17, (uint64_t)v16);

        ++v12;
        v13 = v6;
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
    int v6 = *MEMORY[0x1E4F1A500];
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
    v13 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      long long v17 = trust;
      _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "Successfully evaluated trust policy %{public}@", buf, 0xCu);
    }
    if (cf) {
      CFRelease(cf);
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
      long long v17 = (void *)cf;
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

- (NSArray)validatedTrusts
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setValidatedTrusts:(id)a3
{
}

- (__SecPolicy)certificateTrustPolicy
{
  return self->_certificateTrustPolicy;
}

- (void).cxx_destruct
{
}

@end