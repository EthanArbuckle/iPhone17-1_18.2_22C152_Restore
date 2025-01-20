@interface _OSDHxCamera
- (BOOL)_enableMotionDataMetadata:(BOOL)a3 error:(id *)a4;
- (BOOL)_startStreaming:(id *)a3;
- (BOOL)getDeviceAndStreams:(id *)a3;
- (BOOL)isActive;
- (BOOL)isStreaming;
- (BOOL)setFrameRate:(id)a3 error:(id *)a4;
- (BOOL)setMinimumFrameRate:(id)a3 error:(id *)a4;
- (BOOL)startStreamingWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)stopStreaming:(id *)a3;
- (CALayer)previewLayer;
- (OSDCaptureDevice)captureDevice;
- (OSDCaptureStream)captureStream;
- (_CAImageQueue)_imageQueue;
- (_OSDHxCamera)initWithCaptureDevice:(id)a3 cameraSource:(unint64_t)a4 error:(id *)a5;
- (id)_getStreamErrorFor:(__CFString *)a3 error:(id *)a4;
- (id)frameCount;
- (id)frameHandler;
- (id)ispVersion;
- (id)name:(id *)a3;
- (int)_frameCounter;
- (unint64_t)source;
- (unint64_t)streamingOptions;
- (void)_showFrameOnPreviewLayer:(__CVBuffer *)a3;
- (void)doneWithDeviceAndStreams;
- (void)setCaptureDevice:(id)a3;
- (void)setCaptureStream:(id)a3;
- (void)setFrameHandler:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsStreaming:(BOOL)a3;
- (void)setPreviewLayer:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setStreamingOptions:(unint64_t)a3;
- (void)set_frameCounter:(int)a3;
- (void)set_imageQueue:(_CAImageQueue *)a3;
@end

@implementation _OSDHxCamera

- (_OSDHxCamera)initWithCaptureDevice:(id)a3 cameraSource:(unint64_t)a4 error:(id *)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_OSDHxCamera;
  v10 = [(_OSDHxCamera *)&v16 init];
  v11 = v10;
  if (v10)
  {
    if (!v9)
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      +[OSDError setError:a5, @"com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter", 1, @"%@ >> Cannot init with a nil OSDCaptureDevice (%@)!", v14, 0 withDomain withCode format];

      v12 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v10->_captureDevice, a3);
    v11->_source = a4;
  }
  v12 = v11;
LABEL_6:

  return v12;
}

- (BOOL)getDeviceAndStreams:(id *)a3
{
  v5 = [(_OSDHxCamera *)self captureDevice];
  unsigned int v6 = [v5 getDeviceAndStreams:a3];

  if (v6)
  {
    switch([(_OSDHxCamera *)self source])
    {
      case 1uLL:
        v7 = [(_OSDHxCamera *)self captureDevice];
        v8 = v7;
        id v9 = &kFigCapturePortType_BackFacingCamera;
        goto LABEL_9;
      case 2uLL:
        v7 = [(_OSDHxCamera *)self captureDevice];
        v8 = v7;
        id v9 = &kFigCapturePortType_FrontFacingCamera;
        goto LABEL_9;
      case 3uLL:
        v7 = [(_OSDHxCamera *)self captureDevice];
        v8 = v7;
        id v9 = &kFigCapturePortType_BackFacingTelephotoCamera;
        goto LABEL_9;
      case 4uLL:
        v7 = [(_OSDHxCamera *)self captureDevice];
        v8 = v7;
        id v9 = &kFigCapturePortType_BackFacingSuperWideCamera;
        goto LABEL_9;
      case 5uLL:
        v7 = [(_OSDHxCamera *)self captureDevice];
        v8 = v7;
        id v9 = &kFigCapturePortType_FrontFacingSuperWideCamera;
LABEL_9:
        v10 = [v7 captureStreamForPortType:*v9 error:a3];
        [(_OSDHxCamera *)self setCaptureStream:v10];

        break;
      default:
        +[OSDError setError:a3, @"com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter", 1, @"%@ >> Cannot get capture stream for source %lu", self, [(_OSDHxCamera *)self source] withDomain withCode format];
        [(_OSDHxCamera *)self setCaptureStream:0];
        break;
    }
  }
  v11 = [(_OSDHxCamera *)self captureStream];

  if (v11) {
    [(_OSDHxCamera *)self setIsActive:1];
  }
  return v11 != 0;
}

- (void)doneWithDeviceAndStreams
{
  v3 = [(_OSDHxCamera *)self captureDevice];
  [v3 doneWithDeviceAndStreams];

  [(_OSDHxCamera *)self setCaptureStream:0];

  [(_OSDHxCamera *)self setIsActive:0];
}

- (id)ispVersion
{
  v2 = [(_OSDHxCamera *)self captureDevice];
  v3 = [v2 ispVersion];

  return v3;
}

- (id)name:(id *)a3
{
  v4 = [(_OSDHxCamera *)self captureStream];
  v5 = [v4 name:a3];

  return v5;
}

- (id)frameCount
{
  uint64_t v2 = [(_OSDHxCamera *)self _frameCounter];

  return +[NSNumber numberWithInt:v2];
}

- (BOOL)startStreamingWithOptions:(unint64_t)a3 error:(id *)a4
{
  unsigned int v6 = self;
  objc_sync_enter(v6);
  [(_OSDHxCamera *)v6 setStreamingOptions:a3];
  if ((a3 & 1) != 0
    && ![(_OSDHxCamera *)v6 _enableMotionDataMetadata:1 error:a4])
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    unsigned __int8 v7 = [(_OSDHxCamera *)v6 _startStreaming:a4];
  }
  objc_sync_exit(v6);

  return v7;
}

- (BOOL)stopStreaming:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(_OSDHxCamera *)v4 captureStream];
  unsigned int v6 = [v5 stop:a3];

  if (v6) {
    [(_OSDHxCamera *)v4 setIsStreaming:0];
  }
  objc_sync_exit(v4);

  return v6;
}

- (void)setPreviewLayer:(id)a3
{
  v4 = (CALayer *)a3;
  if (v4)
  {
    if (self->_previewLayer == v4) {
      goto LABEL_6;
    }
    unsigned __int8 v7 = v4;
    [(CALayer *)v4 frame];
    [(CALayer *)v7 frame];
    self->__imageQueue = (_CAImageQueue *)CAImageQueueCreate();
    +[CATransaction begin];
    [(CALayer *)v7 setContents:self->__imageQueue];
    +[CATransaction commit];
    v5 = v7;
    previewLayer = self->_previewLayer;
    self->_previewLayer = v5;
  }
  else
  {
    unsigned __int8 v7 = 0;
    CAImageQueueInvalidate();
    CFRelease(self->__imageQueue);
    self->__imageQueue = 0;
    previewLayer = self->_previewLayer;
    self->_previewLayer = 0;
  }

  v4 = v7;
LABEL_6:
}

- (BOOL)setFrameRate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(_OSDHxCamera *)self captureStream];
  unsigned __int8 v8 = [v7 setProperty:kFigCaptureStreamProperty_MinimumFrameRate number:v6 error:a4];

  id v9 = [(_OSDHxCamera *)self captureStream];
  LOBYTE(a4) = [v9 setProperty:kFigCaptureStreamProperty_MaximumFrameRate number:v6 error:a4];

  return v8 & a4;
}

- (BOOL)setMinimumFrameRate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(_OSDHxCamera *)self captureStream];
  LOBYTE(a4) = [v7 setProperty:kFigCaptureStreamProperty_MinimumFrameRate number:v6 error:a4];

  return (char)a4;
}

- (BOOL)_startStreaming:(id *)a3
{
  v5 = [(_OSDHxCamera *)self captureStream];
  unsigned int v6 = [v5 start:a3];

  if (v6)
  {
    [(_OSDHxCamera *)self setIsStreaming:1];
    [(_OSDHxCamera *)self set_frameCounter:0];
  }
  else
  {
    [(_OSDHxCamera *)self setIsStreaming:0];
  }
  return v6;
}

- (void)_showFrameOnPreviewLayer:(__CVBuffer *)a3
{
  CVPixelBufferGetIOSurface(a3);
  [(_OSDHxCamera *)self _imageQueue];
  uint64_t v4 = CAImageQueueRegisterIOSurfaceBuffer();
  [(_OSDHxCamera *)self _imageQueue];
  CAImageQueueCollect();
  v5 = [(_OSDHxCamera *)self _imageQueue];
  v6.n128_f64[0] = CACurrentMediaTime();

  _CAImageQueueInsertImage(v5, 3, v4, 1, 0, 0, v6);
}

- (id)_getStreamErrorFor:(__CFString *)a3 error:(id *)a4
{
  __n128 v6 = [(_OSDHxCamera *)self captureStream];
  id v7 = [v6 copyProperty:kFigCaptureStreamProperty_ErrorCounters error:a4];

  if (v7)
  {
    unsigned __int8 v8 = [v7 objectForKeyedSubscript:a3];
    id v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 intValue]);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)_enableMotionDataMetadata:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  __n128 v6 = [(_OSDHxCamera *)self captureStream];
  unsigned int v7 = [v6 setProperty:kFigCaptureStreamProperty_MotionDataFromISPEnabled BOOLean:v5 error:a4];

  if (v7)
  {
    double v8 = 1.0;
    if (!a4) {
      double v8 = 4.5;
    }
    +[NSThread sleepForTimeInterval:v8];
  }
  return v7;
}

- (CALayer)previewLayer
{
  return self->_previewLayer;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (OSDCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (void)setCaptureDevice:(id)a3
{
}

- (OSDCaptureStream)captureStream
{
  return self->_captureStream;
}

- (void)setCaptureStream:(id)a3
{
}

- (id)frameHandler
{
  return self->_frameHandler;
}

- (void)setFrameHandler:(id)a3
{
}

- (unint64_t)streamingOptions
{
  return self->_streamingOptions;
}

- (void)setStreamingOptions:(unint64_t)a3
{
  self->_streamingOptions = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isStreaming
{
  return self->_isStreaming;
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (int)_frameCounter
{
  return self->__frameCounter;
}

- (void)set_frameCounter:(int)a3
{
  self->__frameCounter = a3;
}

- (_CAImageQueue)_imageQueue
{
  return self->__imageQueue;
}

- (void)set_imageQueue:(_CAImageQueue *)a3
{
  self->__imageQueue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameHandler, 0);
  objc_storeStrong((id *)&self->_captureStream, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_previewLayer, 0);
}

@end