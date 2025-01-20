@interface SubscriptionLockupView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)layoutMargins;
- (_TtC22SubscribePageExtension22SubscriptionLockupView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension22SubscriptionLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation SubscriptionLockupView

- (UIEdgeInsets)layoutMargins
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(SubscriptionLockupView *)&v6 layoutMargins];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  ObjectType = (objc_class *)swift_getObjectType();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v9 = self;
  -[SubscriptionLockupView setLayoutMargins:](&v14, "setLayoutMargins:", top, left, bottom, right);
  v10 = *(Class *)((char *)&v9->super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension22SubscriptionLockupView_iapLockupView);
  v13.receiver = v9;
  v13.super_class = ObjectType;
  [(SubscriptionLockupView *)&v13 layoutMargins];
  objc_msgSend(v10, "setLayoutMargins:");
  v11 = *(Class *)((char *)&v9->super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension22SubscriptionLockupView_appLockupView);
  v12.receiver = v9;
  v12.super_class = ObjectType;
  [(SubscriptionLockupView *)&v12 layoutMargins];
  objc_msgSend(v11, "setLayoutMargins:");
}

- (_TtC22SubscribePageExtension22SubscriptionLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension22SubscriptionLockupView *)sub_10062957C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension22SubscriptionLockupView)initWithCoder:(id)a3
{
  double v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension22SubscriptionLockupView_lockupTapBlock);
  *double v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension22SubscriptionLockupView_subscriptionLockupPresenter) = 0;
  id v5 = a3;

  UIEdgeInsets result = (_TtC22SubscribePageExtension22SubscriptionLockupView *)sub_100768A40();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_10075BDE0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = qword_100932258;
  v11 = self;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_10001076C(v5, (uint64_t)qword_100995998);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v12, v5);
  v19.receiver = v11;
  v19.super_class = ObjectType;
  [(SubscriptionLockupView *)&v19 layoutMargins];
  id v13 = [(SubscriptionLockupView *)v11 traitCollection];
  double v14 = sub_1001DD278((uint64_t)v9);
  double v16 = v15;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  double v17 = v14;
  double v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension22SubscriptionLockupView_iapLockupView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  double v2 = (char *)v5.receiver;
  [(SubscriptionLockupView *)&v5 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension22SubscriptionLockupView_iapLockupView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  double v4 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension22SubscriptionLockupView_appLockupView];
  [v2 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void).cxx_destruct
{
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension22SubscriptionLockupView_lockupTapBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22SubscriptionLockupView_appLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22SubscriptionLockupView_iapLockupView));

  swift_release();
}

@end