@interface AXUICameraButtonPracticeCell
- (AXUICameraButtonPracticeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5;
- (void)_updatePackageState:(unint64_t)a3;
@end

@implementation AXUICameraButtonPracticeCell

- (AXUICameraButtonPracticeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v66[4] = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)AXUICameraButtonPracticeCell;
  v5 = [(PSTableCell *)&v57 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 URLForResource:@"Simulator-D94" withExtension:@"ca"];

    v56 = (void *)v7;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F4F8A0]) initWithURL:v7];
    packageView = v5->_packageView;
    v5->_packageView = (BSUICAPackageView *)v8;

    uint64_t v10 = *MEMORY[0x1E4F39EA8];
    v11 = [(BSUICAPackageView *)v5->_packageView layer];
    [v11 setCornerCurve:v10];

    v12 = [(BSUICAPackageView *)v5->_packageView layer];
    [v12 setCornerRadius:20.0];

    v13 = [(BSUICAPackageView *)v5->_packageView layer];
    [v13 setMasksToBounds:1];

    v14 = [(AXUICameraButtonPracticeCell *)v5 contentView];
    [v14 addSubview:v5->_packageView];

    [(BSUICAPackageView *)v5->_packageView setContentMode:2];
    [(BSUICAPackageView *)v5->_packageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v47 = (void *)MEMORY[0x1E4F28DC8];
    v52 = [(BSUICAPackageView *)v5->_packageView topAnchor];
    v54 = [(AXUICameraButtonPracticeCell *)v5 contentView];
    v51 = [v54 topAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v66[0] = v50;
    v48 = [(BSUICAPackageView *)v5->_packageView bottomAnchor];
    v49 = [(AXUICameraButtonPracticeCell *)v5 contentView];
    v46 = [v49 bottomAnchor];
    v15 = [v48 constraintEqualToAnchor:v46];
    v66[1] = v15;
    v16 = [(BSUICAPackageView *)v5->_packageView centerXAnchor];
    v17 = [(AXUICameraButtonPracticeCell *)v5 contentView];
    v18 = [v17 centerXAnchor];
    v19 = [v16 constraintEqualToAnchor:v18];
    v66[2] = v19;
    v20 = [(BSUICAPackageView *)v5->_packageView widthAnchor];
    v21 = [v20 constraintEqualToConstant:362.0];
    v66[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:4];
    [v47 activateConstraints:v22];

    v55 = [MEMORY[0x1E4FB2238] _cameraCaptureShutterConfigurationWithOptionsProvider:0];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB2240]) initWithConfigurations:v55 delegate:v5];
    interaction = v5->_interaction;
    v5->_interaction = (_UIPhysicalButtonInteraction *)v23;

    [(BSUICAPackageView *)v5->_packageView addInteraction:v5->_interaction];
    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
    activeStages = v5->_activeStages;
    v5->_activeStages = (NSMutableArray *)v25;

    v27 = (void *)CFPreferencesCopyAppValue(@"systemOverlay.halfPressHapticVolume", @"com.apple.camera");
    objc_opt_class();
    v53 = v27;
    if (objc_opt_isKindOfClass())
    {
      [v27 floatValue];
      double v28 = fmax(fmin(v29, 1.0), 0.0);
      float v30 = v28;
    }
    else
    {
      float v30 = 0.38;
    }
    v31 = (void *)MEMORY[0x1E4FB20B0];
    v64[0] = @"type";
    v64[1] = @"eventType";
    v65[0] = @"custom";
    v65[1] = &unk_1F1F20120;
    v64[2] = @"hapticParameters";
    v62 = @"volume";
    *(float *)&double v28 = v30;
    v32 = [NSNumber numberWithFloat:v28];
    v63 = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    v65[2] = v33;
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
    v35 = [v31 feedbackWithDictionaryRepresentation:v34];

    v36 = (void *)MEMORY[0x1E4FB20B0];
    v60[0] = @"type";
    v60[1] = @"eventType";
    v61[0] = @"custom";
    v61[1] = &unk_1F1F20120;
    v60[2] = @"hapticParameters";
    v58 = @"volume";
    v37 = [NSNumber numberWithDouble:v30 * 0.6];
    v59 = v37;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    v61[2] = v38;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
    v40 = [v36 feedbackWithDictionaryRepresentation:v39];

    v41 = [MEMORY[0x1E4FB2010] defaultConfiguration];
    v42 = [v41 tweakedConfigurationForCaller:v5 usage:@"cameraOverlayHalfPress"];

    [v42 setInteractionStartedFeedback:v35];
    [v42 setInteractionEndedFeedback:v40];
    uint64_t v43 = [objc_alloc(MEMORY[0x1E4FB2008]) initWithConfiguration:v42];
    halfPressFeedbackGenerator = v5->_halfPressFeedbackGenerator;
    v5->_halfPressFeedbackGenerator = (_UIButtonFeedbackGenerator *)v43;

    [(_UIButtonFeedbackGenerator *)v5->_halfPressFeedbackGenerator _setOutputMode:5];
    -[AXUICameraButtonPracticeCell setSeparatorInset:](v5, "setSeparatorInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }
  return v5;
}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  id v11 = a4;
  if ([v11 _stagePhase])
  {
    if ([v11 _stagePhase] != 2) {
      goto LABEL_6;
    }
    activeStages = self->_activeStages;
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "_stage"));
    [(NSMutableArray *)activeStages removeObject:v7];
  }
  else
  {
    uint64_t v8 = self->_activeStages;
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "_stage"));
    [(NSMutableArray *)v8 addObject:v7];
  }

LABEL_6:
  if ([(NSMutableArray *)self->_activeStages count])
  {
    v9 = [(NSMutableArray *)self->_activeStages lastObject];
    uint64_t v10 = [v9 unsignedIntegerValue];
  }
  else
  {
    uint64_t v10 = 1;
  }
  [(AXUICameraButtonPracticeCell *)self _updatePackageState:v10];
}

- (void)_updatePackageState:(unint64_t)a3
{
  if (a3 < 2)
  {
    packageView = self->_packageView;
    v6 = @"Idle";
  }
  else
  {
    if (a3 - 2 < 2)
    {
      [(BSUICAPackageView *)self->_packageView setState:@"LightPress" animated:1];
      if (([(_UIButtonFeedbackGenerator *)self->_halfPressFeedbackGenerator isActive] & 1) == 0)
      {
        [(_UIButtonFeedbackGenerator *)self->_halfPressFeedbackGenerator prepare];
        halfPressFeedbackGenerator = self->_halfPressFeedbackGenerator;
        [(_UIButtonFeedbackGenerator *)halfPressFeedbackGenerator userInteractionStarted];
      }
      return;
    }
    if (a3 != 4) {
      return;
    }
    packageView = self->_packageView;
    v6 = @"Press";
  }
  [(BSUICAPackageView *)packageView setState:v6 animated:1];
  if ([(_UIButtonFeedbackGenerator *)self->_halfPressFeedbackGenerator isActive])
  {
    uint64_t v7 = self->_halfPressFeedbackGenerator;
    [(_UIButtonFeedbackGenerator *)v7 userInteractionEnded];
  }
}

- (id)accessibilityLabel
{
  return AXUILocalizedStringForKeyWithTable(@"SENSITIVITY_TESTER_ACCESSIBILITY_LABEL", @"Accessibility-D93");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB2558];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_halfPressFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_activeStages, 0);
  objc_storeStrong((id *)&self->_packageState, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end