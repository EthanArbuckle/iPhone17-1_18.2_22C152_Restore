@interface SSSCropOverlayLineView
+ (double)preferredDimension;
- (SSSCropOverlayLineView)initWithEdge:(unint64_t)a3;
- (unint64_t)edge;
- (void)tintColorDidChange;
@end

@implementation SSSCropOverlayLineView

- (SSSCropOverlayLineView)initWithEdge:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSSCropOverlayLineView;
  result = [(SSSCropOverlayLineView *)&v5 init];
  result->_edge = a3;
  return result;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)SSSCropOverlayLineView;
  [(SSSCropOverlayLineView *)&v4 tintColorDidChange];
  v3 = [(SSSCropOverlayLineView *)self tintColor];
  [(SSSCropOverlayLineView *)self setBackgroundColor:v3];
}

+ (double)preferredDimension
{
  return 1.0;
}

- (unint64_t)edge
{
  return self->_edge;
}

@end