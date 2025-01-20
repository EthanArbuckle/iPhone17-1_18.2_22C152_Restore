@interface VNDetectFacePoseRequest
+ (const)dependentRequestCompatibility;
+ (const)dependentRequestMappingTable;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNDetectFacePoseRequest

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 == 3737841664)
  {
    v5 = @"VNDetectFacePoseRequestPrivateRevisionANSTModel";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNDetectFacePoseRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectFacePoseRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNDetectFacePoseRequest privateRevisionsSet]::onceToken, &__block_literal_global_17116);
  }
  v2 = (void *)+[VNDetectFacePoseRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

void __46__VNDetectFacePoseRequest_privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (+[VNRequest supportsPrivateRevision:3737841664])
  {
    [v2 addIndex:3737841664];
  }
  uint64_t v0 = [v2 copy];
  v1 = (void *)+[VNDetectFacePoseRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNDetectFacePoseRequest privateRevisionsSet]::ourPrivateRevisions = v0;
}

+ (const)dependentRequestMappingTable
{
  {
    +[VNDetectFacePoseRequest dependentRequestMappingTable]::ourDependentRequestMappingTable = 3737841664;
    qword_1E9640848 = objc_opt_class();
    unk_1E9640850 = 3737841664;
    qword_1E9640860 = 0;
    unk_1E9640868 = 0;
    qword_1E9640858 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFacePoseRequest dependentRequestMappingTable]::ourDependentRequestMappingTable;
}

+ (const)dependentRequestCompatibility
{
  {
    +[VNDetectFacePoseRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1E96407E0 = objc_opt_class();
    unk_1E96407E8 = vdupq_n_s64(1uLL);
    qword_1E96407F8 = objc_opt_class();
    unk_1E9640800 = xmmword_1A410C100;
    qword_1E9640810 = objc_opt_class();
    *(void *)algn_1E9640818 = 3;
    qword_1E9640828 = 0;
    unk_1E9640830 = 0;
    qword_1E9640820 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFacePoseRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  VNValidatedLog(1, @"Processing DetectFacePose request\n", v9, v10, v11, v12, v13, v14, v34);
  id v39 = 0;
  BOOL v15 = [(VNImageBasedRequest *)self getOptionalValidatedInputFaceObservations:&v39 clippedToRegionOfInterest:1 error:a5];
  id v16 = v39;
  if (v15)
  {
    unint64_t v35 = a3;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v36 = v17;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v16
      || (-[VNRequest categorizeFaceObservations:shouldRunDetectorBlock:facesThatNeedNoProcessing:facesThatNeedProcessing:facesThatNeed2DLandmarks:](self, "categorizeFaceObservations:shouldRunDetectorBlock:facesThatNeedNoProcessing:facesThatNeedProcessing:facesThatNeed2DLandmarks:", v16, &__block_literal_global_37_17145, v17, v37, v18), [v18 count]))
    {
      if ([v18 count]) {
        id v19 = v18;
      }
      else {
        id v19 = 0;
      }
      v20 = [(VNRequest *)self detectFaceLandmarksInContext:v8 faces:v19 error:a5];
      if (!v20)
      {
        BOOL v32 = 0;
LABEL_22:

        goto LABEL_23;
      }
      [v37 addObjectsFromArray:v20];
    }
    v21 = [v8 imageBufferAndReturnError:a5];
    v22 = v21;
    if (v21)
    {
      unint64_t v23 = [v21 width];
      unint64_t v24 = [v22 height];
      int v38 = 0;
      if (([v22 getPixelFocalLengthIfAvailable:&v38] & 1) == 0) {
        int v38 = 1161527296;
      }
      id v25 = objc_alloc(MEMORY[0x1E4F1CA60]);
      LODWORD(v26) = v38;
      v27 = [NSNumber numberWithFloat:v26];
      v40.width = (double)v23;
      v40.height = (double)v24;
      CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v40);
      v29 = objc_msgSend(v25, "initWithObjectsAndKeys:", v27, @"VNFaceGeometryEstimatorInitOption_CameraFocalLength", DictionaryRepresentation, @"VNFaceGeometryEstimatorInitOption_ImageSize", MEMORY[0x1E4F1CC38], @"VNFaceGeometryEstimatorProcessOption_EstimatePoseOnly", 0);

      v30 = [(VNDetectFacePoseRequest *)self applicableDetectorTypeForRevision:v35 error:a5];
      if (v30)
      {
        [(VNImageBasedRequest *)self regionOfInterest];
        v31 = -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v37, v35, v30, v29, &__block_literal_global_42_17148, &__block_literal_global_37_17145, v8, a5);
        BOOL v32 = v31 != 0;
        if (v31)
        {
          [v36 addObjectsFromArray:v31];
          [(VNRequest *)self setResults:v36];
        }
      }
      else
      {
        BOOL v32 = 0;
      }
    }
    else
    {
      BOOL v32 = 0;
    }

    goto LABEL_22;
  }
  BOOL v32 = 0;
LABEL_23:

  return v32;
}

uint64_t __67__VNDetectFacePoseRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isBoundingBoxAligned] ^ 1;
}

BOOL __67__VNDetectFacePoseRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 landmarks3d];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 3737841664 || a3 == 1)
  {
    v5 = @"VNFaceGeometryEstimatorType";
    v6 = @"VNFaceGeometryEstimatorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(6000, self);
}

@end