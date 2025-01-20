@interface AXMImageNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (void)produceImage:(id)a3;
- (void)triggerWithImage:(id)a3 options:(id)a4 cacheKey:(id)a5 resultHandler:(id)a6;
- (void)triggerWithImage:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7;
- (void)triggerWithImageAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7;
- (void)triggerWithImageAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 usePHAsset:(BOOL)a5 options:(id)a6 cacheKey:(id)a7 resultHandler:(id)a8;
- (void)triggerWithImageURL:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 options:(id)a6 cacheKey:(id)a7 resultHandler:(id)a8;
- (void)triggerWithImageURL:(id)a3 options:(id)a4 cacheKey:(id)a5 resultHandler:(id)a6;
- (void)triggerWithPixelBuffer:(__CVBuffer *)a3 exifOrientation:(unsigned int)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7;
@end

@implementation AXMImageNode

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
  return @"Image";
}

- (void)produceImage:(id)a3
{
}

id __29__AXMImageNode_produceImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [v4 objectForKeyedSubscript:@"input"];
  if ([v5 inputType] == 2)
  {
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    v7 = [v5 URL];
    v8 = [v7 path];
    if (v8)
    {
      v9 = [v5 URL];
      v10 = [v9 path];
      int v11 = [v6 fileExistsAtPath:v10] ^ 1;
    }
    else
    {
      int v11 = 1;
    }

    if (a3 && v11)
    {
      v12 = [v5 URL];
      v13 = [v12 path];
      _AXMMakeError(0, @"Input file URL does not exist: %@", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v20 = [v4 objectForKeyedSubscript:@"input"];

  return v20;
}

- (void)triggerWithImage:(id)a3 options:(id)a4 cacheKey:(id)a5 resultHandler:(id)a6
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    id v11 = +[AXMVisionAnalysisOptions defaultOptions];
  }
  uint64_t v14 = +[AXMPipelineContextInput inputWithCIImage:v10];
  v19[0] = @"input";
  v19[1] = @"diagnosticsEnabled";
  v20[0] = v14;
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v20[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  uint64_t v17 = +[AXMVisionPipelineContext contextWithSourceParameters:v16 options:v11];

  [v17 setShouldCallCompletionHandlersForEngineBusyError:1];
  v18.receiver = self;
  v18.super_class = (Class)AXMImageNode;
  [(AXMSourceNode *)&v18 triggerWithContext:v17 cacheKey:v12 resultHandler:v13];
}

- (void)triggerWithImageURL:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 options:(id)a6 cacheKey:(id)a7 resultHandler:(id)a8
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v26 = a7;
  id v25 = a8;
  if (!v17)
  {
    id v17 = +[AXMVisionAnalysisOptions defaultOptions];
  }
  objc_super v18 = +[AXMPipelineContextInput inputWithURL:v14 photoLibraryURL:v16];
  v28[0] = @"input";
  v28[1] = @"diagnosticsEnabled";
  v29[0] = v18;
  uint64_t v19 = self;
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v29[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  v22 = +[AXMVisionPipelineContext contextWithSourceParameters:v21 options:v17];

  [v22 setShouldCallCompletionHandlersForEngineBusyError:1];
  v23 = +[AXMVisionFeatureAssetMetadata assetMetadataFromURL:v14 localIdentifier:v15 photoLibraryURL:v16];
  v24 = +[AXMVisionFeature featureWithAssetMetadata:v23];
  if (v24) {
    [v22 appendFeature:v24];
  }
  v27.receiver = v19;
  v27.super_class = (Class)AXMImageNode;
  [(AXMSourceNode *)&v27 triggerWithContext:v22 cacheKey:v26 resultHandler:v25];
}

- (void)triggerWithImageURL:(id)a3 options:(id)a4 cacheKey:(id)a5 resultHandler:(id)a6
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    id v11 = +[AXMVisionAnalysisOptions defaultOptions];
  }
  id v14 = +[AXMPipelineContextInput inputWithURL:v10];
  v21[0] = @"input";
  v21[1] = @"diagnosticsEnabled";
  v22[0] = v14;
  id v15 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v22[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  id v17 = +[AXMVisionPipelineContext contextWithSourceParameters:v16 options:v11];

  [v17 setShouldCallCompletionHandlersForEngineBusyError:1];
  objc_super v18 = +[AXMVisionFeatureAssetMetadata assetMetadataFromURL:v10];
  uint64_t v19 = +[AXMVisionFeature featureWithAssetMetadata:v18];
  if (v19) {
    [v17 appendFeature:v19];
  }
  v20.receiver = self;
  v20.super_class = (Class)AXMImageNode;
  [(AXMSourceNode *)&v20 triggerWithContext:v17 cacheKey:v12 resultHandler:v13];
}

- (void)triggerWithPixelBuffer:(__CVBuffer *)a3 exifOrientation:(unsigned int)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  v22[2] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!v12)
  {
    id v12 = +[AXMVisionAnalysisOptions defaultOptions];
  }
  id v15 = +[AXMPixelBufferWrapper wrapperWithPixelBuffer:a3 orientation:v9];
  id v16 = +[AXMPipelineContextInput inputWithPixelBuffer:v15];
  v21[0] = @"input";
  v21[1] = @"diagnosticsEnabled";
  v22[0] = v16;
  id v17 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v22[1] = v17;
  objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  uint64_t v19 = +[AXMVisionPipelineContext contextWithSourceParameters:v18 options:v12];

  [v19 setShouldCallCompletionHandlersForEngineBusyError:1];
  v20.receiver = self;
  v20.super_class = (Class)AXMImageNode;
  [(AXMSourceNode *)&v20 triggerWithContext:v19 cacheKey:v13 resultHandler:v14];
}

- (void)triggerWithImage:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v14)
  {
    id v14 = +[AXMVisionAnalysisOptions defaultOptions];
  }
  id v17 = +[AXMPipelineContextInput inputWithCIImage:v12 photoLibraryURL:v13];
  v22[0] = @"input";
  v22[1] = @"diagnosticsEnabled";
  v23[0] = v17;
  objc_super v18 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v23[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  objc_super v20 = +[AXMVisionPipelineContext contextWithSourceParameters:v19 options:v14];

  [v20 setShouldCallCompletionHandlersForEngineBusyError:1];
  v21.receiver = self;
  v21.super_class = (Class)AXMImageNode;
  [(AXMSourceNode *)&v21 triggerWithContext:v20 cacheKey:v15 resultHandler:v16];
}

- (void)triggerWithImageAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v31 = a6;
  id v30 = a7;
  if (!v14)
  {
    id v14 = +[AXMVisionAnalysisOptions defaultOptions];
  }
  id v15 = [[AXMPhotoAssetData alloc] initWithImageAssetLocalIdentifier:v12 photoLibraryURL:v13 allowsNetworkAccess:0 needsImageData:1];
  id v16 = objc_alloc(MEMORY[0x1E4F1E050]);
  id v17 = [(AXMPhotoAssetData *)v15 imageData];
  objc_super v18 = (void *)[v16 initWithData:v17];

  uint64_t v19 = objc_msgSend(v18, "imageByApplyingOrientation:", -[AXMPhotoAssetData orientation](v15, "orientation"));

  v29 = (void *)v19;
  objc_super v20 = +[AXMPipelineContextInput inputWithCIImage:v19 photoLibraryURL:v13];
  v33[0] = @"input";
  v33[1] = @"diagnosticsEnabled";
  v34[0] = v20;
  objc_super v21 = self;
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v34[1] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  v24 = +[AXMVisionPipelineContext contextWithSourceParameters:v23 options:v14];

  [v24 setShouldCallCompletionHandlersForEngineBusyError:1];
  id v25 = [(AXMPhotoAssetData *)v15 creationDate];
  id v26 = [(AXMPhotoAssetData *)v15 UTI];
  objc_super v27 = +[AXMVisionFeatureAssetMetadata assetMetadataWithLocalIdentifier:v12 photoLibraryURL:v13 creationDate:v25 UTI:v26];

  v28 = +[AXMVisionFeature featureWithAssetMetadata:v27];
  if (v28) {
    [v24 appendFeature:v28];
  }
  v32.receiver = v21;
  v32.super_class = (Class)AXMImageNode;
  [(AXMSourceNode *)&v32 triggerWithContext:v24 cacheKey:v31 resultHandler:v30];
}

- (void)triggerWithImageAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 usePHAsset:(BOOL)a5 options:(id)a6 cacheKey:(id)a7 resultHandler:(id)a8
{
  void v33[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (a5)
  {
    id v28 = v17;
    if (!v16)
    {
      id v16 = +[AXMVisionAnalysisOptions defaultOptions];
    }
    uint64_t v19 = [[AXMPhotoAssetData alloc] initWithImageAssetLocalIdentifier:v14 photoLibraryURL:v15 allowsNetworkAccess:0 needsImageData:0];
    objc_super v27 = +[AXMPipelineContextInput inputWithPHAssetLocalIdentifier:v14 photoLibraryURL:v15];
    v32[0] = @"input";
    v32[1] = @"diagnosticsEnabled";
    v33[0] = v27;
    id v30 = self;
    objc_super v20 = objc_msgSend(NSNumber, "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
    v33[1] = v20;
    objc_super v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    v22 = +[AXMVisionPipelineContext contextWithSourceParameters:v21 options:v16];

    [v22 setShouldCallCompletionHandlersForEngineBusyError:1];
    v23 = [(AXMPhotoAssetData *)v19 creationDate];
    v29 = v19;
    v24 = [(AXMPhotoAssetData *)v19 UTI];
    id v25 = +[AXMVisionFeatureAssetMetadata assetMetadataWithLocalIdentifier:v14 photoLibraryURL:v15 creationDate:v23 UTI:v24];

    id v26 = +[AXMVisionFeature featureWithAssetMetadata:v25];
    if (v26) {
      [v22 appendFeature:v26];
    }
    v31.receiver = v30;
    v31.super_class = (Class)AXMImageNode;
    id v17 = v28;
    [(AXMSourceNode *)&v31 triggerWithContext:v22 cacheKey:v28 resultHandler:v18];
  }
  else
  {
    [(AXMImageNode *)self triggerWithImageAssetLocalIdentifier:v14 photoLibraryURL:v15 options:v16 cacheKey:v17 resultHandler:v18];
  }
}

@end