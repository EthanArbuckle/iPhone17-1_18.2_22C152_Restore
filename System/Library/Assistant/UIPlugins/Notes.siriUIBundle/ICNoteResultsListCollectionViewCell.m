@interface ICNoteResultsListCollectionViewCell
- (BOOL)hidesThumbnail;
- (BOOL)isAXSize;
- (BOOL)isAccessibilityElement;
- (BOOL)isInSplitView;
- (BOOL)isLargerThanAXLarge;
- (BOOL)isPinDropTarget;
- (BOOL)isThumbnailPresent;
- (CGRect)estimatedBoundsForLabel:(id)a3;
- (CGSize)currentThumbnailSize;
- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate;
- (ICNoteResultsListCollectionViewCell)initWithFrame:(CGRect)a3;
- (ICThumbnailKey)currentThumbnailConfigurationUniqueKey;
- (NSArray)bottomThumbnailConstraints;
- (NSArray)trailingThumbnailConstraints;
- (NSLayoutConstraint)secondaryStatusIndicatorCenterYAXConstraint;
- (NSLayoutConstraint)secondaryStatusIndicatorCenterYNormalConstraint;
- (NSLayoutConstraint)separatorLeadingConstraint;
- (NSLayoutConstraint)verticalStackViewBottomConstraint;
- (NSLayoutConstraint)verticalStackViewLeadingConstraint;
- (NSLayoutConstraint)verticalStackViewTopConstraint;
- (NSLayoutConstraint)verticalStackViewTrailingConstraint;
- (UIColor)primaryLabelColor;
- (UIColor)secondaryLabelColor;
- (UIImageView)folderLabelImageView;
- (UIImageView)secondaryStatusIndicatorImageView;
- (UIImageView)statusIndicatorImageView;
- (UIImageView)thumbnailImageView;
- (UILabel)dateLabel;
- (UILabel)folderAndAccountLabel;
- (UILabel)participantsLabel;
- (UILabel)summaryLabel;
- (UILabel)titleLabel;
- (UIStackView)folderStackView;
- (UIStackView)verticalStackView;
- (double)verticalPadding;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)createLabel;
- (int64_t)currentThumbnailLocation;
- (unint64_t)accessibilityTraits;
- (unint64_t)numberOfLines;
- (void)addNotificationObservers;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)enableIntrinsicSizeShortcut:(BOOL)a3;
- (void)registerForTraitChanges;
- (void)removeNotificationObservers;
- (void)resetColors;
- (void)setAccessibilityCustomActionsDelegate:(id)a3;
- (void)setBottomThumbnailConstraints:(id)a3;
- (void)setConfiguration:(id)a3 synchronously:(BOOL)a4;
- (void)setCurrentThumbnailConfigurationUniqueKey:(id)a3;
- (void)setCurrentThumbnailLocation:(int64_t)a3;
- (void)setCurrentThumbnailSize:(CGSize)a3;
- (void)setDateLabel:(id)a3;
- (void)setFolderAndAccountLabel:(id)a3;
- (void)setFolderLabelImageView:(id)a3;
- (void)setFolderStackView:(id)a3;
- (void)setHidesThumbnail:(BOOL)a3;
- (void)setIsAXSize:(BOOL)a3;
- (void)setIsInSplitView:(BOOL)a3;
- (void)setIsLargerThanAXLarge:(BOOL)a3;
- (void)setIsThumbnailPresent:(BOOL)a3;
- (void)setParticipantsLabel:(id)a3;
- (void)setPinDropTarget:(BOOL)a3;
- (void)setPrimaryLabelColor:(id)a3;
- (void)setSecondaryLabelColor:(id)a3;
- (void)setSecondaryStatusIndicatorCenterYAXConstraint:(id)a3;
- (void)setSecondaryStatusIndicatorCenterYNormalConstraint:(id)a3;
- (void)setSecondaryStatusIndicatorImageView:(id)a3;
- (void)setSeparatorLeadingConstraint:(id)a3;
- (void)setStatusIndicatorImageView:(id)a3;
- (void)setSummaryLabel:(id)a3;
- (void)setThumbnailImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingThumbnailConstraints:(id)a3;
- (void)setVerticalStackView:(id)a3;
- (void)setVerticalStackViewBottomConstraint:(id)a3;
- (void)setVerticalStackViewLeadingConstraint:(id)a3;
- (void)setVerticalStackViewTopConstraint:(id)a3;
- (void)setVerticalStackViewTrailingConstraint:(id)a3;
- (void)updateBackgroundConfigurationUsingState:(id)a3;
- (void)updateColorsUsingState:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
- (void)updateFromConfiguration;
- (void)updateLabelsFromConfiguration;
- (void)updateStatusIndicatorsUsingState:(id)a3;
- (void)updateThumbnailFromConfiguration;
- (void)updateViewStateProperties;
@end

@implementation ICNoteResultsListCollectionViewCell

- (ICNoteResultsListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v145.receiver = self;
  v145.super_class = (Class)ICNoteResultsListCollectionViewCell;
  v3 = -[ICBaseNoteResultsCollectionViewCell initWithFrame:](&v145, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  v6 = &selRef_textColor;
  if (v3)
  {
    [(ICNoteResultsListCollectionViewCell *)v3 setAutomaticallyUpdatesContentConfiguration:0];
    [(ICNoteResultsListCollectionViewCell *)v5 setAutomaticallyUpdatesBackgroundConfiguration:0];
    id v7 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v11 = (UIImageView *)objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    statusIndicatorImageView = v5->_statusIndicatorImageView;
    v5->_statusIndicatorImageView = v11;

    [(UIImageView *)v5->_statusIndicatorImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    secondaryStatusIndicatorImageView = v5->_secondaryStatusIndicatorImageView;
    v5->_secondaryStatusIndicatorImageView = v13;

    [(UIImageView *)v5->_secondaryStatusIndicatorImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICNoteResultsListCollectionViewCell *)v5 resetColors];
    uint64_t v15 = [(ICNoteResultsListCollectionViewCell *)v5 createLabel];
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v15;

    v17 = [(ICNoteResultsListCollectionViewCell *)v5 primaryLabelColor];
    [(UILabel *)v5->_titleLabel setTextColor:v17];

    uint64_t v18 = [(ICNoteResultsListCollectionViewCell *)v5 createLabel];
    dateLabel = v5->_dateLabel;
    v5->_dateLabel = (UILabel *)v18;

    v20 = [(ICNoteResultsListCollectionViewCell *)v5 secondaryLabelColor];
    [(UILabel *)v5->_dateLabel setTextColor:v20];

    uint64_t v21 = [(ICNoteResultsListCollectionViewCell *)v5 createLabel];
    summaryLabel = v5->_summaryLabel;
    v5->_summaryLabel = (UILabel *)v21;

    v23 = [(ICNoteResultsListCollectionViewCell *)v5 secondaryLabelColor];
    [(UILabel *)v5->_summaryLabel setTextColor:v23];

    uint64_t v24 = [(ICNoteResultsListCollectionViewCell *)v5 createLabel];
    participantsLabel = v5->_participantsLabel;
    v5->_participantsLabel = (UILabel *)v24;

    v26 = [(ICNoteResultsListCollectionViewCell *)v5 secondaryLabelColor];
    [(UILabel *)v5->_participantsLabel setTextColor:v26];

    uint64_t v27 = [(ICNoteResultsListCollectionViewCell *)v5 createLabel];
    folderAndAccountLabel = v5->_folderAndAccountLabel;
    v5->_folderAndAccountLabel = (UILabel *)v27;

    v29 = [(ICNoteResultsListCollectionViewCell *)v5 secondaryLabelColor];
    [(UILabel *)v5->_folderAndAccountLabel setTextColor:v29];

    v30 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    folderLabelImageView = v5->_folderLabelImageView;
    v5->_folderLabelImageView = v30;

    [(UIImageView *)v5->_folderLabelImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = [(UILabel *)v5->_folderAndAccountLabel textColor];
    [(UIImageView *)v5->_folderLabelImageView setTintColor:v32];

    [(UIImageView *)v5->_folderLabelImageView setContentMode:1];
    [(UIImageView *)v5->_folderLabelImageView setOpaque:1];
    LODWORD(v33) = 1148846080;
    [(UIImageView *)v5->_folderLabelImageView setContentCompressionResistancePriority:1 forAxis:v33];
    LODWORD(v34) = 1148846080;
    [(UIImageView *)v5->_folderLabelImageView setContentCompressionResistancePriority:0 forAxis:v34];
    LODWORD(v35) = 1148846080;
    [(UIImageView *)v5->_folderLabelImageView setContentHuggingPriority:1 forAxis:v35];
    LODWORD(v36) = 1148846080;
    [(UIImageView *)v5->_folderLabelImageView setContentHuggingPriority:0 forAxis:v36];
    id v37 = objc_alloc((Class)UIStackView);
    v151[0] = v5->_folderLabelImageView;
    v151[1] = v5->_folderAndAccountLabel;
    v38 = +[NSArray arrayWithObjects:v151 count:2];
    v39 = (UIStackView *)[v37 initWithArrangedSubviews:v38];
    folderStackView = v5->_folderStackView;
    v5->_folderStackView = v39;

    [(UIStackView *)v5->_folderStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v5->_folderStackView setAxis:0];
    [(UIStackView *)v5->_folderStackView setDistribution:0];
    v41 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    thumbnailImageView = v5->_thumbnailImageView;
    v5->_thumbnailImageView = v41;

    [(UIImageView *)v5->_thumbnailImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v43 = +[UIColor secondarySystemGroupedBackgroundColor];
    [(UIImageView *)v5->_thumbnailImageView setBackgroundColor:v43];

    v44 = +[UIColor tertiaryLabelColor];
    [(UIImageView *)v5->_thumbnailImageView setTintColor:v44];

    id v45 = +[UIColor quaternaryLabelColor];
    id v46 = [v45 CGColor];
    v47 = [(UIImageView *)v5->_thumbnailImageView layer];
    [v47 setBorderColor:v46];

    [(ICNoteResultsListCollectionViewCell *)v5 ic_hairlineWidth];
    double v49 = v48;
    v50 = [(UIImageView *)v5->_thumbnailImageView layer];
    [v50 setBorderWidth:v49];

    [(UIImageView *)v5->_thumbnailImageView ic_applyRoundedCornersWithRadius:6.0];
    v150[0] = v5->_titleLabel;
    v150[1] = v5->_dateLabel;
    v150[2] = v5->_summaryLabel;
    v150[3] = v5->_participantsLabel;
    v150[4] = v5->_folderStackView;
    v140 = +[NSArray arrayWithObjects:v150 count:5];
    v51 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:v140];
    verticalStackView = v5->_verticalStackView;
    v5->_verticalStackView = v51;

    [(UIStackView *)v5->_verticalStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v5->_verticalStackView setAxis:1];
    [(UIStackView *)v5->_verticalStackView setDistribution:0];
    [(UIStackView *)v5->_verticalStackView setSpacing:2.0];
    v53 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    [v53 addSubview:v5->_verticalStackView];

    v54 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    [v54 addSubview:v5->_statusIndicatorImageView];

    v55 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    [v55 addSubview:v5->_secondaryStatusIndicatorImageView];

    v56 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    [v56 addSubview:v5->_thumbnailImageView];

    id v57 = objc_alloc_init((Class)UILayoutGuide);
    v58 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    [v58 addLayoutGuide:v57];

    v136 = [(ICNoteResultsListCollectionViewCell *)v5 separatorLayoutGuide];
    v135 = [v136 leadingAnchor];
    v134 = [(UIStackView *)v5->_verticalStackView leadingAnchor];
    uint64_t v59 = [v135 constraintEqualToAnchor:v134];
    separatorLeadingConstraint = v5->_separatorLeadingConstraint;
    v5->_separatorLeadingConstraint = (NSLayoutConstraint *)v59;

    v149[0] = v59;
    v132 = [v57 leadingAnchor];
    v133 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    v131 = [v133 leadingAnchor];
    v130 = [v132 constraintEqualToAnchor:v131];
    v149[1] = v130;
    v129 = [v57 trailingAnchor];
    v128 = [(UIStackView *)v5->_verticalStackView leadingAnchor];
    v127 = [v129 constraintEqualToAnchor:v128];
    v149[2] = v127;
    v126 = [(UIImageView *)v5->_statusIndicatorImageView centerXAnchor];
    v139 = v57;
    v125 = [v57 centerXAnchor];
    v124 = [v126 constraintEqualToAnchor:v125];
    v149[3] = v124;
    v123 = [(UIImageView *)v5->_statusIndicatorImageView centerYAnchor];
    v122 = [(UILabel *)v5->_titleLabel centerYAnchor];
    v121 = [v123 constraintEqualToAnchor:v122];
    v149[4] = v121;
    v120 = [(UIImageView *)v5->_secondaryStatusIndicatorImageView centerXAnchor];
    v119 = [v57 centerXAnchor];
    v118 = [v120 constraintEqualToAnchor:v119];
    v149[5] = v118;
    v116 = [(UIStackView *)v5->_verticalStackView topAnchor];
    v117 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    v115 = [v117 topAnchor];
    [(ICNoteResultsListCollectionViewCell *)v5 verticalPadding];
    uint64_t v61 = objc_msgSend(v116, "constraintEqualToAnchor:constant:", v115);
    verticalStackViewTopConstraint = v5->_verticalStackViewTopConstraint;
    v5->_verticalStackViewTopConstraint = (NSLayoutConstraint *)v61;

    v149[6] = v61;
    v114 = [(ICNoteResultsListCollectionViewCell *)v5 verticalStackView];
    v112 = [v114 leadingAnchor];
    v113 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    v111 = [v113 leadingAnchor];
    uint64_t v63 = [v112 constraintEqualToAnchor:v111 constant:28.0];
    verticalStackViewLeadingConstraint = v5->_verticalStackViewLeadingConstraint;
    v5->_verticalStackViewLeadingConstraint = (NSLayoutConstraint *)v63;

    v149[7] = v63;
    v65 = [(ICNoteResultsListCollectionViewCell *)v5 verticalStackView];
    v66 = [v65 trailingAnchor];
    v67 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    v68 = [v67 trailingAnchor];
    uint64_t v69 = [v66 constraintEqualToAnchor:v68 constant:-12.0];
    verticalStackViewTrailingConstraint = v5->_verticalStackViewTrailingConstraint;
    v5->_verticalStackViewTrailingConstraint = (NSLayoutConstraint *)v69;

    v149[8] = v69;
    v71 = [(ICNoteResultsListCollectionViewCell *)v5 verticalStackView];
    v72 = [v71 bottomAnchor];
    v73 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    v74 = [v73 bottomAnchor];
    [(ICNoteResultsListCollectionViewCell *)v5 verticalPadding];
    uint64_t v76 = [v72 constraintEqualToAnchor:v74 constant:-v75];
    verticalStackViewBottomConstraint = v5->_verticalStackViewBottomConstraint;
    v5->_verticalStackViewBottomConstraint = (NSLayoutConstraint *)v76;

    v149[9] = v76;
    v78 = +[NSArray arrayWithObjects:v149 count:10];
    +[NSLayoutConstraint activateConstraints:v78];

    v79 = [(UIImageView *)v5->_secondaryStatusIndicatorImageView centerYAnchor];
    v80 = [(UILabel *)v5->_summaryLabel centerYAnchor];
    uint64_t v81 = [v79 constraintEqualToAnchor:v80];
    secondaryStatusIndicatorCenterYNormalConstraint = v5->_secondaryStatusIndicatorCenterYNormalConstraint;
    v5->_secondaryStatusIndicatorCenterYNormalConstraint = (NSLayoutConstraint *)v81;

    v83 = [(UIImageView *)v5->_secondaryStatusIndicatorImageView centerYAnchor];
    v84 = [(UILabel *)v5->_dateLabel centerYAnchor];
    uint64_t v85 = [v83 constraintEqualToAnchor:v84];
    secondaryStatusIndicatorCenterYAXConstraint = v5->_secondaryStatusIndicatorCenterYAXConstraint;
    v5->_secondaryStatusIndicatorCenterYAXConstraint = (NSLayoutConstraint *)v85;

    v141 = [(UIImageView *)v5->_thumbnailImageView trailingAnchor];
    v143 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    v137 = [v143 trailingAnchor];
    v87 = [v141 constraintEqualToAnchor:v137 constant:-12.0];
    v148[0] = v87;
    v88 = [(UIImageView *)v5->_thumbnailImageView centerYAnchor];
    v89 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    v90 = [v89 centerYAnchor];
    v91 = [v88 constraintEqualToAnchor:v90];
    v148[1] = v91;
    v92 = [(UIImageView *)v5->_thumbnailImageView widthAnchor];
    v93 = [(UIImageView *)v5->_thumbnailImageView heightAnchor];
    v94 = [v92 constraintEqualToAnchor:v93];
    v148[2] = v94;
    uint64_t v95 = +[NSArray arrayWithObjects:v148 count:3];
    trailingThumbnailConstraints = v5->_trailingThumbnailConstraints;
    v5->_trailingThumbnailConstraints = (NSArray *)v95;

    v142 = [(UIImageView *)v5->_thumbnailImageView bottomAnchor];
    v144 = [(ICNoteResultsListCollectionViewCell *)v5 contentView];
    v138 = [v144 bottomAnchor];
    [(ICNoteResultsListCollectionViewCell *)v5 verticalPadding];
    v98 = [v142 constraintEqualToAnchor:v138 constant:v97 * -2.0];
    v147[0] = v98;
    v99 = [(UIImageView *)v5->_thumbnailImageView leadingAnchor];
    v100 = [(UILabel *)v5->_titleLabel leadingAnchor];
    v101 = [v99 constraintEqualToAnchor:v100];
    v147[1] = v101;
    v102 = [(UIImageView *)v5->_thumbnailImageView heightAnchor];
    v103 = [v102 constraintEqualToConstant:68.0];
    v147[2] = v103;
    v104 = [(UIImageView *)v5->_thumbnailImageView widthAnchor];
    v105 = [v104 constraintEqualToConstant:68.0];
    v147[3] = v105;
    uint64_t v106 = +[NSArray arrayWithObjects:v147 count:4];
    bottomThumbnailConstraints = v5->_bottomThumbnailConstraints;
    v5->_bottomThumbnailConstraints = (NSArray *)v106;

    [(ICNoteResultsListCollectionViewCell *)v5 enableIntrinsicSizeShortcut:1];
    [(ICNoteResultsListCollectionViewCell *)v5 updateViewStateProperties];
    id v108 = objc_alloc_init((Class)UICellAccessoryMultiselect);
    [v108 setDisplayedState:1];
    id v146 = v108;
    v109 = +[NSArray arrayWithObjects:&v146 count:1];
    [(ICNoteResultsListCollectionViewCell *)v5 setAccessories:v109];

    [(ICNoteResultsListCollectionViewCell *)v5 addNotificationObservers];
    [(ICNoteResultsListCollectionViewCell *)v5 registerForTraitChanges];

    v6 = &selRef_textColor;
  }
  LODWORD(v4) = 1144750080;
  [*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + *((int *)v6 + 253)) setPriority:v4];
  return v5;
}

- (void)setConfiguration:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ICNoteResultsListCollectionViewCell *)self enableIntrinsicSizeShortcut:1];
  v7.receiver = self;
  v7.super_class = (Class)ICNoteResultsListCollectionViewCell;
  [(ICBaseNoteResultsCollectionViewCell *)&v7 setConfiguration:v6 synchronously:v4];

  [(ICNoteResultsListCollectionViewCell *)self resetColors];
}

- (void)setHidesThumbnail:(BOOL)a3
{
  self->_hidesThumbnail = a3;
  [(ICNoteResultsListCollectionViewCell *)self updateFromConfiguration];
}

- (void)setPinDropTarget:(BOOL)a3
{
  self->_pinDropTarget = a3;
  [(ICNoteResultsListCollectionViewCell *)self setNeedsUpdateConfiguration];
}

- (void)updateViewStateProperties
{
  v16.receiver = self;
  v16.super_class = (Class)ICNoteResultsListCollectionViewCell;
  [(ICBaseNoteResultsCollectionViewCell *)&v16 updateViewStateProperties];
  v3 = +[UIFont ic_preferredSingleLineAFontForTextStyle:UIFontTextStyleSubheadline];
  BOOL v4 = [(ICNoteResultsListCollectionViewCell *)self dateLabel];
  [v4 setFont:v3];

  v5 = +[UIFont ic_preferredSingleLineAFontForTextStyle:UIFontTextStyleSubheadline];
  id v6 = [(ICNoteResultsListCollectionViewCell *)self participantsLabel];
  [v6 setFont:v5];

  objc_super v7 = [(ICNoteResultsListCollectionViewCell *)self traitCollection];
  -[ICNoteResultsListCollectionViewCell setIsInSplitView:](self, "setIsInSplitView:", [v7 _splitViewControllerContext] == (char *)&dword_0 + 3);

  [(ICNoteResultsListCollectionViewCell *)self setIsAXSize:ICAccessibilityAccessibilityLargerTextSizesEnabled()];
  v8 = [(ICNoteResultsListCollectionViewCell *)self traitCollection];
  v9 = [v8 preferredContentSizeCategory];
  [(ICNoteResultsListCollectionViewCell *)self setIsLargerThanAXLarge:UIContentSizeCategoryCompareToCategory(v9, UIContentSizeCategoryAccessibilityLarge) > NSOrderedSame];

  if ([(ICNoteResultsListCollectionViewCell *)self isAXSize]) {
    [(ICNoteResultsListCollectionViewCell *)self secondaryStatusIndicatorCenterYAXConstraint];
  }
  else {
  v10 = [(ICNoteResultsListCollectionViewCell *)self secondaryStatusIndicatorCenterYNormalConstraint];
  }
  if ([(ICNoteResultsListCollectionViewCell *)self isAXSize]) {
    [(ICNoteResultsListCollectionViewCell *)self secondaryStatusIndicatorCenterYNormalConstraint];
  }
  else {
  v11 = [(ICNoteResultsListCollectionViewCell *)self secondaryStatusIndicatorCenterYAXConstraint];
  }
  if (([v10 isActive] & 1) == 0)
  {
    [v10 setActive:1];
    [v11 setActive:0];
  }
  if ([(ICNoteResultsListCollectionViewCell *)self isAXSize]) {
    double v12 = 37.0;
  }
  else {
    double v12 = 28.0;
  }
  v13 = [(ICNoteResultsListCollectionViewCell *)self verticalStackViewLeadingConstraint];
  [v13 setConstant:v12];

  unint64_t v14 = [(ICNoteResultsListCollectionViewCell *)self numberOfLines];
  uint64_t v15 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  [v15 setMaxNumberOfLabelLines:v14];
}

- (CGRect)estimatedBoundsForLabel:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (([v4 isHidden] & 1) == 0)
  {
    id v6 = [v4 font];
    [v6 lineHeight];
    double v5 = v7;
  }
  [(ICNoteResultsListCollectionViewCell *)self frame];
  double v9 = v8 + -24.0;
  v10 = [(ICNoteResultsListCollectionViewCell *)self verticalStackViewLeadingConstraint];
  [v10 constant];
  double v12 = v9 - v11;
  v13 = [(ICNoteResultsListCollectionViewCell *)self verticalStackViewTrailingConstraint];
  [v13 constant];
  double v15 = v12 - v14;

  double v16 = 0.0;
  double v17 = 0.0;
  double v18 = v15;
  double v19 = v5;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.x = v16;
  return result;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  [(ICNoteResultsListCollectionViewCell *)self updateColorsUsingState:v4];
  [(ICNoteResultsListCollectionViewCell *)self updateStatusIndicatorsUsingState:v4];
  [(ICNoteResultsListCollectionViewCell *)self updateBackgroundConfigurationUsingState:v4];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(ICNoteResultsListCollectionViewCell *)self enableIntrinsicSizeShortcut:0];
  [(ICNoteResultsListCollectionViewCell *)self updateViewStateProperties];

  [(ICNoteResultsListCollectionViewCell *)self updateFromConfiguration];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unsigned int v2 = [(ICNoteResultsListCollectionViewCell *)self isSelected];
  v3 = &UIAccessibilityTraitSelected;
  if (!v2) {
    v3 = &UIAccessibilityTraitNone;
  }
  return *v3;
}

- (id)accessibilityCustomActions
{
  v3 = [(ICNoteResultsListCollectionViewCell *)self accessibilityCustomActionsDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(ICNoteResultsListCollectionViewCell *)self accessibilityCustomActionsDelegate];
    id v6 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    double v7 = [v6 note];
    double v8 = [v7 objectID];
    double v9 = [v5 customAccessibilityActionsForObjectID:v8 galleryView:0];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (unint64_t)numberOfLines
{
  if (![(ICNoteResultsListCollectionViewCell *)self isAXSize]) {
    return 1;
  }
  if ([(ICNoteResultsListCollectionViewCell *)self isLargerThanAXLarge]) {
    return 3;
  }
  return 2;
}

- (void)updateBackgroundConfigurationUsingState:(id)a3
{
  id v8 = a3;
  if (+[UIDevice ic_isVision]) {
    +[UIBackgroundConfiguration listPlainCellConfiguration];
  }
  else {
  char v4 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
  }
  if ([v8 cellDropState] == (char *)&dword_0 + 2)
  {
    [v8 setCellDropState:1];
    [v8 setFocused:0];
  }
  if ([(ICNoteResultsListCollectionViewCell *)self isPinDropTarget])
  {
    if (+[UIDevice ic_isVision]) {
      +[UIColor secondarySystemFillColor];
    }
    else {
    double v5 = +[UIColor systemFillColor];
    }
    [v4 setBackgroundColor:v5];
  }
  id v6 = +[UIColor clearColor];
  [v4 setBackgroundColor:v6];

  double v7 = [v4 updatedConfigurationForState:v8];
  [(ICNoteResultsListCollectionViewCell *)self setBackgroundConfiguration:v7];
}

- (void)updateColorsUsingState:(id)a3
{
  id v4 = a3;
  double v5 = +[UIListContentConfiguration valueCellConfiguration];
  if ([v4 cellDropState] == (char *)&dword_0 + 2
    || [v4 cellDropState] == (char *)&dword_0 + 1)
  {
    [v4 setCellDropState:1];
    [v4 setFocused:0];
  }
  [v4 setDisabled:0];
  id v6 = [v5 updatedConfigurationForState:v4];

  double v7 = [v6 textProperties];
  id v8 = [v7 color];
  [(ICNoteResultsListCollectionViewCell *)self setPrimaryLabelColor:v8];

  double v9 = [v6 secondaryTextProperties];
  v10 = [v9 color];
  [(ICNoteResultsListCollectionViewCell *)self setSecondaryLabelColor:v10];

  double v11 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  double v12 = [v11 searchResult];

  if (v12)
  {
    v42 = v6;
    unsigned int v13 = [v4 isSelected];
    char v14 = v13;
    if (v13)
    {
      +[UIColor colorNamed:@"selected_search_highlight"];
    }
    else
    {
      id v6 = [(ICNoteResultsListCollectionViewCell *)self window];
      [v6 tintColor];
    double v15 = };
    double v16 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    [v16 setHighlightColor:v15];

    if ((v14 & 1) == 0)
    {

      double v15 = v6;
    }

    v41 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    v45[0] = NSFontAttributeName;
    double v17 = [(ICNoteResultsListCollectionViewCell *)self titleLabel];
    double v18 = [v17 font];
    v46[0] = v18;
    v45[1] = NSForegroundColorAttributeName;
    double v19 = [(ICNoteResultsListCollectionViewCell *)self primaryLabelColor];
    v46[1] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    v43[0] = NSFontAttributeName;
    uint64_t v21 = [(ICNoteResultsListCollectionViewCell *)self summaryLabel];
    v22 = [v21 font];
    v43[1] = NSForegroundColorAttributeName;
    v44[0] = v22;
    v23 = [(ICNoteResultsListCollectionViewCell *)self secondaryLabelColor];
    v44[1] = v23;
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    [v41 updateTitleLabelAttributes:v20 summaryLabelAttributes:v24];

    id v6 = v42;
  }
  v25 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  v26 = [v25 searchResult];

  if (v26)
  {
    [(ICBaseNoteResultsCollectionViewCell *)self synchronouslyLoadConfigurationDataAndUpdate];
  }
  else
  {
    uint64_t v27 = [(ICNoteResultsListCollectionViewCell *)self primaryLabelColor];
    v28 = [(ICNoteResultsListCollectionViewCell *)self titleLabel];
    [v28 setTextColor:v27];

    v29 = [(ICNoteResultsListCollectionViewCell *)self secondaryLabelColor];
    v30 = [(ICNoteResultsListCollectionViewCell *)self summaryLabel];
    [v30 setTextColor:v29];
  }
  v31 = [(ICNoteResultsListCollectionViewCell *)self secondaryLabelColor];
  v32 = [(ICNoteResultsListCollectionViewCell *)self dateLabel];
  [v32 setTextColor:v31];

  double v33 = [(ICNoteResultsListCollectionViewCell *)self secondaryLabelColor];
  double v34 = [(ICNoteResultsListCollectionViewCell *)self participantsLabel];
  [v34 setTextColor:v33];

  double v35 = [(ICNoteResultsListCollectionViewCell *)self secondaryLabelColor];
  double v36 = [(ICNoteResultsListCollectionViewCell *)self folderAndAccountLabel];
  [v36 setTextColor:v35];

  id v37 = [(ICNoteResultsListCollectionViewCell *)self secondaryLabelColor];
  v38 = [(ICNoteResultsListCollectionViewCell *)self folderLabelImageView];
  [v38 setTintColor:v37];

  if ([v4 isSelected]) {
    +[UIColor whiteColor];
  }
  else {
  v39 = +[UIColor tertiaryLabelColor];
  }
  v40 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
  [v40 setTintColor:v39];
}

- (void)resetColors
{
  v3 = +[UIColor siriui_textColor];
  [(ICNoteResultsListCollectionViewCell *)self setPrimaryLabelColor:v3];

  id v4 = +[UIColor siriui_semiTransparentTextColor];
  [(ICNoteResultsListCollectionViewCell *)self setSecondaryLabelColor:v4];

  id v6 = +[UIColor ICTintColor];
  double v5 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  [v5 setHighlightColor:v6];
}

- (id)createLabel
{
  id v2 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setAdjustsFontForContentSizeCategory:1];
  LODWORD(v3) = 1148846080;
  [v2 setContentCompressionResistancePriority:1 forAxis:v3];

  return v2;
}

- (void)enableIntrinsicSizeShortcut:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(ICNoteResultsListCollectionViewCell *)self titleLabel];
  [v5 _setUseShortcutIntrinsicContentSize:v3];

  id v6 = [(ICNoteResultsListCollectionViewCell *)self summaryLabel];
  [v6 _setUseShortcutIntrinsicContentSize:v3];

  double v7 = [(ICNoteResultsListCollectionViewCell *)self dateLabel];
  [v7 _setUseShortcutIntrinsicContentSize:v3];

  id v8 = [(ICNoteResultsListCollectionViewCell *)self participantsLabel];
  [v8 _setUseShortcutIntrinsicContentSize:v3];

  id v9 = [(ICNoteResultsListCollectionViewCell *)self folderAndAccountLabel];
  [v9 _setUseShortcutIntrinsicContentSize:v3];
}

- (void)setCurrentThumbnailLocation:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      id v9 = [(ICNoteResultsListCollectionViewCell *)self trailingThumbnailConstraints];
      +[NSLayoutConstraint deactivateConstraints:v9];

      [(ICNoteResultsListCollectionViewCell *)self currentThumbnailSize];
      double v11 = v10;
      [(ICNoteResultsListCollectionViewCell *)self verticalPadding];
      double v13 = -(v11 + v12 * 3.0);
      char v14 = [(ICNoteResultsListCollectionViewCell *)self verticalStackViewBottomConstraint];
      [v14 setConstant:v13];

      double v15 = [(ICNoteResultsListCollectionViewCell *)self verticalStackViewTrailingConstraint];
      [v15 setConstant:-12.0];

      uint64_t v16 = [(ICNoteResultsListCollectionViewCell *)self bottomThumbnailConstraints];
LABEL_7:
      id v8 = (void *)v16;
      +[NSLayoutConstraint activateConstraints:v16];
      goto LABEL_8;
    case 1:
      double v17 = [(ICNoteResultsListCollectionViewCell *)self bottomThumbnailConstraints];
      +[NSLayoutConstraint deactivateConstraints:v17];

      [(ICNoteResultsListCollectionViewCell *)self currentThumbnailSize];
      double v19 = -(v18 + 24.0);
      v20 = [(ICNoteResultsListCollectionViewCell *)self verticalStackViewTrailingConstraint];
      [v20 setConstant:v19];

      [(ICNoteResultsListCollectionViewCell *)self verticalPadding];
      double v22 = -v21;
      v23 = [(ICNoteResultsListCollectionViewCell *)self verticalStackViewBottomConstraint];
      [v23 setConstant:v22];

      uint64_t v16 = [(ICNoteResultsListCollectionViewCell *)self trailingThumbnailConstraints];
      goto LABEL_7;
    case 0:
      [(ICNoteResultsListCollectionViewCell *)self verticalPadding];
      double v6 = -v5;
      double v7 = [(ICNoteResultsListCollectionViewCell *)self verticalStackViewBottomConstraint];
      [v7 setConstant:v6];

      id v8 = [(ICNoteResultsListCollectionViewCell *)self verticalStackViewTrailingConstraint];
      [v8 setConstant:-12.0];
LABEL_8:

      break;
  }
  self->_currentThumbnailLocation = a3;
}

- (void)updateFromConfiguration
{
  unint64_t v3 = [(ICNoteResultsListCollectionViewCell *)self numberOfLines];
  id v4 = [(ICNoteResultsListCollectionViewCell *)self titleLabel];
  [v4 setNumberOfLines:v3];

  unint64_t v5 = [(ICNoteResultsListCollectionViewCell *)self numberOfLines];
  double v6 = [(ICNoteResultsListCollectionViewCell *)self summaryLabel];
  [v6 setNumberOfLines:v5];

  unint64_t v7 = [(ICNoteResultsListCollectionViewCell *)self numberOfLines];
  id v8 = [(ICNoteResultsListCollectionViewCell *)self folderAndAccountLabel];
  [v8 setNumberOfLines:v7];

  unint64_t v9 = [(ICNoteResultsListCollectionViewCell *)self numberOfLines];
  double v10 = [(ICNoteResultsListCollectionViewCell *)self participantsLabel];
  [v10 setNumberOfLines:v9];

  unsigned int v11 = [(ICNoteResultsListCollectionViewCell *)self isLargerThanAXLarge];
  double v12 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  unsigned int v13 = [v12 showParticipantsInfo];

  char v14 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  if ([v14 showFolderName])
  {
    unsigned int v15 = 1;
  }
  else
  {
    uint64_t v16 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    unsigned int v15 = [v16 showAccountName];
  }
  if ([(ICNoteResultsListCollectionViewCell *)self hidesThumbnail])
  {
    [(ICNoteResultsListCollectionViewCell *)self setIsThumbnailPresent:0];
  }
  else
  {
    double v17 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    -[ICNoteResultsListCollectionViewCell setIsThumbnailPresent:](self, "setIsThumbnailPresent:", [v17 hasThumbnailImage]);
  }
  if ([(ICNoteResultsListCollectionViewCell *)self isThumbnailPresent])
  {
    double v18 = [(ICNoteResultsListCollectionViewCell *)self titleLabel];
    double v19 = [v18 font];
    [v19 lineHeight];
    double v21 = v20;
    double v22 = [(ICNoteResultsListCollectionViewCell *)self summaryLabel];
    v23 = [v22 font];
    [v23 lineHeight];
    double v25 = v21 + v24;
    double v26 = 0.0;
    double v27 = 0.0;
    if (v11)
    {
      uint64_t v59 = [(ICNoteResultsListCollectionViewCell *)self dateLabel];
      v58 = [v59 font];
      [v58 lineHeight];
    }
    double v28 = v25 + v27;
    if (v13)
    {
      id v57 = [(ICNoteResultsListCollectionViewCell *)self participantsLabel];
      v60 = [v57 font];
      [v60 lineHeight];
      double v26 = v29;
    }
    double v30 = v28 + v26;
    if (v15)
    {
      [(ICNoteResultsListCollectionViewCell *)self folderAndAccountLabel];
      unsigned int v31 = v11;
      unsigned int v32 = v13;
      double v33 = v23;
      v35 = double v34 = v22;
      [v35 font];
      double v36 = v19;
      v38 = id v37 = v18;
      [v38 lineHeight];
      double v40 = v30 + v39;

      double v18 = v37;
      double v19 = v36;

      double v22 = v34;
      v23 = v33;
      unsigned int v13 = v32;
      unsigned int v11 = v31;
    }
    else
    {
      double v40 = v30 + 0.0;
    }
    if (v13)
    {
    }
    if (v11)
    {
    }
    double v41 = fmin(ceil(v40), 68.0);
    -[ICNoteResultsListCollectionViewCell setCurrentThumbnailSize:](self, "setCurrentThumbnailSize:", v41, v41);
  }
  v42 = [(ICNoteResultsListCollectionViewCell *)self dateLabel];
  [v42 setHidden:v11 ^ 1];

  v43 = [(ICNoteResultsListCollectionViewCell *)self participantsLabel];
  [v43 setHidden:v13 ^ 1];

  v44 = [(ICNoteResultsListCollectionViewCell *)self folderStackView];
  [v44 setHidden:v15 ^ 1];

  uint64_t v45 = [(ICNoteResultsListCollectionViewCell *)self isThumbnailPresent] ^ 1;
  id v46 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
  [v46 setHidden:v45];

  if ([(ICNoteResultsListCollectionViewCell *)self isThumbnailPresent]
    && ![(ICNoteResultsListCollectionViewCell *)self currentThumbnailLocation]
    || ![(ICNoteResultsListCollectionViewCell *)self isThumbnailPresent]
    && [(ICNoteResultsListCollectionViewCell *)self currentThumbnailLocation]
    || [(ICNoteResultsListCollectionViewCell *)self isAXSize]
    && (char *)[(ICNoteResultsListCollectionViewCell *)self currentThumbnailLocation] != (char *)&dword_0 + 2
    || ![(ICNoteResultsListCollectionViewCell *)self isAXSize]
    && (char *)[(ICNoteResultsListCollectionViewCell *)self currentThumbnailLocation] != (char *)&dword_0 + 1)
  {
    if ([(ICNoteResultsListCollectionViewCell *)self isAXSize]
      && [(ICNoteResultsListCollectionViewCell *)self isThumbnailPresent])
    {
      uint64_t v47 = 2;
    }
    else
    {
      uint64_t v47 = [(ICNoteResultsListCollectionViewCell *)self isThumbnailPresent];
    }
    [(ICNoteResultsListCollectionViewCell *)self setCurrentThumbnailLocation:v47];
  }
  double v48 = [(ICNoteResultsListCollectionViewCell *)self configurationState];
  [(ICNoteResultsListCollectionViewCell *)self updateStatusIndicatorsUsingState:v48];

  [(ICNoteResultsListCollectionViewCell *)self updateLabelsFromConfiguration];
  [(ICNoteResultsListCollectionViewCell *)self updateThumbnailFromConfiguration];
  double v49 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  unsigned int v50 = [v49 styleForCalculator];

  v51 = [(ICNoteResultsListCollectionViewCell *)self separatorLeadingConstraint];
  [v51 setActive:v50 ^ 1];

  [(ICNoteResultsListCollectionViewCell *)self verticalPadding];
  double v53 = v52;
  v54 = [(ICNoteResultsListCollectionViewCell *)self verticalStackViewTopConstraint];
  [v54 setConstant:v53];

  if (v50) {
    double v55 = 4.0;
  }
  else {
    double v55 = 2.0;
  }
  v56 = [(ICNoteResultsListCollectionViewCell *)self verticalStackView];
  [v56 setSpacing:v55];

  [(ICNoteResultsListCollectionViewCell *)self layoutIfNeeded];
}

- (double)verticalPadding
{
  id v2 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  if ([v2 styleForCalculator]) {
    double v3 = 18.0;
  }
  else {
    double v3 = 10.0;
  }

  return v3;
}

- (void)updateStatusIndicatorsUsingState:(id)a3
{
  id v25 = a3;
  id v4 = [(ICNoteResultsListCollectionViewCell *)self statusIndicatorImageView];
  [v4 setHidden:1];

  unint64_t v5 = [(ICNoteResultsListCollectionViewCell *)self secondaryStatusIndicatorImageView];
  [v5 setHidden:1];

  if (([v25 isSelected] & 1) != 0 || objc_msgSend(v25, "isFocused")) {
    unsigned int v6 = [(ICNoteResultsListCollectionViewCell *)self isInSplitView];
  }
  else {
    unsigned int v6 = 0;
  }
  unint64_t v7 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  id v8 = [v7 primaryStatusImage];

  if (v8)
  {
    unint64_t v9 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    double v10 = [v9 primaryStatusImage];
    unsigned int v11 = [(ICNoteResultsListCollectionViewCell *)self statusIndicatorImageView];
    [v11 setImage:v10];

    if (v6)
    {
      double v12 = [(ICNoteResultsListCollectionViewCell *)self titleLabel];
      [v12 textColor];
    }
    else
    {
      double v12 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
      [v12 primaryStatusImageTintColor];
    unsigned int v13 = };
    char v14 = [(ICNoteResultsListCollectionViewCell *)self statusIndicatorImageView];
    [v14 setTintColor:v13];

    unsigned int v15 = [(ICNoteResultsListCollectionViewCell *)self statusIndicatorImageView];
    [v15 setHidden:0];
  }
  uint64_t v16 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  double v17 = [v16 secondaryStatusImage];

  if (v17)
  {
    double v18 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    double v19 = [v18 secondaryStatusImage];
    double v20 = [(ICNoteResultsListCollectionViewCell *)self secondaryStatusIndicatorImageView];
    [v20 setImage:v19];

    if (v6)
    {
      double v21 = [(ICNoteResultsListCollectionViewCell *)self titleLabel];
      [v21 textColor];
    }
    else
    {
      double v21 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
      [v21 secondaryStatusImageTintColor];
    double v22 = };
    v23 = [(ICNoteResultsListCollectionViewCell *)self secondaryStatusIndicatorImageView];
    [v23 setTintColor:v22];

    double v24 = [(ICNoteResultsListCollectionViewCell *)self secondaryStatusIndicatorImageView];
    [v24 setHidden:0];
  }
}

- (void)updateLabelsFromConfiguration
{
  double v3 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  unsigned __int8 v4 = [v3 isDataLoaded];

  if (v4)
  {
    unint64_t v5 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    unsigned int v6 = [v5 titleAttributedString];

    unint64_t v7 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    id v8 = v7;
    if (v6)
    {
      unint64_t v9 = [v7 titleAttributedString];
      double v10 = [(ICNoteResultsListCollectionViewCell *)self titleLabel];
      [v10 setAttributedText:v9];
    }
    else
    {
      unint64_t v9 = [v7 titleString];
      double v10 = [(ICNoteResultsListCollectionViewCell *)self titleLabel];
      [v10 setText:v9];
    }

    double v22 = [(ICNoteResultsListCollectionViewCell *)self dateLabel];
    unsigned __int8 v23 = [v22 isHidden];

    if ((v23 & 1) == 0)
    {
      double v24 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
      id v25 = [v24 dateString];
      double v26 = [(ICNoteResultsListCollectionViewCell *)self dateLabel];
      [v26 setText:v25];
    }
    double v27 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    double v28 = [v27 summaryAttributedString];

    double v29 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    double v30 = v29;
    if (v28)
    {
      unsigned int v31 = [v29 summaryAttributedString];
      unsigned int v32 = [(ICNoteResultsListCollectionViewCell *)self summaryLabel];
      [v32 setAttributedText:v31];
    }
    else
    {
      unsigned int v31 = [v29 summaryString];
      unsigned int v32 = [(ICNoteResultsListCollectionViewCell *)self summaryLabel];
      [v32 setText:v31];
    }

    double v33 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    unsigned int v34 = [v33 showParticipantsInfo];

    if (v34)
    {
      double v35 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
      double v36 = [v35 participantsInfoString];
      id v37 = [(ICNoteResultsListCollectionViewCell *)self participantsLabel];
      [v37 setText:v36];
    }
    v38 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    unsigned int v39 = [v38 showsNoteContainer];

    if (v39)
    {
      double v40 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
      double v41 = [v40 folderAndAccountInfoString];
      v42 = [(ICNoteResultsListCollectionViewCell *)self folderAndAccountLabel];
      [v42 setText:v41];

      v43 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
      v44 = [v43 folderImage];
      uint64_t v45 = [(ICNoteResultsListCollectionViewCell *)self folderLabelImageView];
      [v45 setImage:v44];

      id v46 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
      uint64_t v47 = [v46 folderImage];
      double v48 = [(ICNoteResultsListCollectionViewCell *)self folderLabelImageView];
      [v48 setHidden:v47 == 0];
    }
    id v49 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    [v49 searchResult];

    goto LABEL_22;
  }
  unsigned int v11 = [(ICNoteResultsListCollectionViewCell *)self titleLabel];
  [v11 setText:@" "];

  double v12 = [(ICNoteResultsListCollectionViewCell *)self summaryLabel];
  [v12 setText:@" "];

  unsigned int v13 = [(ICNoteResultsListCollectionViewCell *)self dateLabel];
  unsigned __int8 v14 = [v13 isHidden];

  if ((v14 & 1) == 0)
  {
    unsigned int v15 = [(ICNoteResultsListCollectionViewCell *)self dateLabel];
    [v15 setText:@" "];
  }
  uint64_t v16 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  unsigned int v17 = [v16 showParticipantsInfo];

  if (v17)
  {
    double v18 = [(ICNoteResultsListCollectionViewCell *)self participantsLabel];
    [v18 setText:@" "];
  }
  double v19 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
  unsigned int v20 = [v19 showsNoteContainer];

  if (v20)
  {
    double v21 = [(ICNoteResultsListCollectionViewCell *)self folderAndAccountLabel];
    [v21 setText:@" "];

    id v49 = [(ICNoteResultsListCollectionViewCell *)self folderLabelImageView];
    [v49 setHidden:1];
LABEL_22:
  }
}

- (void)updateThumbnailFromConfiguration
{
  if ([(ICNoteResultsListCollectionViewCell *)self isThumbnailPresent])
  {
    double v3 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    unsigned __int8 v4 = [v3 note];

    unint64_t v5 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
    unsigned int v6 = v5;
    if (v4)
    {
      unint64_t v7 = [v5 searchResult];
      id v8 = [v7 configuration];
      unint64_t v9 = [v8 foundAttachmentObjectID];

      if (v9)
      {
        double v10 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
        unsigned int v11 = [v10 searchResult];
        double v12 = [v11 object];
        unsigned int v13 = [v12 managedObjectContext];
        unsigned __int8 v14 = [v13 objectWithID:v9];

        id v15 = objc_alloc((Class)ICThumbnailConfiguration);
        [(ICNoteResultsListCollectionViewCell *)self currentThumbnailSize];
        double v17 = v16;
        double v19 = v18;
        unsigned int v20 = +[UIScreen mainScreen];
        [v20 scale];
        double v22 = v21;
        unsigned __int8 v23 = [(ICNoteResultsListCollectionViewCell *)self ic_appearanceInfo];
        id v24 = objc_msgSend(v15, "initForNoteListWithFoundAttachment:preferredSize:scale:appearanceInfo:", v14, v23, v17, v19, v22);
      }
      else
      {
        if (+[UIDevice ic_isVision]) {
          +[ICAppearanceInfo appearanceInfoWithType:0];
        }
        else {
        unsigned __int8 v14 = [(ICNoteResultsListCollectionViewCell *)self ic_appearanceInfo];
        }
        id v57 = objc_alloc((Class)ICThumbnailConfiguration);
        unsigned int v20 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
        unsigned __int8 v23 = [v20 note];
        [(ICNoteResultsListCollectionViewCell *)self currentThumbnailSize];
        double v59 = v58;
        double v61 = v60;
        v62 = +[UIScreen mainScreen];
        [v62 scale];
        id v24 = objc_msgSend(v57, "initForNoteListWithNote:preferredSize:scale:appearanceInfo:", v23, v14, v59, v61, v63);
      }
      v64 = +[ICThumbnailService sharedThumbnailService];
      v65 = [v24 uniqueKey];
      [(ICNoteResultsListCollectionViewCell *)self setCurrentThumbnailConfigurationUniqueKey:v65];

      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_7248;
      v67[3] = &unk_184D8;
      v67[4] = self;
      [v64 thumbnailWithConfiguration:v24 completion:v67];
    }
    else
    {
      id v25 = [v5 invitation];

      if (!v25) {
        return;
      }
      double v26 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
      double v27 = [v26 invitation];
      double v28 = [v27 rootObjectType];
      unsigned int v29 = [v28 isEqualToString:@"com.apple.notes.note"];

      double v30 = [(ICBaseNoteResultsCollectionViewCell *)self configuration];
      unsigned int v31 = [v30 invitation];
      unsigned int v32 = v31;
      if (v29)
      {
        double v33 = [(ICNoteResultsListCollectionViewCell *)self traitCollection];
        unsigned int v34 = objc_msgSend(v33, "ic_appearanceInfo");
        [(ICNoteResultsListCollectionViewCell *)self currentThumbnailSize];
        double v35 = objc_msgSend(v32, "thumbnailImageForAppearance:size:", v34);
        double v36 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        [v36 setImage:v35];

        id v37 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        [v37 setContentMode:2];

        v38 = +[UIColor secondarySystemGroupedBackgroundColor];
        unsigned int v39 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        [v39 setBackgroundColor:v38];

        [(ICNoteResultsListCollectionViewCell *)self ic_hairlineWidth];
        double v41 = v40;
        v42 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        v43 = [v42 layer];
        [v43 setBorderWidth:v41];

        id v66 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        v44 = [v66 image];
        uint64_t v45 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        [v45 setHidden:v44 == 0];
      }
      else
      {
        id v46 = [v31 rootObjectType];
        unsigned int v47 = [v46 isEqualToString:@"com.apple.notes.folder"];

        if (!v47) {
          return;
        }
        id v66 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:26.0];
        double v48 = +[UIImage systemImageNamed:@"folder.badge.person.crop" withConfiguration:v66];
        id v49 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        [v49 setImage:v48];

        unsigned int v50 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        [v50 setContentMode:1];

        v51 = +[UIColor clearColor];
        double v52 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        [v52 setBackgroundColor:v51];

        double v53 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        v54 = [v53 layer];
        [v54 setBorderWidth:0.0];

        v44 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        double v55 = [v44 image];
        v56 = [(ICNoteResultsListCollectionViewCell *)self thumbnailImageView];
        [v56 setHidden:v55 == 0];
      }
    }
  }
}

- (void)addNotificationObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)removeNotificationObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)registerForTraitChanges
{
  uint64_t v6 = objc_opt_class();
  id v3 = +[NSArray arrayWithObjects:&v6 count:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7728;
  v5[3] = &unk_18500;
  v5[4] = self;
  id v4 = [(ICNoteResultsListCollectionViewCell *)self registerForTraitChanges:v3 withHandler:v5];
}

- (BOOL)hidesThumbnail
{
  return self->_hidesThumbnail;
}

- (BOOL)isPinDropTarget
{
  return self->_pinDropTarget;
}

- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityCustomActionsDelegate);

  return (ICAccessibilityCustomActionsDelegate *)WeakRetained;
}

- (void)setAccessibilityCustomActionsDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (void)setSummaryLabel:(id)a3
{
}

- (UILabel)participantsLabel
{
  return self->_participantsLabel;
}

- (void)setParticipantsLabel:(id)a3
{
}

- (UILabel)folderAndAccountLabel
{
  return self->_folderAndAccountLabel;
}

- (void)setFolderAndAccountLabel:(id)a3
{
}

- (UIImageView)statusIndicatorImageView
{
  return self->_statusIndicatorImageView;
}

- (void)setStatusIndicatorImageView:(id)a3
{
}

- (UIImageView)secondaryStatusIndicatorImageView
{
  return self->_secondaryStatusIndicatorImageView;
}

- (void)setSecondaryStatusIndicatorImageView:(id)a3
{
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (void)setThumbnailImageView:(id)a3
{
}

- (UIStackView)folderStackView
{
  return self->_folderStackView;
}

- (void)setFolderStackView:(id)a3
{
}

- (UIImageView)folderLabelImageView
{
  return self->_folderLabelImageView;
}

- (void)setFolderLabelImageView:(id)a3
{
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
}

- (NSLayoutConstraint)verticalStackViewLeadingConstraint
{
  return self->_verticalStackViewLeadingConstraint;
}

- (void)setVerticalStackViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)verticalStackViewTrailingConstraint
{
  return self->_verticalStackViewTrailingConstraint;
}

- (void)setVerticalStackViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)verticalStackViewTopConstraint
{
  return self->_verticalStackViewTopConstraint;
}

- (void)setVerticalStackViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)verticalStackViewBottomConstraint
{
  return self->_verticalStackViewBottomConstraint;
}

- (void)setVerticalStackViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)separatorLeadingConstraint
{
  return self->_separatorLeadingConstraint;
}

- (void)setSeparatorLeadingConstraint:(id)a3
{
}

- (NSArray)bottomThumbnailConstraints
{
  return self->_bottomThumbnailConstraints;
}

- (void)setBottomThumbnailConstraints:(id)a3
{
}

- (NSArray)trailingThumbnailConstraints
{
  return self->_trailingThumbnailConstraints;
}

- (void)setTrailingThumbnailConstraints:(id)a3
{
}

- (NSLayoutConstraint)secondaryStatusIndicatorCenterYAXConstraint
{
  return self->_secondaryStatusIndicatorCenterYAXConstraint;
}

- (void)setSecondaryStatusIndicatorCenterYAXConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryStatusIndicatorCenterYNormalConstraint
{
  return self->_secondaryStatusIndicatorCenterYNormalConstraint;
}

- (void)setSecondaryStatusIndicatorCenterYNormalConstraint:(id)a3
{
}

- (ICThumbnailKey)currentThumbnailConfigurationUniqueKey
{
  return self->_currentThumbnailConfigurationUniqueKey;
}

- (void)setCurrentThumbnailConfigurationUniqueKey:(id)a3
{
}

- (CGSize)currentThumbnailSize
{
  double width = self->_currentThumbnailSize.width;
  double height = self->_currentThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCurrentThumbnailSize:(CGSize)a3
{
  self->_currentThumbnailSize = a3;
}

- (BOOL)isAXSize
{
  return self->_isAXSize;
}

- (void)setIsAXSize:(BOOL)a3
{
  self->_isAXSize = a3;
}

- (BOOL)isLargerThanAXLarge
{
  return self->_isLargerThanAXLarge;
}

- (void)setIsLargerThanAXLarge:(BOOL)a3
{
  self->_isLargerThanAXLarge = a3;
}

- (BOOL)isInSplitView
{
  return self->_isInSplitView;
}

- (void)setIsInSplitView:(BOOL)a3
{
  self->_isInSplitView = a3;
}

- (BOOL)isThumbnailPresent
{
  return self->_isThumbnailPresent;
}

- (void)setIsThumbnailPresent:(BOOL)a3
{
  self->_isThumbnailPresent = a3;
}

- (int64_t)currentThumbnailLocation
{
  return self->_currentThumbnailLocation;
}

- (UIColor)primaryLabelColor
{
  return self->_primaryLabelColor;
}

- (void)setPrimaryLabelColor:(id)a3
{
}

- (UIColor)secondaryLabelColor
{
  return self->_secondaryLabelColor;
}

- (void)setSecondaryLabelColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabelColor, 0);
  objc_storeStrong((id *)&self->_primaryLabelColor, 0);
  objc_storeStrong((id *)&self->_currentThumbnailConfigurationUniqueKey, 0);
  objc_storeStrong((id *)&self->_secondaryStatusIndicatorCenterYNormalConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryStatusIndicatorCenterYAXConstraint, 0);
  objc_storeStrong((id *)&self->_trailingThumbnailConstraints, 0);
  objc_storeStrong((id *)&self->_bottomThumbnailConstraints, 0);
  objc_storeStrong((id *)&self->_separatorLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_verticalStackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_verticalStackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_verticalStackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_verticalStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_folderLabelImageView, 0);
  objc_storeStrong((id *)&self->_folderStackView, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_secondaryStatusIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_statusIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_folderAndAccountLabel, 0);
  objc_storeStrong((id *)&self->_participantsLabel, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_accessibilityCustomActionsDelegate);
}

@end