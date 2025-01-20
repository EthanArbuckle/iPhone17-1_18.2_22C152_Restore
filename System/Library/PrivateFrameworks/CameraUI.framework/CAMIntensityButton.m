@interface CAMIntensityButton
- (CAMIntensityButton)initWithLayoutStyle:(int64_t)a3;
- (UIEdgeInsets)tappableEdgeInsets;
- (double)intensityValue;
- (int64_t)layoutStyle;
- (int64_t)orientation;
- (void)_updateColorsAnimated:(BOOL)a3;
- (void)setActive:(BOOL)a3;
- (void)setActive:(BOOL)a3 animated:(BOOL)a4;
- (void)setIntensityValue:(double)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation CAMIntensityButton

- (CAMIntensityButton)initWithLayoutStyle:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CAMIntensityButton;
  v4 = -[CAMIntensityButton initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_orientation = 1;
    v4->_layoutStyle = a3;
    [(CAMIntensityButton *)v4 setAdjustsImageWhenHighlighted:0];
    v6 = (void *)MEMORY[0x263F827E8];
    v7 = CAMCameraUIFrameworkBundle();
    v8 = [v6 imageNamed:@"CAMIntensityButton" inBundle:v7];
    v9 = [v8 imageWithRenderingMode:2];

    [(CAMIntensityButton *)v5 setImage:v9 forState:0];
    [(CAMIntensityButton *)v5 _updateColorsAnimated:0];
    v10 = v5;
  }
  return v5;
}

- (void)setIntensityValue:(double)a3
{
  if (self->_intensityValue != a3) {
    self->_intensityValue = a3;
  }
}

- (void)setActive:(BOOL)a3
{
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(CAMIntensityButton *)self isActive];
  [(CAMIntensityButton *)self setSelected:v5];
  if (v7 != v5)
  {
    [(CAMIntensityButton *)self _updateColorsAnimated:v4];
  }
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    [(CAMIntensityButton *)self setNeedsLayout];
  }
}

- (void)_updateColorsAnimated:(BOOL)a3
{
  if ([(CAMIntensityButton *)self isActive]) {
    [MEMORY[0x263F825C8] systemYellowColor];
  }
  else {
  id v5 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  }
  BOOL v4 = [(CAMIntensityButton *)self imageView];
  [v4 setTintColor:v5];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    id v6 = [(CAMIntensityButton *)self imageView];
    +[CAMView rotateView:v6 toInterfaceOrientation:a3 animated:v4];
  }
}

- (double)intensityValue
{
  return self->_intensityValue;
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