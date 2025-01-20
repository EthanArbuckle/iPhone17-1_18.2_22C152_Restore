@interface FMFRefreshWrapperButton
- (FMFRefreshWrapperButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)wrapperInsets;
- (void)setWrapperInsets:(UIEdgeInsets)a3;
@end

@implementation FMFRefreshWrapperButton

- (FMFRefreshWrapperButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FMFRefreshWrapperButton;
  v3 = -[FMFRefreshWrapperButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    -[FMFRefreshWrapperButton setWrapperInsets:](v3, "setWrapperInsets:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  }
  return v4;
}

- (UIEdgeInsets)wrapperInsets
{
  double top = self->_wrapperInsets.top;
  double left = self->_wrapperInsets.left;
  double bottom = self->_wrapperInsets.bottom;
  double right = self->_wrapperInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setWrapperInsets:(UIEdgeInsets)a3
{
  self->_wrapperInsets = a3;
}

@end