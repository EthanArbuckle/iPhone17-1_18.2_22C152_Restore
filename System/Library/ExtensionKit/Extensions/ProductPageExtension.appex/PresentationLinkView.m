@interface PresentationLinkView
- (_TtC20ProductPageExtension20PresentationLinkView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension20PresentationLinkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PresentationLinkView

- (_TtC20ProductPageExtension20PresentationLinkView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20PresentationLinkView *)sub_100460168(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20PresentationLinkView)initWithCoder:(id)a3
{
  result = (_TtC20ProductPageExtension20PresentationLinkView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  swift_getObjectType();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension20PresentationLinkView_linkView);
  v12 = self;
  sub_100770A80();
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;
  sub_100770A80();
  double v9 = v8;
  double v11 = v10;
  sub_100770A80();
  objc_msgSend(v3, "setFrame:", v9, v11, CGRectGetWidth(v14), v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20PresentationLinkView_linkView));
}

@end