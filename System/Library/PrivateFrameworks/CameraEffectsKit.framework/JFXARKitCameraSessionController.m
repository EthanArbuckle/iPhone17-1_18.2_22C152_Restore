@interface JFXARKitCameraSessionController
- (ARDeviceOrientationSensor)orientationSensor;
- (ARFaceTrackingConfiguration)faceTrackingConfiguration;
- (ARMotionSensor)motionSensor;
- (ARSession)arSession;
- (AVCaptureDevice)underlyingAVCaptureDevice;
- (AVCaptureSession)underlyingAVCaptureSession;
- (BOOL)JT_setupARSession:(id *)a3;
- (BOOL)running;
- (CMMotionManager)motionManager;
- (JFXARKitCameraSessionController)initWithAVCaptureSession:(id)a3 captureDevice:(id)a4 arSessionDelegateQueue:(id)a5;
- (JFXARKitFrameDelegate)frameDelegate;
- (JFXCustomImageSensor)customImageSensor;
- (OS_dispatch_queue)arSessionDelegateQueue;
- (void)dealloc;
- (void)processExternalSensorData:(id)a3;
- (void)provideSensorFrameSet:(id)a3 trackedFacesMetadata:(id)a4 faceObjectsMetadata:(id)a5;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)setArSession:(id)a3;
- (void)setArSessionDelegateQueue:(id)a3;
- (void)setCustomImageSensor:(id)a3;
- (void)setFaceTrackingConfiguration:(id)a3;
- (void)setFrameDelegate:(id)a3;
- (void)setMotionManager:(id)a3;
- (void)setMotionSensor:(id)a3;
- (void)setOrientationSensor:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setUnderlyingAVCaptureDevice:(id)a3;
- (void)setUnderlyingAVCaptureSession:(id)a3;
- (void)startARSession;
- (void)stopARSession;
@end

@implementation JFXARKitCameraSessionController

- (JFXARKitCameraSessionController)initWithAVCaptureSession:(id)a3 captureDevice:(id)a4 arSessionDelegateQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)JFXARKitCameraSessionController;
  v10 = [(JFXARKitCameraSessionController *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(JFXARKitCameraSessionController *)v10 setUnderlyingAVCaptureSession:v8];
    [(JFXARKitCameraSessionController *)v11 setUnderlyingAVCaptureDevice:v9];
    v11->_running = 0;
    v11->_arSessionDelegateQueue = (OS_dispatch_queue *)a5;
  }

  return v11;
}

- (void)dealloc
{
  [(ARSession *)self->_arSession pause];
  [(ARSession *)self->_arSession setDelegate:0];
  [(ARSession *)self->_arSession setDelegateQueue:0];
  arSession = self->_arSession;
  self->_arSession = 0;

  v4.receiver = self;
  v4.super_class = (Class)JFXARKitCameraSessionController;
  [(JFXARKitCameraSessionController *)&v4 dealloc];
}

- (void)startARSession
{
  if (![(JFXARKitCameraSessionController *)self running])
  {
    uint64_t v5 = 0;
    if (![(JFXARKitCameraSessionController *)self JT_setupARSession:&v5] || v5)
    {
      [(JFXARKitCameraSessionController *)self stopARSession];
    }
    else
    {
      v3 = [(JFXARKitCameraSessionController *)self arSession];
      objc_super v4 = [(JFXARKitCameraSessionController *)self faceTrackingConfiguration];
      [v3 runWithConfiguration:v4 options:1];

      [(JFXARKitCameraSessionController *)self setRunning:1];
    }
  }
}

- (void)stopARSession
{
  v3 = [(JFXARKitCameraSessionController *)self arSession];
  [v3 pause];

  [(JFXARKitCameraSessionController *)self setRunning:0];
}

- (void)provideSensorFrameSet:(id)a3 trackedFacesMetadata:(id)a4 faceObjectsMetadata:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = [(JFXARKitCameraSessionController *)self customImageSensor];
  v11 = [(JFXARKitCameraSessionController *)self underlyingAVCaptureDevice];
  v12 = [(JFXARKitCameraSessionController *)self underlyingAVCaptureSession];
  [v13 createImageDataFromFrameSet:v10 captureDevice:v11 captureSession:v12 trackedFacesMetadata:v9 faceObjectsMetadata:v8];
}

- (void)processExternalSensorData:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  CMTimeMakeWithSeconds(&v7, v5, 1000000000);
  CMTime time = v7;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  v6 = [(JFXARKitCameraSessionController *)self customImageSensor];
  [v6 outputSensorData:v4];
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5 = a4;
  id v6 = [(JFXARKitCameraSessionController *)self frameDelegate];
  [v6 didUpdateFrame:v5];
}

- (BOOL)JT_setupARSession:(id *)a3
{
  v30[3] = *MEMORY[0x263EF8340];
  char v5 = [MEMORY[0x263EF8F50] isSupported];
  if (v5)
  {
    id v6 = objc_opt_new();
    [(JFXARKitCameraSessionController *)self setArSession:v6];

    CMTime v7 = [(JFXARKitCameraSessionController *)self arSession];
    [v7 setDelegate:self];

    id v8 = [(JFXARKitCameraSessionController *)self arSessionDelegateQueue];
    id v9 = [(JFXARKitCameraSessionController *)self arSession];
    [v9 setDelegateQueue:v8];

    id v10 = objc_opt_new();
    [(JFXARKitCameraSessionController *)self setMotionManager:v10];

    v11 = objc_alloc_init(JFXCustomImageSensor);
    [(JFXARKitCameraSessionController *)self setCustomImageSensor:v11];

    id v12 = objc_alloc(MEMORY[0x263EF8F98]);
    id v13 = [(JFXARKitCameraSessionController *)self motionManager];
    v14 = (void *)[v12 initWithMotionManager:v13];
    [(JFXARKitCameraSessionController *)self setMotionSensor:v14];

    id v15 = objc_alloc(MEMORY[0x263EF8F28]);
    uint64_t v16 = [(JFXARKitCameraSessionController *)self motionManager];
    v17 = (void *)[v15 initWithMotionManager:v16 alignment:2];
    [(JFXARKitCameraSessionController *)self setOrientationSensor:v17];

    id v18 = objc_alloc_init(MEMORY[0x263EF8F50]);
    [(JFXARKitCameraSessionController *)self setFaceTrackingConfiguration:v18];

    v19 = [(JFXARKitCameraSessionController *)self faceTrackingConfiguration];
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if (v16)
    {
      v20 = [(JFXARKitCameraSessionController *)self faceTrackingConfiguration];
      [v20 setDisableRenderSyncScheduling:1];
    }
    v21 = [(JFXARKitCameraSessionController *)self motionSensor];
    v22 = [(JFXARKitCameraSessionController *)self orientationSensor];
    v30[1] = v22;
    v23 = [(JFXARKitCameraSessionController *)self customImageSensor];
    v30[2] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
    v25 = [(JFXARKitCameraSessionController *)self faceTrackingConfiguration];
    [v25 setCustomSensors:v24];

    v26 = [(JFXARKitCameraSessionController *)self faceTrackingConfiguration];
    [v26 setLightEstimationEnabled:0];

    v27 = [(JFXARKitCameraSessionController *)self faceTrackingConfiguration];
    [v27 setWorldAlignment:2];

    if ([MEMORY[0x263EF8F50] supportsFrameSemantics:1])
    {
      v28 = [(JFXARKitCameraSessionController *)self faceTrackingConfiguration];
      objc_msgSend(v28, "setFrameSemantics:", objc_msgSend(v28, "frameSemantics") | 1);
    }
  }
  else if (*a3)
  {
    *a3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EF8ED0] code:100 userInfo:0];
  }
  return v5;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (JFXARKitFrameDelegate)frameDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_frameDelegate);
  return (JFXARKitFrameDelegate *)WeakRetained;
}

- (void)setFrameDelegate:(id)a3
{
}

- (ARSession)arSession
{
  return self->_arSession;
}

- (void)setArSession:(id)a3
{
}

- (ARFaceTrackingConfiguration)faceTrackingConfiguration
{
  return self->_faceTrackingConfiguration;
}

- (void)setFaceTrackingConfiguration:(id)a3
{
}

- (JFXCustomImageSensor)customImageSensor
{
  return self->_customImageSensor;
}

- (void)setCustomImageSensor:(id)a3
{
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
}

- (ARMotionSensor)motionSensor
{
  return self->_motionSensor;
}

- (void)setMotionSensor:(id)a3
{
}

- (ARDeviceOrientationSensor)orientationSensor
{
  return self->_orientationSensor;
}

- (void)setOrientationSensor:(id)a3
{
}

- (AVCaptureSession)underlyingAVCaptureSession
{
  return self->_underlyingAVCaptureSession;
}

- (void)setUnderlyingAVCaptureSession:(id)a3
{
}

- (AVCaptureDevice)underlyingAVCaptureDevice
{
  return self->_underlyingAVCaptureDevice;
}

- (void)setUnderlyingAVCaptureDevice:(id)a3
{
}

- (OS_dispatch_queue)arSessionDelegateQueue
{
  return self->_arSessionDelegateQueue;
}

- (void)setArSessionDelegateQueue:(id)a3
{
  self->_arSessionDelegateQueue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAVCaptureDevice, 0);
  objc_storeStrong((id *)&self->_underlyingAVCaptureSession, 0);
  objc_storeStrong((id *)&self->_orientationSensor, 0);
  objc_storeStrong((id *)&self->_motionSensor, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_customImageSensor, 0);
  objc_storeStrong((id *)&self->_faceTrackingConfiguration, 0);
  objc_storeStrong((id *)&self->_arSession, 0);
  objc_destroyWeak((id *)&self->_frameDelegate);
}

@end