@interface VNRemoveBackgroundRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)cropResult;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)performInPlace;
- (BOOL)returnMask;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setCropResult:(BOOL)a3;
- (void)setPerformInPlace:(BOOL)a3;
- (void)setReturnMask:(BOOL)a3;
@end

@implementation VNRemoveBackgroundRequest

- (void)setReturnMask:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setReturnMask:v3];
}

- (BOOL)returnMask
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 returnMask];

  return v3;
}

- (void)setCropResult:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setCropResult:v3];
}

- (BOOL)cropResult
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 cropResult];

  return v3;
}

- (void)setPerformInPlace:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setPerformInPlace:v3];
}

- (BOOL)performInPlace
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 performInPlace];

  return v3;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    [v8 session];
    v22 = id v26 = 0;
    v23 = -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v26, a3);
    id v24 = v26;
    if (v23)
    {
      v27[0] = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v24 setObject:v10 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      char v11 = 0;
      uint64_t v12 = 0;
      __int16 v25 = 1;
      while (1)
      {
        char v13 = v11;
        int v14 = *((unsigned __int8 *)&v25 + v12);
        v15 = objc_alloc_init(VNRemoveBackgroundRequest);
        [(VNRemoveBackgroundRequest *)v15 applyConfigurationOfRequest:self];
        [(VNRemoveBackgroundRequest *)v15 setPerformInPlace:0];
        [(VNRemoveBackgroundRequest *)v15 setCropResult:v14 != 0];
        [(VNRemoveBackgroundRequest *)v15 setReturnMask:1];
        v16 = [v8 cachedObservationsAcceptedByRequest:v15];
        v17 = [v16 firstObject];

        if (v17) {
          break;
        }

        char v11 = 1;
        uint64_t v12 = 1;
        if (v13) {
          goto LABEL_10;
        }
      }
      [v24 setObject:v17 forKeyedSubscript:@"VNRemoveBackgroundProcessorOption_MaskObservation"];

LABEL_10:
      uint64_t v19 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v20 = objc_msgSend(v23, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v19, v24, self, a5, 0);
      BOOL v18 = v20 != 0;
      if (v20) {
        [(VNRequest *)self setResults:v20];
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VNRemoveBackgroundRequest;
  id v5 = [(VNRequest *)&v10 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRemoveBackgroundRequest performInPlace](self, "performInPlace"));
  [v5 setObject:v6 forKeyedSubscript:@"VNRemoveBackgroundProcessorOption_PerformInPlace"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRemoveBackgroundRequest cropResult](self, "cropResult"));
  [v5 setObject:v7 forKeyedSubscript:@"VNRemoveBackgroundProcessorOption_CropResult"];

  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRemoveBackgroundRequest returnMask](self, "returnMask"));
  [v5 setObject:v8 forKeyedSubscript:@"VNRemoveBackgroundProcessorOption_ReturnMask"];

  [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"VNRemoveBackgroundProcessorOption_AlphaGating"];
  return v5;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [(VNRemoveBackgroundRequest *)self performInPlace];
  if (v5 == [v4 performInPlace]
    && (int v6 = [(VNRemoveBackgroundRequest *)self cropResult],
        v6 == [v4 cropResult])
    && (int v7 = [(VNRemoveBackgroundRequest *)self returnMask],
        v7 == [v4 returnMask]))
  {
    v10.receiver = self;
    v10.super_class = (Class)VNRemoveBackgroundRequest;
    BOOL v8 = [(VNImageBasedRequest *)&v10 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNRemoveBackgroundRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNRemoveBackgroundRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      [(VNRemoveBackgroundRequest *)self setPerformInPlace:[(VNRemoveBackgroundRequest *)v5 performInPlace]];
      [(VNRemoveBackgroundRequest *)self setCropResult:[(VNRemoveBackgroundRequest *)v5 cropResult]];
      [(VNRemoveBackgroundRequest *)self setReturnMask:[(VNRemoveBackgroundRequest *)v5 returnMask]];
    }
  }
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  id v4 = @"VNRemoveBackgroundProcessorType";
  return @"VNRemoveBackgroundProcessorType";
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNRemoveBackgroundRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end