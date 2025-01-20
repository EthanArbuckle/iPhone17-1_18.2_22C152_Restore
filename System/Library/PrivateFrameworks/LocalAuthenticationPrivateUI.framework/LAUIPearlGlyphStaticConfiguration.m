@interface LAUIPearlGlyphStaticConfiguration
+ (id)createDefaultConfiguration;
+ (id)createSystemApertureConfiguration;
- (BOOL)secureVariantEnabled;
- (LAUIPearlGlyphStaticConfiguration)init;
- (__n128)_init;
- (double)checkmarkThicknessScale;
- (double)lineThicknessScale;
- (int64_t)initialStyle;
- (int64_t)pathStyle;
- (int64_t)secureVariantType;
- (void)setCheckmarkThicknessScale:(double)a3;
- (void)setInitialStyle:(int64_t)a3;
- (void)setLineThicknessScale:(double)a3;
- (void)setPathStyle:(int64_t)a3;
- (void)setSecureVariantEnabled:(BOOL)a3;
- (void)setSecureVariantType:(int64_t)a3;
@end

@implementation LAUIPearlGlyphStaticConfiguration

- (LAUIPearlGlyphStaticConfiguration)init
{
  return 0;
}

+ (id)createDefaultConfiguration
{
  v2 = [LAUIPearlGlyphStaticConfiguration alloc];
  -[LAUIPearlGlyphStaticConfiguration _init](v2);
  return result;
}

- (__n128)_init
{
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)LAUIPearlGlyphStaticConfiguration;
    v1 = (__n128 *)objc_msgSendSuper2(&v7, sel_init);
    if (v1)
    {
      v1[1].n128_u64[0] = 0;
      v1[1].n128_u64[1] = 0;
      __asm { FMOV            V0.2D, #1.0 }
      v1[2] = result;
      v1->n128_u8[8] = 0;
      v1[3].n128_u64[0] = 0;
    }
  }
  return result;
}

+ (id)createSystemApertureConfiguration
{
  *(void *)&double v2 = -[LAUIPearlGlyphStaticConfiguration _init]([LAUIPearlGlyphStaticConfiguration alloc]).n128_u64[0];
  v4 = v3;
  objc_msgSend(v3, "setPathStyle:", 1, v2);
  [v4 setLineThicknessScale:1.190476];
  return v4;
}

- (int64_t)initialStyle
{
  return self->_initialStyle;
}

- (void)setInitialStyle:(int64_t)a3
{
  self->_initialStyle = a3;
}

- (int64_t)pathStyle
{
  return self->_pathStyle;
}

- (void)setPathStyle:(int64_t)a3
{
  self->_pathStyle = a3;
}

- (double)lineThicknessScale
{
  return self->_lineThicknessScale;
}

- (void)setLineThicknessScale:(double)a3
{
  self->_lineThicknessScale = a3;
}

- (double)checkmarkThicknessScale
{
  return self->_checkmarkThicknessScale;
}

- (void)setCheckmarkThicknessScale:(double)a3
{
  self->_checkmarkThicknessScale = a3;
}

- (BOOL)secureVariantEnabled
{
  return self->_secureVariantEnabled;
}

- (void)setSecureVariantEnabled:(BOOL)a3
{
  self->_secureVariantEnabled = a3;
}

- (int64_t)secureVariantType
{
  return self->_secureVariantType;
}

- (void)setSecureVariantType:(int64_t)a3
{
  self->_secureVariantType = a3;
}

@end