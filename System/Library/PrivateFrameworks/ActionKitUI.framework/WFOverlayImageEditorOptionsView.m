@interface WFOverlayImageEditorOptionsView
- (UIButton)cancelButton;
- (UIButton)nextButton;
- (UILabel)nextLabel;
- (UIView)topBorder;
- (WFOverlayImageEditorOptionButton)opacityButton;
- (WFOverlayImageEditorOptionButton)resetButton;
- (WFOverlayImageEditorOptionButton)rotationButton;
- (WFOverlayImageEditorOptionsView)init;
- (WFOverlayImageEditorOptionsViewDelegate)delegate;
- (void)didTapCancelButton;
- (void)didTapNextButton;
- (void)didTapOpacityButton;
- (void)didTapResetButton;
- (void)didTapRotationButton;
- (void)setDelegate:(id)a3;
@end

@implementation WFOverlayImageEditorOptionsView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextLabel);
  objc_destroyWeak((id *)&self->_topBorder);
  objc_destroyWeak((id *)&self->_opacityButton);
  objc_destroyWeak((id *)&self->_resetButton);
  objc_destroyWeak((id *)&self->_rotationButton);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_nextButton);
  objc_destroyWeak((id *)&self->_cancelButton);
}

- (UILabel)nextLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextLabel);
  return (UILabel *)WeakRetained;
}

- (UIView)topBorder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topBorder);
  return (UIView *)WeakRetained;
}

- (WFOverlayImageEditorOptionButton)opacityButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_opacityButton);
  return (WFOverlayImageEditorOptionButton *)WeakRetained;
}

- (WFOverlayImageEditorOptionButton)resetButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resetButton);
  return (WFOverlayImageEditorOptionButton *)WeakRetained;
}

- (WFOverlayImageEditorOptionButton)rotationButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotationButton);
  return (WFOverlayImageEditorOptionButton *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFOverlayImageEditorOptionsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFOverlayImageEditorOptionsViewDelegate *)WeakRetained;
}

- (UIButton)nextButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextButton);
  return (UIButton *)WeakRetained;
}

- (UIButton)cancelButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancelButton);
  return (UIButton *)WeakRetained;
}

- (void)didTapNextButton
{
  v3 = [(WFOverlayImageEditorOptionsView *)self nextButton];
  [v3 setEnabled:0];

  id v4 = [(WFOverlayImageEditorOptionsView *)self delegate];
  [v4 finishEditingImage];
}

- (void)didTapCancelButton
{
  id v2 = [(WFOverlayImageEditorOptionsView *)self delegate];
  [v2 cancelEditingImage];
}

- (void)didTapOpacityButton
{
  v3 = [(WFOverlayImageEditorOptionsView *)self opacityButton];
  uint64_t v4 = [v3 isSelected] ^ 1;
  v5 = [(WFOverlayImageEditorOptionsView *)self opacityButton];
  [v5 setSelected:v4];

  id v7 = [(WFOverlayImageEditorOptionsView *)self delegate];
  v6 = [(WFOverlayImageEditorOptionsView *)self opacityButton];
  objc_msgSend(v7, "setOpacitySliderVisible:", objc_msgSend(v6, "isSelected"));
}

- (void)didTapRotationButton
{
  v3 = [(WFOverlayImageEditorOptionsView *)self rotationButton];
  uint64_t v4 = [v3 isSelected] ^ 1;
  v5 = [(WFOverlayImageEditorOptionsView *)self rotationButton];
  [v5 setSelected:v4];

  id v7 = [(WFOverlayImageEditorOptionsView *)self delegate];
  v6 = [(WFOverlayImageEditorOptionsView *)self rotationButton];
  objc_msgSend(v7, "setRotationEnabled:", objc_msgSend(v6, "isSelected") ^ 1);
}

- (void)didTapResetButton
{
  id v2 = [(WFOverlayImageEditorOptionsView *)self delegate];
  [v2 resetOverlayImageViewTransformations];
}

- (WFOverlayImageEditorOptionsView)init
{
  v68[22] = *MEMORY[0x263EF8340];
  v67.receiver = self;
  v67.super_class = (Class)WFOverlayImageEditorOptionsView;
  id v2 = [(WFOverlayImageEditorOptionsView *)&v67 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v4 = WFLocalizedString(@"Rotation");
    [v3 setTitle:v4 forState:0];

    v5 = [MEMORY[0x263F85308] actionKitImageNamed:@"OverlayImageRotationLockIcon"];
    v6 = [v5 UIImage];
    [v3 setImage:v6 forState:4];

    id v7 = [MEMORY[0x263F85308] actionKitImageNamed:@"OverlayImageRotationUnlockIcon"];
    v8 = [v7 UIImage];
    [v3 setImage:v8 forState:0];

    [v3 addTarget:v2 action:sel_didTapRotationButton forControlEvents:64];
    [(WFOverlayImageEditorOptionsView *)v2 addSubview:v3];
    v9 = v3;
    objc_storeWeak((id *)&v2->_rotationButton, v3);
    v10 = objc_opt_new();
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = WFLocalizedString(@"Reset");
    [v10 setTitle:v11 forState:0];

    v12 = [MEMORY[0x263F85308] actionKitImageNamed:@"OverlayImageResetIcon"];
    v13 = [v12 UIImage];
    [v10 setImage:v13 forState:0];

    [v10 addTarget:v2 action:sel_didTapResetButton forControlEvents:64];
    [(WFOverlayImageEditorOptionsView *)v2 addSubview:v10];
    objc_storeWeak((id *)&v2->_resetButton, v10);
    v14 = objc_opt_new();
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = WFLocalizedString(@"Opacity");
    [v14 setTitle:v15 forState:0];

    v16 = [MEMORY[0x263F85308] actionKitImageNamed:@"OverlayImageOpacityIcon"];
    v17 = [v16 UIImage];
    [v14 setImage:v17 forState:0];

    v18 = [MEMORY[0x263F85308] actionKitImageNamed:@"OverlayImageOpacityIconSelected"];
    v19 = [v18 UIImage];
    [v14 setImage:v19 forState:4];

    [v14 addTarget:v2 action:sel_didTapOpacityButton forControlEvents:64];
    [(WFOverlayImageEditorOptionsView *)v2 addSubview:v14];
    objc_storeWeak((id *)&v2->_opacityButton, v14);
    v20 = [MEMORY[0x263F824E8] buttonWithType:1];
    v21 = WFLocalizedString(@"Cancel");
    [v20 setTitle:v21 forState:0];

    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [MEMORY[0x263F825C8] whiteColor];
    [v20 setTitleColor:v22 forState:0];

    v23 = [v20 titleLabel];
    v24 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [v23 setFont:v24];

    [v20 addTarget:v2 action:sel_didTapCancelButton forControlEvents:64];
    [(WFOverlayImageEditorOptionsView *)v2 addSubview:v20];
    objc_storeWeak((id *)&v2->_cancelButton, v20);
    v25 = [MEMORY[0x263F824E8] buttonWithType:1];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = WFLocalizedString(@"Next");
    [v25 setTitle:v26 forState:0];

    v27 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.756862745 blue:0.0274509804 alpha:1.0];
    [v25 setTitleColor:v27 forState:0];

    v28 = [v25 titleLabel];
    v29 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
    [v28 setFont:v29];

    [v25 addTarget:v2 action:sel_didTapNextButton forControlEvents:64];
    [(WFOverlayImageEditorOptionsView *)v2 addSubview:v25];
    objc_storeWeak((id *)&v2->_nextButton, v25);
    id v30 = objc_alloc_init(MEMORY[0x263F82E00]);
    v31 = [MEMORY[0x263F825C8] colorWithRed:0.0705882353 green:0.117647059 blue:0.141176471 alpha:1.0];
    [v30 setBackgroundColor:v31];

    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFOverlayImageEditorOptionsView *)v2 addSubview:v30];
    objc_storeWeak((id *)&v2->_topBorder, v30);
    uint64_t v32 = [(WFOverlayImageEditorOptionsView *)v2 safeAreaLayoutGuide];
    v59 = (void *)MEMORY[0x263F08938];
    v62 = v30;
    v65 = [MEMORY[0x263F08938] constraintWithItem:v30 attribute:3 relatedBy:0 toItem:v2 attribute:3 multiplier:1.0 constant:0.0];
    v68[0] = v65;
    v33 = (void *)MEMORY[0x263F08938];
    v64 = [MEMORY[0x263F82B60] mainScreen];
    [v64 scale];
    v63 = [v33 constraintWithItem:v30 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0 / v34];
    v68[1] = v63;
    v61 = [MEMORY[0x263F08938] constraintWithItem:v30 attribute:1 relatedBy:0 toItem:v2 attribute:1 multiplier:1.0 constant:0.0];
    v68[2] = v61;
    v60 = [MEMORY[0x263F08938] constraintWithItem:v30 attribute:2 relatedBy:0 toItem:v2 attribute:2 multiplier:1.0 constant:0.0];
    v68[3] = v60;
    v58 = [MEMORY[0x263F08938] constraintWithItem:v14 attribute:3 relatedBy:1 toItem:v2 attribute:3 multiplier:1.0 constant:7.0];
    v68[4] = v58;
    v57 = [MEMORY[0x263F08938] constraintWithItem:v10 attribute:3 relatedBy:0 toItem:v14 attribute:3 multiplier:1.0 constant:0.0];
    v68[5] = v57;
    v56 = [MEMORY[0x263F08938] constraintWithItem:v9 attribute:3 relatedBy:0 toItem:v14 attribute:3 multiplier:1.0 constant:0.0];
    v68[6] = v56;
    v55 = [MEMORY[0x263F08938] constraintWithItem:v14 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:46.0];
    v68[7] = v55;
    v54 = [MEMORY[0x263F08938] constraintWithItem:v10 attribute:8 relatedBy:0 toItem:v14 attribute:8 multiplier:1.0 constant:0.0];
    v68[8] = v54;
    v66 = v9;
    v53 = [MEMORY[0x263F08938] constraintWithItem:v9 attribute:8 relatedBy:0 toItem:v14 attribute:8 multiplier:1.0 constant:0.0];
    v68[9] = v53;
    v52 = [MEMORY[0x263F08938] constraintWithItem:v14 attribute:4 relatedBy:0 toItem:v32 attribute:4 multiplier:1.0 constant:-7.0];
    v68[10] = v52;
    v51 = [MEMORY[0x263F08938] constraintWithItem:v10 attribute:4 relatedBy:0 toItem:v14 attribute:4 multiplier:1.0 constant:0.0];
    v68[11] = v51;
    v49 = [MEMORY[0x263F08938] constraintWithItem:v9 attribute:4 relatedBy:0 toItem:v14 attribute:4 multiplier:1.0 constant:0.0];
    v68[12] = v49;
    v48 = [MEMORY[0x263F08938] constraintWithItem:v20 attribute:3 relatedBy:0 toItem:v2 attribute:3 multiplier:1.0 constant:0.0];
    v68[13] = v48;
    v46 = [MEMORY[0x263F08938] constraintWithItem:v25 attribute:3 relatedBy:0 toItem:v2 attribute:3 multiplier:1.0 constant:0.0];
    v68[14] = v46;
    v50 = v20;
    v44 = [MEMORY[0x263F08938] constraintWithItem:v20 attribute:4 relatedBy:0 toItem:v32 attribute:4 multiplier:1.0 constant:0.0];
    v68[15] = v44;
    v35 = [MEMORY[0x263F08938] constraintWithItem:v25 attribute:4 relatedBy:0 toItem:v32 attribute:4 multiplier:1.0 constant:0.0];
    v68[16] = v35;
    v47 = (void *)v32;
    v36 = [MEMORY[0x263F08938] constraintWithItem:v20 attribute:5 relatedBy:0 toItem:v32 attribute:5 multiplier:1.0 constant:12.0];
    v68[17] = v36;
    v37 = [MEMORY[0x263F08938] constraintWithItem:v25 attribute:6 relatedBy:0 toItem:v32 attribute:6 multiplier:1.0 constant:-12.0];
    v68[18] = v37;
    v38 = [MEMORY[0x263F08938] constraintWithItem:v10 attribute:9 relatedBy:0 toItem:v2 attribute:9 multiplier:1.0 constant:0.0];
    v68[19] = v38;
    v45 = v10;
    v39 = [MEMORY[0x263F08938] constraintWithItem:v14 attribute:2 relatedBy:0 toItem:v10 attribute:1 multiplier:1.0 constant:-22.0];
    v68[20] = v39;
    v40 = [MEMORY[0x263F08938] constraintWithItem:v66 attribute:1 relatedBy:0 toItem:v10 attribute:2 multiplier:1.0 constant:22.0];
    v68[21] = v40;
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:22];
    [v59 activateConstraints:v41];

    v42 = v2;
  }

  return v2;
}

@end