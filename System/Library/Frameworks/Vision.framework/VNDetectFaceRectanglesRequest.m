@interface VNDetectFaceRectanglesRequest
+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4;
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (NSIndexSet)revisionsSupportingPrecisionRecallThresholdOverride;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)canOverridePrecisionRecallThreshold;
- (BOOL)faceCoreEnhanceEyesAndMouthLocalization;
- (BOOL)faceCoreExtractBlink;
- (BOOL)faceCoreExtractSmile;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)warmUpSession:(id)a3 error:(id *)a4;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSNumber)faceCoreInitialAngle;
- (NSNumber)faceCoreMinFaceSize;
- (NSNumber)faceCoreNumberOfDetectionAngles;
- (float)precisionRecallThreshold;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)precisionRecallThresholdOverride;
- (int64_t)dependencyProcessingOrdinality;
- (unint64_t)faceCoreType;
- (void)_setPrecisionRecallThresholdOverride:(void *)a1;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)resetPrecisionRecallThreshold;
- (void)setFaceCoreEnhanceEyesAndMouthLocalization:(BOOL)a3;
- (void)setFaceCoreExtractBlink:(BOOL)a3;
- (void)setFaceCoreExtractSmile:(BOOL)a3;
- (void)setFaceCoreInitialAngle:(id)a3;
- (void)setFaceCoreMinFaceSize:(id)a3;
- (void)setFaceCoreNumberOfDetectionAngles:(id)a3;
- (void)setFaceCoreType:(unint64_t)a3;
- (void)setPrecisionRecallThreshold:(float)a3;
- (void)setProcessedResults:(id)a3;
@end

@implementation VNDetectFaceRectanglesRequest

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(2000, self);
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectFaceRectanglesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if ((uint64_t)a3 <= 3737841664)
  {
    if (a3 - 1 >= 2)
    {
      if (a3 != 3 && a3 != 3737841664) {
        goto LABEL_14;
      }
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  if (a3 - 3737841666u < 5)
  {
LABEL_7:
    v5 = @"VNANFDMultiDetectorType";
LABEL_10:
    v6 = v5;
    goto LABEL_11;
  }
  if (a3 == 3737841665)
  {
LABEL_9:
    v5 = @"VNFaceDetectorType";
    goto LABEL_10;
  }
LABEL_14:
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
LABEL_11:

  return v5;
}

- (id)precisionRecallThresholdOverride
{
  v2 = [(VNRequest *)self configuration];
  v3 = [v2 precisionRecallThresholdOverride];

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectFaceRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNDetectFaceRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_139_25794);
  }
  v2 = (void *)+[VNDetectFaceRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

void __65__VNDetectFaceRectanglesRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:3737841665];
  [v2 addIndex:3737841664];
  [v2 addIndex:3737841666];
  [v2 addIndex:3737841668];
  [v2 addIndex:3737841669];
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution]) {
    [v2 addIndex:3737841667];
  }
  [v2 addIndex:3737841670];
  uint64_t v0 = [v2 copy];
  v1 = (void *)+[VNDetectFaceRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
  +[VNDetectFaceRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = v0;
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
    -[VNDetectFaceRectanglesRequest _setPrecisionRecallThresholdOverride:](self, v5);
  }
}

- (float)precisionRecallThreshold
{
  v3 = (void *)MEMORY[0x1A6257080](self, a2);
  id v4 = [(VNDetectFaceRectanglesRequest *)self precisionRecallThresholdOverride];
  id v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    float v7 = v6;
  }
  else
  {
    id v15 = 0;
    v8 = [(VNRequest *)self applicableDetectorClassAndOptions:&v15 forRevision:[(VNRequest *)self resolvedRevision] error:0];
    id v9 = v15;
    float v7 = -1.0;
    if (v8 && [(objc_class *)v8 isSubclassOfClass:objc_opt_class()])
    {
      v10 = [(objc_class *)v8 defaultFilterThresholdsForOptions:v9 error:0];
      v11 = [v10 objectForKeyedSubscript:@"VNShotflowDetectorFilterThresholdKey_HumanFace"];
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

- (void)setFaceCoreExtractSmile:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setFaceCoreExtractSmile:v3];
}

- (BOOL)faceCoreExtractSmile
{
  id v2 = [(VNRequest *)self configuration];
  char v3 = [v2 faceCoreExtractSmile];

  return v3;
}

- (void)setFaceCoreExtractBlink:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setFaceCoreExtractBlink:v3];
}

- (BOOL)faceCoreExtractBlink
{
  id v2 = [(VNRequest *)self configuration];
  char v3 = [v2 faceCoreExtractBlink];

  return v3;
}

- (void)setFaceCoreEnhanceEyesAndMouthLocalization:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setFaceCoreEnhanceEyesAndMouthLocalization:v3];
}

- (BOOL)faceCoreEnhanceEyesAndMouthLocalization
{
  id v2 = [(VNRequest *)self configuration];
  char v3 = [v2 faceCoreEnhanceEyesAndMouthLocalization];

  return v3;
}

- (void)setFaceCoreInitialAngle:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setFaceCoreInitialAngle:v5];
}

- (NSNumber)faceCoreInitialAngle
{
  id v2 = [(VNRequest *)self configuration];
  char v3 = [v2 faceCoreInitialAngle];

  return (NSNumber *)v3;
}

- (void)setFaceCoreNumberOfDetectionAngles:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setFaceCoreNumberOfDetectionAngles:v5];
}

- (NSNumber)faceCoreNumberOfDetectionAngles
{
  id v2 = [(VNRequest *)self configuration];
  char v3 = [v2 faceCoreNumberOfDetectionAngles];

  return (NSNumber *)v3;
}

- (void)setFaceCoreMinFaceSize:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setFaceCoreMinFaceSize:v5];
}

- (NSNumber)faceCoreMinFaceSize
{
  id v2 = [(VNRequest *)self configuration];
  char v3 = [v2 faceCoreMinFaceSize];

  return (NSNumber *)v3;
}

- (void)setFaceCoreType:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setFaceCoreType:a3];
}

- (unint64_t)faceCoreType
{
  id v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 faceCoreType];

  return v3;
}

- (void)setProcessedResults:(id)a3
{
  id v4 = a3;
  if ([(VNRequest *)self resolvedRevision] == 1)
  {
    id v5 = [v4 indexesOfObjectsPassingTest:&__block_literal_global_25732];
    if ([v5 count])
    {
      float v6 = (void *)[v4 mutableCopy];
      [v6 removeObjectsAtIndexes:v5];

      id v4 = v6;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)VNDetectFaceRectanglesRequest;
  [(VNRequest *)&v7 setProcessedResults:v4];
}

uint64_t __53__VNDetectFaceRectanglesRequest_setProcessedResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRevision1DetectedRectanglesCompatible] ^ 1;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  uint64_t v6 = [v4 resolvedRevision];
  uint64_t v7 = v6;
  if (v5 != 3737841665 && v6 != 3737841665)
  {
LABEL_3:
    if (((v7 - 3737841667) | (v5 - 3737841667u)) < 4)
    {
      BOOL v12 = 1;
      goto LABEL_18;
    }
    if (v5 - 3737841667u > 3 != (unint64_t)(v7 - 3737841667) < 4)
    {
      BOOL v8 = [(VNRequest *)self configuration];
      id v9 = [v8 precisionRecallThresholdOverride];
      id v10 = [v4 precisionRecallThresholdOverride];
      char v11 = VisionCoreEqualOrNilObjects();

      if (v11)
      {
        v23.receiver = self;
        v23.super_class = (Class)VNDetectFaceRectanglesRequest;
        BOOL v12 = [(VNImageBasedRequest *)&v23 willAcceptCachedResultsFromRequestWithConfiguration:v4];
        goto LABEL_18;
      }
    }
LABEL_16:
    BOOL v12 = 0;
    goto LABEL_18;
  }
  BOOL v12 = 0;
  if (v5 == 3737841665 && v6 == 3737841665)
  {
    unint64_t v13 = [(VNDetectFaceRectanglesRequest *)self faceCoreType];
    if (v13 != [v4 faceCoreType]) {
      goto LABEL_16;
    }
    v14 = [(VNDetectFaceRectanglesRequest *)self faceCoreMinFaceSize];
    id v15 = [v4 faceCoreMinFaceSize];
    if (v14 == v15)
    {
      v16 = [(VNDetectFaceRectanglesRequest *)self faceCoreNumberOfDetectionAngles];
      v17 = [v4 faceCoreNumberOfDetectionAngles];
      if (v16 == v17)
      {
        int v18 = [(VNDetectFaceRectanglesRequest *)self faceCoreEnhanceEyesAndMouthLocalization];
        if (v18 == [v4 faceCoreEnhanceEyesAndMouthLocalization])
        {
          int v19 = [(VNDetectFaceRectanglesRequest *)self faceCoreExtractBlink];
          if (v19 == [v4 faceCoreExtractBlink])
          {
            int v21 = [(VNDetectFaceRectanglesRequest *)self faceCoreExtractSmile];
            int v22 = [v4 faceCoreExtractSmile];

            if (v21 != v22) {
              goto LABEL_16;
            }
            goto LABEL_3;
          }
        }
      }

      id v15 = v14;
    }

    goto LABEL_16;
  }
LABEL_18:

  return v12;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNDetectFaceRectanglesRequest *)a3;
  if (self != v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)VNDetectFaceRectanglesRequest;
    [(VNImageBasedRequest *)&v10 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      [(VNDetectFaceRectanglesRequest *)self setFaceCoreType:[(VNDetectFaceRectanglesRequest *)v5 faceCoreType]];
      uint64_t v6 = [(VNDetectFaceRectanglesRequest *)v5 faceCoreMinFaceSize];
      [(VNDetectFaceRectanglesRequest *)self setFaceCoreMinFaceSize:v6];

      uint64_t v7 = [(VNDetectFaceRectanglesRequest *)v5 faceCoreNumberOfDetectionAngles];
      [(VNDetectFaceRectanglesRequest *)self setFaceCoreNumberOfDetectionAngles:v7];

      BOOL v8 = [(VNDetectFaceRectanglesRequest *)v5 faceCoreInitialAngle];
      [(VNDetectFaceRectanglesRequest *)self setFaceCoreInitialAngle:v8];

      [(VNDetectFaceRectanglesRequest *)self setFaceCoreEnhanceEyesAndMouthLocalization:[(VNDetectFaceRectanglesRequest *)v5 faceCoreEnhanceEyesAndMouthLocalization]];
      [(VNDetectFaceRectanglesRequest *)self setFaceCoreExtractBlink:[(VNDetectFaceRectanglesRequest *)v5 faceCoreExtractBlink]];
      [(VNDetectFaceRectanglesRequest *)self setFaceCoreExtractSmile:[(VNDetectFaceRectanglesRequest *)v5 faceCoreExtractSmile]];
      id v9 = [(VNDetectFaceRectanglesRequest *)v5 precisionRecallThresholdOverride];
      -[VNDetectFaceRectanglesRequest _setPrecisionRecallThresholdOverride:](self, v9);
    }
  }
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  VNValidatedLog(1, @"Processing DetectFaceRectangles1 request\n", v9, v10, v11, v12, v13, v14, v36);
  id v15 = [v8 imageBufferAndReturnError:a5];
  if (v15
    && [(VNRequest *)self validateImageBuffer:v15 ofNonZeroWidth:0 andHeight:0 error:a5])
  {
    v16 = [v8 session];
    id v37 = 0;
    v17 = [(VNRequest *)self applicableDetectorAndOptions:&v37 forRevision:a3 loadedInSession:v16 error:a5];
    id v18 = v37;
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38[0] = v15;
        int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
        [v18 setObject:v19 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

        if (a3 == 3737841665)
        {
          v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNDetectFaceRectanglesRequest faceCoreType](self, "faceCoreType"));
          [v18 setObject:v20 forKeyedSubscript:@"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_Type"];

          int v21 = [(VNDetectFaceRectanglesRequest *)self faceCoreInitialAngle];
          [v18 setObject:v21 forKeyedSubscript:@"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_InitialAngle"];

          int v22 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectFaceRectanglesRequest faceCoreEnhanceEyesAndMouthLocalization](self, "faceCoreEnhanceEyesAndMouthLocalization"));
          [v18 setObject:v22 forKeyedSubscript:@"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_EnhanceEyesAndMouthLocalization"];

          objc_super v23 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectFaceRectanglesRequest faceCoreExtractBlink](self, "faceCoreExtractBlink"));
          [v18 setObject:v23 forKeyedSubscript:@"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_ExtractBlink"];

          v24 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectFaceRectanglesRequest faceCoreExtractSmile](self, "faceCoreExtractSmile"));
          [v18 setObject:v24 forKeyedSubscript:@"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_ExtractSmile"];

          v25 = [(VNDetectFaceRectanglesRequest *)self faceCoreMinFaceSize];
          [v18 setObject:v25 forKeyedSubscript:@"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_MinFaceSize"];

          v26 = [(VNDetectFaceRectanglesRequest *)self faceCoreNumberOfDetectionAngles];
          [v18 setObject:v26 forKeyedSubscript:@"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_NumberOfDetectionAngles"];
        }
        uint64_t v27 = [v8 qosClass];
        [(VNImageBasedRequest *)self regionOfInterest];
        v28 = objc_msgSend(v17, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v27, v18, self, a5, 0);
        if (v28)
        {
          [(VNRequest *)self setResults:v28];
          BOOL v29 = 1;
        }
        else
        {
          BOOL v29 = 0;
        }
        goto LABEL_14;
      }
      if (a5)
      {
        v30 = [(VNRequest *)self applicableDetectorClassAndOptions:0 forRevision:a3 error:0];
        id v31 = [NSString alloc];
        v32 = (objc_class *)objc_opt_class();
        v33 = VNRequestRevisionString(v32, a3);
        v34 = NSStringFromClass(v30);
        v28 = (void *)[v31 initWithFormat:@"%@ is handled by %@", v33, v34];

        +[VNError errorForInternalErrorWithLocalizedDescription:v28];
        BOOL v29 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
    }
    BOOL v29 = 0;
LABEL_15:

    goto LABEL_16;
  }
  BOOL v29 = 0;
LABEL_16:

  return v29;
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNDetectFaceRectanglesRequest;
  if ([(VNRequest *)&v11 warmUpSession:v6 error:a4])
  {
    uint64_t v7 = [(VNDetectFaceRectanglesRequest *)self applicableDetectorTypeForRevision:[(VNRequest *)self resolvedRevision] error:a4];
    id v8 = v7;
    if (v7) {
      BOOL v9 = ([v7 isEqualToString:@"VNANFDMultiDetectorType"] & 1) != 0
    }
        || [(VNRequest *)self warmUpApplicableDetectorInSession:v6 error:a4];
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (NSIndexSet)revisionsSupportingPrecisionRecallThresholdOverride
{
  unint64_t v3 = (void *)MEMORY[0x1A6257080](a1, a2);
  id v4 = [a1 allSupportedRevisions];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__VNDetectFaceRectanglesRequest_revisionsSupportingPrecisionRecallThresholdOverride__block_invoke;
  v7[3] = &__block_descriptor_40_e12_B24__0Q8_B16l;
  v7[4] = a1;
  unint64_t v5 = [v4 indexesPassingTest:v7];

  return (NSIndexSet *)v5;
}

uint64_t __84__VNDetectFaceRectanglesRequest_revisionsSupportingPrecisionRecallThresholdOverride__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = self;
  id v4 = (void *)MEMORY[0x1A6257080](v3);
  unint64_t v5 = objc_alloc_init(VNDetectFaceRectanglesRequest);
  uint64_t v6 = [(VNRequest *)v5 setRevision:a2 error:0]
    && [(VNDetectFaceRectanglesRequest *)v5 canOverridePrecisionRecallThreshold];

  return v6;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  return [a1 supportsAnyRevision:a4];
}

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  return [a3 registerRequestClass:a1 revision:1 equivalencyToRevision:2 error:a4];
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 7)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNDetectFaceRectanglesRequest;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E5B1E6D0[a3 - 3737841664u];
  }

  return v3;
}

@end