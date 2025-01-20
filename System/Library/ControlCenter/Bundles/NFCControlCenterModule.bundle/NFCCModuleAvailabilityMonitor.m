@interface NFCCModuleAvailabilityMonitor
- (BOOL)_isModuleAvailable;
- (NFCCModuleAvailabilityMonitor)initWithDelegate:(id)a3 readerConnection:(id)a4;
- (void)_checkHardwareSupport;
- (void)_startMonitoringCamera;
- (void)_stopCheckingHardwareSupport;
- (void)_stopMonitoringCamera;
- (void)_updateAvailable;
- (void)controlCenterDidDisappear;
- (void)controlCenterWillAppear;
- (void)isCameraCapturingDidChange:(BOOL)a3;
@end

@implementation NFCCModuleAvailabilityMonitor

- (NFCCModuleAvailabilityMonitor)initWithDelegate:(id)a3 readerConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NFCCModuleAvailabilityMonitor;
  v8 = [(NFCCModuleAvailabilityMonitor *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_readerConnection, a4);
    v9->_available = 0;
    v10 = v9;
  }

  return v9;
}

- (void)controlCenterWillAppear
{
  if (!self->_controlCenterVisible)
  {
    self->_controlCenterVisible = 1;
    [(NFCCModuleAvailabilityMonitor *)self _checkHardwareSupport];
    [(NFCCModuleAvailabilityMonitor *)self _startMonitoringCamera];
  }
}

- (void)controlCenterDidDisappear
{
  self->_controlCenterVisible = 0;
  [(NFCCModuleAvailabilityMonitor *)self _stopCheckingHardwareSupport];

  [(NFCCModuleAvailabilityMonitor *)self _stopMonitoringCamera];
}

- (BOOL)_isModuleAvailable
{
  return self->_hardwareSupported && !self->_cameraCapturing;
}

- (void)_updateAvailable
{
  BOOL v3 = [(NFCCModuleAvailabilityMonitor *)self _isModuleAvailable];
  if (v3 == !self->_available)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained moduleAvailabilityDidChange:v3];
  }
  self->_available = v3;
}

- (void)_checkHardwareSupport
{
  [(NFCCModuleAvailabilityMonitor *)self _stopCheckingHardwareSupport];
  objc_initWeak(&location, self);
  readerConnection = self->_readerConnection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_59BC;
  v4[3] = &unk_C4B0;
  objc_copyWeak(&v5, &location);
  [(BCSNFCReaderConnection *)readerConnection checkHardwareSupportStateWithCompletionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stopCheckingHardwareSupport
{
  [(NSTimer *)self->_hardwareSupportRetryTimer invalidate];
  hardwareSupportRetryTimer = self->_hardwareSupportRetryTimer;
  self->_hardwareSupportRetryTimer = 0;
}

- (void)_startMonitoringCamera
{
  [(NFCCModuleAvailabilityMonitor *)self _stopMonitoringCamera];
  BOOL v3 = objc_alloc_init(NFCCCameraMonitor);
  cameraMonitor = self->_cameraMonitor;
  self->_cameraMonitor = v3;

  id v5 = self->_cameraMonitor;

  [(NFCCCameraMonitor *)v5 setDelegate:self];
}

- (void)_stopMonitoringCamera
{
  [(NFCCCameraMonitor *)self->_cameraMonitor setDelegate:0];
  cameraMonitor = self->_cameraMonitor;
  self->_cameraMonitor = 0;
}

- (void)isCameraCapturingDidChange:(BOOL)a3
{
  self->_cameraCapturing = a3;
  [(NFCCModuleAvailabilityMonitor *)self _updateAvailable];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraMonitor, 0);
  objc_storeStrong((id *)&self->_hardwareSupportRetryTimer, 0);
  objc_storeStrong((id *)&self->_readerConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end