@interface ATXCandidateRelevanceModelGlobals
+ (id)sharedInstance;
- (ATXCandidateRelevanceModelGlobals)init;
- (BOOL)isPipelineEnabled;
- (int)maxCategoricalFeaturesCount;
@end

@implementation ATXCandidateRelevanceModelGlobals

- (ATXCandidateRelevanceModelGlobals)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXCandidateRelevanceModelGlobals;
  v2 = [(ATXCandidateRelevanceModelGlobals *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4AF08] dictionaryWithLegacyPathForClass:objc_opt_class()];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F4AF10]) initWithAssetContents:v3];
    uint64_t v5 = [v4 abGroupContents];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_30 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_30, &__block_literal_global_169);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_39;
  return v2;
}

void __51__ATXCandidateRelevanceModelGlobals_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_39;
  sharedInstance__pasExprOnceResult_39 = v1;
}

- (BOOL)isPipelineEnabled
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"IsPipelineEnabled"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (int)maxCategoricalFeaturesCount
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaxCategoricalFeaturesCount"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 100;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end