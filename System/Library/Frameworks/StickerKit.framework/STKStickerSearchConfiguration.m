@interface STKStickerSearchConfiguration
- (BOOL)visible;
- (STKStickerSearchConfiguration)init;
- (double)fontSize;
- (double)margin;
- (double)spacing;
- (void)setFontSize:(double)a3;
- (void)setMargin:(double)a3;
- (void)setSpacing:(double)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation STKStickerSearchConfiguration

- (double)fontSize
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_fontSize);
  swift_beginAccess();
  return *v2;
}

- (void)setFontSize:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_fontSize);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)margin
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_margin);
  swift_beginAccess();
  return *v2;
}

- (void)setMargin:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_margin);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)spacing
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_spacing);
  swift_beginAccess();
  return *v2;
}

- (void)setSpacing:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___STKStickerSearchConfiguration_spacing);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)visible
{
  v2 = (BOOL *)self + OBJC_IVAR___STKStickerSearchConfiguration_visible;
  swift_beginAccess();
  return *v2;
}

- (void)setVisible:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKStickerSearchConfiguration_visible;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (STKStickerSearchConfiguration)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchConfiguration_fontSize) = (Class)0x4040000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchConfiguration_margin) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerSearchConfiguration_spacing) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___STKStickerSearchConfiguration_visible) = 1;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(STKStickerSearchConfiguration *)&v5 init];
}

@end