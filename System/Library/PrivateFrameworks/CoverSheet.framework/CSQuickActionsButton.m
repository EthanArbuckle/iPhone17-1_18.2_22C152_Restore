@interface CSQuickActionsButton
+ (double)buttonDiameter;
- (BOOL)clickInteractionShouldBegin:(id)a3;
- (BOOL)hasSameOriginatingIconAsForIconZoomingView:(id)a3;
- (BOOL)iconImageSizeMatchesBoundsSize;
- (BOOL)shouldClipToBoundsWhenSizeChanges;
- (BOOL)visible;
- (CGRect)iconImageFrame;
- (CGSize)iconImageSize;
- (CSQuickAction)action;
- (CSQuickActionsButton)initWithAction:(id)a3 luminanceMap:(id)a4;
- (CSQuickActionsButtonDelegate)delegate;
- (_UILegibilitySettings)legibilitySettings;
- (double)iconContentScale;
- (double)scaleForFadeValue:(double)a3 originalSize:(CGSize)a4 containerSize:(CGSize)a5;
- (id)_accessoryTitleForAction:(id)a3;
- (id)_buttonGroupName;
- (id)_createButtonGlyphForAction:(id)a3;
- (id)_placeholderCopy;
- (id)_systemImageWithName:(id)a3 configuration:(id)a4;
- (int64_t)appearance;
- (unint64_t)iconImageAlignment;
- (void)_actionVisibilityDidUpdate;
- (void)_placeholderCopy;
- (void)_updateTintColorForPermittedState;
- (void)allowsInteractionDidChangeForAction:(id)a3;
- (void)cleanUpAfterCrossfadeCompletion;
- (void)isSelectedDidChangeForAction:(id)a3;
- (void)prepareToCrossfadeImageWithView:(id)a3;
- (void)setAction:(id)a3;
- (void)setAppearance:(int64_t)a3;
- (void)setCrossfadeCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setGlyphView:(id)a3;
- (void)setGlyphViewForAction:(id)a3;
- (void)setIconContentHidden:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMorphFraction:(double)a3;
- (void)setVisible:(BOOL)a3;
- (void)showsButtonDidChangeForAction:(id)a3;
@end

@implementation CSQuickActionsButton

- (void)allowsInteractionDidChangeForAction:(id)a3
{
  id v6 = a3;
  id v4 = [(CSQuickActionsButton *)self action];

  v5 = v6;
  if (v4 == v6)
  {
    -[CSQuickActionsButton setAppearance:](self, "setAppearance:", [v6 appearance]);
    -[CSQuickActionsButton setEnabled:](self, "setEnabled:", [v6 allowsInteraction]);
    v5 = v6;
  }
}

- (void)setAppearance:(int64_t)a3
{
  if (self->_appearance != a3)
  {
    self->_appearance = a3;
    id v4 = [(CSProminentButtonControl *)self glyphView];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CSProminentButtonControl *)self glyphView];
      [v6 setAppearance:self->_appearance];
    }
  }
}

- (CSQuickAction)action
{
  return self->_action;
}

- (CSQuickActionsButton)initWithAction:(id)a3 luminanceMap:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSQuickActionsButton;
  v7 = -[CSProminentButtonControl initWithFrame:luminanceMap:](&v10, sel_initWithFrame_luminanceMap_, a4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    [(CSQuickActionsButton *)v7 setAction:v6];
    [(CSQuickActionsButton *)v8 setGlyphViewForAction:v6];
  }

  return v8;
}

- (id)_placeholderCopy
{
  v3 = [(CSQuickActionsButton *)self action];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [CSQuickActionImageGlyphView alloc];
    v8 = [v3 symbolName];
    v9 = [v3 selectedSymbolName];
    [v3 symbolScaleValue];
    double v11 = v10;
    [(id)objc_opt_class() buttonDiameter];
    double v13 = v12;
    v14 = [v3 symbolOnColor];
    v15 = [(CSQuickActionImageGlyphView *)v7 initWithSystemImageName:v8 selectedSystemImageName:v9 symbolScaleValue:v14 buttonDiameter:v11 symbolOnColor:v13];
LABEL_10:

    v23 = [(CSProminentButtonControl *)self glyphView];
    [v23 frame];
    -[CSQuickActionImageGlyphView setFrame:](v15, "setFrame:");

    id v24 = [(CSProminentButtonControl *)self copyWithoutGlyphView];
    uint64_t v25 = objc_opt_class();
    id v26 = v24;
    if (v25)
    {
      if (objc_opt_isKindOfClass()) {
        v27 = v26;
      }
      else {
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
    }
    id v28 = v27;

    [v28 setSelected:0];
    [v28 setGlyphView:v15];
    goto LABEL_16;
  }
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  v15 = v6;

  v9 = [(CSQuickActionImageGlyphView *)v15 controlInstance];
  v16 = [v9 descriptor];
  if (v16)
  {
    v14 = v16;
    v17 = (void *)MEMORY[0x1E4F58F30];
    uint64_t v18 = [v16 controlType];
    v19 = [v9 instanceIdentity];
    v20 = [v17 instanceOfType:v18 instanceIdentity:v19];

    [v20 modifyConfiguration:&__block_literal_global_16];
    [v20 activate];
    [v20 setVisibility:2];
    v21 = [CSQuickActionControlGlyphView alloc];
    [(CSQuickActionImageGlyphView *)v15 symbolScaleValue];
    uint64_t v22 = -[CSQuickActionControlGlyphView initWithControlInstance:symbolScaleValue:](v21, "initWithControlInstance:symbolScaleValue:", v20);

    v8 = v15;
    v15 = (CSQuickActionImageGlyphView *)v22;
    goto LABEL_10;
  }
  v30 = SBLogDashBoard();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    [(CSQuickActionsButton *)(uint64_t)v15 _placeholderCopy];
  }

  id v28 = 0;
LABEL_16:

  return v28;
}

uint64_t __40__CSQuickActionsButton__placeholderCopy__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCanAppearInSecureEnvironment:1];
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend(v5, "sb_isEqualToLegibilitySettings:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(CSQuickActionsButton *)self _updateTintColorForPermittedState];
  }
}

- (void)setAction:(id)a3
{
  id v5 = (CSQuickAction *)a3;
  if (self->_action != v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_storeStrong((id *)&self->_action, a3);
    [(CSQuickAction *)v5 setDelegate:self];
    [(CSQuickActionsButton *)self setHidden:[(CSQuickAction *)v5 showsButton] ^ 1];
    [(CSQuickActionsButton *)self setAppearance:[(CSQuickAction *)v5 appearance]];
    [(CSQuickActionsButton *)self setEnabled:[(CSQuickAction *)v5 allowsInteraction]];
    [(CSProminentButtonControl *)self setSelected:[(CSQuickAction *)v5 isSelected]];
    [(CSQuickActionsButton *)self _updateTintColorForPermittedState];
    [(CSQuickActionsButton *)self _actionVisibilityDidUpdate];
  }
}

- (void)setGlyphView:(id)a3
{
  id v4 = a3;
  id v5 = [(CSProminentButtonControl *)self glyphView];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)CSQuickActionsButton;
    [(CSProminentButtonControl *)&v6 setGlyphView:v4];
    if (objc_opt_respondsToSelector()) {
      [v4 setAppearance:self->_appearance];
    }
  }
}

- (void)setGlyphViewForAction:(id)a3
{
  id v4 = [(CSQuickActionsButton *)self _createButtonGlyphForAction:a3];
  [(CSQuickActionsButton *)self setGlyphView:v4];
}

+ (double)buttonDiameter
{
  int v3 = __sb__runningInSpringBoard();
  uint64_t v4 = (uint64_t)&CSQuickActionButtonDiameter;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v5 = 0;
      int v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v120 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v120 userInterfaceIdiom] != 1)
    {
      uint64_t v5 = 0;
      int v6 = 1;
      goto LABEL_10;
    }
  }
  int v6 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v121 = [MEMORY[0x1E4F42D90] mainScreen];
      [v121 _referenceBounds];
    }
    uint64_t v5 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v27 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v143 = v7 ^ 1;
      int v144 = v6;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      int v139 = 0;
      uint64_t v123 = 0;
      int v140 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v141 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505CC8;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_10:
  int v8 = __sb__runningInSpringBoard();
  int v143 = v5;
  int v144 = v6;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v9 = 0;
      int v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v119 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v119 userInterfaceIdiom] != 1)
    {
      int v9 = 0;
      int v10 = 1;
      goto LABEL_19;
    }
  }
  int v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v111 = [MEMORY[0x1E4F42D90] mainScreen];
      [v111 _referenceBounds];
    }
    int v9 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v140 = v7 ^ 1;
      int v141 = v10;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      int v139 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505CF0;
      goto LABEL_67;
    }
  }
  else
  {
    int v9 = 0;
  }
LABEL_19:
  int v11 = __sb__runningInSpringBoard();
  int v140 = v9;
  int v141 = v10;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v12 = 0;
      int v13 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v118 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v118 userInterfaceIdiom] != 1)
    {
      int v12 = 0;
      int v13 = 1;
      goto LABEL_28;
    }
  }
  int v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v110 = [MEMORY[0x1E4F42D90] mainScreen];
      [v110 _referenceBounds];
    }
    int v12 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v138 = v7 ^ 1;
      int v139 = v13;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      uint64_t v125 = 0;
      uint64_t v124 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505CE0;
      goto LABEL_67;
    }
  }
  else
  {
    int v12 = 0;
  }
LABEL_28:
  int v14 = __sb__runningInSpringBoard();
  int v138 = v12;
  int v139 = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v15 = 0;
      uint64_t v2 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v117 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v117 userInterfaceIdiom] != 1)
    {
      int v15 = 0;
      uint64_t v2 = 1;
      goto LABEL_37;
    }
  }
  uint64_t v2 = v14 ^ 1u;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v114 = [MEMORY[0x1E4F42D90] mainScreen];
    [v114 _referenceBounds];
  }
  int v15 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v136 = v7 ^ 1;
    int v137 = v2;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    long long v135 = 0uLL;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v142 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505CE8;
    goto LABEL_67;
  }
LABEL_37:
  int v17 = __sb__runningInSpringBoard();
  int v136 = v15;
  int v137 = v2;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v142 = 0;
      uint64_t v4 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v116 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v116 userInterfaceIdiom] != 1)
    {
      int v142 = 0;
      uint64_t v4 = 1;
      goto LABEL_47;
    }
  }
  uint64_t v4 = v17 ^ 1u;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v112 = [MEMORY[0x1E4F42D90] mainScreen];
    [v112 _referenceBounds];
  }
  int v142 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    DWORD2(v135) = 0;
    HIDWORD(v135) = v4;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    *(void *)&long long v135 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505CD8;
    goto LABEL_67;
  }
LABEL_47:
  int v26 = __sb__runningInSpringBoard();
  HIDWORD(v135) = v4;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v135 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    v115 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v115 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v135 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v135) = v26 ^ 1;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v109 = [MEMORY[0x1E4F42D90] mainScreen];
    [v109 _referenceBounds];
  }
  DWORD1(v135) = v7 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    LODWORD(v135) = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505CD0;
    goto LABEL_67;
  }
LABEL_178:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_180;
    }
LABEL_186:
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505CC0;
    LODWORD(v135) = v7 ^ 1;
    goto LABEL_67;
  }
  v113 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v113 userInterfaceIdiom] == 1) {
    goto LABEL_186;
  }
LABEL_180:
  LODWORD(v135) = v7 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(void *)v134 = 0;
    goto LABEL_194;
  }
  int v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_184;
    }
  }
  else
  {
    v107 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v107 userInterfaceIdiom])
    {
      *(void *)v134 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)v134 = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v100 = [MEMORY[0x1E4F42D90] mainScreen];
      [v100 _referenceBounds];
    }
    *(_DWORD *)&v134[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v133, 0, sizeof(v133));
      *(_DWORD *)&v134[8] = 0;
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505CA0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v134[4] = 0;
  }
LABEL_194:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    v108 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v108 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v134[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v103 = [MEMORY[0x1E4F42D90] mainScreen];
      [v103 _referenceBounds];
    }
    *(_DWORD *)&v133[36] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_208;
    }
  }
  else
  {
    *(_DWORD *)&v133[36] = 0;
  }
LABEL_204:
  if (_SBF_Private_IsD94Like())
  {
    memset(v133, 0, 36);
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505CA8;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(void *)&v133[28] = 0;
    goto LABEL_222;
  }
  int v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_212;
    }
  }
  else
  {
    v104 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v104 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[28] = 0;
      *(_DWORD *)&v133[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v133[32] = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v95 = [MEMORY[0x1E4F42D90] mainScreen];
      [v95 _referenceBounds];
    }
    *(_DWORD *)&v133[28] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v133, 0, 28);
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505CB0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[28] = 0;
  }
LABEL_222:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[24] = 0;
      *(_DWORD *)&v133[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    v106 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v106 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[16] = 0;
      *(_DWORD *)&v133[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v133[24] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v99 = [MEMORY[0x1E4F42D90] mainScreen];
      [v99 _referenceBounds];
    }
    *(_DWORD *)&v133[16] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_236;
    }
  }
  else
  {
    *(_DWORD *)&v133[16] = 0;
  }
LABEL_232:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v133[20] = 0;
    *(_OWORD *)v133 = 0uLL;
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505CB8;
    goto LABEL_67;
  }
LABEL_236:
  int v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[20] = 0;
      *(_DWORD *)&v133[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    v105 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v105 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[12] = 0;
      *(_DWORD *)&v133[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v133[20] = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v96 = [MEMORY[0x1E4F42D90] mainScreen];
      [v96 _referenceBounds];
    }
    uint64_t v7 = v41 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[12] = v7;
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)v133 = 0;
      memset(v132, 0, sizeof(v132));
      *(_DWORD *)&v133[8] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505C90;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[12] = 0;
  }
LABEL_246:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v133 = 0;
      *(_DWORD *)v132 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    v102 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v102 userInterfaceIdiom])
    {
      *(_DWORD *)v132 = 0;
      *(_DWORD *)v133 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)v133 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v94 = [MEMORY[0x1E4F42D90] mainScreen];
      [v94 _referenceBounds];
    }
    *(_DWORD *)v132 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_266;
    }
  }
  else
  {
    *(_DWORD *)v132 = 0;
  }
LABEL_256:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v133[4] = 0;
    *(void *)&v132[4] = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C98;
    goto LABEL_67;
  }
LABEL_266:
  int v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v133[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    v101 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v101 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[4] = 0;
      *(_DWORD *)&v133[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v133[8] = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v46 = __sb__runningInSpringBoard();
    if (v46)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v91 = [MEMORY[0x1E4F42D90] mainScreen];
      [v91 _referenceBounds];
    }
    uint64_t v7 = v46 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[4] = v7;
    if (v47 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v132[4] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505C60;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[4] = 0;
  }
LABEL_276:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v132[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    v98 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v98 userInterfaceIdiom])
    {
      *(_DWORD *)&v132[4] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v132[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v90 = [MEMORY[0x1E4F42D90] mainScreen];
      [v90 _referenceBounds];
    }
    *(_DWORD *)&v132[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v48 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_295;
    }
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_286:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C68;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    uint64_t v130 = 0;
    goto LABEL_306;
  }
  int v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_299;
    }
  }
  else
  {
    v93 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v93 userInterfaceIdiom])
    {
      uint64_t v130 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v130) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v84 = [MEMORY[0x1E4F42D90] mainScreen];
      [v84 _referenceBounds];
    }
    uint64_t v7 = v50 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v130) = v7;
    if (v55 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505C50;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v130) = 0;
  }
LABEL_306:
  int v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v131) = 0;
      uint64_t v7 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    v97 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v97 userInterfaceIdiom])
    {
      uint64_t v7 = 0;
      HIDWORD(v131) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v131) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v87 = [MEMORY[0x1E4F42D90] mainScreen];
      [v87 _referenceBounds];
    }
    uint64_t v7 = v52 ^ 1u;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_320;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_316:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v131) = v7;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C58;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v131) = v7;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    uint64_t v128 = 0;
    goto LABEL_334;
  }
  int v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_324;
    }
  }
  else
  {
    v88 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v88 userInterfaceIdiom])
    {
      uint64_t v128 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v128) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v80 = [MEMORY[0x1E4F42D90] mainScreen];
      [v80 _referenceBounds];
    }
    LODWORD(v128) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v129 = 0;
      uint64_t v127 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505C80;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_334:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v129 = 0;
      HIDWORD(v127) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    v92 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v92 userInterfaceIdiom])
    {
      HIDWORD(v127) = 0;
      int v129 = 1;
      goto LABEL_344;
    }
  }
  int v129 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v83 = [MEMORY[0x1E4F42D90] mainScreen];
      [v83 _referenceBounds];
    }
    HIDWORD(v127) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_348;
    }
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_344:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v127) = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C88;
    goto LABEL_67;
  }
LABEL_348:
  int v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v127) = 0;
      HIDWORD(v124) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    v89 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v89 userInterfaceIdiom])
    {
      HIDWORD(v124) = 0;
      LODWORD(v127) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v127) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v81 = [MEMORY[0x1E4F42D90] mainScreen];
      [v81 _referenceBounds];
    }
    uint64_t v7 = v58 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v124) = v7;
    if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      LODWORD(v124) = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505C70;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v124) = 0;
  }
LABEL_358:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v126 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    v86 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v86 userInterfaceIdiom])
    {
      uint64_t v126 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v126) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v79 = [MEMORY[0x1E4F42D90] mainScreen];
      [v79 _referenceBounds];
    }
    LODWORD(v126) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_378;
    }
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_368:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v125 = 0;
    LODWORD(v124) = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C78;
    goto LABEL_67;
  }
LABEL_378:
  int v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v125) = 0;
      LODWORD(v124) = 0;
      goto LABEL_388;
    }
  }
  else
  {
    v85 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v85 userInterfaceIdiom])
    {
      LODWORD(v124) = 0;
      HIDWORD(v125) = 1;
      goto LABEL_388;
    }
  }
  HIDWORD(v125) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v78 = [MEMORY[0x1E4F42D90] mainScreen];
      [v78 _referenceBounds];
    }
    LODWORD(v124) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      uint64_t v123 = 0;
      LODWORD(v125) = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505C40;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_388:
  int v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      uint64_t v7 = 0;
      goto LABEL_398;
    }
  }
  else
  {
    v82 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v82 userInterfaceIdiom])
    {
      uint64_t v7 = 0;
      HIDWORD(v123) = 1;
      goto LABEL_398;
    }
  }
  HIDWORD(v123) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v64 = __sb__runningInSpringBoard();
    if (v64)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v77 = [MEMORY[0x1E4F42D90] mainScreen];
      [v77 _referenceBounds];
    }
    uint64_t v7 = v64 ^ 1u;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_405;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_398:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v125) = v7;
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C48;
    goto LABEL_67;
  }
LABEL_405:
  LODWORD(v125) = v7;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C20;
    goto LABEL_67;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C28;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C10;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C18;
    goto LABEL_67;
  }
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v123) = 0;
      int v122 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    v76 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v76 userInterfaceIdiom])
    {
      int v122 = 0;
      LODWORD(v123) = 1;
      goto LABEL_425;
    }
  }
  LODWORD(v123) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v74 = [MEMORY[0x1E4F42D90] mainScreen];
      [v74 _referenceBounds];
    }
    int v122 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505C30;
      goto LABEL_67;
    }
  }
  else
  {
    int v122 = 0;
  }
LABEL_425:
  int v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v18 = 0;
      int v19 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    v75 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v75 userInterfaceIdiom])
    {
      int v19 = 0;
      int v18 = 1;
      goto LABEL_435;
    }
  }
  int v18 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v73 = [MEMORY[0x1E4F42D90] mainScreen];
      [v73 _referenceBounds];
    }
    int v19 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      id v24 = &qword_1D8505C38;
      goto LABEL_67;
    }
  }
  else
  {
    int v19 = 0;
  }
LABEL_435:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v20 = 0;
      int v21 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v7 userInterfaceIdiom])
    {
      int v21 = 0;
      int v20 = 1;
      goto LABEL_445;
    }
  }
  int v20 = v5 ^ 1;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  int v21 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v68 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v22 = 0;
    int v23 = 0;
    id v24 = &qword_1D8505C08;
    goto LABEL_67;
  }
LABEL_445:
  uint64_t v4 = __sb__runningInSpringBoard();
  if (v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v22 = 0;
      int v23 = 0;
LABEL_462:
      id v24 = &CSQuickActionButtonDiameter;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom])
    {
      int v23 = 0;
      int v22 = 1;
      goto LABEL_462;
    }
  }
  int v22 = v4 ^ 1;
  int v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v4 _referenceBounds];
  }
  int v23 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v72 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_462;
  }
  id v24 = &qword_1D8505C00;
LABEL_67:
  double v32 = *(double *)v24;
  if (v23) {

  }
  if (v22) {
  if (v21)
  }

  if (v20) {
  if (v19)
  }

  if (v18) {
  if (v122)
  }

  if (v123) {
  if (v125)
  }

  if (HIDWORD(v123)) {
  if (v124)
  }

  if (HIDWORD(v125)) {
  if (v126)
  }

  if (HIDWORD(v126)) {
  if (HIDWORD(v124))
  }

  if (v127) {
  if (HIDWORD(v127))
  }

  if (v129) {
  if (v128)
  }

  if (HIDWORD(v128)) {
  if (v131)
  }

  if (HIDWORD(v131)) {
  if (v130)
  }

  if (HIDWORD(v130)) {
  if (*(_DWORD *)&v132[4])
  }

  if (*(_DWORD *)&v132[8]) {
  if (*(_DWORD *)&v133[4])
  }

  if (*(_DWORD *)&v133[8]) {
  if (*(_DWORD *)v132)
  }

  if (*(_DWORD *)v133) {
  if (*(_DWORD *)&v133[12])
  }

  if (*(_DWORD *)&v133[20]) {
  if (*(_DWORD *)&v133[16])
  }

  if (*(_DWORD *)&v133[24]) {
  if (*(_DWORD *)&v133[28])
  }

  if (*(_DWORD *)&v133[32]) {
  if (*(_DWORD *)&v133[36])
  }

  if (*(_DWORD *)&v134[8]) {
  if (*(_DWORD *)&v134[4])
  }

  if (*(_DWORD *)v134) {
  if (v135)
  }

  if (DWORD1(v135)) {
  if (DWORD2(v135))
  }

  if (v142)
  {

    if (!HIDWORD(v135)) {
      goto LABEL_155;
    }
  }
  else if (!HIDWORD(v135))
  {
LABEL_155:
    if (v136) {
      goto LABEL_156;
    }
    goto LABEL_166;
  }

  if (v136)
  {
LABEL_156:

    if (!v137) {
      goto LABEL_157;
    }
    goto LABEL_167;
  }
LABEL_166:
  if (!v137)
  {
LABEL_157:
    if (v138) {
      goto LABEL_158;
    }
    goto LABEL_168;
  }
LABEL_167:

  if (v138)
  {
LABEL_158:

    if (!v139) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }
LABEL_168:
  if (!v139)
  {
LABEL_159:
    if (v140) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:

  if (v140)
  {
LABEL_160:

    if (!v141) {
      goto LABEL_161;
    }
    goto LABEL_171;
  }
LABEL_170:
  if (!v141)
  {
LABEL_161:
    if (v143) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_171:

  if (v143)
  {
LABEL_162:

    if (!v144) {
      return v32;
    }
    goto LABEL_173;
  }
LABEL_172:
  if (v144) {
LABEL_173:
  }

  return v32;
}

- (id)_createButtonGlyphForAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = [CSQuickActionControlGlyphView alloc];
    int v6 = [v4 controlInstance];
    [v4 symbolScaleValue];
    double v8 = v7;

    int v9 = [(CSQuickActionControlGlyphView *)v5 initWithControlInstance:v6 symbolScaleValue:v8];
  }
  else
  {
    int v10 = [CSQuickActionImageGlyphView alloc];
    int v6 = [v3 symbolName];
    int v11 = [v3 selectedSymbolName];
    [v3 symbolScaleValue];
    double v13 = v12;
    [(id)objc_opt_class() buttonDiameter];
    double v15 = v14;
    double v16 = [v3 symbolOnColor];
    int v9 = [(CSQuickActionImageGlyphView *)v10 initWithSystemImageName:v6 selectedSystemImageName:v11 symbolScaleValue:v16 buttonDiameter:v13 symbolOnColor:v15];
  }

  return v9;
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    [(CSQuickActionsButton *)self _actionVisibilityDidUpdate];
  }
}

- (void)_actionVisibilityDidUpdate
{
  id v3 = [(CSQuickActionsButton *)self action];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(CSQuickActionsButton *)self action];
    if (self->_visible)
    {
      uint64_t v5 = [(CSQuickActionsButton *)self action];
      if ([v5 showsButton]) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    double v7 = [v8 controlInstance];
    [v7 setVisibility:v6];
  }
}

- (void)showsButtonDidChangeForAction:(id)a3
{
  id v6 = a3;
  id v4 = [(CSQuickActionsButton *)self action];

  uint64_t v5 = v6;
  if (v4 == v6)
  {
    -[CSQuickActionsButton setHidden:](self, "setHidden:", [v6 showsButton] ^ 1);
    -[CSQuickActionsButton setAppearance:](self, "setAppearance:", [v6 appearance]);
    -[CSQuickActionsButton setEnabled:](self, "setEnabled:", [v6 allowsInteraction]);
    [(CSQuickActionsButton *)self _actionVisibilityDidUpdate];
    uint64_t v5 = v6;
  }
}

- (void)isSelectedDidChangeForAction:(id)a3
{
  id v6 = a3;
  id v4 = [(CSQuickActionsButton *)self action];

  uint64_t v5 = v6;
  if (v4 == v6)
  {
    -[CSProminentButtonControl setSelected:](self, "setSelected:", [v6 isSelected]);
    uint64_t v5 = v6;
  }
}

- (void)_updateTintColorForPermittedState
{
  id v3 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  id v6 = v5;

  int64_t appearance = self->_appearance;
  double v8 = 1.0;
  if (appearance == 1) {
    double v8 = 0.5;
  }
  if (appearance == 2) {
    double v8 = 0.25;
  }
  id v9 = [v6 colorWithAlphaComponent:v8];

  [(CSQuickActionsButton *)self setTintColor:v9];
}

- (id)_accessoryTitleForAction:(id)a3
{
  id v3 = [a3 accessoryTitleKey];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:v3 value:&stru_1F3020248 table:@"CoverSheet"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_systemImageWithName:(id)a3 configuration:(id)a4
{
  id v4 = [MEMORY[0x1E4F42A80] systemImageNamed:a3 withConfiguration:a4];
  id v5 = [v4 _imageThatSuppressesAccessibilityHairlineThickening];

  return v5;
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  if (self->_callingSuper
    || (objc_msgSend((id)-[CSQuickActionsButton superclass](self, "superclass"), "instancesRespondToSelector:", sel_clickInteractionShouldBegin_) & 1) == 0)
  {
    self->_callingSuper = 0;
    goto LABEL_6;
  }
  self->_callingSuper = 1;
  v9.receiver = self;
  v9.super_class = (Class)CSQuickActionsButton;
  id v5 = [(CSQuickActionsButton *)&v9 performSelector:sel_clickInteractionShouldBegin_ withObject:v4];
  self->_callingSuper = 0;
  if (v5)
  {
LABEL_6:
    double v7 = [(CSQuickActionsButton *)self delegate];
    char v6 = [v7 shouldAllowClickInteraction:v4 toBeginForButton:self];

    goto LABEL_7;
  }
  char v6 = 0;
LABEL_7:

  return v6;
}

- (double)iconContentScale
{
  return 1.0;
}

- (CGRect)iconImageFrame
{
  id v3 = [(CSProminentButtonControl *)self backgroundEffectView];
  id v4 = [v3 superview];
  [v3 frame];
  objc_msgSend(v4, "convertRect:toView:", self);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)iconImageSizeMatchesBoundsSize
{
  return 0;
}

- (CGSize)iconImageSize
{
  [(CSQuickActionsButton *)self iconImageFrame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setMorphFraction:(double)a3
{
  [(UIView *)self->_iconZoomBackgroundEffectView setAlpha:1.0 - a3];
  if (BSFloatIsOne())
  {
    iconZoomBackgroundEffectView = self->_iconZoomBackgroundEffectView;
    double x = self->_iconZoomCrossfadeCounterpartFrame.origin.x;
    double y = self->_iconZoomCrossfadeCounterpartFrame.origin.y;
    double width = self->_iconZoomCrossfadeCounterpartFrame.size.width;
    double height = self->_iconZoomCrossfadeCounterpartFrame.size.height;
  }
  else
  {
    if (!BSFloatIsZero()) {
      return;
    }
    double v9 = self->_iconZoomBackgroundEffectView;
    [(CSQuickActionsButton *)self iconImageFrame];
    iconZoomBackgroundEffectView = v9;
  }

  -[UIView setFrame:](iconZoomBackgroundEffectView, "setFrame:", x, y, width, height);
}

- (void)setCrossfadeCornerRadius:(double)a3
{
}

- (void)prepareToCrossfadeImageWithView:(id)a3
{
  id v4 = a3;
  double v5 = [(CSProminentButtonControl *)self copyBackgroundVisualEffectView];
  iconZoomBackgroundEffectView = self->_iconZoomBackgroundEffectView;
  self->_iconZoomBackgroundEffectView = v5;

  [(CSQuickActionsButton *)self insertSubview:self->_iconZoomBackgroundEffectView atIndex:0];
  double v7 = self->_iconZoomBackgroundEffectView;
  [(CSProminentButtonControl *)self containerCornerRadius];
  -[UIView _setCornerRadius:](v7, "_setCornerRadius:");
  [(CSQuickActionsButton *)self iconImageFrame];
  CGFloat v26 = v9;
  id v27 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v4 frame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v30.origin.double x = v15;
  v30.origin.double y = v17;
  v30.size.double width = v19;
  v30.size.double height = v21;
  CGRectGetWidth(v30);
  if ((BSFloatIsZero() & 1) == 0)
  {
    v31.origin.double y = v26;
    *(void *)&v31.origin.double x = v27;
    v31.size.double width = v11;
    v31.size.double height = v13;
    CGRectGetWidth(v31);
    v32.origin.double x = v15;
    v32.origin.double y = v17;
    v32.size.double width = v19;
    v32.size.double height = v21;
    CGRectGetWidth(v32);
  }
  v33.origin.double x = v15;
  v33.origin.double y = v17;
  v33.size.double width = v19;
  v33.size.double height = v21;
  CGRectGetWidth(v33);
  v34.origin.double x = v15;
  v34.origin.double y = v17;
  v34.size.double width = v19;
  v34.size.double height = v21;
  CGRectGetHeight(v34);
  UIRectCenteredRect();
  self->_iconZoomCrossfadeCounterpartFrame.origin.double x = v22;
  self->_iconZoomCrossfadeCounterpartFrame.origin.double y = v23;
  self->_iconZoomCrossfadeCounterpartFrame.size.double width = v24;
  self->_iconZoomCrossfadeCounterpartFrame.size.double height = v25;
  id v28 = [(CSProminentButtonControl *)self backgroundEffectView];
  [v28 setHidden:1];
}

- (BOOL)hasSameOriginatingIconAsForIconZoomingView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    double v9 = [(CSQuickActionsButton *)self action];
    double v10 = [v8 action];
    char v11 = [v9 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)iconImageAlignment
{
  return 0;
}

- (BOOL)shouldClipToBoundsWhenSizeChanges
{
  return 0;
}

- (void)setIconContentHidden:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  if (a3) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  long long v11 = 0uLL;
  long long v12 = 0uLL;
  id v4 = [(CSQuickActionsButton *)self subviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) setAlpha:v3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)cleanUpAfterCrossfadeCompletion
{
  [(UIView *)self->_iconZoomBackgroundEffectView removeFromSuperview];
  iconZoomBackgroundEffectView = self->_iconZoomBackgroundEffectView;
  self->_iconZoomBackgroundEffectView = 0;

  id v4 = [(CSProminentButtonControl *)self backgroundEffectView];
  [v4 setHidden:0];
}

- (double)scaleForFadeValue:(double)a3 originalSize:(CGSize)a4 containerSize:(CGSize)a5
{
  double width = a5.width;
  [(CSQuickActionsButton *)self iconImageSize];
  double v7 = v6;
  int IsZero = BSFloatIsZero();
  double result = width / v7;
  if (IsZero) {
    return 0.0;
  }
  return result;
}

- (id)_buttonGroupName
{
  double v2 = NSString;
  double v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 stringWithFormat:@"%@.button", v4];

  return v5;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (BOOL)visible
{
  return self->_visible;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (CSQuickActionsButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSQuickActionsButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_iconZoomBackgroundEffectView, 0);
}

- (void)_placeholderCopy
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 control];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  long long v9 = v5;
  _os_log_error_impl(&dword_1D839D000, a3, OS_LOG_TYPE_ERROR, "[Quick Action] placeholder not created because found nil descriptor for %{public}@ with control %{public}@", (uint8_t *)&v6, 0x16u);
}

@end