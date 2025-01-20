@interface CEKColoredPaletteSlider
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CEKColoredPaletteSlider)initWithCoder:(id)a3;
- (CEKColoredPaletteSlider)initWithFrame:(CGRect)a3;
- (NSArray)colors;
- (void)layoutSubviews;
- (void)setColors:(id)a3;
- (void)valueChanged:(id)a3;
@end

@implementation CEKColoredPaletteSlider

- (NSArray)colors
{
  v2 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CEKColoredPaletteSlider_colors);
  swift_beginAccess();
  if (*v2)
  {
    sub_1BEE63BF4(0, &qword_1EA1364F0);
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1BEE6ECB8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setColors:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1BEE63BF4(0, &qword_1EA1364F0);
    uint64_t v3 = sub_1BEE6ECC8();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CEKColoredPaletteSlider_colors);
  swift_beginAccess();
  uint64_t *v5 = v3;
  v6 = self;
  swift_bridgeObjectRelease();
  sub_1BEE62AC4();
}

- (CEKColoredPaletteSlider)initWithFrame:(CGRect)a3
{
  return (CEKColoredPaletteSlider *)sub_1BEE62E64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  CEKColoredPaletteSlider.layoutSubviews()();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  [(CEKColoredPaletteSlider *)v8 bounds];
  CGRect v13 = CGRectInset(v12, -10.0, -10.0);
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  BOOL v9 = CGRectContainsPoint(v13, v11);

  return v9;
}

- (void)valueChanged:(id)a3
{
}

- (CEKColoredPaletteSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo23CEKColoredPaletteSliderC13CameraEditKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CEKColoredPaletteSlider_trackLayer);
}

@end