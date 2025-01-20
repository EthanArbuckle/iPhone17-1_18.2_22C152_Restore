@interface VNHomographicImageRegistrationRequest
- (BOOL)allowsCachingOfResults;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)wantsSequencedRequestObservationsRecording;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
@end

@implementation VNHomographicImageRegistrationRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [v8 session];
  id v24 = 0;
  v10 = [(VNRequest *)self applicableDetectorAndOptions:&v24 forRevision:a3 loadedInSession:v9 error:a5];
  id v11 = v24;
  if (v10)
  {
    v12 = [(VNImageRegistrationRequest *)self cachedFloatingImageBufferReturningError:a5];
    if (v12)
    {
      [v11 setObject:v12 forKeyedSubscript:@"VNHomographicImageRegistrationDetectorProcessOption_FloatingImageBuffer"];
      id v22 = 0;
      id v23 = 0;
      BOOL v13 = [(VNImageRegistrationRequest *)self getReferenceImageBuffer:&v23 registrationSignature:&v22 forRequestPerformingContext:v8 error:a5];
      id v14 = v23;
      id v15 = v22;
      if (v13)
      {
        [v11 setObject:v14 forKeyedSubscript:@"VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageBuffer"];
        [v11 setObject:v15 forKeyedSubscript:@"VNHomographicImageRegistrationDetectorProcessOption_ReferenceImageRegistrationSignature"];
        v16 = [(VNImageRegistrationRequest *)self cachedFloatingImageRegistrationSignatureReturningError:a5];
        if (v16)
        {
          v21 = v16;
          [v11 setObject:v16 forKeyedSubscript:@"VNHomographicImageRegistrationDetectorProcessOption_FloatingImageRegistrationSignature"];
          uint64_t v17 = [v8 qosClass];
          [(VNImageBasedRequest *)self regionOfInterest];
          v18 = objc_msgSend(v10, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v11, self, a5, 0);
          BOOL v19 = v18 != 0;
          if (v18) {
            [(VNRequest *)self setResults:v18];
          }

          v16 = v21;
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 0;
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

@end