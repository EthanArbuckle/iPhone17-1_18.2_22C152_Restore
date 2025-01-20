@interface MPVoicemailMailboxTableViewCell
+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3;
+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3;
+ (id)reuseIdentifier;
- (NSArray)allConstraints;
- (UILabel)countLabel;
- (UILabel)titleLabel;
- (double)subtitleLabelLastBaselineLayoutConstraintConstant;
- (double)titleLabelFirstBaselineLayoutConstraintConstant;
- (void)_updateTextColor;
- (void)commonInit;
- (void)loadConstraints;
- (void)loadContentView;
- (void)setAllConstraints:(id)a3;
- (void)setCountLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)tintColorDidChange;
- (void)unloadConstraints;
- (void)updateConstraints;
- (void)updateFonts;
@end

@implementation MPVoicemailMailboxTableViewCell

+ (id)reuseIdentifier
{
  return @"MPVoicemailMailboxTableViewCellReuseIdentifier";
}

+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3
{
  [a1 titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:a3];
  double v4 = v3;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  return 34.0;
}

- (void)commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)MPVoicemailMailboxTableViewCell;
  [(MPVoicemailMailboxTableViewCell *)&v3 commonInit];
  [(MPVoicemailMailboxTableViewCell *)self setAccessoryType:1];
}

- (void)loadContentView
{
  v13.receiver = self;
  v13.super_class = (Class)MPVoicemailMailboxTableViewCell;
  [(MPVoicemailMailboxTableViewCell *)&v13 loadContentView];
  id v3 = objc_alloc_init((Class)UILabel);
  [(MPVoicemailMailboxTableViewCell *)self setTitleLabel:v3];

  double v4 = [(MPVoicemailMailboxTableViewCell *)self titleLabel];
  [v4 setTextAlignment:4];

  double v5 = [(MPVoicemailMailboxTableViewCell *)self titleLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v6 = [(MPVoicemailMailboxTableViewCell *)self contentView];
  double v7 = [(MPVoicemailMailboxTableViewCell *)self titleLabel];
  [v6 addSubview:v7];

  id v8 = objc_alloc_init((Class)UILabel);
  [(MPVoicemailMailboxTableViewCell *)self setCountLabel:v8];

  v9 = [(MPVoicemailMailboxTableViewCell *)self countLabel];
  [v9 setTextAlignment:4];

  v10 = [(MPVoicemailMailboxTableViewCell *)self countLabel];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(MPVoicemailMailboxTableViewCell *)self contentView];
  v12 = [(MPVoicemailMailboxTableViewCell *)self countLabel];
  [v11 addSubview:v12];

  [(MPVoicemailMailboxTableViewCell *)self _updateTextColor];
}

- (void)loadConstraints
{
  v35.receiver = self;
  v35.super_class = (Class)MPVoicemailMailboxTableViewCell;
  [(MPVoicemailMailboxTableViewCell *)&v35 loadConstraints];
  v34 = [(MPVoicemailMailboxTableViewCell *)self titleLabel];
  v32 = [v34 leadingAnchor];
  v33 = [(MPVoicemailMailboxTableViewCell *)self contentView];
  v31 = [v33 leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:34.0];
  v36[0] = v30;
  v29 = [(MPVoicemailMailboxTableViewCell *)self titleLabel];
  v27 = [v29 trailingAnchor];
  v28 = [(MPVoicemailMailboxTableViewCell *)self countLabel];
  v26 = [v28 leadingAnchor];
  v25 = [v27 constraintLessThanOrEqualToAnchor:v26];
  v36[1] = v25;
  v24 = [(MPVoicemailMailboxTableViewCell *)self titleLabel];
  v22 = [v24 centerYAnchor];
  v23 = [(MPVoicemailMailboxTableViewCell *)self contentView];
  v21 = [v23 centerYAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v36[2] = v20;
  v19 = [(MPVoicemailMailboxTableViewCell *)self titleLabel];
  v17 = [v19 firstBaselineAnchor];
  v18 = [(MPVoicemailMailboxTableViewCell *)self contentView];
  v16 = [v18 topAnchor];
  [(MPVoicemailMailboxTableViewCell *)self titleLabelFirstBaselineLayoutConstraintConstant];
  v15 = [v17 constraintEqualToAnchor:v16];
  v36[3] = v15;
  v14 = [(MPVoicemailMailboxTableViewCell *)self countLabel];
  objc_super v13 = [v14 trailingAnchor];
  id v3 = [(MPVoicemailMailboxTableViewCell *)self contentView];
  double v4 = [v3 trailingAnchor];
  double v5 = [v13 constraintEqualToAnchor:v4 constant:-16.0];
  v36[4] = v5;
  double v6 = [(MPVoicemailMailboxTableViewCell *)self countLabel];
  double v7 = [v6 centerYAnchor];
  id v8 = [(MPVoicemailMailboxTableViewCell *)self contentView];
  v9 = [v8 centerYAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v36[5] = v10;
  v11 = +[NSArray arrayWithObjects:v36 count:6];
  [(MPVoicemailMailboxTableViewCell *)self setAllConstraints:v11];

  v12 = [(MPVoicemailMailboxTableViewCell *)self allConstraints];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)unloadConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)MPVoicemailMailboxTableViewCell;
  [(MPVoicemailMailboxTableViewCell *)&v4 unloadConstraints];
  id v3 = [(MPVoicemailMailboxTableViewCell *)self allConstraints];
  +[NSLayoutConstraint deactivateConstraints:v3];
}

- (void)updateFonts
{
  v9.receiver = self;
  v9.super_class = (Class)MPVoicemailMailboxTableViewCell;
  [(MPVoicemailMailboxTableViewCell *)&v9 updateFonts];
  if ([(MPVoicemailMailboxTableViewCell *)self isAccessiblityConstraintsEnabled])uint64_t v3 = 2; {
  else
  }
    uint64_t v3 = 1;
  objc_super v4 = [(MPVoicemailMailboxTableViewCell *)self titleLabel];
  [v4 setNumberOfLines:v3];

  double v5 = +[UIFont telephonyUISubheadlineShortFont];
  double v6 = [(MPVoicemailMailboxTableViewCell *)self titleLabel];
  [v6 setFont:v5];

  double v7 = +[UIFont telephonyUISubheadlineShortFont];
  id v8 = [(MPVoicemailMailboxTableViewCell *)self countLabel];
  [v8 setFont:v7];
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)MPVoicemailMailboxTableViewCell;
  [(MPVoicemailMailboxTableViewCell *)&v3 updateConstraints];
  [(MPVoicemailMailboxTableViewCell *)self updateFonts];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MPVoicemailMailboxTableViewCell;
  [(MPVoicemailMailboxTableViewCell *)&v3 tintColorDidChange];
  [(MPVoicemailMailboxTableViewCell *)self _updateTextColor];
}

- (void)_updateTextColor
{
  id v5 = +[UIColor systemGrayColor];
  objc_super v3 = [(MPVoicemailMailboxTableViewCell *)self _accessibilityHigherContrastTintColorForColor:v5];
  objc_super v4 = [(MPVoicemailMailboxTableViewCell *)self countLabel];
  [v4 setTextColor:v3];
}

- (double)titleLabelFirstBaselineLayoutConstraintConstant
{
  v2 = +[UIFont telephonyUIBodyShortEmphasizedFont];
  [v2 _scaledValueForValue:27.0];
  double v4 = ceil(v3);

  return v4;
}

- (double)subtitleLabelLastBaselineLayoutConstraintConstant
{
  v2 = +[UIFont telephonyUISubheadlineShortFont];
  [v2 _scaledValueForValue:13.0];
  double v4 = ceil(v3);

  return v4;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
}

- (NSArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end