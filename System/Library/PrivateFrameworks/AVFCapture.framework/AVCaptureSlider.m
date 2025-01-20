@interface AVCaptureSlider
+ (void)initialize;
- (AVCaptureSlider)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 minValue:(float)a5 maxValue:(float)a6;
- (AVCaptureSlider)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 minValue:(float)a5 maxValue:(float)a6 step:(float)a7;
- (AVCaptureSlider)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 values:(id)a5;
- (NSArray)prominentValues;
- (NSString)accessibilityIdentifier;
- (NSString)localizedTitle;
- (NSString)localizedValueFormat;
- (NSString)symbolName;
- (OS_dispatch_queue)actionQueue;
- (float)value;
- (id)action;
- (id)description;
- (id)overlayControl;
- (id)overlayUpdate;
- (void)dealloc;
- (void)enqueueActionWithUpdate:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionQueue:(id)a3;
- (void)setActionQueue:(id)a3 action:(id)a4;
- (void)setLocalizedValueFormat:(id)a3;
- (void)setLocalizedValueValueFormat:(id)a3;
- (void)setProminentValues:(id)a3;
- (void)setValue:(float)a3;
@end

@implementation AVCaptureSlider

+ (void)initialize
{
}

- (AVCaptureSlider)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 values:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)AVCaptureSlider;
  v8 = [(AVCaptureControl *)&v14 initSubclass];
  if (v8)
  {
    v9 = (void *)[a5 sortedArrayUsingSelector:sel_compare_];
    objc_msgSend((id)objc_msgSend(v9, "firstObject"), "floatValue");
    v8->_minValue = v10;
    objc_msgSend((id)objc_msgSend(v9, "lastObject"), "floatValue");
    v8->_maxValue = v11;
    v8->_value = v8->_minValue;
    v8->_prominentValues = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v8->_localizedTitle = (NSString *)[a3 copy];
    v8->_symbolName = (NSString *)[a4 copy];
    v12 = (void *)[a5 copy];
    v8->_discreteRange = (CAMOverlayDiscreteFloatRange *)[objc_alloc(MEMORY[0x1E4F57DC0]) initWithValues:v12];

    v8->_actionLock._os_unfair_lock_opaque = 0;
  }
  return v8;
}

- (AVCaptureSlider)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 minValue:(float)a5 maxValue:(float)a6
{
  v14.receiver = self;
  v14.super_class = (Class)AVCaptureSlider;
  float v10 = [(AVCaptureControl *)&v14 initSubclass];
  float v11 = v10;
  if (v10)
  {
    if (a5 >= a6)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, a5, a6);

      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v12);
      }
      NSLog(&cfstr_SuppressingExc.isa, v12);
      return 0;
    }
    else
    {
      v10->_value = a5;
      v10->_prominentValues = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v11->_minValue = a5;
      v11->_maxValue = a6;
      v11->_localizedTitle = (NSString *)[a3 copy];
      v11->_symbolName = (NSString *)[a4 copy];
      v11->_continuousRange = (CAMOverlayContinuousFloatRange *)[objc_alloc(MEMORY[0x1E4F57DB8]) initWithMinimum:a5 maximum:a6];
      v11->_actionLock._os_unfair_lock_opaque = 0;
    }
  }
  return v11;
}

- (AVCaptureSlider)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 minValue:(float)a5 maxValue:(float)a6 step:(float)a7
{
  v19.receiver = self;
  v19.super_class = (Class)AVCaptureSlider;
  v12 = [(AVCaptureControl *)&v19 initSubclass];
  v13 = v12;
  if (v12)
  {
    if (a5 >= a6)
    {
      objc_super v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      double v18 = a5;
    }
    else
    {
      if (a7 > 0.0)
      {
        v12->_value = a5;
        v12->_prominentValues = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
        v13->_minValue = a5;
        v13->_maxValue = a6;
        v13->_localizedTitle = (NSString *)[a3 copy];
        v13->_symbolName = (NSString *)[a4 copy];
        v13->_discreteRange = (CAMOverlayDiscreteFloatRange *)[objc_alloc(MEMORY[0x1E4F57DC0]) initWithMinimum:a5 maximum:a6 step:a7];
        v13->_actionLock._os_unfair_lock_opaque = 0;
        return v13;
      }
      objc_super v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      double v18 = a7;
    }
    v16 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector(), 0, *(void *)&v18);

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v16);
    }
    NSLog(&cfstr_SuppressingExc.isa, v16);
    return 0;
  }
  return v13;
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSlider;
  [(AVCaptureControl *)&v3 dealloc];
}

- (id)description
{
  accessibilityIdentifier = self->_accessibilityIdentifier;
  if (accessibilityIdentifier) {
    v4 = (__CFString *)[NSString stringWithFormat:@"[%@]", accessibilityIdentifier];
  }
  else {
    v4 = &stru_1EF4D21D0;
  }
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  return (id)[v5 stringWithFormat:@"<%@: %p [%@]%@>", NSStringFromClass(v6), self, self->_localizedTitle, v4];
}

- (id)overlayUpdate
{
  id v3 = [(AVCaptureSlider *)self overlayControl];
  [(AVCaptureSlider *)self value];

  return (id)objc_msgSend(v3, "updateWithFloatValue:");
}

- (id)overlayControl
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F57DC0]), "initWithValues:", -[AVCaptureSlider prominentValues](self, "prominentValues"));
    p_discreteRange = &self->_discreteRange;
    if (self->_discreteRange || (p_discreteRange = &self->_continuousRange, self->_continuousRange)) {
      self->_overlayControl = (CAMOverlayServiceSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E4F57DD8]), "initWithIdentifier:title:imageName:rangeScale:valueRange:primaryValues:", -[AVCaptureControl identifier](self, "identifier"), -[AVCaptureSlider localizedTitle](self, "localizedTitle"), -[AVCaptureSlider symbolName](self, "symbolName"), 0, *p_discreteRange, v4);
    }
    if (self->_localizedValueFormat) {
      -[CAMOverlayServiceSlider setValueFormat:](self->_overlayControl, "setValueFormat:");
    }
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (void)setValue:(float)a3
{
  v5 = [(AVCaptureSlider *)self actionQueue];
  if (v5) {
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  }
  if (self->_value != a3)
  {
    float minValue = self->_minValue;
    if (minValue > a3)
    {
      v7 = @"Value %.2f is less than the slider's minimum value %.2f";
LABEL_8:
      objc_msgSend(NSString, "stringWithFormat:", v7, a3, minValue);
      v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v8);
      }
      NSLog(&cfstr_SuppressingExc.isa, v8);
      return;
    }
    float minValue = self->_maxValue;
    if (minValue < a3)
    {
      v7 = @"Value %.2f is greater than the slider's maximum value %.2f";
      goto LABEL_8;
    }
    self->_value = a3;
    v9 = [(AVCaptureControl *)self overlay];
    id v10 = [(AVCaptureSlider *)self overlayUpdate];
    [(AVCaptureControlsOverlay *)v9 updateControl:v10];
  }
}

- (void)setLocalizedValueValueFormat:(id)a3
{
  localizedValueFormat = self->_localizedValueFormat;
  if (localizedValueFormat != a3 && !-[NSString isEqualToString:](localizedValueFormat, "isEqualToString:"))
  {

    self->_localizedValueFormat = (NSString *)[a3 copy];
    os_unfair_lock_lock(&self->_actionLock);

    self->_overlayControl = 0;
    os_unfair_lock_unlock(&self->_actionLock);
    v6 = [(AVCaptureControl *)self session];
    if (v6)
    {
      if (![(AVCaptureSession *)v6 isBeingConfigured])
      {
        v7 = [(AVCaptureControl *)self overlay];
        [(AVCaptureControlsOverlay *)v7 rebuildControls];
      }
    }
  }
}

- (void)setProminentValues:(id)a3
{
  if (!-[NSArray isEqualToArray:](self->_prominentValues, "isEqualToArray:"))
  {

    self->_prominentValues = (NSArray *)[a3 copy];
    os_unfair_lock_lock(&self->_actionLock);

    self->_overlayControl = 0;
    os_unfair_lock_unlock(&self->_actionLock);
    v5 = [(AVCaptureControl *)self session];
    if (v5)
    {
      if (![(AVCaptureSession *)v5 isBeingConfigured])
      {
        v6 = [(AVCaptureControl *)self overlay];
        [(AVCaptureControlsOverlay *)v6 rebuildControls];
      }
    }
  }
}

- (OS_dispatch_queue)actionQueue
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  v4 = self->_actionQueue;
  os_unfair_lock_unlock(p_actionLock);
  return v4;
}

- (void)setActionQueue:(id)a3 action:(id)a4
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);

  self->_actionQueue = (OS_dispatch_queue *)a3;
  self->_action = (id)[a4 copy];

  os_unfair_lock_unlock(p_actionLock);
}

- (void)enqueueActionWithUpdate:(id)a3
{
  v5 = [(AVCaptureSlider *)self actionQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__AVCaptureSlider_enqueueActionWithUpdate___block_invoke;
  v6[3] = &unk_1E5A72D70;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

uint64_t __43__AVCaptureSlider_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"value"];
  [*(id *)(a1 + 40) floatValue];
  *(_DWORD *)(*(void *)(a1 + 32) + 40) = v2;
  [*(id *)(a1 + 32) didChangeValueForKey:@"value"];
  uint64_t v3 = *(void *)(a1 + 32);
  v4.n128_u32[0] = *(_DWORD *)(v3 + 40);
  v5 = *(uint64_t (**)(__n128))(*(void *)(v3 + 128) + 16);

  return v5(v4);
}

- (float)value
{
  return self->_value;
}

- (NSString)localizedValueFormat
{
  return self->_localizedValueFormat;
}

- (void)setLocalizedValueFormat:(id)a3
{
}

- (NSArray)prominentValues
{
  return self->_prominentValues;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (void)setActionQueue:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

@end