@interface VNTrackTranslationalImageRegistrationRequest
+ (const)revisionAvailability;
- (BOOL)allowsCachingOfResults;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (VNTrackTranslationalImageRegistrationRequest)init;
- (VNTrackTranslationalImageRegistrationRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler;
- (id)supportedComputeStageDevicesAndReturnError:(id *)a3;
@end

@implementation VNTrackTranslationalImageRegistrationRequest

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&revisionAvailability_revisionAvailability;
}

- (void).cxx_destruct
{
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = v8;
  if (a3 == 1)
  {
    v10 = [v8 imageBufferAndReturnError:a5];
    if (!v10)
    {
      BOOL v18 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v11 = [VNImageRegistrationSignature alloc];
    [(VNImageBasedRequest *)self regionOfInterest];
    v12 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:](v11, "initWithImageBuffer:regionOfInterest:error:", v10, a5);
    if (v12)
    {
      if (self->_previousRequestRevision != 1)
      {
        self->_previousRequestRevision = 0;
        previousImageRegistrationSignature = self->_previousImageRegistrationSignature;
        self->_previousImageRegistrationSignature = 0;
      }
      v14 = self->_previousImageRegistrationSignature;
      if (!v14)
      {
        v17 = 0;
        goto LABEL_15;
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v22 = 0u;
      if (+[VNImageRegistration computeTransform:&v22 forRegisteringImageSignature:v14 withSignature:v12 minimumOverlap:a5 error:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(0.25))])
      {
        v15 = [VNImageTranslationAlignmentObservation alloc];
        v16 = [(VNRequest *)self specifier];
        v17 = [(VNObservation *)v15 initWithOriginatingRequestSpecifier:v16];

        v21[0] = v22;
        v21[1] = v23;
        v21[2] = v24;
        [(VNImageTranslationAlignmentObservation *)v17 setAlignmentTransform:v21];
LABEL_15:
        BOOL v18 = 1;
        self->_previousRequestRevision = 1;
        objc_storeStrong((id *)&self->_previousImageRegistrationSignature, v12);
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v17, 0);
        [(VNRequest *)self setResults:v19];

        goto LABEL_16;
      }
    }
    BOOL v18 = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (a5)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    BOOL v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_18:

  return v18;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  return 0;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"VNComputeStageMain";
  v3 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (VNTrackTranslationalImageRegistrationRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  long long v4 = *MEMORY[0x1E4F1FA48];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  return [(VNStatefulRequest *)self initWithFrameAnalysisSpacing:&v4 completionHandler:completionHandler];
}

- (VNTrackTranslationalImageRegistrationRequest)init
{
  return [(VNTrackTranslationalImageRegistrationRequest *)self initWithCompletionHandler:0];
}

@end