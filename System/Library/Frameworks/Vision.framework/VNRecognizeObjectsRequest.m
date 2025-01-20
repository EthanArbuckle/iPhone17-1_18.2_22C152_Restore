@interface VNRecognizeObjectsRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)knownObjectIdentifiersRecognizedByRequestRevision:(unint64_t)a3 error:(id *)a4;
+ (id)privateRevisionsSet;
- (BOOL)useImageAnalyzerScaling;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSArray)targetedIdentifiers;
- (float)modelMinimumDetectionConfidence;
- (float)modelNonMaximumSuppressionThreshold;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedIdentifiersAndReturnError:(id *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
- (void)setModelMinimumDetectionConfidence:(float)a3;
- (void)setModelNonMaximumSuppressionThreshold:(float)a3;
- (void)setTargetedIdentifiers:(id)a3;
- (void)setUseImageAnalyzerScaling:(BOOL)a3;
@end

@implementation VNRecognizeObjectsRequest

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  [(VNRecognizeObjectsRequest *)self modelMinimumDetectionConfidence];
  float v6 = v5;
  [v4 modelMinimumDetectionConfidence];
  if (v6 != v7) {
    goto LABEL_5;
  }
  [(VNRecognizeObjectsRequest *)self modelNonMaximumSuppressionThreshold];
  float v9 = v8;
  [v4 modelNonMaximumSuppressionThreshold];
  if (v9 != v10) {
    goto LABEL_5;
  }
  v11 = [(VNRecognizeObjectsRequest *)self targetedIdentifiers];
  v12 = [v4 targetedIdentifiers];
  char v13 = VisionCoreEquivalentOrNilUnorderedArrays();

  if (v13)
  {
    v16.receiver = self;
    v16.super_class = (Class)VNRecognizeObjectsRequest;
    BOOL v14 = [(VNImageBasedRequest *)&v16 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
LABEL_5:
    BOOL v14 = 0;
  }

  return v14;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VNRecognizeObjectsRequest;
  id v6 = [(VNRequest *)&v17 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  float v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNRecognizeObjectsRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  [v6 setObject:v7 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];

  float v8 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v8 revision:a3])
  {
    float v9 = [[VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration alloc] initWithObservationsRecipient:self];
    v18[0] = v9;
    float v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v6 setObject:v10 forKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"];

    id v11 = v6;
  }
  else
  {
    unint64_t v12 = +[VNImageAnalyzerMultiDetector modelForRequestClass:v8 revision:a3];
    if (v12)
    {
      char v13 = [NSNumber numberWithUnsignedInteger:v12];
      [v6 setObject:v13 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];

      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_RequireObjDetNet"];
      BOOL v14 = [[VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration alloc] initWithObservationsRecipient:self];
      [v6 setObject:v14 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_RecognizeObjectsConfiguration"];
    }
    id v15 = v6;
  }

  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  float v7 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v7 revision:a3])
  {
    float v8 = @"VNCoreSceneUnderstandingDetectorType";
LABEL_5:
    float v9 = v8;
    goto LABEL_6;
  }
  if (+[VNImageAnalyzerMultiDetector modelForRequestClass:v7 revision:a3])
  {
    float v8 = @"VNImageAnalyzerMultiDetectorType";
    goto LABEL_5;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    float v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    float v8 = 0;
  }
LABEL_6:

  return v8;
}

- (void)setTargetedIdentifiers:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setTargetedIdentifiers:v5];
}

- (NSArray)targetedIdentifiers
{
  v2 = [(VNRequest *)self configuration];
  v3 = [v2 targetedIdentifiers];

  return (NSArray *)v3;
}

- (void)setModelNonMaximumSuppressionThreshold:(float)a3
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = a3;
  [v5 setModelNonMaximumSuppressionThreshold:v4];
}

- (float)modelNonMaximumSuppressionThreshold
{
  v2 = [(VNRequest *)self configuration];
  [v2 modelNonMaximumSuppressionThreshold];
  float v4 = v3;

  return v4;
}

- (void)setModelMinimumDetectionConfidence:(float)a3
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = a3;
  [v5 setModelMinimumDetectionConfidence:v4];
}

- (float)modelMinimumDetectionConfidence
{
  v2 = [(VNRequest *)self configuration];
  [v2 modelMinimumDetectionConfidence];
  float v4 = v3;

  return v4;
}

- (void)setUseImageAnalyzerScaling:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setUseImageAnalyzerScaling:v3];
}

- (BOOL)useImageAnalyzerScaling
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 useImageAnalyzerScaling];

  return v3;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setImageCropAndScaleOption:a3];
}

- (unint64_t)imageCropAndScaleOption
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 imageCropAndScaleOption];

  return v3;
}

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  id v14 = 0;
  id v6 = [(VNRequest *)self applicableDetectorClassAndOptions:&v14 forRevision:v5 error:a3];
  id v7 = v14;
  if (!v6)
  {
    float v8 = 0;
    goto LABEL_5;
  }
  if ([(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
  {
    float v8 = [(objc_class *)v6 allRecognizedObjectIdentifiersWithConfigurationOptions:v7 error:a3];
LABEL_5:
    id v9 = v7;
    goto LABEL_13;
  }
  float v10 = objc_alloc_init(VNSession);
  id v13 = v7;
  id v11 = [(VNRequest *)self applicableDetectorAndOptions:&v13 forRevision:v5 loadedInSession:v10 error:a3];
  id v9 = v13;

  if (!v11) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a3)
    {
      +[VNError errorForUnsupportedRevision:[(VNRequest *)self resolvedRevision] ofRequest:self];
      float v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    float v8 = 0;
    goto LABEL_12;
  }
  float v8 = [v11 allRecognizedObjectsIdentifiersWithOptions:v9 error:a3];
LABEL_12:

LABEL_13:

  return v8;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  unint64_t v7 = +[VNImageAnalyzerMultiDetector modelForRequestClass:a1 revision:a3];
  if (v7 != +[VNImageAnalyzerMultiDetector modelForRequestClass:a1 revision:a4])return 0; {
  v9.receiver = a1;
  }
  v9.super_class = (Class)&OBJC_METACLASS___VNRecognizeObjectsRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u > 3) {
    return 0;
  }
  else {
    return (id)*((void *)&off_1E5B1CC00 + a3 - 3737841664u);
  }
}

+ (id)privateRevisionsSet
{
  if (+[VNRecognizeObjectsRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNRecognizeObjectsRequest privateRevisionsSet]::onceToken, &__block_literal_global_8432);
  }
  v2 = (void *)+[VNRecognizeObjectsRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __48__VNRecognizeObjectsRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNRecognizeObjectsRequest privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF003uLL, a2, a3, a4, a5, a6, a7, a8, 0);

  return MEMORY[0x1F41817F8]();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNRecognizeObjectsRequest revisionAvailability]::ourRevisionAvailability;
}

+ (id)knownObjectIdentifiersRecognizedByRequestRevision:(unint64_t)a3 error:(id *)a4
{
  id v6 = objc_alloc_init((Class)a1);
  if ([v6 setRevision:a3 error:a4])
  {
    unint64_t v7 = [v6 supportedIdentifiersAndReturnError:a4];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

@end