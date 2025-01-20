@interface CPLFeature
+ (id)featureWithName:(id)a3;
- (BOOL)disableFeatureInStore:(id)a3 error:(id *)a4;
- (BOOL)enableFeatureInStore:(id)a3 error:(id *)a4;
- (BOOL)handleScopeWhenFeatureIsDisabled:(id)a3 scopeType:(int64_t)a4 store:(id)a5 error:(id *)a6;
- (BOOL)shouldDisableScopeWhenFeatureIsDisabled:(id)a3;
@end

@implementation CPLFeature

- (BOOL)handleScopeWhenFeatureIsDisabled:(id)a3 scopeType:(int64_t)a4 store:(id)a5 error:(id *)a6
{
  return 1;
}

- (BOOL)shouldDisableScopeWhenFeatureIsDisabled:(id)a3
{
  return 0;
}

- (BOOL)enableFeatureInStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLFeature.m"];
  v9 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, v8, 45, @"%@ should be implemented by subclasses", v9 object file lineNumber description];

  abort();
}

- (BOOL)disableFeatureInStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLFeature.m"];
  v9 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, v8, 40, @"%@ should be implemented by subclasses", v9 object file lineNumber description];

  abort();
}

+ (id)featureWithName:(id)a3
{
  uint64_t v3 = featureWithName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&featureWithName__onceToken, &__block_literal_global_17598);
  }
  v5 = [(id)featureWithName__features objectForKeyedSubscript:v4];

  return v5;
}

void __30__CPLFeature_featureWithName___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"MomentShare";
  v0 = objc_alloc_init(CPLMomentShareFeature);
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)featureWithName__features;
  featureWithName__features = v1;
}

@end