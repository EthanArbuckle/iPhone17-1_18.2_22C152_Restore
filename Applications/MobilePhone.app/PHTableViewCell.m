@interface PHTableViewCell
+ (NSString)reuseIdentifier;
+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3;
+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDirectionalEdgeInsets)rootViewLayoutMargins;
- (PHTableViewCell)initWithCoder:(id)a3;
- (PHTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)foregroundColor;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)foregroundView;
- (UIView)rootView;
- (double)subtitleLabelFirstBaselineLayoutConstraintConstant;
- (double)subtitleLabelLastBaselineLayoutConstraintConstant;
- (double)subtitleLabelLeadingLayoutConstraintConstant;
- (double)subtitleLabelTrailingLayoutConstraintConstant;
- (double)titleLabelFirstBaselineLayoutConstraintConstant;
- (double)titleLabelLastBaselineLayoutConstraintConstant;
- (double)titleLabelLeadingLayoutConstraintConstant;
- (double)titleLabelTrailingLayoutConstraintConstant;
- (id)loadRootViewAndContentViews;
- (void)commonInit;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)layoutSubviews;
- (void)setForegroundColor:(id)a3;
- (void)setForegroundView:(id)a3;
- (void)setRootView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFontsAndLayoutMetrics;
- (void)updateFontsLayoutMetricsAndSeparatorInset;
@end

@implementation PHTableViewCell

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  id v7 = a3;
  [(PHTableViewCell *)self rootViewLayoutMargins];
  if (!a5) {
    [v7 setDirectionalLayoutMargins:];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHTableViewCell;
  id v4 = a3;
  [(PHTableViewCell *)&v8 traitCollectionDidChange:v4];
  v5 = [(PHTableViewCell *)self traitCollection];
  v6 = [v4 preferredContentSizeCategory];

  id v7 = [v5 preferredContentSizeCategory];

  if (v6 != v7) {
    [(PHTableViewCell *)self updateFontsLayoutMetricsAndSeparatorInset];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(PHTableViewCell *)self contentView];
  [v6 bounds];
  double v8 = v7;

  if (width >= v8) {
    double width = v8;
  }
  v9 = [(PHTableViewCell *)self rootView];
  [v9 sizeThatFits:width, height];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PHTableViewCell;
  [(PHTableViewCell *)&v14 layoutSubviews];
  v3 = [(PHTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(PHTableViewCell *)self rootView];
  [v12 setFrame:v5, v7, v9, v11];

  if (self->_foregroundView)
  {
    double v13 = [(PHTableViewCell *)self contentView];
    [v13 bringSubviewToFront:self->_foregroundView];

    [(PHTableViewCell *)self bounds];
    -[UIView setFrame:](self->_foregroundView, "setFrame:");
  }
}

- (UIView)rootView
{
  return self->_rootView;
}

- (NSDirectionalEdgeInsets)rootViewLayoutMargins
{
  [(PHTableViewCell *)self titleLabelFirstBaselineLayoutConstraintConstant];
  double v4 = v3;
  double v5 = [(PHTableViewCell *)self titleLabel];
  [v5 effectiveFirstBaselineOffsetFromContentTop];
  double v7 = v4 - v6;
  [(PHTableViewCell *)self titleLabelLeadingLayoutConstraintConstant];
  double v9 = v8;
  [(PHTableViewCell *)self subtitleLabelLastBaselineLayoutConstraintConstant];
  double v11 = v10;
  double v12 = [(PHTableViewCell *)self subtitleLabel];
  [v12 effectiveBaselineOffsetFromContentBottom];
  double v14 = v11 - v13;
  [(PHTableViewCell *)self titleLabelTrailingLayoutConstraintConstant];
  double v16 = v15;

  double v17 = v7;
  double v18 = v9;
  double v19 = v14;
  double v20 = v16;
  result.trailing = v20;
  result.bottom = v19;
  result.leading = v18;
  result.top = v17;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (double)titleLabelTrailingLayoutConstraintConstant
{
  return self->_titleLabelTrailingLayoutConstraintConstant;
}

- (double)titleLabelLeadingLayoutConstraintConstant
{
  double v3 = objc_opt_class();
  double v4 = [(PHTableViewCell *)self traitCollection];
  double v5 = [v4 preferredContentSizeCategory];
  [v3 titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:v5];
  double v7 = v6;

  return v7;
}

- (id)loadRootViewAndContentViews
{
  double v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  LODWORD(v5) = 1148846080;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:1 forAxis:v6];
  double v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v7;

  LODWORD(v9) = 1148846080;
  [(UILabel *)self->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [(UILabel *)self->_subtitleLabel setContentHuggingPriority:1 forAxis:v10];
  return 0;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (PHTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PHTableViewCell;
  double v4 = [(PHTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4) {
    [(PHTableViewCell *)v4 commonInit];
  }
  return v5;
}

- (void)commonInit
{
  double v3 = [(PHTableViewCell *)self loadRootViewAndContentViews];
  rootView = self->_rootView;
  self->_rootView = v3;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIView *)self->_rootView setDelegate:self];
  }
  id v5 = [(PHTableViewCell *)self contentView];
  [v5 addSubview:self->_rootView];
}

+ (NSString)reuseIdentifier
{
  v2 = NSStringFromClass((Class)a1);
  double v3 = +[NSString stringWithFormat:@"%@ReuseIdentifier", v2];

  return (NSString *)v3;
}

+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  return 0.0;
}

- (void)updateFontsLayoutMetricsAndSeparatorInset
{
  [(PHTableViewCell *)self updateFontsAndLayoutMetrics];
  double v3 = objc_opt_class();
  id v5 = [(PHTableViewCell *)self traitCollection];
  double v4 = [v5 preferredContentSizeCategory];
  [v3 separatorInsetForContentSizeCategory:v4];
  -[PHTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
}

- (PHTableViewCell)initWithCoder:(id)a3
{
  return 0;
}

+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)foregroundColor
{
  if (self->_foregroundView)
  {
    v2 = [(PHTableViewCell *)self foregroundView];
    double v3 = [v2 backgroundColor];
  }
  else
  {
    double v3 = 0;
  }

  return (UIColor *)v3;
}

- (void)setForegroundColor:(id)a3
{
  id v11 = a3;
  if (v11
    && (+[UIColor clearColor],
        double v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v11 isEqual:v4],
        v4,
        (v5 & 1) == 0))
  {
    double v6 = [(PHTableViewCell *)self foregroundView];
    id v7 = [v6 backgroundColor];

    double v8 = v11;
    if (v7 == v11) {
      goto LABEL_7;
    }
    double v9 = [(PHTableViewCell *)self foregroundView];
    [v9 setBackgroundColor:v11];

    double v10 = [(PHTableViewCell *)self foregroundView];
    [v10 setUserInteractionEnabled:0];
  }
  else
  {
    [(PHTableViewCell *)self setForegroundView:0];
  }
  double v8 = v11;
LABEL_7:
}

- (UIView)foregroundView
{
  foregroundView = self->_foregroundView;
  if (!foregroundView)
  {
    double v4 = objc_opt_new();
    [(PHTableViewCell *)self setForegroundView:v4];

    foregroundView = self->_foregroundView;
  }

  return foregroundView;
}

- (void)setForegroundView:(id)a3
{
  unsigned __int8 v5 = (UIView *)a3;
  foregroundView = self->_foregroundView;
  id v7 = v5;
  if (foregroundView != v5)
  {
    [(UIView *)foregroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_foregroundView, a3);
    if (self->_foregroundView) {
      -[PHTableViewCell addSubview:](self, "addSubview:");
    }
  }
}

- (void)updateFontsAndLayoutMetrics
{
  double v3 = [(PHTableViewCell *)self titleLabel];
  double v4 = [v3 font];
  unsigned __int8 v5 = [v4 fontName];
  double v6 = UIContextMenuInteraction_ptr;
  id v7 = +[UIFont telephonyUIBodyShortEmphasizedFont];
  double v8 = [v7 fontName];
  if ([v5 isEqual:v8])
  {
    double v9 = [(PHTableViewCell *)self subtitleLabel];
    double v10 = [v9 font];
    id v11 = [v10 fontName];
    double v12 = +[UIFont telephonyUISubheadlineShortFont];
    [v12 fontName];
    double v13 = v23 = v3;
    unsigned __int8 v22 = [v11 isEqual:v13];

    double v6 = UIContextMenuInteraction_ptr;
    if (v22) {
      return;
    }
  }
  else
  {
  }
  double v14 = [v6[6] telephonyUIBodyShortEmphasizedFont];
  double v15 = [(PHTableViewCell *)self titleLabel];
  [v15 setFont:v14];

  double v16 = [v6[6] telephonyUISubheadlineShortFont];
  double v17 = [(PHTableViewCell *)self subtitleLabel];
  [v17 setFont:v16];

  double v18 = NUIContainerViewLengthUseDefault;
  double v19 = [(PHTableViewCell *)self subtitleLabel];
  [v19 setCustomBaselineOffsetFromBottom:v18];

  [(PHTableViewCell *)self effectiveBaselineOffsetFromBottom];
  double v21 = v20;
  id v24 = [(PHTableViewCell *)self subtitleLabel];
  [v24 setCustomBaselineOffsetFromBottom:v21];
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void)setRootView:(id)a3
{
}

- (double)titleLabelFirstBaselineLayoutConstraintConstant
{
  return self->_titleLabelFirstBaselineLayoutConstraintConstant;
}

- (double)titleLabelLastBaselineLayoutConstraintConstant
{
  return self->_titleLabelLastBaselineLayoutConstraintConstant;
}

- (double)subtitleLabelFirstBaselineLayoutConstraintConstant
{
  return self->_subtitleLabelFirstBaselineLayoutConstraintConstant;
}

- (double)subtitleLabelLastBaselineLayoutConstraintConstant
{
  return self->_subtitleLabelLastBaselineLayoutConstraintConstant;
}

- (double)subtitleLabelLeadingLayoutConstraintConstant
{
  return self->_subtitleLabelLeadingLayoutConstraintConstant;
}

- (double)subtitleLabelTrailingLayoutConstraintConstant
{
  return self->_subtitleLabelTrailingLayoutConstraintConstant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_foregroundView, 0);
}

@end