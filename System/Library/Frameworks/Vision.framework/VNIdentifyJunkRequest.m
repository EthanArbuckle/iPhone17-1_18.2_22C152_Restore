@interface VNIdentifyJunkRequest
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
@end

@implementation VNIdentifyJunkRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  VNValidatedLog(1, @"Processing IdentifyJunk request\n", v9, v10, v11, v12, v13, v14, v24);
  v15 = [v8 imageBufferAndReturnError:a5];
  if (v15
    && [(VNRequest *)self validateImageBuffer:v15 ofNonZeroWidth:0 andHeight:0 error:a5])
  {
    v16 = [v8 session];
    id v25 = 0;
    v17 = [(VNRequest *)self applicableDetectorAndOptions:&v25 forRevision:a3 loadedInSession:v16 error:a5];
    id v18 = v25;
    if (v17)
    {
      v26[0] = v15;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      [v18 setObject:v19 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      uint64_t v20 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v21 = objc_msgSend(v17, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v20, v18, self, a5, 0);
      BOOL v22 = v21 != 0;
      if (v21) {
        [(VNRequest *)self setResults:v21];
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v4 = @"VNJunkIdentifierType";
  return @"VNJunkIdentifierType";
}

@end