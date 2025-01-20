@interface FigCaptionRowLayer
- (void)setNeedsDisplay;
@end

@implementation FigCaptionRowLayer

- (void)setNeedsDisplay
{
  if (getDisplayScale_onceToken != -1) {
    dispatch_once(&getDisplayScale_onceToken, &__block_literal_global_2);
  }
  double v3 = *(double *)&sMaxDisplayScale;
  [(FigCaptionRowLayer *)self contentsScale];
  if (v4 != v3) {
    [(FigCaptionRowLayer *)self setContentsScale:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)FigCaptionRowLayer;
  [(FigBaseCALayer *)&v5 setNeedsDisplay];
}

@end