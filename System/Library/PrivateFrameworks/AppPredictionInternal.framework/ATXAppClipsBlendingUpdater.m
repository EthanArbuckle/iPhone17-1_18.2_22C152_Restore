@interface ATXAppClipsBlendingUpdater
+ (id)appClipsClientModelSpecification;
+ (void)updateBlendingLayerWithHeroAppPredictions:(id)a3;
@end

@implementation ATXAppClipsBlendingUpdater

+ (id)appClipsClientModelSpecification
{
  v2 = +[ATXHeroAndClipConstants sharedInstance];
  v3 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:13];
  id v4 = objc_alloc(MEMORY[0x1E4F93948]);
  v5 = [v2 appClipsModelVersion];
  v6 = (void *)[v4 initWithClientModelId:v3 clientModelVersion:v5 engagementResetPolicy:0];

  return v6;
}

+ (void)updateBlendingLayerWithHeroAppPredictions:(id)a3
{
  id v3 = a3;
  id v14 = +[ATXHeroAndClipConstants sharedInstance];
  id v4 = [(id)objc_opt_class() appClipsClientModelSpecification];
  [v14 appClipsMediumConfidenceScoreThreshold];
  double v6 = v5;
  [v14 appClipsHighConfidenceScoreThreshold];
  v8 = +[ATXProactiveSuggestionBuilder proactiveSuggestionForAppClipsFromHeroAppPredictions:v3 clientModelSpec:v4 mediumThreshold:v6 highThreshold:v7];

  id v9 = objc_alloc(MEMORY[0x1E4F93940]);
  v10 = [v4 clientModelId];
  v11 = +[ATXClientModelSuggestionReceiver sharedInstance];
  v12 = [v11 blendingLayerServer];
  v13 = (void *)[v9 initWithClientModelId:v10 blendingLayerServer:v12];

  [v13 updateSuggestions:v8];
}

@end