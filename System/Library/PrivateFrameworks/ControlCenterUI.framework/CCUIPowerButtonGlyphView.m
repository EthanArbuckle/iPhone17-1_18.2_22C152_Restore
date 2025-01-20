@interface CCUIPowerButtonGlyphView
- (CCUIPowerButtonGlyphView)initWithCoder:(id)a3;
- (CCUIPowerButtonGlyphView)initWithFrame:(CGRect)a3;
- (CCUIPowerButtonGlyphView)initWithSymbolConfiguration:(id)a3;
- (UIImageView)imageView;
- (void)layoutSubviews;
@end

@implementation CCUIPowerButtonGlyphView

- (void)layoutSubviews
{
  v2 = self;
  sub_1D7B1A9E4();
}

- (CCUIPowerButtonGlyphView)initWithSymbolConfiguration:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for PowerButtonGlyphView());
  v5 = (CCUIPowerButtonGlyphView *)sub_1D7BA8EFC(a3, 0.0, 0.0, 0.0, 0.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (CCUIPowerButtonGlyphView)initWithCoder:(id)a3
{
  result = (CCUIPowerButtonGlyphView *)sub_1D7BB78A8();
  __break(1u);
  return result;
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR___CCUIPowerButtonGlyphView_imageView));
}

- (CCUIPowerButtonGlyphView)initWithFrame:(CGRect)a3
{
  result = (CCUIPowerButtonGlyphView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end