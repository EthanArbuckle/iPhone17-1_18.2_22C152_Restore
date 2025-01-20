@interface CCCameraConnectionInternal
- (CCCameraConnection)parent;
- (void)setParent:(id)a3;
- (void)takePhotoWithCountdown:(unint64_t)a3;
- (void)xpc_beginBurstCaptureWithReply:(id)a3;
- (void)xpc_cancelCountdown;
- (void)xpc_endBurstCaptureWithReply:(id)a3;
- (void)xpc_ensureSwitchedToOneOfSupportedCaptureModes:(id)a3 reply:(id)a4;
- (void)xpc_fetchCurrentStateIncludingSupportedCaptureModes:(BOOL)a3 reply:(id)a4;
- (void)xpc_pauseCaptureWithReply:(id)a3;
- (void)xpc_resumeCaptureWithReply:(id)a3;
- (void)xpc_setCaptureDevice:(int64_t)a3 reply:(id)a4;
- (void)xpc_setCaptureMode:(int64_t)a3 reply:(id)a4;
- (void)xpc_setFlashMode:(int64_t)a3;
- (void)xpc_setFocusPoint:(id)a3;
- (void)xpc_setHDRMode:(int64_t)a3;
- (void)xpc_setIrisMode:(int64_t)a3;
- (void)xpc_setPreviewEndpoint:(id)a3;
- (void)xpc_setSharedLibraryMode:(int64_t)a3;
- (void)xpc_setZoom:(float)a3 reply:(id)a4;
- (void)xpc_setZoomMagnification:(float)a3 reply:(id)a4;
- (void)xpc_startCaptureWithMode:(int64_t)a3 reply:(id)a4;
- (void)xpc_stopCaptureWithReply:(id)a3;
- (void)xpc_suspend;
- (void)xpc_toggleCameraDevice;
@end

@implementation CCCameraConnectionInternal

- (void)setParent:(id)a3
{
}

- (void)xpc_ensureSwitchedToOneOfSupportedCaptureModes:(id)a3 reply:(id)a4
{
  p_parent = &self->_parent;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_ensureSwitchedToOneOfSupportedCaptureModes:reply:", v7, v6);
}

- (void)takePhotoWithCountdown:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained takePhotoWithCountdown:a3];
}

- (void)xpc_beginBurstCaptureWithReply:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_beginBurstCaptureWithReply:", v4);
}

- (void)xpc_endBurstCaptureWithReply:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_endBurstCaptureWithReply:", v4);
}

- (void)xpc_setCaptureDevice:(int64_t)a3 reply:(id)a4
{
  p_parent = &self->_parent;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_setCaptureDevice:reply:", a3, v6);
}

- (void)xpc_setCaptureMode:(int64_t)a3 reply:(id)a4
{
  p_parent = &self->_parent;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_setCaptureMode:reply:", a3, v6);
}

- (void)xpc_startCaptureWithMode:(int64_t)a3 reply:(id)a4
{
  p_parent = &self->_parent;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_startCaptureWithMode:reply:", a3, v6);
}

- (void)xpc_pauseCaptureWithReply:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_pauseCaptureWithReply:", v4);
}

- (void)xpc_resumeCaptureWithReply:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_resumeCaptureWithReply:", v4);
}

- (void)xpc_stopCaptureWithReply:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_stopCaptureWithReply:", v4);
}

- (void)xpc_suspend
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "xpc_suspend");
}

- (void)xpc_setPreviewEndpoint:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_setPreviewEndpoint:", v4);
}

- (void)xpc_setFocusPoint:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_setFocusPoint:", v4);
}

- (void)xpc_fetchCurrentStateIncludingSupportedCaptureModes:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  p_parent = &self->_parent;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "xpc_fetchCurrentStateIncludingSupportedCaptureModes:reply:", v4, v6);
}

- (void)xpc_cancelCountdown
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "xpc_cancelCountdown");
}

- (void)xpc_setZoom:(float)a3 reply:(id)a4
{
  p_parent = &self->_parent;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  *(float *)&double v7 = a3;
  objc_msgSend(WeakRetained, "xpc_setZoom:reply:", v6, v7);
}

- (void)xpc_setZoomMagnification:(float)a3 reply:(id)a4
{
  p_parent = &self->_parent;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  *(float *)&double v7 = a3;
  objc_msgSend(WeakRetained, "xpc_setZoomMagnification:reply:", v6, v7);
}

- (void)xpc_setFlashMode:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "xpc_setFlashMode:", a3);
}

- (void)xpc_setHDRMode:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "xpc_setHDRMode:", a3);
}

- (void)xpc_setIrisMode:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "xpc_setIrisMode:", a3);
}

- (void)xpc_setSharedLibraryMode:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "xpc_setSharedLibraryMode:", a3);
}

- (void)xpc_toggleCameraDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "xpc_toggleCameraDevice");
}

- (CCCameraConnection)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (CCCameraConnection *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end