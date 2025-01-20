@interface AVCaptureIndexPicker
+ (void)initialize;
- (AVCaptureIndexPicker)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 localizedIndexTitles:(id)a5;
- (AVCaptureIndexPicker)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 numberOfIndexes:(int64_t)a5;
- (AVCaptureIndexPicker)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 numberOfIndexes:(int64_t)a5 localizedTitleTransform:(id)a6;
- (NSArray)localizedIndexTitles;
- (NSString)accessibilityIdentifier;
- (NSString)localizedTitle;
- (NSString)symbolName;
- (OS_dispatch_queue)actionQueue;
- (id)action;
- (id)description;
- (id)overlayControl;
- (id)overlayUpdate;
- (int64_t)numberOfIndexes;
- (int64_t)selectedIndex;
- (void)dealloc;
- (void)enqueueActionWithUpdate:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionQueue:(id)a3;
- (void)setActionQueue:(id)a3 action:(id)a4;
- (void)setSelectedIndex:(int64_t)a3;
@end

@implementation AVCaptureIndexPicker

+ (void)initialize
{
}

- (AVCaptureIndexPicker)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 numberOfIndexes:(int64_t)a5
{
  if (a5 <= 0)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v11);
    }
    NSLog(&cfstr_SuppressingExc.isa, v11);
    return 0;
  }
  else
  {
    int64_t v6 = a5;
    v9 = (void *)[MEMORY[0x1E4F1CA48] array];
    do
    {
      [v9 addObject:&stru_1EF4D21D0];
      --v6;
    }
    while (v6);
    return [(AVCaptureIndexPicker *)self initWithLocalizedTitle:a3 symbolName:a4 localizedIndexTitles:v9];
  }
}

- (AVCaptureIndexPicker)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 localizedIndexTitles:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVCaptureIndexPicker;
  v8 = [(AVCaptureControl *)&v11 initSubclass];
  if (v8)
  {
    if ([a5 count])
    {
      v8->_localizedTitle = (NSString *)[a3 copy];
      v8->_symbolName = (NSString *)[a4 copy];
      v8->_numberOfIndexes = [a5 count];
      v8->_localizedIndexTitles = (NSArray *)[a5 copy];
      v8->_actionLock._os_unfair_lock_opaque = 0;
    }
    else
    {
      v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v9);
      }
      NSLog(&cfstr_SuppressingExc.isa, v9);
      return 0;
    }
  }
  return v8;
}

- (AVCaptureIndexPicker)initWithLocalizedTitle:(id)a3 symbolName:(id)a4 numberOfIndexes:(int64_t)a5 localizedTitleTransform:(id)a6
{
  if (a5 <= 0)
  {
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
    return 0;
  }
  else
  {
    objc_super v11 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v12 = 0;
    do
      objc_msgSend(v11, "addObject:", (*((uint64_t (**)(id, uint64_t))a6 + 2))(a6, v12++));
    while (a5 != v12);
    return [(AVCaptureIndexPicker *)self initWithLocalizedTitle:a3 symbolName:a4 localizedIndexTitles:v11];
  }
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureIndexPicker;
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
  int64_t v6 = (objc_class *)objc_opt_class();
  return (id)[v5 stringWithFormat:@"<%@: %p [%@]%@>", NSStringFromClass(v6), self, self->_localizedTitle, v4];
}

- (id)overlayControl
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl) {
    self->_overlayControl = (CAMOverlayServicePicker *)objc_msgSend(objc_alloc(MEMORY[0x1E4F57DD0]), "initWithIdentifier:title:imageName:valueTitles:", -[AVCaptureControl identifier](self, "identifier"), -[AVCaptureIndexPicker localizedTitle](self, "localizedTitle"), -[AVCaptureIndexPicker symbolName](self, "symbolName"), -[AVCaptureIndexPicker localizedIndexTitles](self, "localizedIndexTitles"));
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  id v3 = [(AVCaptureIndexPicker *)self overlayControl];
  int64_t v4 = [(AVCaptureIndexPicker *)self selectedIndex];

  return (id)[v3 updateWithIndexValue:v4];
}

- (void)setSelectedIndex:(int64_t)a3
{
  v5 = [(AVCaptureIndexPicker *)self actionQueue];
  if (v5) {
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  }
  if (self->_selectedIndex != a3)
  {
    if (a3 < 0)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Selected index %ld is less than 0", a3, v10);
    }
    else
    {
      int64_t numberOfIndexes = self->_numberOfIndexes;
      if (numberOfIndexes > a3)
      {
        self->_selectedIndex = a3;
        v7 = [(AVCaptureControl *)self overlay];
        id v8 = [(AVCaptureIndexPicker *)self overlayUpdate];
        [(AVCaptureControlsOverlay *)v7 updateControl:v8];
        return;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"Selected index %ld is larger than the largest supported index %ld", a3, numberOfIndexes - 1);
    }
    v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v9);
    }
    NSLog(&cfstr_SuppressingExc.isa, v9);
  }
}

- (OS_dispatch_queue)actionQueue
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  int64_t v4 = self->_actionQueue;
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
  v5 = [(AVCaptureIndexPicker *)self actionQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__AVCaptureIndexPicker_enqueueActionWithUpdate___block_invoke;
  v6[3] = &unk_1E5A72D70;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)v5, v6);
}

uint64_t __48__AVCaptureIndexPicker_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) indexValue];
  [*(id *)(a1 + 40) willChangeValueForKey:@"selectedIndex"];
  *(void *)(*(void *)(a1 + 40) + 40) = v2;
  [*(id *)(a1 + 40) didChangeValueForKey:@"selectedIndex"];
  id v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 104) + 16);

  return v3();
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (int64_t)numberOfIndexes
{
  return self->_numberOfIndexes;
}

- (NSArray)localizedIndexTitles
{
  return self->_localizedIndexTitles;
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