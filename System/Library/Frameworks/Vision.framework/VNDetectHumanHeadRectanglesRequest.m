@interface VNDetectHumanHeadRectanglesRequest
+ (Class)configurationClass;
+ (NSIndexSet)revisionsSupportingPrecisionRecallThresholdOverride;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)canOverridePrecisionRecallThreshold;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (NSNumber)precisionRecallThresholdOverride;
- (float)precisionRecallThreshold;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (int64_t)dependencyProcessingOrdinality;
- (void)_setPrecisionRecallThresholdOverride:(void *)a1;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)resetPrecisionRecallThreshold;
- (void)setPrecisionRecallThreshold:(float)a3;
@end

@implementation VNDetectHumanHeadRectanglesRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    v7 = [(VNRequest *)self applicableDetectorClassAndOptions:0 forRevision:a3 error:0];
    id v8 = [NSString alloc];
    v9 = (objc_class *)objc_opt_class();
    v10 = VNRequestRevisionString(v9, a3);
    v11 = NSStringFromClass(v7);
    v12 = (void *)[v8 initWithFormat:@"%@ is handled by %@", v10, v11];

    *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v12];
  }
  return 0;
}

- (void)resetPrecisionRecallThreshold
{
}

- (void)_setPrecisionRecallThresholdOverride:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v3 = [a1 configuration];
    [v3 setPrecisionRecallThresholdOverride:v4];
  }
}

- (void)setPrecisionRecallThreshold:(float)a3
{
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    objc_msgSend(NSNumber, "numberWithFloat:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    -[VNDetectHumanHeadRectanglesRequest _setPrecisionRecallThresholdOverride:](self, v5);
  }
}

- (float)precisionRecallThreshold
{
  v3 = (void *)MEMORY[0x1A6257080](self, a2);
  id v4 = [(VNDetectHumanHeadRectanglesRequest *)self precisionRecallThresholdOverride];
  id v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    float v7 = v6;
  }
  else
  {
    id v15 = 0;
    id v8 = [(VNRequest *)self applicableDetectorClassAndOptions:&v15 forRevision:[(VNRequest *)self resolvedRevision] error:0];
    id v9 = v15;
    float v7 = -1.0;
    if (v8 && [(objc_class *)v8 isSubclassOfClass:objc_opt_class()])
    {
      v10 = [(objc_class *)v8 defaultFilterThresholdsForOptions:v9 error:0];
      v11 = [v10 objectForKeyedSubscript:@"VNShotflowDetectorFilterThresholdKey_HumanHead"];
      v12 = v11;
      if (v11)
      {
        [v11 floatValue];
        float v7 = v13;
      }
    }
  }
  return v7;
}

- (NSNumber)precisionRecallThresholdOverride
{
  v2 = [(VNRequest *)self configuration];
  v3 = [v2 precisionRecallThresholdOverride];

  return (NSNumber *)v3;
}

- (BOOL)canOverridePrecisionRecallThreshold
{
  v3 = (void *)MEMORY[0x1A6257080](self, a2);
  id v10 = 0;
  id v4 = [(VNRequest *)self applicableDetectorClassAndOptions:&v10 forRevision:[(VNRequest *)self resolvedRevision] error:0];
  id v5 = v10;
  if (v4 && [(objc_class *)v4 isSubclassOfClass:objc_opt_class()])
  {
    float v6 = [(objc_class *)v4 defaultFilterThresholdsForOptions:v5 error:0];
    float v7 = [v6 objectForKeyedSubscript:@"VNShotflowDetectorFilterThresholdKey_HumanFace"];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(2000, self);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 - 3737841664u < 4 || a3 == 1)
  {
    id v5 = @"VNANFDMultiDetectorType";
    float v6 = @"VNANFDMultiDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    id v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNDetectHumanHeadRectanglesRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNDetectHumanHeadRectanglesRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(VNDetectHumanHeadRectanglesRequest *)v4 precisionRecallThresholdOverride];
      -[VNDetectHumanHeadRectanglesRequest _setPrecisionRecallThresholdOverride:](self, v5);
    }
  }
}

+ (NSIndexSet)revisionsSupportingPrecisionRecallThresholdOverride
{
  v3 = (void *)MEMORY[0x1A6257080](a1, a2);
  id v4 = [a1 allSupportedRevisions];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__VNDetectHumanHeadRectanglesRequest_revisionsSupportingPrecisionRecallThresholdOverride__block_invoke;
  v7[3] = &__block_descriptor_40_e12_B24__0Q8_B16l;
  v7[4] = a1;
  id v5 = [v4 indexesPassingTest:v7];

  return (NSIndexSet *)v5;
}

uint64_t __89__VNDetectHumanHeadRectanglesRequest_revisionsSupportingPrecisionRecallThresholdOverride__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = self;
  id v4 = (void *)MEMORY[0x1A6257080](v3);
  id v5 = objc_alloc_init(VNDetectHumanHeadRectanglesRequest);
  uint64_t v6 = [(VNRequest *)v5 setRevision:a2 error:0]
    && [(VNDetectHumanHeadRectanglesRequest *)v5 canOverridePrecisionRecallThreshold];

  return v6;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 4)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNDetectHumanHeadRectanglesRequest;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E5B1AB80[a3 - 3737841664u];
  }

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectHumanHeadRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNDetectHumanHeadRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_45);
  }
  v2 = (void *)+[VNDetectHumanHeadRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

void __70__VNDetectHumanHeadRectanglesRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:3737841664];
  [v2 addIndex:3737841665];
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution]) {
    [v2 addIndex:3737841666];
  }
  [v2 addIndex:3737841667];
  uint64_t v0 = [v2 copy];
  v1 = (void *)+[VNDetectHumanHeadRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
  +[VNDetectHumanHeadRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = v0;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectHumanHeadRectanglesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end