@interface VNGenerateImageSegmentationRequest
+ (Class)configurationClass;
+ (void)downloadModelForTests:(id)a3;
- (BOOL)disableConnectedComponentRefinement;
- (BOOL)fillGapsInMask;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (NSArray)targetPoints;
- (VNGenerateImageSegmentationRequest)init;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedFeaturesAndReturnError:(id *)a3;
- (int64_t)maximumTargetPoints;
- (unint64_t)minimumMaskPixelCount;
- (void)setDisableConnectedComponentRefinement:(BOOL)a3;
- (void)setFillGapsInMask:(BOOL)a3;
- (void)setMinimumMaskPixelCount:(unint64_t)a3;
- (void)setTargetPoints:(id)a3;
@end

@implementation VNGenerateImageSegmentationRequest

- (void).cxx_destruct
{
}

- (void)setMinimumMaskPixelCount:(unint64_t)a3
{
  self->_minimumMaskPixelCount = a3;
}

- (unint64_t)minimumMaskPixelCount
{
  return self->_minimumMaskPixelCount;
}

- (void)setFillGapsInMask:(BOOL)a3
{
  self->_fillGapsInMask = a3;
}

- (BOOL)fillGapsInMask
{
  return self->_fillGapsInMask;
}

- (void)setDisableConnectedComponentRefinement:(BOOL)a3
{
  self->_disableConnectedComponentRefinement = a3;
}

- (BOOL)disableConnectedComponentRefinement
{
  return self->_disableConnectedComponentRefinement;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 session];
  id v22 = 0;
  v10 = [(VNRequest *)self applicableDetectorAndOptions:&v22 forRevision:a3 loadedInSession:v9 error:a5];
  id v11 = v22;
  if (v10)
  {
    uint64_t v12 = [v8 imageBufferAndReturnError:a5];
    v13 = (void *)v12;
    if (v12)
    {
      v23[0] = v12;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [v11 setObject:v14 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      v15 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[VNGenerateImageSegmentationRequest disableConnectedComponentRefinement](self, "disableConnectedComponentRefinement"));
      [v11 setObject:v15 forKeyedSubscript:@"disableCCRefinement"];

      [v11 setObject:self->_targetPoints forKeyedSubscript:@"targetPts"];
      v16 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[VNGenerateImageSegmentationRequest minimumMaskPixelCount](self, "minimumMaskPixelCount"));
      [v11 setObject:v16 forKeyedSubscript:@"minMask"];

      v17 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[VNGenerateImageSegmentationRequest fillGapsInMask](self, "fillGapsInMask"));
      [v11 setObject:v17 forKeyedSubscript:@"fillMaskGaps"];

      uint64_t v18 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v19 = objc_msgSend(v10, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v18, v11, self, a5, 0);
      BOOL v20 = v19 != 0;
      if (v19) {
        [(VNRequest *)self setResults:v19];
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (+[VNImageSegmenter supportsExecution])
  {
    if (a3 == 1)
    {
      v7 = @"VNImageSegmenterType";
      id v8 = @"VNImageSegmenterType";
      goto LABEL_10;
    }
    if (a4)
    {
      v9 = +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
      goto LABEL_8;
    }
  }
  else if (a4)
  {
    v9 = +[VNError errorWithCode:22 message:@"Requires newer ANE device"];
LABEL_8:
    v7 = 0;
    *a4 = v9;
    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VNGenerateImageSegmentationRequest;
  return [(VNRequest *)&v5 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
}

- (id)supportedFeaturesAndReturnError:(id *)a3
{
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  id v10 = 0;
  v6 = [(VNRequest *)self applicableDetectorClassAndOptions:&v10 forRevision:v5 error:a3];
  id v7 = v10;
  if (!v6) {
    goto LABEL_6;
  }
  if ([(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
  {
    id v8 = [(objc_class *)v6 supportedFeaturesForOptions:v7 error:a3];
    goto LABEL_7;
  }
  if (a3)
  {
    +[VNError errorForUnsupportedRevision:v5 ofRequest:self];
    id v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    id v8 = 0;
  }
LABEL_7:

  return v8;
}

- (int64_t)maximumTargetPoints
{
  id v5 = 0;
  v2 = [(VNRequest *)self applicableDetectorClassAndOptions:&v5 forRevision:[(VNRequest *)self resolvedRevision] error:0];
  id v3 = v5;
  if (v2)
  {
    if ([(objc_class *)v2 isSubclassOfClass:objc_opt_class()]) {
      v2 = (objc_class *)[(objc_class *)v2 maximumTargetPoints];
    }
    else {
      v2 = 0;
    }
  }

  return (int64_t)v2;
}

- (NSArray)targetPoints
{
  return self->_targetPoints;
}

- (void)setTargetPoints:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)[v6 copy];
  targetPoints = self->_targetPoints;
  self->_targetPoints = v4;
}

- (VNGenerateImageSegmentationRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)VNGenerateImageSegmentationRequest;
  v2 = [(VNRequest *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    v4 = [[VNFgBgE5MLInstanceSegmenterThresholds alloc] initWithRevision:[(VNRequest *)v2 resolvedRevision] error:0];
    [(VNFgBgE5MLInstanceSegmenterThresholds *)v4 defaultValidMinimumMaskPixelCount];
    v3->_minimumMaskPixelCount = (unint64_t)v5;
    id v6 = v3;
  }
  return v3;
}

+ (void)downloadModelForTests:(id)a3
{
  float v5 = (void (**)(id, void))a3;
  id v3 = objc_alloc_init(VNModelCatalogBridgingInterface);
  v4 = [(VNModelCatalogBridgingInterface *)v3 foregroundBackgroundSegmentationModelBundleURLWithError:0];
  if (v4) {
    v5[2](v5, 0);
  }
  else {
    [(VNModelCatalogBridgingInterface *)v3 downloadForegroundBackgroundSegmentationModelBundleWithCompletionHandler:v5];
  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end