@interface VNClassifyFaceAttributesRequest
+ (const)dependentRequestMappingTable;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
+ (id)publicRevisionsSet;
+ (unint64_t)defaultRevision;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNClassifyFaceAttributesRequest

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(5000, self);
}

+ (unint64_t)defaultRevision
{
  return 3737841669;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 - 3737841664u > 6 || a3 == 3737841668)
  {
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
  }
  else
  {
    v5 = @"VNFaceAnalyzerMultiDetectorType";
    v6 = @"VNFaceAnalyzerMultiDetectorType";
  }

  return v5;
}

+ (id)privateRevisionsSet
{
  if (+[VNClassifyFaceAttributesRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNClassifyFaceAttributesRequest privateRevisionsSet]::onceToken, &__block_literal_global_18342);
  }
  v2 = (void *)+[VNClassifyFaceAttributesRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u < 7 && ((0x6Fu >> a3) & 1) != 0)
  {
    v3 = off_1E5B1DB58[a3 - 3737841664u];
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNClassifyFaceAttributesRequest;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t __54__VNClassifyFaceAttributesRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNClassifyFaceAttributesRequest privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF005uLL, a2, a3, a4, a5, a6, a7, a8, 3737841667);

  return MEMORY[0x1F41817F8]();
}

+ (id)publicRevisionsSet
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);

  return v2;
}

+ (const)dependentRequestMappingTable
{
  {
    +[VNClassifyFaceAttributesRequest dependentRequestMappingTable]::ourDependentRequestMappingTable = 3737841664;
    qword_1E9640918 = objc_opt_class();
    unk_1E9640920 = 3737841667;
    qword_1E9640930 = 0;
    unk_1E9640938 = 0;
    qword_1E9640928 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNClassifyFaceAttributesRequest dependentRequestMappingTable]::ourDependentRequestMappingTable;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNClassifyFaceAttributesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end