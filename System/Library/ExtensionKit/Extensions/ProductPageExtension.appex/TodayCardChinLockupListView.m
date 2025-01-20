@interface TodayCardChinLockupListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension27TodayCardChinLockupListView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27TodayCardChinLockupListView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TodayCardChinLockupListView

- (_TtC20ProductPageExtension27TodayCardChinLockupListView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension27TodayCardChinLockupListView *)sub_1003B8ECC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension27TodayCardChinLockupListView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003BC818();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003BA214();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1003BA4D8();
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
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_lockupIconViewReusePool;
  uint64_t v4 = sub_10000D280(&qword_10095EE30);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_weakDestroy();
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_impressionsUpdateBlock));
  double v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_todayCardStyle;
  uint64_t v6 = sub_100778E40();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_clickActionHandler);

  sub_1000194B0(v7);
}

@end