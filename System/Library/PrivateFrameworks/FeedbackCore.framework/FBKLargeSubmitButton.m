@interface FBKLargeSubmitButton
- (FBKLargeSubmitButton)initWithTableView:(id)a3 target:(id)a4 action:(SEL)a5;
- (UIButton)button;
- (void)enableButton:(BOOL)a3;
- (void)setButton:(id)a3;
@end

@implementation FBKLargeSubmitButton

- (FBKLargeSubmitButton)initWithTableView:(id)a3 target:(id)a4 action:(SEL)a5
{
  v51[4] = *MEMORY[0x263EF8340];
  v8 = (void *)MEMORY[0x263F824F0];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 filledButtonConfiguration];
  v12 = [MEMORY[0x263F825C8] tintColor];
  [v11 setBaseBackgroundColor:v12];

  [v11 setCornerStyle:3];
  [v11 setButtonSize:3];
  v13 = [MEMORY[0x263F824E8] buttonWithConfiguration:v11 primaryAction:0];
  [(FBKLargeSubmitButton *)self setButton:v13];

  LODWORD(v13) = FBKIsInternalOrSeedBuild();
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = v14;
  if (v13) {
    v16 = @"SUBMIT_BUTTON";
  }
  else {
    v16 = @"SUBMIT_REPORT";
  }
  v17 = [v14 localizedStringForKey:v16 value:&stru_26DDF6A30 table:0];

  v18 = [(FBKLargeSubmitButton *)self button];
  [v18 setTitle:v17 forState:0];

  v19 = [(FBKLargeSubmitButton *)self button];
  [v19 sizeToFit];

  v20 = [(FBKLargeSubmitButton *)self button];
  [v20 addTarget:v9 action:a5 forControlEvents:0x2000];

  [v10 frame];
  double v22 = v21;

  v50.receiver = self;
  v50.super_class = (Class)FBKLargeSubmitButton;
  v23 = -[FBKLargeSubmitButton initWithFrame:](&v50, sel_initWithFrame_, 0.0, 0.0, v22, 94.0);
  v24 = v23;
  if (v23)
  {
    v25 = [(FBKLargeSubmitButton *)v23 button];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

    v26 = [(FBKLargeSubmitButton *)v24 button];
    [(FBKLargeSubmitButton *)v24 addSubview:v26];

    v41 = (void *)MEMORY[0x263F08938];
    v48 = [(FBKLargeSubmitButton *)v24 button];
    v46 = [v48 leftAnchor];
    v47 = [(FBKLargeSubmitButton *)v24 safeAreaLayoutGuide];
    v45 = [v47 leftAnchor];
    v44 = [v46 constraintEqualToAnchor:v45 constant:20.0];
    v51[0] = v44;
    v43 = [(FBKLargeSubmitButton *)v24 button];
    v40 = [v43 rightAnchor];
    v42 = [(FBKLargeSubmitButton *)v24 safeAreaLayoutGuide];
    v39 = [v42 rightAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:-20.0];
    v51[1] = v38;
    v37 = [(FBKLargeSubmitButton *)v24 button];
    v27 = [v37 topAnchor];
    [(FBKLargeSubmitButton *)v24 topAnchor];
    v28 = v49 = v17;
    v29 = [v27 constraintEqualToAnchor:v28 constant:22.0];
    v51[2] = v29;
    v30 = [(FBKLargeSubmitButton *)v24 button];
    v31 = [v30 bottomAnchor];
    v32 = [(FBKLargeSubmitButton *)v24 bottomAnchor];
    [v31 constraintEqualToAnchor:v32 constant:-22.0];
    v34 = v33 = v11;
    v51[3] = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:4];
    [v41 activateConstraints:v35];

    v11 = v33;
    v17 = v49;
  }
  return v24;
}

- (void)enableButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FBKLargeSubmitButton *)self button];
  [v4 setEnabled:v3];
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end