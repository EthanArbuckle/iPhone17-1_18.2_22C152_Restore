@interface AppPromotionDetailPageCloseAnimation
- (_TtC22SubscribePageExtension36AppPromotionDetailPageCloseAnimation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation AppPromotionDetailPageCloseAnimation

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
    v7 = (_TtC22SubscribePageExtension36AppPromotionDetailPageCloseAnimation *)[objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:v6 timingParameters:0.0];

    [(AppPromotionDetailPageCloseAnimation *)v7 duration];
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
  sub_1002EA460(a3);
  swift_unknownObjectRelease();
}

- (_TtC22SubscribePageExtension36AppPromotionDetailPageCloseAnimation)init
{
  result = (_TtC22SubscribePageExtension36AppPromotionDetailPageCloseAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageCloseAnimation_toCardView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageCloseAnimation_toCollectionViewController));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageCloseAnimation_detailPageViewController);
}

@end