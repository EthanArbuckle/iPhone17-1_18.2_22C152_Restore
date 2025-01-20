@interface AppPromotionLearnMoreView
- (_TtC20ProductPageExtension25AppPromotionLearnMoreView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension25AppPromotionLearnMoreView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppPromotionLearnMoreView

- (_TtC20ProductPageExtension25AppPromotionLearnMoreView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006394FC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100638D28();
}

- (_TtC20ProductPageExtension25AppPromotionLearnMoreView)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension25AppPromotionLearnMoreView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25AppPromotionLearnMoreView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25AppPromotionLearnMoreView_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25AppPromotionLearnMoreView_learnMoreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25AppPromotionLearnMoreView_backButtonAction));
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension25AppPromotionLearnMoreView_mediaOverlayStyle;
  uint64_t v4 = sub_10076FE10();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end