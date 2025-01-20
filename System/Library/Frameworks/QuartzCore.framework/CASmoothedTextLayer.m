@interface CASmoothedTextLayer
- (unsigned)fontSmoothingStyle;
- (void)setFontSmoothingStyle:(unsigned int)a3;
@end

@implementation CASmoothedTextLayer

- (void)setFontSmoothingStyle:(unsigned int)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super.super._attr.layer, (const void *)0xE8, (const CGAffineTransform *)0xC, (double *)&v3);
}

- (unsigned)fontSmoothingStyle
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super.super._attr.layer, 0xE8u, (const CGAffineTransform *)0xC, (id *)&v3);
  return v3;
}

@end