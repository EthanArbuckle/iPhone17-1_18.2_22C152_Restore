@interface CDMMentionResolverService
+ (BOOL)isEnabled;
+ (id)getCDMServiceAssetConfig;
- (MRRMultimodalMentionResolver)mentionResolver;
- (NSArray)overrideMentionsForReplay;
- (id)getPredictor:(id)a3 forLocale:(id)a4 status:(id *)a5;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)predictWithInput:(id)a3 forLocale:(id)a4 status:(id *)a5;
- (id)setup:(id)a3;
- (void)setMentionResolver:(id)a3;
@end

@implementation CDMMentionResolverService

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
  return +[CDMFeatureFlags isMarrsMentionResolverEnabled];
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6 = @"marrs/mr";
  v7 = @"com.apple.siri.nl.marrs.mr";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  [(CDMServiceAssetConfig *)v2 setIsAssetRequiredForSetup:0];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMentionsForReplay, 0);
  objc_storeStrong((id *)&self->_mentionResolver, 0);
  objc_storeStrong((id *)&self->_nlAsset, 0);
}

- (NSArray)overrideMentionsForReplay
{
  return self->_overrideMentionsForReplay;
}

- (void)setMentionResolver:(id)a3
{
}

- (MRRMultimodalMentionResolver)mentionResolver
{
  return self->_mentionResolver;
}

- (id)predictWithInput:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  id v7 = a3;
  v8 = [(MRRMultimodalMentionResolver *)self->_mentionResolver resolveMentionsInUtterance:v7 status:a5];
  v9 = [v7 tokenChain];
  v10 = +[CDMMentionResolverServiceUtils includeWhitespaceInIndices:v8 tokenchain:v9];

  return v10;
}

- (id)getPredictor:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[objc_alloc(MEMORY[0x263F53FD0]) initWithAssets:v7 forLocale:v8 status:a5];

  return v9;
}

- (id)handle:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CDMMentionResolverService handle:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Calling Mention Resolver", buf, 0xCu);
  }

  if (v4
    && self->_mentionResolver
    && ([v4 mrRequest],
        v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = v6 == 0,
        v6,
        !v7))
  {
    id v8 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[CDMMentionResolverService handle:]";
      __int16 v19 = 2112;
      v20 = @"mentionresolver";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMENTIONRESOLVERRequest: %@", buf, 0x20u);
    }
    if (self->_overrideMentionsForReplay)
    {
      v9 = [[CDMMentionResolverResponseCommand alloc] initWithMentions:self->_overrideMentionsForReplay];
      goto LABEL_14;
    }
    if (+[CDMFeatureFlags isLogNluEnabled])
    {
      v12 = [v4 mrRequest];
      +[CDMMentionResolverServiceUtils logMRRequestToFile:v12];
    }
    v13 = [v4 mrRequest];
    id v16 = 0;
    v14 = [(CDMMentionResolverService *)self predictWithInput:v13 forLocale:0 status:&v16];
    v10 = v16;

    if (+[CDMFeatureFlags isLogNluEnabled]) {
      +[CDMMentionResolverServiceUtils logMRResponseToFile:v14];
    }
    v9 = [[CDMMentionResolverResponseCommand alloc] initWithResponse:v14];
    [(CDMBaseCommand *)v9 setCmdError:v10];
    v15 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[CDMMentionResolverService handle:]";
      __int16 v19 = 2112;
      v20 = @"mentionresolver";
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMENTIONRESOLVERResponse: %@", buf, 0x20u);
    }
  }
  else
  {
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CDMMentionResolverService handle:]";
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Mention Resolver: Either Request and/or Predictor is nil", buf, 0xCu);
    }
    v9 = 0;
  }

LABEL_14:
  return v9;
}

- (id)setup:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[CDMMentionResolverService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up Mention Resolver service", buf, 0xCu);
  }

  v6 = objc_alloc_init(CDMSetupResponseCommand);
  BOOL v7 = [v4 dynamicConfig];
  id v8 = [v7 getAssetForFactorName:@"com.apple.siri.nl.marrs.mr"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v8;

  v10 = [v4 dynamicConfig];
  v11 = [v10 getAssetBundlePathForFactorName:@"com.apple.siri.nl.marrs.mr"];

  if (v11)
  {
    v12 = [v11 resourcePath];
    v13 = [v4 dynamicConfig];
    v14 = [v13 languageCode];
    id v28 = 0;
    v15 = [(CDMMentionResolverService *)self getPredictor:v12 forLocale:v14 status:&v28];
    id v16 = v28;
    mentionResolver = self->_mentionResolver;
    self->_mentionResolver = v15;

    if (v16)
    {
      v18 = [v16 localizedDescription];
      __int16 v19 = [(CDMBaseService *)self createErrorWithCode:1 description:v18];
      [(CDMBaseCommand *)v6 setCmdError:v19];

      self->super.super._serviceState = 4;
      v20 = v6;
      goto LABEL_12;
    }
  }
  else
  {
    __int16 v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CDMMentionResolverService setup:]";
      _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s Mention Resolver model bundle not found", buf, 0xCu);
    }
  }
  id v22 = [v4 dynamicConfig];
  uint64_t v23 = [v22 overrideMentions];
  overrideMentionsForReplay = self->_overrideMentionsForReplay;
  self->_overrideMentionsForReplay = v23;

  self->super.super._serviceState = 2;
  v25 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[CDMMentionResolverService setup:]";
    _os_log_impl(&dword_2263A0000, v25, OS_LOG_TYPE_INFO, "%s Mention Resolver loaded", buf, 0xCu);
  }

  id v16 = 0;
  v20 = [(CDMBaseService *)self createSetupResponseCommand];
LABEL_12:
  v26 = v20;

  return v26;
}

@end