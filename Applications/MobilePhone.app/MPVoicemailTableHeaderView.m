@interface MPVoicemailTableHeaderView
- (MPVoicemailTableHeaderView)initWithCoder:(id)a3;
- (NSLayoutConstraint)messageLabelCenterXAnchorLayoutConstraint;
- (NSLayoutConstraint)messageLabelFirstBaselineLayoutConstraint;
- (NSLayoutConstraint)messageLabelLastBaselineLayoutConstraint;
- (NSLayoutConstraint)messageLabelLeadingLayoutConstraint;
- (NSLayoutConstraint)messageLabelTrailingLayoutConstraint;
- (NSLayoutConstraint)titleLabelCenterXAnchorLayoutConstraint;
- (NSLayoutConstraint)titleLabelFirstBaselineLayoutConstraint;
- (NSLayoutConstraint)titleLabelLastBaselineLayoutConstraint;
- (NSLayoutConstraint)titleLabelLeadingLayoutConstraint;
- (NSLayoutConstraint)titleLabelTrailingLayoutConstraint;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (double)messageLabelFirstBaselineLayoutConstraintConstant;
- (double)messageLabelLastBaselineLayoutConstraintConstant;
- (double)messageLabelLeadingLayoutConstraintConstant;
- (double)messageLabelTrailingLayoutConstraintConstant;
- (double)titleLabelFirstBaselineLayoutConstraintConstant;
- (double)titleLabelLeadingLayoutConstraintConstant;
- (double)titleLabelTrailingLayoutConstraintConstant;
- (void)commonInit;
- (void)loadConstraints;
- (void)loadView;
- (void)setMessageLabel:(id)a3;
- (void)setMessageLabelCenterXAnchorLayoutConstraint:(id)a3;
- (void)setMessageLabelFirstBaselineLayoutConstraint:(id)a3;
- (void)setMessageLabelLastBaselineLayoutConstraint:(id)a3;
- (void)setMessageLabelLeadingLayoutConstraint:(id)a3;
- (void)setMessageLabelTrailingLayoutConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelCenterXAnchorLayoutConstraint:(id)a3;
- (void)setTitleLabelFirstBaselineLayoutConstraint:(id)a3;
- (void)setTitleLabelLastBaselineLayoutConstraint:(id)a3;
- (void)setTitleLabelLeadingLayoutConstraint:(id)a3;
- (void)setTitleLabelTrailingLayoutConstraint:(id)a3;
- (void)updateConstraintsConstants;
- (void)updateFonts;
- (void)updateLabels;
@end

@implementation MPVoicemailTableHeaderView

- (MPVoicemailTableHeaderView)initWithCoder:(id)a3
{
  return 0;
}

- (void)commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)MPVoicemailTableHeaderView;
  [(MPVoicemailTableHeaderView *)&v3 commonInit];
  [(MPVoicemailTableHeaderView *)self loadView];
}

- (void)loadView
{
  objc_super v3 = +[UIColor systemMidGrayColor];
  v4 = [v3 colorWithAlphaComponent:0.600000024];
  [(MPVoicemailTableHeaderView *)self setBackgroundColor:v4];

  [(MPVoicemailTableHeaderView *)self setClipsToBounds:1];
  v5 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1148846080;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:0 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v8];
  LODWORD(v9) = 1144750080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:0 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:1 forAxis:v10];
  [(MPVoicemailTableHeaderView *)self addSubview:self->_titleLabel];
  v11 = (UILabel *)objc_alloc_init((Class)UILabel);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v11;

  [(UILabel *)self->_messageLabel setLineBreakMode:0];
  [(UILabel *)self->_messageLabel setNumberOfLines:0];
  [(UILabel *)self->_messageLabel setTextAlignment:1];
  [(UILabel *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v13) = 1148846080;
  [(UILabel *)self->_messageLabel setContentCompressionResistancePriority:0 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [(UILabel *)self->_messageLabel setContentCompressionResistancePriority:1 forAxis:v14];
  LODWORD(v15) = 1144750080;
  [(UILabel *)self->_messageLabel setContentHuggingPriority:0 forAxis:v15];
  LODWORD(v16) = 1148846080;
  [(UILabel *)self->_messageLabel setContentHuggingPriority:1 forAxis:v16];
  v17 = self->_messageLabel;

  [(MPVoicemailTableHeaderView *)self addSubview:v17];
}

- (void)loadConstraints
{
  objc_super v3 = [(MPVoicemailTableHeaderView *)self titleLabel];
  v4 = [v3 centerXAnchor];
  v5 = [(MPVoicemailTableHeaderView *)self centerXAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];

  double v7 = NSStringFromSelector("titleLabelCenterXAnchorLayoutConstraint");
  [v6 setIdentifier:v7];

  [v6 setActive:1];
  [(MPVoicemailTableHeaderView *)self setTitleLabelCenterXAnchorLayoutConstraint:v6];
  double v8 = [(MPVoicemailTableHeaderView *)self titleLabel];
  double v9 = [v8 leadingAnchor];
  double v10 = [(MPVoicemailTableHeaderView *)self leadingAnchor];
  [(MPVoicemailTableHeaderView *)self titleLabelLeadingLayoutConstraintConstant];
  v11 = [v9 constraintGreaterThanOrEqualToAnchor:v10];

  v12 = NSStringFromSelector("titleLabelLeadingLayoutConstraint");
  [v11 setIdentifier:v12];

  LODWORD(v13) = 1148829696;
  [v11 setPriority:v13];
  [v11 setActive:1];
  [(MPVoicemailTableHeaderView *)self setTitleLabelLeadingLayoutConstraint:v11];
  double v14 = [(MPVoicemailTableHeaderView *)self trailingAnchor];
  double v15 = [(MPVoicemailTableHeaderView *)self titleLabel];
  double v16 = [v15 trailingAnchor];
  [(MPVoicemailTableHeaderView *)self titleLabelTrailingLayoutConstraintConstant];
  v17 = [v14 constraintGreaterThanOrEqualToAnchor:v16];

  v18 = NSStringFromSelector("titleLabelTrailingLayoutConstraint");
  [v17 setIdentifier:v18];

  LODWORD(v19) = 1148829696;
  [v17 setPriority:v19];
  [v17 setActive:1];
  [(MPVoicemailTableHeaderView *)self setTitleLabelTrailingLayoutConstraint:v17];
  v20 = [(MPVoicemailTableHeaderView *)self titleLabel];
  v21 = [v20 firstBaselineAnchor];
  v22 = [(MPVoicemailTableHeaderView *)self topAnchor];
  [(MPVoicemailTableHeaderView *)self titleLabelFirstBaselineLayoutConstraintConstant];
  v23 = [v21 constraintEqualToAnchor:v22];

  v24 = NSStringFromSelector("titleLabelLeadingLayoutConstraint");
  [v23 setIdentifier:v24];

  [v23 setActive:1];
  [(MPVoicemailTableHeaderView *)self setTitleLabelFirstBaselineLayoutConstraint:v23];
  v25 = [(MPVoicemailTableHeaderView *)self messageLabelFirstBaselineLayoutConstraint];
  [(MPVoicemailTableHeaderView *)self setTitleLabelLastBaselineLayoutConstraint:v25];

  v26 = [(MPVoicemailTableHeaderView *)self messageLabel];
  v27 = [v26 centerXAnchor];
  v28 = [(MPVoicemailTableHeaderView *)self titleLabel];
  v29 = [v28 centerXAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];

  v31 = NSStringFromSelector("messageLabelCenterXAnchorLayoutConstraint");
  [v30 setIdentifier:v31];

  [v30 setActive:1];
  [(MPVoicemailTableHeaderView *)self setMessageLabelCenterXAnchorLayoutConstraint:v30];
  v32 = [(MPVoicemailTableHeaderView *)self messageLabel];
  v33 = [v32 leadingAnchor];
  v34 = [(MPVoicemailTableHeaderView *)self leadingAnchor];
  [(MPVoicemailTableHeaderView *)self messageLabelLeadingLayoutConstraintConstant];
  v35 = [v33 constraintGreaterThanOrEqualToAnchor:v34];

  v36 = NSStringFromSelector("messageLabelLeadingLayoutConstraint");
  [v35 setIdentifier:v36];

  LODWORD(v37) = 1148829696;
  [v35 setPriority:v37];
  [v35 setActive:1];
  [(MPVoicemailTableHeaderView *)self setMessageLabelLeadingLayoutConstraint:v35];
  v38 = [(MPVoicemailTableHeaderView *)self trailingAnchor];
  v39 = [(MPVoicemailTableHeaderView *)self messageLabel];
  v40 = [v39 trailingAnchor];
  [(MPVoicemailTableHeaderView *)self messageLabelTrailingLayoutConstraintConstant];
  v41 = [v38 constraintGreaterThanOrEqualToAnchor:v40];

  v42 = NSStringFromSelector("messageLabelTrailingLayoutConstraint");
  [v41 setIdentifier:v42];

  LODWORD(v43) = 1148829696;
  [v41 setPriority:v43];
  [v41 setActive:1];
  [(MPVoicemailTableHeaderView *)self setMessageLabelTrailingLayoutConstraint:v41];
  v44 = [(MPVoicemailTableHeaderView *)self messageLabel];
  v45 = [v44 firstBaselineAnchor];
  v46 = [(MPVoicemailTableHeaderView *)self titleLabel];
  v47 = [v46 lastBaselineAnchor];
  [(MPVoicemailTableHeaderView *)self messageLabelFirstBaselineLayoutConstraintConstant];
  v48 = [v45 constraintEqualToAnchor:v47];

  v49 = NSStringFromSelector("messageLabelFirstBaselineLayoutConstraint");
  [v48 setIdentifier:v49];

  [v48 setActive:1];
  [(MPVoicemailTableHeaderView *)self setMessageLabelFirstBaselineLayoutConstraint:v48];
  v50 = [(MPVoicemailTableHeaderView *)self bottomAnchor];
  v51 = [(MPVoicemailTableHeaderView *)self messageLabel];
  v52 = [v51 lastBaselineAnchor];
  [(MPVoicemailTableHeaderView *)self messageLabelLastBaselineLayoutConstraintConstant];
  v53 = [v50 constraintEqualToAnchor:v52];

  v54 = NSStringFromSelector("messageLabelLastBaselineLayoutConstraint");
  [v53 setIdentifier:v54];

  [v53 setActive:1];
  [(MPVoicemailTableHeaderView *)self setMessageLabelLastBaselineLayoutConstraint:v53];
  [(MPVoicemailTableHeaderView *)self updateLabels];
  v55.receiver = self;
  v55.super_class = (Class)MPVoicemailTableHeaderView;
  [(MPVoicemailTableHeaderView *)&v55 loadConstraints];
}

- (void)updateConstraintsConstants
{
  v27.receiver = self;
  v27.super_class = (Class)MPVoicemailTableHeaderView;
  [(MPVoicemailTableHeaderView *)&v27 updateConstraintsConstants];
  [(MPVoicemailTableHeaderView *)self messageLabelFirstBaselineLayoutConstraintConstant];
  double v4 = v3;
  v5 = [(MPVoicemailTableHeaderView *)self messageLabelFirstBaselineLayoutConstraint];
  [v5 setConstant:v4];

  [(MPVoicemailTableHeaderView *)self messageLabelLastBaselineLayoutConstraintConstant];
  double v7 = v6;
  double v8 = [(MPVoicemailTableHeaderView *)self messageLabelLastBaselineLayoutConstraint];
  [v8 setConstant:v7];

  [(MPVoicemailTableHeaderView *)self messageLabelLeadingLayoutConstraintConstant];
  double v10 = v9;
  v11 = [(MPVoicemailTableHeaderView *)self messageLabelLeadingLayoutConstraint];
  [v11 setConstant:v10];

  [(MPVoicemailTableHeaderView *)self messageLabelTrailingLayoutConstraintConstant];
  double v13 = v12;
  double v14 = [(MPVoicemailTableHeaderView *)self messageLabelTrailingLayoutConstraint];
  [v14 setConstant:v13];

  [(MPVoicemailTableHeaderView *)self titleLabelFirstBaselineLayoutConstraintConstant];
  double v16 = v15;
  v17 = [(MPVoicemailTableHeaderView *)self titleLabelFirstBaselineLayoutConstraint];
  [v17 setConstant:v16];

  [(MPVoicemailTableHeaderView *)self titleLabelLastBaselineLayoutConstraintConstant];
  double v19 = v18;
  v20 = [(MPVoicemailTableHeaderView *)self titleLabelLastBaselineLayoutConstraint];
  [v20 setConstant:v19];

  [(MPVoicemailTableHeaderView *)self titleLabelLeadingLayoutConstraintConstant];
  double v22 = v21;
  v23 = [(MPVoicemailTableHeaderView *)self titleLabelLeadingLayoutConstraint];
  [v23 setConstant:v22];

  [(MPVoicemailTableHeaderView *)self titleLabelTrailingLayoutConstraintConstant];
  double v25 = v24;
  v26 = [(MPVoicemailTableHeaderView *)self titleLabelTrailingLayoutConstraint];
  [v26 setConstant:v25];

  [(MPVoicemailTableHeaderView *)self updateLabels];
}

- (void)updateFonts
{
  v5.receiver = self;
  v5.super_class = (Class)MPVoicemailTableHeaderView;
  [(MPVoicemailTableHeaderView *)&v5 updateFonts];
  double v3 = +[UIFont telephonyUIBodyShortEmphasizedFont];
  [(UILabel *)self->_titleLabel setFont:v3];

  double v4 = +[UIFont telephonyUISubheadlineShortFont];
  [(UILabel *)self->_messageLabel setFont:v4];
}

- (void)updateLabels
{
  [(MPVoicemailTableHeaderView *)self bounds];
  double Width = CGRectGetWidth(v16);
  [(MPVoicemailTableHeaderView *)self messageLabelLeadingLayoutConstraintConstant];
  double v5 = Width - v4;
  [(MPVoicemailTableHeaderView *)self messageLabelTrailingLayoutConstraintConstant];
  double v7 = v5 - v6;
  double v8 = [(MPVoicemailTableHeaderView *)self messageLabel];
  [v8 setPreferredMaxLayoutWidth:v7];

  [(MPVoicemailTableHeaderView *)self bounds];
  double v9 = CGRectGetWidth(v17);
  [(MPVoicemailTableHeaderView *)self titleLabelLeadingLayoutConstraintConstant];
  double v11 = v9 - v10;
  [(MPVoicemailTableHeaderView *)self titleLabelTrailingLayoutConstraintConstant];
  double v13 = v11 - v12;
  id v14 = [(MPVoicemailTableHeaderView *)self titleLabel];
  [v14 setPreferredMaxLayoutWidth:v13];
}

- (double)messageLabelFirstBaselineLayoutConstraintConstant
{
  v2 = +[UIFont telephonyUISubheadlineShortFont];
  double v3 = [v2 fontDescriptor];
  double v4 = [v3 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v4)
  {
    double v5 = +[UIFontMetrics metricsForTextStyle:v4];
    [v5 scaledValueForValue:20.0];
    double v7 = ceil(v6);
  }
  else
  {
    double v7 = 20.0;
  }

  return v7;
}

- (double)messageLabelLastBaselineLayoutConstraintConstant
{
  v2 = +[UIFont telephonyUIBodyShortFont];
  double v3 = [v2 fontDescriptor];
  double v4 = [v3 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v4)
  {
    double v5 = +[UIFontMetrics metricsForTextStyle:v4];
    [v5 scaledValueForValue:13.0];
    double v7 = ceil(v6);
  }
  else
  {
    double v7 = 13.0;
  }

  return v7;
}

- (double)messageLabelLeadingLayoutConstraintConstant
{
  return 16.0;
}

- (double)messageLabelTrailingLayoutConstraintConstant
{
  return 16.0;
}

- (double)titleLabelFirstBaselineLayoutConstraintConstant
{
  v2 = +[UIFont telephonyUIBodyShortEmphasizedFont];
  double v3 = [v2 fontDescriptor];
  double v4 = [v3 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v4)
  {
    double v5 = +[UIFontMetrics metricsForTextStyle:v4];
    [v5 scaledValueForValue:27.0];
    double v7 = ceil(v6);
  }
  else
  {
    double v7 = 27.0;
  }

  return v7;
}

- (double)titleLabelLeadingLayoutConstraintConstant
{
  return 16.0;
}

- (double)titleLabelTrailingLayoutConstraintConstant
{
  return 16.0;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (NSLayoutConstraint)titleLabelCenterXAnchorLayoutConstraint
{
  return self->_titleLabelCenterXAnchorLayoutConstraint;
}

- (void)setTitleLabelCenterXAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelFirstBaselineLayoutConstraint
{
  return self->_titleLabelFirstBaselineLayoutConstraint;
}

- (void)setTitleLabelFirstBaselineLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelLastBaselineLayoutConstraint
{
  return self->_titleLabelLastBaselineLayoutConstraint;
}

- (void)setTitleLabelLastBaselineLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelLeadingLayoutConstraint
{
  return self->_titleLabelLeadingLayoutConstraint;
}

- (void)setTitleLabelLeadingLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTrailingLayoutConstraint
{
  return self->_titleLabelTrailingLayoutConstraint;
}

- (void)setTitleLabelTrailingLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)messageLabelCenterXAnchorLayoutConstraint
{
  return self->_messageLabelCenterXAnchorLayoutConstraint;
}

- (void)setMessageLabelCenterXAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)messageLabelFirstBaselineLayoutConstraint
{
  return self->_messageLabelFirstBaselineLayoutConstraint;
}

- (void)setMessageLabelFirstBaselineLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)messageLabelLastBaselineLayoutConstraint
{
  return self->_messageLabelLastBaselineLayoutConstraint;
}

- (void)setMessageLabelLastBaselineLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)messageLabelLeadingLayoutConstraint
{
  return self->_messageLabelLeadingLayoutConstraint;
}

- (void)setMessageLabelLeadingLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)messageLabelTrailingLayoutConstraint
{
  return self->_messageLabelTrailingLayoutConstraint;
}

- (void)setMessageLabelTrailingLayoutConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabelTrailingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_messageLabelLeadingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_messageLabelLastBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_messageLabelFirstBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_messageLabelCenterXAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLastBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelCenterXAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end