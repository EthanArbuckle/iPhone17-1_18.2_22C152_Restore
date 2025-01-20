@interface DOCModalBlurViewControllerTransition
- (_TtC33com_apple_DocumentManager_Service36DOCModalBlurViewControllerTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation DOCModalBlurViewControllerTransition

- (double)transitionDuration:(id)a3
{
  return 1.0;
}

- (void)animateTransition:(id)a3
{
  char v5 = *((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC33com_apple_DocumentManager_Service36DOCModalBlurViewControllerTransition_direction);
  swift_unknownObjectRetain();
  v6 = self;
  if (v5) {
    sub_100221F18(a3);
  }
  else {
    sub_100221550(a3);
  }
  swift_unknownObjectRelease();
}

- (_TtC33com_apple_DocumentManager_Service36DOCModalBlurViewControllerTransition)init
{
  result = (_TtC33com_apple_DocumentManager_Service36DOCModalBlurViewControllerTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service36DOCModalBlurViewControllerTransition_backgroundView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service36DOCModalBlurViewControllerTransition_containerView));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service36DOCModalBlurViewControllerTransition_hostView);
}

@end