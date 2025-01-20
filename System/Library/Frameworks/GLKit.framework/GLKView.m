@interface GLKView
+ (Class)layerClass;
- (BOOL)_canDrawContent;
- (BOOL)_controlsOwnScaleFactor;
- (BOOL)_presentFramebuffer;
- (BOOL)enableSetNeedsDisplay;
- (BOOL)inDraw;
- (BOOL)shouldDeleteFramebuffer;
- (CGRect)viewBounds;
- (EAGLContext)context;
- (GLKView)initWithCoder:(id)a3;
- (GLKView)initWithFrame:(CGRect)a3;
- (GLKView)initWithFrame:(CGRect)frame context:(EAGLContext *)context;
- (GLKViewDrawableColorFormat)drawableColorFormat;
- (GLKViewDrawableDepthFormat)drawableDepthFormat;
- (GLKViewDrawableMultisample)drawableMultisample;
- (GLKViewDrawableStencilFormat)drawableStencilFormat;
- (NSInteger)drawableHeight;
- (NSInteger)drawableWidth;
- (NSMutableDictionary)drawableProperties;
- (UIImage)snapshot;
- (double)viewContentScaleFactor;
- (id)delegate;
- (unsigned)depthRenderbuffer;
- (unsigned)depthStencilRenderbuffer;
- (unsigned)multisampleColorRenderbuffer;
- (unsigned)multisampleFramebuffer;
- (unsigned)resolveColorRenderbuffer;
- (unsigned)resolveFramebuffer;
- (unsigned)stencilRenderbuffer;
- (void)_createFramebuffer;
- (void)_deleteFramebuffer;
- (void)_display:(BOOL)a3;
- (void)_initCommon;
- (void)_resolveAndDiscard;
- (void)_setFramebuffer:(BOOL *)a3;
- (void)bindDrawable;
- (void)dealloc;
- (void)display;
- (void)displayLayer:(id)a3;
- (void)drawRectIMP;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setContentScaleFactor:(double)a3;
- (void)setContext:(EAGLContext *)context;
- (void)setDelegate:(id)delegate;
- (void)setDepthRenderbuffer:(unsigned int)a3;
- (void)setDepthStencilRenderbuffer:(unsigned int)a3;
- (void)setDrawRectIMP:(void *)a3;
- (void)setDrawableColorFormat:(GLKViewDrawableColorFormat)drawableColorFormat;
- (void)setDrawableDepthFormat:(GLKViewDrawableDepthFormat)drawableDepthFormat;
- (void)setDrawableMultisample:(GLKViewDrawableMultisample)drawableMultisample;
- (void)setDrawableProperties:(id)a3;
- (void)setDrawableStencilFormat:(GLKViewDrawableStencilFormat)drawableStencilFormat;
- (void)setEnableSetNeedsDisplay:(BOOL)enableSetNeedsDisplay;
- (void)setInDraw:(BOOL)a3;
- (void)setMultisampleColorRenderbuffer:(unsigned int)a3;
- (void)setMultisampleFramebuffer:(unsigned int)a3;
- (void)setResolveColorRenderbuffer:(unsigned int)a3;
- (void)setResolveFramebuffer:(unsigned int)a3;
- (void)setShouldDeleteFramebuffer:(BOOL)a3;
- (void)setStencilRenderbuffer:(unsigned int)a3;
- (void)setViewBounds:(CGRect)a3;
- (void)setViewContentScaleFactor:(double)a3;
@end

@implementation GLKView

- (void)_display:(BOOL)a3
{
  self->_inDraw = 1;
  if (self->_context)
  {
    BOOL v4 = a3;
    char v8 = 0;
    [(GLKView *)self _setFramebuffer:&v8];
    glPushGroupMarkerEXT(0, "Rendering");
    drawRectIMP = (void (*)(GLKView *, char *))self->_drawRectIMP;
    if (drawRectIMP) {
      BOOL v6 = drawRectIMP == (void (*)(GLKView *, char *))_drawRectUIViewIMP;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      {
        delegate = self->_delegate;
        [(GLKView *)self bounds];
        -[GLKViewDelegate glkView:drawInRect:](delegate, "glkView:drawInRect:", self);
      }
    }
    else
    {
      [(GLKView *)self bounds];
      drawRectIMP(self, sel_drawRect_);
    }
    glPopGroupMarkerEXT();
    if (v8) {
      glFinish();
    }
    [(GLKView *)self _resolveAndDiscard];
    if (v4) {
      [(GLKView *)self _presentFramebuffer];
    }
  }
  self->_inDraw = 0;
}

- (void)_setFramebuffer:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  if (self->_context)
  {
    objc_msgSend(MEMORY[0x263F146E8], "setCurrentContext:");
    if (self->_shouldDeleteFramebuffer) {
      [(GLKView *)self _deleteFramebuffer];
    }
    p_resolveFramebuffer = &self->_resolveFramebuffer;
    if (!self->_resolveFramebuffer)
    {
      [(GLKView *)self _createFramebuffer];
      if (a3) {
        *a3 = 1;
      }
    }
    if (self->_drawableMultisample) {
      p_resolveFramebuffer = &self->_multisampleFramebuffer;
    }
    glBindFramebuffer(0x8D40u, *p_resolveFramebuffer);
    GLsizei drawableWidth = self->_drawableWidth;
    GLsizei drawableHeight = self->_drawableHeight;
    glViewport(0, 0, drawableWidth, drawableHeight);
  }
}

- (void)_resolveAndDiscard
{
  if (self->_drawableMultisample)
  {
    glBindFramebuffer(0x8CA8u, self->_multisampleFramebuffer);
    glBindFramebuffer(0x8CA9u, self->_resolveFramebuffer);
    if ([(EAGLContext *)self->_context API] == kEAGLRenderingAPIOpenGLES3) {
      glBlitFramebuffer(0, 0, self->_drawableWidth, self->_drawableHeight, 0, 0, self->_drawableWidth, self->_drawableHeight, 0x4000u, 0x2601u);
    }
    else {
      glResolveMultisampleFramebufferAPPLE();
    }
  }
  glDiscardFramebufferEXT();
  glPopGroupMarkerEXT();
}

- (BOOL)_presentFramebuffer
{
  glBindRenderbuffer(0x8D41u, self->_resolveColorRenderbuffer);
  context = self->_context;

  return [(EAGLContext *)context presentRenderbuffer:36161];
}

- (void)_deleteFramebuffer
{
  if (self->_context)
  {
    self->_shouldDeleteFramebuffer = 0;
    [MEMORY[0x263F146E8] setCurrentContext:self->_context];
    glPushGroupMarkerEXT(0, "Delete Framebuffer");
    if (self->_resolveFramebuffer)
    {
      glDeleteFramebuffers(1, &self->_resolveFramebuffer);
      self->_resolveFramebuffer = 0;
    }
    if (self->_resolveColorRenderbuffer)
    {
      glDeleteRenderbuffers(1, &self->_resolveColorRenderbuffer);
      self->_resolveColorRenderbuffer = 0;
    }
    if (self->_multisampleFramebuffer)
    {
      glDeleteFramebuffers(1, &self->_multisampleFramebuffer);
      self->_multisampleFramebuffer = 0;
    }
    if (self->_multisampleColorRenderbuffer)
    {
      glDeleteRenderbuffers(1, &self->_multisampleColorRenderbuffer);
      self->_multisampleColorRenderbuffer = 0;
    }
    if (self->_depthRenderbuffer)
    {
      glDeleteRenderbuffers(1, &self->_depthRenderbuffer);
      self->_depthRenderbuffer = 0;
    }
    if (self->_stencilRenderbuffer)
    {
      glDeleteRenderbuffers(1, &self->_stencilRenderbuffer);
      self->_stencilRenderbuffer = 0;
    }
    p_depthStencilRenderbuffer = &self->_depthStencilRenderbuffer;
    if (*p_depthStencilRenderbuffer)
    {
      glDeleteRenderbuffers(1, p_depthStencilRenderbuffer);
      unsigned int *p_depthStencilRenderbuffer = 0;
    }
    glPopGroupMarkerEXT();
  }
}

- (void)_createFramebuffer
{
  if (self->_context)
  {
    glPushGroupMarkerEXT(0, "Create Framebuffer");
    v3 = (void *)[(GLKView *)self layer];
    glGenFramebuffers(1, &self->_resolveFramebuffer);
    glBindFramebuffer(0x8D40u, self->_resolveFramebuffer);
    int v4 = self->_drawableColorFormat - 1;
    if (v4 > 0xC) {
      v5 = (void *)MEMORY[0x263F146F0];
    }
    else {
      v5 = (void *)qword_26433A268[v4];
    }
    [(NSMutableDictionary *)self->_drawableProperties setObject:*v5 forKey:*MEMORY[0x263F14708]];
    [v3 setDrawableProperties:self->_drawableProperties];
    p_resolveColorRenderbuffer = &self->_resolveColorRenderbuffer;
    glGenRenderbuffers(1, &self->_resolveColorRenderbuffer);
    glBindRenderbuffer(0x8D41u, self->_resolveColorRenderbuffer);
    if (![(EAGLContext *)self->_context renderbufferStorage:36161 fromDrawable:v3])NSLog(&cfstr_FailedToBindEa.isa, v3, *p_resolveColorRenderbuffer); {
    *(void *)params = 0;
    }
    glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &params[1]);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, params);
    self->_GLsizei drawableWidth = params[1];
    self->_GLsizei drawableHeight = params[0];
    glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, *p_resolveColorRenderbuffer);
    if (self->_drawableDepthFormat == 1) {
      GLenum v7 = 33189;
    }
    else {
      GLenum v7 = 33190;
    }
    if (self->_drawableMultisample)
    {
      glGenFramebuffers(1, &self->_multisampleFramebuffer);
      glBindFramebuffer(0x8D40u, self->_multisampleFramebuffer);
      glGenRenderbuffers(1, &self->_multisampleColorRenderbuffer);
      glBindRenderbuffer(0x8D41u, self->_multisampleColorRenderbuffer);
      glRenderbufferStorageMultisampleAPPLE();
      glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, self->_multisampleColorRenderbuffer);
      int drawableStencilFormat = self->_drawableStencilFormat;
      if (self->_drawableDepthFormat)
      {
        if (!drawableStencilFormat)
        {
          p_GLuint depthRenderbuffer = &self->_depthRenderbuffer;
          glGenRenderbuffers(1, &self->_depthRenderbuffer);
          glBindRenderbuffer(0x8D41u, self->_depthRenderbuffer);
          glRenderbufferStorageMultisampleAPPLE();
          GLenum v12 = 36096;
          goto LABEL_21;
        }
        p_GLuint depthRenderbuffer = &self->_depthStencilRenderbuffer;
        glGenRenderbuffers(1, &self->_depthStencilRenderbuffer);
        glBindRenderbuffer(0x8D41u, self->_depthStencilRenderbuffer);
        glRenderbufferStorageMultisampleAPPLE();
        glFramebufferRenderbuffer(0x8D40u, 0x8D00u, 0x8D41u, self->_depthStencilRenderbuffer);
      }
      else
      {
        if (!drawableStencilFormat) {
          goto LABEL_22;
        }
        p_GLuint depthRenderbuffer = &self->_stencilRenderbuffer;
        glGenRenderbuffers(1, &self->_stencilRenderbuffer);
        glBindRenderbuffer(0x8D41u, self->_stencilRenderbuffer);
        glRenderbufferStorageMultisampleAPPLE();
      }
      GLenum v12 = 36128;
LABEL_21:
      glFramebufferRenderbuffer(0x8D40u, v12, 0x8D41u, *p_depthRenderbuffer);
LABEL_22:
      if (glCheckFramebufferStatus(0x8D40u) != 36053)
      {
        uint64_t v13 = glCheckFramebufferStatus(0x8D40u);
        NSLog(&cfstr_FailedToMakeCo.isa, v13);
        int v14 = 1;
        goto LABEL_30;
      }
LABEL_29:
      int v14 = 0;
LABEL_30:
      glBindFramebuffer(0x8D40u, self->_resolveFramebuffer);
      if (glCheckFramebufferStatus(0x8D40u) == 36053)
      {
        if (!v14) {
          goto LABEL_35;
        }
      }
      else
      {
        uint64_t v17 = glCheckFramebufferStatus(0x8D40u);
        NSLog(&cfstr_FailedToMakeCo_0.isa, v17);
      }
      [(GLKView *)self _deleteFramebuffer];
LABEL_35:
      glPopGroupMarkerEXT();
      return;
    }
    self->_multisampleFramebuffer = 0;
    self->_multisampleColorRenderbuffer = 0;
    int v10 = self->_drawableStencilFormat;
    if (self->_drawableDepthFormat)
    {
      if (!v10)
      {
        glGenRenderbuffers(1, &self->_depthRenderbuffer);
        glBindRenderbuffer(0x8D41u, self->_depthRenderbuffer);
        glRenderbufferStorage(0x8D41u, v7, self->_drawableWidth, self->_drawableHeight);
        GLuint depthRenderbuffer = self->_depthRenderbuffer;
        GLenum v16 = 36096;
        goto LABEL_28;
      }
      p_depthStencilRenderbuffer = &self->_depthStencilRenderbuffer;
      glGenRenderbuffers(1, &self->_depthStencilRenderbuffer);
      glBindRenderbuffer(0x8D41u, self->_depthStencilRenderbuffer);
      glRenderbufferStorage(0x8D41u, 0x88F0u, self->_drawableWidth, self->_drawableHeight);
      glFramebufferRenderbuffer(0x8D40u, 0x8D00u, 0x8D41u, self->_depthStencilRenderbuffer);
    }
    else
    {
      if (!v10) {
        goto LABEL_29;
      }
      p_depthStencilRenderbuffer = &self->_stencilRenderbuffer;
      glGenRenderbuffers(1, &self->_stencilRenderbuffer);
      glBindRenderbuffer(0x8D41u, self->_stencilRenderbuffer);
      glRenderbufferStorage(0x8D41u, 0x8D48u, self->_drawableWidth, self->_drawableHeight);
    }
    GLuint depthRenderbuffer = *p_depthStencilRenderbuffer;
    GLenum v16 = 36128;
LABEL_28:
    glFramebufferRenderbuffer(0x8D40u, v16, 0x8D41u, depthRenderbuffer);
    goto LABEL_29;
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_initCommon
{
  v3 = (void *)[(GLKView *)self layer];
  self->_enableSetNeedsDisplay = 1;
  self->_drawableColorFormat = 0;
  self->_drawableDepthFormat = 0;
  self->_int drawableStencilFormat = 0;
  self->_drawableMultisample = 0;
  int v4 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v5 = [NSNumber numberWithBool:0];
  -[GLKView setDrawableProperties:](self, "setDrawableProperties:", objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, *MEMORY[0x263F14710], *MEMORY[0x263F146F0], *MEMORY[0x263F14708], 0));
  [v3 setDrawableProperties:self->_drawableProperties];
  [v3 setOpaque:1];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "nativeScale");
  -[GLKView setContentScaleFactor:](self, "setContentScaleFactor:");
  if (!_drawRectUIViewIMP) {
    _drawRectUIViewIMP = [MEMORY[0x263F1CB60] instanceMethodForSelector:sel_drawRect_];
  }
  if (objc_opt_respondsToSelector()) {
    self->_drawRectIMP = (void *)[(GLKView *)self methodForSelector:sel_drawRect_];
  }
}

- (GLKView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GLKView;
  v3 = -[GLKView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v4 = v3;
  if (v3) {
    [(GLKView *)v3 _initCommon];
  }
  return v4;
}

- (GLKView)initWithFrame:(CGRect)frame context:(EAGLContext *)context
{
  v8.receiver = self;
  v8.super_class = (Class)GLKView;
  uint64_t v5 = -[GLKView initWithFrame:](&v8, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  objc_super v6 = v5;
  if (v5)
  {
    [(GLKView *)v5 _initCommon];
    [(GLKView *)v6 setContext:context];
  }
  return v6;
}

- (GLKView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GLKView;
  int v4 = -[GLKView initWithCoder:](&v7, sel_initWithCoder_);
  uint64_t v5 = v4;
  if (v4)
  {
    [(GLKView *)v4 _initCommon];
    if ([a3 containsValueForKey:@"GLKViewDrawableColorFormatCoderKey"]) {
      v5->_drawableColorFormat = [a3 decodeIntForKey:@"GLKViewDrawableColorFormatCoderKey"];
    }
    if ([a3 containsValueForKey:@"GLKViewDrawableDepthFormatCoderKey"]) {
      v5->_drawableDepthFormat = [a3 decodeIntForKey:@"GLKViewDrawableDepthFormatCoderKey"];
    }
    if ([a3 containsValueForKey:@"GLKViewDrawableStencilFormatCoderKey"]) {
      v5->_int drawableStencilFormat = [a3 decodeIntForKey:@"GLKViewDrawableStencilFormatCoderKey"];
    }
    if ([a3 containsValueForKey:@"GLKViewDrawableMultisampleCoderKey"]) {
      v5->_drawableMultisample = [a3 decodeIntForKey:@"GLKViewDrawableMultisampleCoderKey"];
    }
    if ([a3 containsValueForKey:@"GLKViewEnableSetNeedsDisplayCoderKey"]) {
      v5->_enableSetNeedsDisplay = [a3 decodeBoolForKey:@"GLKViewEnableSetNeedsDisplayCoderKey"];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GLKView;
  -[GLKView encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInteger:self->_drawableColorFormat forKey:@"GLKViewDrawableColorFormatCoderKey"];
  [a3 encodeInteger:self->_drawableDepthFormat forKey:@"GLKViewDrawableDepthFormatCoderKey"];
  [a3 encodeInteger:self->_drawableStencilFormat forKey:@"GLKViewDrawableStencilFormatCoderKey"];
  [a3 encodeInteger:self->_drawableMultisample forKey:@"GLKViewDrawableMultisampleCoderKey"];
  [a3 encodeBool:self->_enableSetNeedsDisplay forKey:@"GLKViewEnableSetNeedsDisplayCoderKey"];
}

- (void)dealloc
{
  if (glkLinkedOSVersion() < 0x90000) {
    id v3 = 0;
  }
  else {
    id v3 = (id)[MEMORY[0x263F146E8] currentContext];
  }
  [(GLKView *)self _deleteFramebuffer];

  if (glkLinkedOSVersion() > 0x8FFFF)
  {
    [MEMORY[0x263F146E8] setCurrentContext:v3];
  }
  [(GLKView *)self setDrawableProperties:0];
  v4.receiver = self;
  v4.super_class = (Class)GLKView;
  [(GLKView *)&v4 dealloc];
}

- (EAGLContext)context
{
  return self->_context;
}

- (void)setContext:(EAGLContext *)context
{
  if (self->_context != context)
  {
    uint64_t v5 = [MEMORY[0x263F146E8] currentContext];
    [(GLKView *)self _deleteFramebuffer];

    self->_context = context;
    objc_super v6 = (void *)MEMORY[0x263F146E8];
    [v6 setCurrentContext:v5];
  }
}

- (GLKViewDrawableColorFormat)drawableColorFormat
{
  return self->_drawableColorFormat;
}

- (void)setDrawableColorFormat:(GLKViewDrawableColorFormat)drawableColorFormat
{
  if (self->_drawableColorFormat != drawableColorFormat)
  {
    self->_shouldDeleteFramebuffer = 1;
    self->_drawableColorFormat = drawableColorFormat;
  }
}

- (GLKViewDrawableDepthFormat)drawableDepthFormat
{
  return self->_drawableDepthFormat;
}

- (void)setDrawableDepthFormat:(GLKViewDrawableDepthFormat)drawableDepthFormat
{
  if (self->_drawableDepthFormat != drawableDepthFormat)
  {
    self->_shouldDeleteFramebuffer = 1;
    self->_drawableDepthFormat = drawableDepthFormat;
  }
}

- (GLKViewDrawableStencilFormat)drawableStencilFormat
{
  return self->_drawableStencilFormat;
}

- (void)setDrawableStencilFormat:(GLKViewDrawableStencilFormat)drawableStencilFormat
{
  if (self->_drawableStencilFormat != drawableStencilFormat)
  {
    self->_shouldDeleteFramebuffer = 1;
    self->_int drawableStencilFormat = drawableStencilFormat;
  }
}

- (GLKViewDrawableMultisample)drawableMultisample
{
  return self->_drawableMultisample;
}

- (void)setDrawableMultisample:(GLKViewDrawableMultisample)drawableMultisample
{
  if (self->_drawableMultisample != drawableMultisample)
  {
    self->_shouldDeleteFramebuffer = 1;
    self->_drawableMultisample = drawableMultisample;
  }
}

- (void)bindDrawable
{
}

- (UIImage)snapshot
{
  if (self->_inDraw)
  {
    [MEMORY[0x263EFF940] raise:@"GLKViewSnapshotInDraw" format:@"snapshot method cannot be called from within draw"];
    return 0;
  }
  else
  {
    GLint params = 0;
    [(GLKView *)self _display:0];
    glPushGroupMarkerEXT(0, "Take Snapshot");
    glBindFramebuffer(0x8D40u, self->_resolveFramebuffer);
    size_t v4 = 4 * self->_drawableWidth;
    uint64_t v5 = malloc_type_malloc(self->_drawableHeight * v4, 0x391FEC08uLL);
    if (v5)
    {
      objc_super v6 = v5;
      glGetIntegerv(0xD05u, &params);
      glPixelStorei(0xD05u, 1);
      glReadPixels(0, 0, self->_drawableWidth, self->_drawableHeight, 0x1908u, 0x1401u, v6);
      glPixelStorei(0xD05u, params);
      CFDataRef v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v6, self->_drawableHeight * v4);
      if (v7)
      {
        CFDataRef v8 = v7;
        CGDataProviderRef v9 = CGDataProviderCreateWithCFData(v7);
        if (v9)
        {
          int v10 = v9;
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          CGImageRef v12 = CGImageCreate(self->_drawableWidth, self->_drawableHeight, 8uLL, 0x20uLL, v4, DeviceRGB, 1u, v10, 0, 0, kCGRenderingIntentDefault);
          if (v12)
          {
            uint64_t v13 = v12;
            [(GLKView *)self contentScaleFactor];
            CGFloat v15 = v14;
            CGFloat v16 = (double)(uint64_t)((double)self->_drawableWidth / v14);
            CGFloat v17 = (double)(uint64_t)((double)self->_drawableHeight / v14);
            v21.width = v16;
            v21.height = v17;
            UIGraphicsBeginImageContextWithOptions(v21, 0, v15);
            CurrentContext = UIGraphicsGetCurrentContext();
            CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
            v22.origin.x = 0.0;
            v22.origin.y = 0.0;
            v22.size.width = v16;
            v22.size.height = v17;
            CGContextDrawImage(CurrentContext, v22, v13);
            ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            CGImageRelease(v13);
          }
          else
          {
            ImageFromCurrentImageContext = 0;
          }
          CGColorSpaceRelease(DeviceRGB);
          CGDataProviderRelease(v10);
        }
        else
        {
          ImageFromCurrentImageContext = 0;
        }
        CFRelease(v8);
      }
      else
      {
        ImageFromCurrentImageContext = 0;
      }
      free(v6);
    }
    else
    {
      ImageFromCurrentImageContext = 0;
    }
    glPopGroupMarkerEXT();
  }
  return ImageFromCurrentImageContext;
}

- (void)setEnableSetNeedsDisplay:(BOOL)enableSetNeedsDisplay
{
  self->_enableSetNeedsDisplay = enableSetNeedsDisplay;
}

- (BOOL)enableSetNeedsDisplay
{
  return self->_enableSetNeedsDisplay;
}

- (void)displayLayer:(id)a3
{
  if (self->_enableSetNeedsDisplay) {
    [(GLKView *)self _display:1];
  }
}

- (BOOL)_canDrawContent
{
  return 1;
}

- (BOOL)_controlsOwnScaleFactor
{
  return 1;
}

- (void)display
{
}

- (void)setContentScaleFactor:(double)a3
{
  if (self->_viewContentScaleFactor != a3)
  {
    self->_viewContentScaleFactor = a3;
    self->_shouldDeleteFramebuffer = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)GLKView;
  -[GLKView setContentScaleFactor:](&v6, sel_setContentScaleFactor_);
  v5.receiver = self;
  v5.super_class = (Class)GLKView;
  [(GLKView *)&v5 contentScaleFactor];
  self->_viewContentScaleFactor = v4;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)GLKView;
  [(GLKView *)&v14 layoutSubviews];
  [(GLKView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  p_viewBounds = &self->_viewBounds;
  double Width = CGRectGetWidth(self->_viewBounds);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  if (Width != CGRectGetWidth(v15)) {
    goto LABEL_3;
  }
  v16.origin.x = p_viewBounds->origin.x;
  v16.origin.y = self->_viewBounds.origin.y;
  v16.size.width = self->_viewBounds.size.width;
  v16.size.height = self->_viewBounds.size.height;
  double Height = CGRectGetHeight(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  if (Height != CGRectGetHeight(v17))
  {
LABEL_3:
    p_viewBounds->origin.x = v4;
    self->_viewBounds.origin.y = v6;
    self->_viewBounds.size.width = v8;
    self->_viewBounds.size.height = v10;
    self->_shouldDeleteFramebuffer = 1;
  }
}

- (BOOL)inDraw
{
  return self->_inDraw;
}

- (void)setInDraw:(BOOL)a3
{
  self->_inDraw = a3;
}

- (NSMutableDictionary)drawableProperties
{
  return self->_drawableProperties;
}

- (void)setDrawableProperties:(id)a3
{
}

- (BOOL)shouldDeleteFramebuffer
{
  return self->_shouldDeleteFramebuffer;
}

- (void)setShouldDeleteFramebuffer:(BOOL)a3
{
  self->_shouldDeleteFramebuffer = a3;
}

- (unsigned)resolveFramebuffer
{
  return self->_resolveFramebuffer;
}

- (void)setResolveFramebuffer:(unsigned int)a3
{
  self->_resolveFramebuffer = a3;
}

- (unsigned)resolveColorRenderbuffer
{
  return self->_resolveColorRenderbuffer;
}

- (void)setResolveColorRenderbuffer:(unsigned int)a3
{
  self->_resolveColorRenderbuffer = a3;
}

- (unsigned)multisampleFramebuffer
{
  return self->_multisampleFramebuffer;
}

- (void)setMultisampleFramebuffer:(unsigned int)a3
{
  self->_multisampleFramebuffer = a3;
}

- (unsigned)multisampleColorRenderbuffer
{
  return self->_multisampleColorRenderbuffer;
}

- (void)setMultisampleColorRenderbuffer:(unsigned int)a3
{
  self->_multisampleColorRenderbuffer = a3;
}

- (unsigned)depthRenderbuffer
{
  return self->_depthRenderbuffer;
}

- (void)setDepthRenderbuffer:(unsigned int)a3
{
  self->_GLuint depthRenderbuffer = a3;
}

- (unsigned)stencilRenderbuffer
{
  return self->_stencilRenderbuffer;
}

- (void)setStencilRenderbuffer:(unsigned int)a3
{
  self->_stencilRenderbuffer = a3;
}

- (unsigned)depthStencilRenderbuffer
{
  return self->_depthStencilRenderbuffer;
}

- (void)setDepthStencilRenderbuffer:(unsigned int)a3
{
  self->_depthStencilRenderbuffer = a3;
}

- (CGRect)viewBounds
{
  double x = self->_viewBounds.origin.x;
  double y = self->_viewBounds.origin.y;
  double width = self->_viewBounds.size.width;
  double height = self->_viewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setViewBounds:(CGRect)a3
{
  self->_viewBounds = a3;
}

- (double)viewContentScaleFactor
{
  return self->_viewContentScaleFactor;
}

- (void)setViewContentScaleFactor:(double)a3
{
  self->_viewContentScaleFactor = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (GLKViewDelegate *)delegate;
}

- (NSInteger)drawableWidth
{
  return self->_drawableWidth;
}

- (NSInteger)drawableHeight
{
  return self->_drawableHeight;
}

- (void)drawRectIMP
{
  return self->_drawRectIMP;
}

- (void)setDrawRectIMP:(void *)a3
{
  self->_drawRectIMP = a3;
}

@end