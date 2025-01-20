@interface VNGenerateSegmentationRequest
+ (Class)configurationClass;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)configuredCopyOfSelfWithBalancedQualityLevel;
- (id)description;
- (id)performAccurateSegmentationInContext:(id)a3 options:(id)a4 error:(id *)a5;
- (unsigned)outputPixelFormat;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setOutputPixelFormat:(unsigned int)a3;
@end

@implementation VNGenerateSegmentationRequest

- (id)description
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)VNGenerateSegmentationRequest;
  v4 = [(VNImageBasedRequest *)&v11 description];
  unsigned int v5 = [(VNGenerateSegmentationRequest *)self outputPixelFormat];
  if (v5 == 1278226488) {
    v6 = @"kCVPixelFormatType_OneComponent8";
  }
  else {
    v6 = 0;
  }
  if (v5 == 1278226534) {
    v7 = @"kCVPixelFormatType_OneComponent32Float";
  }
  else {
    v7 = v6;
  }
  if (v5 == 1278226536) {
    v8 = @"kCVPixelFormatType_OneComponent16Half";
  }
  else {
    v8 = v7;
  }
  v9 = (void *)[v3 initWithFormat:@"%@ pixelFormat=%@", v4, v8];

  return v9;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setOutputPixelFormat:v3];
}

- (unsigned)outputPixelFormat
{
  v2 = [(VNRequest *)self configuration];
  unsigned int v3 = [v2 outputPixelFormat];

  return v3;
}

- (id)configuredCopyOfSelfWithBalancedQualityLevel
{
  return 0;
}

- (id)performAccurateSegmentationInContext:(id)a3 options:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v25 = a4;
  v9 = [(VNGenerateSegmentationRequest *)self configuredCopyOfSelfWithBalancedQualityLevel];
  for (uint64_t i = 0; i != 3; ++i)
  {
    [v9 setOutputPixelFormat:-[VNGenerateSegmentationRequest performAccurateSegmentationInContext:options:error:]::pixelFormatTypes[i]];
    objc_super v11 = [v8 cachedObservationsAcceptedByRequest:v9];
    if (v11) {
      goto LABEL_7;
    }
  }
  [v9 setOutputPixelFormat:1278226534];
  v12 = [v8 requestPerformerAndReturnError:a5];
  if (!v12
    || (v26[0] = v9,
        [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1],
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v12 performDependentRequests:v13 onBehalfOfRequest:self inContext:v8 error:a5],
        v13,
        (v14 & 1) == 0))
  {

    objc_super v11 = 0;
LABEL_14:
    self = 0;
    goto LABEL_18;
  }
  objc_super v11 = [v9 results];

LABEL_7:
  if (![v11 count])
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Empty observations"];
      self = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  [v25 setObject:v11 forKeyedSubscript:@"VNGuidedUpsamplingGeneratorOption_LowResImages"];
  [v25 setObject:&unk_1EF7A7958 forKeyedSubscript:@"VNGuidedUpsamplingGeneratorOption_InputPixelFormat"];
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VNGenerateSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
  [v25 setObject:v15 forKeyedSubscript:@"VNGuidedUpsamplingGeneratorOption_OutputPixelFormat"];

  id v16 = v8;
  v17 = @"VNGuidedUpsamplingGeneratorType";
  id v18 = v25;
  if (self)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v18];
    [v19 removeObjectForKey:@"VNSegmentationGeneratorProcessOption_OutputPixelFormat"];
    [v19 removeObjectForKey:@"VNSegmentationGeneratorProcessOption_KeepRawOutputMask"];
    [v19 removeObjectForKey:@"VNSegmentationGeneratorProcessOption_MaskImageObservations"];
    v20 = [v16 session];
    v21 = [v20 detectorOfType:@"VNGuidedUpsamplingGeneratorType" configuredWithOptions:v19 error:a5];
    if (v21)
    {
      id v24 = v16;
      uint64_t v22 = [v16 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      objc_msgSend(v21, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v22, v18, self, a5, 0);
      self = (VNGenerateSegmentationRequest *)objc_claimAutoreleasedReturnValue();
      id v16 = v24;
    }
    else
    {
      self = 0;
    }
  }
LABEL_18:

  return self;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(VNGenerateSegmentationRequest *)self outputPixelFormat];
  if (v5 == [v4 outputPixelFormat])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNGenerateSegmentationRequest;
    BOOL v6 = [(VNImageBasedRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNGenerateSegmentationRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNGenerateSegmentationRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = v4;
      [(VNGenerateSegmentationRequest *)self setOutputPixelFormat:[(VNGenerateSegmentationRequest *)v5 outputPixelFormat]];
    }
  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end