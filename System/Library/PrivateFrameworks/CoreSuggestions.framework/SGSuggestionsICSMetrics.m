@interface SGSuggestionsICSMetrics
+ (id)instance;
+ (void)recordWithTimezoneValue:(SGMFoundInAppsICSTZValue_)a3 datetimeType:(SGMFoundInAppsDatetimeType_)a4;
- (SGMFoundInAppsICS)foundInAppsICS;
- (SGSuggestionsICSMetrics)init;
- (void)setFoundInAppsICS:(id)a3;
@end

@implementation SGSuggestionsICSMetrics

- (void).cxx_destruct
{
}

- (void)setFoundInAppsICS:(id)a3
{
}

- (SGMFoundInAppsICS)foundInAppsICS
{
  return self->_foundInAppsICS;
}

- (SGSuggestionsICSMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)SGSuggestionsICSMetrics;
  v2 = [(SGSuggestionsICSMetrics *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SGSuggestionsICSMetrics *)v2 setFoundInAppsICS:v3];
  }
  return v2;
}

+ (void)recordWithTimezoneValue:(SGMFoundInAppsICSTZValue_)a3 datetimeType:(SGMFoundInAppsDatetimeType_)a4
{
  v6 = [a1 instance];
  v7 = [v6 foundInAppsICS];
  [v7 trackEventWithScalar:1 timezone:a3.var0 datetime:a4.var0];

  id v13 = (id)objc_opt_new();
  [v13 setTimezone:a3.var0];
  [v13 setDatetime:a4.var0];
  v8 = [MEMORY[0x1E4F93728] sharedInstance];
  [v8 trackScalarForMessage:v13];

  id v9 = [NSString alloc];
  v10 = [v13 key];
  v11 = (void *)[v9 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v10];

  v12 = [v13 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (id)instance
{
  if (instance_onceToken_262 != -1) {
    dispatch_once(&instance_onceToken_262, &__block_literal_global_264);
  }
  v2 = (void *)instance__instance_261;

  return v2;
}

uint64_t __35__SGSuggestionsICSMetrics_instance__block_invoke()
{
  instance__instance_261 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end