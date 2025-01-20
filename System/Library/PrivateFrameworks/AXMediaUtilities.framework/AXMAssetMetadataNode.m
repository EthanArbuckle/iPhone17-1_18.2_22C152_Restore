@interface AXMAssetMetadataNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (void)triggerWithAssetURL:(id)a3 cacheKey:(id)a4 resultHandler:(id)a5;
@end

@implementation AXMAssetMetadataNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return @"Asset Metadata";
}

- (void)triggerWithAssetURL:(id)a3 cacheKey:(id)a4 resultHandler:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18[0] = @"sourceProvidesResults";
  v18[1] = @"diagnosticsEnabled";
  v19[0] = MEMORY[0x1E4F1CC38];
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v19[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v13 = +[AXMVisionAnalysisOptions defaultOptions];
  v14 = +[AXMVisionPipelineContext contextWithSourceParameters:v12 options:v13];

  [v14 setShouldCallCompletionHandlersForEngineBusyError:1];
  if (v8)
  {
    v15 = +[AXMVisionFeatureAssetMetadata assetMetadataFromURL:v8];
    v16 = +[AXMVisionFeature featureWithAssetMetadata:v15];
    if (v16) {
      [v14 appendFeature:v16];
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)AXMAssetMetadataNode;
  [(AXMSourceNode *)&v17 triggerWithContext:v14 cacheKey:v9 resultHandler:v10];
}

@end