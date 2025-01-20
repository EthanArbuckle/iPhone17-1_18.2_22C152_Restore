@interface CSCertOperations
+ (BOOL)moveToFederationAllowed:(id)a3 altDSID:(id)a4;
+ (BOOL)verifyCertData:(id)a3 withCert:(__SecCertificate *)a4 withPubKey:(__SecKey *)a5 stingray:(BOOL)a6 enroll:(BOOL)a7 altDSID:(id)a8 env:(id)a9 duplicate:(BOOL)a10 sigVerification:(BOOL)a11 error:(id *)a12;
+ (id)certVersion:(__SecCertificate *)a3;
+ (id)knownICDPFederations;
+ (id)rootBaseVersionsForRootType:(unsigned int)a3 altDSID:(id)a4 inEnvironment:(id)a5 duplicate:(BOOL)a6;
+ (id)rootCurrentVersionForRootType:(unsigned int)a3 altDSID:(id)a4 inEnvironment:(id)a5;
+ (id)rootTrustedVersionsForRootType:(unsigned int)a3 altDSID:(id)a4 inEnvironment:(id)a5 duplicate:(BOOL)a6;
+ (void)fetchTermsWithAltDSID:(id)a3 reply:(id)a4;
+ (void)storeTerms:(id)a3 withAltDSID:(id)a4 reply:(id)a5;
@end

@implementation CSCertOperations

+ (id)certVersion:(__SecCertificate *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v3 = (id)SecCertificateCopyProperties();
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v41, v46, 16);
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v42;
    v9 = &unk_26C924798;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v42 != v8) {
        objc_enumerationMutation(v3);
      }
      v11 = *(void **)(*((void *)&v41 + 1) + 8 * v10);
      v12 = objc_msgSend_objectForKeyedSubscript_(v11, v6, @"label");
      char isEqualToString = objc_msgSend_isEqualToString_(v12, v13, @"Issuer Name");

      if (isEqualToString) {
        break;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v41, v46, 16);
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_22;
      }
    }
    id v15 = v11;

    if (!v15)
    {
      v9 = &unk_26C924798;
      goto LABEL_27;
    }
    objc_msgSend_objectForKeyedSubscript_(v15, v16, @"value");
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v37, v45, 16);
    if (v19)
    {
      uint64_t v21 = v19;
      id v35 = v15;
      uint64_t v22 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v17);
          }
          v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v25 = objc_msgSend_objectForKeyedSubscript_(v24, v20, @"label", v35);
          int v27 = objc_msgSend_isEqualToString_(v25, v26, @"2.5.4.5");

          if (v27)
          {
            v28 = objc_msgSend_objectForKeyedSubscript_(v24, v20, @"value");
            id v29 = objc_alloc(MEMORY[0x263F08B08]);
            v31 = objc_msgSend_initWithString_(v29, v30, (uint64_t)v28);
            uint64_t v36 = 0;
            objc_msgSend_scanUnsignedLongLong_(v31, v32, (uint64_t)&v36);
            v9 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v33, v36);

            id v15 = v35;
            goto LABEL_24;
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v37, v45, 16);
        if (v21) {
          continue;
        }
        break;
      }
      id v15 = v35;
    }
    v9 = &unk_26C924798;
LABEL_24:
  }
  else
  {
    v9 = &unk_26C924798;
LABEL_22:
    id v15 = v3;
  }

LABEL_27:

  return v9;
}

+ (id)rootBaseVersionsForRootType:(unsigned int)a3 altDSID:(id)a4 inEnvironment:(id)a5 duplicate:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  v14 = objc_msgSend_set(MEMORY[0x263EFF9C0], v12, v13);
  id v15 = sub_218137554(a3, v10, v11, v6);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v27, v31, 16);
  if (v17)
  {
    uint64_t v20 = v17;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v15);
        }
        v23 = objc_msgSend_certVersion_(a1, v18, *(void *)(*((void *)&v27 + 1) + 8 * i));
        objc_msgSend_addObject_(v14, v24, (uint64_t)v23);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v27, v31, 16);
    }
    while (v20);
  }
  v25 = objc_msgSend_allObjects(v14, v18, v19);

  return v25;
}

+ (id)rootTrustedVersionsForRootType:(unsigned int)a3 altDSID:(id)a4 inEnvironment:(id)a5 duplicate:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  v14 = objc_msgSend_set(MEMORY[0x263EFF9C0], v12, v13);
  id v15 = sub_218137554(a3, v10, v11, v6);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v27, v31, 16);
  if (v17)
  {
    uint64_t v20 = v17;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v15);
        }
        v23 = objc_msgSend_certVersion_(a1, v18, *(void *)(*((void *)&v27 + 1) + 8 * i));
        objc_msgSend_addObject_(v14, v24, (uint64_t)v23);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v27, v31, 16);
    }
    while (v20);
  }
  v25 = objc_msgSend_allObjects(v14, v18, v19);

  return v25;
}

+ (id)rootCurrentVersionForRootType:(unsigned int)a3 altDSID:(id)a4 inEnvironment:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v11 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v10, 0);
  uint64_t v13 = objc_msgSend_rootTrustedVersionsForRootType_altDSID_inEnvironment_duplicate_(a1, v12, v6, v8, v9, 0);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v27, v31, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unint64_t v22 = objc_msgSend_unsignedLongLongValue(v21, v16, v17);
        if (v22 > objc_msgSend_unsignedLongLongValue(v11, v23, v24))
        {
          id v25 = v21;

          id v11 = v25;
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v27, v31, 16);
    }
    while (v18);
  }

  return v11;
}

+ (BOOL)verifyCertData:(id)a3 withCert:(__SecCertificate *)a4 withPubKey:(__SecKey *)a5 stingray:(BOOL)a6 enroll:(BOOL)a7 altDSID:(id)a8 env:(id)a9 duplicate:(BOOL)a10 sigVerification:(BOOL)a11 error:(id *)a12
{
  BOOL v12 = a7;
  BOOL v13 = a6;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v17 = a8;
  id v18 = a9;
  CFErrorRef error = 0;
  SecTrustRef trust = 0;
  if (v12) {
    int v19 = 7;
  }
  else {
    int v19 = 5;
  }
  uint64_t v20 = (const void **)MEMORY[0x263F17470];
  if (v13)
  {
    int v19 = 3;
    uint64_t v20 = (const void **)MEMORY[0x263F17480];
    int v21 = 3;
  }
  else
  {
    int v21 = 5;
  }
  unint64_t v22 = (const void **)MEMORY[0x263F17478];
  if (v13) {
    unint64_t v22 = (const void **)MEMORY[0x263F17488];
  }
  if (a11) {
    unsigned int v23 = v21;
  }
  else {
    unsigned int v23 = v19;
  }
  if (a11) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = v20;
  }
  id v25 = *v24;
  SecCertificateRef v26 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFDataRef)a3);
  long long v28 = v26;
  if (!v26)
  {
    objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v27, @"EscrowServiceErrorDomain", 112, @"Error creating SecCertificateRef");
    uint64_t v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
    long long v42 = CloudServicesLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v63 = v36;
      _os_log_impl(&dword_218118000, v42, OS_LOG_TYPE_DEFAULT, "Unable to create SecCertificateRef from response data: %@", buf, 0xCu);
    }

    long long v29 = 0;
    goto LABEL_28;
  }
  SecCertificateRef v61 = v26;
  long long v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v27, (uint64_t)&v61, 1);
  SecPolicyRef v30 = SecPolicyCreateWithProperties(v25, 0);
  if (!v30)
  {
    objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v31, @"EscrowServiceErrorDomain", 113, @"Error copying escrow trust policy");
    uint64_t v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
    long long v43 = CloudServicesLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218118000, v43, OS_LOG_TYPE_DEFAULT, "Error copying escrow trust policy", buf, 2u);
    }

LABEL_28:
    CFArrayRef v41 = 0;
    SecPolicyRef v32 = 0;
    goto LABEL_29;
  }
  SecPolicyRef v32 = v30;
  OSStatus v33 = SecTrustCreateWithCertificates(v29, v30, &trust);
  if (v33)
  {
    id v35 = (__CFError *)v33;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v34, *MEMORY[0x263F08410], v33, 0);
    uint64_t v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
    long long v37 = CloudServicesLog();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:

      CFArrayRef v41 = 0;
      goto LABEL_29;
    }
    *(_DWORD *)buf = 134217984;
    CFErrorRef v63 = v35;
    long long v38 = "SecTrustCreateWithCertificates failed: %ld";
    long long v39 = v37;
    uint32_t v40 = 12;
LABEL_20:
    _os_log_impl(&dword_218118000, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);
    goto LABEL_21;
  }
  sub_218137554(v23, v17, v18, a10);
  CFArrayRef v46 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (!v46)
  {
    objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v47, @"EscrowServiceErrorDomain", 114, @"Error copying root cert array");
    uint64_t v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
    long long v37 = CloudServicesLog();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    long long v38 = "Error copying root cert array";
    long long v39 = v37;
    uint32_t v40 = 2;
    goto LABEL_20;
  }
  CFArrayRef v41 = v46;
  OSStatus v48 = SecTrustSetAnchorCertificates(trust, v46);
  if (!v48)
  {
    BOOL v58 = SecTrustEvaluateWithError(trust, &error);
    v52 = CloudServicesLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = "false";
      if (v58) {
        v53 = "true";
      }
      *(_DWORD *)buf = 136315138;
      CFErrorRef v63 = (CFErrorRef)v53;
      _os_log_impl(&dword_218118000, v52, OS_LOG_TYPE_DEFAULT, "SecTrustEvaluateWithError() trust result = %s", buf, 0xCu);
    }

    if (v58)
    {
      if (a5)
      {
        v54 = SecTrustCopyKey(trust);
        if (v54)
        {
          uint64_t v36 = 0;
          *a5 = v54;
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v55, @"EscrowServiceErrorDomain", 115, @"Unable to extract public key");
          uint64_t v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
          v56 = CloudServicesLog();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_218118000, v56, OS_LOG_TYPE_DEFAULT, "Error extracting public key from certificate", buf, 2u);
          }
        }
      }
      else
      {
        uint64_t v36 = 0;
      }
      BOOL v44 = 1;
      if (a12) {
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    uint64_t v36 = error;
    v50 = CloudServicesLog();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_58;
    }
    *(_DWORD *)buf = 138412290;
    CFErrorRef v63 = error;
    v51 = "SecTrustEvaluate failed: %@";
    goto LABEL_57;
  }
  v57 = (__CFError *)v48;
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v49, *MEMORY[0x263F08410]);
  uint64_t v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
  v50 = CloudServicesLog();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFErrorRef v63 = v57;
    v51 = "SecTrustSetAnchorCertificates failed: %ld";
LABEL_57:
    _os_log_impl(&dword_218118000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 0xCu);
  }
LABEL_58:

LABEL_29:
  BOOL v44 = 0;
  if (a12) {
LABEL_30:
  }
    *a12 = v36;
LABEL_31:
  if (a4 && v28)
  {
    *a4 = v28;
  }
  else if (v28)
  {
    CFRelease(v28);
  }
  if (v32) {
    CFRelease(v32);
  }
  if (trust)
  {
    CFRelease(trust);
    SecTrustRef trust = 0;
  }

  return v44;
}

+ (void)storeTerms:(id)a3 withAltDSID:(id)a4 reply:(id)a5
{
  v48[6] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  BOOL v12 = objc_msgSend_altDSID(v7, v10, v11);
  char isEqualToString = objc_msgSend_isEqualToString_(v8, v13, (uint64_t)v12);

  if ((isEqualToString & 1) == 0) {
    sub_21813EEDC();
  }
  uint64_t v15 = objc_alloc_init(StoredTermsInfo);
  objc_msgSend_setStorageVersion_(v15, v16, 1);
  objc_msgSend_setTermsInfo_(v15, v17, (uint64_t)v7);
  uint64_t v18 = *MEMORY[0x263F171C8];
  uint64_t v19 = *MEMORY[0x263F170B0];
  v47[0] = *MEMORY[0x263F171B8];
  v47[1] = v19;
  uint64_t v20 = *MEMORY[0x263EFFB40];
  v48[0] = v18;
  v48[1] = v20;
  uint64_t v21 = *MEMORY[0x263F16E98];
  uint64_t v22 = *MEMORY[0x263F16E80];
  v47[2] = *MEMORY[0x263F16E90];
  v47[3] = v22;
  v48[2] = v21;
  v48[3] = @"com.apple.sbd";
  uint64_t v23 = *MEMORY[0x263F16ED8];
  v47[4] = *MEMORY[0x263F17090];
  v47[5] = v23;
  v48[4] = @"SecureBackupTerms";
  v48[5] = v8;
  id v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)v48, v47, 6);
  uint64_t v45 = *MEMORY[0x263F175A8];
  long long v28 = objc_msgSend_data(v15, v26, v27);
  CFArrayRef v46 = v28;
  SecPolicyRef v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)&v46, &v45, 1);

  id v40 = 0;
  BOOL v31 = sub_2181365E4(v25, v30, &v40);
  id v32 = v40;
  OSStatus v33 = CloudServicesLog();
  BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v34)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218118000, v33, OS_LOG_TYPE_DEFAULT, "Successfully stored terms", buf, 2u);
    }
    uint64_t v35 = 0;
    goto LABEL_10;
  }
  if (v34)
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v32;
    _os_log_impl(&dword_218118000, v33, OS_LOG_TYPE_DEFAULT, "Failed to store terms: %@", buf, 0xCu);
  }

  long long v37 = v32;
  if (!v32)
  {
    long long v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v41 = *MEMORY[0x263F08320];
    long long v42 = @"unknown error";
    OSStatus v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, (uint64_t)&v42, &v41, 1);
    uint64_t v35 = objc_msgSend_errorWithDomain_code_userInfo_(v38, v39, @"EscrowServiceErrorDomain", 1, v33);
    id v32 = (id)v35;
LABEL_10:
    long long v37 = v32;

    id v32 = (id)v35;
  }
  v9[2](v9, v32);
}

+ (void)fetchTermsWithAltDSID:(id)a3 reply:(id)a4
{
  v43[7] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *, void *))a4;
  uint64_t v7 = *MEMORY[0x263F171C8];
  uint64_t v8 = *MEMORY[0x263F170B0];
  v42[0] = *MEMORY[0x263F171B8];
  v42[1] = v8;
  v43[0] = v7;
  v43[1] = MEMORY[0x263EFFA88];
  uint64_t v9 = *MEMORY[0x263F16E98];
  uint64_t v10 = *MEMORY[0x263F16E80];
  v42[2] = *MEMORY[0x263F16E90];
  v42[3] = v10;
  v43[2] = v9;
  v43[3] = @"com.apple.sbd";
  uint64_t v11 = *MEMORY[0x263F17520];
  v42[4] = *MEMORY[0x263F17090];
  v42[5] = v11;
  v43[4] = @"SecureBackupTerms";
  v43[5] = MEMORY[0x263EFFA88];
  v42[6] = *MEMORY[0x263F17400];
  v43[6] = *MEMORY[0x263F17408];
  BOOL v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v43, v42, 7);
  v16 = objc_msgSend_mutableCopy(v13, v14, v15);

  if (v5) {
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v5, *MEMORY[0x263F16ED8]);
  }
  CFArrayRef theArray = 0;
  OSStatus v18 = SecItemCopyMatching((CFDictionaryRef)v16, (CFTypeRef *)&theArray);
  if (v18)
  {
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08410];
    uint64_t v22 = v18;
    uint64_t v40 = *MEMORY[0x263F08320];
    uint64_t v41 = @"Unable to find terms in keychain";
    uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)&v41, &v40, 1);
    id v25 = objc_msgSend_errorWithDomain_code_userInfo_(v20, v24, v21, v22, v23);

    SecCertificateRef v26 = 0;
  }
  else
  {
    CFIndex Count = CFArrayGetCount(theArray);
    id v28 = objc_alloc(MEMORY[0x263EFF980]);
    SecCertificateRef v26 = objc_msgSend_initWithCapacity_(v28, v29, Count);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        BOOL v31 = CFArrayGetValueAtIndex(theArray, i);
        id v32 = [StoredTermsInfo alloc];
        BOOL v34 = objc_msgSend_initWithData_(v32, v33, (uint64_t)v31);
        long long v37 = objc_msgSend_termsInfo(v34, v35, v36);
        objc_msgSend_addObject_(v26, v38, (uint64_t)v37);
      }
    }
    if (theArray)
    {
      CFRelease(theArray);
      id v25 = 0;
      CFArrayRef theArray = 0;
    }
    else
    {
      id v25 = 0;
    }
  }
  v6[2](v6, v26, v25);
}

+ (BOOL)moveToFederationAllowed:(id)a3 altDSID:(id)a4
{
  id v5 = a4;
  uint64_t v8 = objc_msgSend_integerValue(a3, v6, v7);
  BOOL v9 = (unint64_t)(v8 - 101) < 3 || v8 == 310 && sub_218138920(v5);

  return v9;
}

+ (id)knownICDPFederations
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (uint64_t i = 0; i != 16; i += 4)
  {
    id v4 = [NSString alloc];
    uint64_t v6 = objc_msgSend_initWithFormat_(v4, v5, @"%d", dword_2643039A8[i]);
    objc_msgSend_addObject_(v2, v7, (uint64_t)v6);
  }

  return v2;
}

@end