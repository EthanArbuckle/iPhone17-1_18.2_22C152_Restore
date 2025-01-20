@interface MFHeaderLabelView
+ (id)_defaultColor;
- (CGPoint)baselinePoint;
- (MFHeaderLabelView)initWithFrame:(CGRect)a3;
- (void)_updateTextColor;
- (void)tintColorDidChange;
@end

@implementation MFHeaderLabelView

+ (id)_defaultColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGrayColor];
}

- (void)_updateTextColor
{
  id v4 = +[MFHeaderLabelView _defaultColor];
  v3 = -[MFHeaderLabelView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:");
  [(MFHeaderLabelView *)self setTextColor:v3];
}

- (MFHeaderLabelView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFHeaderLabelView;
  v3 = -[MFHeaderLabelView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[MFComposeHeaderView defaultFont];
    [(MFHeaderLabelView *)v3 setFont:v4];

    [(MFHeaderLabelView *)v3 _updateTextColor];
  }
  return v3;
}

- (CGPoint)baselinePoint
{
  [(MFHeaderLabelView *)self frame];
  double v4 = v3;
  [(MFHeaderLabelView *)self _baselineOffsetFromBottom];
  double v6 = round(v4 - v5);
  double v7 = 0.0;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MFHeaderLabelView;
  [(MFHeaderLabelView *)&v3 tintColorDidChange];
  [(MFHeaderLabelView *)self _updateTextColor];
}

@end