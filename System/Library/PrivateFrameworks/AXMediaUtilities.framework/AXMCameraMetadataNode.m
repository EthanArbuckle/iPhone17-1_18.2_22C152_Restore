@interface AXMCameraMetadataNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (void)triggerWithCameraType:(int64_t)a3 cacheKey:(id)a4 resultHandler:(id)a5;
@end

@implementation AXMCameraMetadataNode

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
  return @"Camera Metadata";
}

- (void)triggerWithCameraType:(int64_t)a3 cacheKey:(id)a4 resultHandler:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  v10 = +[AXMVisionAnalysisOptions defaultOptions];
  v16[0] = @"sourceProvidesResults";
  v16[1] = @"diagnosticsEnabled";
  v17[0] = MEMORY[0x1E4F1CC38];
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v17[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v13 = +[AXMVisionPipelineContext contextWithSourceParameters:v12 options:v10];

  v14 = +[AXMVisionFeature featureWithCameraType:a3];
  [v13 appendFeature:v14];
  v15.receiver = self;
  v15.super_class = (Class)AXMCameraMetadataNode;
  [(AXMSourceNode *)&v15 triggerWithContext:v13 cacheKey:v9 resultHandler:v8];
}

@end