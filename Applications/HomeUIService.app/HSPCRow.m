@interface HSPCRow
+ (CGSize)leftImageSize;
+ (NSString)_reuseIdentifier;
+ (double)horizontalLeadingMargin;
+ (double)horizontalSpacing;
+ (double)horizontalTrailingMargin;
+ (double)leadingSeparatorMargin;
- (BOOL)constraintsSet;
- (HSPCRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)textField;
- (UIView)leftView;
- (void)setConstraintsSet:(BOOL)a3;
- (void)setLeftView:(id)a3;
@end

@implementation HSPCRow

+ (NSString)_reuseIdentifier
{
  return (NSString *)@"HSPCRow";
}

+ (CGSize)leftImageSize
{
  double v2 = 24.0;
  double v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)horizontalLeadingMargin
{
  return 16.0;
}

+ (double)horizontalTrailingMargin
{
  return 8.0;
}

+ (double)horizontalSpacing
{
  return 12.0;
}

+ (double)leadingSeparatorMargin
{
  +[HSPCRow horizontalLeadingMargin];
  double v3 = v2;
  +[HSPCRow leftImageSize];
  double v5 = v3 + v4;
  +[HSPCRow horizontalSpacing];
  return v5 + v6;
}

- (HSPCRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)HSPCRow;
  double v4 = [(HSPCRow *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4)
  {
    [(HSPCRow *)v4 setSelectionStyle:0];
    double v6 = objc_opt_new();
    [(HSPCRow *)v5 setBackgroundView:v6];

    v7 = +[UIColor systemGroupedBackgroundColor];
    v8 = [(HSPCRow *)v5 backgroundView];
    [v8 setBackgroundColor:v7];

    v9 = +[UIColor systemGroupedBackgroundColor];
    v10 = [(HSPCRow *)v5 contentView];
    [v10 setBackgroundColor:v9];

    v11 = +[UIColor systemGroupedBackgroundColor];
    [(HSPCRow *)v5 setBackgroundColor:v11];

    id v12 = objc_alloc((Class)UITextField);
    [(HSPCRow *)v5 bounds];
    id v13 = [v12 initWithFrame:];
    [v13 setClearButtonMode:3];
    [v13 setAutocapitalizationType:1];
    [v13 setReturnKeyType:9];
    v14 = [(HSPCRow *)v5 contentView];
    [v14 addSubview:v13];

    objc_storeWeak((id *)&v5->_textField, v13);
  }
  return v5;
}

- (UIView)leftView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leftView);

  return (UIView *)WeakRetained;
}

- (void)setLeftView:(id)a3
{
}

- (UITextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);

  return (UITextField *)WeakRetained;
}

- (BOOL)constraintsSet
{
  return self->_constraintsSet;
}

- (void)setConstraintsSet:(BOOL)a3
{
  self->_constraintsSet = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textField);

  objc_destroyWeak((id *)&self->_leftView);
}

@end