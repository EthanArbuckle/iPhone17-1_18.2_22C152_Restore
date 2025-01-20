@interface VNDetectHorizonRequest
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
@end

@implementation VNDetectHorizonRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9
    && [(VNRequest *)self validateImageBuffer:v9 ofNonZeroWidth:0 andHeight:0 error:a5])
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
  v4 = @"VNHorizonDetectorType";
  return @"VNHorizonDetectorType";
}

@end