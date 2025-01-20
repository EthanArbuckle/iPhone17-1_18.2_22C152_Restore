@interface VNTrackHomographyRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)allowsCachingOfResults;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (VNTrackHomographyRequest)initWithFrameAnalysisSpacing:(id *)a3 completionHandler:(id)a4;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
@end

@implementation VNTrackHomographyRequest

- (void).cxx_destruct
{
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v10 = [v8 session];
    id v18 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v18 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v18;
    if (v11)
    {
      v19[0] = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [v12 setObject:v13 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      [v12 setObject:self->_state forKeyedSubscript:@"VNHomographyTrackerProcessOption_State"];
      uint64_t v14 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v15 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v14, v12, self, a5, 0);
      BOOL v16 = v15 != 0;
      if (v15) {
        [(VNRequest *)self setResults:v15];
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v4 = @"VNHomographyTrackerType";
  return @"VNHomographyTrackerType";
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (VNTrackHomographyRequest)initWithFrameAnalysisSpacing:(id *)a3 completionHandler:(id)a4
{
  id v6 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  v11.receiver = self;
  v11.super_class = (Class)VNTrackHomographyRequest;
  v7 = [(VNStatefulRequest *)&v11 initWithFrameAnalysisSpacing:&v12 completionHandler:v6];
  if (v7)
  {
    id v8 = objc_alloc_init(VNHomographyTrackerState);
    state = v7->_state;
    v7->_state = v8;
  }
  return v7;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNTrackHomographyRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end