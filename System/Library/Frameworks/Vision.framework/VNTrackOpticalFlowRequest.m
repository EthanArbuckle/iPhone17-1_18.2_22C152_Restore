@interface VNTrackOpticalFlowRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)allowsCachingOfResults;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)keepNetworkOutput;
- (BOOL)warmUpSession:(id)a3 error:(id *)a4;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (OSType)outputPixelFormat;
- (VNTrackOpticalFlowRequest)init;
- (VNTrackOpticalFlowRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTrackOpticalFlowRequestComputationAccuracy)computationAccuracy;
- (id)_createGeneratorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4 images:(id)a5 portraitMode:(BOOL)a6 previousTargetImageIsCurrentRefImage:(BOOL)a7 previousObservation:(id)a8;
- (id)_observationForOpticalFlowOfReferenceImageBuffer:(id)a3 targetImageBuffer:(id)a4 portraitMode:(BOOL)a5 previousObservation:(id)a6 previousTargetImageIsCurrentRefImage:(BOOL)a7 requestRevision:(unint64_t)a8 requestPerformingContext:(id)a9 error:(id *)a10;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedOutputPixelFormatsAndReturnError:(id *)a3;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setComputationAccuracy:(VNTrackOpticalFlowRequestComputationAccuracy)computationAccuracy;
- (void)setKeepNetworkOutput:(BOOL)keepNetworkOutput;
- (void)setOutputPixelFormat:(OSType)outputPixelFormat;
@end

@implementation VNTrackOpticalFlowRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousObservation, 0);
  objc_storeStrong((id *)&self->_previousImageSignature, 0);

  objc_storeStrong((id *)&self->_previousImageBuffer, 0);
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    [(VNImageBasedRequest *)self regionOfInterest];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    int v18 = objc_msgSend(v9, "aspectForRegionOfInterest:");
    BOOL v32 = v18 == 1;
    if (self->_previousRequestRevision != a3 || self->_previousPortraitMode != v32)
    {
      self->_previousRequestRevision = 0;
      CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      self->_previousRegionOfInterest.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      self->_previousRegionOfInterest.size = v19;
      previousImageBuffer = self->_previousImageBuffer;
      self->_previousImageBuffer = 0;

      previousImageSignature = self->_previousImageSignature;
      self->_previousImageSignature = 0;

      previousObservation = self->_previousObservation;
      self->_previousObservation = 0;

      self->_previousPortraitMode = 0;
    }
    v23 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:]([VNImageSignature alloc], "initWithImageBuffer:regionOfInterest:error:", v9, a5, v11, v13, v15, v17);
    v24 = v23;
    p_previousImageBuffer = (id *)&self->_previousImageBuffer;
    v26 = self->_previousImageBuffer;
    if (v26)
    {
      if (self->_previousImageSignature)
      {
        uint64_t v27 = -[VNImageSignature isEqual:](v23, "isEqual:");
        v26 = (VNImageBuffer *)*p_previousImageBuffer;
      }
      else
      {
        uint64_t v27 = 0;
      }
      v29 = [(VNTrackOpticalFlowRequest *)self _observationForOpticalFlowOfReferenceImageBuffer:v9 targetImageBuffer:v26 portraitMode:v18 == 1 previousObservation:self->_previousObservation previousTargetImageIsCurrentRefImage:v27 requestRevision:a3 requestPerformingContext:v8 error:a5];
      if (!v29)
      {
        BOOL v28 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v29 = 0;
    }
    self->_previousRequestRevision = a3;
    self->_previousRegionOfInterest.origin.x = v11;
    self->_previousRegionOfInterest.origin.y = v13;
    self->_previousRegionOfInterest.size.width = v15;
    self->_previousRegionOfInterest.size.height = v17;
    objc_storeStrong(p_previousImageBuffer, v9);
    objc_storeStrong((id *)&self->_previousImageSignature, v24);
    objc_storeStrong((id *)&self->_previousObservation, v29);
    self->_previousPortraitMode = v32;
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v29, 0);
    [(VNRequest *)self setResults:v30];

    BOOL v28 = 1;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v28 = 0;
LABEL_15:

  return v28;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  return 0;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)VNTrackOpticalFlowRequest;
  id v5 = [(VNRequest *)&v13 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v6 = NSNumber;
  VNTrackOpticalFlowRequestComputationAccuracy v7 = [(VNTrackOpticalFlowRequest *)self computationAccuracy];
  if (v7 - 1 >= 3) {
    VNTrackOpticalFlowRequestComputationAccuracy v8 = VNTrackOpticalFlowRequestComputationAccuracyLow;
  }
  else {
    VNTrackOpticalFlowRequestComputationAccuracy v8 = v7;
  }
  v9 = [v6 numberWithUnsignedInteger:v8];
  [v5 setObject:v9 forKeyedSubscript:@"VNOpticalFlowGeneratorOption_ComputationAccuracy"];

  double v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VNTrackOpticalFlowRequest outputPixelFormat](self, "outputPixelFormat"));
  [v5 setObject:v10 forKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_OutputPixelFormat"];

  double v11 = objc_msgSend(NSNumber, "numberWithBool:", -[VNTrackOpticalFlowRequest keepNetworkOutput](self, "keepNetworkOutput"));
  [v5 setObject:v11 forKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_KeepNetworkOutput"];

  return v5;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNTrackOpticalFlowRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNTrackOpticalFlowRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      [(VNTrackOpticalFlowRequest *)self setOutputPixelFormat:[(VNTrackOpticalFlowRequest *)v5 outputPixelFormat]];
      [(VNTrackOpticalFlowRequest *)self setKeepNetworkOutput:[(VNTrackOpticalFlowRequest *)v5 keepNetworkOutput]];
    }
  }
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    v4 = @"VNOpticalFlowGeneratorType";
    id v5 = @"VNOpticalFlowGeneratorType";
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

- (void)setKeepNetworkOutput:(BOOL)keepNetworkOutput
{
  BOOL v3 = keepNetworkOutput;
  id v4 = [(VNRequest *)self configuration];
  [v4 setKeepNetworkOutput:v3];
}

- (BOOL)keepNetworkOutput
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 keepNetworkOutput];

  return v3;
}

- (void)setOutputPixelFormat:(OSType)outputPixelFormat
{
  uint64_t v3 = *(void *)&outputPixelFormat;
  id v4 = [(VNRequest *)self configuration];
  [v4 setOutputPixelFormat:v3];
}

- (OSType)outputPixelFormat
{
  v2 = [(VNRequest *)self configuration];
  OSType v3 = [v2 outputPixelFormat];

  return v3;
}

- (id)supportedOutputPixelFormatsAndReturnError:(id *)a3
{
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  id v10 = 0;
  objc_super v6 = [(VNRequest *)self applicableDetectorClassAndOptions:&v10 forRevision:v5 error:a3];
  id v7 = v10;
  if (!v6) {
    goto LABEL_6;
  }
  if ([(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
  {
    VNTrackOpticalFlowRequestComputationAccuracy v8 = [(objc_class *)v6 supportedOutputPixelFormatsForOptions:v7 error:a3];
    goto LABEL_7;
  }
  if (a3)
  {
    +[VNError errorForUnsupportedRevision:v5 ofRequest:self];
    VNTrackOpticalFlowRequestComputationAccuracy v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    VNTrackOpticalFlowRequestComputationAccuracy v8 = 0;
  }
LABEL_7:

  return v8;
}

- (void)setComputationAccuracy:(VNTrackOpticalFlowRequestComputationAccuracy)computationAccuracy
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setComputationAccuracy:computationAccuracy];
}

- (VNTrackOpticalFlowRequestComputationAccuracy)computationAccuracy
{
  v2 = [(VNRequest *)self configuration];
  VNTrackOpticalFlowRequestComputationAccuracy v3 = [v2 computationAccuracy];

  return v3;
}

- (VNTrackOpticalFlowRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  long long v4 = *MEMORY[0x1E4F1FA48];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  return [(VNStatefulRequest *)self initWithFrameAnalysisSpacing:&v4 completionHandler:completionHandler];
}

- (VNTrackOpticalFlowRequest)init
{
  return [(VNTrackOpticalFlowRequest *)self initWithCompletionHandler:0];
}

- (id)_observationForOpticalFlowOfReferenceImageBuffer:(id)a3 targetImageBuffer:(id)a4 portraitMode:(BOOL)a5 previousObservation:(id)a6 previousTargetImageIsCurrentRefImage:(BOOL)a7 requestRevision:(unint64_t)a8 requestPerformingContext:(id)a9 error:(id *)a10
{
  BOOL v11 = a7;
  BOOL v13 = a5;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v16 = a4;
  id v32 = a6;
  id v17 = a9;
  int v18 = [(VNTrackOpticalFlowRequest *)self applicableDetectorTypeForRevision:a8 error:a10];
  if (!v18)
  {
    v29 = 0;
    goto LABEL_13;
  }
  CGSize v19 = [v17 session];
  v33[0] = v31;
  v33[1] = v16;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v21 = [(VNTrackOpticalFlowRequest *)self _createGeneratorOptionsForRequestRevision:a8 session:v19 images:v20 portraitMode:v13 previousTargetImageIsCurrentRefImage:v11 previousObservation:v32];

  v22 = [v19 detectorOfType:v18 configuredWithOptions:v21 error:a10];
  if (v22)
  {
    -[VNImageBasedRequest regionOfInterestPixelRectForWidth:height:](self, "regionOfInterestPixelRectForWidth:height:", [v16 width], objc_msgSend(v16, "height"));
    uint64_t v27 = objc_msgSend(v22, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", objc_msgSend(v17, "qosClass"), v21, self, a10, 0, v23, v24, v25, v26);
    BOOL v28 = v27;
    if (v27)
    {
      if ([v27 count] == 1)
      {
        v29 = [v28 firstObject];
LABEL_11:

        goto LABEL_12;
      }
      if (a10)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot generate optical flow"];
        v29 = 0;
        *a10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    v29 = 0;
    goto LABEL_11;
  }
  v29 = 0;
LABEL_12:

LABEL_13:

  return v29;
}

- (id)_createGeneratorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4 images:(id)a5 portraitMode:(BOOL)a6 previousTargetImageIsCurrentRefImage:(BOOL)a7 previousObservation:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a8;
  id v16 = [(VNTrackOpticalFlowRequest *)self newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  [v16 setObject:v14 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];
  id v17 = [NSNumber numberWithBool:v10];
  [v16 setObject:v17 forKeyedSubscript:@"VNOpticalFlowGeneratorInitOption_PortraitMode"];

  if (v9) {
    [v16 setObject:v15 forKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_PreviousObservation"];
  }

  return v16;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNTrackOpticalFlowRequest revisionAvailability]::revisionAvailability;
}

@end