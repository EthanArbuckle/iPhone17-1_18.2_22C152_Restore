@interface MFCardContainerController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC16MagnifierSupport25MFCardContainerController)init;
- (void)dealloc;
- (void)handleLongPress:(id)a3;
- (void)handlePanGestureWithSender:(id)a3;
@end

@implementation MFCardContainerController

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_2358F09F4(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (void)handlePanGestureWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2358F0BB0(v4);
}

- (void)handleLongPress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2358F17E0(v4);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  sub_2358F2388();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(MFCardContainerController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_containerView));
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_containerHeightConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_containerTopConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_draggingAnimator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_cardHeightConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_xPositionConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_yPositionConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_cardDragAndDropAnimator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_collapsingMiddleAnimator));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_fadingBottomAnimator);
}

- (_TtC16MagnifierSupport25MFCardContainerController)init
{
  result = (_TtC16MagnifierSupport25MFCardContainerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end