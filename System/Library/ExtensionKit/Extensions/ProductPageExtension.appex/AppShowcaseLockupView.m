@interface AppShowcaseLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension21AppShowcaseLockupView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension21AppShowcaseLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppShowcaseLockupView

- (_TtC20ProductPageExtension21AppShowcaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21AppShowcaseLockupView *)sub_10069666C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension21AppShowcaseLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10069AE24();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006995D4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_100695188();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AppShowcaseLockupView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AppShowcaseLockupView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AppShowcaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AppShowcaseLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AppShowcaseLockupView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AppShowcaseLockupView_offerLabel));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension21AppShowcaseLockupView_offerLabelPresenter, &qword_10094BAD0);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AppShowcaseLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21AppShowcaseLockupView_crossLinkSubtitleLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension21AppShowcaseLockupView_type;
  uint64_t v4 = sub_10076B790();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end