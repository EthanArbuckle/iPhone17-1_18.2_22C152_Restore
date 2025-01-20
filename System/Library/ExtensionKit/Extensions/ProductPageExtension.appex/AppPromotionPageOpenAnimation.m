@interface AppPromotionPageOpenAnimation
- (_TtC20ProductPageExtension29AppPromotionPageOpenAnimation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation AppPromotionPageOpenAnimation

- (double)transitionDuration:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    swift_unknownObjectRelease();
    double v5 = 0.3;
  }
  else
  {
    id v6 = objc_msgSend(objc_allocWithZone((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 180.0, 22.0, 0.0, 0.0);
    v7 = (_TtC20ProductPageExtension29AppPromotionPageOpenAnimation *)[objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:v6 timingParameters:0.0];

    [(AppPromotionPageOpenAnimation *)v7 duration];
    double v5 = v8;
    swift_unknownObjectRelease();

    v4 = v7;
  }

  return v5;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  sub_100740E18(a3);
  swift_unknownObjectRelease();
}

- (_TtC20ProductPageExtension29AppPromotionPageOpenAnimation)init
{
  result = (_TtC20ProductPageExtension29AppPromotionPageOpenAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionPageOpenAnimation_fromCardView));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionPageOpenAnimation_fromCollectionViewController);
}

@end