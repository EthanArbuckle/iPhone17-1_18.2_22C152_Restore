@interface DATrustHandler
- (BOOL)handleTrustChallenge:(id)a3 forAccount:(id)a4;
- (BOOL)handleTrustChallenge:(id)a3 forAccount:(id)a4 completionHandler:(id)a5;
- (BOOL)haveWarnedAboutCert:(id)a3 forHost:(id)a4;
- (BOOL)resetCertWarnings;
- (DATrustHandler)initWithDelegate:(id)a3;
- (DATrustHandlerDelegate)delegate;
- (NSMutableDictionary)haveWarnedAboutCertDict;
- (id)_serverSuffixesToAlwaysFail;
- (int)_actionForTrust:(__SecTrust *)a3 host:(id)a4 service:(id)a5;
- (void)handleTrust:(__SecTrust *)a3 forHost:(id)a4 forAccount:(id)a5 withCompletionBlock:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setHaveWarnedAboutCert:(id)a3 forHost:(id)a4;
- (void)setHaveWarnedAboutCertDict:(id)a3;
@end

@implementation DATrustHandler

- (DATrustHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DATrustHandler;
  v5 = [(DATrustHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (BOOL)haveWarnedAboutCert:(id)a3 forHost:(id)a4
{
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_haveWarnedAboutCertDict objectForKeyedSubscript:a3];
  objc_super v8 = v7;
  if (v6) {
    char v9 = [v7 containsObject:v6];
  }
  else {
    char v9 = v7 != 0;
  }

  return v9;
}

- (void)setHaveWarnedAboutCert:(id)a3 forHost:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  haveWarnedAboutCertDict = self->_haveWarnedAboutCertDict;
  if (!haveWarnedAboutCertDict)
  {
    objc_super v8 = (NSMutableDictionary *)objc_opt_new();
    char v9 = self->_haveWarnedAboutCertDict;
    self->_haveWarnedAboutCertDict = v8;

    haveWarnedAboutCertDict = self->_haveWarnedAboutCertDict;
  }
  v10 = [(NSMutableDictionary *)haveWarnedAboutCertDict objectForKeyedSubscript:v11];
  if (v10)
  {
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v10 = [MEMORY[0x1E4F1CA80] set];
  [(NSMutableDictionary *)self->_haveWarnedAboutCertDict setObject:v10 forKeyedSubscript:v11];
  if (v6) {
LABEL_5:
  }
    [v10 addObject:v6];
LABEL_6:
}

- (BOOL)resetCertWarnings
{
  haveWarnedAboutCertDict = self->_haveWarnedAboutCertDict;
  self->_haveWarnedAboutCertDict = 0;

  return 1;
}

- (int)_actionForTrust:(__SecTrust *)a3 host:(id)a4 service:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    v10 = [MEMORY[0x1E4F58108] defaultTrustManager];
    int v11 = [v10 actionForTrust:a3 forHost:v8 andService:v9];

    if (v11 == 2)
    {
      if (SecTrustGetCertificateCount(a3))
      {
        SecTrustGetCertificateAtIndex(a3, 0);
        id v12 = (id)SecCertificateGetSHA1Digest();
        if (v12)
        {
          v13 = [(DATrustHandler *)self delegate];
          v14 = (const void *)[v13 exceptionsForDigest:v12];

          if (v14)
          {
            CFDataRef v15 = SecTrustCopyExceptions(a3);
            if (v15)
            {
              CFDataRef v16 = v15;
              if (CFEqual(v14, v15))
              {
                int v11 = 2;
              }
              else
              {
                v18 = [MEMORY[0x1E4F58108] defaultTrustManager];
                [v18 allowTrust:a3 forHost:v8 service:v9];

                v19 = [(DATrustHandler *)self delegate];
                [v19 setExceptions:0 forDigest:v12];

                int v11 = 1;
              }
              CFRelease(v16);
              goto LABEL_12;
            }
          }
        }
      }
      else
      {
        id v12 = 0;
      }
      int v11 = 2;
LABEL_12:
    }
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (id)_serverSuffixesToAlwaysFail
{
  if (_serverSuffixesToAlwaysFail_onceToken != -1) {
    dispatch_once(&_serverSuffixesToAlwaysFail_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)_serverSuffixesToAlwaysFail__sServerSuffixes;
  return v2;
}

uint64_t __45__DATrustHandler__serverSuffixesToAlwaysFail__block_invoke()
{
  _serverSuffixesToAlwaysFail__sServerSuffixes = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @".me.com", @".icloud.com", 0);
  return MEMORY[0x1F41817F8]();
}

- (void)handleTrust:(__SecTrust *)a3 forHost:(id)a4 forAccount:(id)a5 withCompletionBlock:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v44 = a5;
  v10 = (void (**)(id, uint64_t))a6;
  int v11 = DALoggingwithCategory();
  uint64_t v12 = MEMORY[0x1E4F5E9A0];
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v11, v13))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA384000, v11, v13, "Checking to see if we should trust the server certificate", buf, 2u);
  }

  id v14 = (id)*MEMORY[0x1E4F58110];
  if (!a3)
  {
    CFDataRef v15 = DALoggingwithCategory();
    uint64_t v21 = *(unsigned __int8 *)(v12 + 3);
    if (os_log_type_enabled(v15, *(os_log_type_t *)(v12 + 3)))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v9;
      _os_log_impl(&dword_1BA384000, v15, (os_log_type_t)v21, "Terminating connection because server does not have an SSL certificate. Host: %@", buf, 0xCu);
    }
    uint64_t v20 = 0;
    goto LABEL_26;
  }
  CFDataRef v15 = [v44 accountPropertyForKey:@"DAAccountUseTrustedSSLCertificate"];
  CFDataRef v16 = [MEMORY[0x1E4F58108] defaultTrustManager];
  int v17 = [v16 rawTrustResultForSSLTrust:a3 hostname:v9 service:v14];

  if (v17 == 1) {
    goto LABEL_11;
  }
  if (v17 != 5)
  {
    if (v17 != 4)
    {
      v19 = DALoggingwithCategory();
      if (os_log_type_enabled(v19, v13))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v17;
        _os_log_impl(&dword_1BA384000, v19, v13, "Got SecTrustEvaluate result %u. Denying.", buf, 8u);
      }
      uint64_t v20 = 0;
      goto LABEL_25;
    }
    if (([v15 BOOLValue] & 1) == 0)
    {
      v18 = DALoggingwithCategory();
      if (os_log_type_enabled(v18, v13))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = @"DAAccountUseTrustedSSLCertificate";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v44;
        _os_log_impl(&dword_1BA384000, v18, v13, "Account now requires trusted certificate. Setting %@ to YES for account: %@", buf, 0x16u);
      }

      [v44 setAccountProperty:MEMORY[0x1E4F1CC38] forKey:@"DAAccountUseTrustedSSLCertificate"];
      [v44 updateExistingAccountProperties];
    }
LABEL_11:
    v19 = DALoggingwithCategory();
    if (os_log_type_enabled(v19, v13))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v17;
      _os_log_impl(&dword_1BA384000, v19, v13, "Got SecTrustEvaluate result %u. Allowing.", buf, 8u);
    }
    uint64_t v20 = 1;
LABEL_25:

LABEL_26:
    id v29 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v58 = 1;
LABEL_27:
    v10[2](v10, v20);
    goto LABEL_28;
  }
  v22 = DALoggingwithCategory();
  if (os_log_type_enabled(v22, v13))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 5;
    _os_log_impl(&dword_1BA384000, v22, v13, "Got SecTrustEvaluate result %u. Checking if needing to prompt.", buf, 8u);
  }

  int v42 = [v15 BOOLValue];
  v23 = DALoggingwithCategory();
  v24 = v23;
  if (v42)
  {
    os_log_type_t v25 = *(unsigned char *)(v12 + 3);
    if (os_log_type_enabled(v23, v25))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v44;
      v26 = "Terminating connection and warning user about an untrusted SSL certificate. The account requires trusted SSL"
            " certificate. Account: %@";
      v27 = v24;
      os_log_type_t v28 = v25;
LABEL_31:
      _os_log_impl(&dword_1BA384000, v27, v28, v26, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v23, v13))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v44;
    v26 = "Account does not require trusted certificate. Prompting user. Account: %@";
    v27 = v24;
    os_log_type_t v28 = v13;
    goto LABEL_31;
  }

  if (SecTrustGetCertificateCount(a3)
    && (SecTrustGetCertificateAtIndex(a3, 0),
        (id v30 = (id)SecCertificateGetSHA1Digest()) != 0))
  {
    id v29 = v30;
    BOOL v31 = [(DATrustHandler *)self haveWarnedAboutCert:v30 forHost:v9];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v58 = 1;
    if (v31)
    {
LABEL_49:
      uint64_t v20 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    id v29 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v58 = 1;
  }
  if (([MEMORY[0x1E4F5E940] promptForAllCerts] & 1) == 0)
  {
    v32 = [v9 lowercaseString];
    v33 = [(DATrustHandler *)self _serverSuffixesToAlwaysFail];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke;
    v52[3] = &unk_1E6211DD8;
    id v34 = v32;
    id v53 = v34;
    v54 = buf;
    [v33 enumerateObjectsUsingBlock:v52];
  }
  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    v35 = DALoggingwithCategory();
    os_log_type_t v36 = *(unsigned char *)(v12 + 4);
    if (os_log_type_enabled(v35, v36))
    {
      *(_DWORD *)v55 = 138412290;
      id v56 = v9;
      _os_log_impl(&dword_1BA384000, v35, v36, "IT'S A TARP!!! We received an untrusted cert for %@. You really think we're going to fall for that?", v55, 0xCu);
    }

    if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
      goto LABEL_49;
    }
  }
  v37 = DALoggingwithCategory();
  if (os_log_type_enabled(v37, v13))
  {
    *(_DWORD *)v55 = 138412290;
    id v56 = v9;
    _os_log_impl(&dword_1BA384000, v37, v13, "prompting certificate for host: %@", v55, 0xCu);
  }

  v38 = objc_opt_new();
  [v38 setTrust:a3];
  [v38 setHost:v9];
  [v38 setService:v14];
  v39 = [(DATrustHandler *)self delegate];
  v40 = [v39 accountDescription];
  [v38 setConnectionDisplayName:v40];

  if (v42)
  {
    v41 = objc_opt_new();
    [v41 setObject:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F58128]];
  }
  else
  {
    v41 = 0;
  }
  CFRetain(a3);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke_11;
  v45[3] = &unk_1E6211E28;
  id v29 = v29;
  id v46 = v29;
  v47 = self;
  id v48 = v9;
  v51 = a3;
  id v49 = v14;
  v50 = v10;
  [v38 showPromptWithOptions:v41 responseBlock:v45];

LABEL_28:
  _Block_object_dispose(buf, 8);
}

void __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasSuffix:") & 1) != 0
    || (v5 = *(void **)(a1 + 32),
        [v7 substringFromIndex:1],
        id v6 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = [v5 isEqualToString:v6],
        v6,
        v5))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke_11(uint64_t a1, int a2)
{
  id v4 = dataaccess_get_global_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke_2;
  block[3] = &unk_1E6211E00;
  int v17 = a2;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v11 = v5;
  uint64_t v12 = v6;
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 72);
  id v13 = v8;
  uint64_t v16 = v9;
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  dispatch_async(v4, block);
}

uint64_t __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = *(_DWORD *)(a1 + 80);
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_1BA384000, v2, v3, "got prompt response %d", (uint8_t *)v9, 8u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    [*(id *)(a1 + 40) setHaveWarnedAboutCert:v5 forHost:*(void *)(a1 + 48)];
  }
  if (*(_DWORD *)(a1 + 80) == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F58108] defaultTrustManager];
    [v6 allowTrust:*(void *)(a1 + 72) forHost:*(void *)(a1 + 48) service:*(void *)(a1 + 56)];
  }
  id v7 = *(const void **)(a1 + 72);
  if (v7) {
    CFRelease(v7);
  }
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(_DWORD *)(a1 + 80) != 0);
}

- (BOOL)handleTrustChallenge:(id)a3 forAccount:(id)a4
{
  return [(DATrustHandler *)self handleTrustChallenge:a3 forAccount:a4 completionHandler:0];
}

- (BOOL)handleTrustChallenge:(id)a3 forAccount:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (handleTrustChallenge_forAccount_completionHandler__onceToken != -1) {
    dispatch_once(&handleTrustChallenge_forAccount_completionHandler__onceToken, &__block_literal_global_14);
  }
  id v11 = [(DATrustHandler *)self delegate];
  uint64_t v12 = [v11 persistentUUID];

  id v13 = +[DAPowerAssertionManager sharedPowerAssertionManager];
  [v13 dropPowerAssertionsForGroupIdentifier:v12];

  id v14 = handleTrustChallenge_forAccount_completionHandler__sTrustChallengeQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__DATrustHandler_handleTrustChallenge_forAccount_completionHandler___block_invoke_2;
  block[3] = &unk_1E6211E78;
  id v21 = v8;
  v22 = self;
  id v23 = v9;
  id v24 = v12;
  id v25 = v10;
  id v15 = v10;
  id v16 = v12;
  id v17 = v9;
  id v18 = v8;
  dispatch_async(v14, block);

  return 0;
}

uint64_t __68__DATrustHandler_handleTrustChallenge_forAccount_completionHandler___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.dataaccess.trustChallengeQueue", 0);
  v1 = (void *)handleTrustChallenge_forAccount_completionHandler__sTrustChallengeQueue;
  handleTrustChallenge_forAccount_completionHandler__sTrustChallengeQueue = (uint64_t)v0;

  handleTrustChallenge_forAccount_completionHandler__outstandingTrustChallengeLock = (uint64_t)dispatch_semaphore_create(1);
  return MEMORY[0x1F41817F8]();
}

void __68__DATrustHandler_handleTrustChallenge_forAccount_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA384000, v2, v3, "Grabbing trust challenge lock...", buf, 2u);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)handleTrustChallenge_forAccount_completionHandler__outstandingTrustChallengeLock, 0xFFFFFFFFFFFFFFFFLL);
  int v4 = DALoggingwithCategory();
  if (os_log_type_enabled(v4, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA384000, v4, v3, "Lock acquired. Checking trust.", buf, 2u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) protectionSpace];
  uint64_t v6 = [v5 host];

  id v7 = [*(id *)(a1 + 32) protectionSpace];
  uint64_t v8 = [v7 serverTrust];

  id v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__DATrustHandler_handleTrustChallenge_forAccount_completionHandler___block_invoke_17;
  v11[3] = &unk_1E6211E50;
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 64);
  [v9 handleTrust:v8 forHost:v6 forAccount:v10 withCompletionBlock:v11];
}

void __68__DATrustHandler_handleTrustChallenge_forAccount_completionHandler___block_invoke_17(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v4 = +[DAPowerAssertionManager sharedPowerAssertionManager];
  [v4 reattainPowerAssertionsForGroupIdentifier:*(void *)(a1 + 32)];

  uint64_t v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = @"Not ";
    if (a2) {
      id v7 = &stru_1F13DB4B0;
    }
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_1BA384000, v5, v6, "%@Continuing connection", (uint8_t *)&v14, 0xCu);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)handleTrustChallenge_forAccount_completionHandler__outstandingTrustChallengeLock);
  if (a2)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F18D88]);
    id v9 = [*(id *)(a1 + 40) protectionSpace];
    uint64_t v10 = objc_msgSend(v8, "initWithTrust:", objc_msgSend(v9, "serverTrust"));

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v10);
    }
    else
    {
      id v13 = [*(id *)(a1 + 40) sender];
      [v13 useCredential:v10 forAuthenticationChallenge:*(void *)(a1 + 40)];
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, 1, 0);
      return;
    }
    uint64_t v10 = [*(id *)(a1 + 40) sender];
    [v10 continueWithoutCredentialForAuthenticationChallenge:*(void *)(a1 + 40)];
  }
}

- (DATrustHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DATrustHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)haveWarnedAboutCertDict
{
  return self->_haveWarnedAboutCertDict;
}

- (void)setHaveWarnedAboutCertDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_haveWarnedAboutCertDict, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end