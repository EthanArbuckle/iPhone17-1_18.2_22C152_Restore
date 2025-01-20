@interface VNDetectFaceCaptureQualityRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (const)dependentRequestCompatibility;
+ (const)revisionAvailability;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNDetectFaceCaptureQualityRequest

+ (const)dependentRequestCompatibility
{
  {
    +[VNDetectFaceCaptureQualityRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1E95F3B30 = objc_opt_class();
    unk_1E95F3B38 = vdupq_n_s64(1uLL);
    qword_1E95F3B48 = objc_opt_class();
    *(_OWORD *)algn_1E95F3B50 = xmmword_1A410C100;
    qword_1E95F3B60 = objc_opt_class();
    unk_1E95F3B68 = xmmword_1A410C3D0;
    qword_1E95F3B78 = objc_opt_class();
    unk_1E95F3B80 = xmmword_1A40E7700;
    qword_1E95F3B90 = objc_opt_class();
    unk_1E95F3B98 = vdupq_n_s64(2uLL);
    qword_1E95F3BA8 = objc_opt_class();
    *(int64x2_t *)algn_1E95F3BB0 = vdupq_n_s64(3uLL);
    qword_1E95F3BC0 = objc_opt_class();
    unk_1E95F3BC8 = xmmword_1A40E88E0;
    qword_1E95F3BD8 = objc_opt_class();
    unk_1E95F3BE0 = xmmword_1A4104950;
    qword_1E95F3BF0 = objc_opt_class();
    *(void *)algn_1E95F3BF8 = 3;
    qword_1E95F3C08 = 0;
    unk_1E95F3C10 = 0;
    qword_1E95F3C00 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFaceCaptureQualityRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNDetectFaceCaptureQualityRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(VNDetectFaceCaptureQualityRequest *)self applicableDetectorTypeForRevision:a3 error:a5];
  if (v9)
  {
    id v16 = 0;
    BOOL v10 = [(VNImageBasedRequest *)self getOptionalValidatedInputFaceObservations:&v16 clippedToRegionOfInterest:1 error:a5];
    id v11 = v16;
    v12 = v11;
    if (v10
      && (v11
       || ([(VNRequest *)self detectFacesInContext:v8 error:a5],
           (v12 = objc_claimAutoreleasedReturnValue()) != 0)))
    {
      [(VNImageBasedRequest *)self regionOfInterest];
      v13 = -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v12, a3, v9, 0, &__block_literal_global_26234, &__block_literal_global_30_26235, v8, a5);
      BOOL v14 = v13 != 0;
      if (v13) {
        [(VNRequest *)self setResults:v13];
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

BOOL __77__VNDetectFaceCaptureQualityRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 faceCaptureQuality];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __77__VNDetectFaceCaptureQualityRequest_internalPerformRevision_inContext_error___block_invoke()
{
  return 0;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 - 1 > 2)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      uint64_t v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = @"VNFaceQualityGeneratorType";
    uint64_t v5 = @"VNFaceQualityGeneratorType";
  }

  return v4;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectFaceCaptureQualityRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end