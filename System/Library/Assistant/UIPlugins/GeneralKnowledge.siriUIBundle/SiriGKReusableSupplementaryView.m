@interface SiriGKReusableSupplementaryView
+ (double)defaultHeight;
+ (id)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)layoutSubviews;
- (void)setSubview:(id)a3;
@end

@implementation SiriGKReusableSupplementaryView

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

- (void)setSubview:(id)a3
{
  v4 = (UIView *)a3;
  [(UIView *)self->_customSubview removeFromSuperview];
  customSubview = self->_customSubview;
  self->_customSubview = v4;
  v6 = v4;

  [(SiriGKReusableSupplementaryView *)self addSubview:self->_customSubview];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_customSubview, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SiriGKReusableSupplementaryView;
  [(SiriGKReusableSupplementaryView *)&v9 layoutSubviews];
  double y = CGPointZero.y;
  customSubview = self->_customSubview;
  [(SiriGKReusableSupplementaryView *)self bounds];
  -[UIView sizeThatFits:](customSubview, "sizeThatFits:", v5, v6);
  -[UIView setFrame:](self->_customSubview, "setFrame:", CGPointZero.x, y, v7, v8);
}

+ (double)defaultHeight
{
  return 0.0;
}

- (void).cxx_destruct
{
}

@end