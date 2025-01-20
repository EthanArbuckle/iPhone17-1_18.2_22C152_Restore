@interface VNTrackMaskRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)generateCropRect;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (VNTrackMaskRequest)initWithFrameUpdateSpacing:(id *)a3 mask:(__CVBuffer *)a4 completionHandler:(id)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setGenerateCropRect:(BOOL)a3;
@end

@implementation VNTrackMaskRequest

- (void).cxx_destruct
{
}

- (void)setGenerateCropRect:(BOOL)a3
{
  self->_generateCropRect = a3;
}

- (BOOL)generateCropRect
{
  return self->_generateCropRect;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 session];
  id v19 = 0;
  v10 = [(VNRequest *)self applicableDetectorAndOptions:&v19 forRevision:a3 loadedInSession:v9 error:a5];
  id v11 = v19;
  if (v10)
  {
    uint64_t v12 = [v8 imageBufferAndReturnError:a5];
    v13 = (void *)v12;
    if (v12)
    {
      v20[0] = v12;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v11 setObject:v14 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      [v11 setObject:self->_state forKeyedSubscript:@"VNTrackMaskDetectorProcessOption_State"];
      uint64_t v15 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v16 = objc_msgSend(v10, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v11, self, a5, 0);
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

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    v4 = @"VNTrackMaskDetectorType";
    v5 = @"VNTrackMaskDetectorType";
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

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VNTrackMaskRequest;
  id v5 = [(VNRequest *)&v8 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[VNTrackMaskRequest generateCropRect](self, "generateCropRect"));
  [v5 setObject:v6 forKeyedSubscript:@"VNTrackMaskDetectorProcessorOption_GenerateCropRect"];

  return v5;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [(VNTrackMaskRequest *)self generateCropRect];
  if (v5 == [v4 generateCropRect])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNTrackMaskRequest;
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
  id v4 = (VNTrackMaskRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNTrackMaskRequest;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VNTrackMaskRequest *)self setGenerateCropRect:[(VNTrackMaskRequest *)v4 generateCropRect]];
    }
  }
}

- (VNTrackMaskRequest)initWithFrameUpdateSpacing:(id *)a3 mask:(__CVBuffer *)a4 completionHandler:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)VNTrackMaskRequest;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  v7 = [(VNStatefulRequest *)&v13 initWithFrameAnalysisSpacing:&v12 completionHandler:a5];
  if (v7)
  {
    objc_super v8 = [VNTrackMaskDetectorState alloc];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
    uint64_t v9 = [(VNTrackMaskDetectorState *)v8 initWithFrameUpdateSpacing:&v12 mask:a4];
    state = v7->_state;
    v7->_state = (VNTrackMaskDetectorState *)v9;
  }
  return v7;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&revisionAvailability_ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end