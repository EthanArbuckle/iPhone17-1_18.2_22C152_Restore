@interface CALinearMaskLayer
+ (id)defaultValueForKey:(id)a3;
- (CGColor)foregroundColor;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)setForegroundColor:(CGColor *)a3;
@end

@implementation CALinearMaskLayer

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"foregroundColor"])
  {
    {
      {
        +[CALinearMaskLayer defaultValueForKey:]::color = (uint64_t)black();
      }
    }
    return (id)+[CALinearMaskLayer defaultValueForKey:]::color;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___CALinearMaskLayer;
    return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
  }
}

- (void)setForegroundColor:(CGColor *)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xEA, (const CGAffineTransform *)2, v3);
}

- (CGColor)foregroundColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xEAu, (const CGAffineTransform *)2, v3);
  return (CGColor *)v3[0];
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  return 0;
}

@end