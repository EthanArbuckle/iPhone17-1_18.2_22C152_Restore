@interface HUTitleValueIconCell
- (HUTitleValueIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_verticalConstraintsForContentSubview:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUTitleValueIconCell

- (HUTitleValueIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUTitleValueIconCell;
  return [(HUTitleValueCell *)&v5 initWithStyle:a3 reuseIdentifier:a4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HUTitleValueIconCell;
  [(HUTitleValueCell *)&v15 updateUIWithAnimation:a3];
  v4 = [(HUIconCell *)self item];
  objc_super v5 = [v4 latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];

  if (v6)
  {
    [(HUIconCell *)self setHideIcon:0];
    v7 = objc_alloc_init(HUIconCellContentMetrics);
    [(HUIconCell *)self setContentMetrics:v7];

    HUDefaultSizeForIconSize();
    double v9 = v8;
    double v11 = v10;
    v12 = [(HUIconCell *)self contentMetrics];
    objc_msgSend(v12, "setIconSize:", v9, v11);

    v13 = [(HUIconCell *)self contentMetrics];
    objc_msgSend(v13, "setContentInset:", 8.0, 0.0, 8.0, 0.0);

    [(HUIconCell *)self setIconForegroundColorFollowsTintColor:0];
    v14 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(HUIconCell *)self setIconForegroundColor:v14];
  }
  else
  {
    [(HUIconCell *)self setHideIcon:1];
  }
}

- (id)_verticalConstraintsForContentSubview:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 superview];
  v6 = [(HUTitleValueIconCell *)self contentView];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0) {
    NSLog(&cfstr_NotAContentvie.isa);
  }
  double v8 = [(HUIconCell *)self contentMetrics];
  [v8 contentInset];
  double v10 = v9;
  double v11 = [(HUIconCell *)self contentMetrics];
  [v11 contentInset];
  double v13 = v10 + v12;

  v14 = [v4 centerYAnchor];
  objc_super v15 = [(HUTitleValueIconCell *)self contentView];
  v16 = [v15 centerYAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v24[0] = v17;
  v18 = [v4 heightAnchor];

  v19 = [(HUTitleValueIconCell *)self contentView];
  v20 = [v19 heightAnchor];
  v21 = [v18 constraintLessThanOrEqualToAnchor:v20 constant:-v13];
  v24[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

  return v22;
}

- (void)updateConstraints
{
  v3 = [(HUIconCell *)self staticConstraints];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v5 = [(HUTitleValueIconCell *)self contentView];
    v6 = [v5 heightAnchor];
    char v7 = [v6 constraintGreaterThanOrEqualToConstant:44.0];

    LODWORD(v8) = 1148829696;
    [v7 setPriority:v8];
    [v4 addObject:v7];
    [(HUIconCell *)self setStaticConstraints:v4];
    double v9 = (void *)MEMORY[0x1E4F28DC8];
    double v10 = [(HUIconCell *)self staticConstraints];
    [v9 activateConstraints:v10];
  }
  double v11 = [(HUIconCell *)self dynamicConstraints];

  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v13 = [(HUIconCell *)self containerView];
    v14 = [(HUTitleValueIconCell *)self _verticalConstraintsForContentSubview:v13];
    [v12 addObjectsFromArray:v14];

    objc_super v15 = [(HUIconCell *)self iconView];

    v16 = [(HUIconCell *)self containerView];
    v17 = [v16 leadingAnchor];
    v18 = [(HUTitleValueIconCell *)self contentView];
    v19 = [v18 layoutMarginsGuide];
    v20 = [v19 leadingAnchor];
    v21 = [v17 constraintEqualToAnchor:v20];
    [v12 addObject:v21];

    v22 = [(HUIconCell *)self containerView];
    v23 = [v22 trailingAnchor];
    if (v15)
    {
      v24 = [(HUIconCell *)self iconView];
      v25 = [v24 leadingAnchor];
      v26 = [v23 constraintEqualToAnchor:v25];
      [v12 addObject:v26];

      v27 = [(HUIconCell *)self containerView];
      v28 = [v27 trailingAnchor];
      v29 = [(HUIconCell *)self iconView];
      v30 = [v29 leadingAnchor];
      v31 = [v28 constraintEqualToAnchor:v30 constant:-8.0];
      [v12 addObject:v31];

      v32 = [(HUIconCell *)self iconView];
      v33 = [v32 trailingAnchor];
      v34 = [(HUTitleValueIconCell *)self contentView];
      v35 = [v34 layoutMarginsGuide];
      v36 = [v35 trailingAnchor];
      v37 = [v33 constraintEqualToAnchor:v36];
      [v12 addObject:v37];

      v38 = [(HUIconCell *)self iconView];
      v39 = [v38 heightAnchor];
      v40 = [(HUIconCell *)self contentMetrics];
      [v40 iconSize];
      v42 = [v39 constraintEqualToConstant:v41];
      [v12 addObject:v42];

      v43 = [(HUIconCell *)self iconView];
      v44 = [v43 widthAnchor];
      v45 = [(HUIconCell *)self contentMetrics];
      [v45 iconSize];
      v46 = objc_msgSend(v44, "constraintEqualToConstant:");
      [v12 addObject:v46];

      v22 = [(HUIconCell *)self iconView];
      v23 = [(HUTitleValueIconCell *)self _verticalConstraintsForContentSubview:v22];
      [v12 addObjectsFromArray:v23];
    }
    else
    {
      v47 = [(HUTitleValueIconCell *)self contentView];
      v48 = [v47 layoutMarginsGuide];
      v49 = [v48 trailingAnchor];
      v50 = [v23 constraintEqualToAnchor:v49];
      [v12 addObject:v50];
    }
    v51 = [(HUIconCell *)self iconView];
    LODWORD(v52) = 1148846080;
    [v51 setContentHuggingPriority:0 forAxis:v52];

    [(HUIconCell *)self setDynamicConstraints:v12];
    v53 = (void *)MEMORY[0x1E4F28DC8];
    v54 = [(HUIconCell *)self dynamicConstraints];
    [v53 activateConstraints:v54];
  }
  v55.receiver = self;
  v55.super_class = (Class)HUTitleValueIconCell;
  [(HUTitleValueCell *)&v55 updateConstraints];
}

@end