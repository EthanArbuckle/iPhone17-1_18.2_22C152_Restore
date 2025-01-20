@interface SeparatorLayer
+ (double)separatorHeight;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SeparatorLayer)initWithFrame:(CGRect)a3;
- (UIColor)tintColor;
- (unint64_t)axis;
- (void)setAxis:(unint64_t)a3;
- (void)setTintColor:(id)a3;
@end

@implementation SeparatorLayer

+ (double)separatorHeight
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  double v4 = 1.0 / v3;

  return v4;
}

- (SeparatorLayer)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SeparatorLayer;
  double v3 = -[SeparatorLayer initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(SeparatorLayer *)v3 setAutoresizingMask:2];
    [(SeparatorLayer *)v4 setAxis:0];
    v5 = +[UIColor mailHeaderSeparatorLayerColor];
    [(SeparatorLayer *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
  BOOL v5 = a3 != 0;
  BOOL v6 = a3 == 0;
  LODWORD(v3) = 1148846080;
  [(SeparatorLayer *)self setContentCompressionResistancePriority:v6 forAxis:v3];
  LODWORD(v7) = 1148846080;
  [(SeparatorLayer *)self setContentHuggingPriority:v6 forAxis:v7];
  LODWORD(v8) = 1132068864;
  [(SeparatorLayer *)self setContentCompressionResistancePriority:v5 forAxis:v8];
  LODWORD(v9) = 1132068864;
  [(SeparatorLayer *)self setContentHuggingPriority:v5 forAxis:v9];

  [(SeparatorLayer *)self invalidateIntrinsicContentSize];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  +[SeparatorLayer separatorHeight];
  double v7 = v6;
  unint64_t axis = self->_axis;
  if (axis == 1)
  {
    CGFloat width = v6;
LABEL_5:
    double v7 = height;
    goto LABEL_6;
  }
  if (axis) {
    goto LABEL_5;
  }
LABEL_6:
  double v9 = width;
  result.CGFloat height = v7;
  result.CGFloat width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[SeparatorLayer sizeThatFits:](self, "sizeThatFits:", UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void).cxx_destruct
{
}

@end