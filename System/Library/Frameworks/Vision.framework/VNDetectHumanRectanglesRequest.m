@interface VNDetectHumanRectanglesRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (BOOL)revisionSupportsFullBodyDetection:(unint64_t)a3;
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)upperBodyOnly;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)description;
- (int64_t)dependencyProcessingOrdinality;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3;
- (void)setUpperBodyOnly:(BOOL)upperBodyOnly;
@end

@implementation VNDetectHumanRectanglesRequest

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

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanRectanglesRequest;
  v4 = [(VNImageBasedRequest *)&v8 description];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectHumanRectanglesRequest upperBodyOnly](self, "upperBodyOnly"));
  v6 = (void *)[v3 initWithFormat:@"%@ upperBodyOnly=%@", v4, v5];

  return v6;
}

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNDetectHumanRectanglesRequest;
  [(VNRequest *)&v5 resolvedRevisionDidChangeFromRevision:a3];
  if ([(VNRequest *)self revision] <= 1)
  {
    v4 = [(VNRequest *)self configuration];
    [v4 setUpperBodyOnly:1];
  }
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [(VNDetectHumanRectanglesRequest *)self upperBodyOnly];
  if (v5 == [v4 upperBodyOnly])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNDetectHumanRectanglesRequest;
    BOOL v6 = [(VNImageBasedRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNDetectHumanRectanglesRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNDetectHumanRectanglesRequest;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VNDetectHumanRectanglesRequest *)self setUpperBodyOnly:[(VNDetectHumanRectanglesRequest *)v4 upperBodyOnly]];
    }
  }
}

- (void)setUpperBodyOnly:(BOOL)upperBodyOnly
{
  BOOL v3 = upperBodyOnly;
  if (+[VNDetectHumanRectanglesRequest revisionSupportsFullBodyDetection:[(VNRequest *)self resolvedRevision]])
  {
    id v5 = [(VNRequest *)self configuration];
    [v5 setUpperBodyOnly:v3];
  }
}

- (BOOL)upperBodyOnly
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 upperBodyOnly];

  return v3;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(2000, self);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 - 3737841664u >= 3 && a3 - 1 > 1)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      id v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = @"VNANFDMultiDetectorType";
    id v5 = @"VNANFDMultiDetectorType";
  }

  return v4;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if ([a1 supportsAnyRevision:a4]) {
    return 1;
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___VNDetectHumanRectanglesRequest;
  return objc_msgSendSuper2(&v8, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)revisionSupportsFullBodyDetection:(unint64_t)a3
{
  return a3 != 1 && a3 != 3737841664;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNDetectHumanRectanglesRequest;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5B1DD30[a3 - 3737841664u];
  }

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectHumanRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNDetectHumanRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_19455);
  }
  v2 = (void *)+[VNDetectHumanRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

void __66__VNDetectHumanRectanglesRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:3737841664];
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution]) {
    [v2 addIndex:3737841665];
  }
  [v2 addIndex:3737841666];
  uint64_t v0 = [v2 copy];
  v1 = (void *)+[VNDetectHumanRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
  +[VNDetectHumanRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = v0;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectHumanRectanglesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end