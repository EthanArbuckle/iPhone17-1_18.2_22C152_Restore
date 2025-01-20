@interface HUCheckmarkAccessoryView
+ (double)borderWidth;
+ (id)grayBorderColor;
- (BOOL)checked;
- (BOOL)disabled;
- (CGSize)intrinsicContentSize;
- (HUCheckmarkAccessoryView)initWithFrame:(CGRect)a3;
- (UIImageView)checkmarkImageView;
- (void)_updateColors;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
- (void)setCheckmarkImageView:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation HUCheckmarkAccessoryView

- (HUCheckmarkAccessoryView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HUCheckmarkAccessoryView;
  v3 = -[HUCheckmarkAccessoryView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_checked = 0;
    v3->_disabled = 0;
    v5 = [MEMORY[0x1E4F42A80] checkmarkImage];
    v6 = objc_msgSend(v5, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));

    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v6];
    [(HUCheckmarkAccessoryView *)v4 setCheckmarkImageView:v7];

    v8 = [(HUCheckmarkAccessoryView *)v4 checkmarkImageView];
    [v8 setHidden:1];

    v9 = [(HUCheckmarkAccessoryView *)v4 checkmarkImageView];
    [(HUCheckmarkAccessoryView *)v4 addSubview:v9];

    [(HUCheckmarkAccessoryView *)v4 setOpaque:0];
    [(id)objc_opt_class() borderWidth];
    double v11 = v10;
    v12 = [(HUCheckmarkAccessoryView *)v4 layer];
    [v12 setBorderWidth:v11];

    [(HUCheckmarkAccessoryView *)v4 _updateColors];
  }
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)HUCheckmarkAccessoryView;
  [(HUCheckmarkAccessoryView *)&v5 layoutSubviews];
  [(HUCheckmarkAccessoryView *)self bounds];
  CGFloat v3 = CGRectGetWidth(v6) * 0.5;
  v4 = [(HUCheckmarkAccessoryView *)self layer];
  [v4 setCornerRadius:v3];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HUCheckmarkAccessoryView *)self checkmarkImageView];
  CGFloat v3 = [v2 image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HUCheckmarkAccessoryView;
  [(HUCheckmarkAccessoryView *)&v3 tintColorDidChange];
  [(HUCheckmarkAccessoryView *)self _updateColors];
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  self->_checked = a3;
  [(HUCheckmarkAccessoryView *)self _updateColors];
  id v5 = [(HUCheckmarkAccessoryView *)self checkmarkImageView];
  [v5 setHidden:!v3];
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  [(HUCheckmarkAccessoryView *)self _updateColors];
}

- (void)_updateColors
{
  if ([(HUCheckmarkAccessoryView *)self disabled]) {
    [(id)objc_opt_class() grayBorderColor];
  }
  else {
  BOOL v3 = [(HUCheckmarkAccessoryView *)self tintColor];
  }
  double v4 = [(HUCheckmarkAccessoryView *)self checkmarkImageView];
  [v4 setTintColor:v3];

  if ([(HUCheckmarkAccessoryView *)self checked]) {
    [MEMORY[0x1E4F428B8] clearColor];
  }
  else {
  id v7 = [(id)objc_opt_class() grayBorderColor];
  }
  uint64_t v5 = [v7 CGColor];
  double v6 = [(HUCheckmarkAccessoryView *)self layer];
  [v6 setBorderColor:v5];
}

+ (double)borderWidth
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];
  double v4 = v3;

  double result = 1.66666663;
  if (v4 < 3.0) {
    return 1.5;
  }
  return result;
}

+ (id)grayBorderColor
{
  v2 = [MEMORY[0x1E4F428B8] systemGrayColor];
  double v3 = [v2 colorWithAlphaComponent:0.400000006];

  return v3;
}

- (BOOL)checked
{
  return self->_checked;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end