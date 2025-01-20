@interface HKCurrentTimeChevronButton
- (CGRect)_squareRectWithDimension:(double)a3 chevronDirection:(int64_t)a4;
- (CGRect)backgroundRectForBounds:(CGRect)a3;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (HKCurrentTimeChevronButton)initWithChevronDirection:(int64_t)a3;
- (int64_t)chevronDirection;
- (void)_updateButtonAppearence;
- (void)setChevronDirection:(int64_t)a3;
@end

@implementation HKCurrentTimeChevronButton

- (HKCurrentTimeChevronButton)initWithChevronDirection:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKCurrentTimeChevronButton;
  v4 = [(HKCurrentTimeChevronButton *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_chevronDirection = a3;
    [(HKCurrentTimeChevronButton *)v4 _updateButtonAppearence];
  }
  return v5;
}

- (void)setChevronDirection:(int64_t)a3
{
  if (self->_chevronDirection != a3)
  {
    self->_chevronDirection = a3;
    [(HKCurrentTimeChevronButton *)self _updateButtonAppearence];
    [(HKCurrentTimeChevronButton *)self setNeedsLayout];
  }
}

- (void)_updateButtonAppearence
{
  id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x1E4FB1818] imageNamed:@"date_chevron_background" inBundle:v13 compatibleWithTraitCollection:0];
  v4 = [v3 imageWithRenderingMode:2];

  int64_t chevronDirection = self->_chevronDirection;
  double v6 = *MEMORY[0x1E4FB2848];
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  if (chevronDirection == 1) {
    v8 = @"date_chevron_left";
  }
  else {
    v8 = @"date_chevron_right";
  }
  if (chevronDirection == 1) {
    double v9 = 1.0;
  }
  else {
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  if (chevronDirection == 1) {
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else {
    double v10 = 1.0;
  }
  v11 = objc_msgSend(MEMORY[0x1E4FB1818], "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v13, 0, *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 24));
  v12 = [v11 imageWithRenderingMode:2];

  [(HKCurrentTimeChevronButton *)self setImage:v12 forState:0];
  [(HKCurrentTimeChevronButton *)self setBackgroundImage:v4 forState:0];
  -[HKCurrentTimeChevronButton setImageEdgeInsets:](self, "setImageEdgeInsets:", v6, v9, v7, v10);
  [(HKCurrentTimeChevronButton *)self setContentMode:1];
}

- (CGRect)backgroundRectForBounds:(CGRect)a3
{
  if (a3.size.width >= a3.size.height) {
    double height = a3.size.height;
  }
  else {
    double height = a3.size.width;
  }
  -[HKCurrentTimeChevronButton _squareRectWithDimension:chevronDirection:](self, "_squareRectWithDimension:chevronDirection:", self->_chevronDirection, height, a3.origin.y);
  result.size.double height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  if (a3.size.width >= a3.size.height) {
    double height = a3.size.height;
  }
  else {
    double height = a3.size.width;
  }
  -[HKCurrentTimeChevronButton _squareRectWithDimension:chevronDirection:](self, "_squareRectWithDimension:chevronDirection:", self->_chevronDirection, height, a3.origin.y);
  result.size.double height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_squareRectWithDimension:(double)a3 chevronDirection:(int64_t)a4
{
  double v5 = 0.0;
  if (a4 != 1) {
    double v5 = a3;
  }
  double v6 = 0.0;
  double v7 = a3;
  result.size.double height = v7;
  result.size.width = a3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (int64_t)chevronDirection
{
  return self->_chevronDirection;
}

@end