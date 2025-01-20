@interface CAMPhysicalCaptureNotifier
- (BOOL)includesVolumeButtons;
- (BOOL)isEnabled;
- (BSInvalidatable)_cameraButtonRequest;
- (CAMPhysicalCaptureNotifier)initWithView:(id)a3 includeVolumeButtons:(BOOL)a4;
- (CAMPhysicalCaptureNotifierDelegate)delegate;
- (UIView)_view;
- (int64_t)cameraCaseButtonState;
- (int64_t)state;
- (int64_t)volumeDownButtonState;
- (int64_t)volumeUpButtonState;
- (void)_handleCameraCaseButtonDownNotification:(id)a3;
- (void)_handleCameraCaseButtonUpNotification:(id)a3;
- (void)_handleVolumeDownButtonDownNotification:(id)a3;
- (void)_handleVolumeDownButtonUpNotification:(id)a3;
- (void)_handleVolumeUpButtonDownNotification:(id)a3;
- (void)_handleVolumeUpButtonUpNotification:(id)a3;
- (void)_setCameraCaseButtonState:(int64_t)a3;
- (void)_setCameraCaseShutterState:(int64_t)a3;
- (void)_setState:(int64_t)a3;
- (void)_setVolumeDownButtonState:(int64_t)a3;
- (void)_setVolumeUpButtonState:(int64_t)a3;
- (void)_updateCaptureButtonNotifications;
- (void)_updateStateAndNotifyDelegateIfNeededForButton:(int64_t)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)set_cameraButtonRequest:(id)a3;
@end

@implementation CAMPhysicalCaptureNotifier

- (CAMPhysicalCaptureNotifier)initWithView:(id)a3 includeVolumeButtons:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMPhysicalCaptureNotifier;
  v8 = [(CAMPhysicalCaptureNotifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->__view, a3);
    v9->_includesVolumeButtons = a4;
    [(CAMPhysicalCaptureNotifier *)v9 setEnabled:1];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(BSInvalidatable *)self->__cameraButtonRequest invalidate];
  v4.receiver = self;
  v4.super_class = (Class)CAMPhysicalCaptureNotifier;
  [(CAMPhysicalCaptureNotifier *)&v4 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(CAMPhysicalCaptureNotifier *)self _updateCaptureButtonNotifications];
  }
}

- (void)_updateCaptureButtonNotifications
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 _view];
  objc_super v4 = [v3 window];
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Unable to generate a valid BKSHIDEventDeferringToken from a view's window (%{public}@), not deferring camera case events for SBSHardwareButtonService", (uint8_t *)&v5, 0xCu);
}

- (void)_handleVolumeUpButtonUpNotification:(id)a3
{
}

- (void)_handleVolumeUpButtonDownNotification:(id)a3
{
}

- (void)_handleVolumeDownButtonUpNotification:(id)a3
{
}

- (void)_handleVolumeDownButtonDownNotification:(id)a3
{
}

- (void)_handleCameraCaseButtonUpNotification:(id)a3
{
}

- (void)_handleCameraCaseButtonDownNotification:(id)a3
{
}

- (void)_setVolumeUpButtonState:(int64_t)a3
{
  if (self->_volumeUpButtonState != a3)
  {
    self->_volumeUpButtonState = a3;
    [(CAMPhysicalCaptureNotifier *)self _updateStateAndNotifyDelegateIfNeededForButton:1];
  }
}

- (void)_setVolumeDownButtonState:(int64_t)a3
{
  if (self->_volumeDownButtonState != a3)
  {
    self->_volumeDownButtonState = a3;
    [(CAMPhysicalCaptureNotifier *)self _updateStateAndNotifyDelegateIfNeededForButton:2];
  }
}

- (void)_setCameraCaseShutterState:(int64_t)a3
{
  if (self->_cameraCaseButtonState != a3)
  {
    self->_cameraCaseButtonState = a3;
    [(CAMPhysicalCaptureNotifier *)self _updateStateAndNotifyDelegateIfNeededForButton:4];
  }
}

- (void)_updateStateAndNotifyDelegateIfNeededForButton:(int64_t)a3
{
  id v5 = [(CAMPhysicalCaptureNotifier *)self delegate];
  [v5 physicalCaptureNotifierDidChangeState:self forButton:a3];
}

- (CAMPhysicalCaptureNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMPhysicalCaptureNotifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)volumeUpButtonState
{
  return self->_volumeUpButtonState;
}

- (int64_t)volumeDownButtonState
{
  return self->_volumeDownButtonState;
}

- (int64_t)cameraCaseButtonState
{
  return self->_cameraCaseButtonState;
}

- (void)_setCameraCaseButtonState:(int64_t)a3
{
  self->_cameraCaseButtonState = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)includesVolumeButtons
{
  return self->_includesVolumeButtons;
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (UIView)_view
{
  return self->__view;
}

- (BSInvalidatable)_cameraButtonRequest
{
  return self->__cameraButtonRequest;
}

- (void)set_cameraButtonRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cameraButtonRequest, 0);
  objc_storeStrong((id *)&self->__view, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end