@interface EDBIMIManager
- (BOOL)_shouldScheduleAnotherDownloadBatch;
- (EDBIMIManager)initWithMessagePersistence:(id)a3 urlSession:(id)a4;
- (EDMessagePersistence)messagePersistence;
- (EFScheduler)downloadScheduler;
- (EMRemoteContentURLSession)urlSession;
- (id)processBIMIHeadersForMessages:(id)a3;
- (uint64_t)_analyticsValueForResultString:(char)a3 isBIMIStatementResult:;
- (uint64_t)_authenticationResultsCountSignedByDKIMHeader:(uint64_t)a1;
- (uint64_t)_bimiPassedWithAuthenticationResults:(void *)a3 authenticationServiceIdentifier:(void *)a4 bimiStatement:;
- (uint64_t)_indicatorIsValid:(void *)a3 forBIMIData:;
- (uint64_t)_isRecoverableError:(uint64_t)a1;
- (uint64_t)_validateDKIMSignatureAndAuthenticationResultsDomainForMessage:(void *)a3 withHeaderData:(void *)a4 incomingMailServerDomain:(void *)a5 authenticationServiceIdentifier:(void *)a6 allAuthenticationResults:(int)a7 logFailure:;
- (uint64_t)_vmcWasVerifiedWithBIMIStatement:(uint64_t)a1;
- (void)_downloadUndownloadedIndicators;
- (void)dealloc;
- (void)scheduleRecurringActivity;
- (void)test_tearDown;
@end

@implementation EDBIMIManager

void ___ef_log_EDBIMIManager_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDBIMIManager");
  v1 = (void *)_ef_log_EDBIMIManager_log;
  _ef_log_EDBIMIManager_log = (uint64_t)v0;
}

- (EDBIMIManager)initWithMessagePersistence:(id)a3 urlSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EDBIMIManager;
  v9 = [(EDBIMIManager *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messagePersistence, a3);
    objc_storeStrong((id *)&v10->_urlSession, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeDataTasksByRequest = v10->_activeDataTasksByRequest;
    v10->_activeDataTasksByRequest = v11;

    uint64_t v13 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"EDBIMIManager.downloadScheduler" qualityOfService:17];
    downloadScheduler = v10->_downloadScheduler;
    v10->_downloadScheduler = (EFScheduler *)v13;
  }
  return v10;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_activeDataTasksByRequest enumerateKeysAndObjectsUsingBlock:&__block_literal_global_31];
  v3.receiver = self;
  v3.super_class = (Class)EDBIMIManager;
  [(EDBIMIManager *)&v3 dealloc];
}

uint64_t __24__EDBIMIManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

- (void)scheduleRecurringActivity
{
  objc_super v3 = _ef_log_EDBIMIManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling initial download", v4, 2u);
  }

  -[EDBIMIManager _downloadUndownloadedIndicators](self);
}

- (void)_downloadUndownloadedIndicators
{
  if (val)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, val);
    objc_copyWeak(&v1, &location);
    EMPrivacyProxyIsDisabledForNetwork();
    objc_destroyWeak(&v1);
    objc_destroyWeak(&location);
  }
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDBIMIManager.m", 80, @"%s can only be called from unit tests", "-[EDBIMIManager test_tearDown]");
  }
  id v4 = [(EDBIMIManager *)self downloadScheduler];
  [v4 performSyncBlock:&__block_literal_global_42];
}

- (id)processBIMIHeadersForMessages:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__EDBIMIManager_processBIMIHeadersForMessages___block_invoke;
  aBlock[3] = &unk_1E6BFF948;
  aBlock[4] = self;
  v57 = (void (**)(void *, id, id, void *, uint64_t))_Block_copy(aBlock);
  char v53 = [MEMORY[0x1E4F602E0] preferenceEnabled:22];
  int v56 = [MEMORY[0x1E4F602E0] preferenceEnabled:23];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v44;
  uint64_t v3 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (v3)
  {
    uint64_t v60 = *(void *)v71;
    uint64_t v51 = *MEMORY[0x1E4F606B0];
    do
    {
      uint64_t v61 = v3;
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v71 != v60) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        __int16 v6 = [v5 authenticationState];
        if ((v6 & 0xE08) == 0x408 && (v6 & 0x30) != 16)
        {
LABEL_13:
          uint64_t v13 = [v5 headers];
          v14 = [MEMORY[0x1E4F60848] authenticationResultsForHeaders:v13];
          id v68 = 0;
          id v69 = 0;
          char v15 = -[EDBIMIManager _bimiPassedWithAuthenticationResults:authenticationServiceIdentifier:bimiStatement:]((uint64_t)self, v14, &v69, &v68);
          id v16 = v69;
          id v17 = v68;
          if (v15)
          {
            v18 = [v13 encodedHeaders];
            v58 = EMRecodeDataToNetwork();

            v62 = [MEMORY[0x1E4F607D0] bimiDataForHeaders:v13];
            v19 = (void *)MEMORY[0x1E4F1CB10];
            v20 = [v5 account];
            v21 = [v20 hostname];
            v22 = objc_msgSend(v19, "ef_urlWithString:", v21);
            v23 = objc_msgSend(v22, "ef_highLevelDomain");

            if (v53) {
              int IsAllowlisted = 0;
            }
            else {
              int IsAllowlisted = EMBIMIIncomingServerHighLevelDomainIsAllowlisted();
            }
            uint64_t v25 = -[EDBIMIManager _validateDKIMSignatureAndAuthenticationResultsDomainForMessage:withHeaderData:incomingMailServerDomain:authenticationServiceIdentifier:allAuthenticationResults:logFailure:]((uint64_t)self, v5, v58, v23, v16, v14, v56 & ~IsAllowlisted);
            if ((IsAllowlisted | v56 & v25))
            {
              v26 = [v62 location];
              v54 = [v62 evidenceLocation];
              if (v26 && v54)
              {
                v52 = [v62 indicator];
                v50 = [v49 objectForKeyedSubscript:v26];
                if (!v50
                  || v52
                  && ([v50 indicator],
                      v27 = objc_claimAutoreleasedReturnValue(),
                      BOOL v28 = v27 == 0,
                      v27,
                      v28))
                {
                  [v49 setObject:v62 forKeyedSubscript:v26];
                }
                v29 = [v46 objectForKeyedSubscript:v26];
                v30 = v29;
                if (v29)
                {
                  [v29 addObject:v5];
                }
                else
                {
                  v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
                  [v46 setObject:v30 forKeyedSubscript:v26];
                }
                v57[2](v57, v16, v17, v62, v25);
                _ef_log_EDBIMIManager();
                v32 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  log = v32;
                  id v48 = v26;
                  if ([MEMORY[0x1E4F602E0] preferenceEnabled:13])
                  {
                    v33 = [v48 absoluteString];
                  }
                  else
                  {
                    v34 = (void *)MEMORY[0x1E4F60E00];
                    v45 = [v48 absoluteString];
                    v33 = [v34 fullyRedactedStringForString:v45];
                  }
                  *(_DWORD *)buf = 138543874;
                  v35 = @" and indicator";
                  if (!v52) {
                    v35 = &stru_1F3583658;
                  }
                  *(void *)&buf[4] = v33;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v35;
                  *(_WORD *)&buf[22] = 2114;
                  v76 = v5;
                  _os_log_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEFAULT, "Adding BIMI url (%{public}@)%@ for message: %{public}@", buf, 0x20u);

                  v32 = log;
                }
              }
              else
              {
                v57[2](v57, v16, v17, v62, v25);
              }
            }
            else
            {
              if ((v56 & 1) == 0)
              {
                v31 = _ef_log_EDBIMIManager();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v5;
                  _os_log_impl(&dword_1DB39C000, v31, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because mail provider is not allowlisted for message %@", buf, 0xCu);
                }
              }
              v57[2](v57, v16, v17, v62, v25);
            }
          }
          else
          {
            v57[2](v57, v16, v17, 0, 0);
          }

          goto LABEL_48;
        }
        id v8 = [v5 account];
        v9 = [v8 baseAccount];
        if ([v9 isAppleAccount])
        {
          v10 = [v5 headers];
          v11 = [v10 firstHeaderForKey:v51];
          BOOL v12 = v11 == 0;

          if (!v12) {
            goto LABEL_13;
          }
        }
        else
        {
        }
        uint64_t v13 = _ef_log_EDBIMIManager();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v5;
          _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Skipping BIMI due to on-device message authentication failure for message %@", buf, 0xCu);
        }
LABEL_48:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v3);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v76) = 0;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __47__EDBIMIManager_processBIMIHeadersForMessages___block_invoke_92;
  v64[3] = &unk_1E6BFF970;
  v64[4] = self;
  id v37 = v36;
  id v65 = v37;
  id v38 = v46;
  id v66 = v38;
  v67 = buf;
  [v49 enumerateKeysAndObjectsUsingBlock:v64];
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    v39 = _ef_log_EDBIMIManager();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_1DB39C000, v39, OS_LOG_TYPE_DEFAULT, "May have undownloaded indicators, downloading now", v63, 2u);
    }

    -[EDBIMIManager _downloadUndownloadedIndicators](self);
  }
  else if ([v49 count])
  {
    v40 = _ef_log_EDBIMIManager();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_1DB39C000, v40, OS_LOG_TYPE_DEFAULT, "All BIMI messages have embedded indicators", v63, 2u);
    }
  }
  v41 = v66;
  id v42 = v37;

  _Block_object_dispose(buf, 8);

  return v42;
}

void __47__EDBIMIManager_processBIMIHeadersForMessages___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v11 = a4;
  id v8 = v11;
  id v9 = v7;
  id v10 = v6;
  AnalyticsSendEventLazy();
}

id __47__EDBIMIManager_processBIMIHeadersForMessages___block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v29 = *(void **)(a1 + 32);
  v2 = v29;
  v30[0] = @"authservID";
  if (!v29)
  {
    v2 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = v2;
  v30[1] = @"hasBIMIResult";
  uint64_t v32 = [NSNumber numberWithInt:*(void *)(a1 + 40) != 0];
  v30[2] = @"bimiResult";
  uint64_t v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 48);
  v27 = (void *)v32;
  BOOL v28 = [*(id *)(a1 + 40) result];
  uint64_t v25 = objc_msgSend(v3, "numberWithUnsignedInteger:", -[EDBIMIManager _analyticsValueForResultString:isBIMIStatementResult:](v4, v28, 1));
  v33 = v25;
  v30[3] = @"vmcResult";
  id v5 = NSNumber;
  uint64_t v6 = *(void *)(a1 + 48);
  v26 = [*(id *)(a1 + 40) valueForPropertyType:*MEMORY[0x1E4F60620] property:@"authority"];
  v24 = objc_msgSend(v5, "numberWithUnsignedInteger:", -[EDBIMIManager _analyticsValueForResultString:isBIMIStatementResult:](v6, v26, 0));
  v34 = v24;
  v30[4] = @"hasLocation";
  id v7 = NSNumber;
  v23 = [*(id *)(a1 + 56) location];
  v22 = [v7 numberWithInt:v23 != 0];
  v35 = v22;
  v30[5] = @"hasEvidenceLocation";
  id v8 = NSNumber;
  v21 = [*(id *)(a1 + 56) evidenceLocation];
  id v9 = [v8 numberWithInt:v21 != 0];
  id v36 = v9;
  v30[6] = @"hasIndicator";
  id v10 = NSNumber;
  id v11 = [*(id *)(a1 + 56) indicator];
  BOOL v12 = [v10 numberWithInt:v11 != 0];
  id v37 = v12;
  v30[7] = @"hasIndicatorHash";
  uint64_t v13 = NSNumber;
  v14 = [*(id *)(a1 + 56) indicatorHash];
  char v15 = [v13 numberWithInt:v14 != 0];
  id v38 = v15;
  v30[8] = @"indicatorHashAlgorithm";
  id v16 = [*(id *)(a1 + 56) hashAlgorithm];
  id v17 = v16;
  if (!v16)
  {
    id v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = v17;
  v30[9] = @"hasDKIMSignature";
  v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v40 = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:v30 count:10];

  if (!v16) {
  if (!v29)
  }

  return v19;
}

- (uint64_t)_analyticsValueForResultString:(char)a3 isBIMIStatementResult:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if ([v5 isEqualToString:@"pass"])
    {
      uint64_t v7 = 1;
    }
    else
    {
      int v8 = [v6 isEqualToString:@"fail"];
      char v9 = v8 | a3 ^ 1;
      if (v8) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 0;
      }
      if ((v9 & 1) == 0)
      {
        if ([v6 isEqualToString:@"temperror"])
        {
          uint64_t v7 = 3;
        }
        else if ([v6 isEqualToString:@"declined"])
        {
          uint64_t v7 = 4;
        }
        else if ([v6 isEqualToString:@"skipped"])
        {
          uint64_t v7 = 5;
        }
        else
        {
          uint64_t v7 = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)_bimiPassedWithAuthenticationResults:(void *)a3 authenticationServiceIdentifier:(void *)a4 bimiStatement:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  int v8 = v7;
  if (a1)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      v20 = a3;
      id v11 = v8;
      BOOL v12 = a4;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v9);
          }
          char v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v16 = [v15 firstStatementForMethod:@"bimi"];
          if (v16)
          {
            [v15 authenticationServiceIdentifier];
            a4 = v12;
            int v8 = v11;
            id v17 = a3 = v20;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      id v17 = 0;
      id v16 = 0;
      a4 = v12;
      int v8 = v11;
      a3 = v20;
    }
    else
    {
      id v17 = 0;
      id v16 = 0;
    }
LABEL_13:

    v18 = [v16 result];
    if ([v18 isEqualToString:@"pass"]) {
      a1 = -[EDBIMIManager _vmcWasVerifiedWithBIMIStatement:](a1, v16);
    }
    else {
      a1 = 0;
    }

    if (a3) {
      *a3 = v17;
    }
    if (a4) {
      *a4 = v16;
    }
  }
  return a1;
}

- (uint64_t)_validateDKIMSignatureAndAuthenticationResultsDomainForMessage:(void *)a3 withHeaderData:(void *)a4 incomingMailServerDomain:(void *)a5 authenticationServiceIdentifier:(void *)a6 allAuthenticationResults:(int)a7 logFailure:
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v57 = a2;
  id v58 = a3;
  id v13 = a4;
  id v52 = a5;
  id v55 = a6;
  if (!a1)
  {
    uint64_t v33 = 0;
    goto LABEL_30;
  }
  id v64 = 0;
  id v53 = objc_alloc_init(MEMORY[0x1E4F607F0]);
  v14 = [v53 verificationContextForMessageData:v58 error:&v64];
  id v56 = v64;
  v54 = v14;
  if (v14)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    char v15 = [v14 dkimSignatureHeaders];
    uint64_t v50 = a1;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v74 count:16];
    int v51 = a7;
    if (v16)
    {
      uint64_t v17 = *(void *)v61;
LABEL_5:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v61 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v60 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1E4F1CB10];
        long long v21 = [v19 signingDomainIdentifier];
        long long v22 = objc_msgSend(v20, "ef_urlWithString:", v21);
        long long v23 = objc_msgSend(v22, "ef_highLevelDomain");

        if (objc_msgSend(v23, "ef_caseInsensitiveIsEqualToString:", v13)) {
          break;
        }

        if (v16 == ++v18)
        {
          uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v74 count:16];
          if (v16) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v24 = v19;

      if (!v24) {
        goto LABEL_20;
      }
      uint64_t v25 = [v24 bodyLength];
      if (!v25
        || ([v24 bodyLength],
            uint64_t v26 = objc_claimAutoreleasedReturnValue(),
            BOOL v27 = [v26 unsignedIntegerValue] == 0,
            v26,
            v25,
            !v27))
      {
        if (v51)
        {
          _ef_log_EDBIMIManager();
          BOOL v28 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = [v24 bodyLength];
            *(_DWORD *)buf = 138412546;
            id v67 = v29;
            __int16 v68 = 2112;
            id v69 = v57;
            _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because DKIM body length was non-zero (%@) for message %@", buf, 0x16u);
          }
        }
LABEL_19:
        unsigned __int8 v65 = 0;

        goto LABEL_29;
      }
      uint64_t v35 = -[EDBIMIManager _authenticationResultsCountSignedByDKIMHeader:](v50, v24);
      if (v35 != [v55 count])
      {
        if (v51)
        {
          _ef_log_EDBIMIManager();
          v45 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            id v46 = objc_msgSend(v56, "ef_publicDescription");
            *(_DWORD *)buf = 138412546;
            id v67 = v57;
            __int16 v68 = 2114;
            id v69 = v46;
            _os_log_impl(&dword_1DB39C000, v45, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because DKIM signature does not include all authentication-results for message %@: %{public}@", buf, 0x16u);
          }
        }
        goto LABEL_19;
      }
      id v59 = 0;
      char v36 = [v53 verifyMessageWithContext:v54 options:1 error:&v59];
      id v37 = v59;

      if ((v36 & 1) == 0)
      {
        if (v51)
        {
          _ef_log_EDBIMIManager();
          v47 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            id v48 = objc_msgSend(v37, "ef_publicDescription");
            *(_DWORD *)buf = 138412546;
            id v67 = v57;
            __int16 v68 = 2114;
            id v69 = v48;
            _os_log_impl(&dword_1DB39C000, v47, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because DKIM verification failed for message %@: %{public}@", buf, 0x16u);
          }
        }
        unsigned __int8 v65 = 0;

        goto LABEL_53;
      }

      id v38 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_urlWithString:", v52);
      v39 = objc_msgSend(v38, "ef_highLevelDomain");

      if ((objc_msgSend(v39, "ef_caseInsensitiveIsEqualToString:", v13) & 1) == 0)
      {
        v40 = [v55 firstObject];
        uint64_t v41 = (void *)MEMORY[0x1E4F1CB10];
        id v42 = [v40 authenticationServiceIdentifier];
        v43 = objc_msgSend(v41, "ef_urlWithString:", v42);
        id v44 = objc_msgSend(v43, "ef_highLevelDomain");

        if ((objc_msgSend(v39, "ef_caseInsensitiveIsEqualToString:", v44) & 1) == 0)
        {
          if (v51)
          {
            id v49 = _ef_log_EDBIMIManager();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413058;
              id v67 = v39;
              __int16 v68 = 2112;
              id v69 = v13;
              __int16 v70 = 2112;
              long long v71 = v44;
              __int16 v72 = 2112;
              id v73 = v57;
              _os_log_impl(&dword_1DB39C000, v49, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because authserv-id of BIMI statement (%@) does not match mail server domain %@ or first authserv-id (%@) for message %@", buf, 0x2Au);
            }
          }
          unsigned __int8 v65 = 0;

          goto LABEL_52;
        }
      }
      unsigned __int8 v65 = 1;
LABEL_52:

LABEL_53:
      id v56 = v37;
      goto LABEL_29;
    }
LABEL_11:

LABEL_20:
    if (v51)
    {
      v30 = _ef_log_EDBIMIManager();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v57;
        _os_log_impl(&dword_1DB39C000, v30, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because no DKIM signature with correct domain was found for message %@", buf, 0xCu);
      }
    }
  }
  else if (a7)
  {
    _ef_log_EDBIMIManager();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = objc_msgSend(v56, "ef_publicDescription");
      *(_DWORD *)buf = 138412546;
      id v67 = v57;
      __int16 v68 = 2114;
      id v69 = v32;
      _os_log_impl(&dword_1DB39C000, v31, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because header could not be parsed for message %@: %{public}@", buf, 0x16u);
    }
  }
  unsigned __int8 v65 = 0;
LABEL_29:

  uint64_t v33 = v65;
LABEL_30:

  return v33;
}

void __47__EDBIMIManager_processBIMIHeadersForMessages___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) messagePersistence];
  uint64_t v7 = [v6 addBrandIndicatorWithData:v5];

  if (v7 != *MEMORY[0x1E4F5FCC8])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F60DF0]);
    id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v14];
    uint64_t v10 = (void *)[v8 initWithFirst:v14 second:v9];
    id v11 = *(void **)(a1 + 40);
    BOOL v12 = [NSNumber numberWithLongLong:v7];
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
  id v13 = [v5 indicator];

  if (!v13) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (uint64_t)_authenticationResultsCountSignedByDKIMHeader:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = [v3 signedHeaderFields];
    uint64_t v6 = objc_msgSend(v5, "ef_filter:", &__block_literal_global_98);
    uint64_t v7 = [v6 count];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __63__EDBIMIManager__authenticationResultsCountSignedByDKIMHeader___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_caseInsensitiveIsEqualToString:", *MEMORY[0x1E4F60640]);
}

- (uint64_t)_vmcWasVerifiedWithBIMIStatement:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = [v3 valueForPropertyType:*MEMORY[0x1E4F60620] property:@"authority"];
    uint64_t v6 = [v5 isEqualToString:@"pass"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _ef_log_EDBIMIManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"enabled";
    if (a2) {
      id v5 = @"disabled";
    }
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Scheduling indicator download, privacy proxy is %{public}@", buf, 0xCu);
  }

  uint64_t v6 = [*(id *)(a1 + 32) downloadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_105;
  v7[3] = &unk_1E6BFFA00;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  char v9 = a2;
  [v6 performBlock:v7];

  objc_destroyWeak(&v8);
}

void __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_105(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v24 = WeakRetained;
    uint64_t v25 = [WeakRetained messagePersistence];
    long long v23 = [v2 urlSession];
    v19 = [v25 undownloadedBrandIndicatorsWithLimit:10];
    _ef_log_EDBIMIManager();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v37 = [v19 count];
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Downloading %lu indicators", buf, 0xCu);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v19;
    uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v4)
    {
      uint64_t v21 = *(void *)v32;
      id v5 = (os_unfair_lock_s *)(v24 + 16);
      do
      {
        uint64_t v26 = v4;
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v8 = [v7 location];
          char v9 = [MEMORY[0x1E4F290D0] requestWithURL:v8];
          uint64_t v10 = *(unsigned __int8 *)(a1 + 40);
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_107;
          v27[3] = &unk_1E6BFF9D8;
          v27[4] = v24;
          v27[5] = v7;
          id v28 = v25;
          id v11 = v8;
          id v29 = v11;
          id v12 = v9;
          id v30 = v12;
          id v13 = [v23 dataTaskWithRequest:v12 isSynthetic:1 allowProxying:1 failOpen:v10 completionHandler:v27];
          os_unfair_lock_lock(v5);
          [*((id *)v24 + 1) setObject:v13 forKeyedSubscript:v12];
          os_unfair_lock_unlock(v5);
          [v13 resume];
          _ef_log_EDBIMIManager();
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = v11;
            if ([MEMORY[0x1E4F602E0] preferenceEnabled:13])
            {
              uint64_t v16 = [v15 absoluteString];
            }
            else
            {
              uint64_t v17 = (void *)MEMORY[0x1E4F60E00];
              uint64_t v18 = [v15 absoluteString];
              uint64_t v16 = [v17 fullyRedactedStringForString:v18];
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v37 = (uint64_t)v16;
            _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Requesting indicator data for URL: %{public}@", buf, 0xCu);
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v4);
    }

    v2 = v24;
  }
}

void __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_107(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v7)
  {
    int v11 = -[EDBIMIManager _indicatorIsValid:forBIMIData:](v10, v7, *(void **)(a1 + 40));
    id v12 = *(void **)(a1 + 48);
    if (v11)
    {
      [v12 setBrandIndicator:v7 forURL:*(void *)(a1 + 56)];
      *(void *)&long long v36 = MEMORY[0x1E4F143A8];
      *((void *)&v36 + 1) = 3221225472;
      uint64_t v37 = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_3;
      uint64_t v38 = &__block_descriptor_35_e19___NSDictionary_8__0l;
      LOWORD(v39) = 257;
      BYTE2(v39) = 1;
      AnalyticsSendEventLazy();
      _ef_log_EDBIMIManager();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = *(id *)(a1 + 56);
        if (objc_msgSend(MEMORY[0x1E4F602E0], "preferenceEnabled:", 13, (void)v36, *((void *)&v36 + 1), v37, v38, v39, v40))
        {
          id v15 = [v14 absoluteString];
        }
        else
        {
          long long v23 = (void *)MEMORY[0x1E4F60E00];
          id v24 = [v14 absoluteString];
          id v15 = [v23 fullyRedactedStringForString:v24];
        }
        LODWORD(v36) = 138543362;
        *(void *)((char *)&v36 + 4) = v15;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Persisted indicator data for URL: %{public}@", (uint8_t *)&v36, 0xCu);
      }
    }
    else
    {
      [v12 removeBrandIndicatorForURL:*(void *)(a1 + 56)];
      *(void *)&long long v36 = MEMORY[0x1E4F143A8];
      *((void *)&v36 + 1) = 3221225472;
      uint64_t v37 = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_3;
      uint64_t v38 = &__block_descriptor_35_e19___NSDictionary_8__0l;
      LOWORD(v39) = 1;
      BYTE2(v39) = 1;
      AnalyticsSendEventLazy();
      _ef_log_EDBIMIManager();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = *(id *)(a1 + 56);
        if (objc_msgSend(MEMORY[0x1E4F602E0], "preferenceEnabled:", 13, (void)v36, *((void *)&v36 + 1), v37, v38, v39, v40))
        {
          v20 = [v19 absoluteString];
        }
        else
        {
          uint64_t v25 = (void *)MEMORY[0x1E4F60E00];
          uint64_t v26 = [v19 absoluteString];
          v20 = [v25 fullyRedactedStringForString:v26];
        }
        LODWORD(v36) = 138543362;
        *(void *)((char *)&v36 + 4) = v20;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Removed invalid indicator URL: %{public}@", (uint8_t *)&v36, 0xCu);
      }
    }

    BOOL v27 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
    os_unfair_lock_lock(v27);
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 64)];
    uint64_t v28 = [*(id *)(*(void *)(a1 + 32) + 8) count];
    os_unfair_lock_unlock(v27);
    if (!v28 && -[EDBIMIManager _shouldScheduleAnotherDownloadBatch](*(void **)(a1 + 32)))
    {
      id v29 = _ef_log_EDBIMIManager();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_1DB39C000, v29, OS_LOG_TYPE_DEFAULT, "Scheduling another download batch", (uint8_t *)&v36, 2u);
      }

      -[EDBIMIManager _downloadUndownloadedIndicators](*(id *)(a1 + 32));
    }
  }
  else
  {
    if (-[EDBIMIManager _isRecoverableError:](v10, v9))
    {
      *(void *)&long long v36 = MEMORY[0x1E4F143A8];
      *((void *)&v36 + 1) = 3221225472;
      uint64_t v37 = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_3;
      uint64_t v38 = &__block_descriptor_35_e19___NSDictionary_8__0l;
      LOWORD(v39) = 0;
      BYTE2(v39) = 1;
      AnalyticsSendEventLazy();
      _ef_log_EDBIMIManager();
      uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = *(id *)(a1 + 56);
        if (objc_msgSend(MEMORY[0x1E4F602E0], "preferenceEnabled:", 13, (void)v36, *((void *)&v36 + 1), v37, v38, v39, v40))
        {
          uint64_t v18 = [v17 absoluteString];
        }
        else
        {
          id v30 = (void *)MEMORY[0x1E4F60E00];
          long long v31 = [v17 absoluteString];
          uint64_t v18 = [v30 fullyRedactedStringForString:v31];
        }
        id v32 = v18;
        objc_msgSend(v9, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_107_cold_1();
      }
    }
    else
    {
      [*(id *)(a1 + 48) removeBrandIndicatorForURL:*(void *)(a1 + 56)];
      *(void *)&long long v36 = MEMORY[0x1E4F143A8];
      *((void *)&v36 + 1) = 3221225472;
      uint64_t v37 = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_3;
      uint64_t v38 = &__block_descriptor_35_e19___NSDictionary_8__0l;
      LOWORD(v39) = 0;
      BYTE2(v39) = 1;
      AnalyticsSendEventLazy();
      _ef_log_EDBIMIManager();
      uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v21 = *(id *)(a1 + 56);
        if (objc_msgSend(MEMORY[0x1E4F602E0], "preferenceEnabled:", 13, (void)v36, *((void *)&v36 + 1), v37, v38, v39, v40))
        {
          long long v22 = [v21 absoluteString];
        }
        else
        {
          long long v33 = (void *)MEMORY[0x1E4F60E00];
          long long v34 = [v21 absoluteString];
          long long v22 = [v33 fullyRedactedStringForString:v34];
        }
        id v35 = v22;
        objc_msgSend(v9, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_107_cold_2();
      }
    }
  }
}

id __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_3(unsigned __int8 *a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"downloadSucceeded";
  v2 = [NSNumber numberWithBool:a1[32]];
  v8[0] = v2;
  v7[1] = @"indicatorIsValid";
  id v3 = [NSNumber numberWithBool:a1[33]];
  v8[1] = v3;
  v7[2] = @"usedPrivacyProxy";
  uint64_t v4 = [NSNumber numberWithBool:a1[34]];
  v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (uint64_t)_indicatorIsValid:(void *)a3 forBIMIData:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!a1)
  {
LABEL_11:
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  id v8 = [v6 hashAlgorithm];
  int v9 = [v8 isEqualToString:@"sha256"];

  if (!v9)
  {
    id v17 = _ef_log_EDBIMIManager();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[EDBIMIManager _indicatorIsValid:forBIMIData:](v17);
    }

    goto LABEL_11;
  }
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v19 = v10;
  long long v20 = v10;
  id v11 = v5;
  CC_SHA256((const void *)objc_msgSend(v11, "bytes", v19, v20), objc_msgSend(v11, "length"), (unsigned __int8 *)&v19);
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v19 length:32];
  id v13 = [v12 base64EncodedStringWithOptions:0];
  id v14 = [v7 indicatorHash];
  uint64_t v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = _ef_log_EDBIMIManager();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[EDBIMIManager _indicatorIsValid:forBIMIData:](v16);
    }
  }
LABEL_12:

  return v15;
}

- (BOOL)_shouldScheduleAnotherDownloadBatch
{
  if (!a1) {
    return 0;
  }
  id v1 = [a1 messagePersistence];
  v2 = [v1 undownloadedBrandIndicatorsWithLimit:1];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (uint64_t)_isRecoverableError:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = [v3 domain];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F289A0]];

    if (v6)
    {
      unint64_t v7 = __ROR8__([v4 code] + 1009, 1);
      unsigned int v8 = (0x35u >> v7) & 1;
      if (v7 >= 6) {
        a1 = 0;
      }
      else {
        a1 = v8;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EMRemoteContentURLSession)urlSession
{
  return self->_urlSession;
}

- (EFScheduler)downloadScheduler
{
  return self->_downloadScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadScheduler, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_activeDataTasksByRequest, 0);
}

void __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_107_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.8382e-34);
  _os_log_error_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_ERROR, "Temporarily unable to request indicator data for URL: %{public}@ due to error: %{public}@", v5, 0x16u);
}

void __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_107_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.8382e-34);
  _os_log_error_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_ERROR, "Permanently unable to request indicator data for URL: %{public}@ due to error: %{public}@", v5, 0x16u);
}

- (void)_indicatorIsValid:(os_log_t)log forBIMIData:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "BIMI indicator does not have expected hash", v1, 2u);
}

- (void)_indicatorIsValid:(os_log_t)log forBIMIData:.cold.2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "BIMI indicator hash is using unsupported algorithm", v1, 2u);
}

@end