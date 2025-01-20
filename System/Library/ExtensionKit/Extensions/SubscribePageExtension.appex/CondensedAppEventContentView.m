@interface CondensedAppEventContentView
- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension25CondensedAppEventCardView)accessibilityAppEventView;
- (_TtC22SubscribePageExtension28CondensedAppEventContentView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension28CondensedAppEventContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CondensedAppEventContentView

- (_TtC22SubscribePageExtension28CondensedAppEventContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28CondensedAppEventContentView *)sub_100472D20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28CondensedAppEventContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_eventCardView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CondensedAppEventCardView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_interRowSpacing) = 0;

  result = (_TtC22SubscribePageExtension28CondensedAppEventContentView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100472F98();
}

- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_lockupView);
}

- (_TtC22SubscribePageExtension25CondensedAppEventCardView)accessibilityAppEventView
{
  return (_TtC22SubscribePageExtension25CondensedAppEventCardView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_eventCardView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_lockupView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension28CondensedAppEventContentView_eventCardView);
}

@end