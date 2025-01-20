@interface ENTestResultSession
+ (id)sessionWithVerificationCode:(id)a3 configuration:(id)a4 maxRetryTime:(unint64_t)a5 nonce:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9;
- (BOOL)_checkInvalidatedAndReturnError:(id *)a3;
- (BOOL)_performVerificationRequestWithError:(id *)a3;
- (ENRegion)region;
- (NSArray)acceptedReportTypes;
- (NSString)agencyAPIKey;
- (NSString)healthAuthorityID;
- (NSString)nonce;
- (NSString)verificationCode;
- (NSURL)certificateURL;
- (NSURL)uploadURL;
- (NSURL)verificationURL;
- (NSUUID)UUID;
- (id)_initWithAgencyAPIKey:(id)a3 certificateURL:(id)a4 acceptedReportTypes:(id)a5 healthAuthorityID:(id)a6 maxRetryTime:(unint64_t)a7 nonce:(id)a8 queue:(id)a9 region:(id)a10 uploadURL:(id)a11 URLSession:(id)a12 verificationCode:(id)a13 verifyURL:(id)a14;
- (id)getMetadataAndReturnError:(id *)a3;
- (id)getUploadingTemporaryExposureKeys;
- (unint64_t)maxRetryTime;
- (void)_flushVerificationCompletionsWithError:(id)a3;
- (void)_performCertificateRequestWithToken:(id)a3 temporaryExposureKeys:(id)a4 completionHandler:(id)a5;
- (void)_performUploadRequestWithTemporaryExposureKeys:(id)a3 revisionToken:(id)a4 certificate:(id)a5 HMACKey:(id)a6 userMetadata:(id)a7 completionHandler:(id)a8;
- (void)dealloc;
- (void)invalidate;
- (void)setMaxRetryTime:(unint64_t)a3;
- (void)uploadTemporaryExposureKeys:(id)a3 revisionToken:(id)a4 userMetadata:(id)a5 completionHandler:(id)a6;
- (void)verifyCodeWithCompletionHandler:(id)a3;
@end

@implementation ENTestResultSession

- (id)_initWithAgencyAPIKey:(id)a3 certificateURL:(id)a4 acceptedReportTypes:(id)a5 healthAuthorityID:(id)a6 maxRetryTime:(unint64_t)a7 nonce:(id)a8 queue:(id)a9 region:(id)a10 uploadURL:(id)a11 URLSession:(id)a12 verificationCode:(id)a13 verifyURL:(id)a14
{
  id v55 = a3;
  id v18 = a4;
  id obj = a5;
  id v54 = a5;
  id v19 = a6;
  id v20 = a8;
  id v53 = a9;
  v21 = v18;
  id v22 = a10;
  id v23 = a11;
  id v52 = a12;
  v24 = v22;
  id v25 = a13;
  id v26 = a14;
  v56.receiver = self;
  v56.super_class = (Class)ENTestResultSession;
  v27 = [(ENTestResultSession *)&v56 init];
  if (v27)
  {
    uint64_t v28 = [v55 copy];
    agencyAPIKey = v27->_agencyAPIKey;
    v27->_agencyAPIKey = (NSString *)v28;

    uint64_t v30 = [v21 copy];
    certificateURL = v27->_certificateURL;
    v27->_certificateURL = (NSURL *)v30;

    objc_storeStrong((id *)&v27->_acceptedReportTypes, obj);
    uint64_t v32 = [v19 copy];
    healthAuthorityID = v27->_healthAuthorityID;
    v27->_healthAuthorityID = (NSString *)v32;

    v27->_maxRetryTime = a7;
    if (v20)
    {
      uint64_t v34 = [v20 copy];
      nonce = v27->_nonce;
      v27->_nonce = (NSString *)v34;
    }
    else
    {
      nonce = v27->_nonce;
      v27->_nonce = 0;
    }

    v36 = objc_alloc_init(ENTestResultPersistentSession);
    persistentSession = v27->_persistentSession;
    v27->_persistentSession = v36;

    objc_storeStrong((id *)&v27->_queue, a9);
    uint64_t v38 = [v24 copy];
    region = v27->_region;
    v27->_region = (ENRegion *)v38;

    v27->_state = 0;
    objc_storeStrong((id *)&v27->_URLSession, a12);
    uint64_t v40 = [v23 copy];
    uploadURL = v27->_uploadURL;
    v27->_uploadURL = (NSURL *)v40;

    uint64_t v42 = [MEMORY[0x1E4F29120] UUID];
    UUID = v27->_UUID;
    v27->_UUID = (NSUUID *)v42;

    uint64_t v44 = [v25 copy];
    verificationCode = v27->_verificationCode;
    v27->_verificationCode = (NSString *)v44;

    uint64_t v46 = [v26 copy];
    verificationURL = v27->_verificationURL;
    v27->_verificationURL = (NSURL *)v46;
  }
  return v27;
}

- (void)dealloc
{
  [(ENTestResultSession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ENTestResultSession;
  [(ENTestResultSession *)&v3 dealloc];
}

+ (id)sessionWithVerificationCode:(id)a3 configuration:(id)a4 maxRetryTime:(unint64_t)a5 nonce:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9
{
  id v31 = a3;
  id v15 = a4;
  id v28 = a6;
  id v30 = a7;
  id v29 = a8;
  v16 = [v15 testVerificationAPIKey];
  if (v16)
  {
    v17 = [v15 testVerificationCertificateURL];
    if (v17)
    {
      id v18 = [v15 healthAuthorityID];
      if (v18)
      {
        id v19 = [v15 testVerificationURL];
        if (v19)
        {
          id v20 = [v15 tekUploadURL];
          if (v20)
          {
            v21 = [v15 acceptedReportTypes];
            id v22 = objc_alloc((Class)a1);
            id v23 = [v15 region];
            v24 = v22;
            id v25 = v28;
            id v26 = (void *)[v24 _initWithAgencyAPIKey:v16 certificateURL:v17 acceptedReportTypes:v21 healthAuthorityID:v18 maxRetryTime:a5 nonce:v28 queue:v29 region:v23 uploadURL:v20 URLSession:v30 verificationCode:v31 verifyURL:v19];
          }
          else
          {
            if (a9)
            {
              ENTestResultErrorF(10);
              id v26 = 0;
              *a9 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v26 = 0;
            }
            id v25 = v28;
          }
        }
        else
        {
          if (a9)
          {
            ENTestResultErrorF(10);
            id v26 = 0;
            *a9 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v26 = 0;
          }
          id v25 = v28;
        }
      }
      else
      {
        id v25 = v28;
        if (a9)
        {
          ENTestResultErrorF(10);
          id v26 = 0;
          *a9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v26 = 0;
        }
      }
    }
    else
    {
      if (a9)
      {
        ENTestResultErrorF(10);
        id v26 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v26 = 0;
      }
      id v25 = v28;
    }
  }
  else
  {
    if (a9)
    {
      ENTestResultErrorF(10);
      id v26 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v26 = 0;
    }
    id v25 = v28;
  }

  return v26;
}

- (void)invalidate
{
  if (self->_state <= 5)
  {
    self->_state = 6;
    [(ENTestResultPersistentSession *)self->_persistentSession setFetchedMetadata:0];
    [(ENTestResultNetworkRequest *)self->_networkRequest invalidate];
    networkRequest = self->_networkRequest;
    self->_networkRequest = 0;

    ENTestResultErrorF(5);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ENTestResultSession *)self _flushVerificationCompletionsWithError:v4];
  }
}

- (void)verifyCodeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__ENTestResultSession_verifyCodeWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E69AEA60;
  v21[4] = self;
  id v22 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x1D9439FF0](v21);
  id v20 = 0;
  BOOL v6 = [(ENTestResultSession *)self _checkInvalidatedAndReturnError:&v20];
  id v7 = v20;
  v8 = v7;
  if (v6)
  {
    int64_t state = self->_state;
    if (state <= 0)
    {
      id v19 = v7;
      BOOL v12 = [(ENTestResultSession *)self _performVerificationRequestWithError:&v19];
      id v13 = v19;

      if (!v12)
      {
        ((void (**)(void, void, id))v5)[2](v5, 0, v13);
        v8 = v13;
        goto LABEL_16;
      }
      v8 = v13;
    }
    else
    {
      if (state != 1)
      {
        v17 = [(ENTestResultPersistentSession *)self->_persistentSession verificationError];
        ((void (**)(void, BOOL, void *))v5)[2](v5, v17 == 0, v17);
LABEL_15:

        goto LABEL_16;
      }
      v10 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v11 = [v10 isSensitiveLoggingAllowed];

      if (v11
        && gLogCategory_ENTestResultSession <= 50
        && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
      {
        id v18 = [(NSUUID *)self->_UUID UUIDString];
        LogPrintF_safe();
      }
    }
    verificationCompletions = self->_verificationCompletions;
    if (!verificationCompletions)
    {
      id v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA40]);
      v16 = self->_verificationCompletions;
      self->_verificationCompletions = v15;

      verificationCompletions = self->_verificationCompletions;
    }
    v17 = (void *)MEMORY[0x1D9439FF0](v5);
    [(NSMutableArray *)verificationCompletions addObject:v17];
    goto LABEL_15;
  }
  ((void (**)(void, void, id))v5)[2](v5, 0, v7);
LABEL_16:
}

void __55__ENTestResultSession_verifyCodeWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  v5 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v6 = [v5 isSensitiveLoggingAllowed];

  if (a2)
  {
    if (v6
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
LABEL_9:
      id v7 = [*(id *)(*(void *)(a1 + 32) + 72) UUIDString];
      LogPrintF_safe();
    }
  }
  else if (v6 {
         && gLogCategory_ENTestResultSession <= 90
  }
         && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_9;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2);
}

- (id)getMetadataAndReturnError:(id *)a3
{
  if (!-[ENTestResultSession _checkInvalidatedAndReturnError:](self, "_checkInvalidatedAndReturnError:"))
  {
LABEL_11:
    int v6 = 0;
    goto LABEL_6;
  }
  if (self->_state <= 1)
  {
    if (a3)
    {
      ENErrorF();
      int v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  v5 = [(ENTestResultPersistentSession *)self->_persistentSession fetchedMetadata];
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else if (a3)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:

  return v6;
}

- (id)getUploadingTemporaryExposureKeys
{
  return [(ENTestResultPersistentSession *)self->_persistentSession teks];
}

- (void)uploadTemporaryExposureKeys:(id)a3 revisionToken:(id)a4 userMetadata:(id)a5 completionHandler:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __96__ENTestResultSession_uploadTemporaryExposureKeys_revisionToken_userMetadata_completionHandler___block_invoke;
  v48[3] = &unk_1E69AEA88;
  v48[4] = self;
  id v49 = v13;
  v36 = (void (**)(void, void, void, void))MEMORY[0x1D9439FF0](v48);
  v14 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v15 = [v14 isSensitiveLoggingAllowed];

  if (v15
    && gLogCategory_ENTestResultSession <= 50
    && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
  {
    [(NSUUID *)self->_UUID UUIDString];
    uint64_t v33 = (uint64_t)v12;
    v31 = id v34 = v11;
    uint64_t v32 = [v10 count];
    LogPrintF_safe();
  }
  v35 = self;
  v37 = v12;
  uint64_t v38 = v11;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v45 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v22 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v23 = [v22 isRPILoggingAllowed];

        if (v23
          && gLogCategory_ENTestResultSession <= 30
          && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
        {
          v24 = [v21 keyData];
          uint64_t v32 = [v21 rollingStartNumber];
          uint64_t v33 = [v21 rollingPeriod];
          id v31 = v24;
          LogPrintF_safe();
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v18);
  }

  id v25 = [(ENTestResultPersistentSession *)v35->_persistentSession verificationToken];
  if (v25)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __96__ENTestResultSession_uploadTemporaryExposureKeys_revisionToken_userMetadata_completionHandler___block_invoke_2;
    v39[3] = &unk_1E69AEAB0;
    v39[4] = v35;
    id v40 = v16;
    id v26 = v38;
    id v41 = v38;
    v27 = v37;
    id v42 = v37;
    id v28 = v36;
    v43 = v36;
    [(ENTestResultSession *)v35 _performCertificateRequestWithToken:v25 temporaryExposureKeys:v40 completionHandler:v39];
  }
  else
  {
    id v28 = v36;
    id v29 = [(ENTestResultPersistentSession *)v35->_persistentSession verificationError];
    id v26 = v38;
    if (v29)
    {
      ((void (**)(void, void, void, void *))v36)[2](v36, 0, 0, v29);
    }
    else
    {
      id v30 = ENTestResultErrorF(1);
      ((void (**)(void, void, void, void *))v36)[2](v36, 0, 0, v30);
    }
    v27 = v37;
  }
}

void __96__ENTestResultSession_uploadTemporaryExposureKeys_revisionToken_userMetadata_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a3;
  id v7 = a4;
  id v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v9 = [v8 isSensitiveLoggingAllowed];

  if (a2)
  {
    if (v9
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
LABEL_9:
      id v10 = [*(id *)(*(void *)(a1 + 32) + 72) UUIDString];
      LogPrintF_safe();
    }
  }
  else if (v9 {
         && gLogCategory_ENTestResultSession <= 90
  }
         && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_9;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2);
}

uint64_t __96__ENTestResultSession_uploadTemporaryExposureKeys_revisionToken_userMetadata_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && a3) {
    return [*(id *)(a1 + 32) _performUploadRequestWithTemporaryExposureKeys:*(void *)(a1 + 40) revisionToken:*(void *)(a1 + 48) certificate:a2 HMACKey:a3 userMetadata:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (BOOL)_performVerificationRequestWithError:(id *)a3
{
  id v4 = +[ENTestResultVerificationRequest verificationRequestWithCode:self->_verificationCode acceptedReportTypes:self->_acceptedReportTypes APIKey:self->_agencyAPIKey nonce:self->_nonce requestURL:self->_verificationURL URLSession:self->_URLSession queue:self->_queue error:a3];
  networkRequest = self->_networkRequest;
  self->_networkRequest = v4;

  int v6 = self->_networkRequest;
  if (v6)
  {
    [(ENTestResultNetworkRequest *)self->_networkRequest setMaxRetryTime:self->_maxRetryTime];
    id v7 = self->_networkRequest;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__ENTestResultSession__performVerificationRequestWithError___block_invoke;
    v9[3] = &unk_1E69AEAD8;
    v9[4] = self;
    [(ENTestResultNetworkRequest *)v7 resumeWithCompletionHandler:v9];
    self->_int64_t state = 1;
  }
  return v6 != 0;
}

void __60__ENTestResultSession__performVerificationRequestWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  if (!v5)
  {
    id v8 = [v23 metadata];
    uint64_t v9 = a1 + 32;
    [*(id *)(*(void *)(a1 + 32) + 32) setFetchedMetadata:v8];

    id v10 = [v23 token];
    [*(id *)(*(void *)(a1 + 32) + 32) setVerificationToken:v10];

    id v11 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v12 = [v11 isSensitiveLoggingAllowed];

    if (v12
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      id v13 = [*(id *)(*(void *)v9 + 72) UUIDString];
      v14 = [v23 token];
      [v23 metadata];
      id v22 = v21 = v14;
      id v20 = v13;
      LogPrintF_safe();
    }
    uint64_t v19 = 2;
    goto LABEL_19;
  }
  int v6 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v7 = [v6 isSensitiveLoggingAllowed];

  if (v7
    && gLogCategory_ENTestResultSession <= 90
    && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
  {
    id v20 = [*(id *)(*(void *)(a1 + 32) + 72) UUIDString];
    id v21 = v5;
    LogPrintF_safe();
  }
  int v15 = objc_msgSend(v5, "domain", v20, v21);
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F25718]];

  if (v16)
  {
    unint64_t v17 = [v5 code];
    if (v17 <= 0xB && ((1 << v17) & 0x9D6) != 0) {
      *(void *)(*(void *)(a1 + 32) + 16) = 0;
    }
  }
  uint64_t v9 = a1 + 32;
  uint64_t v18 = *(void *)(a1 + 32);
  if (*(void *)(v18 + 16))
  {
    [*(id *)(v18 + 32) setVerificationError:v5];
    uint64_t v19 = 5;
LABEL_19:
    *(void *)(*(void *)v9 + 16) = v19;
  }
  objc_msgSend(*(id *)(a1 + 32), "_flushVerificationCompletionsWithError:", v5, v20, v21, v22);
}

- (void)_flushVerificationCompletionsWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_verificationCompletions count])
  {
    id v5 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v6 = [v5 isSensitiveLoggingAllowed];

    if (v6
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      id v13 = [(NSUUID *)self->_UUID UUIDString];
      [(NSMutableArray *)self->_verificationCompletions count];
      LogPrintF_safe();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v7 = self->_verificationCompletions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void, BOOL, id))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * i), v4 == 0, v4);
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  verificationCompletions = self->_verificationCompletions;
  self->_verificationCompletions = 0;
}

- (void)_performCertificateRequestWithToken:(id)a3 temporaryExposureKeys:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ENTestResultPersistentSession *)self->_persistentSession certificate];
  int v12 = [(ENTestResultPersistentSession *)self->_persistentSession HMACKey];
  uint64_t v13 = [(ENTestResultPersistentSession *)self->_persistentSession teks];
  long long v14 = (void *)v13;
  if (v11) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15 || v13 == 0)
  {
    agencyAPIKey = self->_agencyAPIKey;
    certificateURL = self->_certificateURL;
    URLSession = self->_URLSession;
    queue = self->_queue;
    id v29 = 0;
    id v21 = +[ENTestResultCertificateRequest certificateRequestWithToken:v8 temporaryExposureKeys:v9 APIKey:agencyAPIKey requestURL:certificateURL URLSession:URLSession queue:queue error:&v29];
    id v22 = v29;
    networkRequest = self->_networkRequest;
    self->_networkRequest = v21;

    v24 = self->_networkRequest;
    if (v24)
    {
      [(ENTestResultNetworkRequest *)v24 setMaxRetryTime:self->_maxRetryTime];
      id v25 = self->_networkRequest;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __99__ENTestResultSession__performCertificateRequestWithToken_temporaryExposureKeys_completionHandler___block_invoke;
      v26[3] = &unk_1E69AEB00;
      v26[4] = self;
      id v27 = v9;
      id v28 = v10;
      [(ENTestResultNetworkRequest *)v25 resumeWithCompletionHandler:v26];
      self->_int64_t state = 3;
    }
    else
    {
      (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v22);
    }
  }
  else
  {
    (*((void (**)(id, void *, void *, void))v10 + 2))(v10, v11, v12, 0);
  }
}

void __99__ENTestResultSession__performCertificateRequestWithToken_temporaryExposureKeys_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v15 = [v6 certificate];
  int v7 = [v6 symmetricKey];

  id v8 = v15;
  if (!v5 && v15 && v7)
  {
    [*(id *)(a1[4] + 32) setCertificate:v15];
    [*(id *)(a1[4] + 32) setHMACKey:v7];
    [*(id *)(a1[4] + 32) setTeks:a1[5]];
    id v9 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v10 = [v9 isSensitiveLoggingAllowed];

    if (v10
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = [*(id *)(a1[4] + 72) UUIDString];
      LogPrintF_safe();
    }
    (*(void (**)(void))(a1[6] + 16))(a1[6]);
  }
  else
  {
    if (!v5)
    {
      ENTestResultErrorF(1);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    *(void *)(a1[4] + 16) = 2;
    id v11 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v12 = [v11 isSensitiveLoggingAllowed];

    if (v12
      && gLogCategory_ENTestResultSession <= 90
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      long long v14 = [*(id *)(a1[4] + 72) UUIDString];
      LogPrintF_safe();
    }
    (*(void (**)(void, void))(a1[6] + 16))(a1[6], 0);
  }
}

- (void)_performUploadRequestWithTemporaryExposureKeys:(id)a3 revisionToken:(id)a4 certificate:(id)a5 HMACKey:(id)a6 userMetadata:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = (void (**)(id, uint64_t, void *, void))a8;
  id v20 = [(ENTestResultPersistentSession *)self->_persistentSession revisionToken];
  if (v20)
  {
    v19[2](v19, 1, v20, 0);
  }
  else
  {
    healthAuthorityID = self->_healthAuthorityID;
    uploadURL = self->_uploadURL;
    URLSession = self->_URLSession;
    queue = self->_queue;
    id v32 = 0;
    id v25 = +[ENTestResultUploadRequest uploadRequestWithCertificate:v16 healthAuthorityID:healthAuthorityID revisionToken:v15 symmetricKey:v17 temporaryExposureKeys:v14 userMetadata:v18 requestURL:uploadURL URLSession:URLSession queue:queue error:&v32];
    id v26 = v32;
    networkRequest = self->_networkRequest;
    self->_networkRequest = v25;

    id v28 = self->_networkRequest;
    if (v28)
    {
      [(ENTestResultNetworkRequest *)v28 setMaxRetryTime:self->_maxRetryTime];
      id v29 = self->_networkRequest;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __135__ENTestResultSession__performUploadRequestWithTemporaryExposureKeys_revisionToken_certificate_HMACKey_userMetadata_completionHandler___block_invoke;
      v30[3] = &unk_1E69AEB28;
      v30[4] = self;
      id v31 = v19;
      [(ENTestResultNetworkRequest *)v29 resumeWithCompletionHandler:v30];
      self->_int64_t state = 4;
    }
    else
    {
      ((void (**)(id, uint64_t, void *, id))v19)[2](v19, 0, 0, v26);
    }
  }
}

void __135__ENTestResultSession__performUploadRequestWithTemporaryExposureKeys_revisionToken_certificate_HMACKey_userMetadata_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = [a2 responseRevisionToken];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v13 || !v5)
  {
    *(void *)(v6 + 16) = 2;
    id v9 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v10 = [v9 isSensitiveLoggingAllowed];

    if (v10
      && gLogCategory_ENTestResultSession <= 90
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      int v12 = [*(id *)(*(void *)(a1 + 32) + 72) UUIDString];
      LogPrintF_safe();
    }
    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
  }
  else
  {
    [*(id *)(v6 + 32) setRevisionToken:v5];
    *(void *)(*(void *)(a1 + 32) + 16) = 5;
    int v7 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v8 = [v7 isSensitiveLoggingAllowed];

    if (v8
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      id v11 = [*(id *)(*(void *)(a1 + 32) + 72) UUIDString];
      LogPrintF_safe();
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1);
  }
}

- (BOOL)_checkInvalidatedAndReturnError:(id *)a3
{
  int64_t state = self->_state;
  if (state >= 6 && a3 != 0)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return state < 6;
}

- (ENRegion)region
{
  return self->_region;
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)agencyAPIKey
{
  return self->_agencyAPIKey;
}

- (NSURL)certificateURL
{
  return self->_certificateURL;
}

- (NSString)healthAuthorityID
{
  return self->_healthAuthorityID;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSURL)verificationURL
{
  return self->_verificationURL;
}

- (NSURL)uploadURL
{
  return self->_uploadURL;
}

- (NSArray)acceptedReportTypes
{
  return self->_acceptedReportTypes;
}

- (unint64_t)maxRetryTime
{
  return self->_maxRetryTime;
}

- (void)setMaxRetryTime:(unint64_t)a3
{
  self->_maxRetryTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedReportTypes, 0);
  objc_storeStrong((id *)&self->_uploadURL, 0);
  objc_storeStrong((id *)&self->_verificationURL, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_healthAuthorityID, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_agencyAPIKey, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_verificationCompletions, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_persistentSession, 0);
  objc_storeStrong((id *)&self->_networkRequest, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end