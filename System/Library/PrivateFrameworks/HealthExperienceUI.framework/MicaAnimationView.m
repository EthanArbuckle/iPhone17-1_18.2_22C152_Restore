@interface MicaAnimationView
- (CGSize)intrinsicContentSize;
- (_TtC18HealthExperienceUI17MicaAnimationView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI17MicaAnimationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)stepAnimationForLayer:(id)a3;
@end

@implementation MicaAnimationView

- (_TtC18HealthExperienceUI17MicaAnimationView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_stateController) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_transitionSpeed) = 1065353216;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_previousViewSize);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_loopCount) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI17MicaAnimationView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_packageLayer);
  v3 = self;
  objc_msgSend(v2, sel_bounds);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  sub_1AD4C3BF4(&v13);
  CGAffineTransform v12 = v13;
  v14.width = v5;
  v14.height = v7;
  CGSize v8 = CGSizeApplyAffineTransform(v14, &v12);
  double v9 = *(double *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_insetSize);

  double v10 = v8.width + v9;
  double v11 = v8.height + v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD4C3A78();
}

- (void)stepAnimationForLayer:(id)a3
{
  double v4 = (char *)a3;
  CGFloat v5 = self;
  sub_1AD4C3F4C(v4);
}

- (_TtC18HealthExperienceUI17MicaAnimationView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC18HealthExperienceUI17MicaAnimationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_packageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_package));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_stateController));
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_animation));
  swift_bridgeObjectRelease();
}

@end