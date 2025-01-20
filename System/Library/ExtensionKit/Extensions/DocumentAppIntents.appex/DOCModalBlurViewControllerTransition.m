@interface DOCModalBlurViewControllerTransition
- (_TtC18DocumentAppIntents36DOCModalBlurViewControllerTransition)init;
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
  char v5 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18DocumentAppIntents36DOCModalBlurViewControllerTransition_direction);
  swift_unknownObjectRetain();
  v6 = self;
  if (v5) {
    sub_100329204(a3);
  }
  else {
    sub_10032883C(a3);
  }
  swift_unknownObjectRelease();
}

- (_TtC18DocumentAppIntents36DOCModalBlurViewControllerTransition)init
{
  result = (_TtC18DocumentAppIntents36DOCModalBlurViewControllerTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents36DOCModalBlurViewControllerTransition_backgroundView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents36DOCModalBlurViewControllerTransition_containerView));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents36DOCModalBlurViewControllerTransition_hostView);
}

@end