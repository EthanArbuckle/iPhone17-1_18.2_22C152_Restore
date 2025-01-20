@interface ATXHomeScreenPrediction
- (ATXHomeScreenPrediction)initWithBlendingCacheIdentifier:(id)a3 widgetSuggestions:(id)a4 stacksAffectedByDebugRotation:(id)a5;
- (NSArray)stacksAffectedByDebugRotation;
- (NSString)blendingCacheId;
- (id)suggestionForStackIdentifier:(id)a3;
- (id)suggestionsForAllStacks;
@end

@implementation ATXHomeScreenPrediction

- (NSString)blendingCacheId
{
  return self->_blendingCacheId;
}

- (ATXHomeScreenPrediction)initWithBlendingCacheIdentifier:(id)a3 widgetSuggestions:(id)a4 stacksAffectedByDebugRotation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXHomeScreenPrediction;
  v12 = [(ATXHomeScreenPrediction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_blendingCacheId, a3);
    objc_storeStrong((id *)&v13->_suggestions, a4);
    objc_storeStrong((id *)&v13->_stacksAffectedByDebugRotation, a5);
  }

  return v13;
}

- (id)suggestionsForAllStacks
{
  return [(NSDictionary *)self->_suggestions allValues];
}

- (id)suggestionForStackIdentifier:(id)a3
{
  return [(NSDictionary *)self->_suggestions objectForKeyedSubscript:a3];
}

- (NSArray)stacksAffectedByDebugRotation
{
  return self->_stacksAffectedByDebugRotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stacksAffectedByDebugRotation, 0);
  objc_storeStrong((id *)&self->_blendingCacheId, 0);

  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end