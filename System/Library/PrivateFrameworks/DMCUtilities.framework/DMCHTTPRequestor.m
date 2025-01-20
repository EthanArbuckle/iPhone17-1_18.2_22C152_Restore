@interface DMCHTTPRequestor
+ (BOOL)_parsePairingTokenMissingErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5;
+ (BOOL)_parseSoftwareUpdateRequiredErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5;
+ (BOOL)_parseUnrecognizedDeviceErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5;
+ (BOOL)_parseWellKnownFailedErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5;
+ (BOOL)parse403ErrorWithResponseDictionary:(id)a3 outError:(id *)a4;
+ (BOOL)parsePredefined403ErrorWithResponseDictionary:(id)a3 outError:(id *)a4;
+ (id)_getServerErrorCodeFromResponseDictionary:(id)a3;
+ (id)_getServerErrorDetailsFromResponseDictionary:(id)a3;
+ (id)_getServerErrorMessageFromResponseDictionary:(id)a3;
+ (id)jsonDictFromResponse:(id)a3;
- (BOOL)didFailDueToCertNotTrusted;
- (BOOL)didFailDueToMissingCredentials;
- (DMCHTTPAuthenticator)authenticator;
- (NSArray)anchorCertificateRefs;
- (NSString)password;
- (NSString)username;
- selfReference;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)setAnchorCertificateRefs:(id)a3;
- (void)setAuthenticator:(id)a3;
- (void)setDidFailDueToCertNotTrusted:(BOOL)a3;
- (void)setDidFailDueToMissingCredentials:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setSelfReference:(id)a3;
- (void)setUsername:(id)a3;
- (void)startWithRequest:(id)a3 username:(id)a4 password:(id)a5 anchorCertificateRefs:(id)a6 completionBlock:(id)a7;
@end

@implementation DMCHTTPRequestor

- (void)startWithRequest:(id)a3 username:(id)a4 password:(id)a5 anchorCertificateRefs:(id)a6 completionBlock:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  [(DMCHTTPRequestor *)self setUsername:a4];
  [(DMCHTTPRequestor *)self setPassword:v15];

  [(DMCHTTPRequestor *)self setAnchorCertificateRefs:v14];
  [(DMCHTTPRequestor *)self setSelfReference:self];
  [(DMCHTTPRequestor *)self setDidFailDueToMissingCredentials:0];
  [(DMCHTTPRequestor *)self setDidFailDueToCertNotTrusted:0];
  v16 = [v12 valueForHTTPHeaderField:@"User-Agent"];

  if (!v16) {
    [v12 setValue:@"DeviceManagementClient/1.0" forHTTPHeaderField:@"User-Agent"];
  }
  v17 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
  [v17 setRequestCachePolicy:1];
  [v17 setTimeoutIntervalForRequest:90.0];
  [v17 setTLSMinimumSupportedProtocolVersion:771];
  v18 = [(DMCHTTPRequestor *)self authenticator];

  if (v18)
  {
    v19 = [(DMCHTTPRequestor *)self authenticator];
    id v41 = 0;
    char v20 = [v19 authenticateRequest:v12 error:&v41];
    v21 = (DMCHTTPRequestor *)v41;

    if ((v20 & 1) == 0)
    {
      v22 = *DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v21;
        _os_log_impl(&dword_1A7863000, v22, OS_LOG_TYPE_ERROR, "Failed to authenticate request with error: %{public}@", buf, 0xCu);
      }
    }
  }
  v23 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v17 delegate:self delegateQueue:0];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __93__DMCHTTPRequestor_startWithRequest_username_password_anchorCertificateRefs_completionBlock___block_invoke;
  v37[3] = &unk_1E5CFDDB0;
  id v24 = v12;
  id v38 = v24;
  v39 = self;
  id v25 = v13;
  id v40 = v25;
  v26 = [v23 dataTaskWithRequest:v24 completionHandler:v37];
  v27 = [(DMCHTTPRequestor *)self authenticator];
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    v29 = [(DMCHTTPRequestor *)self authenticator];
    id v36 = 0;
    char v30 = [v29 prepareTask:v26 error:&v36];
    v31 = (DMCHTTPRequestor *)v36;

    if ((v30 & 1) == 0)
    {
      v32 = *DMCLogObjects();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v31;
        _os_log_impl(&dword_1A7863000, v32, OS_LOG_TYPE_ERROR, "Failed to prepare task with error: %{public}@", buf, 0xCu);
      }
    }
  }
  v33 = *DMCLogObjects();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = v33;
    v35 = [v24 URL];
    *(_DWORD *)buf = 138543618;
    v43 = self;
    __int16 v44 = 2114;
    v45 = v35;
    _os_log_impl(&dword_1A7863000, v34, OS_LOG_TYPE_INFO, "%{public}@ Starting request to %{public}@", buf, 0x16u);
  }
  [v26 resume];
}

void __93__DMCHTTPRequestor_startWithRequest_username_password_anchorCertificateRefs_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  +[DMCHTTPLog logHTTPDetailsForIdentifier:@"Logs" request:*(void *)(a1 + 32) response:v8 responseData:v7 responseError:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v8;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  id v12 = v11;
  if (v11
    && [v11 statusCode] == 403
    && ([v12 MIMEType],
        id v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isEqualToString:@"application/json"],
        v13,
        v14))
  {
    id v15 = +[DMCHTTPRequestor jsonDictFromResponse:v7];
    if (v15)
    {
      id v57 = v9;
      +[DMCHTTPRequestor parse403ErrorWithResponseDictionary:v15 outError:&v57];
      id v16 = v57;

      id v9 = v16;
    }
    else
    {
      v56 = *DMCLogObjects();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7863000, v56, OS_LOG_TYPE_DEBUG, "Response from server could not be deserialized.", buf, 2u);
      }
    }
  }
  else
  {
    if ([*(id *)(a1 + 40) didFailDueToMissingCredentials])
    {
      id v24 = (void *)MEMORY[0x1E4F28C58];
      id v25 = DMCErrorArray(@"HTTP_INVALID_USERNAME_PASSWORD", v17, v18, v19, v20, v21, v22, v23, 0);
      v26 = [v24 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23003 descriptionArray:v25 underlyingError:v9 errorType:@"DMCFatalError"];

      if (v12 && [v12 statusCode] == 401)
      {
        v27 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
        char v28 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v29 = [v27 stringByTrimmingCharactersInSet:v28];

        if ([v29 length])
        {
          char v30 = [v26 userInfo];
          v31 = (void *)[v30 mutableCopy];

          [v31 setObject:v29 forKeyedSubscript:@"loginPrompt"];
          v32 = (void *)MEMORY[0x1E4F28C58];
          v33 = [v26 domain];
          uint64_t v34 = objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, objc_msgSend(v26, "code"), v31);

          v26 = (void *)v34;
        }
      }
    }
    else
    {
      if (![*(id *)(a1 + 40) didFailDueToCertNotTrusted]) {
        goto LABEL_18;
      }
      v35 = (void *)MEMORY[0x1E4F28C58];
      id v36 = [*(id *)(a1 + 32) URL];
      __int16 v44 = DMCErrorArray(@"HTTP_ERROR_INVALID_SERVER_CERT_P_URL_%@", v37, v38, v39, v40, v41, v42, v43, v36);
      v26 = [v35 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23002 descriptionArray:v44 errorType:@"DMCFatalError"];
    }
    id v9 = v26;
  }
LABEL_18:
  v45 = *DMCLogObjects();
  if (v9)
  {
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    uint64_t v46 = *(void **)(a1 + 40);
    v47 = v45;
    v48 = [v9 DMCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v59 = v46;
    __int16 v60 = 2114;
    uint64_t v61 = (uint64_t)v48;
    _os_log_impl(&dword_1A7863000, v47, OS_LOG_TYPE_ERROR, "%{public}@ failed to communicate with the MDM server. Error: %{public}@", buf, 0x16u);

    goto LABEL_25;
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v49 = (objc_class *)NSString;
    v50 = v45;
    v51 = (void *)[[v49 alloc] initWithData:v7 encoding:4];
    *(_DWORD *)buf = 138543362;
    v59 = v51;
    _os_log_impl(&dword_1A7863000, v50, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
  }
  v52 = *DMCLogObjects();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    v53 = *(void **)(a1 + 40);
    v47 = v52;
    uint64_t v54 = [v7 length];
    *(_DWORD *)buf = 138543618;
    v59 = v53;
    __int16 v60 = 2048;
    uint64_t v61 = v54;
    _os_log_impl(&dword_1A7863000, v47, OS_LOG_TYPE_INFO, "%{public}@ finished communicating. Received %lu bytes.", buf, 0x16u);
LABEL_25:
  }
LABEL_26:
  uint64_t v55 = *(void *)(a1 + 48);
  if (v55) {
    (*(void (**)(uint64_t, id, id, id))(v55 + 16))(v55, v7, v8, v9);
  }
  [*(id *)(a1 + 40) setSelfReference:0];
}

+ (id)_getServerErrorMessageFromResponseDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"message"];
  if ([v3 length])
  {
    v4 = v3;
  }
  else
  {
    v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_ERROR, "Server response did not contain message key.", v7, 2u);
    }
    v4 = &stru_1EFD813E0;
  }

  return v4;
}

+ (id)_getServerErrorCodeFromResponseDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"code"];
  if ([v3 length])
  {
    v4 = v3;
  }
  else
  {
    v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_ERROR, "Server response did not contain error key.", v7, 2u);
    }
    v4 = &stru_1EFD813E0;
  }

  return v4;
}

+ (id)_getServerErrorDetailsFromResponseDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"details"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    id v4 = v3;
  }
  else
  {
    v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_ERROR, "Server response did not contain error details.", v7, 2u);
    }
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

+ (id)jsonDictFromResponse:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dmc_jsonDictionaryFromData:", a3);
}

+ (BOOL)parse403ErrorWithResponseDictionary:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  if (!+[DMCHTTPRequestor parsePredefined403ErrorWithResponseDictionary:v5 outError:a4])
  {
    id v7 = +[DMCHTTPRequestor _getServerErrorMessageFromResponseDictionary:v5];
    if ([v7 length])
    {
      if (!a4)
      {
        BOOL v6 = 1;
        goto LABEL_12;
      }
      id v15 = (void *)MEMORY[0x1E4F28C58];
      id v16 = DMCErrorArray(@"HTTP_ERROR_403_RESPONSE_FROM_SERVER_WITH_MESSAGE_%@", v8, v9, v10, v11, v12, v13, v14, v7);
      *a4 = [v15 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23004 descriptionArray:v16 errorType:@"DMCFatalError"];
    }
    else
    {
      id v16 = +[DMCHTTPRequestor _getServerErrorCodeFromResponseDictionary:v5];
      uint64_t v17 = [v16 length];
      BOOL v6 = v17 != 0;
      if (!a4 || !v17) {
        goto LABEL_10;
      }
      id v25 = (void *)MEMORY[0x1E4F28C58];
      v26 = DMCErrorArray(@"HTTP_ERROR_403_RESPONSE_FROM_SERVER_NO_MESSAGE_%@", v18, v19, v20, v21, v22, v23, v24, v16);
      *a4 = [v25 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23005 descriptionArray:v26 errorType:@"DMCFatalError"];
    }
    BOOL v6 = 1;
LABEL_10:

LABEL_12:
    goto LABEL_13;
  }
  BOOL v6 = 1;
LABEL_13:

  return v6;
}

+ (BOOL)parsePredefined403ErrorWithResponseDictionary:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 _getServerErrorCodeFromResponseDictionary:v6];
  uint64_t v8 = [a1 _getServerErrorMessageFromResponseDictionary:v6];
  uint64_t v9 = [a1 _getServerErrorDetailsFromResponseDictionary:v6];

  if ([v7 isEqualToString:@"com.apple.softwareupdate.required"])
  {
    char v10 = [a1 _parseSoftwareUpdateRequiredErrorWithMessage:v8 details:v9 outError:a4];
  }
  else if ([v7 isEqualToString:@"com.apple.watch.pairing.token.missing"])
  {
    char v10 = [a1 _parsePairingTokenMissingErrorWithMessage:v8 details:v9 outError:a4];
  }
  else if ([v7 isEqualToString:@"com.apple.unrecognized.device"])
  {
    char v10 = [a1 _parseUnrecognizedDeviceErrorWithMessage:v8 details:v9 outError:a4];
  }
  else
  {
    if (![v7 isEqualToString:@"com.apple.well-known.failed"])
    {
      BOOL v11 = 0;
      goto LABEL_10;
    }
    char v10 = [a1 _parseWellKnownFailedErrorWithMessage:v8 details:v9 outError:a4];
  }
  BOOL v11 = v10;
LABEL_10:

  return v11;
}

+ (BOOL)_parsePairingTokenMissingErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [a4 objectForKeyedSubscript:@"security-token"];
  uint64_t v16 = [v8 length];
  if (v16)
  {
    if (a5)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = DMCErrorArray(@"HTTP_ERROR_403_RESPONSE_PAIRING_TOKEN_MISSING_%@", v9, v10, v11, v12, v13, v14, v15, v7);
      v27 = @"PairingParameters";
      v25[0] = @"SecurityToken";
      v25[1] = @"WatchUDID";
      v26[0] = v8;
      uint64_t v18 = +[DMCMobileGestalt deviceUDID];
      v26[1] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
      v28[0] = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      *a5 = [v23 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23007 descriptionArray:v17 suggestion:0 USEnglishSuggestion:0 underlyingError:0 errorType:@"DMCFatalError" addtionalUserInfo:v20];
    }
  }
  else
  {
    uint64_t v21 = *DMCLogObjects();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v21, OS_LOG_TYPE_ERROR, "Response from server does not contain security-token key.", buf, 2u);
    }
  }

  return v16 != 0;
}

+ (BOOL)_parseSoftwareUpdateRequiredErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5
{
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:@"OSVersion"];
  uint64_t v8 = [v7 length];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"BuildVersion"];
    uint64_t v10 = objc_opt_new();
    [v10 setObject:v7 forKeyedSubscript:@"OSVersion"];
    [v10 setObject:v9 forKeyedSubscript:@"BuildVersion"];
    [v10 setObject:v6 forKeyedSubscript:@"SoftwareUpdateInfo"];
    if (a5)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = DMCErrorArray(@"HTTP_ERROR_403_RESPONSE_SOFTWARE_UPDATE_REQUIRED", v11, v12, v13, v14, v15, v16, v17, 0);
      uint64_t v20 = (void *)[v10 copy];
      *a5 = [v18 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23006 descriptionArray:v19 suggestion:0 USEnglishSuggestion:0 underlyingError:0 errorType:@"DMCFatalError" addtionalUserInfo:v20];
    }
  }
  else
  {
    uint64_t v21 = *DMCLogObjects();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v21, OS_LOG_TYPE_ERROR, "Response from server does not contain OSVersion key.", buf, 2u);
    }
  }

  return v8 != 0;
}

+ (BOOL)_parseUnrecognizedDeviceErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5
{
  if (a5)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = DMCErrorArray(@"HTTP_ERROR_403_RESPONSE_UNRECOGNIZED_DEVICE", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7, 0);
    *a5 = [v9 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23008 descriptionArray:v10 suggestion:0 USEnglishSuggestion:0 underlyingError:0 errorType:@"DMCFatalError"];
  }
  return 1;
}

+ (BOOL)_parseWellKnownFailedErrorWithMessage:(id)a3 details:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v15 = a4;
  if (a5)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    if (v7) {
      DMCUnformattedErrorArray(v7, v8, v9, v10, v11, v12, v13, v14, 0);
    }
    else {
    uint64_t v17 = DMCErrorArray(@"HTTP_ERROR_403_RESPONSE_WELLKNOWN_FAILED", v8, v9, v10, v11, v12, v13, v14, 0);
    }
    *a5 = [v16 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23009 descriptionArray:v17 suggestion:0 USEnglishSuggestion:0 underlyingError:0 errorType:@"DMCFatalError"];
  }
  return 1;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = (void (**)(id, uint64_t, void))a6;
  uint64_t v10 = [v8 protectionSpace];
  uint64_t v11 = [v10 authenticationMethod];

  uint64_t v12 = *DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v57 = v11;
    _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_INFO, "Handling challenge for protection space %{public}@", buf, 0xCu);
  }
  if ([v8 previousFailureCount] < 1)
  {
    if ([(DMCHTTPRequestor *)v11 isEqualToString:*MEMORY[0x1E4F28988]])
    {
      id v15 = [v8 protectionSpace];
      uint64_t v16 = (__SecTrust *)[v15 serverTrust];

      if (!v16) {
        goto LABEL_48;
      }
      v49 = self;
      v50 = v9;
      uint64_t v17 = *DMCLogObjects();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7863000, v17, OS_LOG_TYPE_DEBUG, "Server Trust certificates:", buf, 2u);
      }
      trust = v16;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      CFArrayRef v18 = SecTrustCopyCertificateChain(v16);
      uint64_t v19 = [(__CFArray *)v18 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v53 != v21) {
              objc_enumerationMutation(v18);
            }
            CFStringRef v23 = SecCertificateCopySubjectSummary(*(SecCertificateRef *)(*((void *)&v52 + 1) + 8 * i));
            if (v23)
            {
              uint64_t v24 = (DMCHTTPRequestor *)v23;
              id v25 = *DMCLogObjects();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                id v57 = v24;
                _os_log_impl(&dword_1A7863000, v25, OS_LOG_TYPE_DEBUG, "  %{public}@", buf, 0xCu);
              }
              CFRelease(v24);
            }
          }
          uint64_t v20 = [(__CFArray *)v18 countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v20);
      }

      self = v49;
      v26 = [(DMCHTTPRequestor *)v49 anchorCertificateRefs];
      uint64_t v27 = [v26 count];

      uint64_t v9 = v50;
      if (v27)
      {
        CFArrayRef v28 = [(DMCHTTPRequestor *)v49 anchorCertificateRefs];
        OSStatus v29 = SecTrustSetAnchorCertificates(trust, v28);

        if (v29)
        {
          char v30 = *DMCLogObjects();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v57) = v29;
            v31 = "Could not set anchor certificates for trust evaluation. Status: %d";
LABEL_39:
            _os_log_impl(&dword_1A7863000, v30, OS_LOG_TYPE_ERROR, v31, buf, 8u);
            goto LABEL_47;
          }
          goto LABEL_47;
        }
        OSStatus v38 = SecTrustSetAnchorCertificatesOnly(trust, 1u);
        if (v38)
        {
          OSStatus v39 = v38;
          char v30 = *DMCLogObjects();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v57) = v39;
            v31 = "Could not use exclude system default anchor certificates for trust evaluation. Status: %d";
            goto LABEL_39;
          }
LABEL_47:

LABEL_48:
          v47 = *DMCLogObjects();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v33 = "Rejecting server trust. Canceling.";
            uint64_t v34 = v47;
            os_log_type_t v35 = OS_LOG_TYPE_INFO;
            goto LABEL_50;
          }
LABEL_52:
          v9[2](v9, 2, 0);
          goto LABEL_53;
        }
      }
      CFErrorRef error = 0;
      if (!SecTrustEvaluateWithError(trust, &error))
      {
        CFStringRef v45 = CFErrorCopyDescription(error);
        uint64_t v46 = *DMCLogObjects();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v57 = (DMCHTTPRequestor *)v45;
          _os_log_impl(&dword_1A7863000, v46, OS_LOG_TYPE_ERROR, "Handle challenge, trust evaluation failed: %{public}@", buf, 0xCu);
        }
        [(DMCHTTPRequestor *)v49 setDidFailDueToCertNotTrusted:1];
        CFRelease(v45);
        CFRelease(error);
        goto LABEL_47;
      }

      uint64_t v40 = *DMCLogObjects();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7863000, v40, OS_LOG_TYPE_INFO, "Accepting server trust.", buf, 2u);
      }
    }
    else if (([(DMCHTTPRequestor *)v11 isEqualToString:*MEMORY[0x1E4F28980]] & 1) == 0 {
           && ![(DMCHTTPRequestor *)v11 isEqualToString:*MEMORY[0x1E4F28978]])
    }
    {
      v32 = *DMCLogObjects();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v57 = self;
        __int16 v58 = 2114;
        v59 = v11;
        v33 = "%{public}@ cannot accept the authentication method %{public}@";
        uint64_t v34 = v32;
        os_log_type_t v35 = OS_LOG_TYPE_ERROR;
        uint32_t v36 = 22;
LABEL_51:
        _os_log_impl(&dword_1A7863000, v34, v35, v33, buf, v36);
        goto LABEL_52;
      }
      goto LABEL_52;
    }
    uint64_t v41 = (void *)MEMORY[0x1E4F29098];
    uint64_t v42 = [(DMCHTTPRequestor *)self username];
    uint64_t v43 = [(DMCHTTPRequestor *)self password];
    __int16 v44 = [v41 credentialWithUser:v42 password:v43 persistence:0];

    ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v44);
    goto LABEL_53;
  }
  uint64_t v13 = *DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7863000, v13, OS_LOG_TYPE_ERROR, "We have failed too many times.", buf, 2u);
  }
  if (([(DMCHTTPRequestor *)v11 isEqualToString:*MEMORY[0x1E4F28980]] & 1) == 0
    && ![(DMCHTTPRequestor *)v11 isEqualToString:*MEMORY[0x1E4F28978]])
  {
    uint64_t v37 = *DMCLogObjects();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v33 = "Canceling the authentication challenge...";
      uint64_t v34 = v37;
      os_log_type_t v35 = OS_LOG_TYPE_DEBUG;
LABEL_50:
      uint32_t v36 = 2;
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  [(DMCHTTPRequestor *)self setDidFailDueToMissingCredentials:1];
  uint64_t v14 = *DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_DEBUG, "Continue without credential for authentication challenge...", buf, 2u);
  }
  v9[2](v9, 0, 0);
LABEL_53:
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSArray)anchorCertificateRefs
{
  return self->_anchorCertificateRefs;
}

- (void)setAnchorCertificateRefs:(id)a3
{
}

- selfReference
{
  return self->_selfReference;
}

- (void)setSelfReference:(id)a3
{
}

- (BOOL)didFailDueToMissingCredentials
{
  return self->_didFailDueToMissingCredentials;
}

- (void)setDidFailDueToMissingCredentials:(BOOL)a3
{
  self->_didFailDueToMissingCredentials = a3;
}

- (BOOL)didFailDueToCertNotTrusted
{
  return self->_didFailDueToCertNotTrusted;
}

- (void)setDidFailDueToCertNotTrusted:(BOOL)a3
{
  self->_didFailDueToCertNotTrusted = a3;
}

- (DMCHTTPAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void)setAuthenticator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong(&self->_selfReference, 0);
  objc_storeStrong((id *)&self->_anchorCertificateRefs, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end