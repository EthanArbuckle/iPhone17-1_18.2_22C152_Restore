@interface VNDetectRectanglesRequest
+ (Class)configurationClass;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSUInteger)maximumObservations;
- (VNAspectRatio)maximumAspectRatio;
- (VNAspectRatio)minimumAspectRatio;
- (VNConfidence)minimumConfidence;
- (VNDegrees)quadratureTolerance;
- (float)minimumSize;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)supportedImageSizeSet;
- (int64_t)dependencyProcessingOrdinality;
- (unint64_t)requiredVersion;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setMaximumAspectRatio:(VNAspectRatio)maximumAspectRatio;
- (void)setMaximumObservations:(NSUInteger)maximumObservations;
- (void)setMinimumAspectRatio:(VNAspectRatio)minimumAspectRatio;
- (void)setMinimumConfidence:(VNConfidence)minimumConfidence;
- (void)setMinimumSize:(float)minimumSize;
- (void)setProcessedResults:(id)a3;
- (void)setQuadratureTolerance:(VNDegrees)quadratureTolerance;
- (void)setRequiredVersion:(unint64_t)a3;
@end

@implementation VNDetectRectanglesRequest

- (id)supportedImageSizeSet
{
  id v3 = [(VNRequest *)self newDefaultDetectorOptionsForSession:0];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNDetectRectanglesRequest requiredVersion](self, "requiredVersion"));
  [v3 setObject:v4 forKeyedSubscript:@"VNRectangleDetectorProcessOption_Version"];

  v5 = +[VNRectangleDetector supportedImageSizeSetForOptions:v3 error:0];
  v6 = v5;
  if (!v5) {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v5;

  return v7;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNDetectRectanglesRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNDetectRectanglesRequest;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(VNDetectRectanglesRequest *)self setRequiredVersion:[(VNDetectRectanglesRequest *)v4 requiredVersion]];
      [(VNDetectRectanglesRequest *)v4 minimumAspectRatio];
      -[VNDetectRectanglesRequest setMinimumAspectRatio:](self, "setMinimumAspectRatio:");
      [(VNDetectRectanglesRequest *)v4 maximumAspectRatio];
      -[VNDetectRectanglesRequest setMaximumAspectRatio:](self, "setMaximumAspectRatio:");
      [(VNDetectRectanglesRequest *)v4 quadratureTolerance];
      -[VNDetectRectanglesRequest setQuadratureTolerance:](self, "setQuadratureTolerance:");
      [(VNDetectRectanglesRequest *)v4 minimumSize];
      -[VNDetectRectanglesRequest setMinimumSize:](self, "setMinimumSize:");
      [(VNDetectRectanglesRequest *)v4 minimumConfidence];
      -[VNDetectRectanglesRequest setMinimumConfidence:](self, "setMinimumConfidence:");
      [(VNDetectRectanglesRequest *)self setMaximumObservations:[(VNDetectRectanglesRequest *)v4 maximumObservations]];
    }
  }
}

- (void)setMaximumObservations:(NSUInteger)maximumObservations
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setMaximumObservations:maximumObservations];
}

- (NSUInteger)maximumObservations
{
  v2 = [(VNRequest *)self configuration];
  NSUInteger v3 = [v2 maximumObservations];

  return v3;
}

- (void)setRequiredVersion:(unint64_t)a3
{
  if (a3 - 1 <= 1)
  {
    id v4 = [(VNRequest *)self configuration];
    [v4 setRequiredVersion:a3];
  }
}

- (unint64_t)requiredVersion
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 requiredVersion];

  return v3;
}

- (void)setMinimumConfidence:(VNConfidence)minimumConfidence
{
  if (minimumConfidence >= 0.0 && minimumConfidence <= 1.0)
  {
    id v6 = [(VNRequest *)self configuration];
    *(VNConfidence *)&double v5 = minimumConfidence;
    [v6 setMinimumConfidence:v5];
  }
}

- (VNConfidence)minimumConfidence
{
  v2 = [(VNRequest *)self configuration];
  [v2 minimumConfidence];
  float v4 = v3;

  return v4;
}

- (void)setMinimumSize:(float)minimumSize
{
  if (minimumSize >= 0.0 && minimumSize <= 1.0)
  {
    id v6 = [(VNRequest *)self configuration];
    *(float *)&double v5 = minimumSize;
    [v6 setMinimumSize:v5];
  }
}

- (float)minimumSize
{
  v2 = [(VNRequest *)self configuration];
  [v2 minimumSize];
  float v4 = v3;

  return v4;
}

- (void)setQuadratureTolerance:(VNDegrees)quadratureTolerance
{
  if (quadratureTolerance >= 0.0 && quadratureTolerance <= 45.0)
  {
    id v6 = [(VNRequest *)self configuration];
    *(VNDegrees *)&double v5 = quadratureTolerance;
    [v6 setQuadratureTolerance:v5];
  }
}

- (VNDegrees)quadratureTolerance
{
  v2 = [(VNRequest *)self configuration];
  [v2 quadratureTolerance];
  float v4 = v3;

  return v4;
}

- (void)setMaximumAspectRatio:(VNAspectRatio)maximumAspectRatio
{
  if (maximumAspectRatio >= 0.0 && maximumAspectRatio <= 1.0)
  {
    id v6 = [(VNRequest *)self configuration];
    *(VNAspectRatio *)&double v5 = maximumAspectRatio;
    [v6 setMaximumAspectRatio:v5];
  }
}

- (VNAspectRatio)maximumAspectRatio
{
  v2 = [(VNRequest *)self configuration];
  [v2 maximumAspectRatio];
  float v4 = v3;

  return v4;
}

- (void)setMinimumAspectRatio:(VNAspectRatio)minimumAspectRatio
{
  if (minimumAspectRatio >= 0.0 && minimumAspectRatio <= 1.0)
  {
    id v6 = [(VNRequest *)self configuration];
    *(VNAspectRatio *)&double v5 = minimumAspectRatio;
    [v6 setMinimumAspectRatio:v5];
  }
}

- (VNAspectRatio)minimumAspectRatio
{
  v2 = [(VNRequest *)self configuration];
  [v2 minimumAspectRatio];
  float v4 = v3;

  return v4;
}

- (void)setProcessedResults:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNDetectRectanglesRequest *)self maximumObservations];
  if (v5 && [v4 count] > v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v5);
    uint64_t v7 = [v4 objectsAtIndexes:v6];

    id v4 = (id)v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)VNDetectRectanglesRequest;
  [(VNRequest *)&v8 setProcessedResults:v4];
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9
    && [(VNRequest *)self validateImageBuffer:v9 ofNonZeroWidth:0 andHeight:0 error:a5])
  {
    v10 = [v8 session];
    id v36 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v36 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v36;
    if (v11)
    {
      v37[0] = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
      [v12 setObject:v13 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNDetectRectanglesRequest requiredVersion](self, "requiredVersion"));
      [v12 setObject:v14 forKeyedSubscript:@"VNRectangleDetectorProcessOption_Version"];

      v15 = NSNumber;
      [(VNDetectRectanglesRequest *)self minimumConfidence];
      v16 = objc_msgSend(v15, "numberWithFloat:");
      [v12 setObject:v16 forKeyedSubscript:@"VNRectangleDetectorProcessOption_MinimumConfidence"];

      v17 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRequest detectionLevel](self, "detectionLevel") != 2);
      [v12 setObject:v17 forKeyedSubscript:@"VNRectangleDetectorProcessOption_HighAccuracy"];

      v18 = NSNumber;
      [(VNDetectRectanglesRequest *)self minimumAspectRatio];
      v19 = objc_msgSend(v18, "numberWithFloat:");
      [v12 setObject:v19 forKeyedSubscript:@"VNRectangleDetectorProcessOption_MinimumAspectRatio"];

      v20 = NSNumber;
      [(VNDetectRectanglesRequest *)self maximumAspectRatio];
      v21 = objc_msgSend(v20, "numberWithFloat:");
      [v12 setObject:v21 forKeyedSubscript:@"VNRectangleDetectorProcessOption_MaximumAspectRatio"];

      v22 = NSNumber;
      [(VNDetectRectanglesRequest *)self quadratureTolerance];
      v23 = objc_msgSend(v22, "numberWithFloat:");
      [v12 setObject:v23 forKeyedSubscript:@"VNRectangleDetectorProcessOption_QuadratureTolerance"];

      v24 = NSNumber;
      [(VNDetectRectanglesRequest *)self minimumSize];
      v25 = objc_msgSend(v24, "numberWithFloat:");
      [v12 setObject:v25 forKeyedSubscript:@"VNRectangleDetectorProcessOption_MinimumSize"];

      NSUInteger v26 = [(VNDetectRectanglesRequest *)self maximumObservations];
      if (v26 - 0x7FFFFFFF <= 0xFFFFFFFF80000001)
      {
        int v27 = objc_msgSend(v9, "width", v26);
        int v28 = [v9 height];
        if (v27 <= v28) {
          int v29 = v28;
        }
        else {
          int v29 = v27;
        }
        if (v27 >= v28) {
          int v30 = v28;
        }
        else {
          int v30 = v27;
        }
        NSUInteger v26 = (int)(16 * vcvtps_s32_f32((float)((float)v29 * 256.0) / (float)v30));
      }
      v31 = [NSNumber numberWithUnsignedInteger:v26];
      [v12 setObject:v31 forKeyedSubscript:@"VNRectangleDetectorProcessOption_MaximumNumber"];

      uint64_t v32 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v33 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v32, v12, self, a5, 0);
      BOOL v34 = v33 != 0;
      if (v33) {
        [(VNRequest *)self setResults:v33];
      }
    }
    else
    {
      BOOL v34 = 0;
    }
  }
  else
  {
    BOOL v34 = 0;
  }

  return v34;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNDetectRectanglesRequest *)self requiredVersion];
  if (v5 != [v4 requiredVersion]) {
    goto LABEL_7;
  }
  [(VNDetectRectanglesRequest *)self minimumAspectRatio];
  float v7 = v6;
  [v4 minimumAspectRatio];
  if (v7 < v8) {
    goto LABEL_7;
  }
  [(VNDetectRectanglesRequest *)self maximumAspectRatio];
  float v10 = v9;
  [v4 maximumAspectRatio];
  if (v10 > v11) {
    goto LABEL_7;
  }
  [(VNDetectRectanglesRequest *)self quadratureTolerance];
  float v13 = v12;
  [v4 quadratureTolerance];
  if (v13 < v14) {
    goto LABEL_7;
  }
  [(VNDetectRectanglesRequest *)self minimumSize];
  float v16 = v15;
  [v4 minimumSize];
  if (v16 < v17) {
    goto LABEL_7;
  }
  [(VNDetectRectanglesRequest *)self minimumConfidence];
  float v19 = v18;
  [v4 minimumConfidence];
  if (v19 < v20) {
    goto LABEL_7;
  }
  NSUInteger v23 = [(VNDetectRectanglesRequest *)self maximumObservations];
  unint64_t v24 = [v4 maximumObservations];
  if (v23 && v24)
  {
    if (v23 <= v24)
    {
LABEL_15:
      v25.receiver = self;
      v25.super_class = (Class)VNDetectRectanglesRequest;
      BOOL v21 = [(VNImageBasedRequest *)&v25 willAcceptCachedResultsFromRequestWithConfiguration:v4];
      goto LABEL_8;
    }
  }
  else if (v23 || !v24)
  {
    goto LABEL_15;
  }
LABEL_7:
  BOOL v21 = 0;
LABEL_8:

  return v21;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  id v4 = @"VNRectangleDetectorType";
  return @"VNRectangleDetectorType";
}

- (int64_t)dependencyProcessingOrdinality
{
  v8.receiver = self;
  v8.super_class = (Class)VNDetectRectanglesRequest;
  id v3 = [(VNRequest *)&v8 dependencyProcessingOrdinality];
  NSUInteger v4 = [(VNDetectRectanglesRequest *)self maximumObservations];
  uint64_t v5 = 20;
  if (v4 < 0x14) {
    uint64_t v5 = v4;
  }
  uint64_t v6 = -100 * v5;
  if (!v4) {
    uint64_t v6 = -2000;
  }
  return (int64_t)v3 + v6;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end