@interface CARSetupAssetReadyViewController
- (CARSetupAssetReadyViewController)initWithDoneHandler:(id)a3;
- (UIButton)doneButton;
- (UIImageView)iconView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)doneHandler;
- (void)_done;
- (void)viewDidLoad;
@end

@implementation CARSetupAssetReadyViewController

- (CARSetupAssetReadyViewController)initWithDoneHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CARSetupAssetReadyViewController;
  v5 = [(CARSetupAssetReadyViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x24C5B0600](v4);
    id doneHandler = v5->_doneHandler;
    v5->_id doneHandler = (id)v6;
  }
  return v5;
}

- (void)viewDidLoad
{
  v89[3] = *MEMORY[0x263EF8340];
  v85.receiver = self;
  v85.super_class = (Class)CARSetupAssetReadyViewController;
  [(CARSetupAssetReadyViewController *)&v85 viewDidLoad];
  v79 = [(CARSetupAssetReadyViewController *)self view];
  [(CARSetupAssetReadyViewController *)self setOverrideUserInterfaceStyle:2];
  v2 = [(CARSetupAssetReadyViewController *)self navigationItem];
  [v2 setHidesBackButton:1];

  v3 = [MEMORY[0x263F1C550] blackColor];
  [v79 setBackgroundColor:v3];

  v76 = [v79 safeAreaLayoutGuide];
  id obj = objc_alloc_init(MEMORY[0x263F1C768]);
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v72 = [v4 localizedStringForKey:@"READY_CARD_TITLE" value:&stru_26FDB85C0 table:@"Localizable-Themed"];

  [obj setText:v72];
  v5 = (void *)MEMORY[0x263F1C660];
  uint64_t v6 = [(CARSetupAssetReadyViewController *)self traitCollection];
  v7 = [v5 preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2F8] compatibleWithTraitCollection:v6];

  v71 = [v7 fontDescriptorWithSymbolicTraits:2];

  v70 = [MEMORY[0x263F1C658] fontWithDescriptor:v71 size:0.0];
  [obj setFont:v70];
  [obj setTextAlignment:1];
  v8 = [MEMORY[0x263F1C550] labelColor];
  [obj setTextColor:v8];

  [obj setTranslatesAutoresizingMaskIntoConstraints:0];
  [v79 addSubview:obj];
  objc_storeStrong((id *)&self->_titleLabel, obj);
  objc_super v9 = [obj leadingAnchor];
  v10 = [v76 leadingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:30.0];
  v89[0] = v11;
  v12 = [obj trailingAnchor];
  v13 = [v76 trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:-30.0];
  v89[1] = v14;
  v15 = [obj topAnchor];
  v16 = [v76 topAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:60.0];
  v89[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:3];
  [v79 addConstraints:v18];

  id v81 = objc_alloc_init(MEMORY[0x263F1C768]);
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"READY_CARD_MESSAGE" value:&stru_26FDB85C0 table:@"Localizable-Themed"];

  [v81 setText:v20];
  v21 = (void *)MEMORY[0x263F1C660];
  v22 = [(CARSetupAssetReadyViewController *)self traitCollection];
  v69 = [v21 preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0] compatibleWithTraitCollection:v22];

  v68 = [MEMORY[0x263F1C658] fontWithDescriptor:v69 size:0.0];
  [v81 setFont:v68];
  [v81 setTextAlignment:1];
  [v81 setNumberOfLines:0];
  v23 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v81 setTextColor:v23];

  [v81 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v79 addSubview:v81];
  objc_storeStrong((id *)&self->_subtitleLabel, v81);
  v24 = [v81 leadingAnchor];
  v25 = [v76 leadingAnchor];
  v26 = [v24 constraintEqualToAnchor:v25 constant:30.0];
  v88[0] = v26;
  v27 = [v81 trailingAnchor];
  v28 = [v76 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 constant:-30.0];
  v88[1] = v29;
  v30 = [v81 topAnchor];
  v31 = [obj bottomAnchor];
  v32 = [v30 constraintEqualToSystemSpacingBelowAnchor:v31 multiplier:1.0];
  v88[2] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:3];
  [v79 addConstraints:v33];

  v34 = (void *)MEMORY[0x263F1C6B0];
  v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v67 = [v34 imageNamed:@"SiriIcon" inBundle:v35 withConfiguration:0];

  id v75 = (id)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v67];
  [v75 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v79 addSubview:v75];
  objc_storeStrong((id *)&self->_iconView, v75);
  v73 = [v75 centerXAnchor];
  v36 = [v76 centerXAnchor];
  v37 = [v73 constraintEqualToAnchor:v36];
  v87[0] = v37;
  v38 = [v75 topAnchor];
  v39 = [v81 bottomAnchor];
  v40 = [v38 constraintEqualToAnchor:v39 constant:20.0];
  v87[1] = v40;
  v41 = [v75 widthAnchor];
  v42 = [v41 constraintEqualToConstant:75.0];
  v87[2] = v42;
  v43 = [v75 heightAnchor];
  v44 = [v43 constraintEqualToConstant:75.0];
  v87[3] = v44;
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:4];
  [v79 addConstraints:v45];

  objc_initWeak(&location, self);
  v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v66 = [v46 localizedStringForKey:@"READY_CARD_DONE" value:&stru_26FDB85C0 table:@"Localizable-Themed"];

  v74 = [MEMORY[0x263F1C490] grayButtonConfiguration];
  v47 = [MEMORY[0x263F1C550] labelColor];
  [v74 setBaseForegroundColor:v47];

  v48 = (void *)MEMORY[0x263F1C488];
  v49 = (void *)MEMORY[0x263F1C3C0];
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = __47__CARSetupAssetReadyViewController_viewDidLoad__block_invoke;
  v82[3] = &unk_265276E00;
  objc_copyWeak(&v83, &location);
  v50 = [v49 actionWithTitle:v66 image:0 identifier:0 handler:v82];
  v51 = [v48 buttonWithConfiguration:v74 primaryAction:v50];

  [v51 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v79 addSubview:v51];
  objc_storeStrong((id *)&self->_doneButton, v51);
  id vala = [v51 centerXAnchor];
  v65 = [v76 centerXAnchor];
  v64 = [vala constraintEqualToAnchor:v65];
  v86[0] = v64;
  v63 = [v51 topAnchor];
  v62 = [v75 bottomAnchor];
  v61 = [v63 constraintGreaterThanOrEqualToAnchor:v62];
  v86[1] = v61;
  v52 = [v51 bottomAnchor];
  v53 = [v76 bottomAnchor];
  v54 = [v52 constraintEqualToAnchor:v53 constant:-30.0];
  v86[2] = v54;
  v55 = [v51 widthAnchor];
  v56 = [v76 widthAnchor];
  v57 = [v55 constraintEqualToAnchor:v56 multiplier:0.75];
  v86[3] = v57;
  v58 = [v51 heightAnchor];
  v59 = [v58 constraintEqualToConstant:50.0];
  v86[4] = v59;
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:5];
  [v79 addConstraints:v60];

  objc_destroyWeak(&v83);
  objc_destroyWeak(&location);
}

void __47__CARSetupAssetReadyViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _done];
}

- (void)_done
{
  v3 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_249B58000, v3, OS_LOG_TYPE_DEFAULT, "asset ready: done", v6, 2u);
  }

  uint64_t v4 = [(CARSetupAssetReadyViewController *)self doneHandler];
  v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

- (id)doneHandler
{
  return self->_doneHandler;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_doneHandler, 0);
}

@end