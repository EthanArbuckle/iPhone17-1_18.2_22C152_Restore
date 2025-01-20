@interface HUIconCollectionListCell
- (BOOL)disableContinuousIconAnimation;
- (BOOL)enableTappableIcon;
- (BOOL)iconForegroundColorFollowsTintColor;
- (BOOL)iconTintColorFollowsDisabledState;
- (BOOL)isAnimatingPop;
- (BOOL)isDisabled;
- (BOOL)separatorInsetLinesUpWithText;
- (HFItem)item;
- (HUIconCollectionListCell)initWithFrame:(CGRect)a3;
- (HUIconCollectionListCellDelegate)delegate;
- (HUIconView)iconView;
- (NSLayoutConstraint)iconSizeConstraint;
- (UICellAccessoryCustomView)iconAccessoryView;
- (UIColor)iconForegroundColor;
- (UIView)iconContainerView;
- (double)iconAlpha;
- (id)_buildAccessories;
- (id)configurationState;
- (unint64_t)iconDisplayStyle;
- (unint64_t)iconSize;
- (void)_createIconView;
- (void)_iconTapped:(id)a3;
- (void)_updateIcon;
- (void)setDelegate:(id)a3;
- (void)setDisableContinuousIconAnimation:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setEnableTappableIcon:(BOOL)a3;
- (void)setIconAccessoryView:(id)a3;
- (void)setIconAlpha:(double)a3;
- (void)setIconContainerView:(id)a3;
- (void)setIconDisplayStyle:(unint64_t)a3;
- (void)setIconForegroundColor:(id)a3;
- (void)setIconForegroundColorFollowsTintColor:(BOOL)a3;
- (void)setIconSize:(unint64_t)a3;
- (void)setIconSizeConstraint:(id)a3;
- (void)setIconTintColorFollowsDisabledState:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setIsAnimatingPop:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setSeparatorInsetLinesUpWithText:(BOOL)a3;
- (void)updateAccessories;
- (void)updateConfigurationUsingState:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUIconCollectionListCell

- (HUIconCollectionListCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUIconCollectionListCell;
  v3 = -[HUIconCollectionListCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_iconSize = 0;
    uint64_t v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    iconForegroundColor = v4->_iconForegroundColor;
    v4->_iconForegroundColor = (UIColor *)v5;

    v4->_iconForegroundColorFollowsTintColor = 1;
    v4->_iconAlpha = 1.0;
    v4->_iconDisplayStyle = 1;
    v4->_iconTintColorFollowsDisabledState = 1;
    v4->_separatorInsetLinesUpWithText = 1;
    [(HUIconCollectionListCell *)v4 _createIconView];
  }
  return v4;
}

- (void)setIconForegroundColor:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    uint64_t v5 = (UIColor *)v4;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  iconForegroundColor = self->_iconForegroundColor;
  self->_iconForegroundColor = v5;

  [(HUIconCollectionListCell *)self _updateIcon];
}

- (void)setIconForegroundColorFollowsTintColor:(BOOL)a3
{
  self->_iconForegroundColorFollowsTintColor = a3;
  [(HUIconCollectionListCell *)self _updateIcon];
}

- (void)setIconAlpha:(double)a3
{
  self->_iconAlpha = a3;
  [(HUIconCollectionListCell *)self _updateIcon];
}

- (id)configurationState
{
  v5.receiver = self;
  v5.super_class = (Class)HUIconCollectionListCell;
  v3 = [(HUIconCollectionListCell *)&v5 configurationState];
  objc_msgSend(v3, "setDisabled:", -[HUIconCollectionListCell isDisabled](self, "isDisabled"));

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  [(HUIconCollectionListCell *)self setNeedsUpdateConfiguration];
}

- (void)setIconDisplayStyle:(unint64_t)a3
{
  if (self->_iconDisplayStyle != a3)
  {
    self->_iconDisplayStyle = a3;
    [(HUIconCollectionListCell *)self updateUIWithAnimation:0];
  }
}

- (void)setIconSize:(unint64_t)a3
{
  objc_super v5 = [(HUIconCollectionListCell *)self iconView];
  [v5 setIconSize:a3];

  [(HUIconCollectionListCell *)self iconSize];
  HUDefaultSizeForIconSize();
  double v7 = v6;
  id v8 = [(HUIconCollectionListCell *)self iconSizeConstraint];
  [v8 setConstant:v7];
}

- (void)setIconTintColorFollowsDisabledState:(BOOL)a3
{
  self->_iconTintColorFollowsDisabledState = a3;
  [(HUIconCollectionListCell *)self _updateIcon];
}

- (BOOL)disableContinuousIconAnimation
{
  v2 = [(HUIconCollectionListCell *)self iconView];
  char v3 = [v2 disableContinuousAnimation];

  return v3;
}

- (void)setDisableContinuousIconAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUIconCollectionListCell *)self iconView];
  [v4 setDisableContinuousAnimation:v3];
}

- (void)setEnableTappableIcon:(BOOL)a3
{
  self->_enableTappableIcon = a3;
  [(HUIconCollectionListCell *)self _updateIcon];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(HUIconCollectionListCell *)self iconView];
  double v6 = [(HUIconCollectionListCell *)self item];
  double v7 = [v6 latestResults];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  objc_msgSend(v5, "updateWithIconDescriptor:displayStyle:animated:", v8, -[HUIconCollectionListCell iconDisplayStyle](self, "iconDisplayStyle"), v3);

  [(HUIconCollectionListCell *)self updateAccessories];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HUIconCollectionListCell *)self contentConfiguration];
  double v6 = [v5 updatedConfigurationForState:v4];

  [(HUIconCollectionListCell *)self setContentConfiguration:v6];

  [(HUIconCollectionListCell *)self _updateIcon];
}

- (void)updateAccessories
{
  id v3 = [(HUIconCollectionListCell *)self _buildAccessories];
  [(HUIconCollectionListCell *)self setAccessories:v3];
}

- (id)_buildAccessories
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(HUIconCollectionListCell *)self iconAccessoryView];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)_createIconView
{
  id v3 = [(HUIconCollectionListCell *)self iconView];

  if (v3) {
    NSLog(&cfstr_AlreadyHaveIco.isa, self);
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F6A428]);
  [(HUIconCollectionListCell *)self setIconView:v4];

  objc_super v5 = [(HUIconCollectionListCell *)self iconView];
  [v5 setContentMode:1];

  id v6 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(HUIconCollectionListCell *)self setIconContainerView:v6];

  double v7 = [(HUIconCollectionListCell *)self iconContainerView];
  id v8 = [(HUIconCollectionListCell *)self iconView];
  [v7 addSubview:v8];

  id v43 = [MEMORY[0x1E4F1CA48] array];
  [(HUIconCollectionListCell *)self iconSize];
  HUDefaultSizeForIconSize();
  double v10 = v9;
  v11 = [(HUIconCollectionListCell *)self iconView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(HUIconCollectionListCell *)self iconView];
  v13 = [v12 widthAnchor];
  v14 = [v13 constraintEqualToConstant:v10];
  [(HUIconCollectionListCell *)self setIconSizeConstraint:v14];

  v15 = [(HUIconCollectionListCell *)self iconSizeConstraint];
  [v43 addObject:v15];

  v16 = [(HUIconCollectionListCell *)self iconView];
  v17 = [v16 heightAnchor];
  v18 = [(HUIconCollectionListCell *)self iconView];
  v19 = [v18 widthAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v43 addObject:v20];

  v21 = [(HUIconCollectionListCell *)self iconContainerView];
  v22 = [v21 centerXAnchor];
  v23 = [(HUIconCollectionListCell *)self iconView];
  v24 = [v23 centerXAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v43 addObject:v25];

  v26 = [(HUIconCollectionListCell *)self iconContainerView];
  v27 = [v26 centerYAnchor];
  v28 = [(HUIconCollectionListCell *)self iconView];
  v29 = [v28 centerYAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v43 addObject:v30];

  v31 = [(HUIconCollectionListCell *)self iconContainerView];
  v32 = [v31 widthAnchor];
  [(HUIconCollectionListCell *)self frame];
  v34 = [v32 constraintEqualToConstant:v33];
  [v43 addObject:v34];

  v35 = [(HUIconCollectionListCell *)self iconContainerView];
  v36 = [v35 heightAnchor];
  v37 = [(HUIconCollectionListCell *)self iconContainerView];
  v38 = [v37 widthAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  [v43 addObject:v39];

  [MEMORY[0x1E4F28DC8] activateConstraints:v43];
  id v40 = objc_alloc(MEMORY[0x1E4F42828]);
  v41 = [(HUIconCollectionListCell *)self iconContainerView];
  v42 = (void *)[v40 initWithCustomView:v41 placement:0];
  [(HUIconCollectionListCell *)self setIconAccessoryView:v42];

  [(HUIconCollectionListCell *)self _updateIcon];
}

- (void)_updateIcon
{
  if ([(HUIconCollectionListCell *)self isDisabled]
    && [(HUIconCollectionListCell *)self iconTintColorFollowsDisabledState])
  {
    id v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
    id v4 = [(HUIconCollectionListCell *)self iconView];
    [v4 setTintColor:v3];

LABEL_8:
    goto LABEL_9;
  }
  BOOL v5 = [(HUIconCollectionListCell *)self iconForegroundColorFollowsTintColor];
  if (v5)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(HUIconCollectionListCell *)self iconForegroundColor];
  }
  id v6 = [(HUIconCollectionListCell *)self iconView];
  [v6 setTintColor:v3];

  if (!v5) {
    goto LABEL_8;
  }
LABEL_9:
  [(HUIconCollectionListCell *)self iconAlpha];
  if (v7 != 0.0)
  {
    [(HUIconCollectionListCell *)self iconAlpha];
    double v9 = v8;
    double v10 = [(HUIconCollectionListCell *)self iconView];
    [v10 setAlpha:v9];
  }
  if ([(HUIconCollectionListCell *)self enableTappableIcon])
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__iconTapped_];
    v12 = [(HUIconCollectionListCell *)self iconContainerView];
    [v12 addGestureRecognizer:v11];
  }
  unint64_t v13 = [(HUIconCollectionListCell *)self iconSize];
  v14 = [(HUIconCollectionListCell *)self iconView];
  [v14 setIconSize:v13];

  [(HUIconCollectionListCell *)self updateAccessories];
}

- (void)_iconTapped:(id)a3
{
  if (![(HUIconCollectionListCell *)self isAnimatingPop])
  {
    [(HUIconCollectionListCell *)self setIsAnimatingPop:1];
    id v4 = [(HUIconCollectionListCell *)self iconView];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__HUIconCollectionListCell__iconTapped___block_invoke;
    v7[3] = &unk_1E6386018;
    v7[4] = self;
    +[HUAnimationUtilities schedulePopAnimation:v4 scaleFactor:v7 beginDuration:0.7 endDuration:0.15 completion:0.3];

    BOOL v5 = [(HUIconCollectionListCell *)self delegate];
    id v6 = [(HUIconCollectionListCell *)self item];
    [v5 didTapIconForCell:self withItem:v6];
  }
}

uint64_t __40__HUIconCollectionListCell__iconTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAnimatingPop:0];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (UIColor)iconForegroundColor
{
  return self->_iconForegroundColor;
}

- (BOOL)iconForegroundColorFollowsTintColor
{
  return self->_iconForegroundColorFollowsTintColor;
}

- (double)iconAlpha
{
  return self->_iconAlpha;
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (unint64_t)iconDisplayStyle
{
  return self->_iconDisplayStyle;
}

- (BOOL)iconTintColorFollowsDisabledState
{
  return self->_iconTintColorFollowsDisabledState;
}

- (BOOL)separatorInsetLinesUpWithText
{
  return self->_separatorInsetLinesUpWithText;
}

- (void)setSeparatorInsetLinesUpWithText:(BOOL)a3
{
  self->_separatorInsetLinesUpWithText = a3;
}

- (BOOL)enableTappableIcon
{
  return self->_enableTappableIcon;
}

- (HUIconCollectionListCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUIconCollectionListCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (NSLayoutConstraint)iconSizeConstraint
{
  return self->_iconSizeConstraint;
}

- (void)setIconSizeConstraint:(id)a3
{
}

- (UIView)iconContainerView
{
  return self->_iconContainerView;
}

- (void)setIconContainerView:(id)a3
{
}

- (UICellAccessoryCustomView)iconAccessoryView
{
  return self->_iconAccessoryView;
}

- (void)setIconAccessoryView:(id)a3
{
}

- (BOOL)isAnimatingPop
{
  return self->_isAnimatingPop;
}

- (void)setIsAnimatingPop:(BOOL)a3
{
  self->_isAnimatingPop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconAccessoryView, 0);
  objc_storeStrong((id *)&self->_iconContainerView, 0);
  objc_storeStrong((id *)&self->_iconSizeConstraint, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconForegroundColor, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end