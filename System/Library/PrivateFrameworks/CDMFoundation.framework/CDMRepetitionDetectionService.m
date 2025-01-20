@interface CDMRepetitionDetectionService
+ (BOOL)isEnabled;
+ (id)getCDMServiceAssetConfig;
- (QueryRewriter)repetitionDetector;
- (id)doInference:(id)a3 status:(id *)a4;
- (id)getPredictor:(id)a3 FilesPath:(id)a4 status:(id *)a5;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (void)setRepetitionDetector:(id)a3;
@end

@implementation CDMRepetitionDetectionService

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
  return +[CDMFeatureFlags isRepetitionDetectionEnabled];
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6 = @"marrs/rd";
  v7 = @"com.apple.siri.nl.marrs.rd";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  [(CDMServiceAssetConfig *)v2 setIsAssetRequiredForSetup:0];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repetitionDetector, 0);
  objc_storeStrong((id *)&self->_nlAsset, 0);
}

- (void)setRepetitionDetector:(id)a3
{
}

- (QueryRewriter)repetitionDetector
{
  return self->_repetitionDetector;
}

- (id)doInference:(id)a3 status:(id *)a4
{
  v4 = [(QueryRewriter *)self->_repetitionDetector predictWithInput:a3 status:a4];
  return v4;
}

- (id)getPredictor:(id)a3 FilesPath:(id)a4 status:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[objc_alloc(MEMORY[0x263F53FD8]) initWithLocale:v7 filesPath:v8 predictorType:0 status:a5];

  return v9;
}

- (id)handle:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CDMRepetitionDetectionService handle:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Calling Repetition Detection", buf, 0xCu);
  }

  if (!self->_repetitionDetector)
  {
    v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMRepetitionDetectionService handle:]";
      _os_log_error_impl(&dword_2263A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: Repetition Detection: Predictor is not initialized correctly!", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v6 = [v4 qrRequest];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMRepetitionDetectionService handle:]";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Repetition Detection: qrRequest is nil. Skipping RD Inference", buf, 0xCu);
    }
LABEL_14:
    v12 = 0;
    goto LABEL_21;
  }
  id v8 = (id)CDMLogContext;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v17 = [v4 qrRequest];
    *(_DWORD *)buf = 136315650;
    v20 = "-[CDMRepetitionDetectionService handle:]";
    __int16 v21 = 2112;
    v22 = @"queryrewrite";
    __int16 v23 = 2112;
    v24 = v17;
    _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nQUERYREWRITEQRRequest: %@", buf, 0x20u);
  }
  v9 = [v4 qrRequest];
  id v18 = 0;
  v10 = [(CDMRepetitionDetectionService *)self doInference:v9 status:&v18];
  v11 = v18;

  v12 = [[CDMRepetitionDetectionResponseCommand alloc] initWithResponse:v10];
  [(CDMBaseCommand *)v12 setCmdError:v11];
  if ([v10 repetitionType] == 3)
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMRepetitionDetectionService handle:]";
      v14 = "%s Service Result: Full Repetition";
LABEL_17:
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
    }
  }
  else
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMRepetitionDetectionService handle:]";
      v14 = "%s Service Result: No/Partial/Unavailable Repetition";
      goto LABEL_17;
    }
  }

  v15 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[CDMRepetitionDetectionService handle:]";
    __int16 v21 = 2112;
    v22 = @"queryrewrite";
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nQUERYREWRITEQRResponse: %@", buf, 0x20u);
  }

LABEL_21:
  return v12;
}

- (id)setup:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CDMRepetitionDetectionService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up Repetition Detection service", buf, 0xCu);
  }

  v6 = [v4 dynamicConfig];
  BOOL v7 = [v6 getAssetForFactorName:@"com.apple.siri.nl.marrs.rd"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v7;

  v9 = [v4 dynamicConfig];
  v10 = [v9 getAssetBundlePathForFactorName:@"com.apple.siri.nl.marrs.rd"];

  if (v10)
  {
    v11 = [v4 dynamicConfig];
    v12 = [v11 languageCode];
    v13 = [v10 resourcePath];
    id v22 = 0;
    v14 = [(CDMRepetitionDetectionService *)self getPredictor:v12 FilesPath:v13 status:&v22];
    id v15 = v22;
    repetitionDetector = self->_repetitionDetector;
    self->_repetitionDetector = v14;

    if (v15)
    {
      v17 = [v15 localizedDescription];
      id v18 = [(CDMBaseService *)self createErrorWithCode:1 description:v17];

      self->super.super._serviceState = 4;
    }
    else
    {
      self->super.super._serviceState = 2;
      v19 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[CDMRepetitionDetectionService setup:]";
        _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s Repetition Detector loaded", buf, 0xCu);
      }

      id v18 = 0;
    }
  }
  else
  {
    id v18 = [(CDMBaseService *)self createErrorWithCode:1 description:@"Not able to find Repetition Detection model bundle directory"];
    self->super.super._serviceState = 4;
  }
  v20 = [(CDMBaseService *)self createSetupResponseCommand];
  [v20 setCmdError:v18];

  return v20;
}

@end