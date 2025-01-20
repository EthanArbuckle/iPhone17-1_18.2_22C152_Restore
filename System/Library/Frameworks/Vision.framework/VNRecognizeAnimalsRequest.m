@interface VNRecognizeAnimalsRequest
+ (NSArray)knownAnimalIdentifiersForRevision:(NSUInteger)requestRevision error:(NSError *)error;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (NSArray)supportedIdentifiersAndReturnError:(NSError *)error;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNRecognizeAnimalsRequest

+ (NSArray)knownAnimalIdentifiersForRevision:(NSUInteger)requestRevision error:(NSError *)error
{
  id v6 = objc_alloc_init((Class)a1);
  if ([v6 setRevision:requestRevision error:error])
  {
    v7 = [v6 supportedIdentifiersAndReturnError:error];
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
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

- (NSArray)supportedIdentifiersAndReturnError:(NSError *)error
{
  v5 = [(VNRequest *)self applicableDetectorClassAndOptions:0 forRevision:[(VNRequest *)self resolvedRevision] error:error];
  if (v5)
  {
    id v6 = v5;
    if (objc_opt_respondsToSelector())
    {
      v5 = [(objc_class *)v6 knownAnimalIdentifiers];
    }
    else
    {
      if (error)
      {
        v7 = [(VNRequest *)self specifier];
        *error = +[VNError errorForUnsupportedRequestSpecifier:v7];
      }
      v5 = 0;
    }
  }

  return (NSArray *)v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 - 3737841664u >= 3 && a3 - 1 > 1)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = @"VNANFDMultiDetectorType";
    v5 = @"VNANFDMultiDetectorType";
  }

  return v4;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNRecognizeAnimalsRequest;
    v3 = objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
  }
  else
  {
    v3 = (void *)*((void *)&off_1E5B1DAF0 + a3 - 3737841664u);
  }

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VNRecognizeAnimalsRequest(Revisioning) privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNRecognizeAnimalsRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_17921);
  }
  v2 = (void *)+[VNRecognizeAnimalsRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

void __61__VNRecognizeAnimalsRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:3737841664];
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution]) {
    [v2 addIndex:3737841665];
  }
  [v2 addIndex:3737841666];
  uint64_t v0 = [v2 copy];
  v1 = (void *)+[VNRecognizeAnimalsRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
  +[VNRecognizeAnimalsRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = v0;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNRecognizeAnimalsRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end