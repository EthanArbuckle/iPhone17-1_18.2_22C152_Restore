@interface AppPromotionDetailPageContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension33AppPromotionDetailPageContentView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension33AppPromotionDetailPageContentView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation AppPromotionDetailPageContentView

- (_TtC20ProductPageExtension33AppPromotionDetailPageContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006DD678();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGFloat v6 = sub_1006D7D84(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006DA2DC();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[AppPromotionDetailPageContentView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  double v10 = v9;
  sub_100019840(0, (unint64_t *)&qword_100954370);
  char v11 = sub_10077CB10();

  id v7 = v10;
  if (v11)
  {
LABEL_5:

    double v10 = 0;
  }

  return v10;
}

- (_TtC20ProductPageExtension33AppPromotionDetailPageContentView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC20ProductPageExtension33AppPromotionDetailPageContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_primaryContent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_secondaryContent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_availabilityLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_promotionKindLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_subtitleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_inlineLearnMoreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_learnMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_learnMoreButtonAction));
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_mediaOverlayStyle;
  uint64_t v4 = sub_10076FE10();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end