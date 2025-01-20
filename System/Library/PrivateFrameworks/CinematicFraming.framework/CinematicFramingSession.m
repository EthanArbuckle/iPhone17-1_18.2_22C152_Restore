@interface CinematicFramingSession
- (BOOL)cameraOrientationCorrectionEnabled;
- (CGRect)currentViewport;
- (CGRect)displayViewport;
- (CGRect)idealViewport;
- (CGRect)outputFramingRectOfInterest;
- (CGRect)processWithMetadata:(id)a3;
- (CGRect)targetViewport;
- (CGRect)warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:(CGRect)a3;
- (CinematicFramingSession)init;
- (CinematicFramingSession)initWithOutputDimensions:(id)a3;
- (CinematicFramingSession)initWithOutputDimensions:(id)a3 mode:(int)a4 portType:(id)a5 deviceModelName:(id)a6;
- (CinematicFramingSession)initWithOutputDimensions:(id)a3 portType:(id)a4 deviceModelName:(id)a5;
- (CinematicFramingSessionOptions)options;
- (NSArray)roiHeatMapCounts;
- (float)fovLimit;
- (float)zoomLevel;
- (int)cameraOrientation;
- (int)framingStyle;
- (int)processPixelBuffer:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4;
- (void)_updateROIHeatMapCountersWithCropRect:(CGRect)a3;
- (void)reset;
- (void)setCameraOrientation:(int)a3;
- (void)setCameraOrientationCorrectionEnabled:(BOOL)a3;
- (void)setFovLimit:(float)a3;
- (void)setFramingStyle:(int)a3;
- (void)setOutputFramingRectOfInterest:(CGRect)a3;
- (void)setZoomLevel:(float)a3;
@end

@implementation CinematicFramingSession

- (CinematicFramingSession)init
{
  v10.receiver = self;
  v10.super_class = (Class)CinematicFramingSession;
  v2 = [(CinematicFramingSession *)&v10 init];
  if (!v2) {
    goto LABEL_7;
  }
  v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CinematicFraming"];
  if (!v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v4 = v3;
  v5 = [v3 pathForResource:@"cinematicFramingParameters" ofType:@"plist"];
  v6 = [[CinematicFramingSessionOptions alloc] initWithPlistPath:v5];
  options = v2->_options;
  v2->_options = v6;

  if (!v2->_options)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_7;
  }
  v8 = v2;

LABEL_8:
  return v8;
}

- (CinematicFramingSession)initWithOutputDimensions:(id)a3 mode:(int)a4 portType:(id)a5 deviceModelName:(id)a6
{
  id v8 = a5;
  v9 = [(CinematicFramingSession *)self initWithOutputDimensions:a3];
  uint64_t v10 = isCinematicFramingFrontCamera(v8);

  [(CinematicFramingRenderer *)v9->_renderer setIsFrontCamera:v10];
  return v9;
}

- (CinematicFramingSession)initWithOutputDimensions:(id)a3 portType:(id)a4 deviceModelName:(id)a5
{
  id v7 = a4;
  id v8 = [(CinematicFramingSession *)self initWithOutputDimensions:a3];
  uint64_t v9 = isCinematicFramingFrontCamera(v7);

  [(CinematicFramingRenderer *)v8->_renderer setIsFrontCamera:v9];
  return v8;
}

- (CinematicFramingSession)initWithOutputDimensions:(id)a3
{
  int var0 = a3.var0;
  v4 = self;
  v5 = 0;
  if (a3.var0)
  {
    int var1 = a3.var1;
    if (a3.var1)
    {
      id v7 = [(CinematicFramingSession *)self init];
      v4 = v7;
      if (v7)
      {
        v7->_outputDimensions.width = var0;
        v7->_outputDimensions.height = var1;
        id v8 = [[CinematicFramingRenderer alloc] initWithOutputDimensions:*(void *)&v7->_outputDimensions];
        renderer = v4->_renderer;
        v4->_renderer = v8;

        if (v4->_renderer)
        {
          uint64_t v10 = [[CinematicFramingDirector alloc] initWithFramingSpaceManager:v4->_renderer];
          director = v4->_director;
          v4->_director = v10;

          if (v4->_director)
          {
            [(CinematicFramingSession *)v4 setFramingStyle:0];
            v4->_calibrationDataRegistered = 0;
            v4 = v4;
            v5 = v4;
            goto LABEL_9;
          }
        }
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      v5 = 0;
    }
  }
LABEL_9:

  return v5;
}

- (NSArray)roiHeatMapCounts
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = 0;
  roiHeatMap = self->_roiHeatMap;
  do
  {
    v6 = [NSNumber numberWithUnsignedInt:roiHeatMap[v4]];
    [v3 addObject:v6];

    ++v4;
  }
  while (v4 != 64);

  return (NSArray *)v3;
}

- (CinematicFramingSessionOptions)options
{
  return self->_options;
}

- (void)setFramingStyle:(int)a3
{
  if (a3 <= 4)
  {
    self->_uint64_t framingStyle = a3;
    v5 = -[CinematicFramingSessionOptions optionsForFramingStyle:](self->_options, "optionsForFramingStyle:");
    [(CinematicFramingRenderer *)self->_renderer setOptions:v5];

    v6 = [(CinematicFramingSessionOptions *)self->_options optionsForFramingStyle:self->_framingStyle];
    [(CinematicFramingDirector *)self->_director setOptions:v6];

    uint64_t framingStyle = self->_framingStyle;
    director = self->_director;
    [(CinematicFramingDirector *)director setFramingStyle:framingStyle];
  }
}

- (CGRect)currentViewport
{
  [(CinematicFramingDirector *)self->_director currentViewport];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)targetViewport
{
  [(CinematicFramingDirector *)self->_director targetViewport];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)idealViewport
{
  [(CinematicFramingDirector *)self->_director idealViewport];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int)cameraOrientation
{
  return [(CinematicFramingRenderer *)self->_renderer cameraOrientation];
}

- (void)setCameraOrientation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(CinematicFramingRenderer *)self->_renderer cameraOrientation] != a3)
  {
    renderer = self->_renderer;
    [(CinematicFramingDirector *)self->_director currentViewport];
    -[CinematicFramingRenderer computeNewCoordinatesInOrientation:forViewportInCurrentOrientation:](renderer, "computeNewCoordinatesInOrientation:forViewportInCurrentOrientation:", v3);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(CinematicFramingRenderer *)self->_renderer setCameraOrientation:v3];
    director = self->_director;
    -[CinematicFramingDirector resetCameraViewport:](director, "resetCameraViewport:", v7, v9, v11, v13);
  }
}

- (BOOL)cameraOrientationCorrectionEnabled
{
  return [(CinematicFramingRenderer *)self->_renderer cameraOrientationCorrectionEnabled];
}

- (void)setCameraOrientationCorrectionEnabled:(BOOL)a3
{
}

- (CGRect)processWithMetadata:(id)a3
{
  id v4 = a3;
  double v5 = [v4 portType];
  double v6 = v5;
  if (v5)
  {
    if ((isCinematicFramingAllowedCamera(v5) & 1) == 0)
    {
      double v32 = *MEMORY[0x1E4F1DB20];
      double v34 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v36 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v38 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      goto LABEL_12;
    }
    [(CinematicFramingRenderer *)self->_renderer setIsFrontCamera:isCinematicFramingFrontCamera(v6)];
  }
  -[CinematicFramingRenderer setFrontCameraHas180DegreesRotation:](self->_renderer, "setFrontCameraHas180DegreesRotation:", [v4 frontCameraHas180DegreesRotation]);
  renderer = self->_renderer;
  double v8 = [v4 calibrationDataDictionary];
  int v9 = [(CinematicFramingRenderer *)renderer registerCalibrationData:v8];

  if (!self->_calibrationDataRegistered && !v9)
  {
    self->_calibrationDataRegistered = 1;
    [(CinematicFramingDirector *)self->_director reset];
  }
  double v10 = self->_renderer;
  [v4 gravityX];
  int v12 = v11;
  [v4 gravityY];
  int v14 = v13;
  [v4 gravityZ];
  LODWORD(v16) = v15;
  LODWORD(v17) = v12;
  LODWORD(v18) = v14;
  [(CinematicFramingRenderer *)v10 registerGravityX:v17 y:v18 z:v16];
  v19 = self->_renderer;
  [v4 additionalCameraRotation];
  -[CinematicFramingRenderer registerAdditionalCameraRotation:](v19, "registerAdditionalCameraRotation:");
  [(CinematicFramingRenderer *)self->_renderer warpMetadataInInputImageCoordinatesToFramingSpace:v4];
  uint64_t v20 = [v4 cameraOrientation];
  if (v20 != -1)
  {
    uint64_t v21 = v20;
    if (v20 != [(CinematicFramingRenderer *)self->_renderer cameraOrientation])
    {
      v22 = self->_renderer;
      [(CinematicFramingDirector *)self->_director currentViewport];
      -[CinematicFramingRenderer computeNewCoordinatesInOrientation:forViewportInCurrentOrientation:](v22, "computeNewCoordinatesInOrientation:forViewportInCurrentOrientation:", v21);
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      [(CinematicFramingRenderer *)self->_renderer setCameraOrientation:v21];
      -[CinematicFramingDirector resetCameraViewport:](self->_director, "resetCameraViewport:", v24, v26, v28, v30);
    }
  }
  [(CinematicFramingDirector *)self->_director updateWithMetadata:v4];
  [(CinematicFramingDirector *)self->_director currentViewport];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
LABEL_12:

  double v39 = v32;
  double v40 = v34;
  double v41 = v36;
  double v42 = v38;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (int)processPixelBuffer:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4
{
  [(CinematicFramingSession *)self currentViewport];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  int v15 = -[CinematicFramingRenderer processBuffer:cropRect:outputPixelBuffer:](self->_renderer, "processBuffer:cropRect:outputPixelBuffer:", a3, a4);
  if (v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    -[CinematicFramingSession _updateROIHeatMapCountersWithCropRect:](self, "_updateROIHeatMapCountersWithCropRect:", v8, v10, v12, v14);
  }
  return v15;
}

- (CGRect)warpBoundingBoxInFrameCoordinatesToDisplayCoordinates:(CGRect)a3
{
  -[CinematicFramingRenderer warpRectInInputImageCoordinatesToFramingSpace:](self->_renderer, "warpRectInInputImageCoordinatesToFramingSpace:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  renderer = self->_renderer;
  [(CinematicFramingSession *)self currentViewport];
  -[CinematicFramingRenderer projectRectInFramingSpace:toDisplayRectInFramingSpace:](renderer, "projectRectInFramingSpace:toDisplayRectInFramingSpace:", v5, v7, v9, v11, v13, v14, v15, v16);
  double v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  if ([(CinematicFramingRenderer *)self->_renderer cameraOrientationCorrectionEnabled])
  {
    double v18 = rotateRectInImageCCW(4- [(CinematicFramingRenderer *)self->_renderer numCCWRotationsFromInputToFramingSpace], v18, v20, v22, v24);
    CGFloat v20 = v25;
    CGFloat v22 = v26;
    CGFloat v24 = v27;
  }
  [(CinematicFramingRenderer *)self->_renderer outputROI];
  double v30 = v28 + v18 * v29;
  double v33 = v31 + v20 * v32;
  double v34 = v22 * v29;
  double v35 = v24 * v32;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v30;
  return result;
}

- (void)reset
{
  self->_calibrationDataRegistered = 0;
  [(CinematicFramingDirector *)self->_director reset];
}

- (float)zoomLevel
{
  [(CinematicFramingDirector *)self->_director zoomLevel];
  return result;
}

- (void)setZoomLevel:(float)a3
{
}

- (float)fovLimit
{
  [(CinematicFramingRenderer *)self->_renderer fovLimit];
  return result;
}

- (void)setFovLimit:(float)a3
{
}

- (CGRect)outputFramingRectOfInterest
{
  [(CinematicFramingRenderer *)self->_renderer outputROI];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setOutputFramingRectOfInterest:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.origin.double x = 0.0;
  v12.origin.double y = 0.0;
  v12.size.double width = 1.0;
  v12.size.double height = 1.0;
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  BOOL v8 = CGRectContainsRect(v12, v14);
  if (height > 0.0001 && width > 0.0001 && v8)
  {
    [(CinematicFramingRenderer *)self->_renderer outputROI];
    v15.origin.double x = x;
    v15.origin.double y = y;
    v15.size.double width = width;
    v15.size.double height = height;
    if (!CGRectEqualToRect(v13, v15))
    {
      -[CinematicFramingRenderer setOutputROI:](self->_renderer, "setOutputROI:", x, y, width, height);
      director = self->_director;
      [(CinematicFramingDirector *)director reset];
    }
  }
}

- (void)_updateROIHeatMapCountersWithCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CinematicFramingRenderer *)self->_renderer framingSpaceBounds];
  double v9 = x - v8;
  [(CinematicFramingRenderer *)self->_renderer framingSpaceBounds];
  double v11 = v9 / v10;
  [(CinematicFramingRenderer *)self->_renderer framingSpaceBounds];
  double v13 = y - v12;
  [(CinematicFramingRenderer *)self->_renderer framingSpaceBounds];
  double v15 = v13 / v14;
  [(CinematicFramingRenderer *)self->_renderer framingSpaceBounds];
  double v17 = width / v16;
  [(CinematicFramingRenderer *)self->_renderer framingSpaceBounds];
  double v19 = height / v18;
  v28.origin.double x = v11;
  v28.origin.double y = v15;
  v28.size.double width = v17;
  v28.size.double height = v19;
  if (floor(CGRectGetMinX(v28) * 8.0) >= 0.0)
  {
    v29.origin.double x = v11;
    v29.origin.double y = v15;
    v29.size.double width = v17;
    v29.size.double height = v19;
    signed int v20 = vcvtmd_s64_f64(CGRectGetMinX(v29) * 8.0);
  }
  else
  {
    signed int v20 = 0;
  }
  v30.origin.double x = v11;
  v30.origin.double y = v15;
  v30.size.double width = v17;
  v30.size.double height = v19;
  if (floor(CGRectGetMinY(v30) * 8.0) >= 0.0)
  {
    v31.origin.double x = v11;
    v31.origin.double y = v15;
    v31.size.double width = v17;
    v31.size.double height = v19;
    signed int v21 = vcvtmd_s64_f64(CGRectGetMinY(v31) * 8.0);
  }
  else
  {
    signed int v21 = 0;
  }
  v32.origin.double x = v11;
  v32.origin.double y = v15;
  v32.size.double width = v17;
  v32.size.double height = v19;
  if (ceil(CGRectGetMaxX(v32) * 7.0) >= 7.0)
  {
    signed int v22 = 7;
  }
  else
  {
    v33.origin.double x = v11;
    v33.origin.double y = v15;
    v33.size.double width = v17;
    v33.size.double height = v19;
    signed int v22 = vcvtpd_s64_f64(CGRectGetMaxX(v33) * 7.0);
  }
  v34.origin.double x = v11;
  v34.origin.double y = v15;
  v34.size.double width = v17;
  v34.size.double height = v19;
  if (ceil(CGRectGetMaxY(v34) * 7.0) >= 7.0)
  {
    signed int v23 = 7;
  }
  else
  {
    v35.origin.double x = v11;
    v35.origin.double y = v15;
    v35.size.double width = v17;
    v35.size.double height = v19;
    signed int v23 = vcvtpd_s64_f64(CGRectGetMaxY(v35) * 7.0);
  }
  if (v20 <= v22)
  {
    int v24 = v21 + 8 * v20;
    do
    {
      int v25 = v24;
      int v26 = v23 - v21 + 1;
      if (v21 <= v23)
      {
        do
        {
          ++self->_roiHeatMap[v25++];
          --v26;
        }
        while (v26);
      }
      v24 += 8;
    }
    while (v20++ != v22);
  }
}

- (int)framingStyle
{
  return self->_framingStyle;
}

- (CGRect)displayViewport
{
  double x = self->_displayViewport.origin.x;
  double y = self->_displayViewport.origin.y;
  double width = self->_displayViewport.size.width;
  double height = self->_displayViewport.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_director, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_dataOutputDelegateQueue, 0);
}

@end