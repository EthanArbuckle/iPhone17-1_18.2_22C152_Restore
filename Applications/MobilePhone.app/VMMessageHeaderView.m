@interface VMMessageHeaderView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)subviewsLayoutConstraintsLoaded;
- (BOOL)subviewsLoaded;
- (NSLayoutConstraint)dateLabelFirstBaselineAnchorLayoutConstraint;
- (NSLayoutConstraint)headlineLabelFirstBaselineAnchorLayoutConstraint;
- (NSLayoutConstraint)subheadlineLabelFirstBaselineAnchorLayoutConstraint;
- (NSString)localizedDate;
- (NSString)localizedHeadline;
- (NSString)localizedSubheadline;
- (UILabel)dateLabel;
- (UILabel)headlineLabel;
- (UILabel)subheadlineLabel;
- (VMMessageHeaderView)init;
- (VMMessageHeaderView)initWithCoder:(id)a3;
- (VMMessageHeaderView)initWithFrame:(CGRect)a3;
- (double)dateLabelFirstBaselineAnchorLayoutConstraintConstant;
- (double)headlineLabelFirstBaselineAnchorLayoutConstraintConstant;
- (double)subheadlineLabelFirstBaselineAnchorLayoutConstraintConstant;
- (void)commonInit;
- (void)loadSubviews;
- (void)loadSubviewsLayoutConstraints;
- (void)setDateLabel:(id)a3;
- (void)setDateLabelFirstBaselineAnchorLayoutConstraint:(id)a3;
- (void)setHeadlineLabel:(id)a3;
- (void)setHeadlineLabelFirstBaselineAnchorLayoutConstraint:(id)a3;
- (void)setLocalizedDate:(id)a3;
- (void)setLocalizedHeadline:(id)a3;
- (void)setLocalizedSubheadline:(id)a3;
- (void)setSubheadlineLabel:(id)a3;
- (void)setSubheadlineLabelFirstBaselineAnchorLayoutConstraint:(id)a3;
- (void)setSubviewsLayoutConstraintsLoaded:(BOOL)a3;
- (void)setSubviewsLoaded:(BOOL)a3;
- (void)updateConstraints;
- (void)updateConstraintsConstants;
@end

@implementation VMMessageHeaderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (VMMessageHeaderView)init
{
  return -[VMMessageHeaderView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (VMMessageHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VMMessageHeaderView;
  v3 = -[VMMessageHeaderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VMMessageHeaderView *)v3 commonInit];
  }
  return v4;
}

- (VMMessageHeaderView)initWithCoder:(id)a3
{
  return 0;
}

- (NSString)localizedDate
{
  v2 = [(VMMessageHeaderView *)self dateLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setLocalizedDate:(id)a3
{
  id v7 = a3;
  v4 = [(VMMessageHeaderView *)self dateLabel];
  id v5 = [v4 text];

  if (v5 != v7)
  {
    objc_super v6 = [(VMMessageHeaderView *)self dateLabel];
    [v6 setText:v7];
  }
}

- (NSString)localizedHeadline
{
  v2 = [(VMMessageHeaderView *)self headlineLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setLocalizedHeadline:(id)a3
{
  id v7 = a3;
  v4 = [(VMMessageHeaderView *)self headlineLabel];
  id v5 = [v4 text];

  if (v5 != v7)
  {
    objc_super v6 = [(VMMessageHeaderView *)self headlineLabel];
    [v6 setText:v7];
  }
}

- (NSString)localizedSubheadline
{
  v2 = [(VMMessageHeaderView *)self subheadlineLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setLocalizedSubheadline:(id)a3
{
  id v7 = a3;
  v4 = [(VMMessageHeaderView *)self subheadlineLabel];
  id v5 = [v4 text];

  if (v5 != v7)
  {
    objc_super v6 = [(VMMessageHeaderView *)self subheadlineLabel];
    [v6 setText:v7];
  }
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)VMMessageHeaderView;
  [(VMMessageHeaderView *)&v3 updateConstraints];
  if ([(VMMessageHeaderView *)self subviewsLayoutConstraintsLoaded]) {
    [(VMMessageHeaderView *)self updateConstraintsConstants];
  }
  else {
    [(VMMessageHeaderView *)self loadSubviewsLayoutConstraints];
  }
}

- (void)updateConstraintsConstants
{
  [(VMMessageHeaderView *)self dateLabelFirstBaselineAnchorLayoutConstraintConstant];
  double v4 = v3;
  id v5 = [(VMMessageHeaderView *)self dateLabelFirstBaselineAnchorLayoutConstraint];
  [v5 setConstant:v4];

  [(VMMessageHeaderView *)self headlineLabelFirstBaselineAnchorLayoutConstraintConstant];
  double v7 = v6;
  v8 = [(VMMessageHeaderView *)self headlineLabelFirstBaselineAnchorLayoutConstraint];
  [v8 setConstant:v7];

  [(VMMessageHeaderView *)self subheadlineLabelFirstBaselineAnchorLayoutConstraintConstant];
  double v10 = v9;
  id v11 = [(VMMessageHeaderView *)self subheadlineLabelFirstBaselineAnchorLayoutConstraint];
  [v11 setConstant:v10];
}

- (void)commonInit
{
  self->_subviewsLayoutConstraintsLoaded = 0;
  self->_subviewsLoaded = 0;
  [(VMMessageHeaderView *)self loadSubviews];
}

- (void)loadSubviews
{
  if (!self->_subviewsLoaded)
  {
    id v3 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    double v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
    headlineLabel = self->_headlineLabel;
    self->_headlineLabel = v7;

    [(UILabel *)self->_headlineLabel setAdjustsFontSizeToFitWidth:0];
    double v9 = +[UIFont voicemailHeadlineShortFont];
    [(UILabel *)self->_headlineLabel setFont:v9];

    [(UILabel *)self->_headlineLabel setLineBreakMode:4];
    [(UILabel *)self->_headlineLabel setTextAlignment:4];
    double v10 = +[UIColor dynamicLabelColor];
    [(UILabel *)self->_headlineLabel setTextColor:v10];

    [(UILabel *)self->_headlineLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v11) = 1148846080;
    [(UILabel *)self->_headlineLabel setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(UILabel *)self->_headlineLabel setContentCompressionResistancePriority:1 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(UILabel *)self->_headlineLabel setContentHuggingPriority:0 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(UILabel *)self->_headlineLabel setContentHuggingPriority:1 forAxis:v14];
    v15 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    subheadlineLabel = self->_subheadlineLabel;
    self->_subheadlineLabel = v15;

    [(UILabel *)self->_subheadlineLabel setAdjustsFontSizeToFitWidth:0];
    v17 = +[UIFont telephonyUIBodyShortFont];
    [(UILabel *)self->_subheadlineLabel setFont:v17];

    [(UILabel *)self->_subheadlineLabel setLineBreakMode:4];
    [(UILabel *)self->_subheadlineLabel setTextAlignment:4];
    v18 = +[UIColor dynamicLabelColor];
    [(UILabel *)self->_subheadlineLabel setTextColor:v18];

    [(UILabel *)self->_subheadlineLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v19) = 1148846080;
    [(UILabel *)self->_subheadlineLabel setContentCompressionResistancePriority:0 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(UILabel *)self->_subheadlineLabel setContentCompressionResistancePriority:1 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(UILabel *)self->_subheadlineLabel setContentHuggingPriority:0 forAxis:v21];
    LODWORD(v22) = 1148846080;
    [(UILabel *)self->_subheadlineLabel setContentHuggingPriority:1 forAxis:v22];
    v23 = [objc_alloc((Class)UILabel) initWithFrame:CGRectMake(0, 0, width, height)];
    dateLabel = self->_dateLabel;
    self->_dateLabel = v23;

    [(UILabel *)self->_dateLabel setAdjustsFontSizeToFitWidth:0];
    v25 = +[UIFont telephonyUIBodyShortFont];
    [(UILabel *)self->_dateLabel setFont:v25];

    [(UILabel *)self->_dateLabel setLineBreakMode:4];
    [(UILabel *)self->_dateLabel setTextAlignment:4];
    v26 = +[UIColor dynamicLabelColor];
    [(UILabel *)self->_dateLabel setTextColor:v26];

    [(UILabel *)self->_dateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v27) = 1148846080;
    [(UILabel *)self->_dateLabel setContentCompressionResistancePriority:0 forAxis:v27];
    LODWORD(v28) = 1148846080;
    [(UILabel *)self->_dateLabel setContentCompressionResistancePriority:1 forAxis:v28];
    LODWORD(v29) = 1148846080;
    [(UILabel *)self->_dateLabel setContentHuggingPriority:0 forAxis:v29];
    LODWORD(v30) = 1148846080;
    [(UILabel *)self->_dateLabel setContentHuggingPriority:1 forAxis:v30];
    [(VMMessageHeaderView *)self addSubview:self->_headlineLabel];
    [(VMMessageHeaderView *)self addSubview:self->_subheadlineLabel];
    [(VMMessageHeaderView *)self addSubview:self->_dateLabel];
    self->_subviewsLoaded = 1;
  }
}

- (void)loadSubviewsLayoutConstraints
{
  if (!self->_subviewsLayoutConstraintsLoaded)
  {
    id v3 = [(UILabel *)self->_headlineLabel leadingAnchor];
    double v4 = [(VMMessageHeaderView *)self leadingAnchor];
    id v5 = [v3 constraintEqualToAnchor:v4];
    [v5 setActive:1];

    double v6 = [(UILabel *)self->_headlineLabel trailingAnchor];
    double v7 = [(VMMessageHeaderView *)self trailingAnchor];
    v8 = [v6 constraintLessThanOrEqualToAnchor:v7];
    [v8 setActive:1];

    double v9 = [(UILabel *)self->_headlineLabel firstBaselineAnchor];
    double v10 = [(VMMessageHeaderView *)self topAnchor];
    [(VMMessageHeaderView *)self headlineLabelFirstBaselineAnchorLayoutConstraintConstant];
    [v9 constraintEqualToAnchor:v10];
    double v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    headlineLabelFirstBaselineAnchorLayoutConstraint = self->_headlineLabelFirstBaselineAnchorLayoutConstraint;
    self->_headlineLabelFirstBaselineAnchorLayoutConstraint = v11;

    [(NSLayoutConstraint *)self->_headlineLabelFirstBaselineAnchorLayoutConstraint setActive:1];
    double v13 = [(UILabel *)self->_subheadlineLabel leadingAnchor];
    double v14 = [(VMMessageHeaderView *)self leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    v16 = [(UILabel *)self->_subheadlineLabel trailingAnchor];
    v17 = [(VMMessageHeaderView *)self trailingAnchor];
    v18 = [v16 constraintLessThanOrEqualToAnchor:v17];
    [v18 setActive:1];

    double v19 = [(UILabel *)self->_subheadlineLabel firstBaselineAnchor];
    double v20 = [(UILabel *)self->_headlineLabel firstBaselineAnchor];
    [(VMMessageHeaderView *)self subheadlineLabelFirstBaselineAnchorLayoutConstraintConstant];
    [v19 constraintEqualToAnchor:v20];
    double v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    subheadlineLabelFirstBaselineAnchorLayoutConstraint = self->_subheadlineLabelFirstBaselineAnchorLayoutConstraint;
    self->_subheadlineLabelFirstBaselineAnchorLayoutConstraint = v21;

    [(NSLayoutConstraint *)self->_subheadlineLabelFirstBaselineAnchorLayoutConstraint setActive:1];
    v23 = [(UILabel *)self->_dateLabel leadingAnchor];
    v24 = [(VMMessageHeaderView *)self leadingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    [v25 setActive:1];

    v26 = [(UILabel *)self->_dateLabel trailingAnchor];
    double v27 = [(VMMessageHeaderView *)self trailingAnchor];
    double v28 = [v26 constraintLessThanOrEqualToAnchor:v27];
    [v28 setActive:1];

    double v29 = [(UILabel *)self->_dateLabel firstBaselineAnchor];
    double v30 = [(UILabel *)self->_subheadlineLabel firstBaselineAnchor];
    [(VMMessageHeaderView *)self dateLabelFirstBaselineAnchorLayoutConstraintConstant];
    [v29 constraintEqualToAnchor:v30];
    v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    dateLabelFirstBaselineAnchorLayoutConstraint = self->_dateLabelFirstBaselineAnchorLayoutConstraint;
    self->_dateLabelFirstBaselineAnchorLayoutConstraint = v31;

    [(NSLayoutConstraint *)self->_dateLabelFirstBaselineAnchorLayoutConstraint setActive:1];
    v33 = [(VMMessageHeaderView *)self bottomAnchor];
    v34 = [(UILabel *)self->_dateLabel bottomAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    self->_subviewsLayoutConstraintsLoaded = 1;
  }
}

- (double)dateLabelFirstBaselineAnchorLayoutConstraintConstant
{
  v2 = +[UIFont telephonyUIBodyShortFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = ceil(v3);

  return v4;
}

- (double)headlineLabelFirstBaselineAnchorLayoutConstraintConstant
{
  v2 = +[UIFont voicemailHeadlineShortFont];
  [v2 _scaledValueForValue:28.0];
  double v4 = ceil(v3);

  return v4;
}

- (double)subheadlineLabelFirstBaselineAnchorLayoutConstraintConstant
{
  v2 = +[UIFont telephonyUIBodyShortFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = ceil(v3);

  return v4;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (UILabel)headlineLabel
{
  return self->_headlineLabel;
}

- (void)setHeadlineLabel:(id)a3
{
}

- (UILabel)subheadlineLabel
{
  return self->_subheadlineLabel;
}

- (void)setSubheadlineLabel:(id)a3
{
}

- (NSLayoutConstraint)dateLabelFirstBaselineAnchorLayoutConstraint
{
  return self->_dateLabelFirstBaselineAnchorLayoutConstraint;
}

- (void)setDateLabelFirstBaselineAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)headlineLabelFirstBaselineAnchorLayoutConstraint
{
  return self->_headlineLabelFirstBaselineAnchorLayoutConstraint;
}

- (void)setHeadlineLabelFirstBaselineAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)subheadlineLabelFirstBaselineAnchorLayoutConstraint
{
  return self->_subheadlineLabelFirstBaselineAnchorLayoutConstraint;
}

- (void)setSubheadlineLabelFirstBaselineAnchorLayoutConstraint:(id)a3
{
}

- (BOOL)subviewsLoaded
{
  return self->_subviewsLoaded;
}

- (void)setSubviewsLoaded:(BOOL)a3
{
  self->_subviewsLoaded = a3;
}

- (BOOL)subviewsLayoutConstraintsLoaded
{
  return self->_subviewsLayoutConstraintsLoaded;
}

- (void)setSubviewsLayoutConstraintsLoaded:(BOOL)a3
{
  self->_subviewsLayoutConstraintsLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subheadlineLabelFirstBaselineAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_headlineLabelFirstBaselineAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_dateLabelFirstBaselineAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_subheadlineLabel, 0);
  objc_storeStrong((id *)&self->_headlineLabel, 0);

  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end