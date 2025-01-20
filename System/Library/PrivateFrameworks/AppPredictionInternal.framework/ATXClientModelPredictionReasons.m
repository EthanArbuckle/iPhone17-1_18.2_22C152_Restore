@interface ATXClientModelPredictionReasons
+ (id)clientModelPredictionReasonsBundlePath;
+ (void)clientModelPredictionReasonsBundlePath;
- (ATXClientModelPredictionReasons)init;
- (id)actionAnchorReasonForAnchorType:(id)a3;
- (id)actionBehavioralReason;
- (id)actionHeuristicReasonForHeuristicName:(id)a3;
- (id)appAnchorReasonForAnchorType:(id)a3;
- (id)appBehavioralReason;
- (id)appHeroAppReason;
- (id)appInstalledAppClipReason;
- (id)appLocationBasedAppClipReason;
- (id)appMagicalMomentReasonForAnchorType:(int64_t)a3;
- (id)localizedStringForKey:(id)a3;
@end

@implementation ATXClientModelPredictionReasons

- (ATXClientModelPredictionReasons)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXClientModelPredictionReasons;
  v2 = [(ATXClientModelPredictionReasons *)&v7 init];
  if (v2)
  {
    v3 = +[ATXClientModelPredictionReasons clientModelPredictionReasonsBundlePath];
    if (v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithPath:v3];
      bundle = v2->_bundle;
      v2->_bundle = (NSBundle *)v4;
    }
    else
    {
      bundle = v2->_bundle;
      v2->_bundle = 0;
    }
  }
  return v2;
}

+ (id)clientModelPredictionReasonsBundlePath
{
  v2 = [MEMORY[0x1E4F4AF08] pathForResource:@"ATXClientModelPredictionReasons" ofType:&stru_1F2740B58 isDirectory:1];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ATXClientModelPredictionReasons clientModelPredictionReasonsBundlePath](v5);
    }
  }
  return v3;
}

- (id)localizedStringForKey:(id)a3
{
  return [(NSBundle *)self->_bundle localizedStringForKey:a3 value:0 table:@"ATXClientModelPredictionReasons"];
}

- (id)appInstalledAppClipReason
{
  return [(ATXClientModelPredictionReasons *)self localizedStringForKey:@"App_InstalledAppClip"];
}

- (id)appLocationBasedAppClipReason
{
  return [(ATXClientModelPredictionReasons *)self localizedStringForKey:@"App_LocationBasedAppClip"];
}

- (id)appHeroAppReason
{
  return [(ATXClientModelPredictionReasons *)self localizedStringForKey:@"App_HeroApp"];
}

- (id)appMagicalMomentReasonForAnchorType:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F93888] predictedAnchorTypeToString:a3];
  v5 = [NSString stringWithFormat:@"App_MagicalMoment_%@", v4];
  v6 = [(ATXClientModelPredictionReasons *)self localizedStringForKey:v5];

  return v6;
}

- (id)appAnchorReasonForAnchorType:(id)a3
{
  id v4 = [NSString stringWithFormat:@"App_Anchor_%@", a3];
  v5 = [(ATXClientModelPredictionReasons *)self localizedStringForKey:v4];

  return v5;
}

- (id)appBehavioralReason
{
  return [(ATXClientModelPredictionReasons *)self localizedStringForKey:@"App_Behavioral"];
}

- (id)actionBehavioralReason
{
  return [(ATXClientModelPredictionReasons *)self localizedStringForKey:@"Action_Behavioral"];
}

- (id)actionHeuristicReasonForHeuristicName:(id)a3
{
  id v4 = [NSString stringWithFormat:@"Action_Heuristic_%@", a3];
  v5 = [(ATXClientModelPredictionReasons *)self localizedStringForKey:v4];

  return v5;
}

- (id)actionAnchorReasonForAnchorType:(id)a3
{
  id v4 = [NSString stringWithFormat:@"Action_Anchor_%@", a3];
  v5 = [(ATXClientModelPredictionReasons *)self localizedStringForKey:v4];

  return v5;
}

- (void).cxx_destruct
{
}

+ (void)clientModelPredictionReasonsBundlePath
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXClientModelPredictionReasons Bundle doesn't exist!", v1, 2u);
}

@end