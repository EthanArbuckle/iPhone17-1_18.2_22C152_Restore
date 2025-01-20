@interface HPSSpatialProfileSingleStepPearlMovieLoopView
- (HPSSpatialProfileSingleStepPearlMovieLoopView)initWithFrame:(CGRect)a3;
@end

@implementation HPSSpatialProfileSingleStepPearlMovieLoopView

- (HPSSpatialProfileSingleStepPearlMovieLoopView)initWithFrame:(CGRect)a3
{
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 URLForResource:@"HRTF_Tutorial_A" withExtension:@"mov"];
  v8.receiver = self;
  v8.super_class = (Class)HPSSpatialProfileSingleStepPearlMovieLoopView;
  v6 = -[HPSMovieLoopPlayer initWithFrame:urlForResource:](&v8, sel_initWithFrame_urlForResource_, v5, 0.0, 0.0, 250.0, 144.0);

  return v6;
}

@end