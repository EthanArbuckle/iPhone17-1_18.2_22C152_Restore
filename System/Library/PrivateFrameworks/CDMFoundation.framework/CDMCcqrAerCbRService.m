@interface CDMCcqrAerCbRService
+ (BOOL)isEnabled;
+ (BOOL)suppressCcqrUsingCurContext:(id)a3;
+ (id)getCDMServiceAssetConfig;
+ (void)CcqrAerCbRServiceLogInitIfNeeded;
- (BOOL)skipServiceSetup;
- (BOOL)useMemoryForOverrideStore;
- (QueryRewriter)ccqrPredictor;
- (id)createSetupResponseWithError:(id)a3;
- (id)doInference:(id)a3 status:(id *)a4;
- (id)getPredictor:(id)a3 FilesPath:(id)a4 modelType:(id)a5 status:(id *)a6;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)match:(id)a3;
- (id)setup:(id)a3;
- (id)warmup:(id)a3;
- (int)modelType;
- (void)configureUseMemoryForOverrideStore;
- (void)debugCcqrResponse:(id)a3;
- (void)setCcqrPredictor:(id)a3;
- (void)setUseMemoryForOverrideStore:(BOOL)a3;
@end

@implementation CDMCcqrAerCbRService

- (id)handleRequestCommandTypeNames
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[CDMBaseCommand commandName];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v2 setWithArray:v4];

  return v5;
}

+ (BOOL)isEnabled
{
  return +[CDMFeatureFlags isCcqrAerCbrEnabled];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ccqrPredictor, 0);
  objc_storeStrong((id *)&self->_overrideProxy, 0);
  objc_storeStrong((id *)&self->_nlAsset, 0);
}

- (void)setUseMemoryForOverrideStore:(BOOL)a3
{
  self->_useMemoryForOverrideStore = a3;
}

- (BOOL)useMemoryForOverrideStore
{
  return self->_useMemoryForOverrideStore;
}

- (void)setCcqrPredictor:(id)a3
{
}

- (QueryRewriter)ccqrPredictor
{
  return self->_ccqrPredictor;
}

- (int)modelType
{
  return self->_modelType;
}

- (BOOL)skipServiceSetup
{
  v2 = objc_alloc_init(NLRouterExperimentTrialController);
  if (AFDeviceSupportsSAE()
    && +[CDMCcqrServiceUtils isNLRouterAssetAvailable])
  {
    BOOL v3 = ![(NLRouterExperimentTrialController *)v2 suppressRewrite];
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (id)doInference:(id)a3 status:(id *)a4
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = [(QueryRewriter *)v7->_ccqrPredictor predictWithInput:v6 status:a4];
  objc_sync_exit(v7);

  return v8;
}

- (id)getPredictor:(id)a3 FilesPath:(id)a4 modelType:(id)a5 status:(id *)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  self->_modelType = 1;
  id v10 = a4;
  id v11 = a3;
  if ([a5 isEqualToString:@"JointCCQR"]) {
    self->_modelType = 4;
  }
  v12 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (self->_modelType == 1) {
      v15 = @"AER";
    }
    else {
      v15 = @"AER + CBR";
    }
    int v16 = 136315394;
    v17 = "-[CDMCcqrAerCbRService getPredictor:FilesPath:modelType:status:]";
    __int16 v18 = 2112;
    v19 = v15;
    _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s CCQR initialized with %@ functionality", (uint8_t *)&v16, 0x16u);
  }

  v13 = (void *)[objc_alloc(MEMORY[0x263F53FD8]) initWithLocale:v11 filesPath:v10 predictorType:self->_modelType status:a6];
  return v13;
}

- (void)configureUseMemoryForOverrideStore
{
}

- (void)debugCcqrResponse:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 rewriteHypothesesCount];
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315394;
    v15 = "-[CDMCcqrAerCbRService debugCcqrResponse:]";
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s CcqrAerCbR: Generated %lu rewrite hypotheses.", (uint8_t *)&v14, 0x16u);
  }

  if (v4)
  {
    id v6 = [v3 rewriteHypothesesAtIndex:0];
    int v7 = [v6 rewriteType];

    v8 = CDMOSLoggerForCategory(0);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
      {
        int v14 = 136315138;
        v15 = "-[CDMCcqrAerCbRService debugCcqrResponse:]";
        id v10 = "%s Reference Resolution";
LABEL_13:
        _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, 0xCu);
      }
    }
    else if (v9)
    {
      int v14 = 136315138;
      v15 = "-[CDMCcqrAerCbRService debugCcqrResponse:]";
      id v10 = "%s Correction by Repetition";
      goto LABEL_13;
    }

    id v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v3 rewriteHypothesesAtIndex:0];
      v13 = [v12 utterance];
      int v14 = 136315394;
      v15 = "-[CDMCcqrAerCbRService debugCcqrResponse:]";
      __int16 v16 = 2112;
      uint64_t v17 = (uint64_t)v13;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Rewritten Utterance: %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (id)handle:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    __int16 v16 = v5;
    uint64_t v17 = [v4 qrRequest];
    *(_DWORD *)buf = 136315650;
    uint64_t v20 = "-[CDMCcqrAerCbRService handle:]";
    __int16 v21 = 2112;
    v22 = @"queryrewrite";
    __int16 v23 = 2112;
    v24 = v17;
    _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nQUERYREWRITEQRRequest: %@", buf, 0x20u);
  }
  id v6 = self;
  objc_sync_enter(v6);
  if (v6->_ccqrPredictor)
  {
    objc_sync_exit(v6);

    int v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = "-[CDMCcqrAerCbRService handle:]";
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Calling CCQR (AER & CbR)", buf, 0xCu);
    }

    v8 = [v4 qrRequest];
    uint64_t v9 = +[CDMCcqrServiceUtils leftShiftSiriResponse:v8];

    id v18 = 0;
    id v10 = [(CDMCcqrAerCbRService *)v6 doInference:v9 status:&v18];
    id v11 = v18;
    [(CDMCcqrAerCbRService *)v6 debugCcqrResponse:v10];
    v12 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "-[CDMCcqrAerCbRService handle:]";
      __int16 v21 = 2112;
      v22 = @"queryrewrite";
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nQUERYREWRITEQRResponse: %@", buf, 0x20u);
    }
    v13 = [[CDMQRResponseCommand alloc] initWithResponse:v10];

    id v6 = (CDMCcqrAerCbRService *)v9;
  }
  else
  {
    int v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = "-[CDMCcqrAerCbRService handle:]";
      _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: CCQR (AER & CbR): Predictor not initialized!", buf, 0xCu);
    }

    objc_sync_exit(v6);
    v13 = 0;
  }

  return v13;
}

- (id)match:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = [(SiriNLUOverrideProxy *)self->_overrideProxy matchWithInputs:a3 overrideNamespace:2];
  v5 = v4;
  if (!v4 || ![v4 hasCcqrOverrideTemplate]) {
    goto LABEL_18;
  }
  id v6 = [v5 ccqrOverrideTemplate];
  if (([v6 hasRewriteMessage] & 1) == 0) {
    goto LABEL_17;
  }
  int v7 = [v5 ccqrOverrideTemplate];
  v8 = [v7 rewriteMessage];
  if (([v8 hasRewriteType] & 1) == 0)
  {

LABEL_17:
    goto LABEL_18;
  }
  uint64_t v9 = [v5 ccqrOverrideTemplate];
  id v10 = [v9 rewriteMessage];
  int v11 = [v10 hasRewrittenUtterance];

  if (v11)
  {
    v12 = [[CDMQRResponseCommand alloc] initWithResponse:0];
    v13 = [v5 ccqrOverrideTemplate];
    int v14 = [v13 rewriteMessage];
    v15 = [v14 rewrittenUtterance];

    __int16 v16 = [(CDMCcqrAerCbROverridesProxy *)self->_overrideProxy getRewriteHypothesisWithOverrideUtterance:v15];
    uint64_t v17 = v16;
    if (v16)
    {
      id v18 = [v16 utterance];
      char v19 = [v18 isEqualToString:&stru_26DA24FF0];

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = [v5 ccqrOverrideTemplate];
        __int16 v21 = [v20 rewriteMessage];
        uint64_t v22 = [v21 rewriteType];

        if (v22)
        {
          if (v22 != 1)
          {
            if (v22 != 2)
            {
              v28 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v30 = "-[CDMCcqrAerCbRService match:]";
                _os_log_error_impl(&dword_2263A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: CCQR override did not find the correct rewrite type", buf, 0xCu);
              }

              v26 = 0;
              goto LABEL_15;
            }
            uint64_t v22 = 0;
          }
          [v17 setRewriteType:v22];
        }
        id v23 = objc_alloc_init(MEMORY[0x263F71EB0]);
        v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v17, 0);
        [v23 setRewriteHypotheses:v24];

        uint64_t v25 = [[CDMQRResponseCommand alloc] initWithResponse:v23];
        v12 = v25;
      }
    }
    v12 = v12;
    v26 = v12;
LABEL_15:

    goto LABEL_19;
  }
LABEL_18:
  v26 = 0;
LABEL_19:

  return v26;
}

- (id)setup:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v59 = "-[CDMCcqrAerCbRService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up CCQR (AER & CbR) service", buf, 0xCu);
  }

  +[CDMCcqrAerCbRService CcqrAerCbRServiceLogInitIfNeeded];
  if (![(CDMCcqrAerCbRService *)self skipServiceSetup])
  {
    uint64_t v9 = [v4 dynamicConfig];
    id v10 = [v9 getAssetForFactorName:@"com.apple.siri.nl.marrs.ccqr"];
    nlAsset = self->_nlAsset;
    self->_nlAsset = v10;

    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v48 = self->_nlAsset;
      *(_DWORD *)buf = 136315650;
      v59 = "-[CDMCcqrAerCbRService setup:]";
      __int16 v60 = 2112;
      v61 = v48;
      __int16 v62 = 2112;
      v63 = @"com.apple.siri.nl.marrs.ccqr";
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Asset is: [%@] for factor: %@.", buf, 0x20u);
    }

    v56 = [(NLAsset *)self->_nlAsset getAssetMetadata];
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v49 = [v56 description];
      *(_DWORD *)buf = 136315394;
      v59 = "-[CDMCcqrAerCbRService setup:]";
      __int16 v60 = 2112;
      v61 = v49;
      _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s CCQRAerCbR Asset Metadata: %@", buf, 0x16u);
    }
    int v14 = [v4 dynamicConfig];
    v15 = [v14 getAssetBundlePathForFactorName:@"com.apple.siri.nl.marrs.ccqr"];

    if (v15)
    {
      __int16 v16 = self;
      objc_sync_enter(v16);
      uint64_t v17 = [v4 dynamicConfig];
      id v18 = [v17 languageCode];
      char v19 = [v15 resourcePath];
      uint64_t v20 = [v56 objectForKey:@"modelType"];
      id v57 = 0;
      uint64_t v21 = [(CDMCcqrAerCbRService *)v16 getPredictor:v18 FilesPath:v19 modelType:v20 status:&v57];
      id v22 = v57;
      ccqrPredictor = v16->_ccqrPredictor;
      v16->_ccqrPredictor = (QueryRewriter *)v21;

      if (v22)
      {
        v24 = [v22 localizedDescription];
        int v7 = [(CDMBaseService *)v16 createErrorWithCode:1 description:v24];

        v16->super.super._serviceState = 4;
        uint64_t v25 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v59 = "-[CDMCcqrAerCbRService setup:]";
          _os_log_impl(&dword_2263A0000, v25, OS_LOG_TYPE_INFO, "%s CCQR (AER & CbR) model Disabled", buf, 0xCu);
        }
      }
      else
      {
        v16->super.super._serviceState = 2;
        uint64_t v25 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v59 = "-[CDMCcqrAerCbRService setup:]";
          _os_log_impl(&dword_2263A0000, v25, OS_LOG_TYPE_INFO, "%s CCQR (AER & CbR) model loaded", buf, 0xCu);
        }
        int v7 = 0;
      }

      objc_sync_exit(v16);
    }
    else
    {
      int v7 = [(CDMBaseService *)self createErrorWithCode:1 description:@"Not able to find Siri CCQR (AER & CbR) model bundle directory"]);
      self->super.super._serviceState = 4;
    }
    if (!+[CDMFeatureFlags isTrieOverridesEnabled]) {
      goto LABEL_48;
    }
    v26 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v59 = "-[CDMCcqrAerCbRService setup:]";
      _os_log_debug_impl(&dword_2263A0000, v26, OS_LOG_TYPE_DEBUG, "%s Trie Overrides FF Enabled, CCQR loading override trie bundle", buf, 0xCu);
    }

    v27 = [v4 dynamicConfig];
    v28 = [v27 getAssetBundlePathForFactorName:@"com.apple.siri.nl.overrides"];

    if (!v28)
    {
      uint64_t v47 = [(CDMBaseService *)self createErrorWithCode:1 description:@"Unable to find CCQR Trie Overrides assets from overrides namespace"];

      self->super.super._serviceState = 4;
      int v7 = (void *)v47;
      goto LABEL_48;
    }
    v29 = [v28 resourcePath];
    v54 = [v29 stringByAppendingPathComponent:@"trie_bundle"];

    v30 = [v15 resourcePath];
    v55 = [v30 stringByAppendingPathComponent:@"trie_bundle"];

    uint64_t v31 = [MEMORY[0x263F08850] defaultManager];
    int v32 = [v31 fileExistsAtPath:v54];
    uint64_t v33 = [v31 fileExistsAtPath:v55];
    if (!v32)
    {
      v8 = [(CDMCcqrAerCbRService *)self createSetupResponseWithError:v7];
      int v46 = 1;
      goto LABEL_47;
    }
    v8 = v33;
    v34 = self;
    objc_sync_enter(v34);
    v35 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v59 = "-[CDMCcqrAerCbRService setup:]";
      _os_log_impl(&dword_2263A0000, v35, OS_LOG_TYPE_INFO, "%s Trie overrides: CCQR service detects global overrides assets factor has trie bundle, getting the shared trie overrides store", buf, 0xCu);
    }

    v36 = [[_TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy alloc] initWithUseTrie:1 useMemory:v34->_useMemoryForOverrideStore templatePattern:0];
    overrideProxy = v34->_overrideProxy;
    v34->_overrideProxy = v36;

    if (v8)
    {
      os_signpost_id_t v38 = os_signpost_id_generate((os_log_t)CDMLogContext);
      v39 = (id)CDMCcqrAerCbRServiceLogContext;
      v40 = v39;
      os_signpost_id_t spid = v38;
      unint64_t v41 = v38 - 1;
      if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v40, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Load Trie Overrides", "", buf, 2u);
      }

      v42 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v59 = "-[CDMCcqrAerCbRService setup:]";
        _os_log_impl(&dword_2263A0000, v42, OS_LOG_TYPE_INFO, "%s Trie overrides initializing CCQR component overrides from ccqr bundle", buf, 0xCu);
      }

      BOOL v43 = [(SiriNLUOverrideProxy *)v34->_overrideProxy loadComponentOverrideTrieStoreWithTrieFilePath:v55];
      v44 = (id)CDMCcqrAerCbRServiceLogContext;
      v45 = v44;
      if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v45, OS_SIGNPOST_INTERVAL_END, spid, "Load Trie Overrides", "", buf, 2u);
      }

      if (!v43)
      {
        v50 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v59 = "-[CDMCcqrAerCbRService setup:]";
          _os_log_impl(&dword_2263A0000, v50, OS_LOG_TYPE_INFO, "%s Trie Overrides: Fail to load CCQR Trie overrides bundle", buf, 0xCu);
        }

        uint64_t v51 = [(CDMBaseService *)v34 createErrorWithCode:1 description:@"Unable to initialize CCQR component override from trie assets"];

        v34->super.super._serviceState = 4;
        v8 = [(CDMCcqrAerCbRService *)v34 createSetupResponseWithError:v51];
        int v46 = 1;
        int v7 = (void *)v51;
        goto LABEL_46;
      }
      v8 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v59 = "-[CDMCcqrAerCbRService setup:]";
        _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s Trie Overrides: Successfully initialized CCQR Trie component overrides and re-used shared trie overrides store", buf, 0xCu);
      }
    }
    int v46 = 0;
LABEL_46:
    objc_sync_exit(v34);

LABEL_47:
    if (v46)
    {
LABEL_49:

      goto LABEL_50;
    }
LABEL_48:
    v8 = [(CDMCcqrAerCbRService *)self createSetupResponseWithError:v7];
    goto LABEL_49;
  }
  id v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v59 = "-[CDMCcqrAerCbRService setup:]";
    _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s Skip CDMCcqrAerCbRService setup as NLRouter service requirements met", buf, 0xCu);
  }

  self->super.super._serviceState = 4;
  int v7 = [(CDMBaseService *)self createErrorWithCode:1 description:@"Skip CCQR service setup as NLRouter service requirements met."];
  v8 = [(CDMCcqrAerCbRService *)self createSetupResponseWithError:v7];
LABEL_50:

  return v8;
}

- (id)warmup:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v14 = "-[CDMCcqrAerCbRService warmup:]";
    _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s Warming Up CDMCcqrAerCbRService", buf, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels])
  {
    v5 = +[CDMCcqrServiceUtils buildQueryRewriteRequest];
    uint64_t v12 = 0;
    id v6 = [(CDMCcqrAerCbRService *)self doInference:v5 status:&v12];
  }
  int v7 = [CDMWarmupResponseCommand alloc];
  int64_t v8 = [(CDMBaseService *)self serviceState];
  uint64_t v9 = [(CDMBaseService *)self serviceName];
  id v10 = [(CDMWarmupResponseCommand *)v7 initWithServiceState:v8 serviceName:v9];

  return v10;
}

- (id)createSetupResponseWithError:(id)a3
{
  id v4 = a3;
  v5 = [(CDMBaseService *)self createSetupResponseCommand];
  [v5 setCmdError:v4];

  return v5;
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  id v6 = @"marrs/ccqr";
  int v7 = @"com.apple.siri.nl.marrs.ccqr";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  [(CDMServiceAssetConfig *)v2 setIsAssetRequiredForSetup:0];
  return v2;
}

+ (BOOL)suppressCcqrUsingCurContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend(v3, "nlContext", 0);
  v5 = [v4 systemDialogActs];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v10 hasOffered] & 1) != 0
          || ([v10 hasPrompted] & 1) != 0
          || [v10 hasGaveOptions])
        {
          int v14 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            id v22 = "+[CDMCcqrAerCbRService suppressCcqrUsingCurContext:]";
            _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s Skipping ccqr to reason #1: Previous turn result in a active task, such that SDA is non-empty", buf, 0xCu);
          }

          goto LABEL_17;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v11 = [v3 legacyNlContext];
  uint64_t v12 = [v11 previousDomainName];
  int v13 = [v12 isEqualToString:@"arithmetic"];

  if (v13)
  {
    v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "+[CDMCcqrAerCbRService suppressCcqrUsingCurContext:]";
      __int16 v23 = 2112;
      v24 = @"arithmetic";
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Skipping ccqr to reason #3: Disable certain domain(s): %@", buf, 0x16u);
    }
LABEL_17:

    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (void)CcqrAerCbRServiceLogInitIfNeeded
{
  if (CcqrAerCbRServiceLogInitIfNeeded_once != -1) {
    dispatch_once(&CcqrAerCbRServiceLogInitIfNeeded_once, &__block_literal_global_6956);
  }
}

uint64_t __56__CDMCcqrAerCbRService_CcqrAerCbRServiceLogInitIfNeeded__block_invoke()
{
  CDMCcqrAerCbRServiceLogContext = (uint64_t)os_log_create((const char *)CDMLoggingSubsystem, "CCQR");
  return MEMORY[0x270F9A758]();
}

@end