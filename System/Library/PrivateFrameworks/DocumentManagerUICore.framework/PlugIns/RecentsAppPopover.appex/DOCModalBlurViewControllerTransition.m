@interface DOCModalBlurViewControllerTransition
- (_TtC17RecentsAppPopover36DOCModalBlurViewControllerTransition)init;
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
  char v5 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover36DOCModalBlurViewControllerTransition_direction);
  swift_unknownObjectRetain();
  v6 = self;
  if (v5) {
    sub_1001FC554(a3);
  }
  else {
    sub_1001FBB8C(a3);
  }
  swift_unknownObjectRelease();
}

- (_TtC17RecentsAppPopover36DOCModalBlurViewControllerTransition)init
{
  result = (_TtC17RecentsAppPopover36DOCModalBlurViewControllerTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover36DOCModalBlurViewControllerTransition_backgroundView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover36DOCModalBlurViewControllerTransition_containerView));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover36DOCModalBlurViewControllerTransition_hostView);
}

@end