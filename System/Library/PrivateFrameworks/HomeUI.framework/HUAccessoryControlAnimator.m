@interface HUAccessoryControlAnimator
- (HUAccessoryControlAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation HUAccessoryControlAnimator

- (HUAccessoryControlAnimator)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___HUAccessoryControlAnimator_currentTransitionType) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DashboardAccessoryControlAnimator();
  return [(HUAccessoryControlAnimator *)&v4 init];
}

- (double)transitionDuration:(id)a3
{
  return 0.5181;
}

- (void)animateTransition:(id)a3
{
  char v5 = *((unsigned char *)&self->super.isa + OBJC_IVAR___HUAccessoryControlAnimator_currentTransitionType);
  swift_unknownObjectRetain();
  v6 = self;
  if (v5) {
    sub_1BE536628(a3);
  }
  else {
    sub_1BE535FF0(a3);
  }
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
}

@end