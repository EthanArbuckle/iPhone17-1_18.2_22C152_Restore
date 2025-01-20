@interface AVCaptureControl
- (AVCaptureControlsOverlay)overlay;
- (AVCaptureDevice)device;
- (AVCaptureSession)session;
- (BOOL)isEnabled;
- (CAMAbstractOverlayServiceControl)overlayControl;
- (NSString)identifier;
- (OS_dispatch_queue)actionQueue;
- (id)_enabledUpdateWithEnabled:(BOOL)a3;
- (id)enabledUpdate;
- (id)initSubclass;
- (id)overlayUpdate;
- (void)dealloc;
- (void)enqueueActionWithUpdate:(id)a3;
- (void)overlayVisibilityDidChange:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOverlay:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation AVCaptureControl

- (id)initSubclass
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureControl;
  v2 = [(AVCaptureControl *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v2->_identifier = (NSString *)AVIdentifierForObject((uint64_t)v2);
    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureControl;
  [(AVCaptureControl *)&v3 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL enabled = self->_enabled;
  self->_BOOL enabled = v3;
  os_unfair_lock_unlock(p_lock);
  if (enabled != v3)
  {
    id v7 = [(AVCaptureControl *)self _enabledUpdateWithEnabled:v3];
    if (v7)
    {
      id v8 = v7;
      v9 = [(AVCaptureControl *)self overlay];
      [(AVCaptureControlsOverlay *)v9 updateControl:v8];
    }
  }
}

- (OS_dispatch_queue)actionQueue
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v2);
  }
  NSLog(&cfstr_SuppressingExc.isa, v2);
  return 0;
}

- (AVCaptureControlsOverlay)overlay
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (AVCaptureControlsOverlay *)(id)[(AVWeakReference *)self->_overlayReference referencedObject];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOverlay:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  self->_overlayReference = 0;
  if (a3) {
    self->_overlayReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:a3];
  }

  os_unfair_lock_unlock(p_lock);
}

- (AVCaptureSession)session
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (AVCaptureSession *)(id)[(AVWeakReference *)self->_sessionReference referencedObject];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSession:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  self->_sessionReference = 0;
  if (a3) {
    self->_sessionReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:a3];
  }

  os_unfair_lock_unlock(p_lock);
}

- (AVCaptureDevice)device
{
  return 0;
}

- (CAMAbstractOverlayServiceControl)overlayControl
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v2);
  }
  NSLog(&cfstr_SuppressingExc.isa, v2);
  return 0;
}

- (id)overlayUpdate
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v2);
  }
  NSLog(&cfstr_SuppressingExc.isa, v2);
  return 0;
}

- (id)enabledUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL enabled = self->_enabled;
  os_unfair_lock_unlock(p_lock);

  return [(AVCaptureControl *)self _enabledUpdateWithEnabled:enabled];
}

- (id)_enabledUpdateWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVCaptureControl *)self overlayControl];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  objc_super v5 = [(AVCaptureControl *)self overlayControl];

  return (id)[(CAMAbstractOverlayServiceControl *)v5 updateWithEnabled:v3];
}

- (void)enqueueActionWithUpdate:(id)a3
{
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v3);
  }
  NSLog(&cfstr_SuppressingExc.isa, v3);
}

- (void)overlayVisibilityDidChange:(BOOL)a3
{
  if (a3) {
    [(AVCaptureControl *)self removeObservers];
  }
  else {
    [(AVCaptureControl *)self installObservers];
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

@end