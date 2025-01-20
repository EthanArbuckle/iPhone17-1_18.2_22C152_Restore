@interface CUIPSDLayerEffectComponent
- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4;
- (BOOL)visible;
- (CUIPSDLayerEffectComponent)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4;
- (NSString)name;
- (id)_colorFromShapeEffectValue:(id)a3;
- (unsigned)effectType;
- (void)dealloc;
- (void)setName:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation CUIPSDLayerEffectComponent

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  v8 = @"Effect Component not yet supported";
  v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1]);
  if (a4) {
    *a4 = v5;
  }
  return 0;
}

- (CUIPSDLayerEffectComponent)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  v6 = +[NSAssertionHandler currentHandler];
  Name = sel_getName(a2);
  [(NSAssertionHandler *)v6 handleFailureInMethod:a2, self, @"CUIPSLayerEffectsPreset.m", 151, @"Abstract method %s called directly on %@.  This must be implemented by subclasses", Name, objc_opt_class() object file lineNumber description];
  return 0;
}

- (id)_colorFromShapeEffectValue:(id)a3
{
  v3.i32[0] = a3.var4;
  v3.i32[1] = a3.var4 >> 8;
  float64x2_t v9 = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v3, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u)));
  double v10 = (float)((float)a3.var2.b / 255.0);
  uint64_t v11 = 0x3FF0000000000000;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v5 = CGColorCreate(SRGB, v9.f64);
  v6 = [CUIColor alloc];
  NSErrorUserInfoKey v7 = -[CUIColor initWithCGColor:](v6, "initWithCGColor:", v5, *(_OWORD *)&v9, *(void *)&v10, v11);
  CGColorRelease(v5);
  return v7;
}

- (unsigned)effectType
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectComponent;
  [(CUIPSDLayerEffectComponent *)&v3 dealloc];
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

@end