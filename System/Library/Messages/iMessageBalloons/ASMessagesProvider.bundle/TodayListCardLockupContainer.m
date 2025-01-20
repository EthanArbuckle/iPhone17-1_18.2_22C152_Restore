@interface TodayListCardLockupContainer
- (CGRect)frame;
- (_TtC18ASMessagesProvider28TodayListCardLockupContainer)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider28TodayListCardLockupContainer)initWithFrame:(CGRect)a3;
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

- (_TtC18ASMessagesProvider28TodayListCardLockupContainer)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider28TodayListCardLockupContainer *)sub_70C174(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider28TodayListCardLockupContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_710568();
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
  sub_70C4A0(x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_70C750();
}

- (void)applySizeCategoryUpdates
{
  double v2 = self;
  sub_70CF58();
}

- (void)didMoveToSuperview
{
  double v2 = self;
  sub_70DAEC();
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_710B4C();
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
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider28TodayListCardLockupContainer_impressionsUpdateBlock));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider28TodayListCardLockupContainer_currentTouch);
}

@end