@interface VNCreateNeuralHashprintRequest
+ (BOOL)warmUpSession:(id)a3 error:(id *)a4;
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
@end

@implementation VNCreateNeuralHashprintRequest

+ (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VNCreateNeuralHashprintRequest;
  if (objc_msgSendSuper2(&v10, sel_warmUpSession_error_, v6, a4))
  {
    v7 = objc_alloc_init(VNCreateNeuralHashprintRequest);
    BOOL v8 = [(VNRequest *)v7 warmUpSession:v6 error:a4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = v8;
  if (a3 == 1)
  {
    objc_super v10 = [v8 imageBufferAndReturnError:a5];
    if (v10
      && [(VNRequest *)self validateImageBuffer:v10 ofNonZeroWidth:0 andHeight:0 error:a5])
    {
      v11 = [v9 session];
      id v19 = 0;
      v12 = [(VNRequest *)self applicableDetectorAndOptions:&v19 forRevision:1 loadedInSession:v11 error:a5];
      id v13 = v19;
      if (v12)
      {
        v20[0] = v10;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
        [v13 setObject:v14 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

        uint64_t v15 = [v9 qosClass];
        [(VNImageBasedRequest *)self regionOfInterest];
        v16 = objc_msgSend(v12, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v13, self, a5, 0);
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
  }
  else if (a5)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    BOOL v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v4 = @"VN4nFZhnOcBOiJmeVWzBWsvType";
  return @"VN4nFZhnOcBOiJmeVWzBWsvType";
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNCreateNeuralHashprintRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end