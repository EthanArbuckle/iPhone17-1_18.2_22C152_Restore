@interface AVCaptureToggle
+ (void)initialize;
- (AVCaptureToggle)initWithLocalizedTitle:(id)a3 onSymbolName:(id)a4 offSymbolName:(id)a5;
- (BOOL)isOn;
- (NSString)accessibilityIdentifier;
- (NSString)localizedTitle;
- (NSString)offSymbolName;
- (NSString)onSymbolName;
- (OS_dispatch_queue)actionQueue;
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
- (void)setOn:(BOOL)a3;
@end

@implementation AVCaptureToggle

+ (void)initialize
{
}

- (AVCaptureToggle)initWithLocalizedTitle:(id)a3 onSymbolName:(id)a4 offSymbolName:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AVCaptureToggle;
  v8 = [(AVCaptureControl *)&v10 initSubclass];
  if (v8)
  {
    v8->_localizedTitle = (NSString *)[a3 copy];
    v8->_onSymbolName = (NSString *)[a4 copy];
    v8->_offSymbolName = (NSString *)[a5 copy];
    v8->_actionLock._os_unfair_lock_opaque = 0;
  }
  return v8;
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_actionLock);
  os_unfair_lock_unlock(&self->_actionLock);
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureToggle;
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

- (id)overlayControl
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  if (!self->_overlayControl) {
    self->_overlayControl = (CAMOverlayServiceToggle *)objc_msgSend(objc_alloc(MEMORY[0x1E4F57DE0]), "initWithIdentifier:title:imageName:onImageName:offImageName:", -[AVCaptureControl identifier](self, "identifier"), -[AVCaptureToggle localizedTitle](self, "localizedTitle"), -[AVCaptureToggle onSymbolName](self, "onSymbolName"), -[AVCaptureToggle onSymbolName](self, "onSymbolName"), -[AVCaptureToggle offSymbolName](self, "offSymbolName"));
  }
  os_unfair_lock_unlock(p_actionLock);
  return self->_overlayControl;
}

- (id)overlayUpdate
{
  id v3 = [(AVCaptureToggle *)self overlayControl];
  BOOL v4 = [(AVCaptureToggle *)self isOn];

  return (id)[v3 updateWithBooleanValue:v4];
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(AVCaptureToggle *)self actionQueue];
  if (v5) {
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  }
  if (self->_on != v3)
  {
    self->_on = v3;
    v6 = [(AVCaptureControl *)self overlay];
    id v7 = [(AVCaptureToggle *)self overlayUpdate];
    [(AVCaptureControlsOverlay *)v6 updateControl:v7];
  }
}

- (OS_dispatch_queue)actionQueue
{
  p_actionLock = &self->_actionLock;
  os_unfair_lock_lock(&self->_actionLock);
  BOOL v4 = self->_actionQueue;
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
  v5 = [(AVCaptureToggle *)self actionQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__AVCaptureToggle_enqueueActionWithUpdate___block_invoke;
  v6[3] = &unk_1E5A72D70;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)v5, v6);
}

uint64_t __43__AVCaptureToggle_enqueueActionWithUpdate___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) BOOLeanValue];
  [*(id *)(a1 + 40) willChangeValueForKey:@"on"];
  *(unsigned char *)(*(void *)(a1 + 40) + 64) = v2;
  [*(id *)(a1 + 40) didChangeValueForKey:@"on"];
  BOOL v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 96) + 16);

  return v3();
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)onSymbolName
{
  return self->_onSymbolName;
}

- (NSString)offSymbolName
{
  return self->_offSymbolName;
}

- (BOOL)isOn
{
  return self->_on;
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