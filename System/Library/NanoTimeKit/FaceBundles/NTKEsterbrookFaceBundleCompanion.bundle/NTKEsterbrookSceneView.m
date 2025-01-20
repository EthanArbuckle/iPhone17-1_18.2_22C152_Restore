@interface NTKEsterbrookSceneView
- (BOOL)showSpriteDebugHelpers;
- (NSString)liveSceneDescription;
- (NTKEsterbrookSceneBackgroundView)sceneBackgroundView;
- (NTKEsterbrookSceneDialView)dialView;
- (NTKEsterbrookScenePalette)scenePalette;
- (NTKEsterbrookSceneView)initWithCoder:(id)a3;
- (NTKEsterbrookSceneView)initWithFrame:(CGRect)a3;
- (NTKEsterbrookSceneView)initWithFrame:(CGRect)a3 handsView:(id)a4 colorPalette:(id)a5 device:(id)a6;
- (double)tritiumProgress;
- (void)dealloc;
- (void)layoutForDateChange;
- (void)layoutSubviews;
- (void)setScenePalette:(id)a3;
- (void)setShowSpriteDebugHelpers:(BOOL)a3;
- (void)setTritiumProgress:(double)a3;
@end

@implementation NTKEsterbrookSceneView

- (NTKEsterbrookSceneBackgroundView)sceneBackgroundView
{
  return (NTKEsterbrookSceneBackgroundView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                     + OBJC_IVAR___NTKEsterbrookSceneView_sceneBackgroundView));
}

- (NTKEsterbrookSceneDialView)dialView
{
  return (NTKEsterbrookSceneDialView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR___NTKEsterbrookSceneView_dialView));
}

- (double)tritiumProgress
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneView_tritiumProgress);
}

- (void)setTritiumProgress:(double)a3
{
  v4 = self;
  sub_246AA4C14(a3);
}

- (NTKEsterbrookScenePalette)scenePalette
{
  return (NTKEsterbrookScenePalette *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                              + OBJC_IVAR___NTKEsterbrookSceneView_scenePalette));
}

- (void)setScenePalette:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneView_scenePalette);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneView_scenePalette) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_246AA63D0();
}

- (NSString)liveSceneDescription
{
  v2 = self;
  sub_246AA4D98();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_246AD8B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)showSpriteDebugHelpers
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneView_showSpriteDebugHelpers);
}

- (void)setShowSpriteDebugHelpers:(BOOL)a3
{
  uint64_t v4 = self;
  sub_246AA5454(a3);
}

- (NTKEsterbrookSceneView)initWithFrame:(CGRect)a3 handsView:(id)a4 colorPalette:(id)a5 device:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  swift_unknownObjectRetain();
  return (NTKEsterbrookSceneView *)sub_246AA55A0(v12, a5, a6, x, y, width, height);
}

- (NTKEsterbrookSceneView)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v2 = self;
  sub_246AA5CF0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_246AABC84((uint64_t)self + OBJC_IVAR___NTKEsterbrookSceneView_delegate);

  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKEsterbrookSceneView_scenePalette);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_246AA612C();
}

- (void)layoutForDateChange
{
  v2 = self;
  sub_246AA89D8(1);
}

- (NTKEsterbrookSceneView)initWithFrame:(CGRect)a3
{
  result = (NTKEsterbrookSceneView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end