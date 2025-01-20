@interface WDBuddyFlowContinueFooterView
- (UIButton)continueButton;
- (WDBuddyFlowContinueFooterView)initWithTarget:(id)a3 action:(SEL)a4 bottomInset:(double)a5 width:(double)a6 isLastScreen:(BOOL)a7;
- (void)_updateForCurrentSizeCategory;
- (void)resetWaitingState;
- (void)setContinueButton:(id)a3;
- (void)setWaitingState;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WDBuddyFlowContinueFooterView

- (WDBuddyFlowContinueFooterView)initWithTarget:(id)a3 action:(SEL)a4 bottomInset:(double)a5 width:(double)a6 isLastScreen:(BOOL)a7
{
  BOOL v7 = a7;
  v40[3] = *MEMORY[0x263EF8340];
  id v12 = a3;
  v39.receiver = self;
  v39.super_class = (Class)WDBuddyFlowContinueFooterView;
  v13 = -[WDBuddyFlowContinueFooterView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v13)
  {
    v14 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(WDBuddyFlowContinueFooterView *)v13 setBackgroundColor:v14];

    v15 = WDBundle();
    v16 = v15;
    if (v7) {
      v17 = @"DONE";
    }
    else {
      v17 = @"NEXT";
    }
    v18 = [v15 localizedStringForKey:v17 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    objc_storeStrong((id *)&v13->_buttonText, v18);

    uint64_t v19 = [MEMORY[0x263F5B898] boldButton];
    continueTrayButton = v13->_continueTrayButton;
    v13->_continueTrayButton = (OBBoldTrayButton *)v19;

    [(OBBoldTrayButton *)v13->_continueTrayButton addTarget:v12 action:a4 forControlEvents:64];
    [(OBBoldTrayButton *)v13->_continueTrayButton setTitle:v13->_buttonText forState:0];
    [(WDBuddyFlowContinueFooterView *)v13 addSubview:v13->_continueTrayButton];
    [(UIButton *)v13->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v21) = 1148846080;
    [(UIButton *)v13->_continueButton setContentCompressionResistancePriority:1 forAxis:v21];
    HKHealthUIBuddyDirectionalEdgeInsets();
    double v23 = v22;
    double v25 = v24;
    v36 = (void *)MEMORY[0x263F08938];
    v38 = [(OBBoldTrayButton *)v13->_continueTrayButton topAnchor];
    v37 = [(WDBuddyFlowContinueFooterView *)v13 topAnchor];
    v26 = [v38 constraintEqualToAnchor:v37];
    v40[0] = v26;
    v27 = [(OBBoldTrayButton *)v13->_continueTrayButton leadingAnchor];
    v28 = [(WDBuddyFlowContinueFooterView *)v13 leadingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:v23];
    v40[1] = v29;
    v30 = [(OBBoldTrayButton *)v13->_continueTrayButton trailingAnchor];
    v31 = [(WDBuddyFlowContinueFooterView *)v13 trailingAnchor];
    [v30 constraintEqualToAnchor:v31 constant:-v25];
    v33 = id v32 = v12;
    v40[2] = v33;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:3];
    [v36 activateConstraints:v34];

    id v12 = v32;
    v13->_bottomInset = a5;
    v13->_width = a6;
    [(WDBuddyFlowContinueFooterView *)v13 _updateForCurrentSizeCategory];
  }

  return v13;
}

- (UIButton)continueButton
{
  return (UIButton *)self->_continueTrayButton;
}

- (void)_updateForCurrentSizeCategory
{
  objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D308]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 _scaledValueForValue:44.0];
  double v4 = v3;
  [v6 _scaledValueForValue:self->_bottomInset];
  -[WDBuddyFlowContinueFooterView setFrame:](self, "setFrame:", 0.0, 0.0, self->_width, v4 + v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDBuddyFlowContinueFooterView;
  [(WDBuddyFlowContinueFooterView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(WDBuddyFlowContinueFooterView *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    BOOL v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(WDBuddyFlowContinueFooterView *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)setWaitingState
{
}

- (void)resetWaitingState
{
}

- (void)setContinueButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_continueTrayButton, 0);

  objc_storeStrong((id *)&self->_buttonText, 0);
}

@end