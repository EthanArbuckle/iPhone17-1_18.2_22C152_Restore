@interface VNDetectContoursRequest
+ (Class)configurationClass;
- (BOOL)detectsDarkOnLight;
- (BOOL)forceUseInputCVPixelBufferDirectly;
- (BOOL)inHierarchy;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSNumber)contrastPivot;
- (NSUInteger)maximumImageDimension;
- (float)contrastAdjustment;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setContrastAdjustment:(float)contrastAdjustment;
- (void)setContrastPivot:(NSNumber *)contrastPivot;
- (void)setDetectsDarkOnLight:(BOOL)detectsDarkOnLight;
- (void)setForceUseInputCVPixelBufferDirectly:(BOOL)a3;
- (void)setInHierarchy:(BOOL)a3;
- (void)setMaximumImageDimension:(NSUInteger)maximumImageDimension;
@end

@implementation VNDetectContoursRequest

- (void)setInHierarchy:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setInHierarchy:v3];
}

- (BOOL)inHierarchy
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 inHierarchy];

  return v3;
}

- (void)setForceUseInputCVPixelBufferDirectly:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setForceUseInputCVPixelBufferDirectly:v3];
}

- (BOOL)forceUseInputCVPixelBufferDirectly
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 forceUseInputCVPixelBufferDirectly];

  return v3;
}

- (void)setMaximumImageDimension:(NSUInteger)maximumImageDimension
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setMaximumImageDimension:maximumImageDimension];
}

- (NSUInteger)maximumImageDimension
{
  v2 = [(VNRequest *)self configuration];
  NSUInteger v3 = [v2 maximumImageDimension];

  return v3;
}

- (void)setDetectsDarkOnLight:(BOOL)detectsDarkOnLight
{
  BOOL v3 = detectsDarkOnLight;
  id v4 = [(VNRequest *)self configuration];
  [v4 setDetectsDarkOnLight:v3];
}

- (BOOL)detectsDarkOnLight
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 detectsDarkOnLight];

  return v3;
}

- (void)setContrastPivot:(NSNumber *)contrastPivot
{
  v5 = contrastPivot;
  id v4 = [(VNRequest *)self configuration];
  [v4 setContrastPivot:v5];
}

- (NSNumber)contrastPivot
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 contrastPivot];

  return (NSNumber *)v3;
}

- (void)setContrastAdjustment:(float)contrastAdjustment
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = contrastAdjustment;
  [v5 setContrastAdjustment:v4];
}

- (float)contrastAdjustment
{
  v2 = [(VNRequest *)self configuration];
  [v2 contrastAdjustment];
  float v4 = v3;

  return v4;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  [(VNDetectContoursRequest *)self contrastAdjustment];
  float v6 = v5;
  [v4 contrastAdjustment];
  if (v6 != v7) {
    goto LABEL_6;
  }
  v8 = [(VNDetectContoursRequest *)self contrastPivot];
  v9 = [v4 contrastPivot];
  char v10 = VisionCoreEqualOrNilObjects();

  if ((v10 & 1) == 0) {
    goto LABEL_6;
  }
  int v11 = [(VNDetectContoursRequest *)self detectsDarkOnLight];
  if (v11 == [v4 detectsDarkOnLight]
    && (NSUInteger v12 = [(VNDetectContoursRequest *)self maximumImageDimension],
        v12 == [v4 maximumImageDimension])
    && (int v13 = [(VNDetectContoursRequest *)self inHierarchy],
        v13 == [v4 inHierarchy]))
  {
    v16.receiver = self;
    v16.super_class = (Class)VNDetectContoursRequest;
    BOOL v14 = [(VNImageBasedRequest *)&v16 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
LABEL_6:
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [(VNDetectContoursRequest *)self contrastPivot];
  char v10 = v9;
  if (v9)
  {
    [v9 floatValue];
    if (v11 < 0.0 || v11 > 1.0)
    {
      if (a5)
      {
        int v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"contrastPivot property must be in the range [%f..%f]", 0, 0x3FF0000000000000);
        *a5 = +[VNError errorForInvalidOption:v10 named:@"contrastPivot" localizedDescription:v13];
LABEL_12:

        LOBYTE(a5) = 0;
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else
  {
    char v10 = &unk_1EF7A8250;
  }
  uint64_t v14 = [(VNDetectContoursRequest *)self maximumImageDimension];
  if (v14 > 63)
  {
    objc_super v16 = [v8 imageBufferAndReturnError:a5];
    if (v16)
    {
      v29 = [v8 session];
      id v30 = 0;
      v17 = -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v30, a3);
      id v18 = v30;
      if (v17)
      {
        v31[0] = v16;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
        [v18 setObject:v19 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

        v20 = NSNumber;
        [(VNDetectContoursRequest *)self contrastAdjustment];
        v21 = objc_msgSend(v20, "numberWithFloat:");
        [v18 setObject:v21 forKeyedSubscript:@"VNContourDetectorProcessOption_ContrastAdjustment"];

        [v18 setObject:v10 forKeyedSubscript:@"VNContourDetectorProcessOption_ContrastPivot"];
        v22 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectContoursRequest detectsDarkOnLight](self, "detectsDarkOnLight"));
        [v18 setObject:v22 forKeyedSubscript:@"VNContourDetectorProcessOption_DetectDarkOnLight"];

        v23 = [NSNumber numberWithUnsignedInteger:v14];
        [v18 setObject:v23 forKeyedSubscript:@"VNContourDetectorProcessOption_MaximumImageDimension"];

        v24 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectContoursRequest forceUseInputCVPixelBufferDirectly](self, "forceUseInputCVPixelBufferDirectly"));
        [v18 setObject:v24 forKeyedSubscript:@"VNContourDetectorProcessOption_ForceUseInputCVPixelBufferDirectly"];

        v25 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectContoursRequest inHierarchy](self, "inHierarchy"));
        [v18 setObject:v25 forKeyedSubscript:@"VNContourDetectorProcessOption_InHierarchy"];

        uint64_t v26 = [v8 qosClass];
        [(VNImageBasedRequest *)self regionOfInterest];
        v27 = objc_msgSend(v17, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v26, v18, self, a5, 0);
        LOBYTE(a5) = v27 != 0;
        if (v27) {
          [(VNRequest *)self setResults:v27];
        }
      }
      else
      {
        LOBYTE(a5) = 0;
      }
    }
    else
    {
      LOBYTE(a5) = 0;
    }
  }
  else if (a5)
  {
    int v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"maximumImageDimension property must be in the range [%lu..%lu]", 64, 0x7FFFFFFFFFFFFFFFLL);
    v15 = [NSNumber numberWithUnsignedInteger:v14];
    *a5 = +[VNError errorForInvalidOption:v15 named:@"maximumImageDimension" localizedDescription:v13];

    goto LABEL_12;
  }
LABEL_22:

  return (char)a5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    id v4 = @"VNContoursDetectorType";
    float v5 = @"VNContoursDetectorType";
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

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNDetectContoursRequest *)a3;
  if (self != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)VNDetectContoursRequest;
    [(VNImageBasedRequest *)&v7 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v5 = v4;
      [(VNDetectContoursRequest *)v5 contrastAdjustment];
      -[VNDetectContoursRequest setContrastAdjustment:](self, "setContrastAdjustment:");
      float v6 = [(VNDetectContoursRequest *)v5 contrastPivot];
      [(VNDetectContoursRequest *)self setContrastPivot:v6];

      [(VNDetectContoursRequest *)self setDetectsDarkOnLight:[(VNDetectContoursRequest *)v5 detectsDarkOnLight]];
      [(VNDetectContoursRequest *)self setMaximumImageDimension:[(VNDetectContoursRequest *)v5 maximumImageDimension]];
      [(VNDetectContoursRequest *)self setInHierarchy:[(VNDetectContoursRequest *)v5 inHierarchy]];
      [(VNDetectContoursRequest *)self setForceUseInputCVPixelBufferDirectly:[(VNDetectContoursRequest *)v5 forceUseInputCVPixelBufferDirectly]];
    }
  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end