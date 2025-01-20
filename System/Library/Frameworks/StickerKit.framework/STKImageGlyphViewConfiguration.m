@interface STKImageGlyphViewConfiguration
- (BOOL)doesSupportImageGlyph;
- (BOOL)doesSupportStickersApp;
- (BOOL)isInPopover;
- (BOOL)isKeyboardMinorEdgeWidth;
- (STKImageGlyphViewConfiguration)init;
- (double)keyboardWidth;
- (double)scale;
- (double)screenToNativeScaleRatio;
- (void)setDoesSupportImageGlyph:(BOOL)a3;
- (void)setDoesSupportStickersApp:(BOOL)a3;
- (void)setIsInPopover:(BOOL)a3;
- (void)setIsKeyboardMinorEdgeWidth:(BOOL)a3;
- (void)setKeyboardWidth:(double)a3;
- (void)setScale:(double)a3;
- (void)setScreenToNativeScaleRatio:(double)a3;
@end

@implementation STKImageGlyphViewConfiguration

- (double)keyboardWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_keyboardWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setKeyboardWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_keyboardWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)isKeyboardMinorEdgeWidth
{
  v2 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_isKeyboardMinorEdgeWidth;
  swift_beginAccess();
  return *v2;
}

- (void)setIsKeyboardMinorEdgeWidth:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_isKeyboardMinorEdgeWidth;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isInPopover
{
  v2 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_isInPopover;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInPopover:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_isInPopover;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)doesSupportImageGlyph
{
  v2 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_doesSupportImageGlyph;
  swift_beginAccess();
  return *v2;
}

- (void)setDoesSupportImageGlyph:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_doesSupportImageGlyph;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)scale
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_scale);
  swift_beginAccess();
  return *v2;
}

- (void)setScale:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_scale);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)screenToNativeScaleRatio
{
  v2 = (double *)((char *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_screenToNativeScaleRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setScreenToNativeScaleRatio:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_screenToNativeScaleRatio);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)doesSupportStickersApp
{
  v2 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_doesSupportStickersApp;
  swift_beginAccess();
  return *v2;
}

- (void)setDoesSupportStickersApp:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___STKImageGlyphViewConfiguration_doesSupportStickersApp;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (STKImageGlyphViewConfiguration)init
{
  result = (STKImageGlyphViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end