@interface VMMessageMetadataView
+ (id)constraintsKeyForAccessibleLayout:(BOOL)a3 expanded:(BOOL)a4 editing:(BOOL)a5;
- (BOOL)isEditing;
- (BOOL)isExpanded;
- (BOOL)layoutIsAccessible;
- (MPVoicemailMessageViewModel)currentViewModel;
- (NSArray)currentActiveFixedConstraints;
- (NSArray)currentRequiredConstraints;
- (NSDictionary)constraintsForLayouts;
- (NSLayoutConstraint)badgeViewTrailingToSubtitleLeadingConstrant;
- (NSLayoutConstraint)subtitleLeadingToLayoutMarginConstrant;
- (NSString)currentRequiredConstraintsKey;
- (TPBadgeView)badgeView;
- (UIButton)actionButton;
- (UIButton)infoButton;
- (UIDateLabel)shortDateLabel;
- (UILabel)fullDateLabel;
- (UILabel)shortDurationLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UILayoutGuide)buttonLayoutGuide;
- (VMMessageMetadataView)initWithAccessibleLayout:(BOOL)a3;
- (VMMessageMetadataViewDelegate)delegate;
- (id)createConstraintsForAccessibleExpandedLayout;
- (id)createConstraintsForAccessibleNonExpandedLayoutForEditing:(BOOL)a3;
- (id)createConstraintsForNonAccessibleExpandedLayout;
- (id)createConstraintsForNonAccessibleNonExpandedLayoutForEditing:(BOOL)a3;
- (id)createFixedConstraintsForAccessibleLayout;
- (id)createFixedConstraintsForNonAccessibleLayout;
- (void)configureWithViewModel:(id)a3;
- (void)createConstraints;
- (void)didTapAction:(id)a3;
- (void)didTapInfo:(id)a3;
- (void)removeConstraints:(id)a3;
- (void)setBadgeViewTrailingToSubtitleLeadingConstrant:(id)a3;
- (void)setButtonLayoutGuide:(id)a3;
- (void)setConstraintsForLayouts:(id)a3;
- (void)setCurrentActiveFixedConstraints:(id)a3;
- (void)setCurrentRequiredConstraints:(id)a3;
- (void)setCurrentRequiredConstraintsKey:(id)a3;
- (void)setCurrentViewModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setLayoutIsAccessible:(BOOL)a3;
- (void)setPriorityOfConstraints:(id)a3 to:(float)a4;
- (void)setSubtitleLeadingToLayoutMarginConstrant:(id)a3;
- (void)tintColorDidChange;
- (void)updateLabelColors;
- (void)updateSubviewConfiguration;
@end

@implementation VMMessageMetadataView

- (VMMessageMetadataView)initWithAccessibleLayout:(BOOL)a3
{
  v77.receiver = self;
  v77.super_class = (Class)VMMessageMetadataView;
  v4 = [(VMMessageMetadataView *)&v77 init];
  v5 = v4;
  if (v4)
  {
    v4->_layoutIsAccessible = a3;
    -[VMMessageMetadataView setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", 12.0, 0.0, 12.0, 0.0);
    uint64_t v6 = +[TPActionButton button];
    infoButton = v5->_infoButton;
    v5->_infoButton = (UIButton *)v6;

    [(UIButton *)v5->_infoButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v5->_infoButton setAccessibilityIdentifier:@"VMMessageMetadataView_Info"];
    v8 = v5->_infoButton;
    v9 = +[UIImage telephonyUIInfoButtonGlyphImage];
    [(UIButton *)v8 setImage:v9 forStates:0];

    [(UIButton *)v5->_infoButton addTarget:v5 action:"didTapInfo:" forEvents:64];
    LODWORD(v10) = 1148846080;
    [(UIButton *)v5->_infoButton setContentCompressionResistancePriority:0 forAxis:v10];
    LODWORD(v11) = 1148846080;
    [(UIButton *)v5->_infoButton setContentHuggingPriority:0 forAxis:v11];
    [(VMMessageMetadataView *)v5 addSubview:v5->_infoButton];
    uint64_t v12 = +[TPActionButton button];
    actionButton = v5->_actionButton;
    v5->_actionButton = (UIButton *)v12;

    [(UIButton *)v5->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v5->_actionButton setAccessibilityIdentifier:@"VMMessageMetadataView_Action"];
    [(UIButton *)v5->_actionButton addTarget:v5 action:"didTapAction:" forEvents:64];
    LODWORD(v14) = 1148846080;
    [(UIButton *)v5->_actionButton setContentCompressionResistancePriority:0 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [(UIButton *)v5->_actionButton setContentHuggingPriority:0 forAxis:v15];
    [(VMMessageMetadataView *)v5 addSubview:v5->_actionButton];
    v16 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v16;

    [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = +[UIFont telephonyUIBodyShortEmphasizedFont];
    [(UILabel *)v5->_titleLabel setFont:v18];

    v19 = +[UIColor dynamicLabelColor];
    [(UILabel *)v5->_titleLabel setTextColor:v19];

    [(UILabel *)v5->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(VMMessageMetadataView *)v5 addSubview:v5->_titleLabel];
    v20 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v20;

    [(UILabel *)v5->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = +[UIFont telephonyUISubheadlineShortFont];
    [(UILabel *)v5->_subtitleLabel setFont:v22];

    v23 = +[UIColor dynamicSecondaryLabelColor];
    v24 = [(VMMessageMetadataView *)v5 _accessibilityHigherContrastTintColorForColor:v23];
    [(UILabel *)v5->_subtitleLabel setTextColor:v24];

    [(UILabel *)v5->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(VMMessageMetadataView *)v5 addSubview:v5->_subtitleLabel];
    v25 = (UIDateLabel *)objc_alloc_init((Class)UIDateLabel);
    shortDateLabel = v5->_shortDateLabel;
    v5->_shortDateLabel = v25;

    [(UIDateLabel *)v5->_shortDateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = +[UIFont telephonyUISubheadlineShortFont];
    [(UIDateLabel *)v5->_shortDateLabel setFont:v27];

    v28 = +[UIColor dynamicLabelColor];
    [(UIDateLabel *)v5->_shortDateLabel setTextColor:v28];

    [(UIDateLabel *)v5->_shortDateLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v29) = 1144750080;
    [(UIDateLabel *)v5->_shortDateLabel setContentHuggingPriority:0 forAxis:v29];
    LODWORD(v30) = 1144750080;
    [(UIDateLabel *)v5->_shortDateLabel setContentHuggingPriority:1 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(UIDateLabel *)v5->_shortDateLabel setContentCompressionResistancePriority:0 forAxis:v31];
    [(VMMessageMetadataView *)v5 addSubview:v5->_shortDateLabel];
    v32 = (UILabel *)objc_alloc_init((Class)UILabel);
    shortDurationLabel = v5->_shortDurationLabel;
    v5->_shortDurationLabel = v32;

    [(UILabel *)v5->_shortDurationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = +[UIFont telephonyUISubheadlineShortFont];
    [(UILabel *)v5->_shortDurationLabel setFont:v34];

    v35 = +[UIColor dynamicSecondaryLabelColor];
    [(UILabel *)v5->_shortDurationLabel setTextColor:v35];

    [(UILabel *)v5->_shortDurationLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v36) = 1144750080;
    [(UILabel *)v5->_shortDurationLabel setContentHuggingPriority:0 forAxis:v36];
    LODWORD(v37) = 1144750080;
    [(UILabel *)v5->_shortDurationLabel setContentHuggingPriority:1 forAxis:v37];
    [(VMMessageMetadataView *)v5 addSubview:v5->_shortDurationLabel];
    v38 = (UILabel *)objc_alloc_init((Class)UILabel);
    fullDateLabel = v5->_fullDateLabel;
    v5->_fullDateLabel = v38;

    [(UILabel *)v5->_fullDateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = +[UIFont telephonyUISubheadlineShortFont];
    [(UILabel *)v5->_fullDateLabel setFont:v40];

    v41 = +[UIColor dynamicSecondaryLabelColor];
    [(UILabel *)v5->_fullDateLabel setTextColor:v41];

    [(UILabel *)v5->_fullDateLabel setAdjustsFontForContentSizeCategory:1];
    [(VMMessageMetadataView *)v5 addSubview:v5->_fullDateLabel];
    v42 = (TPBadgeView *)[objc_alloc((Class)TPBadgeView) initWithTitle:&stru_10008F308];
    badgeView = v5->_badgeView;
    v5->_badgeView = v42;

    [(TPBadgeView *)v5->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TPBadgeView *)v5->_badgeView setHidden:1];
    LODWORD(v44) = 1148846080;
    [(TPBadgeView *)v5->_badgeView setContentCompressionResistancePriority:0 forAxis:v44];
    LODWORD(v45) = 1148846080;
    [(TPBadgeView *)v5->_badgeView setContentHuggingPriority:0 forAxis:v45];
    LODWORD(v46) = 1148846080;
    [(TPBadgeView *)v5->_badgeView setContentCompressionResistancePriority:1 forAxis:v46];
    LODWORD(v47) = 1148846080;
    [(TPBadgeView *)v5->_badgeView setContentHuggingPriority:1 forAxis:v47];
    [(VMMessageMetadataView *)v5 addSubview:v5->_badgeView];
    v48 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    buttonLayoutGuide = v5->_buttonLayoutGuide;
    v5->_buttonLayoutGuide = v48;

    [(VMMessageMetadataView *)v5 addLayoutGuide:v5->_buttonLayoutGuide];
    v76 = [(UILayoutGuide *)v5->_buttonLayoutGuide topAnchor];
    v75 = [(UIDateLabel *)v5->_shortDateLabel bottomAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v78[0] = v74;
    v73 = [(UILayoutGuide *)v5->_buttonLayoutGuide bottomAnchor];
    v72 = [(UILabel *)v5->_shortDurationLabel topAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v78[1] = v71;
    v50 = [(TPBadgeView *)v5->_badgeView leadingAnchor];
    v51 = [(VMMessageMetadataView *)v5 layoutMarginsGuide];
    v52 = [v51 leadingAnchor];
    v53 = [v50 constraintEqualToAnchor:v52];
    v78[2] = v53;
    v54 = [(TPBadgeView *)v5->_badgeView centerYAnchor];
    v55 = [(UILabel *)v5->_subtitleLabel centerYAnchor];
    v56 = [v54 constraintEqualToAnchor:v55];
    v78[3] = v56;
    v57 = +[NSArray arrayWithObjects:v78 count:4];
    +[NSLayoutConstraint activateConstraints:v57];

    v58 = [(UILabel *)v5->_subtitleLabel leadingAnchor];
    v59 = [(VMMessageMetadataView *)v5 layoutMarginsGuide];
    v60 = [v59 leadingAnchor];
    uint64_t v61 = [v58 constraintEqualToAnchor:v60];
    subtitleLeadingToLayoutMarginConstrant = v5->_subtitleLeadingToLayoutMarginConstrant;
    v5->_subtitleLeadingToLayoutMarginConstrant = (NSLayoutConstraint *)v61;

    v63 = [(TPBadgeView *)v5->_badgeView trailingAnchor];
    v64 = [(UILabel *)v5->_subtitleLabel leadingAnchor];
    uint64_t v65 = [v63 constraintEqualToAnchor:v64 constant:-8.0];
    badgeViewTrailingToSubtitleLeadingConstrant = v5->_badgeViewTrailingToSubtitleLeadingConstrant;
    v5->_badgeViewTrailingToSubtitleLeadingConstrant = (NSLayoutConstraint *)v65;

    currentActiveFixedConstraints = v5->_currentActiveFixedConstraints;
    v5->_currentActiveFixedConstraints = (NSArray *)&__NSArray0__struct;

    currentRequiredConstraintsKey = v5->_currentRequiredConstraintsKey;
    v5->_currentRequiredConstraintsKey = 0;

    currentRequiredConstraints = v5->_currentRequiredConstraints;
    v5->_currentRequiredConstraints = (NSArray *)&__NSArray0__struct;

    [(VMMessageMetadataView *)v5 createConstraints];
    [(VMMessageMetadataView *)v5 updateSubviewConfiguration];
  }
  return v5;
}

- (void)configureWithViewModel:(id)a3
{
  id v23 = a3;
  v4 = [(VMMessageMetadataView *)self currentViewModel];
  unsigned __int8 v5 = [v23 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(VMMessageMetadataView *)self setCurrentViewModel:v23];
    uint64_t v6 = [v23 localizedTitle];
    v7 = [(VMMessageMetadataView *)self titleLabel];
    [v7 setText:v6];

    v8 = [v23 localizedSubtitle];
    v9 = [(VMMessageMetadataView *)self subtitleLabel];
    [v9 setText:v8];

    double v10 = [v23 date];
    double v11 = [(VMMessageMetadataView *)self shortDateLabel];
    [v11 setDate:v10];

    uint64_t v12 = [v23 localizedDuration];
    v13 = [(VMMessageMetadataView *)self shortDurationLabel];
    [v13 setText:v12];

    double v14 = [v23 localizedDate];
    double v15 = [(VMMessageMetadataView *)self fullDateLabel];
    [v15 setText:v14];

    uint64_t v16 = [v23 showsRestrictedAlertView] ^ 1;
    v17 = [(VMMessageMetadataView *)self actionButton];
    [v17 setEnabled:v16];

    v18 = [v23 localizedSenderIdentityTitle];

    v19 = [(VMMessageMetadataView *)self badgeView];
    v20 = v19;
    if (v18)
    {
      v21 = [v23 localizedSenderIdentityTitle];
      [v20 setTitle:v21];

      v19 = [(VMMessageMetadataView *)self badgeView];
      v20 = v19;
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = 1;
    }
    [v19 setHidden:v22];

    [(VMMessageMetadataView *)self updateSubviewConfiguration];
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    [(VMMessageMetadataView *)self updateSubviewConfiguration];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(VMMessageMetadataView *)self updateSubviewConfiguration];
  }
}

- (void)setLayoutIsAccessible:(BOOL)a3
{
  if (self->_layoutIsAccessible != a3)
  {
    self->_layoutIsAccessible = a3;
    [(VMMessageMetadataView *)self createConstraints];
    [(VMMessageMetadataView *)self updateSubviewConfiguration];
  }
}

- (void)didTapInfo:(id)a3
{
  id v4 = [(VMMessageMetadataView *)self delegate];
  [v4 messageMetadataView:self didTapButtonType:2];
}

- (void)didTapAction:(id)a3
{
  id v4 = [(VMMessageMetadataView *)self delegate];
  [v4 messageMetadataView:self didTapButtonType:1];
}

- (void)updateSubviewConfiguration
{
  [objc_opt_class() constraintsKeyForAccessibleLayout:[self layoutIsAccessible] expanded:[self isExpanded] editing:[self isEditing]];
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [(VMMessageMetadataView *)self currentRequiredConstraintsKey];
  unsigned __int8 v4 = [v37 isEqualToString:v3];

  if ((v4 & 1) == 0)
  {
    unsigned __int8 v5 = [(VMMessageMetadataView *)self currentRequiredConstraints];
    LODWORD(v6) = 1132068864;
    [(VMMessageMetadataView *)self setPriorityOfConstraints:v5 to:v6];

    v7 = [(VMMessageMetadataView *)self constraintsForLayouts];
    v8 = [v7 objectForKeyedSubscript:v37];
    [(VMMessageMetadataView *)self setCurrentRequiredConstraints:v8];

    [(VMMessageMetadataView *)self setCurrentRequiredConstraintsKey:v37];
    v9 = [(VMMessageMetadataView *)self currentRequiredConstraints];
    LODWORD(v10) = 1148846080;
    [(VMMessageMetadataView *)self setPriorityOfConstraints:v9 to:v10];
  }
  double v11 = [(VMMessageMetadataView *)self badgeView];
  unsigned int v12 = [v11 isHidden];

  v13 = [(VMMessageMetadataView *)self subtitleLeadingToLayoutMarginConstrant];
  double v14 = v13;
  if (v12)
  {
    [v13 setActive:1];

    double v15 = [(VMMessageMetadataView *)self badgeViewTrailingToSubtitleLeadingConstrant];
    uint64_t v16 = v15;
    uint64_t v17 = 0;
  }
  else
  {
    [v13 setActive:0];

    double v15 = [(VMMessageMetadataView *)self badgeViewTrailingToSubtitleLeadingConstrant];
    uint64_t v16 = v15;
    uint64_t v17 = 1;
  }
  [v15 setActive:v17];

  if ([(VMMessageMetadataView *)self isExpanded]) {
    double v18 = 0.0;
  }
  else {
    double v18 = 1.0;
  }
  v19 = [(VMMessageMetadataView *)self shortDateLabel];
  [v19 setAlpha:v18];

  if ([(VMMessageMetadataView *)self isExpanded]) {
    double v20 = 0.0;
  }
  else {
    double v20 = 1.0;
  }
  v21 = [(VMMessageMetadataView *)self shortDurationLabel];
  [v21 setAlpha:v20];

  if ([(VMMessageMetadataView *)self isExpanded]) {
    double v22 = 1.0;
  }
  else {
    double v22 = 0.0;
  }
  id v23 = [(VMMessageMetadataView *)self fullDateLabel];
  [v23 setAlpha:v22];

  if ([(VMMessageMetadataView *)self isExpanded]) {
    double v24 = 1.0;
  }
  else {
    double v24 = 0.0;
  }
  v25 = [(VMMessageMetadataView *)self actionButton];
  [v25 setAlpha:v24];

  if ([(VMMessageMetadataView *)self isEditing]) {
    double v26 = 0.0;
  }
  else {
    double v26 = 1.0;
  }
  v27 = [(VMMessageMetadataView *)self infoButton];
  [v27 setAlpha:v26];

  [(VMMessageMetadataView *)self updateLabelColors];
  v28 = [(VMMessageMetadataView *)self traitCollection];
  if ([v28 preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells]) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = 2;
  }
  double v30 = [(VMMessageMetadataView *)self titleLabel];
  [v30 setNumberOfLines:v29];

  uint64_t v31 = [(VMMessageMetadataView *)self layoutIsAccessible] ^ 1;
  v32 = [(VMMessageMetadataView *)self subtitleLabel];
  [v32 setNumberOfLines:v31];

  v33 = [(VMMessageMetadataView *)self shortDateLabel];
  [v33 setNumberOfLines:1];

  v34 = [(VMMessageMetadataView *)self shortDurationLabel];
  [v34 setNumberOfLines:1];

  if ([(VMMessageMetadataView *)self layoutIsAccessible]) {
    uint64_t v35 = 2;
  }
  else {
    uint64_t v35 = 1;
  }
  double v36 = [(VMMessageMetadataView *)self fullDateLabel];
  [v36 setNumberOfLines:v35];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)VMMessageMetadataView;
  [(VMMessageMetadataView *)&v3 tintColorDidChange];
  [(VMMessageMetadataView *)self updateLabelColors];
}

- (void)updateLabelColors
{
  objc_super v3 = +[UIColor dynamicSecondaryLabelColor];
  id v7 = [(VMMessageMetadataView *)self _accessibilityHigherContrastTintColorForColor:v3];

  unsigned __int8 v4 = [(VMMessageMetadataView *)self subtitleLabel];
  [v4 setTextColor:v7];

  unsigned __int8 v5 = [(VMMessageMetadataView *)self shortDurationLabel];
  [v5 setTextColor:v7];

  double v6 = [(VMMessageMetadataView *)self fullDateLabel];
  [v6 setTextColor:v7];
}

- (void)createConstraints
{
  [(VMMessageMetadataView *)self setCurrentRequiredConstraints:&__NSArray0__struct];
  [(VMMessageMetadataView *)self setCurrentRequiredConstraintsKey:0];
  objc_super v3 = [(VMMessageMetadataView *)self currentActiveFixedConstraints];
  [(VMMessageMetadataView *)self removeConstraints:v3];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unsigned __int8 v4 = [(VMMessageMetadataView *)self constraintsForLayouts];
  unsigned __int8 v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        [(VMMessageMetadataView *)self removeConstraints:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  v32 = [(id)objc_opt_class() constraintsKeyForAccessibleLayout:0 expanded:0 editing:0];
  v42[0] = v32;
  uint64_t v31 = [(VMMessageMetadataView *)self createConstraintsForNonAccessibleNonExpandedLayoutForEditing:0];
  v43[0] = v31;
  double v30 = [(id)objc_opt_class() constraintsKeyForAccessibleLayout:0 expanded:0 editing:1];
  v42[1] = v30;
  uint64_t v29 = [(VMMessageMetadataView *)self createConstraintsForNonAccessibleNonExpandedLayoutForEditing:1];
  v43[1] = v29;
  double v10 = [(id)objc_opt_class() constraintsKeyForAccessibleLayout:0 expanded:1 editing:0];
  v42[2] = v10;
  double v11 = [(VMMessageMetadataView *)self createConstraintsForNonAccessibleExpandedLayout];
  v43[2] = v11;
  unsigned int v12 = [(id)objc_opt_class() constraintsKeyForAccessibleLayout:1 expanded:0 editing:0];
  v42[3] = v12;
  v13 = [(VMMessageMetadataView *)self createConstraintsForAccessibleNonExpandedLayoutForEditing:0];
  v43[3] = v13;
  double v14 = [(id)objc_opt_class() constraintsKeyForAccessibleLayout:1 expanded:0 editing:1];
  v42[4] = v14;
  double v15 = [(VMMessageMetadataView *)self createConstraintsForAccessibleNonExpandedLayoutForEditing:1];
  v43[4] = v15;
  uint64_t v16 = [(id)objc_opt_class() constraintsKeyForAccessibleLayout:1 expanded:1 editing:0];
  v42[5] = v16;
  uint64_t v17 = [(VMMessageMetadataView *)self createConstraintsForAccessibleExpandedLayout];
  v43[5] = v17;
  double v18 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:6];
  [(VMMessageMetadataView *)self setConstraintsForLayouts:v18];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v19 = [(VMMessageMetadataView *)self constraintsForLayouts];
  double v20 = [v19 allValues];

  id v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v21)
  {
    id v23 = v21;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v20);
        }
        uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
        LODWORD(v22) = 1132068864;
        -[VMMessageMetadataView setPriorityOfConstraints:to:](self, "setPriorityOfConstraints:to:", v26, v22, v29);
        +[NSLayoutConstraint activateConstraints:v26];
      }
      id v23 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v23);
  }

  if ([(VMMessageMetadataView *)self layoutIsAccessible]) {
    [(VMMessageMetadataView *)self createFixedConstraintsForAccessibleLayout];
  }
  else {
  v27 = [(VMMessageMetadataView *)self createFixedConstraintsForNonAccessibleLayout];
  }
  -[VMMessageMetadataView setCurrentActiveFixedConstraints:](self, "setCurrentActiveFixedConstraints:", v27, v29);

  v28 = [(VMMessageMetadataView *)self currentActiveFixedConstraints];
  +[NSLayoutConstraint activateConstraints:v28];
}

- (void)removeConstraints:(id)a3
{
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v5 = 138412290;
    long long v16 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v10 = [v9 firstItem:v16];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          unsigned int v12 = [v9 firstItem];
LABEL_10:
          double v15 = v12;
          [v12 removeConstraint:v9];
          goto LABEL_13;
        }
        v13 = [v9 secondItem];
        objc_opt_class();
        char v14 = objc_opt_isKindOfClass();

        if (v14)
        {
          unsigned int v12 = [v9 secondItem];
          goto LABEL_10;
        }
        double v15 = PHDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v16;
          double v22 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to remove constraint: %@", buf, 0xCu);
        }
LABEL_13:
      }
      id v6 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }
}

+ (id)constraintsKeyForAccessibleLayout:(BOOL)a3 expanded:(BOOL)a4 editing:(BOOL)a5
{
  return +[NSString stringWithFormat:@"%d:%d:%d", a3, a4, a5];
}

- (void)setPriorityOfConstraints:(id)a3 to:(float)a4
{
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        *(float *)&double v7 = a4;
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setPriority:v7];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)createFixedConstraintsForNonAccessibleLayout
{
  v64 = [(VMMessageMetadataView *)self infoButton];
  v62 = [v64 centerYAnchor];
  v63 = [(VMMessageMetadataView *)self buttonLayoutGuide];
  uint64_t v61 = [v63 centerYAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v65[0] = v60;
  v59 = [(VMMessageMetadataView *)self infoButton];
  v57 = [v59 trailingAnchor];
  v58 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  v56 = [v58 trailingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v65[1] = v55;
  v54 = [(VMMessageMetadataView *)self actionButton];
  v52 = [v54 firstBaselineAnchor];
  v53 = [(VMMessageMetadataView *)self infoButton];
  v51 = [v53 firstBaselineAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v65[2] = v50;
  v49 = [(VMMessageMetadataView *)self actionButton];
  double v47 = [v49 trailingAnchor];
  v48 = [(VMMessageMetadataView *)self infoButton];
  double v46 = [v48 leadingAnchor];
  double v45 = [v47 constraintEqualToAnchor:v46 constant:-24.0];
  v65[3] = v45;
  double v44 = [(VMMessageMetadataView *)self titleLabel];
  v42 = [v44 topAnchor];
  v43 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  v41 = [v43 topAnchor];
  long long v40 = [v42 constraintEqualToAnchor:v41];
  v65[4] = v40;
  long long v39 = [(VMMessageMetadataView *)self titleLabel];
  long long v37 = [v39 leadingAnchor];
  long long v38 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  long long v36 = [v38 leadingAnchor];
  long long v35 = [v37 constraintEqualToAnchor:v36];
  v65[5] = v35;
  long long v34 = [(VMMessageMetadataView *)self subtitleLabel];
  v32 = [v34 firstBaselineAnchor];
  long long v33 = [(VMMessageMetadataView *)self titleLabel];
  uint64_t v31 = [v33 lastBaselineAnchor];
  double v30 = [v32 constraintEqualToSystemSpacingBelowAnchor:v31 multiplier:1.0];
  v65[6] = v30;
  uint64_t v29 = [(VMMessageMetadataView *)self shortDateLabel];
  v27 = [v29 firstBaselineAnchor];
  v28 = [(VMMessageMetadataView *)self titleLabel];
  uint64_t v26 = [v28 firstBaselineAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v65[7] = v25;
  uint64_t v24 = [(VMMessageMetadataView *)self shortDurationLabel];
  double v22 = [v24 firstBaselineAnchor];
  id v23 = [(VMMessageMetadataView *)self subtitleLabel];
  id v21 = [v23 firstBaselineAnchor];
  long long v20 = [v22 constraintEqualToAnchor:v21];
  v65[8] = v20;
  long long v19 = [(VMMessageMetadataView *)self fullDateLabel];
  long long v17 = [v19 firstBaselineAnchor];
  long long v18 = [(VMMessageMetadataView *)self subtitleLabel];
  long long v16 = [v18 lastBaselineAnchor];
  double v15 = [v17 constraintEqualToSystemSpacingBelowAnchor:v16 multiplier:1.0];
  v65[9] = v15;
  id v3 = [(VMMessageMetadataView *)self fullDateLabel];
  id v4 = [v3 leadingAnchor];
  id v5 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  id v6 = [v5 leadingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];
  v65[10] = v7;
  id v8 = [(VMMessageMetadataView *)self fullDateLabel];
  uint64_t v9 = [v8 trailingAnchor];
  double v10 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  long long v11 = [v10 trailingAnchor];
  long long v12 = [v9 constraintEqualToAnchor:v11];
  v65[11] = v12;
  id v14 = +[NSArray arrayWithObjects:v65 count:12];

  return v14;
}

- (id)createConstraintsForNonAccessibleNonExpandedLayoutForEditing:(BOOL)a3
{
  BOOL v3 = a3;
  long long v33 = [(VMMessageMetadataView *)self shortDateLabel];
  id v5 = [v33 trailingAnchor];
  if (v3)
  {
    id v6 = [(VMMessageMetadataView *)self layoutMarginsGuide];
    double v7 = [v6 trailingAnchor];
    id v8 = [v5 constraintEqualToAnchor:v7];
    v37[0] = v8;
    uint64_t v9 = [(VMMessageMetadataView *)self shortDurationLabel];
    double v10 = [v9 trailingAnchor];
    long long v11 = [(VMMessageMetadataView *)self layoutMarginsGuide];
    long long v12 = [v11 trailingAnchor];
    long long v13 = [v10 constraintEqualToAnchor:v12];
    v37[1] = v13;
    id v14 = v37;
  }
  else
  {
    id v6 = [(VMMessageMetadataView *)self infoButton];
    double v7 = [v6 leadingAnchor];
    id v8 = [v5 constraintEqualToAnchor:v7 constant:-8.0];
    v36[0] = v8;
    uint64_t v9 = [(VMMessageMetadataView *)self shortDurationLabel];
    double v10 = [v9 trailingAnchor];
    long long v11 = [(VMMessageMetadataView *)self infoButton];
    long long v12 = [v11 leadingAnchor];
    long long v13 = [v10 constraintEqualToAnchor:v12 constant:-8.0];
    v36[1] = v13;
    id v14 = v36;
  }
  uint64_t v31 = +[NSArray arrayWithObjects:v14 count:2];

  long long v34 = [(VMMessageMetadataView *)self titleLabel];
  double v30 = [v34 trailingAnchor];
  v32 = [(VMMessageMetadataView *)self shortDateLabel];
  uint64_t v29 = [v32 leadingAnchor];
  v28 = [v30 constraintLessThanOrEqualToAnchor:v29 constant:-8.0];
  v35[0] = v28;
  v27 = [(VMMessageMetadataView *)self subtitleLabel];
  uint64_t v26 = [v27 trailingAnchor];
  double v15 = [(VMMessageMetadataView *)self shortDurationLabel];
  long long v16 = [v15 leadingAnchor];
  long long v17 = [v26 constraintLessThanOrEqualToAnchor:v16 constant:-8.0];
  v35[1] = v17;
  long long v18 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  long long v19 = [v18 bottomAnchor];
  long long v20 = [(VMMessageMetadataView *)self shortDurationLabel];
  id v21 = [v20 bottomAnchor];
  double v22 = [v19 constraintEqualToAnchor:v21];
  v35[2] = v22;
  id v23 = +[NSArray arrayWithObjects:v35 count:3];
  id v25 = [v23 arrayByAddingObjectsFromArray:v31];

  return v25;
}

- (id)createConstraintsForNonAccessibleExpandedLayout
{
  uint64_t v29 = [(VMMessageMetadataView *)self titleLabel];
  v27 = [v29 trailingAnchor];
  v28 = [(VMMessageMetadataView *)self actionButton];
  uint64_t v26 = [v28 leadingAnchor];
  id v25 = [v27 constraintLessThanOrEqualToAnchor:v26 constant:-8.0];
  v30[0] = v25;
  uint64_t v24 = [(VMMessageMetadataView *)self subtitleLabel];
  double v22 = [v24 trailingAnchor];
  id v23 = [(VMMessageMetadataView *)self actionButton];
  id v21 = [v23 leadingAnchor];
  long long v20 = [v22 constraintLessThanOrEqualToAnchor:v21 constant:-8.0];
  v30[1] = v20;
  long long v19 = [(VMMessageMetadataView *)self shortDateLabel];
  long long v17 = [v19 trailingAnchor];
  long long v18 = [(VMMessageMetadataView *)self infoButton];
  long long v16 = [v18 leadingAnchor];
  double v15 = [v17 constraintEqualToAnchor:v16 constant:-8.0];
  v30[2] = v15;
  BOOL v3 = [(VMMessageMetadataView *)self shortDurationLabel];
  id v4 = [v3 trailingAnchor];
  id v5 = [(VMMessageMetadataView *)self infoButton];
  id v6 = [v5 leadingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6 constant:-8.0];
  v30[3] = v7;
  id v8 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  uint64_t v9 = [v8 bottomAnchor];
  double v10 = [(VMMessageMetadataView *)self fullDateLabel];
  long long v11 = [v10 bottomAnchor];
  long long v12 = [v9 constraintEqualToAnchor:v11];
  v30[4] = v12;
  id v14 = +[NSArray arrayWithObjects:v30 count:5];

  return v14;
}

- (id)createFixedConstraintsForAccessibleLayout
{
  v89 = [(VMMessageMetadataView *)self infoButton];
  v87 = [v89 firstBaselineAnchor];
  v88 = [(VMMessageMetadataView *)self titleLabel];
  v86 = [v88 firstBaselineAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  v90[0] = v85;
  v84 = [(VMMessageMetadataView *)self infoButton];
  v82 = [v84 trailingAnchor];
  v83 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  v81 = [v83 trailingAnchor];
  v80 = [v82 constraintEqualToAnchor:v81];
  v90[1] = v80;
  v79 = [(VMMessageMetadataView *)self actionButton];
  objc_super v77 = [v79 firstBaselineAnchor];
  v78 = [(VMMessageMetadataView *)self titleLabel];
  v76 = [v78 firstBaselineAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v90[2] = v75;
  v74 = [(VMMessageMetadataView *)self actionButton];
  v72 = [v74 trailingAnchor];
  v73 = [(VMMessageMetadataView *)self infoButton];
  v71 = [v73 leadingAnchor];
  v70 = [v72 constraintEqualToAnchor:v71 constant:-24.0];
  v90[3] = v70;
  v69 = [(VMMessageMetadataView *)self titleLabel];
  v67 = [v69 topAnchor];
  v68 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  v66 = [v68 topAnchor];
  uint64_t v65 = [v67 constraintEqualToAnchor:v66];
  v90[4] = v65;
  v64 = [(VMMessageMetadataView *)self titleLabel];
  v62 = [v64 leadingAnchor];
  v63 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  uint64_t v61 = [v63 leadingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v90[5] = v60;
  v59 = [(VMMessageMetadataView *)self subtitleLabel];
  v57 = [v59 firstBaselineAnchor];
  v58 = [(VMMessageMetadataView *)self titleLabel];
  v56 = [v58 lastBaselineAnchor];
  v55 = [v57 constraintEqualToSystemSpacingBelowAnchor:v56 multiplier:1.0];
  v90[6] = v55;
  v54 = [(VMMessageMetadataView *)self subtitleLabel];
  v52 = [v54 trailingAnchor];
  v53 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  v51 = [v53 trailingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v90[7] = v50;
  v49 = [(VMMessageMetadataView *)self shortDateLabel];
  double v47 = [v49 firstBaselineAnchor];
  v48 = [(VMMessageMetadataView *)self subtitleLabel];
  double v46 = [v48 lastBaselineAnchor];
  double v45 = [v47 constraintEqualToSystemSpacingBelowAnchor:v46 multiplier:1.0];
  v90[8] = v45;
  double v44 = [(VMMessageMetadataView *)self shortDateLabel];
  v42 = [v44 leadingAnchor];
  v43 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  v41 = [v43 leadingAnchor];
  long long v40 = [v42 constraintEqualToAnchor:v41];
  v90[9] = v40;
  long long v39 = [(VMMessageMetadataView *)self shortDateLabel];
  long long v37 = [v39 trailingAnchor];
  long long v38 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  long long v36 = [v38 trailingAnchor];
  long long v35 = [v37 constraintEqualToAnchor:v36];
  v90[10] = v35;
  long long v34 = [(VMMessageMetadataView *)self shortDurationLabel];
  v32 = [v34 firstBaselineAnchor];
  long long v33 = [(VMMessageMetadataView *)self shortDateLabel];
  uint64_t v31 = [v33 lastBaselineAnchor];
  double v30 = [v32 constraintEqualToSystemSpacingBelowAnchor:v31 multiplier:1.0];
  v90[11] = v30;
  uint64_t v29 = [(VMMessageMetadataView *)self shortDurationLabel];
  v27 = [v29 leadingAnchor];
  v28 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  uint64_t v26 = [v28 leadingAnchor];
  id v25 = [v27 constraintEqualToAnchor:v26];
  v90[12] = v25;
  uint64_t v24 = [(VMMessageMetadataView *)self shortDurationLabel];
  double v22 = [v24 trailingAnchor];
  id v23 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  id v21 = [v23 trailingAnchor];
  long long v20 = [v22 constraintEqualToAnchor:v21];
  v90[13] = v20;
  long long v19 = [(VMMessageMetadataView *)self fullDateLabel];
  long long v17 = [v19 firstBaselineAnchor];
  long long v18 = [(VMMessageMetadataView *)self subtitleLabel];
  long long v16 = [v18 lastBaselineAnchor];
  double v15 = [v17 constraintEqualToSystemSpacingBelowAnchor:v16 multiplier:1.0];
  v90[14] = v15;
  BOOL v3 = [(VMMessageMetadataView *)self fullDateLabel];
  id v4 = [v3 leadingAnchor];
  id v5 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  id v6 = [v5 leadingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];
  v90[15] = v7;
  id v8 = [(VMMessageMetadataView *)self fullDateLabel];
  uint64_t v9 = [v8 trailingAnchor];
  double v10 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  long long v11 = [v10 trailingAnchor];
  long long v12 = [v9 constraintEqualToAnchor:v11];
  v90[16] = v12;
  id v14 = +[NSArray arrayWithObjects:v90 count:17];

  return v14;
}

- (id)createConstraintsForAccessibleNonExpandedLayoutForEditing:(BOOL)a3
{
  BOOL v3 = a3;
  long long v17 = [(VMMessageMetadataView *)self titleLabel];
  id v5 = [v17 trailingAnchor];
  if (v3)
  {
    id v6 = [(VMMessageMetadataView *)self layoutMarginsGuide];
    double v7 = [v6 trailingAnchor];
    id v8 = [v5 constraintLessThanOrEqualToAnchor:v7];
    v19[0] = v8;
    uint64_t v9 = [(VMMessageMetadataView *)self layoutMarginsGuide];
    double v10 = [v9 bottomAnchor];
    long long v11 = [(VMMessageMetadataView *)self shortDurationLabel];
    long long v12 = [v11 bottomAnchor];
    long long v13 = [v10 constraintEqualToAnchor:v12];
    v19[1] = v13;
    id v14 = v19;
  }
  else
  {
    id v6 = [(VMMessageMetadataView *)self infoButton];
    double v7 = [v6 leadingAnchor];
    id v8 = [v5 constraintLessThanOrEqualToAnchor:v7 constant:-8.0];
    v18[0] = v8;
    uint64_t v9 = [(VMMessageMetadataView *)self layoutMarginsGuide];
    double v10 = [v9 bottomAnchor];
    long long v11 = [(VMMessageMetadataView *)self shortDurationLabel];
    long long v12 = [v11 bottomAnchor];
    long long v13 = [v10 constraintEqualToAnchor:v12];
    v18[1] = v13;
    id v14 = v18;
  }
  double v15 = +[NSArray arrayWithObjects:v14 count:2];

  return v15;
}

- (id)createConstraintsForAccessibleExpandedLayout
{
  id v14 = [(VMMessageMetadataView *)self titleLabel];
  BOOL v3 = [v14 trailingAnchor];
  id v4 = [(VMMessageMetadataView *)self actionButton];
  id v5 = [v4 leadingAnchor];
  id v6 = [v3 constraintLessThanOrEqualToAnchor:v5 constant:-8.0];
  v15[0] = v6;
  double v7 = [(VMMessageMetadataView *)self layoutMarginsGuide];
  id v8 = [v7 bottomAnchor];
  uint64_t v9 = [(VMMessageMetadataView *)self fullDateLabel];
  double v10 = [v9 bottomAnchor];
  long long v11 = [v8 constraintEqualToAnchor:v10];
  v15[1] = v11;
  long long v12 = +[NSArray arrayWithObjects:v15 count:2];

  return v12;
}

- (VMMessageMetadataViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VMMessageMetadataViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIDateLabel)shortDateLabel
{
  return self->_shortDateLabel;
}

- (UILabel)shortDurationLabel
{
  return self->_shortDurationLabel;
}

- (UILabel)fullDateLabel
{
  return self->_fullDateLabel;
}

- (TPBadgeView)badgeView
{
  return self->_badgeView;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)layoutIsAccessible
{
  return self->_layoutIsAccessible;
}

- (MPVoicemailMessageViewModel)currentViewModel
{
  return self->_currentViewModel;
}

- (void)setCurrentViewModel:(id)a3
{
}

- (UILayoutGuide)buttonLayoutGuide
{
  return self->_buttonLayoutGuide;
}

- (void)setButtonLayoutGuide:(id)a3
{
}

- (NSDictionary)constraintsForLayouts
{
  return self->_constraintsForLayouts;
}

- (void)setConstraintsForLayouts:(id)a3
{
}

- (NSString)currentRequiredConstraintsKey
{
  return self->_currentRequiredConstraintsKey;
}

- (void)setCurrentRequiredConstraintsKey:(id)a3
{
}

- (NSArray)currentRequiredConstraints
{
  return self->_currentRequiredConstraints;
}

- (void)setCurrentRequiredConstraints:(id)a3
{
}

- (NSArray)currentActiveFixedConstraints
{
  return self->_currentActiveFixedConstraints;
}

- (void)setCurrentActiveFixedConstraints:(id)a3
{
}

- (NSLayoutConstraint)subtitleLeadingToLayoutMarginConstrant
{
  return self->_subtitleLeadingToLayoutMarginConstrant;
}

- (void)setSubtitleLeadingToLayoutMarginConstrant:(id)a3
{
}

- (NSLayoutConstraint)badgeViewTrailingToSubtitleLeadingConstrant
{
  return self->_badgeViewTrailingToSubtitleLeadingConstrant;
}

- (void)setBadgeViewTrailingToSubtitleLeadingConstrant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeViewTrailingToSubtitleLeadingConstrant, 0);
  objc_storeStrong((id *)&self->_subtitleLeadingToLayoutMarginConstrant, 0);
  objc_storeStrong((id *)&self->_currentActiveFixedConstraints, 0);
  objc_storeStrong((id *)&self->_currentRequiredConstraints, 0);
  objc_storeStrong((id *)&self->_currentRequiredConstraintsKey, 0);
  objc_storeStrong((id *)&self->_constraintsForLayouts, 0);
  objc_storeStrong((id *)&self->_buttonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_currentViewModel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_fullDateLabel, 0);
  objc_storeStrong((id *)&self->_shortDurationLabel, 0);
  objc_storeStrong((id *)&self->_shortDateLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end