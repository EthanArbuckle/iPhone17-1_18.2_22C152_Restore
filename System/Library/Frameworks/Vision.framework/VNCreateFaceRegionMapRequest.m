@interface VNCreateFaceRegionMapRequest
+ (const)dependentRequestCompatibility;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (id)supportedComputeStageDevicesAndReturnError:(id *)a3;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNCreateFaceRegionMapRequest

+ (const)dependentRequestCompatibility
{
  {
    +[VNCreateFaceRegionMapRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1E9640BA8 = objc_opt_class();
    *(int64x2_t *)algn_1E9640BB0 = vdupq_n_s64(1uLL);
    qword_1E9640BC0 = objc_opt_class();
    unk_1E9640BC8 = xmmword_1A410C100;
    qword_1E9640BD8 = objc_opt_class();
    unk_1E9640BE0 = 3;
    qword_1E9640BF0 = 0;
    unk_1E9640BF8 = 0;
    qword_1E9640BE8 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNCreateFaceRegionMapRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  VNValidatedLog(1, @"Processing Create FaceRegionMap request\n", v9, v10, v11, v12, v13, v14, v25);
  id v26 = 0;
  BOOL v15 = [(VNImageBasedRequest *)self getOptionalValidatedInputFaceObservations:&v26 clippedToRegionOfInterest:1 error:a5];
  id v16 = v26;
  if (v15)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v16
      || (-[VNRequest categorizeFaceObservations:shouldRunDetectorBlock:facesThatNeedNoProcessing:facesThatNeedProcessing:facesThatNeed2DLandmarks:](self, "categorizeFaceObservations:shouldRunDetectorBlock:facesThatNeedNoProcessing:facesThatNeedProcessing:facesThatNeed2DLandmarks:", v16, &__block_literal_global_32, v17, v19, v18), [v18 count]))
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
    v22 = -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v19, a3, @"VNFaceRegionMapGeneratorType", 0, &__block_literal_global_28114, &__block_literal_global_32, v8, a5);
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

BOOL __72__VNCreateFaceRegionMapRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 faceRegionMap];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __72__VNCreateFaceRegionMapRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, void *a2)
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

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  v5 = objc_alloc_init(VNDetectFaceLandmarksRequest);
  [(VNDetectFaceLandmarksRequest *)v5 applyConfigurationOfRequest:self];
  v6 = [(VNRequest *)v5 supportedComputeStageDevicesAndReturnError:a3];

  return v6;
}

@end