@interface PlusButtonBlurContainerView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387327PlusButtonBlurContainerView)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387327PlusButtonBlurContainerView)initWithFrame:(CGRect)a3;
- (void)updateRasterizationScale;
@end

@implementation PlusButtonBlurContainerView

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387327PlusButtonBlurContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387327PlusButtonBlurContainerView *)sub_18F5454B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387327PlusButtonBlurContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387327PlusButtonBlurContainerView_rasterizationPercent) = (Class)0x3FF0000000000000;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PlusButtonBlurContainerView();
  id v4 = a3;
  v5 = [(PlusButtonBlurContainerView *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_18F54570C();
  }
  return v6;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18F7B97E0();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  char v8 = sub_18F54588C(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (void)updateRasterizationScale
{
  v2 = self;
  sub_18F545A04();
}

@end