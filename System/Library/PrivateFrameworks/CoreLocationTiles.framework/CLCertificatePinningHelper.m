@interface CLCertificatePinningHelper
+ (id)knownHosts;
+ (int)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
+ (void)initialize;
@end

@implementation CLCertificatePinningHelper

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global);
  }
}

id __40__CLCertificatePinningHelper_initialize__block_invoke()
{
  v2[10] = *MEMORY[0x263EF8340];
  v1[0] = @"gsp10-ssl.apple.com";
  v2[0] = [MEMORY[0x263EFF9D0] null];
  v1[1] = @"gs-loc.apple.com";
  v2[1] = [MEMORY[0x263EFF9D0] null];
  v2[2] = @"1.2.840.113635.100.6.27.35";
  v1[2] = @"iphone-ld.apple.com";
  v1[3] = @"configuration.apple.com";
  v2[3] = [MEMORY[0x263EFF9D0] null];
  v1[4] = @"cl5.apple.com";
  v2[4] = [MEMORY[0x263EFF9D0] null];
  v1[5] = @"cl4.apple.com";
  v2[5] = [MEMORY[0x263EFF9D0] null];
  v1[6] = @"cl3.apple.com";
  v2[6] = [MEMORY[0x263EFF9D0] null];
  v1[7] = @"cl2.apple.com";
  v2[7] = [MEMORY[0x263EFF9D0] null];
  v1[8] = @"ingest.apple-studies.com";
  v2[8] = [MEMORY[0x263EFF9D0] null];
  v1[9] = @"ingest.stg.apple-studies.com";
  v2[9] = [MEMORY[0x263EFF9D0] null];
  id result = (id)[NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:10];
  sLeafOIDs = (uint64_t)result;
  return result;
}

+ (id)knownHosts
{
  return (id)[(id)sLeafOIDs allKeys];
}

+ (int)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend((id)objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod");
  if (![v7 isEqualToString:*MEMORY[0x263EFC5A0]]) {
    goto LABEL_18;
  }
  v8 = objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "host");
  v9 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust");
  uint64_t v10 = [(id)sLeafOIDs objectForKeyedSubscript:v8];
  if (v10)
  {
    v11 = (void *)v10;
    if (v10 == [MEMORY[0x263EFF9D0] null])
    {
      if (onceToken_Utility_Default != -1) {
        dispatch_once(&onceToken_Utility_Default, &__block_literal_global_41);
      }
      v21 = logObject_Utility_Default;
      if (!os_log_type_enabled((os_log_t)logObject_Utility_Default, OS_LOG_TYPE_INFO))
      {
        unsigned int v17 = 3;
        goto LABEL_21;
      }
      *(_DWORD *)buf = 68289283;
      int v38 = 0;
      __int16 v39 = 2082;
      v40 = &unk_24B55C8A9;
      __int16 v41 = 2081;
      uint64_t v42 = [v8 UTF8String];
      _os_log_impl(&dword_24B559000, v21, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Warning Empty pinning rule for host\", \"host\":%{private, location:escape_only}s}", buf, 0x1Cu);
      unsigned int v17 = 3;
      goto LABEL_19;
    }
    AppleSSLPinned = (const void *)SecPolicyCreateAppleSSLPinned();
    if (AppleSSLPinned)
    {
      v13 = AppleSSLPinned;
      OSStatus v14 = SecTrustSetPolicies(v9, AppleSSLPinned);
      CFRelease(v13);
      SecTrustResultType v15 = kSecTrustResultInvalid;
      SecTrustResultType result = kSecTrustResultInvalid;
      if (v14)
      {
LABEL_8:
        if (v15 == kSecTrustResultProceed || v15 == kSecTrustResultUnspecified) {
          unsigned int v17 = 1;
        }
        else {
          unsigned int v17 = 2;
        }
LABEL_19:
        if (onceToken_Utility_Default != -1) {
          dispatch_once(&onceToken_Utility_Default, &__block_literal_global_41);
        }
        goto LABEL_21;
      }
      CFErrorRef err = 0;
      if (SecTrustEvaluateWithError(v9, &err))
      {
        SecTrustGetTrustResult(v9, &result);
        SecTrustResultType v15 = result;
        goto LABEL_8;
      }
      if (onceToken_Utility_Default != -1) {
        dispatch_once(&onceToken_Utility_Default, &__block_literal_global_41);
      }
      v29 = logObject_Utility_Default;
      if (os_log_type_enabled((os_log_t)logObject_Utility_Default, OS_LOG_TYPE_ERROR))
      {
        CFIndex Code = CFErrorGetCode(err);
        CFErrorDomain Domain = CFErrorGetDomain(err);
        *(_DWORD *)buf = 68289539;
        int v38 = 0;
        __int16 v39 = 2082;
        v40 = &unk_24B55C8A9;
        __int16 v41 = 2049;
        uint64_t v42 = Code;
        __int16 v43 = 2113;
        uint64_t v44 = (uint64_t)Domain;
        _os_log_impl(&dword_24B559000, v29, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Can't SecTrustEvaluate returned the error\", \"errorCode\":%{private}ld, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
        if (onceToken_Utility_Default != -1) {
          dispatch_once(&onceToken_Utility_Default, &__block_literal_global_41);
        }
      }
      uint64_t v32 = logObject_Utility_Default;
      if (!os_signpost_enabled((os_log_t)logObject_Utility_Default))
      {
LABEL_50:
        unsigned int v17 = 2;
        goto LABEL_19;
      }
      CFIndex v33 = CFErrorGetCode(err);
      CFErrorDomain v34 = CFErrorGetDomain(err);
      *(_DWORD *)buf = 68289539;
      int v38 = 0;
      __int16 v39 = 2082;
      v40 = &unk_24B55C8A9;
      __int16 v41 = 2049;
      uint64_t v42 = v33;
      __int16 v43 = 2113;
      uint64_t v44 = (uint64_t)v34;
      v26 = "Can't SecTrustEvaluate returned the error";
      v27 = "{\"msg%{public}.0s\":\"Can't SecTrustEvaluate returned the error\", \"errorCode\":%{private}ld, \"error\":%{"
            "private, location:escape_only}@}";
      v28 = v32;
    }
    else
    {
      if (onceToken_Utility_Default != -1) {
        dispatch_once(&onceToken_Utility_Default, &__block_literal_global_41);
      }
      v22 = logObject_Utility_Default;
      if (os_log_type_enabled((os_log_t)logObject_Utility_Default, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        int v38 = 0;
        __int16 v39 = 2082;
        v40 = &unk_24B55C8A9;
        __int16 v41 = 2082;
        uint64_t v42 = [v8 UTF8String];
        __int16 v43 = 2082;
        uint64_t v44 = [v11 UTF8String];
        _os_log_impl(&dword_24B559000, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to create a security policy\", \"host\":%{public, location:escape_only}s, \"leafOID\":%{public, location:escape_only}s}", buf, 0x26u);
        if (onceToken_Utility_Default != -1) {
          dispatch_once(&onceToken_Utility_Default, &__block_literal_global_41);
        }
      }
      uint64_t v23 = logObject_Utility_Default;
      if (!os_signpost_enabled((os_log_t)logObject_Utility_Default))
      {
        unsigned int v17 = 2;
        goto LABEL_21;
      }
      uint64_t v24 = [v8 UTF8String];
      uint64_t v25 = [v11 UTF8String];
      *(_DWORD *)buf = 68289538;
      int v38 = 0;
      __int16 v39 = 2082;
      v40 = &unk_24B55C8A9;
      __int16 v41 = 2082;
      uint64_t v42 = v24;
      __int16 v43 = 2082;
      uint64_t v44 = v25;
      v26 = "Unable to create a security policy";
      v27 = "{\"msg%{public}.0s\":\"Unable to create a security policy\", \"host\":%{public, location:escape_only}s, \"le"
            "afOID\":%{public, location:escape_only}s}";
      v28 = v23;
    }
    _os_signpost_emit_with_name_impl(&dword_24B559000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v26, v27, buf, 0x26u);
    goto LABEL_50;
  }
  if (onceToken_Utility_Default != -1) {
    dispatch_once(&onceToken_Utility_Default, &__block_literal_global_41);
  }
  v18 = logObject_Utility_Default;
  unsigned int v17 = 0;
  if (os_log_type_enabled((os_log_t)logObject_Utility_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v38 = 0;
    __int16 v39 = 2082;
    v40 = &unk_24B55C8A9;
    __int16 v41 = 2081;
    uint64_t v42 = [v8 UTF8String];
    _os_log_impl(&dword_24B559000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning No pinning rule for host\", \"host\":%{private, location:escape_only}s}", buf, 0x1Cu);
LABEL_18:
    unsigned int v17 = 0;
    goto LABEL_19;
  }
LABEL_21:
  v19 = logObject_Utility_Default;
  if (os_log_type_enabled((os_log_t)logObject_Utility_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v38 = 0;
    __int16 v39 = 2082;
    v40 = &unk_24B55C8A9;
    __int16 v41 = 2049;
    uint64_t v42 = v17;
    _os_log_impl(&dword_24B559000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#VerifyHost result\", \"result\":%{private}lu}", buf, 0x1Cu);
  }
  if (v17 == 2)
  {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 2, 0);
  }
  else if (v17 == 1)
  {
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x263EFC610], "credentialForTrust:", objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")));
  }
  else
  {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1, 0);
  }
  return v17;
}

@end