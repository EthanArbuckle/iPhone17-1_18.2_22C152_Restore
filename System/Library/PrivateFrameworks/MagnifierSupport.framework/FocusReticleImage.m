@interface FocusReticleImage
- (_TtC16MagnifierSupport17FocusReticleImage)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport17FocusReticleImage)initWithFrame:(CGRect)a3;
- (_TtC16MagnifierSupport17FocusReticleImage)initWithImage:(id)a3;
- (_TtC16MagnifierSupport17FocusReticleImage)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)tintColorDidChange;
@end

@implementation FocusReticleImage

- (_TtC16MagnifierSupport17FocusReticleImage)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FocusReticleImage();
  v7 = -[FocusReticleImage initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_2358AA8BC();
  [(FocusReticleImage *)v7 setContentMode:0];

  return v7;
}

- (_TtC16MagnifierSupport17FocusReticleImage)initWithCoder:(id)a3
{
  result = (_TtC16MagnifierSupport17FocusReticleImage *)sub_23594A968();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_2358AA8BC();
}

- (_TtC16MagnifierSupport17FocusReticleImage)initWithImage:(id)a3
{
  id v3 = a3;
  result = (_TtC16MagnifierSupport17FocusReticleImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport17FocusReticleImage)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC16MagnifierSupport17FocusReticleImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end