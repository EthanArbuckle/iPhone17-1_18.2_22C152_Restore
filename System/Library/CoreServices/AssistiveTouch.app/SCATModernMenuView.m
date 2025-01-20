@interface SCATModernMenuView
- (BOOL)accessibilityIgnoresInvertColors;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 includeTip:(BOOL)a4;
- (SCATModernMenuBackgroundView)backgroundView;
- (SCATModernMenuView)initWithFrame:(CGRect)a3;
- (void)setBackgroundView:(id)a3;
@end

@implementation SCATModernMenuView

- (SCATModernMenuView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)SCATModernMenuView;
  v7 = -[SCATModernMenuView initWithFrame:](&v16, "initWithFrame:");
  if (v7)
  {
    v8 = -[SCATModernMenuBackgroundView initWithFrame:]([SCATModernMenuBackgroundView alloc], "initWithFrame:", x, y, width, height);
    [(SCATModernMenuBackgroundView *)v8 setAutoresizingMask:18];
    [(SCATModernMenuView *)v7 setBackgroundView:v8];
    v9 = [(SCATModernMenuBackgroundView *)v8 backdropView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(SCATModernMenuBackgroundView *)v8 backdropView];
    [(SCATModernMenuView *)v7 addSubview:v10];

    v11 = [(SCATModernMenuBackgroundView *)v8 backdropView];
    v12 = [v11 contentView];
    [v12 addSubview:v8];

    v13 = [(SCATModernMenuBackgroundView *)v8 backdropView];
    v14 = +[NSLayoutConstraint ax_constraintsToMakeView:v7 sameDimensionsAsView:v13];
    +[NSLayoutConstraint activateConstraints:v14];
  }
  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3 includeTip:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v7 = [(SCATModernMenuView *)self backgroundView];
  objc_msgSend(v7, "sizeThatFits:includeTip:", v4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(SCATModernMenuView *)self backgroundView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (SCATModernMenuBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end