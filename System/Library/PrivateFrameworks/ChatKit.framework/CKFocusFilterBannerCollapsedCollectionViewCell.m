@interface CKFocusFilterBannerCollapsedCollectionViewCell
+ (NSString)reuseIdentifier;
- (BOOL)isFocusFilterEnabled;
- (CKFocusFilterBannerCollapsedCollectionViewCell)initWithFrame:(CGRect)a3;
- (CKFocusFilterBannerDelegate)focusFilterBannerDelegate;
- (UIButton)focusFilterToggleButton;
- (void)_focusFilterToggleButtonSelected:(id)a3;
- (void)_updateFocusFilterToggleButton;
- (void)setFocusFilterBannerDelegate:(id)a3;
- (void)setFocusFilterToggleButton:(id)a3;
- (void)setIsFocusFilterEnabled:(BOOL)a3;
@end

@implementation CKFocusFilterBannerCollapsedCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"FocusFilterBannerCollapsed";
}

- (CKFocusFilterBannerCollapsedCollectionViewCell)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)CKFocusFilterBannerCollapsedCollectionViewCell;
  v3 = -[CKFocusFilterBannerCollapsedCollectionViewCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKFocusFilterBannerCollapsedCollectionViewCell *)v3 contentView];
    [(CKFocusFilterBannerCollapsedCollectionViewCell *)v4 setPreservesSuperviewLayoutMargins:1];
    [v5 setPreservesSuperviewLayoutMargins:1];
    uint64_t v6 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    focusFilterToggleButton = v4->_focusFilterToggleButton;
    v4->_focusFilterToggleButton = (UIButton *)v6;

    v8 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v4];
    [(UIButton *)v4->_focusFilterToggleButton addInteraction:v8];
    [(UIButton *)v4->_focusFilterToggleButton addTarget:v4 action:sel__focusFilterToggleButtonSelected_ forControlEvents:0x2000];
    [(UIButton *)v4->_focusFilterToggleButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v4->_focusFilterToggleButton];
    v9 = +[CKUIBehavior sharedBehaviors];
    [v9 conversationListFocusFilterBannerTopPadding];
    double v11 = v10;

    v12 = +[CKUIBehavior sharedBehaviors];
    [v12 conversationListFocusFilterBannerBottomPadding];
    double v14 = v13;

    v15 = [(UIButton *)v4->_focusFilterToggleButton topAnchor];
    v16 = [v5 topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:v11];
    [v17 setActive:1];

    v18 = [v5 bottomAnchor];
    v19 = [(UIButton *)v4->_focusFilterToggleButton bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:v14];
    [v20 setActive:1];

    v21 = [(UIButton *)v4->_focusFilterToggleButton centerXAnchor];
    v22 = [v5 centerXAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    LODWORD(v24) = 1148846080;
    [(UIButton *)v4->_focusFilterToggleButton setContentCompressionResistancePriority:0 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [(UIButton *)v4->_focusFilterToggleButton setContentHuggingPriority:0 forAxis:v25];
    LODWORD(v26) = 1148846080;
    [(UIButton *)v4->_focusFilterToggleButton setContentCompressionResistancePriority:1 forAxis:v26];
    LODWORD(v27) = 1148846080;
    [(UIButton *)v4->_focusFilterToggleButton setContentHuggingPriority:1 forAxis:v27];
    [(CKFocusFilterBannerCollapsedCollectionViewCell *)v4 _updateFocusFilterToggleButton];
  }
  return v4;
}

- (void)setIsFocusFilterEnabled:(BOOL)a3
{
  if (self->_isFocusFilterEnabled != a3)
  {
    self->_isFocusFilterEnabled = a3;
    [(CKFocusFilterBannerCollapsedCollectionViewCell *)self _updateFocusFilterToggleButton];
  }
}

- (void)_updateFocusFilterToggleButton
{
  BOOL isFocusFilterEnabled = self->_isFocusFilterEnabled;
  v4 = +[CKUIBehavior sharedBehaviors];
  v5 = v4;
  if (isFocusFilterEnabled) {
    [v4 conversationListFocusFilterBannerCollapsedEnabledIcon];
  }
  else {
  id v6 = [v4 conversationListFocusFilterBannerCollapsedDisabledIcon];
  }

  [(UIButton *)self->_focusFilterToggleButton setImage:v6 forState:0];
}

- (void)_focusFilterToggleButtonSelected:(id)a3
{
  BOOL v3 = !self->_isFocusFilterEnabled;
  id v4 = [(CKFocusFilterBannerCollapsedCollectionViewCell *)self focusFilterBannerDelegate];
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

- (UIButton)focusFilterToggleButton
{
  return self->_focusFilterToggleButton;
}

- (void)setFocusFilterToggleButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);

  objc_destroyWeak((id *)&self->_focusFilterBannerDelegate);
}

@end