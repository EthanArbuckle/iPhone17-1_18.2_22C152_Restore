@interface SGErrorMetrics
+ (id)instance;
+ (void)recordInteractionIgnoredWithReason:(SGMInteractionIgnoredReason_)a3;
- (SGErrorMetrics)init;
- (SGMBadInteractionIgnored)badInteractionIgnored;
- (void)setBadInteractionIgnored:(id)a3;
@end

@implementation SGErrorMetrics

- (void).cxx_destruct
{
}

- (void)setBadInteractionIgnored:(id)a3
{
}

- (SGMBadInteractionIgnored)badInteractionIgnored
{
  return self->_badInteractionIgnored;
}

- (SGErrorMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)SGErrorMetrics;
  v2 = [(SGErrorMetrics *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SGErrorMetrics *)v2 setBadInteractionIgnored:v3];
  }
  return v2;
}

+ (void)recordInteractionIgnoredWithReason:(SGMInteractionIgnoredReason_)a3
{
  v4 = [a1 instance];
  objc_super v5 = [v4 badInteractionIgnored];
  [v5 trackEventWithScalar:1 reason:a3.var0];

  id v11 = (id)objc_opt_new();
  [v11 setReason:a3.var0];
  v6 = [MEMORY[0x1E4F93728] sharedInstance];
  [v6 trackScalarForMessage:v11];

  id v7 = [NSString alloc];
  v8 = [v11 key];
  v9 = (void *)[v7 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v8];

  v10 = [v11 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (id)instance
{
  if (instance_onceToken_241 != -1) {
    dispatch_once(&instance_onceToken_241, &__block_literal_global_243);
  }
  v2 = (void *)instance__instance_240;

  return v2;
}

uint64_t __26__SGErrorMetrics_instance__block_invoke()
{
  instance__instance_240 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end