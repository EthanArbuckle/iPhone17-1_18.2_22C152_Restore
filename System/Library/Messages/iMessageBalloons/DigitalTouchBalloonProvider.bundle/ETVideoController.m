@interface ETVideoController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)writeStartTime;
- (AVCaptureDevice)videoDevice;
- (ETVideoController)initWithMessageIdentifier:(id)a3;
- (ETVideoControllerDelegate)delegate;
- (double)currentFrameIntervalSinceFirstFrame;
- (double)timeSinceStartOfPreview;
- (id)_urlWithFormat:(id)a3;
- (id)_videoCaptureDeviceAtPosition:(int64_t)a3;
- (unint64_t)videoState;
- (void)_addCaptureSessionObservers;
- (void)_createWriter;
- (void)_deleteAssetWithFormat:(id)a3;
- (void)_didReceiveCaptureSessionErrorNotification:(id)a3;
- (void)_previewInterruptedNotification:(id)a3;
- (void)_previewStartedNotification:(id)a3;
- (void)_setVideoState:(unint64_t)a3;
- (void)_toggleCameraToPosition:(int64_t)a3;
- (void)_updatePreviewOrientationWithSize:(CGSize)a3;
- (void)cancelRecording;
- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didFinishProcessingPhotoSampleBuffer:(opaqueCMSampleBuffer *)a4 previewPhotoSampleBuffer:(opaqueCMSampleBuffer *)a5 resolvedSettings:(id)a6 bracketSettings:(id)a7 error:(id)a8;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)capturePhoto;
- (void)dealloc;
- (void)deleteWrittenAssets;
- (void)finishRecording;
- (void)setDelegate:(id)a3;
- (void)startPreview;
- (void)startRecording;
- (void)stopPreview;
- (void)toggleCamera;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)writePhotoDataWithCompletion:(id)a3;
@end

@implementation ETVideoController

- (ETVideoController)initWithMessageIdentifier:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ETVideoController;
  v6 = [(ETVideoController *)&v19 init];
  v7 = v6;
  if (v6)
  {
    [(ETVideoController *)v6 _setVideoState:0];
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.ET.VideoPreviewQueue", v8);
    previewQueue = v7->_previewQueue;
    v7->_previewQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.ET.VideoWriterQueue", v11);
    writerQueue = v7->_writerQueue;
    v7->_writerQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v7->_fileUUID, a3);
    uint64_t v14 = [(ETVideoController *)v7 _urlWithFormat:@"DigitalTouch-%@.m4v"];
    fileURL = v7->_fileURL;
    v7->_fileURL = (NSURL *)v14;

    v16 = [(ETVideoController *)v7 view];
    [v16 setUserInteractionEnabled:0];

    v17 = v7;
  }

  return v7;
}

- (id)_urlWithFormat:(id)a3
{
  v3 = +[NSString stringWithValidatedFormat:a3, @"%@", 0, self->_fileUUID validFormatSpecifiers error];
  v4 = NSTemporaryDirectory();
  id v5 = [v4 stringByAppendingPathComponent:v3];
  v6 = +[NSURL fileURLWithPath:v5];

  return v6;
}

- (void)_didReceiveCaptureSessionErrorNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = [v5 objectForKey:AVCaptureSessionErrorKey];

  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      dispatch_queue_t v12 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Received capture session error notification: %@, with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained videoControllerDidInterruptPreview:self withInterruptionReason:0];
}

- (void)_createWriter
{
  id v3 = objc_alloc((Class)AVAssetWriter);
  fileURL = self->_fileURL;
  id v21 = 0;
  id v5 = (AVAssetWriter *)[v3 initWithURL:fileURL fileType:AVFileTypeAppleM4V error:&v21];
  id v6 = v21;
  writer = self->_writer;
  self->_writer = v5;

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.a) = 138412290;
        *(void *)((char *)&buf.a + 4) = v6;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Failed to initialize media writer: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    v25[0] = AVVideoCodecKey;
    v25[1] = AVVideoWidthKey;
    v26[0] = AVVideoCodecH264;
    v26[1] = &off_25638;
    v25[2] = AVVideoHeightKey;
    v25[3] = AVVideoScalingModeKey;
    v26[2] = &off_25650;
    v26[3] = AVVideoScalingModeResizeAspectFill;
    int v9 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    id v10 = (AVAssetWriterInput *)[objc_alloc((Class)AVAssetWriterInput) initWithMediaType:AVMediaTypeVideo outputSettings:v9];
    videoWriterInput = self->_videoWriterInput;
    self->_videoWriterInput = v10;

    [(AVAssetWriterInput *)self->_videoWriterInput setExpectsMediaDataInRealTime:1];
    memset(&buf, 0, sizeof(buf));
    if ((char *)[(AVCaptureDevice *)self->_videoDevice position] == (char *)&dword_0 + 2)
    {
      CGAffineTransformMakeScale(&buf, -1.0, 1.0);
    }
    else
    {
      long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&buf.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&buf.c = v12;
      *(_OWORD *)&buf.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }
    v13 = self->_videoWriterInput;
    CGAffineTransform v20 = buf;
    [(AVAssetWriterInput *)v13 setTransform:&v20];
    p_writer = &self->_writer;
    [(AVAssetWriter *)self->_writer addInput:self->_videoWriterInput];
    memset((char *)&v20.a + 4, 0, 28);
    LODWORD(v20.a) = 6619138;
    v22[0] = AVFormatIDKey;
    v22[1] = AVNumberOfChannelsKey;
    v23[0] = &off_25668;
    v23[1] = &off_25680;
    v23[2] = &off_256C8;
    v22[2] = AVSampleRateKey;
    v22[3] = AVChannelLayoutKey;
    v15 = +[NSData dataWithBytes:&v20 length:32];
    v23[3] = v15;
    v22[4] = AVEncoderBitRateKey;
    v23[4] = &off_25698;
    v16 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];

    id v17 = [objc_alloc((Class)AVAssetWriterInput) initWithMediaType:AVMediaTypeAudio outputSettings:v16];
    p_audioWriterInput = (id *)&self->_audioWriterInput;
    id v19 = *p_audioWriterInput;
    id *p_audioWriterInput = v17;

    [*p_audioWriterInput setExpectsMediaDataInRealTime:1];
    [(AVAssetWriter *)*p_writer addInput:*p_audioWriterInput];
  }
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ETVideoController;
  [(ETVideoController *)&v4 dealloc];
}

- (void)_previewStartedNotification:(id)a3
{
  CMTime time1 = (CMTime)self->_writeStartTime;
  CMTime v4 = kCMTimeZero;
  if (!CMTimeCompare(&time1, &v4))
  {
    CMClockGetTime(&time1, [(AVCaptureSession *)self->_captureSession masterClock]);
    self->_captureSessionStartTime = ($95D729B680665BEAEFA1D6FCA8238556)time1;
  }
}

- (void)_previewInterruptedNotification:(id)a3
{
  if (self->_videoState - 1 <= 1)
  {
    CMTime v4 = [a3 userInfo];
    id v6 = [v4 objectForKey:AVCaptureSessionInterruptionReasonKey];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "videoControllerDidInterruptPreview:withInterruptionReason:", self, (int)objc_msgSend(v6, "intValue"));
  }
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)ETVideoController;
  [(ETVideoController *)&v12 viewDidLoad];
  id v3 = [(ETVideoController *)self view];
  CMTime v4 = +[UIColor blackColor];
  [v3 setBackgroundColor:v4];

  id v5 = [v3 layer];
  [v5 setMasksToBounds:1];
  id v6 = (AVCaptureSession *)objc_opt_new();
  captureSession = self->_captureSession;
  self->_captureSession = v6;

  [(ETVideoController *)self _addCaptureSessionObservers];
  v8 = +[AVCaptureVideoPreviewLayer layerWithSession:self->_captureSession];
  previewLayer = self->_previewLayer;
  self->_previewLayer = v8;

  [(AVCaptureVideoPreviewLayer *)self->_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
  previewQueue = self->_previewQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C960;
  block[3] = &unk_24858;
  block[4] = self;
  dispatch_async(previewQueue, block);
}

- (void)_addCaptureSessionObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_previewStartedNotification:" name:AVCaptureSessionDidStartRunningNotification object:self->_captureSession];
  [v3 addObserver:self selector:"_previewInterruptedNotification:" name:AVCaptureSessionWasInterruptedNotification object:self->_captureSession];
  [v3 addObserver:self selector:"_didReceiveCaptureSessionErrorNotification:" name:AVCaptureSessionRuntimeErrorNotification object:self->_captureSession];
}

- (void)_updatePreviewOrientationWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = +[UIApplication sharedApplication];
  id v7 = [v6 statusBarOrientation];

  uint64_t v8 = 1;
  switch((unint64_t)v7)
  {
    case 0uLL:
      if (width <= height) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = 3;
      }
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      uint64_t v8 = (uint64_t)v7;
      break;
    default:
      break;
  }
  id v11 = [(AVCapturePhotoOutput *)self->_photoOutput connectionWithMediaType:AVMediaTypeVideo];
  objc_msgSend(v11, "setVideoMirrored:", (char *)-[AVCaptureDevice position](self->_videoDevice, "position") == (char *)&dword_0 + 2);
  [v11 setVideoOrientation:v8];
  int v9 = [(AVCaptureVideoDataOutput *)self->_videoDataOutput connectionWithMediaType:AVMediaTypeVideo];
  [v9 setVideoOrientation:v8];

  id v10 = [(AVCaptureVideoPreviewLayer *)self->_previewLayer connection];
  [v10 setVideoOrientation:v8];
}

- (id)_videoCaptureDeviceAtPosition:(int64_t)a3
{
  CMTime v4 = +[AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInDualCamera mediaType:AVMediaTypeVideo position:a3];
  if (!v4)
  {
    CMTime v4 = +[AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInWideAngleCamera mediaType:AVMediaTypeVideo position:a3];
  }

  return v4;
}

- (void)_toggleCameraToPosition:(int64_t)a3
{
  writerQueue = self->_writerQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_CFA8;
  v4[3] = &unk_24948;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(writerQueue, v4);
}

- (void)toggleCamera
{
  previewQueue = self->_previewQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D460;
  block[3] = &unk_24858;
  block[4] = self;
  dispatch_async(previewQueue, block);
}

- (void)_setVideoState:(unint64_t)a3
{
  if (self->_videoState != a3)
  {
    self->_videoState = a3;
    switch(a3)
    {
      case 0uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained videoControllerDidStopPreview:self];
        goto LABEL_15;
      case 1uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained videoControllerDidStartPreview:self];
        goto LABEL_15;
      case 2uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained videoControllerDidStartRecording:self];
        goto LABEL_15;
      case 3uLL:
        id v4 = objc_loadWeakRetained((id *)&self->_delegate);
        [v4 videoControllerWillCancelRecording:self];

        writerQueue = self->_writerQueue;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_D768;
        v13[3] = &unk_24858;
        v13[4] = self;
        id v6 = v13;
        goto LABEL_8;
      case 4uLL:
        id v7 = objc_loadWeakRetained((id *)&self->_delegate);
        [v7 videoControllerWillBeginPhotoCapture:self];

        writerQueue = self->_previewQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_D85C;
        block[3] = &unk_24858;
        block[4] = self;
        id v6 = block;
LABEL_8:
        dispatch_async(writerQueue, v6);
        return;
      case 5uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained videoControllerDidEndPhotoCapture:self photoImage:self->_photoImage];
        goto LABEL_15;
      case 6uLL:
        if ((char *)[(AVAssetWriter *)self->_writer status] == (char *)&dword_0 + 3) {
          fileURL = 0;
        }
        else {
          fileURL = self->_fileURL;
        }
        int v9 = fileURL;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        id v10 = [(AVAssetWriter *)self->_writer error];
        [WeakRetained videoControllerDidEndRecording:self mediaURL:v9 withError:v10];

LABEL_15:

        break;
      default:
        return;
    }
  }
}

- (void)startPreview
{
  previewQueue = self->_previewQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DA8C;
  block[3] = &unk_24858;
  block[4] = self;
  dispatch_async(previewQueue, block);
}

- (void)startRecording
{
  inCompletionBlock[0] = _NSConcreteStackBlock;
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = sub_DC0C;
  inCompletionBlock[3] = &unk_24858;
  inCompletionBlock[4] = self;
  AudioServicesPlaySystemSoundWithCompletion(0x45Du, inCompletionBlock);
}

- (void)_deleteAssetWithFormat:(id)a3
{
  id v4 = a3;
  id v5 = [(ETVideoController *)self _urlWithFormat:v4];
  id v6 = +[NSFileManager defaultManager];
  id v10 = 0;
  unsigned __int8 v7 = [v6 removeItemAtURL:v5 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0 && IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)CGAffineTransform buf = 138412546;
      objc_super v12 = v5;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Couldn't delete asset at URL: %@ with error: %@", buf, 0x16u);
    }
  }
}

- (void)deleteWrittenAssets
{
  writerQueue = self->_writerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DED0;
  block[3] = &unk_24858;
  block[4] = self;
  dispatch_async(writerQueue, block);
}

- (void)cancelRecording
{
}

- (void)finishRecording
{
  writerQueue = self->_writerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DFA0;
  block[3] = &unk_24858;
  block[4] = self;
  dispatch_async(writerQueue, block);
}

- (void)capturePhoto
{
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)ETVideoController;
  [(ETVideoController *)&v5 viewWillLayoutSubviews];
  previewLayer = self->_previewLayer;
  id v4 = [(ETVideoController *)self view];
  [v4 bounds];
  -[AVCaptureVideoPreviewLayer setFrame:](previewLayer, "setFrame:");
}

- (void)stopPreview
{
  writerQueue = self->_writerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E4BC;
  block[3] = &unk_24858;
  block[4] = self;
  dispatch_async(writerQueue, block);
  previewQueue = self->_previewQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_E4D0;
  v5[3] = &unk_24858;
  v5[4] = self;
  dispatch_async(previewQueue, v5);
}

- (double)currentFrameIntervalSinceFirstFrame
{
  p_writeStartTime = (CMTime *)&self->_writeStartTime;
  CMTime time1 = (CMTime)self->_writeStartTime;
  CMTime time2 = kCMTimeZero;
  if (!CMTimeCompare(&time1, &time2)) {
    return 0.0;
  }
  CMClockGetTime(&v5, [(AVCaptureSession *)self->_captureSession masterClock]);
  CMTime time1 = *p_writeStartTime;
  CMTimeSubtract(&time, &v5, &time1);
  return CMTimeGetSeconds(&time);
}

- (double)timeSinceStartOfPreview
{
  p_captureSessionStartTime = (CMTime *)&self->_captureSessionStartTime;
  CMTime time1 = (CMTime)self->_captureSessionStartTime;
  CMTime time2 = kCMTimeZero;
  if (!CMTimeCompare(&time1, &time2)) {
    return 0.0;
  }
  CMClockGetTime(&v5, [(AVCaptureSession *)self->_captureSession masterClock]);
  CMTime time1 = *p_captureSessionStartTime;
  CMTimeSubtract(&time, &v5, &time1);
  return CMTimeGetSeconds(&time);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8 = (AVCaptureAudioDataOutput *)a3;
  id v9 = a5;
  if (self->_canWrite)
  {
    p_writeStartTime = &self->_writeStartTime;
    CMTime time1 = (CMTime)self->_writeStartTime;
    CMTime time2 = kCMTimeZero;
    int32_t v11 = CMTimeCompare(&time1, &time2);
    int32_t v12 = v11;
    if ((AVCaptureAudioDataOutput *)self->_videoDataOutput == v8)
    {
      memset(&time1, 0, sizeof(time1));
      CMSampleBufferGetPresentationTimeStamp(&time1, a4);
      if (!v12)
      {
        long long v13 = *(_OWORD *)&time1.value;
        *(_OWORD *)&p_writeStartTime->value = *(_OWORD *)&time1.value;
        CMTimeEpoch epoch = time1.epoch;
        self->_writeStartTime.CMTimeEpoch epoch = time1.epoch;
        writer = self->_writer;
        *(_OWORD *)&time2.value = v13;
        time2.CMTimeEpoch epoch = epoch;
        [(AVAssetWriter *)writer startSessionAtSourceTime:&time2];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_E908;
        block[3] = &unk_24858;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
      if ([(AVAssetWriterInput *)self->_videoWriterInput isReadyForMoreMediaData]) {
        [(AVAssetWriterInput *)self->_videoWriterInput appendSampleBuffer:a4];
      }
      CMTime time2 = time1;
      *(_OWORD *)&v16.value = *(_OWORD *)&p_writeStartTime->value;
      v16.CMTimeEpoch epoch = self->_writeStartTime.epoch;
      CMTimeSubtract(&time, &time2, &v16);
      if (CMTimeGetSeconds(&time) >= 10.0) {
        [(ETVideoController *)self finishRecording];
      }
    }
    else if (v11 {
           && self->_audioDataOutput == v8
    }
           && [(AVAssetWriterInput *)self->_audioWriterInput isReadyForMoreMediaData])
    {
      [(AVAssetWriterInput *)self->_audioWriterInput appendSampleBuffer:a4];
    }
  }
}

- (void)captureOutput:(id)a3 didFinishProcessingPhotoSampleBuffer:(opaqueCMSampleBuffer *)a4 previewPhotoSampleBuffer:(opaqueCMSampleBuffer *)a5 resolvedSettings:(id)a6 bracketSettings:(id)a7 error:(id)a8
{
  id v14 = (AVCapturePhotoOutput *)a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (self->_photoOutput == v14)
  {
    if (a4)
    {
      v18 = +[AVCapturePhotoOutput JPEGPhotoDataRepresentationForJPEGSampleBuffer:a4 previewPhotoSampleBuffer:a5];
      photoData = self->_photoData;
      self->_photoData = v18;

      id v20 = [objc_alloc((Class)CIImage) initWithCVPixelBuffer:CMSampleBufferGetImageBuffer(a5)];
      id v21 = +[UIImage imageWithCIImage:v20];
      photoImage = self->_photoImage;
      self->_photoImage = v21;

      CMSampleBufferGetPresentationTimeStamp(&v25, a4);
      self->_writeStartTime = ($95D729B680665BEAEFA1D6FCA8238556)v25;
    }
    else if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25.value) = 0;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "didFinishProcessingPhoto called with nil photoSampleBuffer.", (uint8_t *)&v25, 2u);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_EC08;
    block[3] = &unk_24858;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  previewQueue = self->_previewQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_ECB0;
  block[3] = &unk_24858;
  block[4] = self;
  dispatch_async(previewQueue, block);
}

- (void)writePhotoDataWithCompletion:(id)a3
{
  id v4 = a3;
  writerQueue = self->_writerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_EDA8;
  v7[3] = &unk_24A50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(writerQueue, v7);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  writerQueue = self->_writerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_EF34;
  block[3] = &unk_24A78;
  block[4] = self;
  CGSize v6 = a3;
  dispatch_async(writerQueue, block);
}

- (ETVideoControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ETVideoControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)videoState
{
  return self->_videoState;
}

- (AVCaptureDevice)videoDevice
{
  return self->_videoDevice;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)writeStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previewQueue, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_videoDeviceInput, 0);
  objc_storeStrong((id *)&self->_photoData, 0);
  objc_storeStrong((id *)&self->_photoImage, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_fileUUID, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_audioDataOutput, 0);
  objc_storeStrong((id *)&self->_audioWriterInput, 0);
  objc_storeStrong((id *)&self->_videoDataOutput, 0);
  objc_storeStrong((id *)&self->_videoWriterInput, 0);
  objc_storeStrong((id *)&self->_writerQueue, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_audioConnection, 0);

  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end