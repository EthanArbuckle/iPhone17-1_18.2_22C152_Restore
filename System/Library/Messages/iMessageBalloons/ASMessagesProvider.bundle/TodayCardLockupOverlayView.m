@interface TodayCardLockupOverlayView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityElements;
- (_TtC18ASMessagesProvider26TodayCardLockupOverlayView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider26TodayCardLockupOverlayView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)setAccessibilityElements:(id)isa;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TodayCardLockupOverlayView

- (_TtC18ASMessagesProvider26TodayCardLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider26TodayCardLockupOverlayView *)sub_4B3EEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider26TodayCardLockupOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4B7078();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider26TodayCardLockupOverlayView_tapGestureRecognizer);
  v5 = self;
  [v4 removeTarget:v5 action:0];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(TodayCardLockupOverlayView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26TodayCardLockupOverlayView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26TodayCardLockupOverlayView_tapGestureRecognizer));
  swift_weakDestroy();
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider26TodayCardLockupOverlayView_impressionsUpdateBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26TodayCardLockupOverlayView_separatorView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider26TodayCardLockupOverlayView_clickActionHandler);

  sub_13308(v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = sub_771DE0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider26TodayCardLockupOverlayView_lockupView);
  v10 = self;
  sub_11CDF4((uint64_t)v8);
  [v9 layoutMargins];
  id v11 = [v9 traitCollection];
  sub_2005C4((uint64_t)v8);
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  double v14 = fmax(v13, 79.0);
  double v15 = width;
  result.height = v14;
  result.CGFloat width = v15;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4B4878();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(TodayCardLockupOverlayView *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, "traitCollection", v7.receiver, v7.super_class);
  sub_11BD10(v6);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return swift_dynamicCastObjCClass() == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_4B716C(v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  uint64_t v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC18ASMessagesProvider26TodayCardLockupOverlayView_clickActionHandler);
  if (v3)
  {
    id v5 = a3;
    id v7 = self;
    uint64_t v6 = sub_13318((uint64_t)v3);
    v3(v6);
    sub_13308((uint64_t)v3);
  }
}

- (NSArray)accessibilityElements
{
  sub_FD50(&qword_953E80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_78DBA0;
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider26TodayCardLockupOverlayView_lockupView);
  *(void *)(v3 + 56) = type metadata accessor for CrossLinkLockupView();
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
  [(TodayCardLockupOverlayView *)&v8 setAccessibilityElements:isa];
}

@end