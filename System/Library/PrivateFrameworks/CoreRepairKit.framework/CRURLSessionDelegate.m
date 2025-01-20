@interface CRURLSessionDelegate
+ (BOOL)trustIsValidWithProtectionSpace:(id)a3;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation CRURLSessionDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void (**)(id, void, void *))a5;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v42) = 0;
    _os_log_impl(&dword_1D9666000, v8, OS_LOG_TYPE_DEFAULT, "didReceiveChallenge", (uint8_t *)&v42, 2u);
  }

  v12 = objc_msgSend_protectionSpace(v6, v9, v10, v11);
  v16 = (__SecTrust *)objc_msgSend_serverTrust(v12, v13, v14, v15);

  CFArrayRef v17 = SecTrustCopyCertificateChain(v16);
  if (v17)
  {
    CFArrayRef v18 = v17;
    if (CFArrayGetCount(v17) < 1) {
      ValueAtIndex = 0;
    }
    else {
      ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v18, 0);
    }
    CFRelease(v18);
  }
  else
  {
    ValueAtIndex = 0;
  }
  CFDataRef v20 = SecCertificateCopyData(ValueAtIndex);
  v24 = objc_msgSend_protectionSpace(v6, v21, v22, v23);
  int IsValidWithProtectionSpace = objc_msgSend_trustIsValidWithProtectionSpace_(CRURLSessionDelegate, v25, (uint64_t)v24, v26);

  v28 = handleForCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = 138412546;
    CFDataRef v43 = v20;
    __int16 v44 = 2112;
    id v45 = v6;
    _os_log_impl(&dword_1D9666000, v28, OS_LOG_TYPE_DEFAULT, "Certificate:%@:%@", (uint8_t *)&v42, 0x16u);
  }

  if (IsValidWithProtectionSpace)
  {
    v32 = (void *)MEMORY[0x1E4F29098];
    v33 = objc_msgSend_protectionSpace(v6, v29, v30, v31);
    uint64_t v37 = objc_msgSend_serverTrust(v33, v34, v35, v36);
    v40 = objc_msgSend_credentialForTrust_(v32, v38, v37, v39);

    v7[2](v7, 0, v40);
  }
  else
  {
    v41 = handleForCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_1D9673E34();
    }

    v7[2](v7, 2, 0);
  }
}

+ (BOOL)trustIsValidWithProtectionSpace:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v7 = v3;
  CFErrorRef error = 0;
  if (!v3)
  {
    CFArrayRef v17 = handleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1D9673F48();
    }

    goto LABEL_10;
  }
  uint64_t v8 = objc_msgSend_serverTrust(v3, v4, v5, v6);
  if (!v8)
  {
LABEL_10:
    CFArrayRef v18 = handleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1D9673F14();
    }

    v12 = 0;
    int v19 = 0;
    goto LABEL_13;
  }
  v12 = (__SecTrust *)v8;
  v13 = objc_msgSend_host(v7, v9, v10, v11);
  AppleAST2Service = (const void *)SecPolicyCreateAppleAST2Service();

  uint64_t v15 = handleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9666000, v15, OS_LOG_TYPE_DEFAULT, "got policy", buf, 2u);
  }

  if (AppleAST2Service)
  {
    OSStatus v16 = SecTrustSetPolicies(v12, AppleAST2Service);
    CFRelease(AppleAST2Service);
    goto LABEL_16;
  }
  int v19 = 1;
LABEL_13:
  CFDataRef v20 = handleForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_1D9673EE0();
  }

  OSStatus v16 = 0;
  if (!v19) {
    goto LABEL_26;
  }
LABEL_16:
  if (v16)
  {
LABEL_26:
    v25 = handleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1D9673E68(v16, v25);
    }

    goto LABEL_29;
  }
  SecTrustResultType result = kSecTrustResultInvalid;
  SecTrustEvaluateWithError(v12, &error);
  OSStatus TrustResult = SecTrustGetTrustResult(v12, &result);
  uint64_t v22 = handleForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    OSStatus v30 = TrustResult;
    __int16 v31 = 1024;
    SecTrustResultType v32 = result;
    _os_log_impl(&dword_1D9666000, v22, OS_LOG_TYPE_DEFAULT, "SecTrust result: %d, evaluated: %u", buf, 0xEu);
  }

  if (TrustResult)
  {
LABEL_29:
    BOOL v24 = 0;
    goto LABEL_30;
  }
  BOOL v24 = result == kSecTrustResultProceed || result == kSecTrustResultUnspecified;
LABEL_30:

  return v24;
}

@end