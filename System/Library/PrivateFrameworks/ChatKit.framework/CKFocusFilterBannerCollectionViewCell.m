@interface CKFocusFilterBannerCollectionViewCell
+ (BOOL)_showsKeyline;
+ (NSString)itemIdentifier;
+ (NSString)reuseIdentifier;
- (BOOL)isFocusFilterEnabled;
- (BOOL)useFullWidthKeylines;
- (CKFocusFilterBannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (CKFocusFilterBannerDelegate)focusFilterBannerDelegate;
- (NSArray)keylineAlignmentConstraints;
- (NSArray)sizeClassDependentConstraints;
- (NSLayoutConstraint)bottomKeylineHeightConstraint;
- (NSLayoutConstraint)topKeylineHeightConstraint;
- (UIButton)focusFilterToggleButton;
- (UILabel)focusFilterStateDescriptionLabel;
- (UIView)bottomKeylineView;
- (UIView)topKeylineView;
- (void)_focusFilterToggleButtonSelected:(id)a3;
- (void)_updateFilterToggleButtonConfiguration;
- (void)_updateKeylineAlignmentConstraints;
- (void)_updateKeylineHeightConstraints;
- (void)_updateSizeClassDependentConstraints;
- (void)_updateTitle;
- (void)contentSizeCategoryDidChange;
- (void)setBottomKeylineHeightConstraint:(id)a3;
- (void)setBottomKeylineView:(id)a3;
- (void)setFocusFilterBannerDelegate:(id)a3;
- (void)setFocusFilterStateDescriptionLabel:(id)a3;
- (void)setFocusFilterToggleButton:(id)a3;
- (void)setIsFocusFilterEnabled:(BOOL)a3;
- (void)setKeylineAlignmentConstraints:(id)a3;
- (void)setSizeClassDependentConstraints:(id)a3;
- (void)setTopKeylineHeightConstraint:(id)a3;
- (void)setTopKeylineView:(id)a3;
- (void)setUseFullWidthKeylines:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKFocusFilterBannerCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"FocusFilterBanner";
}

+ (NSString)itemIdentifier
{
  return (NSString *)@"FocusFilterBanner";
}

+ (BOOL)_showsKeyline
{
  v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 conversationListFocusFilterBannerShowsKeylines];

  return v3;
}

- (CKFocusFilterBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)CKFocusFilterBannerCollectionViewCell;
  char v3 = -[CKFocusFilterBannerCollectionViewCell initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKFocusFilterBannerCollectionViewCell *)v3 contentView];
    [(CKFocusFilterBannerCollectionViewCell *)v4 setPreservesSuperviewLayoutMargins:1];
    [v5 setPreservesSuperviewLayoutMargins:1];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    focusFilterStateDescriptionLabel = v4->_focusFilterStateDescriptionLabel;
    v4->_focusFilterStateDescriptionLabel = v6;

    [(UILabel *)v4->_focusFilterStateDescriptionLabel setNumberOfLines:0];
    [(UILabel *)v4->_focusFilterStateDescriptionLabel setTextAlignment:4];
    [v5 addSubview:v4->_focusFilterStateDescriptionLabel];
    uint64_t v8 = [MEMORY[0x1E4F427E0] buttonWithType:CKIsRunningInMacCatalyst() != 0];
    focusFilterToggleButton = v4->_focusFilterToggleButton;
    v4->_focusFilterToggleButton = (UIButton *)v8;

    [(UIButton *)v4->_focusFilterToggleButton addTarget:v4 action:sel__focusFilterToggleButtonSelected_ forControlEvents:0x2000];
    [v5 addSubview:v4->_focusFilterToggleButton];
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    topKeylineView = v4->_topKeylineView;
    v4->_topKeylineView = v10;

    v12 = [MEMORY[0x1E4F428B8] separatorColor];
    [(UIView *)v4->_topKeylineView setBackgroundColor:v12];

    [v5 addSubview:v4->_topKeylineView];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    bottomKeylineView = v4->_bottomKeylineView;
    v4->_bottomKeylineView = v13;

    v15 = [MEMORY[0x1E4F428B8] separatorColor];
    [(UIView *)v4->_bottomKeylineView setBackgroundColor:v15];

    [v5 addSubview:v4->_bottomKeylineView];
    [(CKFocusFilterBannerCollectionViewCell *)v4 _updateTitle];
    [(UILabel *)v4->_focusFilterStateDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4->_focusFilterToggleButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_topKeylineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_bottomKeylineView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v16) = 1148846080;
    [(UIButton *)v4->_focusFilterToggleButton setContentCompressionResistancePriority:0 forAxis:v16];
    LODWORD(v17) = 1148846080;
    [(UIButton *)v4->_focusFilterToggleButton setContentHuggingPriority:0 forAxis:v17];
    LODWORD(v18) = 1132068864;
    [(UILabel *)v4->_focusFilterStateDescriptionLabel setContentHuggingPriority:0 forAxis:v18];
    LODWORD(v19) = 1148846080;
    [(UILabel *)v4->_focusFilterStateDescriptionLabel setContentCompressionResistancePriority:1 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(UIButton *)v4->_focusFilterToggleButton setContentCompressionResistancePriority:1 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(UILabel *)v4->_focusFilterStateDescriptionLabel setContentHuggingPriority:1 forAxis:v21];
    LODWORD(v22) = 1148846080;
    [(UIButton *)v4->_focusFilterToggleButton setContentHuggingPriority:1 forAxis:v22];
    v23 = [(UIView *)v4->_topKeylineView leadingAnchor];
    v24 = [v5 layoutMarginsGuide];
    v25 = [v24 leadingAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [(UIView *)v4->_bottomKeylineView leadingAnchor];
    v28 = [v5 layoutMarginsGuide];
    v29 = [v28 leadingAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];
    [v30 setActive:1];

    v31 = [(UIView *)v4->_topKeylineView heightAnchor];
    uint64_t v32 = [v31 constraintEqualToConstant:1.0];
    topKeylineHeightConstraint = v4->_topKeylineHeightConstraint;
    v4->_topKeylineHeightConstraint = (NSLayoutConstraint *)v32;

    v34 = [(UIView *)v4->_bottomKeylineView heightAnchor];
    uint64_t v35 = [v34 constraintEqualToConstant:1.0];
    bottomKeylineHeightConstraint = v4->_bottomKeylineHeightConstraint;
    v4->_bottomKeylineHeightConstraint = (NSLayoutConstraint *)v35;

    v37 = (void *)MEMORY[0x1E4F28DC8];
    v48[0] = v4->_topKeylineHeightConstraint;
    v48[1] = v4->_bottomKeylineHeightConstraint;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    [v37 activateConstraints:v38];

    [(CKFocusFilterBannerCollectionViewCell *)v4 _updateKeylineHeightConstraints];
    [(CKFocusFilterBannerCollectionViewCell *)v4 _updateSizeClassDependentConstraints];
    [(CKFocusFilterBannerCollectionViewCell *)v4 _updateFilterToggleButtonConfiguration];
    [(CKFocusFilterBannerCollectionViewCell *)v4 _updateKeylineAlignmentConstraints];
    v39 = [(UIView *)v4->_topKeylineView topAnchor];
    v40 = [v5 topAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v41 setActive:1];

    v42 = [(UIView *)v4->_bottomKeylineView bottomAnchor];
    v43 = [v5 bottomAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    [v44 setActive:1];

    v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v45 addObserver:v4 selector:sel_contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];

    -[UIView setHidden:](v4->_topKeylineView, "setHidden:", [(id)objc_opt_class() _showsKeyline] ^ 1);
    -[UIView setHidden:](v4->_bottomKeylineView, "setHidden:", [(id)objc_opt_class() _showsKeyline] ^ 1);
  }
  return v4;
}

- (void)setIsFocusFilterEnabled:(BOOL)a3
{
  if (self->_isFocusFilterEnabled != a3)
  {
    self->_isFocusFilterEnabled = a3;
    [(CKFocusFilterBannerCollectionViewCell *)self _updateTitle];
  }
}

- (void)setUseFullWidthKeylines:(BOOL)a3
{
  if (self->_useFullWidthKeylines != a3)
  {
    self->_useFullWidthKeylines = a3;
    [(CKFocusFilterBannerCollectionViewCell *)self _updateKeylineAlignmentConstraints];
  }
}

- (void)_updateTitle
{
  char v3 = +[CKUIBehavior sharedBehaviors];
  id v34 = [v3 conversationListFocusFilterBannerTitleFont];

  v4 = +[CKUIBehavior sharedBehaviors];
  v33 = [v4 conversationListFocusFilterBannerTitleValueFont];

  uint64_t v32 = self;
  LODWORD(v3) = self->_isFocusFilterEnabled;
  v5 = CKFrameworkBundle();
  v6 = v5;
  if (v3)
  {
    uint64_t v7 = [v5 localizedStringForKey:@"FILTERED_BY_FOCUS" value:&stru_1EDE4CA38 table:@"ChatKit"];

    uint64_t v8 = +[CKUIBehavior sharedBehaviors];
    v9 = [v8 theme];
    v31 = [v9 transcriptAvailabilityColor];

    v10 = CKFrameworkBundle();
    v30 = [v10 localizedStringForKey:@"TURN_OFF" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v11 = +[CKUIBehavior sharedBehaviors];
    v12 = [v11 theme];
    v29 = [v12 conversationListFocusFilterBannerTextColor];

    v13 = +[CKUIBehavior sharedBehaviors];
    [v13 conversationListFocusFilterBannerEnabledIcon];
  }
  else
  {
    uint64_t v7 = [v5 localizedStringForKey:@"FOCUS_FILTER_OFF" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v14 = +[CKUIBehavior sharedBehaviors];
    v15 = [v14 theme];
    v31 = [v15 conversationListSummaryColor];

    double v16 = CKFrameworkBundle();
    v30 = [v16 localizedStringForKey:@"TURN_ON" value:&stru_1EDE4CA38 table:@"ChatKit"];

    double v17 = +[CKUIBehavior sharedBehaviors];
    double v18 = [v17 theme];
    v29 = [v18 conversationListFocusFilterBannerTextColor];

    v13 = +[CKUIBehavior sharedBehaviors];
    [v13 conversationListFocusFilterBannerDisabledIcon];
  double v19 = };
  v28 = (void *)v7;

  double v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
  objc_msgSend(v20, "replaceCharactersInRange:withString:", 0, 0, @" ");
  id v21 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v21 setImage:v19];
  double v22 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v21];
  [v20 insertAttributedString:v22 atIndex:0];
  uint64_t v23 = [v20 length];
  uint64_t v24 = *MEMORY[0x1E4FB06F8];
  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v34, 0, v23);
  uint64_t v25 = *MEMORY[0x1E4FB0700];
  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v31, 0, v23);
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v30];
  uint64_t v27 = [v26 length];
  objc_msgSend(v26, "addAttribute:value:range:", v24, v33, 0, v27);
  objc_msgSend(v26, "addAttribute:value:range:", v25, v29, 0, v27);
  [(UILabel *)v32->_focusFilterStateDescriptionLabel setAttributedText:v20];
  [(UIButton *)v32->_focusFilterToggleButton setAttributedTitle:v26 forState:0];
}

- (void)_updateKeylineHeightConstraints
{
  char v3 = [(CKFocusFilterBannerCollectionViewCell *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  v6 = +[CKUIBehavior sharedBehaviors];
  int v7 = [v6 isAccessibilityPreferredContentSizeCategory];

  if (v7) {
    double v8 = 1.0;
  }
  else {
    double v8 = 1.0 / v5;
  }
  [(NSLayoutConstraint *)self->_topKeylineHeightConstraint setConstant:v8];
  bottomKeylineHeightConstraint = self->_bottomKeylineHeightConstraint;

  [(NSLayoutConstraint *)bottomKeylineHeightConstraint setConstant:v8];
}

- (void)_updateKeylineAlignmentConstraints
{
  if (self->_keylineAlignmentConstraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  id v17 = [(CKFocusFilterBannerCollectionViewCell *)self contentView];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_useFullWidthKeylines)
  {
    double v4 = [v17 trailingAnchor];
    double v5 = [(UIView *)self->_topKeylineView trailingAnchor];
    v6 = [v4 constraintEqualToAnchor:v5];
    [v3 addObject:v6];

    int v7 = [v17 trailingAnchor];
    double v8 = [(UIView *)self->_bottomKeylineView trailingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    [v3 addObject:v9];
  }
  else
  {
    v10 = [v17 layoutMarginsGuide];
    v11 = [v10 trailingAnchor];
    v12 = [(UIView *)self->_topKeylineView trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v3 addObject:v13];

    int v7 = [v17 layoutMarginsGuide];
    double v8 = [v7 trailingAnchor];
    v9 = [(UIView *)self->_bottomKeylineView trailingAnchor];
    v14 = [v8 constraintEqualToAnchor:v9];
    [v3 addObject:v14];
  }
  v15 = (NSArray *)[v3 copy];
  keylineAlignmentConstraints = self->_keylineAlignmentConstraints;
  self->_keylineAlignmentConstraints = v15;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_keylineAlignmentConstraints];
}

- (void)_updateSizeClassDependentConstraints
{
  if (self->_sizeClassDependentConstraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  id v56 = [(CKFocusFilterBannerCollectionViewCell *)self contentView];
  id v3 = +[CKUIBehavior sharedBehaviors];
  [v3 conversationListFocusFilterBannerTopPadding];
  double v5 = v4;

  v6 = +[CKUIBehavior sharedBehaviors];
  [v6 conversationListFocusFilterBannerBottomPadding];
  double v8 = v7;

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10 = +[CKUIBehavior sharedBehaviors];
  int v11 = [v10 conversationListFocusFilterBannerShouldUseAccessabilityLayout];

  v12 = [(UILabel *)self->_focusFilterStateDescriptionLabel leadingAnchor];
  v13 = [v56 layoutMarginsGuide];
  v14 = [v13 leadingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v9 addObject:v15];

  if (v11)
  {
    double v16 = [(UILabel *)self->_focusFilterStateDescriptionLabel trailingAnchor];
    id v17 = [v56 layoutMarginsGuide];
    double v18 = [v17 trailingAnchor];
    double v19 = [v16 constraintEqualToAnchor:v18];
    [v9 addObject:v19];

    double v20 = [(UIButton *)self->_focusFilterToggleButton leadingAnchor];
    id v21 = [v56 layoutMarginsGuide];
    double v22 = [v21 leadingAnchor];
    uint64_t v23 = [v20 constraintEqualToAnchor:v22];
    [v9 addObject:v23];

    uint64_t v24 = [(UIButton *)self->_focusFilterToggleButton trailingAnchor];
    uint64_t v25 = [v56 layoutMarginsGuide];
    v26 = [v25 trailingAnchor];
    uint64_t v27 = [v24 constraintLessThanOrEqualToAnchor:v26];
    [v9 addObject:v27];

    v28 = [(UILabel *)self->_focusFilterStateDescriptionLabel topAnchor];
    v29 = [v56 topAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:v5];
    [v9 addObject:v30];

    v31 = [(UIButton *)self->_focusFilterToggleButton topAnchor];
    uint64_t v32 = [(UILabel *)self->_focusFilterStateDescriptionLabel bottomAnchor];
    v33 = [v31 constraintEqualToAnchor:v32 constant:8.0];
    [v9 addObject:v33];

    id v34 = [v56 bottomAnchor];
    focusFilterToggleButton = self->_focusFilterToggleButton;
  }
  else
  {
    v36 = [(UIButton *)self->_focusFilterToggleButton leadingAnchor];
    v37 = [(UILabel *)self->_focusFilterStateDescriptionLabel trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37 constant:10.0];
    [v9 addObject:v38];

    v39 = [(UIButton *)self->_focusFilterToggleButton trailingAnchor];
    v40 = [v56 layoutMarginsGuide];
    v41 = [v40 trailingAnchor];
    v42 = [v39 constraintEqualToAnchor:v41];
    [v9 addObject:v42];

    v43 = [(UILabel *)self->_focusFilterStateDescriptionLabel centerYAnchor];
    v44 = [v56 centerYAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [v9 addObject:v45];

    v46 = [(UILabel *)self->_focusFilterStateDescriptionLabel topAnchor];
    objc_super v47 = [v56 topAnchor];
    v48 = [v46 constraintEqualToAnchor:v47 constant:v5];
    [v9 addObject:v48];

    v49 = [(UIButton *)self->_focusFilterToggleButton centerYAnchor];
    v50 = [(UILabel *)self->_focusFilterStateDescriptionLabel centerYAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v9 addObject:v51];

    id v34 = [v56 bottomAnchor];
    focusFilterToggleButton = self->_focusFilterStateDescriptionLabel;
  }
  v52 = [focusFilterToggleButton bottomAnchor];
  v53 = [v34 constraintEqualToAnchor:v52 constant:v8];
  [v9 addObject:v53];

  v54 = (NSArray *)[v9 copy];
  sizeClassDependentConstraints = self->_sizeClassDependentConstraints;
  self->_sizeClassDependentConstraints = v54;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_sizeClassDependentConstraints];
}

- (void)_updateFilterToggleButtonConfiguration
{
  id v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 conversationListFocusFilterBannerShouldUseAccessabilityLayout];

  if (v4)
  {
    id v7 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
    [v7 setButtonSize:0];
    [v7 setCornerStyle:4];
    double v5 = [MEMORY[0x1E4F427B0] clearConfiguration];
    v6 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
    [v5 setBackgroundColor:v6];

    [v7 setBackground:v5];
  }
  else
  {
    id v7 = 0;
  }
  [(UIButton *)self->_focusFilterToggleButton setConfiguration:v7];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKFocusFilterBannerCollectionViewCell;
  [(CKFocusFilterBannerCollectionViewCell *)&v4 traitCollectionDidChange:a3];
  [(CKFocusFilterBannerCollectionViewCell *)self _updateKeylineHeightConstraints];
}

- (void)contentSizeCategoryDidChange
{
  [(CKFocusFilterBannerCollectionViewCell *)self _updateTitle];
  [(CKFocusFilterBannerCollectionViewCell *)self _updateSizeClassDependentConstraints];
  [(CKFocusFilterBannerCollectionViewCell *)self _updateKeylineHeightConstraints];

  [(CKFocusFilterBannerCollectionViewCell *)self _updateFilterToggleButtonConfiguration];
}

- (void)_focusFilterToggleButtonSelected:(id)a3
{
  BOOL v3 = !self->_isFocusFilterEnabled;
  id v4 = [(CKFocusFilterBannerCollectionViewCell *)self focusFilterBannerDelegate];
  [v4 focusFilterBannerEnabledStateDidChange:v3];
}

- (CKFocusFilterBannerDelegate)focusFilterBannerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusFilterBannerDelegate);

  return (CKFocusFilterBannerDelegate *)WeakRetained;
}

- (void)setFocusFilterBannerDelegate:(id)a3
{
}

- (BOOL)isFocusFilterEnabled
{
  return self->_isFocusFilterEnabled;
}

- (BOOL)useFullWidthKeylines
{
  return self->_useFullWidthKeylines;
}

- (UILabel)focusFilterStateDescriptionLabel
{
  return self->_focusFilterStateDescriptionLabel;
}

- (void)setFocusFilterStateDescriptionLabel:(id)a3
{
}

- (UIButton)focusFilterToggleButton
{
  return self->_focusFilterToggleButton;
}

- (void)setFocusFilterToggleButton:(id)a3
{
}

- (UIView)topKeylineView
{
  return self->_topKeylineView;
}

- (void)setTopKeylineView:(id)a3
{
}

- (UIView)bottomKeylineView
{
  return self->_bottomKeylineView;
}

- (void)setBottomKeylineView:(id)a3
{
}

- (NSLayoutConstraint)topKeylineHeightConstraint
{
  return self->_topKeylineHeightConstraint;
}

- (void)setTopKeylineHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomKeylineHeightConstraint
{
  return self->_bottomKeylineHeightConstraint;
}

- (void)setBottomKeylineHeightConstraint:(id)a3
{
}

- (NSArray)sizeClassDependentConstraints
{
  return self->_sizeClassDependentConstraints;
}

- (void)setSizeClassDependentConstraints:(id)a3
{
}

- (NSArray)keylineAlignmentConstraints
{
  return self->_keylineAlignmentConstraints;
}

- (void)setKeylineAlignmentConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keylineAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_sizeClassDependentConstraints, 0);
  objc_storeStrong((id *)&self->_bottomKeylineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_topKeylineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_bottomKeylineView, 0);
  objc_storeStrong((id *)&self->_topKeylineView, 0);
  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
  objc_storeStrong((id *)&self->_focusFilterStateDescriptionLabel, 0);

  objc_destroyWeak((id *)&self->_focusFilterBannerDelegate);
}

@end