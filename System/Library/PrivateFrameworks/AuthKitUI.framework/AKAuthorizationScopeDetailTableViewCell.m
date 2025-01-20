@interface AKAuthorizationScopeDetailTableViewCell
- (AKAuthorizationScopeDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (BOOL)_isLTR;
- (BOOL)internalIsChecked;
- (NSLayoutConstraint)mainLabelLeadingConstraint;
- (NSLayoutConstraint)mainLabelWithoutImageLeadingConstraint;
- (NSLayoutConstraint)minimumHeightConstraint;
- (UIImage)scopeImage;
- (UIImageView)leadingCheckmarkView;
- (UIImageView)scopeImageView;
- (UILabel)mainDetailLabel;
- (UILabel)mainLabel;
- (UILabel)scopeLabel;
- (UILayoutGuide)mainGuide;
- (UILayoutGuide)mainLabelFirstLineGuide;
- (UILayoutGuide)scopeLabelFirstLineGuide;
- (double)minimumHeight;
- (id)_checkmarkCircleImage;
- (id)_checkmarkCircleImageViewChecked:(BOOL)a3;
- (id)_checkmarkImage;
- (id)_checkmarkImageView;
- (id)_circleImage;
- (id)_clearImage;
- (id)_newLabel;
- (id)_selectedCheckmarkCircleImageView;
- (id)_unselectedCheckmarkCircleImageView;
- (unint64_t)internalCheckmarkStyle;
- (void)_setCheckMarkStyleLeadingChecked:(BOOL)a3;
- (void)_setCheckmarkStyleTrailingChecked:(BOOL)a3;
- (void)_setSeparatorIndentToMainLabel;
- (void)_setupLayout;
- (void)_setupScopeImageView;
- (void)_setupViews;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
- (void)setCheckmarkStyle:(unint64_t)a3;
- (void)setInternalChecked:(BOOL)a3;
- (void)setInternalCheckmarkStyle:(unint64_t)a3;
- (void)setLeadingCheckmarkView:(id)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setScopeImage:(id)a3;
- (void)setScopeImageView:(id)a3;
@end

@implementation AKAuthorizationScopeDetailTableViewCell

- (AKAuthorizationScopeDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationScopeDetailTableViewCell;
  v4 = [(AKAuthorizationScopeDetailTableViewCell *)&v7 initWithStyle:2 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(AKAuthorizationScopeDetailTableViewCell *)v4 _setupViews];
    [(AKAuthorizationScopeDetailTableViewCell *)v5 _setupLayout];
  }
  return v5;
}

- (void)_setupViews
{
  v3 = [(AKAuthorizationScopeDetailTableViewCell *)self _newLabel];
  scopeLabel = self->_scopeLabel;
  self->_scopeLabel = v3;

  v5 = [(AKAuthorizationScopeDetailTableViewCell *)self _newLabel];
  mainLabel = self->_mainLabel;
  self->_mainLabel = v5;

  objc_super v7 = [(AKAuthorizationScopeDetailTableViewCell *)self _newLabel];
  mainDetailLabel = self->_mainDetailLabel;
  self->_mainDetailLabel = v7;

  v9 = +[AKAuthorizationAppearance scopeTitleFont];
  v10 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  [v10 setFont:v9];

  v11 = +[AKAuthorizationAppearance scopeTitleTextColor];
  v12 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  [v12 setTextColor:v11];

  v13 = +[AKAuthorizationAppearance scopeSubtitleFont];
  v14 = [(AKAuthorizationScopeDetailTableViewCell *)self mainDetailLabel];
  [v14 setFont:v13];

  v15 = +[AKAuthorizationAppearance scopeSubtitleTextColor];
  v16 = [(AKAuthorizationScopeDetailTableViewCell *)self mainDetailLabel];
  [v16 setTextColor:v15];

  v17 = +[AKAuthorizationAppearance scopeInfoLabelFont];
  v18 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeLabel];
  [v18 setFont:v17];

  v19 = +[AKAuthorizationAppearance scopeInfoLabelTextColor];
  v20 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeLabel];
  [v20 setTextColor:v19];

  v21 = +[AKAuthorizationAppearance scopeRowBackgroundColor];
  [(AKAuthorizationScopeDetailTableViewCell *)self setBackgroundColor:v21];

  [(AKAuthorizationScopeDetailTableViewCell *)self _setupScopeImageView];

  [(AKAuthorizationScopeDetailTableViewCell *)self setSelectionStyle:2];
}

- (void)_setupLayout
{
  v108[4] = *MEMORY[0x1E4F143B8];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
  mainGuide = self->_mainGuide;
  self->_mainGuide = v3;

  v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
  mainLabelFirstLineGuide = self->_mainLabelFirstLineGuide;
  self->_mainLabelFirstLineGuide = v5;

  objc_super v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
  scopeLabelFirstLineGuide = self->_scopeLabelFirstLineGuide;
  self->_scopeLabelFirstLineGuide = v7;

  v9 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  v10 = [(AKAuthorizationScopeDetailTableViewCell *)self mainGuide];
  [v9 addLayoutGuide:v10];

  v11 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  v12 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabelFirstLineGuide];
  [v11 addLayoutGuide:v12];

  v13 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  v14 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeLabelFirstLineGuide];
  [v13 addLayoutGuide:v14];

  v106 = [MEMORY[0x1E4F1CA48] array];
  v15 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  v16 = [v15 heightAnchor];
  v17 = [v16 constraintGreaterThanOrEqualToConstant:0.0];
  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = v17;

  v104 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  v100 = [v104 leadingAnchor];
  v102 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  v98 = [v102 leadingAnchor];
  +[AKAuthorizationSubPaneMetrics scopeImageViewLeadingSpacing];
  v96 = objc_msgSend(v100, "constraintEqualToAnchor:constant:", v98);
  v108[0] = v96;
  v94 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  v92 = [v94 widthAnchor];
  +[AKAuthorizationSubPaneMetrics scopeImageViewSize];
  v90 = objc_msgSend(v92, "constraintEqualToConstant:");
  v108[1] = v90;
  v19 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  v20 = [v19 heightAnchor];
  +[AKAuthorizationSubPaneMetrics scopeImageViewSize];
  v21 = objc_msgSend(v20, "constraintEqualToConstant:");
  v108[2] = v21;
  v22 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  v23 = [v22 topAnchor];
  v24 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  v25 = [v24 topAnchor];
  +[AKAuthorizationSubPaneMetrics scopeImageViewTopSpacing];
  v26 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25);
  v108[3] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:4];
  [v106 addObjectsFromArray:v27];

  v28 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  v29 = [v28 leadingAnchor];
  v30 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  v31 = [v30 trailingAnchor];
  +[AKAuthorizationSubPaneMetrics scopeTitleLabelLeadingSpacing];
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31);
  v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  mainLabelLeadingConstraint = self->_mainLabelLeadingConstraint;
  self->_mainLabelLeadingConstraint = v32;

  v34 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  v35 = [v34 leadingAnchor];
  v36 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  v37 = [v36 leadingAnchor];
  v38 = [v35 constraintEqualToAnchor:v37];
  mainLabelWithoutImageLeadingConstraint = self->_mainLabelWithoutImageLeadingConstraint;
  self->_mainLabelWithoutImageLeadingConstraint = v38;

  v105 = [(AKAuthorizationScopeDetailTableViewCell *)self minimumHeightConstraint];
  v107[0] = v105;
  v103 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  v99 = [v103 topAnchor];
  v101 = [(AKAuthorizationScopeDetailTableViewCell *)self mainGuide];
  v97 = [v101 topAnchor];
  v95 = [v99 constraintEqualToAnchor:v97];
  v107[1] = v95;
  v93 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  v89 = [v93 bottomAnchor];
  v91 = [(AKAuthorizationScopeDetailTableViewCell *)self mainDetailLabel];
  v88 = [v91 topAnchor];
  v87 = [v89 constraintEqualToAnchor:v88];
  v107[2] = v87;
  v86 = [(AKAuthorizationScopeDetailTableViewCell *)self mainDetailLabel];
  v84 = [v86 bottomAnchor];
  v85 = [(AKAuthorizationScopeDetailTableViewCell *)self mainGuide];
  v83 = [v85 bottomAnchor];
  v82 = [v84 constraintEqualToAnchor:v83];
  v107[3] = v82;
  v81 = [(AKAuthorizationScopeDetailTableViewCell *)self mainDetailLabel];
  v79 = [v81 leadingAnchor];
  v80 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  v78 = [v80 leadingAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v107[4] = v77;
  v76 = [(AKAuthorizationScopeDetailTableViewCell *)self mainDetailLabel];
  v74 = [v76 trailingAnchor];
  v75 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  v73 = [v75 trailingAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v107[5] = v72;
  v71 = [(AKAuthorizationScopeDetailTableViewCell *)self mainGuide];
  v69 = [v71 centerYAnchor];
  v70 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  v68 = [v70 centerYAnchor];
  v67 = [v69 constraintEqualToAnchor:v68];
  v107[6] = v67;
  v66 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  v64 = [v66 firstBaselineAnchor];
  v65 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  v63 = [v65 topAnchor];
  v62 = [v64 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v63 multiplier:1.0];
  v107[7] = v62;
  v61 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  v59 = [v61 bottomAnchor];
  v60 = [(AKAuthorizationScopeDetailTableViewCell *)self mainDetailLabel];
  v58 = [v60 lastBaselineAnchor];
  v57 = [v59 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v58 multiplier:1.0];
  v107[8] = v57;
  v56 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabelLeadingConstraint];
  v107[9] = v56;
  v55 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  v53 = [v55 trailingAnchor];
  v54 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  v52 = [v54 trailingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:-16.0];
  v107[10] = v51;
  v50 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabelFirstLineGuide];
  v40 = [v50 bottomAnchor];
  v41 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  v42 = [v41 firstBaselineAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  v107[11] = v43;
  v44 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabelFirstLineGuide];
  v45 = [v44 heightAnchor];
  v46 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  v47 = [v46 font];
  [v47 capHeight];
  v48 = objc_msgSend(v45, "constraintEqualToConstant:");
  v107[12] = v48;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:13];
  [v106 addObjectsFromArray:v49];

  [MEMORY[0x1E4F28DC8] activateConstraints:v106];
}

- (id)_newLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setNumberOfLines:0];
  v4 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  [v4 addSubview:v3];

  return v3;
}

- (void)_setupScopeImageView
{
  id v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
  scopeImageView = self->_scopeImageView;
  self->_scopeImageView = v3;

  v5 = +[AKAuthorizationAppearance scopeImageViewBackgroundColor];
  [(UIImageView *)self->_scopeImageView setBackgroundColor:v5];

  [(UIImageView *)self->_scopeImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  +[AKAuthorizationSubPaneMetrics scopeImageViewCornerRadius];
  double v7 = v6;
  v8 = [(UIImageView *)self->_scopeImageView layer];
  [v8 setCornerRadius:v7];

  v9 = +[AKAuthorizationAppearance scopeImageViewTintColor];
  [(UIImageView *)self->_scopeImageView setTintColor:v9];

  [(UIImageView *)self->_scopeImageView setContentMode:4];
  [(UIImageView *)self->_scopeImageView setHidden:1];
  id v10 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
  [v10 addSubview:self->_scopeImageView];
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)AKAuthorizationScopeDetailTableViewCell;
  [(AKAuthorizationScopeDetailTableViewCell *)&v25 layoutSubviews];
  if ([(AKAuthorizationScopeDetailTableViewCell *)self _isLTR]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeLabel];
  [v4 setTextAlignment:v3];

  v5 = [(AKAuthorizationScopeDetailTableViewCell *)self leadingCheckmarkView];

  if (v5)
  {
    double v6 = [(AKAuthorizationScopeDetailTableViewCell *)self leadingCheckmarkView];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;

    v11 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
    [v11 frame];
    double v12 = CGRectGetMidY(v26) + v8 * -0.5;

    BOOL v13 = [(AKAuthorizationScopeDetailTableViewCell *)self _isLTR];
    v14 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
    [v14 frame];
    if (v13)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v15);
      +[AKAuthorizationSubPaneMetrics checkmarkToLabelSpacing];
      double v21 = MinX - v20 - v8;
    }
    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v15);
      +[AKAuthorizationSubPaneMetrics checkmarkToLabelSpacing];
      double v21 = MaxX + v23;
    }

    v24 = [(AKAuthorizationScopeDetailTableViewCell *)self leadingCheckmarkView];
    objc_msgSend(v24, "setFrame:", v21, v12, v8, v10);
  }
}

- (void)_setSeparatorIndentToMainLabel
{
  [(AKAuthorizationScopeDetailTableViewCell *)self separatorInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  +[AKAuthorizationSubPaneMetrics separatorInset];

  -[AKAuthorizationScopeDetailTableViewCell setSeparatorInset:](self, "setSeparatorInset:", v4, v9, v6, v8);
}

- (BOOL)_isLTR
{
  return [(AKAuthorizationScopeDetailTableViewCell *)self effectiveUserInterfaceLayoutDirection] == 0;
}

- (double)minimumHeight
{
  v2 = [(AKAuthorizationScopeDetailTableViewCell *)self minimumHeightConstraint];
  [v2 constant];
  double v4 = v3;

  return v4;
}

- (void)setMinimumHeight:(double)a3
{
  id v4 = [(AKAuthorizationScopeDetailTableViewCell *)self minimumHeightConstraint];
  [v4 setConstant:a3];
}

- (void)setCheckmarkStyle:(unint64_t)a3
{
  if ([(AKAuthorizationScopeDetailTableViewCell *)self internalCheckmarkStyle] != a3)
  {
    unint64_t v5 = [(AKAuthorizationScopeDetailTableViewCell *)self internalCheckmarkStyle];
    if (v5 == 2)
    {
      [(AKAuthorizationScopeDetailTableViewCell *)self setAccessoryType:0];
    }
    else if (v5 == 1)
    {
      [(AKAuthorizationScopeDetailTableViewCell *)self _setCheckMarkStyleLeadingChecked:0];
      +[AKAuthorizationSubPaneMetrics scopeTitleLabelLeadingSpacing];
      double v7 = v6;
      double v8 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabelLeadingConstraint];
      [v8 setConstant:v7];
    }
    [(AKAuthorizationScopeDetailTableViewCell *)self setInternalCheckmarkStyle:a3];
    if (a3 == 2)
    {
      BOOL v11 = [(AKAuthorizationScopeDetailTableViewCell *)self isChecked];
      [(AKAuthorizationScopeDetailTableViewCell *)self _setCheckmarkStyleTrailingChecked:v11];
    }
    else if (a3 == 1)
    {
      double v9 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabelLeadingConstraint];
      [v9 setConstant:40.0];

      BOOL v10 = [(AKAuthorizationScopeDetailTableViewCell *)self isChecked];
      [(AKAuthorizationScopeDetailTableViewCell *)self _setCheckMarkStyleLeadingChecked:v10];
    }
  }
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AKAuthorizationScopeDetailTableViewCell *)self internalIsChecked] != a3)
  {
    [(AKAuthorizationScopeDetailTableViewCell *)self setInternalChecked:v3];
    unint64_t v5 = [(AKAuthorizationScopeDetailTableViewCell *)self checkmarkStyle];
    if (v5 == 2)
    {
      [(AKAuthorizationScopeDetailTableViewCell *)self _setCheckmarkStyleTrailingChecked:v3];
    }
    else if (v5 == 1)
    {
      [(AKAuthorizationScopeDetailTableViewCell *)self _setCheckMarkStyleLeadingChecked:v3];
    }
  }
}

- (void)_setCheckMarkStyleLeadingChecked:(BOOL)a3
{
  if (a3
    && ([(AKAuthorizationScopeDetailTableViewCell *)self leadingCheckmarkView],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    double v7 = [(AKAuthorizationScopeDetailTableViewCell *)self _checkmarkImageView];
    leadingCheckmarkView = self->_leadingCheckmarkView;
    self->_leadingCheckmarkView = v7;

    BOOL v10 = [(AKAuthorizationScopeDetailTableViewCell *)self contentView];
    double v9 = [(AKAuthorizationScopeDetailTableViewCell *)self leadingCheckmarkView];
    [(UIImageView *)v10 addSubview:v9];

    double v6 = v10;
  }
  else
  {
    unint64_t v5 = [(AKAuthorizationScopeDetailTableViewCell *)self leadingCheckmarkView];
    [v5 removeFromSuperview];

    double v6 = self->_leadingCheckmarkView;
    self->_leadingCheckmarkView = 0;
  }
}

- (void)_setCheckmarkStyleTrailingChecked:(BOOL)a3
{
  id v4 = [(AKAuthorizationScopeDetailTableViewCell *)self _checkmarkCircleImageViewChecked:a3];
  [(AKAuthorizationScopeDetailTableViewCell *)self setAccessoryView:v4];
}

- (void)setScopeImage:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_scopeImage, a3);
  scopeImageView = self->_scopeImageView;
  if (self->_scopeImage)
  {
    [(UIImageView *)scopeImageView setImage:v7];
    scopeImageView = self->_scopeImageView;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }
  [(UIImageView *)scopeImageView setHidden:v6];
  [(AKAuthorizationScopeDetailTableViewCell *)self setNeedsLayout];
  [(AKAuthorizationScopeDetailTableViewCell *)self layoutIfNeeded];
}

- (id)_checkmarkImageView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  id v4 = [(AKAuthorizationScopeDetailTableViewCell *)self _checkmarkImage];
  unint64_t v5 = (void *)[v3 initWithImage:v4];

  return v5;
}

- (id)_checkmarkCircleImageViewChecked:(BOOL)a3
{
  if (a3) {
    [(AKAuthorizationScopeDetailTableViewCell *)self _selectedCheckmarkCircleImageView];
  }
  else {
  id v3 = [(AKAuthorizationScopeDetailTableViewCell *)self _unselectedCheckmarkCircleImageView];
  }

  return v3;
}

- (id)_selectedCheckmarkCircleImageView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  id v4 = [(AKAuthorizationScopeDetailTableViewCell *)self _checkmarkCircleImage];
  unint64_t v5 = (void *)[v3 initWithImage:v4];

  +[AKAuthorizationSubPaneMetrics accessoryViewSize];
  double v7 = v6;
  +[AKAuthorizationSubPaneMetrics accessoryViewSize];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v7, v8);

  return v5;
}

- (id)_unselectedCheckmarkCircleImageView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  id v4 = [(AKAuthorizationScopeDetailTableViewCell *)self _circleImage];
  unint64_t v5 = (void *)[v3 initWithImage:v4];

  double v6 = +[AKAuthorizationAppearance checkmarkDeselectedTintColor];
  [v5 setTintColor:v6];

  +[AKAuthorizationSubPaneMetrics accessoryViewSize];
  double v8 = v7;
  +[AKAuthorizationSubPaneMetrics accessoryViewSize];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v8, v9);

  return v5;
}

- (id)_clearImage
{
  return (id)[MEMORY[0x1E4F42A80] systemImageNamed:@"xmark.circle.fill"];
}

- (id)_circleImage
{
  return (id)[MEMORY[0x1E4F42A80] systemImageNamed:@"circle"];
}

- (id)_checkmarkCircleImage
{
  return (id)[MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark.circle.fill"];
}

- (id)_checkmarkImage
{
  v2 = (void *)MEMORY[0x1E4F42A80];
  id v3 = +[AKAuthorizationAppearance emailSelectionSymbolConfiguration];
  id v4 = [v2 systemImageNamed:@"checkmark" withConfiguration:v3];

  return v4;
}

- (UILabel)scopeLabel
{
  return self->_scopeLabel;
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (UILabel)mainDetailLabel
{
  return self->_mainDetailLabel;
}

- (UIImageView)scopeImageView
{
  return self->_scopeImageView;
}

- (void)setScopeImageView:(id)a3
{
}

- (UIImage)scopeImage
{
  return self->_scopeImage;
}

- (UIImageView)leadingCheckmarkView
{
  return self->_leadingCheckmarkView;
}

- (void)setLeadingCheckmarkView:(id)a3
{
}

- (UILayoutGuide)mainGuide
{
  return self->_mainGuide;
}

- (UILayoutGuide)mainLabelFirstLineGuide
{
  return self->_mainLabelFirstLineGuide;
}

- (UILayoutGuide)scopeLabelFirstLineGuide
{
  return self->_scopeLabelFirstLineGuide;
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (NSLayoutConstraint)mainLabelLeadingConstraint
{
  return self->_mainLabelLeadingConstraint;
}

- (NSLayoutConstraint)mainLabelWithoutImageLeadingConstraint
{
  return self->_mainLabelWithoutImageLeadingConstraint;
}

- (unint64_t)internalCheckmarkStyle
{
  return self->_internalCheckmarkStyle;
}

- (void)setInternalCheckmarkStyle:(unint64_t)a3
{
  self->_internalCheckmarkStyle = a3;
}

- (BOOL)internalIsChecked
{
  return self->_internalChecked;
}

- (void)setInternalChecked:(BOOL)a3
{
  self->_internalChecked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainLabelWithoutImageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_mainLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scopeLabelFirstLineGuide, 0);
  objc_storeStrong((id *)&self->_mainLabelFirstLineGuide, 0);
  objc_storeStrong((id *)&self->_mainGuide, 0);
  objc_storeStrong((id *)&self->_leadingCheckmarkView, 0);
  objc_storeStrong((id *)&self->_scopeImage, 0);
  objc_storeStrong((id *)&self->_scopeImageView, 0);
  objc_storeStrong((id *)&self->_mainDetailLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);

  objc_storeStrong((id *)&self->_scopeLabel, 0);
}

@end