@interface ENTestResultManager
+ (BOOL)checkValidNonce:(id)a3 size:(unint64_t)a4;
+ (id)generateSecureNonce:(unint64_t)a3;
- (BOOL)_getRevisionToken:(id *)a3 forSession:(id)a4 error:(id *)a5;
- (BOOL)_setRevisionToken:(id)a3 forSession:(id)a4 error:(id *)a5;
- (ENConfigurationStore)configurationStore;
- (ENExposureDatabase)exposureDatabase;
- (ENTemporaryExposureKeyManager)temporaryExposureKeyManager;
- (ENTestResultManager)initWithConfigurationStore:(id)a3 exposureDatabase:(id)a4 temporaryExposureKeyManager:(id)a5 queue:(id)a6;
- (ENTestResultManagerDelegate)delegate;
- (id)_configurationForRegion:(id)a3 error:(id *)a4;
- (id)_createSessionWithVerificationCode:(id)a3 proxyEnabled:(BOOL)a4 region:(id)a5 maxRetryTime:(unint64_t)a6 error:(id *)a7;
- (id)_createURLSessionWithSecondaryIdentifier:(BOOL)a3;
- (id)_existingSessionForVerificationCode:(id)a3 region:(id)a4;
- (id)_getTemporaryExposureKeysForUpload:(BOOL)a3 requireConsentForRegion:(id)a4 error:(id *)a5;
- (id)_metadataForSessionWithUUID:(id)a3 error:(id *)a4;
- (id)_revisionTokenKeyForSession:(id)a3;
- (id)_serverConfigurationForRegion:(id)a3 error:(id *)a4;
- (id)_sessionWithUUID:(id)a3 error:(id *)a4;
- (id)metadataForSessionWithUUID:(id)a3 error:(id *)a4;
- (void)_activateAutomatedChaffingWithRegion:(id)a3;
- (void)_deactivateAutomatedChaffing;
- (void)_finishSessionWithUUID:(id)a3 userDidConsent:(BOOL)a4 metadata:(id)a5 completionHandler:(id)a6;
- (void)_invalidate;
- (void)_invalidateSession:(id)a3;
- (void)_startChaffTestVerficationSessionForRegion:(id)a3 completionHandler:(id)a4;
- (void)_startSelfReportWebSession:(id)a3 completionHandler:(id)a4;
- (void)_startTestVerficationSessionWithCode:(id)a3 proxyEnabled:(BOOL)a4 region:(id)a5 completionHandler:(id)a6;
- (void)_updateChaffingTimerBlock;
- (void)activateAutomatedChaffingWithRegion:(id)a3;
- (void)activateWebSession:(id)a3 verificationTimestamp:(double)a4 nonceTimestamp:(double)a5;
- (void)deactivateAutomatedChaffing;
- (void)deactivateWebSession;
- (void)finishSessionWithUUID:(id)a3 userDidConsent:(BOOL)a4 metadata:(id)a5 completionHandler:(id)a6;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setMaxRetryTime:(unint64_t)a3;
- (void)startChaffTestVerficationSessionForRegion:(id)a3 completionHandler:(id)a4;
- (void)startSelfReportWebSession:(id)a3 completionHandler:(id)a4;
- (void)startTestVerficationSessionWithCode:(id)a3 proxyEnabled:(BOOL)a4 region:(id)a5 completionHandler:(id)a6;
@end

@implementation ENTestResultManager

+ (BOOL)checkValidNonce:(id)a3 size:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  v5 = (objc_class *)MEMORY[0x1E4F1C9B0];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithBase64EncodedString:v6 options:0];

  if (v7) {
    BOOL v8 = [v7 length] == a4;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)generateSecureNonce:(unint64_t)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA50], "dataWithLength:");
  v5 = (const __SecRandom *)*MEMORY[0x1E4F3BC58];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, a3, (void *)[v6 mutableBytes]))
  {
    v7 = 0;
  }
  else
  {
    v7 = [v6 base64EncodedStringWithOptions:0];
  }

  return v7;
}

- (ENTestResultManager)initWithConfigurationStore:(id)a3 exposureDatabase:(id)a4 temporaryExposureKeyManager:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ENTestResultManager;
  v15 = [(ENTestResultManager *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configurationStore, a3);
    objc_storeStrong((id *)&v16->_exposureDatabase, a4);
    objc_storeStrong((id *)&v16->_temporaryExposureKeyManager, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
    uint64_t v17 = [(ENTestResultManager *)v16 _createURLSessionWithSecondaryIdentifier:1];
    URLSession = v16->_URLSession;
    v16->_URLSession = (NSURLSession *)v17;

    uint64_t v19 = [(ENTestResultManager *)v16 _createURLSessionWithSecondaryIdentifier:0];
    URLBackupSession = v16->_URLBackupSession;
    v16->_URLBackupSession = (NSURLSession *)v19;

    v16->_maxRetryTime = 900;
  }

  return v16;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__ENTestResultManager_invalidate__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __33__ENTestResultManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(ENChaffTestResultSession *)self->_chaffSession invalidate];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSMutableDictionary *)self->_sessionsByUUID allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_sessionsByUUID removeAllObjects];
  chaffingRegion = self->_chaffingRegion;
  self->_chaffingRegion = 0;

  [(ENXPCTimer *)self->_chaffingTimer invalidate];
  chaffingTimer = self->_chaffingTimer;
  self->_chaffingTimer = 0;
}

- (id)_createURLSessionWithSecondaryIdentifier:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F18DC8] defaultSessionConfiguration];
  uint64_t v5 = ENBundleIdentifierForURLSessions();
  objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", v5);

  if (v3) {
    objc_msgSend(v4, "set_sourceApplicationSecondaryIdentifier:", *MEMORY[0x1E4F25710]);
  }
  uint64_t v6 = [MEMORY[0x1E4F18DB8] sessionWithConfiguration:v4];

  return v6;
}

- (void)activateAutomatedChaffingWithRegion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ENTestResultManager_activateAutomatedChaffingWithRegion___block_invoke;
  v7[3] = &unk_1E69ACBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __59__ENTestResultManager_activateAutomatedChaffingWithRegion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateAutomatedChaffingWithRegion:*(void *)(a1 + 40)];
}

- (void)_activateAutomatedChaffingWithRegion:(id)a3
{
  id v5 = a3;
  if (self->_chaffingTimer && ([(ENRegion *)self->_chaffingRegion isEqual:v5] & 1) == 0)
  {
    id v6 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v7 = [v6 isSensitiveLoggingAllowed];

    if (v7
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    [(ENTestResultManager *)self _deactivateAutomatedChaffing];
  }
  id v8 = [MEMORY[0x1E4F1C9C0] date];
  CFPrefs_GetDouble();
  if (v9 != 0.0)
  {
    long long v10 = objc_msgSend(MEMORY[0x1E4F1C9C0], "dateWithTimeIntervalSince1970:");
    long long v11 = [MEMORY[0x1E4F1C9A0] currentCalendar];
    char v12 = [v11 isDate:v10 inSameDayAsDate:v8];

    if ((v12 & 1) == 0)
    {
      CFPrefs_RemoveValue();
      CFPrefs_RemoveValue();
    }
  }
  id v70 = 0;
  long long v13 = [(ENTestResultManager *)self _serverConfigurationForRegion:v5 error:&v70];
  id v14 = v70;
  if (!v13)
  {
    [(ENTestResultManager *)self _deactivateAutomatedChaffing];
    v55 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v56 = [v55 isSensitiveLoggingAllowed];

    if (!v56
      || gLogCategory_ENTestResultManager > 40
      || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_74;
    }
LABEL_95:
    LogPrintF_safe();
    goto LABEL_74;
  }
  if (![v13 isChaffingEnabled]
    || ([v13 chaffingSelectionPercentage], v15 <= 0.0)
    && ([v13 chaffingSelectionPercentageAlternative], v16 <= 0.0))
  {
    [(ENTestResultManager *)self _deactivateAutomatedChaffing];
    v53 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v54 = [v53 isSensitiveLoggingAllowed];

    if (!v54
      || gLogCategory_ENTestResultManager > 40
      || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_74;
    }
    goto LABEL_95;
  }
  CFPrefs_GetInt64();
  CFPrefs_GetInt64();
  if (self->_chaffingTimer)
  {
    v57 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v58 = [v57 isSensitiveLoggingAllowed];

    if (!v58
      || gLogCategory_ENTestResultManager > 10
      || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_74;
    }
    [v13 maximumChaffsAllowedPerDay];
    goto LABEL_95;
  }
  uint64_t v17 = [(ENTestResultManager *)self delegate];
  if ([v17 isProxyEnabledForTestResultManager:self]) {
    [v13 chaffingSelectionPercentageAlternative];
  }
  else {
    [v13 chaffingSelectionPercentage];
  }
  double v19 = v18;

  CFPrefs_GetDouble();
  if (v20 == 0.0 || (double v21 = v20, !IsAppleInternalBuild())) {
    double v21 = v19;
  }
  objc_super v22 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v23 = [v22 isSensitiveLoggingAllowed];

  if (v23
    && gLogCategory_ENTestResultManager <= 40
    && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
  {
    double v63 = v21;
    LogPrintF_safe();
  }
  if (v21 <= 0.0)
  {
    [(ENTestResultManager *)self _deactivateAutomatedChaffing];
    goto LABEL_74;
  }
  id v68 = v14;
  uint64_t Int64 = CFPrefs_GetInt64();
  double v25 = (double)arc4random() * 2.32830644e-10 * 100.0;
  BOOL v27 = v25 < v21 || Int64 != 0;
  v28 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v29 = [v28 isSensitiveLoggingAllowed];

  if (v29
    && gLogCategory_ENTestResultManager <= 40
    && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
  {
    v30 = "no";
    if (v27) {
      v31 = "yes";
    }
    else {
      v31 = "no";
    }
    if (Int64) {
      v30 = "yes";
    }
    double v64 = v25;
    v65 = v31;
    v67 = v30;
    LogPrintF_safe();
  }
  if (!Int64)
  {
    CFPrefs_GetDouble();
    double v33 = v32;
    if (v32 == 0.0)
    {
      [v8 timeIntervalSince1970];
      CFPrefs_SetDouble();
    }
    else
    {
      v34 = [MEMORY[0x1E4F1C9C0] dateWithTimeIntervalSince1970:v32];
      v35 = [MEMORY[0x1E4F1C9A0] currentCalendar];
      char v36 = [v35 isDate:v34 inSameDayAsDate:v8];

      if ((v36 & 1) == 0)
      {
        v37 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v38 = [v37 isSensitiveLoggingAllowed];

        if (v38
          && gLogCategory_ENTestResultManager <= 40
          && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        objc_msgSend(v8, "timeIntervalSince1970", *(void *)&v64, v65, v67);
        CFPrefs_SetDouble();
        double v33 = 0.0;
      }
    }
    if (v33 != 0.0)
    {
      v61 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v62 = [v61 isSensitiveLoggingAllowed];

      id v14 = v68;
      if (!v62
        || gLogCategory_ENTestResultManager > 10
        || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_74;
      }
      goto LABEL_95;
    }
  }
  if (!v27)
  {
    v59 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v60 = [v59 isSensitiveLoggingAllowed];

    id v14 = v68;
    if (!v60
      || gLogCategory_ENTestResultManager > 40
      || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_74;
    }
    goto LABEL_95;
  }
  uint64_t v39 = 0x15180 / [v13 maximumChaffsAllowedPerDay];
  uint32_t v40 = arc4random_uniform(0x1C20u);
  if (Int64) {
    uint32_t v41 = arc4random_uniform(0x2A30u) + 3600;
  }
  else {
    uint32_t v41 = v40 + 60;
  }
  double v42 = (double)v41;
  CFPrefs_GetDouble();
  if (v43 <= 0.0)
  {
    double v44 = 900.0;
  }
  else
  {
    double v42 = v43;
    double v44 = 10.0;
  }
  uint64_t v45 = CFPrefs_GetInt64();
  if (v45) {
    uint64_t v46 = v45;
  }
  else {
    uint64_t v46 = v39;
  }
  v47 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v48 = [v47 isSensitiveLoggingAllowed];

  if (v48
    && gLogCategory_ENTestResultManager <= 50
    && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
  {
    v49 = [MEMORY[0x1E4F28EC8] numberWithDouble:v42];
    v66 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInteger:v46];
    LogPrintF_safe();
  }
  v50 = [ENXPCTimer alloc];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __60__ENTestResultManager__activateAutomatedChaffingWithRegion___block_invoke;
  v69[3] = &unk_1E69AD040;
  v69[4] = self;
  v51 = [(ENXPCTimer *)v50 initWithName:@"com.apple.exposureNotification.chaffing" delay:v46 gracePeriod:0 cadence:9153 priority:v69 options:v42 block:v44];
  chaffingTimer = self->_chaffingTimer;
  self->_chaffingTimer = v51;

  objc_storeStrong((id *)&self->_chaffingRegion, a3);
  id v14 = v68;
LABEL_74:
}

void __60__ENTestResultManager__activateAutomatedChaffingWithRegion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ENTestResultManager__activateAutomatedChaffingWithRegion___block_invoke_2;
  block[3] = &unk_1E69ACA50;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __60__ENTestResultManager__activateAutomatedChaffingWithRegion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateChaffingTimerBlock];
}

- (void)activateWebSession:(id)a3 verificationTimestamp:(double)a4 nonceTimestamp:(double)a5
{
  id v5 = a3;
  CFPrefs_SetDouble();
  CFPrefs_SetDouble();
  CFPrefs_SetValue();
}

- (void)deactivateAutomatedChaffing
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ENTestResultManager_deactivateAutomatedChaffing__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__ENTestResultManager_deactivateAutomatedChaffing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivateAutomatedChaffing];
}

- (void)_deactivateAutomatedChaffing
{
  if (self->_chaffSession)
  {
    int v7 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v8 = [v7 isSensitiveLoggingAllowed];

    if (v8
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    if (self->_chaffingRegion)
    {
      BOOL v3 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v4 = [v3 isSensitiveLoggingAllowed];

      if (v4)
      {
        if (gLogCategory_ENTestResultManager <= 40
          && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }
    chaffingRegion = self->_chaffingRegion;
    self->_chaffingRegion = 0;

    [(ENXPCTimer *)self->_chaffingTimer invalidate];
    chaffingTimer = self->_chaffingTimer;
    self->_chaffingTimer = 0;

    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_SetInt64();
  }
}

- (void)deactivateWebSession
{
  CFPrefs_RemoveValue();

  CFPrefs_RemoveValue();
}

- (void)_updateChaffingTimerBlock
{
  BOOL v3 = self->_chaffingRegion;
  if (v3)
  {
    id v29 = 0;
    int v4 = [(ENTestResultManager *)self _serverConfigurationForRegion:v3 error:&v29];
    id v5 = v29;
    id v6 = v5;
    if (!v4)
    {
      [(ENTestResultManager *)self _deactivateAutomatedChaffing];
      uint64_t v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v18 = [v17 isSensitiveLoggingAllowed];

      if (v18
        && gLogCategory_ENTestResultManager <= 40
        && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_17;
    }
    id v27 = v5;
    int v7 = [MEMORY[0x1E4F1C9C0] date];
    int v8 = [MEMORY[0x1E4F1C9A0] currentCalendar];
    unint64_t Int64 = CFPrefs_GetInt64();
    CFPrefs_GetDouble();
    double v11 = v10;
    if (!Int64 && v10 == 0.0)
    {
      [v7 timeIntervalSince1970];
      double v11 = v12;
      CFPrefs_SetDouble();
    }
    long long v13 = [MEMORY[0x1E4F1C9C0] dateWithTimeIntervalSince1970:v11];
    id v14 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v15 = [v14 isSensitiveLoggingAllowed];

    if (v15
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      v24 = [MEMORY[0x1E4F28EC8] numberWithUnsignedLongLong:Int64];
      double v25 = v13;
      LogPrintF_safe();
    }
    if (self->_chaffSession)
    {
      double v19 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v20 = [v19 isSensitiveLoggingAllowed];

      if (!v20
        || gLogCategory_ENTestResultManager > 40
        || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_16;
      }
      double v21 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedLongLong:", Int64 + 1, v24, v25);
      LogPrintF_safe();
    }
    else
    {
      if (([v13 isEqualToDate:v7] & 1) == 0
        && ([v8 isDate:v13 inSameDayAsDate:v7] & 1) == 0)
      {
        [(ENTestResultManager *)self _deactivateAutomatedChaffing];
        goto LABEL_16;
      }
      uint64_t v16 = CFPrefs_GetInt64();
      if (Int64 < (unint64_t)[v4 maximumChaffsAllowedPerDay] - v16)
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __48__ENTestResultManager__updateChaffingTimerBlock__block_invoke;
        v28[3] = &unk_1E69AE0F0;
        v28[4] = self;
        v28[5] = Int64;
        [(ENTestResultManager *)self _startChaffTestVerficationSessionForRegion:v3 completionHandler:v28];
LABEL_16:

        id v6 = v27;
LABEL_17:

        goto LABEL_18;
      }
      objc_super v22 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v23 = [v22 isSensitiveLoggingAllowed];

      if (!v23
        || gLogCategory_ENTestResultManager > 40
        || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_16;
      }
      double v21 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedLongLong:", Int64, v24, v25);
      v26 = [MEMORY[0x1E4F28EC8] numberWithUnsignedLongLong:v16];
      LogPrintF_safe();
    }
    goto LABEL_16;
  }
LABEL_18:
}

void __48__ENTestResultManager__updateChaffingTimerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (v10)
  {
    BOOL v3 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v4 = [v3 isSensitiveLoggingAllowed];

    if (v4
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      double v9 = v10;
      LogPrintF_safe();
    }
  }
  else
  {
    CFPrefs_SetInt64();
    id v5 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v6 = [v5 isSensitiveLoggingAllowed];

    if (v6
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      double v9 = [MEMORY[0x1E4F28EC8] numberWithUnsignedLongLong:*(void *)(a1 + 40) + 1];
      LogPrintF_safe();
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "invalidate", v9);
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;
}

- (void)startChaffTestVerficationSessionForRegion:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__ENTestResultManager_startChaffTestVerficationSessionForRegion_completionHandler___block_invoke;
  block[3] = &unk_1E69ACB40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __83__ENTestResultManager_startChaffTestVerficationSessionForRegion_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startChaffTestVerficationSessionForRegion:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_startChaffTestVerficationSessionForRegion:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v17 = 0;
  id v7 = [(ENTestResultManager *)self _configurationForRegion:a3 error:&v17];
  id v8 = v17;
  if (v7)
  {
    id v9 = [(ENTestResultManager *)self delegate];
    int v10 = [v9 isProxyEnabledForTestResultManager:self];
    uint64_t v11 = 40;
    if (v10) {
      uint64_t v11 = 32;
    }
    id v12 = *(id *)((char *)&self->super.isa + v11);

    queue = self->_queue;
    id v16 = v8;
    id v14 = +[ENChaffTestResultSession sessionWithConfiguration:v7 URLSession:v12 queue:queue error:&v16];
    id v15 = v16;

    if (v14)
    {
      [(ENChaffTestResultSession *)self->_chaffSession invalidate];
      objc_storeStrong((id *)&self->_chaffSession, v14);
      [v14 sendChaffMessagesWithCompletion:v6];
    }
    else
    {
      v6[2](v6, v15);
    }
  }
  else
  {
    v6[2](v6, v8);
    id v15 = v8;
  }
}

- (void)startTestVerficationSessionWithCode:(id)a3 proxyEnabled:(BOOL)a4 region:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__ENTestResultManager_startTestVerficationSessionWithCode_proxyEnabled_region_completionHandler___block_invoke;
  block[3] = &unk_1E69AE118;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

uint64_t __97__ENTestResultManager_startTestVerficationSessionWithCode_proxyEnabled_region_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startTestVerficationSessionWithCode:*(void *)(a1 + 40) proxyEnabled:*(unsigned __int8 *)(a1 + 64) region:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_startTestVerficationSessionWithCode:(id)a3 proxyEnabled:(BOOL)a4 region:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void, id))a6;
  id v13 = [(ENTestResultManager *)self _existingSessionForVerificationCode:v10 region:v11];
  if (!v13)
  {
    unint64_t maxRetryTime = self->_maxRetryTime;
    id v22 = 0;
    uint64_t v15 = [(ENTestResultManager *)self _createSessionWithVerificationCode:v10 proxyEnabled:v8 region:v11 maxRetryTime:maxRetryTime error:&v22];
    id v16 = v22;
    id v13 = v16;
    if (!v15)
    {
      v12[2](v12, 0, v16);
      goto LABEL_5;
    }

    id v13 = (void *)v15;
  }
  id v17 = [v13 UUID];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__ENTestResultManager__startTestVerficationSessionWithCode_proxyEnabled_region_completionHandler___block_invoke;
  v19[3] = &unk_1E69AE140;
  id v20 = v17;
  BOOL v21 = v12;
  id v18 = v17;
  [v13 verifyCodeWithCompletionHandler:v19];

LABEL_5:
}

uint64_t __98__ENTestResultManager__startTestVerficationSessionWithCode_proxyEnabled_region_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a2)
  {
    a3 = 0;
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (void)startSelfReportWebSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ENTestResultManager_startSelfReportWebSession_completionHandler___block_invoke;
  block[3] = &unk_1E69ACB40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __67__ENTestResultManager_startSelfReportWebSession_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSelfReportWebSession:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_startSelfReportWebSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v23 = 0;
  BOOL v8 = [(ENTestResultManager *)self _configurationForRegion:v6 error:&v23];
  id v9 = v23;
  id v10 = v9;
  if (!v8)
  {
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v9);
    id v12 = v10;
    goto LABEL_10;
  }
  id v22 = v9;
  id v11 = [(ENTestResultManager *)self _serverConfigurationForRegion:v6 error:&v22];
  id v12 = v22;

  if (!v11)
  {
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v12);
    goto LABEL_9;
  }
  id v13 = [v8 testVerificationAPIKey];
  if (!v13)
  {
    id v14 = ENTestResultErrorF(10);
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
    goto LABEL_8;
  }
  id v14 = +[ENTestResultManager generateSecureNonce:256];
  if (!+[ENTestResultManager checkValidNonce:v14 size:256])
  {
    BOOL v21 = ENTestResultErrorF(5);
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v21);
LABEL_16:

    goto LABEL_8;
  }
  CFPrefs_GetDouble();
  if (v15 > 0.0)
  {
    double v16 = v15;
    id v17 = [MEMORY[0x1E4F1C9C0] date];
    [v17 timeIntervalSince1970];
    double v19 = v18 - v16;

    if (v19 < (double)(int)(86400 * [v11 selfReportTimeoutDays]))
    {
      BOOL v21 = ENTestResultErrorF(5);
      (*((void (**)(id, void *, void, void *))v7 + 2))(v7, v13, 0, v21);
      goto LABEL_16;
    }
  }
  CFPrefs_SetValue();
  id v20 = [MEMORY[0x1E4F1C9C0] date];
  [v20 timeIntervalSince1970];
  CFPrefs_SetDouble();

  (*((void (**)(id, void *, void *, id))v7 + 2))(v7, v13, v14, v12);
LABEL_8:

LABEL_9:
LABEL_10:
}

- (void)setMaxRetryTime:(unint64_t)a3
{
  self->_unint64_t maxRetryTime = a3;
}

- (id)metadataForSessionWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3032000000;
  double v18 = __Block_byref_object_copy__6;
  double v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__ENTestResultManager_metadataForSessionWithUUID_error___block_invoke;
  v11[3] = &unk_1E69ACE88;
  v11[4] = self;
  id v12 = v6;
  id v13 = &v15;
  id v14 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __56__ENTestResultManager_metadataForSessionWithUUID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _metadataForSessionWithUUID:*(void *)(a1 + 40) error:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_metadataForSessionWithUUID:(id)a3 error:(id *)a4
{
  uint64_t v5 = -[ENTestResultManager _sessionWithUUID:error:](self, "_sessionWithUUID:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 getMetadataAndReturnError:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)finishSessionWithUUID:(id)a3 userDidConsent:(BOOL)a4 metadata:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__ENTestResultManager_finishSessionWithUUID_userDidConsent_metadata_completionHandler___block_invoke;
  block[3] = &unk_1E69AE118;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(queue, block);
}

uint64_t __87__ENTestResultManager_finishSessionWithUUID_userDidConsent_metadata_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishSessionWithUUID:*(void *)(a1 + 40) userDidConsent:*(unsigned __int8 *)(a1 + 64) metadata:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_finishSessionWithUUID:(id)a3 userDidConsent:(BOOL)a4 metadata:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void, id))a6;
  id v34 = 0;
  id v13 = [(ENTestResultManager *)self _sessionWithUUID:v10 error:&v34];
  id v14 = v34;
  if (!v13)
  {
    v12[2](v12, 0, v14);
    goto LABEL_16;
  }
  if (!a4)
  {
    [(ENTestResultManager *)self _invalidateSession:v13];
    v12[2](v12, 1, 0);
    goto LABEL_16;
  }
  uint64_t v15 = [v13 getUploadingTemporaryExposureKeys];
  if (v15)
  {
    id v16 = (void *)v15;
  }
  else
  {
    uint64_t v17 = [v13 region];
    id v33 = v14;
    id v16 = [(ENTestResultManager *)self _getTemporaryExposureKeysForUpload:1 requireConsentForRegion:v17 error:&v33];
    id v18 = v33;

    if (!v16)
    {
      [(ENTestResultManager *)self _invalidateSession:v13];
      v12[2](v12, 0, v18);
      id v14 = v18;
      goto LABEL_16;
    }
    id v14 = v18;
  }
  id v31 = v14;
  id v32 = 0;
  BOOL v19 = [(ENTestResultManager *)self _getRevisionToken:&v32 forSession:v13 error:&v31];
  id v20 = v32;
  id v21 = v31;

  if (v19)
  {
    id v30 = v21;
    id v22 = [(ENTestResultManager *)self _metadataForSessionWithUUID:v10 error:&v30];
    id v14 = v30;

    if (v22)
    {
      CFStringGetTypeID();
      double v25 = (void *)CFPrefs_CopyTypedValue();
      id v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F256D8]];
      id v26 = v20;
      char v24 = [v23 isEqualToNumber:&unk_1F2B35FF8];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __88__ENTestResultManager__finishSessionWithUUID_userDidConsent_metadata_completionHandler___block_invoke;
      v27[3] = &unk_1E69AE168;
      v27[4] = self;
      v27[5] = v13;
      v27[6] = v25;
      char v29 = v24;
      id v20 = v26;
      v28 = v12;
      [v13 uploadTemporaryExposureKeys:v16 revisionToken:v26 userMetadata:v11 completionHandler:v27];
    }
    else
    {
      [(ENTestResultManager *)self _invalidateSession:v13];
      v12[2](v12, 0, v14);
    }
  }
  else
  {
    [(ENTestResultManager *)self _invalidateSession:v13];
    v12[2](v12, 0, v21);
    id v14 = v21;
  }

LABEL_16:
}

void __88__ENTestResultManager__finishSessionWithUUID_userDidConsent_metadata_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && a2)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v16 = v8;
    int v11 = [v9 _setRevisionToken:v7 forSession:v10 error:&v16];
    id v12 = v16;

    id v8 = v12;
    if (!v11) {
      goto LABEL_11;
    }
  }
  else if (v7 || (a2 & 1) == 0)
  {
    goto LABEL_11;
  }
  if (*(void *)(a1 + 48) && *(unsigned char *)(a1 + 64))
  {
    id v13 = [MEMORY[0x1E4F1C9C0] date];
    [v13 timeIntervalSince1970];
    CFPrefs_SetDouble();

    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
  }
  [*(id *)(a1 + 32) _invalidateSession:*(void *)(a1 + 40)];
LABEL_11:
  uint64_t Int64 = CFPrefs_GetInt64();
  CFPrefs_SetInt64();
  if (!Int64)
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9C0] date];
    [v15 timeIntervalSince1970];
    CFPrefs_SetDouble();
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_invalidateSession:(id)a3
{
  sessionsByUUID = self->_sessionsByUUID;
  id v5 = a3;
  uint64_t v4 = [v5 UUID];
  [(NSMutableDictionary *)sessionsByUUID setObject:0 forKeyedSubscript:v4];

  [v5 invalidate];
}

- (id)_configurationForRegion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ENConfigurationStore *)self->_configurationStore serverConfigurationForRegion:v6];
  id v8 = v7;
  if (!v7)
  {
    if (a4)
    {
      uint64_t v13 = 9;
      goto LABEL_14;
    }
LABEL_15:
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  if ((unint64_t)[v7 enVersion] < 2 || (objc_msgSend(v8, "enEnabled") & 1) == 0)
  {
    if (a4)
    {
      uint64_t v13 = 10;
LABEL_14:
      ENTestResultErrorF(v13);
      uint64_t v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_15;
  }
  id v9 = [(ENConfigurationStore *)self->_configurationStore downloadConfigurationForRegion:v6];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else if (a4)
  {
    ENTestResultErrorF(9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:

  return v10;
}

- (id)_serverConfigurationForRegion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ENConfigurationStore *)self->_configurationStore serverConfigurationForRegion:v6];
  id v8 = v7;
  if (v7)
  {
    if (unint64_t)[v7 enVersion] >= 2 && (objc_msgSend(v8, "enEnabled"))
    {
      id v9 = v8;
      goto LABEL_5;
    }
    if (a4)
    {
      uint64_t v11 = 10;
LABEL_12:
      ENTestResultErrorF(v11);
      id v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
  else if (a4)
  {
    uint64_t v11 = 9;
    goto LABEL_12;
  }
  id v9 = 0;
LABEL_5:

  return v9;
}

- (id)_createSessionWithVerificationCode:(id)a3 proxyEnabled:(BOOL)a4 region:(id)a5 maxRetryTime:(unint64_t)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  uint64_t v13 = [(ENTestResultManager *)self _configurationForRegion:a5 error:a7];
  if (v13)
  {
    id v14 = [(ENTestResultManager *)self _getTemporaryExposureKeysForUpload:0 requireConsentForRegion:0 error:a7];
    if (!v14)
    {
      id v26 = 0;
      goto LABEL_22;
    }
    CFStringGetTypeID();
    uint64_t v15 = (void *)CFPrefs_CopyTypedValue();
    id v33 = v14;
    if (!v15) {
      goto LABEL_8;
    }
    if (!+[ENTestResultManager checkValidNonce:v15 size:256])
    {
      if (a7)
      {
        ENTestResultErrorF(5);
        id v26 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v26 = 0;
      }
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    CFPrefs_GetDouble();
    if (v16 > 0.0
      && (double v17 = v16,
          [MEMORY[0x1E4F1C9C0] date],
          id v18 = objc_claimAutoreleasedReturnValue(),
          [v18 timeIntervalSince1970],
          double v20 = v19 - v17,
          v18,
          v20 > 86400.0))
    {
      id v21 = v12;
      CFPrefs_RemoveValue();

      uint64_t v15 = 0;
    }
    else
    {
LABEL_8:
      id v21 = v12;
    }
    uint64_t v22 = 40;
    if (v10) {
      uint64_t v22 = 32;
    }
    id v23 = *(id *)((char *)&self->super.isa + v22);
    char v24 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v25 = [v24 isSensitiveLoggingAllowed];

    if (v25
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    id v12 = v21;
    id v26 = +[ENTestResultSession sessionWithVerificationCode:v21 configuration:v13 maxRetryTime:a6 nonce:v15 URLSession:v23 queue:self->_queue error:a7];
    if (v26)
    {
      sessionsByUUID = self->_sessionsByUUID;
      if (!sessionsByUUID)
      {
        v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA68]);
        char v29 = self->_sessionsByUUID;
        self->_sessionsByUUID = v28;

        sessionsByUUID = self->_sessionsByUUID;
      }
      id v30 = [v26 UUID];
      [(NSMutableDictionary *)sessionsByUUID setObject:v26 forKeyedSubscript:v30];

      id v31 = v26;
    }

    id v14 = v33;
    goto LABEL_21;
  }
  id v26 = 0;
LABEL_23:

  return v26;
}

- (id)_getTemporaryExposureKeysForUpload:(BOOL)a3 requireConsentForRegion:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  if (!v8)
  {
LABEL_5:
    uint64_t v13 = 144 * (((CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E4F1CF70]) / 600.0) / 0x90) - 2016;
    temporaryExposureKeyManager = self->_temporaryExposureKeyManager;
    id v21 = 0;
    uint64_t v15 = [(ENTemporaryExposureKeyManager *)temporaryExposureKeyManager getTemporaryExposureKeysFromRollingStart:v13 includingActive:v6 ^ 1 refresh:v6 error:&v21];
    id v16 = v21;
    double v17 = v16;
    if (v15)
    {
      if ([v15 count])
      {
        id v18 = v15;
LABEL_8:

        goto LABEL_9;
      }
      if (a5)
      {
        double v20 = ENTestResultErrorF(1);
        goto LABEL_16;
      }
    }
    else if (a5)
    {
      double v20 = ENNestedTestResultErrorF(v16, 1);
LABEL_16:
      id v18 = 0;
      *a5 = v20;
      goto LABEL_8;
    }
    id v18 = 0;
    goto LABEL_8;
  }
  id v9 = [(ENConfigurationStore *)self->_configurationStore configurationForRegion:v8];
  BOOL v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 userConsent];
    uint64_t v12 = [v11 consent];

    if (v12 == 2)
    {

      goto LABEL_5;
    }
    if (a5) {
      goto LABEL_21;
    }
  }
  else if (a5)
  {
LABEL_21:
    ENTestResultErrorF(9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v18 = 0;
LABEL_9:

  return v18;
}

- (id)_sessionWithUUID:(id)a3 error:(id *)a4
{
  id v5 = [(NSMutableDictionary *)self->_sessionsByUUID objectForKeyedSubscript:a3];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else if (a4)
  {
    ENTestResultErrorF(5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_existingSessionForVerificationCode:(id)a3 region:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [(NSMutableDictionary *)self->_sessionsByUUID allValues];
  id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [v12 verificationCode];
        if ([v13 isEqualToString:v6])
        {
          id v14 = [v12 region];
          char v15 = [v14 isEqual:v7];

          if (v15)
          {
            id v9 = v12;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
LABEL_12:

  return v9;
}

- (BOOL)_getRevisionToken:(id *)a3 forSession:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(ENExposureDatabase *)self->_exposureDatabase openWithError:a5])
  {
    exposureDatabase = self->_exposureDatabase;
    uint64_t v10 = [(ENTestResultManager *)self _revisionTokenKeyForSession:v8];
    BOOL v11 = [(ENExposureDatabase *)exposureDatabase getValue:a3 forKey:v10 ofClass:objc_opt_class() error:a5];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_setRevisionToken:(id)a3 forSession:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(ENExposureDatabase *)self->_exposureDatabase openWithError:a5])
  {
    exposureDatabase = self->_exposureDatabase;
    BOOL v11 = [(ENTestResultManager *)self _revisionTokenKeyForSession:v9];
    uint64_t v12 = ENDefaultExpirationDate();
    BOOL v13 = [(ENExposureDatabase *)exposureDatabase setValue:v8 forKey:v11 expiryDate:v12 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_revisionTokenKeyForSession:(id)a3
{
  uint64_t v3 = [a3 uploadURL];
  uint64_t v4 = (void *)MEMORY[0x1E4F29020];
  id v5 = [v3 absoluteString];
  id v6 = [v4 stringWithFormat:@"TEKUploadRevisionToken(%@)", v5];

  return v6;
}

- (ENConfigurationStore)configurationStore
{
  return self->_configurationStore;
}

- (ENExposureDatabase)exposureDatabase
{
  return self->_exposureDatabase;
}

- (ENTemporaryExposureKeyManager)temporaryExposureKeyManager
{
  return self->_temporaryExposureKeyManager;
}

- (ENTestResultManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ENTestResultManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_temporaryExposureKeyManager, 0);
  objc_storeStrong((id *)&self->_exposureDatabase, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);
  objc_storeStrong((id *)&self->_chaffingRegion, 0);
  objc_storeStrong((id *)&self->_chaffingTimer, 0);
  objc_storeStrong((id *)&self->_URLBackupSession, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_sessionsByUUID, 0);
  objc_storeStrong((id *)&self->_chaffSession, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end