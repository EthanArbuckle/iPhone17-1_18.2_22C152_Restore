@interface SGPatternMetrics
+ (id)instance;
+ (void)recordSelfIdMatchWithPatternType:(SGMSIPatternType_)a3 patternHash:(id)a4 nameTokenCount:(unint64_t)a5 nameClassification:(SGMSINameClassification_)a6 messageIndex:(unint64_t)a7;
- (SGMSelfIdPatternMatched)selfIdPatternMatched;
- (SGPatternMetrics)init;
- (void)setSelfIdPatternMatched:(id)a3;
@end

@implementation SGPatternMetrics

- (void).cxx_destruct
{
}

- (void)setSelfIdPatternMatched:(id)a3
{
}

- (SGMSelfIdPatternMatched)selfIdPatternMatched
{
  return self->_selfIdPatternMatched;
}

- (SGPatternMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)SGPatternMetrics;
  v2 = [(SGPatternMetrics *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SGPatternMetrics *)v2 setSelfIdPatternMatched:v3];
  }
  return v2;
}

+ (void)recordSelfIdMatchWithPatternType:(SGMSIPatternType_)a3 patternHash:(id)a4 nameTokenCount:(unint64_t)a5 nameClassification:(SGMSINameClassification_)a6 messageIndex:(unint64_t)a7
{
  id v12 = a4;
  v13 = [a1 instance];
  v14 = [v13 selfIdPatternMatched];
  [v14 trackEventWithScalar:1 patternType:a3.var0 patternHash:v12 nameTokens:a5 nameClass:a6.var0 messageIndex:a7];

  id v20 = (id)objc_opt_new();
  [v20 setPatternType:a3.var0];
  [v20 setPatternHash:v12];

  [v20 setNameTokens:a5];
  [v20 setNameClass:a6.var0];
  [v20 setMessageIndex:a7];
  v15 = [MEMORY[0x1E4F93728] sharedInstance];
  [v15 trackScalarForMessage:v20];

  id v16 = [NSString alloc];
  v17 = [v20 key];
  v18 = (void *)[v16 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v17];

  v19 = [v20 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (id)instance
{
  if (instance_onceToken_220 != -1) {
    dispatch_once(&instance_onceToken_220, &__block_literal_global_222);
  }
  v2 = (void *)instance__instance_219;

  return v2;
}

uint64_t __28__SGPatternMetrics_instance__block_invoke()
{
  instance__instance_219 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end