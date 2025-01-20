@interface IHKHarmonizationRequest
- (BOOL)forceHarmonization;
- (CGImage)bg;
- (CGImage)fg;
- (IHKHarmonizationRequest)initWithForeground:(CGImage *)a3 background:(CGImage *)a4;
- (IHKHarmonizationRequest)initWithForeground:(CGImage *)a3 background:(CGImage *)a4 forceHarmonization:(BOOL)a5;
- (IHKHarmonizationRequest)initWithForeground:(CGImage *)a3 background:(CGImage *)a4 forceHarmonization:(BOOL)a5 harmonizationStrength:(float)a6;
- (float)harmonizationStrength;
- (void)dealloc;
@end

@implementation IHKHarmonizationRequest

- (IHKHarmonizationRequest)initWithForeground:(CGImage *)a3 background:(CGImage *)a4
{
  return (IHKHarmonizationRequest *)MEMORY[0x270F9A6D0](self, sel_initWithForeground_background_forceHarmonization_, a3, a4, 0);
}

- (IHKHarmonizationRequest)initWithForeground:(CGImage *)a3 background:(CGImage *)a4 forceHarmonization:(BOOL)a5
{
  v8 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, (uint64_t)a3, (uint64_t)a4, a5);
  objc_msgSend_floatForKey_(v8, v9, @"com.apple.ImageHarmonizationKit.harmonizationStrength", v10, v11);
  float v13 = v12;

  LODWORD(v15) = 1.0;
  if (v13 != 0.0)
  {
    *(float *)&double v15 = v13;
    if (v13 < 0.0) {
      double v15 = 0.0;
    }
  }
  return (IHKHarmonizationRequest *)objc_msgSend_initWithForeground_background_forceHarmonization_harmonizationStrength_(self, v14, (uint64_t)a3, (uint64_t)a4, 0, v15);
}

- (IHKHarmonizationRequest)initWithForeground:(CGImage *)a3 background:(CGImage *)a4 forceHarmonization:(BOOL)a5 harmonizationStrength:(float)a6
{
  v14.receiver = self;
  v14.super_class = (Class)IHKHarmonizationRequest;
  uint64_t v10 = [(IHKHarmonizationRequest *)&v14 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_forceHarmonization = a5;
    v10->_fg = CGImageRetain(a3);
    v11->_bg = CGImageRetain(a4);
    v11->_harmonizationStrength = a6;
    float v12 = v11;
  }

  return v11;
}

- (void)dealloc
{
  CGImageRelease(self->_fg);
  CGImageRelease(self->_bg);
  v3.receiver = self;
  v3.super_class = (Class)IHKHarmonizationRequest;
  [(IHKHarmonizationRequest *)&v3 dealloc];
}

- (BOOL)forceHarmonization
{
  return self->_forceHarmonization;
}

- (CGImage)fg
{
  return self->_fg;
}

- (CGImage)bg
{
  return self->_bg;
}

- (float)harmonizationStrength
{
  return self->_harmonizationStrength;
}

@end