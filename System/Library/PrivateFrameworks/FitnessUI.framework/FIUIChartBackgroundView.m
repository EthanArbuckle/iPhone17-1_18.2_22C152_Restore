@interface FIUIChartBackgroundView
- (FIUIChartBackgroundView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)lineInsets;
- (void)setLineInsets:(UIEdgeInsets)a3;
@end

@implementation FIUIChartBackgroundView

- (FIUIChartBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FIUIChartBackgroundView;
  v3 = -[FIUIChartBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(FIUIChartBackgroundView *)v3 setBackgroundColor:v4];

    [(FIUIChartBackgroundView *)v3 setOpaque:0];
  }
  return v3;
}

- (UIEdgeInsets)lineInsets
{
  double top = self->_lineInsets.top;
  double left = self->_lineInsets.left;
  double bottom = self->_lineInsets.bottom;
  double right = self->_lineInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLineInsets:(UIEdgeInsets)a3
{
  self->_lineInsets = a3;
}

@end