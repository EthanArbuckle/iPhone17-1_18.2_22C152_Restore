@interface CrossFadeAnimator
- (_TtC15ConversationKit17CrossFadeAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation CrossFadeAnimator

- (_TtC15ConversationKit17CrossFadeAnimator)init
{
  return (_TtC15ConversationKit17CrossFadeAnimator *)CrossFadeAnimator.init()();
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  CrossFadeAnimator.animateTransition(using:)(a3);
  swift_unknownObjectRelease();
}

@end