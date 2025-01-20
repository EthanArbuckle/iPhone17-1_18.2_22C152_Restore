@interface GPDrawOnImageRecipe
- (BOOL)generateCaptionFromImage;
- (GPDrawOnImageRecipe)init;
- (GPDrawOnImageRecipe)initWithBaseImage:(__CVBuffer *)a3 sketchImage:(__CVBuffer *)a4 sketchMask:(__CVBuffer *)a5 baseImageRatio:(double)a6 sketchComplexityMeasure:(double)a7 drawOnImageAssignmentOptions:(int64_t)a8;
- (GPDrawOnImageRecipe)initWithBaseImage:(__CVBuffer *)a3 sketchImage:(__CVBuffer *)a4 sketchMask:(__CVBuffer *)a5 baseImageRatio:(double)a6 sketchComplexityMeasure:(double)a7 generateCaptionFromImage:(BOOL)a8 drawOnImageAssignmentOptions:(int64_t)a9;
- (GPDrawOnImageRecipe)initWithBaseImage:(__CVBuffer *)a3 sketchImage:(__CVBuffer *)a4 sketchMask:(__CVBuffer *)a5 baseImageRatio:(double)a6 sketchComplexityMeasure:(double)a7 generateCaptionFromImage:(BOOL)a8 sanitizationCategory:(int64_t)a9 drawOnImageAssignmentOptions:(int64_t)a10;
- (GPDrawOnImageRecipe)initWithBaseImage:(__CVBuffer *)a3 sketchImage:(__CVBuffer *)a4 sketchMask:(__CVBuffer *)a5 sketchComplexityMeasure:(double)a6 drawOnImageAssignmentOptions:(int64_t)a7;
- (__CVBuffer)baseImage;
- (__CVBuffer)sketchImage;
- (__CVBuffer)sketchMask;
- (double)baseImageRatio;
- (double)sketchComplexityMeasure;
- (int64_t)drawOnImageAssignmentOptions;
- (int64_t)sanitizationCategory;
- (void)setBaseImage:(__CVBuffer *)a3;
- (void)setBaseImageRatio:(double)a3;
- (void)setDrawOnImageAssignmentOptions:(int64_t)a3;
- (void)setGenerateCaptionFromImage:(BOOL)a3;
- (void)setSanitizationCategory:(int64_t)a3;
- (void)setSketchComplexityMeasure:(double)a3;
- (void)setSketchImage:(__CVBuffer *)a3;
- (void)setSketchMask:(__CVBuffer *)a3;
@end

@implementation GPDrawOnImageRecipe

- (__CVBuffer)baseImage
{
  v2 = self;
  v3 = (void *)GPDrawOnImageRecipe.baseImage.getter();

  return (__CVBuffer *)v3;
}

- (void)setBaseImage:(__CVBuffer *)a3
{
}

- (__CVBuffer)sketchImage
{
  v2 = self;
  v3 = (void *)GPDrawOnImageRecipe.sketchImage.getter();

  return (__CVBuffer *)v3;
}

- (void)setSketchImage:(__CVBuffer *)a3
{
}

- (__CVBuffer)sketchMask
{
  v2 = self;
  v3 = (void *)GPDrawOnImageRecipe.sketchMask.getter();

  return (__CVBuffer *)v3;
}

- (void)setSketchMask:(__CVBuffer *)a3
{
}

- (double)baseImageRatio
{
  v2 = (double *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_baseImageRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setBaseImageRatio:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_baseImageRatio);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)sketchComplexityMeasure
{
  v2 = (double *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_sketchComplexityMeasure);
  swift_beginAccess();
  return *v2;
}

- (void)setSketchComplexityMeasure:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_sketchComplexityMeasure);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)generateCaptionFromImage
{
  v2 = (BOOL *)self + OBJC_IVAR___GPDrawOnImageRecipe_generateCaptionFromImage;
  swift_beginAccess();
  return *v2;
}

- (void)setGenerateCaptionFromImage:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___GPDrawOnImageRecipe_generateCaptionFromImage;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)sanitizationCategory
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_sanitizationCategory);
  swift_beginAccess();
  return *v2;
}

- (void)setSanitizationCategory:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_sanitizationCategory);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)drawOnImageAssignmentOptions
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_drawOnImageAssignmentOptions);
  swift_beginAccess();
  return *v2;
}

- (void)setDrawOnImageAssignmentOptions:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_drawOnImageAssignmentOptions);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (GPDrawOnImageRecipe)initWithBaseImage:(__CVBuffer *)a3 sketchImage:(__CVBuffer *)a4 sketchMask:(__CVBuffer *)a5 baseImageRatio:(double)a6 sketchComplexityMeasure:(double)a7 generateCaptionFromImage:(BOOL)a8 sanitizationCategory:(int64_t)a9 drawOnImageAssignmentOptions:(int64_t)a10
{
  v18 = a3;
  v19 = a4;
  v20 = a5;
  return (GPDrawOnImageRecipe *)GPDrawOnImageRecipe.init(baseImage:sketchImage:sketchMask:baseImageRatio:sketchComplexityMeasure:generateCaptionFromImage:sanitizationCategory:drawOnImageAssignmentOptions:)(a3, a4, a5, a8, a9, a10, a6, a7);
}

- (GPDrawOnImageRecipe)initWithBaseImage:(__CVBuffer *)a3 sketchImage:(__CVBuffer *)a4 sketchMask:(__CVBuffer *)a5 baseImageRatio:(double)a6 sketchComplexityMeasure:(double)a7 generateCaptionFromImage:(BOOL)a8 drawOnImageAssignmentOptions:(int64_t)a9
{
  v16 = a3;
  v17 = a4;
  v18 = a5;
  return (GPDrawOnImageRecipe *)GPDrawOnImageRecipe.init(baseImage:sketchImage:sketchMask:baseImageRatio:sketchComplexityMeasure:generateCaptionFromImage:drawOnImageAssignmentOptions:)(a3, a4, a5, a8, a9, a6, a7);
}

- (GPDrawOnImageRecipe)initWithBaseImage:(__CVBuffer *)a3 sketchImage:(__CVBuffer *)a4 sketchMask:(__CVBuffer *)a5 baseImageRatio:(double)a6 sketchComplexityMeasure:(double)a7 drawOnImageAssignmentOptions:(int64_t)a8
{
  v14 = a3;
  v15 = a4;
  v16 = a5;
  return (GPDrawOnImageRecipe *)GPDrawOnImageRecipe.init(baseImage:sketchImage:sketchMask:baseImageRatio:sketchComplexityMeasure:drawOnImageAssignmentOptions:)(a3, a4, a5, a8, a6, a7);
}

- (GPDrawOnImageRecipe)initWithBaseImage:(__CVBuffer *)a3 sketchImage:(__CVBuffer *)a4 sketchMask:(__CVBuffer *)a5 sketchComplexityMeasure:(double)a6 drawOnImageAssignmentOptions:(int64_t)a7
{
  v12 = a3;
  v13 = a4;
  v14 = a5;
  return (GPDrawOnImageRecipe *)GPDrawOnImageRecipe.init(baseImage:sketchImage:sketchMask:sketchComplexityMeasure:drawOnImageAssignmentOptions:)(a3, a4, a5, a7, a6);
}

- (GPDrawOnImageRecipe)init
{
  result = (GPDrawOnImageRecipe *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_243EA0894((uint64_t)self + OBJC_IVAR___GPDrawOnImageRecipe__baseImage);
  sub_243EA0894((uint64_t)self + OBJC_IVAR___GPDrawOnImageRecipe__sketchImage);
  v3 = (char *)self + OBJC_IVAR___GPDrawOnImageRecipe__sketchMask;

  sub_243EA0894((uint64_t)v3);
}

@end