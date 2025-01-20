@interface CSDeviceUnblockViewController
- (BOOL)_canShowWhileLocked;
- (CSDeviceUnblockViewController)initWithViewModel:(id)a3;
- (id)_addLabelWithText:(id)a3 color:(id)a4 font:(id)a5 toStack:(id)a6;
- (void)_addHeaderCancelIfNeededToStack:(id)a3;
- (void)_addSystemImageWithName:(id)a3 toStack:(id)a4;
- (void)setTimeoutString:(id)a3;
- (void)viewDidLoad;
@end

@implementation CSDeviceUnblockViewController

- (CSDeviceUnblockViewController)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDeviceUnblockViewController;
  v6 = [(CSDeviceUnblockViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewModel, a3);
  }

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v92[4] = *MEMORY[0x1E4F143B8];
  v88.receiver = self;
  v88.super_class = (Class)CSDeviceUnblockViewController;
  [(CSDeviceUnblockViewController *)&v88 viewDidLoad];
  [(CSDeviceUnblockViewController *)self setOverrideUserInterfaceStyle:2];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42E20]);
  [v3 setAxis:1];
  objc_msgSend(v3, "setLayoutMargins:", 10.0, 20.0, 20.0, 20.0);
  [v3 setLayoutMarginsRelativeArrangement:1];
  [v3 setSpacing:16.0];
  v4 = [(CSDeviceUnblockViewController *)self view];
  [v4 addSubview:v3];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v69 = (void *)MEMORY[0x1E4F28DC8];
  v84 = [v3 topAnchor];
  v86 = [(CSDeviceUnblockViewController *)self view];
  v82 = [v86 safeAreaLayoutGuide];
  v81 = [v82 topAnchor];
  v79 = [v84 constraintEqualToAnchor:v81];
  v92[0] = v79;
  v75 = [v3 bottomAnchor];
  v77 = [(CSDeviceUnblockViewController *)self view];
  v73 = [v77 safeAreaLayoutGuide];
  v71 = [v73 bottomAnchor];
  v67 = [v75 constraintLessThanOrEqualToAnchor:v71];
  v92[1] = v67;
  v63 = [v3 leadingAnchor];
  v65 = [(CSDeviceUnblockViewController *)self view];
  v61 = [v65 safeAreaLayoutGuide];
  id v5 = [v61 leadingAnchor];
  v6 = [v63 constraintEqualToAnchor:v5];
  v92[2] = v6;
  v7 = [v3 trailingAnchor];
  v8 = [(CSDeviceUnblockViewController *)self view];
  objc_super v9 = [v8 safeAreaLayoutGuide];
  v10 = [v9 trailingAnchor];
  v11 = [v7 constraintEqualToAnchor:v10];
  v92[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:4];
  [v69 activateConstraints:v12];

  [(CSDeviceUnblockViewController *)self _addHeaderCancelIfNeededToStack:v3];
  v13 = [(CSDeviceUnblockViewModel *)self->_viewModel iconName];
  [(CSDeviceUnblockViewController *)self _addSystemImageWithName:v13 toStack:v3];

  v14 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  v15 = [v14 preferredFontForTextStyle:*MEMORY[0x1E4F438E8] hiFontStyle:4];

  [v15 pointSize];
  uint64_t v17 = [v15 fontWithSize:v16 * 1.2];

  v18 = [(CSDeviceUnblockViewModel *)self->_viewModel titleText];
  v19 = [MEMORY[0x1E4F428B8] whiteColor];
  v83 = (void *)v17;
  id v20 = [(CSDeviceUnblockViewController *)self _addLabelWithText:v18 color:v19 font:v17 toStack:v3];

  v21 = [(CSDeviceUnblockViewModel *)self->_viewModel bodyTextForTimeout:0];
  v22 = [MEMORY[0x1E4F428B8] whiteColor];
  v23 = [(CSDeviceUnblockViewController *)self _addLabelWithText:v21 color:v22 font:0 toStack:v3];
  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = v23;

  v25 = [(CSDeviceUnblockViewModel *)self->_viewModel bodySubtitleText];
  v26 = [MEMORY[0x1E4F428B8] grayColor];
  v85 = v3;
  id v27 = [(CSDeviceUnblockViewController *)self _addLabelWithText:v25 color:v26 font:0 toStack:v3];

  id v28 = objc_alloc_init(MEMORY[0x1E4F42E20]);
  [v28 setAxis:1];
  objc_msgSend(v28, "setLayoutMargins:", 10.0, 20.0, 20.0, 20.0);
  [v28 setLayoutMarginsRelativeArrangement:1];
  [v28 setSpacing:10.0];
  v29 = [(CSDeviceUnblockViewController *)self view];
  [v29 addSubview:v28];

  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  v60 = (void *)MEMORY[0x1E4F28DC8];
  v78 = [v28 topAnchor];
  v80 = [(CSDeviceUnblockViewController *)self view];
  v76 = [v80 safeAreaLayoutGuide];
  v74 = [v76 topAnchor];
  v72 = [v78 constraintGreaterThanOrEqualToAnchor:v74];
  v91[0] = v72;
  v66 = [v28 bottomAnchor];
  v70 = [(CSDeviceUnblockViewController *)self view];
  v68 = [v70 safeAreaLayoutGuide];
  v64 = [v68 bottomAnchor];
  v62 = [v66 constraintEqualToAnchor:v64 constant:-8.0];
  v91[1] = v62;
  v58 = [v28 leadingAnchor];
  v59 = [(CSDeviceUnblockViewController *)self view];
  v57 = [v59 safeAreaLayoutGuide];
  v56 = [v57 leadingAnchor];
  v30 = [v58 constraintEqualToAnchor:v56];
  v91[2] = v30;
  v31 = [v28 trailingAnchor];
  v32 = [(CSDeviceUnblockViewController *)self view];
  v33 = [v32 safeAreaLayoutGuide];
  v34 = [v33 trailingAnchor];
  v35 = [v31 constraintEqualToAnchor:v34];
  v91[3] = v35;
  v87 = v28;
  v36 = [v28 widthAnchor];
  v37 = [v36 constraintLessThanOrEqualToConstant:100.0];
  v91[4] = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:5];
  [v60 activateConstraints:v38];

  v39 = [(CSDeviceUnblockViewModel *)self->_viewModel primaryButtonText];

  v40 = (void *)MEMORY[0x1E4F43870];
  if (v39)
  {
    v41 = [MEMORY[0x1E4F427E8] filledButtonConfiguration];
    [v41 setCornerStyle:-1];
    v42 = [v41 background];
    [v42 setCornerRadius:15.0];

    v43 = [MEMORY[0x1E4F428B8] blackColor];
    [v41 setBaseForegroundColor:v43];

    v44 = [MEMORY[0x1E4F428B8] whiteColor];
    [v41 setBaseBackgroundColor:v44];

    [v41 setButtonSize:3];
    [v41 setTitleLineBreakMode:2];
    id v45 = objc_alloc(MEMORY[0x1E4F28B18]);
    v46 = [(CSDeviceUnblockViewModel *)self->_viewModel primaryButtonText];
    uint64_t v89 = *MEMORY[0x1E4F42508];
    v47 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*v40 weight:*MEMORY[0x1E4F43920]];
    v90 = v47;
    v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    v49 = (void *)[v45 initWithString:v46 attributes:v48];

    [v41 setAttributedTitle:v49];
    v50 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    [v50 setConfiguration:v41];
    [v50 addTarget:self->_viewModel action:sel_primaryButtonAction forControlEvents:64];
    [v50 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v87 addArrangedSubview:v50];
  }
  v51 = [(CSDeviceUnblockViewModel *)self->_viewModel secondaryButtonText];

  if (v51)
  {
    v52 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    [v52 addTarget:self->_viewModel action:sel_secondaryButtonAction forControlEvents:64];
    v53 = [(CSDeviceUnblockViewModel *)self->_viewModel secondaryButtonText];
    [v52 setTitle:v53 forState:0];

    v54 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*v40 weight:*MEMORY[0x1E4F43928]];
    [v52 setFont:v54];

    v55 = [MEMORY[0x1E4F428B8] whiteColor];
    [v52 setTitleColor:v55 forState:0];

    [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v87 addArrangedSubview:v52];
  }
}

- (void)setTimeoutString:(id)a3
{
  bodyLabel = self->_bodyLabel;
  id v4 = [(CSDeviceUnblockViewModel *)self->_viewModel bodyTextForTimeout:a3];
  [(UILabel *)bodyLabel setText:v4];
}

- (void)_addHeaderCancelIfNeededToStack:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F42E20];
  id v5 = a3;
  id v13 = objc_alloc_init(v4);
  [v13 setAxis:0];
  [v5 addArrangedSubview:v13];
  [v5 spacing];
  [v5 setCustomSpacing:v13 afterView:v6 * 1.75];

  v7 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  [v7 addTarget:self->_viewModel action:sel_cancelButtonAction forControlEvents:64];
  v8 = [(CSDeviceUnblockViewModel *)self->_viewModel cancelButtonText];
  [v7 setTitle:v8 forState:0];

  objc_super v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v7 _setFont:v9];

  v10 = [MEMORY[0x1E4F428B8] labelColor];
  [v7 setTitleColor:v10 forState:0];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v13 addArrangedSubview:v7];
  v11 = objc_opt_new();
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v12) = 1132068864;
  [v11 setContentHuggingPriority:0 forAxis:v12];
  [v13 addArrangedSubview:v11];
}

- (void)_addSystemImageWithName:(id)a3 toStack:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F42A80];
  id v6 = a4;
  id v12 = [v5 _systemImageNamed:a3];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v12];
  [v7 setContentMode:1];
  v8 = [v7 heightAnchor];
  objc_super v9 = [v8 constraintEqualToConstant:70.0];
  [v9 setActive:1];

  v10 = [MEMORY[0x1E4F428B8] whiteColor];
  [v7 setTintColor:v10];

  [v6 addArrangedSubview:v7];
  [v6 spacing];
  [v6 setCustomSpacing:v7 afterView:v11 * 1.75];
}

- (id)_addLabelWithText:(id)a3 color:(id)a4 font:(id)a5 toStack:(id)a6
{
  id v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E4F42B38];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  [v14 setColor:v12];

  if (v9)
  {
    [v14 setFont:v9];
  }
  else
  {
    v15 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
    double v16 = [v15 preferredFontForTextStyle:*MEMORY[0x1E4F43870] hiFontStyle:1];
    [v14 setFont:v16];
  }
  [v14 setText:v13];

  [v14 setTextAlignment:1];
  [v14 setNumberOfLines:0];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 addArrangedSubview:v14];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end