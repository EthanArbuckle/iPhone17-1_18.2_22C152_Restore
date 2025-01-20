@interface LegacyMultiAppFallbackView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension26LegacyMultiAppFallbackView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension26LegacyMultiAppFallbackView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LegacyMultiAppFallbackView

- (_TtC20ProductPageExtension26LegacyMultiAppFallbackView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension26LegacyMultiAppFallbackView *)sub_1006AEF84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension26LegacyMultiAppFallbackView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension26LegacyMultiAppFallbackView_imageLayers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension26LegacyMultiAppFallbackView_configuration) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension26LegacyMultiAppFallbackView *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1006AFEBC();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006AFAF0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end