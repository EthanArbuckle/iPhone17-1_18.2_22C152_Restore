@interface VNRecognizeFoodAndDrinkRequest
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)supportedIdentifiersAndReturnError:(id *)a3;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNRecognizeFoodAndDrinkRequest

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNRecognizeFoodAndDrinkRequest;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5B1E678[a3 - 3737841664u];
  }

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VNRecognizeFoodAndDrinkRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNRecognizeFoodAndDrinkRequest privateRevisionsSet]::onceToken, &__block_literal_global_25606);
  }
  v2 = (void *)+[VNRecognizeFoodAndDrinkRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

void __53__VNRecognizeFoodAndDrinkRequest_privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:3737841664];
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution]) {
    [v2 addIndex:3737841665];
  }
  [v2 addIndex:3737841666];
  uint64_t v0 = [v2 copy];
  v1 = (void *)+[VNRecognizeFoodAndDrinkRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNRecognizeFoodAndDrinkRequest privateRevisionsSet]::ourPrivateRevisions = v0;
}

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

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(2000, self);
}

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  objc_super v5 = [(VNRequest *)self applicableDetectorClassAndOptions:0 forRevision:[(VNRequest *)self resolvedRevision] error:a3];
  if (v5)
  {
    v6 = v5;
    if (objc_opt_respondsToSelector())
    {
      objc_super v5 = [(objc_class *)v6 knownFoodAndDrinkIdentifiers];
    }
    else
    {
      if (a3)
      {
        v7 = [(VNRequest *)self specifier];
        *a3 = +[VNError errorForUnsupportedRequestSpecifier:v7];
      }
      objc_super v5 = 0;
    }
  }

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 - 3737841664u < 3 || a3 == 1)
  {
    objc_super v5 = @"VNANFDMultiDetectorType";
    v6 = @"VNANFDMultiDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    objc_super v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNRecognizeFoodAndDrinkRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end