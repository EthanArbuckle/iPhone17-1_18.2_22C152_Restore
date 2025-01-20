@interface CNComposeHeaderLabelView
- (CGPoint)baselinePoint;
- (CNComposeHeaderLabelView)initWithFrame:(CGRect)a3;
- (void)_updateTextColor;
- (void)tintColorDidChange;
@end

@implementation CNComposeHeaderLabelView

- (void)_updateTextColor
{
  id v3 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(CNComposeHeaderLabelView *)self setTextColor:v3];
}

- (CNComposeHeaderLabelView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNComposeHeaderLabelView;
  id v3 = -[CNComposeHeaderLabelView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CNComposeHeaderView defaultFont];
    [(CNComposeHeaderLabelView *)v3 setFont:v4];

    [(CNComposeHeaderLabelView *)v3 _updateTextColor];
  }
  return v3;
}

- (CGPoint)baselinePoint
{
  [(CNComposeHeaderLabelView *)self frame];
  double v4 = v3;
  [(CNComposeHeaderLabelView *)self _baselineOffsetFromBottom];
  double v6 = round(v4 - v5);
  double v7 = 0.0;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CNComposeHeaderLabelView;
  [(CNComposeHeaderLabelView *)&v3 tintColorDidChange];
  [(CNComposeHeaderLabelView *)self _updateTextColor];
}

@end