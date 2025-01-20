@interface IMDisplayLink_iOS
- (BOOL)isValid;
- (CADisplayLink)displayLink;
- (IMDisplayLink_iOS)initWithTarget:(id)a3 selector:(SEL)a4;
- (void)invalidate;
- (void)schedule;
- (void)setDisplayLink:(id)a3;
@end

@implementation IMDisplayLink_iOS

- (IMDisplayLink_iOS)initWithTarget:(id)a3 selector:(SEL)a4
{
  v17.receiver = self;
  v17.super_class = (Class)IMDisplayLink_iOS;
  v4 = [(IMDisplayLink *)&v17 initWithTarget:a3 selector:a4];
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setPreferredFramesPerSecond_(v4, v5, 60);
    v9 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v7, v8);
    objc_msgSend_setScreen_(v6, v10, (uint64_t)v9);

    objc_msgSend_setRunLoopMode_(v6, v11, *MEMORY[0x263EFF588]);
    v14 = objc_msgSend_currentRunLoop(MEMORY[0x263EFF9F0], v12, v13);
    objc_msgSend_setRunLoop_(v6, v15, (uint64_t)v14);
  }
  return v6;
}

- (void)schedule
{
  objc_msgSend_invalidate(self, a2, v2);
  v6 = objc_msgSend_screen(self, v4, v5);
  objc_msgSend_displayLinkWithTarget_selector_(v6, v7, (uint64_t)self, sel__displayLinkCallback);
  uint64_t v8 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  displayLink = self->_displayLink;
  self->_displayLink = v8;

  v10 = self->_displayLink;
  uint64_t v13 = objc_msgSend_preferredFramesPerSecond(self, v11, v12);
  objc_msgSend_setPreferredFramesPerSecond_(v10, v14, v13);
  v15 = self->_displayLink;
  objc_msgSend_runLoop(self, v16, v17);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_runLoopMode(self, v18, v19);
  objc_msgSend_addToRunLoop_forMode_(v15, v21, (uint64_t)v22, v20);
}

- (void)invalidate
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    objc_msgSend_invalidate(displayLink, a2, v2);
    uint64_t v5 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (BOOL)isValid
{
  return self->_displayLink != 0;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (void).cxx_destruct
{
}

@end