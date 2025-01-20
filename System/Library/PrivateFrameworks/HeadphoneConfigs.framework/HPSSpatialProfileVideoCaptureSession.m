@interface HPSSpatialProfileVideoCaptureSession
- (AVCaptureVideoPreviewLayer)previewLayer;
- (BKUIVideoCaptureSesssionDelegate)delegate;
- (HPSSpatialProfileVideoCaptureSession)init;
- (double)additionalPreviewScalingAllowedByCameraFormat;
- (id)_frontCamera;
- (void)setDelegate:(id)a3;
- (void)setPreviewLayer:(id)a3;
@end

@implementation HPSSpatialProfileVideoCaptureSession

- (HPSSpatialProfileVideoCaptureSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)HPSSpatialProfileVideoCaptureSession;
  v2 = [(HPSSpatialProfileVideoCaptureSession *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.biometrickitui.AirPodPearlVideoCaptureSessionQueue", v3);
    captureQueue = v2->_captureQueue;
    v2->_captureQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (double)additionalPreviewScalingAllowedByCameraFormat
{
  return 1.0;
}

- (id)_frontCamera
{
  v8[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_captureQueue);
  v2 = (void *)MEMORY[0x1E4F16448];
  v8[0] = *MEMORY[0x1E4F15830];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  dispatch_queue_t v4 = [v2 discoverySessionWithDeviceTypes:v3 mediaType:*MEMORY[0x1E4F15C18] position:2];

  v5 = [v4 devices];
  v6 = [v5 firstObject];

  return v6;
}

- (BKUIVideoCaptureSesssionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKUIVideoCaptureSesssionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void)setPreviewLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_deviceInput, 0);

  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end