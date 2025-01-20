@interface VNGenerateOpticalFlowRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)_internalPerformRevision:(unint64_t)a3 inContext:(id)a4 previousObservation:(id)a5 error:(id *)a6;
- (BOOL)allowsCachingOfResults;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)keepNetworkOutput;
- (BOOL)wantsSequencedRequestObservationsRecording;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (OSType)outputPixelFormat;
- (VNGenerateOpticalFlowRequestComputationAccuracy)computationAccuracy;
- (id)_createGeneratorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4 images:(id)a5 previousTargetImageIsCurrentRefImage:(BOOL)a6 previousObservation:(id)a7;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setComputationAccuracy:(VNGenerateOpticalFlowRequestComputationAccuracy)computationAccuracy;
- (void)setKeepNetworkOutput:(BOOL)keepNetworkOutput;
- (void)setOutputPixelFormat:(OSType)outputPixelFormat;
@end

@implementation VNGenerateOpticalFlowRequest

- (void)setKeepNetworkOutput:(BOOL)keepNetworkOutput
{
  v4 = [(VNRequest *)self configuration];
  if (v4) {
    v4[144] = keepNetworkOutput;
  }
}

- (BOOL)keepNetworkOutput
{
  v2 = [(VNRequest *)self configuration];
  if (v2) {
    BOOL v3 = v2[144] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)setOutputPixelFormat:(OSType)outputPixelFormat
{
  v4 = [(VNRequest *)self configuration];
  if (v4) {
    v4[37] = outputPixelFormat;
  }
}

- (OSType)outputPixelFormat
{
  v2 = [(VNRequest *)self configuration];
  if (v2) {
    OSType v3 = v2[37];
  }
  else {
    OSType v3 = 0;
  }

  return v3;
}

- (void)setComputationAccuracy:(VNGenerateOpticalFlowRequestComputationAccuracy)computationAccuracy
{
  v4 = [(VNRequest *)self configuration];
  if (v4) {
    v4[19] = computationAccuracy;
  }
}

- (VNGenerateOpticalFlowRequestComputationAccuracy)computationAccuracy
{
  v2 = [(VNRequest *)self configuration];
  if (v2) {
    VNGenerateOpticalFlowRequestComputationAccuracy v3 = v2[19];
  }
  else {
    VNGenerateOpticalFlowRequestComputationAccuracy v3 = VNGenerateOpticalFlowRequestComputationAccuracyLow;
  }

  return v3;
}

- (id)_createGeneratorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4 images:(id)a5 previousTargetImageIsCurrentRefImage:(BOOL)a6 previousObservation:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a7;
  id v14 = [(VNGenerateOpticalFlowRequest *)self newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  [v14 setObject:v12 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];
  if (v8) {
    [v14 setObject:v13 forKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_PreviousObservation"];
  }

  return v14;
}

- (BOOL)_internalPerformRevision:(unint64_t)a3 inContext:(id)a4 previousObservation:(id)a5 error:(id *)a6
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = [(VNGenerateOpticalFlowRequest *)self applicableDetectorTypeForRevision:a3 error:a6];
  if (v12)
  {
    id v13 = [v10 imageBufferAndReturnError:a6];
    if (!v13)
    {
      BOOL v35 = 0;
LABEL_22:

      goto LABEL_23;
    }
    id v14 = [(VNTargetedImageRequest *)self requiredTargetedImageBufferReturningError:a6];
    if (!v14)
    {
      BOOL v35 = 0;
LABEL_21:

      goto LABEL_22;
    }
    [(VNImageBasedRequest *)self regionOfInterest];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    v39 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:]([VNImageSignature alloc], "initWithImageBuffer:regionOfInterest:error:", v13, a6, v15, v17, v19, v21);
    v23 = [v11 targetImageSignature];
    uint64_t v24 = [(VNImageSignature *)v39 isEqual:v23];

    if ((v24 & 1) == 0)
    {
      [v11 setTargetImageSignature:0];
      [v11 setOpticalFlow:0];
    }
    v41 = [v10 session];
    v43[0] = v13;
    v43[1] = v14;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    v40 = [(VNGenerateOpticalFlowRequest *)self _createGeneratorOptionsForRequestRevision:a3 session:v41 images:v25 previousTargetImageIsCurrentRefImage:v24 previousObservation:v11];

    v26 = [v41 detectorOfType:v12 configuredWithOptions:v40 error:a6];
    if (!v26)
    {
      BOOL v35 = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[VNImageBasedRequest regionOfInterestPixelRectForWidth:height:](self, "regionOfInterestPixelRectForWidth:height:", [v14 width], objc_msgSend(v14, "height"));
    v31 = objc_msgSend(v26, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", objc_msgSend(v10, "qosClass"), v40, self, a6, 0, v27, v28, v29, v30);
    v32 = v31;
    if (!v31) {
      goto LABEL_18;
    }
    if ([v31 count] == 1)
    {
      v37 = [v32 objectAtIndexedSubscript:0];
      if (a3 == 1)
      {
        v33 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:]([VNImageSignature alloc], "initWithImageBuffer:regionOfInterest:error:", v14, a6, v16, v18, v20, v22);
        [v37 setTargetImageSignature:v33];
      }
      v42 = v37;
      v34 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v42, 1, v37);
      [(VNRequest *)self setResults:v34];

      BOOL v35 = 1;
      goto LABEL_19;
    }
    if (a6)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot generate optical flow"];
      BOOL v35 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_18:
      BOOL v35 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  BOOL v35 = 0;
LABEL_23:

  return v35;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = v8;
  if (a3 == 1)
  {
    id v10 = [v8 previousSequencedObservationsAcceptedByRequest:self];
    if ([v10 count])
    {
      id v11 = [v10 objectAtIndexedSubscript:0];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  BOOL v12 = [(VNGenerateOpticalFlowRequest *)self _internalPerformRevision:a3 inContext:v9 previousObservation:v11 error:a5];
  [v11 setTargetImageSignature:0];
  [v11 setOpticalFlow:0];

  return v12;
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 1;
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
  v19.receiver = self;
  v19.super_class = (Class)VNGenerateOpticalFlowRequest;
  id v6 = [(VNRequest *)&v19 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v7 = NSNumber;
  VNGenerateOpticalFlowRequestComputationAccuracy v8 = [(VNGenerateOpticalFlowRequest *)self computationAccuracy];
  if (v8 - 1 >= 3) {
    VNGenerateOpticalFlowRequestComputationAccuracy v9 = VNGenerateOpticalFlowRequestComputationAccuracyLow;
  }
  else {
    VNGenerateOpticalFlowRequestComputationAccuracy v9 = v8;
  }
  id v10 = [v7 numberWithUnsignedInteger:v9];
  [v6 setObject:v10 forKeyedSubscript:@"VNOpticalFlowGeneratorOption_ComputationAccuracy"];

  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VNGenerateOpticalFlowRequest outputPixelFormat](self, "outputPixelFormat"));
  [v6 setObject:v11 forKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_OutputPixelFormat"];

  if (a3 == 2)
  {
    id v18 = 0;
    BOOL v12 = [(VNTargetedImageRequest *)self requiredTargetedImageBufferReturningError:&v18];
    id v13 = v18;
    id v14 = [v13 localizedDescription];
    +[VNError VNAssert:v12 != 0 log:v14];

    [(VNImageBasedRequest *)self regionOfInterest];
    double v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "aspectForRegionOfInterest:") == 1);
    [v6 setObject:v15 forKeyedSubscript:@"VNOpticalFlowGeneratorInitOption_PortraitMode"];

    double v16 = objc_msgSend(NSNumber, "numberWithBool:", -[VNGenerateOpticalFlowRequest keepNetworkOutput](self, "keepNetworkOutput"));
    [v6 setObject:v16 forKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_KeepNetworkOutput"];
  }
  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNGenerateOpticalFlowRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNGenerateOpticalFlowRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(VNGenerateOpticalFlowRequest *)self setComputationAccuracy:[(VNGenerateOpticalFlowRequest *)v5 computationAccuracy]];
      [(VNGenerateOpticalFlowRequest *)self setOutputPixelFormat:[(VNGenerateOpticalFlowRequest *)v5 outputPixelFormat]];
      [(VNGenerateOpticalFlowRequest *)self setKeepNetworkOutput:[(VNGenerateOpticalFlowRequest *)v5 keepNetworkOutput]];
    }
  }
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 - 1 > 1)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = @"VNOpticalFlowGeneratorType";
    v5 = @"VNOpticalFlowGeneratorType";
  }

  return v4;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNGenerateOpticalFlowRequest revisionAvailability]::revisionAvailability;
}

@end