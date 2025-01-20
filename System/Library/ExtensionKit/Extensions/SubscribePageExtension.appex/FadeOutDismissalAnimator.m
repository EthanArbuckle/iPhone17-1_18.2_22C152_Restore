@interface FadeOutDismissalAnimator
- (_TtC22SubscribePageExtension24FadeOutDismissalAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation FadeOutDismissalAnimator

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1005DA608(a3);
  swift_unknownObjectRelease();
}

- (_TtC22SubscribePageExtension24FadeOutDismissalAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(FadeOutDismissalAnimator *)&v3 init];
}

@end