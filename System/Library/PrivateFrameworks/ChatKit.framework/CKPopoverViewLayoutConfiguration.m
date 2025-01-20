@interface CKPopoverViewLayoutConfiguration
- (CGSize)optimalSizeForPreferredContentSize:(CGSize)result state:(unint64_t)a4;
- (CGSize)optimalSizeForPresentingAppInCompactStyle:(BOOL)a3;
- (CGSize)optimalSizeForPresentingSendMenuWithPreferredContentSize:(CGSize)a3;
- (double)defaultAppCompactHeight;
- (double)maximumHeight;
- (double)minimumSendMenuDimension;
- (double)minimumTopSpacing;
- (double)minimumTrailingSpacing;
- (double)preferredAppWidth;
- (void)setDefaultAppCompactHeight:(double)a3;
- (void)setMaximumHeight:(double)a3;
- (void)setMinimumSendMenuDimension:(double)a3;
- (void)setMinimumTopSpacing:(double)a3;
- (void)setMinimumTrailingSpacing:(double)a3;
- (void)setPreferredAppWidth:(double)a3;
@end

@implementation CKPopoverViewLayoutConfiguration

- (CGSize)optimalSizeForPresentingSendMenuWithPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CKPopoverViewLayoutConfiguration *)self minimumSendMenuDimension];
  if (width < v6) {
    double width = v6;
  }
  if (height < v6) {
    double height = v6;
  }
  [(CKPopoverViewLayoutConfiguration *)self maximumHeight];
  if (height >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = height;
  }
  double v9 = width;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (CGSize)optimalSizeForPresentingAppInCompactStyle:(BOOL)a3
{
  BOOL v3 = a3;
  [(CKPopoverViewLayoutConfiguration *)self preferredAppWidth];
  double v6 = v5;
  if (v3) {
    [(CKPopoverViewLayoutConfiguration *)self defaultAppCompactHeight];
  }
  else {
    [(CKPopoverViewLayoutConfiguration *)self maximumHeight];
  }
  double v8 = v7;
  double v9 = v6;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (CGSize)optimalSizeForPreferredContentSize:(CGSize)result state:(unint64_t)a4
{
  if (a4 - 1 < 2)
  {
    -[CKPopoverViewLayoutConfiguration optimalSizeForPresentingAppInCompactStyle:](self, "optimalSizeForPresentingAppInCompactStyle:", a4 == 1, result.width, result.height);
LABEL_5:
    double v4 = v5;
    goto LABEL_6;
  }
  if (!a4)
  {
    -[CKPopoverViewLayoutConfiguration optimalSizeForPresentingSendMenuWithPreferredContentSize:](self, "optimalSizeForPresentingSendMenuWithPreferredContentSize:", result.width, result.height);
    goto LABEL_5;
  }
LABEL_6:
  double v6 = v4;
  result.double height = v6;
  return result;
}

- (double)minimumSendMenuDimension
{
  return self->_minimumSendMenuDimension;
}

- (void)setMinimumSendMenuDimension:(double)a3
{
  self->_minimumSendMenuDimension = a3;
}

- (double)defaultAppCompactHeight
{
  return self->_defaultAppCompactHeight;
}

- (void)setDefaultAppCompactHeight:(double)a3
{
  self->_defaultAppCompactHeight = a3;
}

- (double)preferredAppWidth
{
  return self->_preferredAppWidth;
}

- (void)setPreferredAppWidth:(double)a3
{
  self->_preferredAppWidth = a3;
}

- (double)minimumTopSpacing
{
  return self->_minimumTopSpacing;
}

- (void)setMinimumTopSpacing:(double)a3
{
  self->_minimumTopSpacing = a3;
}

- (double)minimumTrailingSpacing
{
  return self->_minimumTrailingSpacing;
}

- (void)setMinimumTrailingSpacing:(double)a3
{
  self->_minimumTrailingSpacing = a3;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

@end