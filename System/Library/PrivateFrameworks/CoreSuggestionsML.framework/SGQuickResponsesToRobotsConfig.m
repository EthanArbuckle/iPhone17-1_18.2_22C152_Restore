@interface SGQuickResponsesToRobotsConfig
+ (id)sharedInstance;
- (BOOL)enableFeature;
- (BOOL)insignificantSender;
- (BOOL)relaxContext;
- (BOOL)useGeneralContext;
- (NSDictionary)supportedKeysAndContext;
- (NSSet)generalContextWords;
- (NSSet)triggerWords;
- (SGQuickResponsesToRobotsConfig)initWithDictionary:(id)a3;
- (float)capsWordsRatioMax;
- (unint64_t)generalContextLeft;
- (unint64_t)generalContextRight;
- (unint64_t)leftContext;
- (unint64_t)rightContext;
- (unint64_t)triggerContext;
@end

@implementation SGQuickResponsesToRobotsConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerWords, 0);
  objc_storeStrong((id *)&self->_generalContextWords, 0);
  objc_storeStrong((id *)&self->_supportedKeysAndContext, 0);
}

- (float)capsWordsRatioMax
{
  return self->_capsWordsRatioMax;
}

- (BOOL)insignificantSender
{
  return self->_insignificantSender;
}

- (BOOL)useGeneralContext
{
  return self->_useGeneralContext;
}

- (BOOL)relaxContext
{
  return self->_relaxContext;
}

- (BOOL)enableFeature
{
  return self->_enableFeature;
}

- (unint64_t)triggerContext
{
  return self->_triggerContext;
}

- (unint64_t)generalContextRight
{
  return self->_generalContextRight;
}

- (unint64_t)generalContextLeft
{
  return self->_generalContextLeft;
}

- (unint64_t)rightContext
{
  return self->_rightContext;
}

- (unint64_t)leftContext
{
  return self->_leftContext;
}

- (NSSet)triggerWords
{
  return self->_triggerWords;
}

- (NSSet)generalContextWords
{
  return self->_generalContextWords;
}

- (NSDictionary)supportedKeysAndContext
{
  return self->_supportedKeysAndContext;
}

- (SGQuickResponsesToRobotsConfig)initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"SGQuickResponsesToRobotsConfig.m", 48, @"Invalid parameter not satisfying: %@", @"params" object file lineNumber description];
  }
  v30.receiver = self;
  v30.super_class = (Class)SGQuickResponsesToRobotsConfig;
  v6 = [(SGQuickResponsesToRobotsConfig *)&v30 init];
  if (v6)
  {
    v7 = [v5 objectForKeyedSubscript:@"ENABLE_FEATURE"];
    v6->_enableFeature = [v7 BOOLValue];

    if (v6->_enableFeature)
    {
      uint64_t v8 = [v5 objectForKeyedSubscript:@"RULES_DICT"];
      supportedKeysAndContext = v6->_supportedKeysAndContext;
      v6->_supportedKeysAndContext = (NSDictionary *)v8;

      id v10 = objc_alloc(MEMORY[0x263EFFA08]);
      v11 = [v5 objectForKeyedSubscript:@"TRIGGER_WORDS"];
      uint64_t v12 = [v10 initWithArray:v11];
      triggerWords = v6->_triggerWords;
      v6->_triggerWords = (NSSet *)v12;

      id v14 = objc_alloc(MEMORY[0x263EFFA08]);
      v15 = [v5 objectForKeyedSubscript:@"GENERAL_CONTEXT_WORDS"];
      uint64_t v16 = [v14 initWithArray:v15];
      generalContextWords = v6->_generalContextWords;
      v6->_generalContextWords = (NSSet *)v16;

      v18 = [v5 objectForKeyedSubscript:@"LEFT_CONTEXT"];
      v6->_leftContext = [v18 unsignedIntValue];

      v19 = [v5 objectForKeyedSubscript:@"RIGHT_CONTEXT"];
      v6->_rightContext = [v19 unsignedIntValue];

      v20 = [v5 objectForKeyedSubscript:@"GENERAL_CONTEXT_LEFT"];
      v6->_generalContextLeft = [v20 unsignedIntValue];

      v21 = [v5 objectForKeyedSubscript:@"GENERAL_CONTEXT_RIGHT"];
      v6->_generalContextRight = [v21 unsignedIntValue];

      v22 = [v5 objectForKeyedSubscript:@"TRIGGER_CONTEXT"];
      v6->_triggerContext = [v22 unsignedIntValue];

      v23 = [v5 objectForKeyedSubscript:@"RELAX_CONTEXT"];
      v6->_relaxContext = [v23 BOOLValue];

      v24 = [v5 objectForKeyedSubscript:@"USE_GENERAL_CONTEXT"];
      v6->_useGeneralContext = [v24 BOOLValue];

      v25 = [v5 objectForKeyedSubscript:@"INSIGNIFICANT_SENDER"];
      v6->_insignificantSender = [v25 BOOLValue];

      v26 = [v5 objectForKeyedSubscript:@"CAPS_WORDS_RATIO_MAX"];
      [v26 floatValue];
      v6->_capsWordsRatioMax = v27;
    }
  }

  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1104);
  }
  v2 = (void *)sharedInstance__sharedConfig;
  return v2;
}

void __48__SGQuickResponsesToRobotsConfig_sharedInstance__block_invoke()
{
  v0 = +[SGDefaultAssets responseToRobotParams];
  if (v0)
  {
    v1 = [[SGQuickResponsesToRobotsConfig alloc] initWithDictionary:v0];
    v2 = (void *)sharedInstance__sharedConfig;
    sharedInstance__sharedConfig = (uint64_t)v1;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Responses to Robots config file not found", v3, 2u);
  }
}

@end