@interface CDMMentionDetectorService
+ (BOOL)isEnabled;
+ (id)getCDMServiceAssetConfig;
- (MRRMultimodalMentionDetector)mentionDetector;
- (id)getPredictor:(id)a3 forLocale:(id)a4 status:(id *)a5;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)predictWithInput:(id)a3 forLocale:(id)a4 status:(id *)a5;
- (id)setup:(id)a3;
- (void)setMentionDetector:(id)a3;
@end

@implementation CDMMentionDetectorService

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
  return +[CDMFeatureFlags isMarrsMentionDetectorEnabled];
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6 = @"marrs/md";
  v7 = @"com.apple.siri.nl.marrs.md";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  [(CDMServiceAssetConfig *)v2 setIsAssetRequiredForSetup:0];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionDetector, 0);
  objc_storeStrong((id *)&self->_nlAsset, 0);
}

- (void)setMentionDetector:(id)a3
{
}

- (MRRMultimodalMentionDetector)mentionDetector
{
  return self->_mentionDetector;
}

- (id)predictWithInput:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  v5 = [(MRRMultimodalMentionDetector *)self->_mentionDetector detectMentionsInUtteranceRequest:a3 status:a5];
  return v5;
}

- (id)getPredictor:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[objc_alloc(MEMORY[0x263F53FC8]) initWithAssets:v7 forLocale:v8 status:a5];

  return v9;
}

- (id)handle:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[CDMMentionDetectorService handle:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Calling Mention Detection", buf, 0xCu);
  }

  if (!v4
    || !self->_mentionDetector
    || ([v4 mdRequest],
        v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = v6 == 0,
        v6,
        v7))
  {
    v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CDMMentionDetectorService handle:]";
      _os_log_error_impl(&dword_2263A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Mention Detection: Either Request and/or Predictor is nil", buf, 0xCu);
    }
    goto LABEL_20;
  }
  id v8 = [v4 turnInput];
  if (v8)
  {
    v9 = [v4 turnInput];
    v10 = [v9 turnContext];
    v11 = [v10 nlContext];
    v12 = [v11 salientEntities];
    BOOL v13 = [v12 count] == 0;

    if (v13)
    {
      v18 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[CDMMentionDetectorService handle:]";
        _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s Skipping MD as there are no salient entities", buf, 0xCu);
      }
LABEL_20:
      v19 = 0;
      goto LABEL_21;
    }
  }
  v14 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[CDMMentionDetectorService handle:]";
    __int16 v27 = 2112;
    v28 = @"mentiondetector";
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMENTIONDETECTORRequest: %@", buf, 0x20u);
  }
  if (+[CDMFeatureFlags isLogNluEnabled])
  {
    v15 = [v4 mdRequest];
    +[CDMMentionDetectorServiceUtils logMDRequestToFile:v15];
  }
  v16 = [v4 mdRequest];
  id v24 = 0;
  v17 = [(CDMMentionDetectorService *)self predictWithInput:v16 forLocale:0 status:&v24];
  v18 = v24;

  v19 = [[CDMMentionDetectorResponseCommand alloc] initWithResponse:v17];
  [(CDMBaseCommand *)v19 setCmdError:v18];
  if (+[CDMFeatureFlags isLogNluEnabled])
  {
    v20 = [(CDMBaseCommand *)v19 cmdError];
    BOOL v21 = v20 == 0;

    if (v21) {
      +[CDMMentionDetectorServiceUtils logMDResponseToFile:v17];
    }
  }
  v22 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[CDMMentionDetectorService handle:]";
    __int16 v27 = 2112;
    v28 = @"mentiondetector";
    __int16 v29 = 2112;
    id v30 = v17;
    _os_log_debug_impl(&dword_2263A0000, v22, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMENTIONDETECTORResponse: %@", buf, 0x20u);
  }

LABEL_21:
  return v19;
}

- (id)setup:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v27 = "-[CDMMentionDetectorService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up Mention Detector service", buf, 0xCu);
  }

  v6 = objc_alloc_init(CDMSetupResponseCommand);
  BOOL v7 = [v4 dynamicConfig];
  id v8 = [v7 getAssetForFactorName:@"com.apple.siri.nl.marrs.md"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v8;

  v10 = [v4 dynamicConfig];
  v11 = [v10 getAssetBundlePathForFactorName:@"com.apple.siri.nl.marrs.md"];

  if (v11)
  {
    v12 = [v11 resourcePath];
    BOOL v13 = [v4 dynamicConfig];
    v14 = [v13 languageCode];
    id v25 = 0;
    v15 = [(CDMMentionDetectorService *)self getPredictor:v12 forLocale:v14 status:&v25];
    id v16 = v25;
    mentionDetector = self->_mentionDetector;
    self->_mentionDetector = v15;

    if (v16)
    {
      v18 = [v16 localizedDescription];
      v19 = [(CDMBaseService *)self createErrorWithCode:1 description:v18];
      [(CDMBaseCommand *)v6 setCmdError:v19];

      self->super.super._serviceState = 4;
      v20 = v6;
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v27 = "-[CDMMentionDetectorService setup:]";
      _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s Mention Detector model bundle not found", buf, 0xCu);
    }
  }
  self->super.super._serviceState = 2;
  v22 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v27 = "-[CDMMentionDetectorService setup:]";
    _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, "%s Mention Detector loaded", buf, 0xCu);
  }

  id v16 = 0;
  v20 = [(CDMBaseService *)self createSetupResponseCommand];
LABEL_12:
  v23 = v20;

  return v23;
}

@end