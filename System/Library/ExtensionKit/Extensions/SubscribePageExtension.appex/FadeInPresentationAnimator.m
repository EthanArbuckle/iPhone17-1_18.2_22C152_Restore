@interface FadeInPresentationAnimator
- (_TtC22SubscribePageExtension26FadeInPresentationAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation FadeInPresentationAnimator

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1004AB99C(a3);
  swift_unknownObjectRelease();
}

- (_TtC22SubscribePageExtension26FadeInPresentationAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(FadeInPresentationAnimator *)&v3 init];
}

@end