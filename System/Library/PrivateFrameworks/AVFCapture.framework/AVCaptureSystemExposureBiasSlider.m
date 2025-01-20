@interface AVCaptureSystemExposureBiasSlider
- (AVCaptureSystemExposureBiasSlider)initWithDevice:(id)a3;
- (AVCaptureSystemExposureBiasSlider)initWithDevice:(id)a3 action:(id)a4;
- (id)actionQueue;
- (id)description;
- (id)device;
- (id)overlayControl;
- (id)overlayUpdate;
- (void)dealloc;
- (void)enqueueActionWithUpdate:(id)a3;
- (void)installObservers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObservers;
@end

@implementation AVCaptureSystemExposureBiasSlider

- (AVCaptureSystemExposureBiasSlider)initWithDevice:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVCaptureSystemExposureBiasSlider;
  v4 = [(AVCaptureControl *)&v9 initSubclass];
  if (v4)
  {
    [a3 minExposureTargetBias];
    if (v5 == 0.0 || ([a3 maxExposureTargetBias], v6 == 0.0))
    {
      v7 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, objc_msgSend(a3, "localizedName"));

      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v7);
      }
      NSLog(&cfstr_SuppressingExc.isa, v7);
      return 0;
    }
    else
    {
      v4->_device = (AVCaptureDevice *)a3;
      v4->_actionLock._os_unfair_lock_opaque = 0;
      v4->_changeExposureBiasInProcess = 1;
    }
  }
  return v4;
}

- (AVCaptureSystemExposureBiasSlider)initWithDevice:(id)a3 action:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AVCaptureSystemExposureBiasSlider;
  float v6 = [(AVCaptureControl *)&v11 initSubclass];
  if (v6)
  {
    [a3 minExposureTargetBias];
    if (v7 == 0.0 || ([a3 maxExposureTargetBias], v8 == 0.0))
    {
      objc_super v9 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, objc_msgSend(a3, "localizedName"));

      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v9);
      }
      NSLog(&cfstr_SuppressingExc.isa, v9);
      return 0;
    }
    else
    {
      v6->_device = (AVCaptureDevice *)a3;
      v6->_action = (id)[a4 copy];
      v6->_actionLock._os_unfair_lock_opaque = 0;
      v6->_changeExposureBiasInProcess = 1;
    }
  }
  return v6;
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemExposureBiasSlider;
  [(AVCaptureControl *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p [%@]>", NSStringFromClass(v4), self, -[AVCaptureDevice localizedName](self->_device, "localizedName")];
}

- (id)overlayControl
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl) {
    self->_overlayControl = (CAMOverlayServiceSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E4F57DD8]), "initWithIdentifier:sliderType:captureUniqueID:", -[AVCaptureControl identifier](self, "identifier"), 1, -[AVCaptureDevice uniqueID](self->_device, "uniqueID"));
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  id v3 = [(AVCaptureSystemExposureBiasSlider *)self overlayControl];
  [(AVCaptureDevice *)self->_device exposureTargetBias];

  return (id)objc_msgSend(v3, "updateWithFloatValue:");
}

- (id)device
{
  v2 = self->_device;

  return v2;
}

- (void)enqueueActionWithUpdate:(id)a3
{
  [a3 floatValue];
  float v5 = v4;
  [(AVCaptureDevice *)self->_device minExposureTargetBias];
  if (v5 >= v6)
  {
    [(AVCaptureDevice *)self->_device maxExposureTargetBias];
    if (v5 <= v7)
    {
      if (self->_changeExposureBiasInProcess)
      {
        [(AVCaptureDevice *)self->_device lockForConfiguration:0];
        *(float *)&double v8 = v5;
        [(AVCaptureDevice *)self->_device setExposureTargetBias:0 completionHandler:v8];
        [(AVCaptureDevice *)self->_device unlockForConfiguration];
      }
      if (self->_action)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __61__AVCaptureSystemExposureBiasSlider_enqueueActionWithUpdate___block_invoke;
        v9[3] = &unk_1E5A74370;
        v9[4] = self;
        float v10 = v5;
        dispatch_async(MEMORY[0x1E4F14428], v9);
      }
    }
  }
}

uint64_t __61__AVCaptureSystemExposureBiasSlider_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, float))(*(void *)(*(void *)(a1 + 32) + 48) + 16))(*(void *)(*(void *)(a1 + 32) + 48), *(float *)(a1 + 40));
}

- (id)actionQueue
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  id v3 = MEMORY[0x1E4F14428];
  os_unfair_lock_unlock(p_actionLock);
  return v3;
}

- (void)installObservers
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  BOOL observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (!observing) {
    [(AVCaptureDevice *)self->_device addObserver:self forKeyPath:@"exposureTargetBias" options:5 context:0];
  }
  os_unfair_lock_lock(p_actionLock);
  self->_BOOL observing = 1;

  os_unfair_lock_unlock(p_actionLock);
}

- (void)removeObservers
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  BOOL observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if (observing) {
    [(AVCaptureDevice *)self->_device removeObserver:self forKeyPath:@"exposureTargetBias"];
  }
  os_unfair_lock_lock(p_actionLock);
  self->_BOOL observing = 0;

  os_unfair_lock_unlock(p_actionLock);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  BOOL observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if ([a3 isEqualToString:@"exposureTargetBias"] && self->_device == a4)
  {
    v12 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if (observing && v12 != 0)
    {
      overlayControl = self->_overlayControl;
      [v12 floatValue];
      uint64_t v15 = -[CAMOverlayServiceSlider updateWithFloatValue:](overlayControl, "updateWithFloatValue:");
      v16 = [(AVCaptureControl *)self overlay];
      [(AVCaptureControlsOverlay *)v16 updateControl:v15];
    }
  }
}

@end