@interface DBAppDockButton
- (BOOL)canBecomeFocused;
- (BOOL)isActive;
- (BOOL)isCompositingFilterEnabled;
- (BOOL)showBadge;
- (DBAppDockButton)initWithIconProvider:(id)a3;
- (DBIconProviding)iconProvider;
- (DBLeafIcon)icon;
- (NSLayoutConstraint)iconFocusRingUnreadImageViewCenterConstraint;
- (NSString)bundleIdentifier;
- (UIImageView)badgeView;
- (UIImageView)iconFocusRingImageView;
- (UIImageView)iconFocusRingUnreadImageView;
- (UIImageView)iconImageView;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setupImagesIfNecessary;
- (void)_updateCenterXConstraintConstant;
- (void)_updateCompositingFilter;
- (void)_updateFocusRings;
- (void)_updateImageForBundleIdentifier:(BOOL)a3 crossfade:(BOOL)a4;
- (void)iconAccessoriesDidUpdate:(id)a3;
- (void)iconImageDidUpdate:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setBadgeHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setBadgeView:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3 animated:(BOOL)a4;
- (void)setCompositingFilterEnabled:(BOOL)a3;
- (void)setFocusHighlightColor:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconFocusRingImageView:(id)a3;
- (void)setIconFocusRingUnreadImageView:(id)a3;
- (void)setIconFocusRingUnreadImageViewCenterConstraint:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setIconProvider:(id)a3;
- (void)setShowBadge:(BOOL)a3;
- (void)setShowBadge:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBAppDockButton

- (DBAppDockButton)initWithIconProvider:(id)a3
{
  v64[12] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)DBAppDockButton;
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = -[DBAppDockButton initWithFrame:](&v63, sel_initWithFrame_, *MEMORY[0x263F001A8], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    v11 = [(DBAppDockButton *)v9 layer];
    [v11 setAllowsGroupBlending:0];

    objc_storeWeak((id *)&v10->_iconProvider, v4);
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v5, v6, v7, v8);
    iconImageView = v10->_iconImageView;
    v10->_iconImageView = (UIImageView *)v12;

    [(UIImageView *)v10->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBAppDockButton *)v10 addSubview:v10->_iconImageView];
    v14 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v5, v6, v7, v8);
    [(UIImageView *)v14 setHidden:1];
    [(UIImageView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBStatusBarButton *)v10 focusHighlightColor];
    v15 = id v62 = v4;
    [(UIImageView *)v14 setTintColor:v15];

    [(DBAppDockButton *)v10 addSubview:v14];
    iconFocusRingImageView = v10->_iconFocusRingImageView;
    v10->_iconFocusRingImageView = v14;
    v61 = v14;

    v17 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v5, v6, v7, v8);
    [(UIImageView *)v17 setHidden:1];
    [(UIImageView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(DBStatusBarButton *)v10 focusHighlightColor];
    [(UIImageView *)v17 setTintColor:v18];

    [(DBAppDockButton *)v10 addSubview:v17];
    iconFocusRingUnreadImageView = v10->_iconFocusRingUnreadImageView;
    v10->_iconFocusRingUnreadImageView = v17;
    v59 = v17;

    v20 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v5, v6, v7, v8);
    [(UIImageView *)v20 setHidden:1];
    [(UIImageView *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [MEMORY[0x263F825C8] externalSystemRedColor];
    [(UIImageView *)v20 setTintColor:v21];

    [(DBAppDockButton *)v10 addSubview:v20];
    badgeView = v10->_badgeView;
    v10->_badgeView = v20;
    v52 = v20;

    [(DBAppDockButton *)v10 setUserInteractionEnabled:1];
    v23 = [(UIImageView *)v10->_iconFocusRingUnreadImageView centerXAnchor];
    v24 = [(UIImageView *)v10->_iconImageView centerXAnchor];
    uint64_t v25 = [v23 constraintEqualToAnchor:v24];
    iconFocusRingUnreadImageViewCenterConstraint = v10->_iconFocusRingUnreadImageViewCenterConstraint;
    v10->_iconFocusRingUnreadImageViewCenterConstraint = (NSLayoutConstraint *)v25;

    [(DBAppDockButton *)v10 _updateCenterXConstraintConstant];
    v45 = (void *)MEMORY[0x263F08938];
    v60 = [(UIImageView *)v10->_iconImageView widthAnchor];
    v58 = [v60 constraintEqualToConstant:29.0];
    v64[0] = v58;
    v57 = [(UIImageView *)v10->_iconImageView heightAnchor];
    v56 = [v57 constraintEqualToConstant:29.0];
    v64[1] = v56;
    v55 = [(UIImageView *)v10->_iconImageView centerXAnchor];
    v54 = [(DBAppDockButton *)v10 centerXAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v64[2] = v53;
    v51 = [(UIImageView *)v10->_iconImageView centerYAnchor];
    v50 = [(DBAppDockButton *)v10 centerYAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v64[3] = v49;
    v48 = [(UIImageView *)v10->_iconFocusRingImageView centerXAnchor];
    v47 = [(UIImageView *)v10->_iconImageView centerXAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v64[4] = v46;
    v44 = [(UIImageView *)v10->_iconFocusRingImageView centerYAnchor];
    v43 = [(UIImageView *)v10->_iconImageView centerYAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v64[5] = v42;
    v64[6] = v10->_iconFocusRingUnreadImageViewCenterConstraint;
    v41 = [(UIImageView *)v10->_iconFocusRingUnreadImageView centerYAnchor];
    v40 = [(UIImageView *)v10->_iconImageView centerYAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 constant:-2.0];
    v64[7] = v39;
    v38 = [(UIImageView *)v10->_badgeView widthAnchor];
    v37 = [v38 constraintEqualToConstant:10.0];
    v64[8] = v37;
    v27 = [(UIImageView *)v10->_badgeView heightAnchor];
    v28 = [v27 constraintEqualToConstant:10.0];
    v64[9] = v28;
    v29 = [(UIImageView *)v10->_badgeView centerXAnchor];
    v30 = [(UIImageView *)v10->_iconImageView trailingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:-1.0];
    v64[10] = v31;
    v32 = [(UIImageView *)v10->_badgeView centerYAnchor];
    v33 = [(UIImageView *)v10->_iconImageView topAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 constant:1.0];
    v64[11] = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:12];
    [v45 activateConstraints:v35];

    id v4 = v62;
    [(DBAppDockButton *)v10 _setupImagesIfNecessary];
  }

  return v10;
}

- (void)setFocusHighlightColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DBAppDockButton;
  id v4 = a3;
  [(DBStatusBarButton *)&v7 setFocusHighlightColor:v4];
  double v5 = [(DBAppDockButton *)self iconFocusRingImageView];
  [v5 setTintColor:v4];

  double v6 = [(DBAppDockButton *)self iconFocusRingUnreadImageView];
  [v6 setTintColor:v4];
}

- (void)setCompositingFilterEnabled:(BOOL)a3
{
  self->_compositingFilterEnabled = a3;
  [(DBAppDockButton *)self _updateCompositingFilter];
}

- (void)_updateCenterXConstraintConstant
{
  v3 = [(DBAppDockButton *)self traitCollection];
  if ([v3 layoutDirection] == 1) {
    double v4 = -2.0;
  }
  else {
    double v4 = 2.0;
  }

  id v5 = [(DBAppDockButton *)self iconFocusRingUnreadImageViewCenterConstraint];
  [v5 setConstant:v4];
}

- (void)_setupImagesIfNecessary
{
  v3 = (void *)MEMORY[0x263F827E8];
  double v4 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
  id v5 = [(DBAppDockButton *)self traitCollection];
  id v20 = [v3 imageNamed:@"CarStatusBarDockIconFocusRing" inBundle:v4 compatibleWithTraitCollection:v5];

  double v6 = [(DBAppDockButton *)self iconFocusRingImageView];
  [v6 setImage:v20];

  objc_super v7 = (void *)MEMORY[0x263F827E8];
  double v8 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
  v9 = [(DBAppDockButton *)self traitCollection];
  v10 = [v7 imageNamed:@"CarStatusBarDockIconFocusRingUnread" inBundle:v8 compatibleWithTraitCollection:v9];

  v11 = [(DBAppDockButton *)self traitCollection];
  uint64_t v12 = [v11 layoutDirection];

  if (v12 == 1)
  {
    uint64_t v13 = [v10 imageWithHorizontallyFlippedOrientation];

    v10 = (void *)v13;
  }
  v14 = [(DBAppDockButton *)self iconFocusRingUnreadImageView];
  [v14 setImage:v10];

  v15 = (void *)MEMORY[0x263F827E8];
  v16 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
  v17 = [(DBAppDockButton *)self traitCollection];
  v18 = [v15 imageNamed:@"CarStatusBarDockIconUnreadBadge" inBundle:v16 compatibleWithTraitCollection:v17];

  v19 = [(DBAppDockButton *)self badgeView];
  [v19 setImage:v18];

  [(DBAppDockButton *)self _updateCenterXConstraintConstant];
}

- (void)_updateCompositingFilter
{
  if ([(DBAppDockButton *)self isCompositingFilterEnabled])
  {
    v3 = [(DBAppDockButton *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];

    if (v4 == 1) {
      id v5 = (void *)MEMORY[0x263F15D50];
    }
    else {
      id v5 = (void *)MEMORY[0x263F15D58];
    }
    id v8 = [MEMORY[0x263F157C8] filterWithType:*v5];
    double v6 = [(DBAppDockButton *)self iconFocusRingImageView];
    objc_super v7 = [v6 layer];
    [v7 setCompositingFilter:v8];
  }
  else
  {
    id v8 = [(DBAppDockButton *)self iconFocusRingImageView];
    double v6 = [v8 layer];
    [v6 setCompositingFilter:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBAppDockButton;
  [(DBAppDockButton *)&v4 traitCollectionDidChange:a3];
  [(DBAppDockButton *)self _setupImagesIfNecessary];
  [(DBAppDockButton *)self _updateCompositingFilter];
}

- (void)setBadgeHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_super v7 = [(DBAppDockButton *)self badgeView];
  int v8 = [v7 isHidden];

  if (v8 != v5)
  {
    v9 = [(DBAppDockButton *)self badgeView];
    [v9 setHidden:v5];

    if (v4)
    {
      if (v5)
      {
        id v10 = objc_alloc(MEMORY[0x263F82828]);
        v11 = [(DBAppDockButton *)self badgeView];
        uint64_t v12 = [v11 image];
        uint64_t v13 = (void *)[v10 initWithImage:v12];

        v14 = [MEMORY[0x263F825C8] externalSystemRedColor];
        [v13 setTintColor:v14];

        v15 = [(DBAppDockButton *)self badgeView];
        [v15 frame];
        objc_msgSend(v13, "setFrame:");

        [(DBAppDockButton *)self addSubview:v13];
        v16 = (void *)MEMORY[0x263F82E00];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __43__DBAppDockButton_setBadgeHidden_animated___block_invoke;
        v23[3] = &unk_2649B3E90;
        id v24 = v13;
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __43__DBAppDockButton_setBadgeHidden_animated___block_invoke_2;
        v21[3] = &unk_2649B3FA8;
        id v22 = v24;
        id v17 = v24;
        [v16 animateWithDuration:v23 animations:v21 completion:0.3];
      }
      else
      {
        v18 = [(DBAppDockButton *)self badgeView];
        CGAffineTransformMakeScale(&v20, 0.01, 0.01);
        [v18 setTransform:&v20];

        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __43__DBAppDockButton_setBadgeHidden_animated___block_invoke_3;
        v19[3] = &unk_2649B3E90;
        v19[4] = self;
        [MEMORY[0x263F82E00] animateWithDuration:v19 animations:0.3];
      }
    }
  }
}

uint64_t __43__DBAppDockButton_setBadgeHidden_animated___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 0.01, 0.01);
  return [v1 setTransform:&v3];
}

uint64_t __43__DBAppDockButton_setBadgeHidden_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void __43__DBAppDockButton_setBadgeHidden_animated___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) badgeView];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v1 setTransform:v3];
}

- (BOOL)canBecomeFocused
{
  return ![(DBAppDockButton *)self isActive];
}

- (void)_updateFocusRings
{
  if ([(DBAppDockButton *)self isFocused])
  {
    BOOL v3 = [(DBAppDockButton *)self showBadge];
    uint64_t v4 = v3 ^ 1;
  }
  else
  {
    BOOL v3 = 1;
    uint64_t v4 = 1;
  }
  BOOL v5 = [(DBAppDockButton *)self iconFocusRingImageView];
  [v5 setHidden:v3];

  id v6 = [(DBAppDockButton *)self iconFocusRingUnreadImageView];
  [v6 setHidden:v4];
}

- (void)setShowBadge:(BOOL)a3
{
}

- (void)setShowBadge:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_showBadge != a3)
  {
    BOOL v4 = a4;
    self->_showBadge = a3;
    id v6 = DBLogForCategory(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v7 = NSStringFromBOOL();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2114;
      v11 = self;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Setting badge visible: %{public}@ for app dock button: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [(DBAppDockButton *)self setBadgeHidden:!self->_showBadge animated:v4];
    [(DBAppDockButton *)self _updateFocusRings];
  }
}

- (void)iconImageDidUpdate:(id)a3
{
}

- (void)iconAccessoriesDidUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DBAppDockButton *)self icon];

  id v6 = DBLogForCategory(0xEuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == v4)
  {
    if (v7)
    {
      int v14 = 138543618;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = self;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Icon accessories did update for icon: %{public}@, app dock button: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    v9 = [(DBAppDockButton *)self iconProvider];
    __int16 v10 = [(DBAppDockButton *)self icon];
    if ([v9 iconCanDisplayBadge:v10])
    {
      v11 = [(DBAppDockButton *)self icon];
      uint64_t v12 = [v11 badgeNumberOrString];
      BOOL v13 = v12 != 0;
    }
    else
    {
      BOOL v13 = 0;
    }

    [(DBAppDockButton *)self setShowBadge:v13 animated:1];
  }
  else
  {
    if (v7)
    {
      int v8 = [(DBAppDockButton *)self icon];
      int v14 = 138543618;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Icon accessories update for icon: %{public}@, did not match self icon: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)_updateImageForBundleIdentifier:(BOOL)a3 crossfade:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v80[8] = *MEMORY[0x263EF8340];
  BOOL v7 = [(DBAppDockButton *)self traitCollection];
  [v7 displayScale];
  double v9 = v8;

  __int16 v10 = [(DBAppDockButton *)self icon];
  v11 = objc_msgSend(v10, "iconImageWithInfo:", 29.0, 29.0, v9, 6.5);

  uint64_t v12 = [(DBAppDockButton *)self iconProvider];
  BOOL v13 = [(DBAppDockButton *)self icon];
  if ([v12 iconCanDisplayBadge:v13])
  {
    int v14 = [(DBAppDockButton *)self icon];
    id v15 = [v14 badgeNumberOrString];
    BOOL v16 = v15 != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  if (v5)
  {
    BOOL v62 = v4;
    id v17 = [(DBAppDockButton *)self snapshotViewAfterScreenUpdates:0];
    if (!v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F82E00]);
      id v17 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    }
    [(DBAppDockButton *)self setShowBadge:v16 animated:0];
    [(DBAppDockButton *)self _updateFocusRings];
    v19 = [(DBAppDockButton *)self iconImageView];
    v64 = v11;
    [v19 setImage:v11];

    CGAffineTransform v20 = [(DBAppDockButton *)self badgeView];
    [v20 setHidden:1];

    v21 = [(DBAppDockButton *)self iconImageView];
    [v21 setHidden:1];

    id v22 = [(DBAppDockButton *)self iconFocusRingImageView];
    [v22 setHidden:1];

    v23 = [(DBAppDockButton *)self iconFocusRingUnreadImageView];
    [v23 setHidden:1];

    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBAppDockButton *)self addSubview:v17];
    id v24 = (void *)[(DBAppDockButton *)self copy];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBAppDockButton *)self addSubview:v24];
    v51 = (void *)MEMORY[0x263F08938];
    v61 = [v17 widthAnchor];
    v60 = [(DBAppDockButton *)self widthAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v80[0] = v59;
    v58 = [v17 heightAnchor];
    v57 = [(DBAppDockButton *)self heightAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v80[1] = v56;
    v55 = [v17 centerXAnchor];
    v54 = [(DBAppDockButton *)self centerXAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v80[2] = v53;
    objc_super v63 = v17;
    v52 = [v17 centerYAnchor];
    v50 = [(DBAppDockButton *)self centerYAnchor];
    v49 = [v52 constraintEqualToAnchor:v50];
    v80[3] = v49;
    v48 = [v24 widthAnchor];
    v47 = [(DBAppDockButton *)self widthAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v80[4] = v46;
    v45 = [v24 heightAnchor];
    v44 = [(DBAppDockButton *)self heightAnchor];
    uint64_t v25 = [v45 constraintEqualToAnchor:v44];
    v80[5] = v25;
    v26 = [v24 centerXAnchor];
    v27 = [(DBAppDockButton *)self centerXAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v80[6] = v28;
    v29 = [v24 centerYAnchor];
    v30 = [(DBAppDockButton *)self centerYAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v80[7] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:8];
    [v51 activateConstraints:v32];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke;
    aBlock[3] = &unk_2649B6200;
    aBlock[4] = self;
    id v33 = v24;
    id v79 = v33;
    v34 = _Block_copy(aBlock);
    if (v62)
    {
      [v33 setAlpha:0.0];
      v35 = (void *)MEMORY[0x263F82E00];
      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke_2;
      v75[3] = &unk_2649B3D30;
      v36 = &v76;
      v37 = v63;
      id v38 = v63;
      id v76 = v38;
      v39 = &v77;
      id v77 = v33;
      v72[0] = MEMORY[0x263EF8330];
      v72[1] = 3221225472;
      v72[2] = __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke_3;
      v72[3] = &unk_2649B64A8;
      v40 = &v74;
      id v74 = v34;
      id v73 = v38;
      [v35 animateWithDuration:v75 animations:v72 completion:0.5];
    }
    else
    {
      CGAffineTransformMakeScale(&v71, 0.0, 0.0);
      [v33 setTransform:&v71];
      v42 = (void *)MEMORY[0x263F82E00];
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke_4;
      v69[3] = &unk_2649B3E90;
      v36 = &v70;
      v37 = v63;
      id v70 = v63;
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke_5;
      v67[3] = &unk_2649B3FA8;
      v39 = &v68;
      id v68 = v70;
      [v42 _animateUsingSpringWithDuration:0 delay:v69 options:v67 mass:0.335 stiffness:0.03 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
      v43 = (void *)MEMORY[0x263F82E00];
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke_6;
      v65[3] = &unk_2649B3E90;
      v40 = &v66;
      id v66 = v33;
      [v43 _animateUsingSpringWithDuration:0 delay:v65 options:v34 mass:0.335 stiffness:0.11 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
    }

    v11 = v64;
  }
  else
  {
    v41 = [(DBAppDockButton *)self iconImageView];
    [v41 setImage:v11];

    [(DBAppDockButton *)self setShowBadge:v16 animated:0];
    [(DBAppDockButton *)self _updateFocusRings];
  }
}

uint64_t __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) badgeView];
  objc_msgSend(v2, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "showBadge") ^ 1);

  BOOL v3 = [*(id *)(a1 + 32) iconImageView];
  [v3 setHidden:0];

  [*(id *)(a1 + 32) _updateFocusRings];
  BOOL v4 = *(void **)(a1 + 40);
  return [v4 removeFromSuperview];
}

uint64_t __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  long long v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  long long v2 = *(void **)(a1 + 32);
  return [v2 removeFromSuperview];
}

uint64_t __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 0.01, 0.01);
  return [v1 setTransform:&v3];
}

uint64_t __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __61__DBAppDockButton__updateImageForBundleIdentifier_crossfade___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 1.0, 1.0);
  return [v1 setTransform:&v3];
}

- (void)setBundleIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![(NSString *)self->_bundleIdentifier isEqualToString:v6])
  {
    BOOL v7 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = self;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Updating active bundle identifier to %@ in %@", buf, 0x16u);
    }

    double v8 = [(DBAppDockButton *)self icon];
    [v8 removeObserver:self];

    double v9 = (NSString *)[v6 copy];
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v9;

    v11 = [(DBAppDockButton *)self iconProvider];
    uint64_t v12 = [v11 iconForIdentifier:self->_bundleIdentifier];
    [(DBAppDockButton *)self setIcon:v12];

    BOOL v13 = [(DBAppDockButton *)self icon];
    [v13 addObserver:self];

    [(DBAppDockButton *)self setAccessibilityValue:self->_bundleIdentifier];
    int v14 = +[DBApplicationController sharedInstance];
    id v15 = [v14 applicationWithBundleIdentifier:self->_bundleIdentifier];

    BOOL v16 = [v15 displayName];
    id v18 = v16;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [(DBAppDockButton *)self setAccessibilityUserInputLabels:v17];

    [(DBAppDockButton *)self _updateImageForBundleIdentifier:v4 crossfade:UIAccessibilityIsReduceMotionEnabled()];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [DBAppDockButton alloc];
  BOOL v5 = [(DBAppDockButton *)self iconProvider];
  id v6 = [(DBAppDockButton *)v4 initWithIconProvider:v5];

  BOOL v7 = [(DBAppDockButton *)self bundleIdentifier];
  [(DBAppDockButton *)v6 setBundleIdentifier:v7];

  [(DBAppDockButton *)v6 setActive:[(DBAppDockButton *)self isActive]];
  double v8 = [(DBAppDockButton *)self iconFocusRingImageView];
  uint64_t v9 = [v8 isHidden];
  __int16 v10 = [(DBAppDockButton *)v6 iconFocusRingImageView];
  [v10 setHidden:v9];

  v11 = [(DBAppDockButton *)self iconFocusRingUnreadImageView];
  uint64_t v12 = [v11 isHidden];
  BOOL v13 = [(DBAppDockButton *)v6 iconFocusRingUnreadImageView];
  [v13 setHidden:v12];

  [(DBAppDockButton *)v6 setShowBadge:[(DBAppDockButton *)self showBadge]];
  return v6;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isCompositingFilterEnabled
{
  return self->_compositingFilterEnabled;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UIImageView)iconFocusRingImageView
{
  return self->_iconFocusRingImageView;
}

- (void)setIconFocusRingImageView:(id)a3
{
}

- (UIImageView)iconFocusRingUnreadImageView
{
  return self->_iconFocusRingUnreadImageView;
}

- (void)setIconFocusRingUnreadImageView:(id)a3
{
}

- (DBIconProviding)iconProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconProvider);
  return (DBIconProviding *)WeakRetained;
}

- (void)setIconProvider:(id)a3
{
}

- (DBLeafIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UIImageView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (BOOL)showBadge
{
  return self->_showBadge;
}

- (NSLayoutConstraint)iconFocusRingUnreadImageViewCenterConstraint
{
  return self->_iconFocusRingUnreadImageViewCenterConstraint;
}

- (void)setIconFocusRingUnreadImageViewCenterConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFocusRingUnreadImageViewCenterConstraint, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_destroyWeak((id *)&self->_iconProvider);
  objc_storeStrong((id *)&self->_iconFocusRingUnreadImageView, 0);
  objc_storeStrong((id *)&self->_iconFocusRingImageView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end