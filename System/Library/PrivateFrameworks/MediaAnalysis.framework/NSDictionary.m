@interface NSDictionary
- (BOOL)vcp_isValidEffectsResult;
- (id)vcp_effectsResult;
- (id)vcp_gatingDescriptions;
- (id)vcp_matchingScenes;
- (id)vcp_recipe;
- (unint64_t)vcp_longExposureSugestionState;
- (unint64_t)vcp_loopSugestionState;
@end

@implementation NSDictionary

- (id)vcp_effectsResult
{
  v2 = [(NSDictionary *)self vcp_results];
  v3 = [v2 objectForKeyedSubscript:@"LivePhotoEffectsResults"];
  v4 = [v3 objectAtIndexedSubscript:0];
  v5 = [v4 objectForKeyedSubscript:@"attributes"];

  return v5;
}

- (BOOL)vcp_isValidEffectsResult
{
  v3 = [(NSDictionary *)self objectForKey:@"loopSuggestionState"];
  if (v3)
  {
    v4 = [(NSDictionary *)self objectForKey:@"longExposureSuggestionState"];
    if (v4)
    {
      v5 = [(NSDictionary *)self objectForKey:@"livePhotoEffectsRecipe"];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)vcp_loopSugestionState
{
  v2 = [(NSDictionary *)self objectForKey:@"loopSuggestionState"];
  v3 = v2;
  if (v2) {
    id v4 = [v2 unsignedIntegerValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (unint64_t)vcp_longExposureSugestionState
{
  v2 = [(NSDictionary *)self objectForKey:@"longExposureSuggestionState"];
  v3 = v2;
  if (v2) {
    id v4 = [v2 unsignedIntegerValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (id)vcp_recipe
{
  v2 = [(NSDictionary *)self objectForKey:@"livePhotoEffectsRecipe"];
  id v3 = [objc_alloc((Class)VCPProtoLivePhotoEffectsRecipe) initWithData:v2];
  id v4 = [v3 exportToLegacyDictionary];

  return v4;
}

- (id)vcp_gatingDescriptions
{
  return [(NSDictionary *)self objectForKey:@"livePhotoEffectsGatingDescriptions"];
}

- (id)vcp_matchingScenes
{
  return [(NSDictionary *)self objectForKey:@"livePhotoEffectsMatchingScenes"];
}

@end