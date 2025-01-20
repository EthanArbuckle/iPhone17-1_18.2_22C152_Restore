@interface LPCustomizationPickerViewController.TransitionAnimator
- (_TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation LPCustomizationPickerViewController.TransitionAnimator

- (_TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator)init
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController18TransitionAnimator_viewController));
}

- (double)transitionDuration:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_unknownObjectRetain();
  v4 = self;
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return 0.8;
}

- (void)animateTransition:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_unknownObjectRetain();
  v5 = self;
  sub_1A36BEBA8(a3);
  swift_release();
  swift_unknownObjectRelease();
}

@end