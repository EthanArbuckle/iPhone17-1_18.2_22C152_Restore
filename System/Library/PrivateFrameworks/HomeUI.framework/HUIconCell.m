@interface HUIconCell
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)disableContinuousIconAnimation;
- (BOOL)hideIcon;
- (BOOL)iconForegroundColorFollowsTintColor;
- (BOOL)iconTintColorFollowsDisabledState;
- (BOOL)isDisabled;
- (BOOL)separatorInsetLinesUpWithText;
- (HFItem)item;
- (HUIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUIconCellContentMetrics)contentMetrics;
- (HUIconView)iconView;
- (NSArray)dynamicConstraints;
- (NSArray)iconSpacingConstraints;
- (NSArray)staticConstraints;
- (UIColor)iconForegroundColor;
- (UILayoutGuide)iconSpacingLayoutGuide;
- (UIView)containerView;
- (double)iconAlpha;
- (id)_verticalConstraintsForContentSubview:(id)a3;
- (unint64_t)iconDisplayStyle;
- (void)_createIconView;
- (void)_invalidateDynamicConstraints;
- (void)_updateIcon;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContainerView:(id)a3;
- (void)setContentMetrics:(id)a3;
- (void)setDisableContinuousIconAnimation:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDynamicConstraints:(id)a3;
- (void)setHideIcon:(BOOL)a3;
- (void)setIconAlpha:(double)a3;
- (void)setIconDisplayStyle:(unint64_t)a3;
- (void)setIconForegroundColor:(id)a3;
- (void)setIconForegroundColorFollowsTintColor:(BOOL)a3;
- (void)setIconSpacingConstraints:(id)a3;
- (void)setIconSpacingLayoutGuide:(id)a3;
- (void)setIconTintColorFollowsDisabledState:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setItem:(id)a3;
- (void)setSeparatorInsetLinesUpWithText:(BOOL)a3;
- (void)setStaticConstraints:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUIconCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)HUIconCell;
  v4 = [(HUIconCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = +[HUIconCellContentMetrics defaultMetrics];
    contentMetrics = v4->_contentMetrics;
    v4->_contentMetrics = (HUIconCellContentMetrics *)v5;

    uint64_t v7 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    iconForegroundColor = v4->_iconForegroundColor;
    v4->_iconForegroundColor = (UIColor *)v7;

    v4->_iconForegroundColorFollowsTintColor = 1;
    v4->_iconAlpha = 1.0;
    v4->_iconDisplayStyle = 3;
    v4->_iconTintColorFollowsDisabledState = 1;
    v4->_separatorInsetLinesUpWithText = 1;
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    containerView = v4->_containerView;
    v4->_containerView = v9;

    [(UIView *)v4->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(HUIconCell *)v4 contentView];
    [v11 addSubview:v4->_containerView];

    v12 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    iconSpacingLayoutGuide = v4->_iconSpacingLayoutGuide;
    v4->_iconSpacingLayoutGuide = v12;

    [(UILayoutGuide *)v4->_iconSpacingLayoutGuide setIdentifier:@"HUIconCellIconSpacingLayoutGuide"];
    v14 = [(HUIconCell *)v4 contentView];
    [v14 addLayoutGuide:v4->_iconSpacingLayoutGuide];

    [(HUIconCell *)v4 _createIconView];
  }
  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)HUIconCell;
  [(HUIconCell *)&v5 prepareForReuse];
  [(HUIconCell *)self setItem:0];
  [(HUIconCell *)self setDisabled:0];
  [(HUIconCell *)self setHideIcon:0];
  v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [(HUIconCell *)self setIconForegroundColor:v3];

  [(HUIconCell *)self setIconForegroundColorFollowsTintColor:1];
  [(HUIconCell *)self setIconAlpha:1.0];
  v4 = +[HUIconCellContentMetrics defaultMetrics];
  [(HUIconCell *)self setContentMetrics:v4];

  [(HUIconCell *)self setIconDisplayStyle:3];
  [(HUIconCell *)self setDisableContinuousIconAnimation:0];
}

- (void)setHideIcon:(BOOL)a3
{
  if (self->_hideIcon != a3)
  {
    self->_hideIcon = a3;
    if (a3)
    {
      v4 = [(HUIconCell *)self iconView];
      [v4 removeFromSuperview];

      [(HUIconCell *)self setIconView:0];
    }
    else
    {
      [(HUIconCell *)self _createIconView];
    }
    [(HUIconCell *)self _invalidateDynamicConstraints];
  }
}

- (void)setContentMetrics:(id)a3
{
  id v5 = a3;
  v6 = self->_contentMetrics;
  uint64_t v7 = (HUIconCellContentMetrics *)v5;
  v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_8;
  }
  if (!v6)
  {

    goto LABEL_7;
  }
  char v8 = [(HUIconCellContentMetrics *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_contentMetrics, a3);
    [(HUIconCell *)self _invalidateDynamicConstraints];
  }
LABEL_8:
}

- (void)setIconForegroundColor:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = (UIColor *)v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  iconForegroundColor = self->_iconForegroundColor;
  self->_iconForegroundColor = v5;

  [(HUIconCell *)self _updateIcon];
}

- (void)setIconForegroundColorFollowsTintColor:(BOOL)a3
{
  self->_iconForegroundColorFollowsTintColor = a3;
  [(HUIconCell *)self _updateIcon];
}

- (void)setIconAlpha:(double)a3
{
  self->_iconAlpha = a3;
  [(HUIconCell *)self _updateIcon];
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  [(HUIconCell *)self _updateIcon];
}

- (void)setIconDisplayStyle:(unint64_t)a3
{
  if (self->_iconDisplayStyle != a3)
  {
    self->_iconDisplayStyle = a3;
    [(HUIconCell *)self updateUIWithAnimation:0];
  }
}

- (void)setIconTintColorFollowsDisabledState:(BOOL)a3
{
  self->_iconTintColorFollowsDisabledState = a3;
  [(HUIconCell *)self _updateIcon];
}

- (BOOL)disableContinuousIconAnimation
{
  v2 = [(HUIconCell *)self iconView];
  char v3 = [v2 disableContinuousAnimation];

  return v3;
}

- (void)setDisableContinuousIconAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUIconCell *)self iconView];
  [v4 setDisableContinuousAnimation:v3];
}

- (void)updateConstraints
{
  BOOL v3 = [(HUIconCell *)self staticConstraints];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [(HUIconCell *)self contentView];
    v6 = [v5 heightAnchor];
    id v7 = [v6 constraintGreaterThanOrEqualToConstant:44.0];

    LODWORD(v8) = 1148829696;
    [v7 setPriority:v8];
    [v4 addObject:v7];
    v9 = [(HUIconCell *)self containerView];
    v10 = [v9 trailingAnchor];
    v11 = [(HUIconCell *)self contentView];
    v12 = [v11 layoutMarginsGuide];
    v13 = [v12 trailingAnchor];
    v14 = [v10 constraintEqualToAnchor:v13];
    [v4 addObject:v14];

    [(HUIconCell *)self setStaticConstraints:v4];
    v15 = (void *)MEMORY[0x1E4F28DC8];
    objc_super v16 = [(HUIconCell *)self staticConstraints];
    [v15 activateConstraints:v16];
  }
  v17 = [(HUIconCell *)self dynamicConstraints];

  if (!v17)
  {
    v18 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [(HUIconCell *)self iconSpacingConstraints];
    [v18 deactivateConstraints:v19];

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v21 = [(HUIconCell *)self iconSpacingLayoutGuide];
    v22 = [v21 leadingAnchor];
    v23 = [(HUIconCell *)self contentView];
    v24 = [v23 layoutMarginsGuide];
    v25 = [v24 leadingAnchor];
    v26 = [v22 constraintEqualToAnchor:v25];
    [v20 addObject:v26];

    v27 = [(HUIconCell *)self iconSpacingLayoutGuide];
    v28 = [v27 heightAnchor];
    v29 = [(HUIconCell *)self contentMetrics];
    [v29 iconSize];
    v31 = [v28 constraintEqualToConstant:v30];
    [v20 addObject:v31];

    v32 = [(HUIconCell *)self iconSpacingLayoutGuide];
    v33 = [v32 widthAnchor];
    v34 = [(HUIconCell *)self contentMetrics];
    [v34 iconSize];
    v35 = objc_msgSend(v33, "constraintEqualToConstant:");
    [v20 addObject:v35];

    [(HUIconCell *)self setIconSpacingConstraints:v20];
    v36 = (void *)MEMORY[0x1E4F28DC8];
    v37 = [(HUIconCell *)self iconSpacingConstraints];
    [v36 activateConstraints:v37];

    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v39 = [(HUIconCell *)self containerView];
    v40 = [(HUIconCell *)self _verticalConstraintsForContentSubview:v39];
    [v38 addObjectsFromArray:v40];

    v41 = [(HUIconCell *)self iconView];

    v42 = [(HUIconCell *)self containerView];
    v43 = [v42 leadingAnchor];
    if (v41)
    {
      v44 = [(HUIconCell *)self iconSpacingLayoutGuide];
      v45 = [v44 trailingAnchor];
      v46 = [v43 constraintEqualToAnchor:v45 constant:12.0];
      [v38 addObject:v46];

      v47 = [(HUIconCell *)self iconView];
      v48 = [v47 centerXAnchor];
      v49 = [(HUIconCell *)self iconSpacingLayoutGuide];
      v50 = [v49 centerXAnchor];
      v51 = [v48 constraintEqualToAnchor:v50];
      [v38 addObject:v51];

      v52 = [(HUIconCell *)self iconView];
      v53 = [v52 heightAnchor];
      v54 = [(HUIconCell *)self contentMetrics];
      [v54 iconSize];
      v56 = [v53 constraintEqualToConstant:v55];
      [v38 addObject:v56];

      v57 = [(HUIconCell *)self iconView];
      v58 = [v57 widthAnchor];
      v59 = [(HUIconCell *)self contentMetrics];
      [v59 iconSize];
      v60 = objc_msgSend(v58, "constraintEqualToConstant:");
      [v38 addObject:v60];

      v42 = [(HUIconCell *)self iconView];
      v43 = [(HUIconCell *)self _verticalConstraintsForContentSubview:v42];
      [v38 addObjectsFromArray:v43];
    }
    else
    {
      v61 = [(HUIconCell *)self contentView];
      v62 = [v61 layoutMarginsGuide];
      v63 = [v62 leadingAnchor];
      v64 = [v43 constraintEqualToAnchor:v63];
      [v38 addObject:v64];
    }
    v65 = [(HUIconCell *)self iconView];
    LODWORD(v66) = 1148846080;
    [v65 setContentHuggingPriority:0 forAxis:v66];

    [(HUIconCell *)self setDynamicConstraints:v38];
    v67 = (void *)MEMORY[0x1E4F28DC8];
    v68 = [(HUIconCell *)self dynamicConstraints];
    [v67 activateConstraints:v68];
  }
  v69.receiver = self;
  v69.super_class = (Class)HUIconCell;
  [(HUIconCell *)&v69 updateConstraints];
}

- (void)layoutSubviews
{
  BOOL v3 = [(HUIconCell *)self iconView];

  if (v3)
  {
    id v4 = [(HUIconCell *)self contentView];
    [v4 layoutMargins];
    double v6 = v5;

    if ([(HUIconCell *)self separatorInsetLinesUpWithText])
    {
      id v7 = [(HUIconCell *)self contentMetrics];
      [v7 iconSize];
      double v6 = v6 + v8 + 12.0;
    }
    -[HUIconCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v6, 0.0, 0.0);
  }
  v9.receiver = self;
  v9.super_class = (Class)HUIconCell;
  [(HUIconCell *)&v9 layoutSubviews];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(HUIconCell *)self iconView];
  double v5 = [(HUIconCell *)self item];
  double v6 = [v5 latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  objc_msgSend(v8, "updateWithIconDescriptor:displayStyle:animated:", v7, -[HUIconCell iconDisplayStyle](self, "iconDisplayStyle"), v3);
}

- (id)_verticalConstraintsForContentSubview:(id)a3
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 superview];
  double v6 = [(HUIconCell *)self contentView];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0) {
    NSLog(&cfstr_NotAContentvie.isa);
  }
  id v8 = [(HUIconCell *)self contentMetrics];
  [v8 contentInset];
  double v10 = v9;
  v11 = [(HUIconCell *)self contentMetrics];
  [v11 contentInset];
  double v13 = v10 + v12;

  double v30 = [v4 topAnchor];
  v31 = [(HUIconCell *)self contentView];
  v29 = [v31 topAnchor];
  v28 = [v30 constraintGreaterThanOrEqualToAnchor:v29];
  v32[0] = v28;
  v26 = [v4 bottomAnchor];
  v27 = [(HUIconCell *)self contentView];
  v14 = [v27 bottomAnchor];
  v15 = [v26 constraintLessThanOrEqualToAnchor:v14];
  v32[1] = v15;
  objc_super v16 = [v4 centerYAnchor];
  v17 = [(HUIconCell *)self contentView];
  v18 = [v17 centerYAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v32[2] = v19;
  id v20 = [v4 heightAnchor];

  v21 = [(HUIconCell *)self contentView];
  v22 = [v21 heightAnchor];
  v23 = [v20 constraintLessThanOrEqualToAnchor:v22 constant:-v13];
  v32[3] = v23;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];

  return v25;
}

- (void)_invalidateDynamicConstraints
{
  BOOL v3 = (void *)MEMORY[0x1E4F28DC8];
  id v4 = [(HUIconCell *)self dynamicConstraints];
  [v3 deactivateConstraints:v4];

  [(HUIconCell *)self setDynamicConstraints:0];

  [(HUIconCell *)self setNeedsUpdateConstraints];
}

- (void)_createIconView
{
  BOOL v3 = [(HUIconCell *)self iconView];

  if (v3) {
    NSLog(&cfstr_AlreadyHaveIco.isa, self);
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F6A428]);
  [(HUIconCell *)self setIconView:v4];

  double v5 = [(HUIconCell *)self iconView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v6 = [(HUIconCell *)self iconView];
  [v6 setContentMode:1];

  [(HUIconCell *)self _updateIcon];
  id v8 = [(HUIconCell *)self contentView];
  char v7 = [(HUIconCell *)self iconView];
  [v8 addSubview:v7];
}

- (void)_updateIcon
{
  if ([(HUIconCell *)self isDisabled]
    && [(HUIconCell *)self iconTintColorFollowsDisabledState])
  {
    BOOL v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
    id v4 = [(HUIconCell *)self iconView];
    [v4 setTintColor:v3];

LABEL_8:
    goto LABEL_9;
  }
  BOOL v5 = [(HUIconCell *)self iconForegroundColorFollowsTintColor];
  if (v5)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(HUIconCell *)self iconForegroundColor];
  }
  double v6 = [(HUIconCell *)self iconView];
  [v6 setTintColor:v3];

  if (!v5) {
    goto LABEL_8;
  }
LABEL_9:
  [(HUIconCell *)self iconAlpha];
  if (v7 != 0.0)
  {
    [(HUIconCell *)self iconAlpha];
    double v9 = v8;
    id v10 = [(HUIconCell *)self iconView];
    [v10 setAlpha:v9];
  }
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

- (BOOL)hideIcon
{
  return self->_hideIcon;
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

- (HUIconCellContentMetrics)contentMetrics
{
  return self->_contentMetrics;
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

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
}

- (NSArray)iconSpacingConstraints
{
  return self->_iconSpacingConstraints;
}

- (void)setIconSpacingConstraints:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILayoutGuide)iconSpacingLayoutGuide
{
  return self->_iconSpacingLayoutGuide;
}

- (void)setIconSpacingLayoutGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconSpacingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_iconSpacingConstraints, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_iconForegroundColor, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end