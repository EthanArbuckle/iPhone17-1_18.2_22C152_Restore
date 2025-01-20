@interface VNCreateFaceprintRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)createVNEntityIdentificationModelEntryPrintForRevision:(unint64_t)a3 fromDescriptorData:(const void *)a4 length:(unint64_t)a5 elementCount:(unint64_t)a6 error:(id *)a7;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
+ (id)publicRevisionsSet;
+ (unint64_t)defaultRevision;
- (BOOL)forceFaceprintCreation;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (BOOL)warmUpSession:(id)a3 error:(id *)a4;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (int64_t)dependencyProcessingOrdinality;
- (void)setForceFaceprintCreation:(BOOL)a3;
@end

@implementation VNCreateFaceprintRequest

+ (id)createVNEntityIdentificationModelEntryPrintForRevision:(unint64_t)a3 fromDescriptorData:(const void *)a4 length:(unint64_t)a5 elementCount:(unint64_t)a6 error:(id *)a7
{
  v11 = [VNFaceprint alloc];
  LODWORD(v12) = 1.0;
  v13 = [(VNFaceprint *)v11 initWithData:a4 elementCount:a6 elementType:1 lengthInBytes:a5 confidence:a3 requestRevision:v12];

  return v13;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = +[VNError errorForUnsupportedRevision:1 ofRequestClass:objc_opt_class()];
  }
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [(VNCreateFaceprintRequest *)self forceFaceprintCreation];
  if (v5 == [v4 forceFaceprintCreation])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNCreateFaceprintRequest;
    BOOL v6 = [(VNImageBasedRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (void)setForceFaceprintCreation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setForceFaceprintCreation:v3];
}

- (BOOL)forceFaceprintCreation
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 forceFaceprintCreation];

  return v3;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(5000, self);
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNCreateFaceprintRequest;
  if ([(VNRequest *)&v18 warmUpSession:v6 error:a4])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __48__VNCreateFaceprintRequest_warmUpSession_error___block_invoke;
    v15 = &unk_1E5B1FB58;
    v16 = self;
    id v17 = v6;
    v7 = (uint64_t (**)(void *, uint64_t, id *))_Block_copy(&v12);
    unint64_t v8 = [(VNRequest *)self resolvedRevision];
    switch(v8)
    {
      case 0xDECAF001uLL:
        char v9 = v7[2](v7, 4, a4);
        goto LABEL_11;
      case 0xDECAF002uLL:
        char v9 = v7[2](v7, 100, a4);
        goto LABEL_11;
      case 0xDECAF003uLL:
        char v9 = v7[2](v7, 6, a4);
        goto LABEL_11;
      case 0xDECAF004uLL:
      case 0xDECAF005uLL:
        char v9 = v7[2](v7, 7, a4);
        goto LABEL_11;
      case 0xDECAF006uLL:
        char v9 = v7[2](v7, 101, a4);
LABEL_11:
        if ((v9 & 1) == 0) {
          goto LABEL_13;
        }
        BOOL v10 = 1;
        break;
      default:
        if (a4)
        {
          +[VNError errorForUnsupportedRevision:v8 ofRequest:self];
          BOOL v10 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_13:
          BOOL v10 = 0;
        }
        break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __48__VNCreateFaceprintRequest_warmUpSession_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = [VNFaceAnalyzerCompoundRequest alloc];
  v14[0] = *(void *)(a1 + 32);
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  unint64_t v8 = [(VNCompoundRequest *)v6 initWithOriginalRequests:v7];

  id v9 = [(VNRequest *)v8 newDefaultDetectorOptionsForRequestRevision:a2 session:*(void *)(a1 + 40)];
  BOOL v10 = [*(id *)(a1 + 40) detectorOfType:@"VNFaceAnalyzerMultiDetectorType" configuredWithOptions:v9 error:a3];
  v11 = v10;
  if (v10) {
    uint64_t v12 = [v10 warmUpSession:*(void *)(a1 + 40) withOptions:v9 error:a3];
  }
  else {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  id v4 = @"VNFaceAnalyzerMultiDetectorType";
  return @"VNFaceAnalyzerMultiDetectorType";
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841665u >= 6)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNCreateFaceprintRequest;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5B1FB78[a3 - 3737841665u];
  }

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VNCreateFaceprintRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNCreateFaceprintRequest privateRevisionsSet]::onceToken, &__block_literal_global_35079);
  }
  v2 = (void *)+[VNCreateFaceprintRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __47__VNCreateFaceprintRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNCreateFaceprintRequest privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF005uLL, a2, a3, a4, a5, a6, a7, a8, 3737841668);

  return MEMORY[0x1F41817F8]();
}

+ (id)publicRevisionsSet
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);

  return v2;
}

+ (unint64_t)defaultRevision
{
  return 3737841669;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNCreateFaceprintRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNCreateFaceprintRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end