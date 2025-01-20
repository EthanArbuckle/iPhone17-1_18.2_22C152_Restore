@interface HKRoundedHeaderView
+ (double)_detailTextLastBaselineToBottom;
+ (double)_textLastBaselineToBottom;
+ (double)_topToTextFirstBaseline;
+ (double)estimatedHeight;
+ (id)_accessibilityContentSizeCategory;
+ (id)_detailTextFont;
+ (id)_textFont;
- (BOOL)_isLayingOutForAccessibility;
- (BOOL)_isTextLabelTruncated;
- (BOOL)isInteractive;
- (HKGradient)gradient;
- (HKGradientView)gradientView;
- (HKRoundedHeaderView)initWithColor:(id)a3;
- (HKRoundedHeaderView)initWithColor:(id)a3 isInteractive:(BOOL)a4;
- (HKRoundedHeaderView)initWithFrame:(CGRect)a3;
- (HKRoundedHeaderView)initWithGradient:(id)a3;
- (NSArray)largeTextConstraints;
- (NSArray)regularConstraints;
- (NSLayoutConstraint)detailTextLabelBottomConstraint;
- (NSLayoutConstraint)detailTextLabelFirstBaselineConstraint;
- (NSLayoutConstraint)detailTextLabelWidthConstraint;
- (NSLayoutConstraint)largeTextChevronCenterYConstraint;
- (NSLayoutConstraint)textLabelBottomConstraint;
- (NSLayoutConstraint)textLabelFirstBaselineConstraint;
- (NSLayoutConstraint)textLabelWidthConstraint;
- (NSLayoutConstraint)textLeadingConstraintToImageView;
- (NSLayoutConstraint)textLeadingConstraintToView;
- (NSString)detailText;
- (NSString)detailTextCompositingFilter;
- (NSString)text;
- (UIColor)chevronColor;
- (UIColor)color;
- (UIColor)detailTextColor;
- (UIColor)textColor;
- (UIImage)image;
- (UIImageView)chevronRightImageView;
- (UIImageView)imageView;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (double)_headerViewWidth;
- (double)textHorizontalInset;
- (void)_setupConstraints;
- (void)_setupUI;
- (void)_updateTextConstraints;
- (void)_updateTextLabel;
- (void)setChevronColor:(id)a3;
- (void)setChevronRightImageView:(id)a3;
- (void)setColor:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setDetailTextColor:(id)a3;
- (void)setDetailTextCompositingFilter:(id)a3;
- (void)setDetailTextLabel:(id)a3;
- (void)setDetailTextLabelBottomConstraint:(id)a3;
- (void)setDetailTextLabelFirstBaselineConstraint:(id)a3;
- (void)setDetailTextLabelWidthConstraint:(id)a3;
- (void)setGradient:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLargeTextChevronCenterYConstraint:(id)a3;
- (void)setLargeTextConstraints:(id)a3;
- (void)setRegularConstraints:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setTextLabelBottomConstraint:(id)a3;
- (void)setTextLabelFirstBaselineConstraint:(id)a3;
- (void)setTextLabelWidthConstraint:(id)a3;
- (void)setTextLeadingConstraintToImageView:(id)a3;
- (void)setTextLeadingConstraintToView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKRoundedHeaderView

- (HKRoundedHeaderView)initWithColor:(id)a3
{
  return [(HKRoundedHeaderView *)self initWithColor:a3 isInteractive:1];
}

- (HKRoundedHeaderView)initWithColor:(id)a3 isInteractive:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKRoundedHeaderView;
  v8 = -[HKRoundedHeaderView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    gradient = v8->_gradient;
    v8->_gradient = 0;

    objc_storeStrong((id *)&v9->_color, a3);
    v9->_isInteractive = a4;
    [(HKRoundedHeaderView *)v9 _setupUI];
    [(HKRoundedHeaderView *)v9 _setupConstraints];
  }

  return v9;
}

- (HKRoundedHeaderView)initWithGradient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRoundedHeaderView;
  v6 = -[HKRoundedHeaderView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gradient, a3);
    v7->_isInteractive = 1;
    [(HKRoundedHeaderView *)v7 _setupUI];
    [(HKRoundedHeaderView *)v7 _setupConstraints];
  }

  return v7;
}

- (HKRoundedHeaderView)initWithFrame:(CGRect)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "whiteColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = [(HKRoundedHeaderView *)self initWithColor:v4];

  return v5;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  id v5 = a3;
  [(HKRoundedHeaderView *)self setBackgroundColor:v5];
}

- (void)setChevronColor:(id)a3
{
  objc_storeStrong((id *)&self->_chevronColor, a3);
  id v5 = a3;
  id v6 = [(HKRoundedHeaderView *)self chevronRightImageView];
  [v6 setTintColor:v5];
}

- (void)setGradient:(id)a3
{
  objc_storeStrong((id *)&self->_gradient, a3);
  id v5 = a3;
  id v6 = [(HKRoundedHeaderView *)self gradientView];
  [v6 setGradient:v5];
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  id v6 = [(HKRoundedHeaderView *)self imageView];
  [v6 setImage:v5];

  [(HKRoundedHeaderView *)self _updateTextConstraints];
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  [(HKRoundedHeaderView *)self _updateTextLabel];
  [(HKRoundedHeaderView *)self _updateUI];
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  [(HKRoundedHeaderView *)self _updateTextLabel];
}

- (void)setDetailText:(id)a3
{
  id v4 = a3;
  id v5 = [(HKRoundedHeaderView *)self detailTextLabel];
  [v5 setText:v4];

  [(HKRoundedHeaderView *)self _updateUI];
}

- (NSString)detailText
{
  v2 = [(HKRoundedHeaderView *)self detailTextLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setDetailTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextColor, a3);
  id v5 = a3;
  id v6 = [(HKRoundedHeaderView *)self detailTextLabel];
  [v6 setTextColor:v5];
}

- (void)setDetailTextCompositingFilter:(id)a3
{
  self->_detailTextCompositingFilter = (NSString *)a3;
  objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(HKRoundedHeaderView *)self detailTextLabel];
  id v5 = [v4 layer];
  [v5 setCompositingFilter:v6];
}

- (double)textHorizontalInset
{
  return 16.0;
}

+ (double)estimatedHeight
{
  [(id)objc_opt_class() _topToTextFirstBaseline];
  double v3 = v2;
  [(id)objc_opt_class() _textLastBaselineToBottom];
  return v3 + v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKRoundedHeaderView;
  id v4 = a3;
  [(HKRoundedHeaderView *)&v8 traitCollectionDidChange:v4];
  id v5 = [(HKRoundedHeaderView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0) {
    [(HKRoundedHeaderView *)self _updateUI];
  }
}

- (BOOL)_isTextLabelTruncated
{
  v27[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(HKRoundedHeaderView *)self textLabel];
  id v4 = [v3 text];
  uint64_t v26 = *MEMORY[0x1E4FB06F8];
  uint64_t v5 = v26;
  id v6 = [(id)objc_opt_class() _textFont];
  v27[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  [v4 sizeWithAttributes:v7];
  double v9 = v8;

  v10 = [(HKRoundedHeaderView *)self detailTextLabel];
  v11 = [v10 text];
  uint64_t v24 = v5;
  objc_super v12 = [(id)objc_opt_class() _detailTextFont];
  v25 = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [v11 sizeWithAttributes:v13];
  double v15 = v14;

  [(HKRoundedHeaderView *)self _headerViewWidth];
  double v17 = v16;
  [(HKRoundedHeaderView *)self textHorizontalInset];
  double v19 = v15 + v18 * 3.0 + 8.0;
  v20 = [(HKRoundedHeaderView *)self chevronRightImageView];
  [v20 frame];
  double v22 = v17 - (v19 + v21);

  return v9 > v22;
}

- (double)_headerViewWidth
{
  [(HKRoundedHeaderView *)self frame];
  if (v3 == 0.0)
  {
    id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 bounds];
    double v6 = v5 + -32.0;
  }
  else
  {
    [(HKRoundedHeaderView *)self frame];
    return v7;
  }
  return v6;
}

- (void)_setupUI
{
  double v3 = [(HKRoundedHeaderView *)self gradient];

  if (v3)
  {
    id v4 = [HKGradientView alloc];
    double v5 = [(HKRoundedHeaderView *)self gradient];
    double v6 = [(HKGradientView *)v4 initWithGradient:v5];
    [(HKRoundedHeaderView *)self setGradientView:v6];

    double v7 = [(HKRoundedHeaderView *)self gradientView];
    [v7 setOpaque:1];

    double v8 = [(HKRoundedHeaderView *)self gradientView];
    [v8 setClipsToBounds:1];

    double v9 = [(HKRoundedHeaderView *)self gradientView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(HKRoundedHeaderView *)self gradientView];
    [(HKRoundedHeaderView *)self addSubview:v10];
  }
  else
  {
    v10 = [(HKRoundedHeaderView *)self color];
    [(HKRoundedHeaderView *)self setBackgroundColor:v10];
  }

  v11 = [(HKRoundedHeaderView *)self layer];
  [v11 setCornerRadius:10.0];

  objc_super v12 = [(HKRoundedHeaderView *)self layer];
  [v12 setMasksToBounds:1];

  v13 = [(HKRoundedHeaderView *)self layer];
  [v13 setMaskedCorners:3];

  id v14 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [(HKRoundedHeaderView *)self setImageView:v14];

  double v15 = [(HKRoundedHeaderView *)self imageView];
  [v15 setClipsToBounds:1];

  double v16 = [(HKRoundedHeaderView *)self imageView];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v17 = [(HKRoundedHeaderView *)self imageView];
  [(HKRoundedHeaderView *)self addSubview:v17];

  id v18 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKRoundedHeaderView *)self setTextLabel:v18];

  double v19 = [(HKRoundedHeaderView *)self textLabel];
  [v19 setNumberOfLines:1];

  v20 = [(HKRoundedHeaderView *)self textLabel];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v21 = [(HKRoundedHeaderView *)self textLabel];
  [v21 setAdjustsFontForContentSizeCategory:1];

  double v22 = [(id)objc_opt_class() _textFont];
  v23 = [(HKRoundedHeaderView *)self textLabel];
  [v23 setFont:v22];

  uint64_t v24 = [(HKRoundedHeaderView *)self textLabel];
  [(HKRoundedHeaderView *)self addSubview:v24];

  id v25 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKRoundedHeaderView *)self setDetailTextLabel:v25];

  uint64_t v26 = [(HKRoundedHeaderView *)self detailTextLabel];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [(HKRoundedHeaderView *)self detailTextLabel];
  [v27 setAdjustsFontForContentSizeCategory:1];

  v28 = [(id)objc_opt_class() _detailTextFont];
  v29 = [(HKRoundedHeaderView *)self detailTextLabel];
  [v29 setFont:v28];

  if ([(UIView *)self hk_isLeftToRight]) {
    uint64_t v30 = 2;
  }
  else {
    uint64_t v30 = 0;
  }
  v31 = [(HKRoundedHeaderView *)self detailTextLabel];
  [v31 setTextAlignment:v30];

  v32 = [(HKRoundedHeaderView *)self detailTextLabel];
  [(HKRoundedHeaderView *)self addSubview:v32];

  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 2);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [(HKRoundedHeaderView *)self setChevronRightImageView:v33];

  v34 = [MEMORY[0x1E4FB1830] configurationWithFont:v42 scale:1];
  v35 = [(HKRoundedHeaderView *)self chevronRightImageView];
  [v35 setPreferredSymbolConfiguration:v34];

  if (self->_isInteractive)
  {
    v36 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
    v37 = [(HKRoundedHeaderView *)self chevronRightImageView];
    [v37 setImage:v36];
  }
  v38 = [(HKRoundedHeaderView *)self chevronRightImageView];
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

  chevronColor = self->_chevronColor;
  v40 = [(HKRoundedHeaderView *)self chevronRightImageView];
  [v40 setTintColor:chevronColor];

  v41 = [(HKRoundedHeaderView *)self chevronRightImageView];
  [(HKRoundedHeaderView *)self addSubview:v41];
}

- (void)_setupConstraints
{
  double v3 = [(HKRoundedHeaderView *)self gradient];

  if (v3)
  {
    id v4 = [(HKRoundedHeaderView *)self gradientView];
    objc_msgSend(v4, "hk_alignConstraintsWithView:", self);
  }
  [(HKRoundedHeaderView *)self textHorizontalInset];
  double v6 = v5;
  double v7 = [(HKRoundedHeaderView *)self imageView];
  double v8 = [v7 leadingAnchor];
  double v9 = [(HKRoundedHeaderView *)self leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:v6];
  [v10 setActive:1];

  v11 = [(HKRoundedHeaderView *)self imageView];
  objc_super v12 = [v11 centerYAnchor];
  v13 = [(HKRoundedHeaderView *)self centerYAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  double v15 = [(HKRoundedHeaderView *)self imageView];
  double v16 = [v15 widthAnchor];
  double v17 = [v16 constraintEqualToConstant:29.0];
  [v17 setActive:1];

  id v18 = [(HKRoundedHeaderView *)self imageView];
  double v19 = [v18 heightAnchor];
  v20 = [v19 constraintEqualToConstant:29.0];
  [v20 setActive:1];

  double v21 = [(HKRoundedHeaderView *)self textLabel];
  double v22 = [v21 leadingAnchor];
  v23 = [(HKRoundedHeaderView *)self leadingAnchor];
  uint64_t v24 = [v22 constraintEqualToAnchor:v23 constant:v6];
  [(HKRoundedHeaderView *)self setTextLeadingConstraintToView:v24];

  id v25 = [(HKRoundedHeaderView *)self textLabel];
  uint64_t v26 = [v25 leadingAnchor];
  v27 = [(HKRoundedHeaderView *)self imageView];
  v28 = [v27 trailingAnchor];
  v29 = [v26 constraintEqualToAnchor:v28 constant:12.0];
  [(HKRoundedHeaderView *)self setTextLeadingConstraintToImageView:v29];

  uint64_t v30 = [(HKRoundedHeaderView *)self textLabel];
  v31 = [v30 widthAnchor];
  v32 = [(HKRoundedHeaderView *)self widthAnchor];
  id v33 = [v31 constraintLessThanOrEqualToAnchor:v32 multiplier:0.66];
  [(HKRoundedHeaderView *)self setTextLabelWidthConstraint:v33];

  v34 = [(HKRoundedHeaderView *)self textLabelWidthConstraint];
  LODWORD(v35) = 1144750080;
  [v34 setPriority:v35];

  v36 = [(HKRoundedHeaderView *)self detailTextLabel];
  v37 = [v36 widthAnchor];
  v38 = [(HKRoundedHeaderView *)self widthAnchor];
  v39 = [v37 constraintLessThanOrEqualToAnchor:v38 multiplier:0.34];
  [(HKRoundedHeaderView *)self setDetailTextLabelWidthConstraint:v39];

  v40 = [(HKRoundedHeaderView *)self detailTextLabelWidthConstraint];
  LODWORD(v41) = 1144750080;
  [v40 setPriority:v41];

  id v42 = [(HKRoundedHeaderView *)self textLabel];
  v43 = [v42 firstBaselineAnchor];
  v44 = [(HKRoundedHeaderView *)self topAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [(HKRoundedHeaderView *)self setTextLabelFirstBaselineConstraint:v45];

  v46 = [(HKRoundedHeaderView *)self textLabelFirstBaselineConstraint];
  LODWORD(v47) = 1144750080;
  [v46 setPriority:v47];

  v48 = [(HKRoundedHeaderView *)self textLabelFirstBaselineConstraint];
  [v48 setActive:1];

  v49 = [(HKRoundedHeaderView *)self detailTextLabel];
  LODWORD(v50) = 1148846080;
  [v49 setContentCompressionResistancePriority:0 forAxis:v50];

  v51 = [(HKRoundedHeaderView *)self chevronRightImageView];
  v52 = [v51 layoutMarginsGuide];
  v53 = [v52 trailingAnchor];
  v54 = [(HKRoundedHeaderView *)self trailingAnchor];
  v55 = [v53 constraintEqualToAnchor:v54 constant:-v6];
  [v55 setActive:1];

  v56 = [(HKRoundedHeaderView *)self chevronRightImageView];
  LODWORD(v57) = 1148846080;
  [v56 setContentCompressionResistancePriority:0 forAxis:v57];

  id v119 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v58 = [(HKRoundedHeaderView *)self detailTextLabel];
  v59 = [v58 leadingAnchor];
  v60 = [(HKRoundedHeaderView *)self textLabel];
  v61 = [v60 trailingAnchor];
  v62 = [v59 constraintGreaterThanOrEqualToAnchor:v61 constant:v6];
  [v119 addObject:v62];

  v63 = [(HKRoundedHeaderView *)self detailTextLabel];
  v64 = [v63 firstBaselineAnchor];
  v65 = [(HKRoundedHeaderView *)self textLabel];
  v66 = [v65 lastBaselineAnchor];
  v67 = [v64 constraintEqualToAnchor:v66];
  [v119 addObject:v67];

  v68 = [(HKRoundedHeaderView *)self chevronRightImageView];
  v69 = [v68 leadingAnchor];
  v70 = [(HKRoundedHeaderView *)self detailTextLabel];
  v71 = [v70 trailingAnchor];
  v72 = [v69 constraintEqualToAnchor:v71 constant:8.0];
  [v119 addObject:v72];

  v73 = [(HKRoundedHeaderView *)self chevronRightImageView];
  v74 = [v73 centerYAnchor];
  v75 = [(HKRoundedHeaderView *)self detailTextLabel];
  v76 = [v75 centerYAnchor];
  v77 = [v74 constraintEqualToAnchor:v76];
  [v119 addObject:v77];

  v78 = [(HKRoundedHeaderView *)self bottomAnchor];
  v79 = [(HKRoundedHeaderView *)self textLabel];
  v80 = [v79 lastBaselineAnchor];
  v81 = [v78 constraintEqualToAnchor:v80];
  [(HKRoundedHeaderView *)self setTextLabelBottomConstraint:v81];

  v82 = [(HKRoundedHeaderView *)self textLabelBottomConstraint];
  [v119 addObject:v82];

  v83 = (void *)[v119 copy];
  [(HKRoundedHeaderView *)self setRegularConstraints:v83];

  id v84 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v85 = [(HKRoundedHeaderView *)self textLabel];
  v86 = [v85 trailingAnchor];
  v87 = [(HKRoundedHeaderView *)self chevronRightImageView];
  v88 = [v87 leadingAnchor];
  v89 = [v86 constraintLessThanOrEqualToAnchor:v88 constant:-8.0];
  [v84 addObject:v89];

  v90 = [(HKRoundedHeaderView *)self detailTextLabel];
  v91 = [v90 leadingAnchor];
  v92 = [(HKRoundedHeaderView *)self textLabel];
  v93 = [v92 leadingAnchor];
  v94 = [v91 constraintEqualToAnchor:v93];
  [v84 addObject:v94];

  v95 = [(HKRoundedHeaderView *)self detailTextLabel];
  v96 = [v95 trailingAnchor];
  v97 = [(HKRoundedHeaderView *)self textLabel];
  v98 = [v97 trailingAnchor];
  v99 = [v96 constraintEqualToAnchor:v98];
  [v84 addObject:v99];

  v100 = [(HKRoundedHeaderView *)self detailTextLabel];
  v101 = [v100 firstBaselineAnchor];
  v102 = [(HKRoundedHeaderView *)self textLabel];
  v103 = [v102 lastBaselineAnchor];
  v104 = [v101 constraintEqualToAnchor:v103];
  [(HKRoundedHeaderView *)self setDetailTextLabelFirstBaselineConstraint:v104];

  v105 = [(HKRoundedHeaderView *)self detailTextLabelFirstBaselineConstraint];
  [v84 addObject:v105];

  v106 = [(HKRoundedHeaderView *)self bottomAnchor];
  v107 = [(HKRoundedHeaderView *)self detailTextLabel];
  v108 = [v107 lastBaselineAnchor];
  v109 = [v106 constraintEqualToAnchor:v108];
  [(HKRoundedHeaderView *)self setDetailTextLabelBottomConstraint:v109];

  v110 = [(HKRoundedHeaderView *)self detailTextLabelBottomConstraint];
  [v84 addObject:v110];

  v111 = [(HKRoundedHeaderView *)self chevronRightImageView];
  v112 = [v111 centerYAnchor];
  v113 = [(HKRoundedHeaderView *)self textLabel];
  v114 = [v113 topAnchor];
  v115 = [v112 constraintEqualToAnchor:v114];
  [(HKRoundedHeaderView *)self setLargeTextChevronCenterYConstraint:v115];

  v116 = [(HKRoundedHeaderView *)self largeTextChevronCenterYConstraint];
  [v84 addObject:v116];

  v117 = (void *)[v84 copy];
  [(HKRoundedHeaderView *)self setLargeTextConstraints:v117];

  v118 = [(HKRoundedHeaderView *)self chevronRightImageView];
  [v118 layoutIfNeeded];

  [(HKRoundedHeaderView *)self _updateForCurrentSizeCategory];
}

- (void)_updateTextLabel
{
  double v3 = [(HKRoundedHeaderView *)self text];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28E48];
    double v5 = [(HKRoundedHeaderView *)self text];
    double v6 = [(id)objc_opt_class() _textFont];
    LODWORD(v7) = 0.5;
    objc_msgSend(v4, "hk_initWithString:font:hyphenationFactor:", v5, v6, v7);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    double v8 = [(HKRoundedHeaderView *)self textColor];

    if (v8)
    {
      uint64_t v9 = *MEMORY[0x1E4FB0700];
      v10 = [(HKRoundedHeaderView *)self textColor];
      v11 = [(HKRoundedHeaderView *)self text];
      objc_msgSend(v14, "addAttribute:value:range:", v9, v10, 0, objc_msgSend(v11, "length"));
    }
    objc_super v12 = [(HKRoundedHeaderView *)self textLabel];
    [v12 setAttributedText:v14];
  }
  else
  {
    v13 = [(HKRoundedHeaderView *)self textLabel];
    [v13 setAttributedText:0];

    id v14 = [(HKRoundedHeaderView *)self textLabel];
    [v14 setText:&stru_1F3B9CF20];
  }
}

- (void)_updateTextConstraints
{
  double v3 = [(HKRoundedHeaderView *)self image];

  id v4 = [(HKRoundedHeaderView *)self imageView];
  double v5 = v4;
  if (v3)
  {
    [v4 setHidden:0];

    double v6 = [(HKRoundedHeaderView *)self textLeadingConstraintToView];
    [v6 setActive:0];

    double v7 = [(HKRoundedHeaderView *)self textLeadingConstraintToImageView];
    double v8 = v7;
    uint64_t v9 = 1;
  }
  else
  {
    [v4 setHidden:1];

    v10 = [(HKRoundedHeaderView *)self textLeadingConstraintToView];
    [v10 setActive:1];

    double v7 = [(HKRoundedHeaderView *)self textLeadingConstraintToImageView];
    double v8 = v7;
    uint64_t v9 = 0;
  }
  [v7 setActive:v9];

  if ([(HKRoundedHeaderView *)self _isLayingOutForAccessibility]
    || [(HKRoundedHeaderView *)self _isTextLabelTruncated])
  {
    v11 = [(HKRoundedHeaderView *)self textLabelWidthConstraint];
    [v11 setActive:0];

    objc_super v12 = [(HKRoundedHeaderView *)self textLabel];
    [v12 setNumberOfLines:0];

    v13 = [(HKRoundedHeaderView *)self detailTextLabel];
    [v13 setNumberOfLines:0];

    id v14 = [(HKRoundedHeaderView *)self detailTextLabelWidthConstraint];
    [v14 setActive:0];

    double v15 = [(HKRoundedHeaderView *)self detailTextLabel];
    [v15 setTextAlignment:4];

    [(id)objc_opt_class() _textLastBaselineToBottom];
    double v17 = v16;
    id v18 = [(HKRoundedHeaderView *)self detailTextLabelFirstBaselineConstraint];
    [v18 setConstant:v17];

    [(id)objc_opt_class() _detailTextLastBaselineToBottom];
    double v20 = v19;
    double v21 = [(HKRoundedHeaderView *)self detailTextLabelBottomConstraint];
    [v21 setConstant:v20];

    double v22 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(HKRoundedHeaderView *)self regularConstraints];
    [v22 deactivateConstraints:v23];

    uint64_t v24 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v25 = [(HKRoundedHeaderView *)self largeTextConstraints];
  }
  else
  {
    uint64_t v26 = [(HKRoundedHeaderView *)self textLabelWidthConstraint];
    [v26 setActive:1];

    v27 = [(HKRoundedHeaderView *)self textLabel];
    [v27 setNumberOfLines:1];

    v28 = [(HKRoundedHeaderView *)self detailTextLabel];
    [v28 setNumberOfLines:1];

    v29 = [(HKRoundedHeaderView *)self detailTextLabelWidthConstraint];
    [v29 setActive:1];

    uint64_t v30 = [(HKRoundedHeaderView *)self detailTextLabelFirstBaselineConstraint];
    [v30 setConstant:0.0];

    v31 = [(id)objc_opt_class() _accessibilityContentSizeCategory];
    int64_t v32 = [(UIView *)self hk_trailingTextAlignmentAtOrBelowSizeCategory:v31];
    id v33 = [(HKRoundedHeaderView *)self detailTextLabel];
    [v33 setTextAlignment:v32];

    [(id)objc_opt_class() _textLastBaselineToBottom];
    double v35 = v34;
    v36 = [(HKRoundedHeaderView *)self textLabelBottomConstraint];
    [v36 setConstant:v35];

    v37 = (void *)MEMORY[0x1E4F28DC8];
    v38 = [(HKRoundedHeaderView *)self largeTextConstraints];
    [v37 deactivateConstraints:v38];

    uint64_t v24 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v25 = [(HKRoundedHeaderView *)self regularConstraints];
  }
  v39 = (void *)v25;
  [v24 activateConstraints:v25];

  v40 = [(HKRoundedHeaderView *)self detailText];
  double v41 = objc_msgSend(v40, "hk_copyNonEmptyString");

  if (!v41)
  {
    id v42 = [(HKRoundedHeaderView *)self textLabelWidthConstraint];
    [v42 setActive:0];

    v43 = [(HKRoundedHeaderView *)self detailTextLabelWidthConstraint];
    [v43 setActive:0];
  }
  [(id)objc_opt_class() _topToTextFirstBaseline];
  double v45 = v44;
  v46 = [(HKRoundedHeaderView *)self textLabelFirstBaselineConstraint];
  [v46 setConstant:v45];

  id v51 = [(HKRoundedHeaderView *)self textLabel];
  double v47 = [v51 font];
  [v47 lineHeight];
  double v49 = v48 * 0.5;
  double v50 = [(HKRoundedHeaderView *)self largeTextChevronCenterYConstraint];
  [v50 setConstant:v49];
}

+ (id)_accessibilityContentSizeCategory
{
  return (id)*MEMORY[0x1E4FB27D0];
}

- (BOOL)_isLayingOutForAccessibility
{
  double v2 = [(id)objc_opt_class() _accessibilityContentSizeCategory];
  BOOL IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory(v2);

  return IsLargerThanSizeCategory;
}

+ (id)_textFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB2908]);
}

+ (double)_topToTextFirstBaseline
{
  double v2 = [(id)objc_opt_class() _textFont];
  [v2 _scaledValueForValue:28.0];
  double v4 = v3;

  return v4;
}

+ (double)_textLastBaselineToBottom
{
  double v2 = [(id)objc_opt_class() _textFont];
  [v2 _scaledValueForValue:16.0];
  double v4 = v3;

  return v4;
}

+ (id)_detailTextFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28D8]);
}

+ (double)_detailTextLastBaselineToBottom
{
  double v2 = [(id)objc_opt_class() _detailTextFont];
  [v2 _scaledValueForValue:12.0];
  double v4 = v3;

  return v4;
}

- (HKGradient)gradient
{
  return self->_gradient;
}

- (UIColor)color
{
  return self->_color;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)chevronColor
{
  return self->_chevronColor;
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (NSString)detailTextCompositingFilter
{
  return self->_detailTextCompositingFilter;
}

- (HKGradientView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
}

- (UIImageView)chevronRightImageView
{
  return self->_chevronRightImageView;
}

- (void)setChevronRightImageView:(id)a3
{
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (NSLayoutConstraint)textLeadingConstraintToView
{
  return self->_textLeadingConstraintToView;
}

- (void)setTextLeadingConstraintToView:(id)a3
{
}

- (NSLayoutConstraint)textLeadingConstraintToImageView
{
  return self->_textLeadingConstraintToImageView;
}

- (void)setTextLeadingConstraintToImageView:(id)a3
{
}

- (NSLayoutConstraint)textLabelFirstBaselineConstraint
{
  return self->_textLabelFirstBaselineConstraint;
}

- (void)setTextLabelFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)textLabelWidthConstraint
{
  return self->_textLabelWidthConstraint;
}

- (void)setTextLabelWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)textLabelBottomConstraint
{
  return self->_textLabelBottomConstraint;
}

- (void)setTextLabelBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)detailTextLabelFirstBaselineConstraint
{
  return self->_detailTextLabelFirstBaselineConstraint;
}

- (void)setDetailTextLabelFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)detailTextLabelWidthConstraint
{
  return self->_detailTextLabelWidthConstraint;
}

- (void)setDetailTextLabelWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)detailTextLabelBottomConstraint
{
  return self->_detailTextLabelBottomConstraint;
}

- (void)setDetailTextLabelBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)largeTextChevronCenterYConstraint
{
  return self->_largeTextChevronCenterYConstraint;
}

- (void)setLargeTextChevronCenterYConstraint:(id)a3
{
}

- (NSArray)regularConstraints
{
  return self->_regularConstraints;
}

- (void)setRegularConstraints:(id)a3
{
}

- (NSArray)largeTextConstraints
{
  return self->_largeTextConstraints;
}

- (void)setLargeTextConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextChevronCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_detailTextLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_detailTextLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_detailTextLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_textLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_textLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_textLeadingConstraintToImageView, 0);
  objc_storeStrong((id *)&self->_textLeadingConstraintToView, 0);
  objc_storeStrong((id *)&self->_chevronRightImageView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_chevronColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_gradient, 0);
}

@end