@interface CAMFilterButton
+ (CAMFilterButton)filterButtonWithLayoutStyle:(int64_t)a3;
- (CAMFilterButton)initWithCoder:(id)a3;
- (CAMFilterButton)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)tappableEdgeInsets;
- (id)_filterImage;
- (id)_filterOnImage;
- (id)imageForAccessibilityHUD;
- (int64_t)layoutStyle;
- (int64_t)orientation;
- (void)_commonCAMFilterButtonInitializationWithStyle:(int64_t)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation CAMFilterButton

+ (CAMFilterButton)filterButtonWithLayoutStyle:(int64_t)a3
{
  v4 = +[CAMFilterButton buttonWithType:0];
  [v4 _commonCAMFilterButtonInitializationWithStyle:a3];
  return (CAMFilterButton *)v4;
}

- (CAMFilterButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMFilterButton;
  v3 = -[CAMFilterButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMFilterButton *)v3 _commonCAMFilterButtonInitializationWithStyle:0];
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMFilterButtonInitializationWithStyle:(int64_t)a3
{
  self->_orientation = 1;
  self->_layoutStyle = a3;
  [(CAMFilterButton *)self setAdjustsImageWhenHighlighted:0];
  v4 = [(CAMFilterButton *)self _filterImage];
  [(CAMFilterButton *)self setImage:v4 forState:0];

  v5 = [(CAMFilterButton *)self imageForState:0];
  [(CAMFilterButton *)self setImage:v5 forState:2];

  v6 = [(CAMFilterButton *)self _filterOnImage];
  [(CAMFilterButton *)self setImage:v6 forState:4];

  objc_super v7 = [(CAMFilterButton *)self _filterOnImage];
  [(CAMFilterButton *)self setImage:v7 forState:5];

  id v8 = [(CAMFilterButton *)self _filterOnImage];
  [(CAMFilterButton *)self setImage:v8 forState:6];
}

- (id)_filterImage
{
  if (self->_layoutStyle == 3) {
    v2 = @"CAMPhotoBoothFilterButton.png";
  }
  else {
    v2 = @"CAMFilterButton.png";
  }
  v3 = (void *)MEMORY[0x263F827E8];
  v4 = CAMCameraUIFrameworkBundle();
  v5 = [v3 imageNamed:v2 inBundle:v4];
  v6 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  objc_super v7 = [v5 imageWithTintColor:v6];
  id v8 = [v7 imageWithRenderingMode:1];

  return v8;
}

- (id)_filterOnImage
{
  if (self->_layoutStyle == 3) {
    v2 = @"CAMPhotoBoothFilterButton.png";
  }
  else {
    v2 = @"CAMFilterButtonOn.png";
  }
  v3 = (void *)MEMORY[0x263F827E8];
  v4 = CAMCameraUIFrameworkBundle();
  v5 = [v3 imageNamed:v2 inBundle:v4];
  v6 = [v5 imageWithRenderingMode:1];

  return v6;
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    [(CAMFilterButton *)self setNeedsLayout];
  }
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    id v6 = [(CAMFilterButton *)self imageView];
    +[CAMView rotateView:v6 toInterfaceOrientation:a3 animated:v4];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CAMFilterButton *)self imageForState:0];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top = self->_tappableEdgeInsets.top;
  double left = self->_tappableEdgeInsets.left;
  double bottom = self->_tappableEdgeInsets.bottom;
  double right = self->_tappableEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CAMFilterButton;
  [(CAMFilterButton *)&v8 layoutSubviews];
  double v3 = [(CAMFilterButton *)self imageView];
  [v3 frame];
  CAMViewSetBoundsAndCenterForFrame(v3, v4, v5, v6, v7);
}

- (CAMFilterButton)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMFilterButton;
  double v3 = [(CAMFilterButton *)&v7 initWithCoder:a3];
  double v4 = v3;
  if (v3)
  {
    [(CAMFilterButton *)v3 _commonCAMFilterButtonInitializationWithStyle:0];
    double v5 = v4;
  }

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CAMFilterButton *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)CAMFilterButton;
  [(CAMFilterButton *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    double v6 = [(CAMFilterButton *)self imageView];
    objc_super v7 = [v6 layer];
    +[CAMAnimationHelper animateLayer:v7 forButtonHighlighted:v3 layoutStyle:[(CAMFilterButton *)self layoutStyle]];
  }
}

- (void)setOrientation:(int64_t)a3
{
}

- (id)imageForAccessibilityHUD
{
  v2 = (void *)MEMORY[0x263F827E8];
  BOOL v3 = CAMCameraUIFrameworkBundle();
  double v4 = [v2 imageNamed:@"CAMFilterButton-AXHUD" inBundle:v3];
  int v5 = [v4 imageWithRenderingMode:1];

  return v5;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

@end