@interface SCATModernPageControlHighlightView
- (NSLayoutConstraint)widthConstraint;
- (SCATModernPageControlHighlightView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setWidthConstraint:(id)a3;
@end

@implementation SCATModernPageControlHighlightView

- (SCATModernPageControlHighlightView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATModernPageControlHighlightView;
  v3 = -[SCATModernPageControlHighlightView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SCATModernPageControlHighlightView *)v3 setContentMode:3];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = +[SCATStyleProvider sharedStyleProvider];
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRect v12 = CGRectInset(v11, 2.0, 2.0);
  v7 = +[UIBezierPath roundedRectBezierPath:withRoundedEdges:](UIBezierPath, "roundedRectBezierPath:withRoundedEdges:", 15, v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  [v9 menuPageControlHighlightedBorderLineWidth];
  objc_msgSend(v7, "setLineWidth:");
  v8 = [v9 menuPageControlHighlightedBorderColor];
  [v8 setStroke];

  [v7 stroke];
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end