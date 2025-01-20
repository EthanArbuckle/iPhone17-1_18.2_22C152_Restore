@interface VNCreateSmartCamprintRequest
+ (Class)configurationClass;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)returnAllResults;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setReturnAllResults:(BOOL)a3;
@end

@implementation VNCreateSmartCamprintRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v10 = [v8 session];
    id v19 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v19 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v19;
    if (v11)
    {
      v20[0] = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v12 setObject:v13 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      v14 = objc_msgSend(NSNumber, "numberWithBool:", -[VNCreateSmartCamprintRequest returnAllResults](self, "returnAllResults"));
      [v12 setObject:v14 forKeyedSubscript:@"VNSmartCamClassifierProcessOption_ReturnAllResults"];

      uint64_t v15 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v16 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v12, self, a5, 0);
      BOOL v17 = v16 != 0;
      if (v16) {
        [(VNRequest *)self setResults:v16];
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNCreateSmartCamprintRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNCreateSmartCamprintRequest;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VNCreateSmartCamprintRequest *)self setReturnAllResults:[(VNCreateSmartCamprintRequest *)v4 returnAllResults]];
    }
  }
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [(VNCreateSmartCamprintRequest *)self returnAllResults];
  if (v5 == [v4 returnAllResults])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNCreateSmartCamprintRequest;
    BOOL v6 = [(VNImageBasedRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setReturnAllResults:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setReturnAllResults:v3];
}

- (BOOL)returnAllResults
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 returnAllResults];

  return v3;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  id v4 = @"VNSmartCamClassifierType";
  return @"VNSmartCamClassifierType";
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end