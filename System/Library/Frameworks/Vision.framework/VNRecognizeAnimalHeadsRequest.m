@interface VNRecognizeAnimalHeadsRequest
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)supportedIdentifiersAndReturnError:(id *)a3;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNRecognizeAnimalHeadsRequest

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 == 3737841664)
  {
    v5 = @"VNRecognizeAnimalHeadsRequestPrivateRevisionANSTModel";
  }
  else if (a3 == 3737841665)
  {
    v5 = @"VNRecognizeAnimalHeadsRequestPrivateRevisionANODv5";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNRecognizeAnimalHeadsRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)privateRevisionsSet
{
  if (+[VNRecognizeAnimalHeadsRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNRecognizeAnimalHeadsRequest privateRevisionsSet]::onceToken, &__block_literal_global_19970);
  }
  v2 = (void *)+[VNRecognizeAnimalHeadsRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

void __52__VNRecognizeAnimalHeadsRequest_privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution]) {
    [v2 addIndex:3737841664];
  }
  [v2 addIndex:3737841665];
  uint64_t v0 = [v2 copy];
  v1 = (void *)+[VNRecognizeAnimalHeadsRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNRecognizeAnimalHeadsRequest privateRevisionsSet]::ourPrivateRevisions = v0;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_super v7 = [(VNRequest *)self applicableDetectorClassAndOptions:0 forRevision:a3 error:0];
    id v8 = [NSString alloc];
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = VNRequestRevisionString(v9, a3);
    v11 = NSStringFromClass(v7);
    v12 = (void *)[v8 initWithFormat:@"%@ is handled by %@", v10, v11];

    *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v12];
  }
  return 0;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(2000, self);
}

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  v5 = [(VNRequest *)self applicableDetectorClassAndOptions:0 forRevision:[(VNRequest *)self resolvedRevision] error:a3];
  if (v5)
  {
    v6 = v5;
    if (objc_opt_respondsToSelector())
    {
      v5 = [(objc_class *)v6 knownAnimalHeadIdentifiers];
    }
    else
    {
      if (a3)
      {
        objc_super v7 = [(VNRequest *)self specifier];
        *a3 = +[VNError errorForUnsupportedRequestSpecifier:v7];
      }
      v5 = 0;
    }
  }

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 - 3737841664u < 2 || a3 == 1)
  {
    v5 = @"VNANFDMultiDetectorType";
    v6 = @"VNANFDMultiDetectorType";
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

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNRecognizeAnimalHeadsRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end