@interface AXMRectangleDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMRectangleDetectorNode)initWithCoder:(id)a3;
- (BOOL)requiresVisionFramework;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (CGPoint)cameraOpticalOrigin;
- (double)cameraPixelFocalLength;
- (double)maximumAspectRatio;
- (double)minimumAspectRatio;
- (double)minimumSize;
- (double)quadratureTolerance;
- (int64_t)maximumNumberOfRects;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)nodeInitialize;
- (void)setCameraOpticalOrigin:(CGPoint)a3;
- (void)setCameraPixelFocalLength:(double)a3;
- (void)setMaximumAspectRatio:(double)a3;
- (void)setMaximumNumberOfRects:(int64_t)a3;
- (void)setMinimumAspectRatio:(double)a3;
- (void)setMinimumSize:(double)a3;
- (void)setQuadratureTolerance:(double)a3;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMRectangleDetectorNode

- (void)nodeInitialize
{
  v3.receiver = self;
  v3.super_class = (Class)AXMRectangleDetectorNode;
  [(AXMEvaluationNode *)&v3 nodeInitialize];
  [(AXMRectangleDetectorNode *)self setCameraPixelFocalLength:0.0];
  -[AXMRectangleDetectorNode setCameraOpticalOrigin:](self, "setCameraOpticalOrigin:", 0.0, 0.0);
  [(AXMRectangleDetectorNode *)self setMinimumAspectRatio:0.5];
  [(AXMRectangleDetectorNode *)self setMaximumAspectRatio:0.5];
  [(AXMRectangleDetectorNode *)self setQuadratureTolerance:15.0];
  [(AXMRectangleDetectorNode *)self setMinimumSize:0.2];
  [(AXMEvaluationNode *)self setMinimumConfidence:0.5];
  [(AXMRectangleDetectorNode *)self setMaximumNumberOfRects:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMRectangleDetectorNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXMRectangleDetectorNode;
  v5 = [(AXMEvaluationNode *)&v7 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"cameraPixelFocalLength"];
    -[AXMRectangleDetectorNode setCameraPixelFocalLength:](v5, "setCameraPixelFocalLength:");
    [v4 axmDecodePointForKey:@"cameraOpticalOrigin"];
    -[AXMRectangleDetectorNode setCameraOpticalOrigin:](v5, "setCameraOpticalOrigin:");
    [v4 decodeDoubleForKey:@"minimumAspectRatio"];
    -[AXMRectangleDetectorNode setMinimumAspectRatio:](v5, "setMinimumAspectRatio:");
    [v4 decodeDoubleForKey:@"maximumAspectRatio"];
    -[AXMRectangleDetectorNode setMaximumAspectRatio:](v5, "setMaximumAspectRatio:");
    [v4 decodeDoubleForKey:@"quadratureTolerance"];
    -[AXMRectangleDetectorNode setQuadratureTolerance:](v5, "setQuadratureTolerance:");
    [v4 decodeDoubleForKey:@"minimumSize"];
    -[AXMRectangleDetectorNode setMinimumSize:](v5, "setMinimumSize:");
    [v4 decodeDoubleForKey:@"minimumConfidence"];
    -[AXMEvaluationNode setMinimumConfidence:](v5, "setMinimumConfidence:");
    -[AXMRectangleDetectorNode setMaximumNumberOfRects:](v5, "setMaximumNumberOfRects:", [v4 decodeIntegerForKey:@"maximumNumber"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXMRectangleDetectorNode;
  id v4 = a3;
  [(AXMEvaluationNode *)&v5 encodeWithCoder:v4];
  [(AXMRectangleDetectorNode *)self cameraPixelFocalLength];
  objc_msgSend(v4, "encodeDouble:forKey:", @"cameraPixelFocalLength");
  [(AXMRectangleDetectorNode *)self cameraOpticalOrigin];
  objc_msgSend(v4, "axmEncodePoint:forKey:", @"cameraOpticalOrigin");
  [(AXMRectangleDetectorNode *)self minimumAspectRatio];
  objc_msgSend(v4, "encodeDouble:forKey:", @"minimumAspectRatio");
  [(AXMRectangleDetectorNode *)self maximumAspectRatio];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maximumAspectRatio");
  [(AXMRectangleDetectorNode *)self quadratureTolerance];
  objc_msgSend(v4, "encodeDouble:forKey:", @"quadratureTolerance");
  [(AXMRectangleDetectorNode *)self minimumSize];
  objc_msgSend(v4, "encodeDouble:forKey:", @"minimumSize");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMRectangleDetectorNode maximumNumberOfRects](self, "maximumNumberOfRects"), @"maximumNumber");
}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)requiresVisionFramework
{
  return 1;
}

+ (id)title
{
  return @"Rectangle Detector";
}

- (void)setCameraPixelFocalLength:(double)a3
{
  self->_cameraPixelFocalLength = fmin(fmax(a3, 0.0), 1.79769313e308);
}

- (void)setMinimumAspectRatio:(double)a3
{
  self->_minimumAspectRatio = fmin(fmax(a3, 0.0), 1.0);
}

- (void)setMaximumAspectRatio:(double)a3
{
  self->_maximumAspectRatio = fmin(fmax(a3, 0.0), 1.0);
}

- (void)setQuadratureTolerance:(double)a3
{
  self->_quadratureTolerance = fmin(fmax(a3, 0.0), 15.0);
}

- (void)setMinimumSize:(double)a3
{
  self->_minimumSize = fmin(fmax(a3, 0.2), 1.0);
}

- (void)setMaximumNumberOfRects:(int64_t)a3
{
  if (a3 <= 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = a3;
  }
  self->_maximumNumberOfRects = v3;
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNDetectRectanglesRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMRectangleDetectorNode;
    return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
  }
  else
  {
    id v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMRectangleDetectorNode validateVisionKitSoftLinkSymbols](v4);
    }

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v48.receiver = self;
  v48.super_class = (Class)AXMRectangleDetectorNode;
  id v8 = [(AXMEvaluationNode *)&v48 evaluate:v6 metrics:v7];
  context = (void *)MEMORY[0x1BA9A10B0](v8);
  [(AXMRectangleDetectorNode *)self cameraPixelFocalLength];
  double v10 = v9;
  [(AXMRectangleDetectorNode *)self cameraOpticalOrigin];
  double v12 = v11;
  [(AXMRectangleDetectorNode *)self cameraPixelFocalLength];
  double v14 = v13;
  [(AXMRectangleDetectorNode *)self cameraOpticalOrigin];
  *(float *)&unsigned int v15 = v10;
  *(void *)&long long v16 = v15;
  *(float *)&unsigned int v17 = v12;
  *((void *)&v16 + 1) = v17;
  float v18 = v14;
  LODWORD(v19) = 0;
  *((float *)&v19 + 1) = v18;
  *(float *)&unsigned int v21 = v20;
  *((void *)&v19 + 1) = v21;
  v47[0] = v16;
  v47[1] = v19;
  v47[2] = xmmword_1B58AC930;
  v42 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v47 length:48];
  id v22 = objc_alloc_init((Class)getVNDetectRectanglesRequestClass());
  [(AXMRectangleDetectorNode *)self minimumAspectRatio];
  *(float *)&double v23 = v23;
  [v22 setMinimumAspectRatio:v23];
  [(AXMRectangleDetectorNode *)self maximumAspectRatio];
  *(float *)&double v24 = v24;
  [v22 setMaximumAspectRatio:v24];
  [(AXMRectangleDetectorNode *)self quadratureTolerance];
  *(float *)&double v25 = v25;
  [v22 setQuadratureTolerance:v25];
  [(AXMRectangleDetectorNode *)self minimumSize];
  *(float *)&double v26 = v26;
  [v22 setMinimumSize:v26];
  [(AXMEvaluationNode *)self minimumConfidence];
  *(float *)&double v27 = v27;
  [v22 setMinimumConfidence:v27];
  objc_msgSend(v22, "setMaximumObservations:", -[AXMRectangleDetectorNode maximumNumberOfRects](self, "maximumNumberOfRects"));
  v61[0] = v22;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  v29 = (id *)getVNImageOptionCameraIntrinsicsSymbolLoc_ptr;
  uint64_t v57 = getVNImageOptionCameraIntrinsicsSymbolLoc_ptr;
  if (!getVNImageOptionCameraIntrinsicsSymbolLoc_ptr)
  {
    uint64_t v49 = MEMORY[0x1E4F143A8];
    uint64_t v50 = 3221225472;
    v51 = __getVNImageOptionCameraIntrinsicsSymbolLoc_block_invoke;
    v52 = &unk_1E6116AD8;
    v53 = &v54;
    v30 = (void *)VisionLibrary_4();
    v31 = dlsym(v30, "VNImageOptionCameraIntrinsics");
    *(void *)(v53[1] + 24) = v31;
    getVNImageOptionCameraIntrinsicsSymbolLoc_ptr = *(void *)(v53[1] + 24);
    v29 = (id *)v55[3];
  }
  _Block_object_dispose(&v54, 8);
  if (!v29)
  {
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  id v59 = *v29;
  v60 = v42;
  v32 = (void *)MEMORY[0x1E4F1C9E8];
  id v33 = v59;
  v34 = [v32 dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  [(AXMEvaluationNode *)self evaluateRequests:v28 withContext:v6 requestHandlerOptions:v34 metrics:v7 error:0];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v35 = [v22 results];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v58 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v44 != v37) {
          objc_enumerationMutation(v35);
        }
        uint64_t v39 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        [v6 size];
        v40 = +[AXMVisionFeature featureWithVisionRequest:rectangleResult:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:rectangleResult:canvasSize:", v22, v39);
        [v6 appendFeature:v40];
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v58 count:16];
    }
    while (v36);
  }
}

- (double)cameraPixelFocalLength
{
  return self->_cameraPixelFocalLength;
}

- (CGPoint)cameraOpticalOrigin
{
  double x = self->_cameraOpticalOrigin.x;
  double y = self->_cameraOpticalOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCameraOpticalOrigin:(CGPoint)a3
{
  self->_cameraOpticalOrigin = a3;
}

- (double)minimumAspectRatio
{
  return self->_minimumAspectRatio;
}

- (double)maximumAspectRatio
{
  return self->_maximumAspectRatio;
}

- (double)quadratureTolerance
{
  return self->_quadratureTolerance;
}

- (double)minimumSize
{
  return self->_minimumSize;
}

- (int64_t)maximumNumberOfRects
{
  return self->_maximumNumberOfRects;
}

- (void)validateVisionKitSoftLinkSymbols
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNDetectRectanglesRequestSoft was nil", v1, 2u);
}

@end