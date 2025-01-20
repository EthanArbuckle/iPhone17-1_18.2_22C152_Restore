@interface GKDashboardSectionHeaderView
+ (CGSize)platformSizeForTitle:(id)a3 withFont:(id)a4;
+ (double)defaultHeight;
+ (double)widthForTitle:(id)a3 withFont:(id)a4;
- (BOOL)onDarkBackground;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)leftMarginConstraint;
- (NSLayoutConstraint)rightMarginConstraint;
- (NSString)title;
- (UIColor)titleColor;
- (UIFont)font;
- (UILabel)titleLabel;
- (void)awakeFromNib;
- (void)setFont:(id)a3;
- (void)setLeftMarginConstraint:(id)a3;
- (void)setOnDarkBackground:(BOOL)a3;
- (void)setRightMarginConstraint:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation GKDashboardSectionHeaderView

+ (double)defaultHeight
{
  return 31.0;
}

+ (double)widthForTitle:(id)a3 withFont:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GKDashboardSectionHeaderView_widthForTitle_withFont___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v5 = widthForTitle_withFont__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&widthForTitle_withFont__onceToken, block);
  }
  [(id)widthForTitle_withFont__sSectionHeaderView setTitle:v7];

  if (v6) {
    uint64_t v8 = (uint64_t)v6;
  }
  else {
    uint64_t v8 = widthForTitle_withFont__sOriginalFont;
  }
  [(id)widthForTitle_withFont__sSectionHeaderView setFont:v8];

  [(id)widthForTitle_withFont__sSectionHeaderView intrinsicContentSize];
  return result;
}

uint64_t __55__GKDashboardSectionHeaderView_widthForTitle_withFont___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _gkViewFromNib];
  v2 = (void *)widthForTitle_withFont__sSectionHeaderView;
  widthForTitle_withFont__sSectionHeaderView = v1;

  uint64_t v3 = [(id)widthForTitle_withFont__sSectionHeaderView font];
  uint64_t v4 = widthForTitle_withFont__sOriginalFont;
  widthForTitle_withFont__sOriginalFont = v3;

  return MEMORY[0x1F41817F8](v3, v4);
}

+ (CGSize)platformSizeForTitle:(id)a3 withFont:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  objc_msgSend(a1, "defaultHeight", a3, a4);
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)GKDashboardSectionHeaderView;
  [(GKDashboardSectionHeaderView *)&v4 awakeFromNib];
  uint64_t v3 = [(UILabel *)self->_titleLabel textColor];
  [(GKDashboardSectionHeaderView *)self setTitleColor:v3];
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setFont:(id)a3
{
}

- (UIFont)font
{
  return [(UILabel *)self->_titleLabel font];
}

- (void)setOnDarkBackground:(BOOL)a3
{
  if (self->_onDarkBackground != a3) {
    self->_onDarkBackground = a3;
  }
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = [(GKDashboardSectionHeaderView *)self titleLabel];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  [(NSLayoutConstraint *)self->_leftMarginConstraint constant];
  double v9 = v8;
  [(NSLayoutConstraint *)self->_rightMarginConstraint constant];
  double v11 = v5 + v9 + v10;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  self->_titleLabel = (UILabel *)a3;
}

- (NSLayoutConstraint)leftMarginConstraint
{
  return self->_leftMarginConstraint;
}

- (void)setLeftMarginConstraint:(id)a3
{
  self->_leftMarginConstraint = (NSLayoutConstraint *)a3;
}

- (BOOL)onDarkBackground
{
  return self->_onDarkBackground;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (NSLayoutConstraint)rightMarginConstraint
{
  return self->_rightMarginConstraint;
}

- (void)setRightMarginConstraint:(id)a3
{
  self->_rightMarginConstraint = (NSLayoutConstraint *)a3;
}

- (void).cxx_destruct
{
}

@end