@interface AXMTVideoCapturer
+ (id)_idealFrameRateRangeForDeviceFormat:(id)a3;
- (AVCaptureDataOutputSynchronizer)_outputSynchronizer;
- (AVCaptureDevice)_captureDevice;
- (AVCaptureMetadataOutput)_metadataOutput;
- (AVCaptureSession)captureSession;
- (AVCaptureVideoDataOutput)_videoDataOutput;
- (AXMTVideoCapturer)initWithInput:(id)a3;
- (AXMTVideoCapturerDelegate)delegate;
- (AXSSMotionTrackingCameraInput)input;
- (BOOL)_backlightIsOff;
- (BOOL)_videoDimensionsMatchesDesiredResolutions:(id)a3;
- (BOOL)isStarted;
- (CGSize)resolution;
- (OS_dispatch_queue)_captureSessionQueue;
- (float)fieldOfView;
- (id)_binnedFormatsForDevice:(id)a3;
- (unint64_t)_droppedFrames;
- (unsigned)pixelFormatType;
- (void)_avCaptureSessionDidStopRunningNotification:(id)a3;
- (void)_avCaptureSessionRuntimeErrorNotification:(id)a3;
- (void)_avCaptureSessionWasInterruptedNotification:(id)a3;
- (void)_configureCaptureDevice:(id)a3;
- (void)_configureCaptureSession;
- (void)_configureMetadataOutputWithObjectType:(id)a3 forCaptureSession:(id)a4 addFaceTracking:(BOOL)a5;
- (void)_configureVideoDataOutputForCaptureSession:(id)a3;
- (void)_updateCaptureDeviceIfNeeded;
- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4;
- (void)reconfigureCaptureDeviceForBacklightOff:(BOOL)a3;
- (void)setCaptureSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFieldOfView:(float)a3;
- (void)setInput:(id)a3;
- (void)setPixelFormatType:(unsigned int)a3;
- (void)setResolution:(CGSize)a3;
- (void)setStarted:(BOOL)a3;
- (void)set_backlightIsOff:(BOOL)a3;
- (void)set_captureDevice:(id)a3;
- (void)set_captureSessionQueue:(id)a3;
- (void)set_droppedFrames:(unint64_t)a3;
- (void)set_metadataOutput:(id)a3;
- (void)set_outputSynchronizer:(id)a3;
- (void)set_videoDataOutput:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation AXMTVideoCapturer

- (AXMTVideoCapturer)initWithInput:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXMTVideoCapturer;
  v5 = [(AXMTVideoCapturer *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_pixelFormatType = 1111970369;
    v7 = (AXSSMotionTrackingCameraInput *)[v4 copy];
    input = v6->_input;
    v6->_input = v7;
  }
  return v6;
}

- (void)reconfigureCaptureDeviceForBacklightOff:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AXMTVideoCapturer *)self _backlightIsOff] != a3)
  {
    [(AXMTVideoCapturer *)self set_backlightIsOff:v3];
    id v5 = [(AXMTVideoCapturer *)self _captureDevice];
    [(AXMTVideoCapturer *)self _configureCaptureDevice:v5];
  }
}

- (void)_configureCaptureDevice:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = AXSSLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002089C(v3);
    }

    id v5 = [(AXMTVideoCapturer *)self _binnedFormatsForDevice:v3];
    if (![v5 count])
    {
      uint64_t v6 = [v3 formats];

      id v5 = (void *)v6;
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v72 objects:v77 count:16];
    if (v8)
    {
      id v9 = v8;
      id v52 = v3;
      v53 = 0;
      v58 = 0;
      id v10 = 0;
      int32_t v60 = 0;
      int32_t v61 = 0;
      id v11 = 0;
      uint64_t v12 = *(void *)v73;
      uint64_t v54 = *(void *)v73;
      id v55 = v7;
      do
      {
        v13 = 0;
        id v57 = v9;
        do
        {
          if (*(void *)v73 != v12) {
            objc_enumerationMutation(v7);
          }
          v14 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v13);
          v15 = (const opaqueCMFormatDescription *)objc_msgSend(v14, "formatDescription", v52);
          if (CMFormatDescriptionGetMediaSubType(v15) == 875704422)
          {
            v59 = v11;
            unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v15);
            unint64_t v17 = HIDWORD(Dimensions);
            v18 = [(id)objc_opt_class() _idealFrameRateRangeForDeviceFormat:v14];
            unsigned int v19 = [(AXMTVideoCapturer *)self _videoDimensionsMatchesDesiredResolutions:Dimensions];
            BOOL v21 = v60 <= (int)Dimensions && v61 <= SHIDWORD(Dimensions);
            if (v10)
            {
              [v18 maxFrameRate];
              double v23 = v22;
              v24 = v10;
              [v10 maxFrameRate];
              BOOL v26 = v23 >= v25;
            }
            else
            {
              v24 = 0;
              BOOL v26 = 1;
            }
            if (v58)
            {
              [v18 maxFrameRate];
              double v28 = v27;
              [v58 maxFrameRate];
              BOOL v30 = v28 >= v29;
            }
            else
            {
              BOOL v30 = 1;
            }
            if ((v19 & v26) == 1)
            {
              id v31 = v14;

              id v10 = v18;
              id v11 = v31;
            }
            else
            {
              id v10 = v24;
              id v11 = v59;
            }
            if (!v21 || !v30)
            {
              LODWORD(Dimensions) = v60;
              LODWORD(v17) = v61;
            }
            else
            {
              id v33 = v14;

              id v34 = v18;
              v58 = v34;
              v53 = v33;
            }
            uint64_t v12 = v54;
            id v7 = v55;

            int32_t v60 = Dimensions;
            int32_t v61 = v17;
            id v9 = v57;
          }
          v13 = (char *)v13 + 1;
        }
        while (v9 != v13);
        id v9 = [v7 countByEnumeratingWithState:&v72 objects:v77 count:16];
      }
      while (v9);

      id v3 = v52;
      if (v11) {
        goto LABEL_40;
      }
    }
    else
    {

      v53 = 0;
      id v10 = 0;
      v58 = 0;
    }
    id v11 = v53;
    id v35 = v58;

    v58 = v35;
    id v10 = v35;
    v53 = v11;
    if (!v11)
    {
LABEL_64:

      goto LABEL_65;
    }
LABEL_40:
    if (v10)
    {
      uint64_t v36 = (uint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v11 formatDescription]);
      -[AXMTVideoCapturer setResolution:](self, "setResolution:", (double)(unint64_t)(int)v36, (double)(unint64_t)(v36 >> 32));
      [(AXMTVideoCapturer *)self delegate];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001E930;
      block[3] = &unk_100048928;
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      id v70 = v37;
      v71 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      id v68 = 0;
      unsigned __int8 v38 = [v3 lockForConfiguration:&v68];
      id v39 = v68;
      if (v38)
      {
        [v3 setActiveFormat:v11];
        v40 = AXSSLogForCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          sub_1000207B0(v3);
        }

        memset(&v67[32], 0, 24);
        [v10 minFrameDuration];
        if ([(AXMTVideoCapturer *)self _backlightIsOff]) {
          double v41 = 1.0;
        }
        else {
          double v41 = 30.0;
        }
        [v10 maxFrameRate];
        double v43 = v42 - v41;
        [v10 minFrameRate];
        if (v43 > 1.0 && v44 <= v41)
        {
          CMTimeMake(&time, 1, (int)v41);
          *(CMTime *)&v67[32] = time;
        }
        *(CMTime *)v67 = *(CMTime *)&v67[32];
        [v3 setActiveVideoMinFrameDuration:v67];
        CMTime v66 = *(CMTime *)&v67[32];
        [v3 setActiveVideoMaxFrameDuration:&v66];
        CMTime time = *(CMTime *)&v67[32];
        if (CMTimeGetSeconds(&time) > 0.0)
        {
          v45 = AXSSLogForCategory();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            CMTime time = *(CMTime *)&v67[32];
            v50 = (__CFString *)CMTimeCopyDescription(kCFAllocatorDefault, &time);
            CMTime time = *(CMTime *)&v67[32];
            v62 = v50;
            Float64 Seconds = CMTimeGetSeconds(&time);
            LODWORD(time.value) = 138412546;
            *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v50;
            LOWORD(time.flags) = 2048;
            *(double *)((char *)&time.flags + 2) = 1.0 / Seconds;
            _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "AXMTVideoCapturer: _configureCaptureDevice: minFrameDuration and maxFrameDuration: %@ (FPS: %f)", (uint8_t *)&time, 0x16u);
          }
        }
        [v3 setFaceDetectionDrivenImageProcessingEnabled:1];
        if ([v3 canPerformReactionEffects]) {
          +[AVCaptureDevice setReactionEffectsEnabled:0];
        }
        unsigned __int8 v46 = [v3 isGeometricDistortionCorrectionEnabled];
        v47 = [v3 activeFormat];
        v48 = v47;
        if (v46) {
          [v47 geometricDistortionCorrectedVideoFieldOfView];
        }
        else {
          [v47 videoFieldOfView];
        }
        -[AXMTVideoCapturer setFieldOfView:](self, "setFieldOfView:");

        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_10001E970;
        v63[3] = &unk_100048928;
        id v64 = v37;
        v65 = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v63);

        [v3 unlockForConfiguration];
      }
      else
      {
        v49 = AXSSLogForCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_100020834();
        }
      }
    }
    goto LABEL_64;
  }
LABEL_65:
}

- (BOOL)_videoDimensionsMatchesDesiredResolutions:(id)a3
{
  if (a3.var0 == (unint64_t)1440.0 && a3.var1 == (unint64_t)1080.0) {
    return 1;
  }
  return a3.var0 == (unint64_t)1920.0 && a3.var1 == (unint64_t)1440.0;
}

- (void)_updateCaptureDeviceIfNeeded
{
  id v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000209F0();
  }

  id v5 = [(AXMTVideoCapturer *)self input];
  if (!v5
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (+[AXSSMotionTrackingCameraInput captureDeviceForMotionTrackingInput:v5], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = +[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
  }
  id v7 = [v6 uniqueID];
  if (!v7)
  {
    v2 = [(AXMTVideoCapturer *)self _captureDevice];
    uint64_t v12 = [v2 uniqueID];
    if (v12)
    {

LABEL_17:
      v14 = AXSSLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100020954(self);
      }

      unsigned int v15 = [(AXMTVideoCapturer *)self isStarted];
      if (v15) {
        [(AXMTVideoCapturer *)self stop];
      }
      if (v6) {
        [(AXMTVideoCapturer *)self _configureCaptureDevice:v6];
      }
      [(AXMTVideoCapturer *)self set_captureDevice:v6];
      if (v15)
      {
        v16 = [(AXMTVideoCapturer *)self _captureDevice];

        if (v16) {
          [(AXMTVideoCapturer *)self start];
        }
      }
      goto LABEL_26;
    }
  }
  id v8 = [v6 uniqueID];
  id v9 = [(AXMTVideoCapturer *)self _captureDevice];
  id v10 = [v9 uniqueID];
  unsigned __int8 v11 = [v8 isEqualToString:v10];

  if (v7)
  {

    if ((v11 & 1) == 0) {
      goto LABEL_17;
    }
  }
  else
  {

    if ((v11 & 1) == 0) {
      goto LABEL_17;
    }
  }
  v13 = AXSSLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100020920();
  }

LABEL_26:
}

- (void)setInput:(id)a3
{
  id v4 = a3;
  if (([(AXSSMotionTrackingCameraInput *)self->_input isEqual:v4] & 1) == 0)
  {
    id v5 = (AXSSMotionTrackingCameraInput *)[v4 copy];
    input = self->_input;
    self->_input = v5;

    id v7 = AXSSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100020A24();
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v4 captureDeviceUniqueID];
      id v9 = [(AXMTVideoCapturer *)self _captureDevice];
      id v10 = [v9 uniqueID];

      if (!v10 && v8 || ([v10 isEqualToString:v8] & 1) == 0) {
        [(AXMTVideoCapturer *)self _updateCaptureDeviceIfNeeded];
      }
    }
  }
}

- (void)start
{
  if (![(AXMTVideoCapturer *)self isStarted])
  {
    [(AXMTVideoCapturer *)self _updateCaptureDeviceIfNeeded];
    [(AXMTVideoCapturer *)self setStarted:1];
    id v3 = [(AXMTVideoCapturer *)self _captureDevice];

    if (v3)
    {
      id v4 = AXSSLogForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v10 = "-[AXMTVideoCapturer start]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s: configuring new capture session", buf, 0xCu);
      }

      id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.accessibility.AXMTVideoCapturer.session", v5);
      [(AXMTVideoCapturer *)self set_captureSessionQueue:v6];

      id v7 = [(AXMTVideoCapturer *)self _captureSessionQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001EED4;
      block[3] = &unk_1000488D8;
      void block[4] = self;
      dispatch_async(v7, block);
    }
  }
}

- (void)stop
{
  if ([(AXMTVideoCapturer *)self isStarted])
  {
    id v3 = AXSSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100020A98(self);
    }

    [(AXMTVideoCapturer *)self setStarted:0];
    id v4 = [(AXMTVideoCapturer *)self captureSession];
    [v4 stopRunning];

    id v5 = [(AXMTVideoCapturer *)self captureSession];

    if (v5)
    {
      dispatch_queue_t v6 = +[NSNotificationCenter defaultCenter];
      id v7 = [(AXMTVideoCapturer *)self captureSession];
      [v6 removeObserver:self name:AVCaptureSessionDidStopRunningNotification object:v7];

      id v8 = +[NSNotificationCenter defaultCenter];
      id v9 = [(AXMTVideoCapturer *)self captureSession];
      [v8 removeObserver:self name:AVCaptureSessionRuntimeErrorNotification object:v9];

      id v10 = +[NSNotificationCenter defaultCenter];
      unsigned __int8 v11 = [(AXMTVideoCapturer *)self captureSession];
      [v10 removeObserver:self name:AVCaptureSessionWasInterruptedNotification object:v11];
    }
    [(AXMTVideoCapturer *)self setCaptureSession:0];
    [(AXMTVideoCapturer *)self set_captureDevice:0];
    [(AXMTVideoCapturer *)self set_videoDataOutput:0];
    [(AXMTVideoCapturer *)self set_metadataOutput:0];
    [(AXMTVideoCapturer *)self set_outputSynchronizer:0];
    [(AXMTVideoCapturer *)self set_droppedFrames:0];
    +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:0 andApp:0];
  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  AXMTLogFPS();
  id v8 = [(AXMTVideoCapturer *)self delegate];
  if (v8)
  {
    id v7 = [[AXMTVideoCapturerResult alloc] initWithBuffer:a4 metadataObjects:0];
    [v8 videoCapturer:self didCaptureBufferResult:v7];
  }
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  dispatch_queue_t v6 = [(AXMTVideoCapturer *)self delegate];
  if (v6)
  {
    id v7 = v6;
    [v6 videoCapturerDidDropFrame:self];
    dispatch_queue_t v6 = v7;
  }
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  id v5 = a4;
  AXMTLogFPS();
  dispatch_queue_t v6 = [(AXMTVideoCapturer *)self _videoDataOutput];
  id v18 = [v5 synchronizedDataForCaptureOutput:v6];

  id v7 = [(AXMTVideoCapturer *)self _metadataOutput];
  id v8 = [v5 synchronizedDataForCaptureOutput:v7];

  id v9 = [v8 metadataObjects];
  id v10 = [v9 count];

  if (v10
    || (unsigned __int8 v11 = (char *)[(AXMTVideoCapturer *)self _droppedFrames] + 1,
        [(AXMTVideoCapturer *)self set_droppedFrames:v11],
        (unint64_t)v11 >= 0x15))
  {
    [(AXMTVideoCapturer *)self set_droppedFrames:0];
    char v12 = 0;
  }
  else
  {
    char v12 = 1;
  }
  v13 = [(AXMTVideoCapturer *)self delegate];
  if (v13)
  {
    if ([v18 sampleBufferWasDropped])
    {
      [v13 videoCapturerDidDropFrame:self];
    }
    else if ((v12 & 1) == 0)
    {
      v14 = [AXMTVideoCapturerResult alloc];
      id v15 = [v18 sampleBuffer];
      v16 = [v8 metadataObjects];
      unint64_t v17 = [(AXMTVideoCapturerResult *)v14 initWithBuffer:v15 metadataObjects:v16];

      [v13 videoCapturer:self didCaptureBufferResult:v17];
    }
  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v6 = a4;
  AXMTLogFPS();
  id v7 = [(AXMTVideoCapturer *)self delegate];
  if (![v6 count]) {
    [v7 videoCapturerReceivedNoMetadata:self];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F5F4;
  block[3] = &unk_100048FC8;
  id v11 = v7;
  char v12 = self;
  v13 = [[AXMTVideoCapturerResult alloc] initWithBuffer:0 metadataObjects:v6];
  id v8 = v13;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (id)_idealFrameRateRangeForDeviceFormat:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10001F728;
  char v12 = sub_10001F738;
  id v13 = 0;
  id v4 = [v3 videoSupportedFrameRateRanges];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F740;
  v7[3] = &unk_100048FF0;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_binnedFormatsForDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  id v5 = [v3 formats];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001F8B4;
  v9[3] = &unk_100049018;
  id v10 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = [v6 copy];

  return v7;
}

- (void)_configureCaptureSession
{
  id v3 = [(AXMTVideoCapturer *)self _captureDevice];
  id v36 = 0;
  id v4 = +[AVCaptureDeviceInput deviceInputWithDevice:v3 error:&v36];
  id v5 = v36;

  if (v5)
  {
    id v6 = AXSSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100020CC4();
    }
    id v7 = 0;
LABEL_27:

    [(AXMTVideoCapturer *)self setCaptureSession:v7];
    goto LABEL_28;
  }
  id v7 = objc_opt_new();
  [v7 beginConfiguration];
  if ([v7 canAddInput:v4])
  {
    [v7 addInput:v4];
    id v6 = dispatch_queue_create("com.apple.accessibility.AXMTVideoCapturer.metadataOutput", 0);
    uint64_t v8 = [(AXMTVideoCapturer *)self input];
    id v9 = [v8 trackingType];

    if (v9 == (id)3)
    {
      [(AXMTVideoCapturer *)self _configureVideoDataOutputForCaptureSession:v7];
      id v10 = &AVMetadataObjectTypeFace;
    }
    else
    {
      id v10 = (const AVMetadataObjectType *)&AVMetadataObjectTypeTrackedFaces;
    }
    [(AXMTVideoCapturer *)self _configureMetadataOutputWithObjectType:*v10 forCaptureSession:v7 addFaceTracking:v9 != (id)3];
    char v12 = [(AXMTVideoCapturer *)self _metadataOutput];
    [v12 setMetadataObjectsDelegate:self queue:v6];

    id v13 = [(AXMTVideoCapturer *)self _captureDevice];
    id v35 = 0;
    unsigned int v14 = [v13 lockForConfiguration:&v35];
    id v15 = v35;

    if (v14)
    {
      v16 = [(AXMTVideoCapturer *)self _captureDevice];
      [(AXMTVideoCapturer *)self _configureCaptureDevice:v16];
    }
    else
    {
      v16 = AXSSLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100020BD0();
      }
    }

    unint64_t v17 = AXSSLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100020B28(self);
    }

    id v18 = [(AXMTVideoCapturer *)self _captureDevice];
    unsigned int v19 = v18;
    if (v18) {
      [v18 activeVideoMaxFrameDuration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);

    if (Seconds > 0.0)
    {
      BOOL v21 = AXSSLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        double v25 = [(AXMTVideoCapturer *)self _captureDevice];
        id v31 = v25;
        if (v25) {
          [v25 activeVideoMinFrameDuration];
        }
        else {
          memset(&v33, 0, sizeof(v33));
        }
        BOOL v26 = (__CFString *)CMTimeCopyDescription(kCFAllocatorDefault, &v33);
        BOOL v30 = v26;
        double v27 = [(AXMTVideoCapturer *)self _captureDevice];
        double v28 = v27;
        if (v27) {
          [v27 activeVideoMaxFrameDuration];
        }
        else {
          memset(&v32, 0, sizeof(v32));
        }
        Float64 v29 = CMTimeGetSeconds(&v32);
        *(_DWORD *)buf = 136315650;
        unsigned __int8 v38 = "-[AXMTVideoCapturer _configureCaptureSession]";
        __int16 v39 = 2112;
        v40 = v26;
        __int16 v41 = 2048;
        double v42 = 1.0 / v29;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s: final minFrameDuration and maxFrameDuration: %@ (FPS: %f)", buf, 0x20u);
      }
    }
    [v7 commitConfiguration];
    if (v9 == (id)3)
    {
      id v22 = objc_alloc((Class)AVCaptureDataOutputSynchronizer);
      double v23 = [v7 outputs];
      id v24 = [v22 initWithDataOutputs:v23];

      [v24 setDelegate:self queue:v6];
      [(AXMTVideoCapturer *)self set_outputSynchronizer:v24];
    }
    goto LABEL_27;
  }
  id v11 = AXSSLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100020C50();
  }

LABEL_28:
}

- (void)_configureVideoDataOutputForCaptureSession:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  CFStringRef v14 = kCVPixelBufferPixelFormatTypeKey;
  id v6 = +[NSNumber numberWithUnsignedInt:[(AXMTVideoCapturer *)self pixelFormatType]];
  id v15 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  [v5 setVideoSettings:v7];
  [v5 setAlwaysDiscardsLateVideoFrames:1];
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.accessibility.AXMTVideoCapturer.videoDataOutput", 0);
  [v5 setSampleBufferDelegate:self queue:v8];
  [(AXMTVideoCapturer *)self set_videoDataOutput:v5];
  if ([v4 canAddOutput:v5])
  {
    [v4 addOutput:v5];
    id v9 = [(AXMTVideoCapturer *)self _videoDataOutput];
    id v10 = [v9 connectionWithMediaType:AVMediaTypeVideo];

    if (v10)
    {
      unsigned int v11 = [v10 isCameraIntrinsicMatrixDeliverySupported];
      char v12 = AXSSLogForCategory();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13) {
          sub_100020D2C();
        }

        [v10 setCameraIntrinsicMatrixDeliveryEnabled:1];
      }
      else
      {
        if (v13) {
          sub_100020D60();
        }
      }
      if ([v10 isVideoMirroringSupported]) {
        [v10 setVideoMirrored:0];
      }
      if ([v10 isVideoRetainedBufferCountHintSupported])[v10 setVideoRetainedBufferCountHint:8]; {
    }
      }
  }
  else
  {
    id v10 = AXSSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100020D94();
    }
  }
}

- (void)_configureMetadataOutputWithObjectType:(id)a3 forCaptureSession:(id)a4 addFaceTracking:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  [(AXMTVideoCapturer *)self set_metadataOutput:v10];
  if ([v9 canAddOutput:v10])
  {
    [v9 addOutput:v10];
    if (v5)
    {
      if ([v10 isFaceTrackingSupported])
      {
        [v10 setFaceTrackingMetadataObjectTypesAvailable:1];
        [v10 setFaceTrackingMaxFaces:1];
        [v10 setFaceTrackingUsesFaceRecognition:AXMTFaceKitUseRecognition];
        LODWORD(v11) = 1069547520;
        [v10 setFaceTrackingNetworkFailureThresholdMultiplier:v11];
      }
      else
      {
        char v12 = AXSSLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100020F5C(v12, v13, v14, v15, v16, v17, v18, v19);
        }
      }
    }
    v20 = [v10 availableMetadataObjectTypes];
    unsigned int v21 = [v20 containsObject:v8];

    if (v21)
    {
      id v24 = v8;
      id v22 = +[NSArray arrayWithObjects:&v24 count:1];
      [v10 setMetadataObjectTypes:v22];
    }
    else
    {
      id v22 = AXSSLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100020E98((uint64_t)v8, v10, v22);
      }
    }
  }
  double v23 = AXSSLogForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100020E08(v10);
  }
}

- (void)_avCaptureSessionDidStopRunningNotification:(id)a3
{
  id v3 = a3;
  id v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = [v3 object];
    id v6 = [v3 userInfo];
    int v7 = 136315650;
    id v8 = "-[AXMTVideoCapturer _avCaptureSessionDidStopRunningNotification:]";
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    char v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s: notification.object: %@, userInfo: %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_avCaptureSessionRuntimeErrorNotification:(id)a3
{
  id v3 = a3;
  id v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100020FD4(v3, v4);
  }
}

- (void)_avCaptureSessionWasInterruptedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:AVCaptureSessionInterruptionReasonKey];

  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:AVCaptureSessionInterruptionReasonKey];
    uint64_t v7 = (uint64_t)[v6 integerValue];
  }
  else
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v8 = [v4 objectForKeyedSubscript:AVCaptureSessionInterruptionSystemPressureStateKey];
  __int16 v9 = AXSSLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = [v4 objectForKeyedSubscript:AVCaptureSessionInterruptionReasonKey];
    *(_DWORD *)buf = 136315650;
    v20 = "-[AXMTVideoCapturer _avCaptureSessionWasInterruptedNotification:]";
    __int16 v21 = 2048;
    id v22 = [v14 integerValue];
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: sessionInterruptionReason: %ld, systemPressureState: %@", buf, 0x20u);
  }
  if (v7 == 3) {
    uint64_t v10 = 7;
  }
  else {
    uint64_t v10 = 0;
  }
  __int16 v11 = [(AXMTVideoCapturer *)self delegate];
  +[NSError errorWithDomain:AXSSMotionTrackingErrorDomain code:v10 userInfo:v4];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020560;
  block[3] = &unk_100048FC8;
  id v16 = v11;
  uint64_t v17 = self;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v18;
  id v13 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (AXSSMotionTrackingCameraInput)input
{
  return self->_input;
}

- (AXMTVideoCapturerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMTVideoCapturerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
}

- (CGSize)resolution
{
  double width = self->_resolution.width;
  double height = self->_resolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setResolution:(CGSize)a3
{
  self->_resolution = a3;
}

- (float)fieldOfView
{
  return self->_fieldOfView;
}

- (void)setFieldOfView:(float)a3
{
  self->_fieldOfView = a3;
}

- (unsigned)pixelFormatType
{
  return self->_pixelFormatType;
}

- (void)setPixelFormatType:(unsigned int)a3
{
  self->_pixelFormatType = a3;
}

- (AVCaptureDevice)_captureDevice
{
  return self->__captureDevice;
}

- (void)set_captureDevice:(id)a3
{
}

- (AVCaptureMetadataOutput)_metadataOutput
{
  return self->__metadataOutput;
}

- (void)set_metadataOutput:(id)a3
{
}

- (AVCaptureDataOutputSynchronizer)_outputSynchronizer
{
  return self->__outputSynchronizer;
}

- (void)set_outputSynchronizer:(id)a3
{
}

- (unint64_t)_droppedFrames
{
  return self->__droppedFrames;
}

- (void)set_droppedFrames:(unint64_t)a3
{
  self->__droppedFrames = a3;
}

- (AVCaptureVideoDataOutput)_videoDataOutput
{
  return self->__videoDataOutput;
}

- (void)set_videoDataOutput:(id)a3
{
}

- (OS_dispatch_queue)_captureSessionQueue
{
  return self->__captureSessionQueue;
}

- (void)set_captureSessionQueue:(id)a3
{
}

- (BOOL)_backlightIsOff
{
  return self->__backlightIsOff;
}

- (void)set_backlightIsOff:(BOOL)a3
{
  self->__backlightIsOff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__captureSessionQueue, 0);
  objc_storeStrong((id *)&self->__videoDataOutput, 0);
  objc_storeStrong((id *)&self->__outputSynchronizer, 0);
  objc_storeStrong((id *)&self->__metadataOutput, 0);
  objc_storeStrong((id *)&self->__captureDevice, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_input, 0);
}

@end