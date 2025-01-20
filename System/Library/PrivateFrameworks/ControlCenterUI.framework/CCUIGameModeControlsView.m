@interface CCUIGameModeControlsView
- (BOOL)performPrimaryActionForControlTemplateView:(id)a3;
- (CCUIControlTemplateView)templateView;
- (CCUIGameModeControlsView)initWithProvider:(id)a3 activityData:(id)a4 frame:(CGRect)a5;
- (CCUILabeledRoundButtonViewController)buttonViewController;
- (CGRect)cachedExpandedRect;
- (NSString)bundleIdentifier;
- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)gameModeActivityDataProvider;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)state;
- (void)setBlurRadius:(double)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setButtonViewController:(id)a3;
- (void)setCachedExpandedRect:(CGRect)a3;
- (void)setGameModeActivityDataProvider:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTemplateView:(id)a3;
- (void)updateState;
@end

@implementation CCUIGameModeControlsView

- (CCUIGameModeControlsView)initWithProvider:(id)a3 activityData:(id)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v57[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v55.receiver = self;
  v55.super_class = (Class)CCUIGameModeControlsView;
  v13 = -[CCUIGameModeControlsView initWithFrame:](&v55, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_gameModeActivityDataProvider, v11);
    uint64_t v15 = [v12 bundleIdentifier];
    id v53 = v12;
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    v14->_state = [v11 stateForBundleIdentifier:v14->_bundleIdentifier];
    v52 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    v17 = [(CCUIGameModeControlsView *)v14 layer];
    v57[0] = v52;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
    [v17 setFilters:v18];

    [(SBFView *)v14 setAnimatedLayerProperties:&unk_1F2F4B7A0];
    [(CCUIGameModeControlsView *)v14 setClipsToBounds:0];
    v51 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:*MEMORY[0x1E4FB09D0]];
    v50 = [MEMORY[0x1E4FB1830] configurationWithFont:v51 scale:3];
    v49 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gamecontroller.fill" withConfiguration:v50];
    id v19 = objc_alloc(MEMORY[0x1E4F5AE30]);
    id v54 = v11;
    v20 = [MEMORY[0x1E4FB1618] clearColor];
    v21 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v22 = (void *)[v19 initWithGlyphImage:v49 highlightColor:v20 highlightTintColor:v21 useLightStyle:1];

    [v22 setEnabled:1];
    [v22 setInoperative:1];
    [v22 setLabelsVisible:0];
    [v22 setToggleStateOnTap:0];
    [v22 setDynamicLayoutEnabled:1];
    [v22 setContentSizeCategoryThreshold:*MEMORY[0x1E4FB27C0]];
    buttonViewController = v14->_buttonViewController;
    v14->_buttonViewController = (CCUILabeledRoundButtonViewController *)v22;
    id v48 = v22;

    CCUIPortraitMainListGridGeometryInfo();
    double v25 = v24;
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5AE28]), "initWithFrame:", 0.0, 0.0, width, v24);
    v27 = [MEMORY[0x1E4F5AE08] controlCenterDarkMaterial];
    [v26 setBackgroundView:v27];

    v28 = [v48 view];
    [v26 setCustomGlyphView:v28];

    [v26 setGridSizeClass:3];
    v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:@"CONTROL_CENTER_GAME_MODE" value:&stru_1F2F34F20 table:@"ControlCenterUI"];
    [v26 setTitle:v30];

    CCUIPortraitMainListGridGeometryInfo();
    CCUILayoutGutter();
    CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
    objc_msgSend(v26, "setContinuousCornerRadius:");
    [v26 setDelegate:v14];
    templateView = v14->_templateView;
    v14->_templateView = (CCUIControlTemplateView *)v26;
    id v32 = v26;

    [(CCUIGameModeControlsView *)v14 updateState];
    -[CCUIGameModeControlsView setFrame:](v14, "setFrame:", x, y, width, v25);
    [(CCUIGameModeControlsView *)v14 addSubview:v32];
    v42 = (void *)MEMORY[0x1E4F28DC8];
    v47 = [v32 topAnchor];
    v46 = [(CCUIGameModeControlsView *)v14 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v56[0] = v45;
    v44 = [v32 bottomAnchor];
    v43 = [(CCUIGameModeControlsView *)v14 bottomAnchor];
    v33 = [v44 constraintEqualToAnchor:v43];
    v56[1] = v33;
    v34 = [v32 leadingAnchor];
    v35 = [(CCUIGameModeControlsView *)v14 leadingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v56[2] = v36;
    v37 = [v32 trailingAnchor];
    v38 = [(CCUIGameModeControlsView *)v14 trailingAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v56[3] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:4];
    [v42 activateConstraints:v40];

    id v11 = v54;
    id v12 = v53;
  }
  return v14;
}

- (void)updateState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gameModeActivityDataProvider);
  uint64_t v4 = [WeakRetained gameModeState];

  if (v4 == 4)
  {
    templateView = self->_templateView;
    id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = v12;
    v13 = @"CONTROL_CENTER_GAME_MODE_STATE_FORCED_ON";
LABEL_6:
    v9 = [v12 localizedStringForKey:v13 value:&stru_1F2F34F20 table:@"ControlCenterUI"];
    [(CCUIControlTemplateView *)templateView setSubtitle:v9];
    uint64_t v10 = 1;
LABEL_7:

    buttonViewController = self->_buttonViewController;
    [(CCUILabeledRoundButtonViewController *)buttonViewController setUseAlternateBackground:v10];
    return;
  }
  if (!v4)
  {
    v5 = self->_templateView;
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = v6;
    v8 = @"CONTROL_CENTER_GAME_MODE_STATE_FORCED_OFF";
LABEL_4:
    v9 = [v6 localizedStringForKey:v8 value:&stru_1F2F34F20 table:@"ControlCenterUI"];
    [(CCUIControlTemplateView *)v5 setSubtitle:v9];
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  switch(self->_state)
  {
    case 0:
      v5 = self->_templateView;
      v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"CONTROL_CENTER_GAME_MODE_STATE_UNAVAILABLE";
      goto LABEL_4;
    case 1:
      v5 = self->_templateView;
      v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"CONTROL_CENTER_GAME_MODE_STATE_OFF";
      goto LABEL_4;
    case 2:
      templateView = self->_templateView;
      id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v7 = v12;
      v13 = @"CONTROL_CENTER_GAME_MODE_STATE_ON";
      goto LABEL_6;
    case 3:
      templateView = self->_templateView;
      id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v7 = v12;
      v13 = @"CONTROL_CENTER_GAME_MODE_STATE_REQUIRED";
      goto LABEL_6;
    case 4:
      v5 = self->_templateView;
      v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"CONTROL_CENTER_GAME_MODE_STATE_UNKNOWN";
      goto LABEL_4;
    default:
      return;
  }
}

- (void)setGameModeActivityDataProvider:(id)a3
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  templateView = self->_templateView;
  -[CCUIGameModeControlsView convertPoint:toView:](self, "convertPoint:toView:", templateView, x, y);
  v9 = -[CCUIControlTemplateView hitTest:withEvent:](templateView, "hitTest:withEvent:", v7);

  if (v9)
  {
    uint64_t v10 = self->_templateView;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CCUIGameModeControlsView;
    -[CCUIGameModeControlsView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    uint64_t v10 = (CCUIControlTemplateView *)objc_claimAutoreleasedReturnValue();
  }
  id v11 = v10;

  return v11;
}

- (BOOL)performPrimaryActionForControlTemplateView:(id)a3
{
  id v4 = a3;
  state = (void *)self->_state;
  BOOL v6 = 0;
  int64_t v7 = 2;
  switch((unint64_t)state)
  {
    case 0uLL:
    case 3uLL:
    case 4uLL:
      goto LABEL_7;
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      int64_t v7 = 1;
LABEL_3:
      self->_state = v7;
      goto LABEL_4;
    default:
LABEL_4:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_gameModeActivityDataProvider);

      if (WeakRetained)
      {
        objc_initWeak(&location, self);
        id v9 = objc_loadWeakRetained((id *)&self->_gameModeActivityDataProvider);
        int64_t v10 = self->_state;
        bundleIdentifier = self->_bundleIdentifier;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __71__CCUIGameModeControlsView_performPrimaryActionForControlTemplateView___block_invoke;
        v13[3] = &unk_1E6A8A340;
        objc_copyWeak(v14, &location);
        v14[1] = state;
        [v9 setWithState:v10 forBundleIdentifier:bundleIdentifier callback:v13];

        objc_destroyWeak(v14);
        objc_destroyWeak(&location);
      }
      [(CCUIGameModeControlsView *)self updateState];
      BOOL v6 = 1;
LABEL_7:

      return v6;
  }
}

void __71__CCUIGameModeControlsView_performPrimaryActionForControlTemplateView___block_invoke(uint64_t a1, void *a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CCUIGameModeControlsView_performPrimaryActionForControlTemplateView___block_invoke_2;
  block[3] = &unk_1E6A8A318;
  objc_copyWeak(v6, (id *)(a1 + 32));
  id v4 = *(void **)(a1 + 40);
  v6[1] = a2;
  v6[2] = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v6);
}

void __71__CCUIGameModeControlsView_performPrimaryActionForControlTemplateView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3 == 5) {
      uint64_t v3 = *(void *)(a1 + 48);
    }
    WeakRetained[55] = v3;
    id v4 = WeakRetained;
    [WeakRetained updateState];
    id WeakRetained = v4;
  }
}

- (void)setBlurRadius:(double)a3
{
  id v5 = [(CCUIGameModeControlsView *)self layer];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (CGRect)cachedExpandedRect
{
  double x = self->cachedExpandedRect.origin.x;
  double y = self->cachedExpandedRect.origin.y;
  double width = self->cachedExpandedRect.size.width;
  double height = self->cachedExpandedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->cachedExpandedRect = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)gameModeActivityDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gameModeActivityDataProvider);

  return (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *)WeakRetained;
}

- (CCUIControlTemplateView)templateView
{
  return self->_templateView;
}

- (void)setTemplateView:(id)a3
{
}

- (CCUILabeledRoundButtonViewController)buttonViewController
{
  return self->_buttonViewController;
}

- (void)setButtonViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonViewController, 0);
  objc_storeStrong((id *)&self->_templateView, 0);
  objc_destroyWeak((id *)&self->_gameModeActivityDataProvider);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end