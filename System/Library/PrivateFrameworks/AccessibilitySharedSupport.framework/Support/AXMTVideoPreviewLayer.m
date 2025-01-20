@interface AXMTVideoPreviewLayer
+ (id)_layerForPointOfInterestAtPosition:(CGPoint)a3 previous:(BOOL)a4 bounds:(CGRect)a5;
- (AVCaptureSession)avCaptureSession;
- (AVCaptureVideoPreviewLayer)_videoPreviewLayer;
- (AVSampleBufferDisplayLayer)_sampleBufferDisplayLayer;
- (AXMTVideoPreviewLayer)initWithAVCaptureSession:(id)a3 captureDeviceResolution:(CGSize)a4;
- (AXMTVideoPreviewLayer)initWithSampleBufferLayer;
- (CAShapeLayer)_detectedFaceLandmarksShapeLayer;
- (CAShapeLayer)_detectedFaceRectangleShapeLayer;
- (CAShapeLayer)_pointOfInterestShapeLayer;
- (CAShapeLayer)_trackingAreaShapeLayer;
- (CATextLayer)_expressionValuesTextLayer;
- (CATextLayer)_yawPitchRollTextLayer;
- (CGRect)_videoPreviewBounds;
- (CGSize)_captureDeviceResolution;
- (NSMutableArray)_multiPointsOfInterest;
- (NSMutableArray)_multiPointsOfInterestShapeLayers;
- (NSMutableArray)_previousPointOfInterestShapeLayers;
- (NSMutableArray)_previousPointsOfInterest;
- (void)_initWithResolution:(CGSize)a3;
- (void)_render:(id)a3;
- (void)_updateLayerGeometry;
- (void)drawSample:(opaqueCMSampleBuffer *)a3;
- (void)layoutSublayers;
- (void)renderFaceKitResult:(id)a3;
- (void)renderPointOfInterest:(CGPoint)a3 trackingArea:(CGRect)a4;
- (void)setAvCaptureSession:(id)a3;
- (void)set_captureDeviceResolution:(CGSize)a3;
- (void)set_detectedFaceLandmarksShapeLayer:(id)a3;
- (void)set_detectedFaceRectangleShapeLayer:(id)a3;
- (void)set_expressionValuesTextLayer:(id)a3;
- (void)set_multiPointsOfInterest:(id)a3;
- (void)set_multiPointsOfInterestShapeLayers:(id)a3;
- (void)set_pointOfInterestShapeLayer:(id)a3;
- (void)set_previousPointOfInterestShapeLayers:(id)a3;
- (void)set_previousPointsOfInterest:(id)a3;
- (void)set_sampleBufferDisplayLayer:(id)a3;
- (void)set_trackingAreaShapeLayer:(id)a3;
- (void)set_videoPreviewBounds:(CGRect)a3;
- (void)set_videoPreviewLayer:(id)a3;
- (void)set_yawPitchRollTextLayer:(id)a3;
@end

@implementation AXMTVideoPreviewLayer

- (AXMTVideoPreviewLayer)initWithAVCaptureSession:(id)a3 captureDeviceResolution:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AXMTVideoPreviewLayer;
  v8 = [(AXMTVideoPreviewLayer *)&v16 init];
  v9 = v8;
  if (v8)
  {
    -[AXMTVideoPreviewLayer _initWithResolution:](v8, "_initWithResolution:", width, height);
    v10 = (AVCaptureVideoPreviewLayer *)[objc_alloc((Class)AVCaptureVideoPreviewLayer) initWithSession:v7];
    videoPreviewLayer = v9->__videoPreviewLayer;
    v9->__videoPreviewLayer = v10;

    [(AVCaptureVideoPreviewLayer *)v9->__videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    -[AVCaptureVideoPreviewLayer setAnchorPoint:](v9->__videoPreviewLayer, "setAnchorPoint:", 0.5, 0.5);
    memset(&v15, 0, sizeof(v15));
    CATransform3DMakeRotation(&v15, 3.14159265, 1.0, 0.0, 0.0);
    detectedFaceRectangleShapeLayer = v9->__detectedFaceRectangleShapeLayer;
    CATransform3D v14 = v15;
    [(CAShapeLayer *)detectedFaceRectangleShapeLayer setTransform:&v14];
    [(AVCaptureVideoPreviewLayer *)v9->__videoPreviewLayer addSublayer:v9->__detectedFaceRectangleShapeLayer];
    [(AXMTVideoPreviewLayer *)v9 addSublayer:v9->__videoPreviewLayer];
  }

  return v9;
}

- (AXMTVideoPreviewLayer)initWithSampleBufferLayer
{
  v7.receiver = self;
  v7.super_class = (Class)AXMTVideoPreviewLayer;
  v2 = [(AXMTVideoPreviewLayer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    -[AXMTVideoPreviewLayer _initWithResolution:](v2, "_initWithResolution:", 1280.0, 720.0);
    v4 = (AVSampleBufferDisplayLayer *)objc_alloc_init((Class)AVSampleBufferDisplayLayer);
    sampleBufferDisplayLayer = v3->__sampleBufferDisplayLayer;
    v3->__sampleBufferDisplayLayer = v4;

    [(AVSampleBufferDisplayLayer *)v3->__sampleBufferDisplayLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    [(AVSampleBufferDisplayLayer *)v3->__sampleBufferDisplayLayer addSublayer:v3->__detectedFaceRectangleShapeLayer];
    [(AXMTVideoPreviewLayer *)v3 addSublayer:v3->__sampleBufferDisplayLayer];
  }
  return v3;
}

- (void)_initWithResolution:(CGSize)a3
{
  self->__captureDeviceResolution = a3;
  v4 = (CAShapeLayer *)objc_opt_new();
  detectedFaceRectangleShapeLayer = self->__detectedFaceRectangleShapeLayer;
  self->__detectedFaceRectangleShapeLayer = v4;

  [(CAShapeLayer *)self->__detectedFaceRectangleShapeLayer setName:@"RectangleOutlineLayer"];
  -[CAShapeLayer setAnchorPoint:](self->__detectedFaceRectangleShapeLayer, "setAnchorPoint:", 0.5, 0.5);
  [(CAShapeLayer *)self->__detectedFaceRectangleShapeLayer setFillColor:0];
  [(CAShapeLayer *)self->__detectedFaceRectangleShapeLayer setLineWidth:5.0];
  LODWORD(v6) = 1060320051;
  [(CAShapeLayer *)self->__detectedFaceRectangleShapeLayer setShadowOpacity:v6];
  [(CAShapeLayer *)self->__detectedFaceRectangleShapeLayer setShadowRadius:5.0];
  objc_super v7 = (CAShapeLayer *)objc_opt_new();
  detectedFaceLandmarksShapeLayer = self->__detectedFaceLandmarksShapeLayer;
  self->__detectedFaceLandmarksShapeLayer = v7;

  [(CAShapeLayer *)self->__detectedFaceLandmarksShapeLayer setName:@"FaceLandmarksLayer"];
  -[CAShapeLayer setAnchorPoint:](self->__detectedFaceLandmarksShapeLayer, "setAnchorPoint:", 0.5, 0.5);
  [(CAShapeLayer *)self->__detectedFaceLandmarksShapeLayer setFillColor:0];
  [(CAShapeLayer *)self->__detectedFaceLandmarksShapeLayer setLineWidth:3.0];
  LODWORD(v9) = 1060320051;
  [(CAShapeLayer *)self->__detectedFaceLandmarksShapeLayer setShadowOpacity:v9];
  [(CAShapeLayer *)self->__detectedFaceLandmarksShapeLayer setShadowRadius:5.0];
  v10 = +[NSMutableArray array];
  previousPointsOfInterest = self->__previousPointsOfInterest;
  self->__previousPointsOfInterest = v10;

  v12 = +[NSMutableArray array];
  previousPointOfInterestShapeLayers = self->__previousPointOfInterestShapeLayers;
  self->__previousPointOfInterestShapeLayers = v12;

  CATransform3D v14 = +[NSMutableArray array];
  multiPointsOfInterest = self->__multiPointsOfInterest;
  self->__multiPointsOfInterest = v14;

  objc_super v16 = +[NSMutableArray array];
  multiPointsOfInterestShapeLayers = self->__multiPointsOfInterestShapeLayers;
  self->__multiPointsOfInterestShapeLayers = v16;

  objc_msgSend((id)objc_opt_class(), "_layerForPointOfInterestAtPosition:previous:bounds:", 0, 0.0, 0.0, NSZeroRect.origin.x, NSZeroRect.origin.y, NSZeroRect.size.width, NSZeroRect.size.height);
  v18 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  pointOfInterestShapeLayer = self->__pointOfInterestShapeLayer;
  self->__pointOfInterestShapeLayer = v18;

  v20 = (CAShapeLayer *)objc_opt_new();
  trackingAreaShapeLayer = self->__trackingAreaShapeLayer;
  self->__trackingAreaShapeLayer = v20;

  [(CAShapeLayer *)self->__trackingAreaShapeLayer setName:@"TrackingAreaLayer"];
  [(CAShapeLayer *)self->__trackingAreaShapeLayer setFillColor:0];
  [(CAShapeLayer *)self->__trackingAreaShapeLayer setLineWidth:3.0];
  v22 = (CATextLayer *)objc_alloc_init((Class)CATextLayer);
  yawPitchRollTextLayer = self->__yawPitchRollTextLayer;
  self->__yawPitchRollTextLayer = v22;

  [(CATextLayer *)self->__yawPitchRollTextLayer setAlignmentMode:kCAAlignmentCenter];
  v24 = (CATextLayer *)objc_alloc_init((Class)CATextLayer);
  expressionValuesTextLayer = self->__expressionValuesTextLayer;
  self->__expressionValuesTextLayer = v24;

  [(CATextLayer *)self->__expressionValuesTextLayer setAlignmentMode:kCAAlignmentLeft];
  [(CATextLayer *)self->__yawPitchRollTextLayer setFontSize:20.0];
  [(CATextLayer *)self->__expressionValuesTextLayer setFontSize:20.0];
  id v26 = +[UIColor blackColor];
  -[CATextLayer setForegroundColor:](self->__yawPitchRollTextLayer, "setForegroundColor:", [v26 CGColor]);

  id v27 = +[UIColor whiteColor];
  -[CATextLayer setForegroundColor:](self->__expressionValuesTextLayer, "setForegroundColor:", [v27 CGColor]);

  CATransform3DMakeScale(&v39, 1.0, -1.0, 1.0);
  v28 = self->__yawPitchRollTextLayer;
  CATransform3D v38 = v39;
  [(CATextLayer *)v28 setTransform:&v38];
  CATransform3DMakeScale(&v37, 1.0, -1.0, 1.0);
  v29 = self->__expressionValuesTextLayer;
  CATransform3D v36 = v37;
  [(CATextLayer *)v29 setTransform:&v36];
  v30 = +[UIColor greenColor];
  id v31 = [v30 colorWithAlphaComponent:0.7];
  -[CAShapeLayer setStrokeColor:](self->__detectedFaceRectangleShapeLayer, "setStrokeColor:", [v31 CGColor]);

  v32 = +[UIColor yellowColor];
  id v33 = [v32 colorWithAlphaComponent:0.7];
  -[CAShapeLayer setStrokeColor:](self->__detectedFaceLandmarksShapeLayer, "setStrokeColor:", [v33 CGColor]);

  v34 = +[UIColor blueColor];
  id v35 = [v34 colorWithAlphaComponent:0.7];
  -[CAShapeLayer setStrokeColor:](self->__trackingAreaShapeLayer, "setStrokeColor:", [v35 CGColor]);

  [(CAShapeLayer *)self->__detectedFaceRectangleShapeLayer addSublayer:self->__detectedFaceLandmarksShapeLayer];
  [(CAShapeLayer *)self->__detectedFaceRectangleShapeLayer addSublayer:self->__trackingAreaShapeLayer];
  [(CAShapeLayer *)self->__detectedFaceRectangleShapeLayer addSublayer:self->__pointOfInterestShapeLayer];
  [(CAShapeLayer *)self->__detectedFaceRectangleShapeLayer addSublayer:self->__yawPitchRollTextLayer];
  [(CAShapeLayer *)self->__detectedFaceRectangleShapeLayer addSublayer:self->__expressionValuesTextLayer];
  [(AXMTVideoPreviewLayer *)self setMasksToBounds:1];
}

- (void)drawSample:(opaqueCMSampleBuffer *)a3
{
  CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a3, 1u);
  ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
  CFDictionarySetValue(ValueAtIndex, kCMSampleAttachmentKey_DisplayImmediately, kCFBooleanTrue);
  if (!CMSampleBufferIsValid(a3))
  {
    objc_super v7 = AXSSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000FB18((uint64_t)a3, v7);
    }
  }
  v8 = [(AXMTVideoPreviewLayer *)self _sampleBufferDisplayLayer];
  [v8 enqueueSampleBuffer:a3];
}

- (void)renderPointOfInterest:(CGPoint)a3 trackingArea:(CGRect)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E80C;
  v4[3] = &unk_100048C68;
  v4[4] = self;
  CGRect v5 = a4;
  CGPoint v6 = a3;
  [(AXMTVideoPreviewLayer *)self _render:v4];
}

- (void)renderFaceKitResult:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000ECCC;
  v4[3] = &unk_100048928;
  CGRect v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(AXMTVideoPreviewLayer *)v5 _render:v4];
}

- (void)layoutSublayers
{
  +[CATransaction begin];
  +[CATransaction setValue:&__kCFBooleanTrue forKey:kCATransactionDisableActions];
  [(AXMTVideoPreviewLayer *)self bounds];
  double v4 = v3;
  [(AXMTVideoPreviewLayer *)self bounds];
  double v6 = v5;
  objc_super v7 = [(AXMTVideoPreviewLayer *)self _videoPreviewLayer];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  [(AXMTVideoPreviewLayer *)self bounds];
  double v9 = v8;
  [(AXMTVideoPreviewLayer *)self bounds];
  double v11 = v10;
  id v12 = [(AXMTVideoPreviewLayer *)self _sampleBufferDisplayLayer];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v9, v11);
}

+ (id)_layerForPointOfInterestAtPosition:(CGPoint)a3 previous:(BOOL)a4 bounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  BOOL v7 = a4;
  double y = a3.y;
  double x = a3.x;
  double v10 = objc_opt_new();
  double v11 = v10;
  if (v7) {
    CFStringRef v12 = @"PreviousPointOfInterestLayer";
  }
  else {
    CFStringRef v12 = @"PointOfInterestLayer";
  }
  [v10 setName:v12];
  v21.origin.double x = -10.0;
  v21.origin.double y = -10.0;
  v21.size.double width = 20.0;
  v21.size.double height = 20.0;
  CGPathRef v13 = CGPathCreateWithEllipseInRect(v21, 0);
  if (v13)
  {
    CGPathRef v14 = v13;
    [v11 setPath:v13];
    CFRelease(v14);
  }
  CATransform3D v15 = +[UIColor redColor];
  objc_super v16 = v15;
  double v17 = 0.7;
  if (v7) {
    double v17 = 0.2;
  }
  id v18 = [v15 colorWithAlphaComponent:v17];
  objc_msgSend(v11, "setFillColor:", objc_msgSend(v18, "CGColor"));

  objc_msgSend(v11, "setPosition:", x * width, y * height);

  return v11;
}

- (void)_render:(id)a3
{
  double v3 = (void (**)(void))a3;
  if (v3)
  {
    if (+[NSThread isMainThread])
    {
      v3[2](v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000F700;
      block[3] = &unk_100048B60;
      double v5 = v3;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_updateLayerGeometry
{
  +[CATransaction setValue:&__kCFBooleanTrue forKey:kCATransactionDisableActions];
  double v3 = [(AXMTVideoPreviewLayer *)self _videoPreviewLayer];
  objc_msgSend(v3, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[AXMTVideoPreviewLayer set_videoPreviewBounds:](self, "set_videoPreviewBounds:", v5, v7, v9, v11);
}

- (AVCaptureSession)avCaptureSession
{
  return self->_avCaptureSession;
}

- (void)setAvCaptureSession:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)_videoPreviewLayer
{
  return self->__videoPreviewLayer;
}

- (void)set_videoPreviewLayer:(id)a3
{
}

- (CGSize)_captureDeviceResolution
{
  double width = self->__captureDeviceResolution.width;
  double height = self->__captureDeviceResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_captureDeviceResolution:(CGSize)a3
{
  self->__captureDeviceResolution = a3;
}

- (CGRect)_videoPreviewBounds
{
  double x = self->__videoPreviewBounds.origin.x;
  double y = self->__videoPreviewBounds.origin.y;
  double width = self->__videoPreviewBounds.size.width;
  double height = self->__videoPreviewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_videoPreviewBounds:(CGRect)a3
{
  self->__videoPreviewBounds = a3;
}

- (CAShapeLayer)_detectedFaceRectangleShapeLayer
{
  return self->__detectedFaceRectangleShapeLayer;
}

- (void)set_detectedFaceRectangleShapeLayer:(id)a3
{
}

- (CAShapeLayer)_detectedFaceLandmarksShapeLayer
{
  return self->__detectedFaceLandmarksShapeLayer;
}

- (void)set_detectedFaceLandmarksShapeLayer:(id)a3
{
}

- (AVSampleBufferDisplayLayer)_sampleBufferDisplayLayer
{
  return self->__sampleBufferDisplayLayer;
}

- (void)set_sampleBufferDisplayLayer:(id)a3
{
}

- (CAShapeLayer)_pointOfInterestShapeLayer
{
  return self->__pointOfInterestShapeLayer;
}

- (void)set_pointOfInterestShapeLayer:(id)a3
{
}

- (NSMutableArray)_previousPointsOfInterest
{
  return self->__previousPointsOfInterest;
}

- (void)set_previousPointsOfInterest:(id)a3
{
}

- (NSMutableArray)_previousPointOfInterestShapeLayers
{
  return self->__previousPointOfInterestShapeLayers;
}

- (void)set_previousPointOfInterestShapeLayers:(id)a3
{
}

- (NSMutableArray)_multiPointsOfInterest
{
  return self->__multiPointsOfInterest;
}

- (void)set_multiPointsOfInterest:(id)a3
{
}

- (NSMutableArray)_multiPointsOfInterestShapeLayers
{
  return self->__multiPointsOfInterestShapeLayers;
}

- (void)set_multiPointsOfInterestShapeLayers:(id)a3
{
}

- (CAShapeLayer)_trackingAreaShapeLayer
{
  return self->__trackingAreaShapeLayer;
}

- (void)set_trackingAreaShapeLayer:(id)a3
{
}

- (CATextLayer)_yawPitchRollTextLayer
{
  return self->__yawPitchRollTextLayer;
}

- (void)set_yawPitchRollTextLayer:(id)a3
{
}

- (CATextLayer)_expressionValuesTextLayer
{
  return self->__expressionValuesTextLayer;
}

- (void)set_expressionValuesTextLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__expressionValuesTextLayer, 0);
  objc_storeStrong((id *)&self->__yawPitchRollTextLayer, 0);
  objc_storeStrong((id *)&self->__trackingAreaShapeLayer, 0);
  objc_storeStrong((id *)&self->__multiPointsOfInterestShapeLayers, 0);
  objc_storeStrong((id *)&self->__multiPointsOfInterest, 0);
  objc_storeStrong((id *)&self->__previousPointOfInterestShapeLayers, 0);
  objc_storeStrong((id *)&self->__previousPointsOfInterest, 0);
  objc_storeStrong((id *)&self->__pointOfInterestShapeLayer, 0);
  objc_storeStrong((id *)&self->__sampleBufferDisplayLayer, 0);
  objc_storeStrong((id *)&self->__detectedFaceLandmarksShapeLayer, 0);
  objc_storeStrong((id *)&self->__detectedFaceRectangleShapeLayer, 0);
  objc_storeStrong((id *)&self->__videoPreviewLayer, 0);

  objc_storeStrong((id *)&self->_avCaptureSession, 0);
}

@end