@interface ATXHeroSpotlightPOIBlendingUpdater
+ (id)clientModelForHeroSpotlightPOIPredictions;
+ (id)clientModelSpecForHeroSpotlightPOIPredictions;
+ (void)updateBlendingLayerWithHeroAppPredictions:(id)a3;
@end

@implementation ATXHeroSpotlightPOIBlendingUpdater

+ (void)updateBlendingLayerWithHeroAppPredictions:(id)a3
{
  id v4 = a3;
  id v7 = [a1 clientModelSpecForHeroSpotlightPOIPredictions];
  v5 = +[ATXProactiveSuggestionBuilder proactiveSuggestionsForSpotlightPOIWithHeroAppPredictions:v4 clientModelSpec:v7];

  v6 = [a1 clientModelForHeroSpotlightPOIPredictions];
  [v6 updateSuggestions:v5];
}

+ (id)clientModelSpecForHeroSpotlightPOIPredictions
{
  v2 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:45];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v2 clientModelVersion:@"1.0" engagementResetPolicy:0];

  return v3;
}

+ (id)clientModelForHeroSpotlightPOIPredictions
{
  v2 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:45];
  id v3 = objc_alloc(MEMORY[0x1E4F93940]);
  id v4 = +[ATXClientModelSuggestionReceiver sharedInstance];
  v5 = [v4 blendingLayerServer];
  v6 = (void *)[v3 initWithClientModelId:v2 blendingLayerServer:v5];

  return v6;
}

@end