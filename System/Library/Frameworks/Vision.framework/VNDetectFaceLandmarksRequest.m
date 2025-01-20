@interface VNDetectFaceLandmarksRequest
+ (BOOL)revision:(NSUInteger)requestRevision supportsConstellation:(VNRequestFaceLandmarksConstellation)constellation;
+ (Class)configurationClass;
+ (const)dependentRequestCompatibility;
+ (const)dependentRequestMappingTable;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)performBlinkDetection;
- (BOOL)refineLeftEyeRegion;
- (BOOL)refineMouthRegion;
- (BOOL)refineRightEyeRegion;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSNumber)cascadeStepCount;
- (NSString)description;
- (VNDetectFaceLandmarksRequest)initWithCompletionHandler:(id)a3;
- (VNRequestFaceLandmarksConstellation)constellation;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (int64_t)dependencyProcessingOrdinality;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3;
- (void)setCascadeStepCount:(id)a3;
- (void)setConstellation:(VNRequestFaceLandmarksConstellation)constellation;
- (void)setPerformBlinkDetection:(BOOL)a3;
- (void)setProcessedResults:(id)a3;
- (void)setRefineLeftEyeRegion:(BOOL)a3;
- (void)setRefineMouthRegion:(BOOL)a3;
- (void)setRefineRightEyeRegion:(BOOL)a3;
@end

@implementation VNDetectFaceLandmarksRequest

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectFaceLandmarksRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v4 = @"VNFaceLandmarkDetectorType";
  return @"VNFaceLandmarkDetectorType";
}

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNDetectFaceLandmarksRequest;
  [(VNRequest *)&v5 resolvedRevisionDidChangeFromRevision:a3];
  if ([(VNRequest *)self revision] <= 2)
  {
    v4 = [(VNRequest *)self configuration];
    [v4 setConstellation:1];
  }
}

- (void)setRefineRightEyeRegion:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setRefineRightEyeRegion:v3];
}

- (void)setRefineMouthRegion:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setRefineMouthRegion:v3];
}

- (void)setCascadeStepCount:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setCascadeStepCount:v5];
}

- (void)setPerformBlinkDetection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setPerformBlinkDetection:v3];
}

- (void)setRefineLeftEyeRegion:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setRefineLeftEyeRegion:v3];
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)VNDetectFaceLandmarksRequest;
  id v6 = [(VNRequest *)&v13 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  BOOL v7 = [(VNDetectFaceLandmarksRequest *)self performBlinkDetection];
  v8 = [NSNumber numberWithBool:v7];
  [v6 setObject:v8 forKeyedSubscript:@"VNFaceLandmarkDetectorProcessOption_BlinkDetection"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNDetectFaceLandmarksRequest constellation](self, "constellation"));
  [v6 setObject:v9 forKeyedSubscript:@"VNFaceLandmarkDetectorDNNProcessOption_Constellation"];

  if (a3 != 3 || v7) {
    uint64_t v11 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v11 = MEMORY[0x1E4F1CC28];
  }
  [v6 setObject:v11 forKeyedSubscript:@"VNFaceLandmarkDetectorOption_LoadRefinersModel"];
  return v6;
}

- (BOOL)performBlinkDetection
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 performBlinkDetection];

  return v3;
}

- (VNRequestFaceLandmarksConstellation)constellation
{
  v2 = [(VNRequest *)self configuration];
  VNRequestFaceLandmarksConstellation v3 = [v2 constellation];

  return v3;
}

- (VNDetectFaceLandmarksRequest)initWithCompletionHandler:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VNDetectFaceLandmarksRequest;
  VNRequestFaceLandmarksConstellation v3 = [(VNRequest *)&v8 initWithCompletionHandler:a3];
  id v4 = v3;
  if (v3)
  {
    if ([(VNRequest *)v3 revision] == 3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    [(VNDetectFaceLandmarksRequest *)v4 setConstellation:v5];
    id v6 = v4;
  }

  return v4;
}

- (void)setConstellation:(VNRequestFaceLandmarksConstellation)constellation
{
  if (objc_msgSend((id)objc_opt_class(), "revision:supportsConstellation:", -[VNRequest revision](self, "revision"), constellation))
  {
    id v5 = [(VNRequest *)self configuration];
    [v5 setConstellation:constellation];
  }
}

+ (BOOL)revision:(NSUInteger)requestRevision supportsConstellation:(VNRequestFaceLandmarksConstellation)constellation
{
  id v6 = (void *)[a1 configurationClass];

  return [v6 revision:requestRevision supportsConstellation:constellation];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectFaceLandmarksRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNDetectFaceLandmarksRequest privateRevisionsSet]::onceToken, &__block_literal_global_84);
  }
  v2 = (void *)+[VNDetectFaceLandmarksRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

void __51__VNDetectFaceLandmarksRequest_privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (+[VNRequest supportsPrivateRevision:3737841667])
  {
    [v2 addIndex:3737841664];
  }
  uint64_t v0 = [v2 copy];
  v1 = (void *)+[VNDetectFaceLandmarksRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNDetectFaceLandmarksRequest privateRevisionsSet]::ourPrivateRevisions = v0;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 == 3737841664)
  {
    id v5 = @"VNDetectFaceLandmarksRequestPrivateRevisionANSTModel";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNDetectFaceLandmarksRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (const)dependentRequestMappingTable
{
  {
    +[VNDetectFaceLandmarksRequest dependentRequestMappingTable]::ourDependentRequestMappingTable = 2;
    qword_1E96402F0 = objc_opt_class();
    unk_1E96402F8 = xmmword_1A4104950;
    qword_1E9640308 = objc_opt_class();
    *(_OWORD *)algn_1E9640310 = xmmword_1A410C220;
    qword_1E9640320 = objc_opt_class();
    *(void *)algn_1E9640328 = 3737841667;
    qword_1E9640338 = 0;
    unk_1E9640340 = 0;
    qword_1E9640330 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFaceLandmarksRequest dependentRequestMappingTable]::ourDependentRequestMappingTable;
}

+ (const)dependentRequestCompatibility
{
  {
    +[VNDetectFaceLandmarksRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1E95F39A0 = objc_opt_class();
    unk_1E95F39A8 = xmmword_1A40E7700;
    qword_1E95F39B8 = objc_opt_class();
    unk_1E95F39C0 = xmmword_1A40E7700;
    qword_1E95F39D0 = objc_opt_class();
    unk_1E95F39D8 = vdupq_n_s64(2uLL);
    qword_1E95F39E8 = objc_opt_class();
    *(int64x2_t *)algn_1E95F39F0 = vdupq_n_s64(3uLL);
    qword_1E95F3A00 = objc_opt_class();
    unk_1E95F3A08 = xmmword_1A40E88E0;
    qword_1E95F3A18 = objc_opt_class();
    unk_1E95F3A20 = xmmword_1A4104950;
    qword_1E95F3A30 = objc_opt_class();
    unk_1E95F3A38 = xmmword_1A410C230;
    qword_1E95F3A48 = objc_opt_class();
    *(_OWORD *)algn_1E95F3A50 = xmmword_1A410C240;
    qword_1E95F3A60 = objc_opt_class();
    unk_1E95F3A68 = xmmword_1A40E7700;
    qword_1E95F3A78 = objc_opt_class();
    unk_1E95F3A80 = xmmword_1A40E88E0;
    qword_1E95F3A90 = objc_opt_class();
    *(void *)algn_1E95F3A98 = 1;
    qword_1E95F3AA8 = 0;
    unk_1E95F3AB0 = 0;
    qword_1E95F3AA0 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFaceLandmarksRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  VNValidatedLog(1, @"Processing DetectFaceLandmarks request\n", v9, v10, v11, v12, v13, v14, v23);
  v15 = [(VNDetectFaceLandmarksRequest *)self applicableDetectorTypeForRevision:a3 error:a5];
  if (!v15) {
    goto LABEL_11;
  }
  VNRequestFaceLandmarksConstellation v16 = [(VNDetectFaceLandmarksRequest *)self constellation];
  if (([(id)objc_opt_class() revision:a3 supportsConstellation:v16] & 1) == 0)
  {
    if (!a5) {
      goto LABEL_14;
    }
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"VNDetectFaceLandmarksRequest revision %lu doesn't support constellation %lu", a3, v16);
    *a5 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v21];

LABEL_11:
    LOBYTE(a5) = 0;
    goto LABEL_14;
  }
  id v24 = 0;
  BOOL v17 = [(VNImageBasedRequest *)self getOptionalValidatedInputFaceObservations:&v24 clippedToRegionOfInterest:1 error:a5];
  id v18 = v24;
  v19 = v18;
  if (v17
    && (v18
     || ([(VNRequest *)self detectFacesInContext:v8 error:a5],
         (v19 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    [(VNImageBasedRequest *)self regionOfInterest];
    v20 = -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v19, a3, v15, 0, &__block_literal_global_120, &__block_literal_global_123, v8, a5);
    LOBYTE(a5) = v20 != 0;
    if (v20) {
      [(VNRequest *)self setResults:v20];
    }
  }
  else
  {
    LOBYTE(a5) = 0;
  }

LABEL_14:
  return (char)a5;
}

BOOL __72__VNDetectFaceLandmarksRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 landmarkPoints];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __72__VNDetectFaceLandmarksRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBoundingBoxAligned] ^ 1;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  uint64_t v4 = (VNDetectFaceLandmarksRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNDetectFaceLandmarksRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(VNDetectFaceLandmarksRequest *)v4 cascadeStepCount];
      [(VNDetectFaceLandmarksRequest *)self setCascadeStepCount:v5];

      [(VNDetectFaceLandmarksRequest *)self setRefineMouthRegion:[(VNDetectFaceLandmarksRequest *)v4 refineMouthRegion]];
      [(VNDetectFaceLandmarksRequest *)self setRefineLeftEyeRegion:[(VNDetectFaceLandmarksRequest *)v4 refineLeftEyeRegion]];
      [(VNDetectFaceLandmarksRequest *)self setRefineRightEyeRegion:[(VNDetectFaceLandmarksRequest *)v4 refineRightEyeRegion]];
      [(VNDetectFaceLandmarksRequest *)self setPerformBlinkDetection:[(VNDetectFaceLandmarksRequest *)v4 performBlinkDetection]];
      [(VNDetectFaceLandmarksRequest *)self setConstellation:[(VNDetectFaceLandmarksRequest *)v4 constellation]];
    }
  }
}

- (int64_t)dependencyProcessingOrdinality
{
  int64_t v3 = VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
  uint64_t v4 = [(VNDetectFaceLandmarksRequest *)self cascadeStepCount];
  id v5 = v4;
  if (v4) {
    int64_t v3 = v3 - [v4 integerValue] + 20;
  }

  return v3;
}

- (void)setProcessedResults:(id)a3
{
  id v4 = a3;
  if ([(VNRequest *)self resolvedRevision] == 1)
  {
    id v5 = [v4 indexesOfObjectsPassingTest:&__block_literal_global_101];
    if ([v5 count])
    {
      objc_super v6 = (void *)[v4 mutableCopy];
      [v6 removeObjectsAtIndexes:v5];

      id v4 = v6;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)VNDetectFaceLandmarksRequest;
  [(VNRequest *)&v7 setProcessedResults:v4];
}

uint64_t __52__VNDetectFaceLandmarksRequest_setProcessedResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRevision1DetectedRectanglesCompatible] ^ 1;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(VNDetectFaceLandmarksRequest *)self cascadeStepCount];
  uint64_t v6 = [v4 cascadeStepCount];
  objc_super v7 = (void *)v6;
  if ((!v5 || !v6 || [v5 compare:v6] != 1)
    && (int v8 = [(VNDetectFaceLandmarksRequest *)self refineMouthRegion],
        v8 == [v4 refineMouthRegion])
    && (int v9 = [(VNDetectFaceLandmarksRequest *)self refineLeftEyeRegion],
        v9 == [v4 refineLeftEyeRegion])
    && (int v10 = [(VNDetectFaceLandmarksRequest *)self refineRightEyeRegion],
        v10 == [v4 refineRightEyeRegion])
    && (VNRequestFaceLandmarksConstellation v11 = [(VNDetectFaceLandmarksRequest *)self constellation],
        v11 == [v4 constellation])
    && (![(VNDetectFaceLandmarksRequest *)self performBlinkDetection]
     || [v4 performBlinkDetection]))
  {
    v14.receiver = self;
    v14.super_class = (Class)VNDetectFaceLandmarksRequest;
    BOOL v12 = [(VNImageBasedRequest *)&v14 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)refineRightEyeRegion
{
  id v2 = [(VNRequest *)self configuration];
  char v3 = [v2 refineRightEyeRegion];

  return v3;
}

- (BOOL)refineLeftEyeRegion
{
  id v2 = [(VNRequest *)self configuration];
  char v3 = [v2 refineLeftEyeRegion];

  return v3;
}

- (BOOL)refineMouthRegion
{
  id v2 = [(VNRequest *)self configuration];
  char v3 = [v2 refineMouthRegion];

  return v3;
}

- (NSNumber)cascadeStepCount
{
  id v2 = [(VNRequest *)self configuration];
  char v3 = [v2 cascadeStepCount];

  return (NSNumber *)v3;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v9.receiver = self;
  v9.super_class = (Class)VNDetectFaceLandmarksRequest;
  id v4 = [(VNImageBasedRequest *)&v9 description];
  VNRequestFaceLandmarksConstellation v5 = [(VNDetectFaceLandmarksRequest *)self constellation];
  uint64_t v6 = @"VNRequestFaceLandmarksConstellationNotDefined";
  if (v5 == VNRequestFaceLandmarksConstellation65Points) {
    uint64_t v6 = @"VNRequestFaceLandmarksConstellation65Points";
  }
  if (v5 == VNRequestFaceLandmarksConstellation76Points) {
    uint64_t v6 = @"VNRequestFaceLandmarksConstellation76Points";
  }
  objc_super v7 = (void *)[v3 initWithFormat:@"%@ %@", v4, v6];

  return (NSString *)v7;
}

@end