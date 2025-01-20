@interface TodayListCardLockupContainer
- (CGRect)frame;
- (_TtC22SubscribePageExtension28TodayListCardLockupContainer)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension28TodayListCardLockupContainer)initWithFrame:(CGRect)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)applySizeCategoryUpdates;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TodayListCardLockupContainer

- (_TtC22SubscribePageExtension28TodayListCardLockupContainer)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28TodayListCardLockupContainer *)sub_10015B208(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28TodayListCardLockupContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10015F60C();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TodayListCardLockupContainer();
  [(TodayListCardLockupContainer *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_10015B534(x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_10015B7E4();
}

- (void)applySizeCategoryUpdates
{
  double v2 = self;
  sub_10015BFEC();
}

- (void)didMoveToSuperview
{
  double v2 = self;
  sub_10015CB80();
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10015FBF0();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_weakDestroy();
  swift_weakDestroy();
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_impressionsUpdateBlock));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_currentTouch);
}

@end