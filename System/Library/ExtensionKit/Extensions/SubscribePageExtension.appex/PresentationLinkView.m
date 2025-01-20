@interface PresentationLinkView
- (_TtC22SubscribePageExtension20PresentationLinkView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20PresentationLinkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PresentationLinkView

- (_TtC22SubscribePageExtension20PresentationLinkView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20PresentationLinkView *)sub_1004D7548(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20PresentationLinkView)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension20PresentationLinkView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  swift_getObjectType();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension20PresentationLinkView_linkView);
  v12 = self;
  sub_10075C580();
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;
  sub_10075C580();
  double v9 = v8;
  double v11 = v10;
  sub_10075C580();
  objc_msgSend(v3, "setFrame:", v9, v11, CGRectGetWidth(v14), v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20PresentationLinkView_linkView));
}

@end