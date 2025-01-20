@interface AVCaptureSystemStyleSlider
+ (void)initialize;
- (AVCaptureSystemStyleSlider)initWithSession:(id)a3 parameter:(int64_t)a4;
- (AVCaptureSystemStyleSlider)initWithSession:(id)a3 parameter:(int64_t)a4 action:(id)a5;
- (id)actionQueue;
- (id)overlayControl;
- (id)overlayUpdate;
- (void)dealloc;
- (void)enqueueActionWithUpdate:(id)a3;
- (void)installObservers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayVisibilityDidChange:(BOOL)a3;
- (void)removeObservers;
@end

@implementation AVCaptureSystemStyleSlider

+ (void)initialize
{
}

- (AVCaptureSystemStyleSlider)initWithSession:(id)a3 parameter:(int64_t)a4
{
  return [(AVCaptureSystemStyleSlider *)self initWithSession:a3 parameter:a4 action:0];
}

- (AVCaptureSystemStyleSlider)initWithSession:(id)a3 parameter:(int64_t)a4 action:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AVCaptureSystemStyleSlider;
  v8 = [(AVCaptureControl *)&v10 initSubclass];
  if (v8)
  {
    v8->_sessionReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:a3];
    v8->_action = (id)[a5 copy];
    v8->_parameter = a4;
    v8->_actionLock._os_unfair_lock_opaque = 0;
    v8->_changeSmartStyleInProcess = 1;
  }
  return v8;
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemStyleSlider;
  [(AVCaptureControl *)&v3 dealloc];
}

- (id)overlayControl
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl)
  {
    unint64_t parameter = self->_parameter;
    if (parameter <= 2) {
      self->_overlayControl = (CAMOverlayServiceSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E4F57DD8]), "initWithIdentifier:sliderType:captureUniqueID:", -[AVCaptureControl identifier](self, "identifier"), qword_1A1636A60[parameter], &stru_1EF4D21D0);
    }
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  objc_super v3 = objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "activeSmartStyle");
  int64_t parameter = self->_parameter;
  if (parameter)
  {
    if (parameter == 2)
    {
      [v3 toneBias];
    }
    else
    {
      int v5 = 0;
      if (parameter != 1) {
        goto LABEL_8;
      }
      [v3 colorBias];
    }
  }
  else
  {
    [v3 intensity];
  }
  int v5 = v6;
LABEL_8:
  id v7 = [(AVCaptureSystemStyleSlider *)self overlayControl];
  LODWORD(v8) = v5;

  return (id)[v7 updateWithFloatValue:v8];
}

- (void)enqueueActionWithUpdate:(id)a3
{
  [a3 floatValue];
  int v5 = v4;
  int v6 = (void *)[(AVWeakReference *)self->_sessionReference referencedObject];
  if (!v6) {
    return;
  }
  id v7 = v6;
  double v8 = (AVCaptureSmartStyle *)[v6 activeSmartStyle];
  v9 = v8;
  int64_t parameter = self->_parameter;
  switch(parameter)
  {
    case 0:
      uint64_t v18 = [(AVCaptureSmartStyle *)v8 cast];
      [(AVCaptureSmartStyle *)v9 toneBias];
      int v20 = v19;
      [(AVCaptureSmartStyle *)v9 colorBias];
      LODWORD(v17) = LODWORD(v16);
      uint64_t v15 = v18;
      LODWORD(v16) = v5;
      LODWORD(v14) = v20;
      goto LABEL_8;
    case 2:
      uint64_t v21 = [(AVCaptureSmartStyle *)v8 cast];
      [(AVCaptureSmartStyle *)v9 intensity];
      int v23 = v22;
      [(AVCaptureSmartStyle *)v9 colorBias];
      LODWORD(v17) = LODWORD(v16);
      uint64_t v15 = v21;
      LODWORD(v16) = v23;
      LODWORD(v14) = v5;
      goto LABEL_8;
    case 1:
      uint64_t v11 = [(AVCaptureSmartStyle *)v8 cast];
      [(AVCaptureSmartStyle *)v9 intensity];
      int v13 = v12;
      [(AVCaptureSmartStyle *)v9 toneBias];
      LODWORD(v14) = LODWORD(v16);
      uint64_t v15 = v11;
      LODWORD(v16) = v13;
      LODWORD(v17) = v5;
LABEL_8:
      v9 = +[AVCaptureSmartStyle styleWithCast:v15 intensity:v16 toneBias:v14 colorBias:v17];
      break;
  }
  if (self->_changeSmartStyleInProcess)
  {
    [v7 setSmartStyle:v9];
    self->_smartStyleHasChanged = 1;
  }
  if (self->_action)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __54__AVCaptureSystemStyleSlider_enqueueActionWithUpdate___block_invoke;
    v24[3] = &unk_1E5A72D70;
    v24[4] = self;
    v24[5] = v9;
    dispatch_async(MEMORY[0x1E4F14428], v24);
  }
}

uint64_t __54__AVCaptureSystemStyleSlider_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
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
    objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "addObserver:forKeyPath:options:context:", self, @"smartStyle", 5, 0);
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
    objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "removeObserver:forKeyPath:", self, @"smartStyle");
  }
  os_unfair_lock_lock(p_actionLock);
  self->_BOOL observing = 0;

  os_unfair_lock_unlock(p_actionLock);
}

- (void)overlayVisibilityDidChange:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureSystemStyleSlider;
  -[AVCaptureControl overlayVisibilityDidChange:](&v6, sel_overlayVisibilityDidChange_);
  if (!a3)
  {
    int v5 = (void *)[(AVWeakReference *)self->_sessionReference referencedObject];
    if (v5)
    {
      if (self->_changeSmartStyleInProcess && self->_smartStyleHasChanged)
      {
        objc_msgSend(v5, "saveSystemStyleOverrideToDefaults:", objc_msgSend(v5, "smartStyle"));
        self->_smartStyleHasChanged = 0;
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  BOOL observing = self->_observing;
  os_unfair_lock_unlock(p_actionLock);
  if ([a3 isEqualToString:@"smartStyle"]
    && (id)[(AVWeakReference *)self->_sessionReference referencedObject] == a4)
  {
    uint64_t v12 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if (observing && v12 != 0)
    {
      double v14 = (void *)v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t parameter = self->_parameter;
        if (parameter)
        {
          if (parameter == 2)
          {
            [v14 toneBias];
          }
          else
          {
            double v16 = 0.0;
            if (parameter == 1) {
              objc_msgSend(v14, "colorBias", 0.0);
            }
          }
        }
        else
        {
          [v14 intensity];
        }
        uint64_t v17 = [(CAMOverlayServiceSlider *)self->_overlayControl updateWithFloatValue:v16];
        uint64_t v18 = [(AVCaptureControl *)self overlay];
        [(AVCaptureControlsOverlay *)v18 updateControl:v17];
      }
    }
  }
}

@end