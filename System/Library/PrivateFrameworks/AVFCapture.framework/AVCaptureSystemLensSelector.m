@interface AVCaptureSystemLensSelector
+ (void)initialize;
- (AVCaptureSystemLensSelector)initWithDevice:(id)a3;
- (BOOL)changesVideoZoomFactor;
- (NSDictionary)displayValuesByZoomFactorValue;
- (id)_initWithDevice:(id)a3 action:(id)a4;
- (id)_overlayUpdateWithVideoZoomFactor:(double)a3;
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
- (void)setChangesVideoZoomFactor:(BOOL)a3;
- (void)setDisplayValuesByZoomFactorValue:(id)a3;
@end

@implementation AVCaptureSystemLensSelector

+ (void)initialize
{
}

- (AVCaptureSystemLensSelector)initWithDevice:(id)a3
{
  return (AVCaptureSystemLensSelector *)[(AVCaptureSystemLensSelector *)self _initWithDevice:a3 action:0];
}

- (id)_initWithDevice:(id)a3 action:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVCaptureSystemLensSelector;
  v6 = [(AVCaptureControl *)&v9 initSubclass];
  if (v6)
  {
    if ([a3 hasMediaType:*MEMORY[0x1E4F47C68]])
    {
      v6[5] = a3;
      v6[6] = [a4 copy];
      *((_DWORD *)v6 + 16) = 0;
      *((unsigned char *)v6 + 81) = 1;
    }
    else
    {
      v7 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, objc_msgSend(a3, "localizedName"));

      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v7);
      }
      NSLog(&cfstr_SuppressingExc.isa, v7);
      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemLensSelector;
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
  if (!self->_overlayControl)
  {
    v4 = (CAMOverlayServiceSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E4F57DD8]), "initWithIdentifier:sliderType:captureUniqueID:", -[AVCaptureControl identifier](self, "identifier"), 7, -[AVCaptureDevice uniqueID](self->_device, "uniqueID"));
    self->_overlayControl = v4;
    if (self->_displayValuesByZoomFactorValue) {
      -[CAMOverlayServiceSlider setDisplayValuesByValue:](v4, "setDisplayValuesByValue:");
    }
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  [(AVCaptureDevice *)self->_device videoZoomFactor];

  return -[AVCaptureSystemLensSelector _overlayUpdateWithVideoZoomFactor:](self, "_overlayUpdateWithVideoZoomFactor:");
}

- (id)_overlayUpdateWithVideoZoomFactor:(double)a3
{
  if (![(AVCaptureSystemLensSelector *)self changesVideoZoomFactor]
    && [(AVCaptureDevice *)self->_device position] == AVCaptureDevicePositionFront)
  {
    a3 = 0.0;
  }
  id v5 = [(AVCaptureSystemLensSelector *)self overlayControl];

  *(float *)&double v6 = a3;
  return (id)[v5 updateWithFloatValue:v6];
}

- (id)device
{
  v2 = self->_device;

  return v2;
}

- (NSDictionary)displayValuesByZoomFactorValue
{
  v2 = (void *)[(NSDictionary *)self->_displayValuesByZoomFactorValue copy];

  return (NSDictionary *)v2;
}

- (void)setDisplayValuesByZoomFactorValue:(id)a3
{
  if ((-[NSDictionary isEqual:](self->_displayValuesByZoomFactorValue, "isEqual:") & 1) == 0)
  {

    self->_displayValuesByZoomFactorValue = (NSDictionary *)[a3 copy];
    os_unfair_lock_lock(&self->_actionLock);

    self->_overlayControl = 0;
    os_unfair_lock_unlock(&self->_actionLock);
    id v5 = [(AVCaptureControl *)self session];
    if (v5)
    {
      if (![(AVCaptureSession *)v5 isBeingConfigured])
      {
        double v6 = [(AVCaptureControl *)self overlay];
        [(AVCaptureControlsOverlay *)v6 rebuildControls];
      }
    }
  }
}

- (BOOL)changesVideoZoomFactor
{
  v2 = self;
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  LOBYTE(v2) = v2->_changesVideoZoomFactor;
  os_unfair_lock_unlock(p_actionLock);
  return (char)v2;
}

- (void)setChangesVideoZoomFactor:(BOOL)a3
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (self->_action)
  {
    self->_changesVideoZoomFactor = a3;
    os_unfair_lock_unlock(p_actionLock);
  }
  else
  {
    os_unfair_lock_unlock(p_actionLock);
    double v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"AVCaptureSystemLensSelector must be initialized with an action for selectorChangesVideoZoomFactor to be set to YES" userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)enqueueActionWithUpdate:(id)a3
{
  [a3 floatValue];
  float v5 = v4;
  double v6 = v4;
  if (![(AVCaptureSystemLensSelector *)self changesVideoZoomFactor]) {
    goto LABEL_5;
  }
  if (v5 >= 1.0)
  {
    [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_device activeFormat] videoMaxZoomFactor];
    if (v7 >= v6)
    {
      [(AVCaptureDevice *)self->_device lockForConfiguration:0];
      *(float *)&double v8 = v5;
      [(AVCaptureDevice *)self->_device rampToVideoZoomFactor:0 withTuning:v8];
      [(AVCaptureDevice *)self->_device unlockForConfiguration];
LABEL_5:
      if (self->_action)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __55__AVCaptureSystemLensSelector_enqueueActionWithUpdate___block_invoke;
        v9[3] = &unk_1E5A72F98;
        v9[4] = self;
        *(double *)&v9[5] = v6;
        dispatch_async(MEMORY[0x1E4F14428], v9);
      }
    }
  }
}

uint64_t __55__AVCaptureSystemLensSelector_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(*(void *)(a1 + 32) + 48) + 16))(*(void *)(*(void *)(a1 + 32) + 48), *(double *)(a1 + 40));
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
    [(AVCaptureDevice *)self->_device addObserver:self forKeyPath:@"videoZoomFactor" options:5 context:AVCaptureSystemLensSelectorDeviceVideoZoomFactorChangedContext];
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
    [(AVCaptureDevice *)self->_device removeObserver:self forKeyPath:@"videoZoomFactor" context:AVCaptureSystemLensSelectorDeviceVideoZoomFactorChangedContext];
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
  if ((void *)AVCaptureSystemLensSelectorDeviceVideoZoomFactorChangedContext == a6 && self->_device == a4)
  {
    v12 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if (observing && v12 != 0)
    {
      [v12 floatValue];
      id v15 = [(AVCaptureSystemLensSelector *)self _overlayUpdateWithVideoZoomFactor:v14];
      v16 = [(AVCaptureControl *)self overlay];
      [(AVCaptureControlsOverlay *)v16 updateControl:v15];
    }
  }
}

@end