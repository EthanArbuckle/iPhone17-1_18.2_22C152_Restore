@interface CSDeviceBlockView
- (BOOL)isShowingAuthenticationView;
- (BOOL)isShowingUnblockDeviceView;
- (CSDeviceBlockViewDelegate)deviceBlockDelegate;
- (UIView)authenticationView;
- (UIView)unblockDeviceView;
- (double)_buttonsBottomSpacing;
- (void)_activateConstraintsForSideBySide:(BOOL)a3;
- (void)_handleEmergencyButtonAction;
- (void)_handleUnblockButtonAction;
- (void)_updateViewForUnblockDeviceViewAnimated:(BOOL)a3;
- (void)addDeviceUnblockButtons;
- (void)removeDeviceUnblockButtons;
- (void)setAuthenticationView:(id)a3;
- (void)setDeviceBlockDelegate:(id)a3;
- (void)setUnblockDeviceView:(id)a3;
- (void)updateConstraints;
- (void)updateViewForUnblockDeviceView;
@end

@implementation CSDeviceBlockView

- (void)addDeviceUnblockButtons
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v16 = [v3 localizedStringForKey:@"DASHBOARD_BLOCK_ERASE_ACTION" value:&stru_1F3020248 table:@"CoverSheet"];

  [(CSModalView *)self setSecondaryActionButtonText:0];
  v4 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  [v4 setTitle:v16];
  [v4 setTitleLineBreakMode:4];
  v5 = [MEMORY[0x1E4F428B8] whiteColor];
  [v4 setBaseForegroundColor:v5];

  [(UIButton *)self->_unblockDeviceButton removeFromSuperview];
  v6 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  unblockDeviceButton = self->_unblockDeviceButton;
  self->_unblockDeviceButton = v6;

  [(UIButton *)self->_unblockDeviceButton setConfiguration:v4];
  v8 = self->_unblockDeviceButton;
  v9 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UIButton *)v8 setTitleColor:v9 forState:0];

  [(UIButton *)self->_unblockDeviceButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_unblockDeviceButton addTarget:self action:sel__handleUnblockButtonAction forControlEvents:64];
  [(CSDeviceBlockView *)self addSubview:self->_unblockDeviceButton];
  if (MGGetBoolAnswer())
  {
    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"DASHBOARD_BLOCK_EMERGENCY_BUTTON" value:&stru_1F3020248 table:@"CoverSheet"];

    v12 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
    [v12 setTitle:v11];
    v13 = [MEMORY[0x1E4F428B8] whiteColor];
    [v12 setBaseForegroundColor:v13];

    [(UIButton *)self->_emergencyButton removeFromSuperview];
    v14 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    emergencyButton = self->_emergencyButton;
    self->_emergencyButton = v14;

    [(UIButton *)self->_emergencyButton setConfiguration:v12];
    [(UIButton *)self->_emergencyButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_emergencyButton addTarget:self action:sel__handleEmergencyButtonAction forControlEvents:64];
    [(CSDeviceBlockView *)self addSubview:self->_emergencyButton];
  }
  [(CSDeviceBlockView *)self updateConstraints];
}

- (void)updateConstraints
{
  v12.receiver = self;
  v12.super_class = (Class)CSDeviceBlockView;
  [(CSModalView *)&v12 updateConstraints];
  [(CSDeviceBlockView *)self removeConstraints:self->_buttonConstraints];
  [(CSDeviceBlockView *)self _activateConstraintsForSideBySide:1];
  unblockDeviceButton = self->_unblockDeviceButton;
  if (unblockDeviceButton && self->_emergencyButton)
  {
    v4 = [(UIButton *)unblockDeviceButton titleLabel];
    double v5 = *MEMORY[0x1E4F43B90];
    double v6 = *(double *)(MEMORY[0x1E4F43B90] + 8);
    objc_msgSend(v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], v6);
    double v8 = v7;

    v9 = [(UIButton *)self->_emergencyButton titleLabel];
    objc_msgSend(v9, "systemLayoutSizeFittingSize:", v5, v6);
    double v11 = v10;

    [(CSDeviceBlockView *)self bounds];
    if (v8 + v11 + 84.0 + 36.0 > CGRectGetWidth(v13))
    {
      [(CSDeviceBlockView *)self removeConstraints:self->_buttonConstraints];
      [(CSDeviceBlockView *)self _activateConstraintsForSideBySide:0];
    }
  }
}

- (void)removeDeviceUnblockButtons
{
  [(UIButton *)self->_unblockDeviceButton removeFromSuperview];
  [(UIButton *)self->_emergencyButton removeFromSuperview];
  unblockDeviceButton = self->_unblockDeviceButton;
  self->_unblockDeviceButton = 0;

  emergencyButton = self->_emergencyButton;
  self->_emergencyButton = 0;

  if (MGGetBoolAnswer())
  {
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v5 = [v6 localizedStringForKey:@"DASHBOARD_BLOCK_EMERGENCY_BUTTON" value:&stru_1F3020248 table:@"CoverSheet"];
    [(CSModalView *)self setSecondaryActionButtonText:v5];
  }
}

- (void)updateViewForUnblockDeviceView
{
}

- (void)setUnblockDeviceView:(id)a3
{
  double v5 = (UIView *)a3;
  if (self->_unblockDeviceView != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_unblockDeviceView, a3);
    unblockDeviceView = self->_unblockDeviceView;
    [(CSDeviceBlockView *)self bounds];
    -[UIView setFrame:](unblockDeviceView, "setFrame:");
    [(CSDeviceBlockView *)self _updateViewForUnblockDeviceViewAnimated:1];
    double v5 = v7;
  }
}

- (void)setAuthenticationView:(id)a3
{
  double v5 = (UIView *)a3;
  p_authenticationView = &self->_authenticationView;
  if (self->_authenticationView != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_authenticationView, a3);
    double v7 = *p_authenticationView;
    [(CSDeviceBlockView *)self bounds];
    -[UIView setFrame:](v7, "setFrame:");
    [(UIView *)self->_unblockDeviceView setHidden:*p_authenticationView != 0];
    double v5 = v8;
  }
}

- (BOOL)isShowingAuthenticationView
{
  v2 = [(CSDeviceBlockView *)self authenticationView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isShowingUnblockDeviceView
{
  v2 = [(CSDeviceBlockView *)self unblockDeviceView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updateViewForUnblockDeviceViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unblockDeviceView = self->_unblockDeviceView;
  BOOL v6 = unblockDeviceView != 0;
  double v7 = 1.0;
  if (unblockDeviceView) {
    double v7 = 0.0;
  }
  [(UIView *)unblockDeviceView setAlpha:v7];
  double v8 = 0.5;
  if (!v3) {
    double v8 = 0.0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__CSDeviceBlockView__updateViewForUnblockDeviceViewAnimated___block_invoke;
  v10[3] = &unk_1E6AD8CD0;
  v10[4] = self;
  BOOL v11 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CSDeviceBlockView__updateViewForUnblockDeviceViewAnimated___block_invoke_2;
  v9[3] = &unk_1E6AD8A40;
  v9[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v10 animations:v9 completion:v8];
}

uint64_t __61__CSDeviceBlockView__updateViewForUnblockDeviceViewAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowsDateView:*(unsigned char *)(a1 + 40) == 0];
  [*(id *)(a1 + 32) hideTitleLabel:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) hideSubtitleLabel:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) hideSecondarySubtitleLabel:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 560) setHidden:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 568) setHidden:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 584);
  double v3 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 0.0;
  }

  return [v2 setAlpha:v3];
}

uint64_t __61__CSDeviceBlockView__updateViewForUnblockDeviceViewAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 584) setAlpha:1.0];
}

- (void)_activateConstraintsForSideBySide:(BOOL)a3
{
  double v5 = [MEMORY[0x1E4F1CA48] array];
  unblockDeviceButton = self->_unblockDeviceButton;
  emergencyButton = self->_emergencyButton;
  if (unblockDeviceButton) {
    BOOL v8 = emergencyButton == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && !a3)
  {
    v9 = [(UIButton *)self->_emergencyButton centerXAnchor];
    double v10 = [(CSDeviceBlockView *)self centerXAnchor];
    BOOL v11 = [v9 constraintEqualToAnchor:v10];
    [(NSArray *)v5 addObject:v11];

    objc_super v12 = [(UIButton *)self->_unblockDeviceButton centerXAnchor];
    CGRect v13 = [(CSDeviceBlockView *)self centerXAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    [(NSArray *)v5 addObject:v14];

    v15 = [(UIButton *)self->_unblockDeviceButton bottomAnchor];
    id v16 = [(CSDeviceBlockView *)self bottomAnchor];
    [(CSDeviceBlockView *)self _buttonsBottomSpacing];
    v18 = [v15 constraintLessThanOrEqualToAnchor:v16 constant:-v17];
    [(NSArray *)v5 addObject:v18];

    v19 = [(UIButton *)self->_emergencyButton bottomAnchor];
    v20 = [(UIButton *)self->_unblockDeviceButton topAnchor];
    double v21 = -16.0;
LABEL_11:
    v41 = [v19 constraintLessThanOrEqualToAnchor:v20 constant:v21];
    [(NSArray *)v5 addObject:v41];

    goto LABEL_12;
  }
  if (unblockDeviceButton)
  {
    v22 = [(UIButton *)unblockDeviceButton trailingAnchor];
    v23 = [(CSDeviceBlockView *)self trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:-28.0];
    [(NSArray *)v5 addObject:v24];

    v25 = [(UIButton *)self->_unblockDeviceButton titleLabel];
    v26 = [v25 trailingAnchor];
    v27 = [(CSDeviceBlockView *)self trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:-42.0];
    [(NSArray *)v5 addObject:v28];

    v29 = [(UIButton *)self->_unblockDeviceButton bottomAnchor];
    v30 = [(CSDeviceBlockView *)self bottomAnchor];
    [(CSDeviceBlockView *)self _buttonsBottomSpacing];
    v32 = [v29 constraintLessThanOrEqualToAnchor:v30 constant:-v31];
    [(NSArray *)v5 addObject:v32];
  }
  if (emergencyButton)
  {
    v33 = [(UIButton *)self->_emergencyButton leadingAnchor];
    v34 = [(CSDeviceBlockView *)self leadingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34 constant:28.0];
    [(NSArray *)v5 addObject:v35];

    v36 = [(UIButton *)self->_emergencyButton titleLabel];
    v37 = [v36 leadingAnchor];
    v38 = [(CSDeviceBlockView *)self leadingAnchor];
    v39 = [v37 constraintEqualToAnchor:v38 constant:42.0];
    [(NSArray *)v5 addObject:v39];

    v19 = [(UIButton *)self->_emergencyButton bottomAnchor];
    v20 = [(CSDeviceBlockView *)self bottomAnchor];
    [(CSDeviceBlockView *)self _buttonsBottomSpacing];
    double v21 = -v40;
    goto LABEL_11;
  }
LABEL_12:
  buttonConstraints = self->_buttonConstraints;
  self->_buttonConstraints = v5;
  v43 = v5;

  [MEMORY[0x1E4F28DC8] activateConstraints:v43];
}

- (void)_handleUnblockButtonAction
{
  id v2 = [(CSDeviceBlockView *)self deviceBlockDelegate];
  [v2 handleUnblockButtonAction];
}

- (void)_handleEmergencyButtonAction
{
  id v2 = [(CSDeviceBlockView *)self deviceBlockDelegate];
  [v2 handleEmergencyButtonAction];
}

- (double)_buttonsBottomSpacing
{
  if ([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] != 1)
  {
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    long long v138 = 0uLL;
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    int v139 = 0;
    int v140 = 0;
    uint64_t v129 = 0;
    int v141 = 0;
    uint64_t v128 = 0;
    int v142 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v143 = 0;
    int v125 = 0;
    int v144 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    uint64_t v145 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v146 = 0;
    double v15 = 21.0;
    goto LABEL_69;
  }
  int v6 = __sb__runningInSpringBoard();
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v7 = 0;
      int v8 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    v123 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v123 userInterfaceIdiom] != 1)
    {
      int v7 = 0;
      int v8 = 1;
      goto LABEL_12;
    }
  }
  int v8 = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v114 = [MEMORY[0x1E4F42D90] mainScreen];
      [v114 _referenceBounds];
    }
    int v7 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v27 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      HIDWORD(v145) = v2 ^ 1;
      int v146 = v8;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      long long v138 = 0uLL;
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      int v139 = 0;
      int v140 = 0;
      uint64_t v129 = 0;
      int v141 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v143 = 0;
      int v125 = 0;
      int v144 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      LODWORD(v145) = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 90.0;
      goto LABEL_69;
    }
  }
  else
  {
    int v7 = 0;
  }
LABEL_12:
  int v16 = __sb__runningInSpringBoard();
  HIDWORD(v145) = v7;
  int v146 = v8;
  if (v16)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v3 = 0;
      int v17 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    v122 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v122 userInterfaceIdiom] != 1)
    {
      uint64_t v3 = 0;
      int v17 = 1;
      goto LABEL_21;
    }
  }
  int v17 = v16 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v113 = [MEMORY[0x1E4F42D90] mainScreen];
      [v113 _referenceBounds];
    }
    uint64_t v3 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v144 = v2 ^ 1;
      LODWORD(v145) = v17;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      long long v138 = 0uLL;
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      int v139 = 0;
      int v140 = 0;
      uint64_t v129 = 0;
      int v141 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v143 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 90.0;
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
LABEL_21:
  int v18 = __sb__runningInSpringBoard();
  int v144 = v3;
  LODWORD(v145) = v17;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v4 = 0;
      int v19 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    v121 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v121 userInterfaceIdiom] != 1)
    {
      uint64_t v4 = 0;
      int v19 = 1;
      goto LABEL_30;
    }
  }
  int v19 = v18 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v112 = [MEMORY[0x1E4F42D90] mainScreen];
      [v112 _referenceBounds];
    }
    uint64_t v4 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v142 = v2 ^ 1;
      int v143 = v19;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      long long v138 = 0uLL;
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      int v139 = 0;
      int v140 = 0;
      uint64_t v129 = 0;
      int v141 = 0;
      uint64_t v128 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 90.0;
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
LABEL_30:
  int v20 = __sb__runningInSpringBoard();
  int v142 = v4;
  int v143 = v19;
  if (v20)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v21 = 0;
      uint64_t v5 = 0;
      goto LABEL_39;
    }
  }
  else
  {
    v120 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v120 userInterfaceIdiom] != 1)
    {
      int v21 = 0;
      uint64_t v5 = 1;
      goto LABEL_39;
    }
  }
  uint64_t v5 = v20 ^ 1u;
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v117 = [MEMORY[0x1E4F42D90] mainScreen];
    [v117 _referenceBounds];
  }
  int v21 = v2 ^ 1;
  BSSizeRoundForScale();
  if (v22 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v140 = v2 ^ 1;
    int v141 = v5;
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    long long v138 = 0uLL;
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    int v139 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 90.0;
    goto LABEL_69;
  }
LABEL_39:
  int v23 = __sb__runningInSpringBoard();
  int v140 = v21;
  int v141 = v5;
  if (v23)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v138) = 0;
      int v24 = 0;
      goto LABEL_49;
    }
  }
  else
  {
    v119 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v119 userInterfaceIdiom] != 1)
    {
      HIDWORD(v138) = 0;
      int v24 = 1;
      goto LABEL_49;
    }
  }
  int v24 = v23 ^ 1;
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v115 = [MEMORY[0x1E4F42D90] mainScreen];
    [v115 _referenceBounds];
  }
  HIDWORD(v138) = v2 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v139 = v24;
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    *(void *)&long long v138 = 0;
    long long v134 = 0uLL;
    DWORD2(v138) = 0;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 90.0;
    goto LABEL_69;
  }
LABEL_49:
  int v26 = __sb__runningInSpringBoard();
  int v139 = v24;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v138 + 4) = 0;
      goto LABEL_180;
    }
  }
  else
  {
    v118 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v118 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v138 + 4) = 0x100000000;
      goto LABEL_180;
    }
  }
  DWORD2(v138) = v26 ^ 1;
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v111 = [MEMORY[0x1E4F42D90] mainScreen];
    [v111 _referenceBounds];
  }
  DWORD1(v138) = v2 ^ 1;
  BSSizeRoundForScale();
  if (v33 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    LODWORD(v138) = 0;
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 90.0;
    goto LABEL_69;
  }
LABEL_180:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_182;
    }
LABEL_188:
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 90.0;
    LODWORD(v138) = v2 ^ 1;
    goto LABEL_69;
  }
  v116 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v116 userInterfaceIdiom] == 1) {
    goto LABEL_188;
  }
LABEL_182:
  LODWORD(v138) = v2 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_186:
    *(void *)v137 = 0;
    goto LABEL_196;
  }
  int v34 = __sb__runningInSpringBoard();
  if (v34)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_186;
    }
  }
  else
  {
    v109 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v109 userInterfaceIdiom])
    {
      *(_DWORD *)v137 = 0;
      *(_DWORD *)&v137[4] = 1;
      goto LABEL_196;
    }
  }
  *(_DWORD *)&v137[4] = v34 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v102 = [MEMORY[0x1E4F42D90] mainScreen];
      [v102 _referenceBounds];
    }
    *(_DWORD *)v137 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v37 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v136, 0, sizeof(v136));
      *(_DWORD *)&v137[8] = 0;
      memset(v135, 0, sizeof(v135));
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 59.0;
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)v137 = 0;
  }
LABEL_196:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[36] = 0;
      *(_DWORD *)&v137[8] = 0;
      goto LABEL_206;
    }
  }
  else
  {
    v110 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v110 userInterfaceIdiom])
    {
      *(_DWORD *)&v136[36] = 0;
      *(_DWORD *)&v137[8] = 1;
      goto LABEL_206;
    }
  }
  *(_DWORD *)&v137[8] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v105 = [MEMORY[0x1E4F42D90] mainScreen];
      [v105 _referenceBounds];
    }
    *(_DWORD *)&v136[36] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_210;
    }
  }
  else
  {
    *(_DWORD *)&v136[36] = 0;
  }
LABEL_206:
  if (_SBF_Private_IsD94Like())
  {
    memset(v136, 0, 36);
    memset(v135, 0, sizeof(v135));
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 48.7;
    goto LABEL_69;
  }
LABEL_210:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_214:
    *(void *)&v136[28] = 0;
    goto LABEL_224;
  }
  int v36 = __sb__runningInSpringBoard();
  if (v36)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_214;
    }
  }
  else
  {
    v106 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v106 userInterfaceIdiom])
    {
      *(_DWORD *)&v136[28] = 0;
      *(_DWORD *)&v136[32] = 1;
      goto LABEL_224;
    }
  }
  *(_DWORD *)&v136[32] = v36 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v97 = [MEMORY[0x1E4F42D90] mainScreen];
      [v97 _referenceBounds];
    }
    *(_DWORD *)&v136[28] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v136, 0, 28);
      memset(v135, 0, sizeof(v135));
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 59.0;
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[28] = 0;
  }
LABEL_224:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[24] = 0;
      *(_DWORD *)&v136[16] = 0;
      goto LABEL_234;
    }
  }
  else
  {
    v108 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v108 userInterfaceIdiom])
    {
      *(_DWORD *)&v136[16] = 0;
      *(_DWORD *)&v136[24] = 1;
      goto LABEL_234;
    }
  }
  *(_DWORD *)&v136[24] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v101 = [MEMORY[0x1E4F42D90] mainScreen];
      [v101 _referenceBounds];
    }
    *(_DWORD *)&v136[16] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_238;
    }
  }
  else
  {
    *(_DWORD *)&v136[16] = 0;
  }
LABEL_234:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v136[20] = 0;
    *(_OWORD *)v136 = 0uLL;
    memset(v135, 0, sizeof(v135));
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 48.7;
    goto LABEL_69;
  }
LABEL_238:
  int v39 = __sb__runningInSpringBoard();
  if (v39)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[20] = 0;
      *(_DWORD *)&v136[12] = 0;
      goto LABEL_248;
    }
  }
  else
  {
    v107 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v107 userInterfaceIdiom])
    {
      *(_DWORD *)&v136[12] = 0;
      *(_DWORD *)&v136[20] = 1;
      goto LABEL_248;
    }
  }
  *(_DWORD *)&v136[20] = v39 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v40 = __sb__runningInSpringBoard();
    if (v40)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v98 = [MEMORY[0x1E4F42D90] mainScreen];
      [v98 _referenceBounds];
    }
    uint64_t v2 = v40 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v136[12] = v2;
    if (v41 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)v136 = 0;
      memset(v135, 0, sizeof(v135));
      *(_DWORD *)&v136[8] = 0;
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 59.0;
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[12] = 0;
  }
LABEL_248:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v136 = 0;
      *(_DWORD *)v135 = 0;
      goto LABEL_258;
    }
  }
  else
  {
    v104 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v104 userInterfaceIdiom])
    {
      *(_DWORD *)v135 = 0;
      *(_DWORD *)v136 = 1;
      goto LABEL_258;
    }
  }
  *(_DWORD *)v136 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v96 = [MEMORY[0x1E4F42D90] mainScreen];
      [v96 _referenceBounds];
    }
    *(_DWORD *)v135 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_268;
    }
  }
  else
  {
    *(_DWORD *)v135 = 0;
  }
LABEL_258:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v136[4] = 0;
    *(void *)&v135[4] = 0;
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 48.7;
    goto LABEL_69;
  }
LABEL_268:
  int v44 = __sb__runningInSpringBoard();
  if (v44)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v136[4] = 0;
      goto LABEL_278;
    }
  }
  else
  {
    v103 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v103 userInterfaceIdiom])
    {
      *(_DWORD *)&v136[4] = 0;
      *(_DWORD *)&v136[8] = 1;
      goto LABEL_278;
    }
  }
  *(_DWORD *)&v136[8] = v44 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v45 = __sb__runningInSpringBoard();
    if (v45)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v93 = [MEMORY[0x1E4F42D90] mainScreen];
      [v93 _referenceBounds];
    }
    uint64_t v2 = v45 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v136[4] = v2;
    if (v46 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && _SBF_Private_IsN84OrSimilarDevice())
    {
      *(void *)&v135[4] = 0;
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 58.5;
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[4] = 0;
  }
LABEL_278:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v135[4] = 0;
      goto LABEL_288;
    }
  }
  else
  {
    v100 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v100 userInterfaceIdiom])
    {
      *(_DWORD *)&v135[4] = 0;
      *(_DWORD *)&v135[8] = 1;
      goto LABEL_288;
    }
  }
  *(_DWORD *)&v135[8] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v92 = [MEMORY[0x1E4F42D90] mainScreen];
      [v92 _referenceBounds];
    }
    *(_DWORD *)&v135[4] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v47 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_297;
    }
  }
  else
  {
    *(_DWORD *)&v135[4] = 0;
  }
LABEL_288:
  if (_SBF_Private_IsD33OrSimilarDevice() && _SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 50.7;
    goto LABEL_69;
  }
LABEL_297:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_301:
    HIDWORD(v134) = 0;
    LODWORD(v134) = 0;
    goto LABEL_308;
  }
  int v48 = __sb__runningInSpringBoard();
  if (v48)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_301;
    }
  }
  else
  {
    v95 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v95 userInterfaceIdiom])
    {
      LODWORD(v134) = 0;
      HIDWORD(v134) = 1;
      goto LABEL_308;
    }
  }
  HIDWORD(v134) = v48 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v86 = [MEMORY[0x1E4F42D90] mainScreen];
      [v86 _referenceBounds];
    }
    uint64_t v2 = v49 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v134) = v2;
    if (v54 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      *(void *)((char *)&v134 + 4) = 0;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 51.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v134) = 0;
  }
LABEL_308:
  int v50 = __sb__runningInSpringBoard();
  if (v50)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      DWORD2(v134) = 0;
      uint64_t v2 = 0;
      goto LABEL_318;
    }
  }
  else
  {
    v99 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v99 userInterfaceIdiom])
    {
      uint64_t v2 = 0;
      DWORD2(v134) = 1;
      goto LABEL_318;
    }
  }
  DWORD2(v134) = v50 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v51 = __sb__runningInSpringBoard();
    if (v51)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v89 = [MEMORY[0x1E4F42D90] mainScreen];
      [v89 _referenceBounds];
    }
    uint64_t v2 = v51 ^ 1u;
    BSSizeRoundForScale();
    if (v52 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_322;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
LABEL_318:
  if (_SBF_Private_IsD93Like())
  {
    DWORD1(v134) = v2;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 37.5;
    goto LABEL_69;
  }
LABEL_322:
  DWORD1(v134) = v2;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_326:
    uint64_t v132 = 0;
    goto LABEL_336;
  }
  int v53 = __sb__runningInSpringBoard();
  if (v53)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_326;
    }
  }
  else
  {
    v90 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v90 userInterfaceIdiom])
    {
      uint64_t v132 = 0x100000000;
      goto LABEL_336;
    }
  }
  HIDWORD(v132) = v53 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v82 = [MEMORY[0x1E4F42D90] mainScreen];
      [v82 _referenceBounds];
    }
    LODWORD(v132) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 51.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v132) = 0;
  }
LABEL_336:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v133 = 0;
      int v131 = 0;
      goto LABEL_346;
    }
  }
  else
  {
    v94 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v94 userInterfaceIdiom])
    {
      int v131 = 0;
      int v133 = 1;
      goto LABEL_346;
    }
  }
  int v133 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v85 = [MEMORY[0x1E4F42D90] mainScreen];
      [v85 _referenceBounds];
    }
    int v131 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v55 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_350;
    }
  }
  else
  {
    int v131 = 0;
  }
LABEL_346:
  if (_SBF_Private_IsD63Like())
  {
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 37.5;
    goto LABEL_69;
  }
LABEL_350:
  int v56 = __sb__runningInSpringBoard();
  if (v56)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v129) = 0;
      HIDWORD(v127) = 0;
      goto LABEL_360;
    }
  }
  else
  {
    v91 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v91 userInterfaceIdiom])
    {
      HIDWORD(v127) = 0;
      HIDWORD(v129) = 1;
      goto LABEL_360;
    }
  }
  HIDWORD(v129) = v56 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v83 = [MEMORY[0x1E4F42D90] mainScreen];
      [v83 _referenceBounds];
    }
    uint64_t v2 = v57 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v127) = v2;
    if (v58 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      LODWORD(v129) = 0;
      uint64_t v128 = 0;
      LODWORD(v127) = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 59.0;
      goto LABEL_69;
    }
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_360:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v129) = 0;
      HIDWORD(v128) = 0;
      goto LABEL_370;
    }
  }
  else
  {
    v88 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v88 userInterfaceIdiom])
    {
      HIDWORD(v128) = 0;
      LODWORD(v129) = 1;
      goto LABEL_370;
    }
  }
  LODWORD(v129) = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v81 = [MEMORY[0x1E4F42D90] mainScreen];
      [v81 _referenceBounds];
    }
    HIDWORD(v128) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_380;
    }
  }
  else
  {
    HIDWORD(v128) = 0;
  }
LABEL_370:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    LODWORD(v128) = 0;
    LODWORD(v127) = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 51.2;
    goto LABEL_69;
  }
LABEL_380:
  int v61 = __sb__runningInSpringBoard();
  if (v61)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v128) = 0;
      LODWORD(v127) = 0;
      goto LABEL_390;
    }
  }
  else
  {
    v87 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v87 userInterfaceIdiom])
    {
      LODWORD(v127) = 0;
      LODWORD(v128) = 1;
      goto LABEL_390;
    }
  }
  LODWORD(v128) = v61 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v80 = [MEMORY[0x1E4F42D90] mainScreen];
      [v80 _referenceBounds];
    }
    LODWORD(v127) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v64 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 51.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v127) = 0;
  }
LABEL_390:
  int v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v126 = 0;
      uint64_t v2 = 0;
      goto LABEL_400;
    }
  }
  else
  {
    v84 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v84 userInterfaceIdiom])
    {
      uint64_t v2 = 0;
      int v126 = 1;
      goto LABEL_400;
    }
  }
  int v126 = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    uint64_t v2 = 0;
    goto LABEL_400;
  }
  int v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v79 = [MEMORY[0x1E4F42D90] mainScreen];
    [v79 _referenceBounds];
  }
  uint64_t v2 = v63 ^ 1u;
  BSSizeRoundForScale();
  if (v65 < *(double *)(MEMORY[0x1E4FA6E50] + 104))
  {
LABEL_400:
    if (_SBF_Private_IsD53())
    {
      int v130 = v2;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 37.5;
      goto LABEL_69;
    }
  }
  int v130 = v2;
  if (_SBF_Private_IsD16() && _SBF_Private_IsD52OrSimilarDevice()) {
    goto LABEL_409;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && _SBF_Private_IsD16()) {
    goto LABEL_412;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
LABEL_409:
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 51.0;
    goto LABEL_69;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
LABEL_412:
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = 40.0;
    goto LABEL_69;
  }
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v125 = 0;
      int v124 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    v78 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v78 userInterfaceIdiom])
    {
      int v124 = 0;
      int v125 = 1;
      goto LABEL_425;
    }
  }
  int v125 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v66 = __sb__runningInSpringBoard();
    if (v66)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v76 = [MEMORY[0x1E4F42D90] mainScreen];
      [v76 _referenceBounds];
    }
    int v124 = v66 ^ 1;
    BSSizeRoundForScale();
    if (v71 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 51.0;
      goto LABEL_69;
    }
  }
  else
  {
    int v124 = 0;
  }
LABEL_425:
  int v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v9 = 0;
      int v10 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    v77 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v77 userInterfaceIdiom])
    {
      int v10 = 0;
      int v9 = 1;
      goto LABEL_435;
    }
  }
  int v9 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v75 = [MEMORY[0x1E4F42D90] mainScreen];
      [v75 _referenceBounds];
    }
    int v10 = v68 ^ 1;
    BSSizeRoundForScale();
    if (v72 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = 40.0;
      goto LABEL_69;
    }
  }
  else
  {
    int v10 = 0;
  }
LABEL_435:
  int v69 = __sb__runningInSpringBoard();
  if (v69)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v11 = 0;
      int v12 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v2 userInterfaceIdiom])
    {
      int v12 = 0;
      int v11 = 1;
      goto LABEL_445;
    }
  }
  int v11 = v69 ^ 1;
  uint64_t v3 = __sb__runningInSpringBoard();
  if (v3)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v4 _referenceBounds];
  }
  int v12 = v3 ^ 1;
  BSSizeRoundForScale();
  if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v13 = 0;
    int v14 = 0;
    double v15 = 50.0;
    goto LABEL_69;
  }
LABEL_445:
  uint64_t v3 = __sb__runningInSpringBoard();
  if (v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v13 = 0;
      int v14 = 0;
LABEL_462:
      double v15 = 50.0;
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom])
    {
      int v14 = 0;
      int v13 = 1;
      goto LABEL_462;
    }
  }
  int v13 = v3 ^ 1;
  int v73 = __sb__runningInSpringBoard();
  if (v73)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v3 _referenceBounds];
  }
  int v14 = v73 ^ 1;
  BSSizeRoundForScale();
  if (v74 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_462;
  }
  double v15 = 50.0;
LABEL_69:
  if (v14) {

  }
  if (v13) {
  if (v12)
  }

  if (v11) {
  if (v10)
  }

  if (v9) {
  if (v124)
  }

  if (v125) {
  if (v130)
  }

  if (v126) {
  if (v127)
  }

  if (v128) {
  if (HIDWORD(v128))
  }

  if (v129) {
  if (HIDWORD(v127))
  }

  if (HIDWORD(v129)) {
  if (v131)
  }

  if (v133) {
  if (v132)
  }

  if (HIDWORD(v132)) {
  if (DWORD1(v134))
  }

  if (DWORD2(v134)) {
  if (v134)
  }

  if (HIDWORD(v134)) {
  if (*(_DWORD *)&v135[4])
  }

  if (*(_DWORD *)&v135[8]) {
  if (*(_DWORD *)&v136[4])
  }

  if (*(_DWORD *)&v136[8]) {
  if (*(_DWORD *)v135)
  }

  if (*(_DWORD *)v136) {
  if (*(_DWORD *)&v136[12])
  }

  if (*(_DWORD *)&v136[20]) {
  if (*(_DWORD *)&v136[16])
  }

  if (*(_DWORD *)&v136[24]) {
  if (*(_DWORD *)&v136[28])
  }

  if (*(_DWORD *)&v136[32]) {
  if (*(_DWORD *)&v136[36])
  }

  if (*(_DWORD *)&v137[8]) {
  if (*(_DWORD *)v137)
  }

  if (*(_DWORD *)&v137[4]) {
  if (v138)
  }

  if (DWORD1(v138)) {
  if (DWORD2(v138))
  }

  if (HIDWORD(v138))
  {

    if (!v139) {
      goto LABEL_157;
    }
  }
  else if (!v139)
  {
LABEL_157:
    if (v140) {
      goto LABEL_158;
    }
    goto LABEL_168;
  }

  if (v140)
  {
LABEL_158:

    if (!v141) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }
LABEL_168:
  if (!v141)
  {
LABEL_159:
    if (v142) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:

  if (v142)
  {
LABEL_160:

    if (!v143) {
      goto LABEL_161;
    }
    goto LABEL_171;
  }
LABEL_170:
  if (!v143)
  {
LABEL_161:
    if (v144) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_171:

  if (v144)
  {
LABEL_162:

    if (!v145) {
      goto LABEL_163;
    }
    goto LABEL_173;
  }
LABEL_172:
  if (!v145)
  {
LABEL_163:
    if (HIDWORD(v145)) {
      goto LABEL_164;
    }
    goto LABEL_174;
  }
LABEL_173:

  if (HIDWORD(v145))
  {
LABEL_164:

    if (!v146) {
      return v15;
    }
    goto LABEL_175;
  }
LABEL_174:
  if (v146) {
LABEL_175:
  }

  return v15;
}

- (UIView)unblockDeviceView
{
  return self->_unblockDeviceView;
}

- (UIView)authenticationView
{
  return self->_authenticationView;
}

- (CSDeviceBlockViewDelegate)deviceBlockDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceBlockDelegate);

  return (CSDeviceBlockViewDelegate *)WeakRetained;
}

- (void)setDeviceBlockDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceBlockDelegate);
  objc_storeStrong((id *)&self->_authenticationView, 0);
  objc_storeStrong((id *)&self->_unblockDeviceView, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_emergencyButton, 0);

  objc_storeStrong((id *)&self->_unblockDeviceButton, 0);
}

@end