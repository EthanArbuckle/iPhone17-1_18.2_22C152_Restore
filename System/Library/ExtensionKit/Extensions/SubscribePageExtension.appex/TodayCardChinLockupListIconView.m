@interface TodayCardChinLockupListIconView
- (_TtC22SubscribePageExtension31TodayCardChinLockupListIconView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension31TodayCardChinLockupListIconView)initWithFrame:(CGRect)a3;
- (void)handleTap;
- (void)layoutSubviews;
@end

@implementation TodayCardChinLockupListIconView

- (_TtC22SubscribePageExtension31TodayCardChinLockupListIconView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31TodayCardChinLockupListIconView *)sub_10074CFD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31TodayCardChinLockupListIconView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_artworkView;
  sub_100758360();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_100758160();
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_clickAction;
  uint64_t v8 = sub_10000FB44((uint64_t *)&unk_1009443A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);

  result = (_TtC22SubscribePageExtension31TodayCardChinLockupListIconView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TodayCardChinLockupListIconView *)&v3 layoutSubviews];
  objc_msgSend(v2, "bounds", v3.receiver, v3.super_class);
  sub_1007582C0();
}

- (void)handleTap
{
  id v2 = self;
  sub_10074D2F0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_artworkView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_clickAction, &qword_1009443B0);
}

@end