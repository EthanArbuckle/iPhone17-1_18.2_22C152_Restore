@interface ENExposureDetectionDaemonSession
- (BOOL)_addMatchesFromFileSession:(id)a3 publicKey:(id)a4 endpoint:(id)a5 error:(id *)a6;
- (BOOL)_checkFinishedAndReturnError:(id *)a3;
- (BOOL)_checkPreparedAndReturnError:(id *)a3;
- (BOOL)_classifyExposureWithResult:(id)a3 error:(id *)a4;
- (BOOL)_prepareAndReturnError:(id *)a3;
- (BOOL)_shouldMatchPersistenKey:(id)a3;
- (BOOL)_verifySignatureForFileSession:(id)a3 publicKey:(id)a4 error:(id *)a5;
- (BOOL)addMatchesFromFileSession:(id)a3 publicKey:(id)a4 endpoint:(id)a5 error:(id *)a6;
- (BOOL)classifyExposureWithResult:(id)a3 error:(id *)a4;
- (BOOL)prepareAndReturnError:(id *)a3;
- (BOOL)prepareConfiguration:(id)a3 bundleIdentifier:(id)a4 nowDate:(id)a5 expiryInterval:(double)a6 error:(id *)a7;
- (BOOL)skipFileSigningVerification;
- (ENAdvertisementDatabaseQuerySession)advertisementDatabaseQuerySession;
- (ENExposureCalculationSession)exposureCalculationSession;
- (ENExposureClassification)previousExposureClassification;
- (ENExposureConfiguration)clientExposureConfiguration;
- (ENExposureConfiguration)sessionExposureConfiguration;
- (ENExposureDatabase)exposureDatabase;
- (ENExposureDetectionDaemonSession)initWithQueue:(id)a3;
- (ENExposureDetectionDaemonSessionStatistics)statistics;
- (ENExposureDetectionHistorySession)historySession;
- (ENRegionConfiguration)regionConfiguration;
- (ENRegionServerConfiguration)regionServerConfiguration;
- (ENRegionServerExposureConfiguration)serverExposureConfiguration;
- (ENXPCClient)client;
- (NSDate)sessionDate;
- (id)_finishAndReturnError:(id *)a3;
- (id)_getAnalysisSessionAndReturnError:(id *)a3;
- (id)_getBeaconCountMetricsAndReturnError:(id *)a3;
- (id)_getSummaryAndReturnError:(id *)a3;
- (id)_prepareExposureCalculationSessionWithError:(id *)a3;
- (id)description;
- (id)finishAndReturnError:(id *)a3;
- (id)getAnalysisSessionAndReturnError:(id *)a3;
- (id)getBeaconCountMetricsAndReturnError:(id *)a3;
- (id)getSummaryAndReturnError:(id *)a3;
- (unint64_t)tekMatchBatchSize;
- (void)_addFileToHistoryWithHash:(id)a3 metadata:(id)a4 endpoint:(id)a5 keyCount:(unint64_t)a6 matchCount:(unint64_t)a7;
- (void)_invalidate;
- (void)_signpostBegin;
- (void)_signpostEnd;
- (void)_updateStatisticsWithHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setAdvertisementDatabaseQuerySession:(id)a3;
- (void)setClient:(id)a3;
- (void)setClientExposureConfiguration:(id)a3;
- (void)setExposureDatabase:(id)a3;
- (void)setPreviousExposureClassification:(id)a3;
- (void)setRegionConfiguration:(id)a3;
- (void)setRegionServerConfiguration:(id)a3;
- (void)setServerExposureConfiguration:(id)a3;
- (void)setSessionDate:(id)a3;
- (void)setSkipFileSigningVerification:(BOOL)a3;
- (void)setTekMatchBatchSize:(unint64_t)a3;
@end

@implementation ENExposureDetectionDaemonSession

- (ENExposureDetectionDaemonSession)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENExposureDetectionDaemonSession;
  v6 = [(ENExposureDetectionDaemonSession *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v7->_signpostID = 0;
    v8 = objc_alloc_init(ENExposureDetectionDaemonSessionStatistics);
    statistics = v7->_statistics;
    v7->_statistics = v8;

    v7->_tekMatchBatchSize = 256;
    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  [(ENExposureDetectionDaemonSession *)self _signpostEnd];
  v3.receiver = self;
  v3.super_class = (Class)ENExposureDetectionDaemonSession;
  [(ENExposureDetectionDaemonSession *)&v3 dealloc];
}

- (BOOL)prepareAndReturnError:(id *)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ENExposureDetectionDaemonSession_prepareAndReturnError___block_invoke;
  block[3] = &unk_1E69ACD50;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __58__ENExposureDetectionDaemonSession_prepareAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _prepareAndReturnError:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_prepareAndReturnError:(id *)a3
{
  if (!self->_prepared)
  {
    [(ENExposureDetectionDaemonSession *)self _signpostBegin];
    sessionDate = self->_sessionDate;
    if (sessionDate)
    {
      uint64_t v7 = sessionDate;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9C0] date];
    }
    v8 = v7;
    obj = v7;
    if (self->_advertisementDatabaseQuerySession)
    {
      exposureDatabase = self->_exposureDatabase;
      if (exposureDatabase)
      {
        if ([(ENExposureDatabase *)exposureDatabase openWithError:a3])
        {
          char v10 = self->_client;
          v11 = [(ENRegionConfiguration *)self->_regionConfiguration region];
          objc_super v12 = self->_serverExposureConfiguration;
          v13 = v12;
          if (v12)
          {
            [(ENRegionServerExposureConfiguration *)v12 privacyParameterInputCandenceInterval];
            double v15 = v14;
          }
          else
          {
            double v15 = 604800.0;
          }
          v32 = v11;
          if (v10)
          {
            v16 = self->_clientExposureConfiguration;
            if (v16)
            {
              v17 = v16;
              if ([(ENXPCClient *)v10 appAPIVersion] < 2)
              {
LABEL_17:
                if (([(ENExposureConfiguration *)v17 flags] & 4) == 0
                  || [(ENXPCClient *)v10 accessLevel] > 3)
                {
                  v20 = [(ENXPCClient *)v10 signingIdentity];
                  goto LABEL_29;
                }
                if (a3)
                {
                  ENErrorF();
                  id v31 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_52;
                }
LABEL_57:
                v20 = 0;
LABEL_58:
                BOOL v3 = 0;
                goto LABEL_36;
              }
              v18 = [(ENExposureConfiguration *)v17 infectiousnessForDaysSinceOnsetOfSymptoms];
              uint64_t v19 = [v18 count];

              if (v19)
              {
                [(ENExposureConfiguration *)v17 setFlags:[(ENExposureConfiguration *)v17 flags] | 3];
                goto LABEL_17;
              }
              if (!a3) {
                goto LABEL_57;
              }
              v21 = NSStringFromSelector(sel_infectiousnessForDaysSinceOnsetOfSymptoms);
              ENErrorF();
              *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

              goto LABEL_57;
            }
            if (a3) {
              goto LABEL_51;
            }
          }
          else if (v11)
          {
            if (v13)
            {
              v21 = [(ENRegionServerExposureConfiguration *)v13 exposureConfigurationValues];
              v22 = (ENExposureConfiguration *)[objc_alloc(MEMORY[0x1E4F25738]) initWithDictionary:v21 error:a3];
              v17 = v22;
              if (v22)
              {
                [(ENExposureConfiguration *)v22 setFlags:3];
                if ([(ENRegionServerExposureConfiguration *)v13 enableRecursiveReportType]&& gLogCategory__ENExposureDetectionDaemonSession <= 90&& (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v23 = (void *)MEMORY[0x1E4F29020];
                v24 = [v11 regionCode];
                v20 = [v23 stringWithFormat:@"com.apple.ExposureNotification.%@", v24];

                v8 = obj;
LABEL_29:
                if ([(ENExposureDetectionDaemonSession *)self prepareConfiguration:v17 bundleIdentifier:v20 nowDate:v8 expiryInterval:a3 error:v15])
                {
                  id v25 = objc_alloc_init(MEMORY[0x1E4F25758]);
                  [v25 setDate:v8];
                  v26 = (void *)MGCopyAnswer();
                  [v25 setSystemBuildVersion:v26];

                  if (v10)
                  {
                    v27 = [(ENXPCClient *)v10 signingIdentity];
                    [v25 setAppBundleIdentifier:v27];
                  }
                  else
                  {
                    v27 = [(ENRegionConfiguration *)self->_regionConfiguration region];
                    [v25 setRegion:v27];
                  }

                  v28 = self->_exposureDatabase;
                  id v34 = 0;
                  BOOL v3 = [(ENExposureDatabase *)v28 upsertExposureDetectionHistorySession:v25 error:&v34];
                  id v29 = v34;
                  if (v3)
                  {
                    objc_storeStrong((id *)&self->_historySession, v25);
                    objc_storeStrong((id *)&self->_sessionDate, obj);
                    objc_storeStrong((id *)&self->_sessionExposureConfiguration, v17);
                    self->_useCache = [(ENExposureConfiguration *)self->_sessionExposureConfiguration flags] & 1;
                    self->_prepared = 1;
                  }
                  else if (a3)
                  {
                    ENNestedErrorF();
                    *a3 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  goto LABEL_36;
                }
                goto LABEL_58;
              }
              goto LABEL_56;
            }
            if (a3)
            {
LABEL_51:
              ENErrorF();
              id v31 = (id)objc_claimAutoreleasedReturnValue();
              v17 = 0;
LABEL_52:
              v20 = 0;
              BOOL v3 = 0;
              *a3 = v31;
LABEL_36:

LABEL_37:
              return v3;
            }
          }
          else if (a3)
          {
            goto LABEL_51;
          }
          v17 = 0;
          goto LABEL_57;
        }
LABEL_43:
        BOOL v3 = 0;
        goto LABEL_37;
      }
      if (!a3) {
        goto LABEL_43;
      }
    }
    else if (!a3)
    {
      goto LABEL_43;
    }
    ENErrorF();
    BOOL v3 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  return 1;
}

- (BOOL)prepareConfiguration:(id)a3 bundleIdentifier:(id)a4 nowDate:(id)a5 expiryInterval:(double)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  double v15 = [MEMORY[0x1E4F29020] stringWithFormat:@"ENExposureDetectionDaemonSessionState.%@", v13];
  exposureDatabase = self->_exposureDatabase;
  id v46 = 0;
  BOOL v17 = [(ENExposureDatabase *)exposureDatabase getValue:&v46 forKey:v15 ofClass:objc_opt_class() error:a7];
  v18 = (ENExposureDetectionDaemonSessionState *)v46;
  uint64_t v19 = v18;
  if (!v17)
  {
    BOOL v37 = 0;
    goto LABEL_34;
  }
  if (!v18) {
    uint64_t v19 = objc_alloc_init(ENExposureDetectionDaemonSessionState);
  }
  v20 = [v12 infectiousnessForDaysSinceOnsetOfSymptoms];
  v21 = [(ENExposureDetectionDaemonSessionState *)v19 infectiousnessForDaysSinceOnsetOfSymptoms];
  id v22 = v20;
  id v23 = v21;
  v24 = v23;
  if (v22 == v23)
  {

LABEL_31:
    objc_msgSend(v12, "setInfectiousnessForDaysSinceOnsetOfSymptoms:", v24, v39, v40, v41, v42);
    goto LABEL_32;
  }
  v45 = a7;
  if ((v22 == 0) != (v23 != 0))
  {
    char v25 = [v22 isEqual:v23];

    if (v25) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  uint64_t v26 = [(ENExposureDetectionDaemonSessionState *)v19 infectiousnessForDaysSinceOnsetOfSymptomsChangeDate];
  if (v26)
  {
    v27 = (void *)v26;
    [v14 timeIntervalSinceDate:v26];
    if (v28 < a6 && [v24 count])
    {
      client = self->_client;
      if (client) {
        BOOL v30 = [(ENXPCClient *)client accessLevel] > 2;
      }
      else {
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 1;
    }
    if (gLogCategory_ENExposureDetectionDaemonSession <= 50
      && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
    {
      if (v30) {
        id v31 = "Using";
      }
      else {
        id v31 = "Ignoring";
      }
      v32 = "using";
      if (v30) {
        v32 = "overriding";
      }
      v43 = v32;
      v44 = v31;
      CUPrintDurationDouble();
      v42 = v41 = v43;
      v39 = v44;
      id v40 = v13;
      LogPrintF_safe();
    }
    if (!v30) {
      goto LABEL_31;
    }
  }
  else if (gLogCategory_ENExposureDetectionDaemonSession <= 50 {
         && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
  }
  {
    v39 = (const char *)v13;
    LogPrintF_safe();
  }
  -[ENExposureDetectionDaemonSessionState setInfectiousnessForDaysSinceOnsetOfSymptoms:](v19, "setInfectiousnessForDaysSinceOnsetOfSymptoms:", v22, v39, v40, v41, v42);
  [(ENExposureDetectionDaemonSessionState *)v19 setInfectiousnessForDaysSinceOnsetOfSymptomsChangeDate:v14];
  v33 = [(ENXPCClient *)self->_client signingIdentity];
  [(ENExposureDetectionDaemonSessionState *)v19 setClientSigningIdentity:v33];

  id v34 = [(ENRegionConfiguration *)self->_regionConfiguration region];
  [(ENExposureDetectionDaemonSessionState *)v19 setRegion:v34];

  v35 = [v14 dateByAddingTimeInterval:-a6];
  BOOL v36 = [(ENExposureDatabase *)self->_exposureDatabase setValue:v19 forKey:v15 expiryDate:v35 error:v45];

  if (v36)
  {
LABEL_32:
    BOOL v37 = 1;
    goto LABEL_33;
  }
  BOOL v37 = 0;
LABEL_33:

LABEL_34:
  return v37;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ENExposureDetectionDaemonSession_invalidate__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __46__ENExposureDetectionDaemonSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  [(ENExposureDetectionDaemonSession *)self _signpostEnd];
  [(ENAdvertisementDatabaseQuerySession *)self->_advertisementDatabaseQuerySession invalidate];
  clientExposureConfiguration = self->_clientExposureConfiguration;
  self->_clientExposureConfiguration = 0;

  historySession = self->_historySession;
  self->_historySession = 0;

  exposureCalculationSession = self->_exposureCalculationSession;
  self->_exposureCalculationSession = 0;

  serverExposureConfiguration = self->_serverExposureConfiguration;
  self->_serverExposureConfiguration = 0;

  sessionExposureConfiguration = self->_sessionExposureConfiguration;
  self->_sessionExposureConfiguration = 0;

  *(_WORD *)&self->_finished = 0;
}

- (BOOL)addMatchesFromFileSession:(id)a3 publicKey:(id)a4 endpoint:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  dispatchQueue = self->_dispatchQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__ENExposureDetectionDaemonSession_addMatchesFromFileSession_publicKey_endpoint_error___block_invoke;
  v18[3] = &unk_1E69ACD78;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = &v24;
  id v23 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(dispatchQueue, v18);
  LOBYTE(dispatchQueue) = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)dispatchQueue;
}

uint64_t __87__ENExposureDetectionDaemonSession_addMatchesFromFileSession_publicKey_endpoint_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _addMatchesFromFileSession:*(void *)(a1 + 40) publicKey:*(void *)(a1 + 48) endpoint:*(void *)(a1 + 56) error:*(void *)(a1 + 72)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (BOOL)_addMatchesFromFileSession:(id)a3 publicKey:(id)a4 endpoint:(id)a5 error:(id *)a6
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v40 = a5;
  v38 = a6;
  BOOL v37 = v11;
  if (![(ENExposureDetectionDaemonSession *)self _checkPreparedAndReturnError:a6])
  {
    BOOL v30 = 0;
    goto LABEL_45;
  }
  id v83 = 0;
  id v46 = self;
  BOOL v12 = [(ENExposureDetectionDaemonSession *)self _verifySignatureForFileSession:v10 publicKey:v11 error:&v83];
  id v39 = v83;
  if (!v12)
  {
    if (gLogCategory__ENExposureDetectionDaemonSession <= 90
      && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
    {
      if (self->_skipFileSigningVerification) {
        id v13 = " (ignored)";
      }
      else {
        id v13 = "";
      }
      CUPrintNSError();
      BOOL v36 = v35 = v13;
      LogPrintF_safe();
    }
    -[ENExposureDetectionDaemonSession _updateStatisticsWithHandler:](self, "_updateStatisticsWithHandler:", &__block_literal_global_2, v35, v36, v37);
    if (!self->_skipFileSigningVerification)
    {
      BOOL v30 = 0;
      if (a6) {
        *a6 = v39;
      }
      goto LABEL_44;
    }
  }
  id v14 = self;
  v44 = self->_advertisementDatabaseQuerySession;
  if (self->_useCache)
  {
    v45 = 0;
    goto LABEL_14;
  }
  v45 = [(ENExposureDetectionDaemonSession *)self _prepareExposureCalculationSessionWithError:a6];
  id v14 = self;
  if (v45)
  {
LABEL_14:
    [(ENRegionServerConfiguration *)v14->_regionServerConfiguration rpiAdvertisementTolerance];
    if (v15 == 0.0) {
      double v16 = 7200.0;
    }
    else {
      double v16 = v15;
    }
    BOOL v17 = [v40 region];
    v43 = [v17 countryCode];

    id v19 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    while (1)
    {
      context = (void *)MEMORY[0x1D9439DC0](v18);
      id v82 = v19;
      id v20 = [v10 readTEKBatchAndReturnError:&v82];
      id v48 = v82;

      if (!v20) {
        break;
      }
      if (![v20 count])
      {

        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_4;
        v49[3] = &unk_1E69ACE10;
        id v31 = v10;
        id v50 = v31;
        [(ENExposureDetectionDaemonSession *)v46 _updateStatisticsWithHandler:v49];
        v32 = [v31 sha256Data];
        v33 = [v31 metadata];
        [(ENExposureDetectionDaemonSession *)v46 _addFileToHistoryWithHash:v32 metadata:v33 endpoint:v40 keyCount:v41 matchCount:v42];

        BOOL v30 = 1;
        id v29 = v48;
        goto LABEL_42;
      }
      if (CFPrefs_GetInt64())
      {
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v78 objects:v84 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v79;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v79 != v23) {
                objc_enumerationMutation(v21);
              }
              if (gLogCategory_ENExposureDetectionDaemonSession <= 40
                && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v78 objects:v84 count:16];
          }
          while (v22);
        }
      }
      v77[0] = 0;
      v77[1] = v77;
      v77[2] = 0x2020000000;
      v77[3] = 0;
      v72[3] = 0;
      uint64_t v73 = 0;
      v74 = &v73;
      uint64_t v75 = 0x2020000000;
      uint64_t v76 = 0;
      v72[0] = 0;
      v72[1] = v72;
      v72[2] = 0x2020000000;
      v71[0] = 0;
      v71[1] = v71;
      v71[2] = 0x2020000000;
      v71[3] = 0;
      v70[0] = 0;
      v70[1] = v70;
      v70[2] = 0x2020000000;
      v70[3] = 0;
      v69[0] = 0;
      v69[1] = v69;
      v69[2] = 0x2020000000;
      v69[3] = 0;
      id v68 = v48;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_2;
      v60[3] = &unk_1E69ACDC0;
      v60[4] = v46;
      v60[5] = v43;
      v62 = v72;
      v63 = v69;
      v64 = v77;
      id v25 = v45;
      id v61 = v25;
      v65 = v70;
      v66 = &v73;
      v67 = v71;
      BOOL v26 = [(ENAdvertisementDatabaseQuerySession *)v44 enumerateAdvertisementsMatchingKeys:v20 attenuationThreshold:255 timestampTolerance:&v68 error:v60 handler:v16];
      id v19 = v68;

      if (v26)
      {
        uint64_t v27 = [v20 count];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_3;
        v51[3] = &unk_1E69ACDE8;
        v53 = v77;
        id v52 = v25;
        v54 = v70;
        v55 = &v73;
        v56 = v71;
        v57 = v72;
        v58 = v69;
        uint64_t v59 = v27;
        [(ENExposureDetectionDaemonSession *)v46 _updateStatisticsWithHandler:v51];
        uint64_t v28 = v74[3];

        v41 += v27;
        v42 += v28;
      }

      _Block_object_dispose(v69, 8);
      _Block_object_dispose(v70, 8);
      _Block_object_dispose(v71, 8);
      _Block_object_dispose(v72, 8);
      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(v77, 8);

      if (!v26) {
        goto LABEL_36;
      }
    }
    id v19 = v48;
LABEL_36:
    if (v38)
    {
      id v29 = v19;
      BOOL v30 = 0;
      id *v38 = v29;
    }
    else
    {
      BOOL v30 = 0;
      id v29 = v19;
    }
LABEL_42:

    goto LABEL_43;
  }
  if (gLogCategory__ENExposureDetectionDaemonSession <= 90
    && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  BOOL v30 = 0;
LABEL_43:

LABEL_44:
LABEL_45:

  return v30;
}

void __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setInvalidFileSignatureCount:", objc_msgSend(v2, "invalidFileSignatureCount") + 1);
}

void __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [ENPersistentTemporaryExposureKey alloc];
  v8 = [*(id *)(*(void *)(a1 + 32) + 56) signingIdentity];
  uint64_t v9 = [(ENPersistentTemporaryExposureKey *)v7 initWithTemporaryExposureKey:v5 appBundleIdentifier:v8 regionCountryCode:*(void *)(a1 + 40)];

  id v10 = *(void **)(*(void *)(a1 + 32) + 72);
  id v16 = 0;
  uint64_t v11 = [v10 insertMatchedAdvertisements:v6 forKey:v9 error:&v16];
  id v12 = v16;
  switch(v11)
  {
    case 0:
      if (gLogCategory__ENExposureDetectionDaemonSession <= 90
        && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
      {
        double v15 = CUPrintNSError();
        LogPrintF_safe();
      }
      break;
    case 1:
      uint64_t v13 = *(void *)(a1 + 56);
      goto LABEL_8;
    case 3:
      uint64_t v13 = *(void *)(a1 + 64);
      goto LABEL_8;
    case 4:
      uint64_t v13 = *(void *)(a1 + 72);
LABEL_8:
      ++*(void *)(*(void *)(v13 + 8) + 24);
      break;
    default:
      break;
  }
  if (*(void *)(a1 + 48))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    id v14 = [*(id *)(a1 + 48) exposureInfoForMatchedAdvertisements:v6 key:v5];
    if (v14) {
      ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    }
    if (objc_msgSend(v5, "diagnosisReportType", v15) == 5) {
      ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    }
  }
}

void __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setDroppedCachedKeyUpdatesCount:", *(void *)(*(void *)(a1[5] + 8) + 24) + objc_msgSend(v3, "droppedCachedKeyUpdatesCount"));
  if (a1[4]) {
    objc_msgSend(v3, "setDroppedKeyCount:", *(void *)(*(void *)(a1[6] + 8) + 24)- (*(void *)(*(void *)(a1[7] + 8) + 24)+ *(void *)(*(void *)(a1[8] + 8) + 24))+ objc_msgSend(v3, "droppedKeyCount"));
  }
  objc_msgSend(v3, "setFileKeyCount:", a1[11] + objc_msgSend(v3, "fileKeyCount"));
  objc_msgSend(v3, "setMatchedKeyCount:", *(void *)(*(void *)(a1[7] + 8) + 24) + objc_msgSend(v3, "matchedKeyCount"));
  objc_msgSend(v3, "setNewCachedKeyCount:", *(void *)(*(void *)(a1[9] + 8) + 24) + objc_msgSend(v3, "newCachedKeyCount"));
  objc_msgSend(v3, "setRevokedKeyCount:", *(void *)(*(void *)(a1[8] + 8) + 24) + objc_msgSend(v3, "revokedKeyCount"));
  objc_msgSend(v3, "setUpdatedCachedKeyCount:", *(void *)(*(void *)(a1[10] + 8) + 24) + objc_msgSend(v3, "updatedCachedKeyCount"));
}

void __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setFileInvalidKeyCount:", objc_msgSend(v3, "fileInvalidKeyCount") + objc_msgSend(v2, "invalidKeyCount"));
  objc_msgSend(v3, "setProcessedFileCount:", objc_msgSend(v3, "processedFileCount") + 1);
}

- (void)_addFileToHistoryWithHash:(id)a3 metadata:(id)a4 endpoint:(id)a5 keyCount:(unint64_t)a6 matchCount:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = v12;
  if (v15)
  {
    id v16 = self->_historySession;
    if (v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F25750]);
      [v17 setFileHash:v15];
      uint64_t v18 = [MEMORY[0x1E4F1C9C0] date];
      [v17 setProcessDate:v18];

      [v17 setMetadata:v13];
      id v19 = [MEMORY[0x1E4F28EC8] numberWithUnsignedLongLong:a6];
      [v17 setKeyCount:v19];

      if (self->_useCache)
      {
        [v17 setMatchCount:0];
      }
      else
      {
        id v20 = [MEMORY[0x1E4F28EC8] numberWithUnsignedLongLong:a7];
        [v17 setMatchCount:v20];
      }
      client = self->_client;
      if (client)
      {
        uint64_t v22 = [(ENXPCClient *)client signingIdentity];
        [v17 setSourceAppBundleIdentifier:v22];
      }
      else
      {
        uint64_t v22 = [v14 region];
        [v17 setSourceRegion:v22];
      }

      exposureDatabase = self->_exposureDatabase;
      id v26 = 0;
      BOOL v24 = [(ENExposureDatabase *)exposureDatabase insertExposureDetectionFile:v17 session:v16 error:&v26];
      id v25 = v26;
      if (!v24
        && gLogCategory__ENExposureDetectionDaemonSession <= 90
        && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else if (gLogCategory__ENExposureDetectionDaemonSession <= 90 {
           && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
  }
  else if (gLogCategory__ENExposureDetectionDaemonSession <= 90 {
         && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (BOOL)_verifySignatureForFileSession:(id)a3 publicKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = [a4 keyRef];
  if (v8)
  {
    id v14 = 0;
    uint64_t v9 = [v7 verifySignatureWithPublicKey:v8 error:&v14];
    id v10 = v14;
    uint64_t v11 = v10;
    BOOL v12 = v9 != 0;
    if (v9)
    {
      if (gLogCategory_ENExposureDetectionDaemonSession <= 10
        && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else if (a5)
    {
      __83__ENExposureDetectionDaemonSession__verifySignatureForFileSession_publicKey_error___block_invoke((uint64_t)v10, v10, @"Signature verification failed");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a5)
  {
    __83__ENExposureDetectionDaemonSession__verifySignatureForFileSession_publicKey_error___block_invoke(0, 0, @"Nil public key");
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

id __83__ENExposureDetectionDaemonSession__verifySignatureForFileSession_publicKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v4 = (objc_class *)MEMORY[0x1E4F1CA68];
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc_init(v4);
  [v7 setObject:@"Invalid signature" forKeyedSubscript:*MEMORY[0x1E4F28570]];
  [v7 setObject:@"Invalid signature" forKeyedSubscript:@"cuErrorDesc"];
  [v7 setObject:v5 forKeyedSubscript:@"cuErrorMsg"];

  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A58]];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C50]) initWithDomain:@"ENExposureDetectionDaemonSessionErrorDomain" code:2 userInfo:v7];

  return v8;
}

- (BOOL)_checkPreparedAndReturnError:(id *)a3
{
  BOOL prepared = self->_prepared;
  if (!self->_prepared && a3 != 0)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return prepared;
}

- (BOOL)_checkFinishedAndReturnError:(id *)a3
{
  BOOL finished = self->_finished;
  if (!self->_finished && a3 != 0)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return finished;
}

- (id)finishAndReturnError:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ENExposureDetectionDaemonSession_finishAndReturnError___block_invoke;
  block[3] = &unk_1E69ACD50;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __57__ENExposureDetectionDaemonSession_finishAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _finishAndReturnError:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_finishAndReturnError:(id *)a3
{
  if (!-[ENExposureDetectionDaemonSession _checkPreparedAndReturnError:](self, "_checkPreparedAndReturnError:"))
  {
LABEL_42:
    id v14 = 0;
    goto LABEL_37;
  }
  if (self->_finished)
  {
    if (a3)
    {
      ENErrorF();
      id v14 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
    goto LABEL_42;
  }
  id v5 = [(ENExposureDetectionDaemonSession *)self _prepareExposureCalculationSessionWithError:a3];
  if (!v5) {
    goto LABEL_15;
  }
  if (!self->_useCache) {
    goto LABEL_11;
  }
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  uint64_t v36 = 0;
  BOOL v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  double Current = CFAbsoluteTimeGetCurrent();
  exposureDatabase = self->_exposureDatabase;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __58__ENExposureDetectionDaemonSession__finishAndReturnError___block_invoke;
  v35[3] = &unk_1E69ACE38;
  v35[6] = &v36;
  v35[7] = &v41;
  v35[4] = self;
  v35[5] = v5;
  v35[8] = v45;
  v35[9] = v40;
  BOOL v8 = [(ENExposureDatabase *)exposureDatabase enumerateMatchedAdvertisementsWithError:a3 handler:v35];
  BOOL v9 = v8;
  if (v8
    && gLogCategory_ENExposureDetectionDaemonSession <= 30
    && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
  {
    id v10 = (ENExposureDetectionDaemonSessionStatistics *)v37[3];
    uint64_t v11 = v42[3];
    double v32 = CFAbsoluteTimeGetCurrent() - Current;
    statistics = v10;
    uint64_t v31 = (uint64_t)v10 - v11;
    LogPrintF_safe();
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __58__ENExposureDetectionDaemonSession__finishAndReturnError___block_invoke_2;
  v34[3] = &unk_1E69ACE60;
  v34[4] = &v41;
  v34[5] = v45;
  v34[6] = v40;
  -[ENExposureDetectionDaemonSession _updateStatisticsWithHandler:](self, "_updateStatisticsWithHandler:", v34, statistics, v31, *(void *)&v32);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v45, 8);
  if (v9)
  {
LABEL_11:
    id v12 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v13 = [v12 isSensitiveLoggingAllowed];

    if (v13
      && gLogCategory_ENExposureDetectionDaemonSession <= 30
      && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
    {
      statistics = self->_statistics;
      LogPrintF_safe();
    }
    id v15 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v16 = [v15 isSensitiveLoggingAllowed];

    if (v16
      && gLogCategory_ENExposureDetectionDaemonSession <= 30
      && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v31 = [v5 cachedExposureInfoCount];
      double v32 = COERCE_DOUBLE([v5 cachedExposureWindowCount]);
      uint64_t v30 = v17;
      LogPrintF_safe();
    }
    self->_BOOL finished = 1;
    uint64_t v18 = -[ENExposureDetectionDaemonSession _getSummaryAndReturnError:](self, "_getSummaryAndReturnError:", a3, v30, v31, *(void *)&v32);
    if (v18)
    {
      id v19 = [(ENExposureDetectionDaemonSession *)self _getBeaconCountMetricsAndReturnError:a3];
      id v20 = [v19 differentialPrivacyRepresentationWithCountThresholds:&unk_1F2B35C68];
      if (v20)
      {
        id v21 = objc_alloc_init(ENExposureDetectionDaemonSessionResult);
        [(ENExposureDetectionDaemonSessionResult *)v21 setStatistics:self->_statistics];
        [(ENExposureDetectionDaemonSessionResult *)v21 setSummary:v18];
        uint64_t v22 = [(ENRegionConfiguration *)self->_regionConfiguration region];
        [(ENExposureDetectionDaemonSessionResult *)v21 setRegion:v22];

        uint64_t v23 = [v5 cachedExposuresDifferentialPrivacyRiskParameters];
        [(ENExposureDetectionDaemonSessionResult *)v21 setDifferentialPrivacyRiskParameters:v23];

        [(ENExposureDetectionDaemonSessionResult *)v21 setDifferentialPrivacyBeaconCount:v20];
        if ([(ENExposureDetectionDaemonSession *)self _classifyExposureWithResult:v21 error:a3])
        {
          BOOL v24 = self->_historySession;
          if (v24)
          {
            id v25 = self->_exposureDatabase;
            id v33 = 0;
            BOOL v26 = [(ENExposureDatabase *)v25 upsertExposureDetectionHistorySession:v24 error:&v33];
            id v27 = v33;
            if (!v26
              && gLogCategory__ENExposureDetectionDaemonSession <= 90
              && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
          }
          [(ENExposureDetectionDaemonSession *)self _signpostEnd];
          id v14 = v21;
        }
        else
        {
          id v14 = 0;
        }
      }
      else if (a3)
      {
        ENErrorF();
        id v14 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
LABEL_15:
    id v14 = 0;
  }

LABEL_37:

  return v14;
}

void __58__ENExposureDetectionDaemonSession__finishAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if ([*(id *)(a1 + 32) _shouldMatchPersistenKey:v8])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v6 = [v8 key];
    uint64_t v7 = [*(id *)(a1 + 40) exposureInfoForMatchedAdvertisements:v5 key:v6];
    if (v7) {
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
    if ([v6 diagnosisReportType] == 5) {
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
  }
}

void __58__ENExposureDetectionDaemonSession__finishAndReturnError___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1[4] + 8) + 24);
  uint64_t v4 = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 24);
  id v6 = a2;
  objc_msgSend(v6, "setDroppedKeyCount:", v3 - (v4 + v5) + objc_msgSend(v6, "droppedKeyCount"));
  objc_msgSend(v6, "setMatchedKeyCount:", *(void *)(*(void *)(a1[5] + 8) + 24) + objc_msgSend(v6, "matchedKeyCount"));
  objc_msgSend(v6, "setRevokedKeyCount:", *(void *)(*(void *)(a1[6] + 8) + 24) + objc_msgSend(v6, "revokedKeyCount"));
}

- (BOOL)_shouldMatchPersistenKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ENRegionConfiguration *)self->_regionConfiguration region];
  if ([(ENRegionServerExposureConfiguration *)self->_serverExposureConfiguration matchingRestrictedToRegion])BOOL v6 = v5 == 0; {
  else
  }
    BOOL v6 = 1;
  if (v6)
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v7 = [v4 regionCountryCode];
    id v8 = [v5 countryCode];
    char v9 = [v7 isEqualToString:v8];
  }
  return v9;
}

- (BOOL)classifyExposureWithResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__ENExposureDetectionDaemonSession_classifyExposureWithResult_error___block_invoke;
  v10[3] = &unk_1E69ACE88;
  v10[4] = self;
  id v11 = v6;
  id v12 = &v14;
  int v13 = a4;
  id v8 = v6;
  dispatch_sync(dispatchQueue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __69__ENExposureDetectionDaemonSession_classifyExposureWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _classifyExposureWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_classifyExposureWithResult:(id)a3 error:(id *)a4
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v119 = a3;
  if (!self->_client)
  {
    if (![(ENExposureDetectionDaemonSession *)self _checkFinishedAndReturnError:a4])
    {
      BOOL v6 = 0;
      goto LABEL_89;
    }
    uint64_t v7 = self->_serverExposureConfiguration;
    id v8 = v7;
    if (!v7)
    {
      if (a4)
      {
        ENErrorF();
        BOOL v6 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v6 = 0;
      }
      goto LABEL_88;
    }
    v114 = [(ENRegionServerExposureConfiguration *)v7 classificationCriteria];
    if (![v114 count])
    {
      if (a4)
      {
        ENErrorF();
        BOOL v6 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v6 = 0;
      }
      goto LABEL_87;
    }
    v117 = [(ENRegionConfiguration *)self->_regionConfiguration region];
    if (!v117)
    {
      if (a4)
      {
        ENErrorF();
        BOOL v6 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v6 = 0;
      }
      goto LABEL_86;
    }
    char v9 = [v119 summary];
    BOOL v6 = v9 != 0;
    if (!v9)
    {
LABEL_85:

LABEL_86:
LABEL_87:

LABEL_88:
      goto LABEL_89;
    }
    id v110 = v9;
    v111 = self;
    BOOL v108 = v9 != 0;
    v109 = v8;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id obj = [v9 daySummaries];
    uint64_t v115 = [obj countByEnumeratingWithState:&v125 objects:v130 count:16];
    id v10 = 0;
    if (v115)
    {
      uint64_t v113 = *(void *)v126;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v126 != v113) {
            objc_enumerationMutation(obj);
          }
          uint64_t v116 = v11;
          id v12 = *(void **)(*((void *)&v125 + 1) + 8 * v11);
          long long v121 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          id v118 = v114;
          uint64_t v13 = [v118 countByEnumeratingWithState:&v121 objects:v129 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v120 = *(void *)v122;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v122 != v120) {
                  objc_enumerationMutation(v118);
                }
                uint64_t v16 = *(void **)(*((void *)&v121 + 1) + 8 * i);
                if (v10)
                {
                  unsigned int v17 = [v10 index];
                  if (v17 < [v16 index]) {
                    continue;
                  }
                }
                id v18 = objc_alloc_init(MEMORY[0x1E4F25730]);
                unsigned int v19 = [v16 perDaySumERVThreshold];
                id v20 = [v12 daySummary];
                [v20 scoreSum];
                double v22 = v21;

                if (v19 && v22 >= (double)v19)
                {
                  uint64_t v23 = [MEMORY[0x1E4F28EC8] numberWithDouble:v22];
                  [v18 setPerDaySumERVAboveThreshold:v23];
                }
                unsigned int v24 = [v16 perDayMaxERVThreshold];
                id v25 = [v12 daySummary];
                [v25 maximumScore];
                double v27 = v26;

                if (v24 && v27 >= (double)v24)
                {
                  uint64_t v28 = [MEMORY[0x1E4F28EC8] numberWithDouble:v27];
                  [v18 setPerDaySumERVAboveThreshold:v28];
                }
                id v29 = [v16 perDaySumERVThresholdsByDiagnosisReportType];
                uint64_t v30 = [v29 objectForKeyedSubscript:&unk_1F2B35ED8];
                [v30 doubleValue];
                double v32 = v31;

                id v33 = [v12 confirmedTestSummary];
                [v33 scoreSum];
                double v35 = v34;

                if (v32 > 0.0 && v35 >= v32)
                {
                  BOOL v37 = [MEMORY[0x1E4F28EC8] numberWithDouble:v35];
                  [v18 setConfirmedTestPerDaySumERVAboveThreshold:v37];
                }
                uint64_t v38 = [v29 objectForKeyedSubscript:&unk_1F2B35EF0];
                [v38 doubleValue];
                double v40 = v39;

                uint64_t v41 = [v12 confirmedClinicalDiagnosisSummary];
                [v41 scoreSum];
                double v43 = v42;

                if (v40 > 0.0 && v43 >= v40)
                {
                  uint64_t v44 = [MEMORY[0x1E4F28EC8] numberWithDouble:v43];
                  [v18 setClinicalDiagnosisPerDaySumERVAboveThreshold:v44];
                }
                v45 = [v29 objectForKeyedSubscript:&unk_1F2B35F08];
                [v45 doubleValue];
                double v47 = v46;

                id v48 = [v12 recursiveSummary];
                [v48 scoreSum];
                double v50 = v49;

                if (v47 > 0.0 && v50 >= v47)
                {
                  v51 = [MEMORY[0x1E4F28EC8] numberWithDouble:v50];
                  [v18 setRecursivePerDaySumERVAboveThreshold:v51];
                }
                id v52 = [v29 objectForKeyedSubscript:&unk_1F2B35F20];
                [v52 doubleValue];
                double v54 = v53;

                v55 = [v12 selfReportedSummary];
                [v55 scoreSum];
                double v57 = v56;

                if (v54 > 0.0 && v57 >= v54)
                {
                  v58 = [MEMORY[0x1E4F28EC8] numberWithDouble:v57];
                  [v18 setSelfReportPerDaySumERVAboveThreshold:v58];
                }
                unsigned int v59 = [v16 weightedDurationAtAttenuationThreshold];
                v60 = [v12 daySummary];
                [v60 weightedDurationSum];
                double v62 = v61;

                if (v59 && v62 >= (double)v59)
                {
                  v63 = [MEMORY[0x1E4F28EC8] numberWithDouble:v62];
                  [v18 setWeightedDurationAtAttenuationAboveThreshold:v63];
                }
                if ([v18 anyThresholdsExceeded])
                {
                  v64 = [v119 exposureClassification];
                  v65 = [v64 date];

                  if (!v65
                    || ([v12 date],
                        v66 = objc_claimAutoreleasedReturnValue(),
                        [v66 timeIntervalSinceReferenceDate],
                        double v68 = v67,
                        [v65 timeIntervalSinceReferenceDate],
                        double v70 = v69,
                        v66,
                        v68 > v70))
                  {
                    v71 = [v12 date];
                    [v18 setDate:v71];

                    objc_msgSend(v18, "setIndex:", objc_msgSend(v16, "index"));
                    v72 = [v16 classificationName];
                    [v18 setName:v72];

                    [v18 setRegion:v117];
                    id v73 = v16;

                    [v119 setExposureClassification:v18];
                    id v10 = v73;
                  }
                }
              }
              uint64_t v14 = [v118 countByEnumeratingWithState:&v121 objects:v129 count:16];
            }
            while (v14);
          }

          uint64_t v11 = v116 + 1;
        }
        while (v116 + 1 != v115);
        uint64_t v115 = [obj countByEnumeratingWithState:&v125 objects:v130 count:16];
      }
      while (v115);
    }

    v74 = [v119 exposureClassification];
    uint64_t v75 = v111;
    previousExposureClassification = v111->_previousExposureClassification;
    id v77 = v74;
    long long v78 = previousExposureClassification;
    long long v79 = [v77 name];
    long long v80 = [(ENExposureClassification *)v78 name];
    id v81 = v79;
    id v82 = v80;
    id v83 = v82;
    if (v81 == v82)
    {
    }
    else
    {
      v84 = v82;
      id v85 = v81;
      if ((v81 == 0) == (v82 != 0))
      {
LABEL_71:

LABEL_72:
LABEL_73:
        v98 = [v119 statistics];
        id v8 = v109;
        BOOL v6 = v108;
        if (![v98 revokedKeyCount] || (uint64_t v99 = objc_msgSend(v98, "matchedKeyCount"), v77) || v99) {
          uint64_t v97 = 2;
        }
        else {
          uint64_t v97 = 3;
        }
        goto LABEL_78;
      }
      int v86 = [v81 isEqual:v82];

      if (!v86) {
        goto LABEL_72;
      }
    }
    v87 = [v77 region];
    v88 = [(ENExposureClassification *)v78 region];
    id v85 = v87;
    id v89 = v88;
    v84 = v89;
    if (v85 == v89)
    {
    }
    else
    {
      v90 = v89;
      id v91 = v85;
      if ((v85 == 0) == (v89 != 0))
      {
LABEL_69:

LABEL_70:
        uint64_t v75 = v111;
        goto LABEL_71;
      }
      int v92 = [v85 isEqual:v89];

      if (!v92) {
        goto LABEL_70;
      }
    }
    v93 = [v77 date];
    v94 = [(ENExposureClassification *)v78 date];
    id v91 = v93;
    id v95 = v94;
    if (v91 == v95)
    {

      uint64_t v97 = 1;
      v98 = v77;
      id v8 = v109;
      BOOL v6 = v108;
      uint64_t v75 = v111;
LABEL_78:

LABEL_79:
      [v119 setExposureClassificationStatus:v97];
      v100 = [v77 name];
      [(ENExposureDetectionHistorySession *)v75->_historySession setExposureClassificationIdentifier:v100];

      v101 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v102 = [v101 isSensitiveLoggingAllowed];

      if (v102)
      {
        if (gLogCategory_ENExposureDetectionDaemonSession <= 30)
        {
          if (gLogCategory_ENExposureDetectionDaemonSession != -1 || (uint64_t v103 = _LogCategory_Initialize(), v103))
          {
            v104 = __70__ENExposureDetectionDaemonSession__classifyExposureWithResult_error___block_invoke(v103, v75->_previousExposureClassification);
            v105 = [v119 exposureClassification];
            v107 = __70__ENExposureDetectionDaemonSession__classifyExposureWithResult_error___block_invoke((uint64_t)v105, v105);
            LogPrintF_safe();
          }
        }
      }

      char v9 = v110;
      goto LABEL_85;
    }
    v90 = v95;
    if ((v91 == 0) != (v95 != 0))
    {
      char v96 = [v91 isEqual:v95];

      uint64_t v75 = v111;
      if (v96)
      {
        uint64_t v97 = 1;
        id v8 = v109;
        BOOL v6 = v108;
        goto LABEL_79;
      }
      goto LABEL_73;
    }

    goto LABEL_69;
  }
  BOOL v6 = 1;
LABEL_89:

  return v6;
}

__CFString *__70__ENExposureDetectionDaemonSession__classifyExposureWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F29020];
    id v3 = a2;
    id v4 = [v3 region];
    uint64_t v5 = [v3 name];
    BOOL v6 = [v3 date];

    uint64_t v7 = [v2 stringWithFormat:@"%@ (%@) %@", v4, v5, v6];
  }
  else
  {
    uint64_t v7 = @"<none>";
  }

  return v7;
}

- (id)getAnalysisSessionAndReturnError:(id *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ENExposureDetectionDaemonSession_getAnalysisSessionAndReturnError___block_invoke;
  block[3] = &unk_1E69ACD50;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __69__ENExposureDetectionDaemonSession_getAnalysisSessionAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getAnalysisSessionAndReturnError:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_getAnalysisSessionAndReturnError:(id *)a3
{
  if ([(ENExposureDetectionDaemonSession *)self _checkFinishedAndReturnError:a3])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F25760]);
    [v4 setConfiguration:self->_sessionExposureConfiguration];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)getBeaconCountMetricsAndReturnError:(id *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ENExposureDetectionDaemonSession_getBeaconCountMetricsAndReturnError___block_invoke;
  block[3] = &unk_1E69ACD50;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __72__ENExposureDetectionDaemonSession_getBeaconCountMetricsAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getBeaconCountMetricsAndReturnError:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_getBeaconCountMetricsAndReturnError:(id *)a3
{
  if (-[ENExposureDetectionDaemonSession _checkFinishedAndReturnError:](self, "_checkFinishedAndReturnError:"))
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C0] date];
    BOOL v6 = [v5 dateByAddingTimeInterval:-86400.0];
    uint64_t v7 = [(ENAdvertisementDatabaseQuerySession *)self->_advertisementDatabaseQuerySession beaconCountMetricsWithStartDate:v6 endDate:v5 windowDuration:a3 error:900.0];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)getSummaryAndReturnError:(id *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ENExposureDetectionDaemonSession_getSummaryAndReturnError___block_invoke;
  block[3] = &unk_1E69ACD50;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __61__ENExposureDetectionDaemonSession_getSummaryAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getSummaryAndReturnError:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_getSummaryAndReturnError:(id *)a3
{
  v99[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(ENExposureDetectionDaemonSession *)self _getAnalysisSessionAndReturnError:a3];
  double v57 = v4;
  if (v4)
  {
    v58 = [v4 configuration];
    v99[0] = 0;
    v99[1] = 0;
    v97[0] = 0;
    v97[1] = v97;
    v97[2] = 0x2020000000;
    v97[3] = v99;
    uint64_t v5 = [v58 daysSinceLastExposureThreshold];
    uint64_t v93 = 0;
    v94 = &v93;
    uint64_t v95 = 0x2020000000;
    uint64_t v96 = 0;
    id v56 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
    unint64_t v6 = [(ENExposureDetectionDaemonSessionStatistics *)self->_statistics matchedKeyCount];
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    uint64_t v92 = 0;
    char v7 = [v58 minimumRiskScore];
    [v58 minimumRiskScoreFullRange];
    uint64_t v9 = v8;
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    int v86 = &v85;
    uint64_t v87 = 0x2020000000;
    char v88 = 0;
    uint64_t v81 = 0;
    id v82 = (double *)&v81;
    uint64_t v83 = 0x2020000000;
    uint64_t v77 = 0;
    long long v78 = (double *)&v77;
    uint64_t v79 = 0x2020000000;
    uint64_t v80 = 0;
    uint64_t v73 = 0;
    v74 = (double *)&v73;
    uint64_t v75 = 0x2020000000;
    uint64_t v76 = 0;
    double Current = CFAbsoluteTimeGetCurrent();
    exposureCalculationSession = self->_exposureCalculationSession;
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __62__ENExposureDetectionDaemonSession__getSummaryAndReturnError___block_invoke;
    v71[3] = &unk_1E69ACEB0;
    v71[6] = &v77;
    v71[7] = &v93;
    char v72 = v7;
    *(double *)&v71[14] = Current;
    v71[15] = v9;
    v71[8] = &v89;
    v71[9] = &v85;
    v71[10] = &v81;
    v71[11] = &v73;
    v71[12] = v97;
    v71[13] = v5;
    void v71[4] = v57;
    v71[5] = v56;
    [(ENExposureCalculationSession *)exposureCalculationSession enumerateCachedExposureInfo:v71];
    id v55 = objc_alloc_init(MEMORY[0x1E4F25768]);
    if (([v58 flags] & 2) != 0)
    {
      uint64_t v14 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v15 = [v14 isSensitiveLoggingAllowed];

      if (v15
        && gLogCategory_ENExposureDetectionDaemonSession <= 30
        && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v42 = [v56 count];
        double v46 = v58;
        LogPrintF_safe();
      }
      objc_msgSend(v56, "allValues", v42, v46);
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [obj countByEnumeratingWithState:&v67 objects:v98 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v68 != v24) {
              objc_enumerationMutation(obj);
            }
            double v26 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            objc_msgSend(v26, "roundDurations", v45, v49);
            uint64_t v61 = 0;
            double v62 = &v61;
            uint64_t v63 = 0x3032000000;
            v64 = __Block_byref_object_copy__2;
            v65 = __Block_byref_object_dispose__2;
            id v66 = 0;
            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __62__ENExposureDetectionDaemonSession__getSummaryAndReturnError___block_invoke_2;
            v60[3] = &unk_1E69ACED8;
            v60[4] = &v61;
            double v27 = (void (**)(void, void, void))MEMORY[0x1D9439FF0](v60);
            uint64_t v28 = [v26 daySummary];
            ((void (**)(void, const char *, void *))v27)[2](v27, "Overall", v28);

            id v29 = [v26 confirmedTestSummary];
            ((void (**)(void, const char *, void *))v27)[2](v27, ", CTest", v29);

            uint64_t v30 = [v26 confirmedClinicalDiagnosisSummary];
            ((void (**)(void, const char *, void *))v27)[2](v27, ", CClin", v30);

            double v31 = [v26 recursiveSummary];
            ((void (**)(void, const char *, void *))v27)[2](v27, ", Recur", v31);

            double v32 = [v26 selfReportedSummary];
            ((void (**)(void, const char *, void *))v27)[2](v27, ", SelfR", v32);

            id v33 = +[ENLoggingPrefs sharedENLoggingPrefs];
            LODWORD(v26) = [v33 isSensitiveLoggingAllowed];

            if (v26
              && gLogCategory_ENExposureDetectionDaemonSession <= 30
              && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
            {
              uint64_t v45 = v62[5];
              double v49 = v58;
              LogPrintF_safe();
            }

            _Block_object_dispose(&v61, 8);
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v67 objects:v98 count:16];
        }
        while (v23);
      }

      id v20 = obj;
      [v55 setDaySummaries:obj];
    }
    else
    {
      double v12 = v78[3];
      if (v12 <= 0.0) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = (uint64_t)((Current - v12) / 86400.0);
      }
      NSAppendPrintF_safe();
      id v16 = 0;
      for (uint64_t j = 0; j != 16; j += 4)
      {
        if (j) {
          id v18 = ", ";
        }
        else {
          id v18 = "";
        }
        double v43 = v18;
        uint64_t v47 = *(unsigned int *)((char *)v99 + j);
        NSAppendPrintF_safe();
        id v19 = v16;

        id v16 = v19;
      }
      NSAppendPrintF_safe();
      id v20 = v19;

      double v21 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v22 = [v21 isSensitiveLoggingAllowed];

      if (v22
        && gLogCategory_ENExposureDetectionDaemonSession <= 30
        && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
      {
        id v53 = v20;
        double v54 = v58;
        uint64_t v51 = v90[3];
        uint64_t v52 = v94[3];
        uint64_t v48 = v13;
        uint64_t v50 = *((unsigned __int8 *)v86 + 24);
        unint64_t v44 = v6;
        LogPrintF_safe();
      }
      double v34 = objc_msgSend(v58, "attenuationDurationThresholds", v44, v48, v50, v51, v52, v53, v54);
      if ((unint64_t)([v34 count] + 1) > 3)
      {
        uint64_t v37 = 4;
      }
      else
      {
        double v35 = [v58 attenuationDurationThresholds];
        uint64_t v36 = [v35 count];

        uint64_t v37 = v36 + 1;
      }

      uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA40]) initWithCapacity:v37];
      if (v37)
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          double v40 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInt:60 * ((*((_DWORD *)v99 + k) + 59) / 0x3Cu)];
          [v38 setObject:v40 atIndexedSubscript:k];
        }
      }
      [v55 setAttenuationDurations:v38];
      [v55 setDaysSinceLastExposure:v13];
      [v55 setMatchedKeyCount:v6];
      [v55 setMaximumRiskScore:*((unsigned __int8 *)v86 + 24)];
      [v55 setMaximumRiskScoreFullRange:v82[3]];
      [v55 setRiskScoreSumFullRange:v74[3]];
    }
    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(&v77, 8);
    _Block_object_dispose(&v81, 8);
    _Block_object_dispose(&v85, 8);
    _Block_object_dispose(&v89, 8);

    _Block_object_dispose(&v93, 8);
    _Block_object_dispose(v97, 8);
  }
  else
  {
    id v55 = 0;
  }

  return v55;
}

void __62__ENExposureDetectionDaemonSession__getSummaryAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    id v37 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "date", v35, *(void *)&v36);
        [v9 timeIntervalSinceReferenceDate];
        double v11 = v10;
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        if (v10 > *(double *)(v12 + 24)) {
          *(double *)(v12 + 24) = v10;
        }
        if (*(uint64_t *)(a1 + 104) >= 1)
        {
          uint64_t v13 = [v8 date];
          uint64_t v14 = v13;
          if (v13)
          {
            double v15 = *(double *)(a1 + 112);
            [v13 timeIntervalSinceReferenceDate];
            double v17 = v15 - v16;
            if (v17 > 9.22337204e18) {
              double v17 = 9.22337204e18;
            }
            double v18 = v17 >= 0.0 ? v17 / 86400.0 : 0.0;
            if (*(void *)(a1 + 104) < (uint64_t)v18)
            {
              ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

              goto LABEL_47;
            }
          }
        }
        char v38 = 0;
        [*(id *)(a1 + 32) estimateRiskWithExposureInfo:v8 referenceTime:0 transmissionRiskLevel:&v38 skip:*(double *)(a1 + 112)];
        if (!v38)
        {
          double v20 = v19;
          double v21 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v22 = [v21 isSensitiveLoggingAllowed];

          if (v22
            && gLogCategory_ENExposureDetectionDaemonSession <= 10
            && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
          {
            double v36 = v20;
            double v35 = v8;
            LogPrintF_safe();
          }
          if (v20 <= 255.0) {
            double v23 = v20;
          }
          else {
            double v23 = 255.0;
          }
          if (v23 < 0.0) {
            double v23 = 0.0;
          }
          unsigned int v24 = (int)v23;
          if (*(unsigned __int8 *)(a1 + 128) <= (int)v23 && v20 >= *(double *)(a1 + 120))
          {
            uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
            if (*(unsigned __int8 *)(v25 + 24) < v24) {
              *(unsigned char *)(v25 + 24) = v24;
            }
            uint64_t v26 = *(void *)(*(void *)(a1 + 80) + 8);
            if (v20 > *(double *)(v26 + 24)) {
              *(double *)(v26 + 24) = v20;
            }
            *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v20
                                                                        + *(double *)(*(void *)(*(void *)(a1 + 88)
                                                                                                + 8)
                                                                                    + 24);
            double v27 = objc_msgSend(v8, "attenuationDurations", v35, *(void *)&v36);
            if ((unint64_t)[v27 count] >= 4)
            {
              for (uint64_t j = 0; j != 4; ++j)
              {
                unsigned int v29 = *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + 4 * j);
                if (v29 <= 0x707)
                {
                  uint64_t v30 = [v27 objectAtIndexedSubscript:j];
                  unsigned int v31 = [v30 unsignedIntValue] + v29;

                  if (v31 >= 0x708) {
                    int v32 = 1800;
                  }
                  else {
                    int v32 = v31;
                  }
                  *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + 4 * j) = v32;
                }
              }
            }
            id v33 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInt:(v11 / 86400.0)];
            id v34 = [*(id *)(a1 + 40) objectForKeyedSubscript:v33];
            if (!v34)
            {
              id v34 = objc_alloc_init(MEMORY[0x1E4F25740]);
              [v34 setDate:v9];
              [*(id *)(a1 + 40) setObject:v34 forKeyedSubscript:v33];
            }
            [*(id *)(a1 + 32) updateDaySummary:v34 exposureInfo:v8 score:v20];

            id v3 = v37;
          }
          else
          {
            ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          }
        }
LABEL_47:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v5);
  }
}

void __62__ENExposureDetectionDaemonSession__getSummaryAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v3 + 40);
    id v4 = a3;
    [v4 scoreSum];
    [v4 maximumScore];
    [v4 weightedDurationSum];

    NSAppendPrintF_safe();
    objc_storeStrong((id *)(v3 + 40), obj);
  }
}

- (id)_prepareExposureCalculationSessionWithError:(id *)a3
{
  p_exposureCalculationSession = &self->_exposureCalculationSession;
  exposureCalculationSession = self->_exposureCalculationSession;
  if (exposureCalculationSession)
  {
    uint64_t v5 = exposureCalculationSession;
    goto LABEL_19;
  }
  if (-[ENExposureDetectionDaemonSession _checkPreparedAndReturnError:](self, "_checkPreparedAndReturnError:"))
  {
    uint64_t v8 = self->_sessionExposureConfiguration;
    if (!v8)
    {
      if (a3)
      {
        ENErrorF();
        uint64_t v5 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v5 = 0;
      }
      goto LABEL_18;
    }
    uint64_t v9 = self->_advertisementDatabaseQuerySession;
    double v10 = v9;
    if (v9)
    {
      unsigned int v21 = [(ENAdvertisementDatabaseQuerySession *)v9 storedAdvertisementCount];
      if (!self->_useCache
        || [(ENExposureDatabase *)self->_exposureDatabase getAdvertisementCount:&v21 error:a3])
      {
        double v11 = [ENExposureCalculationSession alloc];
        uint64_t v12 = [(ENAdvertisementDatabaseQuerySession *)v10 attenuationThreshold];
        uint64_t v13 = [(ENExposureCalculationSession *)v11 initWithAttenuationThreshold:v12 capacity:v21];
        if (v13)
        {
          [(ENRegionServerConfiguration *)self->_regionServerConfiguration rpiDuplicateAdvertisementTolerance];
          if (v14 == 0.0) {
            double v15 = 1200.0;
          }
          else {
            double v15 = v14;
          }
          unsigned int v16 = [(ENRegionServerConfiguration *)self->_regionServerConfiguration numberOfAdvSamplesForRPIThreshold];
          if (v16 <= 1) {
            uint64_t v17 = 1;
          }
          else {
            uint64_t v17 = v16;
          }
          [(ENExposureCalculationSession *)v13 setAllowRecursiveReportType:([(ENExposureConfiguration *)v8 flags] >> 2) & 1];
          [(ENExposureCalculationSession *)v13 setExposureConfiguration:v8];
          double v18 = [MEMORY[0x1E4F28EC8] numberWithDouble:v15];
          [(ENExposureCalculationSession *)v13 setAllowedRPIBroadcastDuration:v18];

          double v19 = [MEMORY[0x1E4F28EC8] numberWithUnsignedInt:v17];
          [(ENExposureCalculationSession *)v13 setAdvertisementSampleCountThreshold:v19];

          [(ENExposureCalculationSession *)v13 setCacheExposureInfo:1];
          [(ENExposureCalculationSession *)v13 setCacheExposureWindows:1];
          objc_storeStrong((id *)p_exposureCalculationSession, v13);
          uint64_t v5 = self->_exposureCalculationSession;
        }
        else if (a3)
        {
          ENErrorF();
          uint64_t v5 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v5 = 0;
        }

        goto LABEL_17;
      }
    }
    else if (a3)
    {
      ENErrorF();
      uint64_t v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    uint64_t v5 = 0;
    goto LABEL_17;
  }
  uint64_t v5 = 0;
LABEL_19:

  return v5;
}

- (void)_updateStatisticsWithHandler:(id)a3
{
  uint64_t v9 = (void (**)(id, ENExposureDetectionDaemonSessionStatistics *))a3;
  id v4 = self->_statistics;
  uint64_t v5 = v4;
  if (self->_shouldCopyStatistics)
  {
    uint64_t v6 = [(ENExposureDetectionDaemonSessionStatistics *)v4 copy];

    uint64_t v5 = (ENExposureDetectionDaemonSessionStatistics *)v6;
  }
  v9[2](v9, v5);
  statistics = self->_statistics;
  self->_statistics = v5;
  uint64_t v8 = v5;

  self->_shouldCopyStatistics = 0;
  [(ENExposureDetectionHistorySession *)self->_historySession setMatchCount:[(ENExposureDetectionDaemonSessionStatistics *)v8 matchedKeyCount]];
  [(ENExposureDetectionHistorySession *)self->_historySession setFileCount:[(ENExposureDetectionDaemonSessionStatistics *)v8 processedFileCount]];
}

- (ENExposureDetectionDaemonSessionStatistics)statistics
{
  self->_shouldCopyStatistics = 1;
  return self->_statistics;
}

- (void)_signpostBegin
{
  if (!self->_signpostID)
  {
    uint64_t v3 = LogCategoryCopyOSLogHandle();
    self->_os_signpost_id_t signpostID = os_signpost_id_generate(v3);
    id v4 = v3;
    uint64_t v5 = v4;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)char v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D39E9000, v5, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "ExposureDetectionSession", "", v7, 2u);
    }
  }
}

- (void)_signpostEnd
{
  if (self->_signpostID)
  {
    uint64_t v3 = LogCategoryCopyOSLogHandle();
    id v4 = v3;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D39E9000, v4, OS_SIGNPOST_INTERVAL_END, signpostID, "ExposureDetectionSession", "", v6, 2u);
    }

    self->_os_signpost_id_t signpostID = 0;
  }
}

- (id)description
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v2);
  NSAppendPrintF_safe();
  id v3 = 0;

  return v3;
}

- (BOOL)skipFileSigningVerification
{
  return self->_skipFileSigningVerification;
}

- (void)setSkipFileSigningVerification:(BOOL)a3
{
  self->_skipFileSigningVerification = a3;
}

- (ENExposureCalculationSession)exposureCalculationSession
{
  return self->_exposureCalculationSession;
}

- (ENAdvertisementDatabaseQuerySession)advertisementDatabaseQuerySession
{
  return self->_advertisementDatabaseQuerySession;
}

- (void)setAdvertisementDatabaseQuerySession:(id)a3
{
}

- (ENXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (ENExposureConfiguration)clientExposureConfiguration
{
  return self->_clientExposureConfiguration;
}

- (void)setClientExposureConfiguration:(id)a3
{
}

- (ENExposureDatabase)exposureDatabase
{
  return self->_exposureDatabase;
}

- (void)setExposureDatabase:(id)a3
{
}

- (ENExposureClassification)previousExposureClassification
{
  return self->_previousExposureClassification;
}

- (void)setPreviousExposureClassification:(id)a3
{
}

- (ENRegionConfiguration)regionConfiguration
{
  return self->_regionConfiguration;
}

- (void)setRegionConfiguration:(id)a3
{
}

- (ENRegionServerConfiguration)regionServerConfiguration
{
  return self->_regionServerConfiguration;
}

- (void)setRegionServerConfiguration:(id)a3
{
}

- (ENRegionServerExposureConfiguration)serverExposureConfiguration
{
  return self->_serverExposureConfiguration;
}

- (void)setServerExposureConfiguration:(id)a3
{
}

- (NSDate)sessionDate
{
  return self->_sessionDate;
}

- (void)setSessionDate:(id)a3
{
}

- (ENExposureDetectionHistorySession)historySession
{
  return self->_historySession;
}

- (ENExposureConfiguration)sessionExposureConfiguration
{
  return self->_sessionExposureConfiguration;
}

- (unint64_t)tekMatchBatchSize
{
  return self->_tekMatchBatchSize;
}

- (void)setTekMatchBatchSize:(unint64_t)a3
{
  self->_tekMatchBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionExposureConfiguration, 0);
  objc_storeStrong((id *)&self->_historySession, 0);
  objc_storeStrong((id *)&self->_sessionDate, 0);
  objc_storeStrong((id *)&self->_serverExposureConfiguration, 0);
  objc_storeStrong((id *)&self->_regionServerConfiguration, 0);
  objc_storeStrong((id *)&self->_regionConfiguration, 0);
  objc_storeStrong((id *)&self->_previousExposureClassification, 0);
  objc_storeStrong((id *)&self->_exposureDatabase, 0);
  objc_storeStrong((id *)&self->_clientExposureConfiguration, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_advertisementDatabaseQuerySession, 0);
  objc_storeStrong((id *)&self->_exposureCalculationSession, 0);
  objc_storeStrong((id *)&self->_statistics, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end