@interface IMDisplayLink
+ (Class)_displayLinkClass;
+ (id)displayLinkWithTarget:(id)a3 selector:(SEL)a4;
- (BOOL)isValid;
- (IMDisplayLink)initWithTarget:(id)a3 selector:(SEL)a4;
- (NSRunLoop)runLoop;
- (NSString)runLoopMode;
- (SEL)selector;
- (UIScreen)screen;
- (id)target;
- (int64_t)preferredFramesPerSecond;
- (void)_displayLinkCallback;
- (void)dealloc;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setRunLoop:(id)a3;
- (void)setRunLoopMode:(id)a3;
- (void)setScreen:(id)a3;
@end

@implementation IMDisplayLink

- (IMDisplayLink)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMDisplayLink;
  v7 = [(IMDisplayLink *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_selector = v9;
  }

  return v8;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)IMDisplayLink;
  [(IMDisplayLink *)&v4 dealloc];
}

- (BOOL)isValid
{
  return 0;
}

- (void)_displayLinkCallback
{
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  if (WeakRetained)
  {
    p_selector = &self->_selector;
    if (self->_selector)
    {

      id v8 = objc_loadWeakRetained(p_target);
      if (*p_selector) {
        uint64_t v10 = (uint64_t)*p_selector;
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v8;
      objc_msgSend_performSelector_withObject_(v8, v9, v10, self);

      return;
    }
  }
  objc_msgSend_invalidate(self, v5, v6);
}

+ (Class)_displayLinkClass
{
  return (Class)objc_opt_class();
}

+ (id)displayLinkWithTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  id v9 = objc_alloc((Class)objc_msgSend__displayLinkClass(a1, v7, v8));
  id v11 = objc_msgSend_initWithTarget_selector_(v9, v10, (uint64_t)v6, a4);

  return v11;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
}

- (NSRunLoop)runLoop
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_runLoop);
  return (NSRunLoop *)WeakRetained;
}

- (void)setRunLoop:(id)a3
{
}

- (NSString)runLoopMode
{
  return self->_runLoopMode;
}

- (void)setRunLoopMode:(id)a3
{
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);
  return (UIScreen *)WeakRetained;
}

- (void)setScreen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_runLoopMode, 0);
  objc_destroyWeak((id *)&self->_runLoop);
  objc_destroyWeak(&self->_target);
}

@end