@interface MPLegacyRecentsTableViewCell
+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3 isEditing:(BOOL)a4;
+ (double)callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3;
+ (double)callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant:(id)a3;
+ (double)largestCallTypeIconWidth;
+ (double)leftTitleSeparatorInsetForContentSizeCategory:(id)a3;
+ (double)minimumRowHeight;
+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3;
- (BOOL)hasCallTypeIcon;
- (BOOL)isAccessibilityConstraintsEnabled;
- (BOOL)isMissedCall;
- (BOOL)tapTargets;
- (CNAvatarViewController)avatarViewController;
- (NSDirectionalEdgeInsets)rootViewLayoutMargins;
- (NUIContainerGridView)gridView;
- (NUIContainerStackView)subtitleStackView;
- (NUIContainerStackView)titleStackView;
- (PHRecentsItem)item;
- (TPAccessoryButton)callButton;
- (TPBadgeView)badgeView;
- (TUFeatureFlags)featureFlags;
- (UIDateLabel)callerDateLabel;
- (UIImage)callButtonImage;
- (UIImageView)callTypeIconView;
- (UIImageView)outgoingIndicator;
- (UIImageView)verifiedBadgeView;
- (UILabel)callerCountLabel;
- (UIView)callTypeIconSizingView;
- (double)callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstant;
- (double)dateLabelTrailingLayoutConstraintConstant;
- (double)titleLabelLeadingAnchorLayoutConstraintConstant;
- (id)callButtonTappedHandler;
- (id)loadRootViewAndContentViews;
- (int64_t)callButtonColumnWithAccessibility;
- (int64_t)callButtonColumnWithoutAccessibility;
- (int64_t)callerDateColumnIndex;
- (int64_t)maximumColumnsWithAccessibility;
- (int64_t)maximumColumnsWithoutAccessibility;
- (void)callButtonTapped:(id)a3;
- (void)commonInit;
- (void)configureCellForHighlightingWithText:(id)a3;
- (void)configureGridViewArrangedSubviews;
- (void)configureWithRecentsItem:(id)a3 recentCall:(id)a4;
- (void)enableCallButton:(BOOL)a3;
- (void)prepareForReuse;
- (void)setAvatarViewController:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setCallButton:(id)a3;
- (void)setCallButtonColumnWithAccessibility:(int64_t)a3;
- (void)setCallButtonColumnWithoutAccessibility:(int64_t)a3;
- (void)setCallButtonImage:(id)a3;
- (void)setCallButtonTappedHandler:(id)a3;
- (void)setCallTypeIconSizingView:(id)a3;
- (void)setCallerDateColumnIndex:(int64_t)a3;
- (void)setGridView:(id)a3;
- (void)setHasCallTypeIcon:(BOOL)a3;
- (void)setIsMissedCall:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setMaximumColumnsWithAccessibility:(int64_t)a3;
- (void)setMaximumColumnsWithoutAccessibility:(int64_t)a3;
- (void)setSubtitleStackView:(id)a3;
- (void)setTapTargets:(BOOL)a3;
- (void)setTitleStackView:(id)a3;
- (void)setVerifiedBadgeView:(id)a3;
- (void)showContainerViewDebugBoundingBox;
- (void)updateDateLabelAlignment;
- (void)updateFonts;
- (void)updateFontsAndLayoutMetrics;
- (void)updateRootView;
- (void)updateTextColor;
@end

@implementation MPLegacyRecentsTableViewCell

+ (double)minimumRowHeight
{
  return 60.0;
}

- (id)loadRootViewAndContentViews
{
  v53.receiver = self;
  v53.super_class = (Class)MPLegacyRecentsTableViewCell;
  id v3 = [(PHDoubleLineTableViewCell *)&v53 loadRootViewAndContentViews];
  [(MPLegacyRecentsTableViewCell *)self setAccessoryType:4];
  v4 = [(PHTableViewCell *)self titleLabel];
  [v4 setLineBreakMode:4];

  v5 = [(PHTableViewCell *)self subtitleLabel];
  [v5 setLineBreakMode:4];

  v6 = [(MPLegacyRecentsTableViewCell *)self featureFlags];
  unsigned __int8 v7 = [v6 phoneRecentsAvatarsEnabled];

  id v8 = objc_alloc((Class)UIImageView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v12 = [v8 initWithFrame:CGRectZero.origin.x, y, width, height];
  if (v7)
  {
    outgoingIndicator = self->_outgoingIndicator;
    self->_outgoingIndicator = v12;

    [(UIImageView *)self->_outgoingIndicator setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    v14 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
    v15 = +[UIColor dynamicTertiaryLabelColor];
    [v14 setTintColor:v15];
  }
  else
  {
    callTypeIconView = self->_callTypeIconView;
    self->_callTypeIconView = v12;

    [(UIImageView *)self->_callTypeIconView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    v17 = +[UIColor dynamicTertiaryLabelColor];
    [(UIImageView *)self->_callTypeIconView setTintColor:v17];

    LODWORD(v18) = 1148846080;
    [(UIImageView *)self->_callTypeIconView setContentHuggingPriority:1 forAxis:v18];
    LODWORD(v19) = 1148846080;
    [(UIImageView *)self->_callTypeIconView setContentHuggingPriority:0 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(UIImageView *)self->_callTypeIconView setContentCompressionResistancePriority:1 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(UIImageView *)self->_callTypeIconView setContentCompressionResistancePriority:0 forAxis:v21];
  }
  [(MPLegacyRecentsTableViewCell *)self setMaximumColumnsWithoutAccessibility:3];
  [(MPLegacyRecentsTableViewCell *)self setMaximumColumnsWithAccessibility:2];
  v22 = (UIView *)objc_alloc_init((Class)UIView);
  callTypeIconSizingView = self->_callTypeIconSizingView;
  self->_callTypeIconSizingView = v22;

  [(id)objc_opt_class() largestCallTypeIconWidth];
  double v25 = v24;
  [(UIView *)self->_callTypeIconSizingView setMinimumLayoutSize:"setMinimumLayoutSize:"];
  -[UIView setMaximumLayoutSize:](self->_callTypeIconSizingView, "setMaximumLayoutSize:", v25, 1.0);
  v26 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  callerCountLabel = self->_callerCountLabel;
  self->_callerCountLabel = v26;

  [(UILabel *)self->_callerCountLabel setAccessibilityIdentifier:@"MPRecentsTableViewCell_CallerCount"];
  v28 = +[UIColor clearColor];
  [(UILabel *)self->_callerCountLabel setBackgroundColor:v28];

  [(UILabel *)self->_callerCountLabel setAdjustsFontForContentSizeCategory:1];
  LODWORD(v29) = 1148846080;
  [(UILabel *)self->_callerCountLabel setContentHuggingPriority:1 forAxis:v29];
  LODWORD(v30) = 1148846080;
  [(UILabel *)self->_callerCountLabel setContentHuggingPriority:0 forAxis:v30];
  LODWORD(v31) = 1148846080;
  [(UILabel *)self->_callerCountLabel setContentCompressionResistancePriority:1 forAxis:v31];
  LODWORD(v32) = 1148846080;
  [(UILabel *)self->_callerCountLabel setContentCompressionResistancePriority:0 forAxis:v32];
  v33 = [objc_alloc((Class)UIDateLabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  callerDateLabel = self->_callerDateLabel;
  self->_callerDateLabel = v33;

  [(UIDateLabel *)self->_callerDateLabel setAccessibilityIdentifier:@"MPRecentsTableViewCell_CallerDate"];
  v35 = +[UIColor clearColor];
  [(UIDateLabel *)self->_callerDateLabel setBackgroundColor:v35];

  [(UIDateLabel *)self->_callerDateLabel setAdjustsFontForContentSizeCategory:1];
  LODWORD(v36) = 1148846080;
  [(UIDateLabel *)self->_callerDateLabel setContentCompressionResistancePriority:0 forAxis:v36];
  LODWORD(v37) = 1148846080;
  [(UIDateLabel *)self->_callerDateLabel setContentCompressionResistancePriority:1 forAxis:v37];
  LODWORD(v38) = 1148846080;
  [(UIDateLabel *)self->_callerDateLabel setContentHuggingPriority:0 forAxis:v38];
  LODWORD(v39) = 1148846080;
  [(UIDateLabel *)self->_callerDateLabel setContentHuggingPriority:1 forAxis:v39];
  v40 = (NUIContainerStackView *)objc_alloc_init((Class)NUIContainerStackView);
  titleStackView = self->_titleStackView;
  self->_titleStackView = v40;

  v42 = (NUIContainerStackView *)objc_alloc_init((Class)NUIContainerStackView);
  subtitleStackView = self->_subtitleStackView;
  self->_subtitleStackView = v42;

  v44 = (NUIContainerGridView *)objc_alloc_init((Class)NUIContainerGridView);
  gridView = self->_gridView;
  self->_gridView = v44;

  [(MPLegacyRecentsTableViewCell *)self updateFonts];
  v46 = [(PHTableViewCell *)self titleLabel];
  [v46 effectiveFirstBaselineOffsetFromTop];
  -[NUIContainerStackView setCustomFirstBaselineOffsetFromTop:](self->_titleStackView, "setCustomFirstBaselineOffsetFromTop:");

  v47 = [(PHTableViewCell *)self subtitleLabel];
  [v47 effectiveFirstBaselineOffsetFromTop];
  -[NUIContainerStackView setCustomFirstBaselineOffsetFromTop:](self->_subtitleStackView, "setCustomFirstBaselineOffsetFromTop:");

  [(NUIContainerStackView *)self->_subtitleStackView setSpacing:4.0];
  [(NUIContainerStackView *)self->_titleStackView setSpacing:4.0];
  [(NUIContainerGridView *)self->_gridView setHorizontalAlignment:1];
  [(NUIContainerGridView *)self->_gridView setLayoutMarginsRelativeArrangement:1];
  [(NUIContainerGridView *)self->_gridView setBaselineRelativeArrangement:1];
  [(PHDoubleLineTableViewCell *)self subtitleLabelFirstBaselineLayoutConstraintConstant];
  -[NUIContainerGridView setRowSpacing:](self->_gridView, "setRowSpacing:");
  v48 = [(MPLegacyRecentsTableViewCell *)self featureFlags];
  unsigned __int8 v49 = [v48 phoneRecentsAvatarsEnabled];

  double v50 = 10.0;
  if ((v49 & 1) == 0) {
    [(PHTableViewCell *)self titleLabelLeadingLayoutConstraintConstant];
  }
  [(NUIContainerGridView *)self->_gridView setColumnSpacing:v50];
  [(MPLegacyRecentsTableViewCell *)self configureGridViewArrangedSubviews];
  v51 = self->_gridView;

  return v51;
}

- (NSDirectionalEdgeInsets)rootViewLayoutMargins
{
  v21.receiver = self;
  v21.super_class = (Class)MPLegacyRecentsTableViewCell;
  [(PHDoubleLineTableViewCell *)&v21 rootViewLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  v9 = [(MPLegacyRecentsTableViewCell *)self featureFlags];
  unsigned int v10 = [v9 phoneRecentsAvatarsEnabled];

  if (v10)
  {
    [(MPLegacyRecentsTableViewCell *)self dateLabelTrailingLayoutConstraintConstant];
    double v8 = v11;
    v12 = [(MPLegacyRecentsTableViewCell *)self contentView];
    [v12 directionalLayoutMargins];
    double v14 = v13;

    double v6 = 12.0;
    double v4 = 12.0;
  }
  else
  {
    [(MPLegacyRecentsTableViewCell *)self callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstant];
    double v14 = v15;
    if ([(MPLegacyRecentsTableViewCell *)self isAccessibilityConstraintsEnabled])
    {
      [(MPLegacyRecentsTableViewCell *)self dateLabelTrailingLayoutConstraintConstant];
      double v8 = v16;
    }
  }
  double v17 = v4;
  double v18 = v14;
  double v19 = v6;
  double v20 = v8;
  result.trailing = v20;
  result.bottom = v19;
  result.leading = v18;
  result.top = v17;
  return result;
}

- (TUFeatureFlags)featureFlags
{
  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    double v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    double v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }

  return featureFlags;
}

- (double)dateLabelTrailingLayoutConstraintConstant
{
  double v3 = 0.0;
  if (![(MPLegacyRecentsTableViewCell *)self isAccessibilityConstraintsEnabled])
  {
    if ([(MPLegacyRecentsTableViewCell *)self accessoryType])
    {
      if ([(MPLegacyRecentsTableViewCell *)self accessoryType] == (id)4)
      {
        if ([(MPLegacyRecentsTableViewCell *)self tapTargets]) {
          return 16.0;
        }
        else {
          return 6.0;
        }
      }
    }
    else
    {
      return 15.0;
    }
  }
  return v3;
}

- (BOOL)tapTargets
{
  return self->_tapTargets;
}

- (void)configureGridViewArrangedSubviews
{
  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472;
  v109[2] = __65__MPLegacyRecentsTableViewCell_configureGridViewArrangedSubviews__block_invoke;
  v109[3] = &unk_10027C670;
  v109[4] = self;
  double v3 = objc_retainBlock(v109);
  if ([(MPLegacyRecentsTableViewCell *)self isAccessibilityConstraintsEnabled])
  {
    double v4 = [(MPLegacyRecentsTableViewCell *)self gridView];
    id v5 = [v4 numberOfColumns];
    if (v5 == (id)[(MPLegacyRecentsTableViewCell *)self maximumColumnsWithAccessibility])
    {
      double v6 = [(MPLegacyRecentsTableViewCell *)self gridView];
      id v7 = [v6 numberOfRows];

      if (v7 == (id)3) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    v108 = v3;
    ((void (*)(void *))v3[2])(v3);
    v12 = [(PHTableViewCell *)self titleLabel];
    [v12 setNumberOfLines:0];

    double v13 = [(PHTableViewCell *)self subtitleLabel];
    [v13 setNumberOfLines:1];

    double v14 = [(PHTableViewCell *)self titleLabel];
    v127 = v14;
    double v15 = +[NSArray arrayWithObjects:&v127 count:1];
    double v16 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
    [v16 setArrangedSubviews:v15];

    double v17 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
    [v17 setAxis:0];

    double v18 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
    [v18 setAlignment:1];

    double v19 = [(PHTableViewCell *)self subtitleLabel];
    v126[0] = v19;
    double v20 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
    v126[1] = v20;
    objc_super v21 = +[NSArray arrayWithObjects:v126 count:2];
    v22 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    [v22 setArrangedSubviews:v21];

    v23 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    [v23 setAxis:0];

    double v24 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    [v24 setAlignment:1];

    callTypeIconView = self->_callTypeIconView;
    uint64_t v26 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
    v27 = (void *)v26;
    if (callTypeIconView)
    {
      v124[0] = v26;
      v105 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
      v124[1] = v105;
      v103 = +[NSArray arrayWithObjects:v124 count:2];
      v125[0] = v103;
      v28 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v123[0] = v28;
      double v29 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v123[1] = v29;
      double v30 = +[NSArray arrayWithObjects:v123 count:2];
      v125[1] = v30;
      double v31 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
      v122[0] = v31;
      double v32 = [(MPLegacyRecentsTableViewCell *)self callTypeIconView];
      v122[1] = v32;
      v33 = +[NSArray arrayWithObjects:v122 count:2];
      v125[2] = v33;
      v34 = +[NSArray arrayWithObjects:v125 count:3];
      v35 = [(MPLegacyRecentsTableViewCell *)self gridView];
      [v35 setArrangedSubviewRows:v34];

      double v36 = [(MPLegacyRecentsTableViewCell *)self gridView];
      double v37 = [(MPLegacyRecentsTableViewCell *)self callTypeIconView];
      [v36 setAlignment:4 forView:v37 inAxis:0];

      v27 = [(MPLegacyRecentsTableViewCell *)self gridView];
      double v38 = [(MPLegacyRecentsTableViewCell *)self callTypeIconView];
      [v27 setAlignment:3 forView:v38 inAxis:1];
    }
    else
    {
      v120[0] = v26;
      double v38 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
      v120[1] = v38;
      v107 = +[NSArray arrayWithObjects:v120 count:2];
      v121[0] = v107;
      v104 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v119[0] = v104;
      v69 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v119[1] = v69;
      v70 = +[NSArray arrayWithObjects:v119 count:2];
      v121[1] = v70;
      v71 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
      v118[0] = v71;
      v72 = [(MPLegacyRecentsTableViewCell *)self callTypeIconSizingView];
      v118[1] = v72;
      v73 = +[NSArray arrayWithObjects:v118 count:2];
      v121[2] = v73;
      v74 = +[NSArray arrayWithObjects:v121 count:3];
      v75 = [(MPLegacyRecentsTableViewCell *)self gridView];
      [v75 setArrangedSubviewRows:v74];
    }
    v76 = [(MPLegacyRecentsTableViewCell *)self gridView];
    v77 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
    v78 = v76;
    uint64_t v79 = 1;
    goto LABEL_21;
  }
LABEL_4:
  if ([(MPLegacyRecentsTableViewCell *)self isAccessibilityConstraintsEnabled]) {
    goto LABEL_22;
  }
  double v8 = [(MPLegacyRecentsTableViewCell *)self gridView];
  id v9 = [v8 numberOfColumns];
  if (v9 != (id)[(MPLegacyRecentsTableViewCell *)self maximumColumnsWithoutAccessibility])
  {

    goto LABEL_12;
  }
  unsigned int v10 = [(MPLegacyRecentsTableViewCell *)self gridView];
  id v11 = [v10 numberOfRows];

  if (v11 != (id)2)
  {
LABEL_12:
    v108 = v3;
    ((void (*)(void *))v3[2])(v3);
    double v39 = [(MPLegacyRecentsTableViewCell *)self traitCollection];
    if ([v39 preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells]) {
      uint64_t v40 = 0;
    }
    else {
      uint64_t v40 = 2;
    }
    v41 = [(PHTableViewCell *)self titleLabel];
    [v41 setNumberOfLines:v40];

    v42 = [(PHTableViewCell *)self subtitleLabel];
    [v42 setNumberOfLines:1];

    v43 = [(PHTableViewCell *)self titleLabel];
    v117[0] = v43;
    v44 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
    v117[1] = v44;
    v45 = +[NSArray arrayWithObjects:v117 count:2];
    v46 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
    [v46 setArrangedSubviews:v45];

    v47 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
    [v47 setAxis:0];

    v48 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
    [v48 setAlignment:5];

    unsigned __int8 v49 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
    double v50 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
    [v49 setAlignment:4 forView:v50 inAxis:0];

    v51 = [(PHTableViewCell *)self subtitleLabel];
    v116 = v51;
    v52 = +[NSArray arrayWithObjects:&v116 count:1];
    objc_super v53 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    [v53 setArrangedSubviews:v52];

    v54 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    [v54 setAxis:0];

    v55 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    [v55 setAlignment:1];

    if (self->_callTypeIconView)
    {
      v106 = [(MPLegacyRecentsTableViewCell *)self callTypeIconView];
      v114[0] = v106;
      v56 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
      v114[1] = v56;
      v57 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
      v114[2] = v57;
      v58 = +[NSArray arrayWithObjects:v114 count:3];
      v115[0] = v58;
      v59 = [(MPLegacyRecentsTableViewCell *)self callTypeIconSizingView];
      v113[0] = v59;
      v60 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v113[1] = v60;
      v61 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
      v113[2] = v61;
      v62 = +[NSArray arrayWithObjects:v113 count:3];
      v115[1] = v62;
      v63 = +[NSArray arrayWithObjects:v115 count:2];
      v64 = [(MPLegacyRecentsTableViewCell *)self gridView];
      [v64 setArrangedSubviewRows:v63];

      v65 = [(MPLegacyRecentsTableViewCell *)self gridView];
      v66 = [(MPLegacyRecentsTableViewCell *)self callTypeIconView];
      [v65 setAlignment:3 forView:v66 inAxis:0];

      v67 = [(MPLegacyRecentsTableViewCell *)self gridView];
      v68 = [(MPLegacyRecentsTableViewCell *)self callTypeIconView];
      [v67 setAlignment:3 forView:v68 inAxis:1];
    }
    else
    {
      v67 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
      v111[0] = v67;
      v68 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
      v111[1] = v68;
      v80 = +[NSArray arrayWithObjects:v111 count:2];
      v112[0] = v80;
      v81 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v110[0] = v81;
      v82 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
      v110[1] = v82;
      v83 = +[NSArray arrayWithObjects:v110 count:2];
      v112[1] = v83;
      v84 = +[NSArray arrayWithObjects:v112 count:2];
      v85 = [(MPLegacyRecentsTableViewCell *)self gridView];
      [v85 setArrangedSubviewRows:v84];
    }
    v76 = [(MPLegacyRecentsTableViewCell *)self gridView];
    v77 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
    v78 = v76;
    uint64_t v79 = 4;
LABEL_21:
    [v78 setAlignment:v79 forView:v77 inAxis:0];

    v86 = [(MPLegacyRecentsTableViewCell *)self gridView];
    v87 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
    [v86 setAlignment:3 forView:v87 inAxis:1];
    double v3 = v108;
  }
LABEL_22:
  if (self->_outgoingIndicator)
  {
    v88 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    v89 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
    [v88 insertArrangedSubview:v89 atIndex:0];

    v90 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    v91 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
    [v90 setAlignment:3 forView:v91 inAxis:0];

    v92 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    v93 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
    [v92 setAlignment:3 forView:v93 inAxis:1];

    v94 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
    LODWORD(v95) = 1148846080;
    [v94 setContentHuggingPriority:0 forAxis:v95];

    v96 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
    LODWORD(v97) = 1148846080;
    [v96 setContentHuggingPriority:1 forAxis:v97];

    v98 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
    LODWORD(v99) = 1148846080;
    [v98 setContentCompressionResistancePriority:0 forAxis:v99];

    v100 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
    LODWORD(v101) = 1148846080;
    [v100 setContentCompressionResistancePriority:1 forAxis:v101];

    v102 = [(MPLegacyRecentsTableViewCell *)self gridView];
    [v102 setNeedsLayout];
  }
}

- (UIImageView)outgoingIndicator
{
  return self->_outgoingIndicator;
}

- (NUIContainerStackView)subtitleStackView
{
  return self->_subtitleStackView;
}

- (NUIContainerGridView)gridView
{
  return self->_gridView;
}

- (BOOL)isAccessibilityConstraintsEnabled
{
  v2 = [(MPLegacyRecentsTableViewCell *)self traitCollection];
  unsigned __int8 v3 = [v2 isPreferredContentSizeCategoryAccessible];

  return v3;
}

- (UIDateLabel)callerDateLabel
{
  return self->_callerDateLabel;
}

- (NUIContainerStackView)titleStackView
{
  return self->_titleStackView;
}

- (int64_t)maximumColumnsWithoutAccessibility
{
  return self->_maximumColumnsWithoutAccessibility;
}

- (void)configureWithRecentsItem:(id)a3 recentCall:(id)a4
{
  id v27 = a4;
  [(MPLegacyRecentsTableViewCell *)self setItem:a3];
  unsigned int v6 = [v27 callStatus];
  int v7 = kCHCallStatusMissed;
  if (v6 == kCHCallStatusMissed)
  {
    double v8 = +[UIColor systemRedColor];
    id v9 = [(MPLegacyRecentsTableViewCell *)self _accessibilityHigherContrastTintColorForColor:v8];
  }
  else
  {
    id v9 = +[UIColor dynamicLabelColor];
  }
  -[MPLegacyRecentsTableViewCell setIsMissedCall:](self, "setIsMissedCall:", [v27 callStatus] == v7);
  unsigned int v10 = [(PHTableViewCell *)self titleLabel];
  [v10 setTextColor:v9];

  [(MPLegacyRecentsTableViewCell *)self updateTextColor];
  if ([(MPLegacyRecentsTableViewCell *)self isAccessibilityConstraintsEnabled]) {
    [(PHTableViewCell *)self subtitleLabel];
  }
  else {
  id v11 = [(PHTableViewCell *)self titleLabel];
  }
  v12 = [v11 textColor];
  double v13 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
  [v13 setTextColor:v12];

  if ([(MPLegacyRecentsTableViewCell *)self tapTargets])
  {
    id v14 = [v27 mediaType];
    if (v14 == (id)2)
    {
      CFStringRef v15 = @"video.fill";
    }
    else
    {
      if (v14 != (id)1)
      {
        if (!v14) {
          [(MPLegacyRecentsTableViewCell *)self setCallButtonImage:0];
        }
LABEL_15:
        double v17 = [(MPLegacyRecentsTableViewCell *)self callButtonImage];

        if (!v17) {
          goto LABEL_22;
        }
        double v18 = [(MPLegacyRecentsTableViewCell *)self callButton];
        double v19 = [(MPLegacyRecentsTableViewCell *)self callButtonImage];
        [v18 configureForImage:v19];

        double v20 = [(MPLegacyRecentsTableViewCell *)self callButton];
        [v20 bounds];
        if (v21 < 1.0)
        {
        }
        else
        {
          v22 = [(MPLegacyRecentsTableViewCell *)self callButton];
          [v22 bounds];
          double v24 = v23;

          if (v24 >= 1.0) {
            goto LABEL_21;
          }
        }
        double v25 = [(MPLegacyRecentsTableViewCell *)self callButton];
        [v25 sizeToFit];

LABEL_21:
        uint64_t v26 = [(MPLegacyRecentsTableViewCell *)self callButton];
        [(MPLegacyRecentsTableViewCell *)self setAccessoryView:v26];

        goto LABEL_22;
      }
      CFStringRef v15 = @"phone.fill";
    }
    double v16 = +[UIImage systemImageNamed:v15];
    [(MPLegacyRecentsTableViewCell *)self setCallButtonImage:v16];

    goto LABEL_15;
  }
LABEL_22:
}

+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  double result = 12.0;
  if (IsAccessibilityCategory) {
    return 0.0;
  }
  return result;
}

- (void)updateTextColor
{
  unsigned __int8 v3 = +[UIColor dynamicSecondaryLabelColor];
  double v4 = [(MPLegacyRecentsTableViewCell *)self _accessibilityHigherContrastTintColorForColor:v3];
  id v5 = [(PHTableViewCell *)self subtitleLabel];
  [v5 setTextColor:v4];

  id v8 = +[UIColor dynamicSecondaryLabelColor];
  unsigned int v6 = [(MPLegacyRecentsTableViewCell *)self _accessibilityHigherContrastTintColorForColor:v8];
  int v7 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
  [v7 setTextColor:v6];
}

- (void)setItem:(id)a3
{
  v113 = (PHRecentsItem *)a3;
  if (self->_item != v113)
  {
    objc_storeStrong((id *)&self->_item, a3);
    id v5 = [(PHRecentsItem *)v113 localizedCount];
    unsigned int v6 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
    [v6 setText:v5];

    int v7 = [(PHRecentsItem *)v113 date];
    id v8 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
    [v8 setDate:v7];

    id v9 = [(PHRecentsItem *)v113 localizedSubtitle];
    unsigned int v10 = [(PHTableViewCell *)self subtitleLabel];
    [v10 setText:v9];

    id v11 = [(PHRecentsItem *)v113 localizedValidHandlesTitle];
    v12 = [(PHTableViewCell *)self titleLabel];
    [v12 setText:v11];

    if (![(MPLegacyRecentsTableViewCell *)self isAccessibilityConstraintsEnabled])
    {
      double v13 = [(PHRecentsItem *)v113 localizedCount];
      id v14 = [v13 length];

      if (v14)
      {
        uint64_t v15 = [(PHRecentsItem *)v113 localizedValidHandlesTitle];
        double v16 = [(PHRecentsItem *)v113 localizedCount];
        double v17 = +[NSString stringWithFormat:@"%@ %@", v15, v16];
        double v18 = [(PHTableViewCell *)self titleLabel];
        [v18 setText:v17];

        double v19 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
        [v19 setText:0];

        double v20 = [(MPLegacyRecentsTableViewCell *)self traitCollection];
        LOBYTE(v15) = [v20 preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells];

        if ((v15 & 1) == 0)
        {
          double v21 = [(PHTableViewCell *)self titleLabel];
          [v21 setLineBreakMode:5];
        }
      }
    }
    callTypeIconView = self->_callTypeIconView;
    double v23 = [(PHRecentsItem *)v113 image];

    if (callTypeIconView)
    {
      if (v23)
      {
        double v24 = [(PHRecentsItem *)v113 image];
        double v25 = [(MPLegacyRecentsTableViewCell *)self callTypeIconView];
        [v25 setImage:v24];

        uint64_t v26 = [(MPLegacyRecentsTableViewCell *)self callTypeIconView];
LABEL_11:
        double v29 = v26;
        uint64_t v30 = 0;
LABEL_15:
        [v26 setHidden:v30];

        goto LABEL_16;
      }
      uint64_t v26 = [(MPLegacyRecentsTableViewCell *)self callTypeIconView];
    }
    else
    {
      if (v23)
      {
        id v27 = [(PHRecentsItem *)v113 image];
        v28 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
        [v28 setImage:v27];

        uint64_t v26 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
        goto LABEL_11;
      }
      uint64_t v26 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
    }
    double v29 = v26;
    uint64_t v30 = 1;
    goto LABEL_15;
  }
LABEL_16:
  double v31 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
  double v32 = [v31 text];
  id v33 = [v32 length];

  v34 = v113;
  if (v33)
  {
    v35 = [(PHRecentsItem *)v113 localizedCount];
    double v36 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
    [v36 setText:v35];

    v34 = v113;
  }
  unsigned __int8 v37 = [(PHRecentsItem *)v34 verified];
  double v38 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
  double v39 = v38;
  if (v37)
  {

    if (!v39)
    {
      id v40 = objc_alloc((Class)UIImageView);
      v41 = +[UIImage recentsVerifiedCheckmarkImage];
      id v42 = [v40 initWithImage:v41];
      [(MPLegacyRecentsTableViewCell *)self setVerifiedBadgeView:v42];

      v43 = +[UIColor dynamicTertiaryLabelColor];
      v44 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
      [v44 setTintColor:v43];
    }
    v45 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    v46 = [v45 arrangedSubviews];
    v47 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
    unsigned __int8 v48 = [v46 containsObject:v47];

    if ((v48 & 1) == 0)
    {
      unsigned __int8 v49 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      double v50 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
      v51 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v52 = [v51 arrangedSubviews];
      objc_super v53 = [(PHTableViewCell *)self subtitleLabel];
      [v49 insertArrangedSubview:v50 atIndex:[v52 indexOfObject:v53]];

      v54 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v55 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
      [v54 setAlignment:3 forView:v55 inAxis:1];

      v56 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
      LODWORD(v57) = 1148846080;
      [v56 setContentHuggingPriority:1 forAxis:v57];

      v58 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
      LODWORD(v59) = 1148846080;
      [v58 setContentHuggingPriority:0 forAxis:v59];

      v60 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
      LODWORD(v61) = 1148846080;
      [v60 setContentCompressionResistancePriority:1 forAxis:v61];

      v62 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
      LODWORD(v63) = 1148846080;
      [v62 setContentCompressionResistancePriority:0 forAxis:v63];

      v64 = [(MPLegacyRecentsTableViewCell *)self gridView];
      [v64 setNeedsLayout];
    }
  }
  else if (v38)
  {
    v65 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    v66 = [v65 arrangedSubviews];
    v67 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
    unsigned int v68 = [v66 containsObject:v67];

    if (v68)
    {
      v69 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v70 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
      [v69 removeArrangedSubview:v70];

      v71 = [(MPLegacyRecentsTableViewCell *)self verifiedBadgeView];
      [v71 removeFromSuperview];

      [(MPLegacyRecentsTableViewCell *)self setVerifiedBadgeView:0];
    }
  }
  v72 = [(PHRecentsItem *)v113 localizedSenderIdentityTitle];
  id v73 = [v72 length];

  if (v73)
  {
    v74 = [(MPLegacyRecentsTableViewCell *)self badgeView];

    if (v74)
    {
      v75 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      v76 = [(PHRecentsItem *)v113 localizedSenderIdentityTitle];
      [v75 setTitle:v76];
    }
    else
    {
      id v84 = objc_alloc((Class)TPBadgeView);
      v85 = [(PHRecentsItem *)v113 localizedSenderIdentityTitle];
      id v86 = [v84 initWithTitle:v85];
      [(MPLegacyRecentsTableViewCell *)self setBadgeView:v86];

      v75 = +[UIColor dynamicTertiaryLabelColor];
      v76 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      [v76 setTintColor:v75];
    }

    v87 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    v88 = [v87 arrangedSubviews];
    v89 = [(MPLegacyRecentsTableViewCell *)self badgeView];
    unsigned __int8 v90 = [v88 containsObject:v89];

    if ((v90 & 1) == 0)
    {
      v91 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v92 = [v91 arrangedSubviews];
      v93 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
      unsigned int v94 = [v92 containsObject:v93];

      double v95 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v96 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      if (v94)
      {
        double v97 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
        v98 = [v97 arrangedSubviews];
        double v99 = [(MPLegacyRecentsTableViewCell *)self outgoingIndicator];
        [v95 insertArrangedSubview:v96 atIndex:[v98 indexOfObject:v99] + 1];
      }
      else
      {
        [v95 insertArrangedSubview:v96 atIndex:0];
      }

      v100 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      double v101 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      [v100 setAlignment:3 forView:v101 inAxis:0];

      v102 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v103 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      [v102 setAlignment:3 forView:v103 inAxis:1];

      v104 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      LODWORD(v105) = 1148846080;
      [v104 setContentHuggingPriority:1 forAxis:v105];

      v106 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      LODWORD(v107) = 1148846080;
      [v106 setContentHuggingPriority:0 forAxis:v107];

      v108 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      LODWORD(v109) = 1148846080;
      [v108 setContentCompressionResistancePriority:1 forAxis:v109];

      v110 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      LODWORD(v111) = 1148846080;
      [v110 setContentCompressionResistancePriority:0 forAxis:v111];

      v112 = [(MPLegacyRecentsTableViewCell *)self gridView];
      [v112 setNeedsLayout];
    }
  }
  else
  {
    v77 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
    v78 = [v77 arrangedSubviews];
    uint64_t v79 = [(MPLegacyRecentsTableViewCell *)self badgeView];
    unsigned int v80 = [v78 containsObject:v79];

    if (v80)
    {
      v81 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
      v82 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      [v81 removeArrangedSubview:v82];

      v83 = [(MPLegacyRecentsTableViewCell *)self badgeView];
      [v83 removeFromSuperview];

      [(MPLegacyRecentsTableViewCell *)self setBadgeView:0];
    }
  }
}

- (UILabel)callerCountLabel
{
  return self->_callerCountLabel;
}

- (UIImageView)verifiedBadgeView
{
  return self->_verifiedBadgeView;
}

- (void)setIsMissedCall:(BOOL)a3
{
  self->_isMissedCall = a3;
}

- (TPBadgeView)badgeView
{
  return self->_badgeView;
}

void __65__MPLegacyRecentsTableViewCell_configureGridViewArrangedSubviews__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) gridView];
  [v2 setArrangedSubviewRows:&__NSArray0__struct];

  unsigned __int8 v3 = [*(id *)(a1 + 32) titleStackView];
  [v3 setArrangedSubviews:&__NSArray0__struct];

  id v4 = [*(id *)(a1 + 32) subtitleStackView];
  [v4 setArrangedSubviews:&__NSArray0__struct];
}

- (void)updateFonts
{
  unsigned __int8 v3 = +[UIFont telephonyUIBodyShortEmphasizedFont];
  id v4 = [(PHTableViewCell *)self titleLabel];
  [v4 setFont:v3];

  id v5 = +[UIFont telephonyUISubheadlineShortFont];
  unsigned int v6 = [(PHTableViewCell *)self subtitleLabel];
  [v6 setFont:v5];

  int v7 = [(PHTableViewCell *)self subtitleLabel];
  id v8 = [v7 font];
  id v9 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
  [v9 setFont:v8];

  double v10 = NUIContainerViewLengthUseDefault;
  id v11 = [(PHTableViewCell *)self subtitleLabel];
  [v11 setCustomBaselineOffsetFromBottom:v10];

  [(MPLegacyRecentsTableViewCell *)self effectiveBaselineOffsetFromBottom];
  double v13 = v12;
  id v14 = [(PHTableViewCell *)self subtitleLabel];
  [v14 setCustomBaselineOffsetFromBottom:v13];

  if ([(MPLegacyRecentsTableViewCell *)self isAccessibilityConstraintsEnabled]) {
    [(PHTableViewCell *)self subtitleLabel];
  }
  else {
  uint64_t v15 = [(PHTableViewCell *)self titleLabel];
  }
  double v16 = [v15 font];
  double v17 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
  [v17 setFont:v16];

  [(MPLegacyRecentsTableViewCell *)self updateTextColor];
}

- (void)setMaximumColumnsWithoutAccessibility:(int64_t)a3
{
  self->_maximumColumnsWithoutAccessibilitdouble y = a3;
}

- (void)setMaximumColumnsWithAccessibility:(int64_t)a3
{
  self->_maximumColumnsWithAccessibilitdouble y = a3;
}

+ (double)largestCallTypeIconWidth
{
  v2 = +[UIImage recentsOutgoingAudioCallGlyphImage];
  v20[0] = v2;
  unsigned __int8 v3 = +[UIImage recentsOutgoingVideoCallGlyphImage];
  v20[1] = v3;
  id v4 = +[UIImage recentsTTYRelayGlyphImage];
  v20[2] = v4;
  id v5 = +[UIImage recentsTTYDirectGlyphImage];
  v20[3] = v5;
  unsigned int v6 = +[NSArray arrayWithObjects:v20 count:4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    double v11 = 0.0;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) size:v15];
        if (v11 < v13) {
          double v11 = v13;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (void)updateRootView
{
  unsigned __int8 v3 = [(MPLegacyRecentsTableViewCell *)self avatarViewController];

  if (v3)
  {
    id v4 = [(MPLegacyRecentsTableViewCell *)self avatarViewController];
    id v5 = [v4 view];
    [v5 setMinimumLayoutSize:45.0, 45.0];

    unsigned int v6 = [(MPLegacyRecentsTableViewCell *)self avatarViewController];
    id v7 = [v6 view];
    [v7 setMaximumLayoutSize:45.0, 45.0];

    id v8 = [(MPLegacyRecentsTableViewCell *)self avatarViewController];
    id v9 = [v8 view];

    LODWORD(v10) = 1148846080;
    [v9 setContentCompressionResistancePriority:0 forAxis:v10];
    LODWORD(v11) = 1148846080;
    [v9 setContentCompressionResistancePriority:1 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [v9 setContentHuggingPriority:0 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [v9 setContentHuggingPriority:1 forAxis:v13];
    id v14 = [(MPLegacyRecentsTableViewCell *)self gridView];
    double v19 = v9;
    long long v15 = +[NSArray arrayWithObjects:&v19 count:1];
    id v16 = [v14 insertColumnAtIndex:0 withArrangedSubviews:v15];

    long long v17 = [(MPLegacyRecentsTableViewCell *)self gridView];
    [v17 setAlignment:1 forView:v9 inAxis:0];

    long long v18 = [(MPLegacyRecentsTableViewCell *)self gridView];
    [v18 setAlignment:3 forView:v9 inAxis:1];

    [(MPLegacyRecentsTableViewCell *)self setPreservesSuperviewLayoutMargins:1];
  }
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setTapTargets:(BOOL)a3
{
  if (self->_tapTargets != a3)
  {
    self->_tapTargets = a3;
    if (a3)
    {
      id v4 = [(MPLegacyRecentsTableViewCell *)self callButton];

      if (!v4)
      {
        id v5 = (TPAccessoryButton *)objc_alloc_init((Class)TPAccessoryButton);
        callButton = self->_callButton;
        self->_callButton = v5;

        id v7 = self->_callButton;
        [(TPAccessoryButton *)v7 addTarget:self action:"callButtonTapped:" forControlEvents:64];
      }
    }
    else
    {
      [(MPLegacyRecentsTableViewCell *)self setAccessoryView:0];
    }
  }
}

- (void)setAvatarViewController:(id)a3
{
  id v5 = (CNAvatarViewController *)a3;
  p_avatarViewController = &self->_avatarViewController;
  if (self->_avatarViewController != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_avatarViewController, a3);
    [(MPLegacyRecentsTableViewCell *)self updateRootView];
    p_avatarViewController = (CNAvatarViewController **)[(MPLegacyRecentsTableViewCell *)self configureGridViewArrangedSubviews];
    id v5 = v7;
  }

  _objc_release_x1(p_avatarViewController, v5);
}

- (void)commonInit
{
  v4.receiver = self;
  v4.super_class = (Class)MPLegacyRecentsTableViewCell;
  [(PHTableViewCell *)&v4 commonInit];
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3 isEditing:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v6 = (NSString *)a3;
  id v7 = objc_alloc_init((Class)TUFeatureFlags);
  if ([v7 phoneRecentsAvatarsEnabled])
  {
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v6);
    double v9 = 55.0;
    if (IsAccessibilityCategory) {
      double v9 = 0.0;
    }
  }
  else
  {
    [a1 callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:v6];
    double v11 = v10;
    [a1 callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant:v6];
    double v13 = v11 + v12;
    [a1 titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:v6];
    double v9 = v13 + v14;
  }
  if (v4) {
    double v15 = v9 + 50.0;
  }
  else {
    double v15 = v9;
  }

  double v16 = 0.0;
  double v17 = 0.0;
  double v18 = 0.0;
  double v19 = v15;
  result.right = v18;
  result.bottom = v17;
  result.left = v19;
  result.top = v16;
  return result;
}

+ (double)leftTitleSeparatorInsetForContentSizeCategory:(id)a3
{
  id v4 = a3;
  [a1 callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:v4];
  double v6 = v5;
  [a1 callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant:v4];
  double v8 = v6 + v7;
  [a1 titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:v4];
  double v10 = v9;

  return v8 + v10;
}

- (void)updateFontsAndLayoutMetrics
{
  v10.receiver = self;
  v10.super_class = (Class)MPLegacyRecentsTableViewCell;
  [(PHTableViewCell *)&v10 updateFontsAndLayoutMetrics];
  unsigned __int8 v3 = [(PHTableViewCell *)self subtitleLabel];
  id v4 = [v3 font];
  double v5 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
  [v5 setFont:v4];

  [(id)objc_opt_class() largestCallTypeIconWidth];
  double v7 = v6;
  double v8 = [(MPLegacyRecentsTableViewCell *)self callTypeIconSizingView];
  [v8 setMinimumLayoutSize:v7, 1.0];

  double v9 = [(MPLegacyRecentsTableViewCell *)self callTypeIconSizingView];
  [v9 setMaximumLayoutSize:v7, 1.0];

  [(MPLegacyRecentsTableViewCell *)self configureGridViewArrangedSubviews];
  [(MPLegacyRecentsTableViewCell *)self updateFonts];
}

- (void)updateDateLabelAlignment
{
  unsigned int v3 = [(MPLegacyRecentsTableViewCell *)self isAccessibilityConstraintsEnabled];
  id v4 = [(MPLegacyRecentsTableViewCell *)self gridView];
  double v5 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
  if (v3) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 3;
  }
  [v4 setAlignment:v6 forView:v5 inAxis:1];

  id v8 = [(MPLegacyRecentsTableViewCell *)self gridView];
  double v7 = [(MPLegacyRecentsTableViewCell *)self callerDateLabel];
  [v8 setAlignment:1 forView:v7 inAxis:0];
}

- (void)enableCallButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MPLegacyRecentsTableViewCell *)self callButton];
  [v4 setEnabled:v3];
}

- (void)configureCellForHighlightingWithText:(id)a3
{
  id v26 = a3;
  if ([(MPLegacyRecentsTableViewCell *)self isMissedCall])
  {
    double v25 = [(PHTableViewCell *)self titleLabel];
    id v4 = [v25 text];
    double v5 = [(PHTableViewCell *)self titleLabel];
    uint64_t v6 = [v5 textColor];
    double v7 = [v6 colorWithAlphaComponent:0.6];
    id v8 = [(PHTableViewCell *)self titleLabel];
    double v9 = [v8 textColor];
    objc_super v10 = [v9 colorWithAlphaComponent:1.0];
    double v11 = [v4 attributedStringToHighlightText:v26 primaryColour:v7 secondaryColour:v10];
    double v12 = [(PHTableViewCell *)self titleLabel];
    [v12 setAttributedText:v11];

    double v13 = [(PHTableViewCell *)self titleLabel];
    double v14 = [v13 textColor];
    double v15 = [v14 colorWithAlphaComponent:0.6];
    double v16 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
    [v16 setTextColor:v15];
  }
  else
  {
    double v17 = +[UIColor secondaryLabelColor];
    double v18 = [(PHTableViewCell *)self titleLabel];
    [v18 setTextColor:v17];

    double v19 = +[UIColor secondaryLabelColor];
    double v20 = [(MPLegacyRecentsTableViewCell *)self callerCountLabel];
    [v20 setTextColor:v19];

    double v13 = [(PHTableViewCell *)self titleLabel];
    double v14 = [v13 text];
    double v15 = [v14 attributedStringToHighlightText:v26];
    double v16 = [(PHTableViewCell *)self titleLabel];
    [v16 setAttributedText:v15];
  }

  double v21 = [(PHTableViewCell *)self subtitleLabel];
  v22 = [v21 text];
  double v23 = [v22 attributedStringToHighlightText:v26];
  double v24 = [(PHTableViewCell *)self subtitleLabel];
  [v24 setAttributedText:v23];
}

- (void)callButtonTapped:(id)a3
{
  id v4 = [(MPLegacyRecentsTableViewCell *)self callButtonTappedHandler];

  if (v4)
  {
    double v5 = [(MPLegacyRecentsTableViewCell *)self callButtonTappedHandler];
    v5[2]();
  }
}

- (void)setCallButtonTappedHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id callButtonTappedHandler = self->_callButtonTappedHandler;
  self->_id callButtonTappedHandler = v4;

  _objc_release_x1(v4, callButtonTappedHandler);
}

- (void)showContainerViewDebugBoundingBox
{
  BOOL v3 = [(MPLegacyRecentsTableViewCell *)self gridView];
  [v3 setDebugBoundingBoxesEnabled:1];

  id v4 = [(MPLegacyRecentsTableViewCell *)self titleStackView];
  [v4 setDebugBoundingBoxesEnabled:1];

  id v5 = [(MPLegacyRecentsTableViewCell *)self subtitleStackView];
  [v5 setDebugBoundingBoxesEnabled:1];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MPLegacyRecentsTableViewCell;
  [(MPLegacyRecentsTableViewCell *)&v3 prepareForReuse];
  [(MPLegacyRecentsTableViewCell *)self configureGridViewArrangedSubviews];
}

- (double)titleLabelLeadingAnchorLayoutConstraintConstant
{
  objc_super v3 = objc_opt_class();
  id v4 = [(MPLegacyRecentsTableViewCell *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];
  [v3 titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:v5];
  double v7 = v6;

  return v7;
}

- (double)callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstant
{
  objc_super v3 = objc_opt_class();
  id v4 = [(MPLegacyRecentsTableViewCell *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];
  [v3 callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:v5];
  double v7 = v6;

  return v7;
}

+ (double)callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant:(id)a3
{
  objc_super v3 = (NSString *)a3;
  [(id)objc_opt_class() largestCallTypeIconWidth];
  double v5 = v4;
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  double result = 0.0;
  if (!IsAccessibilityCategory) {
    return v5;
  }
  return result;
}

+ (double)callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  double result = 10.0;
  if (IsAccessibilityCategory) {
    return 15.0;
  }
  return result;
}

- (PHRecentsItem)item
{
  return self->_item;
}

- (id)callButtonTappedHandler
{
  return self->_callButtonTappedHandler;
}

- (UIImageView)callTypeIconView
{
  return self->_callTypeIconView;
}

- (int64_t)callerDateColumnIndex
{
  return self->_callerDateColumnIndex;
}

- (void)setCallerDateColumnIndex:(int64_t)a3
{
  self->_callerDateColumnIndex = a3;
}

- (BOOL)hasCallTypeIcon
{
  return self->_hasCallTypeIcon;
}

- (void)setHasCallTypeIcon:(BOOL)a3
{
  self->_hasCallTypeIcon = a3;
}

- (BOOL)isMissedCall
{
  return self->_isMissedCall;
}

- (void)setBadgeView:(id)a3
{
}

- (UIView)callTypeIconSizingView
{
  return self->_callTypeIconSizingView;
}

- (void)setCallTypeIconSizingView:(id)a3
{
}

- (void)setVerifiedBadgeView:(id)a3
{
}

- (void)setTitleStackView:(id)a3
{
}

- (void)setSubtitleStackView:(id)a3
{
}

- (void)setGridView:(id)a3
{
}

- (TPAccessoryButton)callButton
{
  return self->_callButton;
}

- (void)setCallButton:(id)a3
{
}

- (UIImage)callButtonImage
{
  return self->_callButtonImage;
}

- (void)setCallButtonImage:(id)a3
{
}

- (int64_t)maximumColumnsWithAccessibility
{
  return self->_maximumColumnsWithAccessibility;
}

- (int64_t)callButtonColumnWithoutAccessibility
{
  return self->_callButtonColumnWithoutAccessibility;
}

- (void)setCallButtonColumnWithoutAccessibility:(int64_t)a3
{
  self->_callButtonColumnWithoutAccessibilitdouble y = a3;
}

- (int64_t)callButtonColumnWithAccessibility
{
  return self->_callButtonColumnWithAccessibility;
}

- (void)setCallButtonColumnWithAccessibility:(int64_t)a3
{
  self->_callButtonColumnWithAccessibilitdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callButtonImage, 0);
  objc_storeStrong((id *)&self->_callButton, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_subtitleStackView, 0);
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_outgoingIndicator, 0);
  objc_storeStrong((id *)&self->_verifiedBadgeView, 0);
  objc_storeStrong((id *)&self->_callTypeIconSizingView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_callTypeIconView, 0);
  objc_storeStrong((id *)&self->_callerDateLabel, 0);
  objc_storeStrong((id *)&self->_callerCountLabel, 0);
  objc_storeStrong(&self->_callButtonTappedHandler, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end