@interface VNImageBlurScoreRequest
+ (Class)configurationClass;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (unint64_t)blurDeterminationMethod;
- (unint64_t)maximumIntermediateSideLength;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setBlurDeterminationMethod:(unint64_t)a3;
- (void)setMaximumIntermediateSideLength:(unint64_t)a3;
@end

@implementation VNImageBlurScoreRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  VNValidatedLog(1, @"Processing VNImageBlurMetric request\n", v9, v10, v11, v12, v13, v14, v26);
  v15 = [v8 imageBufferAndReturnError:a5];
  if (v15)
  {
    v16 = [v8 session];
    id v27 = 0;
    v17 = [(VNRequest *)self applicableDetectorAndOptions:&v27 forRevision:a3 loadedInSession:v16 error:a5];
    id v18 = v27;
    if (v17)
    {
      v19 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[VNImageBlurScoreRequest maximumIntermediateSideLength](self, "maximumIntermediateSideLength"));
      [v18 setObject:v19 forKeyedSubscript:@"VNBlurDetectorProcessOption_MaximumIntermediateSideLength"];

      v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNImageBlurScoreRequest blurDeterminationMethod](self, "blurDeterminationMethod"));
      [v18 setObject:v20 forKeyedSubscript:@"VNBlurDetectorProcessOption_ImageBlurDeterminationMethod"];

      v28[0] = v15;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      [v18 setObject:v21 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      uint64_t v22 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v23 = objc_msgSend(v17, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v22, v18, self, a5, 0);
      BOOL v24 = v23 != 0;
      if (v23) {
        [(VNRequest *)self setResults:v23];
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNImageBlurScoreRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNImageBlurScoreRequest;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(VNImageBlurScoreRequest *)self setMaximumIntermediateSideLength:[(VNImageBlurScoreRequest *)v4 maximumIntermediateSideLength]];
      [(VNImageBlurScoreRequest *)self setBlurDeterminationMethod:[(VNImageBlurScoreRequest *)v4 blurDeterminationMethod]];
    }
  }
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNImageBlurScoreRequest *)self blurDeterminationMethod];
  if (v5 == [v4 blurDeterminationMethod]
    && (unint64_t v6 = [(VNImageBlurScoreRequest *)self maximumIntermediateSideLength],
        v6 == [v4 maximumIntermediateSideLength]))
  {
    v9.receiver = self;
    v9.super_class = (Class)VNImageBlurScoreRequest;
    BOOL v7 = [(VNImageBasedRequest *)&v9 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    id v4 = @"VNBlurDetectorType";
    unint64_t v5 = @"VNBlurDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    id v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setMaximumIntermediateSideLength:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setMaximumIntermediateSideLength:a3];
}

- (unint64_t)maximumIntermediateSideLength
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 maximumIntermediateSideLength];

  return v3;
}

- (void)setBlurDeterminationMethod:(unint64_t)a3
{
  if (a3 <= 1)
  {
    id v4 = [(VNRequest *)self configuration];
    [v4 setBlurDeterminationMethod:a3];
  }
}

- (unint64_t)blurDeterminationMethod
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 blurDeterminationMethod];

  return v3;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end