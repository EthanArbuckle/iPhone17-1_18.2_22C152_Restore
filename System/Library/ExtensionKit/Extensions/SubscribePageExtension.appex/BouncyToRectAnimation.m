@interface BouncyToRectAnimation
- (_TtC22SubscribePageExtension21BouncyToRectAnimation)init;
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
  sub_1005378AC(0);
  sub_1000318DC(a3);
  if (*((unsigned char *)&v9->super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtension21BouncyToRectAnimation_shouldAnimateTabBar) == 1
    && (v5 = (_TtC22SubscribePageExtension21BouncyToRectAnimation *)[a3 viewControllerForKey:UITransitionContextToViewControllerKey]) != 0)
  {
    v6 = v5;
    self;
    v7 = (void *)swift_dynamicCastObjCClass();
    if (v7) {
      sub_1004CB23C(v7, a3, 0);
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

- (_TtC22SubscribePageExtension21BouncyToRectAnimation)init
{
  result = (_TtC22SubscribePageExtension21BouncyToRectAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end