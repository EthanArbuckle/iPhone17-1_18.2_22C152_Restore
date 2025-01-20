@interface NTKEsterbrookSceneBackgroundView
- (CALayer)backgroundDotsLayer;
- (NTKEsterbrookSceneBackgroundView)initWithCoder:(id)a3;
- (NTKEsterbrookSceneBackgroundView)initWithFrame:(CGRect)a3;
- (double)tritiumProgress;
- (void)setBackgroundDotsLayer:(id)a3;
- (void)setTritiumProgress:(double)a3;
@end

@implementation NTKEsterbrookSceneBackgroundView

- (CALayer)backgroundDotsLayer
{
  v2 = self;
  id v3 = sub_246AC3FAC();

  return (CALayer *)v3;
}

- (void)setBackgroundDotsLayer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___NTKEsterbrookSceneBackgroundView____lazy_storage___backgroundDotsLayer);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___NTKEsterbrookSceneBackgroundView____lazy_storage___backgroundDotsLayer) = (Class)a3;
  id v3 = a3;
}

- (double)tritiumProgress
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneBackgroundView_tritiumProgress);
}

- (void)setTritiumProgress:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneBackgroundView_tritiumProgress) = a3;
  id v3 = self;
  sub_246AC475C();
}

- (NTKEsterbrookSceneBackgroundView)initWithCoder:(id)a3
{
  return 0;
}

- (NTKEsterbrookSceneBackgroundView)initWithFrame:(CGRect)a3
{
  result = (NTKEsterbrookSceneBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NTKEsterbrookSceneBackgroundView____lazy_storage___backgroundDotsLayer));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneBackgroundView_scenePalette);
}

@end