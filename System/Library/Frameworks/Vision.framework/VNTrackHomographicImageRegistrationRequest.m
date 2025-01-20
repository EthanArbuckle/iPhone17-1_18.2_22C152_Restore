@interface VNTrackHomographicImageRegistrationRequest
+ (const)revisionAvailability;
- (BOOL)allowsCachingOfResults;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (VNTrackHomographicImageRegistrationRequest)init;
- (VNTrackHomographicImageRegistrationRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
@end

@implementation VNTrackHomographicImageRegistrationRequest

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNTrackHomographicImageRegistrationRequest revisionAvailability]::revisionAvailability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousImageRegistrationSignature, 0);

  objc_storeStrong((id *)&self->_previousImageBuffer, 0);
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [(VNTrackHomographicImageRegistrationRequest *)self applicableDetectorTypeForRevision:a3 error:a5];

  if (v9)
  {
    v10 = [v8 imageBufferAndReturnError:a5];
    if (!v10)
    {
      BOOL v30 = 0;
LABEL_19:

      goto LABEL_20;
    }
    [(VNImageBasedRequest *)self regionOfInterest];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:]([VNImageRegistrationSignature alloc], "initWithImageBuffer:regionOfInterest:error:", v10, a5, v11, v13, v15, v17);
    if (!v19)
    {
      BOOL v30 = 0;
LABEL_18:

      goto LABEL_19;
    }
    unint64_t v20 = 0x1E95EA000uLL;
    unint64_t v21 = 0x1E95EA000uLL;
    if (self->_previousRequestRevision != a3)
    {
      self->_previousRequestRevision = 0;
      CGSize v22 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      self->_previousRegionOfInterest.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      self->_previousRegionOfInterest.size = v22;
      previousImageBuffer = self->_previousImageBuffer;
      self->_previousImageBuffer = 0;

      previousImageRegistrationSignature = self->_previousImageRegistrationSignature;
      self->_previousImageRegistrationSignature = 0;
    }
    p_previousImageBuffer = &self->_previousImageBuffer;
    if (self->_previousImageBuffer)
    {
      v33 = [v8 session];
      id v34 = 0;
      v26 = [(VNRequest *)self applicableDetectorAndOptions:&v34 forRevision:a3 loadedInSession:v33 error:a5];
      id v27 = v34;
      v28 = v27;
      if (!v26)
      {

        v29 = 0;
LABEL_16:
        BOOL v30 = 0;
        goto LABEL_17;
      }
      [v27 setObject:*p_previousImageBuffer forKeyedSubscript:@"VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageBuffer"];
      [v28 setObject:self->_previousImageRegistrationSignature forKeyedSubscript:@"VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageRegistrationSignature"];
      [v28 setObject:v10 forKeyedSubscript:@"VNHomographicImageRegistrationDetectorProcessOption_FloatingImageBuffer"];
      [v28 setObject:v19 forKeyedSubscript:@"VNHomographicImageRegistrationDetectorProcessOption_FloatingImageRegistrationSignature"];
      v29 = objc_msgSend(v26, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", objc_msgSend(v8, "qosClass"), v28, self, a5, 0, v12, v14, v16, v18);

      unint64_t v21 = 0x1E95EA000;
      unint64_t v20 = 0x1E95EA000;
      if (!v29) {
        goto LABEL_16;
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x1E4F1CBF0];
    }
    self->_previousRequestRevision = a3;
    v31 = (double *)((char *)self + *(int *)(v20 + 3624));
    double *v31 = v12;
    v31[1] = v14;
    v31[2] = v16;
    v31[3] = v18;
    objc_storeStrong((id *)p_previousImageBuffer, v10);
    objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *(int *)(v21 + 3632)), v19);
    [(VNRequest *)self setResults:v29];
    BOOL v30 = 1;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v30 = 0;
LABEL_20:

  return v30;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  return 0;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    v4 = @"VNHomographicImageRegistrationDetectorType";
    v5 = @"VNHomographicImageRegistrationDetectorType";
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

- (VNTrackHomographicImageRegistrationRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  long long v4 = *MEMORY[0x1E4F1FA48];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  return [(VNStatefulRequest *)self initWithFrameAnalysisSpacing:&v4 completionHandler:completionHandler];
}

- (VNTrackHomographicImageRegistrationRequest)init
{
  return [(VNTrackHomographicImageRegistrationRequest *)self initWithCompletionHandler:0];
}

@end