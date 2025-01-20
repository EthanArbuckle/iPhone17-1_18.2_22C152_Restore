@interface BouncyToRectAnimation
- (_TtC18ASMessagesProvider21BouncyToRectAnimation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation BouncyToRectAnimation

- (double)transitionDuration:(id)a3
{
  return 0.7;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v9 = self;
  sub_C4B2C(0);
  sub_6BF40C(a3);
  if (*((unsigned char *)&v9->super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider21BouncyToRectAnimation_shouldAnimateTabBar) == 1
    && (v5 = (_TtC18ASMessagesProvider21BouncyToRectAnimation *)[a3 viewControllerForKey:UITransitionContextToViewControllerKey]) != 0)
  {
    v6 = v5;
    self;
    v7 = (void *)swift_dynamicCastObjCClass();
    if (v7) {
      sub_2C2F3C(v7, a3, 0);
    }
    swift_unknownObjectRelease();

    v8 = v6;
  }
  else
  {
    swift_unknownObjectRelease();
    v8 = v9;
  }
}

- (_TtC18ASMessagesProvider21BouncyToRectAnimation)init
{
  result = (_TtC18ASMessagesProvider21BouncyToRectAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end