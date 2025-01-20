@interface CPSLabelWithPlaceholder
- (CGSize)_desiredPlaceholderSize;
- (CGSize)intrinsicContentSize;
- (CPSLabelWithPlaceholder)initWithCoder:(id)a3;
- (CPSLabelWithPlaceholder)initWithFrame:(CGRect)a3;
- (UIColor)placeholderColor;
- (double)placeholderWidth;
- (id)text;
- (void)_commonInit;
- (void)_placeholderInputsDidChange;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setPlaceholderWidth:(double)a3;
- (void)setText:(id)a3;
@end

@implementation CPSLabelWithPlaceholder

- (CPSLabelWithPlaceholder)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPSLabelWithPlaceholder;
  v3 = -[CPSLabelWithPlaceholder initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CPSLabelWithPlaceholder *)v3 _commonInit];
    [(CPSLabelWithPlaceholder *)v4 _placeholderInputsDidChange];
    v5 = v4;
  }

  return v4;
}

- (CPSLabelWithPlaceholder)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPSLabelWithPlaceholder;
  v3 = [(CPSLabelWithPlaceholder *)&v10 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(CPSLabelWithPlaceholder *)v3 _commonInit];
    v9.receiver = v4;
    v9.super_class = (Class)CPSLabelWithPlaceholder;
    uint64_t v5 = [(CPSLabelWithPlaceholder *)&v9 text];
    text = v4->_text;
    v4->_text = (NSString *)v5;

    [(CPSLabelWithPlaceholder *)v4 _placeholderInputsDidChange];
    objc_super v7 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  v3 = [(CPSLabelWithPlaceholder *)self placeholderColor];
  [(CPSLabelWithPlaceholder *)self setPlaceholderColor:v3];

  if (self->_placeholderWidth == 0.0) {
    self->_placeholderWidth = 100.0;
  }
  v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  placeholderView = self->_placeholderView;
  self->_placeholderView = v4;

  [(UIView *)self->_placeholderView setBackgroundColor:self->_placeholderColor];
  v6 = self->_placeholderView;

  [(CPSLabelWithPlaceholder *)self addSubview:v6];
}

- (CGSize)intrinsicContentSize
{
  if ([(UIView *)self->_placeholderView isHidden])
  {
    v11.receiver = self;
    v11.super_class = (Class)CPSLabelWithPlaceholder;
    [(CPSLabelWithPlaceholder *)&v11 intrinsicContentSize];
    double placeholderWidth = v3;
    double v6 = v5;
  }
  else
  {
    double placeholderWidth = self->_placeholderWidth;
    objc_super v7 = [(CPSLabelWithPlaceholder *)self font];
    [v7 _bodyLeading];
    double v6 = v8;
  }
  double v9 = placeholderWidth;
  double v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)CPSLabelWithPlaceholder;
  [(CPSLabelWithPlaceholder *)&v18 layoutSubviews];
  if (![(UIView *)self->_placeholderView isHidden])
  {
    [(CPSLabelWithPlaceholder *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(CPSLabelWithPlaceholder *)self _desiredPlaceholderSize];
    double v12 = v11;
    double v14 = v13;
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    double v15 = fmin(v12, CGRectGetWidth(v19));
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    double v16 = fmin(v14, CGRectGetHeight(v20));
    if ([(CPSLabelWithPlaceholder *)self effectiveUserInterfaceLayoutDirection])
    {
      v21.origin.x = v4;
      v21.origin.y = v6;
      v21.size.width = v8;
      v21.size.height = v10;
      double v17 = CGRectGetWidth(v21) - v15;
    }
    else
    {
      double v17 = 0.0;
    }
    v22.origin.x = v4;
    v22.origin.y = v6;
    v22.size.width = v8;
    v22.size.height = v10;
    -[UIView setFrame:](self->_placeholderView, "setFrame:", v17, (CGRectGetHeight(v22) - v16) * 0.5, v15, v16);
    [(UIView *)self->_placeholderView frame];
    [(UIView *)self->_placeholderView _setContinuousCornerRadius:CGRectGetHeight(v23) * 0.5];
  }
}

- (void)setAttributedText:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"CPSLabelWithPlacement does not support attributed text." userInfo:0];
  objc_exception_throw(v4);
}

- (void)setText:(id)a3
{
  id v4 = (NSString *)a3;
  text = self->_text;
  if (text != v4)
  {
    CGFloat v8 = v4;
    if (![(NSString *)text isEqualToString:v4])
    {
      CGFloat v6 = (NSString *)[(NSString *)v8 copy];
      double v7 = self->_text;
      self->_text = v6;

      [(CPSLabelWithPlaceholder *)self _placeholderInputsDidChange];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (id)text
{
  return self->_text;
}

- (void)setPlaceholderColor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F428B8] systemFillColor];
  }
  objc_storeStrong((id *)&self->_placeholderColor, v4);
  if (!v5) {

  }
  [(UIView *)self->_placeholderView setBackgroundColor:self->_placeholderColor];
}

- (void)setPlaceholderWidth:(double)a3
{
  self->_double placeholderWidth = a3;
  [(CPSLabelWithPlaceholder *)self setNeedsLayout];
}

- (void)_placeholderInputsDidChange
{
  NSUInteger v3 = [(NSString *)self->_text length];
  text = self->_text;
  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)CPSLabelWithPlaceholder;
    [(CPSLabelWithPlaceholder *)&v7 setText:text];
    p_placeholderView = &self->_placeholderView;
    if ([(UIView *)self->_placeholderView isHidden]) {
      return;
    }
    goto LABEL_3;
  }
  if (![(NSString *)self->_text length])
  {
    p_placeholderView = &self->_placeholderView;
    if ([(UIView *)self->_placeholderView isHidden])
    {
      v6.receiver = self;
      v6.super_class = (Class)CPSLabelWithPlaceholder;
      [(CPSLabelWithPlaceholder *)&v6 setText:&stru_1F306C450];
LABEL_3:
      [(UIView *)*p_placeholderView setHidden:v3 != 0];
      [(CPSLabelWithPlaceholder *)self invalidateIntrinsicContentSize];
      [(CPSLabelWithPlaceholder *)self setNeedsLayout];
    }
  }
}

- (CGSize)_desiredPlaceholderSize
{
  NSUInteger v3 = [(CPSLabelWithPlaceholder *)self font];
  id v4 = [(CPSLabelWithPlaceholder *)self traitCollection];
  id v5 = [v3 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v4];
  [v5 capHeight];
  double v7 = round(v6);

  double placeholderWidth = self->_placeholderWidth;
  double v9 = v7;
  result.height = v9;
  result.width = placeholderWidth;
  return result;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (double)placeholderWidth
{
  return self->_placeholderWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end