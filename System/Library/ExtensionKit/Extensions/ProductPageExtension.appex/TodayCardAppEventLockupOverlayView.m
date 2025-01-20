@interface TodayCardAppEventLockupOverlayView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TodayCardAppEventLockupOverlayView

- (_TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView *)sub_1005D455C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005D6D2C();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView_tapGestureRecognizer);
  v5 = self;
  [v4 removeTarget:v5 action:0];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(TodayCardAppEventLockupOverlayView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView_tapGestureRecognizer));
  swift_weakDestroy();
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView_impressionsUpdateBlock));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView_clickActionHandler);

  sub_1000194B0(v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1005D4EB4(width);
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
  sub_1005D508C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1005D5384(a3);
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
  BOOL v9 = sub_1005D6E04(v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  uint64_t v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension34TodayCardAppEventLockupOverlayView_clickActionHandler);
  if (v3)
  {
    id v5 = a3;
    id v7 = self;
    uint64_t v6 = sub_1000194C0((uint64_t)v3);
    v3(v6);
    sub_1000194B0((uint64_t)v3);
  }
}

@end