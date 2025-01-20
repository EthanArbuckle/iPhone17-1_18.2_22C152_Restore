@interface VNDetectFaceExpressionsRequest
+ (const)dependentRequestCompatibility;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNDetectFaceExpressionsRequest

+ (const)dependentRequestCompatibility
{
  {
    +[VNDetectFaceExpressionsRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1E95F3AC0 = objc_opt_class();
    unk_1E95F3AC8 = vdupq_n_s64(1uLL);
    qword_1E95F3AD8 = objc_opt_class();
    unk_1E95F3AE0 = xmmword_1A410C100;
    qword_1E95F3AF0 = objc_opt_class();
    *(void *)algn_1E95F3AF8 = 3;
    qword_1E95F3B08 = 0;
    unk_1E95F3B10 = 0;
    qword_1E95F3B00 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFaceExpressionsRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  VNValidatedLog(1, @"Processing DetectFaceExpressions request\n", v9, v10, v11, v12, v13, v14, v25);
  id v26 = 0;
  BOOL v15 = [(VNImageBasedRequest *)self getOptionalValidatedInputFaceObservations:&v26 clippedToRegionOfInterest:1 error:a5];
  id v16 = v26;
  if (v15)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v16
      || (-[VNRequest categorizeFaceObservations:shouldRunDetectorBlock:facesThatNeedNoProcessing:facesThatNeedProcessing:facesThatNeed2DLandmarks:](self, "categorizeFaceObservations:shouldRunDetectorBlock:facesThatNeedNoProcessing:facesThatNeedProcessing:facesThatNeed2DLandmarks:", v16, &__block_literal_global_33_34407, v17, v19, v18), [v18 count]))
    {
      if ([v18 count]) {
        id v20 = v18;
      }
      else {
        id v20 = 0;
      }
      v21 = [(VNRequest *)self detectFaceLandmarksInContext:v8 faces:v20 error:a5];
      if (!v21)
      {
        BOOL v23 = 0;
LABEL_14:

        goto LABEL_15;
      }
      [v19 addObjectsFromArray:v21];
    }
    [(VNImageBasedRequest *)self regionOfInterest];
    v22 = -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v19, a3, @"VNFaceExpressionDetectorType", 0, &__block_literal_global_34406, &__block_literal_global_33_34407, v8, a5);
    BOOL v23 = v22 != 0;
    if (v22)
    {
      [v17 addObjectsFromArray:v22];
      [(VNRequest *)self setResults:v17];
    }

    goto LABEL_14;
  }
  BOOL v23 = 0;
LABEL_15:

  return v23;
}

BOOL __74__VNDetectFaceExpressionsRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 landmarks3d];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __74__VNDetectFaceExpressionsRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBoundingBoxAligned] ^ 1;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(5000, self);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    v4 = @"VNFaceExpressionDetectorType";
    v5 = @"VNFaceExpressionDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end