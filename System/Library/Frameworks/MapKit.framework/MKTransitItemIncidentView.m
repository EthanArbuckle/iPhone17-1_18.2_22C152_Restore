@interface MKTransitItemIncidentView
- (BOOL)padBottom;
- (MKTransitItemIncidentView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInsets;
- (id)_nonBlockingImage;
- (int64_t)cellPosition;
- (void)_configureWithMessage:(id)a3 referenceDate:(id)a4 lastUpdated:(id)a5 incidentIsBlocking:(BOOL)a6 shouldShowImage:(BOOL)a7 inSiri:(BOOL)a8;
- (void)_contentSizeCategoryDidChange;
- (void)_updateBottomConstraintWithOffset:(double)a3;
- (void)_updateConstraintValues;
- (void)configureViews;
- (void)configureWithIncident:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6;
- (void)configureWithIncidentMessage:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6;
- (void)configureWithMessage:(id)a3 incident:(id)a4 referenceDate:(id)a5 shouldShowImage:(BOOL)a6 inSiri:(BOOL)a7;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)infoCardThemeChanged;
- (void)rebuildConstraints;
- (void)setCellPosition:(int64_t)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setPadBottom:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation MKTransitItemIncidentView

- (MKTransitItemIncidentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKTransitItemIncidentView;
  v3 = -[MKTransitItemIncidentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MKTransitItemIncidentView *)v3 configureViews];
  }
  return v4;
}

- (void)configureViews
{
  v34[4] = *MEMORY[0x1E4F143B8];
  self->_contentInsets = *(UIEdgeInsets *)ymmword_18BD1B580;
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  incidentIconImageView = self->_incidentIconImageView;
  self->_incidentIconImageView = v4;

  [(UIImageView *)self->_incidentIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKTransitItemIncidentView *)self addSubview:self->_incidentIconImageView];
  self->_needsConstraintsRebuild = 1;
  [(UIImageView *)self->_incidentIconImageView setContentMode:1];
  objc_super v6 = objc_alloc_init(MKTransitIncidentItemCellBackgroundView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v6;

  [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKTransitItemIncidentView *)self addSubview:self->_backgroundView];
  [(MKTransitItemIncidentView *)self sendSubviewToBack:self->_backgroundView];
  v8 = [(MKTransitItemIncidentView *)self bottomAnchor];
  v9 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView bottomAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  bottomToBackgroundConstraint = self->_bottomToBackgroundConstraint;
  self->_bottomToBackgroundConstraint = v10;

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView leadingAnchor];
  v33 = [(MKTransitItemIncidentView *)self layoutMarginsGuide];
  v31 = [v33 leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v34[0] = v30;
  v29 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView trailingAnchor];
  v13 = [(MKTransitItemIncidentView *)self layoutMarginsGuide];
  v14 = [v13 trailingAnchor];
  v15 = [v29 constraintEqualToAnchor:v14];
  v34[1] = v15;
  v16 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView topAnchor];
  v17 = [(MKTransitItemIncidentView *)self topAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v19 = self->_bottomToBackgroundConstraint;
  v34[2] = v18;
  v34[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  [v12 addObjectsFromArray:v20];

  v21 = objc_alloc_init(_MKUILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v21;

  [(_MKUILabel *)self->_titleLabel set_mapkit_themeColorProvider:&__block_literal_global_64];
  [(_MKUILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)self->_titleLabel setTextAlignment:4];
  [(_MKUILabel *)self->_titleLabel setNumberOfLines:0];
  [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView addSubview:self->_titleLabel];
  v23 = objc_alloc_init(_MKUILabel);
  lastUpdatedLabel = self->_lastUpdatedLabel;
  self->_lastUpdatedLabel = v23;

  LODWORD(v25) = 1148846080;
  [(UIView *)self->_lastUpdatedLabel _mapkit_setContentHuggingPriority:0 forAxis:v25];
  LODWORD(v26) = 1148829696;
  [(UIView *)self->_lastUpdatedLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v26];
  [(_MKUILabel *)self->_lastUpdatedLabel set_mapkit_themeColorProvider:&__block_literal_global_6];
  [(_MKUILabel *)self->_lastUpdatedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  if (MKApplicationLayoutDirectionIsRightToLeft()) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = 2;
  }
  [(_MKUILabel *)self->_lastUpdatedLabel setTextAlignment:v27];
  [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView addSubview:self->_lastUpdatedLabel];
  v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v28 addObserver:self selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];

  [(MKTransitItemIncidentView *)self _updateConstraintValues];
  [MEMORY[0x1E4F28DC8] activateConstraints:v12];
}

uint64_t __43__MKTransitItemIncidentView_configureViews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 textColor];
}

uint64_t __43__MKTransitItemIncidentView_configureViews__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 tertiaryTextColor];
}

- (void)configureWithIncident:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v14 = +[MKTransitIncidentStringProvider cellTitleForIncident:v11];
  id v12 = [v11 lastUpdated];
  uint64_t v13 = [v11 isBlockingIncident];

  [(MKTransitItemIncidentView *)self _configureWithMessage:v14 referenceDate:v10 lastUpdated:v12 incidentIsBlocking:v13 shouldShowImage:v7 inSiri:v6];
}

- (void)configureWithMessage:(id)a3 incident:(id)a4 referenceDate:(id)a5 shouldShowImage:(BOOL)a6 inSiri:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v16 = [v13 lastUpdated];
  uint64_t v15 = [v13 isBlockingIncident];

  [(MKTransitItemIncidentView *)self _configureWithMessage:v14 referenceDate:v12 lastUpdated:v16 incidentIsBlocking:v15 shouldShowImage:v8 inSiri:v7];
}

- (void)configureWithIncidentMessage:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 transitIncidents];
  uint64_t v13 = [v12 count];

  if (v13 == 1)
  {
    id v14 = [v10 transitIncidents];
    uint64_t v15 = [v14 firstObject];
    [(MKTransitItemIncidentView *)self configureWithIncident:v15 referenceDate:v11 shouldShowImage:v7 inSiri:v6];
  }
  else
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    id v16 = [v10 transitIncidents];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __95__MKTransitItemIncidentView_configureWithIncidentMessage_referenceDate_shouldShowImage_inSiri___block_invoke;
    v18[3] = &unk_1E54BBEE8;
    v18[4] = &v19;
    [v16 enumerateObjectsUsingBlock:v18];

    v17 = [v10 routingMessage];
    [(MKTransitItemIncidentView *)self _configureWithMessage:v17 referenceDate:0 lastUpdated:0 incidentIsBlocking:*((unsigned __int8 *)v20 + 24) shouldShowImage:v7 inSiri:v6];

    _Block_object_dispose(&v19, 8);
  }
}

uint64_t __95__MKTransitItemIncidentView_configureWithIncidentMessage_referenceDate_shouldShowImage_inSiri___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isBlockingIncident];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_configureWithMessage:(id)a3 referenceDate:(id)a4 lastUpdated:(id)a5 incidentIsBlocking:(BOOL)a6 shouldShowImage:(BOOL)a7 inSiri:(BOOL)a8
{
  BOOL v24 = a7;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = objc_alloc_init(MEMORY[0x1E4F42670]);
  LODWORD(v16) = 1058642330;
  [v15 setHyphenationFactor:v16];
  uint64_t v25 = *MEMORY[0x1E4F42540];
  v26[0] = v15;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  v18 = &stru_1ED919588;
  if (v12) {
    v18 = v12;
  }
  uint64_t v19 = v18;
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v19 attributes:v17];
  [(_MKUILabel *)self->_titleLabel setAttributedText:v20];

  if (v13 && v14)
  {
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C00], "_mapkit_descriptionForTimeSinceDate:referenceDate:", v14, v13);

    char v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v21 attributes:v17];
    [(_MKUILabel *)self->_lastUpdatedLabel setAttributedText:v22];

    uint64_t v19 = (__CFString *)v21;
  }
  else
  {
    [(_MKUILabel *)self->_lastUpdatedLabel setAttributedText:0];
  }
  self->_incidentIsBlocking = a6;
  [(MKTransitItemIncidentView *)self infoCardThemeChanged];
  if (v24)
  {
    if (self->_incidentIsBlocking) {
      [(MKTransitItemIncidentView *)self _blockingImage];
    }
    else {
    v23 = [(MKTransitItemIncidentView *)self _nonBlockingImage];
    }
    [(UIImageView *)self->_incidentIconImageView setImage:v23];
  }
  else
  {
    [(UIImageView *)self->_incidentIconImageView setImage:0];
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    self->_needsConstraintsRebuild = 1;
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
  }
}

- (void)infoCardThemeChanged
{
  v19.receiver = self;
  v19.super_class = (Class)MKTransitItemIncidentView;
  [(UIView *)&v19 infoCardThemeChanged];
  id v3 = [(MKTransitItemIncidentView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 5)
  {
    v5 = [(UIView *)self mk_theme];
    BOOL v6 = [v5 transitIncidentBackgroundColor];
    [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView setFillColor:v6];

    [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView setStrokeColor:0];
    BOOL v7 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F43870]);
    [(_MKUILabel *)self->_titleLabel setFont:v7];

    BOOL v8 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F438C8], 0);
    [(_MKUILabel *)self->_lastUpdatedLabel setFont:v8];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F42A30];
    id v10 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
    [v10 pointSize];
    id v11 = objc_msgSend(v9, "systemFontOfSize:weight:");
    [(_MKUILabel *)self->_titleLabel setFont:v11];

    id v12 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F43890], 0);
    [(_MKUILabel *)self->_lastUpdatedLabel setFont:v12];

    id v13 = [(UIView *)self mk_theme];
    unint64_t v14 = [v13 themeType];

    if (v14 >= 2)
    {
      if (v14 != 2) {
        return;
      }
      BOOL v8 = [(UIView *)self mk_theme];
      v18 = [v8 transitIncidentBackgroundColor];
      [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView setFillColor:v18];
    }
    else
    {
      if (self->_incidentIsBlocking)
      {
        double v15 = 0.949019611;
        double v16 = 0.286274523;
        double v17 = 0.200000003;
      }
      else
      {
        double v16 = 0.686274529;
        double v15 = 1.0;
        double v17 = 0.0;
      }
      BOOL v8 = [MEMORY[0x1E4F428B8] colorWithRed:v15 green:v16 blue:v17 alpha:0.100000001];
      [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView setFillColor:v8];
    }
  }
}

- (void)setCellPosition:(int64_t)a3
{
}

- (void)setPadBottom:(BOOL)a3
{
  if (self->_padBottom != a3)
  {
    self->_padBottom = a3;
    [(MKTransitItemIncidentView *)self _updateBottomConstraintWithOffset:self->_bottomToBackgroundOffset];
  }
}

- (void)_updateBottomConstraintWithOffset:(double)a3
{
  self->_double bottomToBackgroundOffset = a3;
  BOOL v4 = [(MKTransitItemIncidentView *)self padBottom];
  double bottomToBackgroundOffset = 10.0;
  if (!v4) {
    double bottomToBackgroundOffset = self->_bottomToBackgroundOffset;
  }
  bottomToBackgroundConstraint = self->_bottomToBackgroundConstraint;

  [(NSLayoutConstraint *)bottomToBackgroundConstraint setConstant:bottomToBackgroundOffset];
}

- (int64_t)cellPosition
{
  return [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView position];
}

- (id)_nonBlockingImage
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];
  float v4 = v3;

  v5 = [MEMORY[0x1E4FB3A20] sharedManager];
  uint64_t v6 = [v5 trafficIncidentTypeKey];

  BOOL v7 = [MEMORY[0x1E4FB3A20] sharedManager];
  *(float *)&double v8 = v4;
  v9 = [v7 imageForKey:v6 value:4 contentScale:7 sizeGroup:0 modifiers:v8];

  if (v9 && (CGImageRef v10 = CGImageRetain((CGImageRef)[v9 image])) != 0)
  {
    id v11 = v10;
    id v12 = (void *)MEMORY[0x1E4F42A80];
    [v9 contentScale];
    unint64_t v14 = [v12 imageWithCGImage:v11 scale:0 orientation:v13];
    CGImageRelease(v11);
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MKTransitItemIncidentView;
  [(MKTransitItemIncidentView *)&v4 dealloc];
}

- (void)_contentSizeCategoryDidChange
{
  BOOL useCondensedWidthLayout = self->_useCondensedWidthLayout;
  objc_super v4 = [MEMORY[0x1E4F42738] sharedApplication];
  v5 = [v4 preferredContentSizeCategory];
  self->_needsConstraintsRebuild = useCondensedWidthLayout != UIContentSizeCategoryIsAccessibilityCategory(v5);

  uint64_t v6 = (void *)MEMORY[0x1E4F42A30];
  BOOL v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
  [v7 pointSize];
  double v8 = objc_msgSend(v6, "systemFontOfSize:weight:");
  [(_MKUILabel *)self->_titleLabel setFont:v8];

  v9 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F43890], 0);
  [(_MKUILabel *)self->_lastUpdatedLabel setFont:v9];

  if (self->_needsConstraintsRebuild)
  {
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
  }
  else
  {
    [(MKTransitItemIncidentView *)self _updateConstraintValues];
  }
}

- (void)_updateConstraintValues
{
  double v3 = [(_MKUILabel *)self->_titleLabel font];
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 30.0);
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_titleLabelToTopConstraint, "setConstant:");

  id v7 = [(NSLayoutConstraint *)self->_bottomToLabelConstraint secondItem];
  objc_super v4 = [v7 font];
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 20.0);
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_bottomToLabelConstraint, "setConstant:");

  if (self->_titleToLastUpdatedLabelConstraint)
  {
    v5 = [(_MKUILabel *)self->_lastUpdatedLabel attributedText];
    if ([v5 length])
    {
      uint64_t v6 = [(_MKUILabel *)self->_lastUpdatedLabel font];
      objc_msgSend(v6, "_mapkit_lineHeight");
      UIRoundToViewScale();
      -[NSLayoutConstraint setConstant:](self->_titleToLastUpdatedLabelConstraint, "setConstant:");
    }
    else
    {
      [(NSLayoutConstraint *)self->_titleToLastUpdatedLabelConstraint setConstant:0.0];
    }
  }
  [(MKTransitItemIncidentView *)self _updateBottomConstraintWithOffset:self->_bottomToBackgroundOffset];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MKTransitItemIncidentView;
  [(MKTransitItemIncidentView *)&v3 didMoveToWindow];
  [(MKTransitItemIncidentView *)self _updateConstraintValues];
}

- (void)updateConstraints
{
  if (self->_needsConstraintsRebuild) {
    [(MKTransitItemIncidentView *)self rebuildConstraints];
  }
  v3.receiver = self;
  v3.super_class = (Class)MKTransitItemIncidentView;
  [(MKTransitItemIncidentView *)&v3 updateConstraints];
}

- (void)rebuildConstraints
{
  self->_needsConstraintsRebuild = 0;
  if (self->_constraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  objc_super v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(MKTransitItemIncidentView *)self contentInsets];
  double v5 = v4;
  [(MKTransitItemIncidentView *)self contentInsets];
  double v7 = v6;
  double v8 = [(MKTransitItemIncidentView *)self layoutMarginsGuide];
  id v63 = [v8 trailingAnchor];

  v9 = [(UIImageView *)self->_incidentIconImageView leadingAnchor];
  CGImageRef v10 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView leadingAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10 constant:v5];
  [(NSArray *)v3 addObject:v11];

  id v12 = [(UIImageView *)self->_incidentIconImageView widthAnchor];
  float v13 = [v12 constraintEqualToConstant:32.0];
  [(NSArray *)v3 addObject:v13];

  unint64_t v14 = [(UIImageView *)self->_incidentIconImageView topAnchor];
  double v15 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView topAnchor];
  double v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];
  [(NSArray *)v3 addObject:v16];

  double v17 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView bottomAnchor];
  v18 = [(UIImageView *)self->_incidentIconImageView bottomAnchor];
  objc_super v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18];
  [(NSArray *)v3 addObject:v19];

  v20 = [(UIImageView *)self->_incidentIconImageView centerYAnchor];
  uint64_t v21 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView centerYAnchor];
  char v22 = [v20 constraintEqualToAnchor:v21];
  [(NSArray *)v3 addObject:v22];

  v23 = [(_MKUILabel *)self->_titleLabel firstBaselineAnchor];
  BOOL v24 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView topAnchor];
  uint64_t v25 = [v23 constraintEqualToAnchor:v24];
  titleLabelToTopConstraint = self->_titleLabelToTopConstraint;
  self->_titleLabelToTopConstraint = v25;

  [(NSArray *)v3 addObject:self->_titleLabelToTopConstraint];
  uint64_t v27 = [(_MKUILabel *)self->_titleLabel leadingAnchor];
  v28 = [(UIImageView *)self->_incidentIconImageView trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 constant:10.0];
  [(NSArray *)v3 addObject:v29];

  v30 = [MEMORY[0x1E4F42738] sharedApplication];
  v31 = [v30 preferredContentSizeCategory];
  self->_BOOL useCondensedWidthLayout = UIContentSizeCategoryIsAccessibilityCategory(v31);

  LODWORD(v31) = self->_useCondensedWidthLayout;
  v32 = [(_MKUILabel *)self->_lastUpdatedLabel leadingAnchor];
  titleLabel = self->_titleLabel;
  if (v31)
  {
    v34 = [(_MKUILabel *)titleLabel leadingAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    [(NSArray *)v3 addObject:v35];

    v36 = [(_MKUILabel *)self->_lastUpdatedLabel trailingAnchor];
    v37 = [(_MKUILabel *)self->_titleLabel trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [(NSArray *)v3 addObject:v38];

    v39 = [(_MKUILabel *)self->_titleLabel trailingAnchor];
    v40 = [v63 constraintEqualToAnchor:v39 constant:v7];
    [(NSArray *)v3 addObject:v40];

    v41 = [(_MKUILabel *)self->_lastUpdatedLabel firstBaselineAnchor];
    v42 = [(_MKUILabel *)self->_titleLabel lastBaselineAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    titleToLastUpdatedLabelConstraint = self->_titleToLastUpdatedLabelConstraint;
    self->_titleToLastUpdatedLabelConstraint = v43;

    [(NSArray *)v3 addObject:self->_titleToLastUpdatedLabelConstraint];
    v45 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView bottomAnchor];
    v46 = [(_MKUILabel *)self->_lastUpdatedLabel lastBaselineAnchor];
    v47 = [v45 constraintGreaterThanOrEqualToAnchor:v46];
    bottomToLabelConstraint = self->_bottomToLabelConstraint;
    self->_bottomToLabelConstraint = v47;

    [(NSArray *)v3 addObject:self->_bottomToLabelConstraint];
  }
  else
  {
    v49 = [(_MKUILabel *)titleLabel trailingAnchor];
    v50 = [v32 constraintGreaterThanOrEqualToAnchor:v49 constant:10.0];
    [(NSArray *)v3 addObject:v50];

    v51 = [(_MKUILabel *)self->_lastUpdatedLabel firstBaselineAnchor];
    v52 = [(_MKUILabel *)self->_titleLabel firstBaselineAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    [(NSArray *)v3 addObject:v53];

    v54 = [(_MKUILabel *)self->_lastUpdatedLabel trailingAnchor];
    v55 = [v63 constraintEqualToAnchor:v54 constant:v7];
    [(NSArray *)v3 addObject:v55];

    v56 = [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView bottomAnchor];
    v57 = [(_MKUILabel *)self->_titleLabel lastBaselineAnchor];
    v58 = [v56 constraintGreaterThanOrEqualToAnchor:v57];
    v59 = self->_bottomToLabelConstraint;
    self->_bottomToLabelConstraint = v58;

    [(NSArray *)v3 addObject:self->_bottomToLabelConstraint];
    v60 = self->_titleToLastUpdatedLabelConstraint;
    self->_titleToLastUpdatedLabelConstraint = 0;
  }
  [(MKTransitItemIncidentView *)self _updateConstraintValues];
  constraints = self->_constraints;
  self->_constraints = v3;
  v62 = v3;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)padBottom
{
  return self->_padBottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomToBackgroundConstraint, 0);
  objc_storeStrong((id *)&self->_titleToLastUpdatedLabelConstraint, 0);
  objc_storeStrong((id *)&self->_bottomToLabelConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelToTopConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_lastUpdatedLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_incidentIconImageView, 0);
}

@end