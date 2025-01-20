@interface SearchResultBackgroundView
- (_TtC22SubscribePageExtension26SearchResultBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension26SearchResultBackgroundView)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation SearchResultBackgroundView

- (void)layoutSubviews
{
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001CEDD0(v4);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
}

- (_TtC22SubscribePageExtension26SearchResultBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_borderColor) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_backgroundGradientColors) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_gradientLayer) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchResultBackgroundView();
  return -[SearchResultBackgroundView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC22SubscribePageExtension26SearchResultBackgroundView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_borderColor) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_backgroundGradientColors) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_gradientLayer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SearchResultBackgroundView();
  return [(SearchResultBackgroundView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_borderColor));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_gradientLayer);
}

@end