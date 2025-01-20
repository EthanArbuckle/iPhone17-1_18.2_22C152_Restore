@interface ATXWidgetModeModel
+ (id)fetchAvailableWidgets;
- (ATXWidgetModeModel)initWithMode:(unint64_t)a3 globalWidgetPopularityModel:(id)a4;
- (double)combineWidgetModeProbability:(double)a3 withAppModeProbabiilty:(double)a4;
- (double)scoreFromCorrelationStatistics:(id)a3;
- (id)scoredEntitiesWithScoredAppEntities:(id)a3;
- (id)scoredWidgetModeEntityWithWidgetFeatures:(id)a3 widget:(id)a4 scoredApp:(id)a5;
- (id)widgetModeEntityForDescriptor:(id)a3 widgetSize:(int64_t)a4 scoredAppEntities:(id)a5;
- (id)widgetModeEntityForWidgetId:(id)a3 widgetFeatures:(id)a4 availableWidgets:(id)a5 scoredAppEntities:(id)a6;
- (void)addEntitySpecificFeaturesToWidgetFeatures:(id)a3 scoredApp:(id)a4;
@end

@implementation ATXWidgetModeModel

- (ATXWidgetModeModel)initWithMode:(unint64_t)a3 globalWidgetPopularityModel:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXWidgetModeModel;
  v8 = [(ATXWidgetModeModel *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    uint64_t v10 = objc_opt_new();
    widgetModeEntityModelWeights = v9->_widgetModeEntityModelWeights;
    v9->_widgetModeEntityModelWeights = (ATXWidgetModeEntityModelWeights *)v10;

    objc_storeStrong((id *)&v9->_widgetPopularityModel, a4);
  }

  return v9;
}

- (id)scoredEntitiesWithScoredAppEntities:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = +[ATXWidgetModeModel fetchAvailableWidgets];
  id v7 = +[ATXModeEntityModelTrainer eventProviderForMode:self->_mode];
  if (v7)
  {
    v8 = [[ATXModeEntityCorrelator alloc] initWithModeEventProvider:v7 entityEventProvider:0];
    v9 = [(ATXModeEntityCorrelator *)v8 entityFeaturesForWidgetScoring];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__ATXWidgetModeModel_scoredEntitiesWithScoredAppEntities___block_invoke;
    v20[3] = &unk_1E68ABCF0;
    v20[4] = self;
    id v10 = v6;
    id v21 = v10;
    id v11 = v4;
    id v22 = v11;
    id v12 = v5;
    id v23 = v12;
    [v9 enumerateKeysAndObjectsUsingBlock:v20];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__ATXWidgetModeModel_scoredEntitiesWithScoredAppEntities___block_invoke_2;
    v17[3] = &unk_1E68ABD18;
    v17[4] = self;
    id v18 = v11;
    id v13 = v12;
    id v19 = v13;
    [v10 enumerateKeysAndObjectsUsingBlock:v17];
    v14 = v19;
    id v15 = v13;
  }
  else
  {
    __atxlog_handle_modes();
    v8 = (ATXModeEntityCorrelator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR)) {
      -[ATXWidgetModeModel scoredEntitiesWithScoredAppEntities:](&v8->super);
    }
  }

  return v5;
}

void __58__ATXWidgetModeModel_scoredEntitiesWithScoredAppEntities___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "widgetModeEntityForWidgetId:widgetFeatures:availableWidgets:scoredAppEntities:");
  if (v3) {
    [*(id *)(a1 + 56) setObject:v3 forKey:v4];
  }
}

void __58__ATXWidgetModeModel_scoredEntitiesWithScoredAppEntities___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = 1; i != 5; ++i)
  {
    v6 = [*(id *)(a1 + 32) widgetModeEntityForDescriptor:a3 widgetSize:i scoredAppEntities:*(void *)(a1 + 40)];
    id v7 = v6;
    if (v6)
    {
      v8 = *(void **)(a1 + 48);
      v9 = [v6 identifier];
      id v10 = [v8 objectForKeyedSubscript:v9];

      if (!v10)
      {
        id v11 = *(void **)(a1 + 48);
        id v12 = [v7 identifier];
        [v11 setObject:v7 forKey:v12];
      }
    }
  }
}

+ (id)fetchAvailableWidgets
{
  v2 = [MEMORY[0x1E4F4B430] sharedInstance];
  v3 = objc_opt_new();
  id v4 = [v2 homeScreenDescriptors];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ATXWidgetModeModel_fetchAvailableWidgets__block_invoke;
  v7[3] = &unk_1E68ABD40;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __43__ATXWidgetModeModel_fetchAvailableWidgets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [NSString alloc];
  id v5 = [v3 extensionIdentity];
  v6 = [v5 containerBundleIdentifier];
  id v7 = [v3 extensionIdentity];
  id v8 = [v7 extensionBundleIdentifier];
  v9 = [v3 kind];
  id v10 = (void *)[v4 initWithFormat:@"%@:%@:%@", v6, v8, v9];

  id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];

  if (v11)
  {
    id v12 = __atxlog_handle_modes();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __43__ATXWidgetModeModel_fetchAvailableWidgets__block_invoke_cold_1(v3, v12);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v10];
  }
}

- (id)widgetModeEntityForWidgetId:(id)a3 widgetFeatures:(id)a4 availableWidgets:(id)a5 scoredAppEntities:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v9 entity];
  id v13 = [v12 widget];

  v14 = [v13 extensionIdentity];
  uint64_t v15 = [v14 containerBundleIdentifier];
  if (!v15) {
    goto LABEL_8;
  }
  v16 = (void *)v15;
  v17 = [v13 extensionIdentity];
  uint64_t v18 = [v17 extensionBundleIdentifier];
  if (!v18)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v19 = (void *)v18;
  v20 = [v13 kind];

  if (v20)
  {
    v39 = self;
    id v21 = [NSString alloc];
    id v22 = [v13 extensionIdentity];
    id v23 = [v22 containerBundleIdentifier];
    v24 = [v13 extensionIdentity];
    v25 = [v24 extensionBundleIdentifier];
    v26 = [v13 kind];
    v27 = (void *)[v21 initWithFormat:@"%@:%@:%@", v23, v25, v26];

    v28 = [v10 objectForKeyedSubscript:v27];

    if (v28)
    {
      v29 = [v13 extensionIdentity];
      v30 = [v29 containerBundleIdentifier];
      v31 = [v11 objectForKeyedSubscript:v30];
      v28 = [(ATXWidgetModeModel *)v39 scoredWidgetModeEntityWithWidgetFeatures:v9 widget:v13 scoredApp:v31];
    }
    goto LABEL_12;
  }
LABEL_9:
  v32 = __atxlog_handle_modes();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = [v13 extensionIdentity];
    v34 = [v33 containerBundleIdentifier];
    v35 = [v13 extensionIdentity];
    v36 = [v35 extensionBundleIdentifier];
    v37 = [v13 kind];
    *(_DWORD *)buf = 136315906;
    v41 = "-[ATXWidgetModeModel widgetModeEntityForWidgetId:widgetFeatures:availableWidgets:scoredAppEntities:]";
    __int16 v42 = 2112;
    v43 = v34;
    __int16 v44 = 2112;
    v45 = v36;
    __int16 v46 = 2112;
    v47 = v37;
    _os_log_impl(&dword_1D0FA3000, v32, OS_LOG_TYPE_DEFAULT, "%s: Widget properties containerBundleIdentifier:'%@' extensionBundleIdentifier:'%@' kind:'%@' must all be non-null in order to be scored.", buf, 0x2Au);
  }
  v28 = 0;
LABEL_12:

  return v28;
}

- (id)widgetModeEntityForDescriptor:(id)a3 widgetSize:(int64_t)a4 scoredAppEntities:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = CHSWidgetFamilyMaskFromWidgetFamily();
  if (([v8 supportedFamilies] & v10) != 0)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F58DD8]);
    id v12 = [v8 extensionIdentity];
    id v13 = [v8 kind];
    v14 = (void *)[v11 initWithExtensionIdentity:v12 kind:v13 family:a4 intent:0 activityIdentifier:0];

    uint64_t v15 = [v8 extensionIdentity];
    v16 = [v15 containerBundleIdentifier];
    v17 = [v9 objectForKeyedSubscript:v16];

    uint64_t v18 = [(ATXWidgetModeModel *)self scoredWidgetModeEntityWithWidgetFeatures:0 widget:v14 scoredApp:v17];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)scoredWidgetModeEntityWithWidgetFeatures:(id)a3 widget:(id)a4 scoredApp:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    id v10 = a4;
    id v8 = (id)objc_opt_new();
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F4B438]) initWithWidget:v10];

    [v8 setEntity:v11];
  }
  [(ATXWidgetModeModel *)self addEntitySpecificFeaturesToWidgetFeatures:v8 scoredApp:v9];
  [(ATXWidgetModeModel *)self scoreFromCorrelationStatistics:v8];
  double v13 = v12;
  v14 = objc_opt_new();
  [v14 setScore:v13];
  uint64_t v15 = [v8 jsonRepresentation];
  [v14 setFeatureVector:v15];

  v16 = [v8 entity];
  [v16 setScoreMetadata:v14];

  v17 = [v8 entity];

  return v17;
}

- (void)addEntitySpecificFeaturesToWidgetFeatures:(id)a3 scoredApp:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v28 = v6;
    id v7 = a4;
    id v8 = [v28 entitySpecificFeatures];
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_opt_new();
    }
    id v11 = v10;

    double v12 = NSNumber;
    double v13 = [v7 scoreMetadata];
    [v13 score];
    v14 = objc_msgSend(v12, "numberWithDouble:");
    [v11 setParentAppScore:v14];

    uint64_t v15 = [v28 entity];
    v16 = [v15 widget];
    id v17 = [NSString alloc];
    uint64_t v18 = [v16 extensionIdentity];
    id v19 = [v18 extensionBundleIdentifier];
    v20 = [v16 kind];
    id v21 = (void *)[v17 initWithFormat:@"%@:%@", v19, v20];

    id v22 = NSNumber;
    [(ATXGlobalWidgetPopularityModel *)self->_widgetPopularityModel scoreForBundleIdAndKind:v21 scalingFactor:1.0];
    id v23 = objc_msgSend(v22, "numberWithDouble:");
    [v11 setWidgetGlobalPrior:v23];
    v24 = [v7 scoreMetadata];

    v25 = [v24 featureVector];

    v26 = [v25 objectForKeyedSubscript:@"correlationEntitySpecificFeatures"];
    v27 = [v26 objectForKeyedSubscript:@"globalModeAffinityPrior"];

    if (v27) {
      [v11 setParentAppGlobalPrior:v27];
    }
    [v28 setEntitySpecificFeatures:v11];

    id v6 = v28;
  }
}

- (double)scoreFromCorrelationStatistics:(id)a3
{
  widgetModeEntityModelWeights = self->_widgetModeEntityModelWeights;
  id v5 = a3;
  [(ATXWidgetModeEntityModelWeights *)widgetModeEntityModelWeights classConditionalProbability];
  double v7 = v6;
  [v5 classConditionalProbability];
  double v9 = v7 * v8;
  uint64_t v10 = [v5 globalOccurrences];
  [(ATXWidgetModeEntityModelWeights *)self->_widgetModeEntityModelWeights globalPopularity];
  double v12 = v11;
  [v5 globalPopularity];
  double v14 = v12 * v13;
  [(ATXWidgetModeEntityModelWeights *)self->_widgetModeEntityModelWeights posteriorProbability];
  double v16 = v15;
  [v5 posteriorProbability];
  double v18 = v16 * v17;
  [(ATXWidgetModeEntityModelWeights *)self->_widgetModeEntityModelWeights modePopularity];
  double v20 = v19;
  [v5 modePopularity];
  double v22 = v20 * v21;
  unsigned int v23 = objc_msgSend(v5, "entityOccurredInModeOverLastNDays:", -[ATXWidgetModeEntityModelWeights numOfDays](self->_widgetModeEntityModelWeights, "numOfDays"));
  float v24 = v14 + v9 + v18 + v22;
  double v25 = (float)(1.0 / (float)(expf(-v24) + 1.0));
  if (v10) {
    double v26 = v25;
  }
  else {
    double v26 = 0.0;
  }
  if ((unint64_t)[v5 uniqueOccurrencesInMode] < 3) {
    double v26 = v26 * (double)v23 * 0.5;
  }
  v27 = [v5 entitySpecificFeatures];

  id v28 = [v27 parentAppScore];
  [v28 doubleValue];
  [(ATXWidgetModeModel *)self combineWidgetModeProbability:v26 withAppModeProbabiilty:v29];
  double v31 = v30;

  return v31;
}

- (double)combineWidgetModeProbability:(double)a3 withAppModeProbabiilty:(double)a4
{
  [(ATXWidgetModeEntityModelWeights *)self->_widgetModeEntityModelWeights weightForWidgetProbability];
  return (1.0 - v6) * a4 + a3 * v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetPopularityModel, 0);
  objc_storeStrong((id *)&self->_widgetModeEntityModelWeights, 0);
}

- (void)scoredEntitiesWithScoredAppEntities:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXWidgetModeModel: nil mode event provider; unable to generate mode afffinity scores for widgets.",
    v1,
    2u);
}

void __43__ATXWidgetModeModel_fetchAvailableWidgets__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 extensionIdentity];
  id v5 = [v4 containerBundleIdentifier];
  double v6 = [a1 extensionIdentity];
  double v7 = [v6 extensionBundleIdentifier];
  double v8 = [a1 kind];
  int v9 = 138412802;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  double v12 = v7;
  __int16 v13 = 2112;
  double v14 = v8;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXWidgetModeModel: duplicate descriptor for containerBundleIdentifier:%@, extensionBundleIdentifier: %@, kind:%@", (uint8_t *)&v9, 0x20u);
}

@end