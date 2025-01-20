@interface TodayCardChinSingleLockupView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityElements;
- (_TtC18ASMessagesProvider29TodayCardChinSingleLockupView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider29TodayCardChinSingleLockupView)initWithFrame:(CGRect)a3;
- (void)handleTap;
- (void)layoutSubviews;
- (void)setAccessibilityElements:(id)isa;
@end

@implementation TodayCardChinSingleLockupView

- (_TtC18ASMessagesProvider29TodayCardChinSingleLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider29TodayCardChinSingleLockupView *)sub_6BB1CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider29TodayCardChinSingleLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_6BD690();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_6BC6C8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_6BC8B4(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return swift_dynamicCastObjCClass() == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  BOOL v9 = sub_6BD758(v7);

  return v9;
}

- (void)handleTap
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC18ASMessagesProvider29TodayCardChinSingleLockupView_clickActionHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_13318((uint64_t)v2);
    v2(v3);
    sub_13308((uint64_t)v2);
  }
}

- (NSArray)accessibilityElements
{
  sub_FD50(&qword_953E80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_78DBA0;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider29TodayCardChinSingleLockupView_lockupView);
  *(void *)(v3 + 56) = type metadata accessor for TodayCardLockupView();
  *(void *)(v3 + 32) = v4;
  id v5 = v4;
  v6.super.isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (void)setAccessibilityElements:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_77D890();
    NSArray v6 = self;
    isa = sub_77D880().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TodayCardChinSingleLockupView *)&v8 setAccessibilityElements:isa];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29TodayCardChinSingleLockupView_lockupView));
  swift_weakDestroy();
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider29TodayCardChinSingleLockupView_impressionsUpdateBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29TodayCardChinSingleLockupView_tapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider29TodayCardChinSingleLockupView_clickActionHandler);

  sub_13308(v3);
}

@end