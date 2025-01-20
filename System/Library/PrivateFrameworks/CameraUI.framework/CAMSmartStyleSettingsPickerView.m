@interface CAMSmartStyleSettingsPickerView
- (BOOL)isWaitingOnLoading;
- (CAMSmartStyleSettingsPickerView)initWithPHPickerView:(id)a3;
- (UIButton)continueButton;
- (UIButton)deselectAllButton;
- (UIView)_pickerOverlayDisablingView;
- (UIView)_pickerView;
- (void)_setConstraints;
- (void)_updateContinueButtonConfiguration;
- (void)_updateDeselectAllButtonConfiguration;
- (void)setWaitingOnLoading:(BOOL)a3;
- (void)set_pickerView:(id)a3;
@end

@implementation CAMSmartStyleSettingsPickerView

- (CAMSmartStyleSettingsPickerView)initWithPHPickerView:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CAMSmartStyleSettingsPickerView;
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  v10 = -[CAMSmartStyleSettingsPickerView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x263F001A8], v7, v8, v9);
  if (v10)
  {
    v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(CAMSmartStyleSettingsPickerView *)v10 setBackgroundColor:v11];

    objc_storeStrong((id *)&v10->__pickerView, a3);
    [(CAMSmartStyleSettingsPickerView *)v10 addSubview:v5];
    v12 = (void *)MEMORY[0x263F824E8];
    v13 = +[CAMSmartStyleSettingsView continueButtonConfiguration];
    uint64_t v14 = [v12 buttonWithConfiguration:v13 primaryAction:0];
    continueButton = v10->_continueButton;
    v10->_continueButton = (UIButton *)v14;

    [(CAMSmartStyleSettingsPickerView *)v10 _updateContinueButtonConfiguration];
    [(CAMSmartStyleSettingsPickerView *)v10 addSubview:v10->_continueButton];
    v16 = (void *)MEMORY[0x263F824E8];
    v17 = +[CAMSmartStyleSettingsView showAssetsButtonConfiguration];
    uint64_t v18 = [v16 buttonWithConfiguration:v17 primaryAction:0];
    deselectAllButton = v10->_deselectAllButton;
    v10->_deselectAllButton = (UIButton *)v18;

    [(CAMSmartStyleSettingsPickerView *)v10 _updateDeselectAllButtonConfiguration];
    [(CAMSmartStyleSettingsPickerView *)v10 addSubview:v10->_deselectAllButton];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v6, v7, v8, v9);
    pickerOverlayDisablingView = v10->__pickerOverlayDisablingView;
    v10->__pickerOverlayDisablingView = (UIView *)v20;

    v22 = [MEMORY[0x263F825C8] systemBackgroundColor];
    v23 = [v22 colorWithAlphaComponent:0.3];
    [(UIView *)v10->__pickerOverlayDisablingView setBackgroundColor:v23];

    [(UIView *)v10->__pickerOverlayDisablingView setAlpha:0.0];
    [(CAMSmartStyleSettingsPickerView *)v10 addSubview:v10->__pickerOverlayDisablingView];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v24 = [(CAMSmartStyleSettingsPickerView *)v10 subviews];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * i) setTranslatesAutoresizingMaskIntoConstraints:0];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v26);
    }

    [(CAMSmartStyleSettingsPickerView *)v10 _setConstraints];
    v29 = v10;
  }

  return v10;
}

- (void)_setConstraints
{
  v59[14] = *MEMORY[0x263EF8340];
  v3 = [(CAMSmartStyleSettingsPickerView *)self _pickerView];
  v4 = [(CAMSmartStyleSettingsPickerView *)self _pickerOverlayDisablingView];
  id v5 = [(CAMSmartStyleSettingsPickerView *)self continueButton];
  double v6 = [(CAMSmartStyleSettingsPickerView *)self deselectAllButton];
  v36 = (void *)MEMORY[0x263F08938];
  v57 = [v3 topAnchor];
  v58 = [(CAMSmartStyleSettingsPickerView *)self safeAreaLayoutGuide];
  v56 = [v58 topAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v59[0] = v55;
  v53 = [v3 bottomAnchor];
  v52 = [v6 topAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:-20.0];
  v59[1] = v51;
  v54 = v3;
  v50 = [v3 leadingAnchor];
  v49 = [(CAMSmartStyleSettingsPickerView *)self leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v59[2] = v48;
  v47 = [v3 trailingAnchor];
  v46 = [(CAMSmartStyleSettingsPickerView *)self trailingAnchor];
  v44 = [v47 constraintEqualToAnchor:v46];
  v59[3] = v44;
  v42 = [v4 topAnchor];
  v43 = [(CAMSmartStyleSettingsPickerView *)self safeAreaLayoutGuide];
  v41 = [v43 topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v59[4] = v40;
  v39 = [v4 bottomAnchor];
  v38 = [(CAMSmartStyleSettingsPickerView *)self bottomAnchor];
  objc_super v35 = [v39 constraintEqualToAnchor:v38];
  v59[5] = v35;
  v45 = v4;
  long long v34 = [v4 leadingAnchor];
  long long v33 = [(CAMSmartStyleSettingsPickerView *)self leadingAnchor];
  long long v32 = [v34 constraintEqualToAnchor:v33];
  v59[6] = v32;
  long long v31 = [v4 trailingAnchor];
  v30 = [(CAMSmartStyleSettingsPickerView *)self trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v59[7] = v29;
  uint64_t v26 = [v5 bottomAnchor];
  uint64_t v27 = [(CAMSmartStyleSettingsPickerView *)self safeAreaLayoutGuide];
  uint64_t v25 = [v27 bottomAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:-14.0];
  v59[8] = v24;
  uint64_t v37 = v5;
  v23 = [v5 leadingAnchor];
  v22 = [(CAMSmartStyleSettingsPickerView *)self leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22 constant:28.0];
  v59[9] = v21;
  uint64_t v20 = [v5 trailingAnchor];
  v19 = [(CAMSmartStyleSettingsPickerView *)self trailingAnchor];
  uint64_t v18 = [v20 constraintEqualToAnchor:v19 constant:-28.0];
  v59[10] = v18;
  v17 = [v6 bottomAnchor];
  double v7 = [(CAMSmartStyleSettingsPickerView *)self continueButton];
  double v8 = [v7 topAnchor];
  double v9 = [v17 constraintEqualToAnchor:v8 constant:-14.0];
  v59[11] = v9;
  v28 = v6;
  v10 = [v6 leadingAnchor];
  v11 = [(CAMSmartStyleSettingsPickerView *)self leadingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:28.0];
  v59[12] = v12;
  v13 = [v6 trailingAnchor];
  uint64_t v14 = [(CAMSmartStyleSettingsPickerView *)self trailingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:-28.0];
  v59[13] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:14];
  [v36 activateConstraints:v16];
}

- (void)setWaitingOnLoading:(BOOL)a3
{
  if (self->_waitingOnLoading != a3)
  {
    self->_waitingOnLoading = a3;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __55__CAMSmartStyleSettingsPickerView_setWaitingOnLoading___block_invoke;
    v4[3] = &unk_263FA02A8;
    v4[4] = self;
    BOOL v5 = a3;
    +[CAMView animateIfNeededWithDuration:v4 animations:0.25];
    [(CAMSmartStyleSettingsPickerView *)self _updateContinueButtonConfiguration];
  }
}

uint64_t __55__CAMSmartStyleSettingsPickerView_setWaitingOnLoading___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:v1];
}

- (void)_updateContinueButtonConfiguration
{
  BOOL v3 = [(CAMSmartStyleSettingsPickerView *)self isWaitingOnLoading];
  if (v3) {
    v4 = @"SMART_STYLES_SETTINGS_LOADING";
  }
  else {
    v4 = @"SMART_STYLES_SETTINGS_CONTINUE";
  }
  continueButton = self->_continueButton;
  double v6 = CAMLocalizedFrameworkString(v4, 0);
  [(UIButton *)continueButton setTitle:v6 forState:0];

  double v7 = [(UIButton *)self->_continueButton configuration];
  id v8 = (id)[v7 copy];

  [v8 setShowsActivityIndicator:v3];
  [v8 setImagePlacement:8];
  [v8 setImagePadding:8.0];
  [v8 setTitleAlignment:2];
  [(UIButton *)self->_continueButton setConfiguration:v8];
  [(UIButton *)self->_continueButton setNeedsUpdateConfiguration];
}

- (void)_updateDeselectAllButtonConfiguration
{
  id v3 = [(CAMSmartStyleSettingsPickerView *)self deselectAllButton];
  v2 = CAMLocalizedFrameworkString(@"SMART_STYLES_SETTINGS_DESELECT_ALL", 0);
  [v3 setTitle:v2 forState:0];

  [v3 setNeedsUpdateConfiguration];
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (UIButton)deselectAllButton
{
  return self->_deselectAllButton;
}

- (BOOL)isWaitingOnLoading
{
  return self->_waitingOnLoading;
}

- (UIView)_pickerView
{
  return self->__pickerView;
}

- (void)set_pickerView:(id)a3
{
}

- (UIView)_pickerOverlayDisablingView
{
  return self->__pickerOverlayDisablingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pickerOverlayDisablingView, 0);
  objc_storeStrong((id *)&self->__pickerView, 0);
  objc_storeStrong((id *)&self->_deselectAllButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

@end