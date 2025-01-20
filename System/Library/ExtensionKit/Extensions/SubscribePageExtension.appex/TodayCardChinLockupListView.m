@interface TodayCardChinLockupListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension27TodayCardChinLockupListView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension27TodayCardChinLockupListView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TodayCardChinLockupListView

- (_TtC22SubscribePageExtension27TodayCardChinLockupListView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension27TodayCardChinLockupListView *)sub_10074AAEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension27TodayCardChinLockupListView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10074E3A8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10074BE34();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_10074C0F8();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_lockupIconViewReusePool;
  uint64_t v4 = sub_10000FB44(&qword_10095B7B8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_weakDestroy();
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_impressionsUpdateBlock));
  double v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_todayCardStyle;
  uint64_t v6 = sub_1007647E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_clickActionHandler);

  sub_10001A4D0(v7);
}

@end