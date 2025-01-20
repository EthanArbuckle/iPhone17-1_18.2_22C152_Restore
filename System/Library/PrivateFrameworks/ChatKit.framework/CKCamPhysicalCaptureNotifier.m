@interface CKCamPhysicalCaptureNotifier
- (BOOL)isEnabled;
- (BSInvalidatable)_cameraButtonRequest;
- (CKCamPhysicalCaptureNotifier)init;
- (CKCamPhysicalCaptureNotifierDelegate)delegate;
- (int64_t)_volumeDownButtonState;
- (int64_t)_volumeUpButtonState;
- (int64_t)state;
- (void)_handleVolumeDownButtonDownNotification:(id)a3;
- (void)_handleVolumeDownButtonUpNotification:(id)a3;
- (void)_handleVolumeUpButtonDownNotification:(id)a3;
- (void)_handleVolumeUpButtonUpNotification:(id)a3;
- (void)_setState:(int64_t)a3;
- (void)_setVolumeDownButtonState:(int64_t)a3;
- (void)_setVolumeUpButtonState:(int64_t)a3;
- (void)_updateCaptureButtonNotifications;
- (void)_updateStateAndNotifyDelegateIfNeeded;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)set_cameraButtonRequest:(id)a3;
@end

@implementation CKCamPhysicalCaptureNotifier

- (CKCamPhysicalCaptureNotifier)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKCamPhysicalCaptureNotifier;
  v2 = [(CKCamPhysicalCaptureNotifier *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CKCamPhysicalCaptureNotifier *)v2 setEnabled:1];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id WeakRetained = objc_loadWeakRetained(&_CurrentNotifier);
  if (!WeakRetained)
  {
    objc_super v5 = [MEMORY[0x1E4F42738] sharedApplication];
    [v5 setWantsVolumeButtonEvents:0];
  }
  [(BSInvalidatable *)self->__cameraButtonRequest invalidate];
  v6.receiver = self;
  v6.super_class = (Class)CKCamPhysicalCaptureNotifier;
  [(CKCamPhysicalCaptureNotifier *)&v6 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(CKCamPhysicalCaptureNotifier *)self _updateCaptureButtonNotifications];
    if (self->_enabled)
    {
      objc_storeWeak(&_CurrentNotifier, self);
    }
  }
}

- (void)_updateCaptureButtonNotifications
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [MEMORY[0x1E4F42738] sharedApplication];
  if ([(CKCamPhysicalCaptureNotifier *)self isEnabled])
  {
    [v4 setWantsVolumeButtonEvents:1];
    [v3 addObserver:self selector:sel__handleVolumeUpButtonUpNotification_ name:*MEMORY[0x1E4F43F80] object:0];
    [v3 addObserver:self selector:sel__handleVolumeUpButtonDownNotification_ name:*MEMORY[0x1E4F43F78] object:0];
    [v3 addObserver:self selector:sel__handleVolumeDownButtonUpNotification_ name:*MEMORY[0x1E4F43F70] object:0];
    [v3 addObserver:self selector:sel__handleVolumeDownButtonDownNotification_ name:*MEMORY[0x1E4F43F68] object:0];
    [v3 addObserver:self selector:sel__handleVolumeDownButtonUpNotification_ name:@"_UIApplicationCameraShutterButtonUpNotification" object:0];
    [v3 addObserver:self selector:sel__handleVolumeDownButtonDownNotification_ name:@"_UIApplicationCameraShutterButtonDownNotification" object:0];
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    objc_super v5 = (void *)getBKSHIDEventDeferringTokenClass_softClass;
    uint64_t v17 = getBKSHIDEventDeferringTokenClass_softClass;
    if (!getBKSHIDEventDeferringTokenClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getBKSHIDEventDeferringTokenClass_block_invoke;
      v13[3] = &unk_1E5620B90;
      v13[4] = &v14;
      __getBKSHIDEventDeferringTokenClass_block_invoke((uint64_t)v13);
      objc_super v5 = (void *)v15[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v14, 8);
    v7 = [MEMORY[0x1E4F42738] sharedApplication];
    v8 = [v7 keyWindow];
    v9 = objc_msgSend(v6, "tokenForIdentifierOfCAContext:", objc_msgSend(v8, "_contextId"));

    if (v9)
    {
      v10 = [MEMORY[0x1E4FA6AA8] sharedInstance];
      v11 = [v10 deferHIDEventsForButtonKind:7 toToken:v9];
      [(CKCamPhysicalCaptureNotifier *)self set_cameraButtonRequest:v11];
    }
  }
  else
  {
    [v4 setWantsVolumeButtonEvents:0];
    [v3 removeObserver:self name:*MEMORY[0x1E4F43F80] object:0];
    [v3 removeObserver:self name:*MEMORY[0x1E4F43F78] object:0];
    [v3 removeObserver:self name:*MEMORY[0x1E4F43F70] object:0];
    [v3 removeObserver:self name:*MEMORY[0x1E4F43F68] object:0];
    [v3 removeObserver:self name:@"_UIApplicationCameraShutterButtonUpNotification" object:0];
    [v3 removeObserver:self name:@"_UIApplicationCameraShutterButtonDownNotification" object:0];
    v12 = [(CKCamPhysicalCaptureNotifier *)self _cameraButtonRequest];
    [v12 invalidate];

    [(CKCamPhysicalCaptureNotifier *)self set_cameraButtonRequest:0];
    [(CKCamPhysicalCaptureNotifier *)self _setVolumeUpButtonState:0];
    [(CKCamPhysicalCaptureNotifier *)self _setVolumeDownButtonState:0];
  }
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

- (void)_setVolumeUpButtonState:(int64_t)a3
{
  if (self->__volumeUpButtonState != a3)
  {
    int64_t v5 = [(CKCamPhysicalCaptureNotifier *)self _volumeDownButtonState];
    if (a3 != 1 || v5 != 1)
    {
      self->__volumeUpButtonState = a3;
      [(CKCamPhysicalCaptureNotifier *)self _updateStateAndNotifyDelegateIfNeeded];
    }
  }
}

- (void)_setVolumeDownButtonState:(int64_t)a3
{
  if (self->__volumeDownButtonState != a3)
  {
    int64_t v5 = [(CKCamPhysicalCaptureNotifier *)self _volumeUpButtonState];
    if (a3 != 1 || v5 != 1)
    {
      self->__volumeDownButtonState = a3;
      [(CKCamPhysicalCaptureNotifier *)self _updateStateAndNotifyDelegateIfNeeded];
    }
  }
}

- (void)_updateStateAndNotifyDelegateIfNeeded
{
  int64_t v3 = [(CKCamPhysicalCaptureNotifier *)self _volumeUpButtonState];
  int64_t v4 = [(CKCamPhysicalCaptureNotifier *)self _volumeDownButtonState];
  uint64_t v6 = v3 == 1 || v4 == 1;
  if ([(CKCamPhysicalCaptureNotifier *)self state] != v6)
  {
    [(CKCamPhysicalCaptureNotifier *)self _setState:v6];
    id v7 = [(CKCamPhysicalCaptureNotifier *)self delegate];
    [v7 physicalCaptureNotifierDidChangeState:self];
  }
}

- (CKCamPhysicalCaptureNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKCamPhysicalCaptureNotifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)_volumeUpButtonState
{
  return self->__volumeUpButtonState;
}

- (int64_t)_volumeDownButtonState
{
  return self->__volumeDownButtonState;
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

  objc_destroyWeak((id *)&self->_delegate);
}

@end