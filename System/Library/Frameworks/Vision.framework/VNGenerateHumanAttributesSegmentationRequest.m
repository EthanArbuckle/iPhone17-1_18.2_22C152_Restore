@interface VNGenerateHumanAttributesSegmentationRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)_supportedHumanAttributesNamesRevision1;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)configuredCopyOfSelfWithBalancedQualityLevel;
- (id)description;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedHumanAttributesNamesAndReturnError:(id *)a3;
- (int64_t)dependencyProcessingOrdinality;
- (int64_t)qualityLevel;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setQualityLevel:(int64_t)a3;
@end

@implementation VNGenerateHumanAttributesSegmentationRequest

- (id)description
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VNGenerateHumanAttributesSegmentationRequest_description__block_invoke;
  aBlock[3] = &unk_1E5B1EF90;
  aBlock[4] = self;
  v3 = (void (**)(void *, int64_t))_Block_copy(aBlock);
  id v4 = [NSString alloc];
  v9.receiver = self;
  v9.super_class = (Class)VNGenerateHumanAttributesSegmentationRequest;
  v5 = [(VNGenerateSegmentationRequest *)&v9 description];
  v6 = v3[2](v3, [(VNGenerateHumanAttributesSegmentationRequest *)self qualityLevel]);
  v7 = (void *)[v4 initWithFormat:@"%@ qualityLevel=%@", v5, v6];

  return v7;
}

__CFString *__59__VNGenerateHumanAttributesSegmentationRequest_description__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) qualityLevel];
  v2 = @"Balanced";
  if (v1 != 1) {
    v2 = 0;
  }
  if (v1) {
    return v2;
  }
  else {
    return @"Accurate";
  }
}

- (void)setQualityLevel:(int64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setQualityLevel:a3];
}

- (int64_t)qualityLevel
{
  v2 = [(VNRequest *)self configuration];
  int64_t v3 = [v2 qualityLevel];

  return v3;
}

- (id)configuredCopyOfSelfWithBalancedQualityLevel
{
  int64_t v3 = objc_alloc_init(VNGenerateHumanAttributesSegmentationRequest);
  [(VNGenerateHumanAttributesSegmentationRequest *)v3 applyConfigurationOfRequest:self];
  [(VNGenerateHumanAttributesSegmentationRequest *)v3 setQualityLevel:1];

  return v3;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  objc_super v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v10 = [v8 session];
    id v11 = [(VNGenerateHumanAttributesSegmentationRequest *)self newDefaultDetectorOptionsForRequestRevision:a3 session:v10];
    v21[0] = v9;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v11 setObject:v12 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

    int64_t v13 = [(VNGenerateHumanAttributesSegmentationRequest *)self qualityLevel];
    if (v13)
    {
      if (v13 == 1)
      {
        if (a5)
        {
          v14 = 0;
          id v15 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Balanced quality level is handled by compound request"];
          BOOL v16 = 0;
LABEL_12:

          goto LABEL_13;
        }
      }
      else if (a5)
      {
        v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[VNGenerateHumanAttributesSegmentationRequest qualityLevel](self, "qualityLevel"));
        id v19 = +[VNError errorForInvalidOption:v18 named:@"qualityLevel"];
      }
    }
    else
    {
      uint64_t v17 = [(VNGenerateSegmentationRequest *)self performAccurateSegmentationInContext:v8 options:v11 error:a5];
      if (v17)
      {
        [(VNRequest *)self setResults:v17];
        BOOL v16 = 1;
        v14 = (void *)v17;
        goto LABEL_12;
      }
    }
    BOOL v16 = 0;
    v14 = 0;
    goto LABEL_12;
  }
  BOOL v16 = 0;
LABEL_13:

  return v16;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(1000, self);
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(VNGenerateHumanAttributesSegmentationRequest *)self qualityLevel];
  if (v5 == [v4 qualityLevel])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNGenerateHumanAttributesSegmentationRequest;
    BOOL v6 = [(VNGenerateSegmentationRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VNGenerateHumanAttributesSegmentationRequest;
  id v5 = [(VNRequest *)&v8 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[VNGenerateHumanAttributesSegmentationRequest qualityLevel](self, "qualityLevel"));
  [v5 setObject:v6 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_QualityLevel"];

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 != 3737841664)
  {
    if (a3 != 1)
    {
      if (a4)
      {
        +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
        objc_super v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    int64_t v6 = [(VNGenerateHumanAttributesSegmentationRequest *)self qualityLevel];
    if (v6 == 1)
    {
      objc_super v8 = +[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForSemanticSegmentationRequest];
      goto LABEL_18;
    }
    if (v6)
    {
      if (a4) {
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  int64_t v7 = [(VNGenerateHumanAttributesSegmentationRequest *)self qualityLevel];
  if (v7 == 1)
  {
    objc_super v8 = @"VNE5RTSegmentationMultiGeneratorType";
    goto LABEL_14;
  }
  if (!v7)
  {
LABEL_9:
    objc_super v8 = @"VNGuidedUpsamplingGeneratorType";
LABEL_14:
    objc_super v9 = v8;
    goto LABEL_18;
  }
  if (a4)
  {
LABEL_16:
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[VNGenerateHumanAttributesSegmentationRequest qualityLevel](self, "qualityLevel"));
    *a4 = +[VNError errorForInvalidOption:v10 named:@"qualityLevel"];
  }
LABEL_17:
  objc_super v8 = 0;
LABEL_18:

  return v8;
}

- (id)supportedHumanAttributesNamesAndReturnError:(id *)a3
{
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  if (v5 == 3737841664 || v5 == 1)
  {
    int64_t v6 = [(id)objc_opt_class() _supportedHumanAttributesNamesRevision1];
  }
  else if (a3)
  {
    id v7 = +[VNError errorForUnsupportedRevision:v5 ofRequest:self];
    int64_t v6 = 0;
    *a3 = v7;
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNGenerateHumanAttributesSegmentationRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNGenerateHumanAttributesSegmentationRequest;
    [(VNGenerateSegmentationRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      [(VNGenerateHumanAttributesSegmentationRequest *)self setQualityLevel:[(VNGenerateHumanAttributesSegmentationRequest *)v5 qualityLevel]];
      [(VNGenerateSegmentationRequest *)self setOutputPixelFormat:[(VNGenerateSegmentationRequest *)v5 outputPixelFormat]];
    }
  }
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 == 3737841664)
  {
    unint64_t v5 = @"VNGenerateHumanAttributesSegmentationRequestPrivateRevisionSemanticV6";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNGenerateHumanAttributesSegmentationRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    unint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)privateRevisionsSet
{
  if (+[VNGenerateHumanAttributesSegmentationRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNGenerateHumanAttributesSegmentationRequest privateRevisionsSet]::onceToken, &__block_literal_global_68);
  }
  v2 = (void *)+[VNGenerateHumanAttributesSegmentationRequest privateRevisionsSet]::privateRevisions;

  return v2;
}

void __67__VNGenerateHumanAttributesSegmentationRequest_privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:3737841664];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)+[VNGenerateHumanAttributesSegmentationRequest privateRevisionsSet]::privateRevisions;
  +[VNGenerateHumanAttributesSegmentationRequest privateRevisionsSet]::privateRevisions = v0;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNGenerateHumanAttributesSegmentationRequest revisionAvailability]::revisionAvailability;
}

+ (id)_supportedHumanAttributesNamesRevision1
{
  if (+[VNGenerateHumanAttributesSegmentationRequest _supportedHumanAttributesNamesRevision1]::onceToken != -1) {
    dispatch_once(&+[VNGenerateHumanAttributesSegmentationRequest _supportedHumanAttributesNamesRevision1]::onceToken, &__block_literal_global_11108);
  }
  id v2 = (void *)+[VNGenerateHumanAttributesSegmentationRequest _supportedHumanAttributesNamesRevision1]::supportedHumanAttributesNamesRevision1;

  return v2;
}

void __87__VNGenerateHumanAttributesSegmentationRequest__supportedHumanAttributesNamesRevision1__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"human_attribute_skin";
  v2[1] = @"human_attribute_hair";
  v2[2] = @"human_attribute_facial_hair";
  v2[3] = @"human_attribute_teeth";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  uint64_t v1 = (void *)+[VNGenerateHumanAttributesSegmentationRequest _supportedHumanAttributesNamesRevision1]::supportedHumanAttributesNamesRevision1;
  +[VNGenerateHumanAttributesSegmentationRequest _supportedHumanAttributesNamesRevision1]::supportedHumanAttributesNamesRevision1 = v0;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end