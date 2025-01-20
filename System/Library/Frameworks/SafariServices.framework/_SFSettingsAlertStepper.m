@interface _SFSettingsAlertStepper
+ (id)stepperForBrowsingAssistant;
- (_SFSettingsAlertStepper)initWithFrame:(CGRect)a3;
- (id)_button:(int64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)initUsingResetButton:(BOOL)a3 usingTopSeparator:(BOOL)a4;
- (int64_t)value;
- (void)_decrementTapped:(id)a3;
- (void)_incrementTapped:(id)a3;
- (void)_resetTapped:(id)a3;
- (void)setEnabled:(BOOL)a3 forButton:(int64_t)a4;
- (void)setImage:(id)a3 forButton:(int64_t)a4;
- (void)setText:(id)a3 forButton:(int64_t)a4;
@end

@implementation _SFSettingsAlertStepper

- (_SFSettingsAlertStepper)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(_SFSettingsAlertStepper *)self initUsingResetButton:1 usingTopSeparator:0];
  v8 = v7;
  if (v7)
  {
    -[_SFSettingsAlertStepper setFrame:](v7, "setFrame:", x, y, width, height);
    v9 = v8;
  }

  return v8;
}

+ (id)stepperForBrowsingAssistant
{
  v2 = (id *)[objc_alloc((Class)a1) initUsingResetButton:0 usingTopSeparator:0];
  v3 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2998]];
  v4 = [v2[63] imageView];
  [v4 setPreferredSymbolConfiguration:v3];

  v5 = [v2[62] imageView];
  [v5 setPreferredSymbolConfiguration:v3];

  [v2 setDefaultBackgroundMode:0];

  return v2;
}

- (id)initUsingResetButton:(BOOL)a3 usingTopSeparator:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v78[7] = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)_SFSettingsAlertStepper;
  v6 = -[_SFSettingsAlertControl initWithFrame:](&v75, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    if (v4) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 5;
    }
    [(_SFSettingsAlertControl *)v6 setDefaultBackgroundMode:v8];
    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(_SFSettingsAlertStepper *)v7 setTintColor:v9];

    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __66___SFSettingsAlertStepper_initUsingResetButton_usingTopSeparator___block_invoke;
    v73[3] = &unk_1E5C76898;
    v71 = v7;
    v10 = v7;
    v74 = v10;
    uint64_t v11 = MEMORY[0x1AD0C36A0](v73);
    uint64_t v12 = (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v11, sel__decrementTapped_, 6);
    id v13 = v10[63];
    v10[63] = (id)v12;

    [v10[63] setAccessibilityIdentifier:@"Decrement"];
    uint64_t v14 = (*(void (**)(uint64_t, char *, void))(v11 + 16))(v11, sel__incrementTapped_, 0);
    id v15 = v10[62];
    v10[62] = (id)v14;

    [v10[62] setAccessibilityIdentifier:@"Increment"];
    BOOL v68 = v5;
    if (v5)
    {
      uint64_t v16 = (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v11, sel__resetTapped_, 6);
      id v17 = v10[64];
      v10[64] = (id)v16;

      [v10[64] setAccessibilityIdentifier:@"Reset"];
    }
    v70 = (void *)v11;
    v18 = [v10[62] widthAnchor];
    v19 = [v10[63] widthAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];

    LODWORD(v21) = 1144733696;
    [v20 setPriority:v21];
    _SFOnePixel();
    double v23 = v22;
    if ([MEMORY[0x1E4F98AF8] isBrowsingAssistantEnabled]) {
      double v23 = 0.0;
    }
    v55 = (void *)MEMORY[0x1E4F28DC8];
    v65 = [v10[63] leadingAnchor];
    v63 = [v10 leadingAnchor];
    v61 = [v65 constraintEqualToAnchor:v63];
    v78[0] = v61;
    v59 = [v10[63] topAnchor];
    v58 = [v10 topAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v78[1] = v57;
    v56 = [v10[63] bottomAnchor];
    v54 = [v10 bottomAnchor];
    double v24 = -v23;
    v53 = [v56 constraintEqualToAnchor:v54 constant:v24];
    v78[2] = v53;
    v52 = [v10[62] topAnchor];
    v25 = [v10 topAnchor];
    v26 = [v52 constraintEqualToAnchor:v25];
    v78[3] = v26;
    v27 = [v10[62] bottomAnchor];
    v28 = [v10 bottomAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:v24];
    v78[4] = v29;
    v30 = [v10[62] trailingAnchor];
    v31 = [v10 trailingAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    v78[5] = v32;
    v78[6] = v20;
    v72 = v20;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:7];
    [v55 activateConstraints:v33];

    if (v68)
    {
      v34 = [v10[64] widthAnchor];
      v35 = [v10[62] widthAnchor];
      v36 = [v34 constraintEqualToAnchor:v35];

      [v72 priority];
      *(float *)&double v38 = v37 + -1.0;
      [v36 setPriority:v38];
      v64 = (void *)MEMORY[0x1E4F28DC8];
      v69 = [v10[64] leadingAnchor];
      v39 = [v10[63] trailingAnchor];
      v40 = [v69 constraintEqualToAnchor:v39];
      v77[0] = v40;
      v67 = [v10[64] topAnchor];
      v66 = [v10 topAnchor];
      v62 = [v67 constraintEqualToAnchor:v66];
      v77[1] = v62;
      v60 = [v10[64] bottomAnchor];
      v41 = [v10 bottomAnchor];
      _SFOnePixel();
      v43 = [v60 constraintEqualToAnchor:v41 constant:-v42];
      v77[2] = v43;
      v44 = [v10[62] leadingAnchor];
      v45 = [v10[64] trailingAnchor];
      v46 = [v44 constraintEqualToAnchor:v45];
      v77[3] = v46;
      v77[4] = v36;
      v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:5];
      [v64 activateConstraints:v47];

      v48 = v69;
    }
    else
    {
      v49 = (void *)MEMORY[0x1E4F28DC8];
      v36 = [v10[62] leadingAnchor];
      v48 = [v10[63] trailingAnchor];
      v39 = [v36 constraintEqualToAnchor:v48];
      v76 = v39;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
      [v49 activateConstraints:v40];
    }

    v50 = v10;
    v7 = v71;
  }

  return v7;
}

- (void)_incrementTapped:(id)a3
{
  self->_value = 0;
  [(_SFSettingsAlertStepper *)self sendActionsForControlEvents:4096];
}

- (void)_decrementTapped:(id)a3
{
  self->_value = 1;
  [(_SFSettingsAlertStepper *)self sendActionsForControlEvents:4096];
}

- (void)_resetTapped:(id)a3
{
  self->_value = 2;
  [(_SFSettingsAlertStepper *)self sendActionsForControlEvents:4096];
}

- (void)setImage:(id)a3 forButton:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(_SFSettingsAlertStepper *)self _button:a4];
  [v7 setImage:v6];
}

- (void)setText:(id)a3 forButton:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(_SFSettingsAlertStepper *)self _button:a4];
  [v7 setText:v6];
}

- (void)setEnabled:(BOOL)a3 forButton:(int64_t)a4
{
  BOOL v4 = a3;
  id v5 = [(_SFSettingsAlertStepper *)self _button:a4];
  [v5 setEnabled:v4];
}

- (id)_button:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    a2 = (SEL)*(id *)((char *)&self->super.super.super.super.super.isa + *off_1E5C768B8[a3]);
  }
  return (id)(id)a2;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_SFSettingsAlertStepper;
  -[_SFSettingsAlertStepper hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (_SFSettingsAlertStepper *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (int64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong((id *)&self->_decrementButton, 0);

  objc_storeStrong((id *)&self->_incrementButton, 0);
}

@end