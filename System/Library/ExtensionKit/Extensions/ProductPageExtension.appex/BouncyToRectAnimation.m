@interface BouncyToRectAnimation
- (_TtC20ProductPageExtension21BouncyToRectAnimation)init;
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
  sub_10007C094(0);
  sub_1005CCAA8(a3);
  if (*((unsigned char *)&v9->super.super.isa
       + OBJC_IVAR____TtC20ProductPageExtension21BouncyToRectAnimation_shouldAnimateTabBar) == 1
    && (v5 = (_TtC20ProductPageExtension21BouncyToRectAnimation *)[a3 viewControllerForKey:UITransitionContextToViewControllerKey]) != 0)
  {
    v6 = v5;
    self;
    v7 = (void *)swift_dynamicCastObjCClass();
    if (v7) {
      sub_1006F1248(v7, a3, 0);
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

- (_TtC20ProductPageExtension21BouncyToRectAnimation)init
{
  result = (_TtC20ProductPageExtension21BouncyToRectAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end