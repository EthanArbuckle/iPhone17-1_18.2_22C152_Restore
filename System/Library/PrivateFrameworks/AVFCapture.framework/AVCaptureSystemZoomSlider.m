@interface AVCaptureSystemZoomSlider
+ (void)initialize;
- (AVCaptureSystemZoomSlider)initWithDevice:(id)a3;
- (double)maxVideoZoomFactor;
- (id)_initWithDevice:(id)a3 action:(id)a4;
- (id)actionQueue;
- (id)description;
- (id)device;
- (id)displayValuesByZoomFactorValue;
- (id)overlayControl;
- (id)overlayUpdate;
- (void)_rebuildOverlayControlIfNecessary;
- (void)dealloc;
- (void)enqueueActionWithUpdate:(id)a3;
- (void)installObservers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObservers;
- (void)setDisplayValuesByZoomFactorValue:(id)a3;
- (void)setMaxVideoZoomFactor:(double)a3;
@end

@implementation AVCaptureSystemZoomSlider

+ (void)initialize
{
}

- (AVCaptureSystemZoomSlider)initWithDevice:(id)a3
{
  return (AVCaptureSystemZoomSlider *)[(AVCaptureSystemZoomSlider *)self _initWithDevice:a3 action:0];
}

- (id)_initWithDevice:(id)a3 action:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVCaptureSystemZoomSlider;
  id v6 = [(AVCaptureControl *)&v9 initSubclass];
  if (v6)
  {
    if ([a3 hasMediaType:*MEMORY[0x1E4F47C68]])
    {
      *((void *)v6 + 5) = a3;
      *((void *)v6 + 6) = [a4 copy];
      *((_DWORD *)v6 + 18) = 0;
      *((unsigned char *)v6 + 89) = 1;
      [*((id *)v6 + 5) addObserver:v6 forKeyPath:@"activeFormat" options:1 context:AVCaptureSystemZoomSliderDeviceActiveFormatChangedContext];
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
  [(AVCaptureDevice *)self->_device removeObserver:self forKeyPath:@"activeFormat" context:AVCaptureSystemZoomSliderDeviceActiveFormatChangedContext];

  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemZoomSlider;
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
    v4 = [(AVCaptureDevice *)self->_device activeFormat];
    if (v4)
    {
      v5 = v4;
      double maxVideoZoomFactor = self->_maxVideoZoomFactor;
      v7 = [(AVCaptureDeviceFormat *)v4 systemRecommendedVideoZoomRange];
      double v8 = 1.0;
      if (maxVideoZoomFactor <= 1.0)
      {
        if (v7)
        {
          [(AVZoomRange *)v7 maxZoomFactor];
          double v8 = v10;
        }
      }
      else
      {
        [(AVCaptureDeviceFormat *)v5 videoMaxZoomFactor];
        double v8 = fmin(maxVideoZoomFactor, v9);
      }
    }
    else
    {
      double v8 = 1.0;
    }
    v11 = (CAMOverlayServiceSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E4F57DD8]), "initPhotoZoomSliderWithIdentifier:maximumZoomFactor:captureDeviceUniqueID:", -[AVCaptureControl identifier](self, "identifier"), -[AVCaptureDevice uniqueID](self->_device, "uniqueID"), v8);
    self->_overlayControl = v11;
    if (self->_displayValuesByZoomFactorValue) {
      -[CAMOverlayServiceSlider setDisplayValuesByValue:](v11, "setDisplayValuesByValue:");
    }
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (void)_rebuildOverlayControlIfNecessary
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  overlayControl = self->_overlayControl;
  if (overlayControl)
  {

    self->_overlayControl = 0;
    os_unfair_lock_unlock(p_actionLock);
    v5 = [(AVCaptureControl *)self session];
    if (v5 && ![(AVCaptureSession *)v5 isBeingConfigured])
    {
      id v6 = [(AVCaptureControl *)self overlay];
      [(AVCaptureControlsOverlay *)v6 rebuildControls];
    }
  }
  else
  {
    os_unfair_lock_unlock(p_actionLock);
  }
}

- (id)overlayUpdate
{
  id v3 = [(AVCaptureSystemZoomSlider *)self overlayControl];
  [(AVCaptureDevice *)self->_device videoZoomFactor];
  *(float *)&double v4 = v4;

  return (id)[v3 updateWithFloatValue:v4];
}

- (id)device
{
  v2 = self->_device;

  return v2;
}

- (double)maxVideoZoomFactor
{
  return self->_maxVideoZoomFactor;
}

- (void)setMaxVideoZoomFactor:(double)a3
{
  if (self->_maxVideoZoomFactor != a3)
  {
    self->_double maxVideoZoomFactor = a3;
    [(AVCaptureSystemZoomSlider *)self _rebuildOverlayControlIfNecessary];
  }
}

- (id)displayValuesByZoomFactorValue
{
  v2 = (void *)[(NSDictionary *)self->_displayValuesByZoomFactorValue copy];

  return v2;
}

- (void)setDisplayValuesByZoomFactorValue:(id)a3
{
  if ((-[NSDictionary isEqual:](self->_displayValuesByZoomFactorValue, "isEqual:") & 1) == 0)
  {

    self->_displayValuesByZoomFactorValue = (NSDictionary *)[a3 copy];
    [(AVCaptureSystemZoomSlider *)self _rebuildOverlayControlIfNecessary];
  }
}

- (void)enqueueActionWithUpdate:(id)a3
{
  [a3 floatValue];
  float v5 = v4;
  if (v4 >= 1.0)
  {
    [(AVCaptureDeviceFormat *)[(AVCaptureDevice *)self->_device activeFormat] videoMaxZoomFactor];
    if (v6 >= v5)
    {
      if (self->_changeZoomInProcess)
      {
        [(AVCaptureDevice *)self->_device lockForConfiguration:0];
        *(float *)&double v7 = v5;
        [(AVCaptureDevice *)self->_device rampToVideoZoomFactor:2 withTuning:v7];
        [(AVCaptureDevice *)self->_device unlockForConfiguration];
      }
      if (self->_action)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __53__AVCaptureSystemZoomSlider_enqueueActionWithUpdate___block_invoke;
        v8[3] = &unk_1E5A72F98;
        v8[4] = self;
        *(double *)&v8[5] = v5;
        dispatch_async(MEMORY[0x1E4F14428], v8);
      }
    }
  }
}

uint64_t __53__AVCaptureSystemZoomSlider_enqueueActionWithUpdate___block_invoke(uint64_t a1)
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
  BOOL observingDeviceVideoZoomFactor = self->_observingDeviceVideoZoomFactor;
  os_unfair_lock_unlock(p_actionLock);
  if (!observingDeviceVideoZoomFactor) {
    [(AVCaptureDevice *)self->_device addObserver:self forKeyPath:@"videoZoomFactor" options:5 context:AVCaptureSystemZoomSliderDeviceVideoZoomFactorChangedContext];
  }
  os_unfair_lock_lock(p_actionLock);
  self->_BOOL observingDeviceVideoZoomFactor = 1;

  os_unfair_lock_unlock(p_actionLock);
}

- (void)removeObservers
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  BOOL observingDeviceVideoZoomFactor = self->_observingDeviceVideoZoomFactor;
  os_unfair_lock_unlock(p_actionLock);
  if (observingDeviceVideoZoomFactor) {
    [(AVCaptureDevice *)self->_device removeObserver:self forKeyPath:@"videoZoomFactor" context:AVCaptureSystemZoomSliderDeviceVideoZoomFactorChangedContext];
  }
  os_unfair_lock_lock(p_actionLock);
  self->_BOOL observingDeviceVideoZoomFactor = 0;

  os_unfair_lock_unlock(p_actionLock);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  BOOL observingDeviceVideoZoomFactor = self->_observingDeviceVideoZoomFactor;
  os_unfair_lock_unlock(p_actionLock);
  if ((void *)AVCaptureSystemZoomSliderDeviceVideoZoomFactorChangedContext == a6 && self->_device == a4)
  {
    v12 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if (observingDeviceVideoZoomFactor && v12 != 0)
    {
      overlayControl = self->_overlayControl;
      [v12 floatValue];
      uint64_t v15 = -[CAMOverlayServiceSlider updateWithFloatValue:](overlayControl, "updateWithFloatValue:");
      v16 = [(AVCaptureControl *)self overlay];
      [(AVCaptureControlsOverlay *)v16 updateControl:v15];
    }
  }
  else if ((void *)AVCaptureSystemZoomSliderDeviceActiveFormatChangedContext == a6 && self->_device == a4)
  {
    [(AVCaptureSystemZoomSlider *)self _rebuildOverlayControlIfNecessary];
  }
}

@end