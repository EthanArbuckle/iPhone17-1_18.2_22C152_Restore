@interface VNGenerateFaceSegmentsRequest
+ (Class)configurationClass;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (float)faceBoundingBoxExpansionRatio;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (int64_t)dependencyProcessingOrdinality;
- (void)setFaceBoundingBoxExpansionRatio:(float)a3;
@end

@implementation VNGenerateFaceSegmentsRequest

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v4 = @"VNFaceSegmentGeneratorType";
  return @"VNFaceSegmentGeneratorType";
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VNGenerateFaceSegmentsRequest;
  id v5 = [(VNRequest *)&v9 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v6 = NSNumber;
  [(VNGenerateFaceSegmentsRequest *)self faceBoundingBoxExpansionRatio];
  v7 = objc_msgSend(v6, "numberWithFloat:");
  [v5 setObject:v7 forKeyedSubscript:@"VNFaceSegmentGeneratorProcessOption_FaceBoundingBoxExpansionRatio"];

  return v5;
}

- (float)faceBoundingBoxExpansionRatio
{
  v2 = [(VNRequest *)self configuration];
  [v2 faceBoundingBoxExpansionRatio];
  float v4 = v3;

  return v4;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  [(VNGenerateFaceSegmentsRequest *)self faceBoundingBoxExpansionRatio];
  float v6 = v5;
  [v4 faceBoundingBoxExpansionRatio];
  if (v6 == v7)
  {
    v10.receiver = self;
    v10.super_class = (Class)VNGenerateFaceSegmentsRequest;
    BOOL v8 = [(VNImageBasedRequest *)&v10 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)setFaceBoundingBoxExpansionRatio:(float)a3
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = a3;
  [v5 setFaceBoundingBoxExpansionRatio:v4];
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  VNValidatedLog(1, @"Processing Segment Face Segments Request", v9, v10, v11, v12, v13, v14, v22);
  v15 = [(VNGenerateFaceSegmentsRequest *)self applicableDetectorTypeForRevision:a3 error:a5];
  if (v15)
  {
    id v23 = 0;
    BOOL v16 = [(VNImageBasedRequest *)self getOptionalValidatedInputFaceObservations:&v23 clippedToRegionOfInterest:1 error:a5];
    id v17 = v23;
    v18 = v17;
    if (v16
      && (v17
       || ([(VNRequest *)self detectFacesInContext:v8 error:a5],
           (v18 = objc_claimAutoreleasedReturnValue()) != 0)))
    {
      [(VNImageBasedRequest *)self regionOfInterest];
      v19 = -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v18, a3, v15, 0, &__block_literal_global_25478, &__block_literal_global_54, v8, a5);
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

BOOL __73__VNGenerateFaceSegmentsRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 faceSegments];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __73__VNGenerateFaceSegmentsRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBoundingBoxAligned] ^ 1;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

@end