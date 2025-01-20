@interface SCATCameraInputSource
- ($77BFB7B7C8E69408128DC1383CA2CAA6)face;
- ($F24F406B2B787EFB06265DBA3D28CBD5)state;
- (AVCaptureSession)captureSession;
- (AVCaptureVideoPreviewLayer)captureVideoPreviewLayer;
- (BOOL)_hasHeadSwitchesAssigned;
- (BOOL)isAvailable;
- (BOOL)isLeftHeadSwitchDown;
- (BOOL)isRightHeadSwitchDown;
- (CALayer)faceLayer;
- (OS_dispatch_queue)captureOutputQueue;
- (SCATCameraInputSource)init;
- (UIView)captureOutputPreview;
- (id)_actionIdentifierForCameraSwitch:(int64_t)a3;
- (id)_captureDeviceInputWithPreset:(id)a3;
- (id)_captureMetadataOutputWithDelegate:(id)a3 queue:(id)a4;
- (id)_captureSessionWithPreset:(id)a3;
- (id)_captureVideoDataOutputWithDelegate:(id)a3 queue:(id)a4 format:(id)a5;
- (unint64_t)availabilityDetail;
- (void)_cleanupCaptureOutput;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4;
- (void)_didUpdateAvailability:(BOOL)a3 withDetail:(unint64_t)a4;
- (void)_didUpdateState:(id)a3;
- (void)_setupCaptureOutput;
- (void)_startCaptureOutput;
- (void)_stopCaptureOutput;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)dealloc;
- (void)setAvailabilityDetail:(unint64_t)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setCaptureOutputPreview:(id)a3;
- (void)setCaptureOutputQueue:(id)a3;
- (void)setCaptureSession:(id)a3;
- (void)setCaptureVideoPreviewLayer:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setFace:(id *)a3;
- (void)setFaceLayer:(id)a3;
- (void)setLeftHeadSwitchDown:(BOOL)a3;
- (void)setRightHeadSwitchDown:(BOOL)a3;
- (void)setState:(id)a3;
- (void)startRunning;
- (void)stopRunning;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATCameraInputSource

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4
{
  id v6 = a3;
  v7 = [(SCATInputSource *)self delegate];
  v8 = [(SCATInputSource *)self queue];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10007F894;
    v9[3] = &unk_1001AC528;
    id v10 = v7;
    v11 = self;
    id v12 = v6;
    BOOL v13 = a4;
    [v8 performAsynchronousWritingBlock:v9];
  }
}

- (void)_didUpdateAvailability:(BOOL)a3 withDetail:(unint64_t)a4
{
  BOOL v5 = a3;
  unsigned int v7 = [(SCATCameraInputSource *)self isAvailable];
  unint64_t v8 = [(SCATCameraInputSource *)self availabilityDetail];
  if (v7 != v5 || v8 != a4)
  {
    v9 = [(SCATInputSource *)self delegate];
    id v10 = [(SCATInputSource *)self queue];
    if (v10)
    {
      if (objc_opt_respondsToSelector())
      {
        v11 = _NSConcreteStackBlock;
        uint64_t v12 = 3221225472;
        BOOL v13 = sub_10007F9C8;
        v14 = &unk_1001ACCD0;
        id v15 = v9;
        v16 = self;
        BOOL v18 = v5;
        unint64_t v17 = a4;
        [v10 performAsynchronousWritingBlock:&v11];
      }
    }
    -[SCATCameraInputSource setAvailable:](self, "setAvailable:", v5, v11, v12, v13, v14);
    [(SCATCameraInputSource *)self setAvailabilityDetail:a4];
  }
}

- (void)_cleanupCaptureOutput
{
  [(SCATCameraInputSource *)self setCaptureOutputQueue:0];
  [(SCATCameraInputSource *)self setCaptureSession:0];
  v3 = [(SCATCameraInputSource *)self captureOutputPreview];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    AXPerformBlockSynchronouslyOnMainThread();
    [(SCATCameraInputSource *)self setCaptureOutputPreview:0];
    [(SCATCameraInputSource *)self setCaptureVideoPreviewLayer:0];
    [(SCATCameraInputSource *)self setFaceLayer:0];
  }
}

- (id)_captureDeviceInputWithPreset:(id)a3
{
  v11[0] = AVCaptureDeviceTypeBuiltInUltraWideCamera;
  v11[1] = AVCaptureDeviceTypeBuiltInWideAngleCamera;
  v3 = +[NSArray arrayWithObjects:v11 count:2];
  v4 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:v3 mediaType:AVMediaTypeVideo position:2];

  id v5 = [v4 devices];
  id v6 = [v5 firstObject];

  id v10 = 0;
  unsigned int v7 = +[AVCaptureDeviceInput deviceInputWithDevice:v6 error:&v10];
  id v8 = v10;
  if (!v7) {
    _AXLogWithFacility();
  }

  return v7;
}

- (id)_captureMetadataOutputWithDelegate:(id)a3 queue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = objc_opt_new();
  [v7 setMetadataObjectsDelegate:v6 queue:v5];

  return v7;
}

- (id)_captureSessionWithPreset:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)_captureVideoDataOutputWithDelegate:(id)a3 queue:(id)a4 format:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  [v10 setAlwaysDiscardsLateVideoFrames:1];
  v11 = [v10 availableVideoCVPixelFormatTypes];
  unsigned int v12 = [v11 containsObject:v9];

  if (v12)
  {
    CFStringRef v15 = kCVPixelBufferPixelFormatTypeKey;
    id v16 = v9;
    BOOL v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v10 setVideoSettings:v13];

    [v10 setSampleBufferDelegate:v7 queue:v8];
  }
  else
  {
    _AXLogWithFacility();

    id v10 = 0;
  }

  return v10;
}

- (void)_setupCaptureOutput
{
  v3 = [(SCATCameraInputSource *)self _captureSessionWithPreset:AVCaptureSessionPreset640x480];
  v4 = [(SCATCameraInputSource *)self _captureDeviceInputWithPreset:AVCaptureSessionPreset640x480];
  if ([v3 canAddInput:v4])
  {
    [v3 addInput:v4];
    dispatch_queue_t v5 = dispatch_queue_create("CaptureOutputQueue", 0);
    [(SCATCameraInputSource *)self setCaptureOutputQueue:v5];
    id v6 = [(SCATCameraInputSource *)self _captureVideoDataOutputWithDelegate:self queue:v5 format:&off_1001BBF70];
    if ([v3 canAddOutput:v6])
    {
      [v3 addOutput:v6];
      id v7 = [v6 connectionWithMediaType:AVMediaTypeVideo];
      if ([v7 isCameraIntrinsicMatrixDeliverySupported])
      {
        [v7 setCameraIntrinsicMatrixDeliveryEnabled:1];
      }
      else
      {
        CFStringRef v31 = @"Camera intrinsics delivery is not supported";
        LOBYTE(v30) = 1;
        _AXLogWithFacility();
      }
      id v8 = -[SCATCameraInputSource _captureMetadataOutputWithDelegate:queue:](self, "_captureMetadataOutputWithDelegate:queue:", self, v5, v30, v31);
      if ([v3 canAddOutput:v8]
        && ([v3 addOutput:v8],
            [v8 availableMetadataObjectTypes],
            id v9 = objc_claimAutoreleasedReturnValue(),
            unsigned int v10 = [v9 containsObject:AVMetadataObjectTypeFace],
            v9,
            v10))
      {
        AVMetadataObjectType v34 = AVMetadataObjectTypeFace;
        v11 = +[NSArray arrayWithObjects:&v34 count:1];
        [v8 setMetadataObjectTypes:v11];

        [(SCATCameraInputSource *)self setCaptureSession:v3];
        unsigned int v12 = +[AXSettings sharedInstance];
        unsigned int v13 = [v12 assistiveTouchCameraSwitchPreviewEnabled];

        if (v13)
        {
          id v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
          CFStringRef v15 = +[UIColor magentaColor];
          [v14 setBackgroundColor:v15];

          id v16 = +[UIColor magentaColor];
          id v17 = [v16 CGColor];
          v32 = v7;
          BOOL v18 = v14;
          v19 = [v14 layer];
          [v19 setBorderColor:v17];

          v20 = [v18 layer];
          [v20 setBorderWidth:2.0];

          v21 = [v18 layer];
          [v21 setCornerRadius:5.0];

          v22 = [v18 layer];
          [v22 setMasksToBounds:1];

          v23 = v18;
          id v7 = v32;
          v33 = v23;
          [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(SCATCameraInputSource *)self setCaptureOutputPreview:v23];
          v24 = +[AVCaptureVideoPreviewLayer layerWithSession:v3];
          objc_msgSend(v24, "setFrame:", 0.0, 0.0, 120.0, 160.0);
          [(SCATCameraInputSource *)self setCaptureVideoPreviewLayer:v24];
          v25 = [v23 layer];
          [v25 addSublayer:v24];

          v26 = +[CALayer layer];
          id v27 = +[UIColor cyanColor];
          objc_msgSend(v26, "setBorderColor:", objc_msgSend(v27, "CGColor"));

          [v26 setBorderWidth:2.0];
          [v26 setCornerRadius:5.0];
          objc_msgSend(v26, "setFrame:", 0.0, 0.0, 120.0, 160.0);
          [v26 setHidden:1];
          [(SCATCameraInputSource *)self setFaceLayer:v26];
          v28 = [v33 layer];
          [v28 addSublayer:v26];

          id v29 = v33;
          AXPerformBlockSynchronouslyOnMainThread();
        }
      }
      else
      {
        _AXLogWithFacility();
      }
    }
    else
    {
      _AXLogWithFacility();
    }
  }
  else
  {
    _AXLogWithFacility();
  }
}

- (void)_startCaptureOutput
{
  id v4 = [(SCATCameraInputSource *)self captureSession];
  if (([v4 isRunning] & 1) == 0)
  {
    v3 = [(SCATCameraInputSource *)self captureSession];
    [v3 startRunning];
  }
}

- (void)_stopCaptureOutput
{
  id v4 = [(SCATCameraInputSource *)self captureSession];
  if ([v4 isRunning])
  {
    v3 = [(SCATCameraInputSource *)self captureSession];
    [v3 stopRunning];
  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v24 = a4;
  id v6 = [(SCATCameraInputSource *)self face];
  if (!v6)
  {
    id v6 = ($77BFB7B7C8E69408128DC1383CA2CAA6 *)malloc_type_calloc(1uLL, 0x48uLL, 0x1000040C9EC6BF2uLL);
    v6->var0.origin = (CGPoint)vdupq_n_s64(0x3FD2666666666666uLL);
    v6->var0.float64x2_t size = (CGSize)vdupq_n_s64(0x3FDB333333333333uLL);
    v6->var4 = 0.0;
    v6->var5 = 0;
    v6->var1 = 0.0;
    v6->var2 = 0.0;
    v6->var3 = 0;
    [(SCATCameraInputSource *)self setFace:v6];
  }
  if ([v24 count] == (id)1)
  {
    id v7 = [v24 objectAtIndexedSubscript:0];
    id v8 = +[UIDevice currentDeviceOrientationAllowingAmbiguous:0];
    [v7 bounds];
    CGFloat v10 = v6->var0.size.width * 0.98 + v9 * 0.02;
    CGFloat v12 = v6->var0.size.height * 0.98 + v11 * 0.02;
    v6->var0.size.width = v10;
    v6->var0.size.height = v12;
    v6->var0.origin.x = v13 + (v9 - v10) * 0.5;
    v6->var0.origin.y = v14 + (v11 - v12) * 0.5;
    v6->var1 = CACurrentMediaTime();
    v6->var2 = 0.0;
    v6->var3 = 0;
    v6->var4 = 0.0;
    v6->var5 = 0;
    if (v8 == (id)4)
    {
      v6->var0.origin.x = 1.0 - v6->var0.origin.x - v6->var0.size.width;
    }
    else if (v8 == (id)3)
    {
      v6->var0.origin.y = 1.0 - v6->var0.origin.y - v6->var0.size.height;
    }
    else
    {
      if (v8 == (id)2)
      {
        __asm { FMOV            V0.2D, #1.0 }
        float64x2_t size = (float64x2_t)v6->var0.size;
        int8x16_t v21 = (int8x16_t)vsubq_f64(vsubq_f64(_Q0, (float64x2_t)v6->var0.origin), size);
        int8x16_t v22 = vextq_s8(v21, v21, 8uLL);
        int8x16_t v23 = vextq_s8((int8x16_t)size, (int8x16_t)size, 8uLL);
      }
      else
      {
        int8x16_t v22 = vextq_s8((int8x16_t)v6->var0.origin, (int8x16_t)v6->var0.origin, 8uLL);
        int8x16_t v23 = vextq_s8((int8x16_t)v6->var0.size, (int8x16_t)v6->var0.size, 8uLL);
      }
      v6->var0.origin = (CGPoint)v22;
      v6->var0.float64x2_t size = (CGSize)v23;
    }
  }
  else
  {
    v6->var1 = 0.0;
  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  if (![(SCATCameraInputSource *)self _hasHeadSwitchesAssigned]) {
    return;
  }
  id v6 = [(SCATCameraInputSource *)self face];
  if (!v6) {
    return;
  }
  p_x = &v6->var0.origin.x;
  if (CACurrentMediaTime() - v6->var1 < 0.6)
  {
    double v8 = p_x[2];
    if (v8 < p_x[3]) {
      double v8 = p_x[3];
    }
    if (v8 <= 0.6)
    {
      double v9 = self;
      if (v8 >= 0.25)
      {
        [(SCATCameraInputSource *)self _didUpdateAvailability:1 withDetail:0];
        double v13 = p_x[2];
        double v14 = *p_x + v13 * 0.5 + -0.5;
        CFStringRef v15 = +[AXSettings sharedInstance];
        id v16 = [v15 assistiveTouchHeadMovementSensitivity];
        double v17 = 0.35;
        if (v16 == (id)2) {
          double v17 = 0.25;
        }
        double v18 = v13 * v17;

        double v19 = round(v14 / v18 * 100.0) / 100.0;
        double v20 = fmin(v19, 0.0);
        if (v20 < -1.0) {
          double v20 = -1.0;
        }
        double v21 = floor(fabs(v20) * 10.0) / 10.0;
        double v22 = fmin(v19, 1.0);
        if (v22 < 0.0) {
          double v22 = 0.0;
        }
        double v23 = floor(fabs(v22) * 10.0) / 10.0;
        int HasFrontCameraPhysicallyMountedUpsideDown = AXDeviceHasFrontCameraPhysicallyMountedUpsideDown();
        if (HasFrontCameraPhysicallyMountedUpsideDown) {
          double v25 = v21;
        }
        else {
          double v25 = v23;
        }
        if (HasFrontCameraPhysicallyMountedUpsideDown) {
          double v21 = v23;
        }
        if ([(SCATCameraInputSource *)self isLeftHeadSwitchDown] != (v21 == 1.0))
        {
          v26 = [(SCATCameraInputSource *)self _actionIdentifierForCameraSwitch:1];
          [(SCATCameraInputSource *)self _didReceiveActionWithIdentifier:v26 start:v21 == 1.0];
          [(SCATCameraInputSource *)self setLeftHeadSwitchDown:v21 == 1.0];
        }
        if ((v25 == 1.0) != [(SCATCameraInputSource *)self isRightHeadSwitchDown])
        {
          id v27 = -[SCATCameraInputSource _actionIdentifierForCameraSwitch:](self, "_actionIdentifierForCameraSwitch:", 2, 1.0);
          [(SCATCameraInputSource *)self _didReceiveActionWithIdentifier:v27 start:v25 == 1.0];
          [(SCATCameraInputSource *)self setRightHeadSwitchDown:v25 == 1.0];
        }
        -[SCATCameraInputSource _didUpdateState:](self, "_didUpdateState:", v21, v25);
        goto LABEL_10;
      }
      uint64_t v10 = 3;
    }
    else
    {
      double v9 = self;
      uint64_t v10 = 2;
    }
  }
  else
  {
    double v9 = self;
    uint64_t v10 = 1;
  }
  [(SCATCameraInputSource *)v9 _didUpdateAvailability:0 withDetail:v10];
LABEL_10:
  double v11 = [(SCATCameraInputSource *)self captureOutputPreview];
  if (v11)
  {
    v28 = [(SCATCameraInputSource *)self faceLayer];
    id v12 = v28;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

- (id)_actionIdentifierForCameraSwitch:(int64_t)a3
{
  dispatch_queue_t v5 = [(SCATInputSource *)self actions];

  if (v5)
  {
    id v6 = +[NSNumber numberWithInteger:a3];
    id v7 = [(SCATInputSource *)self actions];
    double v8 = [v7 objectForKeyedSubscript:v6];
  }
  else
  {
    _AXLogWithFacility();
    double v8 = 0;
  }

  return v8;
}

- (BOOL)_hasHeadSwitchesAssigned
{
  v2 = [(SCATInputSource *)self actions];
  v3 = [v2 objectForKeyedSubscript:&off_1001BBF88];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    dispatch_queue_t v5 = [v2 objectForKeyedSubscript:&off_1001BBFA0];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)dealloc
{
  [(SCATCameraInputSource *)self stopRunning];
  [(SCATCameraInputSource *)self _cleanupCaptureOutput];
  v3 = [(SCATCameraInputSource *)self face];
  if (v3)
  {
    free(v3);
    [(SCATCameraInputSource *)self setFace:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)SCATCameraInputSource;
  [(SCATCameraInputSource *)&v4 dealloc];
}

- (SCATCameraInputSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCATCameraInputSource;
  return [(SCATInputSource *)&v3 init];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SCATCameraInputSource;
  [(SCATInputSource *)&v4 setDelegate:a3 queue:a4];
}

- (void)startRunning
{
  if (![(SCATInputSource *)self isRunning])
  {
    [(SCATCameraInputSource *)self setAvailable:1];
    [(SCATCameraInputSource *)self setAvailabilityDetail:0];
    objc_super v3 = [(SCATCameraInputSource *)self face];
    if (v3)
    {
      free(v3);
      [(SCATCameraInputSource *)self setFace:0];
    }
    [(SCATCameraInputSource *)self setLeftHeadSwitchDown:0];
    [(SCATCameraInputSource *)self setRightHeadSwitchDown:0];
    [(SCATInputSource *)self setRunning:1];
  }
}

- (void)stopRunning
{
  if ([(SCATInputSource *)self isRunning])
  {
    [(SCATInputSource *)self setRunning:0];
  }
}

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SCATCameraInputSource;
  id v7 = a3;
  [(SCATInputSource *)&v16 updateWithSwitches:v7 recipe:v6];
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100080F30;
  double v13 = &unk_1001AD160;
  id v14 = v6;
  id v15 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  id v8 = v15;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:&v10];

  -[SCATInputSource setActions:](self, "setActions:", v8, v10, v11, v12, v13);
}

- (void)_didUpdateState:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(SCATCameraInputSource *)self state];
  if (var0 != v7 || var1 != v6)
  {
    id v9 = [(SCATInputSource *)self delegate];
    uint64_t v10 = [(SCATInputSource *)self queue];
    if (v10)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v11 = _NSConcreteStackBlock;
        uint64_t v12 = 3221225472;
        double v13 = sub_100081124;
        id v14 = &unk_1001AB878;
        id v15 = v9;
        objc_super v16 = self;
        double v17 = var0;
        double v18 = var1;
        [v10 performAsynchronousWritingBlock:&v11];
      }
    }
    -[SCATCameraInputSource setState:](self, "setState:", var0, var1, v11, v12, v13, v14);
  }
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)state
{
  double leftSwitch = self->_state.leftSwitch;
  double rightSwitch = self->_state.rightSwitch;
  result.double var1 = rightSwitch;
  result.double var0 = leftSwitch;
  return result;
}

- (void)setState:(id)a3
{
  self->_state = ($70253CE1C2FCD8F0F65A12DDE85A059A)a3;
}

- (OS_dispatch_queue)captureOutputQueue
{
  return self->_captureOutputQueue;
}

- (void)setCaptureOutputQueue:(id)a3
{
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
}

- (unint64_t)availabilityDetail
{
  return self->_availabilityDetail;
}

- (void)setAvailabilityDetail:(unint64_t)a3
{
  self->_availabilityDetail = a3;
}

- ($77BFB7B7C8E69408128DC1383CA2CAA6)face
{
  return self->_face;
}

- (void)setFace:(id *)a3
{
  self->_face = a3;
}

- (BOOL)isLeftHeadSwitchDown
{
  return self->_leftHeadSwitchDown;
}

- (void)setLeftHeadSwitchDown:(BOOL)a3
{
  self->_leftHeadSwitchDown = a3;
}

- (BOOL)isRightHeadSwitchDown
{
  return self->_rightHeadSwitchDown;
}

- (void)setRightHeadSwitchDown:(BOOL)a3
{
  self->_rightHeadSwitchDown = a3;
}

- (UIView)captureOutputPreview
{
  return self->_captureOutputPreview;
}

- (void)setCaptureOutputPreview:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)captureVideoPreviewLayer
{
  return self->_captureVideoPreviewLayer;
}

- (void)setCaptureVideoPreviewLayer:(id)a3
{
}

- (CALayer)faceLayer
{
  return self->_faceLayer;
}

- (void)setFaceLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceLayer, 0);
  objc_storeStrong((id *)&self->_captureVideoPreviewLayer, 0);
  objc_storeStrong((id *)&self->_captureOutputPreview, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);

  objc_storeStrong((id *)&self->_captureOutputQueue, 0);
}

@end