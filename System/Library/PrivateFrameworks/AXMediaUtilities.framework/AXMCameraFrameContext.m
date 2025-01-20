@interface AXMCameraFrameContext
+ (BOOL)supportsSecureCoding;
- (AXMCameraFrameContext)initWithCoder:(id)a3;
- (AXMCameraFrameContext)initWithVideoFieldOfView:(float)a3 zoomFactor:(float)a4 sourceWidth:(int64_t)a5 sourceHeight:(int64_t)a6 presentationTimestamp:(double)a7 attitude:(id)a8;
- (CGRect)motionCorrectedNormalizedFrame:(CGRect)a3 targetAttitude:(id)a4 targetZoomFactor:(float)a5 interfaceOrientation:(int64_t)a6 mirrored:(BOOL)a7;
- (CMAttitude)deviceAttitude;
- (double)presentationTimestamp;
- (float)videoFieldOfView;
- (float)videoZoomFactor;
- (int64_t)videoSourceHeight;
- (int64_t)videoSourceWidth;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AXMCameraFrameContext

- (AXMCameraFrameContext)initWithVideoFieldOfView:(float)a3 zoomFactor:(float)a4 sourceWidth:(int64_t)a5 sourceHeight:(int64_t)a6 presentationTimestamp:(double)a7 attitude:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)AXMCameraFrameContext;
  v16 = [(AXMCameraFrameContext *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_videoFieldOfView = a3;
    v16->_videoZoomFactor = a4;
    v16->_videoSourceWidth = a5;
    v16->_videoSourceHeight = a6;
    v16->_presentationTimestamp = a7;
    objc_storeStrong((id *)&v16->_deviceAttitude, a8);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMCameraFrameContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXMCameraFrameContext;
  v5 = [(AXMCameraFrameContext *)&v14 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"videoFieldOfView"];
    v5->_videoFieldOfView = v6;
    [v4 decodeFloatForKey:@"videoZoomFactor"];
    v5->_videoZoomFactor = v7;
    [v4 decodeFloatForKey:@"videoSourceWidth"];
    v5->_videoSourceWidth = (uint64_t)v8;
    [v4 decodeFloatForKey:@"videoSourceHeight"];
    v5->_videoSourceHeight = (uint64_t)v9;
    [v4 decodeDoubleForKey:@"presentationTimestamp"];
    v5->_presentationTimestamp = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceAttitude"];
    deviceAttitude = v5->_deviceAttitude;
    v5->_deviceAttitude = (CMAttitude *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AXMCameraFrameContext *)self videoFieldOfView];
  objc_msgSend(v4, "encodeFloat:forKey:", @"videoFieldOfView");
  [(AXMCameraFrameContext *)self videoZoomFactor];
  objc_msgSend(v4, "encodeFloat:forKey:", @"videoZoomFactor");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMCameraFrameContext videoSourceWidth](self, "videoSourceWidth"), @"videoSourceWidth");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMCameraFrameContext videoSourceHeight](self, "videoSourceHeight"), @"videoSourceHeight");
  [(AXMCameraFrameContext *)self presentationTimestamp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"presentationTimestamp");
  id v5 = [(AXMCameraFrameContext *)self deviceAttitude];
  [v4 encodeObject:v5 forKey:@"deviceAttitude"];
}

- (CGRect)motionCorrectedNormalizedFrame:(CGRect)a3 targetAttitude:(id)a4 targetZoomFactor:(float)a5 interfaceOrientation:(int64_t)a6 mirrored:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  if (v15
    && a5 != 0.0
    && ([(AXMCameraFrameContext *)self videoZoomFactor], v16 != 0.0)
    && [(AXMCameraFrameContext *)self videoSourceHeight]
    && [(AXMCameraFrameContext *)self videoSourceWidth]
    && ([(AXMCameraFrameContext *)self deviceAttitude],
        v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        v22))
  {
    [(AXMCameraFrameContext *)self videoFieldOfView];
    float v24 = v23;
    [(AXMCameraFrameContext *)self videoZoomFactor];
    float v26 = v24 / v25;
    float v27 = v26 * (float)[(AXMCameraFrameContext *)self videoSourceHeight];
    float v28 = v27 / (float)[(AXMCameraFrameContext *)self videoSourceWidth];
    [(AXMCameraFrameContext *)self videoFieldOfView];
    float v30 = v29 / a5;
    float v31 = v30 * (float)[(AXMCameraFrameContext *)self videoSourceHeight];
    float v32 = v31 / (float)[(AXMCameraFrameContext *)self videoSourceWidth];
    v33 = [(AXMCameraFrameContext *)self deviceAttitude];
    *(float *)&double v34 = v28;
    *(float *)&double v35 = v26;
    *(float *)&double v36 = v32;
    *(float *)&double v37 = v30;
    +[AXMGeometryUtilities motionCorrectedNormalizedFrame:fromAttitude:fromFieldOfViewX:fromFieldOfViewY:toAttitude:toFieldOfViewX:toFieldOfViewY:interfaceOrientation:mirrored:](AXMGeometryUtilities, "motionCorrectedNormalizedFrame:fromAttitude:fromFieldOfViewX:fromFieldOfViewY:toAttitude:toFieldOfViewX:toFieldOfViewY:interfaceOrientation:mirrored:", v33, v15, a6, v7, x, y, width, height, v34, v35, v36, v37);
    double x = v38;
    double y = v39;
    double width = v40;
    double height = v41;
  }
  else
  {
    v17 = AXMediaLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AXMCameraFrameContext motionCorrectedNormalizedFrame:targetAttitude:targetZoomFactor:interfaceOrientation:mirrored:](v17);
    }
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (float)videoFieldOfView
{
  return self->_videoFieldOfView;
}

- (float)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (int64_t)videoSourceWidth
{
  return self->_videoSourceWidth;
}

- (int64_t)videoSourceHeight
{
  return self->_videoSourceHeight;
}

- (double)presentationTimestamp
{
  return self->_presentationTimestamp;
}

- (CMAttitude)deviceAttitude
{
  return self->_deviceAttitude;
}

- (void).cxx_destruct
{
}

- (void)motionCorrectedNormalizedFrame:(os_log_t)log targetAttitude:targetZoomFactor:interfaceOrientation:mirrored:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "AXMCameraFrameContext motionCorrectedNormalizedFrame received invalid input", v1, 2u);
}

@end