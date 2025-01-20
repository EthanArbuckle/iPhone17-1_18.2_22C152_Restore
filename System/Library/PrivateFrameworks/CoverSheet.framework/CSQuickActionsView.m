@interface CSQuickActionsView
- (BOOL)_hidesButtonsForWidgetControls;
- (BOOL)_prototypingAllowsButtons;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_showsControlButtons;
- (BOOL)actionsVisible;
- (BOOL)interpretsLocationAsBesideContent:(CGPoint)a3 inView:(id)a4;
- (BOOL)interpretsLocationAsContent:(CGPoint)a3 inView:(id)a4;
- (BOOL)shouldAllowClickInteraction:(id)a3 toBeginForButton:(id)a4;
- (BOOL)strictlyInterpretsLocationAsContent:(CGPoint)a3 inView:(id)a4;
- (CGRect)_leadingFrameWithOutsets:(BOOL)a3;
- (CGRect)_trailingFrameWithOutsets:(BOOL)a3;
- (CGSize)_buttonSizeWithOutsets:(BOOL)a3;
- (CSDashBoardQuickActionsButtonSettings)quickActionsSettings;
- (CSProminentButtonsView)buttonContainerView;
- (CSQuickActionsDelegate)delegate;
- (CSQuickActionsView)initWithFrame:(CGRect)a3 delegate:(id)a4;
- (NSArray)animatedLayerProperties;
- (NSArray)buttonActions;
- (NSArray)buttons;
- (NSArray)controlsActions;
- (UIEdgeInsets)_buttonOutsets;
- (_UILegibilitySettings)legibilitySettings;
- (double)_insetX;
- (double)_insetY;
- (double)_minYWithOutsets:(BOOL)a3;
- (id)_buttonGroupName;
- (id)_createButtonForAction:(id)a3;
- (id)buttonsForApplicationBundleIdentifier:(id)a3;
- (void)_addTargetsToButton:(id)a3;
- (void)_layoutWidgetContainerView;
- (void)_removeTargetsFromButton:(id)a3;
- (void)_setButtonBackgroundVisible:(BOOL)a3;
- (void)handleButtonPress:(id)a3;
- (void)handleButtonTouchBegan:(id)a3;
- (void)handleButtonTouchEnded:(id)a3;
- (void)layoutSubviews;
- (void)refreshSupportedButtons;
- (void)setActionsVisible:(BOOL)a3;
- (void)setAnimatedLayerProperties:(id)a3;
- (void)setButtonActions:(id)a3;
- (void)setButtonContainerView:(id)a3;
- (void)setButtons:(id)a3;
- (void)setControlsActions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setQuickActionsSettings:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation CSQuickActionsView

- (CSQuickActionsView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CSQuickActionsView;
  v10 = -[CSQuickActionsView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    v12 = +[CSLockScreenDomain rootSettings];
    uint64_t v13 = [v12 dashBoardQuickActionButtonSettings];
    quickActionsSettings = v11->_quickActionsSettings;
    v11->_quickActionsSettings = (CSDashBoardQuickActionsButtonSettings *)v13;

    [(PTSettings *)v11->_quickActionsSettings addKeyObserver:v11];
    v15 = (SBMiscellaneousDefaults *)objc_alloc_init(MEMORY[0x1E4FA60B8]);
    miscellaneousDefaults = v11->_miscellaneousDefaults;
    v11->_miscellaneousDefaults = v15;

    uint64_t v17 = [MEMORY[0x1E4F42A80] kitImageNamed:@"UICoverSheetButtonLuminanceMap"];
    luminanceMap = v11->_luminanceMap;
    v11->_luminanceMap = (UIImage *)v17;

    [(CSQuickActionsView *)v11 refreshSupportedButtons];
  }

  return v11;
}

- (id)_createButtonForAction:(id)a3
{
  id v4 = a3;
  v5 = [[CSQuickActionsButton alloc] initWithAction:v4 luminanceMap:self->_luminanceMap];
  [(CSQuickActionsButton *)v5 setDelegate:self];
  v6 = [(CSQuickActionsView *)self _buttonGroupName];
  [(CSProminentButtonControl *)v5 setBackgroundEffectViewGroupName:v6];

  [(CSQuickActionsButton *)v5 setLegibilitySettings:self->_legibilitySettings];
  -[CSQuickActionsButton setHidden:](v5, "setHidden:", [v4 showsButton] ^ 1);
  [(CSQuickActionsButton *)v5 setVisible:1];
  v7 = [v4 accessibilityIdentifier];

  [(CSQuickActionsButton *)v5 setAccessibilityIdentifier:v7];
  [(CSQuickActionsView *)self _addTargetsToButton:v5];

  return v5;
}

- (void)setButtonActions:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_buttonActions isEqualToArray:v4]) {
    goto LABEL_50;
  }
  v5 = (NSArray *)[(NSArray *)self->_buttons mutableCopy];
  v6 = (NSArray *)[(NSArray *)self->_buttonActions mutableCopy];
  buttonActions = self->_buttonActions;
  if (buttonActions && (uint64_t v8 = -[NSArray count](buttonActions, "count"), v8 == [v4 count]))
  {
    if (![v4 count])
    {
      v19 = v6;
      goto LABEL_21;
    }
    id v9 = v5;
    unint64_t v10 = 0;
    do
    {
      v11 = [v4 objectAtIndexedSubscript:v10];
      v12 = [(NSArray *)self->_buttonActions objectAtIndexedSubscript:v10];
      char v13 = BSEqualObjects();

      if ((v13 & 1) == 0)
      {
        v14 = SBLogCoverSheet();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [v4 objectAtIndexedSubscript:v10];
          *(_DWORD *)buf = 138412290;
          v57 = v15;
          _os_log_impl(&dword_1D839D000, v14, OS_LOG_TYPE_DEFAULT, "[Quick Action] creating button for action %@", buf, 0xCu);
        }
        v16 = [(NSArray *)v9 objectAtIndexedSubscript:v10];
        [v16 removeFromSuperview];

        uint64_t v17 = [v4 objectAtIndexedSubscript:v10];
        [(NSArray *)v6 setObject:v17 atIndexedSubscript:v10];
        v18 = [(CSQuickActionsView *)self _createButtonForAction:v17];
        [(NSArray *)v9 setObject:v18 atIndexedSubscript:v10];
      }
      ++v10;
    }
    while ([v4 count] > v10);
    v19 = v6;
  }
  else
  {
    v19 = (NSArray *)[v4 copy];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    objc_super v20 = self->_buttons;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v53 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v52 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v22);
    }

    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __39__CSQuickActionsView_setButtonActions___block_invoke;
    v51[3] = &unk_1E6ADAE80;
    v51[4] = self;
    v25 = [(NSArray *)v19 bs_map:v51];
    id v9 = (NSArray *)[v25 mutableCopy];
  }
  v5 = v9;
LABEL_21:
  if ([(NSArray *)v5 count] >= 2)
  {
    v26 = [(NSArray *)self->_buttons firstObject];
    uint64_t v27 = objc_opt_class();
    id v28 = v26;
    if (v27)
    {
      if (objc_opt_isKindOfClass()) {
        v29 = v28;
      }
      else {
        v29 = 0;
      }
    }
    else
    {
      v29 = 0;
    }
    id v50 = v29;

    v30 = [(NSArray *)v5 firstObject];
    uint64_t v31 = objc_opt_class();
    id v32 = v30;
    if (v31)
    {
      if (objc_opt_isKindOfClass()) {
        v33 = v32;
      }
      else {
        v33 = 0;
      }
    }
    else
    {
      v33 = 0;
    }
    id v34 = v33;

    v35 = [(NSArray *)self->_buttons lastObject];
    uint64_t v36 = objc_opt_class();
    id v37 = v35;
    if (v36)
    {
      if (objc_opt_isKindOfClass()) {
        v38 = v37;
      }
      else {
        v38 = 0;
      }
    }
    else
    {
      v38 = 0;
    }
    id v39 = v38;

    v40 = [(NSArray *)v5 lastObject];
    uint64_t v41 = objc_opt_class();
    id v42 = v40;
    if (v41)
    {
      if (objc_opt_isKindOfClass()) {
        v43 = v42;
      }
      else {
        v43 = 0;
      }
    }
    else
    {
      v43 = 0;
    }
    id v44 = v43;

    if (self->_buttonContainerView)
    {
      if ((BSEqualObjects() & 1) == 0) {
        [(CSProminentButtonsView *)self->_buttonContainerView setLeadingButton:v34];
      }
      if ((BSEqualObjects() & 1) == 0) {
        [(CSProminentButtonsView *)self->_buttonContainerView setTrailingButton:v44];
      }
    }
    else
    {
      v45 = (CSProminentButtonsView *)[objc_alloc(MEMORY[0x1E4F5E4B8]) initWithLeadingButton:v34 trailingButton:v44];
      buttonContainerView = self->_buttonContainerView;
      self->_buttonContainerView = v45;

      [(CSQuickActionsView *)self addSubview:self->_buttonContainerView];
    }
  }
  v47 = self->_buttonActions;
  self->_buttonActions = v19;
  v48 = v19;

  buttons = self->_buttons;
  self->_buttons = v5;

LABEL_50:
}

id __39__CSQuickActionsView_setButtonActions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCoverSheet();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "[Quick Action] creating button for action %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v5 = [*(id *)(a1 + 32) _createButtonForAction:v3];

  return v5;
}

- (void)setControlsActions:(id)a3
{
  p_controlsActions = &self->_controlsActions;
  id v5 = a3;
  if ((BSEqualArrays() & 1) == 0) {
    objc_storeStrong((id *)p_controlsActions, a3);
  }
}

- (void)setActionsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_buttons;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setVisible:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)refreshSupportedButtons
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CSQuickActionsView *)self _hidesButtonsForWidgetControls];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_buttons;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if (v3)
        {
          [*(id *)(*((void *)&v12 + 1) + 8 * v8) setHidden:1];
        }
        else
        {
          long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "action", (void)v12);
          [v9 showsButtonDidChangeForAction:v10];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  BOOL v11 = !v3
     && [(CSDashBoardQuickActionsButtonSettings *)self->_quickActionsSettings colorsBackground];
  -[CSQuickActionsView _setButtonBackgroundVisible:](self, "_setButtonBackgroundVisible:", v11, (void)v12);
}

- (BOOL)strictlyInterpretsLocationAsContent:(CGPoint)a3 inView:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  +[CSQuickActionsButton buttonDiameter];
  [(CSDashBoardQuickActionsButtonSettings *)self->_quickActionsSettings strictTouchExtraRadius];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_buttons;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "center", (void)v10);
        if (BSFloatLessThanOrEqualToFloat())
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)interpretsLocationAsContent:(CGPoint)a3 inView:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  -[CSQuickActionsView convertPoint:fromView:](self, "convertPoint:fromView:", a4, a3.x, a3.y);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v9 = self->_buttons;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "frame", (void)v14);
        v20.double x = v6;
        v20.double y = v8;
        if (CGRectContainsPoint(v21, v20))
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)buttonsForApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  buttons = self->_buttons;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CSQuickActionsView_buttonsForApplicationBundleIdentifier___block_invoke;
  v9[3] = &unk_1E6ADAEA8;
  id v10 = v4;
  id v6 = v4;
  double v7 = [(NSArray *)buttons bs_filter:v9];

  return v7;
}

uint64_t __60__CSQuickActionsView_buttonsForApplicationBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 action];
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
  id v7 = v6;

  CGFloat v8 = [v7 controlIdentity];

  long long v9 = [v8 extensionIdentity];
  id v10 = [v9 containerBundleIdentifier];
  uint64_t v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

  return v11;
}

- (BOOL)interpretsLocationAsBesideContent:(CGPoint)a3 inView:(id)a4
{
  -[CSQuickActionsView convertPoint:fromView:](self, "convertPoint:fromView:", a4, a3.x, a3.y);
  CGFloat v46 = v6;
  CGFloat v47 = v5;
  [(CSQuickActionsView *)self bounds];
  double Width = CGRectGetWidth(v51);
  [(CSQuickActionsView *)self bounds];
  double Height = CGRectGetHeight(v52);
  [(CSQuickActionsView *)self _leadingFrameWithOutsets:0];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(CSQuickActionsView *)self _trailingFrameWithOutsets:0];
  CGFloat v16 = v15;
  CGFloat rect = v15;
  CGFloat rect_8 = v17;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  +[CSQuickActionsButton buttonDiameter];
  CGFloat rect_24 = v22;
  v53.origin.double x = v8;
  v53.origin.double y = v10;
  v53.size.double width = v12;
  v53.size.double height = v14;
  double MinX = CGRectGetMinX(v53);
  v54.origin.double x = v16;
  v54.origin.double y = v19;
  v54.size.double width = rect_8;
  v54.size.double height = v21;
  double v24 = CGRectGetMinX(v54);
  if (MinX < v24) {
    double v24 = MinX;
  }
  CGFloat rect_16 = v24;
  v55.origin.double x = v8;
  v55.origin.double y = v10;
  v55.size.double width = v12;
  v55.size.double height = v14;
  double MaxX = CGRectGetMaxX(v55);
  v56.origin.double x = rect;
  v56.origin.double y = v19;
  v56.size.double width = rect_8;
  v56.size.double height = v21;
  double v25 = CGRectGetMaxX(v56);
  v57.origin.double x = v8;
  v57.origin.double y = v10;
  v57.size.double width = v12;
  v57.size.double height = v14;
  CGFloat MinY = CGRectGetMinY(v57);
  v58.origin.double x = v8;
  v58.origin.double y = v10;
  v58.size.double width = v12;
  v58.size.double height = v14;
  double MaxY = CGRectGetMaxY(v58);
  v59.origin.double x = 0.0;
  v59.origin.double y = MinY;
  v59.size.double width = rect_16;
  v59.size.double height = rect_24;
  v49.double x = v47;
  v49.double y = v46;
  if (CGRectContainsPoint(v59, v49)) {
    return 1;
  }
  double v28 = MaxX;
  if (MaxX < v25) {
    double v28 = v25;
  }
  double v29 = Width - v28;
  CGFloat v30 = MinY;
  CGFloat v31 = rect_24;
  v50.double x = v47;
  v50.double y = v46;
  if (CGRectContainsPoint(*(CGRect *)&v28, v50)) {
    return 1;
  }
  uint64_t v34 = 0;
  double v35 = MaxY;
  double v36 = Width;
  CGFloat v37 = v47;
  CGFloat v38 = v46;

  double v33 = Height - MaxY;
  return CGRectContainsPoint(*(CGRect *)&v34, *(CGPoint *)&v37);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSQuickActionsView;
  [(CSQuickActionsView *)&v3 layoutSubviews];
  [(CSQuickActionsView *)self _layoutWidgetContainerView];
}

- (BOOL)_showsControlButtons
{
  return CSFeatureEnabled(8);
}

- (void)_layoutWidgetContainerView
{
  buttonContainerView = self->_buttonContainerView;
  [(CSQuickActionsView *)self bounds];

  -[CSProminentButtonsView setFrame:](buttonContainerView, "setFrame:");
}

- (BOOL)_hidesButtonsForWidgetControls
{
  NSUInteger v3 = [(NSArray *)self->_controlsActions count];
  if (v3) {
    LOBYTE(v3) = ![(CSQuickActionsView *)self _showsControlButtons];
  }
  return v3;
}

- (CGRect)_leadingFrameWithOutsets:(BOOL)a3
{
  BOOL v3 = a3;
  [(CSQuickActionsView *)self _insetX];
  double v6 = v5;
  [(CSQuickActionsView *)self _buttonOutsets];
  double v8 = v7;
  double v10 = v9;
  [(CSQuickActionsView *)self _minYWithOutsets:v3];
  double v12 = v11;
  double v13 = 0.0;
  if (v3)
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      double v13 = v10;
    }
    else {
      double v13 = v8;
    }
  }
  [(CSQuickActionsView *)self _buttonSizeWithOutsets:v3];
  double v15 = v14;
  double v17 = v16;
  double v18 = v6 - v13;
  double v19 = v12;
  result.size.double height = v17;
  result.size.double width = v15;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_trailingFrameWithOutsets:(BOOL)a3
{
  BOOL v3 = a3;
  [(CSQuickActionsView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(CSQuickActionsView *)self _insetX];
  double v14 = v13;
  [(CSQuickActionsView *)self _buttonOutsets];
  double v16 = v15;
  double v18 = v17;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] != 1) {
    double v18 = v16;
  }
  [(CSQuickActionsView *)self _minYWithOutsets:v3];
  double v20 = v19;
  v30.origin.double x = v6;
  v30.origin.double y = v8;
  v30.size.double width = v10;
  v30.size.double height = v12;
  CGFloat v21 = CGRectGetWidth(v30) - v14;
  +[CSQuickActionsButton buttonDiameter];
  double v23 = v21 - (v18 + v22);
  [(CSQuickActionsView *)self _buttonSizeWithOutsets:v3];
  double v25 = v24;
  double v27 = v26;
  double v28 = v23;
  double v29 = v20;
  result.size.double height = v27;
  result.size.double width = v25;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (double)_minYWithOutsets:(BOOL)a3
{
  BOOL v3 = a3;
  [(CSQuickActionsView *)self bounds];
  double Height = CGRectGetHeight(v12);
  [(CSQuickActionsView *)self _insetY];
  double v7 = v6;
  +[CSQuickActionsButton buttonDiameter];
  double v9 = v8;
  double v10 = 0.0;
  if (v3) {
    [(CSQuickActionsView *)self _buttonOutsets];
  }
  return Height - v7 - (v9 + v10);
}

- (CGSize)_buttonSizeWithOutsets:(BOOL)a3
{
  BOOL v3 = a3;
  +[CSQuickActionsButton buttonDiameter];
  double v6 = v5;
  [(CSQuickActionsView *)self _buttonOutsets];
  double v11 = v9 + v10;
  if (!v3) {
    double v11 = 0.0;
  }
  double v12 = v6 + v11;
  double v13 = v7 + v8;
  if (!v3) {
    double v13 = 0.0;
  }
  double v14 = v6 + v13;
  double v15 = v12;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (id)_buttonGroupName
{
  v2 = NSString;
  BOOL v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  double v5 = [v2 stringWithFormat:@"%@.button", v4];

  return v5;
}

- (void)setLegibilitySettings:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((objc_msgSend(v5, "sb_isEqualToLegibilitySettings:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v6 = self->_buttons;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setLegibilitySettings:", v5, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_addTargetsToButton:(id)a3
{
  id v4 = a3;
  [v4 addTarget:self action:sel_handleButtonTouchBegan_ forControlEvents:1];
  [v4 addTarget:self action:sel_handleButtonTouchEnded_ forControlEvents:256];
  [v4 addTarget:self action:sel_handleButtonTouchEnded_ forControlEvents:64];
  [v4 addTarget:self action:sel_handleButtonTouchEnded_ forControlEvents:128];
  [v4 addTarget:self action:sel_handleButtonPress_ forControlEvents:0x2000];
}

- (void)_removeTargetsFromButton:(id)a3
{
  id v4 = a3;
  [v4 removeTarget:self action:0 forControlEvents:1];
  [v4 removeTarget:self action:0 forControlEvents:256];
  [v4 removeTarget:self action:0 forControlEvents:64];
  [v4 removeTarget:self action:0 forControlEvents:128];
  [v4 removeTarget:self action:0 forControlEvents:0x2000];
}

- (void)handleButtonTouchBegan:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained touchBeganForButton:v4];
}

- (void)handleButtonPress:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained fireActionForButton:v4];
}

- (void)handleButtonTouchEnded:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained touchEndedForButton:v4];
}

- (double)_insetX
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v4 = [WeakRetained isPortrait];

  int v5 = __sb__runningInSpringBoard();
  int v6 = v5;
  if (v4)
  {
    if (v5)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v7 = 0;
        char v8 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      id v216 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v216 userInterfaceIdiom] != 1)
      {
        int v7 = 0;
        char v8 = 1;
        goto LABEL_18;
      }
    }
    char v8 = v6 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v12 = __sb__runningInSpringBoard();
      if (v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v200 = [MEMORY[0x1E4F42D90] mainScreen];
        [v200 _referenceBounds];
      }
      int v7 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v57 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v56 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        int v215 = v12 ^ 1;
        long long v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        uint64_t v208 = 0;
        uint64_t v206 = 0;
        uint64_t v204 = 0;
        memset(v212, 0, sizeof(v212));
        int v36 = 0;
        uint64_t v202 = 0;
        int v37 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        int v41 = 0;
        int v42 = 0;
        int v43 = 0;
        memset(v213, 0, sizeof(v213));
        uint64_t v214 = 0;
        id v44 = &qword_1D8505DC8;
        goto LABEL_131;
      }
    }
    else
    {
      int v7 = 0;
    }
LABEL_18:
    int v14 = __sb__runningInSpringBoard();
    int v215 = v7;
    if (v14)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v15 = 0;
        unsigned int v16 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      v198 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v198 userInterfaceIdiom] != 1)
      {
        int v15 = 0;
        unsigned int v16 = 1;
        goto LABEL_36;
      }
    }
    unsigned int v16 = v14 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v12 = __sb__runningInSpringBoard();
      if (v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v189 = [MEMORY[0x1E4F42D90] mainScreen];
        [v189 _referenceBounds];
      }
      int v15 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v62 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        *(_DWORD *)&v213[48] = v12 ^ 1;
        uint64_t v214 = v16;
        long long v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        uint64_t v208 = 0;
        uint64_t v206 = 0;
        uint64_t v204 = 0;
        memset(v212, 0, sizeof(v212));
        int v36 = 0;
        uint64_t v202 = 0;
        int v37 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        int v41 = 0;
        int v42 = 0;
        int v43 = 0;
        memset(v213, 0, 48);
        id v44 = &qword_1D8505DF0;
        goto LABEL_131;
      }
    }
    else
    {
      int v15 = 0;
    }
LABEL_36:
    int v20 = __sb__runningInSpringBoard();
    *(_DWORD *)&v213[48] = v15;
    LODWORD(v214) = v16;
    if (v20)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        unsigned int v21 = 0;
        int v22 = 0;
        goto LABEL_54;
      }
    }
    else
    {
      v196 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v196 userInterfaceIdiom] != 1)
      {
        unsigned int v21 = 0;
        int v22 = 1;
        goto LABEL_54;
      }
    }
    int v22 = v20 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v12 = __sb__runningInSpringBoard();
      if (v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v188 = [MEMORY[0x1E4F42D90] mainScreen];
        [v188 _referenceBounds];
      }
      unsigned int v21 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v64 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        *(_DWORD *)&v213[40] = v12 ^ 1;
        *(_DWORD *)&v213[44] = v22;
        long long v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        uint64_t v208 = 0;
        uint64_t v206 = 0;
        uint64_t v204 = 0;
        memset(v212, 0, sizeof(v212));
        int v36 = 0;
        uint64_t v202 = 0;
        int v37 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        int v41 = 0;
        int v42 = 0;
        int v43 = 0;
        memset(v213, 0, 40);
        HIDWORD(v214) = 0;
        id v44 = &qword_1D8505DE0;
        goto LABEL_131;
      }
    }
    else
    {
      unsigned int v21 = 0;
    }
LABEL_54:
    int v26 = __sb__runningInSpringBoard();
    *(void *)&v213[40] = __PAIR64__(v22, v21);
    if (v26)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        unsigned int v27 = 0;
        int v28 = 0;
        goto LABEL_71;
      }
    }
    else
    {
      v195 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v195 userInterfaceIdiom] != 1)
      {
        unsigned int v27 = 0;
        int v28 = 1;
        goto LABEL_71;
      }
    }
    int v28 = v26 ^ 1;
    uint64_t v12 = __sb__runningInSpringBoard();
    if (v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v192 = [MEMORY[0x1E4F42D90] mainScreen];
      [v192 _referenceBounds];
    }
    unsigned int v27 = v12 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      *(_DWORD *)&v213[32] = v12 ^ 1;
      *(_DWORD *)&v213[36] = v28;
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v208 = 0;
      uint64_t v206 = 0;
      uint64_t v204 = 0;
      memset(v212, 0, sizeof(v212));
      int v36 = 0;
      uint64_t v202 = 0;
      int v37 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      memset(v213, 0, 32);
      HIDWORD(v214) = 0;
      id v44 = &qword_1D8505DE8;
      goto LABEL_131;
    }
LABEL_71:
    int v32 = __sb__runningInSpringBoard();
    *(void *)&v213[32] = __PAIR64__(v28, v27);
    if (v32)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        HIDWORD(v214) = 0;
        int v33 = 0;
        goto LABEL_91;
      }
    }
    else
    {
      v194 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v194 userInterfaceIdiom] != 1)
      {
        HIDWORD(v214) = 0;
        int v33 = 1;
        goto LABEL_91;
      }
    }
    int v33 = v32 ^ 1;
    uint64_t v12 = __sb__runningInSpringBoard();
    if (v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v190 = [MEMORY[0x1E4F42D90] mainScreen];
      [v190 _referenceBounds];
    }
    HIDWORD(v214) = v12 ^ 1;
    BSSizeRoundForScale();
    if (v52 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      *(_DWORD *)&v213[28] = v33;
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v208 = 0;
      uint64_t v206 = 0;
      uint64_t v204 = 0;
      memset(v212, 0, sizeof(v212));
      int v36 = 0;
      uint64_t v202 = 0;
      int v37 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      memset(v213, 0, 28);
      id v44 = &qword_1D8505DD8;
      goto LABEL_131;
    }
LABEL_91:
    int v53 = __sb__runningInSpringBoard();
    *(_DWORD *)&v213[28] = v33;
    if (v53)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v213[20] = 0;
        goto LABEL_352;
      }
    }
    else
    {
      v193 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v193 userInterfaceIdiom] != 1)
      {
        *(void *)&v213[20] = 0x100000000;
        goto LABEL_352;
      }
    }
    *(_DWORD *)&v213[24] = v53 ^ 1;
    uint64_t v12 = __sb__runningInSpringBoard();
    if (v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v187 = [MEMORY[0x1E4F42D90] mainScreen];
      [v187 _referenceBounds];
    }
    *(_DWORD *)&v213[20] = v12 ^ 1;
    BSSizeRoundForScale();
    if (v68 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v208 = 0;
      uint64_t v206 = 0;
      uint64_t v204 = 0;
      memset(v212, 0, sizeof(v212));
      int v36 = 0;
      uint64_t v202 = 0;
      int v37 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      memset(v213, 0, 20);
      id v44 = &qword_1D8505DD0;
      goto LABEL_131;
    }
LABEL_352:
    uint64_t v12 = __sb__runningInSpringBoard();
    if (v12)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_354;
      }
    }
    else
    {
      v191 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v191 userInterfaceIdiom] != 1)
      {
LABEL_354:
        *(_DWORD *)&v213[16] = v12 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_358:
          *(void *)&v213[4] = 0;
          goto LABEL_383;
        }
        int v69 = __sb__runningInSpringBoard();
        if (v69)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_358;
          }
        }
        else
        {
          v185 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v185 userInterfaceIdiom])
          {
            *(void *)&v213[4] = 1;
            goto LABEL_383;
          }
        }
        *(_DWORD *)&v213[4] = v69 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v178 = [MEMORY[0x1E4F42D90] mainScreen];
            [v178 _referenceBounds];
          }
          *(_DWORD *)&v213[8] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v76 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
          {
            long long v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            uint64_t v208 = 0;
            uint64_t v206 = 0;
            uint64_t v204 = 0;
            memset(v212, 0, sizeof(v212));
            int v36 = 0;
            uint64_t v202 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 0;
            id v44 = &qword_1D8505DA0;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v213[8] = 0;
        }
LABEL_383:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 0;
            goto LABEL_393;
          }
        }
        else
        {
          v186 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v186 userInterfaceIdiom])
          {
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 1;
            goto LABEL_393;
          }
        }
        *(_DWORD *)&v213[12] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v181 = [MEMORY[0x1E4F42D90] mainScreen];
            [v181 _referenceBounds];
          }
          *(_DWORD *)v213 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v72 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
            goto LABEL_397;
          }
        }
        else
        {
          *(_DWORD *)v213 = 0;
        }
LABEL_393:
        if (_SBF_Private_IsD94Like())
        {
          long long v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          uint64_t v208 = 0;
          uint64_t v206 = 0;
          uint64_t v204 = 0;
          memset(v212, 0, sizeof(v212));
          int v36 = 0;
          uint64_t v202 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505DA8;
          goto LABEL_131;
        }
LABEL_397:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_401:
          *(void *)&v212[44] = 0;
          goto LABEL_439;
        }
        int v73 = __sb__runningInSpringBoard();
        if (v73)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_401;
          }
        }
        else
        {
          v182 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v182 userInterfaceIdiom])
          {
            *(void *)&v212[44] = 0x100000000;
            goto LABEL_439;
          }
        }
        *(_DWORD *)&v212[48] = v73 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v173 = [MEMORY[0x1E4F42D90] mainScreen];
            [v173 _referenceBounds];
          }
          *(_DWORD *)&v212[44] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v86 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            long long v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            uint64_t v208 = 0;
            uint64_t v206 = 0;
            uint64_t v204 = 0;
            memset(v212, 0, 44);
            int v36 = 0;
            uint64_t v202 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505DB0;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[44] = 0;
        }
LABEL_439:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[32] = 0;
            *(_DWORD *)&v212[40] = 0;
            goto LABEL_449;
          }
        }
        else
        {
          v184 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v184 userInterfaceIdiom])
          {
            *(_DWORD *)&v212[32] = 0;
            *(_DWORD *)&v212[40] = 1;
            goto LABEL_449;
          }
        }
        *(_DWORD *)&v212[40] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v177 = [MEMORY[0x1E4F42D90] mainScreen];
            [v177 _referenceBounds];
          }
          *(_DWORD *)&v212[32] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v78 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_453;
          }
        }
        else
        {
          *(_DWORD *)&v212[32] = 0;
        }
LABEL_449:
        if (_SBF_Private_IsD64Like())
        {
          long long v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          uint64_t v208 = 0;
          uint64_t v206 = 0;
          uint64_t v204 = 0;
          memset(v212, 0, 32);
          int v36 = 0;
          uint64_t v202 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          *(_DWORD *)&v212[36] = 0;
          id v44 = &qword_1D8505DB8;
          goto LABEL_131;
        }
LABEL_453:
        int v79 = __sb__runningInSpringBoard();
        if (v79)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[28] = 0;
            *(_DWORD *)&v212[36] = 0;
            goto LABEL_463;
          }
        }
        else
        {
          v183 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v183 userInterfaceIdiom])
          {
            *(_DWORD *)&v212[28] = 0;
            *(_DWORD *)&v212[36] = 1;
            goto LABEL_463;
          }
        }
        *(_DWORD *)&v212[36] = v79 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v80 = __sb__runningInSpringBoard();
          if (v80)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v174 = [MEMORY[0x1E4F42D90] mainScreen];
            [v174 _referenceBounds];
          }
          uint64_t v12 = v80 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v212[28] = v12;
          if (v84 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            long long v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            uint64_t v208 = 0;
            uint64_t v206 = 0;
            uint64_t v204 = 0;
            memset(v212, 0, 28);
            int v36 = 0;
            uint64_t v202 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505D90;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[28] = 0;
        }
LABEL_463:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[4] = 0;
            *(_DWORD *)&v212[16] = 0;
            goto LABEL_507;
          }
        }
        else
        {
          v180 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v180 userInterfaceIdiom])
          {
            *(_DWORD *)&v212[4] = 0;
            *(_DWORD *)&v212[16] = 1;
            goto LABEL_507;
          }
        }
        *(_DWORD *)&v212[16] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v172 = [MEMORY[0x1E4F42D90] mainScreen];
            [v172 _referenceBounds];
          }
          *(_DWORD *)&v212[4] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v88 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_529;
          }
        }
        else
        {
          *(_DWORD *)&v212[4] = 0;
        }
LABEL_507:
        if (_SBF_Private_IsD54())
        {
          long long v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          uint64_t v208 = 0;
          uint64_t v206 = 0;
          uint64_t v204 = 0;
          *(_DWORD *)v212 = 0;
          int v36 = 0;
          uint64_t v202 = 0;
          int v37 = 0;
          int v38 = 0;
          *(void *)&v212[8] = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          *(void *)&v212[20] = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D98;
          goto LABEL_131;
        }
LABEL_529:
        int v89 = __sb__runningInSpringBoard();
        if (v89)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v212[20] = 0;
            goto LABEL_547;
          }
        }
        else
        {
          v179 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v179 userInterfaceIdiom])
          {
            *(void *)&v212[20] = 0x100000000;
            goto LABEL_547;
          }
        }
        *(_DWORD *)&v212[24] = v89 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v92 = __sb__runningInSpringBoard();
          if (v92)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v169 = [MEMORY[0x1E4F42D90] mainScreen];
            [v169 _referenceBounds];
          }
          uint64_t v12 = v92 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v212[20] = v12;
          if (v94 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            long long v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            uint64_t v208 = 0;
            uint64_t v206 = 0;
            uint64_t v204 = 0;
            *(_DWORD *)v212 = 0;
            int v36 = 0;
            uint64_t v202 = 0;
            int v37 = 0;
            int v38 = 0;
            *(void *)&v212[8] = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505D60;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[20] = 0;
        }
LABEL_547:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v212[8] = 0;
            goto LABEL_567;
          }
        }
        else
        {
          v176 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v176 userInterfaceIdiom])
          {
            *(void *)&v212[8] = 0x100000000;
            goto LABEL_567;
          }
        }
        *(_DWORD *)&v212[12] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v168 = [MEMORY[0x1E4F42D90] mainScreen];
            [v168 _referenceBounds];
          }
          *(_DWORD *)&v212[8] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v96 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_587;
          }
        }
        else
        {
          *(_DWORD *)&v212[8] = 0;
        }
LABEL_567:
        if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
        {
          long long v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          uint64_t v208 = 0;
          uint64_t v206 = 0;
          uint64_t v204 = 0;
          *(_DWORD *)v212 = 0;
          int v36 = 0;
          uint64_t v202 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D68;
          goto LABEL_131;
        }
LABEL_587:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_591:
          *(void *)((char *)&v211 + 4) = 0;
          goto LABEL_607;
        }
        int v97 = __sb__runningInSpringBoard();
        if (v97)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_591;
          }
        }
        else
        {
          v171 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v171 userInterfaceIdiom])
          {
            *(void *)((char *)&v211 + 4) = 0x100000000;
            goto LABEL_607;
          }
        }
        DWORD2(v211) = v97 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v100 = __sb__runningInSpringBoard();
          if (v100)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v162 = [MEMORY[0x1E4F42D90] mainScreen];
            [v162 _referenceBounds];
          }
          uint64_t v12 = v100 ^ 1u;
          BSSizeRoundForScale();
          DWORD1(v211) = v12;
          if (v110 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
          {
            LODWORD(v211) = 0;
            memset(v210, 0, sizeof(v210));
            uint64_t v208 = 0;
            HIDWORD(v211) = 0;
            uint64_t v206 = 0;
            uint64_t v204 = 0;
            *(_DWORD *)v212 = 0;
            uint64_t v202 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505D50;
            goto LABEL_131;
          }
        }
        else
        {
          DWORD1(v211) = 0;
        }
LABEL_607:
        int v101 = __sb__runningInSpringBoard();
        if (v101)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v12 = 0;
            *(_DWORD *)v212 = 0;
            goto LABEL_617;
          }
        }
        else
        {
          v175 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v175 userInterfaceIdiom])
          {
            uint64_t v12 = 0;
            *(_DWORD *)v212 = 1;
            goto LABEL_617;
          }
        }
        *(_DWORD *)v212 = v101 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v102 = __sb__runningInSpringBoard();
          if (v102)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v165 = [MEMORY[0x1E4F42D90] mainScreen];
            [v165 _referenceBounds];
          }
          uint64_t v12 = v102 ^ 1u;
          BSSizeRoundForScale();
          if (v103 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
            goto LABEL_621;
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
LABEL_617:
        if (_SBF_Private_IsD93Like())
        {
          HIDWORD(v211) = v12;
          LODWORD(v211) = 0;
          memset(v210, 0, sizeof(v210));
          uint64_t v208 = 0;
          uint64_t v206 = 0;
          uint64_t v204 = 0;
          uint64_t v202 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D58;
          goto LABEL_131;
        }
LABEL_621:
        HIDWORD(v211) = v12;
        if (!_SBF_Private_IsD63Like())
        {
LABEL_625:
          *(void *)&v210[4] = 0;
          goto LABEL_663;
        }
        int v104 = __sb__runningInSpringBoard();
        if (v104)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_625;
          }
        }
        else
        {
          v166 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v166 userInterfaceIdiom])
          {
            *(_DWORD *)&v210[4] = 0;
            *(_DWORD *)&v210[8] = 1;
            goto LABEL_663;
          }
        }
        *(_DWORD *)&v210[8] = v104 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v158 = [MEMORY[0x1E4F42D90] mainScreen];
            [v158 _referenceBounds];
          }
          *(_DWORD *)&v210[4] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v120 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            LODWORD(v211) = 0;
            *(_DWORD *)v210 = 0;
            uint64_t v206 = 0;
            uint64_t v208 = 0;
            uint64_t v202 = 0;
            uint64_t v204 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505D80;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v210[4] = 0;
        }
LABEL_663:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v211) = 0;
            *(_DWORD *)v210 = 0;
            goto LABEL_673;
          }
        }
        else
        {
          v170 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v170 userInterfaceIdiom])
          {
            *(_DWORD *)v210 = 0;
            LODWORD(v211) = 1;
            goto LABEL_673;
          }
        }
        LODWORD(v211) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v161 = [MEMORY[0x1E4F42D90] mainScreen];
            [v161 _referenceBounds];
          }
          *(_DWORD *)v210 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v112 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_677;
          }
        }
        else
        {
          *(_DWORD *)v210 = 0;
        }
LABEL_673:
        if (_SBF_Private_IsD63Like())
        {
          uint64_t v206 = 0;
          uint64_t v208 = 0;
          uint64_t v202 = 0;
          uint64_t v204 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D88;
          goto LABEL_131;
        }
LABEL_677:
        int v113 = __sb__runningInSpringBoard();
        if (v113)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v208) = 0;
            HIDWORD(v204) = 0;
            goto LABEL_687;
          }
        }
        else
        {
          v167 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v167 userInterfaceIdiom])
          {
            HIDWORD(v204) = 0;
            HIDWORD(v208) = 1;
            goto LABEL_687;
          }
        }
        HIDWORD(v208) = v113 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v114 = __sb__runningInSpringBoard();
          if (v114)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v159 = [MEMORY[0x1E4F42D90] mainScreen];
            [v159 _referenceBounds];
          }
          uint64_t v12 = v114 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v204) = v12;
          if (v118 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
          {
            LODWORD(v208) = 0;
            uint64_t v206 = 0;
            LODWORD(v204) = 0;
            uint64_t v202 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505D70;
            goto LABEL_131;
          }
        }
        else
        {
          HIDWORD(v204) = 0;
        }
LABEL_687:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v208) = 0;
            HIDWORD(v206) = 0;
            goto LABEL_731;
          }
        }
        else
        {
          v164 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v164 userInterfaceIdiom])
          {
            HIDWORD(v206) = 0;
            LODWORD(v208) = 1;
            goto LABEL_731;
          }
        }
        LODWORD(v208) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v157 = [MEMORY[0x1E4F42D90] mainScreen];
            [v157 _referenceBounds];
          }
          HIDWORD(v206) = v12 ^ 1;
          BSSizeRoundForScale();
          if (v122 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_753;
          }
        }
        else
        {
          HIDWORD(v206) = 0;
        }
LABEL_731:
        if (_SBF_Private_IsD33OrSimilarDevice())
        {
          LODWORD(v206) = 0;
          LODWORD(v204) = 0;
          uint64_t v202 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D78;
          goto LABEL_131;
        }
LABEL_753:
        int v123 = __sb__runningInSpringBoard();
        if (v123)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v206) = 0;
            LODWORD(v204) = 0;
            goto LABEL_771;
          }
        }
        else
        {
          v163 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v163 userInterfaceIdiom])
          {
            LODWORD(v204) = 0;
            LODWORD(v206) = 1;
            goto LABEL_771;
          }
        }
        LODWORD(v206) = v123 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v156 = [MEMORY[0x1E4F42D90] mainScreen];
            [v156 _referenceBounds];
          }
          LODWORD(v204) = v12 ^ 1;
          BSSizeRoundForScale();
          if (v128 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            uint64_t v202 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505D40;
            goto LABEL_131;
          }
        }
        else
        {
          LODWORD(v204) = 0;
        }
LABEL_771:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v202) = 0;
            int v36 = 0;
            goto LABEL_791;
          }
        }
        else
        {
          v160 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v160 userInterfaceIdiom])
          {
            int v36 = 0;
            HIDWORD(v202) = 1;
            goto LABEL_791;
          }
        }
        HIDWORD(v202) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v155 = [MEMORY[0x1E4F42D90] mainScreen];
            [v155 _referenceBounds];
          }
          int v36 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v130 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_807;
          }
        }
        else
        {
          int v36 = 0;
        }
LABEL_791:
        if (_SBF_Private_IsD53())
        {
          LODWORD(v202) = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D48;
          goto LABEL_131;
        }
LABEL_807:
        if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
        {
          LODWORD(v202) = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D20;
          goto LABEL_131;
        }
        if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
        {
          LODWORD(v202) = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D28;
          goto LABEL_131;
        }
        if (_SBF_Private_IsD52OrSimilarDevice())
        {
          LODWORD(v202) = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D10;
          goto LABEL_131;
        }
        if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
        {
          LODWORD(v202) = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D18;
          goto LABEL_131;
        }
        int v132 = __sb__runningInSpringBoard();
        if (v132)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v202) = 0;
            int v37 = 0;
            goto LABEL_845;
          }
        }
        else
        {
          v154 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v154 userInterfaceIdiom])
          {
            int v37 = 0;
            LODWORD(v202) = 1;
            goto LABEL_845;
          }
        }
        LODWORD(v202) = v132 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v149 = [MEMORY[0x1E4F42D90] mainScreen];
            [v149 _referenceBounds];
          }
          int v37 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v140 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
          {
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505D30;
            goto LABEL_131;
          }
        }
        else
        {
          int v37 = 0;
        }
LABEL_845:
        int v134 = __sb__runningInSpringBoard();
        if (v134)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v38 = 0;
            int v39 = 0;
            goto LABEL_865;
          }
        }
        else
        {
          v153 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v153 userInterfaceIdiom])
          {
            int v39 = 0;
            int v38 = 1;
            goto LABEL_865;
          }
        }
        int v38 = v134 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v148 = [MEMORY[0x1E4F42D90] mainScreen];
            [v148 _referenceBounds];
          }
          int v39 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v142 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
          {
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505D38;
            goto LABEL_131;
          }
        }
        else
        {
          int v39 = 0;
        }
LABEL_865:
        int v136 = __sb__runningInSpringBoard();
        if (v136)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v40 = 0;
            int v41 = 0;
            goto LABEL_885;
          }
        }
        else
        {
          v152 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v152 userInterfaceIdiom])
          {
            int v41 = 0;
            int v40 = 1;
            goto LABEL_885;
          }
        }
        int v40 = v136 ^ 1;
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          v150 = [MEMORY[0x1E4F42D90] mainScreen];
          [v150 _referenceBounds];
        }
        int v41 = v12 ^ 1;
        BSSizeRoundForScale();
        if (v138 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
        {
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505D08;
          goto LABEL_131;
        }
LABEL_885:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v42 = 0;
            int v43 = 0;
            goto LABEL_919;
          }
        }
        else
        {
          v151 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v151 userInterfaceIdiom])
          {
            int v43 = 0;
            int v42 = 1;
            goto LABEL_919;
          }
        }
        int v42 = v12 ^ 1;
        int v144 = __sb__runningInSpringBoard();
        if (v144)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v12 = [MEMORY[0x1E4F42D90] mainScreen];
          [(id)v12 _referenceBounds];
        }
        int v43 = v144 ^ 1;
        BSSizeRoundForScale();
        if (v145 >= *(double *)(MEMORY[0x1E4FA6E50] + 40))
        {
          id v44 = &qword_1D8505D00;
LABEL_131:
          double v65 = *(double *)v44;
          if (v43) {

          }
          if (v42) {
          if (v41)
          }

          if (v40) {
          if (v39)
          }

          if (v38) {
          if (v37)
          }

          if (v202) {
          if (v36)
          }

          if (HIDWORD(v202)) {
          if (v204)
          }

          if (v206) {
          if (HIDWORD(v206))
          }

          if (v208) {
          if (HIDWORD(v204))
          }

          if (HIDWORD(v208)) {
          if (*(_DWORD *)v210)
          }

          if (v211) {
          if (*(_DWORD *)&v210[4])
          }

          if (*(_DWORD *)&v210[8]) {
          if (HIDWORD(v211))
          }

          if (*(_DWORD *)v212) {
          if (DWORD1(v211))
          }

          if (DWORD2(v211)) {
          if (*(_DWORD *)&v212[8])
          }

          if (*(_DWORD *)&v212[12]) {
          if (*(_DWORD *)&v212[20])
          }

          if (*(_DWORD *)&v212[24]) {
          if (*(_DWORD *)&v212[4])
          }

          if (*(_DWORD *)&v212[16]) {
          if (*(_DWORD *)&v212[28])
          }

          if (*(_DWORD *)&v212[36]) {
          if (*(_DWORD *)&v212[32])
          }

          if (*(_DWORD *)&v212[40]) {
          if (*(_DWORD *)&v212[44])
          }

          if (*(_DWORD *)&v212[48]) {
          if (*(_DWORD *)v213)
          }

          if (*(_DWORD *)&v213[12]) {
          if (*(_DWORD *)&v213[8])
          }

          if (*(_DWORD *)&v213[4]) {
          if (*(_DWORD *)&v213[16])
          }

          if (*(_DWORD *)&v213[20]) {
          if (*(_DWORD *)&v213[24])
          }

          if (HIDWORD(v214))
          {

            if (!*(_DWORD *)&v213[28]) {
              goto LABEL_219;
            }
          }
          else if (!*(_DWORD *)&v213[28])
          {
LABEL_219:
            if (*(_DWORD *)&v213[32]) {
              goto LABEL_220;
            }
            goto LABEL_231;
          }

          if (*(_DWORD *)&v213[32])
          {
LABEL_220:

            if (!*(_DWORD *)&v213[36]) {
              goto LABEL_221;
            }
            goto LABEL_232;
          }
LABEL_231:
          if (!*(_DWORD *)&v213[36])
          {
LABEL_221:
            if (*(_DWORD *)&v213[40]) {
              goto LABEL_222;
            }
            goto LABEL_233;
          }
LABEL_232:

          if (*(_DWORD *)&v213[40])
          {
LABEL_222:

            if (!*(_DWORD *)&v213[44]) {
              goto LABEL_223;
            }
            goto LABEL_234;
          }
LABEL_233:
          if (!*(_DWORD *)&v213[44])
          {
LABEL_223:
            if (*(_DWORD *)&v213[48]) {
              goto LABEL_224;
            }
            goto LABEL_235;
          }
LABEL_234:

          if (*(_DWORD *)&v213[48])
          {
LABEL_224:

            if (!v214) {
              goto LABEL_225;
            }
            goto LABEL_236;
          }
LABEL_235:
          if (!v214)
          {
LABEL_225:
            if (!v215) {
              goto LABEL_227;
            }
            goto LABEL_226;
          }
LABEL_236:

          if (!v215)
          {
LABEL_227:
            if ((v8 & 1) == 0) {
              return v65;
            }
            goto LABEL_347;
          }
LABEL_226:

          goto LABEL_227;
        }
LABEL_919:
        id v44 = &CSQuickActionButtonInsetX;
        goto LABEL_131;
      }
    }
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v208 = 0;
    uint64_t v206 = 0;
    uint64_t v204 = 0;
    memset(v212, 0, sizeof(v212));
    int v36 = 0;
    uint64_t v202 = 0;
    int v37 = 0;
    int v38 = 0;
    int v39 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    *(_OWORD *)v213 = 0uLL;
    id v44 = &qword_1D8505DC0;
    *(_DWORD *)&v213[16] = v12 ^ 1;
    goto LABEL_131;
  }
  uint64_t v9 = (uint64_t)&CSQuickActionButtonInsetY;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v10 = 0;
      uint64_t v11 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    id v216 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v216 userInterfaceIdiom] != 1)
    {
      uint64_t v11 = 0;
      int v10 = 1;
      goto LABEL_27;
    }
  }
  int v10 = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v187 = [MEMORY[0x1E4F42D90] mainScreen];
      [v187 _referenceBounds];
    }
    uint64_t v11 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v60 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v59 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      HIDWORD(v214) = v13 ^ 1;
      int v215 = v10;
      LODWORD(v214) = 0;
      memset(v213, 0, sizeof(v213));
      memset(v212, 0, sizeof(v212));
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505EC8;
      goto LABEL_241;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_27:
  int v17 = __sb__runningInSpringBoard();
  HIDWORD(v214) = v11;
  int v215 = v10;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v18 = 0;
      unsigned int v19 = 0;
      goto LABEL_45;
    }
  }
  else
  {
    v195 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v195 userInterfaceIdiom] != 1)
    {
      unsigned int v19 = 0;
      int v18 = 1;
      goto LABEL_45;
    }
  }
  int v18 = v17 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v186 = [MEMORY[0x1E4F42D90] mainScreen];
      [v186 _referenceBounds];
    }
    unsigned int v19 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v63 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      *(_DWORD *)&v213[44] = v13 ^ 1;
      *(_DWORD *)&v213[48] = v18;
      LODWORD(v214) = 0;
      memset(v213, 0, 44);
      memset(v212, 0, sizeof(v212));
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505EF0;
      goto LABEL_241;
    }
  }
  else
  {
    unsigned int v19 = 0;
  }
LABEL_45:
  int v23 = __sb__runningInSpringBoard();
  *(void *)&v213[44] = __PAIR64__(v18, v19);
  if (v23)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v24 = 0;
      unsigned int v25 = 0;
      goto LABEL_62;
    }
  }
  else
  {
    v194 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v194 userInterfaceIdiom] != 1)
    {
      unsigned int v25 = 0;
      int v24 = 1;
      goto LABEL_62;
    }
  }
  int v24 = v23 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v185 = [MEMORY[0x1E4F42D90] mainScreen];
      [v185 _referenceBounds];
    }
    unsigned int v25 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      *(_DWORD *)&v213[36] = v13 ^ 1;
      *(_DWORD *)&v213[40] = v24;
      LODWORD(v214) = 0;
      memset(v213, 0, 36);
      memset(v212, 0, sizeof(v212));
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505EE0;
      goto LABEL_241;
    }
  }
  else
  {
    unsigned int v25 = 0;
  }
LABEL_62:
  int v29 = __sb__runningInSpringBoard();
  *(void *)&v213[36] = __PAIR64__(v24, v25);
  if (v29)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v30 = 0;
      uint64_t v2 = 0;
      goto LABEL_80;
    }
  }
  else
  {
    v193 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v193 userInterfaceIdiom] != 1)
    {
      uint64_t v2 = 0;
      int v30 = 1;
      goto LABEL_80;
    }
  }
  int v30 = v29 ^ 1;
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v190 = [MEMORY[0x1E4F42D90] mainScreen];
    [v190 _referenceBounds];
  }
  uint64_t v2 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    *(void *)&v213[28] = __PAIR64__(v30, v2);
    LODWORD(v214) = 0;
    memset(v213, 0, 28);
    memset(v212, 0, sizeof(v212));
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505EE8;
    goto LABEL_241;
  }
LABEL_80:
  int v35 = __sb__runningInSpringBoard();
  *(void *)&v213[28] = __PAIR64__(v30, v2);
  if (v35)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v9 = 0;
      LODWORD(v214) = 0;
      goto LABEL_100;
    }
  }
  else
  {
    v192 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v192 userInterfaceIdiom] != 1)
    {
      LODWORD(v214) = 0;
      uint64_t v9 = 1;
      goto LABEL_100;
    }
  }
  uint64_t v9 = v35 ^ 1u;
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v188 = [MEMORY[0x1E4F42D90] mainScreen];
    [v188 _referenceBounds];
  }
  LODWORD(v214) = v13 ^ 1;
  BSSizeRoundForScale();
  if (v54 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    *(_DWORD *)&v213[24] = v9;
    memset(v213, 0, 24);
    memset(v212, 0, sizeof(v212));
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505ED8;
    goto LABEL_241;
  }
LABEL_100:
  int v55 = __sb__runningInSpringBoard();
  *(_DWORD *)&v213[24] = v9;
  if (v55)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v213[16] = 0;
      goto LABEL_364;
    }
  }
  else
  {
    v191 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v191 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v213[16] = 0;
      *(_DWORD *)&v213[20] = 1;
      goto LABEL_364;
    }
  }
  *(_DWORD *)&v213[20] = v55 ^ 1;
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v184 = [MEMORY[0x1E4F42D90] mainScreen];
    [v184 _referenceBounds];
  }
  *(_DWORD *)&v213[16] = v13 ^ 1;
  BSSizeRoundForScale();
  if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    *(void *)v213 = 0;
    *(void *)&v213[8] = 0;
    memset(v212, 0, sizeof(v212));
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505ED0;
    goto LABEL_241;
  }
LABEL_364:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_366;
    }
LABEL_372:
    *(void *)v213 = 0;
    *(_DWORD *)&v213[8] = 0;
    memset(v212, 0, sizeof(v212));
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505EC0;
    *(_DWORD *)&v213[12] = v13 ^ 1;
    goto LABEL_241;
  }
  v189 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v189 userInterfaceIdiom] == 1) {
    goto LABEL_372;
  }
LABEL_366:
  *(_DWORD *)&v213[12] = v13 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_370:
    *(void *)v213 = 0;
    goto LABEL_408;
  }
  int v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_370;
    }
  }
  else
  {
    v182 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v182 userInterfaceIdiom])
    {
      *(void *)v213 = 1;
      goto LABEL_408;
    }
  }
  *(_DWORD *)v213 = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v175 = [MEMORY[0x1E4F42D90] mainScreen];
      [v175 _referenceBounds];
    }
    *(_DWORD *)&v213[4] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v77 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      *(_DWORD *)&v213[8] = 0;
      memset(v212, 0, sizeof(v212));
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505EA0;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v213[4] = 0;
  }
LABEL_408:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v213[8] = 0;
      *(_DWORD *)&v212[48] = 0;
      goto LABEL_418;
    }
  }
  else
  {
    v183 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v183 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[48] = 0;
      *(_DWORD *)&v213[8] = 1;
      goto LABEL_418;
    }
  }
  *(_DWORD *)&v213[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v178 = [MEMORY[0x1E4F42D90] mainScreen];
      [v178 _referenceBounds];
    }
    *(_DWORD *)&v212[48] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v74 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_422;
    }
  }
  else
  {
    *(_DWORD *)&v212[48] = 0;
  }
LABEL_418:
  if (_SBF_Private_IsD94Like())
  {
    memset(v212, 0, 48);
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505EA8;
    goto LABEL_241;
  }
LABEL_422:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_426:
    *(void *)&v212[40] = 0;
    goto LABEL_473;
  }
  int v75 = __sb__runningInSpringBoard();
  if (v75)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_426;
    }
  }
  else
  {
    v179 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v179 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[40] = 0;
      *(_DWORD *)&v212[44] = 1;
      goto LABEL_473;
    }
  }
  *(_DWORD *)&v212[44] = v75 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v170 = [MEMORY[0x1E4F42D90] mainScreen];
      [v170 _referenceBounds];
    }
    *(_DWORD *)&v212[40] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v87 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v212, 0, 40);
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505EB0;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[40] = 0;
  }
LABEL_473:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[36] = 0;
      *(_DWORD *)&v212[28] = 0;
      goto LABEL_483;
    }
  }
  else
  {
    v181 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v181 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[28] = 0;
      *(_DWORD *)&v212[36] = 1;
      goto LABEL_483;
    }
  }
  *(_DWORD *)&v212[36] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v174 = [MEMORY[0x1E4F42D90] mainScreen];
      [v174 _referenceBounds];
    }
    *(_DWORD *)&v212[28] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v81 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_487;
    }
  }
  else
  {
    *(_DWORD *)&v212[28] = 0;
  }
LABEL_483:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v212[32] = 0;
    memset(v212, 0, 28);
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505EB8;
    goto LABEL_241;
  }
LABEL_487:
  int v82 = __sb__runningInSpringBoard();
  if (v82)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[32] = 0;
      *(_DWORD *)&v212[24] = 0;
      goto LABEL_497;
    }
  }
  else
  {
    v180 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v180 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[24] = 0;
      *(_DWORD *)&v212[32] = 1;
      goto LABEL_497;
    }
  }
  *(_DWORD *)&v212[32] = v82 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v83 = __sb__runningInSpringBoard();
    if (v83)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v171 = [MEMORY[0x1E4F42D90] mainScreen];
      [v171 _referenceBounds];
    }
    uint64_t v13 = v83 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v212[24] = v13;
    if (v85 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v212, 0, 24);
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505E90;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[24] = 0;
  }
LABEL_497:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[12] = 0;
      *(_DWORD *)v212 = 0;
      goto LABEL_513;
    }
  }
  else
  {
    v177 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v177 userInterfaceIdiom])
    {
      *(_DWORD *)v212 = 0;
      *(_DWORD *)&v212[12] = 1;
      goto LABEL_513;
    }
  }
  *(_DWORD *)&v212[12] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v169 = [MEMORY[0x1E4F42D90] mainScreen];
      [v169 _referenceBounds];
    }
    *(_DWORD *)v212 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v90 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_537;
    }
  }
  else
  {
    *(_DWORD *)v212 = 0;
  }
LABEL_513:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v212[16] = 0;
    *(void *)&v212[4] = 0;
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E98;
    goto LABEL_241;
  }
LABEL_537:
  int v91 = __sb__runningInSpringBoard();
  if (v91)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v212[16] = 0;
      goto LABEL_557;
    }
  }
  else
  {
    v176 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v176 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[16] = 0;
      *(_DWORD *)&v212[20] = 1;
      goto LABEL_557;
    }
  }
  *(_DWORD *)&v212[20] = v91 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v93 = __sb__runningInSpringBoard();
    if (v93)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v166 = [MEMORY[0x1E4F42D90] mainScreen];
      [v166 _referenceBounds];
    }
    uint64_t v13 = v93 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v212[16] = v13;
    if (v95 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v212[4] = 0;
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505E60;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[16] = 0;
  }
LABEL_557:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v212[4] = 0;
      goto LABEL_574;
    }
  }
  else
  {
    v173 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v173 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[4] = 0;
      *(_DWORD *)&v212[8] = 1;
      goto LABEL_574;
    }
  }
  *(_DWORD *)&v212[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v165 = [MEMORY[0x1E4F42D90] mainScreen];
      [v165 _referenceBounds];
    }
    *(_DWORD *)&v212[4] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v98 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_596;
    }
  }
  else
  {
    *(_DWORD *)&v212[4] = 0;
  }
LABEL_574:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E68;
    goto LABEL_241;
  }
LABEL_596:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_600:
    *(void *)&long long v211 = 0;
    goto LABEL_632;
  }
  int v99 = __sb__runningInSpringBoard();
  if (v99)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_600;
    }
  }
  else
  {
    v168 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v168 userInterfaceIdiom])
    {
      *(void *)&long long v211 = 0x100000000;
      goto LABEL_632;
    }
  }
  DWORD1(v211) = v99 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v105 = __sb__runningInSpringBoard();
    if (v105)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v159 = [MEMORY[0x1E4F42D90] mainScreen];
      [v159 _referenceBounds];
    }
    uint64_t v13 = v105 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v211) = v13;
    if (v111 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      *((void *)&v211 + 1) = 0;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505E50;
      goto LABEL_241;
    }
  }
  else
  {
    LODWORD(v211) = 0;
  }
LABEL_632:
  int v106 = __sb__runningInSpringBoard();
  if (v106)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v211) = 0;
      uint64_t v13 = 0;
      goto LABEL_642;
    }
  }
  else
  {
    v172 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v172 userInterfaceIdiom])
    {
      uint64_t v13 = 0;
      HIDWORD(v211) = 1;
      goto LABEL_642;
    }
  }
  HIDWORD(v211) = v106 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v107 = __sb__runningInSpringBoard();
    if (v107)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v162 = [MEMORY[0x1E4F42D90] mainScreen];
      [v162 _referenceBounds];
    }
    uint64_t v13 = v107 ^ 1u;
    BSSizeRoundForScale();
    if (v108 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_646;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_642:
  if (_SBF_Private_IsD93Like())
  {
    DWORD2(v211) = v13;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E58;
    goto LABEL_241;
  }
LABEL_646:
  DWORD2(v211) = v13;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_650:
    *(void *)v210 = 0;
    goto LABEL_697;
  }
  int v109 = __sb__runningInSpringBoard();
  if (v109)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_650;
    }
  }
  else
  {
    v163 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v163 userInterfaceIdiom])
    {
      *(void *)v210 = 0x100000000;
      goto LABEL_697;
    }
  }
  *(_DWORD *)&v210[4] = v109 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v155 = [MEMORY[0x1E4F42D90] mainScreen];
      [v155 _referenceBounds];
    }
    *(_DWORD *)v210 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v121 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      *(_DWORD *)&v210[8] = 0;
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505E80;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)v210 = 0;
  }
LABEL_697:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v210[8] = 0;
      HIDWORD(v209) = 0;
      goto LABEL_707;
    }
  }
  else
  {
    v167 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v167 userInterfaceIdiom])
    {
      HIDWORD(v209) = 0;
      *(_DWORD *)&v210[8] = 1;
      goto LABEL_707;
    }
  }
  *(_DWORD *)&v210[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v158 = [MEMORY[0x1E4F42D90] mainScreen];
      [v158 _referenceBounds];
    }
    HIDWORD(v209) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v115 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_711;
    }
  }
  else
  {
    HIDWORD(v209) = 0;
  }
LABEL_707:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v209) = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    uint64_t v207 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E88;
    goto LABEL_241;
  }
LABEL_711:
  int v116 = __sb__runningInSpringBoard();
  if (v116)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v209) = 0;
      HIDWORD(v203) = 0;
      goto LABEL_721;
    }
  }
  else
  {
    v164 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v164 userInterfaceIdiom])
    {
      HIDWORD(v203) = 0;
      LODWORD(v209) = 1;
      goto LABEL_721;
    }
  }
  LODWORD(v209) = v116 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v117 = __sb__runningInSpringBoard();
    if (v117)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v156 = [MEMORY[0x1E4F42D90] mainScreen];
      [v156 _referenceBounds];
    }
    uint64_t v13 = v117 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v203) = v13;
    if (v119 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v205 = 0;
      uint64_t v207 = 0;
      LODWORD(v203) = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505E70;
      goto LABEL_241;
    }
  }
  else
  {
    HIDWORD(v203) = 0;
  }
LABEL_721:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v207 = 0;
      goto LABEL_737;
    }
  }
  else
  {
    v161 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v161 userInterfaceIdiom])
    {
      uint64_t v207 = 0x100000000;
      goto LABEL_737;
    }
  }
  HIDWORD(v207) = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v154 = [MEMORY[0x1E4F42D90] mainScreen];
      [v154 _referenceBounds];
    }
    LODWORD(v207) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v124 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_761;
    }
  }
  else
  {
    LODWORD(v207) = 0;
  }
LABEL_737:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v205 = 0;
    LODWORD(v203) = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E78;
    goto LABEL_241;
  }
LABEL_761:
  int v125 = __sb__runningInSpringBoard();
  if (v125)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v205) = 0;
      LODWORD(v203) = 0;
      goto LABEL_781;
    }
  }
  else
  {
    v160 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v160 userInterfaceIdiom])
    {
      LODWORD(v203) = 0;
      HIDWORD(v205) = 1;
      goto LABEL_781;
    }
  }
  HIDWORD(v205) = v125 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v153 = [MEMORY[0x1E4F42D90] mainScreen];
      [v153 _referenceBounds];
    }
    LODWORD(v203) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v129 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v201 = 0;
      LODWORD(v205) = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505E40;
      goto LABEL_241;
    }
  }
  else
  {
    LODWORD(v203) = 0;
  }
LABEL_781:
  int v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v201 = 0;
      uint64_t v13 = 0;
      goto LABEL_797;
    }
  }
  else
  {
    v157 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v157 userInterfaceIdiom])
    {
      uint64_t v13 = 0;
      int v201 = 1;
      goto LABEL_797;
    }
  }
  int v201 = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v127 = __sb__runningInSpringBoard();
    if (v127)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v152 = [MEMORY[0x1E4F42D90] mainScreen];
      [v152 _referenceBounds];
    }
    uint64_t v13 = v127 ^ 1u;
    BSSizeRoundForScale();
    if (v131 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_819;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_797:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v205) = v13;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E48;
    goto LABEL_241;
  }
LABEL_819:
  LODWORD(v205) = v13;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E20;
    goto LABEL_241;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E28;
    goto LABEL_241;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E10;
    goto LABEL_241;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E18;
    goto LABEL_241;
  }
  int v133 = __sb__runningInSpringBoard();
  if (v133)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v199 = 0;
      int v197 = 0;
      goto LABEL_855;
    }
  }
  else
  {
    v151 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v151 userInterfaceIdiom])
    {
      int v197 = 0;
      int v199 = 1;
      goto LABEL_855;
    }
  }
  int v199 = v133 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v149 = [MEMORY[0x1E4F42D90] mainScreen];
      [v149 _referenceBounds];
    }
    int v197 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v141 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505E30;
      goto LABEL_241;
    }
  }
  else
  {
    int v197 = 0;
  }
LABEL_855:
  int v135 = __sb__runningInSpringBoard();
  if (v135)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v45 = 0;
      int v46 = 0;
      goto LABEL_875;
    }
  }
  else
  {
    v150 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v150 userInterfaceIdiom])
    {
      int v46 = 0;
      int v45 = 1;
      goto LABEL_875;
    }
  }
  int v45 = v135 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v148 = [MEMORY[0x1E4F42D90] mainScreen];
      [v148 _referenceBounds];
    }
    int v46 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v143 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505E38;
      goto LABEL_241;
    }
  }
  else
  {
    int v46 = 0;
  }
LABEL_875:
  int v137 = __sb__runningInSpringBoard();
  if (v137)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v47 = 0;
      int v48 = 0;
      goto LABEL_896;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v11 userInterfaceIdiom])
    {
      int v48 = 0;
      int v47 = 1;
      goto LABEL_896;
    }
  }
  int v47 = v137 ^ 1;
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v9 _referenceBounds];
  }
  int v48 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v139 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505E08;
    goto LABEL_241;
  }
LABEL_896:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v49 = 0;
      int v50 = 0;
LABEL_925:
      CGRect v51 = &CSQuickActionButtonInsetY;
      goto LABEL_241;
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v2 userInterfaceIdiom])
    {
      int v50 = 0;
      int v49 = 1;
      goto LABEL_925;
    }
  }
  int v49 = v13 ^ 1;
  int v146 = __sb__runningInSpringBoard();
  if (v146)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v13 _referenceBounds];
  }
  int v50 = v146 ^ 1;
  BSSizeRoundForScale();
  if (v147 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_925;
  }
  CGRect v51 = &qword_1D8505E00;
LABEL_241:
  double v65 = *(double *)v51;
  if (v50) {

  }
  if (v49) {
  if (v48)
  }

  if (v47) {
  if (v46)
  }

  if (v45) {
  if (v197)
  }

  if (v199) {
  if (v205)
  }

  if (v201) {
  if (v203)
  }

  if (HIDWORD(v205)) {
  if (v207)
  }

  if (HIDWORD(v207)) {
  if (HIDWORD(v203))
  }

  if (v209) {
  if (HIDWORD(v209))
  }

  if (*(_DWORD *)&v210[8]) {
  if (*(_DWORD *)v210)
  }

  if (*(_DWORD *)&v210[4]) {
  if (DWORD2(v211))
  }

  if (HIDWORD(v211)) {
  if (v211)
  }

  if (DWORD1(v211)) {
  if (*(_DWORD *)&v212[4])
  }

  if (*(_DWORD *)&v212[8]) {
  if (*(_DWORD *)&v212[16])
  }

  if (*(_DWORD *)&v212[20]) {
  if (*(_DWORD *)v212)
  }

  if (*(_DWORD *)&v212[12]) {
  if (*(_DWORD *)&v212[24])
  }

  if (*(_DWORD *)&v212[32]) {
  if (*(_DWORD *)&v212[28])
  }

  if (*(_DWORD *)&v212[36]) {
  if (*(_DWORD *)&v212[40])
  }

  if (*(_DWORD *)&v212[44]) {
  if (*(_DWORD *)&v212[48])
  }

  if (*(_DWORD *)&v213[8]) {
  if (*(_DWORD *)&v213[4])
  }

  if (*(_DWORD *)v213) {
  if (*(_DWORD *)&v213[12])
  }

  if (*(_DWORD *)&v213[16]) {
  if (*(_DWORD *)&v213[20])
  }

  if (v214)
  {

    if (!*(_DWORD *)&v213[24]) {
      goto LABEL_329;
    }
  }
  else if (!*(_DWORD *)&v213[24])
  {
LABEL_329:
    if (*(_DWORD *)&v213[28]) {
      goto LABEL_330;
    }
    goto LABEL_340;
  }

  if (*(_DWORD *)&v213[28])
  {
LABEL_330:

    if (!*(_DWORD *)&v213[32]) {
      goto LABEL_331;
    }
    goto LABEL_341;
  }
LABEL_340:
  if (!*(_DWORD *)&v213[32])
  {
LABEL_331:
    if (*(_DWORD *)&v213[36]) {
      goto LABEL_332;
    }
    goto LABEL_342;
  }
LABEL_341:

  if (*(_DWORD *)&v213[36])
  {
LABEL_332:

    if (!*(_DWORD *)&v213[40]) {
      goto LABEL_333;
    }
    goto LABEL_343;
  }
LABEL_342:
  if (!*(_DWORD *)&v213[40])
  {
LABEL_333:
    if (*(_DWORD *)&v213[44]) {
      goto LABEL_334;
    }
    goto LABEL_344;
  }
LABEL_343:

  if (*(_DWORD *)&v213[44])
  {
LABEL_334:

    if (!*(_DWORD *)&v213[48]) {
      goto LABEL_335;
    }
    goto LABEL_345;
  }
LABEL_344:
  if (!*(_DWORD *)&v213[48])
  {
LABEL_335:
    if (HIDWORD(v214)) {
      goto LABEL_336;
    }
    goto LABEL_346;
  }
LABEL_345:

  if (HIDWORD(v214))
  {
LABEL_336:

    if (!v215) {
      return v65;
    }
    goto LABEL_347;
  }
LABEL_346:
  if (v215) {
LABEL_347:
  }

  return v65;
}

- (double)_insetY
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v4 = [WeakRetained isPortrait];

  int v5 = __sb__runningInSpringBoard();
  int v6 = v5;
  if (v4)
  {
    if (v5)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v7 = 0;
        char v8 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      id v216 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v216 userInterfaceIdiom] != 1)
      {
        int v7 = 0;
        char v8 = 1;
        goto LABEL_18;
      }
    }
    char v8 = v6 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v12 = __sb__runningInSpringBoard();
      if (v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v200 = [MEMORY[0x1E4F42D90] mainScreen];
        [v200 _referenceBounds];
      }
      int v7 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v57 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v56 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        int v215 = v12 ^ 1;
        long long v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        uint64_t v208 = 0;
        uint64_t v206 = 0;
        uint64_t v204 = 0;
        memset(v212, 0, sizeof(v212));
        int v36 = 0;
        uint64_t v202 = 0;
        int v37 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        int v41 = 0;
        int v42 = 0;
        int v43 = 0;
        memset(v213, 0, sizeof(v213));
        uint64_t v214 = 0;
        id v44 = &qword_1D8505EC8;
        goto LABEL_131;
      }
    }
    else
    {
      int v7 = 0;
    }
LABEL_18:
    int v14 = __sb__runningInSpringBoard();
    int v215 = v7;
    if (v14)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v15 = 0;
        unsigned int v16 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      v198 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v198 userInterfaceIdiom] != 1)
      {
        int v15 = 0;
        unsigned int v16 = 1;
        goto LABEL_36;
      }
    }
    unsigned int v16 = v14 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v12 = __sb__runningInSpringBoard();
      if (v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v189 = [MEMORY[0x1E4F42D90] mainScreen];
        [v189 _referenceBounds];
      }
      int v15 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v62 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        *(_DWORD *)&v213[48] = v12 ^ 1;
        uint64_t v214 = v16;
        long long v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        uint64_t v208 = 0;
        uint64_t v206 = 0;
        uint64_t v204 = 0;
        memset(v212, 0, sizeof(v212));
        int v36 = 0;
        uint64_t v202 = 0;
        int v37 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        int v41 = 0;
        int v42 = 0;
        int v43 = 0;
        memset(v213, 0, 48);
        id v44 = &qword_1D8505EF0;
        goto LABEL_131;
      }
    }
    else
    {
      int v15 = 0;
    }
LABEL_36:
    int v20 = __sb__runningInSpringBoard();
    *(_DWORD *)&v213[48] = v15;
    LODWORD(v214) = v16;
    if (v20)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        unsigned int v21 = 0;
        int v22 = 0;
        goto LABEL_54;
      }
    }
    else
    {
      v196 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v196 userInterfaceIdiom] != 1)
      {
        unsigned int v21 = 0;
        int v22 = 1;
        goto LABEL_54;
      }
    }
    int v22 = v20 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v12 = __sb__runningInSpringBoard();
      if (v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v188 = [MEMORY[0x1E4F42D90] mainScreen];
        [v188 _referenceBounds];
      }
      unsigned int v21 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v64 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        *(_DWORD *)&v213[40] = v12 ^ 1;
        *(_DWORD *)&v213[44] = v22;
        long long v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        uint64_t v208 = 0;
        uint64_t v206 = 0;
        uint64_t v204 = 0;
        memset(v212, 0, sizeof(v212));
        int v36 = 0;
        uint64_t v202 = 0;
        int v37 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        int v41 = 0;
        int v42 = 0;
        int v43 = 0;
        memset(v213, 0, 40);
        HIDWORD(v214) = 0;
        id v44 = &qword_1D8505EE0;
        goto LABEL_131;
      }
    }
    else
    {
      unsigned int v21 = 0;
    }
LABEL_54:
    int v26 = __sb__runningInSpringBoard();
    *(void *)&v213[40] = __PAIR64__(v22, v21);
    if (v26)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        unsigned int v27 = 0;
        int v28 = 0;
        goto LABEL_71;
      }
    }
    else
    {
      v195 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v195 userInterfaceIdiom] != 1)
      {
        unsigned int v27 = 0;
        int v28 = 1;
        goto LABEL_71;
      }
    }
    int v28 = v26 ^ 1;
    uint64_t v12 = __sb__runningInSpringBoard();
    if (v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v192 = [MEMORY[0x1E4F42D90] mainScreen];
      [v192 _referenceBounds];
    }
    unsigned int v27 = v12 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      *(_DWORD *)&v213[32] = v12 ^ 1;
      *(_DWORD *)&v213[36] = v28;
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v208 = 0;
      uint64_t v206 = 0;
      uint64_t v204 = 0;
      memset(v212, 0, sizeof(v212));
      int v36 = 0;
      uint64_t v202 = 0;
      int v37 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      memset(v213, 0, 32);
      HIDWORD(v214) = 0;
      id v44 = &qword_1D8505EE8;
      goto LABEL_131;
    }
LABEL_71:
    int v32 = __sb__runningInSpringBoard();
    *(void *)&v213[32] = __PAIR64__(v28, v27);
    if (v32)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        HIDWORD(v214) = 0;
        int v33 = 0;
        goto LABEL_91;
      }
    }
    else
    {
      v194 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v194 userInterfaceIdiom] != 1)
      {
        HIDWORD(v214) = 0;
        int v33 = 1;
        goto LABEL_91;
      }
    }
    int v33 = v32 ^ 1;
    uint64_t v12 = __sb__runningInSpringBoard();
    if (v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v190 = [MEMORY[0x1E4F42D90] mainScreen];
      [v190 _referenceBounds];
    }
    HIDWORD(v214) = v12 ^ 1;
    BSSizeRoundForScale();
    if (v52 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      *(_DWORD *)&v213[28] = v33;
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v208 = 0;
      uint64_t v206 = 0;
      uint64_t v204 = 0;
      memset(v212, 0, sizeof(v212));
      int v36 = 0;
      uint64_t v202 = 0;
      int v37 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      memset(v213, 0, 28);
      id v44 = &qword_1D8505ED8;
      goto LABEL_131;
    }
LABEL_91:
    int v53 = __sb__runningInSpringBoard();
    *(_DWORD *)&v213[28] = v33;
    if (v53)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v213[20] = 0;
        goto LABEL_352;
      }
    }
    else
    {
      v193 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v193 userInterfaceIdiom] != 1)
      {
        *(void *)&v213[20] = 0x100000000;
        goto LABEL_352;
      }
    }
    *(_DWORD *)&v213[24] = v53 ^ 1;
    uint64_t v12 = __sb__runningInSpringBoard();
    if (v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v187 = [MEMORY[0x1E4F42D90] mainScreen];
      [v187 _referenceBounds];
    }
    *(_DWORD *)&v213[20] = v12 ^ 1;
    BSSizeRoundForScale();
    if (v68 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v208 = 0;
      uint64_t v206 = 0;
      uint64_t v204 = 0;
      memset(v212, 0, sizeof(v212));
      int v36 = 0;
      uint64_t v202 = 0;
      int v37 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      memset(v213, 0, 20);
      id v44 = &qword_1D8505ED0;
      goto LABEL_131;
    }
LABEL_352:
    uint64_t v12 = __sb__runningInSpringBoard();
    if (v12)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_354;
      }
    }
    else
    {
      v191 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v191 userInterfaceIdiom] != 1)
      {
LABEL_354:
        *(_DWORD *)&v213[16] = v12 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_358:
          *(void *)&v213[4] = 0;
          goto LABEL_383;
        }
        int v69 = __sb__runningInSpringBoard();
        if (v69)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_358;
          }
        }
        else
        {
          v185 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v185 userInterfaceIdiom])
          {
            *(void *)&v213[4] = 1;
            goto LABEL_383;
          }
        }
        *(_DWORD *)&v213[4] = v69 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v178 = [MEMORY[0x1E4F42D90] mainScreen];
            [v178 _referenceBounds];
          }
          *(_DWORD *)&v213[8] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v76 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
          {
            long long v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            uint64_t v208 = 0;
            uint64_t v206 = 0;
            uint64_t v204 = 0;
            memset(v212, 0, sizeof(v212));
            int v36 = 0;
            uint64_t v202 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 0;
            id v44 = &qword_1D8505EA0;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v213[8] = 0;
        }
LABEL_383:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 0;
            goto LABEL_393;
          }
        }
        else
        {
          v186 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v186 userInterfaceIdiom])
          {
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 1;
            goto LABEL_393;
          }
        }
        *(_DWORD *)&v213[12] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v181 = [MEMORY[0x1E4F42D90] mainScreen];
            [v181 _referenceBounds];
          }
          *(_DWORD *)v213 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v72 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
            goto LABEL_397;
          }
        }
        else
        {
          *(_DWORD *)v213 = 0;
        }
LABEL_393:
        if (_SBF_Private_IsD94Like())
        {
          long long v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          uint64_t v208 = 0;
          uint64_t v206 = 0;
          uint64_t v204 = 0;
          memset(v212, 0, sizeof(v212));
          int v36 = 0;
          uint64_t v202 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505EA8;
          goto LABEL_131;
        }
LABEL_397:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_401:
          *(void *)&v212[44] = 0;
          goto LABEL_439;
        }
        int v73 = __sb__runningInSpringBoard();
        if (v73)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_401;
          }
        }
        else
        {
          v182 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v182 userInterfaceIdiom])
          {
            *(void *)&v212[44] = 0x100000000;
            goto LABEL_439;
          }
        }
        *(_DWORD *)&v212[48] = v73 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v173 = [MEMORY[0x1E4F42D90] mainScreen];
            [v173 _referenceBounds];
          }
          *(_DWORD *)&v212[44] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v86 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            long long v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            uint64_t v208 = 0;
            uint64_t v206 = 0;
            uint64_t v204 = 0;
            memset(v212, 0, 44);
            int v36 = 0;
            uint64_t v202 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505EB0;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[44] = 0;
        }
LABEL_439:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[32] = 0;
            *(_DWORD *)&v212[40] = 0;
            goto LABEL_449;
          }
        }
        else
        {
          v184 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v184 userInterfaceIdiom])
          {
            *(_DWORD *)&v212[32] = 0;
            *(_DWORD *)&v212[40] = 1;
            goto LABEL_449;
          }
        }
        *(_DWORD *)&v212[40] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v177 = [MEMORY[0x1E4F42D90] mainScreen];
            [v177 _referenceBounds];
          }
          *(_DWORD *)&v212[32] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v78 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_453;
          }
        }
        else
        {
          *(_DWORD *)&v212[32] = 0;
        }
LABEL_449:
        if (_SBF_Private_IsD64Like())
        {
          long long v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          uint64_t v208 = 0;
          uint64_t v206 = 0;
          uint64_t v204 = 0;
          memset(v212, 0, 32);
          int v36 = 0;
          uint64_t v202 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          *(_DWORD *)&v212[36] = 0;
          id v44 = &qword_1D8505EB8;
          goto LABEL_131;
        }
LABEL_453:
        int v79 = __sb__runningInSpringBoard();
        if (v79)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[28] = 0;
            *(_DWORD *)&v212[36] = 0;
            goto LABEL_463;
          }
        }
        else
        {
          v183 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v183 userInterfaceIdiom])
          {
            *(_DWORD *)&v212[28] = 0;
            *(_DWORD *)&v212[36] = 1;
            goto LABEL_463;
          }
        }
        *(_DWORD *)&v212[36] = v79 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v80 = __sb__runningInSpringBoard();
          if (v80)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v174 = [MEMORY[0x1E4F42D90] mainScreen];
            [v174 _referenceBounds];
          }
          uint64_t v12 = v80 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v212[28] = v12;
          if (v84 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            long long v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            uint64_t v208 = 0;
            uint64_t v206 = 0;
            uint64_t v204 = 0;
            memset(v212, 0, 28);
            int v36 = 0;
            uint64_t v202 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505E90;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[28] = 0;
        }
LABEL_463:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[4] = 0;
            *(_DWORD *)&v212[16] = 0;
            goto LABEL_507;
          }
        }
        else
        {
          v180 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v180 userInterfaceIdiom])
          {
            *(_DWORD *)&v212[4] = 0;
            *(_DWORD *)&v212[16] = 1;
            goto LABEL_507;
          }
        }
        *(_DWORD *)&v212[16] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v172 = [MEMORY[0x1E4F42D90] mainScreen];
            [v172 _referenceBounds];
          }
          *(_DWORD *)&v212[4] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v88 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_529;
          }
        }
        else
        {
          *(_DWORD *)&v212[4] = 0;
        }
LABEL_507:
        if (_SBF_Private_IsD54())
        {
          long long v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          uint64_t v208 = 0;
          uint64_t v206 = 0;
          uint64_t v204 = 0;
          *(_DWORD *)v212 = 0;
          int v36 = 0;
          uint64_t v202 = 0;
          int v37 = 0;
          int v38 = 0;
          *(void *)&v212[8] = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          *(void *)&v212[20] = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E98;
          goto LABEL_131;
        }
LABEL_529:
        int v89 = __sb__runningInSpringBoard();
        if (v89)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v212[20] = 0;
            goto LABEL_547;
          }
        }
        else
        {
          v179 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v179 userInterfaceIdiom])
          {
            *(void *)&v212[20] = 0x100000000;
            goto LABEL_547;
          }
        }
        *(_DWORD *)&v212[24] = v89 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v92 = __sb__runningInSpringBoard();
          if (v92)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v169 = [MEMORY[0x1E4F42D90] mainScreen];
            [v169 _referenceBounds];
          }
          uint64_t v12 = v92 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v212[20] = v12;
          if (v94 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            long long v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            uint64_t v208 = 0;
            uint64_t v206 = 0;
            uint64_t v204 = 0;
            *(_DWORD *)v212 = 0;
            int v36 = 0;
            uint64_t v202 = 0;
            int v37 = 0;
            int v38 = 0;
            *(void *)&v212[8] = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505E60;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[20] = 0;
        }
LABEL_547:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v212[8] = 0;
            goto LABEL_567;
          }
        }
        else
        {
          v176 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v176 userInterfaceIdiom])
          {
            *(void *)&v212[8] = 0x100000000;
            goto LABEL_567;
          }
        }
        *(_DWORD *)&v212[12] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v168 = [MEMORY[0x1E4F42D90] mainScreen];
            [v168 _referenceBounds];
          }
          *(_DWORD *)&v212[8] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v96 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_587;
          }
        }
        else
        {
          *(_DWORD *)&v212[8] = 0;
        }
LABEL_567:
        if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
        {
          long long v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          uint64_t v208 = 0;
          uint64_t v206 = 0;
          uint64_t v204 = 0;
          *(_DWORD *)v212 = 0;
          int v36 = 0;
          uint64_t v202 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E68;
          goto LABEL_131;
        }
LABEL_587:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_591:
          *(void *)((char *)&v211 + 4) = 0;
          goto LABEL_607;
        }
        int v97 = __sb__runningInSpringBoard();
        if (v97)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_591;
          }
        }
        else
        {
          v171 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v171 userInterfaceIdiom])
          {
            *(void *)((char *)&v211 + 4) = 0x100000000;
            goto LABEL_607;
          }
        }
        DWORD2(v211) = v97 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v100 = __sb__runningInSpringBoard();
          if (v100)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v162 = [MEMORY[0x1E4F42D90] mainScreen];
            [v162 _referenceBounds];
          }
          uint64_t v12 = v100 ^ 1u;
          BSSizeRoundForScale();
          DWORD1(v211) = v12;
          if (v110 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
          {
            LODWORD(v211) = 0;
            memset(v210, 0, sizeof(v210));
            uint64_t v208 = 0;
            HIDWORD(v211) = 0;
            uint64_t v206 = 0;
            uint64_t v204 = 0;
            *(_DWORD *)v212 = 0;
            uint64_t v202 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505E50;
            goto LABEL_131;
          }
        }
        else
        {
          DWORD1(v211) = 0;
        }
LABEL_607:
        int v101 = __sb__runningInSpringBoard();
        if (v101)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v12 = 0;
            *(_DWORD *)v212 = 0;
            goto LABEL_617;
          }
        }
        else
        {
          v175 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v175 userInterfaceIdiom])
          {
            uint64_t v12 = 0;
            *(_DWORD *)v212 = 1;
            goto LABEL_617;
          }
        }
        *(_DWORD *)v212 = v101 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v102 = __sb__runningInSpringBoard();
          if (v102)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v165 = [MEMORY[0x1E4F42D90] mainScreen];
            [v165 _referenceBounds];
          }
          uint64_t v12 = v102 ^ 1u;
          BSSizeRoundForScale();
          if (v103 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
            goto LABEL_621;
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
LABEL_617:
        if (_SBF_Private_IsD93Like())
        {
          HIDWORD(v211) = v12;
          LODWORD(v211) = 0;
          memset(v210, 0, sizeof(v210));
          uint64_t v208 = 0;
          uint64_t v206 = 0;
          uint64_t v204 = 0;
          uint64_t v202 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E58;
          goto LABEL_131;
        }
LABEL_621:
        HIDWORD(v211) = v12;
        if (!_SBF_Private_IsD63Like())
        {
LABEL_625:
          *(void *)&v210[4] = 0;
          goto LABEL_663;
        }
        int v104 = __sb__runningInSpringBoard();
        if (v104)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_625;
          }
        }
        else
        {
          v166 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v166 userInterfaceIdiom])
          {
            *(_DWORD *)&v210[4] = 0;
            *(_DWORD *)&v210[8] = 1;
            goto LABEL_663;
          }
        }
        *(_DWORD *)&v210[8] = v104 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v158 = [MEMORY[0x1E4F42D90] mainScreen];
            [v158 _referenceBounds];
          }
          *(_DWORD *)&v210[4] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v120 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            LODWORD(v211) = 0;
            *(_DWORD *)v210 = 0;
            uint64_t v206 = 0;
            uint64_t v208 = 0;
            uint64_t v202 = 0;
            uint64_t v204 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505E80;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v210[4] = 0;
        }
LABEL_663:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v211) = 0;
            *(_DWORD *)v210 = 0;
            goto LABEL_673;
          }
        }
        else
        {
          v170 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v170 userInterfaceIdiom])
          {
            *(_DWORD *)v210 = 0;
            LODWORD(v211) = 1;
            goto LABEL_673;
          }
        }
        LODWORD(v211) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v161 = [MEMORY[0x1E4F42D90] mainScreen];
            [v161 _referenceBounds];
          }
          *(_DWORD *)v210 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v112 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_677;
          }
        }
        else
        {
          *(_DWORD *)v210 = 0;
        }
LABEL_673:
        if (_SBF_Private_IsD63Like())
        {
          uint64_t v206 = 0;
          uint64_t v208 = 0;
          uint64_t v202 = 0;
          uint64_t v204 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E88;
          goto LABEL_131;
        }
LABEL_677:
        int v113 = __sb__runningInSpringBoard();
        if (v113)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v208) = 0;
            HIDWORD(v204) = 0;
            goto LABEL_687;
          }
        }
        else
        {
          v167 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v167 userInterfaceIdiom])
          {
            HIDWORD(v204) = 0;
            HIDWORD(v208) = 1;
            goto LABEL_687;
          }
        }
        HIDWORD(v208) = v113 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v114 = __sb__runningInSpringBoard();
          if (v114)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v159 = [MEMORY[0x1E4F42D90] mainScreen];
            [v159 _referenceBounds];
          }
          uint64_t v12 = v114 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v204) = v12;
          if (v118 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
          {
            LODWORD(v208) = 0;
            uint64_t v206 = 0;
            LODWORD(v204) = 0;
            uint64_t v202 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505E70;
            goto LABEL_131;
          }
        }
        else
        {
          HIDWORD(v204) = 0;
        }
LABEL_687:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v208) = 0;
            HIDWORD(v206) = 0;
            goto LABEL_731;
          }
        }
        else
        {
          v164 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v164 userInterfaceIdiom])
          {
            HIDWORD(v206) = 0;
            LODWORD(v208) = 1;
            goto LABEL_731;
          }
        }
        LODWORD(v208) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v157 = [MEMORY[0x1E4F42D90] mainScreen];
            [v157 _referenceBounds];
          }
          HIDWORD(v206) = v12 ^ 1;
          BSSizeRoundForScale();
          if (v122 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_753;
          }
        }
        else
        {
          HIDWORD(v206) = 0;
        }
LABEL_731:
        if (_SBF_Private_IsD33OrSimilarDevice())
        {
          LODWORD(v206) = 0;
          LODWORD(v204) = 0;
          uint64_t v202 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E78;
          goto LABEL_131;
        }
LABEL_753:
        int v123 = __sb__runningInSpringBoard();
        if (v123)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v206) = 0;
            LODWORD(v204) = 0;
            goto LABEL_771;
          }
        }
        else
        {
          v163 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v163 userInterfaceIdiom])
          {
            LODWORD(v204) = 0;
            LODWORD(v206) = 1;
            goto LABEL_771;
          }
        }
        LODWORD(v206) = v123 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v156 = [MEMORY[0x1E4F42D90] mainScreen];
            [v156 _referenceBounds];
          }
          LODWORD(v204) = v12 ^ 1;
          BSSizeRoundForScale();
          if (v128 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            uint64_t v202 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505E40;
            goto LABEL_131;
          }
        }
        else
        {
          LODWORD(v204) = 0;
        }
LABEL_771:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v202) = 0;
            int v36 = 0;
            goto LABEL_791;
          }
        }
        else
        {
          v160 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v160 userInterfaceIdiom])
          {
            int v36 = 0;
            HIDWORD(v202) = 1;
            goto LABEL_791;
          }
        }
        HIDWORD(v202) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v155 = [MEMORY[0x1E4F42D90] mainScreen];
            [v155 _referenceBounds];
          }
          int v36 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v130 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_807;
          }
        }
        else
        {
          int v36 = 0;
        }
LABEL_791:
        if (_SBF_Private_IsD53())
        {
          LODWORD(v202) = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E48;
          goto LABEL_131;
        }
LABEL_807:
        if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
        {
          LODWORD(v202) = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E20;
          goto LABEL_131;
        }
        if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
        {
          LODWORD(v202) = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E28;
          goto LABEL_131;
        }
        if (_SBF_Private_IsD52OrSimilarDevice())
        {
          LODWORD(v202) = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E10;
          goto LABEL_131;
        }
        if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
        {
          LODWORD(v202) = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E18;
          goto LABEL_131;
        }
        int v132 = __sb__runningInSpringBoard();
        if (v132)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v202) = 0;
            int v37 = 0;
            goto LABEL_845;
          }
        }
        else
        {
          v154 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v154 userInterfaceIdiom])
          {
            int v37 = 0;
            LODWORD(v202) = 1;
            goto LABEL_845;
          }
        }
        LODWORD(v202) = v132 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v149 = [MEMORY[0x1E4F42D90] mainScreen];
            [v149 _referenceBounds];
          }
          int v37 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v140 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
          {
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505E30;
            goto LABEL_131;
          }
        }
        else
        {
          int v37 = 0;
        }
LABEL_845:
        int v134 = __sb__runningInSpringBoard();
        if (v134)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v38 = 0;
            int v39 = 0;
            goto LABEL_865;
          }
        }
        else
        {
          v153 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v153 userInterfaceIdiom])
          {
            int v39 = 0;
            int v38 = 1;
            goto LABEL_865;
          }
        }
        int v38 = v134 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v12 = __sb__runningInSpringBoard();
          if (v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v148 = [MEMORY[0x1E4F42D90] mainScreen];
            [v148 _referenceBounds];
          }
          int v39 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v142 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
          {
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            id v44 = &qword_1D8505E38;
            goto LABEL_131;
          }
        }
        else
        {
          int v39 = 0;
        }
LABEL_865:
        int v136 = __sb__runningInSpringBoard();
        if (v136)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v40 = 0;
            int v41 = 0;
            goto LABEL_885;
          }
        }
        else
        {
          v152 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v152 userInterfaceIdiom])
          {
            int v41 = 0;
            int v40 = 1;
            goto LABEL_885;
          }
        }
        int v40 = v136 ^ 1;
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          v150 = [MEMORY[0x1E4F42D90] mainScreen];
          [v150 _referenceBounds];
        }
        int v41 = v12 ^ 1;
        BSSizeRoundForScale();
        if (v138 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
        {
          int v42 = 0;
          int v43 = 0;
          id v44 = &qword_1D8505E08;
          goto LABEL_131;
        }
LABEL_885:
        uint64_t v12 = __sb__runningInSpringBoard();
        if (v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v42 = 0;
            int v43 = 0;
            goto LABEL_919;
          }
        }
        else
        {
          v151 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v151 userInterfaceIdiom])
          {
            int v43 = 0;
            int v42 = 1;
            goto LABEL_919;
          }
        }
        int v42 = v12 ^ 1;
        int v144 = __sb__runningInSpringBoard();
        if (v144)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v12 = [MEMORY[0x1E4F42D90] mainScreen];
          [(id)v12 _referenceBounds];
        }
        int v43 = v144 ^ 1;
        BSSizeRoundForScale();
        if (v145 >= *(double *)(MEMORY[0x1E4FA6E50] + 40))
        {
          id v44 = &qword_1D8505E00;
LABEL_131:
          double v65 = *(double *)v44;
          if (v43) {

          }
          if (v42) {
          if (v41)
          }

          if (v40) {
          if (v39)
          }

          if (v38) {
          if (v37)
          }

          if (v202) {
          if (v36)
          }

          if (HIDWORD(v202)) {
          if (v204)
          }

          if (v206) {
          if (HIDWORD(v206))
          }

          if (v208) {
          if (HIDWORD(v204))
          }

          if (HIDWORD(v208)) {
          if (*(_DWORD *)v210)
          }

          if (v211) {
          if (*(_DWORD *)&v210[4])
          }

          if (*(_DWORD *)&v210[8]) {
          if (HIDWORD(v211))
          }

          if (*(_DWORD *)v212) {
          if (DWORD1(v211))
          }

          if (DWORD2(v211)) {
          if (*(_DWORD *)&v212[8])
          }

          if (*(_DWORD *)&v212[12]) {
          if (*(_DWORD *)&v212[20])
          }

          if (*(_DWORD *)&v212[24]) {
          if (*(_DWORD *)&v212[4])
          }

          if (*(_DWORD *)&v212[16]) {
          if (*(_DWORD *)&v212[28])
          }

          if (*(_DWORD *)&v212[36]) {
          if (*(_DWORD *)&v212[32])
          }

          if (*(_DWORD *)&v212[40]) {
          if (*(_DWORD *)&v212[44])
          }

          if (*(_DWORD *)&v212[48]) {
          if (*(_DWORD *)v213)
          }

          if (*(_DWORD *)&v213[12]) {
          if (*(_DWORD *)&v213[8])
          }

          if (*(_DWORD *)&v213[4]) {
          if (*(_DWORD *)&v213[16])
          }

          if (*(_DWORD *)&v213[20]) {
          if (*(_DWORD *)&v213[24])
          }

          if (HIDWORD(v214))
          {

            if (!*(_DWORD *)&v213[28]) {
              goto LABEL_219;
            }
          }
          else if (!*(_DWORD *)&v213[28])
          {
LABEL_219:
            if (*(_DWORD *)&v213[32]) {
              goto LABEL_220;
            }
            goto LABEL_231;
          }

          if (*(_DWORD *)&v213[32])
          {
LABEL_220:

            if (!*(_DWORD *)&v213[36]) {
              goto LABEL_221;
            }
            goto LABEL_232;
          }
LABEL_231:
          if (!*(_DWORD *)&v213[36])
          {
LABEL_221:
            if (*(_DWORD *)&v213[40]) {
              goto LABEL_222;
            }
            goto LABEL_233;
          }
LABEL_232:

          if (*(_DWORD *)&v213[40])
          {
LABEL_222:

            if (!*(_DWORD *)&v213[44]) {
              goto LABEL_223;
            }
            goto LABEL_234;
          }
LABEL_233:
          if (!*(_DWORD *)&v213[44])
          {
LABEL_223:
            if (*(_DWORD *)&v213[48]) {
              goto LABEL_224;
            }
            goto LABEL_235;
          }
LABEL_234:

          if (*(_DWORD *)&v213[48])
          {
LABEL_224:

            if (!v214) {
              goto LABEL_225;
            }
            goto LABEL_236;
          }
LABEL_235:
          if (!v214)
          {
LABEL_225:
            if (!v215) {
              goto LABEL_227;
            }
            goto LABEL_226;
          }
LABEL_236:

          if (!v215)
          {
LABEL_227:
            if ((v8 & 1) == 0) {
              return v65;
            }
            goto LABEL_347;
          }
LABEL_226:

          goto LABEL_227;
        }
LABEL_919:
        id v44 = &CSQuickActionButtonInsetY;
        goto LABEL_131;
      }
    }
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v208 = 0;
    uint64_t v206 = 0;
    uint64_t v204 = 0;
    memset(v212, 0, sizeof(v212));
    int v36 = 0;
    uint64_t v202 = 0;
    int v37 = 0;
    int v38 = 0;
    int v39 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    *(_OWORD *)v213 = 0uLL;
    id v44 = &qword_1D8505EC0;
    *(_DWORD *)&v213[16] = v12 ^ 1;
    goto LABEL_131;
  }
  uint64_t v9 = (uint64_t)&CSQuickActionButtonInsetX;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v10 = 0;
      uint64_t v11 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    id v216 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v216 userInterfaceIdiom] != 1)
    {
      uint64_t v11 = 0;
      int v10 = 1;
      goto LABEL_27;
    }
  }
  int v10 = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v187 = [MEMORY[0x1E4F42D90] mainScreen];
      [v187 _referenceBounds];
    }
    uint64_t v11 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v60 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v59 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      HIDWORD(v214) = v13 ^ 1;
      int v215 = v10;
      LODWORD(v214) = 0;
      memset(v213, 0, sizeof(v213));
      memset(v212, 0, sizeof(v212));
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505DC8;
      goto LABEL_241;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_27:
  int v17 = __sb__runningInSpringBoard();
  HIDWORD(v214) = v11;
  int v215 = v10;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v18 = 0;
      unsigned int v19 = 0;
      goto LABEL_45;
    }
  }
  else
  {
    v195 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v195 userInterfaceIdiom] != 1)
    {
      unsigned int v19 = 0;
      int v18 = 1;
      goto LABEL_45;
    }
  }
  int v18 = v17 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v186 = [MEMORY[0x1E4F42D90] mainScreen];
      [v186 _referenceBounds];
    }
    unsigned int v19 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v63 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      *(_DWORD *)&v213[44] = v13 ^ 1;
      *(_DWORD *)&v213[48] = v18;
      LODWORD(v214) = 0;
      memset(v213, 0, 44);
      memset(v212, 0, sizeof(v212));
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505DF0;
      goto LABEL_241;
    }
  }
  else
  {
    unsigned int v19 = 0;
  }
LABEL_45:
  int v23 = __sb__runningInSpringBoard();
  *(void *)&v213[44] = __PAIR64__(v18, v19);
  if (v23)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v24 = 0;
      unsigned int v25 = 0;
      goto LABEL_62;
    }
  }
  else
  {
    v194 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v194 userInterfaceIdiom] != 1)
    {
      unsigned int v25 = 0;
      int v24 = 1;
      goto LABEL_62;
    }
  }
  int v24 = v23 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v185 = [MEMORY[0x1E4F42D90] mainScreen];
      [v185 _referenceBounds];
    }
    unsigned int v25 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      *(_DWORD *)&v213[36] = v13 ^ 1;
      *(_DWORD *)&v213[40] = v24;
      LODWORD(v214) = 0;
      memset(v213, 0, 36);
      memset(v212, 0, sizeof(v212));
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505DE0;
      goto LABEL_241;
    }
  }
  else
  {
    unsigned int v25 = 0;
  }
LABEL_62:
  int v29 = __sb__runningInSpringBoard();
  *(void *)&v213[36] = __PAIR64__(v24, v25);
  if (v29)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v30 = 0;
      uint64_t v2 = 0;
      goto LABEL_80;
    }
  }
  else
  {
    v193 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v193 userInterfaceIdiom] != 1)
    {
      uint64_t v2 = 0;
      int v30 = 1;
      goto LABEL_80;
    }
  }
  int v30 = v29 ^ 1;
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v190 = [MEMORY[0x1E4F42D90] mainScreen];
    [v190 _referenceBounds];
  }
  uint64_t v2 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    *(void *)&v213[28] = __PAIR64__(v30, v2);
    LODWORD(v214) = 0;
    memset(v213, 0, 28);
    memset(v212, 0, sizeof(v212));
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505DE8;
    goto LABEL_241;
  }
LABEL_80:
  int v35 = __sb__runningInSpringBoard();
  *(void *)&v213[28] = __PAIR64__(v30, v2);
  if (v35)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v9 = 0;
      LODWORD(v214) = 0;
      goto LABEL_100;
    }
  }
  else
  {
    v192 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v192 userInterfaceIdiom] != 1)
    {
      LODWORD(v214) = 0;
      uint64_t v9 = 1;
      goto LABEL_100;
    }
  }
  uint64_t v9 = v35 ^ 1u;
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v188 = [MEMORY[0x1E4F42D90] mainScreen];
    [v188 _referenceBounds];
  }
  LODWORD(v214) = v13 ^ 1;
  BSSizeRoundForScale();
  if (v54 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    *(_DWORD *)&v213[24] = v9;
    memset(v213, 0, 24);
    memset(v212, 0, sizeof(v212));
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505DD8;
    goto LABEL_241;
  }
LABEL_100:
  int v55 = __sb__runningInSpringBoard();
  *(_DWORD *)&v213[24] = v9;
  if (v55)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v213[16] = 0;
      goto LABEL_364;
    }
  }
  else
  {
    v191 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v191 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v213[16] = 0;
      *(_DWORD *)&v213[20] = 1;
      goto LABEL_364;
    }
  }
  *(_DWORD *)&v213[20] = v55 ^ 1;
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v184 = [MEMORY[0x1E4F42D90] mainScreen];
    [v184 _referenceBounds];
  }
  *(_DWORD *)&v213[16] = v13 ^ 1;
  BSSizeRoundForScale();
  if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    *(void *)v213 = 0;
    *(void *)&v213[8] = 0;
    memset(v212, 0, sizeof(v212));
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505DD0;
    goto LABEL_241;
  }
LABEL_364:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_366;
    }
LABEL_372:
    *(void *)v213 = 0;
    *(_DWORD *)&v213[8] = 0;
    memset(v212, 0, sizeof(v212));
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505DC0;
    *(_DWORD *)&v213[12] = v13 ^ 1;
    goto LABEL_241;
  }
  v189 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v189 userInterfaceIdiom] == 1) {
    goto LABEL_372;
  }
LABEL_366:
  *(_DWORD *)&v213[12] = v13 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_370:
    *(void *)v213 = 0;
    goto LABEL_408;
  }
  int v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_370;
    }
  }
  else
  {
    v182 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v182 userInterfaceIdiom])
    {
      *(void *)v213 = 1;
      goto LABEL_408;
    }
  }
  *(_DWORD *)v213 = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v175 = [MEMORY[0x1E4F42D90] mainScreen];
      [v175 _referenceBounds];
    }
    *(_DWORD *)&v213[4] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v77 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      *(_DWORD *)&v213[8] = 0;
      memset(v212, 0, sizeof(v212));
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505DA0;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v213[4] = 0;
  }
LABEL_408:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v213[8] = 0;
      *(_DWORD *)&v212[48] = 0;
      goto LABEL_418;
    }
  }
  else
  {
    v183 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v183 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[48] = 0;
      *(_DWORD *)&v213[8] = 1;
      goto LABEL_418;
    }
  }
  *(_DWORD *)&v213[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v178 = [MEMORY[0x1E4F42D90] mainScreen];
      [v178 _referenceBounds];
    }
    *(_DWORD *)&v212[48] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v74 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_422;
    }
  }
  else
  {
    *(_DWORD *)&v212[48] = 0;
  }
LABEL_418:
  if (_SBF_Private_IsD94Like())
  {
    memset(v212, 0, 48);
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505DA8;
    goto LABEL_241;
  }
LABEL_422:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_426:
    *(void *)&v212[40] = 0;
    goto LABEL_473;
  }
  int v75 = __sb__runningInSpringBoard();
  if (v75)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_426;
    }
  }
  else
  {
    v179 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v179 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[40] = 0;
      *(_DWORD *)&v212[44] = 1;
      goto LABEL_473;
    }
  }
  *(_DWORD *)&v212[44] = v75 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v170 = [MEMORY[0x1E4F42D90] mainScreen];
      [v170 _referenceBounds];
    }
    *(_DWORD *)&v212[40] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v87 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v212, 0, 40);
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505DB0;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[40] = 0;
  }
LABEL_473:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[36] = 0;
      *(_DWORD *)&v212[28] = 0;
      goto LABEL_483;
    }
  }
  else
  {
    v181 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v181 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[28] = 0;
      *(_DWORD *)&v212[36] = 1;
      goto LABEL_483;
    }
  }
  *(_DWORD *)&v212[36] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v174 = [MEMORY[0x1E4F42D90] mainScreen];
      [v174 _referenceBounds];
    }
    *(_DWORD *)&v212[28] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v81 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_487;
    }
  }
  else
  {
    *(_DWORD *)&v212[28] = 0;
  }
LABEL_483:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v212[32] = 0;
    memset(v212, 0, 28);
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505DB8;
    goto LABEL_241;
  }
LABEL_487:
  int v82 = __sb__runningInSpringBoard();
  if (v82)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[32] = 0;
      *(_DWORD *)&v212[24] = 0;
      goto LABEL_497;
    }
  }
  else
  {
    v180 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v180 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[24] = 0;
      *(_DWORD *)&v212[32] = 1;
      goto LABEL_497;
    }
  }
  *(_DWORD *)&v212[32] = v82 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v83 = __sb__runningInSpringBoard();
    if (v83)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v171 = [MEMORY[0x1E4F42D90] mainScreen];
      [v171 _referenceBounds];
    }
    uint64_t v13 = v83 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v212[24] = v13;
    if (v85 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v212, 0, 24);
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505D90;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[24] = 0;
  }
LABEL_497:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[12] = 0;
      *(_DWORD *)v212 = 0;
      goto LABEL_513;
    }
  }
  else
  {
    v177 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v177 userInterfaceIdiom])
    {
      *(_DWORD *)v212 = 0;
      *(_DWORD *)&v212[12] = 1;
      goto LABEL_513;
    }
  }
  *(_DWORD *)&v212[12] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v169 = [MEMORY[0x1E4F42D90] mainScreen];
      [v169 _referenceBounds];
    }
    *(_DWORD *)v212 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v90 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_537;
    }
  }
  else
  {
    *(_DWORD *)v212 = 0;
  }
LABEL_513:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v212[16] = 0;
    *(void *)&v212[4] = 0;
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D98;
    goto LABEL_241;
  }
LABEL_537:
  int v91 = __sb__runningInSpringBoard();
  if (v91)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v212[16] = 0;
      goto LABEL_557;
    }
  }
  else
  {
    v176 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v176 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[16] = 0;
      *(_DWORD *)&v212[20] = 1;
      goto LABEL_557;
    }
  }
  *(_DWORD *)&v212[20] = v91 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v93 = __sb__runningInSpringBoard();
    if (v93)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v166 = [MEMORY[0x1E4F42D90] mainScreen];
      [v166 _referenceBounds];
    }
    uint64_t v13 = v93 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v212[16] = v13;
    if (v95 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v212[4] = 0;
      long long v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505D60;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[16] = 0;
  }
LABEL_557:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v212[4] = 0;
      goto LABEL_574;
    }
  }
  else
  {
    v173 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v173 userInterfaceIdiom])
    {
      *(_DWORD *)&v212[4] = 0;
      *(_DWORD *)&v212[8] = 1;
      goto LABEL_574;
    }
  }
  *(_DWORD *)&v212[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v165 = [MEMORY[0x1E4F42D90] mainScreen];
      [v165 _referenceBounds];
    }
    *(_DWORD *)&v212[4] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v98 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_596;
    }
  }
  else
  {
    *(_DWORD *)&v212[4] = 0;
  }
LABEL_574:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    long long v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D68;
    goto LABEL_241;
  }
LABEL_596:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_600:
    *(void *)&long long v211 = 0;
    goto LABEL_632;
  }
  int v99 = __sb__runningInSpringBoard();
  if (v99)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_600;
    }
  }
  else
  {
    v168 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v168 userInterfaceIdiom])
    {
      *(void *)&long long v211 = 0x100000000;
      goto LABEL_632;
    }
  }
  DWORD1(v211) = v99 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v105 = __sb__runningInSpringBoard();
    if (v105)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v159 = [MEMORY[0x1E4F42D90] mainScreen];
      [v159 _referenceBounds];
    }
    uint64_t v13 = v105 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v211) = v13;
    if (v111 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      *((void *)&v211 + 1) = 0;
      memset(v210, 0, sizeof(v210));
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505D50;
      goto LABEL_241;
    }
  }
  else
  {
    LODWORD(v211) = 0;
  }
LABEL_632:
  int v106 = __sb__runningInSpringBoard();
  if (v106)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v211) = 0;
      uint64_t v13 = 0;
      goto LABEL_642;
    }
  }
  else
  {
    v172 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v172 userInterfaceIdiom])
    {
      uint64_t v13 = 0;
      HIDWORD(v211) = 1;
      goto LABEL_642;
    }
  }
  HIDWORD(v211) = v106 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v107 = __sb__runningInSpringBoard();
    if (v107)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v162 = [MEMORY[0x1E4F42D90] mainScreen];
      [v162 _referenceBounds];
    }
    uint64_t v13 = v107 ^ 1u;
    BSSizeRoundForScale();
    if (v108 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_646;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_642:
  if (_SBF_Private_IsD93Like())
  {
    DWORD2(v211) = v13;
    memset(v210, 0, sizeof(v210));
    uint64_t v207 = 0;
    uint64_t v209 = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D58;
    goto LABEL_241;
  }
LABEL_646:
  DWORD2(v211) = v13;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_650:
    *(void *)v210 = 0;
    goto LABEL_697;
  }
  int v109 = __sb__runningInSpringBoard();
  if (v109)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_650;
    }
  }
  else
  {
    v163 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v163 userInterfaceIdiom])
    {
      *(void *)v210 = 0x100000000;
      goto LABEL_697;
    }
  }
  *(_DWORD *)&v210[4] = v109 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v155 = [MEMORY[0x1E4F42D90] mainScreen];
      [v155 _referenceBounds];
    }
    *(_DWORD *)v210 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v121 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      *(_DWORD *)&v210[8] = 0;
      uint64_t v207 = 0;
      uint64_t v209 = 0;
      uint64_t v203 = 0;
      uint64_t v205 = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505D80;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)v210 = 0;
  }
LABEL_697:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v210[8] = 0;
      HIDWORD(v209) = 0;
      goto LABEL_707;
    }
  }
  else
  {
    v167 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v167 userInterfaceIdiom])
    {
      HIDWORD(v209) = 0;
      *(_DWORD *)&v210[8] = 1;
      goto LABEL_707;
    }
  }
  *(_DWORD *)&v210[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v158 = [MEMORY[0x1E4F42D90] mainScreen];
      [v158 _referenceBounds];
    }
    HIDWORD(v209) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v115 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_711;
    }
  }
  else
  {
    HIDWORD(v209) = 0;
  }
LABEL_707:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v209) = 0;
    uint64_t v203 = 0;
    uint64_t v205 = 0;
    uint64_t v207 = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D88;
    goto LABEL_241;
  }
LABEL_711:
  int v116 = __sb__runningInSpringBoard();
  if (v116)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v209) = 0;
      HIDWORD(v203) = 0;
      goto LABEL_721;
    }
  }
  else
  {
    v164 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v164 userInterfaceIdiom])
    {
      HIDWORD(v203) = 0;
      LODWORD(v209) = 1;
      goto LABEL_721;
    }
  }
  LODWORD(v209) = v116 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v117 = __sb__runningInSpringBoard();
    if (v117)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v156 = [MEMORY[0x1E4F42D90] mainScreen];
      [v156 _referenceBounds];
    }
    uint64_t v13 = v117 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v203) = v13;
    if (v119 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v205 = 0;
      uint64_t v207 = 0;
      LODWORD(v203) = 0;
      int v201 = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505D70;
      goto LABEL_241;
    }
  }
  else
  {
    HIDWORD(v203) = 0;
  }
LABEL_721:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v207 = 0;
      goto LABEL_737;
    }
  }
  else
  {
    v161 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v161 userInterfaceIdiom])
    {
      uint64_t v207 = 0x100000000;
      goto LABEL_737;
    }
  }
  HIDWORD(v207) = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v154 = [MEMORY[0x1E4F42D90] mainScreen];
      [v154 _referenceBounds];
    }
    LODWORD(v207) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v124 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_761;
    }
  }
  else
  {
    LODWORD(v207) = 0;
  }
LABEL_737:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v205 = 0;
    LODWORD(v203) = 0;
    int v201 = 0;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D78;
    goto LABEL_241;
  }
LABEL_761:
  int v125 = __sb__runningInSpringBoard();
  if (v125)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v205) = 0;
      LODWORD(v203) = 0;
      goto LABEL_781;
    }
  }
  else
  {
    v160 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v160 userInterfaceIdiom])
    {
      LODWORD(v203) = 0;
      HIDWORD(v205) = 1;
      goto LABEL_781;
    }
  }
  HIDWORD(v205) = v125 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v153 = [MEMORY[0x1E4F42D90] mainScreen];
      [v153 _referenceBounds];
    }
    LODWORD(v203) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v129 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v201 = 0;
      LODWORD(v205) = 0;
      int v199 = 0;
      int v197 = 0;
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505D40;
      goto LABEL_241;
    }
  }
  else
  {
    LODWORD(v203) = 0;
  }
LABEL_781:
  int v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v201 = 0;
      uint64_t v13 = 0;
      goto LABEL_797;
    }
  }
  else
  {
    v157 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v157 userInterfaceIdiom])
    {
      uint64_t v13 = 0;
      int v201 = 1;
      goto LABEL_797;
    }
  }
  int v201 = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v127 = __sb__runningInSpringBoard();
    if (v127)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v152 = [MEMORY[0x1E4F42D90] mainScreen];
      [v152 _referenceBounds];
    }
    uint64_t v13 = v127 ^ 1u;
    BSSizeRoundForScale();
    if (v131 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_819;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_797:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v205) = v13;
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D48;
    goto LABEL_241;
  }
LABEL_819:
  LODWORD(v205) = v13;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D20;
    goto LABEL_241;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D28;
    goto LABEL_241;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D10;
    goto LABEL_241;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v199 = 0;
    int v197 = 0;
    int v45 = 0;
    int v46 = 0;
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D18;
    goto LABEL_241;
  }
  int v133 = __sb__runningInSpringBoard();
  if (v133)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v199 = 0;
      int v197 = 0;
      goto LABEL_855;
    }
  }
  else
  {
    v151 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v151 userInterfaceIdiom])
    {
      int v197 = 0;
      int v199 = 1;
      goto LABEL_855;
    }
  }
  int v199 = v133 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v149 = [MEMORY[0x1E4F42D90] mainScreen];
      [v149 _referenceBounds];
    }
    int v197 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v141 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v45 = 0;
      int v46 = 0;
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505D30;
      goto LABEL_241;
    }
  }
  else
  {
    int v197 = 0;
  }
LABEL_855:
  int v135 = __sb__runningInSpringBoard();
  if (v135)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v45 = 0;
      int v46 = 0;
      goto LABEL_875;
    }
  }
  else
  {
    v150 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v150 userInterfaceIdiom])
    {
      int v46 = 0;
      int v45 = 1;
      goto LABEL_875;
    }
  }
  int v45 = v135 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v148 = [MEMORY[0x1E4F42D90] mainScreen];
      [v148 _referenceBounds];
    }
    int v46 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v143 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v47 = 0;
      int v48 = 0;
      int v49 = 0;
      int v50 = 0;
      CGRect v51 = &qword_1D8505D38;
      goto LABEL_241;
    }
  }
  else
  {
    int v46 = 0;
  }
LABEL_875:
  int v137 = __sb__runningInSpringBoard();
  if (v137)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v47 = 0;
      int v48 = 0;
      goto LABEL_896;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v11 userInterfaceIdiom])
    {
      int v48 = 0;
      int v47 = 1;
      goto LABEL_896;
    }
  }
  int v47 = v137 ^ 1;
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v9 _referenceBounds];
  }
  int v48 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v139 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v49 = 0;
    int v50 = 0;
    CGRect v51 = &qword_1D8505D08;
    goto LABEL_241;
  }
LABEL_896:
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v49 = 0;
      int v50 = 0;
LABEL_925:
      CGRect v51 = &CSQuickActionButtonInsetX;
      goto LABEL_241;
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v2 userInterfaceIdiom])
    {
      int v50 = 0;
      int v49 = 1;
      goto LABEL_925;
    }
  }
  int v49 = v13 ^ 1;
  int v146 = __sb__runningInSpringBoard();
  if (v146)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v13 _referenceBounds];
  }
  int v50 = v146 ^ 1;
  BSSizeRoundForScale();
  if (v147 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_925;
  }
  CGRect v51 = &qword_1D8505D00;
LABEL_241:
  double v65 = *(double *)v51;
  if (v50) {

  }
  if (v49) {
  if (v48)
  }

  if (v47) {
  if (v46)
  }

  if (v45) {
  if (v197)
  }

  if (v199) {
  if (v205)
  }

  if (v201) {
  if (v203)
  }

  if (HIDWORD(v205)) {
  if (v207)
  }

  if (HIDWORD(v207)) {
  if (HIDWORD(v203))
  }

  if (v209) {
  if (HIDWORD(v209))
  }

  if (*(_DWORD *)&v210[8]) {
  if (*(_DWORD *)v210)
  }

  if (*(_DWORD *)&v210[4]) {
  if (DWORD2(v211))
  }

  if (HIDWORD(v211)) {
  if (v211)
  }

  if (DWORD1(v211)) {
  if (*(_DWORD *)&v212[4])
  }

  if (*(_DWORD *)&v212[8]) {
  if (*(_DWORD *)&v212[16])
  }

  if (*(_DWORD *)&v212[20]) {
  if (*(_DWORD *)v212)
  }

  if (*(_DWORD *)&v212[12]) {
  if (*(_DWORD *)&v212[24])
  }

  if (*(_DWORD *)&v212[32]) {
  if (*(_DWORD *)&v212[28])
  }

  if (*(_DWORD *)&v212[36]) {
  if (*(_DWORD *)&v212[40])
  }

  if (*(_DWORD *)&v212[44]) {
  if (*(_DWORD *)&v212[48])
  }

  if (*(_DWORD *)&v213[8]) {
  if (*(_DWORD *)&v213[4])
  }

  if (*(_DWORD *)v213) {
  if (*(_DWORD *)&v213[12])
  }

  if (*(_DWORD *)&v213[16]) {
  if (*(_DWORD *)&v213[20])
  }

  if (v214)
  {

    if (!*(_DWORD *)&v213[24]) {
      goto LABEL_329;
    }
  }
  else if (!*(_DWORD *)&v213[24])
  {
LABEL_329:
    if (*(_DWORD *)&v213[28]) {
      goto LABEL_330;
    }
    goto LABEL_340;
  }

  if (*(_DWORD *)&v213[28])
  {
LABEL_330:

    if (!*(_DWORD *)&v213[32]) {
      goto LABEL_331;
    }
    goto LABEL_341;
  }
LABEL_340:
  if (!*(_DWORD *)&v213[32])
  {
LABEL_331:
    if (*(_DWORD *)&v213[36]) {
      goto LABEL_332;
    }
    goto LABEL_342;
  }
LABEL_341:

  if (*(_DWORD *)&v213[36])
  {
LABEL_332:

    if (!*(_DWORD *)&v213[40]) {
      goto LABEL_333;
    }
    goto LABEL_343;
  }
LABEL_342:
  if (!*(_DWORD *)&v213[40])
  {
LABEL_333:
    if (*(_DWORD *)&v213[44]) {
      goto LABEL_334;
    }
    goto LABEL_344;
  }
LABEL_343:

  if (*(_DWORD *)&v213[44])
  {
LABEL_334:

    if (!*(_DWORD *)&v213[48]) {
      goto LABEL_335;
    }
    goto LABEL_345;
  }
LABEL_344:
  if (!*(_DWORD *)&v213[48])
  {
LABEL_335:
    if (HIDWORD(v214)) {
      goto LABEL_336;
    }
    goto LABEL_346;
  }
LABEL_345:

  if (HIDWORD(v214))
  {
LABEL_336:

    if (!v215) {
      return v65;
    }
    goto LABEL_347;
  }
LABEL_346:
  if (v215) {
LABEL_347:
  }

  return v65;
}

- (UIEdgeInsets)_buttonOutsets
{
  [(CSDashBoardQuickActionsButtonSettings *)self->_quickActionsSettings topOutset];
  double v4 = v3;
  [(CSDashBoardQuickActionsButtonSettings *)self->_quickActionsSettings leadingOutset];
  double v6 = v5;
  [(CSDashBoardQuickActionsButtonSettings *)self->_quickActionsSettings bottomOutset];
  double v8 = v7;
  [(CSDashBoardQuickActionsButtonSettings *)self->_quickActionsSettings trailingOutset];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.right = v10;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_setButtonBackgroundVisible:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double v4 = [MEMORY[0x1E4F428B8] systemYellowColor];
    double v5 = [v4 colorWithAlphaComponent:0.35];
  }
  else
  {
    double v5 = 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v6 = self->_buttons;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setBackgroundColor:", v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)_prototypingAllowsButtons
{
  return [(CSDashBoardQuickActionsButtonSettings *)self->_quickActionsSettings showsButtons];
}

- (BOOL)shouldAllowClickInteraction:(id)a3 toBeginForButton:(id)a4
{
  id v5 = a3;
  double v6 = [(CSQuickActionsView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v6 shouldTouchesBeginForClick:v5])
  {
    BOOL v13 = 0;
  }
  else if ([(CSDashBoardQuickActionsButtonSettings *)self->_quickActionsSettings usesStrictTouchAllowance])
  {
    uint64_t v7 = [(CSQuickActionsView *)self coordinateSpace];
    [v5 locationInCoordinateSpace:v7];
    double v9 = v8;
    double v11 = v10;

    long long v12 = [v5 view];
    BOOL v13 = -[CSQuickActionsView strictlyInterpretsLocationAsContent:inView:](self, "strictlyInterpretsLocationAsContent:inView:", v12, v9, v11);
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_quickActionsSettings == a3)
  {
    [(CSQuickActionsView *)self refreshSupportedButtons];
    [(CSQuickActionsView *)self setNeedsLayout];
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CSQuickActionsView *)self animatedLayerProperties];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CSQuickActionsView;
    BOOL v7 = [(CSQuickActionsView *)&v9 _shouldAnimatePropertyWithKey:v4];
  }

  return v7;
}

- (NSArray)animatedLayerProperties
{
  return self->animatedLayerProperties;
}

- (void)setAnimatedLayerProperties:(id)a3
{
}

- (CSQuickActionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSQuickActionsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)controlsActions
{
  return self->_controlsActions;
}

- (NSArray)buttonActions
{
  return self->_buttonActions;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)actionsVisible
{
  return self->_actionsVisible;
}

- (CSDashBoardQuickActionsButtonSettings)quickActionsSettings
{
  return self->_quickActionsSettings;
}

- (void)setQuickActionsSettings:(id)a3
{
}

- (CSProminentButtonsView)buttonContainerView
{
  return self->_buttonContainerView;
}

- (void)setButtonContainerView:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_buttonContainerView, 0);
  objc_storeStrong((id *)&self->_quickActionsSettings, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_controlsActions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->animatedLayerProperties, 0);
  objc_storeStrong((id *)&self->_luminanceMap, 0);

  objc_storeStrong((id *)&self->_miscellaneousDefaults, 0);
}

@end