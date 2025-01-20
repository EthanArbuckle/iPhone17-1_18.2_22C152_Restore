@interface TodayCardMarketingLockupOverlayView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TodayCardMarketingLockupOverlayView

- (_TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView *)sub_10010266C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001066B8();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_tapGestureRecognizer);
  v5 = self;
  [v4 removeTarget:v5 action:0];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(TodayCardMarketingLockupOverlayView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_paragraphLabel));
  swift_weakDestroy();
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_impressionsUpdateBlock));
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_clickActionHandler);

  sub_1000194B0(v3);
}

- (void)animationDidStart:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_lockupView;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_lockupView);
  id v6 = a3;
  v7 = self;
  if ([v5 isUserInteractionEnabled]) {
    [*(id *)((char *)&self->super.super.super.super.isa + v4) setUserInteractionEnabled:0];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_lockupView;
  id v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_lockupView);
  id v7 = a3;
  v8 = self;
  if (([v6 isUserInteractionEnabled] & 1) == 0) {
    [*(id *)((char *)&self->super.super.super.super.isa + v5) setUserInteractionEnabled:1];
  }
}

- (void)willMoveToWindow:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  id v5 = a3;
  [(TodayCardMarketingLockupOverlayView *)&v8 willMoveToWindow:v5];
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v7 = Strong;
    sub_1001038E8(Strong);

    swift_unknownObjectWeakAssign();
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  double v5 = sub_100103B5C(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100103D14();
}

- (double)_continuousCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  [(TodayCardMarketingLockupOverlayView *)&v3 _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v5.receiver;
  [(TodayCardMarketingLockupOverlayView *)&v5 _setContinuousCornerRadius:a3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_materialBackground], "_setCornerRadius:continuous:maskedCorners:", 1, 12, a3, v5.receiver, v5.super_class);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  objc_super v5 = (char *)v8.receiver;
  [(TodayCardMarketingLockupOverlayView *)&v8 traitCollectionDidChange:v4];
  id v6 = *(id *)&v5[OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_lockupView];
  id v7 = objc_msgSend(v5, "traitCollection", v8.receiver, v8.super_class);
  sub_100364D8C(v7);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return swift_dynamicCastObjCClass() == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  BOOL v9 = sub_1001067A4(v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v7 = self;
  sub_10010305C(1);
  objc_super v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension35TodayCardMarketingLockupOverlayView_clickActionHandler);
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_1000194B0((uint64_t)v5);
  }
}

@end