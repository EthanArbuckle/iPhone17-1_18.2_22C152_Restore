@interface NTKEsterbrookSceneDialView
- (NTKEsterbrookSceneDialView)initWithCoder:(id)a3;
- (NTKEsterbrookSceneDialView)initWithFrame:(CGRect)a3;
- (double)tritiumProgress;
- (unint64_t)density;
- (void)applyDensityTransitionWithFraction:(double)a3 from:(unint64_t)a4 to:(unint64_t)a5;
- (void)setDensity:(unint64_t)a3;
- (void)setTritiumProgress:(double)a3;
@end

@implementation NTKEsterbrookSceneDialView

- (unint64_t)density
{
  return *(unint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneDialView_density);
}

- (void)setDensity:(unint64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneDialView_density);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneDialView_density) = (Class)a3;
  if (v3 != a3)
  {
    v5 = self;
    sub_246A86DA8(a3);
  }
}

- (NTKEsterbrookSceneDialView)initWithCoder:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneDialView_hours) = xmmword_246ADC880;
  uint64_t v4 = OBJC_IVAR___NTKEsterbrookSceneDialView_hourLayers;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_246ACF330(MEMORY[0x263F8EE78]);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneDialView_density) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneDialView_tritiumProgress) = 0;
  swift_bridgeObjectRelease();
  type metadata accessor for SceneDialView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)applyDensityTransitionWithFraction:(double)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  v8 = self;
  sub_246A866AC(a4, a5, a3);
}

- (double)tritiumProgress
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneDialView_tritiumProgress);
}

- (void)setTritiumProgress:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneDialView_tritiumProgress) = a3;
  uint64_t v3 = self;
  sub_246A87328();
}

- (NTKEsterbrookSceneDialView)initWithFrame:(CGRect)a3
{
  result = (NTKEsterbrookSceneDialView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end