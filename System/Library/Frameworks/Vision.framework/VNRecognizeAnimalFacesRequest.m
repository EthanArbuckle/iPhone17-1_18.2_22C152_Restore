@interface VNRecognizeAnimalFacesRequest
+ (const)revisionAvailability;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)supportedIdentifiersAndReturnError:(id *)a3;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNRecognizeAnimalFacesRequest

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
  v5 = [(VNRequest *)self applicableDetectorClassAndOptions:0 forRevision:[(VNRequest *)self resolvedRevision] error:a3];
  if (v5)
  {
    v6 = v5;
    if (objc_opt_respondsToSelector())
    {
      v5 = [(objc_class *)v6 knownAnimalFaceIdentifiers];
    }
    else
    {
      if (a3)
      {
        v7 = [(VNRequest *)self specifier];
        *a3 = +[VNError errorForUnsupportedRequestSpecifier:v7];
      }
      v5 = 0;
    }
  }

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    v4 = @"VNANFDMultiDetectorType";
    v5 = @"VNANFDMultiDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNRecognizeAnimalFacesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end